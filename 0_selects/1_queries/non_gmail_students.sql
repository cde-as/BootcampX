SELECT name, email, id, cohort_id
FROM students
WHERE email NOT LIKE '%gmail%' 
AND phone IS NULL;

/* Correct Answer: 
SELECT name, id, email, cohort_id
FROM students
WHERE email NOT LIKE '%gmail.com'
AND phone IS NULL; */