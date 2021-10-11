SELECT name, id, cohort_id
FROM students
WHERE end_date is NULL
ORDER by cohort_id;