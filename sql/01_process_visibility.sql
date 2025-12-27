/* 
Objective:
Provide end-to-end visibility into IT ticket workflows by understanding
ticket volume, stage-wise time consumption, and overall resolution time.

Business Questions Answered:
1. How many tickets flow through each stage?
2. Where is most time spent in the process?
3. What is the average end-to-end resolution time?
*/

-- Ticket volume by stage
SELECT
    stage_name,
    COUNT(DISTINCT ticket_id) AS tickets_handled
FROM ticket_events
GROUP BY stage_name
ORDER BY tickets_handled DESC;


-- Average time spent per stage (in hours)
SELECT
    stage_name,
    ROUND(
        AVG(EXTRACT(EPOCH FROM (exited_at - entered_at)) / 3600),
        2
    ) AS avg_hours
FROM ticket_events
GROUP BY stage_name
ORDER BY avg_hours DESC;


-- Average end-to-end resolution time per ticket
WITH ticket_lifecycle AS (
    SELECT
        ticket_id,
        MIN(entered_at) AS start_time,
        MAX(exited_at) AS end_time
    FROM ticket_events
    GROUP BY ticket_id
)
SELECT
    ROUND(
        AVG(EXTRACT(EPOCH FROM (end_time - start_time)) / 3600),
        2
    ) AS avg_resolution_hours
FROM ticket_lifecycle;

