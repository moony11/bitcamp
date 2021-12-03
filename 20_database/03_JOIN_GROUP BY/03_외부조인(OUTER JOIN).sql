--(번외) 고객 중 한 권도 구입 안한 사람은 누구? 
----- CUSTOMER 테이블에는 있고, ORDERS 테이블에는 없는 사람 
-----------------
--(방법1) 서브쿼리(SUB QUERY)
-- 커스터머에는 있고 오더스 테이블에는 없는사람
SELECT CUSTID
  FROM CUSTOMER
 WHERE CUSTID NOT IN(SELECT DISTINCT CUSTID FROM ORDERS) -- 1,2,3,4
;
-- (방법2) MINUS : 차집합 처리
SELECT CUSTID FROM CUSTOMER -- 1, 2, 3, 4, 5
MINUS
SELECT CUSTID FROM ORDERS; -- 1,1,2,3,4,1,......
----------------------------------
-- (방법3) 외부조인(OUTER JOIN)
-- 내부조인(INNER JOIN) - 동등조인(동일하게 있는 )
SELECT DISTINCT C.CUSTID, C.NAME
  FROM CUSTOMER C, ORDERS O
 WHERE C.CUSTID = O.CUSTID -- 조인조건 (동등조인)
;
-- 외부조인(좌측기준 - LEFT OUTER JOIN)
SELECT C.* 
  FROM CUSTOMER C, ORDERS O
 WHERE C.CUSTID = O.CUSTID(+) -- 조인조건(좌측기준)
   AND O.ORDERID IS NULL
;
----------------------
--ANSI 표준 SQL (좌측기준 - LEFT OUTER JOIN)
-------------------------
SELECT C.* 
  FROM CUSTOMER C LEFT OUTER JOIN ORDERS O -- 좌측테이블기준 오른쪽 테이블 전체
       ON C.CUSTID = O.CUSTID
 WHERE O.ORDERID IS NULL
;

--INNER
SELECT * 
  FROM CUSTOMER C INNER JOIN ORDERS O 
       ON C.CUSTID = O.CUSTID
;

-------------------------------------
--ANSI 표준 SQL (우측기준 - RIGHT OUTER JOIN)
SELECT * 
  FROM ORDERS O RIGHT OUTER JOIN CUSTOMER C
       ON C.CUSTID = O.CUSTID
 WHERE O.ORDERID IS NULL
;

-- 외부조인 (우측기준)
SELECT C.* 
  FROM ORDERS O, CUSTOMER C 
 WHERE O.CUSTID(+) = C.CUSTID -- 우측기준 외부조인
   AND O.ORDERID IS NULL
;
-----------
-- 조인 (JOIN, INNER JOIN) : 조인테이블 모두에 존재하는 데이터 검색
-- 외부조인( OUTER JOIN) : 어느 한 쪽 테이블에 데이터가 존재하지 않는 데이터 검색
----- 모든 데이터 표시하고, 일치하지 않는 데이터 찾을 때 사용
-------------------------------
CREATE TABLE DEPT (
    ID VARCHAR2(10) PRIMARY KEY,
    NAME VARCHAR2(30)

);
INSERT INTO DEPT VALUES ('10', '총무부');
INSERT INTO DEPT VALUES ('20', '급여부');
INSERT INTO DEPT VALUES ('30', 'IT부');
COMMIT;

---------------
CREATE TABLE DEPT_1(
 ID VARCHAR2(10) PRIMARY KEY,
    NAME VARCHAR2(30)
);

INSERT INTO DEPT_1 VALUES ('10', '총무부');
INSERT INTO DEPT_1 VALUES ('20', '급여부');
COMMIT;


CREATE TABLE DEPT_2(
 ID VARCHAR2(10) PRIMARY KEY,
    NAME VARCHAR2(30)
);

