-- 서브쿼리 (부속질의), SUB QUERY)
-- SQL (SELECT, INSERT, UPDATE, DELETE) 내에 있는 퀄리문
---------------------------------------
-- 박지성이 구입한 내역을 검색 
SELECT CUSTID FROM CUSTOMER WHERE NAME = '박지성'; -- CUSTID : 1
SELECT * FROM ORDERS WHERE CUSTID = 1;
-- 서브쿼리 사용 
SELECT * FROM ORDERS 
 WHERE CUSTID = (SELECT CUSTID FROM CUSTOMER WHERE NAME = '박지성'); 
-- '=' 부호는 하나의 데이터만 두개 이상이면 IN 또는 NOT IN으로 써줘야함

-- 조인문으로 처리
SELECT C.NAME, O.* 
  FROM ORDERS O, CUSTOMER C
 WHERE O.CUSTID = C.CUSTID
   AND C.NAME = '박지성'
;
--------------------------------
-- WHERE 절에서 서브쿼리 사용시 조회 결과가 2건 이상인 경우 IN 사용 
-- 박지성, 김연아 구입내역(서브쿼리 방식 조회)
SELECT * FROM ORDERS 
 WHERE CUSTID IN (SELECT CUSTID 
                    FROM CUSTOMER 
                   WHERE NAME IN('박지성', '김연아'))
; 

--------------------------------
-- 책중 정가가 가장 비싼 도서의 이름을 구하시오
SELECT MAX(PRICE) FROM BOOK; -- 가장 비싼 책의 가격 : 35000
SELECT * FROM BOOK WHERE PRICE = 35000; 
--
SELECT * FROM BOOK
 WHERE PRICE = (SELECT MAX(PRICE) FROM BOOK); 
---------------------------
-- 서브쿼리를 FROM 절에 사용하는 경우 
SELECT *
  FROM BOOK B, 
      (SELECT MAX(PRICE) MAX_PRICE FROM BOOK) M
 WHERE B.PRICE = M.MAX_PRICE 
;
--(실습) 출판된 책의 평균금액 이상인 도서 목록(FROM절 서브쿼리 사용)
SELECT * 
  FROM BOOK B,
       (SELECT AVG(PRICE) AVG_PRICE FROM BOOK) M
 WHERE B.PRICE >= M.AVG_PRICE
;


--(실습) 박지성, 김연아 구입내역 (서브쿼리 - FROM절)
SELECT CUSTID FROM CUSTOMER WHERE NAME IN('박지성', '김연아');
SELECT *
  FROM ORDERS O,
       (SELECT * FROM CUSTOMER WHERE NAME IN('박지성', '김연아')) C
 WHERE O.CUSTID = C.CUSTID
;
-------------------------------
-- SELECT 절에 서브쿼리 사용 예 
SELECT O.ORDERID, O.CUSTID, O.BOOKID,
       (SELECT NAME FROM CUSTOMER WHERE CUSTID = O.CUSTID) CUSTNAME,
       (SELECT BOOKNAME FROM BOOK WHERE BOOKID = O.BOOKID) BOOKNAME,
       O.SALEPRICE, O.ORDERDATE
  FROM ORDERS O 
;
-------------------------------------
-- 박지성이 구매한 책 목록 (책제목)
SELECT *
  FROM BOOK
 WHERE BOOKID IN (SELECT BOOKID
                    FROM ORDERS
                   WHERE CUSTID IN (SELECT CUSTID
                                      FROM CUSTOMER 
                                     WHERE NAME = '박지성'))
;
----------------------------
-- (실습) 서브쿼리, 조인문
-- 1. 한번이라도 구매한 내역이 있는 사람
--------(또는 한번도 구매하지 않은 사람)
SELECT * FROM CUSTOMER
  WHERE CUSTID IN(SELECT DISTINCT CUSTID FROM ORDERS)
;

--------(또는 한번도 구매하지 않은 사람)
SELECT * FROM CUSTOMER
  WHERE CUSTID NOT IN(SELECT DISTINCT CUSTID FROM ORDERS)
;

-- SQL 표준 
SELECT DISTINCT C.* 
  FROM ORDERS O INNER JOIN CUSTOMER C
             ON O.CUSTID = C.CUSTID
;


SELECT C.* 
  FROM ORDERS O, CUSTOMER C
 WHERE O.CUSTID(+) = C.CUSTID
   AND O.ORDERID IS NULL
;

SELECT C.* 
  FROM  CUSTOMER C LEFT OUTER JOIN ORDERS O
        ON O.CUSTID = C.CUSTID
   WHERE O.ORDERID IS NULL
;
  
  
-- 2. 20000원 이상되는 책을 구입한 고객 명단 조회
SELECT * FROM ORDERS WHERE SALEPRICE >= 20000;
SELECT * 
  FROM CUSTOMER      
 WHERE CUSTID IN (SELECT CUSTID FROM ORDERS WHERE SALEPRICE >= 20000)
;

-- JOIN 문 
SELECT C.*, O.SALEPRICE, O.ORDERDATE 
  FROM CUSTOMER C, ORDERS O
 WHERE O.CUSTID = C.CUSTID 
   AND O.SALEPRICE >= 20000
;

-- 3. '대한미디어' 출판사의 책을 구매한 고객이름 조회 
SELECT * 
  FROM CUSTOMER
 WHERE CUSTID IN(SELECT CUSTID FROM ORDERS 
                 WHERE BOOKID IN (SELECT BOOKID FROM BOOK 
                                  WHERE PUBLISHER = '대한미디어'))
;

SELECT C.* 
  FROM BOOK B, ORDERS O, CUSTOMER C 
 WHERE O.CUSTID = C.CUSTID AND B.BOOKID = O.BOOKID -- 조인조건
   AND B.PUBLISHER = '대한미디어'
;

-- 표준 SQL
SELECT DISTINCT C.* 
  FROM BOOK B 
       INNER JOIN ORDERS O
               ON B.BOOKID = O.BOOKID
       INNER JOIN CUSTOMER C
               ON O.CUSTID = C.CUSTID
 WHERE B.PUBLISHER = '대한미디어'
;

SELECT C.*, O.SALEPRICE, O.ORDERDATE, B.BOOKNAME, B.PUBLISHER
  FROM CUSTOMER C INNER JOIN ORDERS O -- 조인테이블 조인방식
         ON O.CUSTID = C.CUSTID  -- 조인 조건 
       INNER JOIN BOOK B  -- 조인테이블 조인방식 
         ON B.BOOKID = O.BOOKID -- 조인 조건
 WHERE B.PUBLISHER = '대한미디어' -- 검색조건
;


-- 4. 전체 책가격 평균보다 비싼책의 목록 조회 
----------------------------
SELECT * FROM BOOK;
SELECT * FROM BOOK B WHERE B.PRICE >= (SELECT AVG(PRICE) FROM BOOK); 


SELECT AVG(PRICE) B_AVG FROM BOOK;
SELECT * FROM BOOK WHERE PRICE > 14450;












