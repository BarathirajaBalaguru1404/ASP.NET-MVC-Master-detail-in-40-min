create database db_today

use db_today

create table tbl_emp(Id int,Name varchar(30),Gender varchar(20),Age int,Salary money)

Select * from tbl_emp

alter table tbl_emp add address varchar(30)

alter table tbl_emp alter column Address varchar(60)

insert into tbl_emp values(101,'Raja','Male',25,5000)
insert into tbl_emp values(102,'Raja','Male',22,25000)
insert into tbl_emp values(103,'Raa','FeMale',20,4000)


select Name,Age from tbl_emp

update tbl_emp set Name='Ajith' ,Gender='Male',Age=22,Salary=8000 where Id=101

Delete from tbl_emp where id=101

drop table tbl_emp

truncate table tbl_emp

select * from tbl_emp

select * from tbl_emp where Gender='Male'

select * from tbl_emp where age>=25


create table p1(Id int primary key,Name varchar(30),Salary money)

insert into p1 values(1,'Ajith',5000)


select * from p1


create table c1(Mobileno bigint,Address varchar(30),Id int foreign key references p1(Id) on update cascade  on delete cascade)

insert into c1 values(9863257410,'cbe',1)
insert into c1 values(98654584,'chennai',2)
insert into c1 values(8526931,'nagai',1)

select * from p1
select * from c1

insert into c1  values(4941564987,'karur',6)

update p1 set Id=10 where Id=1

delete from p1 where id=10

create table test1(sno int unique,Location varchar(40) unique)

insert into test1 values(501,'cbe')
insert into test1 values(501,'jk')

insert into test1 values(502,'Nagai')
insert into test1 values(null,null)
select * from test1

create table tbl_not(id int not null,name varchar(20)not null)

insert into tbl_not values(501,'cbe')
insert into tbl_not values(501,'jk')
insert into tbl_not values(not null,not null)

select * from tbl_not

create table tbl_check(Id int,salary money check(Salary>=4000))
insert into tbl_check values(601,5000)
insert into tbl_check values(601,4000)
insert into tbl_check values(601,2000)

select * from tbl_check

truncate table tbl_check


Create table tbl_Employee(Id int,Name varchar(40),Gender varchar(30),Dept varchar(30),Salary money)

Select * from tbl_Employee

Alter table tbl_Employee Add Age int

select * from tbl_Employee where Gender='Male' AND Age=25

select * from tbl_Employee where Dept='IT' AND Gender='male'

select * from tbl_Employee where Dept='Mech' OR Age=30

select * from tbl_Employee where NOT Gender='Female'

select * from tbl_Employee where Name LIKE'A%'

select * from tbl_Employee where Age LIKE'2_'

select MIN(Age)from tbl_Employee

Select MIN(Salary)from tbl_Employee

Select MAX(Salary)from tbl_Employee

Select COUNT(*)from tbl_Employee where Dept='IT'

select SUM(salary)from tbl_Employee

select AVG(Salary)from tbl_Employee

select * from tbl_Employee ORDER BY Name

Select top 3 * from tbl_Employee ORDER BY Salary DESC

Select AVG(Age) as AGE,Dept from tbl_Employee GROUP BY Dept ORDER BY AVG(Age) DESC

Select Dept,AVG(Salary)As Avg_Salary from tbl_Employee GROUP BY Dept HAVING AVG(Salary)>10000

Create Function Fn_add_five(@num int)
Returns int
As
Begin
Return (@num +5)
End

Select dbo.Fn_add_five(15)

Create Function Select_Gender(@Gender as Varchar(30))
Returns Table
As
Return(Select * from tbl_Employee where Gender=@Gender)

Select * from dbo.Select_Gender('Female')

//****Joins*************//
Create Table Tbl_Student(Sid int,Sname Varchar(30),Smailid varchar(40),Courseid int)

Create Table Tbl_Course(Courseid int,Cname varchar(40),Cfee money)

Select * from Tbl_Student
Select * from Tbl_Course

select * from Tbl_Student s inner join Tbl_Course c on s.Courseid=c.Courseid

select * from Tbl_Student s left outer join Tbl_Course c on s.Courseid=c.Courseid

Select * From Tbl_Student S Right Outer Join Tbl_Course C on S.Courseid=C.Courseid

Select * from Tbl_Student S Full Outer Join Tbl_Course C on S.Courseid=C.Courseid

Select * from Tbl_Student Cross Join Tbl_Course

drop table tbl_student

use db_today

Create Table Tbl_Student(Id int,Name Varchar(40),Address Varchar(40),Gender varchar(40),Date_of_Birth varchar(40),Password varchar(40))

select * from Tbl_Student

drop table tbl_emp



create table tbl_emp(Id int,Name varchar(40),Email varchar(40))

create proc sp_submit
(@Id int,@Name varchar(40),@Email varchar(40))
As
Begin
insert into tbl_emp values(@id,@Name,@Email)
End



create Proc sp_Submit
(@Id int,@Name Varchar(40),@Address varchar(40),@Gender varchar(40),@Date_of_Birth varchar(40),@Password varchar(40))
As
Begin
insert into Tbl_Student values(@Id,@Name,@Address,@Gender,@Date_of_Birth,@Password)
End

Create proc sp_update
(@Id int,@Name Varchar(40),@Address varchar(40),@Gender varchar(40),@Date_of_Birth varchar(40),@Password varchar(40))
As
Begin
Update Tbl_Student set Name=@Name,Address=@Address,Gender=@Gender,Date_of_Birth=@Date_of_Birth where Id=@Id
End

Create proc sp_delete
(@id int)
As
Begin
Delete From Tbl_Student where Id=@id
end

Create proc sp_view
As
Begin
Select * From Tbl_Student
End

Sp_helptext sp_update


create table Tbl_Register(Id int,Name varchar(40),Password varchar(40),Country varchar(40),Dob varchar(40),Gender varchar(40),Email varchar(40))

Select * from Tbl_Register

create proc sp_insert
(@Id int,@Name varchar(40),@Password varchar(40),@Country varchar(40),@Dob varchar(40),@Gender varchar(40),@Email varchar(40))
As
Begin
Insert into Tbl_Register values(@Id,@Name,@Password,@Country,@Dob,@Gender,@Email)
End

sp_helptext sp_insert


create database db_trigger
use db_trigger

create table tbl_emp(EmpId int Primary key,EmpName varchar(40)Not NUll,Age int)

create table tbl_Emp_Log(EmpId int,Action varchar(40),Atime datetime)

select * from tbl_emp
select * from tbl_Emp_Log

--Insert---
Create Trigger Emp_Trigger_Insert on tbl_Emp
After Insert
As
Begin
Insert into Tbl_Emp_Log select EmpId,'Inserted',GETDATE() from inserted
End

insert into Tbl_Emp values(1001,'raja',25)

insert into Tbl_Emp values(1002,'Chandru',26)
--Update--
create trigger empt_trigger_update on tbl_emp
after update
as
begin
insert into tbl_emp_log select empid,'Updated',GETDATE() from inserted
end

update tbl_emp set empname='bharath' where empid=1001

--Delete--
Create trigger Emp_Trigger_Del on Tbl_emp
After Delete
As
Begin
insert into tbl_emp_log select Empid,'Deleted',GETDATE() from deleted
End


delete from tbl_emp  where empid=1001

--Disable--
Disable trigger Emp_trigger_insert on tbl_emp

insert into Tbl_Emp values(1003,'raj',25)

--Enable--

Enable trigger emp_trigger_insert on tbl_emp 

insert into Tbl_Emp values(1005,'ajith',25)
