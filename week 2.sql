create database dharu_90;
use dharu_90;
create table PERSON(
driver_id varchar(20),
name varchar(20),
address varchar(20),
primary key(driver_id)
);
desc PERSON;
create table CAR(
reg_num varchar(20),
model varchar(20),
year int,
primary key(reg_num)
);
desc CAR;
create table ACCIDENT(
report_num int,
accident_date date,location varchar(20),
primary key(report_num)
);
desc ACCIDENT;
create table OWNS(
driver_id varchar(20),
reg_num varchar(20),
primary key(driver_id,reg_num),
foreign key(driver_id) references PERSON(driver_id),
foreign key (reg_num) references CAR(reg_num)
);
desc OWNS;
create table PARTICIPATED(
driver_id varchar(20),
reg_num varchar(20),
report_num int,
damage_amt int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references PERSON (driver_id),
foreign key (reg_num) references CAR(reg_num),
foreign key (report_num) references ACCIDENT (report_num)
);
desc PARTICIPATED;
insert into PERSON values("A01","Richard","Srinivasa nagar");
insert into PERSON values("A02","Pradeep","Rajaji nagar");
insert into PERSON values("A03","Smith","Ashok nagar");
insert into PERSON values("A04","Venu","NR Colony");
insert into PERSON values("A05","John","Hanumanth nagar");
select * from PERSON;
insert into CAR values("KA052250","Indica",1990);
insert into CAR values("KA031181","Lancer",1957);
insert into CAR values("KA095477","Toyota",1998);
insert into CAR values("KA053408","Honda",2008);
insert into CAR values("KA041702","Audi",2005);
select * from CAR;
insert into ACCIDENT values(11,"01-01-03","Mysore Road");
insert into ACCIDENT values(12,"02-02-04","South end Circle");
insert into ACCIDENT values(13,"21-01-03","Bull temple Road");
insert into ACCIDENT values(14,"17-02-08","Mysore Road");
insert into ACCIDENT values(15,"04-03-05","Kanakpura Road");
select * from ACCIDENT;
insert into OWNS values("A01","KA052250");
insert into OWNS values("A02","KA053408");
insert into OWNS values("A03","KA031181");
insert into OWNS values("A04","KA095477");
insert into OWNS values("A05","KA041702");
select * from OWNS;
insert into PARTICIPATED values("A01","KA052250",11,10000);
insert into PARTICIPATED values("A02","KA053408",12,50000);
insert into PARTICIPATED values("A03","KA095477",13,25000);
insert into PARTICIPATED values("A04","KA031181",14,3000);
insert into PARTICIPATED values("A05","KA041702",15,5000); 
select * from PARTICIPATED;
update PARTICIPATED
set damage_amt=25000
where reg_num="KA053408" and report_num=12;
select * from PARTICIPATED;
insert into ACCIDENT values(16,"15-03-08","Domlur");
select * from ACCIDENT;
select accident_date date,location
from ACCIDENT;
select driver_id
from PARTICIPATED
where damage_amt>=25000;
select * from participated
order by damage_amt desc;
select avg(damage_amt)
from participated;
select max(damage_amt) from participated;
delete from participated where damage_amt < (select avg (damage_amt) from participated);
select name,damage_amt
from person a, participated b
where a.driver_id = b.driver_id
order by damage_amt desc;
select count(report_num)
from car c, participated p
where c.reg_num = p.reg_num and c.model ='Lancer';
select count(distinct driver_id)
from accident a, participated b
where a.report_num = b.report_num and a.accident_date like '--08%';
select * from car 
order by year asc;