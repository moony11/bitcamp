-- 한줄주석 부호
/*
여러줄 주석 부호
*/
-- String name 자바
-- 나열할떄는 , 로 구분
-- 데이터 저장공간 테이블 정의
-- DDM
CREATE TABLE MEMBER ( 
-- 컬럼 정의하기
-- 컬럼명 데이터의 타입(크기) 제약조건 - (제약조건은 옵션사항)
    ID VARCHAR2 (20) PRIMARY KEY, -- NOT NULL + UNIQUE 널값, 중복 안됨
    NAME VARCHAR2 (30) NOT NULL,
    PASSWORD VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(20),
    ADDRESS VARCHAR2 (300)
); 
------
-- DML
INSERT INTO MEMBER (ID, NAME, PASSWORD)
VALUES('HONG', '홍길동', '1234');

-- DCL
COMMIT;
ROLLBACK; -- 임시처리된 작업 취소

INSERT INTO MEMBER (ID, NAME, PASSWORD)
VALUES ('HONG2', '홍길동2', '1234');
COMMIT;

-- 키 중복 입력시 : ORA-00001: unique constraint (MYSTUDY.SYS_C006999) violated

INSERT INTO MEMBER (ID, NAME, PASSWORD)
VALUES ('HONG2', '홍길동2', '1234');

-- NOT NULL 데이터 미입력 오류 : 
INSERT INTO MEMBER (ID, NAME, PASSWORD)
VALUES ('HONG2', '홍길동2');

-----------------------------------------
SELECT * FROM MEMBER;
SELECT ID, PASSWORD, NAME, PHONE FROM MEMBER;

----------------------
-- 입력 : 컬럼명을 명시적으로 쓰지 않고 INSERT문 작성
-- 테이블에 있는 모든 컬럼 사용 + 컬럼 순서대로 데이터 입력
INSERT INTO MEMBER 
VALUES('HONG3', '홍길동3', '1234', '010-1111-1111', '서울시');
COMMIT;

INSERT INTO MEMBER 
VALUES('HONG4', '홍길동4', '1234', '서울시', '010-1111-1111');
COMMIT;

INSERT INTO MEMBER (ID, NAME, PASSWORD, ADDRESS, PHONE)
VALUES('HONG5', '홍길동5', '1234', '서울시', '010-2222-2222');
COMMIT;
SELECT * FROM MEMBER;

--------------------------
-- 수정 : HONG4 전화번호 010-2222-2222 FH QUSRUD 
-- 수정 : HONG4 주소 '서울시'로 변경
-- 전체컬럼 선택 * 그중 어디 ID인지
SELECT * FROM MEMBER WHERE ID = 'HONG4'; --특정데이터 선택
UPDATE member SET PHONE = '010-2222-2222' WHERE ID = 'HONG4';
UPDATE MEMBER SET ADDRESS = '서울시' WHERE ID = 'HONG4';
UPDATE MEMBER 
    SET PHONE = '010-2222-2222', ADRESS = '서울시'
    WHERE ID = 'HONG4';
COMMIT;
-------------------------------
-- 삭제 HONG5 데이터 삭제
SELECT * FROM MEMBER WHERE ID = 'HONG5';
-- DELETE FROM MEMBER; 멤버테이블 전체 삭제 
DELETE FROM MEMBER WHERE ID = 'HONG5';
COMMIT;
-- 삭제 : 이름이 홍길동인 사람 삭제
SELECT * FROM MEMBER WHERE NAME = '홍길동';
DELETE FROM MEMBER WHERE NAME = '홍길동';
COMMIT;

