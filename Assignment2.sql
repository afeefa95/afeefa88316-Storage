-- 1	 Display all the information of the EMP table?
select * from emp;
db.emp.find().pretty()

-- 2	 Display unique Jobs from EMP table?
select distinct job from emp;
db.emp.distinct("JOB")

-- 3	 List the emps in the asc order of their Salaries?
select * from emp order by sal;
db.emp.find().sort({
	SAL : 1
}).pretty()

-- 4	 List the details of the emps in asc order of the Dptnos and desc of Jobs?
select * from emp order by deptno, job desc;
db.emp.find().sort({
	DEPTNO : 1,
    JOB : -1
}).pretty()

-- 5	 Display all the unique job groups in the descending order?
select distinct job from emp order by job;
db.emp.aggregate( [
{
	$group : { _id : "$JOB" } 
}, 
{ 
	$sort : { _id : 1 } 
} 
] )

-- 6	 Display all the details of all ‘Mgrs’
select * from emp where job = 'MANAGER';
db.emp.find({
	JOB : "MANAGER"
}).pretty()

-- 7	 List the emps who joined before 1981
select * from emp where  year(hiredate) < 1981;
db.emp.find({
	HIREDATE : {
					$lt:ISODate("1981-01-01")
}).pretty()

-- 8	 List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal
-- assuming sal as daily salary
select empno, ename, sal, sal div 5 as Daily_sal, (sal*12) as Ann_Sal from emp order by Ann_Sal;
db.emp.aggregate([
{
$project : {
				EMPNO : 1,
				ENAME : 1,
				SAL : 1,
                DAILYSAL : {
						$divide : [ "$SAL", 30 ]
                },
				ANNSAL : {
						$multiply : [ "$SAL", 12 ]
				}
}}
])

-- 9	 Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
select empno, ename, job, hiredate, timestampdiff(year,hiredate,curdate()) as Exp_in_years from emp where job = 'Manager';
db.emp.aggregate([
{
$match : {
	JOB : "MANAGER"
}
},
{
$project : {
				EMPNO : 1,
				ENAME : 1,
				JOB : 1,
                HIREDATE : 1,
                EXP : {
					$subtract: [DATE(), "$HIREDATE"]
                }
}}
])

-- 10	 List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369
select empno, ename, sal, timestampdiff(year,hiredate,curdate()) as Exp_in_years
from emp where mgr = 7698;

-- 11	 Display all the details of the emps whose Comm  Is more than their Sal
select * from emp where comm > sal;

-- 13	 List the emps along with their Exp and Daily Sal is more than Rs 100
select * from (select empno, ename, job, sal, comm, sal div 5 as Daily_sal, timestampdiff(year,hiredate,curdate()) as Exp_in_years
from emp) e where e.Daily_sal > 100;

-- 14	 List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
select * from emp where job in ('CLERK','ANALYST') order by empno desc;

-- 15	 List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority
-- assuming more salary as more seniority
select * from emp where hiredate in 
(str_to_date('1981-05-01','%Y-%m-%d'),
str_to_date('1981-12-03','%Y-%m-%d'),
str_to_date('1981-12-17','%Y-%m-%d'),
str_to_date('1980-01-19','%Y-%m-%d')) 
order by sal;

-- 16	 List the emp who are working for the Deptno 10 or20
select * from emp where deptno in (10,20);

-- 17	 List the emps who are joined in the year 81
select * from emp where year(hiredate) = 1981;

-- 19	 List the emps Who Annual sal ranging from 22000 and 45000
select empno, ename, sal, Ann_sal from (select empno, ename, sal, (sal*12) as Ann_sal from emp) e where e.Ann_sal between 22000 and 45000;

-- 20	 List the Enames those are having five characters in their Names
select ename from emp where length(ename) = 5;

-- 21	 List the Enames those are starting with ‘S’ and with five characters
select ename from emp where ename like 's%' and  length(ename) = 5;

-- 22	 List the emps those are having four chars and third character must be ‘r’
select ename from emp where length(ename) = 4 and ename regexp '..r.';

-- 23	 List the Five character names starting with ‘A’ and ending with ‘N'
select ename from emp where length(ename) = 5 and ename like 'a%n';

-- 24	 List the emps who joined in January
select * from emp where monthname(hiredate) = 'January';

-- 27	 List the emps whose names having a character set ‘ll’ together
select * from emp where ename like '%ll%';

-- 29	 List the emps who does not belong to Deptno 20
select * from emp where DEPTNO <> 20;

-- 30	 List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries
select * from emp where job not in ('PRESIDENT','MANAGER') order by sal;

-- 31	 List the emps whose Empno not starting with digit 78
select * from emp where empno not like '78%';

-- 33	 List the emps who are working under ‘MGR’
select * from emp where mgr is not null;

-- 34	 List the emps who joined in any year but not belongs to the month of March
select * from emp where monthname(hiredate) <> 'March';

-- 35	 List all the Clerks of Deptno 20
select * from emp where job = 'CLERK' and DEPTNO = 20;

-- 36	 List the emps of Deptno 30 or 10 joined in the year 1981
select * from emp where DEPTNO in (30,10) and year(hiredate) = 1981;

-- 37	 Display the details of SMITH
select * from emp where ename = 'SMITH';

-- 38	 Display the location of SMITH
select e.empno, e.ename, d.loc from emp e inner join dept d where e.deptno=d.deptno and e.ename="SMITH";
