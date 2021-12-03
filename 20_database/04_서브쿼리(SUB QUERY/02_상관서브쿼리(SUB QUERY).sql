/* ��ȣ���� �������� (�����������) 
- ���������� ���� ���������� ����ϰ�, ���������� ������� ���������� ��� 
- ���������� ���������� ���� ���ε� ���·� ����
*************************/
-- SELECT ���� ���� �������� 
SELECT O.ORDERID, O.CUSTID, O.BOOKID,
       (SELECT NAME FROM CUSTOMER WHERE CUSTID = O.CUSTID) CUSTNAME,  --���������� �ܵ����� ���� �ȵ�
       (SELECT BOOKNAME FROM BOOK WHERE BOOKID = O.BOOKID) BOOKNAME,
       O.SALEPRICE, O.ORDERDATE
  FROM ORDERS O 
;

-- ���ǻ纰 ��� �������ݺ��� ��� å ����� ���Ͻÿ�


SELECT * 
  FROM BOOK B,
       (SELECT AVG(PRICE) AVG_PRICE FROM BOOK) M
 WHERE B.PRICE >= M.AVG_PRICE
;

-- ���ǻ纰 ��� �������ݺ��� ��� å ����� ���Ͻÿ�
SELECT * FROM BOOK B ORDER BY PUBLISHER, PRICE;
-- �½����� ���ǻ� å�߿��� �½����� ���ǻ��� ��� �ݾ׺��� ��� å 
SELECT * FROM BOOK WHERE PUBLISHER = '�½�����';
SELECT AVG(PRICE) FROM BOOK WHERE PUBLISHER = '�½�����';

SELECT *
  FROM BOOK
 WHERE PUBLISHER = '�½�����' 
   AND PRICE > (SELECT AVG(PRICE) FROM BOOK WHERE PUBLISHER = '�½�����')
;

----
-- ���������� ���� ���������� ����ϰ�, ���������� ������� ���������� ��� 
SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE
  FROM BOOK B
 WHERE PRICE > (SELECT AVG(PRICE) FROM BOOK WHERE PUBLISHER = B.PUBLISHER)
;
-- �� B.PUBLISHER BOOK �ȿ� ���ǻ纰�� ���ư��鼭 ó������

SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE,
       (SELECT AVG(PRICE) FROM BOOK WHERE PUBLISHER = B.PUBLISHER) AVG  -- ���ǻ纰 ��հ�
  FROM BOOK B
 WHERE PRICE > (SELECT AVG(PRICE) FROM BOOK 
                WHERE PUBLISHER = B.PUBLISHER)
;

--------- ���ι� (JOIN��)
-- ���ǻ纰 ��� ���� ���� ~��(�׷����)
SELECT PUBLISHER, AVG(PRICE)
  FROM BOOK
 GROUP BY PUBLISHER 
;
---
SELECT * 
  FROM BOOK B, 
       (SELECT PUBLISHER, AVG(PRICE) AVG_PRICE
         FROM BOOK
        GROUP BY PUBLISHER ) AVG
 WHERE B.PUBLISHER = AVG.PUBLISHER
   AND B.PRICE > AVG.AVG_PRICE
 ORDER BY B.PUBLISHER, B.PRICE
;
--------------------------

-- EXISTS: ���翩�� Ȯ�νû��(������ TRUE)
-- NOT EXISTS : �������� ������ TRUE 
SELECT BOOKNAME FROM BOOK WHERE BOOKNAME LIKE '%�౸%';
SELECT * 
  FROM BOOK 
 WHERE BOOKNAME IN (SELECT BOOKNAME FROM BOOK
                    WHERE BOOKNAME LIKE '%�౸%')
;

SELECT * 
  FROM BOOK B
 WHERE EXISTS (SELECT 1 FROM BOOK 
                    WHERE B.BOOKNAME LIKE '%�౸%')
;
--------
-- �ֹ������� �ִ� ���� �̸��� ��ȭ��ȣ�� ã���ÿ� 
SELECT*
  FROM CUSTOMER 
 WHERE CUSTID IN (SELECT USTID FROM ORDERS)
;
--==> EXISTS ����
SELECT *
  FROM CUSTOMER C
 WHERE EXISTS (SELECT 1 FROM ORDERS   -- 1�� �߿����� ���� �ƹ��ų� �־��
               WHERE CUSTID = C.CUSTID)
;










