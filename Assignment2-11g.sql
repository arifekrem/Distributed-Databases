-- Creating Central Tables
CREATE TABLE Central_Student (
    StudentNo INT PRIMARY KEY,          
    StudentName VARCHAR(100), 
    Degree VARCHAR(50),                
    GPA FLOAT
);

CREATE TABLE Central_Professor (
    ProfName VARCHAR(100) PRIMARY KEY,
    ProfOffice VARCHAR(100),
    ProfPhone VARCHAR(10)
);

CREATE TABLE Central_Course (
    CourseNo INT PRIMARY KEY,          
    CourseName VARCHAR(100),  
    Credits INT,                       
    Department VARCHAR(50)             
);

CREATE TABLE Central_Can_Teach (
    ProfName VARCHAR(100),
    CourseNo INT, -- CourseNo of courses they prefer to teach
    Evaluation CHAR(1), -- Y or N
    PRIMARY KEY (ProfName, CourseNo),
    FOREIGN KEY (ProfName) REFERENCES Central_Professor(ProfName),
    FOREIGN KEY (CourseNo) REFERENCES Central_Course(CourseNo)
);

CREATE TABLE Central_Teaches (
    ProfName VARCHAR(100),
    CourseNo INT,
    Term VARCHAR(50),
    PRIMARY KEY (ProfName, CourseNo, Term),
    FOREIGN KEY (ProfName) REFERENCES Central_Professor(ProfName),
    FOREIGN KEY (CourseNo) REFERENCES Central_Course(CourseNo)
);

CREATE TABLE Central_Enrolled (
    StudentNo INT,
    CourseNo INT,
    Status CHAR(1), -- Y or N
    PRIMARY KEY (StudentNo, CourseNo),
    FOREIGN KEY (StudentNo) REFERENCES Central_Student(StudentNo),
    FOREIGN KEY (CourseNo) REFERENCES Central_Course(CourseNo)
);


-- Links to 2 databases
CREATE DATABASE LINK EngineeringDB
CONNECT TO studentid IDENTIFIED BY "password"
USING '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=oracle12c.scs.ryerson.ca)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=orcl12c)))';

CREATE DATABASE LINK ScienceDB
CONNECT TO studentid IDENTIFIED BY "password"
USING '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=oracle12c.scs.ryerson.ca)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=orcl12c)))';


-- Fill the tables with sample data
-- Sample data for Central_Student
INSERT INTO Central_Student (StudentNo, StudentName, Degree, GPA)
VALUES (1, 'Alice Smith', 'BSc Computer Science', 3.8);

INSERT INTO Central_Student (StudentNo, StudentName, Degree, GPA)
VALUES (2, 'Bob Jones', 'BEng Mechanical Engineering', 3.2);

INSERT INTO Central_Student (StudentNo, StudentName, Degree, GPA)
VALUES (3, 'Charlie Brown', 'BSc Mathematics', 4.0);

INSERT INTO Central_Student (StudentNo, StudentName, Degree, GPA)
VALUES (4, 'Diana Prince', 'BEng Electrical Engineering', 3.5);

INSERT INTO Central_Student (StudentNo, StudentName, Degree, GPA)
VALUES (5, 'Rin Paris', 'Art History', 2.7);

-- Sample data for Central_Professor
INSERT INTO Central_Professor (ProfName, ProfOffice, ProfPhone)
VALUES ('Dr. Emily White', 'AR501', 301);

INSERT INTO Central_Professor (ProfName, ProfOffice, ProfPhone)
VALUES ('Dr. Frank Black', 'AR421', 601);

INSERT INTO Central_Professor (ProfName, ProfOffice, ProfPhone)
VALUES ('Dr. Grace Green', 'CL221', 333);

INSERT INTO Central_Professor (ProfName, ProfOffice, ProfPhone)
VALUES ('Dr. Henry Blue', 'LD404', 215);

INSERT INTO Central_Professor (ProfName, ProfOffice, ProfPhone)
VALUES ('Dr. Jean Denim', 'BR023', 130);

INSERT INTO Central_Professor (ProfName, ProfOffice, ProfPhone)
VALUES ('Professor Harry', 'CL234', 135);

