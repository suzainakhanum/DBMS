-- STUDENT NAME: suzaina khanum
-- USN: 1RUA24BCA0088
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- 'root@localhost','apples-MacBook-Air.local','8.4.6','2025-09-03 21:12:58'

Create database Tutorial;
use Tutorial;

Create table Students
( Student_ID varchar(20),
Student_name varchar(20),
Email varchar (20),
Gender varchar(10));

DESC Students ;

Alter table Students add ( Marks_1 int , Marks_2 int , Marks_3 int );
DESC Students ;

insert into Students (Student_ID ,Student_name ,Email ,Gender ,Marks_1 ,Marks_2 ,Marks_3)
values(200 ,'Akash bhat', 'harsham@gmail.com' ,'Male' ,89 , 90 ,95 );

insert into Students (Student_ID ,Student_name ,Email ,Gender ,Marks_1 ,Marks_2 ,Marks_3)
values(201 ,'Vedanth C Y', 'vedanthcy@gmail.com' ,'Male' ,90 , 90 ,96 );

insert into Students (Student_ID ,Student_name ,Email ,Gender ,Marks_1 ,Marks_2 ,Marks_3)
values(202 ,'Akshara', 'akshara@gmail.com' ,'Female' ,80 , 85 ,81 );

insert into Students (Student_ID ,Student_name ,Email ,Gender ,Marks_1 ,Marks_2 ,Marks_3)
values(203 ,'Charan M', 'charanm@gmail.com' ,'Male' ,75 , 70 ,82 );

insert into Students (Student_ID ,Student_name ,Email ,Gender ,Marks_1 ,Marks_2 ,Marks_3)
values(204 ,'Pavithra', 'pavithra@gmail.com' ,'Female' ,70 , 32 ,50 );

insert into Students (Student_ID ,Student_name ,Email ,Gender ,Marks_1 ,Marks_2 ,Marks_3)
values(205 ,'Kamali', 'Kamali@gmail.com' ,'Female' ,50 ,32 ,28 );

insert into Students (Student_ID ,Student_name ,Email ,Gender ,Marks_1 ,Marks_2 ,Marks_3)
values(206 ,'Shivaraj', 'shivaraj@gmail.com' ,'Male' ,28 , 30 ,35 );

insert into Students (Student_ID ,Student_name ,Email ,Gender ,Marks_1 ,Marks_2 ,Marks_3)
values(207 ,'Harshith K', 'harshithk@gmail.com' ,'Male' , 40, 28 ,20 );

insert into Students (Student_ID ,Student_name ,Email ,Gender ,Marks_1 ,Marks_2 ,Marks_3)
values(208 ,'Maniesh', 'maniesh@gmail.com' ,'Male' ,90 , 90 ,95 );

insert into Students (Student_ID ,Student_name ,Email ,Gender ,Marks_1 ,Marks_2 ,Marks_3)
values(209 ,'Babu', 'babu@gmail.com' ,'Male' ,85 , 90 ,75 );

Select * from Students;
/*'200','Akash bhat','harsham@gmail.com','Male','89','90','95'
'201','Vedanth C Y','vedanthcy@gmail.com','Male','90','90','96'
'202','Akshara','akshara@gmail.com','Female','80','85','81'
'203','Charan M','charanm@gmail.com','Male','75','70','82'
'204','Pavithra','pavithra@gmail.com','Female','70','32','50'
'205','Kamali','Kamali@gmail.com','Female','50','32','28'
'206','Shivaraj','shivaraj@gmail.com','Male','28','30','35'
'207','Harshith K','harshithk@gmail.com','Male','40','28','20'
'208','Maniesh','maniesh@gmail.com','Male','90','90','95'
'209','Babu','babu@gmail.com','Male','85','90','75'*/


DELETE from Students 
where Student_ID = 108 ;

Select * from Students;
/*'200','Akash bhat','harsham@gmail.com','Male','89','90','95'
'201','Vedanth C Y','vedanthcy@gmail.com','Male','90','90','96'
'202','Akshara','akshara@gmail.com','Female','80','85','81'
'203','Charan M','charanm@gmail.com','Male','75','70','82'
'204','Pavithra','pavithra@gmail.com','Female','70','32','50'
'205','Kamali','Kamali@gmail.com','Female','50','32','28'
'206','Shivaraj','shivaraj@gmail.com','Male','28','30','35'
'207','Harshith K','harshithk@gmail.com','Male','40','28','20'
'208','Maniesh','maniesh@gmail.com','Male','90','90','95'
'209','Babu','babu@gmail.com','Male','85','90','75'*/

alter table Students add(Average int ,Total int ,Result varchar(10));
Select * from Students;

update Students set Average = (Marks_1 + Marks_2 + Marks_3)/3 ;
Select * from Students;

update Students set Total = Marks_1 + Marks_2 + Marks_3 ;
Select * from Students;

update Students set  Result = 'Pass'
where Marks_1 >=35 and Marks_2 >=35 and Marks_3 >=35 ;

update Students set  Result = 'Fail'
where Marks_1 < 35 or Marks_2 < 35 or Marks_3 < 35 ;

Select * from Students;
/*'200','Akash bhat','harsham@gmail.com','Male','89','90','95','91','274','Pass'
'201','Vedanth C Y','vedanthcy@gmail.com','Male','90','90','96','92','276','Pass'
'202','Akshara','akshara@gmail.com','Female','80','85','81','82','246','Pass'
'203','Charan M','charanm@gmail.com','Male','75','70','82','76','227','Pass'
'204','Pavithra','pavithra@gmail.com','Female','70','32','50','51','152','Fail'
'205','Kamali','Kamali@gmail.com','Female','50','32','28','37','110','Fail'
'206','Shivaraj','shivaraj@gmail.com','Male','28','30','35','31','93','Fail'
'207','Harshith K','harshithk@gmail.com','Male','40','28','20','29','88','Fail'
'208','Maniesh','maniesh@gmail.com','Male','90','90','95','92','275','Pass'
'209','Babu','babu@gmail.com','Male','85','90','75','83','250','Pass'*/
