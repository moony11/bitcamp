--Http ��Ʈ ���� : 8080 -> 8090 ��ҹ��� ���NO
-- DB ��ġ �� HTTP��Ʈ��ȣ Ȯ�� : 8080 
SELECT DBMS_XDB.GETHTTPPORT() FROM DUAL;

-- Http ��Ʈ 8090 ���� ����
EXEC dbms_xdb.sethttpport(8090);

-- DB ��ġ �� HTTP��Ʈ��ȣ Ȯ�� : 8090 
SELECT DBMS_XDB.GETHTTPPORT() FROM DUAL;