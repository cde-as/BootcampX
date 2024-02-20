const { Pool } = require("pg");

const pool = new Pool({
  user: "vagrant",
  password: "123",
  host: "localhost",
  database: "bootcampx",
});

const cohortName = process.argv[2];
pool
  .query(
    `
SELECT DISTINCT teachers.name as teacher_name, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students on student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE '%${cohortName}%'
`
  )
  .then((res) => {
    res.rows.forEach((row) => {
      console.log(
        `${row.cohort}: ${row.teacher_name}`
      );
    });
  })
  .catch((err) => console.error("query error", err.stack));


/*   INSERT INTO assistance_requests (id, student_id, teacher_id, assignment_id, created_at, started_at, completed_at, student_feedback, teacher_feedback)

  INSERT INTO cohorts (id, name, start_date, end_date) VALUES (1, 'FEB12', '2018-02-12T08:00:00.000Z', '2018-04-20T07:00:00.000Z');

  INSERT INTO teachers (id, name, is_active, start_date, end_date) VALUES (1, 'Helmer Rodriguez', true, '2018-02-12T08:00:00.000Z', null); */