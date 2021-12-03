-- ������ �� ID
SELECT CUSTID FROM CUSTOMER WHERE NAME = '������'; -- CUSTID : 1
---�������� ������ å�� �հ�ݾ� 
SELECT * FROM ORDERS WHERE CUSTID = 1;
SELECT SUM(SALEPRICE) FROM ORDERS WHERE CUSTID = 1;

-- ��������(SUB QUERY) ���
SELECT SUM(SALEPRICE) FROM ORDERS 
WHERE CUSTID = (SELECT CUSTID FROM CUSTOMER WHERE NAME = '������');

--================================
--���̺� ����(JOIN) ���
SELECT * FROM CUSTOMER WHERE CUSTID = 1;
SELECT * FROM ORDERS WHERE CUSTID = 1;

-- CUSTOMER, ORDERS ���̺� ������ ���� ��ȸ
SELECT *
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
AND NAME = '������'
;
-----------------------
-- ���̺� ���� ��Ī ������� �����ϰ� ǥ���ϰ� ���
-- ��Ī����ϴ� �������ʹ� ��Ī �� ���� �̸��� ���� �ȵ�
-- ������ �÷����� 2���� ���� �ȵ� �׷��� ���������� ORDERS �� CUSTID_1�� �����
SELECT *
FROM CUSTOMER C, ORDERS O -- ���̺� ��Ī ���
WHERE C.CUSTID = O.CUSTID -- ��������
AND C.NAME = '������' -- �˻�����
;
-- ANSI ǥ�� ���� ����
SELECT *
FROM CUSTOMER C INNER JOIN ORDERS O
    ON C.CUSTID = O.CUSTID -- ��������
WHERE C.NAME = '������' -- �˻�����
;
-----------------
-- �������� ������ �հ�ݾ�
SELECT SUM(O.SALEPRICE)
--SELECT *
FROM CUSTOMER C, ORDERS O -- ���������̺�
WHERE C.CUSTID = O.CUSTID -- ��������
AND C.NAME = '������' -- �˻�����
;

----------------------------
-- ������ å�� �Ǹŵ� å ��� (�̵��� ������ ���ǻ�)
SELECT *
FROM BOOK B, ORDERS O
WHERE B.BOOKID = O.BOOKID -- ��������
-- AND B.PUBLISHER = '�½�����'
AND B.PUBLISHER LIKE '%�̵��'
ORDER BY B.PUBLISHER, B.BOOKNAME
;
--==================
-- (�ǽ�) ���̺� �����ؼ� ��û ������ ã�� 
-- 1. '�߱��� ������' ��� å�� �ȸ� ���� Ȯ�� (å����, �Ǹűݾ�, �Ǹ�����)
SELECT B.BOOKNAME, O.SALEPRICE, O.ORDERDATE 
FROM BOOK B, ORDERS O
WHERE B.BOOKID = O.BOOKID
AND B.BOOKNAME = '�߱��� ��Ź��'
;

-- 2. '�߱��� ������' ��� å�� ����� �ȷȴµ� Ȯ��
SELECT COUNT (*)
FROM BOOK B, ORDERS O
WHERE B.BOOKID = O.BOOKID
AND B.BOOKNAME = '�߱��� ��Ź��'
;


-- 3. '�߽ż�'�� ������ å ���� ��������(å��, ��������, å���� ���ϸ�)
SELECT O.SALEPRICE, O.ORDERDATE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
AND C.NAME = '�߽ż�'
;



-- 4. '�߽ż�'�� ������ �հ�ݾ� Ȯ��
SELECT SUM(O.SALEPRICE)
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
AND C.NAME = '�߽ż�'
;


-- 5. ������, �߽ż��� ������ ������ Ȯ��(�̸�, �Ǹűݾ�, �Ǹ�����)
SELECT C.NAME, O.SALEPRICE, O.ORDERDATE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID AND(C.NAME = '�߽ż�' OR C.NAME = '������')
;
--AND OR ��� ������ ���η� ��� �켱���� ��Ȯ�� ���� ��� 

