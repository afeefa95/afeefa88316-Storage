select * from emp;

-- 1	LIST ALL MANAGER DATA
select * from emp where job='MANAGER';

-- 2	LIST EMP WHO ARE WORKING AS MANAGER OR ANALYST OR CLERK
select * from emp
where job IN ('MANAGER','ANALYST','CLERK');

-- 3	LIST EMP WHO ARE EARNING SAL BETWEEN 3000 AND 5000 (INCLUSIVE OF LIMIT)
select * from emp
where sal between 3000 and 5000;

-- 4	LIST EMP WHO ARE WORKING AS MANAGER OR ANALYST OR CLERK AND EARNING SAL BETWEEN 3000 AND 5000
select * from emp
where job IN ('MANAGER','ANALYST','CLERK') and sal between 3000 and 5000;

-- 5	LIST ALL EMP WHE ARE EARNING COMM
select * from emp
where comm>0;

-- 6	 LIST ALL EMP WHOSE COMM IS NOT NULL
select * from emp
where comm is not null;

-- 7	LIST ALL EMP WHOSE NAME STARTS WITH S
select * from emp
where ename like 's%';

-- 8	LIST ALL EMP WHOSE NAME ENDS WITH R
select * from emp
where ename like '%r';

-- 9	LIST ALL EMP WHOSE NAME CONTAINS A
select * from emp
where ename like '%a%';

-- 10	LIST ALL EMP WHOSE NAME CONTAINS A AS SECOND LETTER
select * from emp
where ename like '_a%';

-- 11	LIST ALL EMP WHOSE NAME STARTS WITH EITHER M OR S
select * from emp
where ename like 'm%' or ename like 's%';

-- 12	LIST ALL EMP WHOSE NAME STARTS BETWEEN A TO M
select * from emp
where ename regexp '^[a-m]';

-- 13	LIST ALL EMP WHOSE NAME CONTAINS _
select * from emp
where ename like '%\_%';

-- 14	LIST ALL EMP WHO ARE WORKING AS MANAGER IN EITHER DEPT 10 OR 20 AND ALL CLERK FOR DEPT3 30
select * from emp
where (job='MANAGER' and deptno IN (10,20))
or (job='CLERK' and deptno IN (30));

-- 15	LIST ENAME, SAL AND BONUS AS 10% OF SALARY
select ename, sal, sal*0.1 as BONUS
from emp;

-- 16	LIST EMP DATA AS PER THE ASCENDING ORDER OF NAME
select * from emp
order by ename;

-- 17	LIST ALL AS PER THEIR SALARY HIGHES TO LOWEST
select * from emp
order by sal desc;

-- 18	LIST EMP AS PER THEIR DEPT, WITH IN DEPT HIGHEST TO LOWESET SAL
select * from emp
order by deptno asc, sal desc;

-- 19	list top 3 highest paid emp
select * from emp
order by sal desc
limit 3;

-- 20	RETURN RANK BASED ON SPECIFED CRITERIA IF TWO EMP HAVE SAME SALARY THEY BOTH GET SAME NUMBER AND NEXT NUMBER WILL BE SKIPPED
select empno, ename, sal, rank() over(order by sal) as 'rank' from emp;

-- 21	RETURN CONSECUTIVE RANKING VALUES BASED ON A SPECIFIED CRITERIA
select empno, ename, sal, dense_rank() over(order by sal) as 'rank' from emp;

-- 22	LIST THE DIFFERNT JOB NAME
select distinct job from emp;

-- 23	LIST TOTAL ORGANIZATION SALARY
select sum(sal) as 'Total_Salary' from emp;

-- 24	LIST DEPTWISE TOTAL SALARY
select sum(sal) as 'Total_Salary', DEPTNO from emp
group by DEPTNO;

-- 25	LIST JOBWISE EMP COUNT.
select count(*) as 'No of employees', job
from emp group by job;

-- 26	LIST ALL EMP WHO HAVE JOINED IN MONTH OF FEB
select empno, ename, hiredate
from emp
where month(hiredate)=2;

-- 27	LIST EMP COUNT   JOINED BETWEEN 1981 AND 1983
select count(*) as "Emp count"
from emp
where year(hiredate) between 1981 and 1983;

-- 28	LIST HOW MANY YEARS OF SERVICE COMPLETED BY EACH EMP ARRANGE BASED ON TENURE HIGHEST TO LOWEST
select empno, ename, sal, timestampdiff(year,hiredate,curdate()) as "Service Years"
from emp order by sal desc;
