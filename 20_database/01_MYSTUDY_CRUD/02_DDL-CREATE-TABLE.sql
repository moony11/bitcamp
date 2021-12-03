-- �����ּ� ��ȣ
/*
������ �ּ� ��ȣ
*/
-- String name �ڹ�
-- �����ҋ��� , �� ����
-- ������ ������� ���̺� ����
-- DDM
CREATE TABLE MEMBER ( 
-- �÷� �����ϱ�
-- �÷��� �������� Ÿ��(ũ��) �������� - (���������� �ɼǻ���)
    ID VARCHAR2 (20) PRIMARY KEY, -- NOT NULL + UNIQUE �ΰ�, �ߺ� �ȵ�
    NAME VARCHAR2 (30) NOT NULL,
    PASSWORD VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(20),
    ADDRESS VARCHAR2 (300)
); 
------
-- DML
INSERT INTO MEMBER (ID, NAME, PASSWORD)
VALUES('HONG', 'ȫ�浿', '1234');

-- DCL
COMMIT;
ROLLBACK; -- �ӽ�ó���� �۾� ���

INSERT INTO MEMBER (ID, NAME, PASSWORD)
VALUES ('HONG2', 'ȫ�浿2', '1234');
COMMIT;

-- Ű �ߺ� �Է½� : ORA-00001: unique constraint (MYSTUDY.SYS_C006999) violated

INSERT INTO MEMBER (ID, NAME, PASSWORD)
VALUES ('HONG2', 'ȫ�浿2', '1234');

-- NOT NULL ������ ���Է� ���� : 
INSERT INTO MEMBER (ID, NAME, PASSWORD)
VALUES ('HONG2', 'ȫ�浿2');

-----------------------------------------
SELECT * FROM MEMBER;
SELECT ID, PASSWORD, NAME, PHONE FROM MEMBER;

----------------------
-- �Է� : �÷����� ��������� ���� �ʰ� INSERT�� �ۼ�
-- ���̺� �ִ� ��� �÷� ��� + �÷� ������� ������ �Է�
INSERT INTO MEMBER 
VALUES('HONG3', 'ȫ�浿3', '1234', '010-1111-1111', '�����');
COMMIT;

INSERT INTO MEMBER 
VALUES('HONG4', 'ȫ�浿4', '1234', '�����', '010-1111-1111');
COMMIT;

INSERT INTO MEMBER (ID, NAME, PASSWORD, ADDRESS, PHONE)
VALUES('HONG5', 'ȫ�浿5', '1234', '�����', '010-2222-2222');
COMMIT;
SELECT * FROM MEMBER;

--------------------------
-- ���� : HONG4 ��ȭ��ȣ 010-2222-2222 FH QUSRUD 
-- ���� : HONG4 �ּ� '�����'�� ����
-- ��ü�÷� ���� * ���� ��� ID����
SELECT * FROM MEMBER WHERE ID = 'HONG4'; --Ư�������� ����
UPDATE member SET PHONE = '010-2222-2222' WHERE ID = 'HONG4';
UPDATE MEMBER SET ADDRESS = '�����' WHERE ID = 'HONG4';
UPDATE MEMBER 
    SET PHONE = '010-2222-2222', ADRESS = '�����'
    WHERE ID = 'HONG4';
COMMIT;
-------------------------------
-- ���� HONG5 ������ ����
SELECT * FROM MEMBER WHERE ID = 'HONG5';
-- DELETE FROM MEMBER; ������̺� ��ü ���� 
DELETE FROM MEMBER WHERE ID = 'HONG5';
COMMIT;
-- ���� : �̸��� ȫ�浿�� ��� ����
SELECT * FROM MEMBER WHERE NAME = 'ȫ�浿';
DELETE FROM MEMBER WHERE NAME = 'ȫ�浿';
COMMIT;