INSERT INTO DEPT_2 VALUES ('10', '총무부');
INSERT INTO DEPT_2 VALUES ('30', 'IT부');
COMMIT;
-------------------
SELECT * FROM DEPT;
SELECT * FROM DEPT_1;
SELECT * FROM DEPT_2;
-------------------
-- DEPT - DEPT_1 ??
SELECT * 
    FROM DEPT D, DEPT_1 D1
    WHERE D.ID = D1.ID
;

-- DEPT = DEPT_2
SELECT * 
    FROM DEPT D, DEPT_2 D2
    WHERE D.ID = D2.ID
;
------------
-- DEPT 에는 있고, DEPT_1 에는 없는 데이터(부서) 조회
-- LEFT OUTER JOIN : 좌측 테이블 기준
----- 전체데이터 표시하고, 우측에 없으면 NULL표시 
SELECT * 
    FROM DEPT D, DEPT_1 D1
    WHERE D.ID = D1.ID(+)  -- 조인조건(좌측기준)
;

-- 좌측에만 있는 데이터 찾기
SELECT * 
  FROM DEPT D, DEPT_1 D1
 WHERE D.ID = D1.ID(+) --조인조건(좌측기준)
   AND D1.ID IS NULL
;
-----ANSI 표준 SQL : LEFT OUTER JOIN - 좌측 테이블 기준 
SELECT * 
  FROM DEPT D LEFT OUTER JOIN DEPT_1 D1 -- 조인방식( 좌측기분 외부조인)
      ON D.ID = D1.ID -- 이부분은 순서 바뀌어도 상관없음 위에 기준 고정됐으니
 WHERE D1.ID IS NULL
;

----------------------
--RIGHT OUTER JOIN - 우측 테이블 기준 
SELECT * 
  FROM DEPT_1 D1, DEPT D 
 WHERE D1.ID(+) = D.ID
;
-- 표준 SQL : RIGHT OUTER JOIN 
SELECT * 
  FROM DEPT_1 D1 RIGHT OUTER JOIN DEPT D -- 조인방식( 우측기분 외부조인)
      ON D1.ID = D.ID -- 
 WHERE D1.ID IS NULL
;
--------------------------
--(실습) DEPT_1, DEPT_2 테이블 사용해서 
-- 1. DEPT_1 에는 있고 DEPT_2 테이블에는 없는 데이터 찾기 (LEFT OUTER JOIN)
SELECT D1.*
 FROM DEPT_1 D1 LEFT OUTER JOIN DEPT_2 D2
      ON D1.ID = D2.ID
 WHERE D2.ID IS NULL
;

SELECT D1.* 
  FROM DEPT_1 D1, DEPT_2 D2
 WHERE D1.ID = D2.ID(+)
   AND D2.ID IS NULL
;


-- 2. DEPT_2 에는 있고 DEPT_1 테이블에는 없는 데이터 찾기 (RIGHT OUTER JOIN)

SELECT D2.*
  FROM DEPT_1 D1 RIGHT OUTER JOIN DEPT_2 D2
        ON D1.ID = D2.ID
 WHERE D1.ID IS NULL
 ;
 
SELECT * 
 FROM DEPT_2 D2, DEPT_1 D1
 WHERE D2.ID = D1.ID(+)
  AND D1.ID IS NULL
;
 
 SELECT D1.ID D1_ID, D1.NAME D1_NAME, 
        D2.ID D2_ID, D2.NAME D2_NAME 
  FROM DEPT_1 D1, DEPT_2 D2
 WHERE D1.ID(+) = D2.ID -- RIGHT OUTER JOIN
   AND D1.ID IS NULL
;
 
 ------------------------
 -- FULL OUTER JOIN  : (+) 부호 사용방식 안됨 FULL (OUTER) JOIN 사용
 SELECT *
 FROM DEPT_1 D1 FULL OUTER JOIN DEPT_2 D2
      ON D1.ID = D2.ID
;


 
SELECT *
 FROM DEPT_1 D1 FULL OUTER JOIN DEPT_2 D2
      ON D1.ID = D2.ID
 WHERE D1.ID IS NULL -- 우측기준 데이터 
 -- WHERE D2.ID IS NULL -- 좌측기준 데이터
;

