-- 테이블 생성
-- DDL
/* 
테이블명 정의 규칙
- 하나의 계정 내에서 테이블명은 유일해야 함
- 영문자로 시작해야함
- 영문자, 숫자, 특수문자 중 #_$를 사용할수 있음
- 30Bytes를 넘을 수 없음 (한글 1글자에 3Bytes) -> 순수한글 10글자까지 가능
- 예약어 사용 못함(NOT, NULL, INSERT ...)
*/

-- 영문 대소문자 바꾸기 : ALT +' : 드래그를 해야함.
-- 실행 : CTRL + ENTER, 플레이버튼 클릭
-- LPROD 테이블 생성(3개의 컬럼, LPROD_GU컬럼이 P.K)
create table LPROD
(
    LPROD_ID number(5) not null,  -- 순번
    LPROD_GU char(4) not null,  -- 상품분류 코드
    LPROD_NM varchar2(40) not null, -- 상품분류명
    constraint PK_LPROD primary key (LPROD_GU)
    );
    
-- 테이블에 설명글 달기
comment on column LPROD.LPROD IS '상품분류';

--- 컬럼에 설명글 달기
comment on column LPROD.LPROD_ID IS '순번';
comment on column LPROD.LPROD_GU IS '상품분류코드';
comment on column LPROD.LPROD_NM IS '상품분류명';

create table BUYER
(
BUYER_ID CHAR(6) NOT NULL,            -- 거래처 코드
BUYER_NAME VARCHAR2(40) NOT NULL,     -- 거래처명
BUYER_LGU CHAR(4) NOT NULL,           -- 취급상품 대분류
BUYER_BANK VARCHAR2(60),              -- 은행
BUYER_BANKNO VARCHAR2(60),            -- 계좌번호
BUYER_BANKNAME VARCHAR2(15),          -- 예금주
BUYER_ZIP CHAR(7),                    -- 우편번호
BUYER_ADD1 VARCHAR2(100),             -- 주소1
BUYER_ADD2 VARCHAR2(70),              --주소 2
BUYER_COMTEL VARCHAR2(14) NOT NULL,   --전화번호
BUYER_FAX VARCHAR2(20) NOT NULL       -- FAX 번호
);

/* 기본키 제약 조건 CONSTRAINT 
ALTER TABLE <테이블명>
ADD ( 새로운 컬럼명 TYPE [DEFAULT value]  , 등등 ) 
=> 컬럼추가, 기본 값, 제약조건 추가
MODIEHY ( 새로운 컬럼명 TYPE [NOT NULL] [DEFAULT value], 등등) 
 -> 컬럼 크기변경, NULL을 NOT NULL로, NOT NULL을 NULL로 제약조건 변경
 -> 컬럼명을 변경X -> 변경하기 위해 RENAME을 써야함
 DROP COLUMN 컬럼명 -> 기존 컬럼, 제약조건 제거
 */
 --BUYER 테이블의 구조 
 ALTER TABLE BUYER
ADD( 
BUYER_MAIL VARCHAR2(60) NOT NULL,
BUYER_CHAPRGER VARCHAR2(20) NULL,
BUYER_TELEXT VARCHAR2(2)
);
-- DESCFRIBE : 데이터 스키마를 묘사하다.
-- DESC BUYER;

ALTER TABLE BUYER
MODIFY(BUYER_NAME VARCHAR2(60));
DESC BUYER;

--ADD(추가) CONSTRAINT(제약사항) CHECK_PHONE(이름)
--CHECK : BUYER_TELEXT 컬럼에 데이터가 입력될 때 범위 설정
-- REGEXP_LIKE : 정규식
-- [0-9] : 0~9사이의 정수
-- [0-9][0-9] : 두 자리의 정수

ALTER TABLE BUYER
ADD CONSTRAINT CHECK_PHONE
CHECK(REGEXP_LIKE(BUYER_TELEXT, '[0-9][0-9]'));

--INDEX : 책의 목자차와 비슷함
--BUYER테이블의 BUYER_NAME, BUYER_ID를 묶어서 인덱스 생성
--검색속도를 빠르게하기위해

CREATE INDEX IDX_BUYER
ON BUYER(BUYER_NAME, BUYER_ID);

--인덱스 제거
DROP INDEX IDX_BUYER;

--기본키 조건 : NO DUPLICATE, NOT NULL(중복불가 널값 불허)
ALTER TABLE BUYER
ADD (constraint PK_BUYER_LPROD primary key(BUYER_ID));




ALTER TABLE BUYER
ADD(constraint FK_BUYER_LPROD foreign KEY(BUYER_LGU)
-- 위가 아래를 참조한다.
references LPROD(LPROD_GU)
-- 참조
);

ALTER TABLE BUYER
ADD (constraint PK_BUYER_ primary key



-------------------------------

-- 테이블 생성
-- DDL
/* 
테이블명 정의 규칙
- 하나의 계정 내에서 테이블명은 유일해야 함
- 영문자로 시작해야함
- 영문자, 숫자, 특수문자 중 #_$를 사용할수 있음
- 30Bytes를 넘을 수 없음 (한글 1글자에 3Bytes) -> 순수한글 10글자까지 가능
- 예약어 사용 못함(NOT, NULL, INSERT ...)
*/

-- 영문 대소문자 바꾸기 : ALT +' : 드래그를 해야함.
-- 실행 : CTRL + ENTER, 플레이버튼 클릭
-- LPROD 테이블 생성(3개의 컬럼, LPROD_GU컬럼이 P.K)
create table LPROD
(
    LPROD_ID number(5) not null,  -- 순번
    LPROD_GU char(4) not null,  -- 상품분류 코드
    LPROD_NM varchar2(40) not null, -- 상품분류명
    constraint PK_LPROD primary key (LPROD_GU)
    );
    
-- 테이블에 설명글 달기
comment on column LPROD.LPROD IS '상품분류';

--- 컬럼에 설명글 달기
comment on column LPROD.LPROD_ID IS '순번';
comment on column LPROD.LPROD_GU IS '상품분류코드';
comment on column LPROD.LPROD_NM IS '상품분류명';

create table BUYER
(
BUYER_ID CHAR(6) NOT NULL,            -- 거래처 코드
BUYER_NAME VARCHAR2(40) NOT NULL,     -- 거래처명
BUYER_LGU CHAR(4) NOT NULL,           -- 취급상품 대분류
BUYER_BANK VARCHAR2(60),              -- 은행
BUYER_BANKNO VARCHAR2(60),            -- 계좌번호
BUYER_BANKNAME VARCHAR2(15),          -- 예금주
BUYER_ZIP CHAR(7),                    -- 우편번호
BUYER_ADD1 VARCHAR2(100),             -- 주소1
BUYER_ADD2 VARCHAR2(70),              --주소 2
BUYER_COMTEL VARCHAR2(14) NOT NULL,   --전화번호
BUYER_FAX VARCHAR2(20) NOT NULL       -- FAX 번호
);

/* 기본키 제약 조건 CONSTRAINT 
ALTER TABLE <테이블명>
ADD ( 새로운 컬럼명 TYPE [DEFAULT value]  , 등등 ) 
=> 컬럼추가, 기본 값, 제약조건 추가
MODIEHY ( 새로운 컬럼명 TYPE [NOT NULL] [DEFAULT value], 등등) 
 -> 컬럼 크기변경, NULL을 NOT NULL로, NOT NULL을 NULL로 제약조건 변경
 -> 컬럼명을 변경X -> 변경하기 위해 RENAME을 써야함
 DROP COLUMN 컬럼명 -> 기존 컬럼, 제약조건 제거
 */
 --BUYER 테이블의 구조 
 ALTER TABLE BUYER
ADD( 
BUYER_MAIL VARCHAR2(60) NOT NULL,
BUYER_CHAPRGER VARCHAR2(20) NULL,
BUYER_TELEXT VARCHAR2(2)
);
-- DESCFRIBE : 데이터 스키마를 묘사하다.
-- DESC BUYER;

ALTER TABLE BUYER
MODIFY(BUYER_NAME VARCHAR2(60));
DESC BUYER;

--ADD(추가) CONSTRAINT(제약사항) CHECK_PHONE(이름)
--CHECK : BUYER_TELEXT 컬럼에 데이터가 입력될 때 범위 설정
-- REGEXP_LIKE : 정규식
-- [0-9] : 0~9사이의 정수
-- [0-9][0-9] : 두 자리의 정수

ALTER TABLE BUYER
ADD CONSTRAINT CHECK_PHONE
CHECK(REGEXP_LIKE(BUYER_TELEXT, '[0-9][0-9]'));

--INDEX : 책의 목자차와 비슷함
--BUYER테이블의 BUYER_NAME, BUYER_ID를 묶어서 인덱스 생성
--검색속도를 빠르게하기위해

CREATE INDEX IDX_BUYER
ON BUYER(BUYER_NAME, BUYER_ID);

--인덱스 제거
DROP INDEX IDX_BUYER;

--기본키 조건 : NO DUPLICATE, NOT NULL(중복불가 널값 불허)
ALTER TABLE BUYER
ADD (constraint PK_BUYER_LPROD primary key(BUYER_ID));




ALTER TABLE BUYER
ADD(constraint FK_BUYER_LPROD foreign KEY(BUYER_LGU)
-- 위가 아래를 참조한다.
references LPROD(LPROD_GU)
-- 참조
);
---- 149p ---
CREATE TABLE prod
(
    prod_id         varchar2(10) NOT NULL,   ---- 상품코드
    prod_name         varchar2(40) NOT NULL,   ---- 상품명
    prod_lgu         char(4) NOT NULL,      ---- 상품분류
    prod_buyer       char(6) NOT NULL,      ---- 공급업체(코드)
    prod_cost         number(10) NOT NULL,   ---- 매입가
    prod_price         number(10) NOT NULL,   ---- 소비자가
    prod_sale         number(10) NOT NULL,   ---- 판매가
    prod_outline         varchar2(100) NOT NULL,   ---- 상품개략 설명
    prod_detail         clob,                   ---- 상품상세설명
    prod_img         varchar2(40) NOT NULL,   ---- 이미지(소)
    prod_tatalstock         number(10) NOT NULL,   ---- 재고수량
    prod_insdate         date,                 ---- 신규일자(등록일)
    prod_properstock        number(10) ,   ---- 안전재고수량
    prod_size         varchar2(20) ,   ---- 크기
    prod_color         varchar2(20) ,   ---- 색상
    prod_delivery         varchar2(255) ,   ---- 배달 특기사항
    prod_unit         varchar2(6) ,   ---- 단위(수량)
    prod_qtyin         number(10) ,   ---- 총입고수량
    prod_qtysale         number(10) ,   ---- 총판매수량
    prod_mileage         number(10) ,   ---- 개당 마일리지 점수
    
    Constraint pk_prod Primary Key (prod_id),
    Constraint fr_prod_lprod Foreign Key (prod_lgu) 
                        references lprod(lprod_gu),
    Constraint fr_prod_buyer Foreign Key (prod_buyer) 
                        references buyer(buyer_id) );
    
    create table buyprod
    (   buy_date date not null, --- 입고일자
        buy_prod varchar2(10) not null, --- 상품코드
        buy_qty number(10) not null, --- 매입수량
        buy_cost number(10) not null, --- 매입단가
        Constraint pk_buyprod Primary Key (buy_date,buy_prod),
        Constraint fr_buyprod_prod Foreign Key (buy_prod) references prod(prod_id) )
        
   Create table member
   (     
    mem_id         varchar2(15) NOT NULL,   ---- 회원id
    mem_pass         varchar2(15) NOT NULL,   ---- 비밀번호
    mem_name         varchar2(20) NOT NULL,      ---- 성명
    mem_regno1       char(6) NOT NULL,      ---- 주민등록번호 앞 6 자리
    mem_regno2       char(7) NOT NULL,      ---- 주민등록번호 뒷 7 자리
    mem_bir         date,                     ----  생일
    mem_zip       char(7) NOT NULL,      ---- 우편번호
    mem_addl         varchar2(100) NOT NULL,      ---- 주소1
    mem_add2         varchar2(80) NOT NULL,      ---- 주소2
    mem_hometel         varchar2(14) NOT NULL,      ---- 집전화번호
    mem_comtel         varchar2(14) NOT NULL,      ---- 회사전화번호
    mem_hp              varchar2(15),               --- 이동전화
    mem_mail         varchar2(60) NOT NULL,      ---- E-mail 주소
    mem_job              varchar2(40),               --- 직업
    mem_like              varchar2(40),               --- 취미
    mem_memorial              varchar2(40),               --- 기념일명
    mem_memorialday             date,               --- 기념일날짜
    mem_mileage             number(10),             ---  마일리지
    mem_delete              varchar2(1),            ---- 삭제 여부
    constraint PK_member primary key (mem_id))
    
    create table cart
    (
        cart_member     varchar2(15)    not null,       ---회원 id
        cart_no         char(13)    not null,       --- 주문번호
        cart_prod       varchar2(10) not null,      --  상품코드
        cart_qty        number(8)  not null,        -- 수량
        constraint PK_cart primary key (cart_no,cart_prod),
        constraint fr_cart_member foreign key (cart_member)
        references member(mem_id),
        constraint fr_cart_prod foreign key (cart_prod)
        references prod(prod_id)
        )
        
     create table ziptb
     (
        zipcode char(7) not null, -- 우편번호
        sido varchar2(2 char) not null, -- 특별시, 광역시, 도
        gugun varchar2(10 char) not null, -- 시, 군, 구
        dong varchar2(30 char) not null, -- 읍, 면,동,리,건물명
        bunji varchar2(10 char), -- 번지, 아파트동, 호수
        seq number(5) not null ); -- 자료순서
        
        create index idx_ziptb_zipcode on ziptb(zipcode);
        
        
---180p 

/* INSERT : 테이블에 새로운 행을 추가할 때 실행.
    -컬럼명과 입력하는 값의 수가 동일해야함
    -컬럼명과 입력하는 값의 데이터타입(자료형)이 동일해야 함.
    -기본키와 필수 (N.N) 컬럼은 반드시 입력해야함.
    -컬럼명이 생략되면 모든 컬럼의 값이 입력되어야 함.
    -입력되지 않는 컬럼의 값은 널 (NULL) 값이 저장됨
    -입력되지 않은 컬럼에 기본 값이 선언된 컬럼은 기본 값이 저장됨

*/
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (1, 'P101', '컴퓨터제품');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (2, 'P102', '전자제품');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (3, 'P201', '여성캐쥬얼');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (4, 'P202', '남성캐쥬얼');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (5, 'P301', '피혁잡화');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (6, 'P302',  '화장품');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (7, 'P401', '음반/CD');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (8, 'P402', '도서');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (9, 'P403', '문구류');
    
--롤백 : RAM에 메모리로 저장된 정보가 되돌아감 -> 휘발성.
--커밋 : 커밋의 경우 이미 RAM에서 하드디스크로 저장했기 때문에 롤백이 되지않음.

---* : 아스트리크
-- select : 데이터 검색
-- lprod 테이블의 모든열과 행을 검색
select * from lprod;
-- 181p
/* 
- select문은 테이블(행과 열로 이루어진 2차원 배열=relation)로부터
필요한 데이터를 질의(query)하여 검색하는 명령문,
- select, from 절은 필수 절임.
--lprod 테이블의 모든 컬럼(속성, attribute, field, 열)의
-- 정보를 검색
-- * : 아스트리크 (모든 컬럼)
-- where(왜여? 왜그런데여?) : 행필터

*/    
select * from lprod;
select LPROD_GU, LPROD_NM
from LPROD
where LPROD_GU <= 'P102';
-- lprod 테이블의 데이터를 검색
-- 단, 상품분류코드가 p201 미만인
-- 정보만 검색. 구분코드와 구분명만 보이자.

SELECT LPROD_GU, LPROD_NM FROM LPROD
WHERE LPROD_GU > 'P201';

--lprod_id가 3인 row를 select하시오.
--lprod_id, lprod_gu, lprod_nm 컬럼을 모두 출력

select lprod_id, lprod_gu, lprod_nm 
from lprod 
where lprod_id = 3;

desc lprod; -- describe 구조

--p.181
--업데이트 쎄대여
select *
from lprod
where lprod_gu = 'P102';
-- 항상 업데이트 전에 변경위치가 맞는지 먼저 where로 검색하고 진행할것.
-- 전자제품  --> 변경 --> 향수
update lprod
set lprod_nm = '향수'
where lprod_gu = 'P102';

--lprod 테이블을 lprod2 테이블로 복사
--LPROD 테이블의 모든 정보를 LPROD2테이블을
--생성하면서 복제(단, P.K, F.K는 복제가 완됨)
CREATE TABLE LPROD2
AS
SELECT * FROM LPROD;

SELECT * FROM LPROD2;

--lprod2 테이블의 lprod_gu가 P202인 lprod_nm을
--남성 케쥬얼에서 도서류로 update 하시오

select *
from lprod2
where lprod_gu = 'P202';

update lprod2
set lprod_nm = '도서류'
where lprod_gu = 'P202';

commit;


-----------------------------------------------------------
-- 테이블 생성
-- DDL
/* 
테이블명 정의 규칙
- 하나의 계정 내에서 테이블명은 유일해야 함
- 영문자로 시작해야함
- 영문자, 숫자, 특수문자 중 #_$를 사용할수 있음
- 30Bytes를 넘을 수 없음 (한글 1글자에 3Bytes) -> 순수한글 10글자까지 가능
- 예약어 사용 못함(NOT, NULL, INSERT ...)
*/

-- 영문 대소문자 바꾸기 : ALT +' : 드래그를 해야함.
-- 실행 : CTRL + ENTER, 플레이버튼 클릭
-- LPROD 테이블 생성(3개의 컬럼, LPROD_GU컬럼이 P.K)
create table LPROD
(
    LPROD_ID number(5) not null,  -- 순번
    LPROD_GU char(4) not null,  -- 상품분류 코드
    LPROD_NM varchar2(40) not null, -- 상품분류명
    constraint PK_LPROD primary key (LPROD_GU)
    );
    
-- 테이블에 설명글 달기
comment on column LPROD.LPROD IS '상품분류';

--- 컬럼에 설명글 달기
comment on column LPROD.LPROD_ID IS '순번';
comment on column LPROD.LPROD_GU IS '상품분류코드';
comment on column LPROD.LPROD_NM IS '상품분류명';

create table BUYER
(
BUYER_ID CHAR(6) NOT NULL,            -- 거래처 코드
BUYER_NAME VARCHAR2(40) NOT NULL,     -- 거래처명
BUYER_LGU CHAR(4) NOT NULL,           -- 취급상품 대분류
BUYER_BANK VARCHAR2(60),              -- 은행
BUYER_BANKNO VARCHAR2(60),            -- 계좌번호
BUYER_BANKNAME VARCHAR2(15),          -- 예금주
BUYER_ZIP CHAR(7),                    -- 우편번호
BUYER_ADD1 VARCHAR2(100),             -- 주소1
BUYER_ADD2 VARCHAR2(70),              --주소 2
BUYER_COMTEL VARCHAR2(14) NOT NULL,   --전화번호
BUYER_FAX VARCHAR2(20) NOT NULL       -- FAX 번호
);

/* 기본키 제약 조건 CONSTRAINT 
ALTER TABLE <테이블명>
ADD ( 새로운 컬럼명 TYPE [DEFAULT value]  , 등등 ) 
=> 컬럼추가, 기본 값, 제약조건 추가
MODIEHY ( 새로운 컬럼명 TYPE [NOT NULL] [DEFAULT value], 등등) 
 -> 컬럼 크기변경, NULL을 NOT NULL로, NOT NULL을 NULL로 제약조건 변경
 -> 컬럼명을 변경X -> 변경하기 위해 RENAME을 써야함
 DROP COLUMN 컬럼명 -> 기존 컬럼, 제약조건 제거
 */
 --BUYER 테이블의 구조 
 ALTER TABLE BUYER
ADD( 
BUYER_MAIL VARCHAR2(60) NOT NULL,
BUYER_CHAPRGER VARCHAR2(20) NULL,
BUYER_TELEXT VARCHAR2(2)
);
-- DESCFRIBE : 데이터 스키마를 묘사하다.
-- DESC BUYER;

ALTER TABLE BUYER
MODIFY(BUYER_NAME VARCHAR2(60));
DESC BUYER;

--ADD(추가) CONSTRAINT(제약사항) CHECK_PHONE(이름)
--CHECK : BUYER_TELEXT 컬럼에 데이터가 입력될 때 범위 설정
-- REGEXP_LIKE : 정규식
-- [0-9] : 0~9사이의 정수
-- [0-9][0-9] : 두 자리의 정수

ALTER TABLE BUYER
ADD CONSTRAINT CHECK_PHONE
CHECK(REGEXP_LIKE(BUYER_TELEXT, '[0-9][0-9]'));

--INDEX : 책의 목자차와 비슷함
--BUYER테이블의 BUYER_NAME, BUYER_ID를 묶어서 인덱스 생성
--검색속도를 빠르게하기위해

CREATE INDEX IDX_BUYER
ON BUYER(BUYER_NAME, BUYER_ID);

--인덱스 제거
DROP INDEX IDX_BUYER;

--기본키 조건 : NO DUPLICATE, NOT NULL(중복불가 널값 불허)
ALTER TABLE BUYER
ADD (constraint PK_BUYER_LPROD primary key(BUYER_ID));




ALTER TABLE BUYER
ADD(constraint FK_BUYER_LPROD foreign KEY(BUYER_LGU)
-- 위가 아래를 참조한다.
references LPROD(LPROD_GU)
-- 참조
);
---- 149p ---
CREATE TABLE prod
(
    prod_id         varchar2(10) NOT NULL,   ---- 상품코드
    prod_name         varchar2(40) NOT NULL,   ---- 상품명
    prod_lgu         char(4) NOT NULL,      ---- 상품분류
    prod_buyer       char(6) NOT NULL,      ---- 공급업체(코드)
    prod_cost         number(10) NOT NULL,   ---- 매입가
    prod_price         number(10) NOT NULL,   ---- 소비자가
    prod_sale         number(10) NOT NULL,   ---- 판매가
    prod_outline         varchar2(100) NOT NULL,   ---- 상품개략 설명
    prod_detail         clob,                   ---- 상품상세설명
    prod_img         varchar2(40) NOT NULL,   ---- 이미지(소)
    prod_tatalstock         number(10) NOT NULL,   ---- 재고수량
    prod_insdate         date,                 ---- 신규일자(등록일)
    prod_properstock        number(10) ,   ---- 안전재고수량
    prod_size         varchar2(20) ,   ---- 크기
    prod_color         varchar2(20) ,   ---- 색상
    prod_delivery         varchar2(255) ,   ---- 배달 특기사항
    prod_unit         varchar2(6) ,   ---- 단위(수량)
    prod_qtyin         number(10) ,   ---- 총입고수량
    prod_qtysale         number(10) ,   ---- 총판매수량
    prod_mileage         number(10) ,   ---- 개당 마일리지 점수
    
    Constraint pk_prod Primary Key (prod_id),
    Constraint fr_prod_lprod Foreign Key (prod_lgu) 
                        references lprod(lprod_gu),
    Constraint fr_prod_buyer Foreign Key (prod_buyer) 
                        references buyer(buyer_id) );
    
    create table buyprod
    (   buy_date date not null, --- 입고일자
        buy_prod varchar2(10) not null, --- 상품코드
        buy_qty number(10) not null, --- 매입수량
        buy_cost number(10) not null, --- 매입단가
        Constraint pk_buyprod Primary Key (buy_date,buy_prod),
        Constraint fr_buyprod_prod Foreign Key (buy_prod) references prod(prod_id) )
        
   Create table member
   (     
    mem_id         varchar2(15) NOT NULL,   ---- 회원id
    mem_pass         varchar2(15) NOT NULL,   ---- 비밀번호
    mem_name         varchar2(20) NOT NULL,      ---- 성명
    mem_regno1       char(6) NOT NULL,      ---- 주민등록번호 앞 6 자리
    mem_regno2       char(7) NOT NULL,      ---- 주민등록번호 뒷 7 자리
    mem_bir         date,                     ----  생일
    mem_zip       char(7) NOT NULL,      ---- 우편번호
    mem_addl         varchar2(100) NOT NULL,      ---- 주소1
    mem_add2         varchar2(80) NOT NULL,      ---- 주소2
    mem_hometel         varchar2(14) NOT NULL,      ---- 집전화번호
    mem_comtel         varchar2(14) NOT NULL,      ---- 회사전화번호
    mem_hp              varchar2(15),               --- 이동전화
    mem_mail         varchar2(60) NOT NULL,      ---- E-mail 주소
    mem_job              varchar2(40),               --- 직업
    mem_like              varchar2(40),               --- 취미
    mem_memorial              varchar2(40),               --- 기념일명
    mem_memorialday             date,               --- 기념일날짜
    mem_mileage             number(10),             ---  마일리지
    mem_delete              varchar2(1),            ---- 삭제 여부
    constraint PK_member primary key (mem_id))
    
    create table cart
    (
        cart_member     varchar2(15)    not null,       ---회원 id
        cart_no         char(13)    not null,       --- 주문번호
        cart_prod       varchar2(10) not null,      --  상품코드
        cart_qty        number(8)  not null,        -- 수량
        constraint PK_cart primary key (cart_no,cart_prod),
        constraint fr_cart_member foreign key (cart_member)
        references member(mem_id),
        constraint fr_cart_prod foreign key (cart_prod)
        references prod(prod_id)
        )
        
     create table ziptb
     (
        zipcode char(7) not null, -- 우편번호
        sido varchar2(2 char) not null, -- 특별시, 광역시, 도
        gugun varchar2(10 char) not null, -- 시, 군, 구
        dong varchar2(30 char) not null, -- 읍, 면,동,리,건물명
        bunji varchar2(10 char), -- 번지, 아파트동, 호수
        seq number(5) not null ); -- 자료순서
        
        create index idx_ziptb_zipcode on ziptb(zipcode);
        
        
---180p 

/* INSERT : 테이블에 새로운 행을 추가할 때 실행.
    -컬럼명과 입력하는 값의 수가 동일해야함
    -컬럼명과 입력하는 값의 데이터타입(자료형)이 동일해야 함.
    -기본키와 필수 (N.N) 컬럼은 반드시 입력해야함.
    -컬럼명이 생략되면 모든 컬럼의 값이 입력되어야 함.
    -입력되지 않는 컬럼의 값은 널 (NULL) 값이 저장됨
    -입력되지 않은 컬럼에 기본 값이 선언된 컬럼은 기본 값이 저장됨

*/
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (1, 'P101', '컴퓨터제품');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (2, 'P102', '전자제품');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (3, 'P201', '여성캐쥬얼');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (4, 'P202', '남성캐쥬얼');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (5, 'P301', '피혁잡화');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (6, 'P302',  '화장품');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (7, 'P401', '음반/CD');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (8, 'P402', '도서');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (9, 'P403', '문구류');
    
--롤백 : RAM에 메모리로 저장된 정보가 되돌아감 -> 휘발성.
--커밋 : 커밋의 경우 이미 RAM에서 하드디스크로 저장했기 때문에 롤백이 되지않음.

---* : 아스트리크
-- select : 데이터 검색
-- lprod 테이블의 모든열과 행을 검색
select * from lprod;
-- 181p
/* 
- select문은 테이블(행과 열로 이루어진 2차원 배열=relation)로부터
필요한 데이터를 질의(query)하여 검색하는 명령문,
- select, from 절은 필수 절임.
--lprod 테이블의 모든 컬럼(속성, attribute, field, 열)의
-- 정보를 검색
-- * : 아스트리크 (모든 컬럼)
-- where(왜여? 왜그런데여?) : 행필터

*/    
select * from lprod;
select LPROD_GU, LPROD_NM
from LPROD
where LPROD_GU <= 'P102';
-- lprod 테이블의 데이터를 검색
-- 단, 상품분류코드가 p201 미만인
-- 정보만 검색. 구분코드와 구분명만 보이자.

SELECT LPROD_GU, LPROD_NM FROM LPROD
WHERE LPROD_GU > 'P201';

--lprod_id가 3인 row를 select하시오.
--lprod_id, lprod_gu, lprod_nm 컬럼을 모두 출력

select lprod_id, lprod_gu, lprod_nm 
from lprod 
where lprod_id = 3;

desc lprod; -- describe 구조

--p.181
--업데이트 쎄대여
select *
from lprod
where lprod_gu = 'P102';
-- 항상 업데이트 전에 변경위치가 맞는지 먼저 where로 검색하고 진행할것.
-- 전자제품  --> 변경 --> 향수
update lprod
set lprod_nm = '향수'
where lprod_gu = 'P102';

--lprod 테이블을 lprod2 테이블로 복사
--LPROD 테이블의 모든 정보를 LPROD2테이블을
--생성하면서 복제(단, P.K, F.K는 복제가 완됨)
CREATE TABLE LPROD2
AS
SELECT * FROM LPROD;

SELECT * FROM LPROD2;

--lprod2 테이블의 lprod_gu가 P202인 lprod_nm을
--남성 케쥬얼에서 도서류로 update 하시오

select *
from lprod2
where lprod_gu = 'P202';

update lprod2
set lprod_nm = '도서류'
where lprod_gu = 'P202';

commit;

select * 
from lprod2 
where LPROD_ID =7;

update LPROD2 
set LPROD_GU = 'P303' 
where LPROD_ID =7;

--------p.182----------
-- 테이블의 행을 삭제함
--　모든　행을　삭제　할수도　있고　（where절이　없을　때）
--　특정　행을　삭제할　수도　있음．　（where절　있음）

--등푸른생선 주세여
-- delete from 테이블명
-- where 조건;
--lprod2 테이블에서 lprod_nm이 화장품인
--데이터를 삭제하시오. (row가 삭제 됨.)==행,튜플,레코드가 삭제됨.

select *
from lprod2
where lprod_nm = '화장품';

DELETE FROM lprod2
where lprod_nm = '화장품';

-- 고정길이, 가변길이
-- char(6)  'a'   where ?? =  'a     '   , 성능좋고, 저장효율 좋고, 사용은 불편
-- varchar(6) 'a' where ?? =  'a'        , 성능좀 나쁘고, 저장효율 좋고, 사용편함

select * from lprod;

--p.182
--테이블의 모든 row와 column 을 검색
--select * from  테이블명;

-- 상품 테이블로부터 모든 row와 columndmf 검색하시오
select * from prod;
-------------------------------------------------------------------------------------







--p.182
-- 테이블의 모든 row와 column을 검색

select * from prod;

-- 회원테이블로부터 모든행과 열을 검색하시오.
select* from member;

-- * 표시를 아스트리크 라고 부른다.

select* from cart;

-- 상품테이블로부터 상품코드와 상품명을 검색하시오.

select prod_id  --상품코드
    , prod_name --명
from prod;

--buyer 테이블을 buyer2 테이블로 복사하시오

create table buyer2
as
select * from buyer;

--2. buyer2 테이블의 buyer_id, buyer_name, buyer_lgu 컬럼을 모드 select  하시오

select buyer_id, buyer_name, buyer_lgu
from buyer2;

--3. buyer2 테이블의 buyer_id가 P30203인 buyer_name
--   값을 거성으로 update하시오

select *
from buyer2
where buyer_id = 'P30203';

update buyer2
set buyer_name = '거성'
where buyer_id = 'P30203';

--4. buyer2 테이블의 buyer_name이 피리어스인 row 를 삭제하시오

select*
from buyer2
where buyer_name = '피리어스';

DELETE FROM buyer2
where buyer_name = '피리어스';
commit;
--산술 연산자를 사용하여 검색되는 자료값 변경
--산술 연산식은 column 명, 상수 값, 산술 연잔자로 구성
--산술 연산자는 +, -, *, /, ()로 구성
--SELECT  산술연산식  FROM 테이블명

select mem_id
, 1004
, '내일이 지나면..'
, mem_name
, mem_mileage
, mem_mileage / 12 as "월 평균"
from member;

--장바구니 테이블로부터 주문번호, 상품코드 
-- 회원 id, 수량을 검색하시오.

select cart_no
    , cart_prod
    , cart_member
    , cart_qty
from cart;

--p.183
-- 산술 연산자는 +, -, /, () 로 구성
-- 회원 테이블의 마일리지를 12로 나눈 값을 검색하시오.
-- round : 반올림 함수, (,2 : 소수점 2째 자리까지 살리고 반올림)

select mem_mileage
    , mem_mileage/12
    , round (mem_mileage/12, 2)
    ,mem_mileage + 12
    , mem_mileage - 12
    , mem_mileage * 12
from member;

--상품 테이블(PROD)의 상품코드, 상품명, 판매금액을 
--검색 하시오?
--판매금액은  = 판매단가 * 55 로 계산한다.
--상품코드(PROD_ID), 상품명(PROD_NAME), 
--판매단가(PROD_SALE)

select prod_id
        ,prod_name
        ,prod_sale * 55
from prod;

--p.183
-- distinct : 중복제거 ,  예약어
-- 컬럼 목록의 맨앞에 1회 사용
-- 중복 row(행)의 제거
-- 상품 테이블(prod)의 상품분류(prod_lgu)를
-- 중복되지 않게 검색

select DISTINCT prod_lgu
from prod;

select distinct cart_member
            ,cart_prod
            from cart;
            
--상품 테이블의 거래처코드를 중복되지
--않게 검색하시오 ?
--(Alias는 거래처)
--거래처코드 : PROD_BUYER

select DISTINCT PROD_BUYER
from prod;

--P.183
--ROW(행)을 SORT(정렬)하고자 하면 ORDER BY 절을 사용
--ASC(Ascending) : 오름차순,ASC는 생략 가능
--  숫자형은 0부터 9, 영문자는 A부터 Z, 한글은 가나다.. 순으로 정렬
--DESC(Descending) : 내림차순
--  숫자형은 9부터 0, 영문자는 Z부터 A, 한글은 하파타.. 순으로 정렬

-- asc  : 앞으로 정렬
-- desc : 뒤로 정렬


 /*
 SELECT 'a나' COL1 FROM DUAL
UNION ALL
SELECT 'A나' FROM DUAL
UNION ALL
SELECT 'a나' FROM DUAL
UNION ALL
SELECT 'B나' FROM DUAL
UNION ALL
SELECT 'b나' FROM DUAL
UNION ALL
SELECT 'B나' FROM DUAL
ORDER BY 1;
 */
 
 -- ALLIAS(별칭): select 절과 from절에 사용되는 별명.
 --1) select절에서 사용
 -- 컬럼을 출력할 때 부제목으로 사용
 -- order by절의 출력 순서를 지정시 사용가능
 --2) from절에서 사용
 -- 테이블 명을 단순화 하기  위해 사용
 --select 문의 각 절에서 컬럼명을 구분할 때 사용
 -- 테이블 명 alias 명

 SELECT   mem_id      회원ID 
        , mem_name   as   "성명"
        , mem_bir       "생일"
        , mem_mileage   마일리지
 from member
 order by 성명;
  -- ex) as "성명" or "성명" or 성명
  
  
 ----- 컬럼번호로도 가능 
  SELECT   mem_id      회원ID 
        , mem_name   as   "성명"
        , mem_bir       "생일"
        , mem_mileage   마일리지
 from member
 order by 3;-- 3 뒤에 asc 생략
 
 -- 다중 정렬
  SELECT   mem_id       회원ID 
        , mem_name      성명
        , mem_bir       생일
        , mem_mileage   마일리지
  from member
  order by mem_mileage, 1; 
  -- 같은 데이터에 관해 마일지지 부분으로 1차 정렬을 하고 , 그 이후에 회원id로 1차 정렬 안에서 2차로 정렬을 하라는 뜻.
  
  --회원테이블(MEMBER)에서
