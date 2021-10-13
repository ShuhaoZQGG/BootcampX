SELECT cohorts.name AS name, AVG(completed_at - started_at) AS average_cohort_assistance_time
FROM assistance_requests
JOIN students ON assistance_requests.student_id = students.id
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.id
ORDER BY AVG(completed_at - created_at);