SELECT C.NAME, O.SALEPRICE, O.ORDERDATE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID 
AND C.NAME IN('�߽ż�', '������')
ORDER BY C.NAME, O.ORDERDATE
;


--============================================
-- 3�� ���̺� ����(����) �ؼ� ������ ��ȸ(�˻�, ����)
-- ����, å����, ���ǻ�, �ǸŰ���, �Ǹ�����
SELECT C.NAME, B.BOOKNAME, B.PUBLISHER, O.SALEPRICE, O.ORDERDATE
 FROM ORDERS O, BOOK B, CUSTOMER C
 WHERE O.BOOKID = B.BOOKID -- ��������
   AND O.CUSTID = C.CUSTID -- ��������
;
SELECT C.NAME, B.BOOKNAME, B.PUBLISHER, O.SALEPRICE, O.ORDERDATE
 FROM ORDERS O, BOOK B, CUSTOMER C
 WHERE B.BOOKID = O.BOOKID -- ��������
   AND O.CUSTID = C.CUSTID -- ��������
;

SELECT *
  FROM BOOK B 
       INNER JOIN ORDERS O
       ON B.BOOKID = O.BOOKID
       INNER JOIN CUSTOMER C 
       ON O.CUSTID = C.CUSTID
;
--===========================================
--(�ǽ�) BOOK, CUSTOMER, ORDERS ���̺� ������ ��ȸ
--1. ��̶��� ������ å����, ���԰���, ��������, ���ǻ�
SELECT B.BOOKNAME,O.SALEPRICE, O.ORDERDATE, B.PUBLISHER 
FROM BOOK B
     INNER JOIN ORDERS O
     ON B.BOOKID = O.BOOKID
     INNER JOIN CUSTOMER C 
     ON O.CUSTID = C.CUSTID
 WHERE C.NAME = '��̶�'
;
SELECT C.NAME, B.BOOKNAME,O.SALEPRICE, O.ORDERDATE, B.PUBLISHER
 FROM ORDERS O, BOOK B, CUSTOMER C
 WHERE O.BOOKID = B.BOOKID
   AND O.CUSTID = C.CUSTID
   AND C.NAME = '��̶�'
;


--2. ��̶��� ������ å �߿� 2014-01-01 ~ 2014-07-08���� ������ ����
SELECT B.BOOKNAME, O.ORDERDATE
FROM BOOK B
     INNER JOIN ORDERS O
     ON B.BOOKID = O.BOOKID
     INNER JOIN CUSTOMER C 
     ON O.CUSTID = C.CUSTID
 WHERE C.NAME = '��̶�'
 AND ORDERDATE BETWEEN '2014-01-01' AND '2014-07-08'
;
SELECT ORDERDATE, TO_CHAR(ORDERDATE, 'YYYY-MM-DD HH24:MI:SS') FROM ORDERS;
SELECT C.NAME, O.SALEPRICE, O.ORDERDATE
 FROM ORDERS O, CUSTOMER C
 WHERE O.CUSTID = C.CUSTID
   AND C.NAME = '��̶�'
   AND O.ORDERDATE >= TO_DATE('2014-01-01', 'YYYY-MM-DD') -- ��¥�������� ����ȯ
   AND O.ORDERDATE < TO_DATE('2014-07-09', 'YYYY-MM-DD') -- 2014-07-08 00:00:00 �ú��� ���� 0�̶� ������ ���������
;
SELECT ORDERDATE, TO_CHAR(ORDERDATE, 'YYYY-MM-DD HH24:MI:SS') FROM ORDERS;
SELECT *
 FROM ORDERS O, BOOK B, CUSTOMER C
 WHERE O.BOOKID = B.BOOKID
   AND O.CUSTID = C.CUSTID
   AND C.NAME = '��̶�'
   AND O.ORDERDATE >= TO_DATE('2014-01-01', 'YYYY-MM-DD') -- ��¥�������� ����ȯ
   AND O.ORDERDATE < TO_DATE('2014-07-09', 'YYYY-MM-DD') -- 2014-07-08 00:00:00 �ú��� ���� 0�̶� ������ ���������
