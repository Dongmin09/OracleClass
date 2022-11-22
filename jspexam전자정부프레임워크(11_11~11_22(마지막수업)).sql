--전자정부프레임워크 시작(11/11)
SELECT BOOK_ID, TITLE, CATEGORY, PRICE, INSERT_DATE
FROM BOOK;

--카멜표기법
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
WHERE TITLE = '개똥이';

UPDATE BOOK
SET TITLE='굼수강산2', CATEGORY='국어책', PRICE=25044
WHERE BOOK_ID= 1;

--
INSERT INTO BOOK(BOOK_ID, TITLE, CATEGORY, PRICE, INSERT_DATE)
VALUES(5,'강아지','소설','8000',SYSDATE)

commit

---VARCHAR2(Variable Character 2) : 4000Bytes 문자
--CLOB(Character Large Object) : 4GB 문자
--BLOB(Binary Large Object) :2GB 바이너리(이미지. 동영상 ,음악)

commit

--11/15
--book table 테이블과 ATTACH 테이블을 INNER JOIN해보자
--모든컬럼(*쓰지 않기)

SELECT B.BOOK_ID, B.TITLE, B.CATEGORY, B.PRICE, B.INSERT_DATE, B.CONTENT,
       A.USER_NO, A.SEQ, A.FILENAME, A.FILESIZE, A.REGDATE
FROM BOOK B INNER JOIN ATTACH A ON (B.BOOK_ID = A.USER_NO);

--매퍼 XML 명 : galley_SQL.xml
--메퍼 interface 명 : GalleryMapper.java
--          namespace 명 : gallery
--          id 명 : list
--          paramterType : bookVO
--          resultMap : bookMap(1:N 관계 처리 + CLOB 데이터 처리)
commit

SELECT FILENAME
    , INSTR(FILENAME,'/',1,4)
    , SUBSTR(FILENAME,1,INSTR(FILENAME,'/',1,4))
    || 's_' || SUBSTR(FILENAME,INSTR(FILENAME,'/',1,4)+1)
FROM ATTACH;

-- 갤리러 sql 추가  도서목록
SELECT BOOK_ID, TITLE, CATEGORY, PRICE, INSERT_DATE, CONTENT
FROM BOOK
ORDER BY TITLE ASC;

--- 기존 업로드 파일 이름을 업로드 된 파일로 파일명 변경
UPDATE ATTACH
SET FILENAME ='/2022/11/16/4.png'
WHERE USER_NO = 3 AND SEQ = 1;

COMMIT

--delete 만들기
DELETE 
FROM ATTACH
WHERE USER_NO = '3' AND SEQ = '1';

--11/17 insert 기능 다중 이미지등록하기



-- 검색 기능


WITH T AS(
SELECT A.BOOK_ID, A.TITLE, A.CATEGORY, A.PRICE, A.INSERT_DATE, A.CONTENT,
       B.USER_NO, B.SEQ, B.FILENAME, B.FILESIZE, B.REGDATE
FROM BOOK A LEFT OUTER JOIN ATTACH B ON(A.BOOK_ID = B.USER_NO)
)
SELECT * FROM T
WHERE 1=1 
AND (TITLE LIKE '%당근%' OR CATEGORY LIKE '%당근%' OR CONTENT LIKE '%당근%');

commit

----------11/18 수업시작 다중 파일 업로드 시작

INSERT ALL
INTO ATTACH(USER_NO, SEQ, FILENAME, FILESIZE, REGDATE) VALUES(15,2,'ASDF.JPG',200,SYSDATE)
INTO ATTACH(USER_NO, SEQ, FILENAME, FILESIZE, REGDATE) VALUES(15,1,'ASDF.JPG',300,SYSDATE)
INTO ATTACH(USER_NO, SEQ, FILENAME, FILESIZE, REGDATE) VALUES(15,3,'ASDF.JPG',100,SYSDATE)
SELECT * FROM DUAL;

SELECT NVL(MAX(SEQ), 0)+1 FROM ATTACH WHERE USER_NO = 15;


----------------------
--pc11 계정의 lprod 테이블 데이터를 jspexam으로 가져오기

-- ===========================================================
--1)cart 테이블을 백업하고 cart테이블 및 cart_det 테이블을 drop
-- 백업하기
CREATE TABLE CART_DET_BAK
AS
SELECT * FROM CART_DET;

-- 기존테이블 삭제
--DROP TABLE CART_DET
--DROP TABLE CART;

