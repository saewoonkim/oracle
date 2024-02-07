DESC EMP;


-- 사원 테이블 
SELECT * FROM EMP;
-- 부서 테이블
SELECT * FROM DEPT;
-- 원하는 열 출력하기.
SELECT EMPNO,ENAME,DEPTNO FROM EMP;
-- 중복 열 제거하기
SELECT DISTINCT DEPTNO FROM EMP;
-- 여러 개 열을 명시하여 중복 제거하기
SELECT DISTINCT JOB,DEPTNO FROM EMP;

-- 열에 연산식 사용하여 출력하기

SELECT ENAME, SAL, SAL*12+COMM, COMM FROM EMP;

-- 별칭 사용하여 연간 총 수입 출력하기

SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM FROM EMP;

-- 오름차순 적용하기

SELECT * FROM EMP ORDER BY SAL;

-- 내림차순 적용하기

SELECT * FROM EMP ORDER BY SAL DESC;

/*Q. 사원번호 기준으로 내림차순 출력하기 */
--사원번호: EMPNO

SELECT * FROM EMP ORDER BY EMPNO DESC;

-- 여러개의 열 정렬하기

SELECT * FROM EMP ORDER BY DEPTNO ASC, SAL DESC;


-- C4 Q2

SELECT DISTINCT JOB FROM EMP;

-- C4 Q3
-- 실행 단축기 : 컨트롤 + 엔터
SELECT EMPNO AS EMPLOYEE_NO, 
       ENAME AS EMPLOYEE_NAME,
       JOB,
       MGR AS MANAGER,
       HIREDATE,
       SAL AS SALARY,
       COMM AS COMMSSION,
       DEPTNO AS DEPARTMENT_NO
FROM EMP
ORDER BY DEPTNO DESC, ENAME;


--Q5 WHERE절

SELECT * FROM EMP WHERE DEPTNO = 30;

-- AND 연산자 
SELECT * FROM EMP WHERE DEPTNO = 30 AND JOB = 'SALESMAN';
-- OR  연산자
SELECT * FROM EMP WHERE DEPTNO = 30 OR JOB = 'CLERK';
-- 산술 연산자
SELECT * FROM EMP WHERE SAL * 12 = 36000;
-- 대소 비교 연산자
SELECT * FROM EMP WHERE SAL >= 3000;

/*Q. SQL문의 결과로 급여가 2500 이상이고 직업이 ANALYST인 사원 정보만 나오도록 코드를 채우시오. */

SELECT * FROM EMP WHERE SAL >= 2500 AND JOB = 'ANALYST';

--문자 대소 비교 연산자.

SELECT * FROM EMP WHERE ENAME >= 'F';

SELECT * FROM EMP WHERE JOB ='MANAGER' OR JOB ='SALESMAN' OR JOB ='CLERK';

--IN 연산자 사용하여 출력하기

SELECT * FROM EMP WHERE JOB IN ('MANGER', 'SALESMAN', 'CLERK');

--IN 연산자와 논리 부정 연산자 사용하여 출력하기

SELECT * FROM EMP WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

-- BETWEEN A AND B 연산자

SELECT * FROM EMP WHERE SAL >= 2000 AND SAL <= 3000;

SELECT * FROM EMP WHERE SAL BETWEEN 2000 AND 3000;

SELECT * FROM EMP WHERE SAL NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자 사용하여 출력하기

SELECT * FROM EMP WHERE ENAME LIKE 'S%';

SELECT * FROM EMP WHERE ENAME LIKE '_L%';

-- IS NULL
SELECT * FROM EMP WHERE COMM IS NULL;

-- IS NOT NILL

SELECT * FROM EMP; 

SELECT * FROM EMP WHERE MGR IS NOT NULL;

-- UNION (집합연산자) 합집합

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20;

-- UNION ALL (집합 연산자)

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

-- MINUS ( 집합 연산자) 차집합 

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL,DEPTNO
FROM EMP
WHERE DEPTNO = 10;

--INTERESEC (집합 연산자) 교집합

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

--Q1

SELECT * FROM EMP;

SELECT * FROM EMP WHERE ENAME LIKE '%S';

--Q2

SELECT EMPNO,ENAME,JOB,SAL,DEPTNO FROM EMP
WHERE DEPTNO = 30 AND JOB = 'SALESMAN';

