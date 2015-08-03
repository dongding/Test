select TRAINING_PROGRAM from APPLICATIONS where EMP_NAME = 'Amy' and STATUS in ('submitted','resubmitted','approved') 

 select * from employee where EMP_NAME='Amy'; 
use hl;
#CREATE APPLICATION FORM:
drop table if exists APPLICATIONS;
CREATE TABLE APPLICATIONS(
DATA_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
EMP_ID VARCHAR(30),
EMP_NAME VARCHAR(30),
APPROVER VARCHAR(30),
CC VARCHAR(30),
TRAINING_PROGRAM VARCHAR(200),
TOTAL_COST VARCHAR(20),
COMPANY_COVER VARCHAR(20),
TRAINING_PERIOD_FROM VARCHAR(30),
TRAINING_PERIOD_TO VARCHAR(30),
SET_PERIOD VARCHAR(20),
SERVICE_PERIOD_FROM VARCHAR(30),
SERVICE_PERIOD_TO VARCHAR(30),
REASON VARCHAR(600),
CREATE_DATE VARCHAR(50),
CREATE_BY VARCHAR(30),
UPDATE_DATE VARCHAR(50),
UPDATE_BY VARCHAR(30),
STATUS VARCHAR(30));
delete from APPLICATIONS;
insert into APPLICATIONS (emp_id,emp_name,approver,cc,TRAINING_PROGRAM,TOTAL_COST,COMPANY_COVER,
TRAINING_PERIOD_FROM,TRAINING_PERIOD_TO,SET_PERIOD,SERVICE_PERIOD_FROM,SERVICE_PERIOD_TO,
REASON,CREATE_DATE,CREATE_BY,UPDATE_DATE,UPDATE_BY,STATUS) values('1001','Amy','Cindy','Bob','Java','10000','5000','2014-01-05','2014-05-10','6',
'2015-01-01','2015-07-01','I like it',null,null,null,null,'submited');
select *from applications;


#DROP TABLE EMPLOYEE;

#SELECT * FROM EMPLOYEE;

#CREATE EMPLOYEE FORM:
Drop table  IF EXISTS EMPLOYEE;
CREATE TABLE EMPLOYEE(
ID INTEGER AUTO_INCREMENT PRIMARY KEY,
EMP_ID VARCHAR(20),
EMP_NAME VARCHAR(30),
EMAIL VARCHAR(100),
AUTHORITY VARCHAR(30));
delete from EMPLOYEE;
insert into EMPLOYEE (emp_id,emp_name,email,authority)
values(1001,'Amy','Amy@163.com','employee');
insert into EMPLOYEE (emp_id,emp_name,email,authority)
values(1002,'Bob','Bob@163.com','employee');
insert into EMPLOYEE (emp_id,emp_name,email,authority)
values(1003,'Cindy','Cindy@163.com','approver');
insert into EMPLOYEE (emp_id,emp_name,email,authority)
values(1004,'Dabby','Dabby@163.com','admin');
insert into EMPLOYEE (emp_id,emp_name,email,authority)
values(1005,'Eve','Eve@163.com','admin');

select *from employee;

#Create table program;
Drop table Program IF EXISTS Program;
CREATE TABLE Program(
TpId INTEGER AUTO_INCREMENT PRIMARY KEY,
programName varchar(100)
);
delete from Program;
insert into Program (programName)values('C++');
insert into Program (programName)values('JAVA');
insert into Program (programName)values('PHP');
insert into Program (programName)values('Net');
select *from Program;


Create table traffic(
DATA_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
EMP_ID VARCHAR(30),
EMP_NAME VARCHAR(30),
APPROVER VARCHAR(30),
CC VARCHAR(30),
ITEM_NAME VARCHAR(200),
FROM_PLACE VARCHAR(50),
TO_PLACE VARCHAR(50),
TOTAL_COST VARCHAR(20),
COMPANY_COVER VARCHAR(20),
ITEM_DATE VARCHAR(50),
STATUS VARCHAR(30));
select * from traffic;