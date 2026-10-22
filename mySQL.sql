-- Student Performance Analytics System
-- MySQL 8.0.16+
-- Run this file in MySQL Workbench. Constraint-test INSERTs are commented out
-- because they are intentionally expected to fail; run them individually to capture errors.

DROP DATABASE IF EXISTS student_analytics;
CREATE DATABASE student_analytics;
USE student_analytics;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    roll_no VARCHAR(20) NOT NULL UNIQUE,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    department_id INT NOT NULL,
    semester TINYINT NOT NULL DEFAULT 1,
    CONSTRAINT fk_students_department FOREIGN KEY (department_id)
        REFERENCES departments(department_id),
    CONSTRAINT chk_student_semester CHECK (semester BETWEEN 1 AND 8)
);

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL UNIQUE,
    semester TINYINT NOT NULL,
    credits TINYINT NOT NULL DEFAULT 3,
    CONSTRAINT chk_subject_semester CHECK (semester BETWEEN 1 AND 8),
    CONSTRAINT chk_subject_credits CHECK (credits BETWEEN 1 AND 6)
);

CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    marks_obtained DECIMAL(5,2) NOT NULL DEFAULT 0,
    CONSTRAINT fk_marks_student FOREIGN KEY (student_id)
        REFERENCES students(student_id),
    CONSTRAINT fk_marks_subject FOREIGN KEY (subject_id)
        REFERENCES subjects(subject_id),
    CONSTRAINT uq_student_subject UNIQUE (student_id, subject_id),
    CONSTRAINT chk_marks_range CHECK (marks_obtained BETWEEN 0 AND 100)
);

INSERT INTO departments VALUES
(1,'Computer Science'),(2,'Data Science'),
(3,'Information Technology'),(4,'Electronics');

INSERT INTO subjects (subject_id, subject_name, semester, credits) VALUES
(1,'Python Programming',1,4),(2,'Database Systems',2,4),
(3,'Statistics',2,3),(4,'Data Structures',3,4),
(5,'Machine Learning',4,4),(6,'Data Visualization',4,3);

INSERT INTO students (student_id, roll_no, student_name, email, department_id, semester) VALUES
(1,'SPA2026001','Aarav Sharma','student001@example.edu',1,1),
(2,'SPA2026002','Aditi Das','student002@example.edu',2,2),
(3,'SPA2026003','Akash Gupta','student003@example.edu',3,3),
(4,'SPA2026004','Ananya Mishra','student004@example.edu',4,4),
(5,'SPA2026005','Arjun Kumar','student005@example.edu',1,5),
(6,'SPA2026006','Diya Roy','student006@example.edu',2,6),
(7,'SPA2026007','Ishaan Jha','student007@example.edu',3,7),
(8,'SPA2026008','Kavya Singh','student008@example.edu',4,8),
(9,'SPA2026009','Karan Patel','student009@example.edu',1,1),
(10,'SPA2026010','Meera Verma','student010@example.edu',2,2),
(11,'SPA2026011','Neha Sharma','student011@example.edu',3,3),
(12,'SPA2026012','Nikhil Das','student012@example.edu',4,4),
(13,'SPA2026013','Pooja Gupta','student013@example.edu',1,5),
(14,'SPA2026014','Rahul Mishra','student014@example.edu',2,6),
(15,'SPA2026015','Riya Kumar','student015@example.edu',3,7),
(16,'SPA2026016','Rohan Roy','student016@example.edu',4,8),
(17,'SPA2026017','Sakshi Jha','student017@example.edu',1,1),
(18,'SPA2026018','Sameer Singh','student018@example.edu',2,2),
(19,'SPA2026019','Sneha Patel','student019@example.edu',3,3),
(20,'SPA2026020','Tanvi Verma','student020@example.edu',4,4),
(21,'SPA2026021','Varun Sharma','student021@example.edu',1,5),
(22,'SPA2026022','Vikram Das','student022@example.edu',2,6),
(23,'SPA2026023','Yash Gupta','student023@example.edu',3,7),
(24,'SPA2026024','Zoya Mishra','student024@example.edu',4,8),
(25,'SPA2026025','Aditya Kumar','student025@example.edu',1,1),
(26,'SPA2026026','Bhavna Roy','student026@example.edu',2,2),
(27,'SPA2026027','Dev Jha','student027@example.edu',3,3),
(28,'SPA2026028','Ira Singh','student028@example.edu',4,4),
(29,'SPA2026029','Manish Patel','student029@example.edu',1,5),
(30,'SPA2026030','Tara Verma','student030@example.edu',2,6);

