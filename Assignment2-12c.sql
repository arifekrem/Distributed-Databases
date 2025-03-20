-- Creating Engineering Tables
CREATE TABLE Engineering_Student (
    StudentNo INT PRIMARY KEY,          
    StudentName VARCHAR(100), 
    Degree VARCHAR(50),                
    GPA FLOAT
);

CREATE TABLE Engineering_Professor (
    ProfName VARCHAR(100) PRIMARY KEY,
    ProfOffice VARCHAR(100),
    ProfPhone VARCHAR(10)
);

CREATE TABLE Engineering_Course (
    CourseNo INT PRIMARY KEY,          
    CourseName VARCHAR(100),  
    Credits INT,                       
    Department VARCHAR(50)             
);

CREATE TABLE Engineering_Can_Teach (
    ProfName VARCHAR(100),
    CourseNo INT, -- CourseNo of courses they prefer to teach
    Evaluation CHAR(1), -- Y or N
    PRIMARY KEY (ProfName, CourseNo),
    FOREIGN KEY (ProfName) REFERENCES Engineering_Professor(ProfName),
    FOREIGN KEY (CourseNo) REFERENCES Engineering_Course(CourseNo)
);

CREATE TABLE Engineering_Teaches (
    ProfName VARCHAR(100),
    CourseNo INT,
    Term VARCHAR(50),
    PRIMARY KEY (ProfName, CourseNo, Term),
    FOREIGN KEY (ProfName) REFERENCES Engineering_Professor(ProfName),
    FOREIGN KEY (CourseNo) REFERENCES Engineering_Course(CourseNo)
);

CREATE TABLE Engineering_Enrolled (
    StudentNo INT,
    CourseNo INT,
    Status CHAR(1), -- Y or N
    PRIMARY KEY (StudentNo, CourseNo),
    FOREIGN KEY (StudentNo) REFERENCES Engineering_Student(StudentNo),
    FOREIGN KEY (CourseNo) REFERENCES Engineering_Course(CourseNo)
);


-- Creating Science Tables
CREATE TABLE Science_Student (
    StudentNo INT PRIMARY KEY,          
    StudentName VARCHAR(100), 
    Degree VARCHAR(50),                
    GPA FLOAT
);

CREATE TABLE Science_Professor (
    ProfName VARCHAR(100) PRIMARY KEY,
    ProfOffice VARCHAR(100),
    ProfPhone VARCHAR(10)
);

CREATE TABLE Science_Course (
    CourseNo INT PRIMARY KEY,          
    CourseName VARCHAR(100),  
    Credits INT,                       
    Department VARCHAR(50)             
);

CREATE TABLE Science_Can_Teach (
    ProfName VARCHAR(100),
    CourseNo INT, -- CourseNo of courses they prefer to teach
    Evaluation CHAR(1), -- Y or N
    PRIMARY KEY (ProfName, CourseNo),
    FOREIGN KEY (ProfName) REFERENCES Science_Professor(ProfName),
    FOREIGN KEY (CourseNo) REFERENCES Science_Course(CourseNo)
);

CREATE TABLE Science_Teaches (
    ProfName VARCHAR(100),
    CourseNo INT,
    Term VARCHAR(50),
    PRIMARY KEY (ProfName, CourseNo, Term),
    FOREIGN KEY (ProfName) REFERENCES Science_Professor(ProfName),
    FOREIGN KEY (CourseNo) REFERENCES Science_Course(CourseNo)
);

CREATE TABLE Science_Enrolled (
    StudentNo INT,
    CourseNo INT,
    Status CHAR(1), -- Y or N
    PRIMARY KEY (StudentNo, CourseNo),
    FOREIGN KEY (StudentNo) REFERENCES Science_Student(StudentNo),
    FOREIGN KEY (CourseNo) REFERENCES Science_Course(CourseNo)
);