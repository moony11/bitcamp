/* 함수(FUNCTION)

CREATE OR REPLACE FUNCTION FUNCTION1 
(
  PARAM1 IN VARCHAR2 -- 파라미터 작성영역
) RETURN VARCHAR2 AS -- 리턴 데이터 타입선언
BEGIN
  RETURN NULL; -- 리턴할 값
END;
-----
-- 리턴할 데이터에 대한 선언 필요
RETURN 데이터유형(타입)
-- 프로그램 마지막에 값 리턴하는 문장 필요 
RETURN 리턴값;

*************************/
-- 프로시저 작업 처리 끝 목적
-- 함수 목적은 처리하고 결과값을 되돌려 받아 사용하기 위한 목적
--------------------
-- BOOKID 로 책제목 확인하는 함수(파라미터값 : BOOKID, RETURN값: BOOKNAME)


CREATE OR REPLACE FUNCTION GET_BOOKNAME (
  IN_ID IN NUMBER 
) RETURN VARCHAR2 -- 문자열 리턴 리턴할 데이터 타입 지정 
AS 
    V_BOOKNAME BOOK.BOOKNAME%TYPE;
BEGIN
    SELECT BOOKNAME INTO V_BOOKNAME
    FROM BOOK
    WHERE BOOKID = IN_ID;
    RETURN V_BOOKNAME; -- 리턴값 전달 
END;


-------------------
-- 함수(FUNCTION)의 사용
-- SELECT 절에 사용
SELECT BOOKID, BOOKNAME, GET_BOOKNAME(1)
  FROM BOOK;
---
SELECT O.*, GET_BOOKNAME(BOOKID)
  FROM ORDERS O;
------------
--WHERE 절에서 함수 사용 
-- 그룹함수는 WHERE 절에서 사용 불가 

SELECT O.*, GET_BOOKNAME(BOOKID)
  FROM ORDERS O
 WHERE GET_BOOKNAME(BOOKID) = '야구를 부탁해'  
;

------------------------------
-- (실습) 고객 ID  값을 받아서 고객명을 돌려주는 함수 (CUSTOMER 테이블 사용)
-- 함수명 : GET_CUSTNAME
-- 함수를 이용해서 ORDERS 테이블 데이터 조회
-----GET_BOOKNAME, GET_CUSTNAME 함수를 사용 주문(판매) 정보와 책제목, 고객명 조회
SELECT O.*, GET_CUSTNAME(CUSTID) AS CUSTNAME
  FROM ORDERS O;
  
SELECT O.*, 
        (SELECT NAME FROM CUSTOMER WHERE CUSTID = O.CUSTID) CUST_NAME
  FROM ORDERS O;
  
  
SELECT O.*, GET_CUSTNAME(CUSTID)
  FROM ORDERS O
 WHERE GET_CUSTNAME(CUSTID) = '김연아';

SELECT O.*, 
        GET_BOOKNAME(BOOKID) BOOK_NAME, 
        GET_CUSTNAME(CUSTID) CUST_NAME 
  FROM ORDERS O
;

---------------
SELECT O.*, B.BOOKNAME, C.NAME 
  FROM ORDERS O, BOOK B, CUSTOMER C
 WHERE O.BOOKID = B.BOOKID AND O.CUSTID = C.CUSTID -- 조인조건
;












