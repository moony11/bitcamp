/* (실습) 테이블 만들기 (테이블명 TEST2)
    NO : 숫자타입 5자리, PRIMARY KEY 선언
    ID : 문자타입 10자리(영문10자리), 값이 반드시 존재(NULL허용안함)
    NAME : 한글 10자리 저장 가능하도록 설정, 값이 반드시 존재
    EMAIL : 영문, 숫자, 특수문자 포함 30자리
    ADDRESS : 한글 100WK
    INNUM : 숫자타입 정수부 7자리, 소수부 3자리(1234567,123)
    REGDATE : 날짜타입 
    
********************/

CREATE TABLE TEST2 (
    NO NUMBER (5) PRIMARY KEY,
    ID VARCHAR2(10) NOT NULL,
    NAME VARCHAR2(30) NOT NULL,
    EMAIL VARCHAR2 (30),
    ADDRESS VARCHAR2 (300),
    INNUM NUMBER(10, 3),
    REGDATE DATE

);
COMMIT;
SELECT * FROM TEST2;
INSERT INTO TEST2 (NO, ID, NAME, EMAIL, ADDRESS, INNUM, REGDATE)
    VALUES (00001, 'AAA', '홍길동', 'AAA@NAVER.COM', '서울시 용산구', 1234567.123, SYSDATE);
COMMIT;

INSERT INTO TEST2 (NO, ID, NAME, EMAIL, ADDRESS, INNUM, REGDATE)
    VALUES (00002, 'BBB', '김유신', 'BBB@NAVER.COM', '서울시 마포구', 2345678.123, SYSDATE);
INSERT INTO TEST2 (NO, ID, NAME, EMAIL, ADDRESS, INNUM, REGDATE)
    VALUES (00003, 'CCC', '을지문덕', 'CCC@NAVER.COM', '서울시 서대문구', 111111.123, SYSDATE);
INSERT INTO TEST2 (NO, ID, NAME, EMAIL, ADDRESS, INNUM, REGDATE)
    VALUES (00004, 'DDD', '강감찬', 'DDD@NAVER.COM', '서울시 중구', 222222.123, SYSDATE);
COMMIT;

SELECT * FROM TEST2 WHERE EMAIL = 'BBB@NAVER.COM';
SELECT * FROM TEST2 WHERE INNUM = 222222.123;
SELECT '-' || ID ||'-', '-' || NAME || '-' FROM TEST2; 
COMMIT;
SELECT * FROM TEST2;

INSERT INTO TEST2 (NO, ID, NAME, EMAIL, ADDRESS, INNUM, REGDATE)
    VALUES (10004, 'EEE', '김떙떙', 'EEE@NAVER.COM', '서울시 강남구', 212312.123, SYSDATE);

SELECT * FROM TEST2 ORDER BY NO DESC;
SELECT REGDATE, TO_CHAR(REGDATE, 'YYYY-MM-DD HH24:MI:SS') FROM TEST2;
SELECT * FROM TEST2;

INSERT INTO TEST2 (NO, ID, NAME) -- 컬럼작성시 컬럼이름 위체게 데이터가 매핑
VALUES(22, 'TEST2', '홍길동2');

INSERT INTO TEST2 (NO, NAME, ID)
VALUES(33, '홍길동3', 'TEST3');
COMMIT;
SELECT * FROM TEST2;
--============================================

-- 특정 데이블의 데이터와 함께 테이블 구조를 함께 복사 
CREATE TABLE TEST3
AS 
SELECT * FROM TEST2;

SELECT * FROM TEST2;
SELECT * FROM TEST3;
------------------------------------
-- 특정 테이블의 특정 컬럼과 특정 데이터만 복사해서 테이블 생성
CREATE TABLE TEST4 
AS 
SELECT NO, ID, NAME, EMAIL FROM TEST2 WHERE NO = 10004;
SELECT * FROM TEST4;
-----------------------
-- 특정 테이블 구조만 복사 (데이터는 복사하지 않음)
CREATE TABLE TEST5
AS
SELECT * FROM TEST2 WHERE 1 = 2;  
-- 1=2 WHERE 조건 FALSE 데이터 선택 안함, 1=1 WHERE 조건이 TRUE 다 복사해오는것과 같음 

--===============================
SELECT * FROM TEST2;
DELETE FROM TEST2 WHERE ID = 'TEST3';

-- 테이블 전체 데이터 전체 삭제
DELETE FROM TEST2; -- 모든 데이터 삭제
ROLLBACK; -- DELETE 문은 ROLLBACK 명령문으로 데이터 복구 가능 
-----------------------------------
-- TRUNCATE 명령문 : 테이블 데이터 전체 삭제 처리(ROLLBACK 불가능)
TRUNCATE TABLE TEST2;
ROLLBACK;

--============================
/* 테이블을 삭제 : DROP TABLE - 데이터와 함께 테이블구조도 모두 삭제처리 
    DROP TABLE 유저명.테이블명;
    drop table 유저명.테이블명 cascade constraints PURGE;
    - cascade constraints : 참조데이터가 있어도 삭제처리
    - PURGE : 휴지통에 백업없이 완전히 삭제
*/
DROP TABLE TEST2;

--=========================
/* 테이블 수정 : 컬럼 추가, 수정, 삭제
DDL : ALTER TABLE 
- ADD : 추가
- MODIFY : 수정  - 데이터 상태에 따라 적용 가능 여부 결정(사이즈, 제약조건 등)
    -- 컬럼사이즈 작은 -> 큰 : 언제나 가능
    -- 컬럼사이즈 큰 -> 작은 : 저장된 데이터에 따라 다름 

- DROP COLUMN : 삭제


************/

SELECT * FROM TEST3;
-- 컬럼추가 TEST3 테이블에 ADDCOL 컬럼 추가
ALTER TABLE TEST3 ADD ADDCOL VARCHAR2(10);

-- 컬럼 수정 TEST3 테이블에 ADDCOL 크기 -> VARCHAR2(20)
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(20);
UPDATE TEST3 SET ADDCOL = '123456789012345';
SELECT * FROM TEST3;

-- 컬럼수정 TEST3 테이블의 ADDCOL 크기- VARCHAR2(15), VARCHAR(10)
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(15); -- 이미 담긴 가장 큰 데이터 15 : 변경 OK
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(10); -- 이미 담긴 가장 큰 데이터 15 : 변경 NO

-- 컬럼 삭제 : DROP COLUMN 
ALTER TABLE TEST3 DROP COLUMN ADDCOL;
----------------------
ALTER TABLE TEST3 RENAME COLUMN INNUM TO TESTNUM;
SELECT * FROM TEST3;
ALTER TABLE TEST3 MODIFY (TESTNUM NOT NULL); -- 이미 NULL인 값이 있기때문에 수정 불가 
alter table "MYSTUDY"."TEST3" rename to TEST333; -- 테이블명 변경 