--MEM_ID(회원ID), MEM_JOB(직업), 
--MEM_LIKE(취미)를 검색하기
--직업으로 오름차순, 취미로 내림차순, 
--회원ID로 오름차순 정렬

SELECT MEM_ID  회원id
    , MEM_JOB   직업
    , MEM_LIKE  취미
FROM MEMBER
order by 직업 asc, 취미 desc, 1 asc;

--직업(MEM_JOB)이 회사원인 회원의 
--MEM_MEMORIAL 컬럼의 데이터를 
--NULL로 수정하기
--** MEM_MEMORIAL = NULL
--** 조건검색 시 ''(홀따옴표)를 사용함

select *
from member
where mem_job = '회사원';

update member
set mem_memorial = null
where mem_job = '회사원';

commit;
---오름차순 (null은 맨아래에 위치)
select mem_memorial, mem_id from member
order by mem_memorial asc;

-- 내림차순 (null은 맨위에 위치)
select mem_memorial, mem_id from member
order by mem_memorial desc;

--상품테이블(PROD)의 전체 컬럼을 검색하는데
--판매가(PROD_SALE)로 내림차순 후, 
--상품분류코드(PROD_LGU)로 오름차순 후
--상품명(PROD_NAME)으로 오름차순 정렬해보자

SELECT *
from prod
order by PROD_SALE desc,PROD_LGU , PROD_NAME;

-----비교 연산
/*
        A=B 같다.
        A<>B, A!= B 같지않다
        A<B, A>B  소<대 비교 미만, 초과
        A<=B, A>=B 이상, 이하

*/

--상품 중 판매가가 170,000원인 상품조회
-- ALLAS : 상품명, 판매가

SELECT PROD_NAME    상품명
        , PROD_SALE  판매가
FROM PROD
WHERE PROD_SALE !=  170000;

--ORDER BY 판매가;

--P.185
--상품 중 매입가(PROD_COST)가 
--200,000원 이하인 상품을 검색하시오
--(ALIAS는 상품코드(PROD_ID), 
--상품명(PROD_NAME), 매입가(PROD_COST))

select prod_name  상품코드
, prod_name       상품명
, prod_cost       매입가
from prod
where prod_cost <= 200000;

--회원 중 76년도 1월 1일 이후에 
--태어난 회원을 검색하시오
--단, 주민등록번호 앞자리로 비교
--(ALIAS는 회원ID(MEM_ID), 
--회원명(MEM_NAME), 
--주민등록번호앞자리(MEM_REGNO1))

select mem_name 회원명
, mem_id        회원ID
, MEM_REGNO1    주민등록번호앞자리
from member
where MEM_REGNO1 > '760101';

-- 문자열이기 때문에 ','표시를 붙인 것.

-- (항상관심 AND 아플때챙기기 AND 기념일(달별) 준수 AND 탄신일 AND 훈남);

-- OR
-- (여러가지 조건 중 하나만 충족 하면됨.)

--P.185
-- 상품 중 상품분류가 P201(여성 캐쥬얼) 이거나 판매가가 170000 원인 상품 조회

select prod_name as 상품
, prod_lgu 상품분류
, prod_sale 판매가
from prod
where prod_lgu ='P201'
or prod_sale = 170000;

-- 상품분류가 P201 아니고 판매가가 170000 원도 아닌 상품 조회

SELECT PROD_NAME 상품
,  PROD_LGU  상품분류
, PROD_SALE  판매가
FROM PROD
WHERE  
PROD_LGU!='P201' 
AND 
PROD_SALE!= 170000;

--상품 중 판매가가 300,000원 이상, 500,000원 
--이하인 상품을 검색  하시오 ?
--( Alias는 상품코드(PROD_ID), 
--상품명(PROD_NAME), 판매가(PROD_SALE) )

SELECT PROD_ID 상품코드
, PROD_NAME     상품명
, PROD_SALE     상품가
FROM PROD
WHERE 300000 >= PROD_SALE
AND PROD_SALE <= 500000;

--문제 :
--회원(MEMBER) 테이블에서
--직업(MEM_JOB)이 공무원인 인원 중 
--마일리지(MEM_MILEAGE)가 1500 이상인 
--리스트를 검색하시오.
--모든 컬럼을 포함시키기

SELECT * 
FROM MEMBER
WHERE MEM_JOB = '공무원'
AND  MEM_MILEAGE >= 1500;

---- 기타연산자 : IN
SELECT PROD_NAME
    ,  PROD_SALE
FROM   PROD
WHERE PROD_SALE = 150000
OR PROD_SALE = 170000 
OR PROD_SALE = 330000;
--- 위와 같은 내용
SELECT PROD_NAME
    ,  PROD_SALE
FROM   PROD
WHERE PROD_SALE IN(150000, 170000, 330000);

-- 회원 테이블(MEMBER)에서
-- 회원 ID(MEM_ID) 가 c001, f001, w001 인 회원만 검색하시오
--- 회원 ID(MEM_ID), 회원명(MEM_NAME)

SELECT  MEM_ID    회원ID
,       MEM_NAME  회원명
FROM MEMBER
WHERE MEM_ID IN('c001', 'f001', 'w001');

--P.186
--상품 분류테이블에서 현재 상품테이블에 
--존재하는 분류만 검색(분류코드(LPROD_GU)
--, 분류명(LPROD_NM))

SELECT LPROD_GU 분류코드
, LPROD_NM 분류명
FROM      LPROD
WHERE LPROD_GU IN(SELECT DISTINCT PROD_LGU FROM PROD);

-- IN 앞에 NOT 을 붙이면 중복되지 않는 내용만 출력함 범위내의.

SELECT LPROD_GU 분류코드
, LPROD_NM 분류명
FROM      LPROD
WHERE LPROD_GU NOT IN(SELECT DISTINCT PROD_LGU FROM PROD);

SELECT DISTINCT PROD_LGU
FROM PROD;

----------------
-- P.186
-- 상품 중 판매가가 100000에서 300000 사이인 상품 조회
--상품 중 판매가가 100,000원 부터 300,000원 
--사이의 상품 조회
--ALIAS : 상품명, 판매가


SELECT PROD_NAME 회원명
    ,  PROD_SALE 판매가
FROM PROD
WHERE PROD_SALE BETWEEN 100000 AND 300000;

--회원 중 생일이 1975-01-01에서 1976-12-31사이에 
--태어난 회원을 검색하시오 ? 
--( Alias는 회원ID, 회원 명, 생일 )

SELECT MEM_ID   회원ID
    ,  MEM_NAME   회원명
    ,  MEM_BIR    생일
FROM MEMBER
WHERE MEM_BIR BETWEEN '1975-01-01' AND '1976-12-31';

-- 날짜형과 날짜형 문자의 비교시 
-- 날짜형 문자-> 날짜형으로 자동 형변환

--P.186
--상품 중 매입가(PROD_COST)가 300,000~1,500,000이고 
--판매가(PROD_SALE)가  800,000~2,000,000 인 상품을 검색하시오 ?
--( Alias는 상품명(PROD_NAME), 
--매입가(PROD_COST), 판매가(PROD_SALE) )

SELECT PROD_COST  매입가
      ,PROD_SALE  판매가
      ,PROD_NAME  상품명
FROM PROD
WHERE  PROD_SALE BETWEEN 300000 AND 1500000
AND PROD_COST BETWEEN 800000 AND 2000000; 



--회원 중 생일이 1975년도 생이 아닌
--회원을 검색하시오 ?
--( Alias는 회원ID, 회원명, 생일)

SELECT MEM_BIR  생일
     , MEM_ID  회원ID
     , MEM_NAME  회원명
FROM MEMBER
WHERE MEM_BIR NOT BETWEEN '1975-01-01' AND '1975-12-31';

--★★★★★★  LIKE 연산자  ★★★★★ 
-- 중요하고 많이 쓰임
-- LIKE와 함께 쓰이는 %, _ : 와일드 카드
--  % : 여러글자, _ : 한글자
-- 삼% : 삼으로 시작하고 뒤에 여러글자가 나옴
---------------------------------------
SELECT PROD_ID 상품코드
      ,PROD_NAME  상품명
FROM PROD
WHERE PROD_NAME LIKE '삼%';
-----------------------------------

SELECT PROD_ID
      ,PROD_NAME
FROM PROD
WHERE PROD_NAME LIKE '_성%';

-------------------------------

SELECT PROD_ID 상품코드
      ,PROD_NAME  상품명
FROM PROD
WHERE PROD_NAME LIKE '%치';
---------------------------------
SELECT PROD_ID 상품코드
      ,PROD_NAME  상품명
FROM PROD
WHERE PROD_NAME NOT LIKE '%치';

------------------------


SELECT PROD_ID
      ,PROD_NAME
FROM PROD
WHERE PROD_NAME LIKE '%여름%';
    
    
--- 회원테이블에서 김씨 성을 가진 회원을 검색하시오
SELECT MEM_NAME
      ,MEM_ID
    FROM MEMBER
    WHERE MEM_NAME LIKE '김%';
    
-- 회원테이블에서 주민등록번호 앞자리를 검색하여 1975년 생을 제외한 회원을 검색하시오.

SELECT MEM_NAME
      ,MEM_ID
      ,MEM_REGNO1 || ' ' || MEM_REGNO2  주민등록번호
FROM MEMBER
WHERE MEM_REGNO1 NOT LIKE '75%';

--개똥이는 취업기념으로 삼성에서 만든 제품을 구입하고자 한다.
--가격은 100만원 미만이며 가격이 내림차순으로 정렬된 
--리스트를 보고자 한다.
--(ALIAS는 상품ID(PROD_ID), 상품명(PROD_NAME), 
--판매가(PROD_SALE), 제품설명글(PROD_DETAIL))

SELECT PROD_NAME 상품명
      ,PROD_SALE  판매가
      ,PROD_ID  상품ID
      ,PROD_DETAIL 제품설명글
FROM PROD
WHERE PROD_NAME LIKE '%삼성%' AND PROD_SALE < 1000000
ORDER BY PROD_SALE DESC;

----함수
---논리 연산자의 순서
--- 1번째로 () , 2번째 NOT, 마지막으로 3번째는 AND 
--- P.193
SELECT 'a' || 'bcde' from dual;
select mem_id || ' name is ' || mem_name from member;

-- concat함수 : 두 문자열을 연결하여 반환.
select concat('My Name is', mem_name) from member;
--- char : ascii -> 문자 / ascii : 문자를 ascii

select car(65) "CHR", ASCII('ABC') "ASCII" FROM DUAL;
SELECT ASC



--- P.194
--LOWER : 소문자로 반환
---UPPER : 대문자로 반환
--- INITCAP : 첫글자만 대문자로 반환

---회원 테이블의 회원ID를 대문자로
-- 변환하여검색하시오>?

select mem_id
      ,upper(mem_id)
from member;

----------------
--06-17 P.194
--P.194
--상품테이블의 소비자가격(PROD_PRICE)과  
--소비자가격을 치환화여 다음과 같이 출력되게 하시오 
--ALIAS : PROD_PRICE  PROD_RESULT(LPAD함수를 통해 처리)



SELECT PROD_PRICE
      ,LPAD(290000,10,'*') PROD_RESULT
FROM PROD;


-----P.195
SELECT '<' || LTRIM('    AAA    ')|| '>' "LTRIM1"
      ,'<' || LTRIM('HELLO WORLD', 'He')|| '>' "LTRIM2"
      ,'<' || LTRIM('LLO  HE WORLD', 'HE')|| '>' "LTRIM3"
      ,'<' || LTRIM('HELLO HE WORLD', 'HE')|| '>' "LTRIM4"
      ,'<' || LTRIM('HEHELLO HE WORLD', 'HE')|| '>' "LTRIM5"
FROM DUAL;

--RTRIM / RIGHT(대상 문자열, 찾은 문자열)
-- " " 알리아스기 때문에 큰 따옴표 생략 가능.
SELECT '<' || RTRIM('    AAA    ')|| '>' "RTRIM1"
      ,'<' || RTRIM('HELLO WORLD', 'He')|| '>' "RTRIM2"
      ,'<' || RTRIM('LLO  HE WORLD', 'HE')|| '>' "RTRIM3"
      ,'<' || RTRIM('HEHELLO HE WORLD', 'HE')|| '>' "RTRIM4"
      ,'<' || REPLACE('HEHELLO HE WORLD', 'HE')|| '>' "RTRIM5"
FROM DUAL;

-- DUAL : 가상의 테이블 SYS.DUAL 도 가능

-- TRIM : L +R
--TRIM : L + R
SELECT '<' || TRIM('     AAA     ') || '>' TRIM1
     , '<' || TRIM(LEADING 'a' FROM TRIM('    aaAaBaAaa')) || '>' TRIM2
     , '<' || TRIM( 'a' FROM 'aaAaBaAaa')|| '>' TRIM3
     , '<' || TRIM(BOTH 'a' FROM 'aaAaBaAaa') || '>' TRIM4
     , '<' || TRIM(TRAILING 'a' FROM 'aaAaBaAaa')  || '>' TRIM5
FROM SYS.DUAL;

-----P. 195
-- ****** 중요함
-- SUBSTR

--SELECT SUBSTR('SQL PROJECT',1,3) 
--  숫자 세번째 인수가 없으면 끝까지 찾음

--*****
SELECT SUBSTR('SQL PROJECT',1,3)  AS RESULT1
     , SUBSTR('SQL PROJECT',5)    AS RESULT2
     , SUBSTR('SQL PROJECT',-7,3) AS RESULT3 --M이 음수이면 뒤쪽에서부터 처리
FROM   DUAL;

/
--회원테이블의 성씨 조회
SELECT MEM_ID               AS 회원ID
     , MEM_NAME
     , SUBSTR(MEM_NAME,1,1) AS 성씨
FROM   MEMBER;

--상품테이블의 상품명(PROD_NAME)의 
--4째 자리부터  2글자가
--'칼라' 인 상품의 상품코드(PROD_ID), 
--상품명(PROD_NAME)을 검색하시오 ?
--( Alias명은 상품코드(PROD_ID), 상품명(PROD_NAME) )

--상품테이블의 상품명(PROD_NAME)의 
--4째 자리부터  2글자가
--'칼라' 인 상품의 상품코드(PROD_ID), 
--상품명(PROD_NAME)을 검색하시오 ?
--( Alias명은 상품코드(PROD_ID), 상품명(PROD_NAME) )


SELECT SUBSTR('PROD_ID',4,6)  AS RESULT1
     , SUBSTR('PROD_ID', 4, 2)  
WHERE SUBSTR('PROD_ID', 4, 2 ) LIKE '%컬러%'  AS RESULT2
FROM   DUAL;

---------------------------------------


--풀이
SELECT PROD_ID  상품코드
     , PROD_NAME   상품명
     , SUBSTR(PROD_NAME,4,2)
FROM PROD

WHERE SUBSTR(PROD_NAME,4,2) ='칼라';
--AND WHERE PROD_NAME LIKE '___칼라%';



--P.196
--P102000001 : 상품코드
--P102       : 대분류
--000001     : 순번
--상품테이블의 상품코드(PROD_ID)에서 왼쪽4자리, 
--오른쪽6자리를 검색하시오 ?
--(Alias명은 상품코드(PROD_ID),  대분류,  순번)

---
SELECT PROD_ID 상품코드
      , SUBSTR(PROD_ID, 1, 4) 순번
      , SUBSTR(PROD_ID, 5)  대분류
FROM PROD;      


----------------------------------
SELECT REPLACE('SQL Project', 'SQL', 'SSQQL')  AS 문자치환1
      ,REPLACE('Java Flex Via', 'a')   as 문자치환 
      ,RTRIM('Java Flex Vai','a')
from dual;    



-거래처 테이블의 거래처명 중 '삼' ---> '육' clghks
select buyer_name,
replace(buyer_name, '삼', '육')
from buyer;

-----회원 테이블의 회원 성명중 '이' -> '리' 치환검색
select mem_name,
replace (mem_name, '이', '리')
from member;

select mem_name,                      회원명
      replace(mem_name,'이','리')  회원명치환
from member;      

--instr
--p.196
--INSTR(대상 문자열, 찾은문자열 , 시작위치, 글자수)
--INSTR('hello heidi', 'he', 1, 2)

select instr('I have a hat.' ,'ha',1,1)  1번째
from dual;

select instr('I have a hat.' ,'ha',1,2)
from dual;

--문제 : I have a hat that i had have been found 
--      that hat before 2 years ago.
--1. 상위 문장에서 5번째 ha의 위치를 출력
--INSTR(c1 ,c2, [m, [n]]) : m에서 시작해서 n번째의 c2의 위치를 출력

select instr('I have hat that i had have been found that hat before 2 years ago.','ha',1,5)
from dual;


--문제
--mepch@test.com
--상위 문자에서 @를 기준으로 다음과 같이 출력하기
--아이디 | 도메인
--------------------
--mepch  | test.com

select replace('mepch@test.com','@','|')
from dual;

--풀이
select substr('mepch@test.com',1,5)
       ,substr('mepch@test.com', 7)
       ,instr('mepch@test.com','@')
from dual;

SELECT SUBSTR('mepch@test.com',1,INSTR('mepch@test.com','@')-1) 아이디
     , SUBSTR('mepch@test.com',INSTR('mepch@test.com','@')+1) 도메인
--     , INSTR('mepch@test.com','@')
FROM   DUAL;

select mem_id  회원아디
      ,mem_name 회원명
      ,substr(mem_mail,1,instr(mem_mail,'@')-1)  아이디
      ,substr(mem_mail,instr(mem_mail,'@')+1) 도메인
      from member;
     
     
---p.197
--length :  글자수, length : 글자의 bytes
--영문자/특수기호 :1byte , 한글 : 3byte

select length ('SQL 프로젝트') "LENGTH"
      ,LENGTHB('SQL 프로젝트') "LENGTHB"
    FROM DUAL;
    
select buyer_id             거래처코드
      ,length(buyer_id)     거래처코드길이
      ,buyer_name               거래처명
      ,length(buyer_name)       거래처명길이
      ,lengthb(buyer_name)      거래처명byte수
      from buyer;
      
---p.197

-- ABS: 절대값
SELECT ABS(-365) FROM DUAL; --365

---SIGN : 양수(1), 0(0), 음수(-1)
SELECT SIGN(12), SIGN(0), SIGN(-55) FROM DUAL;

--승수 값 (N의 Y승)
SELECT POWER(3,2), POWER(2,0) FROM DUAL;

--제곱근
SELECT SQRT(2), SQRT(9) FROM DUAL;


-----------------------------------
--P.197
SELECT GREATEST(10, 20, 30) 가장큰값
     , LEAST(10, 20, 30)    가장작은값
FROM   DUAL;

--숫자보다 한글이 큼
SELECT GREATEST('강아지', 256, '송아지') 가장큰값
     , LEAST('강아지', 256, '송아지')    가장작은값
FROM   DUAL;

--P.198
--회원(MEMBER) 테이블에서 회원이름(MEM_NAME),  
--마일리지(MEM_MILEAGE)를 출력하시오
--(단, 마일리지가 1000보다 작은 경우 1000으로 변경)

select mem_name  회원이름
      ,mem_mileage  마일리지
      ,greatest(mem_mileage,1000)  마일리지1천이하
from member;

---p. 198
-- round : 반올림, trunc :  버림
---- 2 : 소수 둘째자리까지 살리고
---- -2 : 소수 둘째자리에서 반올림

SELECT ROUND (345.123, -2)  결과 FROM DUAL;
SELECT ROUND (345.123, -1)  결과 FROM DUAL;
SELECT ROUND (345.123, -0)  결과 FROM DUAL;
SELECT ROUND (345.123, 1)  결과 FROM DUAL;
SELECT ROUND (345.123, 2)  결과 FROM DUAL;

