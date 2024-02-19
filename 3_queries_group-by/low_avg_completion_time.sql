SELECT students.name as student, 
      AVG(assignment_submissions.duration) AS average_assignment_duration, 
      AVG(assignments.duration) AS average_estimated_duration
FROM students
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
JOIN assignments ON assignment_submissions.assignment_id = assignments.id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING 
    AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY average_assignment_duration; 

/* INSERT INTO assignment_submissions (id, assignment_id, student_id, submission_date, duration) VALUES (1, 1, 1, '2018-02-12T08:00:00.000Z', 22.5);

INSERT INTO assignments (id, name, content, duration, day, chapter) VALUES (1, 'Delectus nam repellendus', 'Excepturi aliquam expedita voluptatem et aspernatur quidem sunt et. Iste quaerat velit quam consequatur dolor ut quia omnis. Ipsa repudiandae odio totam ab quia omnis. Excepturi sed porro amet atque velit aspernatur. Molestiae neque eum itaque incidunt omnis ut esse eum accusantium. Neque sed ea explicabo.', 30, 1, 1);

INSERT INTO students (id, name, email, phone, github, start_date, end_date, cohort_id) VALUES (1, 'Armand Hilll', 'lera_hahn@dickens.org', '778-349-3299', 'aspernatur', '2018-02-12T08:00:00.000Z', '2018-04-20T07:00:00.000Z', 1); */