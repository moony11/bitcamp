/* �Լ�(FUNCTION)

CREATE OR REPLACE FUNCTION FUNCTION1 
(
  PARAM1 IN VARCHAR2 -- �Ķ���� �ۼ�����
) RETURN VARCHAR2 AS -- ���� ������ Ÿ�Լ���
BEGIN
  RETURN NULL; -- ������ ��
END;
-----
-- ������ �����Ϳ� ���� ���� �ʿ�
RETURN ����������(Ÿ��)
-- ���α׷� �������� �� �����ϴ� ���� �ʿ� 
RETURN ���ϰ�;

*************************/
-- ���ν��� �۾� ó�� �� ����
-- �Լ� ������ ó���ϰ� ������� �ǵ��� �޾� ����ϱ� ���� ����
--------------------
-- BOOKID �� å���� Ȯ���ϴ� �Լ�(�Ķ���Ͱ� : BOOKID, RETURN��: BOOKNAME)


CREATE OR REPLACE FUNCTION GET_BOOKNAME (
  IN_ID IN NUMBER 
) RETURN VARCHAR2 -- ���ڿ� ���� ������ ������ Ÿ�� ���� 
AS 
    V_BOOKNAME BOOK.BOOKNAME%TYPE;
BEGIN
    SELECT BOOKNAME INTO V_BOOKNAME
    FROM BOOK
    WHERE BOOKID = IN_ID;
    RETURN V_BOOKNAME; -- ���ϰ� ���� 
END;


-------------------
-- �Լ�(FUNCTION)�� ���
-- SELECT ���� ���
SELECT BOOKID, BOOKNAME, GET_BOOKNAME(1)
  FROM BOOK;
---
SELECT O.*, GET_BOOKNAME(BOOKID)
  FROM ORDERS O;
------------
--WHERE ������ �Լ� ��� 
-- �׷��Լ��� WHERE ������ ��� �Ұ� 

SELECT O.*, GET_BOOKNAME(BOOKID)
  FROM ORDERS O
 WHERE GET_BOOKNAME(BOOKID) = '�߱��� ��Ź��'  
;

------------------------------
-- (�ǽ�) �� ID  ���� �޾Ƽ� ������ �����ִ� �Լ� (CUSTOMER ���̺� ���)
-- �Լ��� : GET_CUSTNAME
-- �Լ��� �̿��ؼ� ORDERS ���̺� ������ ��ȸ
-----GET_BOOKNAME, GET_CUSTNAME �Լ��� ��� �ֹ�(�Ǹ�) ������ å����, ���� ��ȸ
SELECT O.*, GET_CUSTNAME(CUSTID) AS CUSTNAME
  FROM ORDERS O;
  
SELECT O.*, 
        (SELECT NAME FROM CUSTOMER WHERE CUSTID = O.CUSTID) CUST_NAME
  FROM ORDERS O;
  
  
SELECT O.*, GET_CUSTNAME(CUSTID)
  FROM ORDERS O
 WHERE GET_CUSTNAME(CUSTID) = '�迬��';

SELECT O.*, 
        GET_BOOKNAME(BOOKID) BOOK_NAME, 
        GET_CUSTNAME(CUSTID) CUST_NAME 
  FROM ORDERS O
;

---------------
SELECT O.*, B.BOOKNAME, C.NAME 
  FROM ORDERS O, BOOK B, CUSTOMER C
 WHERE O.BOOKID = B.BOOKID AND O.CUSTID = C.CUSTID -- ��������
;