--==================
/* (�ǽ�) �Է�C, ����U, ����D, ��ȸ(�˻�) R
�Է� : ���̵� - HONG8, �̸� : ȫ�浿8, ��ȣ : 1111, �ּ� : ����� ������
��ȸ(�˻�) : �̸��� 'ȫ�浿8' �� ����� ���̵�, �̸�, �ּ�, ��ȸ��ȣ �� ��ȸ
���� : ���̵� 'HONG8' ����� 
    ��ȭ��ȣ : 010-8888-8888
    ��ȣ : 8888
    �ּ� : ����� ������ 
���� : ���̵� HONG3 �� ���     

**************************/
-- �Է�
INSERT INTO MEMBER (ID, NAME, PASSWORD, ADDRESS)
VALUES ('HONG8', 'ȫ�浿8', '1111', '����� ������');
COMMIT;

-- ��ȸ �˻�
SELECT * FROM MEMBER WHERE NAME = 'ȫ�浿8';
SELECT ID, NAME, ADDRESS, PHONE FROM MEMBER WHERE NAME = 'ȫ�浿8';

-- ����
UPDATE MEMBER SET PHONE = '010-8888-8888' WHERE ID = 'HONG8';
UPDATE MEMBER SET PASSWORD = '8888' WHERE ID ='HONG8';
UPDATE MEMBER SET ADDRESS = '����� ������' WHERE ID = 'HONG8';
COMMIT;

SELECT * FROM MEMBER WHERE ID = 'HONG4';
-- ����
DELETE FROM MEMBER WHERE ID = 'HONG4';
COMMIT;

SELECT * FROM MEMBER;
-- ����
UPDATE MEMBER SET 
    PHONE = '010-8888-8899', 
    ADDRESS = '����� ��걸'
    WHERE ID = 'HONG8';


--===============================================
-- �÷� Ư���� Ȯ���ϱ� ���� ���̺�
CREATE TABLE TEST (
    NUM NUMBER(5, 2), --����Ÿ�� ��ü�ڸ��� 5�ڸ�, ������  3, �Ҽ��� 2
    STR1 CHAR(10), -- �������� ���ڿ� �׻� 10����Ʈ
    STR2 VARCHAR2(10), -- �������� ���ڿ�
    DATE1 DATE -- ��¥������ : ����Ͻú���
);
COMMIT;
INSERT INTO TEST VALUES (100.454, 'ABC', 'ABC', SYSDATE);
INSERT INTO TEST VALUES(100.455, 'ABC', 'ABC', SYSDATE); 
-- �����߻� : ������ 3�ڸ� ���� �����ѵ�, 4�ڸ� ����õ� 
--INSERT INTO TEST VALUES(1234.454, 'ABC', 'ABC', SYSDATE); 
SELECT * FROM TEST;
SELECT '-' || STR1 ||'-', '-' || STR2 || '-' FROM TEST; -- || ���ڿ����̱� 
SELECT STR1, LENGTHB(STR1), STR2, LENGTHB(STR2) FROM TEST;
---------------------------------------------------
SELECT * FROM TEST WHERE STR1 = STR2; -- ��ȸ�� ������ ����
SELECT * FROM TEST WHERE STR1 = 'ABC'; -- ����Ŭ������ ��ȸ��
SELECT * FROM TEST WHERE STR1 = 'ABC         '; -- ���DB���� 
SELECT * FROM TEST WHERE STR1 = 'ABC   '; -- ����Ŭ������ ��ȸ��
-------------
-- ����Ÿ��
SELECT * FROM TEST WHERE NUM = 100.45; -- NUMBER VS NUMBER
SELECT * FROM TEST WHERE NUM = '100.45'; -- ����Ŭ ��ȸ�� NUMBER VS ���� 
--SELECT * FROM TEST WHERE NUM = '100.45A'; -- ���� ORA-01722: invalid number
INSERT INTO TEST (STR1, STR2) VALUES ('1234567890', '1234567890');
SELECT * FROM TEST WHERE STR1 = STR2;
SELECT '-' || STR1 ||'-', '-' || STR2 || '-' FROM TEST; 
----------------------------------------------------------
-- ��¥Ÿ��
-- ��¥Ÿ���� ����Ÿ������ �����ؼ� ǥ��
SELECT DATE1, TO_CHAR(DATE1, 'YYYY-MM-DD HH24:MI:SS') FROM TEST;
SELECT DATE1, TO_CHAR(DATE1, 'YYYY/MM/DD HH24:MI:SS') FROM TEST;
SELECT DATE1, TO_CHAR(DATE1, 'YYYY.MM.DD HH24:MI:SS') FROM TEST;

