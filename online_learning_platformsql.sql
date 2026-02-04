CREATE SCHEMA online_learning_platform;

CREATE TABLE online_learning_platform.course
(course_id INT CHECK(course_id<=9999) PRIMARY KEY,
title VARCHAR(250) NOT NULL UNIQUE,
description VARCHAR (250),
instruction VARCHAR (250)
);

CREATE TABLE online_learning_platform.quiz
(quiz_id SERIAL PRIMARY KEY,
title VARCHAR(50) NOT NULL,
questions VARCHAR(150) NOT NULL,
course_id INT REFERENCES online_learning_platform.course(course_id) ON DELETE CASCADE
);

INSERT INTO online_learning_platform.course (course_id,title,description, instruction) VALUES
(1001, 'Introduction to System Engineering', 'An introduction course to the field of system engineering', 'Systems Engineering is an interdisciplinary field...'),
(2202, 'Data and Information Engineering', 'An intermediate-level course for data engineering', 'This course provides students with the background necessary to model'),
(3035, 'User Interface Design', 'An Upper level course about interface design', 'User interface design creates interfaces in software');

INSERT INTO online_learning_platform.quiz(quiz_id, title, questions, course_id) VALUES
(1, 'QUIZ 1', 'What is the final exam date specified on the syllabus', 1001),
(2, 'QUIZ 2', "What are the professor's closing notes on sql", 2202),
(3, 'QUIZ 3', 'Describe what a relational database is',2202);

UPDATE online_learning_platform.quiz
SET questions = 'What is the late submission policy of the course'
WHERE 'QUIZ 1';

SELECT *
FROM online_learning_platform.quiz;

SELECT *
FROM online_learning_platform.quiz
WHERE course_id=2202;

DELETE FROM online_learning_platform.quiz
WHERE quiz_id=3









