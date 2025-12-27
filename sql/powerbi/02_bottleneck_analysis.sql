/*
Objective:
Identify systemic bottlenecks and abnormal delays in the ticket lifecycle.

Business Questions Answered:
1. Which stages are consistently slow?
2. Are delays driven by outliers or structural issues?
3. Do a small number of tickets cause most delays?
*/

-- Average vs median duration by stage
SELECT
    stage_name,
    ROUND(
        AVG(EXTRACT(EPOCH FROM (exited_at - entered_at)) / 3600),
        2
    ) AS avg_hours,
    ROUND(
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY EXTRACT(EPOCH FROM (exited_at - entered_at)) / 3600),
        2
    ) AS median_hours
FROM ticket_events
GROUP BY stage_name
ORDER BY avg_hours DESC;


-- Identify abnormally delayed tickets (outliers)
WITH ticket_durations AS (
    SELECT
        ticket_id,
        SUM(EXTRACT(EPOCH FROM (exited_at - entered_at)) / 3600) AS total_hours
    FROM ticket_events
    GROUP BY ticket_id
),
stats AS (
    SELECT
        AVG(total_hours) AS avg_hours,
        STDDEV(total_hours) AS stddev_hours
    FROM ticket_durations
)
SELECT
    td.ticket_id,
    ROUND(td.total_hours, 2) AS total_hours
FROM ticket_durations td, stats s
WHERE td.total_hours > s.avg_hours + 2 * s.stddev_hours
ORDER BY total_hours DESC;