--Q3


SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP
WHERE DEPTNO IN(20,30) AND SAL > 2000; 

SELECT EMPNO, ENAME,JOB,SAL,DEPTNO FROM EMP WHERE DEPTNO = 20 AND SAL > 2000
UNION
SELECT EMPNO, ENAME,JOB,SAL,DEPTNO FROM EMP WHERE DEPTNO = 30 AND SAL > 2000;

--Q4 


SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO FROM EMP
WHERE SAL > 2000 AND SAL <3000;


--Q5

SELECT ENAME, EMPNO, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 30 AND ENAME  LIKE '%E%'
AND SAL NOT BETWEEN 1000 AND 2000;

--Q6

SELECT * FROM EMP
WHERE COMM IS NULL AND MGR IS NOT NULL AND JOB IN ('MANAGER', 'CLERK')
AND ENAME NOT LIKE '_L%';

-- 함수 UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)

SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

SELECT * FROM EMP;

-- UPPER 함수로 문자열 비교하기

SELECT * FROM EMP WHERE UPPER(ENAME) = UPPER('james');

-- 문자열 길이를 구하는 LENGTH 함수

SELECT ENAME, LENGTH(ENAME) FROM EMP;

SELECT ENAME, LENGTH(ENAME) FROM EMP
WHERE LENGTH(ENAME) >=5;

-- SUBSTR 함수 

SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
FROM EMP;

-- SUBSTR 함수와 다름 한수 활용하기

SELECT JOB, SUBSTR(JOB, -LENGTH(JOB)),
            SUBSTR(JOB, -LENGTH(JOB),2),
            SUBSTR(JOB, -3)
FROM EMP;

-- INSTR 함수 (특정 문자 위치 찾기)

SELECT * FROM DUAL;

SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
       INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
       INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
FROM DUAL;

SELECT * FROM EMP WHERE INSTR(ENAME, 'S') >0;

SELECT * FROM EMP WHERE ENAME LIKE '%S%';

-- REPLACE 함수 

SELECT '010-1234-5678' AS REPLACE_BEFORE,
        REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
        REPLACE('010-1234-5678', '-') AS REPLACE_2
FROM DUAL;

-- LPAD,RPAD 함수

SELECT 'Oracle',
       LPAD('Oracle', 10, '#') AS LPAD_1,
       RPAD('Oracle', 10, '*') AS RPAD_1,
       LPAD('Oracle', 10) AS LPAD_2,
       RPAD('Oracle', 10) AS RPAD_2
FROM DUAL;

SELECT 
      RPAD('971225-', 14, '*' ) AS RPAD_JMNO,
      RPAD('010-1234', 13, '*' ) AS RPAD_PHONE
FROM DUAL;

-- CONCAT 두 문자열을 합치는 함수

SELECT * FROM EMP;

SELECT CONCAT(EMPNO, ENAME),
       CONCAT(EMPNO,CONCAT(' : ', ENAME))
FROM EMP
WHERE ENAME = 'SMITH';

-- 특정 문자를 지우는 TRIM, LTRIM, RTRIM 함수

SELECT '[' || TRIM(' - -Oracle - -  ') || ']' AS TRIM,
       '[' || TRIM(LEADING FROM '    - -Oracle- -    ') || ']' AS TRIM_LEADING,
       '[' || TRIM(TRAILING FROM '  - -Oracle- -  ') || ']' AS TRIM_TRAILING,
       '[' || TRIM(BOTH FROM '   - -Oralce- -  ') || ']' AS TRIM_BOTH
FROM DUAL;


-- 숫자 함수
-- ROUND 함수

SELECT ROUND(1234.5678) AS ROUND,
       ROUND(1234.5678, 0) AS ROUND_0,
       ROUND(1234.5678, 1) AS ROUND_1,
       ROUND(1234.5678, 2) AS ROUND_2,
       ROUND(1234.5678, -1) AS ROUND_MINUS1,
       ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM DUAL;

-- TRUNC 함수

SELECT TRUNC(1234.5678) AS TRUNC,
       TRUNC(1234.5678, 0) AS TRUNC_0,
       TRUNC(1234.5678, 1) AS TRUNC_1,
       TRUNC(1234.5678, 2) AS TRUNC_2,
       TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
       TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL;