--2) pc##계정의 prod 및  cart 테이블을 가져오자
-- 도구 에서 테이블 복사를 이용하기
-- ================================================
COMMIT;
--DROP TABLE CART;

-- ================================================
--상품 별 판매금액의 합계를 구해보자
--alias : prod_name, money(prod_sale * cart_qty)
--단, money 값이 10000000 이상인 데이터만 가져와보자
SELECT  PROD_NAME prodName, SUM(PROD_SALE * CART_QTY) money
FROM PROD, CART
WHERE PROD_ID = CART_PROD
GROUP BY PROD_NAME
HAVING SUM(PROD_SALE * CART_QTY) >= 10000000;


--=================================================
--11/22일 
--LPROD 테이블을 LPROD2 테이블로 복제 해보자
CREATE TABLE LPROD2
AS
SELECT * FROM LPROD;
--=================================
commit

-- MERGE INTO 이용하기
SELECT * FROM LPROD2;
/
--======================
MERGE INTO LPROD2 A --대상 테이블
USING DUAL
ON(A.LPROD_GU = 'P405') --조건절(주로 기본키 데이터)
WHEN MATCHED THEN --조건절에 해당하는 데이터가 있으면 실행
    UPDATE SET A.LPROD_CNT = A.LPROD_CNT + 1
WHEN NOT MATCHED THEN --조건절에 해당하는 데이터가 없으면 실행
    INSERT (LPROD_ID, LPROD_GU, LPROD_NM, LPROD_CNT)
    VALUES((SELECT NVL(MAX(LPROD_ID),0)+1 FROM LPROD2)
    ,(SELECT SUBSTR(MAX(LPROD_GU),1,1)
     || TRIM(SUBSTR(MAX(LPROD_GU),2) + 1)
    FROM   LPROD2),'가구류',0)
;

--저장시킨 함수 쿼리문으로 실행방법
SELECT FN_NEXT_LPROD_ID() FROM DUAL;
--LPROD2 테이블의 LPROD_ID 값을 1증가 시켜 리턴해주는 FUNCTION을 만들어보자
--FUNCTION 명 : FN_NEXT_LPROD_ID
SELECT NVL(MAX(LPROD_ID), 0)+ 1 FROM LPROD2
/
CREATE OR REPLACE FUNCTION FN_NEXT_LPROD_ID
RETURN NUMBER
IS
    V_ID NUMBER;
BEGIN
    -- PL/SQL에서 SELECT와 함께 꼭 INTO를 쓰자!!!!
    SELECT NVL(MAX(LPROD_ID), 0)+ 1 INTO V_ID
    FROM LPROD2;
    RETURN V_ID;
END;
/

-- LPROD2 테이블의 LPROD_GU 값을 1 증가시켜 리턴해주는 서브쿼리를 만들어보자
-- P403 -> 1 증가 ->  P405
SELECT SUBSTR(MAX(LPROD_GU,1,1)
    || TRIM(SUBSTR(MAX(LPROD_GU,1,2) + 1)
FROM LPROD2;

---MERGE

--시작일자~종료일자 기간 내 모든 날짜(일자) 구하기
-- 시작일자 : 2022-12-01(날자형 문자)
--종료일자 : 2022-12-10(날짜형 문자
WITH DATE_RANGE AS(
    SELECT TO_DATE('2022-12-01','YYYY-MM-DD') + LEVEL - 1 AS DATES
    FROM DUAL
    CONNECT BY LEVEL <= (TO_DATE('2022-12-10','YYYY-MM-DD') - 
                         TO_DATE('2022-12-01','YYYY-MM-DD') + 1)
),
ATTENDANCE AS(
SELECT TO_DATE('2022-12-01','YYYY-MM-DD') AS ATTDATE, '출근' AS ATTSTAT FROM DUAL
UNION ALL
SELECT TO_DATE('2022-12-03','YYYY-MM-DD') AS ATTDATE, '출근' AS ATTSTAT FROM DUAL
UNION ALL
SELECT TO_DATE('2022-12-06','YYYY-MM-DD') AS ATTDATE, '출근' AS ATTSTAT FROM DUAL
)
SELECT A.DATES, B.ATTSTAT FROM DATE_RANGE A, ATTENDANCE B
WHERE  A.DATES = B.ATTDATE(+)
ORDER BY A.DATES
;


------
SELECT LEVEL T_NO
     , LEVEL || '교시' T_NAME
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