INSERT INTO marks (mark_id, student_id, subject_id, marks_obtained) VALUES
(1,1,1,67),
(2,1,2,67),
(3,1,3,68),
(4,1,4,80),
(5,1,5,68),
(6,1,6,47),
(7,2,1,76),
(8,2,2,67),
(9,2,3,68),
(10,2,4,73),
(11,2,5,75),
(12,2,6,89),
(13,3,1,83),
(14,3,2,35),
(15,3,3,62),
(16,3,4,58),
(17,3,5,77),
(18,3,6,93),
(19,4,1,76),
(20,4,2,74),
(21,4,3,83),
(22,4,4,54),
(23,4,5,71),
(24,4,6,83),
(25,5,1,81),
(26,5,2,64),
(27,5,3,73),
(28,5,4,71),
(29,5,5,79),
(30,5,6,51),
(31,6,1,78),
(32,6,2,47),
(33,6,3,30),
(34,6,4,60),
(35,6,5,56),
(36,6,6,83),
(37,7,1,81),
(38,7,2,53),
(39,7,3,84),
(40,7,4,56),
(41,7,5,70),
(42,7,6,67),
(43,8,1,75),
(44,8,2,86),
(45,8,3,83),
(46,8,4,79),
(47,8,5,33),
(48,8,6,81),
(49,9,1,66),
(50,9,2,65),
(51,9,3,68),
(52,9,4,83),
(53,9,5,72),
(54,9,6,100),
(55,10,1,55),
(56,10,2,51),
(57,10,3,79),
(58,10,4,89),
(59,10,5,75),
(60,10,6,80),
(61,11,1,91),
(62,11,2,68),
(63,11,3,48),
(64,11,4,62),
(65,11,5,84),
(66,11,6,48),
(67,12,1,72),
(68,12,2,75),
(69,12,3,67),
(70,12,4,82),
(71,12,5,80),
(72,12,6,100),
(73,13,1,83),
(74,13,2,64),
(75,13,3,65),
(76,13,4,61),
(77,13,5,88),
(78,13,6,65),
(79,14,1,32),
(80,14,2,87),
(81,14,3,65),
(82,14,4,71),
(83,14,5,48),
(84,14,6,59),
(85,15,1,59),
(86,15,2,74),
(87,15,3,85),
(88,15,4,67),
(89,15,5,71),
(90,15,6,70),
(91,16,1,86),
(92,16,2,83),
(93,16,3,74),
(94,16,4,54),
(95,16,5,83),
(96,16,6,75),
(97,17,1,90),
(98,17,2,71),
(99,17,3,100),
(100,17,4,66),
(101,17,5,95),
(102,17,6,73),
(103,18,1,66),
(104,18,2,57),
(105,18,3,71),
(106,18,4,95),
(107,18,5,86),
(108,18,6,84),
(109,19,1,40),
(110,19,2,86),
(111,19,3,84),
(112,19,4,67),
(113,19,5,66),
(114,19,6,75),
(115,20,1,93),
(116,20,2,52),
(117,20,3,61),
(118,20,4,88),
(119,20,5,61),
(120,20,6,62),
(121,21,1,71),
(122,21,2,51),
(123,21,3,73),
(124,21,4,32),
(125,21,5,83),
(126,21,6,70),
(127,22,1,100),
(128,22,2,76),
(129,22,3,92),
(130,22,4,52),
(131,22,5,70),
(132,22,6,76),
(133,23,1,100),
(134,23,2,48),
(135,23,3,88),
(136,23,4,82),
(137,23,5,97),
(138,23,6,84),
(139,24,1,76),
(140,24,2,68),
(141,24,3,57),
(142,24,4,78),
(143,24,5,73),
(144,24,6,100),
(145,25,1,58),
(146,25,2,72),
(147,25,3,44),
(148,25,4,62),
(149,25,5,71),
(150,25,6,80),
(151,26,1,91),
(152,26,2,69),
(153,26,3,53),
(154,26,4,76),
(155,26,5,77),
(156,26,6,77),
(157,27,1,61),
(158,27,2,89),
(159,27,3,73),
(160,27,4,82),
(161,27,5,91),
(162,27,6,38),
(163,28,1,78),
(164,28,2,100),
(165,28,3,77),
(166,28,4,69),
(167,28,5,75),
(168,28,6,96),
(169,29,1,77),
(170,29,2,83),
(171,29,3,93),
(172,29,4,68),
(173,29,5,50),
(174,29,6,80),
(175,30,1,71),
(176,30,2,58),
(177,30,3,81),
(178,30,4,77),
(179,30,5,53),
(180,30,6,75);

DELIMITER $$

CREATE FUNCTION get_grade(p_marks DECIMAL(5,2))
RETURNS VARCHAR(2)
DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN p_marks >= 90 THEN 'A+'
        WHEN p_marks >= 80 THEN 'A'
        WHEN p_marks >= 70 THEN 'B'
        WHEN p_marks >= 60 THEN 'C'
        WHEN p_marks >= 50 THEN 'D'
        WHEN p_marks >= 40 THEN 'E'
        ELSE 'F'
    END;