-- CEIL,FLOOR 함수

SELECT CEIL(3.14),
       FLOOR(3.14),
       CEIL(-3.14),
       FLOOR(-3.14)
FROM DUAL;

-- MOD 함수

SELECT MOD(15, 6),
       MOD(10, 2),
       MOD(11, 2)
FROM DUAL;

--날짜 데이터 함수
--SYSDATE

SELECT SYSDATE AS NOW,
       SYSDATE-1 AS YESTERDAY,
       SYSDATE+1 AS TOMORROW
FROM DUAL;

--ADD_MONTH

SELECT SYSDATE,
       ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

SELECT EMPNO, ENAME, HIREDATE,
       ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
FROM EMP;


SELECT EMPNO,
       ENAME, HIREDATE, SYSDATE
  FROM EMP
WHERE ADD_MONTHS(HIREDATE, 384) > SYSDATE;


SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
       MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1,
       MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
       TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
FROM EMP;

-- NEXT_DAY, LAST_DAY

SELECT SYSDATE,
       NEXT_DAY(SYSDATE, '월요일'),
       LAST_DAY(SYSDATE)
FROM DUAL;


SELECT SYSDATE,
       ROUND(SYSDATE, 'CC') AS FORMAT_CC,
       ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY,
       ROUND(SYSDATE, 'Q') AS FORMAT_Q,
       ROUND(SYSDATE, 'DDD') AS FORMAT_DDD,
       ROUND(SYSDATE, 'HH') AS FORMAT_HH
FROM DUAL;

SELECT SYSDATE,
       TRUNC(SYSDATE, 'CC') AS FORMAT_CC,
       TRUNC(SYSDATE, 'YYYY') AS FORMAT_YYYY,
       TRUNC(SYSDATE, 'Q') AS FORMAT_Q,
       TRUNC(SYSDATE, 'DDD') AS FORMAT_DDDD,
       TRUNC(SYSDATE, 'HH') AS FORMAT_HH
FROM DUAL;


-- 형 변환 함수

SELECT EMPNO, ENAME, EMPNO + '500'
FROM EMP
WHERE ENAME= 'KING';

SELECT 'ABCD' + EMPNO, EMPNO
FROM EMP
WHERE ENAME= 'KING';

-- TO_CHAR   숫자 또는 날짜 데이터를 문자 데이터로 변환
-- TO_NUMBER 문자 데이터를 숫자 데이터로 변환
-- TO_DATE   문자 데이터를 날짜 데이터로 변환 

--날짜 형식 지정하여 출력하기



SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') AS 현재날짜시간
FROM DUAL;

SELECT SYSDATE,
      TO_CHAR(SYSDATE, 'MM') AS MM,
      TO_CHAR(SYSDATE, 'MON') AS MON,
      TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
      TO_CHAR(SYSDATE, 'DD') AS DD,
      TO_CHAR(SYSDATE, 'DY') AS DY,
      TO_CHAR(SYSDATE, 'DAY') AS DAY
FROM DUAL;

--여러 언어로 날짜(월) 출력하기

SELECT SYSDATE,
        TO_CHAR(SYSDATE, 'MM') AS MM,
        TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR,
        TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
        TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG,
        TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN') AS MONTH_KOR,
        TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MONTH_JPN,
        TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') AS MONTH_ENG
FROM DUAL; 

SELECT SYSDATE,
        TO_CHAR(SYSDATE, 'MM') AS MM,
        TO_CHAR(SYSDATE, 'DD') AS DD,
        TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = KOREAN' ) AS DY_KOR,
        TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = JAPANESE' ) AS DY_JPN,
        TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS DY_ENG,
        TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = KOREAN' ) AS DY_KOR,
        TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE' ) AS DY_JPN,
        TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS DY_ENG
FROM DUAL;

-- 시간 형식 지정하여 출력하기

SELECT SYSDATE,
        TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
        TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HHMISS_AM,
        TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM
FROM DUAL;

-- 숫자 데이터 형식 지정하여 출력하기

SELECT SAL,
       TO_CHAR(SAL, '$999,999') AS SAL_$,
       TO_CHAR(SAL, 'L999,999') AS SAL_L,
       TO_CHAR(SAL, '999,999.00') AS SAL_1,
       TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
       TO_CHAR(SAL, '0000999999.99') AS SAL_3,
       TO_CHAR(SAL, '999,999,00') AS SAL_4