-- Sample data for Central_Course
INSERT INTO Central_Course (CourseNo, CourseName, Credits, Department)
VALUES (201, 'Introduction to Biology', 3, 'SCI');

INSERT INTO Central_Course (CourseNo, CourseName, Credits, Department)
VALUES (202, 'Advanced Chemistry', 4, 'SCI');

INSERT INTO Central_Course (CourseNo, CourseName, Credits, Department)
VALUES (203, 'Mechanics', 3, 'ENG');

INSERT INTO Central_Course (CourseNo, CourseName, Credits, Department)
VALUES (204, 'Circuit Analysis', 3, 'ENG');

INSERT INTO Central_Course (CourseNo, CourseName, Credits, Department)
VALUES (205, 'Mathematical Modeling', 2, 'ENG');

INSERT INTO Central_Course (CourseNo, CourseName, Credits, Department)
VALUES (310, 'Intro to Engineering', 2, 'ENG');

INSERT INTO Central_Course (CourseNo, CourseName, Credits, Department)
VALUES (215, 'Physics', 2, 'SCI');

INSERT INTO Central_Course (CourseNo, CourseName, Credits, Department)
VALUES (101, 'Birds!', 1, 'SCI');

INSERT INTO Central_Course (CourseNo, CourseName, Credits, Department)
VALUES (540, 'Art History', 1, 'ART');

INSERT INTO Central_Course (CourseNo, CourseName, Credits, Department)
VALUES (541, 'Art History 2', 1, 'ART');

-- Sample data for Central_Can_Teach
INSERT INTO Central_Can_Teach (ProfName, CourseNo, Evaluation)
VALUES ('Dr. Emily White', 201, 'Y');  -- Dr. Emily White can teach Introduction to Biology

INSERT INTO Central_Can_Teach (ProfName, CourseNo, Evaluation)
VALUES ('Dr. Emily White', 202, 'Y');  -- Dr. Emily White can teach Advanced Chemistry

INSERT INTO Central_Can_Teach (ProfName, CourseNo, Evaluation)
VALUES ('Dr. Frank Black', 203, 'N');  -- Dr. Frank Black can teach Mechanics

INSERT INTO Central_Can_Teach (ProfName, CourseNo, Evaluation)
VALUES ('Dr. Frank Black', 204, 'Y');  -- Dr. Frank Black can teach Circuit Analysis

INSERT INTO Central_Can_Teach (ProfName, CourseNo, Evaluation)
VALUES ('Dr. Grace Green', 205, 'Y');  -- Dr. Grace Green can teach Mathematical Modeling

INSERT INTO Central_Can_Teach (ProfName, CourseNo, Evaluation)
VALUES ('Dr. Henry Blue', 204, 'N');  -- Dr. Henry Blue can also teach Circuit Analysis

INSERT INTO Central_Can_Teach (ProfName, CourseNo, Evaluation)
VALUES ('Dr. Jean Denim', 540, 'Y');  

INSERT INTO Central_Can_Teach (ProfName, CourseNo, Evaluation)
VALUES ('Dr. Jean Denim', 541, 'Y'); 

INSERT INTO Central_Can_Teach (ProfName, CourseNo, Evaluation)
VALUES ('Dr. Jean Denim', 101, 'N');

INSERT INTO Central_Can_Teach (ProfName, CourseNo, Evaluation)
VALUES ('Dr. Jean Denim', 201, 'N');

INSERT INTO Central_Can_Teach (ProfName, CourseNo, Evaluation)
VALUES ('Professor Harry', 310, 'Y');

INSERT INTO Central_Can_Teach (ProfName, CourseNo, Evaluation)
VALUES ('Professor Harry', 215, 'Y');


-- Sample data for Central_Teaches
INSERT INTO Central_Teaches (ProfName, CourseNo, Term)
VALUES ('Dr. Emily White', 201, 'Fall');

INSERT INTO Central_Teaches (ProfName, CourseNo, Term)
VALUES ('Dr. Frank Black', 203, 'Fall');

INSERT INTO Central_Teaches (ProfName, CourseNo, Term)
VALUES ('Dr. Grace Green', 205, 'Summer');

