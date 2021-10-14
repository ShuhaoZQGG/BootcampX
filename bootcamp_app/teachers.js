const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});
const CLI = process.argv.slice(2);
const cohort = CLI[0];
const values = [`%${cohort}%`]

const queryString = `
SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort
FROM teachers
JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id 
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
ORDER BY teacher;
`

pool.query(queryString, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort}: ${user.teacher}`);  })
});