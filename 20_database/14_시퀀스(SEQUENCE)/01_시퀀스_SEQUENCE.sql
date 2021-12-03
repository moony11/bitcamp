/* 시퀀스 (SEQUENCE)****
SEQUENCE : DB에서 제공하는 자동채번 객체
생성 : CREATE SEQUENCE 시퀀스명;
삭제 : DROP SEQUENCE : 시퀀스명;

시퀀스명.NEXTVAL : 시퀀스 번호(값) 생성
시퀀스명.CURRVAL : 현재 시퀀스값 확인(NEXTVAL 한번 이상 실행 후 사용가능)

****************/

 CREATE SEQUENCE  "MADANG"."SEQUENCE1"  
 MINVALUE 1 MAXVALUE 9999999999999999999999999999 
 INCREMENT BY 1 
 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;

-------------------------------
SELECT * FROM BOOK;
SELECT NVL(MAX(BOOKID), 0), NVL(MAX(BOOKID), 0) + 1 FROM BOOK;
SELECT NVL(MAX(BBB), 0), NVL(MAX(BBB), 0) + 1 FROM BBB;

------------------------
SELECT SEQUENCE1.NEXTVAL FROM DUAL; -- 실행할때마다 1씩 증감 
SELECT SEQUENCE1.CURRVAL FROM DUAL;
---------------------------------
-- BOOK 테이블에 INSERT작업 , BOOKID 최대값 + 1 형태
INSERT INTO BOOK
        (BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES ((SELECT NVL(MAX(BOOKID), 0) + 1 FROM BOOK) 
        , 'MAX + 1 적용', 'ITBOOK', 2000)
;
INSERT INTO BOOK
        (BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES ((SELECT NVL(MAX(BOOKID), 0) + 1 FROM BOOK) 
        , 'MAX + 1 적용', 'ITBOOK', 2000)
;
SELECT * FROM BOOK ORDER BY BOOKID DESC;

-------------------------------------------
-- 시퀀스 사용 (시작번호 50, NOCACHE)
 CREATE SEQUENCE SEQ_BOOK
 START WITH 50  
 INCREMENT BY 1 --생략시 동일하게 WJRDYD(DEFAULT 1)
 NOCACHE;
-------------------------
-- BOOK 테이블에 시퀀스 사용해서 데이터 입력 처리
INSERT INTO BOOK
        (BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES (SEQ_BOOK.NEXTVAL, '시퀀스 사용', 'ITBOOK', 25000)
;
SELECT * FROM BOOK ORDER BY BOOKID DESC;

SELECT SEQ_BOOK.NEXTVAL FROM DUAL;

-------------------------------------------

   


