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