--양수면 살리고, 음수면에서
SELECT TRUNC(345.123, 0) 결과 FROM DUAL;
SELECT TRUNC(345.123, 1) 결과 FROM DUAL;
SELECT TRUNC(345.123, 2) 결과 FROM DUAL;
SELECT TRUNC(345.123, -1) 결과 FROM DUAL;
SELECT ROUND(345.123, -1) 결과1,
      TRUNC(345.123, -1) 결과2 FROM DUAL;


-- 회원테이블의 마일리지를 12로 나눈 값을 검색
-- (소수2째자리 살리기 반올림, 절삭)

SELECT ROUND((mem_mileage/12), 2) 결과
FROM MEMBER;

SELECT MEM_MILEAGE /12  결과1
      ,ROUND(MEM_MILEAGE /12, 2) 살리기반올림 
      ,TRUNC(MEM_MILEAGE /12, 2) 절삭
FROM MEMBER;

--P.198
--상품테이블의 상품명, 원가율( 매입가 / 판매가 )을  비율(%)로
--(반올림 없는 것과 소수 첫째자리 살리기 반올림 비교) 검색하시오 ?
--(Alias는 상품명, 원가율1, 원가율2)

SELECT PROD_NAME  상품명
      ,PROD_SALE  판매가
      ,PROD_COST  매입가
      , ROUND((PROD_COST/PROD_SALE  ) *100, 1) 원가율1
      , ((PROD_COST/PROD_SALE  ) *100) 원가율2     
FROM PROD;

----P.198 MOD : 나머지구하기
--- int nameuji = 10 % 3; java
--- 
SELECT MOD(10,3) FROM DUAL;

--회원테이블(MEMBER)의 마일리지를 12로 나눈 나머지를 구하시오
--ALIAS는 회원ID(MEM_ID), 회원명(MEM_NAME), 
--마일리지원본(MEM_MILEAGE), 마일리지결과(MEM_MILEAGE)

SELECT 
       MEM_ID 회원ID
      ,MEM_NAME 회원명
      , MEM_MILEAGE  마일리지원본
      ,MOD(MEM_MILEAGE, 12) 마일리지결과
FROM MEMBER;

--P.198
-- FLOOR : 내림(마룻바닥) 
-- CEIL : 올림(천장)
SELECT FLOOR(1332.69), CEIL(1332.69) FROM DUAL;
SELECT FLOOR(-1332.69), CEIL(-1332.69) FROM DUAL;
SELECT FLOOR(2.69), CEIL(2.69) FROM DUAL;
SELECT FLOOR(-2.69), CEIL(-2.69) FROM DUAL;

--문제
--  -3.141592의 내림(FLOOR)과 올림(CEIL)을 구하시오
--ALIAS : 원본, 내림, 올림

SELECT -3.141592 원본
      ,FLOOR(-3.141592) 내림
      ,CEIL(-3.141592) 올림
    FROM DUAL;
    
--- SYSDATE ★★★★★
--- 시스템날짜의 연-월-일 시:분:초
SELECT SYSDATE FROM DUAL;
--- 시스템날짜의 연-월-일 시:분:초.1000분의 1초
SELECT SYSTIMESTAMP FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS')
      , SYSDATE -1
      , SYSDATE +1
      FROM DUAL;
      
--P.199
--회원테이블(MEMBER)의 생일과 
--12000일째 되는 날을 검색하시오 ?
--(Alias는 회원명(MEM_NAME), 
--생일(MEM_BIR), 12000일째)

SELECT  MEM_NAME 회원명
      , MEM_BIR  회원생일
      ,MEM_BIR + 12000 "12000일생일"
      , TO_CHAR(MEM_BIR +12000, 'YYYY-MM-DD HH:MI:SS AM')
FROM MEMBER;


--나는 몇 일을 살았을까>
SELECT TO_DATE('1999-09-02') 내생일
      ,ROUND(SYSDATE - TO_DATE('1995-09-03'),1)  내가산일수
FROM DUAL;

-- 곱하기나 나누기, 더하기는 안되고 날짜에서 날짜를 뺄수만 잇다 

--문제 : 나는 몇 일을 살았는가? TO_DATE('2015-04-10')함수 이용
--단, 밥은 하루에 3번을 먹음.
--      소수점 2째자리까지 반올림하여 처리하시오.
--ALIAS : 내생일, 산일수, 밥먹은수, 
--밥먹은비용(한끼에 3000원으로 처리)

SELECT TO_DATE('1995-09-03') 생일
      ,ROUND(SYSDATE - TO_DATE('1995-09-03'),2) 내가산일수
      ,ROUND(SYSDATE - TO_DATE('1995-09-03'),2)*3  밥
      ,ROUND((SYSDATE - TO_DATE('1995-09-03'))*3*3000,2)  밥값
      FROM DUAL;


--P.199
--ADD_MONTHS() 함수 : 월을 더한 날짜
-- 오늘부터 5월 후의 날짜
SELECT ADD_MONTHS(SYSDATE, 5) FROM DUAL;

---NEXT_DAY() : 가장 빠른 요일의 날짜
---LAST_DAY() : 월의 마지막 날짜.
SELECT NEXT_DAY(SYSDATE, '월요일')
      ,NEXT_DAY(SYSDATE, '금요일')
      ,LAST_DAY(SYSDATE)
    FROM DUAL;
    

--이번달이 며칠이 남았는지 검색하시오?
--ALIAS : 오늘날짜, 이달마지막날짜, 이번달에남은날짜   

SELECT  SYSDATE 오늘날짜
       ,LAST_DAY(SYSDATE) 마지막날짜
       ,LAST_DAY(SYSDATE) - SYSDATE  남은날짜
FROM DUAL;

--P.200
-- 날짜 ROUND/TRUNC
-- FMT(FORMAT : 형식) : YEAR(연도), MONTH(월), DAY(요일), DD(일)...
SELECT ROUND(SYSDATE, 'MM') --- 이번달을 50%넘엇으므로 7월1일
      ,TRUNC(SYSDATE, 'MM') --- 이번달을 50%안넘엇으므로 버려서 6월1일
      FROM DUAL;
      
SELECT ROUND(SYSDATE, 'YEAR') --- 이번년을 50%안넘엇으므로 1월1일
      ,TRUNC(SYSDATE, 'YEAR') --- 이번년을 50%안넘엇으므로 버려서 1월1일
      FROM DUAL;
      
--P.200
--MONTHS_BETWEEN : 두 날짜 사이의 달수를 숫자로 리턴
SELECT MONTHS_BETWEEN
       (SYSDATE, '1995-09-03')
       FROM DUAL;
      
      
----P.200
--EXTRACT ★★★ : 날짜에서 필요한 부분만 추출
--(FMT : YEAR(년), MONTH(월), DAY(일), HOUR(시), MINUTE(분), SECOND(초)
SELECT EXTRACT(YEAR FROM SYSDATE) 년도
      ,EXTRACT(MONTH FROM SYSDATE) 월
      ,EXTRACT(DAY FROM SYSDATE) 일
      ,EXTRACT(HOUR FROM SYSTIMESTAMP)-3 시
      ,EXTRACT(MINUTE FROM SYSTIMESTAMP) 분
      ,EXTRACT(SECOND FROM SYSTIMESTAMP) 초
       FROM DUAL;
       
--연-월-일 시:분:초.밀리세컨드
SELECT TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH:MI:SS.FF3')
FROM DUAL;
--------------------
--생일이 3월인 회원을 검색하시오
--(ALIAS : 회원ID(MEM_ID), 
-- 회원명(MEM_NAME), 생일(MEM_BIR))

SELECT MEM_ID 회원ID
      ,MEM_NAME 회원이름
      ,MEM_BIR 생일
            
FROM MEMBER
WHERE EXTRACT(MONTH FROM MEM_BIR) =3

AND MEM_BIR LIKE '%/03/%'
AND SUBSTR(MEM_BIR, 4, 2) = '03';

--문제
--입고상품(BUYPROD) 중에 3월 에 입고된 내역을 검색하시오
--ALIAS : 상품코드(BUY_PROD), 입고일자(BUY_DATE)
--, 매입수량(BUY_QTY), 매입단가(BUY_COST)
--EXTRACT 사용하기, SUBSTR 사용하기, LIKE 사용하기

SELECT BUY_PROD 상품코드
      ,BUY_DATE 입고일자
      ,BUY_QTY 매입수량
      ,BUY_COST 매입단가
      ,BUY_PROD 입고상품
FROM BUYPROD  입고상품
WHERE EXTRACT(MONTH FROM BUY_DATE) =3
AND SUBSTR(BUY_DATE, 4, 2) ='03'
AND BUY_DATE LIKE '%/03/%';


--P.201 CAST
-- CAST : 명시적 형 변환
-- CHAR(30) : 고정길이문자형변환
-- VARCHAR2(30) : 가변길이문자형변환
SELECT '[' || 'Hello' || ']' "형변환"
      ,'[' || CAST('Hello' as char(30)) || ']' 고정길이문자형변환
      ,'[' || cast('Hello' as varchar2(30)) || ']' 가변길이문자형변환
      from dual;
      
---★★★
---TO_DATE() :  날짜형 문자를 날짜형으로 형변환
--CAST() : 날짜형 문자를 지정된 형으로 형변환
-- '2022/05/17' +1 : 날짜형 문자 + 숫자 시 --> 날짜형 문자가 숫자로 자동형변환.
 SELECT '2022/05/17'  -- 여기에 +1을 하게되면 문자형이기 때문에 오류가 생기므로 날자형으로 바꿔 줘야함
      ,TO_DATE('2022/05/17') +1
      ,CAST('2022/05/17' AS DATE) +1
      FROM DUAL;


---P.201 
--- TO_CHAR() : 숫자/문자/날짜를 지정한 형식의 문자열로 변환
--- 오늘 날짜를 이러한 형식의 문자열로 반환

SELECT TO_CHAR(SYSDATE, 'AD YYYY, CC"세기" ')
FROM DUAL;

---오류 발생
SELECT TO_CHAR('2008-12-25','YYYY.MM.DD HH24:MI:SS')
FROM DUAL;

--TO_DATE ★★★★ : 2008-12-25 는 연-월-일 형식인 날짜형 문자라고 라클이에게 알려줌
SELECT TO_CHAR(TO_DATE('2008-12-25','YYYY.MM.DD'),'YYYY.MM.DD HH24:MI:SS')
FROM DUAL;

SELECT TO_CHAR(CAST('2008-12-25'AS DATE),'YYYY.MM.DD HH24:MI:SS')
FROM DUAL;

---P.202
--P.202
--상품테이블에서 상품입고일을 '2008-09-28 12:00:00' 
--형식으로 나오게 검색하시오.
--(Alias 상품명(PROD_NAME), 상품판매가(PROD_SALE)
--, 입고일(PROD_INSDATE))
-- '2008-09-28 12:00:00' 날짜형식의 문자
SELECT PROD_NAME  상품명
      ,PROD_SALE 상품판매가
      ,PROD_INSDATE 입고일
      ,TO_CHAR(PROD_INSDATE, 'YYYY-MM-DD HH:MI:SS') 상품입고일 --날짜형이기 때문에 TO_ DATE가 필요없음
FROM PROD;

--쉬운문제
--회원 테이블을 사용하여 다음처럼 출력해보자
--ALIAS : 회원ID(MEM_ID), 회원명(MEM_NAME), 회원생일(MEM_BIR)
--회원생일은 '1985-03-02 12:00:00' 형식으로 출력
--YY : 2자리연도 , MON : 1월, HH24 : 24시간형식, AM: 오전/오후

--쉬운 문제
SELECT MEM_ID  회원ID
      ,MEM_NAME 회원명
      ,MEM_BIR 회원생일
     ,TO_CHAR(MEM_BIR, 'YYYY-MM-DD HH:MI:SS') 변경후생일
     FROM MEMBER;



--어려운문제
--장바구니 테이블을 사용하여 다음처럼 출력해보자
--ALIAS : 장바구니번호, 구매일시
--구매일시는 '2005-04-03 12:00:00' 형식으로 출력
SELECT CART_NO 장바구니번호
     , TO_CHAR(TO_DATE(SUBSTR(CART_NO,1,8), 'YYYYMMDD'), 'YYYY-MM-DD HH:MI:SS') 구매일시
FROM   CART;

----06.21---
--P.020
-- TO_CHAR() 함수 중 숫자를 문자로 형변환
SELECT 1234.6 +0.4 FROM DUAL;

SELECT TO_CHAR(1234.6,'L9,999.00')
FROM DUAL;

SELECT TO_CHAR(-1234.6, 'L9999.00PR')
      ,TO_CHAR(-1234.6, 'L9999.00MI')
      FROM DUAL;
--문제
--상품 판매가를 다음과 같은 형식으로 출력하시오
--￦230,000
--ALIAS : 상품ID(PROD_ID), 상품명(PROD_NAME)
--, 판매가(PROD_SALE)

SELECT PROD_ID 상품ID
       ,PROD_NAME 상품명
       ,TO_CHAR(PROD_SALE, 'L99,999,999') 판매가

FROM PROD;

--P.203
--상품테이블에서 상품코드, 상품명, 매입가격, 
-- 소비자가격, 판매가격을 출력하시오. 
-- (단, 가격은 천단위 구분 및 원화표시)

SELECT  PROD_ID  상품코드
       ,PROD_NAME 상품명
       ,TO_CHAR(PROD_COST, 'L9,999,999') 매입가
       ,TO_CHAR(PROD_SALE, 'L9,999,999') 판매가
       ,TO_CHAR(PROD_PRICE, 'L9,999,999') 소비자가격
FROM PROD;

--문제
--매입테이블(BUYPROD)의 매입가의 평균
--AVG(PROD_COST)을 다음 형식으로 출력
--소수점 2번째 자리까지 살리고 살리고~ 반올림처리
--￦210,000.350
--원표시 : ㄹ + 한자키
    
SELECT TO_CHAR(ROUND(AVG(BUY_COST),2), 
       'L999,999.000')    매입가평균
FROM BUYPROD; 

---P.203
--TO_NUMBER : 숫자형식의 문자열 -> 숫자로 변환
--숫자형 문자 + 숫자 -> 숫자로 자동형변환 + 숫자 ->숫자의 결과
SELECT '3.1415' + '1' FROM DUAL;


--숫자형 문자 (O)->숫자형변환
SELECT TO_NUMBER('3.1515')  FROM DUAL;

--문자 (O)->숫자형변환(X)
--SELECT TO_NUMBER('￦1,200')+ 1  FROM DUAL; --오류
SELECT TO_NUMBER('￦1,200','L999,999')+ 1  FROM DUAL; --오류해결
SELECT TO_CHAR('1200','L999,999') FROM DUAL;

--문자 (O)->숫자형변환(X)
SELECT TO_NUMBER('개똥이') + 1 FROM DUAL; -- 오류

--P.203
--회원테이블(MEMBER)에서 이쁜이회원(MEM_NAME='이쁜이')의
--회원Id 2~4 문자열을 숫자형으로 치환한 후 
--10을 더하여 새로운 회원ID로 조합하시오 ?
--(Alias는 회원ID(MEM_ID), 조합회원ID)

SELECT MEM_ID   회원ID
      ,SUBSTR(MEM_ID,1,1)
      || TRIM(TO_CHAR(TO_NUMBER(SUBSTR(MEM_ID,2)) + 10, '000'))
FROM MEMBER
WHERE MEM_NAME='이쁜이';

--상품테이블(PROD)에서
--상품코드(PROD_ID)가 'P101000001'인 데이터를
--다음과같이 1 증가시켜보자. 
--P101000002
--ALIAS : 상품코드, 다음상품코드

SELECT PROD_ID 상품코드
,SUBSTR(PROD_ID,1,1)
      ||TO_CHAR(TO_NUMBER(SUBSTR(PROD_ID,2))+1) 다음상품코드
FROM PROD
WHERE PROD_ID = 'P101000001';

--선생님 풀이
SELECT PROD_ID 상품코드
      ,SUBSTR(PROD_ID,1,4)
      || TRIM(TO_CHAR(SUBSTR(PROD_ID,5)+1 , '000000')) 다음상품코드
FROM PROD;

--P.203
--TO_DATE : 날짜형식 문자열을 DATE 형으로 변환
SELECT '2009-03-05'+3 FROM DUAL; -- 문자형이기 때문에 오류남

SELECT TO_DATE('2009-03-05') + 3 FROM DUAL;

--라클아 이거 날짜형문자야
--2009는  YYYY이고, 03은 MM, 05는 DD야 라고 알려줌
SELECT TO_DATE('2009-03-05', 'YYYY-MM-DD') + 3 FROM DUAL;


---문날날(O)= 문(TO_CHAR) 날(대상) 날(형식) O
---문문날(X)  문(TO_CHAR) 문(대상) 날(형식) X
---문숫날(X)  문(TO_CHAR) 숫(대상) 날(형식) X
SELECT TO_CHAR('200803101234' , 'YYYY-MM-DD HH24:MI';) 
FROM DUAL;


------O
SELECT TO_DATE('2008-03-10') + 3 FROM DUAL;

------X
SELECT TO_DATE('200803101234') + 3 FROM DUAL;

--라클이한테 알려줌
SELECT TO_CHAR(TO_DATE('200803101234','YYYYMMDDHHMI')  +3
              ,'YYYY-MM-DD HH24:MI')
FROM DUAL;

---O
SELECT TO_CHAR(TO_DATE('200803101234', 'YYYY-MM-DD HH:MI')
              ,'YYYYMMDDHH24MI')
FROM DUAL;

--(O)
SELECT TO_DATE('20220621') FROM DUAL;
--(X)
SELECT TO_DATE('202206211619') FROM DUAL;
--(O)
SELECT TO_DATE('2022-06-21') FROM DUAL;
--(X)
SELECT TO_DATE('2022-06-21 16:19') FROM DUAL;
--(O)
SELECT TO_DATE('2022-06-21 16:19','YYYY-MM-DD HH24:MI') FROM DUAL;


--(O) : 날짜형문자이므로.(년.월.일 / 년/월/일 / 년-월-일)
SELECT TO_DATE('2021.12.25') FROM DUAL;
--(X) : 11:10 때문에 인식 안됨
SELECT TO_DATE('2021.12.25 11:10') FROM DUAL;
--(O) : 이럴 땐 라클이에게 알려줘야 함
SELECT TO_DATE('2021.12.25 11:10','YYYY.MM.DD HH:MI') FROM DUAL;
--(O) : 날짜형문자이므로.(년.월.일 / 년/월/일 / 년-월-일)
SELECT TO_DATE('2021/12/25') FROM DUAL;
--(X) : '2021/12/25'는 날짜형문자이므로
SELECT TO_CHAR('2021/12/25','YYYY/MM/DD') FROM DUAL;
--(O) : TO_DATE('2021/12/25')는 날짜형이므로
SELECT TO_CHAR(TO_DATE('2021/12/25'),'YYYY/MM/DD') FROM DUAL;
--SELECT TO_CHAR(동그라미, 'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(TO_DATE('2021.12.25 11:10','YYYY.MM.DD HH:MI'),'YYYY/MM/DD') FROM DUAL;

---P.203
--P.204
--회원테이블(MEMBER)에서 주민등록번호1(MEM_REGNO1)을
--날짜로 치환한 후 검색하시오
--(Alias는 회원명(MEM_NAME), 주민등록번호1, 
--치환날짜(MEM_REGNO1 활용)

SELECT  MEM_NAME 회원명
      ,MEM_REGNO1 주민등록번호1
      ,TO_DATE( MEM_REGNO1, 'YY-MM-DD') 치환날짜
FROM MEMBER;

--장바구니 테이블(CART)에서 장바구니번호(CART_NO)를
--날짜로 치환한 후 다음과 같이 출력하기
--2005년 3월 14일
--ALIAS : 장바구니번호, 상품코드, 판매일, 판매수


SELECT CART_PROD 상품코드
      ,CART_NO  장바구니번호 
      SUBSTR(CART_NO 1,8) ||
      TO_CHAR(TO_DATE(CART_NO, 'YYYYMMDD'), 'YYYY"년"MM"월"DD"일"')) 판매일

FROM CART;


SELECT CART_NO      장바구니번호
      ,CART_PROD        상품코드
      ,TO_CHAR(TO_DATE(SUBSTR(CART_NO, 1,8),'YYYYMMDD'), 'YYYY"년 "MOMDD"일"')     판매일
      ,CART_QTY  판매수
FROM CART;

---------선생님 풀이---------
SELECT CART_NO 장바구니번호
     , CART_PROD 상품코드
     , TO_CHAR(TO_DATE(SUBSTR(CART_NO,1,8),'YYYYMMDD'),'YYYY"년 "MONDD"일"') 판매일
     , CART_QTY 판매수
FROM   CART;

-----06.22 P.204-----

--환수(NULL)
--아무것도 없는 것을 뜻함
--SQL에서 NULL 값을 허용하지 않는 속성에 대해 NULL 값으로 수정하려 한다면 에러가 발생한다,
-- ' ' 이게바로 NULL 을 뜻함

--거래처 담당자 성씨가 '김'이면 NULL로 갱신
SELECT BUYER_NAME 거래처명
      ,BUYER_CHARGER 담당자
FROM BUYER
WHERE BUYER_CHARGER LIKE '김%';

---업데이트
UPDATE BUYER
SET BUYER_CHARGER = NULL
WHERE BUYER_CHARGER LIKE '김%';

--거래처 담당자 성씨가 '성'이면 White Space로 갱신
--White Space : '' = null

SELECT BUYER_NAME 거래처명
      ,BUYER_CHARGER 담당자
FROM BUYER
WHERE BUYER_CHARGER LIKE '성%';

UPDATE BUYER
SET BUYER_CHARGER = ''
WHERE BUYER_CHARGER LIKE '성%';

--담당자가 NULL인 데이터를 검색
SELECT BUYER_NAME 거래처명
      ,BUYER_CHARGER 담당자
FROM BUYER
WHERE BUYER_CHARGER IS NULL;

--담당자가NULL이 아닌 데이터를 검색
SELECT BUYER_NAME 거래처명
      ,BUYER_CHARGER 담당자
FROM BUYER
WHERE BUYER_CHARGER IS NOT NULL;

-- ★★★NVL을 이용 NULL일 경우 만 '없다'로 치환

SELECT BUYER_NAME 거래처명
      ,NVL(BUYER_CHARGER, '없다') 담당자
FROM BUYER;

--P.206
--전체회원 마일리지에 100을 더한수치를 검색
--ALIAS 성명, 마일리지, 변경마일리지

SELECT MEM_NAME 성명
      ,MEM_MILEAGE 마일리지
      ,MEM_MILEAGE +100  변경마일리지
FROM MEMBER;


--회원 성씨 'ㅂ'을 포함하면 마일리지를 NULL로 갱신

SELECT MEM_NAME   성명
      ,MEM_MILEAGE   마일리지
FROM MEMBER
WHERE MEM_NAME >= '바' AND MEM_NAME <= '빟';

UPDATE MEMBER
SET MEM_MILEAGE = NULL
WHERE MEM_NAME >= '바' AND MEM_NAME <= '빟';


--P.206

SELECT NULL + 10 덧셈
      , 10*NULL 곱섹
      , 10/NULL 나눗셈
      , NULL - 10 뺄샘
      FROM DUAL;
      
      
--회원 마일리지에 100을 더한 수치를 검색
--ALIAS : 성명 마일리지 변경마일리지

SELECT MEM_NAME  성명
       ,MEM_MILEAGE 마일리지
      ,NVL(MEM_MILEAGE, 0) + 100 변경마일리지
FROM MEMBER;

--회원 마일리지가 있으면 정상회원
--NULL 이면 '비정상회원' 으로 검색

SELECT MEM_NAME  성명
       ,MEM_MILEAGE 마일리지
      ,NVL2(MEM_MILEAGE, '정상회원', '비정상회원')  회원상태
FROM MEMBER;

--P. 207
SELECT NULLIF(123, 123) AS "같을 경우 NULL 반환"
      ,NULLIF(123, 1234) AS "다를 경우 앞인수 반환"
      ,NULLIF('A','B') AS " 다른경우 앞인수 반환"
      FROM DUAL;
      
      --코어ㄹ리즈 :   파라미터 중  NULL이 아닌 첫번 째 파라미터 반환
      SELECT COALESCE(NULL, NULL, 'Hello', null, 'world')
      from dual;
      
---------------------★★★★★DECODE★★★★★★---------
SELECT DECODE (6
              ,10, 'A'
              ,9, 'B'
              ,8, 'C'
              , 'D')
FROM DUAL;

SELECT PROD_LGU
      ,SUBSTR(PROD_LGU,1,2) 앞두자리
      ,DECODE(SUBSTR(PROD_LGU, 1,2)
      , 'P1', '컴퓨터/전자 제품'
      , 'P2', '의류'
      , 'P3', '잡화'
      , '기타' ) 결과
FROM PROD;

--P.208
--상품 분류(PROD_LGU) 중  앞의 두 글자가  'P1' 이면 
--판매가(PROD_SALE)를 10%인상하고
--'P2' 이면 판매가를 15%인상하고,  
--나머지는 동일 판매가로 
--검색하시오 ? 
--(DECODE 함수 사용, 
--Alias는 상품명(PROD_NAME), 판매가(PROD_SALE), 변경판매가 )

SELECT PROD_NAME 상품명
       ,PROD_LGU 상품분류
       ,PROD_SALE 판매가
      ,SUBSTR(PROD_LGU, 1,2) 
      ,DECODE(SUBSTR(PROD_LGU, 1,2) 
      , 'P1' , PROD_SALE *1.1   
      , 'P2' , PROD_SALE *1.15  
      , PROD_SALE)변경판매가
FROM PROD;

--대전측기사에서는 3월에 생일인(MEM_BIR) 회원을
--대상으로 마일리지를 10% 인상해주는 이벤트를
--시행하고자 한다. 생일이 3월이 아닌 회원은
--짝수인 경우만 5% 인상 처리한다.
--이를 위한 SQL을 작성하시오.
--ALIAS : 회원ID, 회원명, 마일리지, 변경마일리지

SELECT MEM_ID 회원ID
      ,MEM_NAME  회원명
      ,MEM_BIR 회원생일
      ,MEM_MILEAGE 마일리지
      ,DECODE(SUBSTR(MEM_BIR, 4,2) AND EXTRACT('03')
      , '03' , MEM_MILEAGE*1.1 
      , MEM_MILEAGE )   변경마일리지
      
      ,DECODE(SUBSTR(MEM_BIR, 4,2)
      ,MEM_MILEAGE*1.05)
      ,MEM_MILEAGE
      
FROM MEMBER;

---
SELECT MEM_ID 회원ID
      ,MEM_NAME  회원명
      ,MEM_MILEAGE 마일리지
      ,EXTRACT(MONTH FROM MEM_BIR) 회원생일
      ,DECODE(EXTRACT(MONTH FROM MEM_BIR)
      , 3 , MEM_MILEAGE*1.1
      ,DECODE(MOD(EXTRACT(MONTH FROM MEM_BIR),2)
      , 0 , MEM_MILEAGE *1.05
      , MEM_MILEAGE)
      )        변경마일리지
FROM MEMBER;     


---CASE 문
SELECT CASE WHEN '나' = '나' THEN '맞다'
    ELSE '아니다'
    END AS "RESULT"
    FROM DUAL;

----SIMPLE CASE EXPRESSION    
SELECT CASE '나' WHEN '철호' THEN '아니다'
                 WHEN '너'   THEN '아니다'
                 WHEN '나'   THEN '맞다'
                 ELSE '모르겠다'
        END RESULT
    FROM DUAL;


--SEARCHED CASE EXPRESSION    
SELECT CASE  WHEN '나' = '철호' THEN '아니다'
            WHEN '나' = '너' THEN '아니다'
            WHEN '나' = '나' THEN '맞다'
                 ELSE '모르겠다'
        END RESULT
    FROM DUAL;    

SELECT PROD_NAME 상품, PROD_LGU 분류,
    CASE WHEN PROD_LGU = 'P101' THEN '컴퓨터제품'
         WHEN PROD_LGU = 'P102' THEN '전자제품'
         WHEN PROD_LGU = 'P201' THEN '여성캐쥬얼'
         WHEN PROD_LGU = 'P202' THEN '남성캐쥬얼'
         WHEN PROD_LGU = 'P301' THEN '피혁잡화'
         WHEN PROD_LGU = 'P302' THEN '화장품'
         WHEN PROD_LGU = 'P401' THEN '음반/CD'
         WHEN PROD_LGU = 'P402' THEN '도서'
         WHEN PROD_LGU = 'P403' THEN '문구류'
        ELSE '미등록분류'
    END "상품분류"
FROM PROD;

--10만원 초과 상품 판매가 가격대
SELECT PROD_NAME AS "상품"
    ,PROD_PRICE AS "판매가"
    , CASE WHEN (100000 - PROD_PRICE) >=0  THEN '10만원 미만'
           WHEN (200000 - PROD_PRICE) >=0  THEN '10만원대'
           WHEN (300000 - PROD_PRICE) >=0  THEN '20만원대'
           WHEN (400000 - PROD_PRICE) >=0  THEN '30만원대'
           WHEN (500000 - PROD_PRICE) >=0  THEN '40만원대'
           WHEN (600000 - PROD_PRICE) >=0  THEN '50만원대'
           WHEN (700000 - PROD_PRICE) >=0  THEN '60만원대'
           WHEN (800000 - PROD_PRICE) >=0  THEN '70만원대'
           WHEN (900000 - PROD_PRICE) >=0  THEN '80만원대'
           WHEN (1000000 - PROD_PRICE) >=0  THEN '90만원대'
            ELSE '100만원 이상'
        END "가격대"
    FROM PROD
    WHERE PROD_PRICE > 100000;

-- 회원정보테이블의 주민등록 뒷자리(7자리 중 첫째자리)에서 성별을 구하시오?
-- (CASE 구문 사용, ALIAS 회원명,주민등록번호(주민1-주민2), 성별
--------------06.23-------------------
SELECT MEM_ID 회원ID 
      ,MEM_NAME 성명
      ,MEM_REGNO2 주민2
      ,MEM_REGNO2 성별
      , CASE SUBSTR(MEM_REGNO2,1,1) WHEN '1' THEN '남성'
                                WHEN '2' THEN '여성'
                                ELSE '기타'
      END 성별_SIMPLE
      , CASE WHEN SUBSTR(MEM_REGNO2,1,1) IN ('1' , '3') THEN '남성'
             WHEN SUBSTR(MEM_REGNO2,1,1) IN ('2' , '4') THEN '여성'
      END 성별_SEARCHED       
FROM MEMBER;
      
      
--트랜잭션(Transaction)
--데이터베이스를 변경하기 위해 수행되어야 함
--논리적 단위, 여러개의 SQL로 구성되어있음
--원자성 : ALL or Nothing. 전체 실행 또는 전체 실행 안됨. (ALL : 정상적인처리 , NOthing : 되돌아감)
-- 일관성 : 데이터베이스에 실행전 에 문제가 없다면 실행후 에도 문제가 없다.
-- 고립성 : 실행 중 타 트랜잭션에 영향으로 결과에 문제가 발생해서는 안됨.
-- 지속성 : 성공하면 결과는 지속됨.

CREATE TABLE TEST1(
    DEPTNO NUMBER ,
    DNAME VARCHAR2(30),
    LOC VARCHAR2(30),
    CONSTRAINT PK_TEST1 PRIMARY KEY(DEPTNO)
    );
INSERT INTO TEST1(DEPTNO, DNAME, LOC) VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO TEST1(DEPTNO, DNAME, LOC) VALUES(20,'RESEARCH','DALLAS');
INSERT INTO TEST1(DEPTNO, DNAME, LOC) VALUES(30,'SALES','CHICAGO');
INSERT INTO TEST1(DEPTNO, DNAME, LOC) VALUES(40,'OPERATIONS','BOSTON');
COMMIT;

SELECT*
FROM TEST1;

--오류 위치 검색--
SELECCT*FROM USER_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'PK_TEST1';

UPDATE TEST1
SET DEPTNO = 20;

UPDATE TEST1
SET LOC = 'SEOUL'
WHERE DNAME = 'SALES';

--등푸른생선
DELETE FROM TEST1
WHERE DNAME = 'OPERATIONS';

SELECT *FROM TEST1;

ROLLBACK;



--P.215
UPDATE TEST1
SET DEPTNO = 20;

COMMIT;

UPDATE TEST1
SET LOC = 'SEOUL';
WHRERE DNAME = 'SALES';

DELETE FROM TEST1
WHERE DNAME = 'OPERATIONS';

SELECT*FROM TEST1;

ROLLBACK;
SELECT * FROM TEST1;


--LPROD테이블 복제  -> LPROD2  테이블생성
--1. 스키마 : 컬럼, 자료형, 크기 N.N 제약사항
--2. 데이터
--3. 단 P.K, F.K는 복제가 안됨

CREATE TABLE LPROD2
AS
SELECT * FROM LPROD;

SELECT * FROM LPROD2;

--1)
UPDATE LPROD2
SET LPROD_ID = 7;

--2)
UPDATE LPROD2
SET LPROD_NM = '미샤'
WHERE LPROD_GU = 'P302';

--3)
DELETE FROM LPROD2
WHERE LPROD_GU = 'P403';

