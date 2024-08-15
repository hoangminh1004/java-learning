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