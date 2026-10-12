/* starts a new transaction
begin
or
start transaction  to execute multiple statements as a single transaction, we must explicitly start the transaction.alter
commit - saves all changes made during the transaction 
rollback - undo all changes made during the transaction
savepoint - sets a savepoint within a transaction to rollback to later
rollback to savepoint - rolls to a specific savepoint without affecting earlier changes. */
create database TCL;
use TCL;
create table orders (
order_id int primary key,
customer_name varchar(100),
status varchar(50));
desc orders;

set autocommit =0; /* in mysql auto commit mode is enabled by default which whenever we execute anu sql statement
is automatically commited 
so in such cases succeded transaction are automatically commited. to disabled the auto commit mode we are using this aslso we can 
not disabled the autocommit mode of DDL commands.
in many DBMS it is disabled by default */
begin;
insert into orders values(101, 'geet', 'pending');
insert into orders values(102, 'bob' , 'pending');
update orders set customer_name= "raj" 
where order_id=102;

truncate table orders;
select * from orders;
commit;
rollback;

#step1 - insert a few orders
insert into orders values(103, 'om', 'pending');
insert into orders values(104, 'mob', 'pending');
savepoint spl;
select * from orders;

# step2 - update one order
update orders set customer_name= "akash"
where order_id =103; 
savepoint sp2;
rollback to savepoint sp1;
rollback;

# step 3 - delete another order
delete from orders where order_id =102;
savepoint sp3;

# we want to undo the delete but keep the update
rollback to savepoint sp2;
select * from orders;
rollback;




