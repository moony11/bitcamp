--Http 포트 변경 : 8080 -> 8090 대소문자 상관NO
-- DB 설치 후 HTTP포트번호 확인 : 8080 
SELECT DBMS_XDB.GETHTTPPORT() FROM DUAL;

-- Http 포트 8090 으로 변경
EXEC dbms_xdb.sethttpport(8090);

-- DB 설치 후 HTTP포트번호 확인 : 8090 
SELECT DBMS_XDB.GETHTTPPORT() FROM DUAL;