INSERT INTO Central_Teaches (ProfName, CourseNo, Term)
VALUES ('Dr. Henry Blue', 204, 'Summer');

INSERT INTO Central_Teaches (ProfName, CourseNo, Term)
VALUES ('Dr. Jean Denim', 540, 'Fall');

INSERT INTO Central_Teaches (ProfName, CourseNo, Term)
VALUES ('Dr. Jean Denim', 541, 'Winter');

INSERT INTO Central_Teaches (ProfName, CourseNo, Term)
VALUES ('Dr. Jean Denim', 101, 'Summer');

INSERT INTO Central_Teaches (ProfName, CourseNo, Term)
VALUES ('Professor Harry', 310, 'Winter');

INSERT INTO Central_Teaches (ProfName, CourseNo, Term)
VALUES ('Professor Harry', 215, 'Winter');





-- Sample data for Central_Enrolled (assigning students to courses)
INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (1, 201,'Y');  -- Alice enrolled in Introduction to Biology

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (1, 202,'Y');  -- Alice enrolled in Advanced Chemistry

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (2, 203,'Y');  -- Bob enrolled in Mechanics

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (3, 205,'Y');  -- Charlie enrolled in Mathematical Modeling

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (4, 204,'Y');  -- Diana enrolled in Circuit Analysis

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (3, 201,'Y');  -- Charlie also enrolled in Introduction to Biology

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (5, 201,'Y');  

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (5, 202,'Y');  

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (5, 203,'Y'); 

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (5, 204,'Y');  

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (5, 205,'Y');  

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (5, 101,'Y');  

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (5, 541,'Y');  

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (5, 540,'Y');

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (5, 310,'Y');  

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (5, 215,'Y');  

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (3, 310,'Y');  

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (3, 215,'Y');  

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (2, 310,'Y');  

INSERT INTO Central_Enrolled (StudentNo, CourseNo, Status)
VALUES (1, 215,'Y');  


-- Inserting data from central to science
BEGIN
    DELETE FROM Science_Teaches@ScienceDB;
    DELETE FROM Science_Enrolled@ScienceDB;
    DELETE FROM Science_Can_Teach@ScienceDB;
    DELETE FROM Science_Student@ScienceDB;
    DELETE FROM Science_Professor@ScienceDB;
    DELETE FROM Science_Course@ScienceDB;
    
    INSERT INTO Science_Course@ScienceDB   
        SELECT Central_Course.* 
            FROM Central_Course
            WHERE Central_Course.department='SCI'
    ;
    
    INSERT INTO Science_Professor@ScienceDB  
        SELECT Central_Professor.* 
            FROM Central_Professor
            JOIN Central_Teaches 
                ON Central_Professor.ProfName=Central_Teaches.ProfName
            JOIN Central_Course 
                ON Central_Course.CourseNo=Central_Teaches.CourseNo
                AND Central_Course.department='SCI'
        UNION
        SELECT Central_Professor.* 
            FROM Central_Professor
            JOIN Central_Can_Teach 
                ON Central_Professor.ProfName=Central_Can_Teach.ProfName
            JOIN Central_Course 
                ON Central_Course.CourseNo=Central_Can_Teach.CourseNo 
                AND Central_Course.department='SCI'
    ;
    
    INSERT INTO Science_Student@ScienceDB  
        SELECT Central_Student.* 
            FROM Central_Student
            JOIN Central_Enrolled 
                ON Central_Student.StudentNo=Central_Enrolled.StudentNo
            JOIN Central_Course 
                ON Central_Course.CourseNo=Central_Enrolled.CourseNo 
                AND Central_Course.department='SCI'
            GROUP BY Central_Student.StudentNo, Central_Student.StudentName, Central_Student.Degree, Central_Student.GPA
    ;
    
    INSERT INTO Science_Can_Teach@ScienceDB 
        SELECT Central_Can_Teach.* 
            FROM Central_Can_Teach
            JOIN Central_Course 
                ON Central_Course.CourseNo=Central_Can_Teach.CourseNo 
                AND Central_Course.department='SCI'
    ;
    
    INSERT INTO Science_Teaches@ScienceDB  
        SELECT Central_Teaches.* 
            FROM Central_Teaches
            JOIN Central_Course 
                ON Central_Course.CourseNo=Central_Teaches.CourseNo
                AND Central_Course.department='SCI'
    ;

    INSERT INTO Science_Enrolled@ScienceDB  
        SELECT Central_Enrolled.* 
            FROM Central_Enrolled
            JOIN Central_Course 
                ON Central_Course.CourseNo=Central_Enrolled.CourseNo
                AND Central_Course.department='SCI'
    ;

    COMMIT;
