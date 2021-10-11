SELECT cohorts.name as cohort_name, COUNT(cohorts.*) as student_count
FROM cohorts
JOIN students ON cohorts.id = students.cohort_id
GROUP BY cohort_name
HAVING COUNT(cohorts.*) >= 18
ORDER BY student_count;