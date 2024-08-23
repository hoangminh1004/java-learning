drop database if exists my_learning;
create database if not exists my_learning;
use my_learning;

create table `department` ( 
departmentId smallint unsigned auto_increment primary key,
departmentName char(100) not null
);
 
create table `account` (
accountId int unsigned auto_increment primary key , 
accountEmail varchar(50) ,
accountUsername  varchar(50) ,
accountFullname varchar(50) ,
departmentId int , 
positionId int ,
createDate tinyint
);

create table `group` (
groupId int unsigned auto_increment primary key ,
groupName varchar(50) ,
creatorId int , 
createDate tinyint 
);

create table `groupAccount` (
groupId int , 
accountId int ,
joiDate tinyint 
);

create table `typeQuestion`(
typeId int auto_increment primary key ,
typeName varchar(50) 
);

create table `categoryQuestion` (
categororyId int auto_increment primary key ,
categoryName varchar(50)
);

create table `question` (
questionId int auto_increment primary key ,
content varchar(255) ,
categoryId int ,
typeId int ,
creatorId int ,
createDate date
);

create table `answer` (
answerId int auto_increment primary key ,
content varchar(255) ,
questionId int ,
iscorrect tinyint
);

create table `exam` (
examId int auto_increment primary key ,
code tinyint ,
title varchar(50) ,
categoryId int ,
duration int ,
creatorId int ,
createDate date
);

create table `examQuestion` (
examId int ,
questionId int 
);

create table account (
	id INT,
	name VARCHAR(50),
	age VARCHAR(50)
	);

CREATE table ` position`(
positionId INT, 
positionName varchar(255)
);
INSERT INTO ` position` (positionId ,positionName)
values (2,"DEV");

SELECT * FROM ` position` p 


	
	
);
insert into account (id, name, age) values (1, 'Gris', 2004);
insert into account (id, name, age) values (2, 'Elsinore', 2020);
insert into account (id, name, age) values (3, 'Karole', 2004);
insert into account (id, name, age) values (4, 'Dimitry', 2018);
insert into account (id, name, age) values (5, 'Gunilla', 2009);
insert into account (id, name, age) values (6, 'Juan', 2005);
insert into account (id, name, age) values (7, 'Ephrayim', 2013);
insert into account (id, name, age) values (8, 'Clarance', 2004);
insert into account (id, name, age) values (9, 'Arel', 2009);
insert into account (id, name, age) values (10, 'Brynna', 2014);


SELECT * from account a 
join department d on a.departmentId = d.departmentId 
;
SELECT * FROM account a 
WHERE a.createDate <2010-12-20
;
SELECT *FROM account a 
join ` position` p on a.positionId = p.positionId 
where p.positionName = "dev"


SELECT a.accountId, a.accountEmail FROM account a 
union
SELECT * FROM ` position` p 

-- Quest 17
-- a lấy các account thuộc nhóm1
-- b lấy các account thuộc nhóm2
SELECT c.* from groupaccount a
join `group` b on a.groupId  = b.groupId 
JOIN account c on a.accountId  = c.accountId 
where b.groupName = "NHOM 1"
UNION 
SELECT c.* from groupaccount a
join `group` b on a.groupId  = b.groupId 
JOIN account c on a.accountId  = c.accountId 
where b.groupName = "NHOM 2"

