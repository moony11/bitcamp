/* *************************
SELECT [* | DISTINCT] {컬럼명, 컬럼명, ...}
  FROM 테이블명
[WHERE 조건절]
[GROUP BY {컬럼명, ....}
    [HAVING 조건] ] --GROUP BY 절에 대한 조건
[ORDER BY {컬럼명 [ASC | DESC], ....}] --ASC : 오름차순(기본/생략가능)
                                      --DESC : 내림차순
***************************/
SELECT * FROM BOOK;
SELECT * FROM CUSTOMER;
SELECT * FROM ORDERS;
---------------
SELECT * FROM BOOK ORDER BY bookname DESC;
-- 출판사 기준 오름차순(또는 내림차순), 책제목 오름차순(또는 내림차순)
SELECT * FROM BOOK ORDER BY publisher, BOOKNAME;
--출판사 기준 오름차순, 가격이큰것부터(내림차순)
SELECT * FROM BOOK ORDER BY publisher, PRICE DESC;
--------------------
-- AND, OR , NOT(자바 &&, || ! 여기선 안쓰임) 
-- 출판사 대한미디어, 금액이 3만원이상인 책 조회
SELECT * 
 FROM BOOK
 WHERE PUBLISHER = '대한미디어' AND PRICE >= 30000
;
Select * 
     From Book
     Where Publisher = '대한미디어' And Price >= 30000
;

----------------------
-- OT : 출판사 : 대한미디어 또는 이상미디어에서 출판한 책 목록
SELECT *
FROM BOOK
WHERE PUBLISHER = '대한미디어' OR PUBLISHER = '이상미디어'; 

-- NOT : 출판사 굿 스ㅠㅗ프를 제외하고 나머지 전체 출력
SELECT * FROM BOOK WHERE NOT (PUBLISHER = '굿스포츠');
SELECT * FROM BOOK WHERE PUBLISHER <> '굿스포츠'; -- <> : 같지앟ㄴ다 다르다
SELECT * FROM BOOK WHERE PUBLISHER != '굿스포츠';  --!= : 같지앟ㄴ다 다르다
---------------------
--굿스포츠, 대한미디어 출판사가 아닌 도서 목록
SELECT * FROM BOOK 
 WHERE PUBLISHER <> '굿스포츠' AND PUBLISHER <> '대한미디어'; 

SELECT * FROM BOOK 
 WHERE NOT (PUBLISHER = '굿스포츠' OR PUBLISHER = '대한미디어')
 ;
 --=======
 -- IN : 안에 있냐? ( OR문 단순화 )
 -- 출판사 나무수, 대한미디어, 삼성당 에서 출판한 도서 목록 
SELECT * FROM BOOK 
 WHERE PUBLISHER = '나무수' 
 OR PUBLISHER = '대한미디어'
 OR PUBLISHER = '삼성당';
 
SELECT * FROM BOOK 
 WHERE PUBLISHER IN('나무수', '대한미디어', '삼성당')
 ; 
 
 -- 나무수, 대한미디어, 삼성당 제외한 출판사 출판도서
SELECT * FROM BOOK 
 WHERE PUBLISHER <> '나무수' 
 AND PUBLISHER <> '대한미디어'
 AND PUBLISHER <> '삼성당';

SELECT * FROM BOOK 
 WHERE PUBLISHER NOT IN('나무수', '대한미디어', '삼성당')
 ; 
 --==========================
 -- 같다(=), 크다(>), 작다(<) 크거나 같다 (>=), 작거나 같다(<=)
 -- 같지않다/다르다 : <>, !=
 -- (실습) 출판된 책중에 8000원 이상이고, 22000원 이하인 책 가격순 정렬
 
SELECT * FROM 
BOOK WHERE PRICE >= 8000 AND PRICE <= 22000
ORDER BY PRICE
;
-- BETWEEN 값1(부터) AND 값2(까지) : 값 1 부터 값 2 까지 형태로 사용
-- 경계값을 포함해서만 사용 가능
SELECT * FROM BOOK
 WHERE PRICE BETWEEN 8000 AND 22000
 ORDER BY PRICE
;

-- NOT BETWEEN 값1(부터) AND 값2(까지) : 값 1 부터 값 2 까지 형태로 사용

SELECT * FROM BOOK
 WHERE PRICE NOT BETWEEN 8000 AND 22000 -- PRICE < 8000 OR PRICE > 2200 
 ORDER BY PRICE