--==================
/* (실습) 입력C, 수정U, 삭제D, 조회(검색) R
입력 : 아이디 - HONG8, 이름 : 홍길동8, 암호 : 1111, 주소 : 서울시 마포구
조회(검색) : 이름이 '홍길동8' 인 사람의 아이디, 이름, 주소, 전회번호 만 조회
수정 : 아이디가 'HONG8' 사람의 
    전화번호 : 010-8888-8888
    암호 : 8888
    주소 : 서울시 강남구 
삭제 : 아이디가 HONG3 인 사람     

**************************/
-- 입력
INSERT INTO MEMBER (ID, NAME, PASSWORD, ADDRESS)
VALUES ('HONG8', '홍길동8', '1111', '서울시 마포구');
COMMIT;

-- 조회 검색
SELECT * FROM MEMBER WHERE NAME = '홍길동8';
SELECT ID, NAME, ADDRESS, PHONE FROM MEMBER WHERE NAME = '홍길동8';

-- 수정
UPDATE MEMBER SET PHONE = '010-8888-8888' WHERE ID = 'HONG8';
UPDATE MEMBER SET PASSWORD = '8888' WHERE ID ='HONG8';
UPDATE MEMBER SET ADDRESS = '서울시 강남구' WHERE ID = 'HONG8';
COMMIT;

SELECT * FROM MEMBER WHERE ID = 'HONG4';
-- 삭제
DELETE FROM MEMBER WHERE ID = 'HONG4';
COMMIT;

SELECT * FROM MEMBER;
-- 수정
UPDATE MEMBER SET 
    PHONE = '010-8888-8899', 
    ADDRESS = '서울시 용산구'
    WHERE ID = 'HONG8';


--===============================================
-- 컬럼 특성을 확인하기 위한 테이블
CREATE TABLE TEST (
    NUM NUMBER(5, 2), --숫자타입 전체자릿수 5자리, 정수부  3, 소수부 2
    STR1 CHAR(10), -- 고정길이 문자열 항상 10바이트
    STR2 VARCHAR2(10), -- 가변길이 문자열
    DATE1 DATE -- 날짜데이터 : 년월일시분초
);
COMMIT;
INSERT INTO TEST VALUES (100.454, 'ABC', 'ABC', SYSDATE);
INSERT INTO TEST VALUES(100.455, 'ABC', 'ABC', SYSDATE); 
-- 오류발생 : 정수부 3자리 저장 가능한데, 4자리 저장시도 
--INSERT INTO TEST VALUES(1234.454, 'ABC', 'ABC', SYSDATE); 
SELECT * FROM TEST;
SELECT '-' || STR1 ||'-', '-' || STR2 || '-' FROM TEST; -- || 문자열붙이기 
SELECT STR1, LENGTHB(STR1), STR2, LENGTHB(STR2) FROM TEST;
---------------------------------------------------
SELECT * FROM TEST WHERE STR1 = STR2; -- 조회된 데이터 없음
SELECT * FROM TEST WHERE STR1 = 'ABC'; -- 오라클에서는 조회됨
SELECT * FROM TEST WHERE STR1 = 'ABC         '; -- 모든DB적용 
SELECT * FROM TEST WHERE STR1 = 'ABC   '; -- 오라클에서는 조회됨
-------------
-- 숫자타입
SELECT * FROM TEST WHERE NUM = 100.45; -- NUMBER VS NUMBER
SELECT * FROM TEST WHERE NUM = '100.45'; -- 오라클 조회됨 NUMBER VS 문자 
--SELECT * FROM TEST WHERE NUM = '100.45A'; -- 오류 ORA-01722: invalid number
INSERT INTO TEST (STR1, STR2) VALUES ('1234567890', '1234567890');
SELECT * FROM TEST WHERE STR1 = STR2;
SELECT '-' || STR1 ||'-', '-' || STR2 || '-' FROM TEST; 
----------------------------------------------------------
-- 날짜타입
-- 날짜타입을 문자타입으로 변경해서 표시
SELECT DATE1, TO_CHAR(DATE1, 'YYYY-MM-DD HH24:MI:SS') FROM TEST;
SELECT DATE1, TO_CHAR(DATE1, 'YYYY/MM/DD HH24:MI:SS') FROM TEST;
SELECT DATE1, TO_CHAR(DATE1, 'YYYY.MM.DD HH24:MI:SS') FROM TEST;