FROM EMP;

--TO_NUMBER 함수

SELECT 1300 - '1500',
       '1300' + 1500
FROM DUAL;

SELECT '1300' - '1500'
FROM DUAL;

SELECT '1,300' - '1,500'
FROM DUAL;


SELECT TO_NUMBER('1,300' , '999,999') - TO_NUMBER('1,500', '999,999')
FROM DUAL;

-- TO_DATE 함수

SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1,
       TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE2
FROM DUAL;

--1981년 6월1 일후에 입사한 사원 정보 출력하기

SELECT * FROM EMP
WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD');

--여러 가지 형식으로 날짜 데이터 출력하기

SELECT TO_DATE('49/12/10', 'YY/MM/DD') AS YY_YEAR_49,
--RR : 두 자리 연도를 기반으로 50보다 작으면 2000년 이후, 
--     50 이상이면 1900년 이후로 간주.
--     EX: '21' = 2021년 '70' = 1970년
       TO_DATE('49/12/10', 'RR/MM/DD') AS RR_YEAR_49,
       TO_DATE('50/12/10', 'YY/MM/DD') AS YY_YEAR_50,
       TO_DATE('50/12/10', 'RR/MM/DD') AS RR_YEAR_50,
       TO_DATE('51/12/10', 'YY/MM/DD') AS YY_YEAR_51,
       TO_DATE('51/12/10', 'RR/MM/DD') AS RR_YEAR_51
FROM DUAL;


--NULL 처리 함수 : NVL , NVL2

SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,
       NVL(COMM,0),
       SAL+NVL(COMM,0)
FROM EMP;

SELECT EMPNO, ENAME, COMM,
    NVL2(COMM, '7', 'X'),
    NVL2(COMM, SAL*12*COMM, SAL*12) AS ANNSAL
FROM EMP;

--DECODE 함수

SELECT EMPNO, ENAME, JOB, SAL,
       DECODE(JOB,
              'MANAGER', SAL*1.1,
              'SALESMAN', SAL*1.05,
              'ANALYST', SAL,
              SAL*1.03) AS UPSAL
       FROM EMP;
       
SELECT*FROM EMP;

--CASE문

SELECT EMPNO, ENAME, JOB, SAL,
CASE JOB
WHEN 'MANAGER' THEN SAL*1.1
WHEN 'SALESMAN' THEN SAL*1.05
WHEN 'ANALYST' THEN SAL
ELSE SAL*1.03
END AS UPSAL
FROM EMP;

--CASE문 열 값에 따라서 출력

SELECT EMPNO, ENAME, COMM,
CASE
WHEN COMM IS NULL THEN' 해당사항 없음'
WHEN COMM = 0 THEN '수당없음'
WHEN COMM > 0 THEN '수당 : ' || COMM
END AS COMM_TEXT
FROM EMP;

SELECT * FROM EMP;

--Q1
SELECT EMPNO,
       RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO,
       ENAME,
       RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*' ) AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) >=5
AND LENGTH(ENAME) <6;

--Q2

SELECT EMPNO, ENAME, SAL,
    TRUNC(SAL / 21.5 ,24) AS DAY_PAY,
    ROUND(SAL / 21.5/ 8,1) AS TIME_PAY
FROM EMP;
    

SELECT * FROM EMP;
--Q3
SELECT EMPNO, ENAME, HIREDATE,
    TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월요일'), 'YYYY-MM-DD') AS R_JOB,
    NVL(TO_CHAR(COMM), 'N/A')AS COMM
FROM EMP;

--Q4

SELECT EMPNO, ENAME, MGR,
    CASE
        WHEN MGR IS NULL THEN '0000'
        WHEN SUBSTR(MGR, 1, 2) = '75' THEN '5555'
        WHEN SUBSTR(MGR, 1, 2) = '76' THEN '6666'
        WHEN SUBSTR(MGR, 1, 2) = '77' THEN '7777'
        WHEN SUBSTR(MGR, 1, 2) = '78' THEN '8888'
    ELSE TO_CHAR(MGR)
    END AS CHG_MGR 
FROM EMP;


