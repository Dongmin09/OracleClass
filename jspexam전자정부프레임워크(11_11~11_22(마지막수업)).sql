--�������������ӿ�ũ ����(11/11)
SELECT BOOK_ID, TITLE, CATEGORY, PRICE, INSERT_DATE
FROM BOOK;

--ī��ǥ���
SELECT COLUMN_NAME
, DATA_TYPE
, CASE WHEN DATA_TYPE='NUMBER' THEN 'private int ' || FN_GETCAMEL(COLUMN_NAME) || ';'
WHEN DATA_TYPE IN('VARCHAR2','CHAR') THEN 'private String ' || FN_GETCAMEL(COLUMN_NAME) || ';'
WHEN DATA_TYPE='DATE' THEN 'private Date ' || FN_GETCAMEL(COLUMN_NAME) || ';'
ELSE 'private String ' || FN_GETCAMEL(COLUMN_NAME) || ';'
END AS CAMEL_CASE
, '' RESULTMAP
FROM ALL_TAB_COLUMNS
WHERE TABLE_NAME = 'ATTACH';


---11-14
SELECT BOOK_ID, TITLE, CATEGORY, PRICE, INSERT_DATE
FROM BOOK
WHERE TITLE = '������';

UPDATE BOOK
SET TITLE='��������2', CATEGORY='����å', PRICE=25044
WHERE BOOK_ID= 1;

--
INSERT INTO BOOK(BOOK_ID, TITLE, CATEGORY, PRICE, INSERT_DATE)
VALUES(5,'������','�Ҽ�','8000',SYSDATE)

commit

---VARCHAR2(Variable Character 2) : 4000Bytes ����
--CLOB(Character Large Object) : 4GB ����
--BLOB(Binary Large Object) :2GB ���̳ʸ�(�̹���. ������ ,����)

commit

--11/15
--book table ���̺�� ATTACH ���̺��� INNER JOIN�غ���
--����÷�(*���� �ʱ�)

SELECT B.BOOK_ID, B.TITLE, B.CATEGORY, B.PRICE, B.INSERT_DATE, B.CONTENT,
       A.USER_NO, A.SEQ, A.FILENAME, A.FILESIZE, A.REGDATE
FROM BOOK B INNER JOIN ATTACH A ON (B.BOOK_ID = A.USER_NO);

--���� XML �� : galley_SQL.xml
--���� interface �� : GalleryMapper.java
--          namespace �� : gallery
--          id �� : list
--          paramterType : bookVO
--          resultMap : bookMap(1:N ���� ó�� + CLOB ������ ó��)
commit

SELECT FILENAME
    , INSTR(FILENAME,'/',1,4)
    , SUBSTR(FILENAME,1,INSTR(FILENAME,'/',1,4))
    || 's_' || SUBSTR(FILENAME,INSTR(FILENAME,'/',1,4)+1)
FROM ATTACH;

-- ������ sql �߰�  �������
SELECT BOOK_ID, TITLE, CATEGORY, PRICE, INSERT_DATE, CONTENT
FROM BOOK
ORDER BY TITLE ASC;

--- ���� ���ε� ���� �̸��� ���ε� �� ���Ϸ� ���ϸ� ����
UPDATE ATTACH
SET FILENAME ='/2022/11/16/4.png'
WHERE USER_NO = 3 AND SEQ = 1;

COMMIT

--delete �����
DELETE 
FROM ATTACH
WHERE USER_NO = '3' AND SEQ = '1';

--11/17 insert ��� ���� �̹�������ϱ�



-- �˻� ���


WITH T AS(
SELECT A.BOOK_ID, A.TITLE, A.CATEGORY, A.PRICE, A.INSERT_DATE, A.CONTENT,
       B.USER_NO, B.SEQ, B.FILENAME, B.FILESIZE, B.REGDATE
FROM BOOK A LEFT OUTER JOIN ATTACH B ON(A.BOOK_ID = B.USER_NO)
)
SELECT * FROM T
WHERE 1=1 
AND (TITLE LIKE '%���%' OR CATEGORY LIKE '%���%' OR CONTENT LIKE '%���%');

commit

----------11/18 �������� ���� ���� ���ε� ����

INSERT ALL
INTO ATTACH(USER_NO, SEQ, FILENAME, FILESIZE, REGDATE) VALUES(15,2,'ASDF.JPG',200,SYSDATE)
INTO ATTACH(USER_NO, SEQ, FILENAME, FILESIZE, REGDATE) VALUES(15,1,'ASDF.JPG',300,SYSDATE)
INTO ATTACH(USER_NO, SEQ, FILENAME, FILESIZE, REGDATE) VALUES(15,3,'ASDF.JPG',100,SYSDATE)
SELECT * FROM DUAL;

SELECT NVL(MAX(SEQ), 0)+1 FROM ATTACH WHERE USER_NO = 15;


----------------------
--pc11 ������ lprod ���̺� �����͸� jspexam���� ��������

-- ===========================================================
--1)cart ���̺��� ����ϰ� cart���̺� �� cart_det ���̺��� drop
-- ����ϱ�
CREATE TABLE CART_DET_BAK
AS
SELECT * FROM CART_DET;

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
SELECT  PROD_NAME prodName, SUM(PROD_SALE * CART_QTY) money
FROM PROD, CART
WHERE PROD_ID = CART_PROD
GROUP BY PROD_NAME
HAVING SUM(PROD_SALE * CART_QTY) >= 10000000;


--=================================================
--11/22�� 
--LPROD ���̺��� LPROD2 ���̺�� ���� �غ���
CREATE TABLE LPROD2
AS
SELECT * FROM LPROD;
--=================================
commit

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
    || TRIM(SUBSTR(MAX(LPROD_GU,1,2) + 1)
FROM LPROD2;

---MERGE

--��������~�������� �Ⱓ �� ��� ��¥(����) ���ϱ�
-- �������� : 2022-12-01(������ ����)
--�������� : 2022-12-10(��¥�� ����
WITH DATE_RANGE AS(
    SELECT TO_DATE('2022-12-01','YYYY-MM-DD') + LEVEL - 1 AS DATES
    FROM DUAL
    CONNECT BY LEVEL <= (TO_DATE('2022-12-10','YYYY-MM-DD') - 
                         TO_DATE('2022-12-01','YYYY-MM-DD') + 1)
),
ATTENDANCE AS(
SELECT TO_DATE('2022-12-01','YYYY-MM-DD') AS ATTDATE, '���' AS ATTSTAT FROM DUAL
UNION ALL
SELECT TO_DATE('2022-12-03','YYYY-MM-DD') AS ATTDATE, '���' AS ATTSTAT FROM DUAL
UNION ALL
SELECT TO_DATE('2022-12-06','YYYY-MM-DD') AS ATTDATE, '���' AS ATTSTAT FROM DUAL
)
SELECT A.DATES, B.ATTSTAT FROM DATE_RANGE A, ATTENDANCE B
WHERE  A.DATES = B.ATTDATE(+)
ORDER BY A.DATES
;


------
SELECT LEVEL T_NO
     , LEVEL || '����' T_NAME
     , DECODE(LEVEL,
            1, '9:00',
            2, '10:00',
            3, '11:00',
            4, '12:00',
            5, '13:00',
            6, '14:00',
            7, '15:00',
            8, '16:00') P_SDATE
    , DECODE(LEVEL,
            1, '9:50',
            2, '10:50',
            3, '11:50',
            4, '12:50',
            5, '13:50',
            6, '14:50',
            7, '15:50',
            8, '16:50') P_EDATE
FROM DUAL
CONNECT BY LEVEL <= 8;