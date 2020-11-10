DECLARE
	@AnchorTime time(0) = '00:00:00',
	@StartTime time(0) = '13:17:42',
	@EndTime time(0) = getdate()
;

DROP TABLE IF EXISTS #TimeTally;

WITH TimeRecursive AS (
SELECT
	@AnchorTime AS TimeValue
UNION ALL
SELECT
	dateadd(second, 1, TimeValue)
FROM TimeRecursive
WHERE
	TimeValue < '23:59:59'
)
SELECT
	TimeValue,
	datepart(hour, TimeValue) AS TimeHour,
	datepart(minute, TimeValue) AS TimeMinute,
	datepart(second, TimeValue) AS TimeSecond
INTO #TimeTally
FROM TimeRecursive
OPTION (MAXRECURSION 0)
;

SELECT
	TimeHour,
	count(*) AS SecondsInHour,
	CASE
		WHEN @StartTime = @EndTime THEN 0
		ELSE count(*) / cast(datediff(second, @StartTime, @EndTime) AS float)
	END AS FractionOfDuration
FROM #TimeTally
WHERE
	TimeValue BETWEEN @StartTime AND @EndTime
GROUP BY TimeHour
ORDER BY TimeHour;
