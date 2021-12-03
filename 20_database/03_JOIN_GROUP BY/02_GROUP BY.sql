/* *************************
SELECT [* | DISTINCT] {�÷���, �÷���, ...}
  FROM ���̺��
[WHERE ������]
[GROUP BY {�÷���, ....}
    [HAVING ����] ] --GROUP BY ���� ���� ����
[ORDER BY {�÷��� [ASC | DESC], ....}] --ASC : ��������(�⺻/��������)
                                      --DESC : ��������
-----------------
> GROUP BY : �����͸� �׷����ؼ� ó���� ��� ���
> GROUP BY ���� ����� �� SELECT �׸� ����� �� �ִ� ���� 
  GROUP BY ���� ���� �÷� �Ǵ� �׷��Լ�(COUNT, SUM, AVG, MAX, MIN)�� ����� �� �ִ�.
                                      
                                      
                                      
***************************/
-- ���� ������ ���űݾ��� �հ踦 ���Ͻÿ�
SELECT CUSTID, SUM(SALEPRICE)
 FROM ORDERS
 GROUP BY CUSTID
;
-------
SELECT C.NAME, SUM(SALEPRICE)
  FROM CUSTOMER C, ORDERS O
 WHERE C.CUSTID = O.CUSTID
 GROUP BY C.NAME
 ORDER BY C.NAME
;

-----------
SELECT C.NAME, SUM(SALEPRICE)
  FROM CUSTOMER C, ORDERS O
 WHERE C.CUSTID = O.CUSTID
 GROUP BY C.NAME
 ORDER BY SUM(SALEPRICE) DESC
;
 
SELECT C.NAME, SUM(SALEPRICE)
  FROM CUSTOMER C, ORDERS O
 WHERE C.CUSTID = O.CUSTID
 GROUP BY C.NAME
 ORDER BY 2 DESC -- SELECT ���� 2��° �׸����� ����
;    
    
-----------------------------
-- �ֹ�(�Ǹ�) ���̺��� ���� ������ ��ȸ(�Ǽ�, �հ�, ���, �ּ�, �ִ�)
SELECT C.NAME, COUNT(*), SUM(O.SALEPRICE), 
       TRUNC(AVG(O.SALEPRICE)),
       MIN(O.SALEPRICE), MAX(O.SALEPRICE)
  FROM ORDERS O, CUSTOMER C
 WHERE O.CUSTID = C.CUSTID -- �������� 
   AND C.NAME IN ('�߽ż�', '������')
 GROUP BY C.NAME
 ORDER BY C.NAME
;
-----------------------------
-- ���� �������� ���� ������ ��ȸ (�Ǽ�, �հ�, ���, �ּ�, �ִ�)
-- �߽ż�, ��̶� �� 2�� ��ȸ
SELECT C.NAME, COUNT(*), SUM(O.SALEPRICE), TRUNC(AVG(O.SALEPRICE)),
       MIN (O.SALEPRICE), MAX(O.SALEPRICE) 
  FROM ORDERS O, CUSTOMER C
 WHERE O.CUSTID = C.CUSTID
   AND C.NAME IN ('�߽ż�', '��̶�')
 GROUP BY C.NAME
;
------
-- ANSI ǥ�� SQL
SELECT C.NAME, COUNT(*), SUM(O.SALEPRICE), TRUNC(AVG(O.SALEPRICE)),
       MIN (O.SALEPRICE), MAX(O.SALEPRICE) 
  FROM ORDERS O, INNER JOIN CUSTOMER C
    ON O.CUSTID = C.CUSTID
 WHERE C.NAME IN ('�߽ż�', '��̶�')
 GROUP BY C.NAME
;  
----------------------
-- HAVING �� : GROUP BY ���� ���ؼ� ������� �����Ϳ��� �˻����� �ο�
-- HAVING ���� �ܵ����� ���� �� ����, �ݵ�� GROUP BY ���� �Բ� ���
------------------------
-- 3�� �̻� ������ �� ��ȸ
SELECT C.NAME, COUNT(*) AS CNT
  FROM CUSTOMER C, ORDERS O
 WHERE C.CUSTID = O.CUSTID
 GROUP BY C.NAME
 HAVING COUNT(*) >= 3 -- �׷��ε� �����Ϳ��� ���ϴ� ������ �˻�
