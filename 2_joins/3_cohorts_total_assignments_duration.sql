/*
First join students and cohorts to select only
FEB12 cohort students

Then join that with assignment_submissions
*/
SELECT SUM(assignment_submissions.duration) as total_duration
FROM students 
  JOIN cohorts 
      ON students.cohort_id = cohorts.id
  JOIN assignment_submissions
      ON assignment_submissions.student_id = students.id
  WHERE cohorts.name = 'FEB12'
