drop database if exists my_learning;
create database if not exists my_learning;
use my_learning;

create table `department` ( 
departmentId smallint unsigned auto_increment primary key,
departmentName char(100)
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

create table `groupaccount` (
groupId int , 
accountId int ,
joiDate tinyint 
);

create table `typequestion`(
typeId int auto_increment primary key ,
typeName varchar(50) 
);

create table `categoryquestion` (
categororyId int auto_increment primary key ,
categoryName varchar(50)
);

create table `question` (
questionId int auto_increment primary key ,
content varchar(255) ,
categoryId int ,
typeId int ,
creatorId int ,
createDate tinyint
);

create table `answer`(
answerId int auto_increment primary key ,
content varchar(255) ,
questionId int ,
iscorrect tinyint
);

create table `exam`(
examId int auto_increment primary key ,
code tinyint ,
title varchar(50) ,
categoryId int ,
duration tinyint ,
creatorId int ,
createDate tinyint
);

create table `examquestion` (
examId int ,
questionId int 
);