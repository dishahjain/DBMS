create database disha;
use disha;
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
create table OWNS(
driver_id varchar(20),
reg_num varchar(20),
primary key(driver_id,reg_num),
foreign key(driver_id) references PERSON(driver_id),
foreign key (reg_num) references CAR(reg_num)
);
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
insert into PERSON values("A01","Richard","Srinivasa nagar");
insert into PERSON values("A02","Pradeep","Rajaji nagar");
insert into PERSON values("A03","Smith","Ashok nagar");
insert into PERSON values("A04","Venu","NR Colony");
insert into PERSON values("A05","John","Hanumanth nagar");
insert into CAR values("KA052250","Indica",1990);
insert into CAR values("KA031181","Lancer",1957);
insert into CAR values("KA095477","Toyota",1998);
insert into CAR values("KA053408","Honda",2008);
insert into CAR values("KA041702","Audi",2005);
insert into ACCIDENT values(11,"01-01-03","Mysore Road");
insert into ACCIDENT values(12,"02-02-04","South end Circle");
insert into ACCIDENT values(13,"21-01-03","Bull temple Road");
insert into ACCIDENT values(14,"17-02-08","Mysore Road");
insert into ACCIDENT values(15,"04-03-05","Kanakpura Road");
insert into OWNS values("A01","KA052250");
insert into OWNS values("A02","KA053408");
insert into OWNS values("A03","KA031181");
insert into OWNS values("A04","KA095477");
insert into OWNS values("A05","KA041702");
insert into PARTICIPATED values("A01","KA052250",11,10000);
insert into PARTICIPATED values("A02","KA053408",12,50000);
insert into PARTICIPATED values("A03","KA095477",13,25000);
insert into PARTICIPATED values("A04","KA031181",14,3000);
insert into PARTICIPATED values("A05","KA041702",15,5000);
select * from PERSON; 
select * from CAR;
select * from ACCIDENT;
select * from OWNS;
select * from PARTICIPATED;

insert into ACCIDENT values(16,"15-03-08","Domlur");
select * from ACCIDENT;
select accident_date date,location
from ACCIDENT;
select driver_id
from PARTICIPATED
where damage_amt>=25000;



