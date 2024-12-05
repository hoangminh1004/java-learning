-- Drop the database if it exists and create a new one
DROP DATABASE IF EXISTS testing_system;
CREATE DATABASE testing_system;
USE testing_system;

-- Drop the Department table if it exists and create a new one
DROP TABLE IF EXISTS department;
CREATE TABLE department (
    department_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    department_name NVARCHAR(50) NOT NULL UNIQUE
);

-- Drop the Position table if it exists and create a new one
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
    position_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    position_name NVARCHAR(30) NOT NULL UNIQUE
);

-- Drop the Account table if it exists and create a new one
DROP TABLE IF EXISTS account;
CREATE TABLE account (
    account_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    full_name NVARCHAR(50) NOT NULL,
    department_id TINYINT UNSIGNED NOT NULL,
    position_id TINYINT UNSIGNED NOT NULL,
    create_date DATETIME DEFAULT NOW(),
    FOREIGN KEY (department_id) REFERENCES department(department_id),
    FOREIGN KEY (position_id) REFERENCES `position`(position_id)
);

-- Drop the Group table if it exists and create a new one
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
    group_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    group_name NVARCHAR(50) NOT NULL UNIQUE,
    creator_id TINYINT UNSIGNED NOT NULL,
    create_date DATETIME DEFAULT NOW(),
    FOREIGN KEY (creator_id) REFERENCES account(account_id)
);

