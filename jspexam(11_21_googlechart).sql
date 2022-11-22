--pc11 ������ lprod ���̺� �����͸� jspexam���� ��������

-- ===========================================================
--1)cart ���̺��� ����ϰ� cart���̺� �� cart_det ���̺��� drop
-- ����ϱ�
CREATE TABLE cart_det_bak
    AS
        SELECT
            *
        FROM
            cart_det;

-- �������̺� ����
--DROP TABLE CART_DET
--DROP TABLE CART;

--2) pc##������ prod ��  cart ���̺��� ��������
-- ���� ���� ���̺� ���縦 �̿��ϱ�
-- ================================================

COMMIT;
--DROP TABLE CART;

-- ================================================
--��ǰ �� �Ǹűݾ��� �հ踦 ���غ���
--alias : prod_name, money(prod_sale * cart_qty)
--��, money ���� 10000000 �̻��� �����͸� �����ͺ���

SELECT
    prod_name prodname,
    SUM(prod_sale * cart_qty) money
FROM
    prod,
    cart
WHERE
    prod_id = cart_prod
GROUP BY
    prod_name
HAVING
    SUM(prod_sale * cart_qty) >= 10000000;


--=================================================
--11/22�� 
--LPROD ���̺��� LPROD2 ���̺�� ���� �غ���

CREATE TABLE lprod2
    AS
        SELECT
            *
        FROM
            lprod;
--=================================

COMMIT

-- MERGE INTO �̿��ϱ�
SELECT * FROM LPROD2;
/
--======================
MERGE INTO LPROD2 A --��� ���̺�
USING DUAL
ON(A.LPROD_GU = 'P405') --������(�ַ� �⺻Ű ������)
WHEN MATCHED THEN --�������� �ش��ϴ� �����Ͱ� ������ ����
    UPDATE SET A.LPROD_CNT = A.LPROD_CNT + 1
WHEN NOT MATCHED THEN --�������� �ش��ϴ� �����Ͱ� ������ ����
    INSERT (LPROD_ID, LPROD_GU, LPROD_NM, LPROD_CNT)
    VALUES((SELECT NVL(MAX(LPROD_ID),0)+1 FROM LPROD2)
   ,(SELECT SUBSTR(MAX(LPROD_GU),1,1)
     || TRIM(SUBSTR(MAX(LPROD_GU),2) + 1)
    FROM   LPROD2),'������',0)
;

--�����Ų �Լ� ���������� ������
SELECT FN_NEXT_LPROD_ID() FROM DUAL;
--LPROD2 ���̺��� LPROD_ID ���� 1���� ���� �������ִ� FUNCTION�� ������
--FUNCTION �� : FN_NEXT_LPROD_ID
SELECT NVL(MAX(LPROD_ID), 0)+ 1 FROM LPROD2
/
CREATE OR REPLACE FUNCTION FN_NEXT_LPROD_ID
RETURN NUMBER
IS
    V_ID NUMBER;
BEGIN
    -- PL/SQL���� SELECT�� �Բ� �� INTO�� ����!!!!
    SELECT NVL(MAX(LPROD_ID), 0)+ 1 INTO V_ID
    FROM LPROD2;
    RETURN V_ID;
END;
/

-- LPROD2 ���̺��� LPROD_GU ���� 1 �������� �������ִ� ���������� ������
-- P403 -> 1 ���� ->  P405
SELECT SUBSTR(MAX(LPROD_GU,1,1)
    || TRIM( substr(MAX(lprod_gu,1,2) + 1) FROM
lprod2;

---MERGE

--��������~�������� �Ⱓ �� ��� ��¥(����) ���ϱ�
-- �������� : 2022-12-01(������ ����)
--�������� : 2022-12-10(��¥�� ����

WITH date_range AS (
    SELECT
        TO_DATE('2022-12-01','YYYY-MM-DD') + level - 1 AS dates
    FROM
        dual
    CONNECT BY
        level <= ( TO_DATE('2022-12-10','YYYY-MM-DD') - TO_DATE('2022-12-01','YYYY-MM-DD') + 1 )
),attendance AS (
    SELECT
        TO_DATE('2022-12-01','YYYY-MM-DD') AS attdate,
        '���' AS attstat
    FROM
        dual
    UNION ALL
    SELECT
        TO_DATE('2022-12-03','YYYY-MM-DD') AS attdate,
        '���' AS attstat
    FROM
        dual
    UNION ALL
    SELECT
        TO_DATE('2022-12-06','YYYY-MM-DD') AS attdate,
        '���' AS attstat
    FROM
        dual
) SELECT
    a.dates,
    b.attstat
  FROM
    date_range a,
    attendance b
  WHERE
    a.dates = b.attdate (+)
ORDER BY
    a.dates;


------

SELECT
    level t_no,
    level
    || '����' t_name,
    DECODE(level,1,'9:00',2,'10:00',3,'11:00',4,'12:00',5,'13:00',6,'14:00',7,'15:00',8,'16:00') p_sdate,
    DECODE(level,1,'9:50',2,'10:50',3,'11:50',4,'12:50',5,'13:50',6,'14:50',7,'15:50',8,'16:50') p_edate
FROM
    dual
CONNECT BY
    level <= 8;
    --
   