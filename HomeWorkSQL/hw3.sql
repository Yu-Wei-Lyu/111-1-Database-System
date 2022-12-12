CREATE DATABASE `DBHW3`;
SHOW DATABASES;
USE `DBHW3`;

CREATE TABLE `STUDENT` (
	`StudentNumber` INT AUTO_INCREMENT, 
    `Name` VARCHAR(63), 
    `Class` INT, 
    `Major` VARCHAR(63),
    
    PRIMARY KEY(`StudentNumber`)
);


CREATE TABLE `COURSE` (
	`CourseNumber` INT AUTO_INCREMENT, 
    `CourseName` VARCHAR(63), 
    `CreditHour` INT, 
    `Department` VARCHAR(63),
    
    PRIMARY KEY(`CourseNumber`)
);

CREATE TABLE `SECTION` (
	`SectionNumber` INT AUTO_INCREMENT, 
    `CourseNumber` INT, 
    `Semester` VARCHAR(63), 
    `Year` YEAR, 
    `Instructor` VARCHAR(63),
    
    PRIMARY KEY(`SectionNumber`),
    FOREIGN KEY(`CourseNumber`) REFERENCES `COURSE`(`CourseNumber`) ON DELETE SET NULL
);

CREATE TABLE `GRADE_REPORT` (
	`StudentNumber` INT, 
    `SectionNumber` INT, 
    `Grade` INT,
    
    PRIMARY KEY(`StudentNumber`, `SectionNumber`),
    FOREIGN KEY(`StudentNumber`) REFERENCES `STUDENT`(`StudentNumber`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(`SectionNumber`) REFERENCES `SECTION`(`SectionNumber`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `PREREQUISITE` (
	`PrerequisiteCourseNumber` INT,
	`CourseNumber` INT, 
    
    PRIMARY KEY(`PrerequisiteCourseNumber`, `CourseNumber`),
    FOREIGN KEY(`CourseNumber`) REFERENCES `COURSE`(`CourseNumber`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `STUDENT`
VALUES (0, 'Astra', 'Africa', 'EECS'),
(0, 'Breach', 'Europe', 'CSIE'),
(0, 'Brimstone', 'America', 'EECS'),
(0, 'Chamber', 'Europe', 'CSIE'),
(0, 'Cypher', 'Africa', 'CSIE'),
(0, 'Fade', 'Asia', 'EECS');

SHOW TABLES;
SELECT * from STUDENT;
SELECT * from COURSE;
SELECT * from SECTION;
SELECT * from GRADE_REPORT;
SELECT * from PREREQUISITE;
drop table if EXISTS `STUDENT`, `COURSE`, `SECTION`, `GRADE_REPORT`, `PREREQUISITE`;