--다중행 함수 
SELECT SUM(SAL)
FROM EMP;

SELECT ENAME, SUM(SAL)
FROM EMP;

SELECT SUM(DISTINCT SAL),
       SUM(ALL SAL),
       SUM(SAL)
FROM EMP;

SELECT COUNT(*)
FROM EMP;

SELECT COUNT(*)
FROM EMP
WHERE DEPTNO = 30;

SELECT COUNT(COMM)
FROM EMP
WHERE COMM IS NOT NULL;

SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO = 10;

SELECT MIN(SAL)
FROM EMP
WHERE DEPTNO =10;

SELECT * FROM EMP;

SELECT MAX(HIREDATE)
FROM EMP
WHERE DEPTNO = 20;

SELECT MIN(HIREDATE)
FROM EMP
WHERE DEPTNO = 20;

SELECT AVG(SAL)
FROM EMP
WHERE DEPTNO =30;

SELECT AVG(DISTINCT SAL)
FROM EMP
WHERE DEPTNO = 30;

SELECT AVG(SAL), '40' AS DEPTNO FROM EMP WHERE DEPTNO =10
UNION ALL
SELECT AVG(SAL), '20' AS DEPTNO FROM EMP WHERE DEPTNO =20
UNION ALL
SELECT AVG(SAL), '30' AS DEPTNO FROM EMP WHERE DEPTNO = 30;

--GROUP BY절

SELECT AVG(SAL), DEPTNO
FROM EMP
GROUP BY DEPTNO;

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

SELECT ENAME,DEPTNO, AVG(SAL)
FROM EMP
GROUP BY ENAME, DEPTNO;

--HAVING절

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE AVG(SAL) >= 2000
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

SELECT DEPTNO,JOB,AVG(SAL)
FROM EMP
WHERE SAL <= 3000
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

SELECT AVG(SAL)
FROM EMP
WHERE SAL <=3000;


--Q1
SELECT DEPTNO,
       TRUNC(AVG(SAL)) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(*) AS CNT
FROM EMP
GROUP BY DEPTNO;

--Q2

SELECT JOB,
       COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >=3;

--Q3

SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*) AS CNT
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;


--Q4

SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM,
    COUNT(*) AS CNT
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');


--Q5

SELECT DEPTNO,
     TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
     COUNT(*) AS CNT,
     MAX(SAL) AS MAX_SAL,
     SUM(SAL) AS SUM_SAL,
     AVG(SAL) AS AVG_SAL
FROM EMP
GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY DEPTNO;

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO,JOB);

-- 테이블 생성하기

CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;
    
SELECT * FROM DEPT_TEMP;

-- 데이터 추가하기

INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC)
       VALUES(50, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_TEMP;

-- 데이터 추가하기 (열 지정 없이)

INSERT INTO DEPT_TEMP
        VALUES(60, 'NETWORK', 'BUSAN');
        
SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
        VALUES(70, 'WEB', NULL);

SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC)
        VALUES(80, 'MOBILE', '');
        

INSERT INTO DEPT_TEMP(DEPTNO, LOC)
        VALUES(90, 'INCHEON');
        
--날짜 데이터 입력
-- !=
CREATE TABLE EMP_TEMP

CREATE TABLE EMP_TEMP 
    AS SELECT * FROM EMP;
    
SELECT * FROM EMP_TEMP;

CREATE TABLE EMP_TEMP AS SELECT * FROM EMP WHERE 1<>1;

SELECT * FROM EMP_TEMP;

-- INSERT 문으로 날짜 데이터 입력하기

INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM,DEPTNO)
            VALUES(9999, '홍길동', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);
        

INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM,DEPTNO)
            VALUES(1111, '성춘향', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);
            
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM,DEPTNO)
            VALUES(1111, '성춘향', 'MANAGER', 9999, '07/01/2001', 4000, NULL, 20);
            
-- TO DATE 함수

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
        VALUES(2111, '이순신', 'MANAGER',9999, TO_DATE('07/01/2001','DD/MM/YYYY'), 4000,NULL, 20);
        
SELECT * FROM EMP_TEMP;


INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (3111, '심청이', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);

SELECT * FROM EMP_TEMP;

CREATE TABLE DEPT_TEMP2
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP2;

UPDATE DEPT_TEMP2
SET LOC = 'SEOUL';

