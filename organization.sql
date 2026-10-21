create database organization;
use organization;
create table employee(
empid int not null primary key,
first_name varchar(15),
last_name varchar(15),
gender char,
role varchar(10),
dept varchar(12),
manger_id varchar(10));

alter table employee
modify role varchar(20);

insert into employee values(1, 'renu', 'kambire', 'F', 'team leader', 'retail', 'M11');
insert into employee values(2, 'sonal', 'shinde', 'F', 'HR', 'Finance', 'M12');
insert into employee values(3, 'manali', 'barge', 'F', 'subleader', 'Finance', 'M13');
insert into employee values(4, 'akash', 'kambire', 'M', 'president', 'retail', 'M14');
insert into employee values(5, 'amit', 'shinde', 'M', 'team leadre', 'retail', 'M15');

select * from employee;
# slect distinct keyboard
select distinct dept from employee order by dept; # it shows the alphabetical order and remove the duplicate names from column
select distinct role from employee order by role;

# AND operator this operator is a logical operator that combines two or more boolean expressions
# and return 1, 0, or null, the and operator is used for filtering data with the where clause.

select * from employee where role = 'President' and dept = 'HR';
select * from employee where role = 'president' and dept = 'retail';

# OR operator: the OR operator is a logical operator that combines two boolean expressions
# and return (true) 1 if either of the expressions is true
# the OR operator is used for filtering data with where clause

select * from employee where role = 'Manager' or role = 'team leader';

# IN operator

select * from employee where role in ('President','Manager');
select * from employee where role in ('TM', 'CEO');

#NOT IN: the not in operator is formed is a logical opeator that determines whether a value belongs in range
# the between operator returns null if the value low or high is null

alter table employee add column Experience int;
select * from employee;

update employee set Experience = 8 where empid = 1;
update employee set Experience = 5 where empid = 2;
update employee set Experience = 10 where empid = 3;
update employee set Experience = 4 where empid = 4;
update employee set Experience = 7 where empid = 5;

select * from employee;
select * from employee where Experience between 6 and 10;
select * from employee where Experience = 5 or Experience = 10;

# Like operator: The LIKE operator is a logical operator that determines whether 
# or not a string contains a specific pattern

select * from employee where last_name like 'A%';

# Limit Operator: the Limit clause in the select statement is used to limit the 
# number of rows returnered
select * from employee;
select * from employee order by Experience limit 5;
select * from employee order by Experience limit 3;

# IS NULL: the is null operator determines whether or not a value is null, the expereince returns
# 1(true) if the value is NULL

insert into employee values();

desc employee;
/* Aggregate function */
# count, SUM, AVG, MIN, MAX */
select count(*) from employee;
select count(empid) from employee where dept = 'Finance';
select min(Experience) from employee;
select max(Experience) from employee;
select sum(Experience) from employee;
select Avg(Experience) as emp_exr from employee;

/*group by clause - group by clause divides a set of rows into subgroups depending on column
or expression values
the group by clause is used with aggregate function such as 
sum, avg, max, min, and count */

# find the Dept wise employee count
select dept,count(*) as employee_count
from employee group by dept;

# find the gender wise employee count
select role,count(*) as employee_count
from employee group by role;

select gender,count(*) as employee_count
from employee group by gender;

#having clause each group producer by the group by clause is 
# evaluate by the having clause and if the result is true, the row is included in the result set
# the having clause is added to sql because the WHERE keyboard cannot be used with aggreagate fucntion

select * from employee;
select dept, sum(Experience) as total_experience
from employee group by dept
Having total_experience >= 10 and total_experience <=20;

select role, sum(Experience) as total_experience
from employee group by role
Having total_experience >= 10 and total_experience <=20;

# fetch Department wise employee count using having clause and sort the data

select Dept, count(empid)
from employee 
group by dept
having count(empid) > 2
order by count(empid);

select dept, sum(Experience) as total_experience from employee group by dept
having total_experience >= 10 or total_experience <= 30;




 