-- �������� (�μ�����), SUB QUERY)
-- SQL (SELECT, INSERT, UPDATE, DELETE) ���� �ִ� ������
---------------------------------------
-- �������� ������ ������ �˻� 
SELECT CUSTID FROM CUSTOMER WHERE NAME = '������'; -- CUSTID : 1
SELECT * FROM ORDERS WHERE CUSTID = 1;
-- �������� ��� 
SELECT * FROM ORDERS 
 WHERE CUSTID = (SELECT CUSTID FROM CUSTOMER WHERE NAME = '������'); 
-- '=' ��ȣ�� �ϳ��� �����͸� �ΰ� �̻��̸� IN �Ǵ� NOT IN���� �������

-- ���ι����� ó��
SELECT C.NAME, O.* 
  FROM ORDERS O, CUSTOMER C
 WHERE O.CUSTID = C.CUSTID
   AND C.NAME = '������'
;
--------------------------------
-- WHERE ������ �������� ���� ��ȸ ����� 2�� �̻��� ��� IN ��� 
-- ������, �迬�� ���Գ���(�������� ��� ��ȸ)
SELECT * FROM ORDERS 
 WHERE CUSTID IN (SELECT CUSTID 
                    FROM CUSTOMER 
                   WHERE NAME IN('������', '�迬��'))
; 

--------------------------------
-- å�� ������ ���� ��� ������ �̸��� ���Ͻÿ�
SELECT MAX(PRICE) FROM BOOK; -- ���� ��� å�� ���� : 35000
SELECT * FROM BOOK WHERE PRICE = 35000; 
--
SELECT * FROM BOOK
 WHERE PRICE = (SELECT MAX(PRICE) FROM BOOK); 
---------------------------
-- ���������� FROM ���� ����ϴ� ��� 
SELECT *
  FROM BOOK B, 
      (SELECT MAX(PRICE) MAX_PRICE FROM BOOK) M
 WHERE B.PRICE = M.MAX_PRICE 
;
--(�ǽ�) ���ǵ� å�� ��ձݾ� �̻��� ���� ���(FROM�� �������� ���)
SELECT * 
  FROM BOOK B,
       (SELECT AVG(PRICE) AVG_PRICE FROM BOOK) M
 WHERE B.PRICE >= M.AVG_PRICE
;


--(�ǽ�) ������, �迬�� ���Գ��� (�������� - FROM��)
SELECT CUSTID FROM CUSTOMER WHERE NAME IN('������', '�迬��');
SELECT *
  FROM ORDERS O,
       (SELECT * FROM CUSTOMER WHERE NAME IN('������', '�迬��')) C
 WHERE O.CUSTID = C.CUSTID
;
-------------------------------
-- SELECT ���� �������� ��� �� 
SELECT O.ORDERID, O.CUSTID, O.BOOKID,
       (SELECT NAME FROM CUSTOMER WHERE CUSTID = O.CUSTID) CUSTNAME,
       (SELECT BOOKNAME FROM BOOK WHERE BOOKID = O.BOOKID) BOOKNAME,
       O.SALEPRICE, O.ORDERDATE
  FROM ORDERS O 
;
-------------------------------------
-- �������� ������ å ��� (å����)
SELECT *
  FROM BOOK
 WHERE BOOKID IN (SELECT BOOKID
                    FROM ORDERS
                   WHERE CUSTID IN (SELECT CUSTID
                                      FROM CUSTOMER 
                                     WHERE NAME = '������'))
;
----------------------------
-- (�ǽ�) ��������, ���ι�
-- 1. �ѹ��̶� ������ ������ �ִ� ���
--------(�Ǵ� �ѹ��� �������� ���� ���)
SELECT * FROM CUSTOMER
  WHERE CUSTID IN(SELECT DISTINCT CUSTID FROM ORDERS)
;

--------(�Ǵ� �ѹ��� �������� ���� ���)
SELECT * FROM CUSTOMER
  WHERE CUSTID NOT IN(SELECT DISTINCT CUSTID FROM ORDERS)
;

-- SQL ǥ�� 
SELECT DISTINCT C.* 
  FROM ORDERS O INNER JOIN CUSTOMER C
             ON O.CUSTID = C.CUSTID
;


SELECT C.* 
  FROM ORDERS O, CUSTOMER C
 WHERE O.CUSTID(+) = C.CUSTID
   AND O.ORDERID IS NULL
;

SELECT C.* 
  FROM  CUSTOMER C LEFT OUTER JOIN ORDERS O
        ON O.CUSTID = C.CUSTID
   WHERE O.ORDERID IS NULL
;
  
  
-- 2. 20000�� �̻�Ǵ� å�� ������ �� ��� ��ȸ
SELECT * FROM ORDERS WHERE SALEPRICE >= 20000;
SELECT * 
  FROM CUSTOMER      
 WHERE CUSTID IN (SELECT CUSTID FROM ORDERS WHERE SALEPRICE >= 20000)
;

-- JOIN �� 
SELECT C.*, O.SALEPRICE, O.ORDERDATE 
  FROM CUSTOMER C, ORDERS O
 WHERE O.CUSTID = C.CUSTID 
   AND O.SALEPRICE >= 20000
;

-- 3. '���ѹ̵��' ���ǻ��� å�� ������ ���̸� ��ȸ 
SELECT * 
  FROM CUSTOMER
 WHERE CUSTID IN(SELECT CUSTID FROM ORDERS 
                 WHERE BOOKID IN (SELECT BOOKID FROM BOOK 
                                  WHERE PUBLISHER = '���ѹ̵��'))
;

SELECT C.* 
  FROM BOOK B, ORDERS O, CUSTOMER C 
 WHERE O.CUSTID = C.CUSTID AND B.BOOKID = O.BOOKID -- ��������
   AND B.PUBLISHER = '���ѹ̵��'
;

-- ǥ�� SQL
SELECT DISTINCT C.* 
  FROM BOOK B 
       INNER JOIN ORDERS O
               ON B.BOOKID = O.BOOKID
       INNER JOIN CUSTOMER C
               ON O.CUSTID = C.CUSTID
 WHERE B.PUBLISHER = '���ѹ̵��'
;

SELECT C.*, O.SALEPRICE, O.ORDERDATE, B.BOOKNAME, B.PUBLISHER
  FROM CUSTOMER C INNER JOIN ORDERS O -- �������̺� ���ι��
         ON O.CUSTID = C.CUSTID  -- ���� ���� 
       INNER JOIN BOOK B  -- �������̺� ���ι�� 
         ON B.BOOKID = O.BOOKID -- ���� ����
 WHERE B.PUBLISHER = '���ѹ̵��' -- �˻�����
;


-- 4. ��ü å���� ��պ��� ���å�� ��� ��ȸ 
----------------------------
SELECT * FROM BOOK;
SELECT * FROM BOOK B WHERE B.PRICE >= (SELECT AVG(PRICE) FROM BOOK); 


SELECT AVG(PRICE) B_AVG FROM BOOK;
SELECT * FROM BOOK WHERE PRICE > 14450;