--4) LPROC 가 없ㅇ서 오류발생 그시 점에 3번까지가 자동으로 커밋이됨.
CREATE TABLE LPROD3
AS
SELECT * FROM LPROC;

ROLLBACK;
-----------------------
--1)
UPDATE LPROD2
SET LPROD_ID = 7;
COMMIT;
--2)
UPDATE LPROD2
SET LPROD_NM = '미샤'
WHERE LPROD_GU = 'P302';

--3)
DELETE FROM LPROD2
WHERE LPROD_GU = 'P403';


--P.218
--SAVEPOINT : 트랜잭션 중간저장
--COMMIT : 변경사항을 데이터베이스에 반영
--트랜잭션이 종료됨과 동시에
--새로운 트랜잭션이 시작됨.

INSERT INTO TEST1(DEPTNO, DNAME, LOC) VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO TEST1(DEPTNO, DNAME, LOC) VALUES(20,'RESEARCH','DALLAS');
INSERT INTO TEST1(DEPTNO, DNAME, LOC) VALUES(30,'SALES','CHICAGO');
INSERT INTO TEST1(DEPTNO, DNAME, LOC) VALUES(40,'OPERATIONS','BOSTON');
COMMIT;

UPDATE TEST1
SET DEPTNO = 20;
SAVEPOINT A1;  --A1

UPDATE TEST1
SET LOC = 'SEOUL'
WHERE DNAME = 'SALES';
SAVEPOINT A2;

DELETE FROM TEST1
WHERE DNAME = 'OPERATIONS';
SAVEPOINT A3;

SELECT*FROM TEST1;
ROLLBACK TO A2; -- O
ROLLBACK TO A3; -- X
ROLLBACK TO A1; -- O
ROLLBACK;


--P.222
--메타데이터 : 데이터(눈에보이는데이터)를 위한 데이터(컬럼, 자료형, 크기, 제약사항)
--데이터사전? 메타데이터 정보를 관리
--Dictionary 뷰에서 'ALL'로 시작하는 모든 테이블 조회
SELECT TABLE_NAME
      ,COMMENTS
FROM DICTIONARY
WHERE TABLE_NAME LIKE 'ALL_%';

SELECT *FROM ALL_CONSTRAINTS;
SELECT *FROM ALL_USERS;

--현재로그인한 사용자(계정)가 만든 모든 객체 정보를 출력
SELECT OBJECT_NAME
      ,OBJECT_TYPE
      ,CREATED
FROM ALL_OBJECTS
WHERE OWNER = 'PC11' --사용자 계정의 이름을 대문자로 해야됨
ORDER BY OBJECT_TYPE ASC;

--각 테이블(계정이 접근가능한 ...)의 전체 레코드 개수를 출력 (테이블명 ,레코드 수)
SELECT TABLE_NAME 테이블명
      ,NUM_ROWS "레코드 수"
FROM USER_TABLES;

--USER_CONSTRAINTS,
--USER_CONS_COLUMNS의 컬럼 상세를 확인하고
--상품 테이블의 제약조건을 출력하시오?
--(컬럼명, 제약명, 타입, 제약내용)
SELECT B.COLUMN_NAME 컬럼명
      ,A.CONSTRAINT_NAME 제약명
      ,A.CONSTRAINT_TYPE 타입
      ,A.SEARCH_CONDITION 제약내용
FROM USER_CONSTRAINTS A, USER_CONS_COLUMNS B
WHERE A.TABLE_NAME = B.TABLE_NAME
AND   A.TABLE_NAME = 'LPROD';

--테이블목록 쿼리
SELECT S1.TABLE_NAME AS 물리테이블명,
         COMMENTS AS 논리테이블명,
         TABLESPACE_NAME AS 테이블스페이스명,
         NUM_ROWS AS ROW수,     --- analize 를 해야 정확한 Row수를 얻는다.
         LAST_ANALYZED AS  최종분석일자,
         PARTITIONED AS 파티션여부
FROM USER_TABLES S1,
        USER_TAB_COMMENTS S2
