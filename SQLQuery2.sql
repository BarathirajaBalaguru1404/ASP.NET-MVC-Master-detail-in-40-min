create database db_school

use db_school

create table tbl_std(Role_no int identity(1,1) primary key,
Std_name varchar(40),
Std_class varchar(40),
Std_sec varchar(40))


 alter table tbl_std add Gender varchar(40)

 alter table tbl_std add  Active bit

 select * from tbl_std
 
 select *  from tbl_mark

create table tbl_mark(Id int identity(1,1) primary key ,
Mark1 int,
Mark2 int,
Mark3 int,
Mark4 int,
Mark5 int,
tot int,
Std_id int)




select * from tbl_mark 

SELECT * FROM tbl_mark WHERE tot=(select max(tot) from tbl_mark)

SELECT * FROM tbl_mark t
join tbl_std s on (s.Role_no=t.Std_id)
 ORDER BY tot desc

 create table tbl_user(IdUser int identity(1,1) primary key,
Firstname varchar(40),
Lastname varchar(40),
Gender varchar(40),
Phoneno varchar(40),
Email varchar(40),
 Password varchar(40),
 Country varchar(40),
 State varchar(40),
 City varchar(40),
 Address varchar(40))


 select * from tbl_user



 SELECT * FROM tbl_mark t
join tbl_std s on (s.Role_no=t.Std_id)
 ORDER BY tot desc

  SELECT mark1,mark2,mark3,mark4,mark5,tot,  DENSE_RANK() OVER
    ( ORDER BY tot DESC) AS Ranks FROM tbl_mark t
join tbl_std s on (s.Role_no=t.Std_id)
 ORDER BY tot desc
 

 select mark1,mark2,mark3,mark4,mark5,tot,
  RANK() OVER (ORDER BY tot DESC) AS DenseRank from tbl_mark  t join 
  tbl_std s   on (s.Role_no=t.Std_id)  ORDER BY tot desc

 select * from tbl_mark
select * from tbl_std

SELECT tot, 
RANK () OVER (
ORDER BY tot
) AS Rank_no 
FROM tbl_mark;