-----------------------
-- �ѱ۵����� ó��( UTF-8) : ASCII �ڵ� Ibyte, �ѱ� 1���� 3byte ���
SELECT * FROM TEST;
INSERT INTO TEST (STR1, STR2) VALUES ('ABCDEFGHIJ', 'ABCDEFGHIJ');
INSERT INTO TEST (STR1, STR2) VALUES ('ABCDEFGHIJ', 'ȫ�浿'); -- �ѱ� 3����  3*3 = 9byte
INSERT INTO TEST (STR1, STR2) VALUES ('ABCDEFGHIJ', '���ѹα�'); -- �ѱ� 4����  4*3 = 12byte
----------------------------------------
/* ************* NULL(��)�� Ư�� ********
-- NULL(��) : �����Ͱ� ���� ���� 
-- NULL�� ��ó���� �ȵ� : =, <>, !=, >, <, >=, <= ��ó�� �ǹ� ���� 
-- NULL���� �������� �׻� NULL (���� �ǹ� ����)
-- NULL ���� ���� ��ȸ�� IS NULL, IS NOT NULL Ű����� ó��
****************************/
SELECT * FROM TEST WHERE NUM = NULL; -- ��ȸ�ȵ�(NULL �񱳿��� �ǹ̾���, ��������)
SELECT * FROM TEST WHERE NUM IS NULL; -- �񱳿��� �������� IS NULL�� �˻�

SELECT * FROM TEST WHERE NUM <> NULL; -- ��ȸ�ȵ�
SELECT * FROM TEST WHERE NUM IS NOT NULL; -- IS NOT NULL �˻�
--------------------------------
-- NULL���� ������ ->  NULL���� �������� �׻� NULL
SELECT * FROM TEST;
SELECT * FROM DUAL; -- DUAL ���̺� �ϸ� DUMMY ���Ժ�(����Ŭ���� ����)
SELECT 100 + 200, 111 + 222 FROM DUAL;
SELECT 100 + NULL, 100 - NULL, 100 * NULL, 100 / NULL FROM DUAL; -- ��� NULL
SELECT * FROM TEST;
SELECT NUM, NUM + 100 FROM TEST;
------------------------------
-- ���Ľ� NUL 
SELECT * FROM TEST ORDER BY STR2 ; -- �⺻ �������� ���� ���� - ���� - �ѱ�, ASC(��������) Ű���� ��������
SELECT * FROM TEST ORDER BY STR2 DESC; -- DESC : �������� ���� 

-- ���Ľ� ����Ŭ������ NULL ���� ���� ū������ ó��(�� ������ ���)
-- NULL �� ��ȸ ���� ���� : NULLS FIRST, NULLS LAST
SELECT * FROM TEST ORDER BY NUM; 
SELECT * FROM TEST ORDER BY NUM DESC;
SELECT * FROM TEST ORDER BY NUM NULLS FIRST; -- NULL ���� ��ó�� ���� 
SELECT * FROM TEST ORDER BY NUM DESC NULLS LAST; -- NULL ���� �������� ����
-----------------------------
-- NULL �� ó�� 
SELECT NUM, NUM + 100 FROM TEST;
-- NULL ó�� �����Լ� NVL(�÷�, ������) : �÷����� NULL�̸� ���������� ��ȯ(��ü)
SELECT NUM, NUM + 100, NVL(NUM, 0), NVL(NUM, 0) + 100 FROM TEST;
-------------------------------------------------
INSERT INTO TEST(NUM, STR1, STR2) VALUES (200, '', NULL);
SELECT * FROM TEST WHERE STR1 = ''; -- ��������ȸ �ȵ�. ''-> NULLó���� (����Ŭ����)
SELECT STR1, STR1 || '-�׽�Ʈ', NVL(STR1, '�������') || '-�׽�Ʈ' FROM TEST;  -- ���ڿ����̱� �ҋ��� NULL�� �ƴ϶� �� ���ڿ�ó���ȴ�.
