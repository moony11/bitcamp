/* (�ǽ�) ���̺� ����� (���̺�� TEST2)
    NO : ����Ÿ�� 5�ڸ�, PRIMARY KEY ����
    ID : ����Ÿ�� 10�ڸ�(����10�ڸ�), ���� �ݵ�� ����(NULL������)
    NAME : �ѱ� 10�ڸ� ���� �����ϵ��� ����, ���� �ݵ�� ����
    EMAIL : ����, ����, Ư������ ���� 30�ڸ�
    ADDRESS : �ѱ� 100WK
    INNUM : ����Ÿ�� ������ 7�ڸ�, �Ҽ��� 3�ڸ�(1234567,123)
    REGDATE : ��¥Ÿ�� 
    
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
    VALUES (00001, 'AAA', 'ȫ�浿', 'AAA@NAVER.COM', '����� ��걸', 1234567.123, SYSDATE);
COMMIT;

INSERT INTO TEST2 (NO, ID, NAME, EMAIL, ADDRESS, INNUM, REGDATE)
    VALUES (00002, 'BBB', '������', 'BBB@NAVER.COM', '����� ������', 2345678.123, SYSDATE);
INSERT INTO TEST2 (NO, ID, NAME, EMAIL, ADDRESS, INNUM, REGDATE)
    VALUES (00003, 'CCC', '��������', 'CCC@NAVER.COM', '����� ���빮��', 111111.123, SYSDATE);
INSERT INTO TEST2 (NO, ID, NAME, EMAIL, ADDRESS, INNUM, REGDATE)
    VALUES (00004, 'DDD', '������', 'DDD@NAVER.COM', '����� �߱�', 222222.123, SYSDATE);
COMMIT;

SELECT * FROM TEST2 WHERE EMAIL = 'BBB@NAVER.COM';
SELECT * FROM TEST2 WHERE INNUM = 222222.123;
SELECT '-' || ID ||'-', '-' || NAME || '-' FROM TEST2; 
COMMIT;
SELECT * FROM TEST2;

INSERT INTO TEST2 (NO, ID, NAME, EMAIL, ADDRESS, INNUM, REGDATE)
    VALUES (10004, 'EEE', '�苯��', 'EEE@NAVER.COM', '����� ������', 212312.123, SYSDATE);

SELECT * FROM TEST2 ORDER BY NO DESC;
SELECT REGDATE, TO_CHAR(REGDATE, 'YYYY-MM-DD HH24:MI:SS') FROM TEST2;
SELECT * FROM TEST2;

INSERT INTO TEST2 (NO, ID, NAME) -- �÷��ۼ��� �÷��̸� ��ü�� �����Ͱ� ����
VALUES(22, 'TEST2', 'ȫ�浿2');

INSERT INTO TEST2 (NO, NAME, ID)
VALUES(33, 'ȫ�浿3', 'TEST3');
COMMIT;
SELECT * FROM TEST2;
--============================================

-- Ư�� ���̺��� �����Ϳ� �Բ� ���̺� ������ �Բ� ���� 
CREATE TABLE TEST3
AS 
SELECT * FROM TEST2;

SELECT * FROM TEST2;
SELECT * FROM TEST3;
------------------------------------
-- Ư�� ���̺��� Ư�� �÷��� Ư�� �����͸� �����ؼ� ���̺� ����
CREATE TABLE TEST4 
AS 
SELECT NO, ID, NAME, EMAIL FROM TEST2 WHERE NO = 10004;
SELECT * FROM TEST4;
-----------------------
-- Ư�� ���̺� ������ ���� (�����ʹ� �������� ����)
CREATE TABLE TEST5
AS
SELECT * FROM TEST2 WHERE 1 = 2;  
-- 1=2 WHERE ���� FALSE ������ ���� ����, 1=1 WHERE ������ TRUE �� �����ؿ��°Ͱ� ���� 

--===============================
SELECT * FROM TEST2;
DELETE FROM TEST2 WHERE ID = 'TEST3';

-- ���̺� ��ü ������ ��ü ����
DELETE FROM TEST2; -- ��� ������ ����
ROLLBACK; -- DELETE ���� ROLLBACK ��ɹ����� ������ ���� ���� 
-----------------------------------
-- TRUNCATE ��ɹ� : ���̺� ������ ��ü ���� ó��(ROLLBACK �Ұ���)
TRUNCATE TABLE TEST2;
ROLLBACK;

--============================
/* ���̺��� ���� : DROP TABLE - �����Ϳ� �Բ� ���̺����� ��� ����ó�� 
    DROP TABLE ������.���̺��;
    drop table ������.���̺�� cascade constraints PURGE;
    - cascade constraints : ���������Ͱ� �־ ����ó��
    - PURGE : �����뿡 ������� ������ ����
*/
DROP TABLE TEST2;

--=========================
/* ���̺� ���� : �÷� �߰�, ����, ����
DDL : ALTER TABLE 
- ADD : �߰�
- MODIFY : ����  - ������ ���¿� ���� ���� ���� ���� ����(������, �������� ��)
    -- �÷������� ���� -> ū : ������ ����
    -- �÷������� ū -> ���� : ����� �����Ϳ� ���� �ٸ� 

- DROP COLUMN : ����


************/

SELECT * FROM TEST3;
-- �÷��߰� TEST3 ���̺� ADDCOL �÷� �߰�
ALTER TABLE TEST3 ADD ADDCOL VARCHAR2(10);

-- �÷� ���� TEST3 ���̺� ADDCOL ũ�� -> VARCHAR2(20)
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(20);
UPDATE TEST3 SET ADDCOL = '123456789012345';
SELECT * FROM TEST3;

-- �÷����� TEST3 ���̺��� ADDCOL ũ��- VARCHAR2(15), VARCHAR(10)
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(15); -- �̹� ��� ���� ū ������ 15 : ���� OK
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(10); -- �̹� ��� ���� ū ������ 15 : ���� NO

-- �÷� ���� : DROP COLUMN 
ALTER TABLE TEST3 DROP COLUMN ADDCOL;
----------------------
ALTER TABLE TEST3 RENAME COLUMN INNUM TO TESTNUM;
SELECT * FROM TEST3;
ALTER TABLE TEST3 MODIFY (TESTNUM NOT NULL); -- �̹� NULL�� ���� �ֱ⶧���� ���� �Ұ� 
alter table "MYSTUDY"."TEST3" rename to TEST333; -- ���̺�� ���� 