;
-- 책 제목이 '야구' ~ '올림픽'
SELECT * FROM BOOK ORDER BY BOOKNAME;
SELECT * FROM BOOK
 WHERE BOOKNAME BETWEEN '야구' AND '올림픽' -- 올림픽이야기는 올림픽 + 이야기라 안나옴
 ORDER BY BOOKNAME;
 
 
 -- 실습 (BETWEEN) 출판사 나무수~삼성당 출판사책 (출판사명으로 정렬)
SELECT * FROM BOOK
 WHERE PUBLISHER BETWEEN '나무수' AND '삼성당' 
 ORDER BY PUBLISHER;
 
 -- 실습 (IN) 대한미디어, 이상미디어에서 출판한 책목록(출판사명, 책제목 정렬)
SELECT * FROM BOOK
  WHERE PUBLISHER IN( '대한미디어', '이상미디어') 
  ORDER BY PUBLISHER, BOOKNAME
 ;
-----------------------
-- LIKE : '%', '_' 부호와 함께 사용
-- % : 전체(모든것)을 의미
-- _ (언더바) : 문자 하나에 대하여 모든것을 의미
-----------------
SELECT * FROM BOOK 
 WHERE PUBLISHER LIKE '%미디어' -- 출판사명이 '미디어'로 끝나는 출판사 
  ORDER BY PUBLISHER, BOOKNAME
; 
-- '야구'로 시작하는 책 조회
SELECT * FROM BOOK 
 WHERE BOOKNAME LIKE '야구%' -- <야구>로 시작하는 
;
-- 책제목에 <단계> 단어가 있는 책 목록
SELECT * FROM BOOK 
 WHERE BOOKNAME LIKE '%단계%' -- 앞, 뒤, 중간 어디에 있든 단계 단어가 있으면  
;

-- 실습) 책 제목어 '구' 문자가 있는 책 목록
 SELECT * FROM BOOK 
 WHERE BOOKNAME LIKE '%구%' 
;

-- 실습 책 제목중 2, 3번째 글자가 <구의> 인 책목록 
 SELECT * FROM BOOK 
 WHERE BOOKNAME LIKE '_구의%' -- '_'언더바 위치에 반드시 1개의 문자가 있어야함  
;

-- 실습) 책 제목에 '구'문자가 2번째에 있는 책 조회
 SELECT * FROM BOOK 
 WHERE BOOKNAME LIKE '_구%'  
;

-- 실습) 책 제목에 '를'문자가 3번째에 있는 책 조회
 SELECT * FROM BOOK 
 WHERE BOOKNAME LIKE '__를%'  
;


--------------
--LIKE 사용시 동작 결과 확인
CREATE TABLE TEST_LIKE (
   ID NUMBER(2) PRIMARY KEY,
   NAME VARCHAR2(30)

);
COMMIT;
SELECT * FROM TEST_LIKE;

INSERT INTO TEST_LIKE VALUES (1,'홍길동');
INSERT INTO TEST_LIKE VALUES (2,'홍길동2');
INSERT INTO TEST_LIKE VALUES (3,'홍길동구');
INSERT INTO TEST_LIKE VALUES (4,'홍길동대문');
INSERT INTO TEST_LIKE VALUES (5,'홍길동2다');
INSERT INTO TEST_LIKE VALUES (6,'김홍길동');
INSERT INTO TEST_LIKE VALUES (7,'김홍길동만');
INSERT INTO TEST_LIKE VALUES (8,'김만홍길동구');
INSERT INTO TEST_LIKE VALUES (9,'김만홍길동이다');
INSERT INTO TEST_LIKE VALUES (10,'김만홍길이다');
COMMIT;

----
SELECT * FROM TEST_LIKE;
SELECT * FROM TEST_LIKE WHERE NAME = '홍길동';
SELECT * FROM TEST_LIKE WHERE NAME LIKE '홍길동';
SELECT * FROM TEST_LIKE WHERE NAME LIKE '홍길동%';
SELECT * FROM TEST_LIKE WHERE NAME LIKE '홍길동2%';
SELECT * FROM TEST_LIKE WHERE NAME LIKE '%홍길동';
SELECT * FROM TEST_LIKE WHERE NAME LIKE '홍길동';
SELECT * FROM TEST_LIKE WHERE NAME LIKE '%홍길동%';
SELECT * FROM TEST_LIKE WHERE NAME LIKE '_홍길동_'; --반드시 5글자
SELECT * FROM TEST_LIKE WHERE NAME LIKE '_홍길동_%'; --최소 5글자 이상
SELECT * FROM TEST_LIKE WHERE NAME LIKE '_홍길동%'; --최소 4글자 이상
SELECT * FROM TEST_LIKE WHERE NAME LIKE '__홍길동%'; -- 최소 5글자이상

