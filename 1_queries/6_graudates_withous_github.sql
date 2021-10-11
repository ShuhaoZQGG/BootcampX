SELECT name, email, phone
FROM students
WHERE github Is NULL
AND end_date Is NOT NULL