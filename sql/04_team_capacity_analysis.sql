/*
Objective:
Assess team workload, effectiveness, and capacity utilization to guide
resource allocation and process improvement.

Business Questions Answered:
1. Which teams handle the most workload?
2. Are SLA breaches driven by overload or inefficiency?
3. Which teams exceed capacity thresholds?
*/

-- Workload handled by each team
SELECT
    tm.team_name,
    COUNT(DISTINCT e.ticket_id) AS tickets_handled
FROM ticket_events e
JOIN teams tm ON e.team_id = tm.team_id
GROUP BY tm.team_name
ORDER BY tickets_handled DESC;


-- SLA breach rate by team
SELECT
    tm.team_name,
    COUNT(*) AS total_events,
    COUNT(*) FILTER (
        WHERE EXTRACT(EPOCH FROM (e.exited_at - e.entered_at)) / 3600
              > s.max_allowed_hours
    ) AS breached_events,
    ROUND(
        COUNT(*) FILTER (
            WHERE EXTRACT(EPOCH FROM (e.exited_at - e.entered_at)) / 3600
                  > s.max_allowed_hours
        ) * 100.0 / COUNT(*),
        2
    ) AS breach_percentage
FROM ticket_events e
JOIN sla_rules s ON e.stage_name = s.stage_name
JOIN teams tm ON e.team_id = tm.team_id
GROUP BY tm.team_name
ORDER BY breach_percentage DESC;
