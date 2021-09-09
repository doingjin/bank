select * from all_tables;

select * from bank;
drop table test;

create table bank(
	bnum int primary key,
	bname varchar(20),
	name varchar(20),
	balance int not null
);
insert into bank values (1,'kb','ari',10000);
insert into bank values (2,'bs','timo',3000);