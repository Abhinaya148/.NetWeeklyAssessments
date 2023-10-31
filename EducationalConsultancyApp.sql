create database EducationalConsultancyApp;
go
create table Student(Student_Id int primary key not null,
Student_Name varchar(50),Address varchar(50),phone varchar(50),
email varchar(50),Qualification varchar(500));
go

drop table Student;
go

create table University(University_Id int primary key not null,
Name varchar(50),Address varchar(50),State varchar(50),Country varchar(50),
phone varchar(50),email varchar(50));
go

drop table University;
go

create table Course(Course_Id int primary key not null, title varchar(500),
description varchar(500),Fees float,credits float,
University_Id int foreign key references University(University_Id));
go

drop table Course;
go

create table Enrollment(Enrollment_Id int primary key not null,
Course_Id int foreign key references Course(Course_Id),
Student_Id int foreign key references Student(Student_Id),
University_Id int foreign key references University(University_Id),
startdate datetime);
go

drop table Enrollment;
go

CREATE procedure usp_insertStudents(@stdid int, @stdname varchar(50), @stdaddress varchar(100), @stdphone varchar(100), @stdemail varchar(50), @stdqualify varchar(50))
as
begin
insert into Student(Student_Id,Student_Name,Address, phone,email,Qualification) values (@stdid, @stdname, @stdaddress, @stdphone, @stdemail, @stdqualify);
end
go
 
create procedure usp_insertCourses(@courseid int, @cname varchar(50), @cdpn varchar(100), @cfee decimal, @uid int, @credits int)
as
begin
insert into Course(Course_Id, title, description,Fees, University_Id,credits) values (@courseid,@cname, @cdpn,@cfee, @uid, @credits)
end 
go
 
create procedure usp_insertUniversities(@unid int, @uname varchar(100), @uaddress varchar(100), @ustate varchar(100), @ucountry varchar(100), @uphone varchar(50), @uemail varchar(100))
as
begin
insert into University(University_Id, Name, Address, State, Country, phone, email) values (@unid,@uname, @uaddress, @ustate, @ucountry, @uphone, @uemail)
end 
go
 
create procedure usp_insertEnrolments(@enid int, @cid int, @sid int, @uid int, @stdate datetime)
as
begin
insert into Enrollment(Enrollment_Id,Course_Id,Student_Id,University_Id,startdate) values (@enid, @cid, @sid, @uid, @stdate)
end
go
 
CREATE procedure usp_UpdateStudents(@stdid int,@stdemail varchar(50), @stdname varchar(50), @stdaddress varchar(100), @stdqualifi varchar(50))
as
begin
update Student
set Student_Name = @stdname, email = @stdemail, Address = @stdaddress, Qualification = @stdqualify
where Student_Id = @stdid
end
go
 
  CREATE procedure usp_UpdateCourses(@cuid int, @ctitle varchar(100), @cfee decimal, @ccredits int)
as
begin
update Course
set title= @ctitle, Fees= @cfee, credits=@ccredits
where Course_Id = @cuid
end
go
 
   CREATE procedure usp_UpdateUniversities(@uuid int,@uname varchar(100), @uaddress varchar(100), @uphone varchar(50) )
as
begin
update University
set Name= @uname, Address= @uaddress, phone= @uphone
where University_Id = @uuid
end
go
 
   CREATE procedure usp_UpdateEnrolments(@euid int, @udate datetime)
as
begin
update Enrollment
set startdate = @udate
where Enrollment_Id = @euid
end
go
 
 
create procedure usp_deleteStudents(@stdid int)
as
begin
delete from Student
where Student_Id = @stdid
end
go
 
create procedure usp_deleteCourse(@cdit int)
as
begin
delete from Course
where Course_Id = @cdit
end
go
 
create procedure usp_deleteUniversities(@udit int)
as
begin
delete from University
where University_Id = @udit
end
 