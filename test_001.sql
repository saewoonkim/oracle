/*CREATE MINISTRY TABLE*/

CREATE TABLE MINISTRY(
    MINSNO NUMBER(2),
    MINAME VARCHAR(40),
    LOC VARCHAR(40)
);

DESC MINISTRY;

/*CREATE PUBLICOFFICER TABLE*/

CREATE TABLE PUBLICOFFICER(
    PONO NUMBER(4),
    PONAME VARCHAR(40),
    STATUS VARCHAR(40),
    ADMISSION DATE,
    SAL NUMBER(7),
    COMM NUMBER(7),
    MINSNO NUMBER(2)
);

/*MINISTRY Constraint*/

ALTER TABLE MINISTRY
MODIFY(MINSNO CONSTRAINT MC NOT NULL);

/*PUBLICOFFICER Constraint*/

ALTER TABLE PUBLICOFFICER
MODIFY(PONO CONSTRAINT PC NOT NULL);

/*MINISTRY PRIMARY KEY*/

ALTER TABLE PUBLICOFFICER
MODIFY(PONO CONSTRAINT PPK PRIMARY KEY);

/*MINISTRY PRIMARY KEY*/

ALTER TABLE MINISTRY
MODIFY(MINSNO CONSTRAINT MPK PRIMARY KEY);

/*PUBLICOFFICER FOREIGN KEY*/

ALTER TABLE PUBLICOFFICER
ADD FOREIGN KEY(MINSNO) REFERENCES MINISTRY(MINSNO);

/*PUBLICOFFICER INSERT ALLT*/

INSERT ALL
    INTO PUBLICOFFICER(PONO, PONAME, STATUS, ADMISSION, SAL, COMM, MINSNO)
        VALUES (7350, '김세운', '통일부장관', '2024/01/05', 1100, 300, 10)
    INTO PUBLICOFFICER(PONO, PONAME, STATUS, ADMISSION, SAL, COMM, MINSNO)
        VALUES (7352, '김시현', '외교부장관', '2023/01/02', 1200, NULL, 20)
    INTO PUBLICOFFICER(PONO, PONAME, STATUS, ADMISSION, SAL, COMM, MINSNO)
        VALUES (7521, '라수애', '교육부장관', '2021/03/02', 1300, 300, 30)
    INTO PUBLICOFFICER(PONO, PONAME, STATUS, ADMISSION, SAL, COMM, MINSNO)
        VALUES (7566, '배소희', '문화부장관', '2023/05/12', 1400, NULL, 40)
    INTO PUBLICOFFICER(PONO, PONAME, STATUS, ADMISSION, SAL, COMM, MINSNO)
        VALUES (7654, '장창수', '국방부장관', '2023/07/24', 1200, NULL, 50)
    INTO PUBLICOFFICER(PONO, PONAME, STATUS, ADMISSION, SAL, COMM, MINSNO)
        VALUES (7678, '한지은', '법무부장관', '2020/11/02', 1100, 300, 60)
SELECT * FROM DUAL;

/*MINISTRY INSERT ALLT*/
INSERT ALL
    INTO MINISTRY(MINSNO, MINAME, LOC) VALUES (10, '통일부', '종로구')
    INTO MINISTRY(MINSNO, MINAME, LOC) VALUES (20, '외교부', '종로구')
    INTO MINISTRY(MINSNO, MINAME, LOC) VALUES (30, '교육부', '갈매로')
    INTO MINISTRY(MINSNO, MINAME, LOC) VALUES (40, '문화체육관광부', '갈매로')
    INTO MINISTRY(MINSNO, MINAME, LOC) VALUES (50, '국방부', '용산구')
    INTO MINISTRY(MINSNO, MINAME, LOC) VALUES (60, '법무부', '서초구')
SELECT * FROM DUAL;

/*P+M ERROR*/
SELECT P.PONO, P.PONAME, P.STATUS, P.ADMISSION, P.SAL, P.COMM, P.MINSNO,
        M.MINSNO AS MINSNO_1, M.MINAME, M.LOC
FROM PUBLICOFFICER P, MINISTRY M;

/*P+M JOIN*/
SELECT P.PONO, P.PONAME, M.MINSNO
FROM PUBLICOFFICER P, MINISTRY M
WHERE P.MINSNO = M.MINSNO
ORDER BY MINSNO;

/*P+M JOIN ON*/
SELECT P.PONO, P.PONAME, P.STATUS, P.ADMISSION, P.SAL, P.COMM, P.MINSNO,
        M.MINSNO AS MINSNO_1, M.MINAME, M.LOC
FROM PUBLICOFFICER P JOIN MINISTRY M ON (P.MINSNO = M.MINSNO)
WHERE SAL <= 1200
ORDER BY MINSNO;

/*SAL > 김시현*/
SELECT P.PONO, P.PONAME, P.STATUS, P.ADMISSION, P.SAL, P.COMM, P.MINSNO,
        M.MINSNO AS MINSNO_1, M.MINAME, M.LOC
FROM PUBLICOFFICER P JOIN MINISTRY M ON (P.MINSNO = M.MINSNO)
WHERE SAL > (SELECT SAL FROM PUBLICOFFICER WHERE PONAME = '김시현');

/*PUBLICOFFICER INSERT ALL ERROR*/
INSERT ALL
    INTO PUBLICOFFICER(PONO, PONAME, STATUS, ADMISSION, SAL, COMM, MINSNO)
        VALUES (7800, '장성욱', '노동부장관', '2021/06/05', 900, 300, 70)
SELECT * FROM DUAL;

/*MINISTRY INSERT ALL*/
INSERT ALL
    INTO MINISTRY(MINSNO, MINAME, LOC)
        VALUES (70, '환경부', '중랑구')
    INTO MINISTRY(MINSNO, MINAME, LOC)        
        VALUES (80, '노동부', '서초구')
SELECT * FROM DUAL;

/*PUBLICOFFICER UPDATE*/
UPDATE PUBLICOFFICER
    SET SAl=1400, COMM=300, MINSNO=80
    WHERE PONO=7800;
    
/*PUBLICOFFICER DROP*/
DELETE FROM PUBLICOFFICER
WHERE PONO=7800;