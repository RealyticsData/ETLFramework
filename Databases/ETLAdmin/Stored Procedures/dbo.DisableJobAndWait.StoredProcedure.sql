USE ETLSupport
GO

/*=============================================================================
Description:

-------------------------------------------------------------------------------
History:
2021-04-09	Jonathan.Szeto	US3283 - Standard procedure to disable and wait until finished
=============================================================================*/
CREATE OR ALTER PROCEDURE dbo.DisableJobAndWait
	@JobName nvarchar(128),
	@WaitInterval time(0) = '00:00:05',     -- Interval to wait between checking if the job is running. Default 5 seconds.
	@MaximumWaitTime time(0) = '01:00:00'   -- Maximum wait time before throwing an error. Default 1 hour.
AS
BEGIN
	DECLARE
		@JobID uniqueidentifier,
		@WaitIntervalString char(8),
		@CutoffTime datetime2(7) = dateadd(second, datediff(second, cast('00:00:00' AS time(0)), @MaximumWaitTime), sysdatetime()),
		@ErrorNumber int = 0
	;

	SET @WaitIntervalString = format(@WaitInterval, N'hh\:mm\:ss');

	SELECT
		@JobID = j.job_id
	FROM msdb.dbo.sysjobs j
	WHERE
		j.[name] = @JobName
	;

	/* Disable the job specified. */
	EXEC msdb.dbo.sp_update_job
		@job_name = @JobName,
		@enabled = 0
	;

	/* Wait for the job to finish. */
	WHILE EXISTS (
	SELECT * FROM msdb.dbo.sysjobactivity ja
	WHERE
		session_id IN (
			SELECT max(session_id) FROM msdb.dbo.sysjobactivity
		)
		AND ja.job_id = @JobID
		AND ja.start_execution_date IS NOT NULL
		AND ja.stop_execution_date IS NULL
	)
	BEGIN
		WAITFOR DELAY @WaitIntervalString;
		IF @CutoffTime < sysdatetime()
		BEGIN
			DECLARE @ErrorMessage nvarchar(2048) = 'Wait time exceeded for job ' + quotename(@JobName) + '.';
			SET @ErrorNumber = 51000;
			THROW @ErrorNumber, @ErrorMessage, 1;
			BREAK;
		END
	END

	IF @ErrorNumber = 0 PRINT 'Job ' + quotename(@JobName) + ' has been disabled and is now not running.';
	RETURN @ErrorNumber;
END
GO
