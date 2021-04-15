create database training21;
use training21;
-- Employee empno...->Department 
-- create DDL Data Definition


-- create table dept(
-- deptno int not null , 
-- dname varchar(20) not null,
-- loc varchar(30) not null);


-- 1. drop and create apply key on column
-- drop table dept;
-- create table dept(
-- deptno int not null primary key, 
-- dname varchar(20) not null,
-- loc varchar(30) not null);
-- 1. drop and create apply key on table
-- drop table dept;
-- create table dept(
-- deptno int not null , 
-- dname varchar(20) not null,
-- loc varchar(30) not null,
-- primary key(deptno)
-- );
-- 2. alter table dept 
-- drop table dept;
-- alter table dept 
-- add constraint pk_deptno primary key (deptno);

-- DDL DML Manipulation Insert/Update/Delete
-- create table dept(depno,dname,loc)
-- INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
-- INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
-- INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
-- INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

-- select * from dept;

 CREATE TABLE EMP
(
 EMPNO int NOT NULL ,
 ENAME VARCHAR(20),
  JOB VARCHAR(9),
   MGR int ,
    HIREDATE DATETIME,
    SAL NUmeric(7, 2),
    COMM Numeric(7, 2),
    DEPTNO int 
 );
 

-- empno -> primary key 
-- alter table emp 
-- add constraint pk_emp_empno primary key(empno);
-- deptno -> foreign key
-- alter table emp
-- add foreign key (deptno) references dept(deptno);
	-- MGR ->Foreing key
	-- 7809 mgr 7899 empno pk superset mgr fk subset
-- alter table emp
-- add foreign key (mgr) references emp(empno);

INSERT INTO EMP VALUES   (7839, 'KING',   'PRESIDENT', NULL,    str_to_date('11/17/1981','%m/%d/%Y') , 5000, NULL, null);   
INSERT INTO EMP VALUES   (7566, 'JONES',  'MANAGER',   		7839, str_to_date('04/2/1981'	,'%m/%d/%Y'),  2975, NULL, 20);
INSERT INTO EMP VALUES   (7698, 'BLAKE',  'MANAGER',   		7839, str_to_date('05/01/1981'	,'%m/%d/%Y'),  2850, NULL, 30);
INSERT INTO EMP VALUES   (7782, 'CLARK',  'MANAGER',   		7839, str_to_date('06/09/1981'	,'%m/%d/%Y'),  2450, NULL, 10);
INSERT INTO EMP VALUES   (7999, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/01/2011'  ,'%m/%d/%Y'), 4000, NULL, 10);
INSERT INTO EMP VALUES   (7788, 'SCOTT',  'ANALYST',   		7566, str_to_date('12/09/1982'  ,'%m/%d/%Y'), 3000, NULL, 20);
INSERT INTO EMP VALUES   (7902, 'FORD',   'ANALYST',   		7566, str_to_date('12/03/1981'  ,'%m/%d/%Y'),  3000, NULL, 20);
INSERT INTO EMP VALUES   (7499, 'ALLEN',  'SALESMAN',  		7698, str_to_date('02/20/1981'  ,'%m/%d/%Y'), 1600,  300, 30);
INSERT INTO EMP VALUES   (7521, 'WARD',   'SALESMAN',  		7698, str_to_date('02/22/1981'  ,'%m/%d/%Y'), 1250,  500, 30);
INSERT INTO EMP VALUES   (7654, 'MARTIN', 'SALESMAN',  		7698, str_to_date('09/28/1981'  ,'%m/%d/%Y'), 1250, 1400, 30);
INSERT INTO EMP VALUES   (7844, 'TURNER', 'SALESMAN',  		7698, str_to_date('09/08/1981'  ,'%m/%d/%Y'),  1500,    0, 30);
INSERT INTO EMP VALUES   (7900, 'JAMES',  'CLERK',			7698, str_to_date('12/03/1981'  ,'%m/%d/%Y'),   950, NULL, 30);
INSERT INTO EMP VALUES   (7369, 'SMITH',  'CLERK',			7902, str_to_date('12/17/1980'  ,'%m/%d/%Y'), 800, NULL, 20);
INSERT INTO EMP VALUES   (7876, 'ADAMS',  'CLERK',			7788, str_to_date('01/12/2003'  ,'%m/%d/%Y'), 1100, NULL, 20);
INSERT INTO EMP VALUES   (7934, 'MILLER', 'CLERK',			7782, str_to_date('01/23/2002'  ,'%m/%d/%Y'), 1300, NULL, 10);
INSERT INTO EMP VALUES   (7901, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/23/2012'  ,'%m/%d/%Y'), 3000, NULL, 10);