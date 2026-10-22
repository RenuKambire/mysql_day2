create database college_M;
use college_M;

create table student(
stud_id int primary key,
First_name varchar(20),
Last_name varchar(40));
desc student;

create table teacher(
teach_id int primary key,
First_name varchar (30),
Last_name varchar (60),
Age int);

insert into teacher(teach_id, First_name, Last_name,Age) values(101, " ashwini", "shirke",30);
insert into teacher(teach_id, First_name, Last_name,Age) values(102, " sharma", "jadhav",32);
insert into teacher(teach_id, First_name, Last_name,Age) values(103, " sonal", "shinde",33);
insert into teacher(teach_id, First_name, Last_name,Age) values(104, " megha", "jadhav",40);

insert into student(stud_id,First_name,Last_name) values(1, "renu", "kambire");
insert into student(stud_id,First_name,Last_name) values(2, "aditi", "jadhav");
insert into student(stud_id,First_name,Last_name) values(3, "tushar", "kale");
insert into student(stud_id,First_name,Last_name) values(4, "pranav", "jadhav");

update student set Last_name = "shinde" where stud_id = 4;
alter table student add column age int;
alter table student modify First_name varchar(40);
alter table student drop primary key;
alter table teacher add column stud_id int; 
alter table teacher add constraint fk_stud foreign key(stud_id) references student(stud_id);
alter table teacher add constraint ch_age check (age >= 30);
alter table teacher drop constraint ch_age;
desc teacher;
desc student;
show create table student;
show create table teacher;
show index from teacher;
show index from student;

select * from student;
select * from teacher;

select * from teacher order by First_name;
select * from student order by Stud_id, Last_name;

select upper(First_name), lower(Last_name) from teacher;
select upper(First_name), lower(Last_name) from teacher
where teach_id = '104';

select concat(First_name,' ',Last_name) from student;
select concat(First_name,' ',Last_name) as fullname from student;

select * from teacher;
select substr(last_name,'2') as position from student;
select instr(First_name, 'r') from student;




