SELECT * FROM DEPT_TEMP2;

ROLLBACK;

COMMIT;


SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20;

SELECT * FROM EMP;

--FROM 절에 여러 테이블 선언.
SELECT * FROM EMP, DEPT
ORDER BY EMPNO;

SELECT* FROM EMP; --12개

SELECT * FROM DEPT;  --4개


SELECT * FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
ORDER BY EMPNO;

SELECT * FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;


-- 등가 조인

SELECT EMPNO, ENAME, DEPTNO, DNAME, LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

SELECT * FROM EMP

SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY D.DEPTNO, E.EMPNO;

--WHERE 절에 조건 넣어 출력

SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND SAL >=3000;

--비등가 조인 
SELECT * FROM EMP;

SELECT * FROM SALGRADE;

SELECT * FROM EMP E , SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;


--자체조인

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

SELECT * FROM EMP
       
    

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+)
ORDER BY E1.EMPNO;

SELECT * FROM EMP;

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO
ORDER BY E1.EMPNO;

SELECT * FROM EMP


SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       E.DEPTNO,
       D.DNAME, D.LOC
       FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
WHERE SAL <= 3000
ORDER BY E.DEPTNO, EMPNO;

--왼쪽 외부 조인 (SQL-99)

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;

-오른쪽 외부 조인 (SQL-99)

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;


SELECT * FROM EMP
SELECT * FROM DEPT

-- Q.1
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL > 2000
ORDER BY DEPTNO;

SELECT * FROM EMP
SELECT * FROM DEPT

-- Q.2
SELECT E.DEPTNO, D.DNAME, TRUNC(AVG(E.SAL)) AS AVG_SAL, MAX(E.SAL) AS MAX_SAL, MIN(E.SAL)AS MIN_SAL, COUNT(*) AS CNT
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY E.DEPTNO, D.DNAME;

SELECT * FROM EMP

--Q.3

SELECT * FROM EMP
SELECT * FROM DEPT
SELECT * FROM SALGRADE

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
ORDER BY D.DEPTNO, E.ENAME;

--Q.4
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.MGR, E.SAL, E.DEPTNO AS EMP_DEPTNO,
       S.LOSAL, S.HISAL, S.GRADE,
       E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM DEPT D
LEFT JOIN EMP E ON D.DEPTNO = E.DEPTNO
LEFT JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
LEFT JOIN EMP E2 ON E.MGR = E2.EMPNO
ORDER BY D.DEPTNO, E.EMPNO;

-- 서브쿼리

SELECT SAL 
FROM EMP
WHERE ENAME = 'JONES';

SELECT * FROM EMP
WHERE SAL > 2975;

SELECT * FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME='JONES');

SELECT * FROM EMP

SELECT * FROM EMP
WHERE COMM > (SELECT COMM FROM EMP WHERE ENAME = 'ALLEN');


-- 단일행 서브쿼리

SELECT * FROM EMP
WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'KING');

-- 서브쿼리 안에서 함수 사용

SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.DEPTNO = 20
AND E.SAL> (SELECT AVG(SAL) FROM EMP);


-- IN 연산자

SELECT * FROM EMP
WHERE DEPTNO IN (20, 30);

-- IN 연산자 사용하기

SELECT * FROM EMP
WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);


-- ANY 연산자

SELECT * FROM EMP
WHERE SAL = ANY (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT * FROM EMP

SELECT * FROM EMP
WHERE SAL = SOME (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);


SELECT * FROM EMP
WHERE SAL < ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

SELECT * FROM EMP
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

--ALL 연산자

SELECT * FROM EMP
WHERE SAL < ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

SELECT * FROM EMP
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

--EXISTS 연산자

SELECT * FROM EMP
WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 10);

SELECT * FROM EMP
WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO =50);

-- 다중열 서브쿼리

SELECT * FROM EMP
WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT * FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- FROM 절에 서브쿼리 사용하기

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
     (SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;

-- WITH절 사용하기

WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D   AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM E10, D
WHERE E10.DEPTNO = D.DEPTNO;

SELECT * FROM SALGRADE;

SELECT EMPNO, ENAME, JOB, SAL,
(SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
DEPTNO,
(SELECT DNAME FROM DEPT WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
FROM EMP E;
