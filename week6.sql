create database disha;
use disha;
create table project(
pno int , 
ploc varchar(30),
pname varchar(30),
primary key(pno)
);
create table dept(
deptno int,
dname varchar(30),
dloc varchar(30),
primary key(deptno)
);
create table employees(
empno int ,
ename varchar(30),
mgr_no int,
hireddate date,
sal int, 
deptno int,
primary key (empno),
foreign key(deptno) references dept(deptno)
 );
create table assigned_to(
empno int, 
pno int,
jobrole varchar(30),
foreign key(pno) references project(pno),
foreign key(empno) references employees(empno)
);
create table incentive(
empno int,
incentivedate date,
incentiveamt int,
primary key(incentivedate),
 foreign key (empno) references employees(empno)
 );
desc project;
desc employees;
desc dept;
desc assigned_to;
desc incentives;
insert into project values(1,'bengaluru','syntax');
insert into project values(2,'gujarat','rolex');
insert into project values(3,'mysuru','hybrid');
insert into project values(4,'hyderabad','hydro');
insert into project values(5,'westbengal','solar');

insert into dept values(10,'sales','bengaluru');
insert into dept values(20,'finance','westbengal');
insert into dept values(30,'marketing','bihar');
insert into dept values(40,'research_and_development','delhi');
insert into dept values(50,'management','hyderabad');

insert into employees values(100,'pranathi',321,'2003-01-01',100000,10);
insert into employees values(101,'pranav',322,'2004-02-07',350000,20);
insert into employees values(102,'pranay',323,'2004-10-13',60000,20);
insert into employees values(103,'prerana',324,'2003-04-11',110000,50);
insert into employees values(104,'priya',325,'2003-08-02',10000,40);
insert into employees values(105,'pratham',326,'2005-11-18',100000,10);
insert into employees values(106,'prem',327,'2003-08-01',100000,30);
insert into employees values(107,'pranitha',328,'2002-07-12',100000,50);
insert into employees values(108,'pramod',329,'2003-01-16',100000,30);
insert into employees values(109,'prakash',3330,'2005-12-31',100000,50);

insert into assigned_to values(100,1,"projectmanager");
insert into assigned_to values(108,4,"projectsupervisor");
insert into assigned_to values(104,3,"financer");
insert into assigned_to values(103,2,"advisor");
insert into assigned_to values(109,5,"projecthead");

insert into incentives values(105,'2005-11-18',6000);
insert into incentives values(100,'2003-01-01',5000);
insert into incentives values(107,'2002-07-12',3500);
insert into incentives values(103,'2003-04-11',5900);
insert into incentives values(108,'2003-01-16',4200);

select * from project;
select * from dept;
select * from employees;
select * from incentives;
select * from assigned_to;

select a.empno employee_number
 from project p,assigned_to a 
 where p.pno=a.pno and p.ploc in ('hyderabad','bengaluru','mysuru');

select e.empno
 from employees e
 where e.empno NOT IN (select i.empno from incentives i);

select e.ename emp_name,e.empno emp_number,d.dname dept, a.jobrole job_role,d.dloc dept_location,p.ploc project_location
 from project p,dept d,employees e,assigned_to a
 where e.empno=a.empno and p.pno=a.pno and e.deptno=d.deptno and p.ploc=d.dloc;
 
 select e.ename, p.pname,p.ploc,p.pno
 from employees e, project p, assigned_to a
 where e.empno=a.empno and p.pno=a.pno;
 
 select e.ename, sum(incentiveamt) as totalamount
 from employees e, incentives i
 where e.empno=i.empno
 group by ename;
 
 select p.pname,p.ploc
 from project p, assigned_to a
 where p.pno=a.pno and a.jobrole="projectmanager";
 
 select d.dname, count(empno) as totalemployee
 from dept d, employees e
 where d.deptno=e.deptno 
 group by e.deptno;
 
 select e.ename
 from employees e
 where not exists(select 1
 from assigned_to a 
 where e.empno=a.empno);
 
 select e.ename, d.dname, d.dloc
 from employees e, dept d 
 where d.deptno=e.deptno;
 
 select e.ename
 from employees e, assigned_to a
 where e.empno=a.empno and e.empno=104;
 
 select p.pname, count(a.empno) as totalemployee
 from project p, assigned_to a 
 where p.pno=a.pno
 group by p.pname;

select e.ename, count(i.empno) as numberofincentive , sum(i.incentiveamt)
from incentive i, employees e
where e.empno=i.empno
group by e.empno;

select e.ename 
from employees e, assigned_to a 
where e.empno=a.empno and jobrole="projecthead";

select d.dname, avg(e.sal)
from dept d, employees e 
where d.deptno=e.deptno 
group by d.dname;