;
---------------
-- ������ å�߿��� 20000�� �̻��� å�� ������ ����� ��赥���� 
---------- (�Ǽ�, �հ�, ���, �ּ�, �ִ�)
SELECT C.NAME, COUNT(*), SUM(O.SALEPRICE), TRUNC(AVG(O.SALEPRICE)),
       MIN (O.SALEPRICE), MAX(O.SALEPRICE)
  FROM CUSTOMER C, ORDERS O
  WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME 
  HAVING MAX(O.SALEPRICE) >= 20000 -- �׷��� ����� ���ϰ� 2���� �̻� ������ ��� ã��
;
--------------------
-- ���� : WHERE���� ���Ǵ� ã�� ���� (���̺� ������ ����)
---- HAVING ���� ���Ǵ� ������ �׷��ε� ������ �������� �˻� 
---- (������� �ٸ��� ó���ǹǷ� ã�� �����Ͱ� �������� ��Ȯ�� �Ǵ��ϰ� ����Ұ�)
SELECT C.NAME, COUNT(*), SUM(O.SALEPRICE), TRUNC(AVG(O.SALEPRICE)),
       MIN (O.SALEPRICE), MAX(O.SALEPRICE)
  FROM CUSTOMER C, ORDERS O
 WHERE C.CUSTID = O.CUSTID
   AND O.SALEPRICE >= 20000 -- 2���� �̻��� å ���Գ����� ������� 
  GROUP BY C.NAME 
; 

--========================
-- (�ǽ�) �ʿ�� GROUP BY ~ HAVING ������ ����ؼ� ó��
--1. ���� �ֹ��� ������ ���ǸŰǼ�, �Ǹž�, ��հ�, ������, �ְ� ���ϱ�
SELECT COUNT(*) AS "TOTAL COUNT"
      , SUM(O.SALEPRICE) AS "�Ǹž� �հ�" -- �ѱ� ����� �� ������ ������� ����
      , TRUNC(AVG(O.SALEPRICE)) ��հ�AVG
      , MIN (O.SALEPRICE) ������_MIN -- �����(_)��밡��
      , MAX(O.SALEPRICE) "�ְ�(MAX)"
  FROM ORDERS
;

--2. ������ �ֹ��� ������ �Ѽ���, ���Ǹž� ���ϱ�
SELECT C.NAME, COUNT(*) AS CNT, SUM(O.SALEPRICE) AS SUM_PRICE
  FROM CUSTOMER C, ORDERS O
 WHERE C.CUSTID = O.CUSTID
 GROUP BY C.NAME
 --ORDER BY SUM(O.SALEPRICE) DESC -- ����� �׷��Լ��� ����
 --ORDER BY 3 DESC -- �÷� ��ġ������ ����
 ORDER BY SUM_PRICE DESC -- ��Ī(ALIAS)���� ����
;

--3. ���� �̸��� ���� �ֹ��� ������ �ǸŰ��� �˻�
SELECT C.NAME, O.SALEPRICE, B.BOOKNAME
  FROM CUSTOMER C, ORDERS O, BOOK B
 WHERE C.CUSTID = O.CUSTID
   AND O.BOOKID = B.BOOKID
;


--4. ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, �������� ����
SELECT C.NAME, SUM(O.SALEPRICE)
  FROM CUSTOMER C, ORDERS O
 WHERE C.CUSTID = O.CUSTID
 GROUP BY C.NAME
 ORDER BY C.NAME
;


--5. ������ �ֹ��� �Ǽ�, �հ�ݾ�, ��ձݾ��� ���ϰ� (3�Ǻ��� ���� ������ ��� �˻�)
SELECT C.NAME, COUNT(*), SUM(O.SALEPRICE), TRUNC(AVG(O.SALEPRICE))
  FROM CUSTOMER C, ORDERS O
 WHERE C.CUSTID = O.CUSTID
 GROUP BY C.NAME
 HAVING COUNT(*) <= 3
;


--(����) �� �� �� �ǵ� ���� ���� ����� ����? 



    
    
    
    
    
    
    
    
    