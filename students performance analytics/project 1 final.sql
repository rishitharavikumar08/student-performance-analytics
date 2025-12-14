DROP DATABASE student_analytics;
CREATE DATABASE student_analytics;
USE student_analytics;
SELECT DATABASE();
SHOW TABLES;
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    branch VARCHAR(50),
    year INT,
    roll_no VARCHAR(20)
);
SHOW TABLES;
CREATE TABLE subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(100)
);
SHOW TABLES;
CREATE TABLE marks (
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    marks_obtained INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);
SHOW TABLES;
INSERT INTO students (full_name, branch, year, roll_no)
VALUES
('Asha Kumar','BCA',3,'BCA001'),
('Ravi Sharma','BCA',3,'BCA002'),
('Neha Patel','BCA',3,'BCA003'),
('Arjun Rao','BCA',3,'BCA004');
SELECT * FROM students;
INSERT INTO subjects (subject_name)
VALUES
('DBMS'),
('Discrete Mathematics'),
('Artificial Intelligence');
SELECT * FROM subjects;
INSERT INTO marks (student_id, subject_id, marks_obtained)
VALUES
(1,1,85),(1,2,78),(1,3,82),
(2,1,65),(2,2,55),(2,3,60),
(3,1,90),(3,2,88),(3,3,91),
(4,1,40),(4,2,35),(4,3,45);
SELECT * FROM marks;
SELECT 
    s.full_name,
    ROUND(AVG(m.marks_obtained),2) AS avg_marks
FROM students s
JOIN marks m ON s.student_id = m.student_id
GROUP BY s.student_id
ORDER BY avg_marks DESC;
SELECT 
    s.full_name,
    CASE 
        WHEN MIN(m.marks_obtained) >= 40 THEN 'PASS'
        ELSE 'FAIL'
    END AS result
FROM students s
JOIN marks m ON s.student_id = m.student_id
GROUP BY s.student_id;
SELECT 
    sub.subject_name,
    ROUND(AVG(m.marks_obtained),2) AS average_marks
FROM subjects sub
JOIN marks m ON sub.subject_id = m.subject_id
GROUP BY sub.subject_id
ORDER BY average_marks;
SELECT 
    s.full_name,
    ROUND(AVG(m.marks_obtained),2) AS avg_marks
FROM students s
JOIN marks m ON s.student_id = m.student_id
GROUP BY s.student_id
HAVING avg_marks < 50;
