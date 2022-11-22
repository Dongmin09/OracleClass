--pc11 계정의 lprod 테이블 데이터를 jspexam으로 가져오기

-- ===========================================================
--1)cart 테이블을 백업하고 cart테이블 및 cart_det 테이블을 drop
-- 백업하기
CREATE TABLE cart_det_bak
    AS
        SELECT
            *
        FROM
            cart_det;

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
--11/22일 
--LPROD 테이블을 LPROD2 테이블로 복제 해보자

CREATE TABLE lprod2
    AS
        SELECT
            *
        FROM
            lprod;
--=================================

COMMIT

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
    || TRIM( substr(MAX(lprod_gu,1,2) + 1) FROM
lprod2;

---MERGE

--시작일자~종료일자 기간 내 모든 날짜(일자) 구하기
-- 시작일자 : 2022-12-01(날자형 문자)
--종료일자 : 2022-12-10(날짜형 문자

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
        '출근' AS attstat
    FROM
        dual
    UNION ALL
    SELECT
        TO_DATE('2022-12-03','YYYY-MM-DD') AS attdate,
        '출근' AS attstat
    FROM
        dual
    UNION ALL
    SELECT
        TO_DATE('2022-12-06','YYYY-MM-DD') AS attdate,
        '출근' AS attstat
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
    || '교시' t_name,
    DECODE(level,1,'9:00',2,'10:00',3,'11:00',4,'12:00',5,'13:00',6,'14:00',7,'15:00',8,'16:00') p_sdate,
    DECODE(level,1,'9:50',2,'10:50',3,'11:50',4,'12:50',5,'13:50',6,'14:50',7,'15:50',8,'16:50') p_edate
FROM
    dual
CONNECT BY
    level <= 8;
    --
   