WHERE S1.TABLE_NAME = S2.TABLE_NAME       
  AND S2.TABLE_TYPE  = 'TABLE'    -- VIEW (뷰, 테이블 따로 SELECT 
  AND TABLESPACE_NAME IS NOT NULL --PLAN TABLE 등을 빼기 위해
ORDER BY  S1.TABLE_NAME;

--테이블, 컬럼 목록 추출
SELECT A.TABLE_NAME AS TABLE_NAME,
   A.TAB_CMT AS 테이블설명,
         A.COLUMN_NAME AS 컬럼명,
         B.POS AS PK,
         A.COL_CMT AS 컬럼설명,
         A.DATA_TYPE AS 데이터유형,
         A.데이터길이,
         A.NULLABLE AS NULL여부,
         A.COLUMN_ID AS 컬럼순서,
         A.DATA_DEFAULT AS 기본값
FROM
(SELECT S1.TABLE_NAME,
   S3.COMMENTS AS TAB_CMT,
         S1.COLUMN_NAME,
         S2.COMMENTS AS COL_CMT,
         S1.DATA_TYPE,
         CASE WHEN S1.DATA_PRECISION IS NOT NULL THEN DATA_PRECISION||','||DATA_SCALE
         ELSE TO_CHAR(S1.DATA_LENGTH)
         END  AS 데이터길이,
         NULLABLE,
         COLUMN_ID,
         DATA_DEFAULT
FROM  USER_TAB_COLUMNS S1,
         USER_COL_COMMENTS S2,
         USER_TAB_COMMENTS S3
WHERE S1.TABLE_NAME = S2.TABLE_NAME
   AND S1.COLUMN_NAME = S2.COLUMN_NAME
   AND S2.TABLE_NAME = S3.TABLE_NAME ) A,        
(SELECT T1.TABLE_NAME, T2.COLUMN_NAME, 'PK'||POSITION AS POS
   FROM (SELECT TABLE_NAME, CONSTRAINT_NAME  
              FROM USER_CONSTRAINTS
                  WHERE  CONSTRAINT_TYPE = 'P' )T1,
                  (SELECT TABLE_NAME, CONSTRAINT_NAME,  COLUMN_NAME, POSITION
                 FROM USER_CONS_COLUMNS ) T2
          WHERE T1.TABLE_NAME = T2.TABLE_NAME
             AND T1.CONSTRAINT_NAME = T2.CONSTRAINT_NAME  ) B
WHERE A.TABLE_NAME = B.TABLE_NAME(+)
   AND A.COLUMN_NAME = B.COLUMN_NAME(+)    
ORDER BY A.TABLE_NAME,  A.COLUMN_ID;

--P.224
--회원 아이디가 조건절에 자주 사용되어 INDEX를 사용
--ROWID :행의 고유번호
SELECT ROWID
      ,MEM_ID
      ,MEM_NAME
      ,MEM_JOB
      ,MEM_BIR
FROM MEMBER
WHERE MEM_ID = 'a001';

--회원 생일이 조건절에 자주 사용되어
--INDEX를 생성 -> 검색속도 개선(B-TREE INDEX)
CREATE INDEX IDX_MEMBER_BIR
ON MEMBER(MEM_BIR);

SELECT ROWID
      ,MEM_ID
      ,MEM_NAME
      ,MEM_JOB
      ,MEM_BIR
FROM MEMBER
WHERE MEM_BIR LIKE '75%';

--회원생일에서 년도만 분리하여
--인덱스를 생성(function-based index)
    CREATE INDEX IDX_MEMBER_BIR_YEAR
    ON MEMBER(TO_CHAR(MEM_BIR, 'YYYY'));
    
SELECT MEM_ID
      ,MEM_NAME
      ,MEM_JOB
      ,MEM_BIR
FROM MEMBER
WHERE TO_CHAR(MEM_BIR, 'YYYY') = '1975';

--P.230
--IDX_MEMBER-BIR 인덱스 삭제하고,
DROP INDEX IDX_MEMBER_BIR;

--IDX_MEMBER_BIR_YEAR 인덱스는 REBUILD 하시오
ALTER INDEX IDX_MEMBER_BIR_YEAR REBUILD;

--P.230
-- INDEX KEY COLUMN에 변형을 막는 QUERY문 사용 권장
SELECT BUY_DATE
      ,BUY_PROD
      ,BUY_QTY
FROM BUYPROD
WHERE BUY_DATE - 10 = '2005-02-20';   --잘못된 구성

--재구성
SELECT BUY_DATE
      ,BUY_PROD
      ,BUY_QTY
FROM BUYPROD
WHERE BUY_DATE  = TO_DATE('2005-02-20')+10;


---06.24
--.243p
--상점테이브레서 상상장코드, 상품명 ,분류명 ㄹ: 을 조합함

0--조인
--1. 두 테이블 사이에 p.k, f.x관게를 찾아보자
--2. 관계가 있다면 FROM절에 뒤 테이블명을 적음
-- 자료형과 크기가 같음, 같은 데이터가 있음
--3. P.K데이터와 F.K데이터가 같은 경우에만
-- 결과에 포함
--4. 컬럼을 구성. FROM 절의 테이블에 ALIAS
select L.LPROD_GU
      ,L.LPROD_NM
      ,P.PROD_LGU
      ,P.PROD_ID
      ,P.PROD_NAME
FROM LPROD L,PROD P
WHERE L.LPROD_GU = P.PROD_LGU;

----ANSI표준
select L.LPROD_GU
      ,L.LPROD_NM
      ,P.PROD_LGU
      ,P.PROD_ID
      ,P.PROD_NAME
FROM LPROD L INNER JOIN PROD P
ON (L.LPROD_GU = P.PROD_LGU);

---- BUYER, LPROD 묶기
SELECT L.LPROD_GU
      ,L.LPROD_NM
      ,B.BUYER_ID
      ,B.BUYER_NAME
      ,B.BUYER_LGU
FROM LPROD L, BUYER B
WHERE L.LPROD_GU = B.BUYER_LGU;

--조인 조건이 없는 조인 ? 카티전 프로젝트
--조인조건이 있으면? EQUI JOIN,  동등조인, 내부조인

SELECT M.MEM_ID
      ,M.MEM_NAME
      ,C.CART_NO
      ,C.CART_PROD
      ,C.CART_MEMBER
      ,C.CART_QTY
FROM MEMBER M INNER JOIN CART C
ON (M.MEM_ID  = C.CART_MEMBER) ;

--
SELECT P.PROD_ID
      ,P.PROD_NAME
      ,B.BUY_DATE
      ,B.BUY_PROD
      ,B.BUY_QTY
      ,B.BUY_COST
FROM PROD P , BUYPROD B
WHERE B.BUY_PROD = P.PROD_ID; 

SELECT P.PROD_ID
      ,P.PROD_NAME
      ,C.CART_NO
      ,C.CART_PROD
      ,C.CART_MEMBER
      ,C.CART_QTY
FROM PROD P , CART C
WHERE P.PROD_ID = C.CART_PROD;

--3개의 테이블을 조인하는 법
SELECT C.CART_NO
      ,C.CART_PROD
      ,C.CART_QTY
      ,C.CART_MEMBER
      ,P.PROD_NAME
      ,M.MEM_NAME
FROM PROD P, CART C, MEMBER M
WHERE P.PROD_ID = C.CART_PROD
AND   C.CART_MEMBER = M.MEM_ID;

---ANSI 방법 3개이상일때
SELECT C.CART_NO
      ,C.CART_PROD
      ,C.CART_QTY
      ,C.CART_MEMBER
      ,P.PROD_NAME
      ,M.MEM_NAME
FROM PROD P INNER JOIN CART C ON (P.PROD_ID = C.CART_PROD)
            INNER JOIN MEMBER M ON (C.CART_MEMBER = M.MEM_ID);


--3개 테이블 2개조건
SELECT  B.BUYER_ID
      , B.BUYER_NAME
      , P.PROD_NAME
      , P.PROD_LGU
      , P.PROD_BUYER
      , L.LPROD_GU
      , L.LPROD_NM
FROM BUYER B, LPROD L, PROD P
WHERE L.LPROD_GU = P.PROD_LGU   --테이블 조건의 개수는 (테이블 - 1)
AND   B.BUYER_ID = P.PROD_BUYER;

--ANSI
SELECT  B.BUYER_ID
      , B.BUYER_NAME
      , P.PROD_NAME
      , P.PROD_LGU
      , P.PROD_BUYER
      , L.LPROD_GU
      , L.LPROD_NM
FROM  LPROD L INNER JOIN  PROD P ON (L.LPROD_GU = P.PROD_LGU)
      INNER JOIN BUYER B ON (B.BUYER_ID = P.PROD_BUYER);


--4개테이블
SELECT C.CART_NO
      ,C.CART_PROD
      ,C.CART_MEMBER
      ,C.CART_QTY
      ,P.PROD_NAME
      ,B.BUYER_NAME
      ,L.LPROD_NM
      
FROM   CART C, MEMBER M, PROD P, BUYER B, LPROD L
WHERE M.MEM_ID = C.CART_MEMBER
AND   P.PROD_ID = C.CART_PROD
AND   B.BUYER_ID = P.PROD_BUYER
AND   L.LPROD_GU = P.PROD_LGU;

--ANSI
SELECT C.CART_NO
      ,C.CART_PROD
      ,C.CART_MEMBER
      ,C.CART_QTY
      ,P.PROD_NAME
      ,B.BUYER_NAME
      ,L.LPROD_NM
      
FROM   CART C INNER JOIN  MEMBER M ON (M.MEM_ID = C.CART_MEMBER)
              INNER JOIN PROD P ON (P.PROD_ID = C.CART_PROD)
              INNER JOIN BUYER B ON (B.BUYER_ID = P.PROD_BUYER)
              INNER JOIN LPROD L ON (L.LPROD_GU = P.PROD_LGU);

--P.243
SELECT P.PROD_ID  상품코드
      ,P.PROD_NAME  상품명
      ,B.BUYER_NAME  거래처명
FROM  PROD P , BUYER B
WHERE P.PROD_BUYER = B.BUYER_ID
AND B.BUYER_NAME LIKE '삼성전자%';

---ANSI  조인조건 이외의 조건은 WHERE 로 바뀐다.
SELECT P.PROD_ID  상품코드
      ,P.PROD_NAME  상품명
      ,B.BUYER_NAME  거래처명
FROM  PROD P INNER JOIN BUYER B ON (P.PROD_BUYER = B.BUYER_ID)
WHERE B.BUYER_NAME LIKE '삼성전자%';

--P.244
--상품분류가 전자제품 P102인 상품의 상품코드, 상품명
--분류명 거래처명을 조회
--EQUI JOIN

SELECT L.LPROD_ID 상품코드
      ,P.PROD_NAME 상품명
      ,P.PROD_ID 
      ,B.BUYER_NAME
      
FROM PROD P, BUYER B, LPROD L
WHERE BUYER_ID = PROD_BUYER
AND   LPROD_GU = BUYER_LGU
AND   L.LPROD_NM = '전자제품'

--ANSI
SELECT L.LPROD_ID 상품코드
      ,P.PROD_NAME 상품명
      ,P.PROD_ID 
      ,B.BUYER_NAME
      
FROM PROD P INNER JOIN BUYER B ON (BUYER_ID = PROD_BUYER)
            INNER JOIN LPROD L ON (LPROD_GU = BUYER_LGU)
WHERE   L.LPROD_NM = '전자제품'


---------P.282
--AVG(컬럼)

---06.27----
--<학습목표> 집계함수 = 윈도우함수
--1.SUM : 합계
--2.ARG : 평균
--3.MAX : 최대
--4.MIN : 최소
--5.COUNT : 개수

---------P.282
--AVG(컬럼)

SELECT PROD_COST
FROM PROD
ORDER BY 1;

SELECT AVG(DISTINCT PROD_COST)  중복값제외
      ,AVG(ALL PROD_COST)   DEFALT모든값
      ,AVG(PROD_COST)  매입가평균
FROM PROD;


--상품테이블의 상품분류별 매입 가격 평균값
SELECT PROD_LGU  상품분류
      ,ROUND(AVG(NVL(PROD_COST,0)),2) 매입가격평균값
FROM PROD
GROUP BY PROD_LGU;  --묶는다.

--AVG(NULL '''')) !!


--상품테이블의 총 판매가격 평균 값을 구하시오
SELECT AVG(NVL(PROD_SALE,0)) 총판매가격평균값
FROM PROD;  



-- 상품테이블의 상담분류별 판매가격 평균 값을 구하시오.
SELECT PROD_LGU
      ,ROUND(AVG(NVL(PROD_SALE,0)),2) 상품분류별판매평균
      
FROM PROD
GROUP BY PROD_LGU;

--P.282 
--COUNT : 자료수

SELECT PROD_COST FROM PROD
ORDER BY PROD_COST ASC;

SELECT COUNT(DISTINCT PROD_COST)
      ,COUNT(ALL PROD_COST)
      ,COUNT(PROD_COST)
      ,COUNT(*)
      FROM PROD;

--P.283
--거래처테이블의 담당자(BUYER_CHARGER)를 컬럼으로하여 COUNT 집게
SELECT COUNT(DISTINCT BUYER_CHARGER) "자료수(DISTINCT)"
      ,COUNT(BUYER_CHARGER) 자료수
      ,COUNT(*)    "자료수(*)"
FROM BUYER;
    
-- 회원테이블의 취미 종류슈를 COUNT 하시오
SELECT COUNT(DISTINCT MEM_LIKE) 취미종류수
FROM MEMBER;

-- 회원의 취미별 COUNT 집게
SELECT MEM_LIKE 취미
      ,COUNT(MEM_ID) 자료수
      ,COUNT(*) "자료수(*)"
FROM MEMBER      
GROUP BY MEM_LIKE;



-- 회원테이블의 직업종류수를 카운트 하시오
SELECT COUNT(DISTINCT MEM_JOB) 직업종류수
FROM MEMBER;



-- 회원테이블의 직업별 CONUNT 집계
SELECT MEM_JOBB  직어명
      ,COUNT(MEM_ID) 인원수
FROM MEMBER
GROUP BY MEM_JOB;



--장바구니 테이블 회원 (CART_MEMBER) 별 구매횟수를 카운트 하시오{
SELECT CART_MEMBER 회원ID
      ,COUNT(DISTINCT CART_PROD) 구매회수중복제거
      ,COUNT(CART_PROD) 구매회수
      ,COUNT(*) "구매회수(*)"
 FROM CART
GROUP BY CART_MEMBER;


--MAX, MIN
SELECT MAX(DISTINCT PROD_COST)
      ,MAX(PROD_COST)
      ,MIN(DISTINCT PROD_COST)
      ,MIN(PROD_COST)
      FROM PROD;
      
-- 상품 중 최고판매가격과 최저판매가격
SELECT MAX(PROD_SALE) 최고판매가
      ,MIN(PROD_SALE) 최저판매가
      ,MIN(DISTINCT PROD_SALE)
      FROM PROD;
      
--상품 중 최고 매입가겨과 최저매입가격
SELECT PROD_BUYER 거래처
      ,MAX(PROD_COST) 최고매입가
      ,MIN(PROD_COST) 최저매입가
      FROM PROD
      GROUP BY PROD_BUYER;
      
--장바구니 테으블의 회원별 최대구매수량 검색하기
SELECT CART_MEMBER 회원ID
      ,MAX(DISTINCT CART_QTY) 최대수량
      ,MAX(CART_QTY) 최대수량
      ,MIN(DISTINCT CART_QTY) 최소수량
      ,MIN(CART_QTY) 최소수량
      FROM CART
      GROUP BY CART_MEMBER;
      
--상품 중 거래처 별 최고매입가격과 최저 매입가격
--상품 중 최고 매입가겨과 최저매입가격
--SELECT 절에서 집계함수 이외의 컬럼들은 GROUP BY 절에 기술한다. ★★★★★
SELECT PROD_BUYER 거래처
      ,MAX(PROD_COST) 최고매입가
      ,MIN(PROD_COST) 최저매입가
      FROM PROD
      GROUP BY PROD_BUYER
      ORDER BY PROD_BUYER;
      
 --장바구니 테이블의 회원별 최대구매수량 검색하기
SELECT CART_MEMBER 회원ID
      ,MAX(CART_QTY) 최대수량   
      ,MIN(CART_QTY) 최소수량
      FROM CART
      GROUP BY CART_MEMBER     
      ORDER BY CART_MEMBER;
--MAX , MIN 은 DISTINCT 는 의미가없다.
      
-- 오늘이  2005년 7월 11일이라 가정하고 장바구니 테이블에 발생될 추가 주문번호를 검색하시오.
SELECT MAX(CART_NO) 최고치주문번호
      ,MAX(CART_NO) +1 추가주문번호
FROM CART
WHERE CART_NO LIKE '20050711%';   --와일드문

---P.284 SUM
--상품테이블 PROD 의 매입가 PROD_COST의 총합게 값
SELECT SUM(DISTINCT PROD_COST)
      ,SUM(PROD_COST)
      FROM PROD;

--상품테이블 PROD 의 판매가 PROD_SALE의 총합게 값
SELECT SUM(PROD_SALE)
FROM PROD;

--상품테이블 PROD 상품분류 PROD_LGU 판매가 PROD_SLAE 의 값
SELECT PROD_LGU  상품분류
      ,SUM(PROD_SALE) 판매가
FROM PROD
GROUP BY PROD_LGU
ORDER BY PROD_LGU;

--상품입고테이블의 상품별 입고수량의 합게 값
SELECT BUY_PROD 상품
      ,SUM(BUY_QTY) 입고수랑합계
      FROM BUYPROD
      GROUP BY  BUY_PROD;
      
--장바구니 테이블의 상품분류별 판매수량의 합계 값
SELECT SUBSTR(CART_PROD,0,4)    상품분류
      ,SUM(CART_QTY)    판매수량합계
      FROM CART
      GROUP BY SUBSTR(CART_PROD,0,4);

-- 회원테이블의 회원전체의 마일리지 평균, 마일리지 합계, 최고마일리지, 최소 마일리지, 인원수를 검색하시오
 SELECT ROUND(AVG(NVL(MEM_MILEAGE,0)),2) 마일리지평균
      ,MIN(MEM_MILEAGE) 최소마일리지
      ,MAX(MEM_MILEAGE) 최고마일리지
      ,COUNT(*) 인원수
      ,SUM(MEM_MILEAGE) 마일리지합계
FROM MEMBER;

--상품테이블에서 판매가 전체의 평균, 합계, 최고값, 최저값, 자료수를 검색
SELECT ROUND(AVG(NVL(PROD_SALE,0)),2) 평균
      ,SUM(PROD_SALE) 합계
      ,MAX(PROD_SALE) 최고값
      ,MIN(PROD_SALE) 최저값
      ,COUNT(*)  자료수
      FROM PROD;
      
--상품테이블에서 거래처, 상품분류별로 최고판매가, 최소판매가, 자료수를 검색하시오
SELECT SUBSTR(PROD_ID,1,4) 상품분류
      ,PROD_BUYER 거래처
      ,MAX(PROD_SALE) 최고판매가
      ,MIN(PROD_SALE) 최소판매가
      ,COUNT(PROD_ID) 자료수
FROM PROD
GROUP BY SUBSTR(PROD_ID,1,4), PROD_BUYER
ORDER BY PROD_BUYER;

--장바구니 테이블에서 회원ID, 상품분류별로 구매수량평균, 구매수랑합계, 자료수 검색
SELECT CART_MEMBER  회원ID
      ,SUBSTR(CART_PROD,1,4) 상품분류
      ,ROUND(AVG(NVL(CART_QTY,0)),2) 구매수랑평균
      ,SUM(CART_QTY) 구매수랑합계
      ,COUNT(*) 자료수
FROM CART
GROUP BY CART_MEMBER, SUBSTR(CART_PROD,1,4)
ORDER BY CART_MEMBER, SUBSTR(CART_PROD,1,4);


------------------6.28일 진행 예정---------

--회원테이블에서 지역(주소1의 2자리), 생일년도 벼롤 마일리지 평균 , 마일리지 합게 최고마일리지 최소마일리지 자료수 검색
SELECT SUBSTR(MEM_ADD1,2) 지역주소
      ,EXTRACT(YEAR FROM MEM_BIR) 생일년도
      ,AVG(NVL(MEM_MILEAGE,0)) 마일리지평균
      ,SUM(MEM_MILEAGE) 마일리지합계
      ,MIN(MEM_MILEAGE) 최소마일리지
      ,MAX(MEM_MILEAGE) 최대마일리지
      ,COUNT(*)  자료수
      FROM MEMBER
      GROUP BY SUBSTR(MEM_ADD1,2),EXTRACT(YEAR FROM MEM_BIR)
      ORDER BY 1,2;
      
-------------------06.28--------------------
/*<학습목표>
1. 소group 검색 : 집계함수 이외의 컬럼들은 group by 절에 기술한다.
2. outer join + group by 콜라보
*/

--2005년 1월에 입고된 상품(BUY_PROD)의
--상품분류별 입고수량(BUY_QTY)의 합,
--입고단가(BUY_COST)의 합을 구한 후
--최종입고가격을 검색하시오.
--최종입고가격은 입고단가 X 입고수량이고,
--최종입고가격을 내림차순으로 정렬
--(ALIAS : 구입년월, 상품분류코드, 
--입고수량합계, 입고단가합계
--최종입고가격합계)

SELECT SUBSTR(BUY_DATE, 1, 5)  구입년월
        ,   SUBSTR(BUY_PROD,1 ,4)  상품분류코드
        ,   SUM(BUY_QTY) 입고수량합계
        ,   SUM(BUY_COST) 입고단가합계
        ,   SUM(BUY_COST * BUY_QTY) 최종입고가격합계
FROM BUYPROD
WHERE BUY_DATE LIKE '05/01%'
GROUP BY SUBSTR(BUY_DATE, 1, 5) ,  SUBSTR(BUY_PROD,1 ,4)
ORDER BY 5;

--P.285
--집계함수 문제1
--CART테이블을 활용하여
--2005년도 2분기(4월~6월)의
--김은대(a001), 이쁜이(b001), 육평회(q001)회원 별
--상품분류 별(P101, P102 ...)
--상품구매개수의 합계를 구하기.
--상품구매개수로 역순정렬하기
--alias : 회원ID, 년월, 상품분류, 구매개수

SELECT CART_MEMBER 회원
      ,SUBSTR(CART_NO, 1,6)   날짜
      ,SUBSTR(CART_PROD,1,4) 상품분류
      ,CART_QTY  상품구매개수
FROM CART
WHERE SUBSTR(CART_NO, 1,6) BETWEEN '200504' AND '200506'
AND SUBSTR(CART_NO, 1,6) IN ('200504' , '200505','200506')
AND CART_MEMBER IN ('a001','b001','q001')
GROUP BY CART_MEMBER, SUBSTR(CART_NO, 1,6)
       , SUBSTR(CART_PROD,1,4)
ORDER BY  SUM(CART_QTY) DESC;


--교수님풀이
SELECT CART_MEMBER 회원ID
     , SUBSTR(CART_NO,1,6) 년월
     , SUBSTR(CART_PROD,1,4) 상품분류
     , SUM(CART_QTY) 구매개수
FROM   CART
WHERE  SUBSTR(CART_NO,1,6) BETWEEN '200504' AND '200506'
AND    SUBSTR(CART_NO,1,6) IN ('200504','200505','200506')
AND    CART_MEMBER IN('a001','b001','q001')
GROUP BY CART_MEMBER, SUBSTR(CART_NO,1,6)
     , SUBSTR(CART_PROD,1,4)
ORDER BY SUM(CART_QTY) DESC;


--집계함수 문제2
--SELECT * FROM MEMBER;
--회원테이블(MEMBER)을 활용하여
--지역 별, 취미 별 인원수를 출력하기
--단, 주민등록번호 상의 연도(MEM_REGNO1)와 
--생일 상의 연도(MEM_BIR)가 다른 경우 
--잘못된 데이터로 여겨 결과에서 제외함
--인원수로 역순정렬하기.
--ALIAS : 지역, 취미, 인원수

SELECT SUBSTR(MEM_ADD1,1,2)     지역
      ,MEM_LIKE     취미
      ,MEM_REGNO1   주민번호1
      ,MEM_BIR      생일
FROM MEMBER
WHERE MEM_REGNO1 IN  (MEM_BIR)
GROUP BY SUBSTR(MEM_ADD1,1,2) , MEM_LIKE
ORDER BY COUNT(*)2;

--선생님풀이
SELECT SUBSTR(MEM_ADD1,1,2)  지역
      ,MEM_LIKE 취미
      ,COUNT(*)  인원수
FROM MEMBER
WHERE SUBSTR(MEM_BIR,1,2) = SUBSTR(MEM_REGNO1,1,2)  
GROUP BY SUBSTR(MEM_ADD1,1,2), MEM_LIKE
ORDER BY COUNT(*) DESC;

--상품입고테이블(BUYPROD)의 2005년도 1월의 
--거래처별(거래처코드(BUYER_ID), 거래처명(BUYER_NAME)) 
--매입금액을 검색 하시오 ? 
--( 매입금액 = 매입수량(BUY_QTY) * 매입단가(PROD_COST) )
--( Alias는 거래처코드, 거래처명, 매입금액 )

SELECT 
       BUYER_ID 거래처코드
      ,BUYER_NAME 거래처명
      ,SUM(BUY_QTY*BUY_COST) 매입금액
FROM B.BUYER, P.PROD, B.BUYPROD
WHERE B.BUYER_ID = P.PROD_BUYER
AND   P.PROD_ID = B.BUY_PROD
AND   BP.BUY_DATE LIKE '05/01%'
GROUP BY B.BUYER_ID,B.BUYER_NAME
ORDER BY B.BUYER_ID,B.BUYER_NAME;

--SG_SCORES
--학생별 과목별 점수의 합계를 구해보자
--ALIAS : 학생 아이디, 과목아이디, 점수합계
SELECT  A.STUDENT_ID 학생아이디
      ,B.NAME 학생명
      ,A.COURSE_ID 과목아이디
      ,SUM(SCORE) 점수합계
FROM SG_SCORES A, STUDENT B
WHERE A.STUDENT_ID = B.STUDENT_ID
GROUP BY STUDENT_ID, B.NAME, A.COURSE_ID
ORDER BY 1,2;


----학생정보
SELECT *FROM STUDENT;

--학과별 학생의 인원수는 몇명일까
--ALIAS : 학과 코드, 학생수 + 과사무실전화번호, 학과명

SELECT D.DEPT_ID 학과코드
      ,D.DEPT_NAME 학과명
      ,D.DEPT_TEL 전화번호
      ,COUNT(*) 학생수
FROM STUDENT S, DEPARTMENT D
WHERE S.DEPT_ID = D.DEPT_ID
GROUP BY D.DEPT_ID, D.DEPT_NAME, D.DEPT_TEL;
----------------------------------------------------------------------
--SG_SCORES 테이블을 활용하여
--학생별 과목별 점수의 합계를 구해보자
--ALIAS : 학생아이디, 과목아이디, 점수합계
SELECT * FROM SG_SCORES;

SELECT A.STUDENT_ID  학생아이디
     , B.NAME         학생명
     , A.COURSE_ID   과목아이디
     , SUM(A.SCORE)  점수합계 
FROM SG_SCORES A, STUDENT B
WHERE A.STUDENT_ID = B.STUDENT_ID
GROUP BY A.STUDENT_ID, B.NAME, A.COURSE_ID
ORDER BY 1,2;
--학생정보
SELECT * FROM STUDENT;
--학과별 학생의 인원수는 몇명인가
--ALIAS : 학과코드, 학과명, 학과전화번호, 학생수
SELECT S.DEPT_ID 학과코드
     , D.DEPT_NAME 학과명
     , D.DEPT_TEL 학과전화번호
     , COUNT(*) 학생수
FROM STUDENT S, DEPARTMENT D
WHERE S.DEPT_ID = D.DEPT_ID
GROUP BY S.DEPT_ID , D.DEPT_NAME, D.DEPT_TEL
ORDER BY 2 DESC;
--교수
SELECT * FROM PROFESSOR;
--강의
SELECT * FROM COURSE;

--교수 별 강의 수 및 수강비의 평균을 구해보자
--ALIAS : 교수아이디, 교수명, 메일주소

SELECT P.PROFESSOR_ID  교수아이디
      ,P.NAME  교수명
      ,P.EMAIL  이메일주소
      ,AVG(COURSE_FEES)  수강비
      ,C.COURSE_ID  교과코드번호
FROM PROFESSOR P, COURSE C
WHERE P.PROFESSOR_ID = C.COURSE_ID
GROUP BY P.NAME, P.PROFESSOR_ID;

------교수님 풀이
SELECT P.PROFESSOR_ID 교수아이디
      ,P.NAME 교수명
      ,P.EMAIL 메일주소
      ,COUNT(*) 강의수
      ,AVG(NVL(C.COURSE_FEES,0)) 수강비의평균
FROM PROFESSOR P, COURSE C
WHERE P.PROFESSOR_ID = C.PROFESSOR_ID
GROUP BY P.PROFESSOR_ID
        ,P.NAME, P.EMAIL
ORDER BY 5 DESC;

---SG_SCORES(학생별 시험성적)
---2017년도 과목별 성적의 평균을 구해보자
--ALIAS : 연도, 과목코드, 과목명!, 성적평균

/*SELECT*
FROM SG_SCORES;
*/

SELECT SUBSTR(S.SCORE_ASSIGNED,1,2)  연도
      ,AVG(NVL(S.SCORE,0)) 성적평균
      ,C.TITLE 과목명
      ,C.COURSE_ID 과목코드
      
FROM SG_SCORES S, COURSE C
WHERE C.COURSE_ID = S.COURSE_ID
AND SUBSTR(S.SCORE_ASSIGNED,1,2) LIKE 17
GROUP BY SUBSTR(S.SCORE_ASSIGNED,1,2), C.TITLE, C.COURSE_ID;

--OUTTHER

--R 테이블 S테이블을 통해 OUTHER JOIN 연습
--1. S테이블을 생성후 기본키는 C, 컬럼 C,D,E

CREATE TABLE S(
    C VARCHAR2(10),
    D VARCHAR2(10),
    E VARCHAR2(10),
    CONSTRAINT PK_S PRIMARY KEY(C)
    );
    
--2. R테이블 생성 후 기본키는 A, 컬럼 : A,B,C
CREATE TABLE R(
 A VARCHAR2(10),
 B VARCHAR2(10),
 C VARCHAR2(10),
 CONSTRAINT PK_R PRIMARY KEY(A)
 );


--3. R테이블에 a1, b1, c1과 a2,b2,c2 데이터 입력
INSERT INTO R(A,B,C) VALUES ('a1','b1','c1');
INSERT INTO R(A,B,C) VALUES ('a2','b2','c2');
commit;

--EQUI JOIN, SIMPLE JOIN, 등가조인, 동등조인
--LEFT OUTER JOIN
SELECT*
FROM R, S
WHERE R.C = S.C(+);

--ANSI 표준(INNER JOIN)
SELECT R.A, R.B, R.C
      ,S.C, S.D, S.E
FROM R INNER JOIN S ON (S.C = R.C);

--ANSI 표준(OUTER JOIN)
SELECT R.A, R.B, R.C
      ,S.C, S.D, S.E
FROM R LEFT OUTER JOIN S ON (R.C = S.C);

--RIGHT OUTER JOIN
SELECT*
FROM R, S
WHERE R.C(+) = S.C;

--ANSI 표준(RIGHT OUTER JOIN)
SELECT R.A, R.B, R.C
      ,S.C, S.D, S.E
FROM R RIGHT OUTER JOIN S ON (R.C = S.C);

--FULL OUTHER JOIN
SELECT*
FROM R, S
WHERE R.C(+) = S.C
UNION
SELECT*
FROM R, S
WHERE R.C = S.C(+);

--ANSI FULL OUTER JOIN
SELECT R.A, R.B, R.C
      ,S.C, S.D, S.E
FROM R FULL OUTER JOIN S ON (R.C = S.C);

--outher join 연습문제
--depart테이블 student테이블을 통해 otTHER JOIN 연습
--컬럼 크기는 학생이 결정
--1. DEPART테이블 생성 후 기본키는 DEP_CDDE
-- 컬럼 : DEP_CODE, DEP_NAME

CREATE TABLE DEPART( DEP_CODE VARCHAR2(20)
                    ,DEP_NAME VARCHAR2(60)
,CONSTRAINT PK_DEPART PRIMARY KEY(DEP_CODE)
);

-- STUDENT 테이블 생성후 기본키는 STUD_NO,
-- 외래키는 STUD_DEP(DEPART 테이블의 DEP_CODE 컬럼 참조)
-- 컬럼 : STUD_NO, STUD_NAME, STUD_DEP

CREATE TABLE STUDENT(
         STUD_DEP  VARCHAR2(10)
        ,STUD_NO   VARCHAR2(50)
        ,STUD_NAME VARCHAR2(90)       
        ,CONSTRAINT PK_STUDENT PRIMARY KEY(STUD_NO)
        ,CONSTRAINT FK_STUDENT FOREIGN KEY (STUD_DEP) REFERENCES DEPART(DEP_CODE)
        );

--DROP TABLE STUDENT; 이미 STUDENT 테이블이 잇을경우 지우고 다시해야됨

--------------------------
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('401','7월반');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('402','6월반');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('403','4월반');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('404','10월반');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('405','12월반');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('406','3월반');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('307','11월반');


NSERT INTO STUDENT(STUD_NO,STUD_NAME,STUD_DEP) 
VALUES('2022060001','허지현','406');
INSERT INTO STUDENT(STUD_NO,STUD_NAME,STUD_DEP) 
VALUES('2022060002','이준혁','406');
INSERT INTO STUDENT(STUD_NO,STUD_NAME,STUD_DEP) 
VALUES('2022060003','김강산','405');
INSERT INTO STUDENT(STUD_NO,STUD_NAME,STUD_DEP) 
VALUES('2022060004','윤다영','401');
INSERT INTO STUDENT(STUD_NO,STUD_NAME,STUD_DEP) 
VALUES('2022060005','성민정','402');

--5. DEPART TABLE STUDENT 테이블을 MQUAL JOIN
--ALIAS 반코드 반명 학번 학생명
--EQUT JOIN
--ANSI INNER JOIN

SELECT * 
        
FROM DEPART D, STUDENT S
WHERE D.DEP_CODE = S.STUD_DEP;

SELECT D.DEP_CODE 반코드
      ,D.DEP_NAME 반명
      ,S.STUD_NO 학번
      ,S.STUD_NAME 학생명
FROM DEPART D INNER JOIN STUDENT S ON (D.DEP_CODE = S.STUD_DEP);

-- 6. DEPART 테이블과 STUDENT 테이블을 왼쪽 외부조인, (+)
--오라클
SELECT D.DEP_CODE 반코드
      ,D.DEP_NAME 반명
      ,S.STUD_NO 학번
      ,S.STUD_NAME 학생명 
       
FROM DEPART D, STUDENT S
WHERE D.DEP_CODE = S.STUD_DEP(+);

--- ANSI LEFT OUTER JOIN
SELECT D.DEP_CODE 반코드
      ,D.DEP_NAME 반명
      ,S.STUD_NO 학번
      ,S.STUD_NAME 학생명
FROM DEPART D LEFT OUTER JOIN STUDENT S ON (D.DEP_CODE = S.STUD_DEP);


-- 7. DEPART테이블과 STUDENT 테이블 오른쪽 외부조인
--(+)RIGHT OUTER JOIN
SELECT D.DEP_CODE 반코드
      ,D.DEP_NAME 반명
      ,S.STUD_NO 학번
      ,S.STUD_NAME 학생명 
       
FROM DEPART D, STUDENT S
WHERE D.DEP_CODE(+) = S.STUD_DEP;

--ANSI RIGHT OUTER JOIN

SELECT D.DEP_CODE 반코드
      ,D.DEP_NAME 반명
      ,S.STUD_NO 학번
      ,S.STUD_NAME 학생명 
       
FROM DEPART D RIGHT OUTER JOIN STUDENT S ON (D.DEP_CODE(+) = S.STUD_DEP);

--8. DEPART 테이블 STUDENT 테이블
--완전 외부조인 , 반코드 반명 학번 학생명
--UNION
--ANSI FULL OUTER JOIN
SELECT D.DEP_CODE 반코드
      ,D.DEP_NAME 반명
      ,S.STUD_NO 학번
      ,S.STUD_NAME 학생명 
       
FROM DEPART D, STUDENT S
WHERE D.DEP_CODE(+) = S.STUD_DEP;
UNION
SELECT D.DEP_CODE 반코드
      ,D.DEP_NAME 반명
      ,S.STUD_NO 학번
      ,S.STUD_NAME 학생명 
       
FROM DEPART D, STUDENT S
WHERE D.DEP_CODE = S.STUD_DEP(+);

--AUSI FULL OUTER JOIN
SELECT D.DEP_CODE 반코드
      ,D.DEP_NAME 반명
      ,S.STUD_NO 학번
      ,S.STUD_NAME 학생명 
       
FROM DEPART D FULL OUTER JOIN STUDENT S ON (D.DEP_CODE = S.STUD_DEP);

--OUTER JOIN 문제
--1. 대학정보테이블(COLLEAGE)
--대학코드
--대학명

CREATE TABLE COLLEAGE(
 COL_CODE VARCHAR2(10), 
 COL_NAME VARCHAR2(30),
);

--2. 학과정보테이블(HAKGWA)
--학과코드
--학과명
--대학코드



CREATE TABLE HAKGWA(
    HAK_CODE VARCHAR2(10),
    HAK_NAME VARCHAR2(100),
    COL_CODE VARCHAR2(10),
    

    
--3. 대학정보테이블의 대학코드를 기본키로 설정

ALTER TABLE COLLEAGE
ADD( CONSTRAINT PK_COLLEAGE PRIMARY KEY(COL_CODE));


--4. 학과정보테이블의 학과코드를 기본키로 설정    
 --  학과정보테이블의 대학코드가 대학정보테이블의 대학코드를 참조하는
 --  외래키로 설정
 
ALTER TABLE HAKGWA
ADD(CONSTRAINT PK_HAKGWA PRIMARY KEY(HAK_CODE),
    CONSTRAINT FK_HAKGWA FOREIGN KEY(COL_CODE) REFERENCES COLLEAGE(COL_CODE)
    );   
   
--5. 대학정보테이블에 다음 데이터를 INSERT 하기
--W01 솔아시아매니지먼트
--W02 외식조리
--W03 철도물류
--W04 디지털미디어
--W05 보건복지

INSERT INTO COLLEAGE(COL_CODE, COL_NAME) VALUES('W01','솔아시아매니지먼트');
INSERT INTO COLLEAGE(COL_CODE, COL_NAME) VALUES('W02','외식조리');
INSERT INTO COLLEAGE(COL_CODE, COL_NAME) VALUES('W03','철도물류');
INSERT INTO COLLEAGE(COL_CODE, COL_NAME) VALUES('W04','디지털미디어');
INSERT INTO COLLEAGE(COL_CODE, COL_NAME) VALUES('W05','보건복지');

--6. 학과정보테이블에 다음 데이터를 INSERT 하기
--H001 외식조리학과 W02
--H002 호텔관광경영학과 W02
--H003 철도경영학과 W03
--H004 간호학과 W05

INSERT INTO HAKGWA(HAK_CODE, HAK_NAME, COL_CODE) VALUES('H001','외식조리학과','W02');
INSERT INTO HAKGWA(HAK_CODE, HAK_NAME, COL_CODE) VALUES('H002','호텔관광경영학과','W02');
INSERT INTO HAKGWA(HAK_CODE, HAK_NAME, COL_CODE) VALUES('H003','철도경영학과','W02');
INSERT INTO HAKGWA(HAK_CODE, HAK_NAME, COL_CODE) VALUES('H004','간호학과','W05');
COMMIT;

--7. 대학정보테이블과 학과정보테이블을 내부조인하여 SELECT
SELECT H.HAK_CODE  학과코드
      ,H.HAK_NAME  학과명 
      ,C.COL_CODE  대학코드
      ,C.COL_NAME  대학명
FROM COLLEAGE C INNER JOIN HAKGWA H ON (C.COL_NAME =H.COL_CODE);


8. 대학정보테이블의 모든 데이터를 출력하도록 
  학과정보테이블과 외부조인 SELECT
  
SELECT H.HAK_CODE  학과코드
      ,H.HAK_NAME  학과명 
      ,C.COL_CODE  대학코드
      ,C.COL_NAME  대학명
FROM COLLEAGE C FULL OUTER JOIN HAKGWA H ON (H.COL_CODE = C.COL_NAME);

--------------06.30---------------
--p.246
--전체 상품의 2005년 1월 입고수량을 검색조회
--ALIAS 상품코드, 상품명, 입고수량
-ANSI 표준
-EQUI JOIN
SELECT  BP.BUY_PROD   상품코드
      ,P.PROD_NAME     상품명
      ,SUM(BP.BUY_QTY)    입고수량
FROM PROD P LEFT OUTHER JOIN BUYPROD BP
ON (P.PROD_ID = BP.BUY_PROD AND BP.BUY_DATE LIKE '05/01%')
GROUP BY BP.BUY_PROD, P.PROD_NAME;

SELECT PROD_ID, PROD_NAME FROM PROD;


--P.247
--전체 회원(MEMBER)의 2005년도 4월의 구매현황 조회
--ALIAS : 회원ID, 성명, 구매수량의합(CART_QTY)

SELECT   M.MEM_ID 회원ID
        ,M.MEM_NAME 성명
        ,NVL(SUM(C.CART_QTY),0) 구매수량
FROM MEMBER M , CART C
WHERE M.MEM_ID = C.CART_MEMBER(+)
AND C.CART_NO(+) LIKE = '200504%'
GROUP BY  M.MEM_ID, M.MEM_NAME
ORDER BY  M.MEM_ID, M.MEM_NAME;

SELECT MEM_ID, MEM_NAME FROM MEMBER;

--ANSI 표준 (OUTER JOIN)
SELECT M.MEM_ID 회원ID
      ,M.MEM_NAME 이름
      ,NVL(SUM(C.CART_QTY),0) 구매수량의합
FROM MEMBER M LEFT OUTER JOIN CART C
ON(M.MEM_ID = C.CART_MEMBER AND C.CART_NO LIKE '200504%')
GROUP BY M.MEM_ID, M.MEM_NAME
ORDER BY M.MEM_ID, M.MEM_NAME;




--P.248
-- 전체 상품의 2005년도 5월 5일의 입고.출고현황 조회
--(상품코드, 상품명, 입고수량의합, 판매수량의합 )
SELECT P.PROD_ID 상품코드
     , P.PROD_NAME 상품명
     , NVL(SUM(BP.BUY_QTY),0) 입고수량의합
     , NVL(SUM(C.CART_QTY),0) 판매수량의합
FROM   PROD P, BUYPROD BP, CART C
WHERE  P.PROD_ID = BP.BUY_PROD(+)
AND    P.PROD_ID = C.CART_PROD(+)
AND    BP.BUY_DATE(+) = '05/05/05'
AND    C.CART_NO(+) LIKE '20050505%'
GROUP BY P.PROD_ID, P.PROD_NAME
ORDER BY P.PROD_ID, P.PROD_NAME;
--ANSI표준
SELECT P.PROD_ID 상품코드
     , P.PROD_NAME 상품명
     , NVL(SUM(BP.BUY_QTY),0) 입고수량의합
     , NVL(SUM(C.CART_QTY),0) 판매수량의합
FROM   PROD P LEFT OUTER JOIN BUYPROD BP 
                    ON(BP.BUY_PROD = P.PROD_ID AND BP.BUY_DATE = '05/05/05')
              LEFT OUTER JOIN CART C     
                    ON(C.CART_PROD = P.PROD_ID AND C.CART_NO LIKE '20050505%')
GROUP BY P.PROD_ID, P.PROD_NAME
ORDER BY P.PROD_ID, P.PROD_NAME;



---------P.249
--SELF JOIN : TABLE ALIAS를 사용하여 마치 2개의 TABLE 처럼 자신의 TABLE과 자신의 TABLE를 JOIN 하여 검색
--이해를 도와주는 동요 : 내동생


--회원 ID ' h001라준호 인 고객의 마일리 점수보다
-- 이상인 회원만 검색
-- 회원id 성명 마이릴지

SELECT 꿀돼지.MEM_ID 회원ID
      ,꿀돼지.MEM_NAME 성명
      ,꿀돼지.MEM_MILEAGE 마일리지
      FROM  MEMBER 꿀돼지, MEMBER 뚱꺼비
      WHERE 뚱꺼비.MEM_ID ='h001'
      AND 꿀돼지.MEM_MILEAGE >= 뚱꺼비.MEM_MILEAGE;

--------------      
SELECT B.MEM_ID   회원ID
      , B.MEM_NAME  회원이름
      , B.MEM_MILEAGE 회원마일리지
FROM MEMBER A, MEMBER B
WHERE A.MEM_ID = 'h001'
AND A.MEM_MILEAGE <= B.MEM_MILEAGE;


--P.249
--거래처 코드가 'P30203(참존)' 과 동일지역에 속한 거래처만
-- 검색 조회( 거래처코드, 거래처 , 주소)

SELECT A.BUYER_ID     거래처코드
      ,A.BUYER_NAME    거래처
      ,SUBSTR(A.BUYER_ADD1,1,2)    주소
      , B.BUYER_ID
      , B.BUYER_NAME
      
      
FROM BUYER A, BUYER B
WHERE B.BUYER_ID = 'P30203'
AND SUBSTR(A.BUYER_ADD1,1,2)
  = SUBSTR(B.BUYER_ADD1,1,2);

--SELF JOIN 연습문제
--라준호 회원의 직업과 동일한 직업을 가진
--회원의 리스트를 출력해보세요
--(회원ID, 회원명, 직업)


SELECT MEM_ID     회원ID
      ,MEM_NAME   회원명
      ,MEM_JOB    직업      
FROM MEMBER
WHERE MEM_ID = 'h001'
AND SUBSTR(MEM_ID,1,3);

--------------------------------
SELECT A.MEM_ID     회원ID
      ,A.MEM_NAME   회원명
      ,A.MEM_JOB    직업      
FROM MEMBER A, MEMBER B
WHERE B.MEM_NAME = '라준호'
AND A.MEM_JOB = B.MEM_JOB;

-------------------------------------------------------------------------
--문제
--f001회원이 2005년 4월 10일에 8개 주문한
--상품을 동일하게 구입한 회원의 정보를 구하시오
--(ALIAS : 회원ID(CART_MEMBER), 카트번호(CART_NO),
--상품ID(CART_PROD), 구입개수(CART_QTY)


SELECT A.CART_NO
      ,A.CART_PROD
      ,A.CART_MEMBER
      ,A.CART_QTY
FROM CART A, CART B
WHERE B.CART_MEMBER = 'f001'
AND B.CART_NO LIKE '20050410%'
AND B.CART_QTY = 8
AND A.CART_PROD = B.CART_PROD;


--문제
--w001 회원과 같은 취미(MEM_LIKE)를 가진
--회원정보를 검색하시오
--ALIAS : 회원ID(MEM_ID), 회원명(MEM_NAME), 취미(MEM_LIKE)

SELECT A.MEM_ID  회원ID
      ,A.MEM_NAME  회원명
      ,A.MEM_LIKE 취미
FROM MEMBER A, MEMBER B
WHERE  B.MEM_ID = 'w001'
AND B.MEM_LIKE = A.MEM_LIKE;

--P.
--HAVING : 
--집계가 끝나고 난 뒤 결과 집계함수에 조건걸 때
--GROUP BY 절 뒤에 씀
--SELECT절에 쓰인 구문이라면 HAVING절에 조건으로 사용 가능!

-- 2005년도 월별 매입 현황을 검색하시오 ?
--(Alias는 매입월, 매입수량, 매입금액(매입수량*매입테이블의 매입가))
--단, 매입금액이 20,000,000 이상인 데이터만 출력해보자

SELECT EXTRACT(MONTH FROM BUY_DATE)  매입월
      ,SUM(BUY_QTY)  매입수량
      ,SUM(BUY_COST*BUY_QTY)  매입금액
FROM BUYPROD
WHERE EXTRACT (YEAR FROM BUY_DATE) = 2005
GROUP BY EXTRACT(MONTH FROM BUY_DATE)
HAVING SUM(BUY_COST*BUY_QTY) >= 20000000;

--2005년도 판매된 상품 중에 5회 이상의 판매회수가 있는 
--상품 조회    ( 상품코드, 상품명, 판매횟수 )

SELECT C.CART_PROD 상품코드
      ,P.PROD_NAME 상품명
      ,SUM(C.CART_QTY)  판매횟수
FROM PROD P, CART C
WHERE P.PROD_ID = C.CART_PROD
AND C.CART_NO LIKE '2005%'
GROUP BY C.CART_PROD, P.PROD_NAME
HAVING SUM(C.CART_QTY) >= 5;

--상품분류가  컴퓨터제품('P101')인 상품의 2005년도 일자별
--판매 조회( 판매일, 판매금액(5,000,000초과의 경우만), 판매수량 )

SELECT SUM(P.PROD_SALE*C.CART_QTY) 판매가
      ,SUBSTR(C.CART_NO,1,8)  판매일
      ,SUM(C.CART_QTY) 판매수량
      
FROM PROD P, CART C
WHERE P.PROD_ID = C.CART_PROD  
AND P.PROD_LGU LIKE 'P101'
AND C.CART_NO LIKE '2005%'
GROUP BY SUBSTR(C.CART_NO,1,8)
HAVING SUM(P.PROD_SALE*C.CART_QTY) > 5000000;

SELECT*
FROM PROD

SELECT*
FROM CART

----07.01
-- 2005년도 판매일자(CART_NO를 조작), 
-- 판매총액(CART_QTY * PROD_SALE),
-- 판매수량(CART_QTY), 판매회수(COUNT(CART_NO))
-- 를 조회하시오.
-- 단, 판매회수가 8개 이상인 경우
--     판매총액이 5,000,000초과의 경우
--     판매수량이 50초과의 경우
--ALIAS : 판매일, 판매금액, 판매수량, 판매회수

SELECT SUBSTR(C.CART_NO,1,8) 판매일
      ,SUM(C.CART_QTY * PROD_SALE) 판매금액
      ,SUM(C.CART_QTY) 판매수량
      ,COUNT(C.CART_NO) 판매회수
FROM PROD P, CART C      
WHERE P.PROD_ID = C.CART_PROD
AND C.CART_NO LIKE '2005%'
GROUP BY SUBSTR(C.CART_NO,1,8)
HAVING COUNT(C.CART_NO)>=8
AND SUM(C.CART_QTY * PROD_SALE) >5000000
AND SUM(C.CART_QTY)>50
;

--실전!!---
-- 2005년도  회원(MEMBER) 직업 별 
--판매금액(판매가(PROD_SALE) * 판매개수(CART_QTY))을 조회하시오
-- ALIAS : 직업, 연도, 지역, 판매금액
-- 단, 지역은 대전으로 한정.
-- 판매금액은 20,000,000 이상인 데이터로 한정

SELECT   SUM((PROD_SALE)*(CART_QTY)) 판매급액
        , EXTRACT(YEAR FROM M.MEM_BIR) 연도
        ,SUBSTR(M.MEM_ADD1,1,2) 지역
        ,M.MEM_JOB 직업
FROM PROD P, CART C, MEMBER M
WHERE P.PROD_ID = C.CART_PROD
AND C.CART_MEMBER = M.MEM_ID
AND SUBSTR(M.MEM_ADD1,1,2)= '대전'
AND C.CART_NO LIKE '2005%'
GROUP BY EXTRACT(YEAR FROM M.MEM_BIR), SUBSTR(M.MEM_ADD1,1,2) , M.MEM_JOB  
HAVING SUM((PROD_SALE)*(CART_QTY)) >= 20000000  ;      
        
--P.254
--상품코드 상품명 거래처 코드 거래처 명
-- 단 서브쿼리 이용
--SCALAR서브쿼리

SELECT P.PROD_ID   상품코드
      ,P.PROD_NAME   상품명
      ,P.PROD_BUYER  거래처코드
      ,(SELECT BUYER_NAME FROM BUYER WHERE BUYER_ID = P.PROD_BUYER)   거래처     
FROM PROD P;

-- 회원ID(CART_MEMBER), 회원명,
--- 주문번호(CART_NO)
-- 상품코드(CART_PROD), 수량(CART_QTY)
---단 서브쿼리 사용

SELECT CART_MEMBER
      ,CART_NO
      ,CART_PROD
      ,CART_QTY
FROM CART;

---MEM_ID --> MEM_NAME 
        ---종속---
-- 회원명은 아이디에 종속되어 있다.


SELECT MEM_NAME FROM MEMBER
WHERE MEM_ID= 'a001';


SELECT CART_MEMEBER 회원ID
      ,(SELECT MEM_NAME FROM MEMBER WHERE MEM_ID = CART_MEMBER) 회원명
      ,CART_NO 주문번호
      ,CART_PROD 상품코드
      ,CART_QTY 수량
      FORM CART;

--SCALAR 서브쿼리1
-- 입고일자(BUY_DATE), 상품코드(BUY_PROD)
--,상품명, 매입수량(BUY_QTY), 매입단가(BUY_COST)
-- 단, 서브쿼리 이용

SELECT BUY_DATE 입고일자
      ,(SELECT PROD_NAME FROM PROD WHERE PROD_ID = BUY_PROD) 상품명
      ,BUY_PROD 상품코드
      ,BUY_QTY 매입수량
      ,BUY_COST 매입단가
      FROM BUYPROD;
      
--SCALAR 서브쿼리2
-- 거래처코드(BUYER_ID), 거래처명(BUYER_NAME)
--,상품분류코드(BUYER_LGU), 상품분류명
-- 단, 서브쿼리 이용
      
SELECT BUYER_ID 거래처코드
      ,BUYER_NAME 거래처명
      ,BUYER_LGU  상품분류코드
      ,(SELECT LPROD_NM FROM LPROD WHERE LPROD_GU = BUYER_LGU)  상품분류명
FROM BUYER;

--SCALAR 서브쿼리3(BUYPROD)
-- 입고일자, 상품코드, 상품명
-- 매입수량, 매입단가
-- 단, 서브쿼리 이용

SELECT BUY_DATE 입고일자
      ,BUY_PROD 상품코드
      ,BUY_QTY 매입수량
      ,BUY_COST 매입단가
      ,(SELECT PROD_NAME FROM PROD WHERE PROD_ID = BUY_PROD) 상품명
FROM BUYPROD;

--NESTED 서브쿼리1
--NESTED 서브쿼리 : WHERE  절에 사용된 서브쿼리
--상품분류가 컴퓨터 제품인 상품의 리스트를 출력하기
--ALIAS : 상품코드, 상품명, 상품분류코드

SELECT PROD_ID 상품코드
      ,PROD_NAME  상품명
      ,PROD_LGU 상품분류코드
FROM  PROD
WHERE PROD_LGU = (SELECT LPROD_GU FROM LPROD WHERE LPROD_NM = '컴퓨터제품');
      
--NESTED 서브쿼리2
--NESTED 서브쿼리 : WHERE절에 사용된 서브쿼리
--상품분류가 컴퓨터제품인 거래처 리스트를 출력하기
--ALIAS : 거래처코드, 거래처명, 상품분류코드
--단일행 / 단일컬럼 서브쿼리

SELECT BUYER_ID   거래처코드
      ,BUYER_NAME   거래처명
      ,BUYER_LGU     상품분류코드
FROM BUYER      
WHERE BUYER_LGU = (SELECT LPROD_GU FROM LPROD WHERE LPROD_NM = '컴퓨터제품');

--NESTED 서브쿼리3
--NESTED 서브쿼리 : WHERE절에 사용된 서브쿼리
--상품분류가 전자제품인 상품매입 현황 리스트를 출력하기
--ALIAS : 입고일자, 상품코드, 매입수량, 매입단가
--힌트 : 상품코드에 상품분류코드가 있음.

SELECT BUY_DATE 입고일자
      ,BUY_PROD 상품코드
      ,BUY_QTY 매입수량
      ,BUY_COST 매입단가
FROM BUYPROD
WHERE SUBSTR(BUY_PROD,1,4) = (SELECT LPROD_GU FROM LPROD WHERE LPROD_NM = '전자제품');

--NESTED 서브쿼리5
--NESTED 서브쿼리 : WHERE절에 사용된 서브쿼리
--장바구니테이블에서 정은실 회원의 구매 현황을 출력
--ALIAS : 주문번호, 상품코드, 회원ID, 수량


SELECT CART_MEMBER 회원ID
      ,CART_PROD 상품코드
      ,CART_QTY 수량
      ,CART_NO  주문번호

FROM CART
WHERE SUBSTR(CART_MEMBER,1,4) = (SELECT MEM_ID FROM MEMBER WHERE MEM_NAME = '정은실'); 

--[피리어스] 업체로부터 들여온 상품의 리스트를 출력
--상품ID, 상품명, 업체코드
--서브쿼리를 사용하기.

SELECT PROD_ID 상품ID
      ,PROD_NAME 상품명
      ,PROD_BUYER  업체코드
      ,(SELECT BUYER_NAME FROM BUYER WHERE BUYER_ID = PROD_BUYER) 업체명
FROM PROD
WHERE SUBSTR(PROD_BUYER,1,6) = (SELECT BUYER_ID FROM BUYER WHERE BUYER_NAME = '피리어스');

---P.255
--상품TABLE 에서 판매가가 상품평균판매가보다 큰 상품을 검색하시오
-- 상품명, 판매가 ,평퓬판매가

SELECT P.PROD_NAME   상품명
      ,P.PROD_SALE   판매가
      ,A.AVG_SALE 평균판매가
FROM PROD P, (SELECT AVG(PROD_SALE) AVG_SALE FROM PROD) A  -- INLINE VIEW(FROM절에 쓰인 서브쿼리)
WHERE P.PROD_SALE > A.AVG_SALE;

--P.255
--회원테이블에서 마일리지가 평균마일리지보다 큰 회원으 ㄹ검색
-- 회원명, 마일리지 평균마일리지

SELECT M.MEM_NAME 회원명
      ,M.MEM_MILEAGE 마일리지
      ,A.AVG_MILEAGE 평균마일리지
      FROM MEMBER M, (SELECT AVG(MEM_MILEAGE) AVG_MILEAGE FROM MEMBER) A
      WHERE M.MEM_MILEAGE > A.AVG_MILEAGE;


--문제) 
--장바구니Table에서 판매수가 평균판매수 보다 큰 데이터를 
--검색하시오 ?  
--(Alias는 회원ID, 장바구니번호, 상품코드, 판매수, 평균판매수)

SELECT C.CART_NO  장바구니번호
      ,C.CART_PROD 상품코드
      ,C.CART_MEMBER  회원ID
      ,C.CART_QTY    판매수
      ,A.AVG_QTY 평균판매수
FROM CART C, (SELECT AVG(CART_QTY) AVG_QTY FROM CART) A
WHERE  A.AVG_QTY < C.CART_QTY;

--문제) 
--회원Table에서 나이가 평균나이 보다 많은 회원을 
--검색하시오 ?  
--(Alias는 회원ID, 성명, 주민번호앞자리, 나이, 평균나이)


SELECT MEM_ID 회원ID
      ,M.MEM_NAME 성명
      ,M.MEM_REGNO1 주민번호앞자리
      ,EXTRACT(YEAR FROM SYSDATE)- EXTRACT(YEAR FROM M.MEM_BIR)  나이
      ,ROUND(A.AVG_BIR,2) 평균나이
      
FROM MEMBER M, (SELECT AVG(EXTRACT(YEAR FROM SYSDATE)- EXTRACT(YEAR FROM MEM_BIR)) AVG_BIR FROM MEMBER) A
WHERE ROUND(A.AVG_BIR,2) < EXTRACT(YEAR FROM SYSDATE)- EXTRACT(YEAR FROM MEM_BIR);


--P.256
--모든 거래처의 2005년도 거래처별 매입금액 합계
--ALIAS 거래처 코드 거래처명 매입금액 합계

SELECT B.BUYER_ID  거래처코드
      ,B.BUYER_NAME  거래처명
      ,SUM(BP.BUY_COST*BP.BUY_QTY)  매입금액의합계
FROM BUYER B
    ,PROD P
    ,BUYPROD BP
WHERE B.BUYER_ID = P.PROD_BUYER(+)
AND P.PROD_ID = BP.BUY_PROD(+)
AND EXTRACT(YEAR FROM BP.BUY_DATE(+)) = 2005
GROUP BY B.BUYER_ID, B.BUYER_NAME;


--ANSI 표준
--LEFT OUTER JOIN
SELECT B.BUYER_ID 거래처코드
     , B.BUYER_NAME 거래처명
     , NVL(SUM(BP.BUY_COST * BP.BUY_QTY),0) 매입금액합계
FROM   BUYER B LEFT OUTER JOIN PROD P     ON(B.BUYER_ID = P.PROD_BUYER)
               LEFT OUTER JOIN BUYPROD BP
                    ON(P.PROD_ID = BP.BUY_PROD AND EXTRACT(YEAR FROM BP.BUY_DATE)=2005)
GROUP BY B.BUYER_ID, B.BUYER_NAME
ORDER BY B.BUYER_ID, B.BUYER_NAME;

-------------------------------------------------------
SELECT T.BUYER_ID, T.BUYER_NAME, NVL(U.SUM_QTY,0) SUM_QTY
FROM
(
SELECT BUYER_ID 
     , BUYER_NAME 
     
 FROM BUYER
 ) T,
(     
SELECT B.BUYER_ID
      ,B.BUYER_NAME
      ,SUM(BP.BUY_COST * BP.BUY_QTY) SUM_QTY 
FROM   BUYER B , PROD P, BUYPROD BP
WHERE B.BUYER_ID = P.PROD_BUYER
AND P.PROD_ID = BP.BUY_PROD
AND EXTRACT(YEAR FROM BP.BUY_DATE)=2005
GROUP BY B.BUYER_ID, B.BUYER_NAME
) U
WHERE T.BUYER_ID = U.BUYER_ID(+);

--P.256
--모든 거래처의 2005년도 거래처별 매출금액(PROD_SALE*CART_QTY) 합계
--ALIAS 거래처 코드 거래처명 매출금액(PROD_SALE*CART_QTY) 합계

SELECT T.BUYER_ID, T.BUYER_NAME, U.SUM_QTY
FROM 
(                  
SELECT BUYER_ID 
     , BUYER_NAME 
     
 FROM BUYER
 ) T,
(     
SELECT BUYER_ID
      ,BUYER_NAME
      ,SUM(PROD_SALE*CART_QTY) SUM_QTY
      FROM BUYER, CART, PROD 
      WHERE BUYER_ID=PROD_BUYER AND PROD_ID=CART_PROD AND SUBSTR(CART_NO,0,4) = '2005'
      GROUP BY BUYER_ID, BUYER_NAME
      ORDER BY BUYER_ID
) U
WHERE T.BUYER_ID = U.BUYER_ID(+);

--------------------
--P.255
SELECT T.BUYER_ID, T.BUYER_NAME
     , U.IN_QTY, V.OUT_QTY
FROM
(SELECT BUYER_ID
     , BUYER_NAME
FROM   BUYER) T,
(SELECT B.BUYER_ID 
         , B.BUYER_NAME 
         , SUM(BP.BUY_COST * BP.BUY_QTY) IN_QTY
    FROM   BUYER B, PROD P, BUYPROD BP
    WHERE  B.BUYER_ID = P.PROD_BUYER
    AND    P.PROD_ID = BP.BUY_PROD
    AND    EXTRACT(YEAR FROM BP.BUY_DATE)=2005
    GROUP BY B.BUYER_ID, B.BUYER_NAME) U,
(SELECT B.BUYER_ID
     , B.BUYER_NAME
     , SUM(P.PROD_SALE * C.CART_QTY) OUT_QTY
FROM   BUYER B, PROD P, CART C
WHERE  B.BUYER_ID = P.PROD_BUYER
AND    P.PROD_ID = C.CART_PROD
AND    C.CART_NO LIKE '2005%'
GROUP BY B.BUYER_ID, B.BUYER_NAME) V
WHERE T.BUYER_ID = U.BUYER_ID(+)
AND   T.BUYER_ID = V.BUYER_ID(+)
ORDER BY T.BUYER_ID;


--★★★★★★★★★★★★★★★★★★★★ 
--장바구니TABLE 에서 회원별 최고의 구매수량을 가진 자료의 회원,
-- 주문번호, 상품, 수량에 대해 모두 검색하시오
--ALIAS 회원 주문번호 상품 수량
--상관관게 서브쿼리 (CORRELATED SUBQUERY) : MAIN의 특정 컬럼이 SUB 조건을 사용되고 , 
--SUB 결과과 다시 MAIN  조건으로 사용됨

SELECT A.CART_MEMBER 회원
      ,A.CART_NO 주문번호
      ,A.CART_PROD 상품
      ,A.CART_QTY 수량
FROM CART A
WHERE A.CART_QTY = (
    SELECT MAX(B.CART_QTY)
    FROM CART B
    WHERE B.CART_MEMBER = A.CART_MEMBER --★★★★★★★★
    )
;

--입고테이블(BUYPROD)에서  "상품별" , 최고매입수량을 가진 자료의
-- 입고일자, 상품코드, 매입수량, 매입단가를 검색하기

SELECT A.BUY_DATE  입고일자
      ,A.BUY_PROD  상품코드
      ,A.BUY_QTY  매입수량
      ,A.BUY_COST  매입단가
FROM BUYPROD A
WHERE A.BUY_QTY =( 
SELECT MAX(B.BUY_QTY)
FROM BUYPROD B
WHERE B.BUY_PROD = A.BUY_PROD     ----★★★★★★
);
      
--상관관계서브쿼리 예제3)
-- 장바구니Table에서 일자별 최고의 구매수량을 가진 자료의 회원, 
--주문번호, 상품, 수량에 대해 모두 검색하시오 ?
--(Alias는 회원, 일자, 상품, 수량)

SELECT SUBSTR(A.CART_NO,1,8)    일자
      ,A.CART_PROD  상품
      ,A.CART_MEMBER  회원ID
      ,A.CART_QTY    수량
   FROM CART A
   WHERE A.CART_QTY =(
   SELECT MAX(B.CART_QTY)
   FROM CART B
   WHERE SUBSTR(A.CART_NO,1,8) = SUBSTR(B.CART_NO,1,8)   --★★★★★★★
   );

--P.260   
--단일행 서브쿼리, 단일컬럼 서브쿼리에 사용가능
-- =, !=, <> , <=, >= 연산자 사용
SELECT LPROD_NM
FROM LPROD
WHERE LPROD_GU = 'P101';

-- 다중컬럼 서브쿼리에 사용가능
--IN , ANY, ALL, EXISTS 연산자 사용
SELECT LPROD_NM
FROM LPROD
WHERE LPROD_GU LIKE 'P1%';

--P.260
--직업이 '공무원'인 사람들의 마일리지를 검색하여
--최소한 그들 중 어느 한사람보다는 마일리지가 큰 사람들을 출력하시오
--단, 직업이 '공무원'인 사람은 제외하고 검색하시오?
--ALIAS 회원명, 직업, 마일리지
-- 직업이 '공무원' 인 사람들의 마일리지?
--ANY : OR (또는)



SELECT A.MEM_NAME
      ,A.MEM_JOB
      ,A.MEM_MILEAGE
FROM MEMBER A

WHERE A.MEM_MILEAGE > ANY(
SELECT B.MEM_MILEAGE
FROM MEMBER B
WHERE B.MEM_JOB = '공무원'
);

---
---ALL : AND
SELECT A.MEM_NAME
      ,A.MEM_JOB
      ,A.MEM_MILEAGE
FROM MEMBER A

WHERE A.MEM_MILEAGE > ALL(
SELECT B.MEM_MILEAGE
FROM MEMBER B
WHERE B.MEM_JOB = '공무원'
);

--문제
--a001 회원의 구입수량을 검색하여
--최소한 a001 회원 보다는 구입수량이(AND의 개념)
--큰 주문내역을 출력하시오.
--단, a001 회원은 제외하고 검색하시오.
--(ALIAS는 주문번호, 상품코드, 회원명!!!, 구입수량)

SELECT A.CART_NO 주문번호
     , A.CART_PROD 상품코드
     , (SELECT C.MEM_NAME FROM MEMBER C WHERE C.MEM_ID = A.CART_MEMBER) 회원명  --서브쿼리
     , M.MEM_NAME 회원명2
     , A.CART_QTY 구입수량
FROM   CART A, MEMBER M
WHERE  A.CART_MEMBER = M.MEM_ID   --조인
AND    A.CART_MEMBER <> 'a001'
AND    A.CART_QTY > ALL(
        SELECT DISTINCT B.CART_QTY FROM CART B WHERE B.CART_MEMBER = 'a001'
    );


--P.261
SELECT MEM_NAME
      ,MEM_JOB
      ,MEM_MILEAGE
FROM MEMBER
WHERE MEM_MILEAGE > 4000

UNION
--합집합, 중복1회, 자동정렬


---B집합
SELECT MEM_NAME
      ,MEM_JOB
      ,MEM_MILEAGE
FROM MEMBER
WHERE MEM_JOB = '자영업';


--------------
--P.261
SELECT MEM_NAME
      ,MEM_JOB
      ,MEM_MILEAGE
FROM MEMBER
WHERE MEM_MILEAGE > 4000

UNION ALL
--합집합, 중복모두, 자동정렬X


---B집합
SELECT MEM_NAME
      ,MEM_JOB
      ,MEM_MILEAGE
FROM MEMBER
WHERE MEM_JOB = '자영업';

---------------

SELECT MEM_NAME
      ,MEM_JOB
      ,MEM_MILEAGE
FROM MEMBER
WHERE MEM_MILEAGE > 4000

INTERSECT
--교집합, 자동정렬X


---B집합
SELECT MEM_NAME
      ,MEM_JOB
      ,MEM_MILEAGE
FROM MEMBER
WHERE MEM_JOB = '자영업';


----------------
SELECT MEM_NAME
      ,MEM_JOB
      ,MEM_MILEAGE
FROM MEMBER
WHERE MEM_MILEAGE > 4000

MINUS
--차집합, 자동정렬X


---B집합
SELECT MEM_NAME
      ,MEM_JOB
      ,MEM_MILEAGE
FROM MEMBER
WHERE MEM_JOB = '자영업';

-----------07.05------
--P.264
--- SET (집합)을 사용할수 있는지?
---1. 컬럼의 수가 동일해야함
---2. 대응되는 자료형이 동일하다
--- ★★★★★★★★   EXISTS 심경 : A 집합과 B 집합 사이에 AND EXISTS를 존재시키고 
               --★★★★★★★★★  B집합에 속세의 연결고리를 작성해주면 교집합이 된다.
               
               
---A 2005년도 4월 판매상품
SELECT DISTINCT A.CART_PROD 판매상품
      ,P.PROD_NAME  상품명
      ,P.PROD_SALE
     
FROM CART A, PROD P
WHERE A.CART_PROD = P.PROD_ID
AND SUBSTR(A.CART_NO,1,8) BETWEEN '20050401' AND '20050430'
AND EXISTS(
--B 2005년도 6월 판매상품
SELECT DISTINCT C.CART_PROD 판매상품
      ,P.PROD_NAME 상품명
FROM CART C, PROD P
WHERE C.CART_PROD = P.PROD_ID
AND C.CART_NO LIKE '200506%'
AND C.CART_PROD = A.CART_PROD  --- ★★★★★
);

--- EXISTS 쉬운문제
--A집합
SELECT A.MEM_ID
      ,A.MEM_NAME
FROM MEMBER A
WHERE A.MEM_MILEAGE > 1000

AND EXISTS(
--B집합
SELECT 1
FROM MEMBER B
WHERE B.MEM_JOB = '학생'
AND A.MEM_ID = B.MEM_ID     --- ★★★★★
);

--P.265
--2005년도 구매금액 2천만 이상 우수고객으로 지정하여 
--검색하시오 ?
--(Alias는 회원ID, 회원명, '우수고객’)
--(구매금액 : SUM(CART.CART_QTY * PROD.PROD_SALE))
--A테이블
SELECT M.MEM_ID 회원ID
     , M.MEM_NAME 회원명
     , 우수고객  우수고객
FROM   MEMBER A;

--2005년도 구매금액 2천만 이상 우수고객
SELECT M.MEM_ID
      ,SUM(C.CART_QTY * P.PROD_SALE)
FROM MEMBER M, CART C, PROD P
WHERE P.PROD_ID = C.CART_PROD
AND   M.MEM_ID = C.CART_MEMBER
AND   C.CART_NO LIKE '2005%'
GROUP BY M.MEM_ID
HAVING SUM(C.CART_QTY * P.PROD_SALE)>= 20000000 ;
-----------------------------------
--A테이블
SELECT A.MEM_ID 회원ID
     , A.MEM_NAME 회원명
     , '우수고객' 우수고객
FROM   MEMBER A

WHERE EXISTS(

--2005년도 구매금액 2천만 이상 우수고객
SELECT 1

     --  M.MEM_ID
     -- ,SUM(C.CART_QTY * P.PROD_SALE)
FROM MEMBER M, CART C, PROD P
WHERE P.PROD_ID = C.CART_PROD
AND   M.MEM_ID = C.CART_MEMBER
AND   C.CART_NO LIKE '2005%'
GROUP BY M.MEM_ID
HAVING SUM(C.CART_QTY * P.PROD_SALE)>= 20000000 
AND A.MEM_ID = M.MEM_ID    --★★★★★★★★★★★★★
);


--------------------------------------------------------------------
--EXISTST 2번문제
--2005년도 매입금액 1천만원 이상 우수거래처로 지정하여
--검색하시오  ?
--(ALIAS 는 거래처코드, 거래처명, '우수거래처')
--구매금액 : SUM(BUYPROD.BUY_QTY*BUYPROD.BUY_COST))

--A
SELECT A.BUYER_ID
      ,A.BUYER_NAME
      , '우수거래처' 우수거래처
FROM BUYER A

WHERE EXISTS(

--2005년도 매입금액 1천만원 이상
--B
SELECT P.PROD_BUYER
      ,SUM(BP.BUY_QTY * BP.BUY_COST)
FROM PROD P, BUYPROD BP
WHERE P.PROD_ID = BP.BUY_PROD
AND BP.BUY_DATE LIKE '05%'
AND A.BUYER_ID = P.PROD_BUYER   --★★★★★★★★★★★

GROUP BY P.PROD_BUYER
HAVING SUM(BP.BUY_QTY * BP.BUY_COST) >= 10000000
);



---------------
--P.266
--2005년도 상품의 매입, 매출현황을 조회 (UNION문 사용)

--A
SELECT TO_CHAR(BUY_DATE,'YYYY/MM/DD')  일자
      ,A.PROD_NAME 상품명
      ,BP.BUY_QTY   수량
      , '매입' 구분
FROM  BUYPROD BP, PROD A
WHERE BUY_PROD = PROD_ID
AND BUY_DATE BETWEEN '2005-01-01' AND '2005-12-31'

UNION

--B
SELECT TO_CHAR(TO_DATE(SUBSTR(CART_NO,1,8),'YYYY/MM/DD'),'YYYY/MM/DD')  일자
      ,P.PROD_NAME  상품명
      ,C.CART_QTY
      , '매출' 매출
FROM CART C, PROD P      
WHERE C.CART_PROD = P.PROD_ID
AND C.CART_NO LIKE '2005%'
ORDER BY 1, 상품명;


----P.267
----집계용 문법
----RANK() : 순위 출력함수
----DENSE_RANK() : 서열 출력 함수(대상과 동일값을 하나로 설정하여 순위 부여)
--순위 부여)
SELECT RANK('c001')
      WITHIN GROUP (ORDER BY CART_MEMBER) RANK
      , DENSE_RANK('c001')
WITHIN GROUP(ORDER BY CART_MEMBER) DENSE_RANK
FROM CART;


SELECT CART_MEMBER
FROM CART
ORDER BY 1;

--분석용문법
--장바구니 (CART) 테이블에서 회원들의  회원아이디와 
--구매수, 구매순위를 출력
SELECT CART_MEMBER
      ,CART_QTY
      , RANK() OVER(ORDER BY CART_QTY DESC) AS RANK
      , DENSE_RANK() OVER(ORDER BY CART_QTY DESC) AS RANK_DESC
FROM CART;

--CART 테이블에서 아이디가 'a001'인 회원의
--회원아이디, 상품코드, 구매수, 구매수순위를 출력
--집게용 문법 사용불가 --> 분석용문법으로 풀기

SELECT CART_MEMBER  회원ID
      ,CART_QTY     구매수
      ,CART_PROD      상품코드
      ,RANK() OVER(ORDER BY CART_QTY DESC) 순위
      ,DENSE_RANK() OVER(ORDER BY CART_QTY DESC) 서열
FROM CART
WHERE CART_MEMBER = 'a001';

--CART 테이블을 사용하여 회원아이디, 구매수 
-- 회원별 구매순위를 출력

SELECT CART_MEMBER 회원아이디
      ,CART_QTY 구매수
      ,RANK() OVER (PARTITION BY CART_MEMBER ORDER BY CART_QTY DESC) 회원별구매수순위
FROM CART;

---P.268
--ROWNUN : 오라클 내부적으로 처리하기 위한 각 레코드에 대한 일렬번호

SELECT ROWNUM
      ,L.LPROD_ID
      ,L.LPROD_GU
      ,L.LPROD_NM
FROM LPROD L;


-----
SELECT T.*
FROM
(
---INLINE VIEW (ROUWNUM 잘쓰임)
SELECT ROWNUM RNUM
      ,L.LPROD_ID
      ,L.LPROD_GU
      ,L.LPROD_NM
FROM LPROD L

) T
WHERE T.RNUM BETWEEN (2*5)-4 AND (3*5)
;

--P.0269 (W잘안쓰임)
--ROWID : 테이블의 특정 레코드로 랜덤하게 접근하기 위한
--         논리적인 주소값, 데이터베이스 내에서 유일한 ㄱ밧



SELECT LPROD_GU
      ,LPROD_NM
      ,ROWID
      FROM LPROD
      ORDER BY 3 ASC;
      
      

--RATIO_TO_REPORT : 전체대비 ROW의 길이
--차지하는 비율을 구해줌

SELECT T1.VAL
      ,RATIO_TO_REPORT(T1.VAL) OVER() * 100 || '%'
FROM
(

----UNION : 중복 1회 자동정렬O / UNION ALL : 중복 모두 , 자동정렬X
      
  SELECT 10 VAL FROM DUAL
  UNION ALL
  SELECT 20 VAL FROM DUAL
  UNION ALL 
  SELECT 30 VAL FROM DUAL
  UNION ALL
  SELECT 40 VAL FROM DUAL
  )T1;


--a001회원이 구입한 상품의 내역을 활용하여
--구매개수 (cart_qty) 대비 해당 구매개수 값이
--차지하는 비율을 구하기
--alias : 회원id, 상품코드, 구매수, 차지비율

SELECT CART_PROD  상품코드
      ,CART_MEMBER 회원ID
      ,CART_QTY 구매수
      ,ROUND(RATIO_TO_REPORT(CART_QTY) OVER () *100,2) 차지비율
        
FROM CART
WHERE CART_MEMBER = 'a001';    
      
---P.270
---ROLLUP : 소계를 구하는 것
--상품분류별, 거래처별 입고수와 입고가격의 합을 구해보자
--ALIAS : PROD_LGU , PROD_BUYER, IN_AMT, SUM_COST

SELECT P.PROD_LGU
      ,P.PROD_BUYER
      ,COUNT(BP.BUY_PROD) IN_AMT
      ,SUM(BP.BUY_COST) SUM_COST
FROM PROD P, BUYPROD BP
WHERE P.PROD_ID = BP.BUY_PROD
GROUP BY ROLLUP(P.PROD_LGU, P.PROD_BUYER);


----ROLLUP을 UNION ALL 로 바꾸기
SELECT P.PROD_LGU
      ,P.PROD_BUYER
      ,COUNT(*) IN_AMT
      ,SUM(BP.BUY_COST) SUM_COST
FROM PROD P, BUYPROD BP
WHERE P.PROD_ID = BP.BUY_PROD
GROUP BY P.PROD_LGU, P.PROD_BUYER

UNION ALL
SELECT P.PROD_LGU
      ,NULL
      ,COUNT(*) IN_AMT
      ,SUM(BP.BUY_COST) SUM_COST
FROM PROD P, BUYPROD BP
WHERE P.PROD_ID = BP.BUY_PROD
GROUP BY P.PROD_LGU

UNION ALL
SELECT NULL
      ,NULL
      ,COUNT(*) IN_AMT
      ,SUM(BP.BUY_COST) SUM_COST
FROM PROD P, BUYPROD BP
WHERE P.PROD_ID = BP.BUY_PROD;

--CUBE : 모든 소계
SELECT P.PROD_LGU
      ,P.PROD_BUYER
      ,COUNT(BP.BUY_PROD) IN_AMT
      ,SUM(BP.BUY_COST) SUM_COST
FROM PROD P, BUYPROD BP
WHERE P.PROD_ID = BP.BUY_PROD
GROUP BY CUBE(P.PROD_LGU, P.PROD_BUYER);

---CUBE --> UNION ALL로 변환
---P.273

SELECT P.PROD_LGU
      ,P.PROD_BUYER
      ,COUNT(*) IN_AMT
      ,SUM(BP.BUY_COST) SUM_COST
FROM PROD P, BUYPROD BP
WHERE P.PROD_ID = BP.BUY_PROD
GROUP BY P.PROD_LGU, P.PROD_BUYER

UNION ALL
SELECT P.PROD_LGU
      ,NULL
      ,COUNT(*) IN_AMT
      ,SUM(BP.BUY_COST) SUM_COST
FROM PROD P, BUYPROD BP
WHERE P.PROD_ID = BP.BUY_PROD
GROUP BY P.PROD_LGU

UNION ALL
SELECT NULL
      ,NULL
      ,COUNT(*) IN_AMT
      ,SUM(BP.BUY_COST) SUM_COST
FROM PROD P, BUYPROD BP
WHERE P.PROD_ID = BP.BUY_PROD;


------GROUP BY ROLLUP(A, B)
-----> GROUP BY A,B
-----> UNION ALL
-----> GROUP BY A
-----> UNIONALL
-----> 모두 집계


--------GROUP BY CUBE(A,B)
-----> GROUP BY A,B
-----> UNION ALL
-----> GROUP BY A
-----> UNION ALL
-----> GROUP BY B
-----> UNION ALL
-----> 모두 집계


---P.273
---GROUPING SET 함수 : 그루핑 조건이 여러개일경우 사용

SELECT MEM_JOB
      ,NULL
      ,COUNT(*)
FROM MEMBER
GROUP BY MEM_JOB

UNION ALL
SELECT NULL
      ,MEM_LIKE
      ,COUNT(*)
FROM MEMBER
GROUP BY MEM_LIKE;

---> 위의 식을 GROUPING SET으로 바꿀경우
----GROUPING SET
SELECT MEM_JOB
      ,MEM_LIKE
      ,COUNT(*)
FROM MEMBER
GROUP BY GROUPING SETS(MEM_JOB, MEM_LIKE);


--GROUPING SETS(A,B)
--> UNION ALL
--> GROUP BY A
--> UNION ALL
--> GROUP BY B

----P.277
-- LAG 함수 : 이전행을 보여줌 
SELECT LPROD_GU
      ,LPROD_NM
      ,LAG(LPROD_GU) OVER (ORDER BY LPROD_GU ASC) 이전행정보
FROM LPROD;

--LEAD 함수 : 다음행을 보여줌
SELECT LPROD_GU
      ,LPROD_NM
      ,LEAD(LPROD_GU) OVER (ORDER BY LPROD_GU ASC) 다음행정보
FROM LPROD;


--P.295---07.06
/
SET SERVEROUTPUT ON;
/
DECLARE
 v_i        NUMBER(9,2) := 123456.78;
 v_str      VARCHAR2(20) := '홍길동';
 c_pi       CONSTANT NUMBER(8,6) := 3.141592;
 v_flag     BOOLEAN NOT NULL := TRUE;
 v_date     VARCHAR2(10) :=TO_CHAR(SYSDATE, 'YYYY-MM-DD');
BEGIN
DBMS_OUTPUT.PUT_LINE('v_i :' || v_i);
--system.out.println(v_i;'||v_i);
END;   
 /   
 
 -------
 /
 SET SERVEROUTPUT ON;
 /
 DECLARE
v_i     NUMBER(9,2) := 0;
v_NAME   VARCHAR2(20);
c_pi    CONSTANT NUMBER(8,6) := 3.141592;
v_flag  BOOLEAN NOT NULL     := true;
v_date  VARCHAR2(10)         := TO_CHAR(SYSDATE, 'YYYY-MM-DD');

BEGIN
    v_name := '홍길동';
--  DBMS_OUTPUT.ENABLE;
    DBMS_OUTPUT.PUT_LINE('v_i :' || v_i);
    DBMS_OUTPUT.PUT_LINE('v_name :' || v_name);
    DBMS_OUTPUT.PUT_LINE('c_pi :' || c_pi);
    DBMS_OUTPUT.PUT_LINE('v_date :' || v_date);
END;
/
    
---분기문
--P.296
--조건이 TRUE이면 이하 문장을 실행하고,
--조건이 FALSE 면 관련된 문장을 통과한다.
--ELSIF절은 여러개 가능하다, ELSE 절은 한개만 가능하다

DECLARE
V_NUM NUMBER := 37;
BEGIN 
--DBMS_OUTPUT.ENABLE;
IF MOD(V_NUM, 2) = 0 THEN
DBMS_OUTPUT.PUT_LINE( V_NUM || '는 짝수');

ELSE
DBMS_OUTPUT.PUT_LINE(V_NUM || '는 홀수');
END IF;
END;
/

--P.296
--조건에 따른 다중 ELSIF

DECLARE
V_NUM  NUMBER := 55;
BEGIN
DBMS_OUTPUT.ENABLE;
IF V_NUM > 90 THEN
DBMS_OUTPUT.PUT_LINE('수');

ELSIF V_NUM > 80 THEN
DBMS_OUTPUT.PUT_LINE('우');


ELSIF V_NUM > 70 THEN
DBMS_OUTPUT.PUT_LINE('미');

ELSE
DBMS_OUTPUT.PUT_LINE('분발해라 애송이');
END IF;
END;
/


---- SELECT , INTO 문

DECLARE
--변수의 종류 : SCALAR(일반), REFERENCE(참조), COMPOSITE(배열), BIND(바인드 IN/OUT)
-- 상품테이블의 판매가컬럼의 자료형 및 크기를 참조.
V_AVG_SALE PROD.PROD_SALE%TYPE;
V_SALE NUMBER := 500000;
BEGIN
SELECT AVG(PROD_SALE) INTO V_AVG_SALE FROM PROD;
IF V_SALE < V_AVG_SALE THEN
DBMS_OUTPUT.PUT_LINE('평균 단가가 500000 초과입니다.');
ELSE 
DBMS_OUTPUT.PUT_LINE('평균단가가 500000 이하입니다.');
END IF;
END;
/

--P.297
--회원테이블에서 아이디가 'e001' 인 회원의  
--마일리지가 5000을 넘으면 'VIP 회원' 
--그렇지 않다면 '일반회원'으로 
--출력하시오. (회원이름, 마일리지 포함)

/
DECLARE
--SCALAR 변수
V_MILEAGE NUMBER;



BEGIN
SELECT MEM_MILEAGE INTO V_MILEAGE
FROM MEMBER WHERE MEM_ID = 'e001';

IF V_MILEAGE > 5000 THEN
DBMS_OUTPUT.PUT_LINE('VIP회원');

ELSE
DBMS_OUTPUT.PUT_LINE('일반회원');

END IF;
END;
/

--P.297 
--CASE 문 :SQL에서 사용하는 CASE문과 동일함
--         차이점은 END CASE로 끝난다는 것임

DECLARE
V_NUM NUMBER := 77;

BEGIN
V_NUM := TRUNC(V_NUM /10);

CASE V_NUM
WHEN 10 THEN
DBMS_OUTPUT.PUT_LINE('수' || '(' || V_NUM || ')');

WHEN 9 THEN
DBMS_OUTPUT.PUT_LINE('수' || '(' || V_NUM || ')');

WHEN 8 THEN
DBMS_OUTPUT.PUT_LINE('우' || '(' || V_NUM || ')');

WHEN 7 THEN
DBMS_OUTPUT.PUT_LINE('미' || '(' || V_NUM || ')');

ELSE
DBMS_OUTPUT.PUT_LINE('분발합시다');
END CASE;
END;
/

--상품분류가 화장품인 상품의 평균판매가를
--구한 후 평균판매가가 3,000원 미만이면 
--싸다, 3,000원 이상 ~ 6,000원 미만이면 보통,
--6,000원 이상 ~ 9,000원 미만이면 비싸다,
--9,000원 이상이면 너무비싸다를 출력하기
--단, CASE 문 (SEARCHED CASE EXPRESSION) 사용하여 처리하기
--출력형식 : 화장품의 평균판매가는 5000원이고 보통이다.

/
DECLARE
V_AVG_SALE NUMBER;

BEGIN

SELECT ROUND(AVG(NVL(PROD_SALE,0)),2) INTO V_AVG_SALE 
FROM PROD
WHERE PROD_LGU = (SELECT LPROD_GU FROM LPROD WHERE LPROD_NM = '화장품');

DBMS_OUTPUT.PUT_LINE('V_AVG_SALE :' || V_AVG_SALE);

CASE WHEN V_AVG_SALE < 3000 THEN
DBMS_OUTPUT.PUT_LINE('화장품의 평균판매가는' || V_AVG_SALE || '이고 싸다');

WHEN V_AVG_SALE >= 3000 AND V_AVG_SALE < 6000 THEN
DBMS_OUTPUT.PUT_LINE('화장품의 평균판매가는' || V_AVG_SALE || '이고 보통이다');

WHEN V_AVG_SALE >= 6000 AND V_AVG_SALE < 9000 THEN
DBMS_OUTPUT.PUT_LINE('화장품의 평균판매가는' || V_AVG_SALE || '이고 비싸다');

WHEN V_AVG_SALE >= 9000 THEN
DBMS_OUTPUT.PUT_LINE('화장품의 평균판매가는' || V_AVG_SALE || '이고 너무 비싸다');

ELSE 
DBMS_OUTPUT.PUT_LINE('화장품평균판매가는' || V_AVG_SALE || '이고 기타이다');
END CASE;
END;
/


--가파치 업체의 지역을 검색하여
--다음과 같이 출력하기
--대구, 부산 : 경남
--대전 : 충청
--서울, 인천 : 수도권
--기타 : 기타
--단, CASE문 사용하기

/

DECLARE
V_BUYER_ADD1 VARCHAR2(60);

BEGIN
SELECT SUBSTR(BUYER_ADD1,1,2) INTO V_BUYER_ADD1
FROM BUYER
WHERE BUYER_NAME = '가파치';

DBMS_OUTPUT.PUT_LINE('주소 : ' || V_BUYER_ADD1);

CASE WHEN V_BUYER_ADD1 = '대구' OR V_BUYER_ADD1 =  '부산' THEN
DBMS_OUTPUT.PUT_LINE('경남은 ' || V_BUYER_ADD1 || ' 이다');


ELSE
DBMS_OUTPUT.PUT_LINE('경남은' || V_BUYER_ADD1 || '이다');

END CASE;
END;
/


---------------------

DECLARE
    V_ADD1 VARCHAR2(60);
BEGIN
    --대구
    SELECT SUBSTR(BUYER_ADD1,1,2) INTO V_ADD1
    FROM   BUYER WHERE BUYER_NAME = '가파치';
    
    --대구, 부산 : 경남
    CASE WHEN V_ADD1 IN('대구','부산') THEN
            DBMS_OUTPUT.PUT_LINE('대구, 부산 : 경남');
    --대전 : 충청
         WHEN V_ADD1 IN('대전') THEN
            DBMS_OUTPUT.PUT_LINE('대전 : 충청');
    --서울, 인천 : 수도권  
         WHEN V_ADD1 IN('서울','인천') THEN
            DBMS_OUTPUT.PUT_LINE('서울, 인천 : 수도권');
    --기타 : 기타
         ELSE
            DBMS_OUTPUT.PUT_LINE('기타');
    END CASE;
END;
/

----------------------
--CASE문제
--장바구니 테이블에서 2005년도 a001 회원의 구매금액의 합을 구해서
--1000만원 미만은 '브론즈', 1000만원 이상 2000만원 미만은 '실버',
--2000만원 이상 3000만원 미만은 '골드', 3000만원 이상 4000만원 미만은 '플래티넘'
-- 그 이상은 '다이아'
--출력해보자
--a001, 8075000
/
DECLARE
    V_MEMBER VARCHAR2(30);
    V_QTY NUMBER;
BEGIN
    SELECT C.CART_MEMBER, SUM(P.PROD_SALE * C.CART_QTY) 
        INTO V_MEMBER, V_QTY
    FROM   PROD P, CART C
    WHERE  P.PROD_ID = C.CART_PROD
    AND    C.CART_MEMBER = 'a001'
    GROUP BY C.CART_MEMBER;
    
     CASE    WHEN V_QTY < 1000 THEN
                DBMS_OUTPUT.PUT_LINE('구매금액의 합은 ' || V_QTY || '이고 브론즈이다');
            WHEN V_QTY >= 1000 AND V_QTY < 2000 THEN
                DBMS_OUTPUT.PUT_LINE('구매금액의 합은 ' || V_QTY || '이고 실버이다');
            WHEN V_QTY >= 2000 AND V_QTY < 3000 THEN
                DBMS_OUTPUT.PUT_LINE('구매금액의 합은 ' || V_QTY || '이고 골드이다');
            WHEN V_QTY >= 3000 AND V_QTY < 4000 THEN
                DBMS_OUTPUT.PUT_LINE('구매금액의 합은 ' || V_QTY || '이고 플래티넘이다');
            ELSE
                DBMS_OUTPUT.PUT_LINE('구매금액의 합은 ' || V_QTY || '이고 다이아이다');
    END CASE;
END;
/

--CASE 문제 
--회원테이블에서 지역이 대전인 회원을 검색하여
--회원수가 3명 미만이면 '소모임
--3명이상 6명 미만 '써클'
--6명 이상 9명 미만 '동아리'
-- 그 이상이면 '집회' 결과를 출력해보자


/
DECLARE
V_MEMBER VARCHAR2(30);

BEGIN
SELECT COUNT(MEM_ID) INTO V_MEMBER      
FROM MEMBER
WHERE SUBSTR(MEM_ADD1,1,2) = '대전';

CASE WHEN V_MEMBER < 3 THEN
    DBMS_OUTPUT.PUT_LINE('대전인 사람 중  ' || V_MEMBER || '명은 소모임이다');
    WHEN  V_MEMBER >=3 AND V_MEMBER <6 THEN
    DBMS_OUTPUT.PUT_LINE('대전인 사람 중 ' || V_MEMBER || '명은 써클이다');
    WHEN  V_MEMBER >=6 AND V_MEMBER <9 THEN
    DBMS_OUTPUT.PUT_LINE('대전인 사람 중 ' || V_MEMBER || '명은 동아리이다');
    ELSE
    DBMS_OUTPUT.PUT_LINE('대전인 사람 중 ' || V_MEMBER || '명 이상은 집회이다');
END CASE;
END;
/
------
/
DECLARE
CNT_MEM NUMBER;
BEGIN

SELECT COUNT(*) INTO CNT_MEM
FROM MEMBER
WHERE MEM_ADD1 LIKE '대전%';
----SEARCHED CASE EXPRESSION
CASE WHEN CNT_MEM < 3 THEN
       DBMS_OUTPUT.PUT_LINE('소모임');
     WHEN CNT_MEM >=3 AND CNT_MEM <  6 THEN 
        DBMS_OUTPUT.PUT_LINE('써클');
     WHEN CNT_MEM >= 6 AND CNT_MEM < 9 THEN
       DBMS_OUTPUT.PUT_LINE('동아리');
     ELSE
     DBMS_OUTPUT.PUT_LINE('집회');
END CASE;
END;
/


--P.298
--WHILE : 반복될때마다 조건을 확인. 조건이 TRUE 이어야 LOOP 실행
---1~10까지 더하기
/
 SET SERVEROUTPUT ON;
/
DECLARE
V_SUM NUMBER := 0;
V_VAR NUMBER := 1;
BEGIN
 WHILE V_VAR <= 10 LOOP
    V_SUM := V_SUM + V_VAR;
    V_VAR := V_VAR + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1부터 10까지의 합 =' || V_SUM);
    END;
    /
    
    --P. 298
    --다중 WHILE 문을 사용하여 구구단 만들기
    
/
DECLARE
V_A NUMBER := 2;
V_B NUMBER := 1;
BEGIN
    WHILE V_A<=9 LOOP
    DBMS_OUTPUT.PUT_LINE(V_A || '단');
    
     WHILE V_B<= 9 LOOP
     DBMS_OUTPUT.PUT_LINE( V_A || 'X' || V_B || '=' || (V_A*V_B));
     
     V_B := V_B +1;
     
     END LOOP;
     
     
     V_B := 1;
     V_A := V_A+1;
     
     END LOOP;    
     END;
     /
 
 
 ---P.299 
 ---LOOP문
 -- 조건이 없는 단순한 무한 루프(무한반복)
 --EXIT 문을 사용하여 반복문을 빠져나감

/
 SET SERVEROUTPUT ON;
/

 DECLARE
 V_VAR NUMBER := 1; 
 BEGIN 
    LOOP
    
    --V_VAR:  숫자형 변수  
    DBMS_OUTPUT.PUT_LINE(V_VAR);   
    V_VAR := V_VAR +1;
    --언제 나가냐>
    IF V_VAR > 10 THEN
        EXIT;
        END IF;
    END LOOP;  
 END;
 /    
---------------
/
 DECLARE
 V_VAR NUMBER := 1; 
 --누적변수
 V_SUM NUMBER := 0;
 
 BEGIN 
    LOOP
    
    --V_VAR:  숫자형 변수  
    DBMS_OUTPUT.PUT_LINE(V_VAR);   
    -- 누적 := 누적 + 누적대상
    V_VAR := V_VAR +1;
    V_SUM := V_SUM + V_VAR;
    
    --언제 나가냐>
    IF V_VAR > 10 THEN
        EXIT;
        END IF;
    END LOOP;  
    DBMS_OUTPUT.PUT_LINE('1부터 10까지의 합 = ' || V_SUM);
 END;
 /    


-----P.300
--GOTO
-- I GO TO SCHOOL BY BUS.

/
DECLARE
V_VAR NUMBER :=1;
--누적 변수
V_SUM NUMBER :=0;

BEGIN
    <<SCHOOL>>
    DBMS_OUTPUT.PUT_LINE(V_VAR);
    V_SUM := V_SUM + V_VAR;
    V_VAR := V_VAR +1;
    IF V_VAR <= 10 THEN
    GOTO SCHOOL;
    END IF;
    DBMS_OUTPUT.PUT_LINE(V_SUM);
END;
/

--P.299
--LOOP 및 EXIT WHEN 구문을 사용하여
--구구단을 출력하기
--2단부터 9단까지 출력



/
DECLARE
    V_DAN NUMBER := 2;
    V_NUM NUMBER := 1;    
    
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE(V_DAN || '단');
            
    -----------구구단 출력--------------------
        LOOP 
        DBMS_OUTPUT.PUT_LINE(V_DAN || ' X ' || V_NUM || '=' || (V_DAN *V_NUM));                         
        V_NUM := V_NUM +1;  
        
        -- V_NUM가 10이 되는 순간 반복문을 나가자
        EXIT WHEN V_NUM > 9;
        END LOOP;
            
            V_NUM := 1;           
            V_DAN := V_DAN +1;
     ------구구단 출력 끝------------
     
     
            --- V_DAN이 10이되면 빠져나오자          
            EXIT WHEN V_DAN > 9;
            END LOOP;
            END;
 /
-------------------------------
--P.300
--FOR문

DECLARE
    I NUMBER; -- 생략 가능
BEGIN
    -- I : 자동선언 정수형 변수.
    --변수를 DECLARE에서 선언하지 않더라도 내부적으로 자동으로 선언되는 변수로써
    --내부적으로 자동으로 선언되는 변수
    --기본적으로 1씩 증가됨
    --1..10 => 1은 시작 값, 10은 종료값,
    -- 시작값 앞에 REVERSE 가 잇다면 1씩 감소됨. REVERSE 1..10
    
    FOR I IN REVERSE 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/

/

DECLARE
BEGIN 
    FOR V_DAN IN 2..9 LOOP
        DBMS_OUTPUT.PUT_LINE(V_DAN || '단');
        
            
        FOR V_NUM  IN  1..9 LOOP
        DBMS_OUTPUT.PUT_LINE(V_DAN || 'X' || V_NUM || '=' || (V_DAN*V_NUM));
        END LOOP;
   END LOOP; 
END;
/

------
/
DECLARE
BEGIN
    FOR V_STAR IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(NULL);
        EXIT WHEN V_STAR >= 10;
        
            FOR V_NULL IN 2..10 LOOP
                DBMS_OUTPUT.PUT('*');
                EXIT WHEN V_NULL > V_STAR;       
                END LOOP;
    END LOOP;

END;
/
-------------
--별 증가 문제

/
DECLARE
BEGIN
    --7행
    FOR I IN 1..7 LOOP
    --1~7열 
    FOR J IN 1..I LOOP
    DBMS_OUTPUT.PUT('*');
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
END;    
/
----P.301
--EXCEPTION(예외 처리 , 오류 처리)
--  1. 정의된 ORCALE SERVER ERROR (선언필요 X , 자주 발생하는 에러)
--  2. 정의되지 않은 ORCALE SERVER ERROR (선언 필요, 암시적으로 발생)
--  3. 사용자 정의 ERROR (

--상품분류코드가 P201인 상품분류명? 여성 캐쥬얼
DECLARE
    V_NM VARCHAR2(60);
BEGIN
    SELECT LPROD_NM + 0 INTO V_NM
    FROM LPROD
    WHERE LPROD_GU = 'P201';  --P201, P202..
    DBMS_OUTPUT.PUT_LINE('V_NM : '  || V_NM);
    --정의된 오류 처리
    EXCEPTION
        WHEN NO_DATA_FOUND THEN ---ORA-01403
            DBMS_OUTPUT.PUT_LINE('해당 데이터가 없습니다');
        WHEN TOO_MANY_ROWS THEN    --ORA--01422
            DBMS_OUTPUT.PUT_LINE('한 개 이상의 값이 나왔습니다');        
        WHEN OTHERS THEN --ORA-01722
            DBMS_OUTPUT.PUT_LINE('기타오류 : ' || SQLERRM);
END;
/


----
--id가 z001인 회원의 이름과 직업을 구하기
--단, 해당 정보가 없을 경우 예외처리 하시오
/
DECLARE
V_NAME VARCHAR2(60);
V_JOB VARCHAR2(60);
BEGIN
SELECT MEM_NAME, MEM_JOB INTO V_NAME, V_JOB
FROM MEMBER
WHERE MEM_ID = 'Z001';
DBMS_OUTPUT.PUT_LINE('V_NAME : '  || V_NAME || ' V_JOB : ' || V_JOB);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('해당데이터가 없습니다');
        WHEN OTHERS THEN --ORA-01722
        DBMS_OUTPUT.PUT_LINE('오류발생 : ' || SQLERRM);
END;
/

---P.301
-- 정의 되지 않는 예외인 경우
/
DECLARE
    --EXCEPTION형 변수 선언
    EXP_REFERENCE EXCEPTION;
    --EXCEPTION형 변수와 2292번 오류를 연결
    PRAGMA EXCEPTION_INIT(EXP_REFERENCE, -2292);
BEGIN
    --ORA-02292(CHILD RECORD FOUND)
    DELETE FROM LPROD WHERE LPROD_GU = 'P101';  --integrity constraint : 무결성 위반

    EXCEPTION
        WHEN EXP_REFERENCE THEN
            DBMS_OUTPUT.PUT_LINE('삭제불가 : ' || SQLERRM);
        WHERE OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('기타오류 : ' || SQLERRM);
END;
/

---P.302 사용자 정의 ERROR
ACCEPT P_LGU PROMPT '등록하려는 상품분류코드를 입력하세요:'
DECLARE
    
    --EXCEPTION 형 변수
    EXP_LPROD_GU EXCEPTION;
    
    --ACCEPT의 P_LGU 변수의 값을 사용하려면 주소를 찾아갸아함.
    V_LGU VARCHAR2(10) := '&P_LGU';
BEGIN
    IF V_LGU IN ('P101','P102','P201','P202') THEN
        --발생키다
        RAISE EXP_LPROD_GU;
    END IF;
        DBMS_OUTPUT.PUT_LINE('등록가능');
    EXCEPTION
        WHEN EXP_LPROD_GU THEN
            DBMS_OUTPUT.PUT_LINE(V_LGU || '는 등록불가');
        
END;
/


---CURSOR
--2005년도 상품별 매입수량의 합계
/
DECLARE
    V_PROD VARCHAR2(20);
    V_QTY NUMBER;
    -- 커서 선언
    CURSOR GAEDDONGI IS
        SELECT BUY_PROD, SUM(BUY_QTY) FROM BUYPROD
        WHERE EXTRACT(YEAR FROM BUY_DATE) = 2005
        GROUP BY BUY_PROD ORDER BY BUY_PROD ASC;
BEGIN
    --데이터를 메모리로 BIND(올림)
    OPEN GAEDDONGI;
    --작업 수행
    --다음 행을 가리킴 패치 -> 출력
    FETCH GAEDDONGI INTO V_PROD, V_QTY;
    DBMS_OUTPUT.PUT_LINE(V_PROD || ',' || V_QTY);
    FETCH GAEDDONGI INTO V_PROD, V_QTY;
    DBMS_OUTPUT.PUT_LINE(V_PROD || ',' || V_QTY);
    
    --데이터를 메모리에서 삭제
    CLOSE GAEDDONGI;
END;
/

/
--CURSOR
--2005년도 상품별 매입수량의 합계
DECLARE
    V_PROD VARCHAR2(20);
    V_QTY NUMBER;
    --커서 선언
    CURSOR GAEDDONGI IS
        SELECT BUY_PROD, SUM(BUY_QTY) FROM BUYPROD
        WHERE EXTRACT(YEAR FROM BUY_DATE) = 2005
        GROUP BY BUY_PROD ORDER BY BUY_PROD ASC;
BEGIN
    --데이터를 메모리로 BIND(올림)
    OPEN GAEDDONGI;
    
    -p-
    --작업 수행
    --다음 행을 가리킴. 페출
    FETCH GAEDDONGI INTO V_PROD, V_QTY;
    DBMS_OUTPUT.PUT_LINE(V_PROD || ',' || V_QTY);
    FETCH GAEDDONGI INTO V_PROD, V_QTY;
    DBMS_OUTPUT.PUT_LINE(V_PROD || ',' || V_QTY);
    FETCH GAEDDONGI INTO V_PROD, V_QTY;
    DBMS_OUTPUT.PUT_LINE(V_PROD || ',' || V_QTY);
    FETCH GAEDDONGI INTO V_PROD, V_QTY;
    DBMS_OUTPUT.PUT_LINE(V_PROD || ',' || V_QTY);
    FETCH GAEDDONGI INTO V_PROD, V_QTY;
    DBMS_OUTPUT.PUT_LINE(V_PROD || ',' || V_QTY);
    
    --데이터를 메모리에서 삭제
    CLOSE GAEDDONGI;
END;
/

--07.11


--직업을 변수로 받아 이름회원명과 마일리지를 출력하는 커서

/
SET SERVEROUTPUT ON; 

ACCEPT V_JOB PROMPT '직업을 입력해주세요:'
/
DECLARE
    V_NAME VARCHAR2(60);
    V_MILEAGE NUMBER;
-- SELECT 결과 집합에 CUR라는 이름을 붙임
CURSOR CUR IS
SELECT MEM_NAME
        , MEM_MILEAGE
        FROM MEMBER
        WHERE MEM_JOB = '&V_JOB';
BEGIN
  -- 집합을 메모리로 바인딩
    OPEN CUR;
    
    --페따출
    FETCH CUR INTO V_NAME, V_MILEAGE;
    --패치햇더니 데이터가 잇냐?
    WHILE CUR%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE(V_NAME ||
    ',' || V_MILEAGE);
    FETCH CUR INTO V_NAME, V_MILEAGE;
    END LOOP;
    --메모리에서 제거
    CLOSE CUR;
END;
/

--FORLOOP를 이용하는 CURSOR
--각 반복하는 동안 커서를 자동으로 OPEN 하고 모든행이 처리되면
--자동으로 커서를 CLOSE 한다.

/
ACCEPT V_JOB PROMPT '직업을 입력해주세요:'
/
DECLARE
-- SELECT 결과 집합에 CUR라는 이름을 붙임
CURSOR CUR IS
SELECT MEM_NAME
        , MEM_MILEAGE
        FROM MEMBER
        WHERE MEM_JOB = '&V_JOB';
BEGIN
    FOR R IN CUR LOOP
    DBMS_OUTPUT.PUT_LINE(R.MEM_NAME ||
        ',' || R.MEM_MILEAGE);
    
    END LOOP;
END;
/

-------
/
ACCEPT V_JOB PROMPT '직업을 입력해주세요:'
/
DECLARE
BEGIN
    FOR R IN (SELECT MEM_NAME
        , MEM_MILEAGE
        FROM MEMBER
        WHERE MEM_JOB = '&V_JOB')
        LOOP
    DBMS_OUTPUT.PUT_LINE(R.MEM_NAME ||
        ',' || R.MEM_MILEAGE);
    
    END LOOP;
END;
/


--CURSOR 문제

/*
회원별 매출금액의 합 SUM(PROD_SALE*CART_QTY)
이 2000000을 초과하는 회원을 출력해보자
*/

--ALIAS : 회원ID, 회원명, 매출금액 합
--CURSOR을 사용해서 출력해보자


DECLARE
    V_NAME VARCHAR2(60);
    V_ID VARCHAR2(60);
    V_QTY NUMBER;
CURSOR CUR IS

SELECT
    M.MEM_ID  
   ,M.MEM_NAME  
    ,SUM(P.PROD_SALE*C.CART_QTY) SUM_QTY
FROM MEMBER M, PROD P, CART C
WHERE   P.PROD_ID = C.CART_PROD
AND     M.MEM_ID = C.CART_MEMBER 
GROUP BY M.MEM_ID , M.MEM_NAME
HAVING SUM(P.PROD_SALE*C.CART_QTY) > 20000000;

BEGIN
    OPEN CUR;
    FETCH CUR INTO V_ID, V_NAME , V_QTY  ;
    WHILE CUR%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE(V_ID || V_NAME || V_QTY);
    FETCH CUR INTO V_ID, V_NAME , V_QTY;
    END LOOP;
    CLOSE CUR;
    END;
    /
    
---선생님 풀이-----  HAVING 은 집계 끝나고 써야됨.

DECLARE
    CURSOR CUR IS 
        SELECT M.MEM_ID, M.MEM_NAME
             , SUM(P.PROD_SALE * C.CART_QTY) SUM_QTY
        FROM   PROD P, CART C, MEMBER M
        WHERE  P.PROD_ID = C.CART_PROD
        AND    C.CART_MEMBER = M.MEM_ID
        GROUP BY M.MEM_ID, M.MEM_NAME
        HAVING SUM(P.PROD_SALE * C.CART_QTY)
        > 20000000;
BEGIN
    FOR R IN CUR LOOP
        DBMS_OUTPUT.PUT_LINE(R.MEM_ID || ',' || R.MEM_NAME || ',' || R.SUM_QTY);
    END LOOP;    
END;
/


--------------------
BEGIN
    FOR R IN (SELECT M.MEM_ID, M.MEM_NAME
             , SUM(P.PROD_SALE * C.CART_QTY) SUM_QTY
        FROM   PROD P, CART C, MEMBER M
        WHERE  P.PROD_ID = C.CART_PROD
        AND    C.CART_MEMBER = M.MEM_ID
        GROUP BY M.MEM_ID, M.MEM_NAME
        HAVING SUM(P.PROD_SALE * C.CART_QTY)
        > 20000000) LOOP
        DBMS_OUTPUT.PUT_LINE(R.MEM_ID || ',' || R.MEM_NAME || ',' || R.SUM_QTY);
    END LOOP;    
END;
/

--서버에 저장된 미리 컴파일 된 SQL 문장들

-- 저장프로시져를 처음 수행될때 문법을 검사하고 컴파일된다.
--컴파일된 버전은 프로시져 캐시에 저장되므로 이후에 호출될때 빠르게 수행될수 있다.

--클라이언트간 처리 루린 공유



---- P.304
-- 상품코드를 매개변수 (parameter)로 하여 재고수량 ADD

SELECT PROD_ID
    ,PROD_TOTALSTOCK
FROM PROD

----------프로시저 생성
--컴파일 : 구문분석 + 의미분석이 처리되고, 서버의 캐시공간에 저장됨.
-- 오라클이 좋아하는 언어로 바꿈

--BINT변수 : 매개변수(파라미터(인수)를 처리)
/
CREATE OR REPLACE PROCEDURE USP_UPDATE(
V_ID IN VARCHAR2
V_TOTALSTOCK IN NUMBER)
IS
BEGIN
UPDATE PROD
SET PROD_TOTALSTOCK = PROD_TOTALSTOCK + V_TOTALSTOCK
WHERE PROD_ID = V_ID;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('오류발생 : ' || SQLERRM);
        

END;
/
EXEC USP_UPDATE('P102000006',50);
/

------------------------------------

--프로시저 연습문제1
CREATE TABLE PROCTEST(
  PROC_SEQ NUMBER,
  PROC_CONTENT VARCHAR2(30),
  CONSTRAINT PK_PROCTEST PRIMARY KEY(PROC_SEQ)
);

--1-1) 프로시저 PROC_TEST1을 생성.
--실행하면 PROCTEST 테이블에 
--1, '개똥이' 데이터가 추가되도록 처리
--2.  '개똥이2'
--3.  '개똥이3'
SELECT *FROM PROCTEST;

INSERT INTO PROCTEST(PROC_SEQ, PROC_CONTENT) VALUES(1,'개똥이1');
INSERT INTO PROCTEST(PROC_SEQ, PROC_CONTENT) VALUES(2,'개똥이2');
INSERT INTO PROCTEST(PROC_SEQ, PROC_CONTENT) VALUES(3,'개똥이3');

/*
INSERT INTO 테이블명 (컬럼목록) VALUES (값들);

UPDATE 테이블명
SET 컬럼 = 값
WHERE 조건;

DELETE FROM 테이블명
WHERE 조건;
*/

CREATE OR REPLACE PROCEDURE PROC_TEST1(V_SEQ IN NUMBER)
IS
BEGIN
INSERT INTO PROCTEST(PROC_SEQ, PROC_CONTENT) VALUES(V_SEQ, ' 개똥이' || V_SEQ);

END;
/
EXEC PROC_TEST1(3);
/

------------------------
--프로시저 연습문제1
CREATE TABLE PROCTEST(
  PROC_SEQ NUMBER,
  PROC_CONTENT VARCHAR2(30),
  CONSTRAINT PK_PROCTEST PRIMARY KEY(PROC_SEQ)
);

--1-1) 프로시저 PROC_TEST1을 생성.
--실행하면 PROCTEST 테이블에 
--1, '개똥이1' 데이터가 추가되도록 처리
--2, '개똥이2'
--3, '개똥이3'
--...
SELECT * FROM PROCTEST;
/
CREATE OR REPLACE PROCEDURE PROC_TEST1(V_SEQ IN NUMBER)
IS
BEGIN
    INSERT INTO PROCTEST(PROC_SEQ, PROC_CONTENT) VALUES(V_SEQ,'개똥이'||V_SEQ);
    
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('오류 발생 : ' || SQLERRM);
END;
/
EXEC PROC_TEST1(3);
/


-----------------
--P.305
--회원 아이디를 입력받아 (IN 바인드 변수) 이름과 취미를 OUT 매개변수 (OUT 바인드변수)로 처리
CREATE OR REPLACE PROCEDURE USP_MEMBERID(V_ID IN VARCHAR2,
V_NAME OUT VARCHAR2,
V_LIKE OUT VARCHAR2
)
IS
BEGIN
SELECT MEM_NAME ,MEM_LIKE INTO V_NAME, V_LIKE
     
FROM MEMBER
WHERE MEM_ID = V_ID;
END;
/
VAR V_NAME  VARCHAR2(60)
VAR V_LIKE VARCHAR2(60)
EXEC USP_MEMBERID('c001', :V_NAME, :V_LIKE)
PRINT V_NAME
PRINT V_LIKE;
/

---P.305
--07.12
--회원아이디(MEM_ID) 및 점수를 입력받아 마일리지 점수(MEM_MILEAGE)를
--업데이트 하는 프로시저(usp_member_update)를 생성하기
--EXECUTE를 통해 김은대(a001)회원의 마일리지 값을 
--100씩 추가하여 5회에 걸쳐 500으로 올리기.





SELECT *
FROM MEMBER
WHERE MEM_ID = 'a001';
/// 
CREATE OR REPLACE PROCEDURE USP_MEMBER_UPDATE
(P_ID IN VARCHAR2, P_MILEAGE IN NUBER)
IS
BEGIN 
    UPDATE MEMBER
    SET MEM_MILEAGE = MEM_MILEAAGE + P_MILEAGE
    WHERE MEM_ID = P_ID);
    COMMIT;
    
    EXCEPTION
    WHEN OTHERS THEN;

END;

ECXC
/

---회원아이디를 받음으면 해당 이름을 리런 하수는 함수 만들기
CREATE OR REPLACE FUNCTTON FN_GETNNAME(P_ID IN VARCHAR2)

    
IS
V_NAME


FROM MEMBER
WHERE MEM_ID = P_ID
--프로시저와 달리 함수에는 RETORN(0)
    RETURN V_NAME;
        EXCEPTION

END;

/
SELECT FN_GETNAME('어머니') FROM DUAL;


---------------

--함수문제
--다음과 같이 출력하시오
-- 상품코드, 상품명, 함수명은 FN_PRODNM
SELECT PROD_ID 상품코드
      ,PROD_NAME 상품명
      ,PROD_LGU 대분류코드
      ,PROD_LGU 대분류명
FROM PROD;
/

CREATE OR REPLACE FUNCTION FN_GET_LPROD_NM(P_GU IN VARCHAR2)
IS
BEGIN
    SELECT LPROD WHERE LPROD_NM INTO V_NM
    FROM LPROD WHERE LPROD_GU = P_GU;
    RETURN V_NM;    
    END;
/


---P.308 ~ P.309
--년도 및 상품코드를 입력받으면 해당년도의 평균 판매 횟수를 반환

CREATE OR REPLACE FUNCTION FN_PRODAVGQTY
    (
    P_YEAR IN NUMBER DEFAULT(EXTRACT(YEAR FROM SYSDATE))
    ,P_PROD_ID IN VARCHAR2
    )
    RETURN NUMBER
    IS
    R_QTY NUMBER(10);
    V_YEAR VARCHAR2(5) := TO_CHAR(P_YEAR) || '%';
BEGIN
    SELECT NVL(AVG(CART_QTY),0) INTO R_QTY FROM CART
    WHERE CART_PROD = P_PROD_ID 
    AND CART_NO LIKE V_YEAR;
    RETURN R_QTY;
    
    EXCEPTION
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('예외발생'||SQLERRM);
    
END;

/
VAR QTY NUMBER
EXEC :QTY := FN_PRODAVGQTY(P_PROD_ID =>'P10100002');
PRINT QTY
EXEC :QTY := FN_PRODAVGQTY(2005,'P101000002');
PRINT QTY

SELECT PROD_ID
    ,  PROD_NAME
    ,  FN_PRODAVGQTY(2004,PROD_ID) "2004년 평균 판매횟수"
    ,  FN_PRODAVGQTY(2005,PROD_ID) "2005년 평균 판매횟수"
FROM PROD;


/
SET SERVEROUTPUT ON; 
/


---트리거 ---
CREATE OR REPLACE TRIGGER TG_LPROD_IN
---LPROD 테이블에 데이터가 INSERT된 후에 ....BEGIN을 처리하자

AFTER INSERT
ON LPROD
BEGIN
    DBMS_OUTPUT.PUT_LINE('상품분류가 추가되었습니다');
    END;
    /
----만들어진 트리거 확인
SELECT TRIGGER_NAME FROM USER_TRIGGERS;
/

INSERT INTO LPROD(LPROD_ID, LPROD_GU, LPROD_NM) 
VALUES(
(SELECT MAX(LPROD_ID) + 1 FROM LPROD),
(SELECT 'P' || (SUBSTR(MAX(LPROD_GU),2)+1) FROM LPROD),
'트리거추가값1');

/
SELECT *FROM LPROD;
/
CREATE TABLE LPROD_BAK
AS
SELECT*FROM LPROD;


/
SELECT * FROM LPROD_BAK;
/
CREATE OR REPLACE TRIGGER TG_LPROD_IN
AFTER INSERT
ON LPROD
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('상품분류가 추가되었습니다');
    ---NEW : 방금 INSERT된 새로운 그행
    INSERT INTO LPROD_BAK(LPROD_ID, LPROD_GU, LPROD_NM)
    VALUES(:NEW.LPROD_ID, :NEW.LPROD_GU, :NEW.LPROD_NM);
    END;
    /
---직원 저장 테이블
CREATE TABLE EMP01(
    EMPNO NUMBER(4) PRIMARY KEY,
    EMPNAME VARCHAR2(45),
    ENPJOB VARCHAR2(60)
    );
-- 급여 저장 테이블
CREATE TABLE SAL01(
SALNO NUMBER(4) PRIMARY KEY,
SAL NUMBER(7,2),
EMPNO NUMBER(4) REFERENCES EMP01(EMPNO)
);

---급여번호를 자동생성하는 시퀀스를 정의하고
-- 이 시퀀스로부터 일렬번호를 얻어 급여번호에 부여
/
CREATE SEQUENCE SAL01_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TRG_02
-- 타이밍 : AFTER(~후에), 이벤트 : INSERT(입력)
AFTER INSERT
ON EMP01
FOR EACH ROW
BEGIN
    INSERT INTO SAL01 VALUES(
    SAL01_SEQ.NEXTVAL, 200, :NEW.EMPNO);
    END;
    /
    
    INSERT INTO EMP01 VALUES(2201, '나랑께', '돈많은백수');
    INSERT INTO EMP01 VALUES(2202, '개똥벌레', '개똥이');
    /
    SELECT *FROM EMP01;
    SELECT *FROM SAL01;
    SELECT *FROM EMP01 A, SAL01 B WHERE A.EMPNO = B.ENPNO;
    /
    --사원이 삭제되면 그 사원의 급여 정보도 자동 삭제되는 트리거를 작성해보도록한다.
    
    
    DELETE FROM EMP01 WHERE EMPNO=2201;
    DELETE FROM EMP01 WHERE EMPNO=2; 
    /* 사원번호 3를 급여 테이블에서 참조하기 때문에 삭제가 불가능하다
    사원이 삭제되려면 그 사원의 급여 정보도 급여 테이블에서 삭제되어야
    
    */
    
    CREATE OR REPLACE TRIGER TRG_02
    --- 이벤트  : DELETE, 타이밍 : AFTER => EMP01 테이블의 데이터가 삭제된후  BEGIN 실행
    AFTER DELETE
    ON EMP01
    FOR EACH ROW
    BEGIN
        --OLD : 2203 개동이 로또 당첨자 삭제된 행
        DELETE FROM SAL01 
        WHERE EMPNO= :OLD.EMPNO;
        END;
        /
        
        DELETE FROM EMP01
        WHERE EMPNO = 2201;
        
-------------------패키지
--PACKAGE : 묶는다
CREATE OR REPLACE PACKAGE PROD_MGR
IS
--선언부
    --참조변수
    P_PROD_LGU  PROD.PROD_LGU%TYPE;  
    --프로시저
    PROCEDURE PROD_LIST;
    PROCEDURE PROD_LIST (P_PROD_LGU  IN  PROD.PROD_LGU%TYPE);
    --함수
    FUNCTION PROD_COUNT RETURN NUMBER;
    --예외형변수
    EXP_NO_PROD_LGU EXCEPTION;
END;
/
CREATE OR REPLACE PACKAGE BODY PROD_MGR 
  IS
    CURSOR PROD_CUR (V_LGU VARCHAR2) IS
     SELECT PROD_ID, PROD_NAME, TO_CHAR(PROD_SALE,'L999,999,999') PROD_SALE
     FROM PROD
     WHERE PROD_LGU = V_LGU;  
         
   PROCEDURE  PROD_LIST    IS     
    BEGIN
      IF P_PROD_LGU IS NULL THEN 
           RAISE EXP_NO_PROD_LGU;  
      END IF;
      FOR PROD_REC  IN PROD_CUR (P_PROD_LGU)  LOOP
          DBMS_OUTPUT.PUT_LINE(  PROD_REC.PROD_ID || ', '
                             || PROD_REC.PROD_NAME || ', ' || PROD_REC.PROD_SALE );
      END LOOP;
     EXCEPTION
        WHEN EXP_NO_PROD_LGU THEN
              DBMS_OUTPUT.PUT_LINE ( '상품 분류가 없습니다.'); 
        WHEN  OTHERS  THEN  
             DBMS_OUTPUT.PUT_LINE ( '기타 에러 :' || SQLERRM  ); 
   END PROD_LIST; 
PROCEDURE  PROD_LIST (P_PROD_LGU IN PROD.PROD_LGU%TYPE)
     IS     
   BEGIN
      FOR PROD_REC  IN PROD_CUR (P_PROD_LGU)  LOOP
          DBMS_OUTPUT.PUT_LINE(  PROD_REC.PROD_ID || ', '
                             || PROD_REC.PROD_NAME || ', ' || PROD_REC.PROD_SALE );
      END LOOP;
   EXCEPTION
     WHEN  OTHERS  THEN  
        DBMS_OUTPUT.PUT_LINE ( '기타 에러 :' || SQLERRM  ); 
  END PROD_LIST;  

   FUNCTION PROD_COUNT   
      RETURN NUMBER    
     IS  
       V_CNT NUMBER;
     BEGIN
        SELECT COUNT(*) INTO V_CNT FROM PROD WHERE PROD_LGU = P_PROD_LGU;
        RETURN V_CNT;
   END PROD_COUNT;  
END PROD_MGR;
/


---------------------패키지 쉬운 예제 -------------------
CREATE OR REPLACE PACKAGE PKG_EASY
IS
    V_NAME VARCHAR2(60);
    --회원의 아이디 및 숫자를 받아 마일리지 부여
    PROCEDURE PROC_MILEAGE_UP(P_ID IN VARCHAR2, P_MILEAGE IN NUMBER);
    --회원의 아이디를 받아 이름을 리턴
    FUNCTION  FN_GET_NAME(P_ID IN VARCHAR2)
        RETURN VARCHAR2;
END PKG_EASY;
/
CREATE OR REPLACE PACKAGE BODY PKG_EASY
IS
    --회원의 아이디 및 숫자를 받아 마일리지 부여->상세내용
    PROCEDURE PROC_MILEAGE_UP(P_ID IN VARCHAR2, P_MILEAGE IN NUMBER)
    IS
    BEGIN
        UPDATE MEMBER
        SET    MEM_MILEAGE = MEM_MILEAGE + P_MILEAGE
        WHERE  MEM_ID = P_ID;
    END PROC_MILEAGE_UP;
    
    --회원의 아이디를 받아 이름을 리턴->상세내용
    FUNCTION  FN_GET_NAME(P_ID IN VARCHAR2)
        RETURN VARCHAR2
    IS
    BEGIN
        SELECT MEM_NAME INTO V_NAME FROM MEMBER WHERE MEM_ID = P_ID;
        RETURN V_NAME;
    END FN_GET_NAME;
END PKG_EASY;
/
--여기까지 컴파일을 함
EXEC PKG_EASY.PROC_MILEAGE_UP('a001',500);
/
SELECT MEM_ID, MEM_MILEAGE FROM MEMBER WHERE MEM_ID = 'a001';
/
SELECT PKG_EASY.FN_GET_NAME('a001') FROM DUAL;
/