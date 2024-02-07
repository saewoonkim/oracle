--1

create user datauser
IDENTIFIED by 0000;

grant UNLIMITED tablespace to datauser;

--2

grant create session to datauser;

--3

grant create table to datauser;

--4

conn datauser/0000;



--7

CREATE table  publicOffice (
  pono number(4),
  poname varchar2(40),
  status varchar2(40),
  admission date,
  sal number(7),
  comm number(7),
  minsno number(7)
  
  
);


--5

create table ministry (
minsno number(2),
miname varchar2(40),
loc varchar2(40)

);

insert into publicOffice VALUES( 
7350, '김세운','통일부장관','2024/01/05', 1100, 300, 10);

insert into publicOffice VALUES(
7352,'김시현','외교부장관','2023/01/02',1200,null,20
);

insert into publicOffice VALUES(
7521,'라수애','교육부장관','2021/03/02',1300,200,30
);

insert into publicOffice VALUES(
7566,'배소희','문화부장관','2023/05/12',1400,null,40
);

insert into publicOffice VALUES(
7654,'장창수','국방부장관','2023/07/24',1200,null,50

);

insert into publicOffice VALUES(

7678,'한지은','법무부장관','2020/11/02',1100,100,60
);


insert into ministry VALUES(
10,'통일부','종로구'
);

insert into ministry VALUES(
20,'외교부','종로구'
);

insert into ministry VALUES(
30,'교육부','갈매로'
);

insert into ministry VALUES(
40,'문체부','갈매로'

);

insert into ministry VALUES(
50,'국방부','용산구'
);

insert into ministry VALUES(
60,'법무부','서초구'
);

select * from publicoffice;

select * from ministry;

--9

alter table ministry modify(minsno not null);

--10

alter table publicOffice modify(minsno not null);

--12

alter table publicOffice add primary key(pono);

--13
alter table ministry add primary key(minsno);

--18

select * from publicOffice, ministry;

--19



