/* �񱳱���(�б�ó��) IF��
IF (���ǽ�) THEN ~ END IF;
IF (���ǽ�) THEN ~ ELSE ~ END IF;
IF (���ǽ�) THEN ~ ELSIF ... ELSIF ... ELSE ~ END IF;
********************/
-- Ȧ��, ¦�� �Ǻ� 

CREATE OR REPLACE PROCEDURE PRC_IF(
  IN_NUM IN NUMBER 
) AS 
BEGIN
  DBMS_OUTPUT.PUT_LINE('>> �Է°� : ' || IN_NUM);
  
  -- Ȧ, ¦ �Ǻ� 
  IF (MOD(IN_NUM, 2) = 0) THEN 
      DBMS_OUTPUT.PUT_LINE(IN_NUM || ' : ¦��');
  ELSE
      DBMS_OUTPUT.PUT_LINE(IN_NUM || ' : Ȧ��');
  END IF;
END PRC_IF;

--------------------------------------------
-- 4�� ���� ������ �� Ȯ��

CREATE OR REPLACE PROCEDURE PRC_IF2 (
  IN_NUM IN NUMBER 
) AS 
BEGIN
    DBMS_OUTPUT.PUT_LINE('>>>�Է°� : ' || IN_NUM);
    
    -- 4�� ���� ������ �� Ȯ��
    IF (MOD(IN_NUM, 4) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('>> 4�� ���� ������ 0');
    ELSIF (MOD(IN_NUM, 4) = 1) THEN 
        DBMS_OUTPUT.PUT_LINE('>> 4�� ���� ������ 1');
    ELSIF (MOD(IN_NUM, 4) = 2) THEN 
        DBMS_OUTPUT.PUT_LINE('>> 4�� ���� ������ 2');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('>> 4�� ���� ������ 3');
    END IF;
    
END PRC_IF2;

--=======================================
-- �ݺ��� : FOR, WHILE
-- FOR��
----- FOR ���� IN �ʱⰪ .. ������ LOOP ~ END LOOP;
-------------------------------------
-- ���ڸ� �ϳ� �Է¹޾Ƽ� �հ踦 ���(1~N ������ ��)

CREATE OR REPLACE PROCEDURE PRC_FOR_SUM (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0; -- �հ� ���� ����(�ʱⰪ 0)
    
BEGIN
    -- �Է¹��� ���ڱ����� �հ� ���ϱ�
    DBMS_OUTPUT.PUT_LINE('>> �Է°� : ' || IN_NUM);
    
    -- FOR������ �ݺ�ó��
    FOR I IN 1 .. IN_NUM LOOP
        V_SUM := V_SUM + I;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('�հ�: ' || V_SUM);
    
END PRC_FOR_SUM;

----------------------------
CREATE OR REPLACE PROCEDURE PRC_FOR_SUM (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0; -- �հ� ���� ����(�ʱⰪ 0)
    
BEGIN
    -- �Է¹��� ���ڱ����� �հ� ���ϱ�
    DBMS_OUTPUT.PUT_LINE('>> �Է°� : ' || IN_NUM);
    
    -- FOR������ �ݺ�ó��
    FOR I IN 1 .. IN_NUM LOOP
        V_SUM := V_SUM + I;
        DBMS_OUTPUT.PUT_LINE('>> I : ' || I ||', ��: ' || V_SUM);
    END LOOP;
    
    DBMS_OUTPUT.PUT('1 ���� ' || IN_NUM || '������ �հ� : ');
    DBMS_OUTPUT.PUT_LINE('�հ�: ' || V_SUM);
    
    DBMS_OUTPUT.PUT_LINE('�հ�: ' || V_SUM);
    
END PRC_FOR_SUM;


---------------------------------
-- FOR �� REVERCE ����  
CREATE OR REPLACE PROCEDURE PRC_FOR_REVERSE 
(
  IN_NUM IN NUMBER 
) AS 
BEGIN
  FOR I IN REVERSE 1 .. IN_NUM LOOP
        DBMS_OUTPUT.PUT_LINE(I);
  END LOOP;
END PRC_FOR_REVERSE;
--==================================
-- WHILE �� 
-- WHILE(���ǽ�) LOOP ~ END LOOP;
-- 
CREATE OR REPLACE PROCEDURE PRC_WHILE_SUM (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER :=0;
    I NUMBER := 1;
BEGIN
  -- �Է°� Ȯ��(���)
  DBMS_OUTPUT.PUT_LINE('�Է°� : ' || IN_NUM);
  
  WHILE (I <= IN_NUM) LOOP
    V_SUM := V_SUM + I;
    I := I + 1;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('1~ ' || IN_NUM || ' ������ �հ� : ' || V_SUM);
END PRC_WHILE_SUM;

------------------------------------
/* LOOP ~ END LOOP; - ���ѷ���
LOOP
    EXIT WHEN(�������ǽ�);
END LOOP;

*/ 

CREATE OR REPLACE PROCEDURE LOOP1 
AS
      I NUMBER := 1;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE('I : ' || I);
    EXIT WHEN ( I>= 10);
    I := I + 1;
  END LOOP;
END LOOP1;

--============================
/*���ڸ� �ϳ� �Է¹޾Ƽ� 1~ ���ڱ����� �հ� ���ϱ� 
���ν����� : PRC_SUM_EVENODD
-- �Է°��� Ȧ���� Ȧ���� ���ϰ� 
-- �Է°��� ¦���� ¦������ ���ؼ�
���� �հ谪�� ȭ�� ���
<�������>
-- �Է¼��� : �Է°�, Ȧ��/¦��, �հ�: �հ� ��� 
    ��¿� ) �Է¼��� : 4, ¦��, �հ� :  6
    ��¿� ) �Է¼��� : 5, Ȧ��, �հ� :  9
*****************************************/

create or replace PROCEDURE PRC_SUM_EVENODD 
(
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0;
    V_EVEN_ODD VARCHAR2(10); -- Ȧ��, ¦�� ���ڿ� ���� ����
BEGIN
    -- �Է°� Ȧ/¦ �Ǻ� �� Ȧ���� ��� Ȧ�� ��, ¦���� ��� ¦�� �� ���ϱ� 
  IF (MOD(IN_NUM, 2) = 0) THEN 
      V_EVEN_ODD := '¦��';
  ELSE
      V_EVEN_ODD := 'Ȧ��';
      
  END IF;
  
    
  
  FOR I IN 1 .. IN_NUM LOOP   -- I�� 1���� IN_NUM���� �ݺ�
     IF (MOD(I, 2) = 0 AND V_EVEN_ODD = '¦��') THEN
      V_SUM := V_SUM + I;
     END IF;
     IF (MOD(I, 2) <> 0 AND V_EVEN_ODD = 'Ȧ��') THEN
      V_SUM := V_SUM + I;
     END IF;
  END LOOP;
    DBMS_OUTPUT.PUT_LINE('�Է¼���: ' || IN_NUM 
            || ', ' ||V_EVEN_ODD || ', ��' || V_SUM);
   
   
END PRC_SUM_EVENODD;

------------------------------------------
create or replace PROCEDURE PRC_SUM_EVENODD2 (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0;
    V_EVEN_ODD VARCHAR2(10); -- Ȧ��, ¦�� ���ڿ� ���� ����
    V_MOD NUMBER(1);
BEGIN
    -- �Է°� Ȧ/¦ �Ǻ� �� Ȧ���� ��� Ȧ�� ��, ¦���� ��� ¦�� �� ���ϱ� 
    V_MOD := MOD(IN_NUM, 2);
  IF (MOD(IN_NUM, 2) = 0) THEN 
      V_EVEN_ODD := '¦��';
  ELSE
      V_EVEN_ODD := 'Ȧ��';
      
  END IF;
  
  -- Ȧ����, ¦���� ���ϱ� 
  FOR I IN 1 .. IN_NUM LOOP   -- I�� 1���� IN_NUM���� �ݺ�
     IF (MOD(I, 2) = V_MOD) THEN
      V_SUM := V_SUM + I;
     END IF;
  END LOOP;
    DBMS_OUTPUT.PUT_LINE('�Է¼���: ' || IN_NUM 
            || ', ' ||V_EVEN_ODD || ', ��' || V_SUM);
   
   
END PRC_SUM_EVENODD2;

-------------------------------------------

create or replace PROCEDURE PRC_SUM_EVENODD_WHILE(
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0;
    V_EVEN_ODD VARCHAR2(10); -- Ȧ��, ¦�� ���ڿ� ���� ����
    V_MOD NUMBER(1);
    I NUMBER := 0;
BEGIN
    -- �Է°� Ȧ/¦ �Ǻ� �� Ȧ���� ��� Ȧ�� ��, ¦���� ��� ¦�� �� ���ϱ� 
    IF(MOD(IN_NUM, 2) = 0) THEN -- ¦��
        I := 2;
        V_EVEN_ODD := '¦��';
    ELSE 
        I := 1;
        V_EVEN_ODD := 'Ȧ��';

    END IF;

    WHILE (I <= IN_NUM) LOOP
        V_SUM := V_SUM + I;
        I  := I + 2; 
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('�Է¼���: ' || IN_NUM 
            || ', ' ||V_EVEN_ODD || ', ��' || V_SUM);
   
   
END PRC_SUM_EVENODD_WHILE;