END;

-- Inserting data from central to engineering
BEGIN
    DELETE FROM Engineering_Teaches@EngineeringDB;
    DELETE FROM Engineering_Enrolled@EngineeringDB;
    DELETE FROM Engineering_Can_Teach@EngineeringDB;
    DELETE FROM Engineering_Student@EngineeringDB;
    DELETE FROM Engineering_Professor@EngineeringDB;
    DELETE FROM Engineering_Course@EngineeringDB;
    
    INSERT INTO Engineering_Course@EngineeringDB   
        SELECT Central_Course.* 
            FROM Central_Course
            WHERE Central_Course.department='ENG'
    ;
    
    INSERT INTO Engineering_Professor@EngineeringDB  
        SELECT Central_Professor.* 
            FROM Central_Professor
            JOIN Central_Teaches 
                ON Central_Professor.ProfName=Central_Teaches.ProfName
            JOIN Central_Course 
                ON Central_Course.CourseNo=Central_Teaches.CourseNo
                AND Central_Course.department='ENG'
        UNION
        SELECT Central_Professor.* 
            FROM Central_Professor
            JOIN Central_Can_Teach 
                ON Central_Professor.ProfName=Central_Can_Teach.ProfName
            JOIN Central_Course 
                ON Central_Course.CourseNo=Central_Can_Teach.CourseNo 
                AND Central_Course.department='ENG'
    ;
    
    INSERT INTO Engineering_Student@EngineeringDB  
        SELECT Central_Student.* 
            FROM Central_Student
            JOIN Central_Enrolled 
                ON Central_Student.StudentNo=Central_Enrolled.StudentNo
            JOIN Central_Course 
                ON Central_Course.CourseNo=Central_Enrolled.CourseNo 
                AND Central_Course.department='ENG'
            GROUP BY Central_Student.StudentNo, Central_Student.StudentName, Central_Student.Degree, Central_Student.GPA
    ;

    INSERT INTO Engineering_Can_Teach@EngineeringDB 
        SELECT Central_Can_Teach.* 
            FROM Central_Can_Teach
            JOIN Central_Course 
                ON Central_Course.CourseNo=Central_Can_Teach.CourseNo 
                AND Central_Course.department='ENG'
    ;

    INSERT INTO Engineering_Teaches@EngineeringDB  
        SELECT Central_Teaches.* 
            FROM Central_Teaches
            JOIN Central_Course 
                ON Central_Course.CourseNo=Central_Teaches.CourseNo
                AND Central_Course.department='ENG'
    ;
    
    INSERT INTO Engineering_Enrolled@EngineeringDB  
        SELECT Central_Enrolled.* 
            FROM Central_Enrolled
            JOIN Central_Course 
                ON Central_Course.CourseNo=Central_Enrolled.CourseNo
                AND Central_Course.department='ENG'
    ;

    COMMIT;
END;

-- Reconstruct CentralDB tables
BEGIN
    DELETE FROM Central_Can_Teach;
    DELETE FROM Central_Teaches;
    DELETE FROM Central_Enrolled;
    DELETE FROM Central_Student;
    DELETE FROM Central_Professor;
    DELETE FROM Central_Course;

    INSERT INTO Central_Student
        SELECT * FROM Science_Student@ScienceDB
        UNION
        SELECT * FROM Engineering_Student@EngineeringDB
        ;

    INSERT INTO Central_Professor
        SELECT * FROM Science_Professor@ScienceDB
        UNION
        SELECT * FROM Engineering_Professor@EngineeringDB
        ;

    INSERT INTO Central_Course
        SELECT * FROM Science_Course@ScienceDB
        UNION
        SELECT * FROM Engineering_Course@EngineeringDB
        ;

    INSERT INTO Central_Can_Teach
        SELECT * FROM Science_Can_Teach@ScienceDB
        UNION
        SELECT * FROM Engineering_Can_Teach@EngineeringDB
        ;

    INSERT INTO Central_Teaches
        SELECT * FROM Science_Teaches@ScienceDB
        UNION
        SELECT * FROM Engineering_Teaches@EngineeringDB
        ;

    INSERT INTO Central_Enrolled
        SELECT * FROM Science_Enrolled@ScienceDB
        UNION
        SELECT * FROM Engineering_Enrolled@EngineeringDB
        ;

    COMMIT;
