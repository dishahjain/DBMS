create database dharu_90;
use dharu_90;
create table BRANCH(
branchname varchar(20),
branchcity varchar(20),
assets float,
primary key (branchname)
);
desc BRANCH;

create table BANKACCOUNT(
accno int,
branchname varchar(20),
balance float,
primary key(accno),
foreign key (branchname) references BRANCH (branchname)
);
desc BANKACCOUNT;

create table BANKCUSTOMER(
customername varchar(20),
customerstreet varchar(20),
city varchar(20),
primary key(customername)
);
desc BANKCUSTOMER;

create table DEPOSITER(
customername varchar(20),
accno int,
primary key(customername,accno),
foreign key (customername) references BANKCUSTOMER (customername),
foreign key (accno) references BANKACCOUNT (accno)
);
desc DEPOSITER;

create table LOAN(
loannumber int,
branchname varchar(20),
amount float,
primary key(loannumber),
foreign key (branchname) references BRANCH (branchname)
);
desc LOAN;

insert into BRANCH values("SBI_Chamrajpet","Bangalore",50000);
insert into BRANCH values("SBI_ResidencyRoad","Bangalore",10000);
insert into BRANCH values("SBI_ShivajiRoad","Bombay",20000);
insert into BRANCH values("SBI_ParlimentRoad","Delhi",10000);
insert into BRANCH values("SBI_Jantarmantar","Delhi",20000);
select * from BRANCH;

insert into BANKACCOUNT values(1,"SBI_Chamrajpet",2000);
insert into BANKACCOUNT values(2,"SBI_ResidencyRoad",5000);
insert into BANKACCOUNT values(3,"SBI_ShivajiRoad",6000);
insert into BANKACCOUNT values(4,"SBI_ParlimentRoad",9000);
insert into BANKACCOUNT values(5,"SBI_Jantarmantar",8000);
insert into BANKACCOUNT values(6,"SBI_ShivajiRoad",4000);
insert into BANKACCOUNT values(8,"SBI_ResidencyRoad",4000);
insert into BANKACCOUNT values(9,"SBI_ParlimentRoad",3000);
insert into BANKACCOUNT values(10,"SBI_ResidencyRoad",5000);
insert into BANKACCOUNT values(11,"SBI_Jantarmantar",2000);
select * from BANKACCOUNT;

insert into BANKCUSTOMER values("Avinash","Bull_Temple_Road","Bangalore");
insert into BANKCUSTOMER values("Dinesh","Bannergatta_Road","Bangalore");
insert into BANKCUSTOMER values("Mohan","NationalCollege_Road","Bangalore");
insert into BANKCUSTOMER values("Nikhil","Akbar_Road","Delhi");
insert into BANKCUSTOMER values("Ravi","Prithviraj_Road","Delhi");
select * from BANKCUSTOMER;

insert into DEPOSITER values("Avinash",1);
insert into DEPOSITER values("Dinesh",2);
insert into DEPOSITER values("Nikhil",4);
insert into DEPOSITER values("Ravi",5);
insert into DEPOSITER values("Avinash",8);
insert into DEPOSITER values("Nikhil",9); 
insert into DEPOSITER values("Dinesh",10); 
insert into DEPOSITER values("Nikhil",11); 
select * from DEPOSITER;

insert into LOAN values(1,"SBI_Chamrajpet",1000);
insert into LOAN values(2,"SBI_ResidencyRoad",2000);
insert into LOAN values(3,"SBI_ShivajiRoad",3000);
insert into LOAN values(4,"SBI_ParlimentRoad",4000);
insert into LOAN values(5,"SBI_Jantarmantar",5000);
select * from LOAN;

select branchname, assets/100000 as "Assetsinlakhs"
from BRANCH;

select d.customername
from DEPOSITER d,  BANKACCOUNT b
where b.branchname='SBI_ResidencyRoad' 
and d.accno=b.accno
group by d.customername
having count(b.accno)>=2;





