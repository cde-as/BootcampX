SELECT students.name, SUM(assignment_submissions.duration) AS duration
FROM students
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
JOIN assignments ON assignment_submissions.assignment_id = assignments.id
WHERE students.name = 'Ibrahim Schimmel'
GROUP BY students.name;

/* I selected students.name as well to have a visual of which student we are selecting  */