END;


-- Queries for Task4

-- List of classes taken by students in Engineering and Science faculties.

SELECT * 
    FROM Central_Course
    WHERE Central_Course.department='SCI'
        OR Central_Course.department='ENG'
;

-- Retrieve students with a GPA greater than or equal to 4.
SELECT * 
    FROM Central_Student
    WHERE Central_Student.GPA >= 4
;

-- Calculate the average GPA for students enrolled in each course.
SELECT Central_Enrolled.CourseNo, AVG(Central_Student.GPA)
    FROM Central_Student
    JOIN Central_Enrolled 
        ON Central_Student.StudentNo=Central_Enrolled.StudentNo
    GROUP BY Central_Enrolled.CourseNo
;

-- Identify professors teaching courses they have not listed as teachable.
SELECT Central_Professor.*, Central_Teaches.CourseNo, Central_Teaches.Term, Central_Can_Teach.Evaluation
    FROM Central_Professor
    JOIN Central_Teaches 
        ON Central_Professor.ProfName=Central_Teaches.ProfName
    JOIN Central_Can_Teach 
        ON Central_Professor.ProfName=Central_Can_Teach.ProfName
        AND Central_Can_Teach.Evaluation='N'
    GROUP BY Central_Professor.profname, Central_Professor.profoffice, Central_Professor.profphone, Central_Teaches.CourseNo, Central_Teaches.Term, Central_Can_Teach.Evaluation
;

-- Retrieve professors who can teach both Science and Engineering courses.
SELECT Central_Professor.* 
    FROM Central_Professor
    JOIN Central_Can_Teach 
        ON Central_Professor.ProfName=Central_Can_Teach.ProfName
        AND Central_Can_Teach.Evaluation='Y'
    JOIN Central_Course 
        ON Central_Course.CourseNo=Central_Can_Teach.CourseNo 
        AND Central_Course.department='SCI'
INTERSECT
SELECT Central_Professor.* 
    FROM Central_Professor
    JOIN Central_Can_Teach 
        ON Central_Professor.ProfName=Central_Can_Teach.ProfName
        AND Central_Can_Teach.Evaluation='Y'
    JOIN Central_Course 
        ON Central_Course.CourseNo=Central_Can_Teach.CourseNo 
        AND Central_Course.department='ENG'
;

-- List students enrolled in Professor Harry’s classes, including course names.
SELECT Central_Student.*, Central_Course.CourseNo, Central_Course.CourseName, Central_Teaches.ProfName
    FROM Central_Student
    JOIN Central_Enrolled 
        ON Central_Student.StudentNo=Central_Enrolled.StudentNo
    JOIN Central_Course 
        ON Central_Course.CourseNo=Central_Enrolled.CourseNo
    JOIN Central_Teaches 
        ON Central_Teaches.CourseNo=Central_Enrolled.CourseNo
        AND Central_Teaches.ProfName='Professor Harry' 
;

-- Identify courses worth 1 credit in both Science and Engineering.
SELECT * 
    FROM Central_Course
    WHERE (Central_Course.department='SCI'
        OR Central_Course.department='ENG')
        AND Central_Course.credits=1 
;

-- Retrieve professors teaching during the summer term.
SELECT Central_Professor.*, Central_Teaches.CourseNo, Central_Teaches.Term
    FROM Central_Professor
    JOIN Central_Teaches 
        ON Central_Professor.ProfName=Central_Teaches.ProfName
    WHERE LOWER(Central_Teaches.Term)='summer'
;