-- Drop the GroupAccount table if it exists and create a new one
DROP TABLE IF EXISTS group_account;
CREATE TABLE group_account (
    group_id TINYINT UNSIGNED NOT NULL,
    account_id TINYINT UNSIGNED NOT NULL,
    join_date DATETIME DEFAULT NOW(),
    PRIMARY KEY (group_id, account_id),
    FOREIGN KEY (group_id) REFERENCES `group`(group_id),
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

-- Drop the TypeQuestion table if it exists and create a new one
DROP TABLE IF EXISTS type_question;
CREATE TABLE type_question (
    type_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    type_name ENUM('Essay', 'Multiple-Choice') NOT NULL
);

-- Drop the CategoryQuestion table if it exists and create a new one
DROP TABLE IF EXISTS category_question;
CREATE TABLE category_question (
    category_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_name NVARCHAR(50) NOT NULL UNIQUE
);

-- Drop the Question table if it exists and create a new one
DROP TABLE IF EXISTS question;
CREATE TABLE question (
    question_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content NVARCHAR(100) NOT NULL,
    category_id TINYINT UNSIGNED NOT NULL,
    type_id TINYINT UNSIGNED NOT NULL,
    creator_id TINYINT UNSIGNED NOT NULL,
    create_date DATETIME DEFAULT NOW(),
    FOREIGN KEY (category_id) REFERENCES category_question(category_id),
    FOREIGN KEY (type_id) REFERENCES type_question(type_id),
    FOREIGN KEY (creator_id) REFERENCES account(account_id)
);

-- Drop the Answer table if it exists and create a new one
DROP TABLE IF EXISTS answer;
CREATE TABLE answer (
    answer_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content NVARCHAR(100) NOT NULL,
    question_id TINYINT UNSIGNED NOT NULL,
    is_correct BIT DEFAULT 1,
    FOREIGN KEY (question_id) REFERENCES question(question_id)
);

-- Drop the Exam table if it exists and create a new one
DROP TABLE IF EXISTS exam;
CREATE TABLE exam (
    exam_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `code` CHAR(10) NOT NULL,
    title NVARCHAR(50) NOT NULL,
    category_id TINYINT UNSIGNED NOT NULL,
    duration TINYINT UNSIGNED NOT NULL,
    creator_id TINYINT UNSIGNED NOT NULL,
    create_date DATETIME DEFAULT NOW(),
    FOREIGN KEY (category_id) REFERENCES category_question(category_id),
    FOREIGN KEY (creator_id) REFERENCES account(account_id)
);

-- Drop the ExamQuestion table if it exists and create a new one
DROP TABLE IF EXISTS exam_question;
CREATE TABLE exam_question (
    exam_id TINYINT UNSIGNED NOT NULL,
    question_id TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (exam_id, question_id),
    FOREIGN KEY (exam_id) REFERENCES exam(exam_id),
    FOREIGN KEY (question_id) REFERENCES question(question_id)
);

-- Insert data into Department table
INSERT INTO department (department_name)
VALUES
    (N'Marketing'),
    (N'Sales'),
    (N'Bảo vệ'),
    (N'Nhân sự'),
    (N'Kỹ thuật'),
    (N'Tài chính'),
    (N'Phó giám đốc'),
    (N'Giám đốc'),
    (N'Thư kí'),
    (N'No person'),
    (N'Bán hàng');

-- Insert data into Position table
INSERT INTO `position` (position_name)
VALUES
    ('Dev'),
    ('Test'),
    ('Scrum Master'),
    ('PM');

-- Insert data into Account table
INSERT INTO account (email, username, full_name, department_id, position_id, create_date)
VALUES
    ('Email1@gmail.com', 'Username1', 'Fullname1', 5, 1, '2020-03-05'),
    ('Email2@gmail.com', 'Username2', 'Fullname2', 1, 2, '2020-03-05'),
    ('Email3@gmail.com', 'Username3', 'Fullname3', 2, 2, '2020-03-07'),
    ('Email4@gmail.com', 'Username4', 'Fullname4', 3, 4, '2020-03-08'),
    ('Email5@gmail.com', 'Username5', 'Fullname5', 4, 4, '2020-03-10'),
    ('Email6@gmail.com', 'Username6', 'Fullname6', 6, 3, '2020-04-05'),
    ('Email7@gmail.com', 'Username7', 'Fullname7', 2, 2, NULL),
    ('Email8@gmail.com', 'Username8', 'Fullname8', 8, 1, '2020-04-07'),
    ('Email9@gmail.com', 'Username9', 'Fullname9', 2, 2, '2020-04-07'),
    ('Email10@gmail.com', 'Username10', 'Fullname10', 10, 1, '2020-04-09'),
    ('Email11@gmail.com', 'Username11', 'Fullname11', 10, 1, DEFAULT),
    ('Email12@gmail.com', 'Username12', 'Fullname12', 10, 1, DEFAULT);

-- Insert data into Group table
INSERT INTO `group` (group_name, creator_id, create_date)
VALUES
    (N'Testing System', 5, '2019-03-05'),
    (N'Development', 1, '2020-03-07'),
    (N'VTI Sale 01', 2, '2020-03-09'),
    (N'VTI Sale 02', 3, '2020-03-10'),
    (N'VTI Sale 03', 4, '2020-03-28'),
    (N'VTI Creator', 6, '2020-04-06'),
    (N'VTI Marketing 01', 7, '2020-04-07'),
    (N'Management', 8, '2020-04-08'),
    (N'Chat with love', 9, '2020-04-09'),
    (N'Vi Ti Ai', 10, '2020-04-10');

-- Insert data into GroupAccount table
INSERT INTO group_account (group_id, account_id, join_date)
VALUES
    (1, 1, '2019-03-05'),
    (1, 2, '2020-03-07'),
    (3, 3, '2020-03-09'),
    (3, 4, '2020-03-10'),
    (5, 5, '2020-03-28'),
    (1, 3, '2020-04-06'),
    (1, 7, '2020-04-07'),
    (8, 3, '2020-04-08'),
    (1, 9, '2020-04-09'),
    (10, 10, '2020-04-10');

-- Insert data into TypeQuestion table
INSERT INTO type_question (type_name)
VALUES
    ('Essay'),
    ('Multiple-Choice');

-- Insert data into CategoryQuestion table
INSERT INTO category_question (category_name)
VALUES
    ('Java'),
    ('ASP.NET'),
    ('ADO.NET'),
    ('SQL'),
    ('Postman'),
    ('Ruby'),
    ('Python'),
    ('C++'),
    ('C Sharp'),
    ('PHP');

-- Insert data into Question table
INSERT INTO question (content, category_id, type_id, creator_id, create_date)
VALUES
    (N'Câu hỏi về Java', 1, 1, 2, '2019-03-05'),
    (N'Câu hỏi về SQL', 4, 2, 2, '2019-03-05'),
    (N'Câu hỏi về .NET', 2, 2, 3, '2019-03-06'),
    (N'Câu hỏi về Postman', 5, 1, 5, '2019-03-06'),
    (N'Câu hỏi về C++', 8, 2, 6, '2019-03-07'),
    (N'Câu hỏi về Ruby', 6, 1, 7, '2019-03-07'),
    (N'Câu hỏi về Python', 7, 2, 8, '2019-03-08'),
    (N'Câu hỏi về PHP', 10, 1, 9, '2019-03-08'),
    (N'Câu hỏi về ADO.NET', 3, 1, 10, '2019-03-09'),
    (N'Câu hỏi về C Sharp', 9, 2, 11, '2019-03-09');

-- Insert data into Answer table
INSERT INTO answer (content, question_id, is_correct)
VALUES
    (N'Câu trả lời cho câu hỏi 1', 1, DEFAULT),
    (N'Câu trả lời cho câu hỏi 2', 2, 0),
    (N'Câu trả lời cho câu hỏi 3', 3, DEFAULT),
    (N'Câu trả lời cho câu hỏi 4', 4, DEFAULT),
    (N'Câu trả lời cho câu hỏi 5', 5, 0),
    (N'Câu trả lời cho câu hỏi 6', 6, DEFAULT),
    (N'Câu trả lời cho câu hỏi 7', 7, DEFAULT),
    (N'Câu trả lời cho câu hỏi 8', 8, 0),
    (N'Câu trả lời cho câu hỏi 9', 9, 0),
    (N'Câu trả lời cho câu hỏi 10', 10, DEFAULT);

-- Insert data into Exam table
INSERT INTO exam (`code`, title, category_id, duration, creator_id, create_date)
VALUES
    ('JV01', N'Java Exam', 1, 60, 1, '2019-03-05'),
    ('ASP01', N'ASP.NET Exam', 2, 60, 2, '2019-03-05'),
    ('ADO01', N'ADO.NET Exam', 3, 45, 3, '2019-03-06'),
    ('SQL01', N'SQL Exam', 4, 60, 4, '2019-03-07'),
    ('PM01', N'Postman Exam', 5, 45, 5, '2019-03-08');

-- Insert data into ExamQuestion table
INSERT INTO exam_question (exam_id, question_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5),
    (3, 6),
    (3, 7),
    (4, 8),
    (4, 9),
    (5, 10);