;

SELECT *
 FROM ORDERS O, BOOK B, CUSTOMER C
 WHERE O.BOOKID = B.BOOKID
   AND O.CUSTID = C.CUSTID
   AND C.NAME = '��̶�'
   AND O.ORDERDATE BETWEEN TO_DATE('2014-01-01', 'YYYY-MM-DD') -- ��¥�������� ����ȯ
                       AND TO_DATE('2014-07-09', 'YYYY-MM-DD') -- �ð����ʰ� 000�̶�� BETWEEN ���� ��ġ�� ������ �� ��Ȯ
;

--3. '�߱��� ��Ź��'��� å�� ������ ����� �������ڸ� Ȯ��
SELECT C.NAME, O.ORDERDATE
FROM BOOK B
     INNER JOIN ORDERS O
     ON B.BOOKID = O.BOOKID
     INNER JOIN CUSTOMER C 
     ON O.CUSTID = C.CUSTID
 WHERE B.BOOKNAME = '�߱��� ��Ź��'
;

SELECT B.BOOKNAME, C.NAME, O.SALEPRICE, O.ORDERDATE
 FROM ORDERS O, BOOK B, CUSTOMER C
 WHERE O.BOOKID = B.BOOKID AND O.CUSTID = C.CUSTID -- �������� 
   AND B.BOOKNAME = '�߱��� ��Ź��'
;

--4. �߽ż�, ��̶��� ������ å����, ���Աݾ�, �������� Ȯ��
------ (���� : ����, �������� ������)
SELECT C.NAME, B.BOOKNAME, O.SALEPRICE, O.ORDERDATE
FROM BOOK B
     INNER JOIN ORDERS O
     ON B.BOOKID = O.BOOKID
     INNER JOIN CUSTOMER C 
     ON O.CUSTID = C.CUSTID
 WHERE C.NAME IN ('��̶�', '�߽ż�')
 ORDER BY C.NAME, O.ORDERDATE
;

SELECT C.NAME, B.BOOKNAME, O.SALEPRICE, O.ORDERDATE
 FROM ORDERS O, BOOK B, CUSTOMER C
 WHERE O.BOOKID = B.BOOKID AND O.CUSTID = C.CUSTID -- �������� 
   AND C.NAME IN ('�߽ż�', '��̶�')
 ORDER BY C.NAME, O.ORDERDATE
-- ORDER BY 1, 4 -- ��ġ������ �Ҷ��� �̷��� �Ҽ� ����
;



--5. �߽ż��� ������ å����, �հ�ݾ�, ��հ�, ���� ���å�ݾ�, ���� �� å �ݾ� 

SELECT 'å����', COUNT (*),'�հ�ݾ�', SUM(O.SALEPRICE),'��հ�', AVG(O.SALEPRICE),
        '������å', MIN(O.SALEPRICE),'�����å', MAX(O.SALEPRICE)
FROM BOOK B
     INNER JOIN ORDERS O
     ON B.BOOKID = O.BOOKID
     INNER JOIN CUSTOMER C 
     ON O.CUSTID = C.CUSTID
 WHERE C.NAME = '�߽ż�'
;

SELECT '�߽ż�', COUNT(*), SUM(O.SALEPRICE), AVG(O.SALEPRICE), MIN(O.SALEPRICE), MAX(O.SALEPRICE)
  FROM CUSTOMER C, ORDERS O
 WHERE O.CUSTID = C.CUSTID
   AND C.NAME = '�߽ż�'
;

SELECT C.NAME, COUNT(*), SUM(O.SALEPRICE), ROUND(AVG(O.SALEPRICE)), 
       MIN(O.SALEPRICE), MAX(O.SALEPRICE)
  FROM CUSTOMER C, ORDERS O
 WHERE O.CUSTID = C.CUSTID
 GROUP BY C.NAME
;