END$$

CREATE FUNCTION get_percentage(p_student_id INT)
RETURNS DECIMAL(5,2)
READS SQL DATA
BEGIN
    DECLARE v_percentage DECIMAL(5,2);
    SELECT AVG(marks_obtained) INTO v_percentage
    FROM marks WHERE student_id = p_student_id;
    RETURN COALESCE(v_percentage, 0);
END$$

CREATE FUNCTION get_result(p_student_id INT)
RETURNS VARCHAR(4)
READS SQL DATA
BEGIN
    DECLARE v_failed INT DEFAULT 0;
    DECLARE v_total INT DEFAULT 0;
    SELECT COUNT(*), SUM(marks_obtained < 40)
      INTO v_total, v_failed
    FROM marks WHERE student_id = p_student_id;
    IF v_total = 0 THEN RETURN 'N/A'; END IF;
    IF v_failed > 0 THEN RETURN 'FAIL'; END IF;
    RETURN 'PASS';
END$$

DELIMITER ;

-- (a) Marks with student, department and subject names
SELECT s.student_id, s.roll_no, s.student_name, d.department_name,
       sub.subject_name, m.marks_obtained
FROM marks m
JOIN students s ON m.student_id = s.student_id
JOIN departments d ON s.department_id = d.department_id
JOIN subjects sub ON m.subject_id = sub.subject_id
ORDER BY s.student_id, sub.subject_id;

-- (b) Subject-wise average, highest and lowest
SELECT sub.subject_name, ROUND(AVG(m.marks_obtained),2) AS average_marks,
       MAX(m.marks_obtained) AS highest_marks, MIN(m.marks_obtained) AS lowest_marks
FROM subjects sub LEFT JOIN marks m ON sub.subject_id = m.subject_id
GROUP BY sub.subject_id, sub.subject_name ORDER BY sub.subject_id;

-- (c) Department-wise topper(s); ties are included
WITH student_averages AS (
    SELECT s.student_id, s.student_name, s.department_id, AVG(m.marks_obtained) AS avg_marks
    FROM students s JOIN marks m ON s.student_id = m.student_id
    GROUP BY s.student_id, s.student_name, s.department_id
), ranked AS (
    SELECT *, DENSE_RANK() OVER (PARTITION BY department_id ORDER BY avg_marks DESC) AS rnk
    FROM student_averages
)
SELECT d.department_name, r.student_name, ROUND(r.avg_marks,2) AS average_marks
FROM ranked r JOIN departments d ON r.department_id = d.department_id
WHERE r.rnk = 1;

-- (d) Students failing in at least one subject
SELECT DISTINCT s.student_id, s.student_name, d.department_name
FROM students s JOIN marks m ON s.student_id = m.student_id
JOIN departments d ON s.department_id = d.department_id
WHERE m.marks_obtained < 40;

-- (e) Department average using LEFT JOIN (keeps departments with no marks)
SELECT d.department_name, ROUND(AVG(m.marks_obtained),2) AS department_average
FROM departments d
LEFT JOIN students s ON d.department_id = s.department_id
LEFT JOIN marks m ON s.student_id = m.student_id
GROUP BY d.department_id, d.department_name ORDER BY d.department_id;

-- Function examples
SELECT get_grade(87) AS grade_example;
SELECT student_id, get_percentage(student_id) AS percentage,
       get_result(student_id) AS result
FROM students ORDER BY student_id LIMIT 10;

-- Constraint tests: uncomment and execute ONE AT A TIME to capture your server's error.
-- PRIMARY KEY violation: INSERT INTO departments VALUES (1,'Duplicate ID');
-- UNIQUE violation (email): INSERT INTO students VALUES (999,'DUP1','Test Student','student001@example.edu',1,1);
-- NOT NULL violation: INSERT INTO students (student_id,roll_no,student_name,email,department_id,semester) VALUES (998,'NULL1',NULL,'null@example.edu',1,1);
-- FOREIGN KEY violation: INSERT INTO students VALUES (997,'BADDEPT','Bad Department','baddept@example.edu',999,1);
-- CHECK violation: INSERT INTO students VALUES (996,'BADSEM','Bad Semester','badsem@example.edu',1,9);
-- marks CHECK violation: INSERT INTO marks VALUES (9999,1,1,120);
-- duplicate student-subject: INSERT INTO marks VALUES (9998,1,1,75);
-- DEFAULT example: INSERT INTO students (student_id,roll_no,student_name,email,department_id) VALUES (995,'DEF1','Default Semester','default@example.edu',1);
drop database student_analytics;