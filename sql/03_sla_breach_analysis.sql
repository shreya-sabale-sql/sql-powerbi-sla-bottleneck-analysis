/*
Objective:
Evaluate SLA compliance across stages, teams, and priorities to identify risk areas.

Business Questions Answered:
1. Which stages breach SLAs most frequently?
2. Which teams are most associated with SLA breaches?
3. Are high-priority tickets protected from SLA violations?
*/

-- SLA breach rate by stage
SELECT
    e.stage_name,
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
JOIN sla_rules s
    ON e.stage_name = s.stage_name
GROUP BY e.stage_name
ORDER BY breach_percentage DESC;


-- SLA breach rate by priority
SELECT
    t.priority,
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
JOIN tickets t ON e.ticket_id = t.ticket_id
JOIN sla_rules s ON e.stage_name = s.stage_name
GROUP BY t.priority
ORDER BY breach_percentage DESC;