-----------------------
-- 한글데이터 처리( UTF-8) : ASCII 코드 Ibyte, 한글 1글자 3byte 사용
SELECT * FROM TEST;
INSERT INTO TEST (STR1, STR2) VALUES ('ABCDEFGHIJ', 'ABCDEFGHIJ');
INSERT INTO TEST (STR1, STR2) VALUES ('ABCDEFGHIJ', '홍길동'); -- 한글 3글자  3*3 = 9byte
INSERT INTO TEST (STR1, STR2) VALUES ('ABCDEFGHIJ', '대한민국'); -- 한글 4글자  4*3 = 12byte
----------------------------------------
/* ************* NULL(널)의 특성 ********
-- NULL(널) : 데이터가 없는 상태 
-- NULL은 비교처리가 안됨 : =, <>, !=, >, <, >=, <= 비교처리 의미 없음 
-- NULL과의 연산결과는 항상 NULL (연산 의미 없음)
-- NULL 값에 대한 조회는 IS NULL, IS NOT NULL 키워드로 처리
****************************/
SELECT * FROM TEST WHERE NUM = NULL; -- 조회안됨(NULL 비교연산 의미없음, 하지말것)
SELECT * FROM TEST WHERE NUM IS NULL; -- 비교연산 하지말고 IS NULL로 검색

SELECT * FROM TEST WHERE NUM <> NULL; -- 조회안됨
SELECT * FROM TEST WHERE NUM IS NOT NULL; -- IS NOT NULL 검색
--------------------------------
-- NULL과의 연산결과 ->  NULL과의 연산결과는 항상 NULL
SELECT * FROM TEST;
SELECT * FROM DUAL; -- DUAL 테이블 일명 DUMMY 테입블(오라클에서 제공)
SELECT 100 + 200, 111 + 222 FROM DUAL;
SELECT 100 + NULL, 100 - NULL, 100 * NULL, 100 / NULL FROM DUAL; -- 결과 NULL
SELECT * FROM TEST;
SELECT NUM, NUM + 100 FROM TEST;
------------------------------
-- 정렬시 NUL 
SELECT * FROM TEST ORDER BY STR2 ; -- 기본 오름차순 정렬 숫자 - 영어 - 한글, ASC(오름차순) 키워드 생략가능
SELECT * FROM TEST ORDER BY STR2 DESC; -- DESC : 내림차순 정렬 

-- 정렬시 오라클에서는 NULL 값을 가장 큰값으로 처리(맨 마지막 출력)
-- NULL 값 조회 순서 조정 : NULLS FIRST, NULLS LAST
SELECT * FROM TEST ORDER BY NUM; 
SELECT * FROM TEST ORDER BY NUM DESC;
SELECT * FROM TEST ORDER BY NUM NULLS FIRST; -- NULL 값을 맨처음 선택 
SELECT * FROM TEST ORDER BY NUM DESC NULLS LAST; -- NULL 값을 마지막에 선택
-----------------------------
-- NULL 값 처리 
SELECT NUM, NUM + 100 FROM TEST;
-- NULL 처리 내장함수 NVL(컬럼, 설정값) : 컬럼값이 NULL이면 설정값으로 변환(대체)
SELECT NUM, NUM + 100, NVL(NUM, 0), NVL(NUM, 0) + 100 FROM TEST;
-------------------------------------------------
INSERT INTO TEST(NUM, STR1, STR2) VALUES (200, '', NULL);
SELECT * FROM TEST WHERE STR1 = ''; -- 데이터조회 안됨. ''-> NULL처리됨 (오라클에선)
SELECT STR1, STR1 || '-테스트', NVL(STR1, '내용없음') || '-테스트' FROM TEST;  -- 문자열붙이기 할떄는 NULL이 아니라 빈 문자열처리된다.
