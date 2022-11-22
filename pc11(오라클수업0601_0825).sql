-- ���̺� ����
-- DDL
/* 
���̺�� ���� ��Ģ
- �ϳ��� ���� ������ ���̺���� �����ؾ� ��
- �����ڷ� �����ؾ���
- ������, ����, Ư������ �� #_$�� ����Ҽ� ����
- 30Bytes�� ���� �� ���� (�ѱ� 1���ڿ� 3Bytes) -> �����ѱ� 10���ڱ��� ����
- ����� ��� ����(NOT, NULL, INSERT ...)
*/

-- ���� ��ҹ��� �ٲٱ� : ALT +' : �巡�׸� �ؾ���.
-- ���� : CTRL + ENTER, �÷��̹�ư Ŭ��
-- LPROD ���̺� ����(3���� �÷�, LPROD_GU�÷��� P.K)
create table LPROD
(
    LPROD_ID number(5) not null,  -- ����
    LPROD_GU char(4) not null,  -- ��ǰ�з� �ڵ�
    LPROD_NM varchar2(40) not null, -- ��ǰ�з���
    constraint PK_LPROD primary key (LPROD_GU)
    );
    
-- ���̺� ����� �ޱ�
comment on column LPROD.LPROD IS '��ǰ�з�';

--- �÷��� ����� �ޱ�
comment on column LPROD.LPROD_ID IS '����';
comment on column LPROD.LPROD_GU IS '��ǰ�з��ڵ�';
comment on column LPROD.LPROD_NM IS '��ǰ�з���';

create table BUYER
(
BUYER_ID CHAR(6) NOT NULL,            -- �ŷ�ó �ڵ�
BUYER_NAME VARCHAR2(40) NOT NULL,     -- �ŷ�ó��
BUYER_LGU CHAR(4) NOT NULL,           -- ��޻�ǰ ��з�
BUYER_BANK VARCHAR2(60),              -- ����
BUYER_BANKNO VARCHAR2(60),            -- ���¹�ȣ
BUYER_BANKNAME VARCHAR2(15),          -- ������
BUYER_ZIP CHAR(7),                    -- �����ȣ
BUYER_ADD1 VARCHAR2(100),             -- �ּ�1
BUYER_ADD2 VARCHAR2(70),              --�ּ� 2
BUYER_COMTEL VARCHAR2(14) NOT NULL,   --��ȭ��ȣ
BUYER_FAX VARCHAR2(20) NOT NULL       -- FAX ��ȣ
);

/* �⺻Ű ���� ���� CONSTRAINT 
ALTER TABLE <���̺��>
ADD ( ���ο� �÷��� TYPE [DEFAULT value]  , ��� ) 
=> �÷��߰�, �⺻ ��, �������� �߰�
MODIEHY ( ���ο� �÷��� TYPE [NOT NULL] [DEFAULT value], ���) 
 -> �÷� ũ�⺯��, NULL�� NOT NULL��, NOT NULL�� NULL�� �������� ����
 -> �÷����� ����X -> �����ϱ� ���� RENAME�� �����
 DROP COLUMN �÷��� -> ���� �÷�, �������� ����
 */
 --BUYER ���̺��� ���� 
 ALTER TABLE BUYER
ADD( 
BUYER_MAIL VARCHAR2(60) NOT NULL,
BUYER_CHAPRGER VARCHAR2(20) NULL,
BUYER_TELEXT VARCHAR2(2)
);
-- DESCFRIBE : ������ ��Ű���� �����ϴ�.
-- DESC BUYER;

ALTER TABLE BUYER
MODIFY(BUYER_NAME VARCHAR2(60));
DESC BUYER;

--ADD(�߰�) CONSTRAINT(�������) CHECK_PHONE(�̸�)
--CHECK : BUYER_TELEXT �÷��� �����Ͱ� �Էµ� �� ���� ����
-- REGEXP_LIKE : ���Խ�
-- [0-9] : 0~9������ ����
-- [0-9][0-9] : �� �ڸ��� ����

ALTER TABLE BUYER
ADD CONSTRAINT CHECK_PHONE
CHECK(REGEXP_LIKE(BUYER_TELEXT, '[0-9][0-9]'));

--INDEX : å�� �������� �����
--BUYER���̺��� BUYER_NAME, BUYER_ID�� ��� �ε��� ����
--�˻��ӵ��� �������ϱ�����

CREATE INDEX IDX_BUYER
ON BUYER(BUYER_NAME, BUYER_ID);

--�ε��� ����
DROP INDEX IDX_BUYER;

--�⺻Ű ���� : NO DUPLICATE, NOT NULL(�ߺ��Ұ� �ΰ� ����)
ALTER TABLE BUYER
ADD (constraint PK_BUYER_LPROD primary key(BUYER_ID));




ALTER TABLE BUYER
ADD(constraint FK_BUYER_LPROD foreign KEY(BUYER_LGU)
-- ���� �Ʒ��� �����Ѵ�.
references LPROD(LPROD_GU)
-- ����
);

ALTER TABLE BUYER
ADD (constraint PK_BUYER_ primary key



-------------------------------

-- ���̺� ����
-- DDL
/* 
���̺�� ���� ��Ģ
- �ϳ��� ���� ������ ���̺���� �����ؾ� ��
- �����ڷ� �����ؾ���
- ������, ����, Ư������ �� #_$�� ����Ҽ� ����
- 30Bytes�� ���� �� ���� (�ѱ� 1���ڿ� 3Bytes) -> �����ѱ� 10���ڱ��� ����
- ����� ��� ����(NOT, NULL, INSERT ...)
*/

-- ���� ��ҹ��� �ٲٱ� : ALT +' : �巡�׸� �ؾ���.
-- ���� : CTRL + ENTER, �÷��̹�ư Ŭ��
-- LPROD ���̺� ����(3���� �÷�, LPROD_GU�÷��� P.K)
create table LPROD
(
    LPROD_ID number(5) not null,  -- ����
    LPROD_GU char(4) not null,  -- ��ǰ�з� �ڵ�
    LPROD_NM varchar2(40) not null, -- ��ǰ�з���
    constraint PK_LPROD primary key (LPROD_GU)
    );
    
-- ���̺� ����� �ޱ�
comment on column LPROD.LPROD IS '��ǰ�з�';

--- �÷��� ����� �ޱ�
comment on column LPROD.LPROD_ID IS '����';
comment on column LPROD.LPROD_GU IS '��ǰ�з��ڵ�';
comment on column LPROD.LPROD_NM IS '��ǰ�з���';

create table BUYER
(
BUYER_ID CHAR(6) NOT NULL,            -- �ŷ�ó �ڵ�
BUYER_NAME VARCHAR2(40) NOT NULL,     -- �ŷ�ó��
BUYER_LGU CHAR(4) NOT NULL,           -- ��޻�ǰ ��з�
BUYER_BANK VARCHAR2(60),              -- ����
BUYER_BANKNO VARCHAR2(60),            -- ���¹�ȣ
BUYER_BANKNAME VARCHAR2(15),          -- ������
BUYER_ZIP CHAR(7),                    -- �����ȣ
BUYER_ADD1 VARCHAR2(100),             -- �ּ�1
BUYER_ADD2 VARCHAR2(70),              --�ּ� 2
BUYER_COMTEL VARCHAR2(14) NOT NULL,   --��ȭ��ȣ
BUYER_FAX VARCHAR2(20) NOT NULL       -- FAX ��ȣ
);

/* �⺻Ű ���� ���� CONSTRAINT 
ALTER TABLE <���̺��>
ADD ( ���ο� �÷��� TYPE [DEFAULT value]  , ��� ) 
=> �÷��߰�, �⺻ ��, �������� �߰�
MODIEHY ( ���ο� �÷��� TYPE [NOT NULL] [DEFAULT value], ���) 
 -> �÷� ũ�⺯��, NULL�� NOT NULL��, NOT NULL�� NULL�� �������� ����
 -> �÷����� ����X -> �����ϱ� ���� RENAME�� �����
 DROP COLUMN �÷��� -> ���� �÷�, �������� ����
 */
 --BUYER ���̺��� ���� 
 ALTER TABLE BUYER
ADD( 
BUYER_MAIL VARCHAR2(60) NOT NULL,
BUYER_CHAPRGER VARCHAR2(20) NULL,
BUYER_TELEXT VARCHAR2(2)
);
-- DESCFRIBE : ������ ��Ű���� �����ϴ�.
-- DESC BUYER;

ALTER TABLE BUYER
MODIFY(BUYER_NAME VARCHAR2(60));
DESC BUYER;

--ADD(�߰�) CONSTRAINT(�������) CHECK_PHONE(�̸�)
--CHECK : BUYER_TELEXT �÷��� �����Ͱ� �Էµ� �� ���� ����
-- REGEXP_LIKE : ���Խ�
-- [0-9] : 0~9������ ����
-- [0-9][0-9] : �� �ڸ��� ����

ALTER TABLE BUYER
ADD CONSTRAINT CHECK_PHONE
CHECK(REGEXP_LIKE(BUYER_TELEXT, '[0-9][0-9]'));

--INDEX : å�� �������� �����
--BUYER���̺��� BUYER_NAME, BUYER_ID�� ��� �ε��� ����
--�˻��ӵ��� �������ϱ�����

CREATE INDEX IDX_BUYER
ON BUYER(BUYER_NAME, BUYER_ID);

--�ε��� ����
DROP INDEX IDX_BUYER;

--�⺻Ű ���� : NO DUPLICATE, NOT NULL(�ߺ��Ұ� �ΰ� ����)
ALTER TABLE BUYER
ADD (constraint PK_BUYER_LPROD primary key(BUYER_ID));




ALTER TABLE BUYER
ADD(constraint FK_BUYER_LPROD foreign KEY(BUYER_LGU)
-- ���� �Ʒ��� �����Ѵ�.
references LPROD(LPROD_GU)
-- ����
);
---- 149p ---
CREATE TABLE prod
(
    prod_id         varchar2(10) NOT NULL,   ---- ��ǰ�ڵ�
    prod_name         varchar2(40) NOT NULL,   ---- ��ǰ��
    prod_lgu         char(4) NOT NULL,      ---- ��ǰ�з�
    prod_buyer       char(6) NOT NULL,      ---- ���޾�ü(�ڵ�)
    prod_cost         number(10) NOT NULL,   ---- ���԰�
    prod_price         number(10) NOT NULL,   ---- �Һ��ڰ�
    prod_sale         number(10) NOT NULL,   ---- �ǸŰ�
    prod_outline         varchar2(100) NOT NULL,   ---- ��ǰ���� ����
    prod_detail         clob,                   ---- ��ǰ�󼼼���
    prod_img         varchar2(40) NOT NULL,   ---- �̹���(��)
    prod_tatalstock         number(10) NOT NULL,   ---- ������
    prod_insdate         date,                 ---- �ű�����(�����)
    prod_properstock        number(10) ,   ---- ����������
    prod_size         varchar2(20) ,   ---- ũ��
    prod_color         varchar2(20) ,   ---- ����
    prod_delivery         varchar2(255) ,   ---- ��� Ư�����
    prod_unit         varchar2(6) ,   ---- ����(����)
    prod_qtyin         number(10) ,   ---- ���԰����
    prod_qtysale         number(10) ,   ---- ���Ǹż���
    prod_mileage         number(10) ,   ---- ���� ���ϸ��� ����
    
    Constraint pk_prod Primary Key (prod_id),
    Constraint fr_prod_lprod Foreign Key (prod_lgu) 
                        references lprod(lprod_gu),
    Constraint fr_prod_buyer Foreign Key (prod_buyer) 
                        references buyer(buyer_id) );
    
    create table buyprod
    (   buy_date date not null, --- �԰�����
        buy_prod varchar2(10) not null, --- ��ǰ�ڵ�
        buy_qty number(10) not null, --- ���Լ���
        buy_cost number(10) not null, --- ���Դܰ�
        Constraint pk_buyprod Primary Key (buy_date,buy_prod),
        Constraint fr_buyprod_prod Foreign Key (buy_prod) references prod(prod_id) )
        
   Create table member
   (     
    mem_id         varchar2(15) NOT NULL,   ---- ȸ��id
    mem_pass         varchar2(15) NOT NULL,   ---- ��й�ȣ
    mem_name         varchar2(20) NOT NULL,      ---- ����
    mem_regno1       char(6) NOT NULL,      ---- �ֹε�Ϲ�ȣ �� 6 �ڸ�
    mem_regno2       char(7) NOT NULL,      ---- �ֹε�Ϲ�ȣ �� 7 �ڸ�
    mem_bir         date,                     ----  ����
    mem_zip       char(7) NOT NULL,      ---- �����ȣ
    mem_addl         varchar2(100) NOT NULL,      ---- �ּ�1
    mem_add2         varchar2(80) NOT NULL,      ---- �ּ�2
    mem_hometel         varchar2(14) NOT NULL,      ---- ����ȭ��ȣ
    mem_comtel         varchar2(14) NOT NULL,      ---- ȸ����ȭ��ȣ
    mem_hp              varchar2(15),               --- �̵���ȭ
    mem_mail         varchar2(60) NOT NULL,      ---- E-mail �ּ�
    mem_job              varchar2(40),               --- ����
    mem_like              varchar2(40),               --- ���
    mem_memorial              varchar2(40),               --- ����ϸ�
    mem_memorialday             date,               --- ����ϳ�¥
    mem_mileage             number(10),             ---  ���ϸ���
    mem_delete              varchar2(1),            ---- ���� ����
    constraint PK_member primary key (mem_id))
    
    create table cart
    (
        cart_member     varchar2(15)    not null,       ---ȸ�� id
        cart_no         char(13)    not null,       --- �ֹ���ȣ
        cart_prod       varchar2(10) not null,      --  ��ǰ�ڵ�
        cart_qty        number(8)  not null,        -- ����
        constraint PK_cart primary key (cart_no,cart_prod),
        constraint fr_cart_member foreign key (cart_member)
        references member(mem_id),
        constraint fr_cart_prod foreign key (cart_prod)
        references prod(prod_id)
        )
        
     create table ziptb
     (
        zipcode char(7) not null, -- �����ȣ
        sido varchar2(2 char) not null, -- Ư����, ������, ��
        gugun varchar2(10 char) not null, -- ��, ��, ��
        dong varchar2(30 char) not null, -- ��, ��,��,��,�ǹ���
        bunji varchar2(10 char), -- ����, ����Ʈ��, ȣ��
        seq number(5) not null ); -- �ڷ����
        
        create index idx_ziptb_zipcode on ziptb(zipcode);
        
        
---180p 

/* INSERT : ���̺� ���ο� ���� �߰��� �� ����.
    -�÷���� �Է��ϴ� ���� ���� �����ؾ���
    -�÷���� �Է��ϴ� ���� ������Ÿ��(�ڷ���)�� �����ؾ� ��.
    -�⺻Ű�� �ʼ� (N.N) �÷��� �ݵ�� �Է��ؾ���.
    -�÷����� �����Ǹ� ��� �÷��� ���� �ԷµǾ�� ��.
    -�Էµ��� �ʴ� �÷��� ���� �� (NULL) ���� �����
    -�Էµ��� ���� �÷��� �⺻ ���� ����� �÷��� �⺻ ���� �����

*/
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (1, 'P101', '��ǻ����ǰ');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (2, 'P102', '������ǰ');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (3, 'P201', '����ĳ���');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (4, 'P202', '����ĳ���');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (5, 'P301', '������ȭ');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (6, 'P302',  'ȭ��ǰ');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (7, 'P401', '����/CD');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (8, 'P402', '����');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (9, 'P403', '������');
    
--�ѹ� : RAM�� �޸𸮷� ����� ������ �ǵ��ư� -> �ֹ߼�.
--Ŀ�� : Ŀ���� ��� �̹� RAM���� �ϵ��ũ�� �����߱� ������ �ѹ��� ��������.

---* : �ƽ�Ʈ��ũ
-- select : ������ �˻�
-- lprod ���̺��� ��翭�� ���� �˻�
select * from lprod;
-- 181p
/* 
- select���� ���̺�(��� ���� �̷���� 2���� �迭=relation)�κ���
�ʿ��� �����͸� ����(query)�Ͽ� �˻��ϴ� ��ɹ�,
- select, from ���� �ʼ� ����.
--lprod ���̺��� ��� �÷�(�Ӽ�, attribute, field, ��)��
-- ������ �˻�
-- * : �ƽ�Ʈ��ũ (��� �÷�)
-- where(�ֿ�? �ֱ׷�����?) : ������

*/    
select * from lprod;
select LPROD_GU, LPROD_NM
from LPROD
where LPROD_GU <= 'P102';
-- lprod ���̺��� �����͸� �˻�
-- ��, ��ǰ�з��ڵ尡 p201 �̸���
-- ������ �˻�. �����ڵ�� ���и� ������.

SELECT LPROD_GU, LPROD_NM FROM LPROD
WHERE LPROD_GU > 'P201';

--lprod_id�� 3�� row�� select�Ͻÿ�.
--lprod_id, lprod_gu, lprod_nm �÷��� ��� ���

select lprod_id, lprod_gu, lprod_nm 
from lprod 
where lprod_id = 3;

desc lprod; -- describe ����

--p.181
--������Ʈ ��뿩
select *
from lprod
where lprod_gu = 'P102';
-- �׻� ������Ʈ ���� ������ġ�� �´��� ���� where�� �˻��ϰ� �����Ұ�.
-- ������ǰ  --> ���� --> ���
update lprod
set lprod_nm = '���'
where lprod_gu = 'P102';

--lprod ���̺��� lprod2 ���̺�� ����
--LPROD ���̺��� ��� ������ LPROD2���̺���
--�����ϸ鼭 ����(��, P.K, F.K�� ������ �ϵ�)
CREATE TABLE LPROD2
AS
SELECT * FROM LPROD;

SELECT * FROM LPROD2;

--lprod2 ���̺��� lprod_gu�� P202�� lprod_nm��
--���� ����󿡼� �������� update �Ͻÿ�

select *
from lprod2
where lprod_gu = 'P202';

update lprod2
set lprod_nm = '������'
where lprod_gu = 'P202';

commit;


-----------------------------------------------------------
-- ���̺� ����
-- DDL
/* 
���̺�� ���� ��Ģ
- �ϳ��� ���� ������ ���̺���� �����ؾ� ��
- �����ڷ� �����ؾ���
- ������, ����, Ư������ �� #_$�� ����Ҽ� ����
- 30Bytes�� ���� �� ���� (�ѱ� 1���ڿ� 3Bytes) -> �����ѱ� 10���ڱ��� ����
- ����� ��� ����(NOT, NULL, INSERT ...)
*/

-- ���� ��ҹ��� �ٲٱ� : ALT +' : �巡�׸� �ؾ���.
-- ���� : CTRL + ENTER, �÷��̹�ư Ŭ��
-- LPROD ���̺� ����(3���� �÷�, LPROD_GU�÷��� P.K)
create table LPROD
(
    LPROD_ID number(5) not null,  -- ����
    LPROD_GU char(4) not null,  -- ��ǰ�з� �ڵ�
    LPROD_NM varchar2(40) not null, -- ��ǰ�з���
    constraint PK_LPROD primary key (LPROD_GU)
    );
    
-- ���̺� ����� �ޱ�
comment on column LPROD.LPROD IS '��ǰ�з�';

--- �÷��� ����� �ޱ�
comment on column LPROD.LPROD_ID IS '����';
comment on column LPROD.LPROD_GU IS '��ǰ�з��ڵ�';
comment on column LPROD.LPROD_NM IS '��ǰ�з���';

create table BUYER
(
BUYER_ID CHAR(6) NOT NULL,            -- �ŷ�ó �ڵ�
BUYER_NAME VARCHAR2(40) NOT NULL,     -- �ŷ�ó��
BUYER_LGU CHAR(4) NOT NULL,           -- ��޻�ǰ ��з�
BUYER_BANK VARCHAR2(60),              -- ����
BUYER_BANKNO VARCHAR2(60),            -- ���¹�ȣ
BUYER_BANKNAME VARCHAR2(15),          -- ������
BUYER_ZIP CHAR(7),                    -- �����ȣ
BUYER_ADD1 VARCHAR2(100),             -- �ּ�1
BUYER_ADD2 VARCHAR2(70),              --�ּ� 2
BUYER_COMTEL VARCHAR2(14) NOT NULL,   --��ȭ��ȣ
BUYER_FAX VARCHAR2(20) NOT NULL       -- FAX ��ȣ
);

/* �⺻Ű ���� ���� CONSTRAINT 
ALTER TABLE <���̺��>
ADD ( ���ο� �÷��� TYPE [DEFAULT value]  , ��� ) 
=> �÷��߰�, �⺻ ��, �������� �߰�
MODIEHY ( ���ο� �÷��� TYPE [NOT NULL] [DEFAULT value], ���) 
 -> �÷� ũ�⺯��, NULL�� NOT NULL��, NOT NULL�� NULL�� �������� ����
 -> �÷����� ����X -> �����ϱ� ���� RENAME�� �����
 DROP COLUMN �÷��� -> ���� �÷�, �������� ����
 */
 --BUYER ���̺��� ���� 
 ALTER TABLE BUYER
ADD( 
BUYER_MAIL VARCHAR2(60) NOT NULL,
BUYER_CHAPRGER VARCHAR2(20) NULL,
BUYER_TELEXT VARCHAR2(2)
);
-- DESCFRIBE : ������ ��Ű���� �����ϴ�.
-- DESC BUYER;

ALTER TABLE BUYER
MODIFY(BUYER_NAME VARCHAR2(60));
DESC BUYER;

--ADD(�߰�) CONSTRAINT(�������) CHECK_PHONE(�̸�)
--CHECK : BUYER_TELEXT �÷��� �����Ͱ� �Էµ� �� ���� ����
-- REGEXP_LIKE : ���Խ�
-- [0-9] : 0~9������ ����
-- [0-9][0-9] : �� �ڸ��� ����

ALTER TABLE BUYER
ADD CONSTRAINT CHECK_PHONE
CHECK(REGEXP_LIKE(BUYER_TELEXT, '[0-9][0-9]'));

--INDEX : å�� �������� �����
--BUYER���̺��� BUYER_NAME, BUYER_ID�� ��� �ε��� ����
--�˻��ӵ��� �������ϱ�����

CREATE INDEX IDX_BUYER
ON BUYER(BUYER_NAME, BUYER_ID);

--�ε��� ����
DROP INDEX IDX_BUYER;

--�⺻Ű ���� : NO DUPLICATE, NOT NULL(�ߺ��Ұ� �ΰ� ����)
ALTER TABLE BUYER
ADD (constraint PK_BUYER_LPROD primary key(BUYER_ID));




ALTER TABLE BUYER
ADD(constraint FK_BUYER_LPROD foreign KEY(BUYER_LGU)
-- ���� �Ʒ��� �����Ѵ�.
references LPROD(LPROD_GU)
-- ����
);
---- 149p ---
CREATE TABLE prod
(
    prod_id         varchar2(10) NOT NULL,   ---- ��ǰ�ڵ�
    prod_name         varchar2(40) NOT NULL,   ---- ��ǰ��
    prod_lgu         char(4) NOT NULL,      ---- ��ǰ�з�
    prod_buyer       char(6) NOT NULL,      ---- ���޾�ü(�ڵ�)
    prod_cost         number(10) NOT NULL,   ---- ���԰�
    prod_price         number(10) NOT NULL,   ---- �Һ��ڰ�
    prod_sale         number(10) NOT NULL,   ---- �ǸŰ�
    prod_outline         varchar2(100) NOT NULL,   ---- ��ǰ���� ����
    prod_detail         clob,                   ---- ��ǰ�󼼼���
    prod_img         varchar2(40) NOT NULL,   ---- �̹���(��)
    prod_tatalstock         number(10) NOT NULL,   ---- ������
    prod_insdate         date,                 ---- �ű�����(�����)
    prod_properstock        number(10) ,   ---- ����������
    prod_size         varchar2(20) ,   ---- ũ��
    prod_color         varchar2(20) ,   ---- ����
    prod_delivery         varchar2(255) ,   ---- ��� Ư�����
    prod_unit         varchar2(6) ,   ---- ����(����)
    prod_qtyin         number(10) ,   ---- ���԰����
    prod_qtysale         number(10) ,   ---- ���Ǹż���
    prod_mileage         number(10) ,   ---- ���� ���ϸ��� ����
    
    Constraint pk_prod Primary Key (prod_id),
    Constraint fr_prod_lprod Foreign Key (prod_lgu) 
                        references lprod(lprod_gu),
    Constraint fr_prod_buyer Foreign Key (prod_buyer) 
                        references buyer(buyer_id) );
    
    create table buyprod
    (   buy_date date not null, --- �԰�����
        buy_prod varchar2(10) not null, --- ��ǰ�ڵ�
        buy_qty number(10) not null, --- ���Լ���
        buy_cost number(10) not null, --- ���Դܰ�
        Constraint pk_buyprod Primary Key (buy_date,buy_prod),
        Constraint fr_buyprod_prod Foreign Key (buy_prod) references prod(prod_id) )
        
   Create table member
   (     
    mem_id         varchar2(15) NOT NULL,   ---- ȸ��id
    mem_pass         varchar2(15) NOT NULL,   ---- ��й�ȣ
    mem_name         varchar2(20) NOT NULL,      ---- ����
    mem_regno1       char(6) NOT NULL,      ---- �ֹε�Ϲ�ȣ �� 6 �ڸ�
    mem_regno2       char(7) NOT NULL,      ---- �ֹε�Ϲ�ȣ �� 7 �ڸ�
    mem_bir         date,                     ----  ����
    mem_zip       char(7) NOT NULL,      ---- �����ȣ
    mem_addl         varchar2(100) NOT NULL,      ---- �ּ�1
    mem_add2         varchar2(80) NOT NULL,      ---- �ּ�2
    mem_hometel         varchar2(14) NOT NULL,      ---- ����ȭ��ȣ
    mem_comtel         varchar2(14) NOT NULL,      ---- ȸ����ȭ��ȣ
    mem_hp              varchar2(15),               --- �̵���ȭ
    mem_mail         varchar2(60) NOT NULL,      ---- E-mail �ּ�
    mem_job              varchar2(40),               --- ����
    mem_like              varchar2(40),               --- ���
    mem_memorial              varchar2(40),               --- ����ϸ�
    mem_memorialday             date,               --- ����ϳ�¥
    mem_mileage             number(10),             ---  ���ϸ���
    mem_delete              varchar2(1),            ---- ���� ����
    constraint PK_member primary key (mem_id))
    
    create table cart
    (
        cart_member     varchar2(15)    not null,       ---ȸ�� id
        cart_no         char(13)    not null,       --- �ֹ���ȣ
        cart_prod       varchar2(10) not null,      --  ��ǰ�ڵ�
        cart_qty        number(8)  not null,        -- ����
        constraint PK_cart primary key (cart_no,cart_prod),
        constraint fr_cart_member foreign key (cart_member)
        references member(mem_id),
        constraint fr_cart_prod foreign key (cart_prod)
        references prod(prod_id)
        )
        
     create table ziptb
     (
        zipcode char(7) not null, -- �����ȣ
        sido varchar2(2 char) not null, -- Ư����, ������, ��
        gugun varchar2(10 char) not null, -- ��, ��, ��
        dong varchar2(30 char) not null, -- ��, ��,��,��,�ǹ���
        bunji varchar2(10 char), -- ����, ����Ʈ��, ȣ��
        seq number(5) not null ); -- �ڷ����
        
        create index idx_ziptb_zipcode on ziptb(zipcode);
        
        
---180p 

/* INSERT : ���̺� ���ο� ���� �߰��� �� ����.
    -�÷���� �Է��ϴ� ���� ���� �����ؾ���
    -�÷���� �Է��ϴ� ���� ������Ÿ��(�ڷ���)�� �����ؾ� ��.
    -�⺻Ű�� �ʼ� (N.N) �÷��� �ݵ�� �Է��ؾ���.
    -�÷����� �����Ǹ� ��� �÷��� ���� �ԷµǾ�� ��.
    -�Էµ��� �ʴ� �÷��� ���� �� (NULL) ���� �����
    -�Էµ��� ���� �÷��� �⺻ ���� ����� �÷��� �⺻ ���� �����

*/
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (1, 'P101', '��ǻ����ǰ');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (2, 'P102', '������ǰ');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (3, 'P201', '����ĳ���');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (4, 'P202', '����ĳ���');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (5, 'P301', '������ȭ');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (6, 'P302',  'ȭ��ǰ');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (7, 'P401', '����/CD');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (8, 'P402', '����');
INSERT INTO lprod (lprod_id, lprod_gu, lprod_nm)
values (9, 'P403', '������');
    
--�ѹ� : RAM�� �޸𸮷� ����� ������ �ǵ��ư� -> �ֹ߼�.
--Ŀ�� : Ŀ���� ��� �̹� RAM���� �ϵ��ũ�� �����߱� ������ �ѹ��� ��������.

---* : �ƽ�Ʈ��ũ
-- select : ������ �˻�
-- lprod ���̺��� ��翭�� ���� �˻�
select * from lprod;
-- 181p
/* 
- select���� ���̺�(��� ���� �̷���� 2���� �迭=relation)�κ���
�ʿ��� �����͸� ����(query)�Ͽ� �˻��ϴ� ��ɹ�,
- select, from ���� �ʼ� ����.
--lprod ���̺��� ��� �÷�(�Ӽ�, attribute, field, ��)��
-- ������ �˻�
-- * : �ƽ�Ʈ��ũ (��� �÷�)
-- where(�ֿ�? �ֱ׷�����?) : ������

*/    
select * from lprod;
select LPROD_GU, LPROD_NM
from LPROD
where LPROD_GU <= 'P102';
-- lprod ���̺��� �����͸� �˻�
-- ��, ��ǰ�з��ڵ尡 p201 �̸���
-- ������ �˻�. �����ڵ�� ���и� ������.

SELECT LPROD_GU, LPROD_NM FROM LPROD
WHERE LPROD_GU > 'P201';

--lprod_id�� 3�� row�� select�Ͻÿ�.
--lprod_id, lprod_gu, lprod_nm �÷��� ��� ���

select lprod_id, lprod_gu, lprod_nm 
from lprod 
where lprod_id = 3;

desc lprod; -- describe ����

--p.181
--������Ʈ ��뿩
select *
from lprod
where lprod_gu = 'P102';
-- �׻� ������Ʈ ���� ������ġ�� �´��� ���� where�� �˻��ϰ� �����Ұ�.
-- ������ǰ  --> ���� --> ���
update lprod
set lprod_nm = '���'
where lprod_gu = 'P102';

--lprod ���̺��� lprod2 ���̺�� ����
--LPROD ���̺��� ��� ������ LPROD2���̺���
--�����ϸ鼭 ����(��, P.K, F.K�� ������ �ϵ�)
CREATE TABLE LPROD2
AS
SELECT * FROM LPROD;

SELECT * FROM LPROD2;

--lprod2 ���̺��� lprod_gu�� P202�� lprod_nm��
--���� ����󿡼� �������� update �Ͻÿ�

select *
from lprod2
where lprod_gu = 'P202';

update lprod2
set lprod_nm = '������'
where lprod_gu = 'P202';

commit;

select * 
from lprod2 
where LPROD_ID =7;

update LPROD2 
set LPROD_GU = 'P303' 
where LPROD_ID =7;

--------p.182----------
-- ���̺��� ���� ������
--����硡�������������Ҽ������ְ���where���̡�����������
--��Ư���������������ҡ�����������������where����������

--��Ǫ������ �ּ���
-- delete from ���̺��
-- where ����;
--lprod2 ���̺��� lprod_nm�� ȭ��ǰ��
--�����͸� �����Ͻÿ�. (row�� ���� ��.)==��,Ʃ��,���ڵ尡 ������.

select *
from lprod2
where lprod_nm = 'ȭ��ǰ';

DELETE FROM lprod2
where lprod_nm = 'ȭ��ǰ';

-- ��������, ��������
-- char(6)  'a'   where ?? =  'a     '   , ��������, ����ȿ�� ����, ����� ����
-- varchar(6) 'a' where ?? =  'a'        , ������ ���ڰ�, ����ȿ�� ����, �������

select * from lprod;

--p.182
--���̺��� ��� row�� column �� �˻�
--select * from  ���̺��;

-- ��ǰ ���̺�κ��� ��� row�� columndmf �˻��Ͻÿ�
select * from prod;
-------------------------------------------------------------------------------------







--p.182
-- ���̺��� ��� row�� column�� �˻�

select * from prod;

-- ȸ�����̺�κ��� ������ ���� �˻��Ͻÿ�.
select* from member;

-- * ǥ�ø� �ƽ�Ʈ��ũ ��� �θ���.

select* from cart;

-- ��ǰ���̺�κ��� ��ǰ�ڵ�� ��ǰ���� �˻��Ͻÿ�.

select prod_id  --��ǰ�ڵ�
    , prod_name --��
from prod;

--buyer ���̺��� buyer2 ���̺�� �����Ͻÿ�

create table buyer2
as
select * from buyer;

--2. buyer2 ���̺��� buyer_id, buyer_name, buyer_lgu �÷��� ��� select  �Ͻÿ�

select buyer_id, buyer_name, buyer_lgu
from buyer2;

--3. buyer2 ���̺��� buyer_id�� P30203�� buyer_name
--   ���� �ż����� update�Ͻÿ�

select *
from buyer2
where buyer_id = 'P30203';

update buyer2
set buyer_name = '�ż�'
where buyer_id = 'P30203';

--4. buyer2 ���̺��� buyer_name�� �Ǹ���� row �� �����Ͻÿ�

select*
from buyer2
where buyer_name = '�Ǹ��';

DELETE FROM buyer2
where buyer_name = '�Ǹ��';
commit;
--��� �����ڸ� ����Ͽ� �˻��Ǵ� �ڷᰪ ����
--��� ������� column ��, ��� ��, ��� �����ڷ� ����
--��� �����ڴ� +, -, *, /, ()�� ����
--SELECT  ��������  FROM ���̺��

select mem_id
, 1004
, '������ ������..'
, mem_name
, mem_mileage
, mem_mileage / 12 as "�� ���"
from member;

--��ٱ��� ���̺�κ��� �ֹ���ȣ, ��ǰ�ڵ� 
-- ȸ�� id, ������ �˻��Ͻÿ�.

select cart_no
    , cart_prod
    , cart_member
    , cart_qty
from cart;

--p.183
-- ��� �����ڴ� +, -, /, () �� ����
-- ȸ�� ���̺��� ���ϸ����� 12�� ���� ���� �˻��Ͻÿ�.
-- round : �ݿø� �Լ�, (,2 : �Ҽ��� 2° �ڸ����� �츮�� �ݿø�)

select mem_mileage
    , mem_mileage/12
    , round (mem_mileage/12, 2)
    ,mem_mileage + 12
    , mem_mileage - 12
    , mem_mileage * 12
from member;

--��ǰ ���̺�(PROD)�� ��ǰ�ڵ�, ��ǰ��, �Ǹűݾ��� 
--�˻� �Ͻÿ�?
--�Ǹűݾ���  = �ǸŴܰ� * 55 �� ����Ѵ�.
--��ǰ�ڵ�(PROD_ID), ��ǰ��(PROD_NAME), 
--�ǸŴܰ�(PROD_SALE)

select prod_id
        ,prod_name
        ,prod_sale * 55
from prod;

--p.183
-- distinct : �ߺ����� ,  �����
-- �÷� ����� �Ǿտ� 1ȸ ���
-- �ߺ� row(��)�� ����
-- ��ǰ ���̺�(prod)�� ��ǰ�з�(prod_lgu)��
-- �ߺ����� �ʰ� �˻�

select DISTINCT prod_lgu
from prod;

select distinct cart_member
            ,cart_prod
            from cart;
            
--��ǰ ���̺��� �ŷ�ó�ڵ带 �ߺ�����
--�ʰ� �˻��Ͻÿ� ?
--(Alias�� �ŷ�ó)
--�ŷ�ó�ڵ� : PROD_BUYER

select DISTINCT PROD_BUYER
from prod;

--P.183
--ROW(��)�� SORT(����)�ϰ��� �ϸ� ORDER BY ���� ���
--ASC(Ascending) : ��������,ASC�� ���� ����
--  �������� 0���� 9, �����ڴ� A���� Z, �ѱ��� ������.. ������ ����
--DESC(Descending) : ��������
--  �������� 9���� 0, �����ڴ� Z���� A, �ѱ��� ����Ÿ.. ������ ����

-- asc  : ������ ����
-- desc : �ڷ� ����


 /*
 SELECT 'a��' COL1 FROM DUAL
UNION ALL
SELECT 'A��' FROM DUAL
UNION ALL
SELECT 'a��' FROM DUAL
UNION ALL
SELECT 'B��' FROM DUAL
UNION ALL
SELECT 'b��' FROM DUAL
UNION ALL
SELECT 'B��' FROM DUAL
ORDER BY 1;
 */
 
 -- ALLIAS(��Ī): select ���� from���� ���Ǵ� ����.
 --1) select������ ���
 -- �÷��� ����� �� ���������� ���
 -- order by���� ��� ������ ������ ��밡��
 --2) from������ ���
 -- ���̺� ���� �ܼ�ȭ �ϱ�  ���� ���
 --select ���� �� ������ �÷����� ������ �� ���
 -- ���̺� �� alias ��

 SELECT   mem_id      ȸ��ID 
        , mem_name   as   "����"
        , mem_bir       "����"
        , mem_mileage   ���ϸ���
 from member
 order by ����;
  -- ex) as "����" or "����" or ����
  
  
 ----- �÷���ȣ�ε� ���� 
  SELECT   mem_id      ȸ��ID 
        , mem_name   as   "����"
        , mem_bir       "����"
        , mem_mileage   ���ϸ���
 from member
 order by 3;-- 3 �ڿ� asc ����
 
 -- ���� ����
  SELECT   mem_id       ȸ��ID 
        , mem_name      ����
        , mem_bir       ����
        , mem_mileage   ���ϸ���
  from member
  order by mem_mileage, 1; 
  -- ���� �����Ϳ� ���� �������� �κ����� 1�� ������ �ϰ� , �� ���Ŀ� ȸ��id�� 1�� ���� �ȿ��� 2���� ������ �϶�� ��.
  
  --ȸ�����̺�(MEMBER)����
--MEM_ID(ȸ��ID), MEM_JOB(����), 
--MEM_LIKE(���)�� �˻��ϱ�
--�������� ��������, ��̷� ��������, 
--ȸ��ID�� �������� ����

SELECT MEM_ID  ȸ��id
    , MEM_JOB   ����
    , MEM_LIKE  ���
FROM MEMBER
order by ���� asc, ��� desc, 1 asc;

--����(MEM_JOB)�� ȸ����� ȸ���� 
--MEM_MEMORIAL �÷��� �����͸� 
--NULL�� �����ϱ�
--** MEM_MEMORIAL = NULL
--** ���ǰ˻� �� ''(Ȧ����ǥ)�� �����

select *
from member
where mem_job = 'ȸ���';

update member
set mem_memorial = null
where mem_job = 'ȸ���';

commit;
---�������� (null�� �ǾƷ��� ��ġ)
select mem_memorial, mem_id from member
order by mem_memorial asc;

-- �������� (null�� ������ ��ġ)
select mem_memorial, mem_id from member
order by mem_memorial desc;

--��ǰ���̺�(PROD)�� ��ü �÷��� �˻��ϴµ�
--�ǸŰ�(PROD_SALE)�� �������� ��, 
--��ǰ�з��ڵ�(PROD_LGU)�� �������� ��
--��ǰ��(PROD_NAME)���� �������� �����غ���

SELECT *
from prod
order by PROD_SALE desc,PROD_LGU , PROD_NAME;

-----�� ����
/*
        A=B ����.
        A<>B, A!= B �����ʴ�
        A<B, A>B  ��<�� �� �̸�, �ʰ�
        A<=B, A>=B �̻�, ����

*/

--��ǰ �� �ǸŰ��� 170,000���� ��ǰ��ȸ
-- ALLAS : ��ǰ��, �ǸŰ�

SELECT PROD_NAME    ��ǰ��
        , PROD_SALE  �ǸŰ�
FROM PROD
WHERE PROD_SALE !=  170000;

--ORDER BY �ǸŰ�;

--P.185
--��ǰ �� ���԰�(PROD_COST)�� 
--200,000�� ������ ��ǰ�� �˻��Ͻÿ�
--(ALIAS�� ��ǰ�ڵ�(PROD_ID), 
--��ǰ��(PROD_NAME), ���԰�(PROD_COST))

select prod_name  ��ǰ�ڵ�
, prod_name       ��ǰ��
, prod_cost       ���԰�
from prod
where prod_cost <= 200000;

--ȸ�� �� 76�⵵ 1�� 1�� ���Ŀ� 
--�¾ ȸ���� �˻��Ͻÿ�
--��, �ֹε�Ϲ�ȣ ���ڸ��� ��
--(ALIAS�� ȸ��ID(MEM_ID), 
--ȸ����(MEM_NAME), 
--�ֹε�Ϲ�ȣ���ڸ�(MEM_REGNO1))

select mem_name ȸ����
, mem_id        ȸ��ID
, MEM_REGNO1    �ֹε�Ϲ�ȣ���ڸ�
from member
where MEM_REGNO1 > '760101';

-- ���ڿ��̱� ������ ','ǥ�ø� ���� ��.

-- (�׻���� AND ���ö�ì��� AND �����(�޺�) �ؼ� AND ź���� AND �Ƴ�);

-- OR
-- (�������� ���� �� �ϳ��� ���� �ϸ��.)

--P.185
-- ��ǰ �� ��ǰ�з��� P201(���� ĳ���) �̰ų� �ǸŰ��� 170000 ���� ��ǰ ��ȸ

select prod_name as ��ǰ
, prod_lgu ��ǰ�з�
, prod_sale �ǸŰ�
from prod
where prod_lgu ='P201'
or prod_sale = 170000;

-- ��ǰ�з��� P201 �ƴϰ� �ǸŰ��� 170000 ���� �ƴ� ��ǰ ��ȸ

SELECT PROD_NAME ��ǰ
,  PROD_LGU  ��ǰ�з�
, PROD_SALE  �ǸŰ�
FROM PROD
WHERE  
PROD_LGU!='P201' 
AND 
PROD_SALE!= 170000;

--��ǰ �� �ǸŰ��� 300,000�� �̻�, 500,000�� 
--������ ��ǰ�� �˻�  �Ͻÿ� ?
--( Alias�� ��ǰ�ڵ�(PROD_ID), 
--��ǰ��(PROD_NAME), �ǸŰ�(PROD_SALE) )

SELECT PROD_ID ��ǰ�ڵ�
, PROD_NAME     ��ǰ��
, PROD_SALE     ��ǰ��
FROM PROD
WHERE 300000 >= PROD_SALE
AND PROD_SALE <= 500000;

--���� :
--ȸ��(MEMBER) ���̺���
--����(MEM_JOB)�� �������� �ο� �� 
--���ϸ���(MEM_MILEAGE)�� 1500 �̻��� 
--����Ʈ�� �˻��Ͻÿ�.
--��� �÷��� ���Խ�Ű��

SELECT * 
FROM MEMBER
WHERE MEM_JOB = '������'
AND  MEM_MILEAGE >= 1500;

---- ��Ÿ������ : IN
SELECT PROD_NAME
    ,  PROD_SALE
FROM   PROD
WHERE PROD_SALE = 150000
OR PROD_SALE = 170000 
OR PROD_SALE = 330000;
--- ���� ���� ����
SELECT PROD_NAME
    ,  PROD_SALE
FROM   PROD
WHERE PROD_SALE IN(150000, 170000, 330000);

-- ȸ�� ���̺�(MEMBER)����
-- ȸ�� ID(MEM_ID) �� c001, f001, w001 �� ȸ���� �˻��Ͻÿ�
--- ȸ�� ID(MEM_ID), ȸ����(MEM_NAME)

SELECT  MEM_ID    ȸ��ID
,       MEM_NAME  ȸ����
FROM MEMBER
WHERE MEM_ID IN('c001', 'f001', 'w001');

--P.186
--��ǰ �з����̺��� ���� ��ǰ���̺� 
--�����ϴ� �з��� �˻�(�з��ڵ�(LPROD_GU)
--, �з���(LPROD_NM))

SELECT LPROD_GU �з��ڵ�
, LPROD_NM �з���
FROM      LPROD
WHERE LPROD_GU IN(SELECT DISTINCT PROD_LGU FROM PROD);

-- IN �տ� NOT �� ���̸� �ߺ����� �ʴ� ���븸 ����� ��������.

SELECT LPROD_GU �з��ڵ�
, LPROD_NM �з���
FROM      LPROD
WHERE LPROD_GU NOT IN(SELECT DISTINCT PROD_LGU FROM PROD);

SELECT DISTINCT PROD_LGU
FROM PROD;

----------------
-- P.186
-- ��ǰ �� �ǸŰ��� 100000���� 300000 ������ ��ǰ ��ȸ
--��ǰ �� �ǸŰ��� 100,000�� ���� 300,000�� 
--������ ��ǰ ��ȸ
--ALIAS : ��ǰ��, �ǸŰ�


SELECT PROD_NAME ȸ����
    ,  PROD_SALE �ǸŰ�
FROM PROD
WHERE PROD_SALE BETWEEN 100000 AND 300000;

--ȸ�� �� ������ 1975-01-01���� 1976-12-31���̿� 
--�¾ ȸ���� �˻��Ͻÿ� ? 
--( Alias�� ȸ��ID, ȸ�� ��, ���� )

SELECT MEM_ID   ȸ��ID
    ,  MEM_NAME   ȸ����
    ,  MEM_BIR    ����
FROM MEMBER
WHERE MEM_BIR BETWEEN '1975-01-01' AND '1976-12-31';

-- ��¥���� ��¥�� ������ �񱳽� 
-- ��¥�� ����-> ��¥������ �ڵ� ����ȯ

--P.186
--��ǰ �� ���԰�(PROD_COST)�� 300,000~1,500,000�̰� 
--�ǸŰ�(PROD_SALE)��  800,000~2,000,000 �� ��ǰ�� �˻��Ͻÿ� ?
--( Alias�� ��ǰ��(PROD_NAME), 
--���԰�(PROD_COST), �ǸŰ�(PROD_SALE) )

SELECT PROD_COST  ���԰�
      ,PROD_SALE  �ǸŰ�
      ,PROD_NAME  ��ǰ��
FROM PROD
WHERE  PROD_SALE BETWEEN 300000 AND 1500000
AND PROD_COST BETWEEN 800000 AND 2000000; 



--ȸ�� �� ������ 1975�⵵ ���� �ƴ�
--ȸ���� �˻��Ͻÿ� ?
--( Alias�� ȸ��ID, ȸ����, ����)

SELECT MEM_BIR  ����
     , MEM_ID  ȸ��ID
     , MEM_NAME  ȸ����
FROM MEMBER
WHERE MEM_BIR NOT BETWEEN '1975-01-01' AND '1975-12-31';

--�ڡڡڡڡڡ�  LIKE ������  �ڡڡڡڡ� 
-- �߿��ϰ� ���� ����
-- LIKE�� �Բ� ���̴� %, _ : ���ϵ� ī��
--  % : ��������, _ : �ѱ���
-- ��% : ������ �����ϰ� �ڿ� �������ڰ� ����
---------------------------------------
SELECT PROD_ID ��ǰ�ڵ�
      ,PROD_NAME  ��ǰ��
FROM PROD
WHERE PROD_NAME LIKE '��%';
-----------------------------------

SELECT PROD_ID
      ,PROD_NAME
FROM PROD
WHERE PROD_NAME LIKE '_��%';

-------------------------------

SELECT PROD_ID ��ǰ�ڵ�
      ,PROD_NAME  ��ǰ��
FROM PROD
WHERE PROD_NAME LIKE '%ġ';
---------------------------------
SELECT PROD_ID ��ǰ�ڵ�
      ,PROD_NAME  ��ǰ��
FROM PROD
WHERE PROD_NAME NOT LIKE '%ġ';

------------------------


SELECT PROD_ID
      ,PROD_NAME
FROM PROD
WHERE PROD_NAME LIKE '%����%';
    
    
--- ȸ�����̺��� �达 ���� ���� ȸ���� �˻��Ͻÿ�
SELECT MEM_NAME
      ,MEM_ID
    FROM MEMBER
    WHERE MEM_NAME LIKE '��%';
    
-- ȸ�����̺��� �ֹε�Ϲ�ȣ ���ڸ��� �˻��Ͽ� 1975�� ���� ������ ȸ���� �˻��Ͻÿ�.

SELECT MEM_NAME
      ,MEM_ID
      ,MEM_REGNO1 || ' ' || MEM_REGNO2  �ֹε�Ϲ�ȣ
FROM MEMBER
WHERE MEM_REGNO1 NOT LIKE '75%';

--�����̴� ���������� �Ｚ���� ���� ��ǰ�� �����ϰ��� �Ѵ�.
--������ 100���� �̸��̸� ������ ������������ ���ĵ� 
--����Ʈ�� ������ �Ѵ�.
--(ALIAS�� ��ǰID(PROD_ID), ��ǰ��(PROD_NAME), 
--�ǸŰ�(PROD_SALE), ��ǰ�����(PROD_DETAIL))

SELECT PROD_NAME ��ǰ��
      ,PROD_SALE  �ǸŰ�
      ,PROD_ID  ��ǰID
      ,PROD_DETAIL ��ǰ�����
FROM PROD
WHERE PROD_NAME LIKE '%�Ｚ%' AND PROD_SALE < 1000000
ORDER BY PROD_SALE DESC;

----�Լ�
---�� �������� ����
--- 1��°�� () , 2��° NOT, ���������� 3��°�� AND 
--- P.193
SELECT 'a' || 'bcde' from dual;
select mem_id || ' name is ' || mem_name from member;

-- concat�Լ� : �� ���ڿ��� �����Ͽ� ��ȯ.
select concat('My Name is', mem_name) from member;
--- char : ascii -> ���� / ascii : ���ڸ� ascii

select car(65) "CHR", ASCII('ABC') "ASCII" FROM DUAL;
SELECT ASC



--- P.194
--LOWER : �ҹ��ڷ� ��ȯ
---UPPER : �빮�ڷ� ��ȯ
--- INITCAP : ù���ڸ� �빮�ڷ� ��ȯ

---ȸ�� ���̺��� ȸ��ID�� �빮�ڷ�
-- ��ȯ�Ͽ��˻��Ͻÿ�>?

select mem_id
      ,upper(mem_id)
from member;

----------------
--06-17 P.194
--P.194
--��ǰ���̺��� �Һ��ڰ���(PROD_PRICE)��  
--�Һ��ڰ����� ġȯȭ�� ������ ���� ��µǰ� �Ͻÿ� 
--ALIAS : PROD_PRICE  PROD_RESULT(LPAD�Լ��� ���� ó��)



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

--RTRIM / RIGHT(��� ���ڿ�, ã�� ���ڿ�)
-- " " �˸��ƽ��� ������ ū ����ǥ ���� ����.
SELECT '<' || RTRIM('    AAA    ')|| '>' "RTRIM1"
      ,'<' || RTRIM('HELLO WORLD', 'He')|| '>' "RTRIM2"
      ,'<' || RTRIM('LLO  HE WORLD', 'HE')|| '>' "RTRIM3"
      ,'<' || RTRIM('HEHELLO HE WORLD', 'HE')|| '>' "RTRIM4"
      ,'<' || REPLACE('HEHELLO HE WORLD', 'HE')|| '>' "RTRIM5"
FROM DUAL;

-- DUAL : ������ ���̺� SYS.DUAL �� ����

-- TRIM : L +R
--TRIM : L + R
SELECT '<' || TRIM('     AAA     ') || '>' TRIM1
     , '<' || TRIM(LEADING 'a' FROM TRIM('    aaAaBaAaa')) || '>' TRIM2
     , '<' || TRIM( 'a' FROM 'aaAaBaAaa')|| '>' TRIM3
     , '<' || TRIM(BOTH 'a' FROM 'aaAaBaAaa') || '>' TRIM4
     , '<' || TRIM(TRAILING 'a' FROM 'aaAaBaAaa')  || '>' TRIM5
FROM SYS.DUAL;

-----P. 195
-- ****** �߿���
-- SUBSTR

--SELECT SUBSTR('SQL PROJECT',1,3) 
--  ���� ����° �μ��� ������ ������ ã��

--*****
SELECT SUBSTR('SQL PROJECT',1,3)  AS RESULT1
     , SUBSTR('SQL PROJECT',5)    AS RESULT2
     , SUBSTR('SQL PROJECT',-7,3) AS RESULT3 --M�� �����̸� ���ʿ������� ó��
FROM   DUAL;

/
--ȸ�����̺��� ���� ��ȸ
SELECT MEM_ID               AS ȸ��ID
     , MEM_NAME
     , SUBSTR(MEM_NAME,1,1) AS ����
FROM   MEMBER;

--��ǰ���̺��� ��ǰ��(PROD_NAME)�� 
--4° �ڸ�����  2���ڰ�
--'Į��' �� ��ǰ�� ��ǰ�ڵ�(PROD_ID), 
--��ǰ��(PROD_NAME)�� �˻��Ͻÿ� ?
--( Alias���� ��ǰ�ڵ�(PROD_ID), ��ǰ��(PROD_NAME) )

--��ǰ���̺��� ��ǰ��(PROD_NAME)�� 
--4° �ڸ�����  2���ڰ�
--'Į��' �� ��ǰ�� ��ǰ�ڵ�(PROD_ID), 
--��ǰ��(PROD_NAME)�� �˻��Ͻÿ� ?
--( Alias���� ��ǰ�ڵ�(PROD_ID), ��ǰ��(PROD_NAME) )


SELECT SUBSTR('PROD_ID',4,6)  AS RESULT1
     , SUBSTR('PROD_ID', 4, 2)  
WHERE SUBSTR('PROD_ID', 4, 2 ) LIKE '%�÷�%'  AS RESULT2
FROM   DUAL;

---------------------------------------


--Ǯ��
SELECT PROD_ID  ��ǰ�ڵ�
     , PROD_NAME   ��ǰ��
     , SUBSTR(PROD_NAME,4,2)
FROM PROD

WHERE SUBSTR(PROD_NAME,4,2) ='Į��';
--AND WHERE PROD_NAME LIKE '___Į��%';



--P.196
--P102000001 : ��ǰ�ڵ�
--P102       : ��з�
--000001     : ����
--��ǰ���̺��� ��ǰ�ڵ�(PROD_ID)���� ����4�ڸ�, 
--������6�ڸ��� �˻��Ͻÿ� ?
--(Alias���� ��ǰ�ڵ�(PROD_ID),  ��з�,  ����)

---
SELECT PROD_ID ��ǰ�ڵ�
      , SUBSTR(PROD_ID, 1, 4) ����
      , SUBSTR(PROD_ID, 5)  ��з�
FROM PROD;      


----------------------------------
SELECT REPLACE('SQL Project', 'SQL', 'SSQQL')  AS ����ġȯ1
      ,REPLACE('Java Flex Via', 'a')   as ����ġȯ 
      ,RTRIM('Java Flex Vai','a')
from dual;    



-�ŷ�ó ���̺��� �ŷ�ó�� �� '��' ---> '��' clghks
select buyer_name,
replace(buyer_name, '��', '��')
from buyer;

-----ȸ�� ���̺��� ȸ�� ������ '��' -> '��' ġȯ�˻�
select mem_name,
replace (mem_name, '��', '��')
from member;

select mem_name,                      ȸ����
      replace(mem_name,'��','��')  ȸ����ġȯ
from member;      

--instr
--p.196
--INSTR(��� ���ڿ�, ã�����ڿ� , ������ġ, ���ڼ�)
--INSTR('hello heidi', 'he', 1, 2)

select instr('I have a hat.' ,'ha',1,1)  1��°
from dual;

select instr('I have a hat.' ,'ha',1,2)
from dual;

--���� : I have a hat that i had have been found 
--      that hat before 2 years ago.
--1. ���� ���忡�� 5��° ha�� ��ġ�� ���
--INSTR(c1 ,c2, [m, [n]]) : m���� �����ؼ� n��°�� c2�� ��ġ�� ���

select instr('I have hat that i had have been found that hat before 2 years ago.','ha',1,5)
from dual;


--����
--mepch@test.com
--���� ���ڿ��� @�� �������� ������ ���� ����ϱ�
--���̵� | ������
--------------------
--mepch  | test.com

select replace('mepch@test.com','@','|')
from dual;

--Ǯ��
select substr('mepch@test.com',1,5)
       ,substr('mepch@test.com', 7)
       ,instr('mepch@test.com','@')
from dual;

SELECT SUBSTR('mepch@test.com',1,INSTR('mepch@test.com','@')-1) ���̵�
     , SUBSTR('mepch@test.com',INSTR('mepch@test.com','@')+1) ������
--     , INSTR('mepch@test.com','@')
FROM   DUAL;

select mem_id  ȸ���Ƶ�
      ,mem_name ȸ����
      ,substr(mem_mail,1,instr(mem_mail,'@')-1)  ���̵�
      ,substr(mem_mail,instr(mem_mail,'@')+1) ������
      from member;
     
     
---p.197
--length :  ���ڼ�, length : ������ bytes
--������/Ư����ȣ :1byte , �ѱ� : 3byte

select length ('SQL ������Ʈ') "LENGTH"
      ,LENGTHB('SQL ������Ʈ') "LENGTHB"
    FROM DUAL;
    
select buyer_id             �ŷ�ó�ڵ�
      ,length(buyer_id)     �ŷ�ó�ڵ����
      ,buyer_name               �ŷ�ó��
      ,length(buyer_name)       �ŷ�ó�����
      ,lengthb(buyer_name)      �ŷ�ó��byte��
      from buyer;
      
---p.197

-- ABS: ���밪
SELECT ABS(-365) FROM DUAL; --365

---SIGN : ���(1), 0(0), ����(-1)
SELECT SIGN(12), SIGN(0), SIGN(-55) FROM DUAL;

--�¼� �� (N�� Y��)
SELECT POWER(3,2), POWER(2,0) FROM DUAL;

--������
SELECT SQRT(2), SQRT(9) FROM DUAL;


-----------------------------------
--P.197
SELECT GREATEST(10, 20, 30) ����ū��
     , LEAST(10, 20, 30)    ����������
FROM   DUAL;

--���ں��� �ѱ��� ŭ
SELECT GREATEST('������', 256, '�۾���') ����ū��
     , LEAST('������', 256, '�۾���')    ����������
FROM   DUAL;

--P.198
--ȸ��(MEMBER) ���̺��� ȸ���̸�(MEM_NAME),  
--���ϸ���(MEM_MILEAGE)�� ����Ͻÿ�
--(��, ���ϸ����� 1000���� ���� ��� 1000���� ����)

select mem_name  ȸ���̸�
      ,mem_mileage  ���ϸ���
      ,greatest(mem_mileage,1000)  ���ϸ���1õ����
from member;

---p. 198
-- round : �ݿø�, trunc :  ����
---- 2 : �Ҽ� ��°�ڸ����� �츮��
---- -2 : �Ҽ� ��°�ڸ����� �ݿø�

SELECT ROUND (345.123, -2)  ��� FROM DUAL;
SELECT ROUND (345.123, -1)  ��� FROM DUAL;
SELECT ROUND (345.123, -0)  ��� FROM DUAL;
SELECT ROUND (345.123, 1)  ��� FROM DUAL;
SELECT ROUND (345.123, 2)  ��� FROM DUAL;

--����� �츮��, �����鿡��
SELECT TRUNC(345.123, 0) ��� FROM DUAL;
SELECT TRUNC(345.123, 1) ��� FROM DUAL;
SELECT TRUNC(345.123, 2) ��� FROM DUAL;
SELECT TRUNC(345.123, -1) ��� FROM DUAL;
SELECT ROUND(345.123, -1) ���1,
      TRUNC(345.123, -1) ���2 FROM DUAL;


-- ȸ�����̺��� ���ϸ����� 12�� ���� ���� �˻�
-- (�Ҽ�2°�ڸ� �츮�� �ݿø�, ����)

SELECT ROUND((mem_mileage/12), 2) ���
FROM MEMBER;

SELECT MEM_MILEAGE /12  ���1
      ,ROUND(MEM_MILEAGE /12, 2) �츮��ݿø� 
      ,TRUNC(MEM_MILEAGE /12, 2) ����
FROM MEMBER;

--P.198
--��ǰ���̺��� ��ǰ��, ������( ���԰� / �ǸŰ� )��  ����(%)��
--(�ݿø� ���� �Ͱ� �Ҽ� ù°�ڸ� �츮�� �ݿø� ��) �˻��Ͻÿ� ?
--(Alias�� ��ǰ��, ������1, ������2)

SELECT PROD_NAME  ��ǰ��
      ,PROD_SALE  �ǸŰ�
      ,PROD_COST  ���԰�
      , ROUND((PROD_COST/PROD_SALE  ) *100, 1) ������1
      , ((PROD_COST/PROD_SALE  ) *100) ������2     
FROM PROD;

----P.198 MOD : ���������ϱ�
--- int nameuji = 10 % 3; java
--- 
SELECT MOD(10,3) FROM DUAL;

--ȸ�����̺�(MEMBER)�� ���ϸ����� 12�� ���� �������� ���Ͻÿ�
--ALIAS�� ȸ��ID(MEM_ID), ȸ����(MEM_NAME), 
--���ϸ�������(MEM_MILEAGE), ���ϸ������(MEM_MILEAGE)

SELECT 
       MEM_ID ȸ��ID
      ,MEM_NAME ȸ����
      , MEM_MILEAGE  ���ϸ�������
      ,MOD(MEM_MILEAGE, 12) ���ϸ������
FROM MEMBER;

--P.198
-- FLOOR : ����(����ٴ�) 
-- CEIL : �ø�(õ��)
SELECT FLOOR(1332.69), CEIL(1332.69) FROM DUAL;
SELECT FLOOR(-1332.69), CEIL(-1332.69) FROM DUAL;
SELECT FLOOR(2.69), CEIL(2.69) FROM DUAL;
SELECT FLOOR(-2.69), CEIL(-2.69) FROM DUAL;

--����
--  -3.141592�� ����(FLOOR)�� �ø�(CEIL)�� ���Ͻÿ�
--ALIAS : ����, ����, �ø�

SELECT -3.141592 ����
      ,FLOOR(-3.141592) ����
      ,CEIL(-3.141592) �ø�
    FROM DUAL;
    
--- SYSDATE �ڡڡڡڡ�
--- �ý��۳�¥�� ��-��-�� ��:��:��
SELECT SYSDATE FROM DUAL;
--- �ý��۳�¥�� ��-��-�� ��:��:��.1000���� 1��
SELECT SYSTIMESTAMP FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS')
      , SYSDATE -1
      , SYSDATE +1
      FROM DUAL;
      
--P.199
--ȸ�����̺�(MEMBER)�� ���ϰ� 
--12000��° �Ǵ� ���� �˻��Ͻÿ� ?
--(Alias�� ȸ����(MEM_NAME), 
--����(MEM_BIR), 12000��°)

SELECT  MEM_NAME ȸ����
      , MEM_BIR  ȸ������
      ,MEM_BIR + 12000 "12000�ϻ���"
      , TO_CHAR(MEM_BIR +12000, 'YYYY-MM-DD HH:MI:SS AM')
FROM MEMBER;


--���� �� ���� �������>
SELECT TO_DATE('1999-09-02') ������
      ,ROUND(SYSDATE - TO_DATE('1995-09-03'),1)  �������ϼ�
FROM DUAL;

-- ���ϱ⳪ ������, ���ϱ�� �ȵǰ� ��¥���� ��¥�� ������ �մ� 

--���� : ���� �� ���� ��Ҵ°�? TO_DATE('2015-04-10')�Լ� �̿�
--��, ���� �Ϸ翡 3���� ����.
--      �Ҽ��� 2°�ڸ����� �ݿø��Ͽ� ó���Ͻÿ�.
--ALIAS : ������, ���ϼ�, �������, 
--��������(�ѳ��� 3000������ ó��)

SELECT TO_DATE('1995-09-03') ����
      ,ROUND(SYSDATE - TO_DATE('1995-09-03'),2) �������ϼ�
      ,ROUND(SYSDATE - TO_DATE('1995-09-03'),2)*3  ��
      ,ROUND((SYSDATE - TO_DATE('1995-09-03'))*3*3000,2)  �䰪
      FROM DUAL;


--P.199
--ADD_MONTHS() �Լ� : ���� ���� ��¥
-- ���ú��� 5�� ���� ��¥
SELECT ADD_MONTHS(SYSDATE, 5) FROM DUAL;

---NEXT_DAY() : ���� ���� ������ ��¥
---LAST_DAY() : ���� ������ ��¥.
SELECT NEXT_DAY(SYSDATE, '������')
      ,NEXT_DAY(SYSDATE, '�ݿ���')
      ,LAST_DAY(SYSDATE)
    FROM DUAL;
    

--�̹����� ��ĥ�� ���Ҵ��� �˻��Ͻÿ�?
--ALIAS : ���ó�¥, �̴޸�������¥, �̹��޿�������¥   

SELECT  SYSDATE ���ó�¥
       ,LAST_DAY(SYSDATE) ��������¥
       ,LAST_DAY(SYSDATE) - SYSDATE  ������¥
FROM DUAL;

--P.200
-- ��¥ ROUND/TRUNC
-- FMT(FORMAT : ����) : YEAR(����), MONTH(��), DAY(����), DD(��)...
SELECT ROUND(SYSDATE, 'MM') --- �̹����� 50%�Ѿ����Ƿ� 7��1��
      ,TRUNC(SYSDATE, 'MM') --- �̹����� 50%�ȳѾ����Ƿ� ������ 6��1��
      FROM DUAL;
      
SELECT ROUND(SYSDATE, 'YEAR') --- �̹����� 50%�ȳѾ����Ƿ� 1��1��
      ,TRUNC(SYSDATE, 'YEAR') --- �̹����� 50%�ȳѾ����Ƿ� ������ 1��1��
      FROM DUAL;
      
--P.200
--MONTHS_BETWEEN : �� ��¥ ������ �޼��� ���ڷ� ����
SELECT MONTHS_BETWEEN
       (SYSDATE, '1995-09-03')
       FROM DUAL;
      
      
----P.200
--EXTRACT �ڡڡ� : ��¥���� �ʿ��� �κи� ����
--(FMT : YEAR(��), MONTH(��), DAY(��), HOUR(��), MINUTE(��), SECOND(��)
SELECT EXTRACT(YEAR FROM SYSDATE) �⵵
      ,EXTRACT(MONTH FROM SYSDATE) ��
      ,EXTRACT(DAY FROM SYSDATE) ��
      ,EXTRACT(HOUR FROM SYSTIMESTAMP)-3 ��
      ,EXTRACT(MINUTE FROM SYSTIMESTAMP) ��
      ,EXTRACT(SECOND FROM SYSTIMESTAMP) ��
       FROM DUAL;
       
--��-��-�� ��:��:��.�и�������
SELECT TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH:MI:SS.FF3')
FROM DUAL;
--------------------
--������ 3���� ȸ���� �˻��Ͻÿ�
--(ALIAS : ȸ��ID(MEM_ID), 
-- ȸ����(MEM_NAME), ����(MEM_BIR))

SELECT MEM_ID ȸ��ID
      ,MEM_NAME ȸ���̸�
      ,MEM_BIR ����
            
FROM MEMBER
WHERE EXTRACT(MONTH FROM MEM_BIR) =3

AND MEM_BIR LIKE '%/03/%'
AND SUBSTR(MEM_BIR, 4, 2) = '03';

--����
--�԰��ǰ(BUYPROD) �߿� 3�� �� �԰�� ������ �˻��Ͻÿ�
--ALIAS : ��ǰ�ڵ�(BUY_PROD), �԰�����(BUY_DATE)
--, ���Լ���(BUY_QTY), ���Դܰ�(BUY_COST)
--EXTRACT ����ϱ�, SUBSTR ����ϱ�, LIKE ����ϱ�

SELECT BUY_PROD ��ǰ�ڵ�
      ,BUY_DATE �԰�����
      ,BUY_QTY ���Լ���
      ,BUY_COST ���Դܰ�
      ,BUY_PROD �԰��ǰ
FROM BUYPROD  �԰��ǰ
WHERE EXTRACT(MONTH FROM BUY_DATE) =3
AND SUBSTR(BUY_DATE, 4, 2) ='03'
AND BUY_DATE LIKE '%/03/%';


--P.201 CAST
-- CAST : ����� �� ��ȯ
-- CHAR(30) : �������̹�������ȯ
-- VARCHAR2(30) : �������̹�������ȯ
SELECT '[' || 'Hello' || ']' "����ȯ"
      ,'[' || CAST('Hello' as char(30)) || ']' �������̹�������ȯ
      ,'[' || cast('Hello' as varchar2(30)) || ']' �������̹�������ȯ
      from dual;
      
---�ڡڡ�
---TO_DATE() :  ��¥�� ���ڸ� ��¥������ ����ȯ
--CAST() : ��¥�� ���ڸ� ������ ������ ����ȯ
-- '2022/05/17' +1 : ��¥�� ���� + ���� �� --> ��¥�� ���ڰ� ���ڷ� �ڵ�����ȯ.
 SELECT '2022/05/17'  -- ���⿡ +1�� �ϰԵǸ� �������̱� ������ ������ ����Ƿ� ���������� �ٲ� �����
      ,TO_DATE('2022/05/17') +1
      ,CAST('2022/05/17' AS DATE) +1
      FROM DUAL;


---P.201 
--- TO_CHAR() : ����/����/��¥�� ������ ������ ���ڿ��� ��ȯ
--- ���� ��¥�� �̷��� ������ ���ڿ��� ��ȯ

SELECT TO_CHAR(SYSDATE, 'AD YYYY, CC"����" ')
FROM DUAL;

---���� �߻�
SELECT TO_CHAR('2008-12-25','YYYY.MM.DD HH24:MI:SS')
FROM DUAL;

--TO_DATE �ڡڡڡ� : 2008-12-25 �� ��-��-�� ������ ��¥�� ���ڶ�� ��Ŭ�̿��� �˷���
SELECT TO_CHAR(TO_DATE('2008-12-25','YYYY.MM.DD'),'YYYY.MM.DD HH24:MI:SS')
FROM DUAL;

SELECT TO_CHAR(CAST('2008-12-25'AS DATE),'YYYY.MM.DD HH24:MI:SS')
FROM DUAL;

---P.202
--P.202
--��ǰ���̺��� ��ǰ�԰����� '2008-09-28 12:00:00' 
--�������� ������ �˻��Ͻÿ�.
--(Alias ��ǰ��(PROD_NAME), ��ǰ�ǸŰ�(PROD_SALE)
--, �԰���(PROD_INSDATE))
-- '2008-09-28 12:00:00' ��¥������ ����
SELECT PROD_NAME  ��ǰ��
      ,PROD_SALE ��ǰ�ǸŰ�
      ,PROD_INSDATE �԰���
      ,TO_CHAR(PROD_INSDATE, 'YYYY-MM-DD HH:MI:SS') ��ǰ�԰��� --��¥���̱� ������ TO_ DATE�� �ʿ����
FROM PROD;

--�����
--ȸ�� ���̺��� ����Ͽ� ����ó�� ����غ���
--ALIAS : ȸ��ID(MEM_ID), ȸ����(MEM_NAME), ȸ������(MEM_BIR)
--ȸ�������� '1985-03-02 12:00:00' �������� ���
--YY : 2�ڸ����� , MON : 1��, HH24 : 24�ð�����, AM: ����/����

--���� ����
SELECT MEM_ID  ȸ��ID
      ,MEM_NAME ȸ����
      ,MEM_BIR ȸ������
     ,TO_CHAR(MEM_BIR, 'YYYY-MM-DD HH:MI:SS') �����Ļ���
     FROM MEMBER;



--������
--��ٱ��� ���̺��� ����Ͽ� ����ó�� ����غ���
--ALIAS : ��ٱ��Ϲ�ȣ, �����Ͻ�
--�����Ͻô� '2005-04-03 12:00:00' �������� ���
SELECT CART_NO ��ٱ��Ϲ�ȣ
     , TO_CHAR(TO_DATE(SUBSTR(CART_NO,1,8), 'YYYYMMDD'), 'YYYY-MM-DD HH:MI:SS') �����Ͻ�
FROM   CART;

----06.21---
--P.020
-- TO_CHAR() �Լ� �� ���ڸ� ���ڷ� ����ȯ
SELECT 1234.6 +0.4 FROM DUAL;

SELECT TO_CHAR(1234.6,'L9,999.00')
FROM DUAL;

SELECT TO_CHAR(-1234.6, 'L9999.00PR')
      ,TO_CHAR(-1234.6, 'L9999.00MI')
      FROM DUAL;
--����
--��ǰ �ǸŰ��� ������ ���� �������� ����Ͻÿ�
--��230,000
--ALIAS : ��ǰID(PROD_ID), ��ǰ��(PROD_NAME)
--, �ǸŰ�(PROD_SALE)

SELECT PROD_ID ��ǰID
       ,PROD_NAME ��ǰ��
       ,TO_CHAR(PROD_SALE, 'L99,999,999') �ǸŰ�

FROM PROD;

--P.203
--��ǰ���̺��� ��ǰ�ڵ�, ��ǰ��, ���԰���, 
-- �Һ��ڰ���, �ǸŰ����� ����Ͻÿ�. 
-- (��, ������ õ���� ���� �� ��ȭǥ��)

SELECT  PROD_ID  ��ǰ�ڵ�
       ,PROD_NAME ��ǰ��
       ,TO_CHAR(PROD_COST, 'L9,999,999') ���԰�
       ,TO_CHAR(PROD_SALE, 'L9,999,999') �ǸŰ�
       ,TO_CHAR(PROD_PRICE, 'L9,999,999') �Һ��ڰ���
FROM PROD;

--����
--�������̺�(BUYPROD)�� ���԰��� ���
--AVG(PROD_COST)�� ���� �������� ���
--�Ҽ��� 2��° �ڸ����� �츮�� �츮��~ �ݿø�ó��
--��210,000.350
--��ǥ�� : �� + ����Ű
    
SELECT TO_CHAR(ROUND(AVG(BUY_COST),2), 
       'L999,999.000')    ���԰����
FROM BUYPROD; 

---P.203
--TO_NUMBER : ���������� ���ڿ� -> ���ڷ� ��ȯ
--������ ���� + ���� -> ���ڷ� �ڵ�����ȯ + ���� ->������ ���
SELECT '3.1415' + '1' FROM DUAL;


--������ ���� (O)->��������ȯ
SELECT TO_NUMBER('3.1515')  FROM DUAL;

--���� (O)->��������ȯ(X)
--SELECT TO_NUMBER('��1,200')+ 1  FROM DUAL; --����
SELECT TO_NUMBER('��1,200','L999,999')+ 1  FROM DUAL; --�����ذ�
SELECT TO_CHAR('1200','L999,999') FROM DUAL;

--���� (O)->��������ȯ(X)
SELECT TO_NUMBER('������') + 1 FROM DUAL; -- ����

--P.203
--ȸ�����̺�(MEMBER)���� �̻���ȸ��(MEM_NAME='�̻���')��
--ȸ��Id 2~4 ���ڿ��� ���������� ġȯ�� �� 
--10�� ���Ͽ� ���ο� ȸ��ID�� �����Ͻÿ� ?
--(Alias�� ȸ��ID(MEM_ID), ����ȸ��ID)

SELECT MEM_ID   ȸ��ID
      ,SUBSTR(MEM_ID,1,1)
      || TRIM(TO_CHAR(TO_NUMBER(SUBSTR(MEM_ID,2)) + 10, '000'))
FROM MEMBER
WHERE MEM_NAME='�̻���';

--��ǰ���̺�(PROD)����
--��ǰ�ڵ�(PROD_ID)�� 'P101000001'�� �����͸�
--���������� 1 �������Ѻ���. 
--P101000002
--ALIAS : ��ǰ�ڵ�, ������ǰ�ڵ�

SELECT PROD_ID ��ǰ�ڵ�
,SUBSTR(PROD_ID,1,1)
      ||TO_CHAR(TO_NUMBER(SUBSTR(PROD_ID,2))+1) ������ǰ�ڵ�
FROM PROD
WHERE PROD_ID = 'P101000001';

--������ Ǯ��
SELECT PROD_ID ��ǰ�ڵ�
      ,SUBSTR(PROD_ID,1,4)
      || TRIM(TO_CHAR(SUBSTR(PROD_ID,5)+1 , '000000')) ������ǰ�ڵ�
FROM PROD;

--P.203
--TO_DATE : ��¥���� ���ڿ��� DATE ������ ��ȯ
SELECT '2009-03-05'+3 FROM DUAL; -- �������̱� ������ ������

SELECT TO_DATE('2009-03-05') + 3 FROM DUAL;

--��Ŭ�� �̰� ��¥�����ھ�
--2009��  YYYY�̰�, 03�� MM, 05�� DD�� ��� �˷���
SELECT TO_DATE('2009-03-05', 'YYYY-MM-DD') + 3 FROM DUAL;


---������(O)= ��(TO_CHAR) ��(���) ��(����) O
---������(X)  ��(TO_CHAR) ��(���) ��(����) X
---������(X)  ��(TO_CHAR) ��(���) ��(����) X
SELECT TO_CHAR('200803101234' , 'YYYY-MM-DD HH24:MI';) 
FROM DUAL;


------O
SELECT TO_DATE('2008-03-10') + 3 FROM DUAL;

------X
SELECT TO_DATE('200803101234') + 3 FROM DUAL;

--��Ŭ������ �˷���
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


--(O) : ��¥�������̹Ƿ�.(��.��.�� / ��/��/�� / ��-��-��)
SELECT TO_DATE('2021.12.25') FROM DUAL;
--(X) : 11:10 ������ �ν� �ȵ�
SELECT TO_DATE('2021.12.25 11:10') FROM DUAL;
--(O) : �̷� �� ��Ŭ�̿��� �˷���� ��
SELECT TO_DATE('2021.12.25 11:10','YYYY.MM.DD HH:MI') FROM DUAL;
--(O) : ��¥�������̹Ƿ�.(��.��.�� / ��/��/�� / ��-��-��)
SELECT TO_DATE('2021/12/25') FROM DUAL;
--(X) : '2021/12/25'�� ��¥�������̹Ƿ�
SELECT TO_CHAR('2021/12/25','YYYY/MM/DD') FROM DUAL;
--(O) : TO_DATE('2021/12/25')�� ��¥���̹Ƿ�
SELECT TO_CHAR(TO_DATE('2021/12/25'),'YYYY/MM/DD') FROM DUAL;
--SELECT TO_CHAR(���׶��, 'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(TO_DATE('2021.12.25 11:10','YYYY.MM.DD HH:MI'),'YYYY/MM/DD') FROM DUAL;

---P.203
--P.204
--ȸ�����̺�(MEMBER)���� �ֹε�Ϲ�ȣ1(MEM_REGNO1)��
--��¥�� ġȯ�� �� �˻��Ͻÿ�
--(Alias�� ȸ����(MEM_NAME), �ֹε�Ϲ�ȣ1, 
--ġȯ��¥(MEM_REGNO1 Ȱ��)

SELECT  MEM_NAME ȸ����
      ,MEM_REGNO1 �ֹε�Ϲ�ȣ1
      ,TO_DATE( MEM_REGNO1, 'YY-MM-DD') ġȯ��¥
FROM MEMBER;

--��ٱ��� ���̺�(CART)���� ��ٱ��Ϲ�ȣ(CART_NO)��
--��¥�� ġȯ�� �� ������ ���� ����ϱ�
--2005�� 3�� 14��
--ALIAS : ��ٱ��Ϲ�ȣ, ��ǰ�ڵ�, �Ǹ���, �Ǹż�


SELECT CART_PROD ��ǰ�ڵ�
      ,CART_NO  ��ٱ��Ϲ�ȣ 
      SUBSTR(CART_NO 1,8) ||
      TO_CHAR(TO_DATE(CART_NO, 'YYYYMMDD'), 'YYYY"��"MM"��"DD"��"')) �Ǹ���

FROM CART;


SELECT CART_NO      ��ٱ��Ϲ�ȣ
      ,CART_PROD        ��ǰ�ڵ�
      ,TO_CHAR(TO_DATE(SUBSTR(CART_NO, 1,8),'YYYYMMDD'), 'YYYY"�� "MOMDD"��"')     �Ǹ���
      ,CART_QTY  �Ǹż�
FROM CART;

---------������ Ǯ��---------
SELECT CART_NO ��ٱ��Ϲ�ȣ
     , CART_PROD ��ǰ�ڵ�
     , TO_CHAR(TO_DATE(SUBSTR(CART_NO,1,8),'YYYYMMDD'),'YYYY"�� "MONDD"��"') �Ǹ���
     , CART_QTY �Ǹż�
FROM   CART;

-----06.22 P.204-----

--ȯ��(NULL)
--�ƹ��͵� ���� ���� ����
--SQL���� NULL ���� ������� �ʴ� �Ӽ��� ���� NULL ������ �����Ϸ� �Ѵٸ� ������ �߻��Ѵ�,
-- ' ' �̰Թٷ� NULL �� ����

--�ŷ�ó ����� ������ '��'�̸� NULL�� ����
SELECT BUYER_NAME �ŷ�ó��
      ,BUYER_CHARGER �����
FROM BUYER
WHERE BUYER_CHARGER LIKE '��%';

---������Ʈ
UPDATE BUYER
SET BUYER_CHARGER = NULL
WHERE BUYER_CHARGER LIKE '��%';

--�ŷ�ó ����� ������ '��'�̸� White Space�� ����
--White Space : '' = null

SELECT BUYER_NAME �ŷ�ó��
      ,BUYER_CHARGER �����
FROM BUYER
WHERE BUYER_CHARGER LIKE '��%';

UPDATE BUYER
SET BUYER_CHARGER = ''
WHERE BUYER_CHARGER LIKE '��%';

--����ڰ� NULL�� �����͸� �˻�
SELECT BUYER_NAME �ŷ�ó��
      ,BUYER_CHARGER �����
FROM BUYER
WHERE BUYER_CHARGER IS NULL;

--����ڰ�NULL�� �ƴ� �����͸� �˻�
SELECT BUYER_NAME �ŷ�ó��
      ,BUYER_CHARGER �����
FROM BUYER
WHERE BUYER_CHARGER IS NOT NULL;

-- �ڡڡ�NVL�� �̿� NULL�� ��� �� '����'�� ġȯ

SELECT BUYER_NAME �ŷ�ó��
      ,NVL(BUYER_CHARGER, '����') �����
FROM BUYER;

--P.206
--��üȸ�� ���ϸ����� 100�� ���Ѽ�ġ�� �˻�
--ALIAS ����, ���ϸ���, ���渶�ϸ���

SELECT MEM_NAME ����
      ,MEM_MILEAGE ���ϸ���
      ,MEM_MILEAGE +100  ���渶�ϸ���
FROM MEMBER;


--ȸ�� ���� '��'�� �����ϸ� ���ϸ����� NULL�� ����

SELECT MEM_NAME   ����
      ,MEM_MILEAGE   ���ϸ���
FROM MEMBER
WHERE MEM_NAME >= '��' AND MEM_NAME <= '��';

UPDATE MEMBER
SET MEM_MILEAGE = NULL
WHERE MEM_NAME >= '��' AND MEM_NAME <= '��';


--P.206

SELECT NULL + 10 ����
      , 10*NULL ����
      , 10/NULL ������
      , NULL - 10 ����
      FROM DUAL;
      
      
--ȸ�� ���ϸ����� 100�� ���� ��ġ�� �˻�
--ALIAS : ���� ���ϸ��� ���渶�ϸ���

SELECT MEM_NAME  ����
       ,MEM_MILEAGE ���ϸ���
      ,NVL(MEM_MILEAGE, 0) + 100 ���渶�ϸ���
FROM MEMBER;

--ȸ�� ���ϸ����� ������ ����ȸ��
--NULL �̸� '������ȸ��' ���� �˻�

SELECT MEM_NAME  ����
       ,MEM_MILEAGE ���ϸ���
      ,NVL2(MEM_MILEAGE, '����ȸ��', '������ȸ��')  ȸ������
FROM MEMBER;

--P. 207
SELECT NULLIF(123, 123) AS "���� ��� NULL ��ȯ"
      ,NULLIF(123, 1234) AS "�ٸ� ��� ���μ� ��ȯ"
      ,NULLIF('A','B') AS " �ٸ���� ���μ� ��ȯ"
      FROM DUAL;
      
      --�ھ���� :   �Ķ���� ��  NULL�� �ƴ� ù�� ° �Ķ���� ��ȯ
      SELECT COALESCE(NULL, NULL, 'Hello', null, 'world')
      from dual;
      
---------------------�ڡڡڡڡ�DECODE�ڡڡڡڡڡ�---------
SELECT DECODE (6
              ,10, 'A'
              ,9, 'B'
              ,8, 'C'
              , 'D')
FROM DUAL;

SELECT PROD_LGU
      ,SUBSTR(PROD_LGU,1,2) �յ��ڸ�
      ,DECODE(SUBSTR(PROD_LGU, 1,2)
      , 'P1', '��ǻ��/���� ��ǰ'
      , 'P2', '�Ƿ�'
      , 'P3', '��ȭ'
      , '��Ÿ' ) ���
FROM PROD;

--P.208
--��ǰ �з�(PROD_LGU) ��  ���� �� ���ڰ�  'P1' �̸� 
--�ǸŰ�(PROD_SALE)�� 10%�λ��ϰ�
--'P2' �̸� �ǸŰ��� 15%�λ��ϰ�,  
--�������� ���� �ǸŰ��� 
--�˻��Ͻÿ� ? 
--(DECODE �Լ� ���, 
--Alias�� ��ǰ��(PROD_NAME), �ǸŰ�(PROD_SALE), �����ǸŰ� )

SELECT PROD_NAME ��ǰ��
       ,PROD_LGU ��ǰ�з�
       ,PROD_SALE �ǸŰ�
      ,SUBSTR(PROD_LGU, 1,2) 
      ,DECODE(SUBSTR(PROD_LGU, 1,2) 
      , 'P1' , PROD_SALE *1.1   
      , 'P2' , PROD_SALE *1.15  
      , PROD_SALE)�����ǸŰ�
FROM PROD;

--��������翡���� 3���� ������(MEM_BIR) ȸ����
--������� ���ϸ����� 10% �λ����ִ� �̺�Ʈ��
--�����ϰ��� �Ѵ�. ������ 3���� �ƴ� ȸ����
--¦���� ��츸 5% �λ� ó���Ѵ�.
--�̸� ���� SQL�� �ۼ��Ͻÿ�.
--ALIAS : ȸ��ID, ȸ����, ���ϸ���, ���渶�ϸ���

SELECT MEM_ID ȸ��ID
      ,MEM_NAME  ȸ����
      ,MEM_BIR ȸ������
      ,MEM_MILEAGE ���ϸ���
      ,DECODE(SUBSTR(MEM_BIR, 4,2) AND EXTRACT('03')
      , '03' , MEM_MILEAGE*1.1 
      , MEM_MILEAGE )   ���渶�ϸ���
      
      ,DECODE(SUBSTR(MEM_BIR, 4,2)
      ,MEM_MILEAGE*1.05)
      ,MEM_MILEAGE
      
FROM MEMBER;

---
SELECT MEM_ID ȸ��ID
      ,MEM_NAME  ȸ����
      ,MEM_MILEAGE ���ϸ���
      ,EXTRACT(MONTH FROM MEM_BIR) ȸ������
      ,DECODE(EXTRACT(MONTH FROM MEM_BIR)
      , 3 , MEM_MILEAGE*1.1
      ,DECODE(MOD(EXTRACT(MONTH FROM MEM_BIR),2)
      , 0 , MEM_MILEAGE *1.05
      , MEM_MILEAGE)
      )        ���渶�ϸ���
FROM MEMBER;     


---CASE ��
SELECT CASE WHEN '��' = '��' THEN '�´�'
    ELSE '�ƴϴ�'
    END AS "RESULT"
    FROM DUAL;

----SIMPLE CASE EXPRESSION    
SELECT CASE '��' WHEN 'öȣ' THEN '�ƴϴ�'
                 WHEN '��'   THEN '�ƴϴ�'
                 WHEN '��'   THEN '�´�'
                 ELSE '�𸣰ڴ�'
        END RESULT
    FROM DUAL;


--SEARCHED CASE EXPRESSION    
SELECT CASE  WHEN '��' = 'öȣ' THEN '�ƴϴ�'
            WHEN '��' = '��' THEN '�ƴϴ�'
            WHEN '��' = '��' THEN '�´�'
                 ELSE '�𸣰ڴ�'
        END RESULT
    FROM DUAL;    

SELECT PROD_NAME ��ǰ, PROD_LGU �з�,
    CASE WHEN PROD_LGU = 'P101' THEN '��ǻ����ǰ'
         WHEN PROD_LGU = 'P102' THEN '������ǰ'
         WHEN PROD_LGU = 'P201' THEN '����ĳ���'
         WHEN PROD_LGU = 'P202' THEN '����ĳ���'
         WHEN PROD_LGU = 'P301' THEN '������ȭ'
         WHEN PROD_LGU = 'P302' THEN 'ȭ��ǰ'
         WHEN PROD_LGU = 'P401' THEN '����/CD'
         WHEN PROD_LGU = 'P402' THEN '����'
         WHEN PROD_LGU = 'P403' THEN '������'
        ELSE '�̵�Ϻз�'
    END "��ǰ�з�"
FROM PROD;

--10���� �ʰ� ��ǰ �ǸŰ� ���ݴ�
SELECT PROD_NAME AS "��ǰ"
    ,PROD_PRICE AS "�ǸŰ�"
    , CASE WHEN (100000 - PROD_PRICE) >=0  THEN '10���� �̸�'
           WHEN (200000 - PROD_PRICE) >=0  THEN '10������'
           WHEN (300000 - PROD_PRICE) >=0  THEN '20������'
           WHEN (400000 - PROD_PRICE) >=0  THEN '30������'
           WHEN (500000 - PROD_PRICE) >=0  THEN '40������'
           WHEN (600000 - PROD_PRICE) >=0  THEN '50������'
           WHEN (700000 - PROD_PRICE) >=0  THEN '60������'
           WHEN (800000 - PROD_PRICE) >=0  THEN '70������'
           WHEN (900000 - PROD_PRICE) >=0  THEN '80������'
           WHEN (1000000 - PROD_PRICE) >=0  THEN '90������'
            ELSE '100���� �̻�'
        END "���ݴ�"
    FROM PROD
    WHERE PROD_PRICE > 100000;

-- ȸ���������̺��� �ֹε�� ���ڸ�(7�ڸ� �� ù°�ڸ�)���� ������ ���Ͻÿ�?
-- (CASE ���� ���, ALIAS ȸ����,�ֹε�Ϲ�ȣ(�ֹ�1-�ֹ�2), ����
--------------06.23-------------------
SELECT MEM_ID ȸ��ID 
      ,MEM_NAME ����
      ,MEM_REGNO2 �ֹ�2
      ,MEM_REGNO2 ����
      , CASE SUBSTR(MEM_REGNO2,1,1) WHEN '1' THEN '����'
                                WHEN '2' THEN '����'
                                ELSE '��Ÿ'
      END ����_SIMPLE
      , CASE WHEN SUBSTR(MEM_REGNO2,1,1) IN ('1' , '3') THEN '����'
             WHEN SUBSTR(MEM_REGNO2,1,1) IN ('2' , '4') THEN '����'
      END ����_SEARCHED       
FROM MEMBER;
      
      
--Ʈ�����(Transaction)
--�����ͺ��̽��� �����ϱ� ���� ����Ǿ�� ��
--���� ����, �������� SQL�� �����Ǿ�����
--���ڼ� : ALL or Nothing. ��ü ���� �Ǵ� ��ü ���� �ȵ�. (ALL : ��������ó�� , NOthing : �ǵ��ư�)
-- �ϰ��� : �����ͺ��̽��� ������ �� ������ ���ٸ� ������ ���� ������ ����.
-- ���� : ���� �� Ÿ Ʈ����ǿ� �������� ����� ������ �߻��ؼ��� �ȵ�.
-- ���Ӽ� : �����ϸ� ����� ���ӵ�.

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

--���� ��ġ �˻�--
SELECCT*FROM USER_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'PK_TEST1';

UPDATE TEST1
SET DEPTNO = 20;

UPDATE TEST1
SET LOC = 'SEOUL'
WHERE DNAME = 'SALES';

--��Ǫ������
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


--LPROD���̺� ����  -> LPROD2  ���̺����
--1. ��Ű�� : �÷�, �ڷ���, ũ�� N.N �������
--2. ������
--3. �� P.K, F.K�� ������ �ȵ�

CREATE TABLE LPROD2
AS
SELECT * FROM LPROD;

SELECT * FROM LPROD2;

--1)
UPDATE LPROD2
SET LPROD_ID = 7;

--2)
UPDATE LPROD2
SET LPROD_NM = '�̻�'
WHERE LPROD_GU = 'P302';

--3)
DELETE FROM LPROD2
WHERE LPROD_GU = 'P403';

--4) LPROC �� ������ �����߻� �׽� ���� 3�������� �ڵ����� Ŀ���̵�.
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
SET LPROD_NM = '�̻�'
WHERE LPROD_GU = 'P302';

--3)
DELETE FROM LPROD2
WHERE LPROD_GU = 'P403';


--P.218
--SAVEPOINT : Ʈ����� �߰�����
--COMMIT : ��������� �����ͺ��̽��� �ݿ�
--Ʈ������� ����ʰ� ���ÿ�
--���ο� Ʈ������� ���۵�.

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
--��Ÿ������ : ������(�������̴µ�����)�� ���� ������(�÷�, �ڷ���, ũ��, �������)
--�����ͻ���? ��Ÿ������ ������ ����
--Dictionary �信�� 'ALL'�� �����ϴ� ��� ���̺� ��ȸ
SELECT TABLE_NAME
      ,COMMENTS
FROM DICTIONARY
WHERE TABLE_NAME LIKE 'ALL_%';

SELECT *FROM ALL_CONSTRAINTS;
SELECT *FROM ALL_USERS;

--����α����� �����(����)�� ���� ��� ��ü ������ ���
SELECT OBJECT_NAME
      ,OBJECT_TYPE
      ,CREATED
FROM ALL_OBJECTS
WHERE OWNER = 'PC11' --����� ������ �̸��� �빮�ڷ� �ؾߵ�
ORDER BY OBJECT_TYPE ASC;

--�� ���̺�(������ ���ٰ����� ...)�� ��ü ���ڵ� ������ ��� (���̺�� ,���ڵ� ��)
SELECT TABLE_NAME ���̺��
      ,NUM_ROWS "���ڵ� ��"
FROM USER_TABLES;

--USER_CONSTRAINTS,
--USER_CONS_COLUMNS�� �÷� �󼼸� Ȯ���ϰ�
--��ǰ ���̺��� ���������� ����Ͻÿ�?
--(�÷���, �����, Ÿ��, ���೻��)
SELECT B.COLUMN_NAME �÷���
      ,A.CONSTRAINT_NAME �����
      ,A.CONSTRAINT_TYPE Ÿ��
      ,A.SEARCH_CONDITION ���೻��
FROM USER_CONSTRAINTS A, USER_CONS_COLUMNS B
WHERE A.TABLE_NAME = B.TABLE_NAME
AND   A.TABLE_NAME = 'LPROD';

--���̺��� ����
SELECT S1.TABLE_NAME AS �������̺��,
         COMMENTS AS �����̺��,
         TABLESPACE_NAME AS ���̺����̽���,
         NUM_ROWS AS ROW��,     --- analize �� �ؾ� ��Ȯ�� Row���� ��´�.
         LAST_ANALYZED AS  �����м�����,
         PARTITIONED AS ��Ƽ�ǿ���
FROM USER_TABLES S1,
        USER_TAB_COMMENTS S2
WHERE S1.TABLE_NAME = S2.TABLE_NAME       
  AND S2.TABLE_TYPE  = 'TABLE'    -- VIEW (��, ���̺� ���� SELECT 
  AND TABLESPACE_NAME IS NOT NULL --PLAN TABLE ���� ���� ����
ORDER BY  S1.TABLE_NAME;

--���̺�, �÷� ��� ����
SELECT A.TABLE_NAME AS TABLE_NAME,
   A.TAB_CMT AS ���̺���,
         A.COLUMN_NAME AS �÷���,
         B.POS AS PK,
         A.COL_CMT AS �÷�����,
         A.DATA_TYPE AS ����������,
         A.�����ͱ���,
         A.NULLABLE AS NULL����,
         A.COLUMN_ID AS �÷�����,
         A.DATA_DEFAULT AS �⺻��
FROM
(SELECT S1.TABLE_NAME,
   S3.COMMENTS AS TAB_CMT,
         S1.COLUMN_NAME,
         S2.COMMENTS AS COL_CMT,
         S1.DATA_TYPE,
         CASE WHEN S1.DATA_PRECISION IS NOT NULL THEN DATA_PRECISION||','||DATA_SCALE
         ELSE TO_CHAR(S1.DATA_LENGTH)
         END  AS �����ͱ���,
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
--ȸ�� ���̵� �������� ���� ���Ǿ� INDEX�� ���
--ROWID :���� ������ȣ
SELECT ROWID
      ,MEM_ID
      ,MEM_NAME
      ,MEM_JOB
      ,MEM_BIR
FROM MEMBER
WHERE MEM_ID = 'a001';

--ȸ�� ������ �������� ���� ���Ǿ�
--INDEX�� ���� -> �˻��ӵ� ����(B-TREE INDEX)
CREATE INDEX IDX_MEMBER_BIR
ON MEMBER(MEM_BIR);

SELECT ROWID
      ,MEM_ID
      ,MEM_NAME
      ,MEM_JOB
      ,MEM_BIR
FROM MEMBER
WHERE MEM_BIR LIKE '75%';

--ȸ�����Ͽ��� �⵵�� �и��Ͽ�
--�ε����� ����(function-based index)
    CREATE INDEX IDX_MEMBER_BIR_YEAR
    ON MEMBER(TO_CHAR(MEM_BIR, 'YYYY'));
    
SELECT MEM_ID
      ,MEM_NAME
      ,MEM_JOB
      ,MEM_BIR
FROM MEMBER
WHERE TO_CHAR(MEM_BIR, 'YYYY') = '1975';

--P.230
--IDX_MEMBER-BIR �ε��� �����ϰ�,
DROP INDEX IDX_MEMBER_BIR;

--IDX_MEMBER_BIR_YEAR �ε����� REBUILD �Ͻÿ�
ALTER INDEX IDX_MEMBER_BIR_YEAR REBUILD;

--P.230
-- INDEX KEY COLUMN�� ������ ���� QUERY�� ��� ����
SELECT BUY_DATE
      ,BUY_PROD
      ,BUY_QTY
FROM BUYPROD
WHERE BUY_DATE - 10 = '2005-02-20';   --�߸��� ����

--�籸��
SELECT BUY_DATE
      ,BUY_PROD
      ,BUY_QTY
FROM BUYPROD
WHERE BUY_DATE  = TO_DATE('2005-02-20')+10;


---06.24
--.243p
--�������̺극�� ������ڵ�, ��ǰ�� ,�з��� ��: �� ������

0--����
--1. �� ���̺� ���̿� p.k, f.x���Ը� ã�ƺ���
--2. ���谡 �ִٸ� FROM���� �� ���̺���� ����
-- �ڷ����� ũ�Ⱑ ����, ���� �����Ͱ� ����
--3. P.K�����Ϳ� F.K�����Ͱ� ���� ��쿡��
-- ����� ����
--4. �÷��� ����. FROM ���� ���̺� ALIAS
select L.LPROD_GU
      ,L.LPROD_NM
      ,P.PROD_LGU
      ,P.PROD_ID
      ,P.PROD_NAME
FROM LPROD L,PROD P
WHERE L.LPROD_GU = P.PROD_LGU;

----ANSIǥ��
select L.LPROD_GU
      ,L.LPROD_NM
      ,P.PROD_LGU
      ,P.PROD_ID
      ,P.PROD_NAME
FROM LPROD L INNER JOIN PROD P
ON (L.LPROD_GU = P.PROD_LGU);

---- BUYER, LPROD ����
SELECT L.LPROD_GU
      ,L.LPROD_NM
      ,B.BUYER_ID
      ,B.BUYER_NAME
      ,B.BUYER_LGU
FROM LPROD L, BUYER B
WHERE L.LPROD_GU = B.BUYER_LGU;

--���� ������ ���� ���� ? īƼ�� ������Ʈ
--���������� ������? EQUI JOIN,  ��������, ��������

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

--3���� ���̺��� �����ϴ� ��
SELECT C.CART_NO
      ,C.CART_PROD
      ,C.CART_QTY
      ,C.CART_MEMBER
      ,P.PROD_NAME
      ,M.MEM_NAME
FROM PROD P, CART C, MEMBER M
WHERE P.PROD_ID = C.CART_PROD
AND   C.CART_MEMBER = M.MEM_ID;

---ANSI ��� 3���̻��϶�
SELECT C.CART_NO
      ,C.CART_PROD
      ,C.CART_QTY
      ,C.CART_MEMBER
      ,P.PROD_NAME
      ,M.MEM_NAME
FROM PROD P INNER JOIN CART C ON (P.PROD_ID = C.CART_PROD)
            INNER JOIN MEMBER M ON (C.CART_MEMBER = M.MEM_ID);


--3�� ���̺� 2������
SELECT  B.BUYER_ID
      , B.BUYER_NAME
      , P.PROD_NAME
      , P.PROD_LGU
      , P.PROD_BUYER
      , L.LPROD_GU
      , L.LPROD_NM
FROM BUYER B, LPROD L, PROD P
WHERE L.LPROD_GU = P.PROD_LGU   --���̺� ������ ������ (���̺� - 1)
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


--4�����̺�
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
SELECT P.PROD_ID  ��ǰ�ڵ�
      ,P.PROD_NAME  ��ǰ��
      ,B.BUYER_NAME  �ŷ�ó��
FROM  PROD P , BUYER B
WHERE P.PROD_BUYER = B.BUYER_ID
AND B.BUYER_NAME LIKE '�Ｚ����%';

---ANSI  �������� �̿��� ������ WHERE �� �ٲ��.
SELECT P.PROD_ID  ��ǰ�ڵ�
      ,P.PROD_NAME  ��ǰ��
      ,B.BUYER_NAME  �ŷ�ó��
FROM  PROD P INNER JOIN BUYER B ON (P.PROD_BUYER = B.BUYER_ID)
WHERE B.BUYER_NAME LIKE '�Ｚ����%';

--P.244
--��ǰ�з��� ������ǰ P102�� ��ǰ�� ��ǰ�ڵ�, ��ǰ��
--�з��� �ŷ�ó���� ��ȸ
--EQUI JOIN

SELECT L.LPROD_ID ��ǰ�ڵ�
      ,P.PROD_NAME ��ǰ��
      ,P.PROD_ID 
      ,B.BUYER_NAME
      
FROM PROD P, BUYER B, LPROD L
WHERE BUYER_ID = PROD_BUYER
AND   LPROD_GU = BUYER_LGU
AND   L.LPROD_NM = '������ǰ'

--ANSI
SELECT L.LPROD_ID ��ǰ�ڵ�
      ,P.PROD_NAME ��ǰ��
      ,P.PROD_ID 
      ,B.BUYER_NAME
      
FROM PROD P INNER JOIN BUYER B ON (BUYER_ID = PROD_BUYER)
            INNER JOIN LPROD L ON (LPROD_GU = BUYER_LGU)
WHERE   L.LPROD_NM = '������ǰ'


---------P.282
--AVG(�÷�)

---06.27----
--<�н���ǥ> �����Լ� = �������Լ�
--1.SUM : �հ�
--2.ARG : ���
--3.MAX : �ִ�
--4.MIN : �ּ�
--5.COUNT : ����

---------P.282
--AVG(�÷�)

SELECT PROD_COST
FROM PROD
ORDER BY 1;

SELECT AVG(DISTINCT PROD_COST)  �ߺ�������
      ,AVG(ALL PROD_COST)   DEFALT��簪
      ,AVG(PROD_COST)  ���԰����
FROM PROD;


--��ǰ���̺��� ��ǰ�з��� ���� ���� ��հ�
SELECT PROD_LGU  ��ǰ�з�
      ,ROUND(AVG(NVL(PROD_COST,0)),2) ���԰�����հ�
FROM PROD
GROUP BY PROD_LGU;  --���´�.

--AVG(NULL '''')) !!


--��ǰ���̺��� �� �ǸŰ��� ��� ���� ���Ͻÿ�
SELECT AVG(NVL(PROD_SALE,0)) ���ǸŰ�����հ�
FROM PROD;  



-- ��ǰ���̺��� ���з��� �ǸŰ��� ��� ���� ���Ͻÿ�.
SELECT PROD_LGU
      ,ROUND(AVG(NVL(PROD_SALE,0)),2) ��ǰ�з����Ǹ����
      
FROM PROD
GROUP BY PROD_LGU;

--P.282 
--COUNT : �ڷ��

SELECT PROD_COST FROM PROD
ORDER BY PROD_COST ASC;

SELECT COUNT(DISTINCT PROD_COST)
      ,COUNT(ALL PROD_COST)
      ,COUNT(PROD_COST)
      ,COUNT(*)
      FROM PROD;

--P.283
--�ŷ�ó���̺��� �����(BUYER_CHARGER)�� �÷������Ͽ� COUNT ����
SELECT COUNT(DISTINCT BUYER_CHARGER) "�ڷ��(DISTINCT)"
      ,COUNT(BUYER_CHARGER) �ڷ��
      ,COUNT(*)    "�ڷ��(*)"
FROM BUYER;
    
-- ȸ�����̺��� ��� �������� COUNT �Ͻÿ�
SELECT COUNT(DISTINCT MEM_LIKE) ���������
FROM MEMBER;

-- ȸ���� ��̺� COUNT ����
SELECT MEM_LIKE ���
      ,COUNT(MEM_ID) �ڷ��
      ,COUNT(*) "�ڷ��(*)"
FROM MEMBER      
GROUP BY MEM_LIKE;



-- ȸ�����̺��� ������������ ī��Ʈ �Ͻÿ�
SELECT COUNT(DISTINCT MEM_JOB) ����������
FROM MEMBER;



-- ȸ�����̺��� ������ CONUNT ����
SELECT MEM_JOBB  �����
      ,COUNT(MEM_ID) �ο���
FROM MEMBER
GROUP BY MEM_JOB;



--��ٱ��� ���̺� ȸ�� (CART_MEMBER) �� ����Ƚ���� ī��Ʈ �Ͻÿ�{
SELECT CART_MEMBER ȸ��ID
      ,COUNT(DISTINCT CART_PROD) ����ȸ���ߺ�����
      ,COUNT(CART_PROD) ����ȸ��
      ,COUNT(*) "����ȸ��(*)"
 FROM CART
GROUP BY CART_MEMBER;


--MAX, MIN
SELECT MAX(DISTINCT PROD_COST)
      ,MAX(PROD_COST)
      ,MIN(DISTINCT PROD_COST)
      ,MIN(PROD_COST)
      FROM PROD;
      
-- ��ǰ �� �ְ��ǸŰ��ݰ� �����ǸŰ���
SELECT MAX(PROD_SALE) �ְ��ǸŰ�
      ,MIN(PROD_SALE) �����ǸŰ�
      ,MIN(DISTINCT PROD_SALE)
      FROM PROD;
      
--��ǰ �� �ְ� ���԰��ܰ� �������԰���
SELECT PROD_BUYER �ŷ�ó
      ,MAX(PROD_COST) �ְ���԰�
      ,MIN(PROD_COST) �������԰�
      FROM PROD
      GROUP BY PROD_BUYER;
      
--��ٱ��� �������� ȸ���� �ִ뱸�ż��� �˻��ϱ�
SELECT CART_MEMBER ȸ��ID
      ,MAX(DISTINCT CART_QTY) �ִ����
      ,MAX(CART_QTY) �ִ����
      ,MIN(DISTINCT CART_QTY) �ּҼ���
      ,MIN(CART_QTY) �ּҼ���
      FROM CART
      GROUP BY CART_MEMBER;
      
--��ǰ �� �ŷ�ó �� �ְ���԰��ݰ� ���� ���԰���
--��ǰ �� �ְ� ���԰��ܰ� �������԰���
--SELECT ������ �����Լ� �̿��� �÷����� GROUP BY ���� ����Ѵ�. �ڡڡڡڡ�
SELECT PROD_BUYER �ŷ�ó
      ,MAX(PROD_COST) �ְ���԰�
      ,MIN(PROD_COST) �������԰�
      FROM PROD
      GROUP BY PROD_BUYER
      ORDER BY PROD_BUYER;
      
 --��ٱ��� ���̺��� ȸ���� �ִ뱸�ż��� �˻��ϱ�
SELECT CART_MEMBER ȸ��ID
      ,MAX(CART_QTY) �ִ����   
      ,MIN(CART_QTY) �ּҼ���
      FROM CART
      GROUP BY CART_MEMBER     
      ORDER BY CART_MEMBER;
--MAX , MIN �� DISTINCT �� �ǹ̰�����.
      
-- ������  2005�� 7�� 11���̶� �����ϰ� ��ٱ��� ���̺� �߻��� �߰� �ֹ���ȣ�� �˻��Ͻÿ�.
SELECT MAX(CART_NO) �ְ�ġ�ֹ���ȣ
      ,MAX(CART_NO) +1 �߰��ֹ���ȣ
FROM CART
WHERE CART_NO LIKE '20050711%';   --���ϵ幮

---P.284 SUM
--��ǰ���̺� PROD �� ���԰� PROD_COST�� ���հ� ��
SELECT SUM(DISTINCT PROD_COST)
      ,SUM(PROD_COST)
      FROM PROD;

--��ǰ���̺� PROD �� �ǸŰ� PROD_SALE�� ���հ� ��
SELECT SUM(PROD_SALE)
FROM PROD;

--��ǰ���̺� PROD ��ǰ�з� PROD_LGU �ǸŰ� PROD_SLAE �� ��
SELECT PROD_LGU  ��ǰ�з�
      ,SUM(PROD_SALE) �ǸŰ�
FROM PROD
GROUP BY PROD_LGU
ORDER BY PROD_LGU;

--��ǰ�԰����̺��� ��ǰ�� �԰������ �հ� ��
SELECT BUY_PROD ��ǰ
      ,SUM(BUY_QTY) �԰�����հ�
      FROM BUYPROD
      GROUP BY  BUY_PROD;
      
--��ٱ��� ���̺��� ��ǰ�з��� �Ǹż����� �հ� ��
SELECT SUBSTR(CART_PROD,0,4)    ��ǰ�з�
      ,SUM(CART_QTY)    �Ǹż����հ�
      FROM CART
      GROUP BY SUBSTR(CART_PROD,0,4);

-- ȸ�����̺��� ȸ����ü�� ���ϸ��� ���, ���ϸ��� �հ�, �ְ��ϸ���, �ּ� ���ϸ���, �ο����� �˻��Ͻÿ�
 SELECT ROUND(AVG(NVL(MEM_MILEAGE,0)),2) ���ϸ������
      ,MIN(MEM_MILEAGE) �ּҸ��ϸ���
      ,MAX(MEM_MILEAGE) �ְ��ϸ���
      ,COUNT(*) �ο���
      ,SUM(MEM_MILEAGE) ���ϸ����հ�
FROM MEMBER;

--��ǰ���̺��� �ǸŰ� ��ü�� ���, �հ�, �ְ�, ������, �ڷ���� �˻�
SELECT ROUND(AVG(NVL(PROD_SALE,0)),2) ���
      ,SUM(PROD_SALE) �հ�
      ,MAX(PROD_SALE) �ְ�
      ,MIN(PROD_SALE) ������
      ,COUNT(*)  �ڷ��
      FROM PROD;
      
--��ǰ���̺��� �ŷ�ó, ��ǰ�з����� �ְ��ǸŰ�, �ּ��ǸŰ�, �ڷ���� �˻��Ͻÿ�
SELECT SUBSTR(PROD_ID,1,4) ��ǰ�з�
      ,PROD_BUYER �ŷ�ó
      ,MAX(PROD_SALE) �ְ��ǸŰ�
      ,MIN(PROD_SALE) �ּ��ǸŰ�
      ,COUNT(PROD_ID) �ڷ��
FROM PROD
GROUP BY SUBSTR(PROD_ID,1,4), PROD_BUYER
ORDER BY PROD_BUYER;

--��ٱ��� ���̺��� ȸ��ID, ��ǰ�з����� ���ż������, ���ż����հ�, �ڷ�� �˻�
SELECT CART_MEMBER  ȸ��ID
      ,SUBSTR(CART_PROD,1,4) ��ǰ�з�
      ,ROUND(AVG(NVL(CART_QTY,0)),2) ���ż������
      ,SUM(CART_QTY) ���ż����հ�
      ,COUNT(*) �ڷ��
FROM CART
GROUP BY CART_MEMBER, SUBSTR(CART_PROD,1,4)
ORDER BY CART_MEMBER, SUBSTR(CART_PROD,1,4);


------------------6.28�� ���� ����---------

--ȸ�����̺��� ����(�ּ�1�� 2�ڸ�), ���ϳ⵵ ���� ���ϸ��� ��� , ���ϸ��� �հ� �ְ��ϸ��� �ּҸ��ϸ��� �ڷ�� �˻�
SELECT SUBSTR(MEM_ADD1,2) �����ּ�
      ,EXTRACT(YEAR FROM MEM_BIR) ���ϳ⵵
      ,AVG(NVL(MEM_MILEAGE,0)) ���ϸ������
      ,SUM(MEM_MILEAGE) ���ϸ����հ�
      ,MIN(MEM_MILEAGE) �ּҸ��ϸ���
      ,MAX(MEM_MILEAGE) �ִ븶�ϸ���
      ,COUNT(*)  �ڷ��
      FROM MEMBER
      GROUP BY SUBSTR(MEM_ADD1,2),EXTRACT(YEAR FROM MEM_BIR)
      ORDER BY 1,2;
      
-------------------06.28--------------------
/*<�н���ǥ>
1. ��group �˻� : �����Լ� �̿��� �÷����� group by ���� ����Ѵ�.
2. outer join + group by �ݶ�
*/

--2005�� 1���� �԰�� ��ǰ(BUY_PROD)��
--��ǰ�з��� �԰����(BUY_QTY)�� ��,
--�԰�ܰ�(BUY_COST)�� ���� ���� ��
--�����԰����� �˻��Ͻÿ�.
--�����԰����� �԰�ܰ� X �԰�����̰�,
--�����԰����� ������������ ����
--(ALIAS : ���Գ��, ��ǰ�з��ڵ�, 
--�԰�����հ�, �԰�ܰ��հ�
--�����԰����հ�)

SELECT SUBSTR(BUY_DATE, 1, 5)  ���Գ��
        ,   SUBSTR(BUY_PROD,1 ,4)  ��ǰ�з��ڵ�
        ,   SUM(BUY_QTY) �԰�����հ�
        ,   SUM(BUY_COST) �԰�ܰ��հ�
        ,   SUM(BUY_COST * BUY_QTY) �����԰����հ�
FROM BUYPROD
WHERE BUY_DATE LIKE '05/01%'
GROUP BY SUBSTR(BUY_DATE, 1, 5) ,  SUBSTR(BUY_PROD,1 ,4)
ORDER BY 5;

--P.285
--�����Լ� ����1
--CART���̺��� Ȱ���Ͽ�
--2005�⵵ 2�б�(4��~6��)��
--������(a001), �̻���(b001), ����ȸ(q001)ȸ�� ��
--��ǰ�з� ��(P101, P102 ...)
--��ǰ���Ű����� �հ踦 ���ϱ�.
--��ǰ���Ű����� ���������ϱ�
--alias : ȸ��ID, ���, ��ǰ�з�, ���Ű���

SELECT CART_MEMBER ȸ��
      ,SUBSTR(CART_NO, 1,6)   ��¥
      ,SUBSTR(CART_PROD,1,4) ��ǰ�з�
      ,CART_QTY  ��ǰ���Ű���
FROM CART
WHERE SUBSTR(CART_NO, 1,6) BETWEEN '200504' AND '200506'
AND SUBSTR(CART_NO, 1,6) IN ('200504' , '200505','200506')
AND CART_MEMBER IN ('a001','b001','q001')
GROUP BY CART_MEMBER, SUBSTR(CART_NO, 1,6)
       , SUBSTR(CART_PROD,1,4)
ORDER BY  SUM(CART_QTY) DESC;


--������Ǯ��
SELECT CART_MEMBER ȸ��ID
     , SUBSTR(CART_NO,1,6) ���
     , SUBSTR(CART_PROD,1,4) ��ǰ�з�
     , SUM(CART_QTY) ���Ű���
FROM   CART
WHERE  SUBSTR(CART_NO,1,6) BETWEEN '200504' AND '200506'
AND    SUBSTR(CART_NO,1,6) IN ('200504','200505','200506')
AND    CART_MEMBER IN('a001','b001','q001')
GROUP BY CART_MEMBER, SUBSTR(CART_NO,1,6)
     , SUBSTR(CART_PROD,1,4)
ORDER BY SUM(CART_QTY) DESC;


--�����Լ� ����2
--SELECT * FROM MEMBER;
--ȸ�����̺�(MEMBER)�� Ȱ���Ͽ�
--���� ��, ��� �� �ο����� ����ϱ�
--��, �ֹε�Ϲ�ȣ ���� ����(MEM_REGNO1)�� 
--���� ���� ����(MEM_BIR)�� �ٸ� ��� 
--�߸��� �����ͷ� ���� ������� ������
--�ο����� ���������ϱ�.
--ALIAS : ����, ���, �ο���

SELECT SUBSTR(MEM_ADD1,1,2)     ����
      ,MEM_LIKE     ���
      ,MEM_REGNO1   �ֹι�ȣ1
      ,MEM_BIR      ����
FROM MEMBER
WHERE MEM_REGNO1 IN  (MEM_BIR)
GROUP BY SUBSTR(MEM_ADD1,1,2) , MEM_LIKE
ORDER BY COUNT(*)2;

--������Ǯ��
SELECT SUBSTR(MEM_ADD1,1,2)  ����
      ,MEM_LIKE ���
      ,COUNT(*)  �ο���
FROM MEMBER
WHERE SUBSTR(MEM_BIR,1,2) = SUBSTR(MEM_REGNO1,1,2)  
GROUP BY SUBSTR(MEM_ADD1,1,2), MEM_LIKE
ORDER BY COUNT(*) DESC;

--��ǰ�԰����̺�(BUYPROD)�� 2005�⵵ 1���� 
--�ŷ�ó��(�ŷ�ó�ڵ�(BUYER_ID), �ŷ�ó��(BUYER_NAME)) 
--���Աݾ��� �˻� �Ͻÿ� ? 
--( ���Աݾ� = ���Լ���(BUY_QTY) * ���Դܰ�(PROD_COST) )
--( Alias�� �ŷ�ó�ڵ�, �ŷ�ó��, ���Աݾ� )

SELECT 
       BUYER_ID �ŷ�ó�ڵ�
      ,BUYER_NAME �ŷ�ó��
      ,SUM(BUY_QTY*BUY_COST) ���Աݾ�
FROM B.BUYER, P.PROD, B.BUYPROD
WHERE B.BUYER_ID = P.PROD_BUYER
AND   P.PROD_ID = B.BUY_PROD
AND   BP.BUY_DATE LIKE '05/01%'
GROUP BY B.BUYER_ID,B.BUYER_NAME
ORDER BY B.BUYER_ID,B.BUYER_NAME;

--SG_SCORES
--�л��� ���� ������ �հ踦 ���غ���
--ALIAS : �л� ���̵�, ������̵�, �����հ�
SELECT  A.STUDENT_ID �л����̵�
      ,B.NAME �л���
      ,A.COURSE_ID ������̵�
      ,SUM(SCORE) �����հ�
FROM SG_SCORES A, STUDENT B
WHERE A.STUDENT_ID = B.STUDENT_ID
GROUP BY STUDENT_ID, B.NAME, A.COURSE_ID
ORDER BY 1,2;


----�л�����
SELECT *FROM STUDENT;

--�а��� �л��� �ο����� ����ϱ�
--ALIAS : �а� �ڵ�, �л��� + ���繫����ȭ��ȣ, �а���

SELECT D.DEPT_ID �а��ڵ�
      ,D.DEPT_NAME �а���
      ,D.DEPT_TEL ��ȭ��ȣ
      ,COUNT(*) �л���
FROM STUDENT S, DEPARTMENT D
WHERE S.DEPT_ID = D.DEPT_ID
GROUP BY D.DEPT_ID, D.DEPT_NAME, D.DEPT_TEL;
----------------------------------------------------------------------
--SG_SCORES ���̺��� Ȱ���Ͽ�
--�л��� ���� ������ �հ踦 ���غ���
--ALIAS : �л����̵�, ������̵�, �����հ�
SELECT * FROM SG_SCORES;

SELECT A.STUDENT_ID  �л����̵�
     , B.NAME         �л���
     , A.COURSE_ID   ������̵�
     , SUM(A.SCORE)  �����հ� 
FROM SG_SCORES A, STUDENT B
WHERE A.STUDENT_ID = B.STUDENT_ID
GROUP BY A.STUDENT_ID, B.NAME, A.COURSE_ID
ORDER BY 1,2;
--�л�����
SELECT * FROM STUDENT;
--�а��� �л��� �ο����� ����ΰ�
--ALIAS : �а��ڵ�, �а���, �а���ȭ��ȣ, �л���
SELECT S.DEPT_ID �а��ڵ�
     , D.DEPT_NAME �а���
     , D.DEPT_TEL �а���ȭ��ȣ
     , COUNT(*) �л���
FROM STUDENT S, DEPARTMENT D
WHERE S.DEPT_ID = D.DEPT_ID
GROUP BY S.DEPT_ID , D.DEPT_NAME, D.DEPT_TEL
ORDER BY 2 DESC;
--����
SELECT * FROM PROFESSOR;
--����
SELECT * FROM COURSE;

--���� �� ���� �� �� �������� ����� ���غ���
--ALIAS : �������̵�, ������, �����ּ�

SELECT P.PROFESSOR_ID  �������̵�
      ,P.NAME  ������
      ,P.EMAIL  �̸����ּ�
      ,AVG(COURSE_FEES)  ������
      ,C.COURSE_ID  �����ڵ��ȣ
FROM PROFESSOR P, COURSE C
WHERE P.PROFESSOR_ID = C.COURSE_ID
GROUP BY P.NAME, P.PROFESSOR_ID;

------������ Ǯ��
SELECT P.PROFESSOR_ID �������̵�
      ,P.NAME ������
      ,P.EMAIL �����ּ�
      ,COUNT(*) ���Ǽ�
      ,AVG(NVL(C.COURSE_FEES,0)) �����������
FROM PROFESSOR P, COURSE C
WHERE P.PROFESSOR_ID = C.PROFESSOR_ID
GROUP BY P.PROFESSOR_ID
        ,P.NAME, P.EMAIL
ORDER BY 5 DESC;

---SG_SCORES(�л��� ���輺��)
---2017�⵵ ���� ������ ����� ���غ���
--ALIAS : ����, �����ڵ�, �����!, �������

/*SELECT*
FROM SG_SCORES;
*/

SELECT SUBSTR(S.SCORE_ASSIGNED,1,2)  ����
      ,AVG(NVL(S.SCORE,0)) �������
      ,C.TITLE �����
      ,C.COURSE_ID �����ڵ�
      
FROM SG_SCORES S, COURSE C
WHERE C.COURSE_ID = S.COURSE_ID
AND SUBSTR(S.SCORE_ASSIGNED,1,2) LIKE 17
GROUP BY SUBSTR(S.SCORE_ASSIGNED,1,2), C.TITLE, C.COURSE_ID;

--OUTTHER

--R ���̺� S���̺��� ���� OUTHER JOIN ����
--1. S���̺��� ������ �⺻Ű�� C, �÷� C,D,E

CREATE TABLE S(
    C VARCHAR2(10),
    D VARCHAR2(10),
    E VARCHAR2(10),
    CONSTRAINT PK_S PRIMARY KEY(C)
    );
    
--2. R���̺� ���� �� �⺻Ű�� A, �÷� : A,B,C
CREATE TABLE R(
 A VARCHAR2(10),
 B VARCHAR2(10),
 C VARCHAR2(10),
 CONSTRAINT PK_R PRIMARY KEY(A)
 );


--3. R���̺� a1, b1, c1�� a2,b2,c2 ������ �Է�
INSERT INTO R(A,B,C) VALUES ('a1','b1','c1');
INSERT INTO R(A,B,C) VALUES ('a2','b2','c2');
commit;

--EQUI JOIN, SIMPLE JOIN, �����, ��������
--LEFT OUTER JOIN
SELECT*
FROM R, S
WHERE R.C = S.C(+);

--ANSI ǥ��(INNER JOIN)
SELECT R.A, R.B, R.C
      ,S.C, S.D, S.E
FROM R INNER JOIN S ON (S.C = R.C);

--ANSI ǥ��(OUTER JOIN)
SELECT R.A, R.B, R.C
      ,S.C, S.D, S.E
FROM R LEFT OUTER JOIN S ON (R.C = S.C);

--RIGHT OUTER JOIN
SELECT*
FROM R, S
WHERE R.C(+) = S.C;

--ANSI ǥ��(RIGHT OUTER JOIN)
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

--outher join ��������
--depart���̺� student���̺��� ���� otTHER JOIN ����
--�÷� ũ��� �л��� ����
--1. DEPART���̺� ���� �� �⺻Ű�� DEP_CDDE
-- �÷� : DEP_CODE, DEP_NAME

CREATE TABLE DEPART( DEP_CODE VARCHAR2(20)
                    ,DEP_NAME VARCHAR2(60)
,CONSTRAINT PK_DEPART PRIMARY KEY(DEP_CODE)
);

-- STUDENT ���̺� ������ �⺻Ű�� STUD_NO,
-- �ܷ�Ű�� STUD_DEP(DEPART ���̺��� DEP_CODE �÷� ����)
-- �÷� : STUD_NO, STUD_NAME, STUD_DEP

CREATE TABLE STUDENT(
         STUD_DEP  VARCHAR2(10)
        ,STUD_NO   VARCHAR2(50)
        ,STUD_NAME VARCHAR2(90)       
        ,CONSTRAINT PK_STUDENT PRIMARY KEY(STUD_NO)
        ,CONSTRAINT FK_STUDENT FOREIGN KEY (STUD_DEP) REFERENCES DEPART(DEP_CODE)
        );

--DROP TABLE STUDENT; �̹� STUDENT ���̺��� ������� ����� �ٽ��ؾߵ�

--------------------------
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('401','7����');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('402','6����');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('403','4����');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('404','10����');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('405','12����');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('406','3����');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('307','11����');


NSERT INTO STUDENT(STUD_NO,STUD_NAME,STUD_DEP) 
VALUES('2022060001','������','406');
INSERT INTO STUDENT(STUD_NO,STUD_NAME,STUD_DEP) 
VALUES('2022060002','������','406');
INSERT INTO STUDENT(STUD_NO,STUD_NAME,STUD_DEP) 
VALUES('2022060003','�谭��','405');
INSERT INTO STUDENT(STUD_NO,STUD_NAME,STUD_DEP) 
VALUES('2022060004','���ٿ�','401');
INSERT INTO STUDENT(STUD_NO,STUD_NAME,STUD_DEP) 
VALUES('2022060005','������','402');

--5. DEPART TABLE STUDENT ���̺��� MQUAL JOIN
--ALIAS ���ڵ� �ݸ� �й� �л���
--EQUT JOIN
--ANSI INNER JOIN

SELECT * 
        
FROM DEPART D, STUDENT S
WHERE D.DEP_CODE = S.STUD_DEP;

SELECT D.DEP_CODE ���ڵ�
      ,D.DEP_NAME �ݸ�
      ,S.STUD_NO �й�
      ,S.STUD_NAME �л���
FROM DEPART D INNER JOIN STUDENT S ON (D.DEP_CODE = S.STUD_DEP);

-- 6. DEPART ���̺�� STUDENT ���̺��� ���� �ܺ�����, (+)
--����Ŭ
SELECT D.DEP_CODE ���ڵ�
      ,D.DEP_NAME �ݸ�
      ,S.STUD_NO �й�
      ,S.STUD_NAME �л��� 
       
FROM DEPART D, STUDENT S
WHERE D.DEP_CODE = S.STUD_DEP(+);

--- ANSI LEFT OUTER JOIN
SELECT D.DEP_CODE ���ڵ�
      ,D.DEP_NAME �ݸ�
      ,S.STUD_NO �й�
      ,S.STUD_NAME �л���
FROM DEPART D LEFT OUTER JOIN STUDENT S ON (D.DEP_CODE = S.STUD_DEP);


-- 7. DEPART���̺�� STUDENT ���̺� ������ �ܺ�����
--(+)RIGHT OUTER JOIN
SELECT D.DEP_CODE ���ڵ�
      ,D.DEP_NAME �ݸ�
      ,S.STUD_NO �й�
      ,S.STUD_NAME �л��� 
       
FROM DEPART D, STUDENT S
WHERE D.DEP_CODE(+) = S.STUD_DEP;

--ANSI RIGHT OUTER JOIN

SELECT D.DEP_CODE ���ڵ�
      ,D.DEP_NAME �ݸ�
      ,S.STUD_NO �й�
      ,S.STUD_NAME �л��� 
       
FROM DEPART D RIGHT OUTER JOIN STUDENT S ON (D.DEP_CODE(+) = S.STUD_DEP);

--8. DEPART ���̺� STUDENT ���̺�
--���� �ܺ����� , ���ڵ� �ݸ� �й� �л���
--UNION
--ANSI FULL OUTER JOIN
SELECT D.DEP_CODE ���ڵ�
      ,D.DEP_NAME �ݸ�
      ,S.STUD_NO �й�
      ,S.STUD_NAME �л��� 
       
FROM DEPART D, STUDENT S
WHERE D.DEP_CODE(+) = S.STUD_DEP;
UNION
SELECT D.DEP_CODE ���ڵ�
      ,D.DEP_NAME �ݸ�
      ,S.STUD_NO �й�
      ,S.STUD_NAME �л��� 
       
FROM DEPART D, STUDENT S
WHERE D.DEP_CODE = S.STUD_DEP(+);

--AUSI FULL OUTER JOIN
SELECT D.DEP_CODE ���ڵ�
      ,D.DEP_NAME �ݸ�
      ,S.STUD_NO �й�
      ,S.STUD_NAME �л��� 
       
FROM DEPART D FULL OUTER JOIN STUDENT S ON (D.DEP_CODE = S.STUD_DEP);

--OUTER JOIN ����
--1. �����������̺�(COLLEAGE)
--�����ڵ�
--���и�

CREATE TABLE COLLEAGE(
 COL_CODE VARCHAR2(10), 
 COL_NAME VARCHAR2(30),
);

--2. �а��������̺�(HAKGWA)
--�а��ڵ�
--�а���
--�����ڵ�



CREATE TABLE HAKGWA(
    HAK_CODE VARCHAR2(10),
    HAK_NAME VARCHAR2(100),
    COL_CODE VARCHAR2(10),
    

    
--3. �����������̺��� �����ڵ带 �⺻Ű�� ����

ALTER TABLE COLLEAGE
ADD( CONSTRAINT PK_COLLEAGE PRIMARY KEY(COL_CODE));


--4. �а��������̺��� �а��ڵ带 �⺻Ű�� ����    
 --  �а��������̺��� �����ڵ尡 �����������̺��� �����ڵ带 �����ϴ�
 --  �ܷ�Ű�� ����
 
ALTER TABLE HAKGWA
ADD(CONSTRAINT PK_HAKGWA PRIMARY KEY(HAK_CODE),
    CONSTRAINT FK_HAKGWA FOREIGN KEY(COL_CODE) REFERENCES COLLEAGE(COL_CODE)
    );   
   
--5. �����������̺� ���� �����͸� INSERT �ϱ�
--W01 �־ƽþƸŴ�����Ʈ
--W02 �ܽ�����
--W03 ö������
--W04 �����й̵��
--W05 ���Ǻ���

INSERT INTO COLLEAGE(COL_CODE, COL_NAME) VALUES('W01','�־ƽþƸŴ�����Ʈ');
INSERT INTO COLLEAGE(COL_CODE, COL_NAME) VALUES('W02','�ܽ�����');
INSERT INTO COLLEAGE(COL_CODE, COL_NAME) VALUES('W03','ö������');
INSERT INTO COLLEAGE(COL_CODE, COL_NAME) VALUES('W04','�����й̵��');
INSERT INTO COLLEAGE(COL_CODE, COL_NAME) VALUES('W05','���Ǻ���');

--6. �а��������̺� ���� �����͸� INSERT �ϱ�
--H001 �ܽ������а� W02
--H002 ȣ�ڰ����濵�а� W02
--H003 ö���濵�а� W03
--H004 ��ȣ�а� W05

INSERT INTO HAKGWA(HAK_CODE, HAK_NAME, COL_CODE) VALUES('H001','�ܽ������а�','W02');
INSERT INTO HAKGWA(HAK_CODE, HAK_NAME, COL_CODE) VALUES('H002','ȣ�ڰ����濵�а�','W02');
INSERT INTO HAKGWA(HAK_CODE, HAK_NAME, COL_CODE) VALUES('H003','ö���濵�а�','W02');
INSERT INTO HAKGWA(HAK_CODE, HAK_NAME, COL_CODE) VALUES('H004','��ȣ�а�','W05');
COMMIT;

--7. �����������̺�� �а��������̺��� ���������Ͽ� SELECT
SELECT H.HAK_CODE  �а��ڵ�
      ,H.HAK_NAME  �а��� 
      ,C.COL_CODE  �����ڵ�
      ,C.COL_NAME  ���и�
FROM COLLEAGE C INNER JOIN HAKGWA H ON (C.COL_NAME =H.COL_CODE);


8. �����������̺��� ��� �����͸� ����ϵ��� 
  �а��������̺�� �ܺ����� SELECT
  
SELECT H.HAK_CODE  �а��ڵ�
      ,H.HAK_NAME  �а��� 
      ,C.COL_CODE  �����ڵ�
      ,C.COL_NAME  ���и�
FROM COLLEAGE C FULL OUTER JOIN HAKGWA H ON (H.COL_CODE = C.COL_NAME);

--------------06.30---------------
--p.246
--��ü ��ǰ�� 2005�� 1�� �԰������ �˻���ȸ
--ALIAS ��ǰ�ڵ�, ��ǰ��, �԰����
-ANSI ǥ��
-EQUI JOIN
SELECT  BP.BUY_PROD   ��ǰ�ڵ�
      ,P.PROD_NAME     ��ǰ��
      ,SUM(BP.BUY_QTY)    �԰����
FROM PROD P LEFT OUTHER JOIN BUYPROD BP
ON (P.PROD_ID = BP.BUY_PROD AND BP.BUY_DATE LIKE '05/01%')
GROUP BY BP.BUY_PROD, P.PROD_NAME;

SELECT PROD_ID, PROD_NAME FROM PROD;


--P.247
--��ü ȸ��(MEMBER)�� 2005�⵵ 4���� ������Ȳ ��ȸ
--ALIAS : ȸ��ID, ����, ���ż�������(CART_QTY)

SELECT   M.MEM_ID ȸ��ID
        ,M.MEM_NAME ����
        ,NVL(SUM(C.CART_QTY),0) ���ż���
FROM MEMBER M , CART C
WHERE M.MEM_ID = C.CART_MEMBER(+)
AND C.CART_NO(+) LIKE = '200504%'
GROUP BY  M.MEM_ID, M.MEM_NAME
ORDER BY  M.MEM_ID, M.MEM_NAME;

SELECT MEM_ID, MEM_NAME FROM MEMBER;

--ANSI ǥ�� (OUTER JOIN)
SELECT M.MEM_ID ȸ��ID
      ,M.MEM_NAME �̸�
      ,NVL(SUM(C.CART_QTY),0) ���ż�������
FROM MEMBER M LEFT OUTER JOIN CART C
ON(M.MEM_ID = C.CART_MEMBER AND C.CART_NO LIKE '200504%')
GROUP BY M.MEM_ID, M.MEM_NAME
ORDER BY M.MEM_ID, M.MEM_NAME;




--P.248
-- ��ü ��ǰ�� 2005�⵵ 5�� 5���� �԰�.�����Ȳ ��ȸ
--(��ǰ�ڵ�, ��ǰ��, �԰��������, �Ǹż������� )
SELECT P.PROD_ID ��ǰ�ڵ�
     , P.PROD_NAME ��ǰ��
     , NVL(SUM(BP.BUY_QTY),0) �԰��������
     , NVL(SUM(C.CART_QTY),0) �Ǹż�������
FROM   PROD P, BUYPROD BP, CART C
WHERE  P.PROD_ID = BP.BUY_PROD(+)
AND    P.PROD_ID = C.CART_PROD(+)
AND    BP.BUY_DATE(+) = '05/05/05'
AND    C.CART_NO(+) LIKE '20050505%'
GROUP BY P.PROD_ID, P.PROD_NAME
ORDER BY P.PROD_ID, P.PROD_NAME;
--ANSIǥ��
SELECT P.PROD_ID ��ǰ�ڵ�
     , P.PROD_NAME ��ǰ��
     , NVL(SUM(BP.BUY_QTY),0) �԰��������
     , NVL(SUM(C.CART_QTY),0) �Ǹż�������
FROM   PROD P LEFT OUTER JOIN BUYPROD BP 
                    ON(BP.BUY_PROD = P.PROD_ID AND BP.BUY_DATE = '05/05/05')
              LEFT OUTER JOIN CART C     
                    ON(C.CART_PROD = P.PROD_ID AND C.CART_NO LIKE '20050505%')
GROUP BY P.PROD_ID, P.PROD_NAME
ORDER BY P.PROD_ID, P.PROD_NAME;



---------P.249
--SELF JOIN : TABLE ALIAS�� ����Ͽ� ��ġ 2���� TABLE ó�� �ڽ��� TABLE�� �ڽ��� TABLE�� JOIN �Ͽ� �˻�
--���ظ� �����ִ� ���� : ������


--ȸ�� ID ' h001����ȣ �� ���� ���ϸ� ��������
-- �̻��� ȸ���� �˻�
-- ȸ��id ���� ���̸���

SELECT �ܵ���.MEM_ID ȸ��ID
      ,�ܵ���.MEM_NAME ����
      ,�ܵ���.MEM_MILEAGE ���ϸ���
      FROM  MEMBER �ܵ���, MEMBER �ײ���
      WHERE �ײ���.MEM_ID ='h001'
      AND �ܵ���.MEM_MILEAGE >= �ײ���.MEM_MILEAGE;

--------------      
SELECT B.MEM_ID   ȸ��ID
      , B.MEM_NAME  ȸ���̸�
      , B.MEM_MILEAGE ȸ�����ϸ���
FROM MEMBER A, MEMBER B
WHERE A.MEM_ID = 'h001'
AND A.MEM_MILEAGE <= B.MEM_MILEAGE;


--P.249
--�ŷ�ó �ڵ尡 'P30203(����)' �� ���������� ���� �ŷ�ó��
-- �˻� ��ȸ( �ŷ�ó�ڵ�, �ŷ�ó , �ּ�)

SELECT A.BUYER_ID     �ŷ�ó�ڵ�
      ,A.BUYER_NAME    �ŷ�ó
      ,SUBSTR(A.BUYER_ADD1,1,2)    �ּ�
      , B.BUYER_ID
      , B.BUYER_NAME
      
      
FROM BUYER A, BUYER B
WHERE B.BUYER_ID = 'P30203'
AND SUBSTR(A.BUYER_ADD1,1,2)
  = SUBSTR(B.BUYER_ADD1,1,2);

--SELF JOIN ��������
--����ȣ ȸ���� ������ ������ ������ ����
--ȸ���� ����Ʈ�� ����غ�����
--(ȸ��ID, ȸ����, ����)


SELECT MEM_ID     ȸ��ID
      ,MEM_NAME   ȸ����
      ,MEM_JOB    ����      
FROM MEMBER
WHERE MEM_ID = 'h001'
AND SUBSTR(MEM_ID,1,3);

--------------------------------
SELECT A.MEM_ID     ȸ��ID
      ,A.MEM_NAME   ȸ����
      ,A.MEM_JOB    ����      
FROM MEMBER A, MEMBER B
WHERE B.MEM_NAME = '����ȣ'
AND A.MEM_JOB = B.MEM_JOB;

-------------------------------------------------------------------------
--����
--f001ȸ���� 2005�� 4�� 10�Ͽ� 8�� �ֹ���
--��ǰ�� �����ϰ� ������ ȸ���� ������ ���Ͻÿ�
--(ALIAS : ȸ��ID(CART_MEMBER), īƮ��ȣ(CART_NO),
--��ǰID(CART_PROD), ���԰���(CART_QTY)


SELECT A.CART_NO
      ,A.CART_PROD
      ,A.CART_MEMBER
      ,A.CART_QTY
FROM CART A, CART B
WHERE B.CART_MEMBER = 'f001'
AND B.CART_NO LIKE '20050410%'
AND B.CART_QTY = 8
AND A.CART_PROD = B.CART_PROD;


--����
--w001 ȸ���� ���� ���(MEM_LIKE)�� ����
--ȸ�������� �˻��Ͻÿ�
--ALIAS : ȸ��ID(MEM_ID), ȸ����(MEM_NAME), ���(MEM_LIKE)

SELECT A.MEM_ID  ȸ��ID
      ,A.MEM_NAME  ȸ����
      ,A.MEM_LIKE ���
FROM MEMBER A, MEMBER B
WHERE  B.MEM_ID = 'w001'
AND B.MEM_LIKE = A.MEM_LIKE;

--P.
--HAVING : 
--���谡 ������ �� �� ��� �����Լ��� ���ǰ� ��
--GROUP BY �� �ڿ� ��
--SELECT���� ���� �����̶�� HAVING���� �������� ��� ����!

-- 2005�⵵ ���� ���� ��Ȳ�� �˻��Ͻÿ� ?
--(Alias�� ���Կ�, ���Լ���, ���Աݾ�(���Լ���*�������̺��� ���԰�))
--��, ���Աݾ��� 20,000,000 �̻��� �����͸� ����غ���

SELECT EXTRACT(MONTH FROM BUY_DATE)  ���Կ�
      ,SUM(BUY_QTY)  ���Լ���
      ,SUM(BUY_COST*BUY_QTY)  ���Աݾ�
FROM BUYPROD
WHERE EXTRACT (YEAR FROM BUY_DATE) = 2005
GROUP BY EXTRACT(MONTH FROM BUY_DATE)
HAVING SUM(BUY_COST*BUY_QTY) >= 20000000;

--2005�⵵ �Ǹŵ� ��ǰ �߿� 5ȸ �̻��� �Ǹ�ȸ���� �ִ� 
--��ǰ ��ȸ    ( ��ǰ�ڵ�, ��ǰ��, �Ǹ�Ƚ�� )

SELECT C.CART_PROD ��ǰ�ڵ�
      ,P.PROD_NAME ��ǰ��
      ,SUM(C.CART_QTY)  �Ǹ�Ƚ��
FROM PROD P, CART C
WHERE P.PROD_ID = C.CART_PROD
AND C.CART_NO LIKE '2005%'
GROUP BY C.CART_PROD, P.PROD_NAME
HAVING SUM(C.CART_QTY) >= 5;

--��ǰ�з���  ��ǻ����ǰ('P101')�� ��ǰ�� 2005�⵵ ���ں�
--�Ǹ� ��ȸ( �Ǹ���, �Ǹűݾ�(5,000,000�ʰ��� ��츸), �Ǹż��� )

SELECT SUM(P.PROD_SALE*C.CART_QTY) �ǸŰ�
      ,SUBSTR(C.CART_NO,1,8)  �Ǹ���
      ,SUM(C.CART_QTY) �Ǹż���
      
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
-- 2005�⵵ �Ǹ�����(CART_NO�� ����), 
-- �Ǹ��Ѿ�(CART_QTY * PROD_SALE),
-- �Ǹż���(CART_QTY), �Ǹ�ȸ��(COUNT(CART_NO))
-- �� ��ȸ�Ͻÿ�.
-- ��, �Ǹ�ȸ���� 8�� �̻��� ���
--     �Ǹ��Ѿ��� 5,000,000�ʰ��� ���
--     �Ǹż����� 50�ʰ��� ���
--ALIAS : �Ǹ���, �Ǹűݾ�, �Ǹż���, �Ǹ�ȸ��

SELECT SUBSTR(C.CART_NO,1,8) �Ǹ���
      ,SUM(C.CART_QTY * PROD_SALE) �Ǹűݾ�
      ,SUM(C.CART_QTY) �Ǹż���
      ,COUNT(C.CART_NO) �Ǹ�ȸ��
FROM PROD P, CART C      
WHERE P.PROD_ID = C.CART_PROD
AND C.CART_NO LIKE '2005%'
GROUP BY SUBSTR(C.CART_NO,1,8)
HAVING COUNT(C.CART_NO)>=8
AND SUM(C.CART_QTY * PROD_SALE) >5000000
AND SUM(C.CART_QTY)>50
;

--����!!---
-- 2005�⵵  ȸ��(MEMBER) ���� �� 
--�Ǹűݾ�(�ǸŰ�(PROD_SALE) * �ǸŰ���(CART_QTY))�� ��ȸ�Ͻÿ�
-- ALIAS : ����, ����, ����, �Ǹűݾ�
-- ��, ������ �������� ����.
-- �Ǹűݾ��� 20,000,000 �̻��� �����ͷ� ����

SELECT   SUM((PROD_SALE)*(CART_QTY)) �Ǹű޾�
        , EXTRACT(YEAR FROM M.MEM_BIR) ����
        ,SUBSTR(M.MEM_ADD1,1,2) ����
        ,M.MEM_JOB ����
FROM PROD P, CART C, MEMBER M
WHERE P.PROD_ID = C.CART_PROD
AND C.CART_MEMBER = M.MEM_ID
AND SUBSTR(M.MEM_ADD1,1,2)= '����'
AND C.CART_NO LIKE '2005%'
GROUP BY EXTRACT(YEAR FROM M.MEM_BIR), SUBSTR(M.MEM_ADD1,1,2) , M.MEM_JOB  
HAVING SUM((PROD_SALE)*(CART_QTY)) >= 20000000  ;      
        
--P.254
--��ǰ�ڵ� ��ǰ�� �ŷ�ó �ڵ� �ŷ�ó ��
-- �� �������� �̿�
--SCALAR��������

SELECT P.PROD_ID   ��ǰ�ڵ�
      ,P.PROD_NAME   ��ǰ��
      ,P.PROD_BUYER  �ŷ�ó�ڵ�
      ,(SELECT BUYER_NAME FROM BUYER WHERE BUYER_ID = P.PROD_BUYER)   �ŷ�ó     
FROM PROD P;

-- ȸ��ID(CART_MEMBER), ȸ����,
--- �ֹ���ȣ(CART_NO)
-- ��ǰ�ڵ�(CART_PROD), ����(CART_QTY)
---�� �������� ���

SELECT CART_MEMBER
      ,CART_NO
      ,CART_PROD
      ,CART_QTY
FROM CART;

---MEM_ID --> MEM_NAME 
        ---����---
-- ȸ������ ���̵� ���ӵǾ� �ִ�.


SELECT MEM_NAME FROM MEMBER
WHERE MEM_ID= 'a001';


SELECT CART_MEMEBER ȸ��ID
      ,(SELECT MEM_NAME FROM MEMBER WHERE MEM_ID = CART_MEMBER) ȸ����
      ,CART_NO �ֹ���ȣ
      ,CART_PROD ��ǰ�ڵ�
      ,CART_QTY ����
      FORM CART;

--SCALAR ��������1
-- �԰�����(BUY_DATE), ��ǰ�ڵ�(BUY_PROD)
--,��ǰ��, ���Լ���(BUY_QTY), ���Դܰ�(BUY_COST)
-- ��, �������� �̿�

SELECT BUY_DATE �԰�����
      ,(SELECT PROD_NAME FROM PROD WHERE PROD_ID = BUY_PROD) ��ǰ��
      ,BUY_PROD ��ǰ�ڵ�
      ,BUY_QTY ���Լ���
      ,BUY_COST ���Դܰ�
      FROM BUYPROD;
      
--SCALAR ��������2
-- �ŷ�ó�ڵ�(BUYER_ID), �ŷ�ó��(BUYER_NAME)
--,��ǰ�з��ڵ�(BUYER_LGU), ��ǰ�з���
-- ��, �������� �̿�
      
SELECT BUYER_ID �ŷ�ó�ڵ�
      ,BUYER_NAME �ŷ�ó��
      ,BUYER_LGU  ��ǰ�з��ڵ�
      ,(SELECT LPROD_NM FROM LPROD WHERE LPROD_GU = BUYER_LGU)  ��ǰ�з���
FROM BUYER;

--SCALAR ��������3(BUYPROD)
-- �԰�����, ��ǰ�ڵ�, ��ǰ��
-- ���Լ���, ���Դܰ�
-- ��, �������� �̿�

SELECT BUY_DATE �԰�����
      ,BUY_PROD ��ǰ�ڵ�
      ,BUY_QTY ���Լ���
      ,BUY_COST ���Դܰ�
      ,(SELECT PROD_NAME FROM PROD WHERE PROD_ID = BUY_PROD) ��ǰ��
FROM BUYPROD;

--NESTED ��������1
--NESTED �������� : WHERE  ���� ���� ��������
--��ǰ�з��� ��ǻ�� ��ǰ�� ��ǰ�� ����Ʈ�� ����ϱ�
--ALIAS : ��ǰ�ڵ�, ��ǰ��, ��ǰ�з��ڵ�

SELECT PROD_ID ��ǰ�ڵ�
      ,PROD_NAME  ��ǰ��
      ,PROD_LGU ��ǰ�з��ڵ�
FROM  PROD
WHERE PROD_LGU = (SELECT LPROD_GU FROM LPROD WHERE LPROD_NM = '��ǻ����ǰ');
      
--NESTED ��������2
--NESTED �������� : WHERE���� ���� ��������
--��ǰ�з��� ��ǻ����ǰ�� �ŷ�ó ����Ʈ�� ����ϱ�
--ALIAS : �ŷ�ó�ڵ�, �ŷ�ó��, ��ǰ�з��ڵ�
--������ / �����÷� ��������

SELECT BUYER_ID   �ŷ�ó�ڵ�
      ,BUYER_NAME   �ŷ�ó��
      ,BUYER_LGU     ��ǰ�з��ڵ�
FROM BUYER      
WHERE BUYER_LGU = (SELECT LPROD_GU FROM LPROD WHERE LPROD_NM = '��ǻ����ǰ');

--NESTED ��������3
--NESTED �������� : WHERE���� ���� ��������
--��ǰ�з��� ������ǰ�� ��ǰ���� ��Ȳ ����Ʈ�� ����ϱ�
--ALIAS : �԰�����, ��ǰ�ڵ�, ���Լ���, ���Դܰ�
--��Ʈ : ��ǰ�ڵ忡 ��ǰ�з��ڵ尡 ����.

SELECT BUY_DATE �԰�����
      ,BUY_PROD ��ǰ�ڵ�
      ,BUY_QTY ���Լ���
      ,BUY_COST ���Դܰ�
FROM BUYPROD
WHERE SUBSTR(BUY_PROD,1,4) = (SELECT LPROD_GU FROM LPROD WHERE LPROD_NM = '������ǰ');

--NESTED ��������5
--NESTED �������� : WHERE���� ���� ��������
--��ٱ������̺��� ������ ȸ���� ���� ��Ȳ�� ���
--ALIAS : �ֹ���ȣ, ��ǰ�ڵ�, ȸ��ID, ����


SELECT CART_MEMBER ȸ��ID
      ,CART_PROD ��ǰ�ڵ�
      ,CART_QTY ����
      ,CART_NO  �ֹ���ȣ

FROM CART
WHERE SUBSTR(CART_MEMBER,1,4) = (SELECT MEM_ID FROM MEMBER WHERE MEM_NAME = '������'); 

--[�Ǹ��] ��ü�κ��� �鿩�� ��ǰ�� ����Ʈ�� ���
--��ǰID, ��ǰ��, ��ü�ڵ�
--���������� ����ϱ�.

SELECT PROD_ID ��ǰID
      ,PROD_NAME ��ǰ��
      ,PROD_BUYER  ��ü�ڵ�
      ,(SELECT BUYER_NAME FROM BUYER WHERE BUYER_ID = PROD_BUYER) ��ü��
FROM PROD
WHERE SUBSTR(PROD_BUYER,1,6) = (SELECT BUYER_ID FROM BUYER WHERE BUYER_NAME = '�Ǹ��');

---P.255
--��ǰTABLE ���� �ǸŰ��� ��ǰ����ǸŰ����� ū ��ǰ�� �˻��Ͻÿ�
-- ��ǰ��, �ǸŰ� ,��Ǽ�ǸŰ�

SELECT P.PROD_NAME   ��ǰ��
      ,P.PROD_SALE   �ǸŰ�
      ,A.AVG_SALE ����ǸŰ�
FROM PROD P, (SELECT AVG(PROD_SALE) AVG_SALE FROM PROD) A  -- INLINE VIEW(FROM���� ���� ��������)
WHERE P.PROD_SALE > A.AVG_SALE;

--P.255
--ȸ�����̺��� ���ϸ����� ��ո��ϸ������� ū ȸ���� ���˻�
-- ȸ����, ���ϸ��� ��ո��ϸ���

SELECT M.MEM_NAME ȸ����
      ,M.MEM_MILEAGE ���ϸ���
      ,A.AVG_MILEAGE ��ո��ϸ���
      FROM MEMBER M, (SELECT AVG(MEM_MILEAGE) AVG_MILEAGE FROM MEMBER) A
      WHERE M.MEM_MILEAGE > A.AVG_MILEAGE;


--����) 
--��ٱ���Table���� �Ǹż��� ����Ǹż� ���� ū �����͸� 
--�˻��Ͻÿ� ?  
--(Alias�� ȸ��ID, ��ٱ��Ϲ�ȣ, ��ǰ�ڵ�, �Ǹż�, ����Ǹż�)

SELECT C.CART_NO  ��ٱ��Ϲ�ȣ
      ,C.CART_PROD ��ǰ�ڵ�
      ,C.CART_MEMBER  ȸ��ID
      ,C.CART_QTY    �Ǹż�
      ,A.AVG_QTY ����Ǹż�
FROM CART C, (SELECT AVG(CART_QTY) AVG_QTY FROM CART) A
WHERE  A.AVG_QTY < C.CART_QTY;

--����) 
--ȸ��Table���� ���̰� ��ճ��� ���� ���� ȸ���� 
--�˻��Ͻÿ� ?  
--(Alias�� ȸ��ID, ����, �ֹι�ȣ���ڸ�, ����, ��ճ���)


SELECT MEM_ID ȸ��ID
      ,M.MEM_NAME ����
      ,M.MEM_REGNO1 �ֹι�ȣ���ڸ�
      ,EXTRACT(YEAR FROM SYSDATE)- EXTRACT(YEAR FROM M.MEM_BIR)  ����
      ,ROUND(A.AVG_BIR,2) ��ճ���
      
FROM MEMBER M, (SELECT AVG(EXTRACT(YEAR FROM SYSDATE)- EXTRACT(YEAR FROM MEM_BIR)) AVG_BIR FROM MEMBER) A
WHERE ROUND(A.AVG_BIR,2) < EXTRACT(YEAR FROM SYSDATE)- EXTRACT(YEAR FROM MEM_BIR);


--P.256
--��� �ŷ�ó�� 2005�⵵ �ŷ�ó�� ���Աݾ� �հ�
--ALIAS �ŷ�ó �ڵ� �ŷ�ó�� ���Աݾ� �հ�

SELECT B.BUYER_ID  �ŷ�ó�ڵ�
      ,B.BUYER_NAME  �ŷ�ó��
      ,SUM(BP.BUY_COST*BP.BUY_QTY)  ���Աݾ����հ�
FROM BUYER B
    ,PROD P
    ,BUYPROD BP
WHERE B.BUYER_ID = P.PROD_BUYER(+)
AND P.PROD_ID = BP.BUY_PROD(+)
AND EXTRACT(YEAR FROM BP.BUY_DATE(+)) = 2005
GROUP BY B.BUYER_ID, B.BUYER_NAME;


--ANSI ǥ��
--LEFT OUTER JOIN
SELECT B.BUYER_ID �ŷ�ó�ڵ�
     , B.BUYER_NAME �ŷ�ó��
     , NVL(SUM(BP.BUY_COST * BP.BUY_QTY),0) ���Աݾ��հ�
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
--��� �ŷ�ó�� 2005�⵵ �ŷ�ó�� ����ݾ�(PROD_SALE*CART_QTY) �հ�
--ALIAS �ŷ�ó �ڵ� �ŷ�ó�� ����ݾ�(PROD_SALE*CART_QTY) �հ�

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


--�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ� 
--��ٱ���TABLE ���� ȸ���� �ְ��� ���ż����� ���� �ڷ��� ȸ��,
-- �ֹ���ȣ, ��ǰ, ������ ���� ��� �˻��Ͻÿ�
--ALIAS ȸ�� �ֹ���ȣ ��ǰ ����
--������� �������� (CORRELATED SUBQUERY) : MAIN�� Ư�� �÷��� SUB ������ ���ǰ� , 
--SUB ����� �ٽ� MAIN  �������� ����

SELECT A.CART_MEMBER ȸ��
      ,A.CART_NO �ֹ���ȣ
      ,A.CART_PROD ��ǰ
      ,A.CART_QTY ����
FROM CART A
WHERE A.CART_QTY = (
    SELECT MAX(B.CART_QTY)
    FROM CART B
    WHERE B.CART_MEMBER = A.CART_MEMBER --�ڡڡڡڡڡڡڡ�
    )
;

--�԰����̺�(BUYPROD)����  "��ǰ��" , �ְ���Լ����� ���� �ڷ���
-- �԰�����, ��ǰ�ڵ�, ���Լ���, ���Դܰ��� �˻��ϱ�

SELECT A.BUY_DATE  �԰�����
      ,A.BUY_PROD  ��ǰ�ڵ�
      ,A.BUY_QTY  ���Լ���
      ,A.BUY_COST  ���Դܰ�
FROM BUYPROD A
WHERE A.BUY_QTY =( 
SELECT MAX(B.BUY_QTY)
FROM BUYPROD B
WHERE B.BUY_PROD = A.BUY_PROD     ----�ڡڡڡڡڡ�
);
      
--������輭������ ����3)
-- ��ٱ���Table���� ���ں� �ְ��� ���ż����� ���� �ڷ��� ȸ��, 
--�ֹ���ȣ, ��ǰ, ������ ���� ��� �˻��Ͻÿ� ?
--(Alias�� ȸ��, ����, ��ǰ, ����)

SELECT SUBSTR(A.CART_NO,1,8)    ����
      ,A.CART_PROD  ��ǰ
      ,A.CART_MEMBER  ȸ��ID
      ,A.CART_QTY    ����
   FROM CART A
   WHERE A.CART_QTY =(
   SELECT MAX(B.CART_QTY)
   FROM CART B
   WHERE SUBSTR(A.CART_NO,1,8) = SUBSTR(B.CART_NO,1,8)   --�ڡڡڡڡڡڡ�
   );

--P.260   
--������ ��������, �����÷� ���������� ��밡��
-- =, !=, <> , <=, >= ������ ���
SELECT LPROD_NM
FROM LPROD
WHERE LPROD_GU = 'P101';

-- �����÷� ���������� ��밡��
--IN , ANY, ALL, EXISTS ������ ���
SELECT LPROD_NM
FROM LPROD
WHERE LPROD_GU LIKE 'P1%';

--P.260
--������ '������'�� ������� ���ϸ����� �˻��Ͽ�
--�ּ��� �׵� �� ��� �ѻ�����ٴ� ���ϸ����� ū ������� ����Ͻÿ�
--��, ������ '������'�� ����� �����ϰ� �˻��Ͻÿ�?
--ALIAS ȸ����, ����, ���ϸ���
-- ������ '������' �� ������� ���ϸ���?
--ANY : OR (�Ǵ�)



SELECT A.MEM_NAME
      ,A.MEM_JOB
      ,A.MEM_MILEAGE
FROM MEMBER A

WHERE A.MEM_MILEAGE > ANY(
SELECT B.MEM_MILEAGE
FROM MEMBER B
WHERE B.MEM_JOB = '������'
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
WHERE B.MEM_JOB = '������'
);

--����
--a001 ȸ���� ���Լ����� �˻��Ͽ�
--�ּ��� a001 ȸ�� ���ٴ� ���Լ�����(AND�� ����)
--ū �ֹ������� ����Ͻÿ�.
--��, a001 ȸ���� �����ϰ� �˻��Ͻÿ�.
--(ALIAS�� �ֹ���ȣ, ��ǰ�ڵ�, ȸ����!!!, ���Լ���)

SELECT A.CART_NO �ֹ���ȣ
     , A.CART_PROD ��ǰ�ڵ�
     , (SELECT C.MEM_NAME FROM MEMBER C WHERE C.MEM_ID = A.CART_MEMBER) ȸ����  --��������
     , M.MEM_NAME ȸ����2
     , A.CART_QTY ���Լ���
FROM   CART A, MEMBER M
WHERE  A.CART_MEMBER = M.MEM_ID   --����
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
--������, �ߺ�1ȸ, �ڵ�����


---B����
SELECT MEM_NAME
      ,MEM_JOB
      ,MEM_MILEAGE
FROM MEMBER
WHERE MEM_JOB = '�ڿ���';


--------------
--P.261
SELECT MEM_NAME
      ,MEM_JOB
      ,MEM_MILEAGE
FROM MEMBER
WHERE MEM_MILEAGE > 4000

UNION ALL
--������, �ߺ����, �ڵ�����X


---B����
SELECT MEM_NAME
      ,MEM_JOB
      ,MEM_MILEAGE
FROM MEMBER
WHERE MEM_JOB = '�ڿ���';

---------------

SELECT MEM_NAME
      ,MEM_JOB
      ,MEM_MILEAGE
FROM MEMBER
WHERE MEM_MILEAGE > 4000

INTERSECT
--������, �ڵ�����X


---B����
SELECT MEM_NAME
      ,MEM_JOB
      ,MEM_MILEAGE
FROM MEMBER
WHERE MEM_JOB = '�ڿ���';


----------------
SELECT MEM_NAME
      ,MEM_JOB
      ,MEM_MILEAGE
FROM MEMBER
WHERE MEM_MILEAGE > 4000

MINUS
--������, �ڵ�����X


---B����
SELECT MEM_NAME
      ,MEM_JOB
      ,MEM_MILEAGE
FROM MEMBER
WHERE MEM_JOB = '�ڿ���';

-----------07.05------
--P.264
--- SET (����)�� ����Ҽ� �ִ���?
---1. �÷��� ���� �����ؾ���
---2. �����Ǵ� �ڷ����� �����ϴ�
--- �ڡڡڡڡڡڡڡ�   EXISTS �ɰ� : A ���հ� B ���� ���̿� AND EXISTS�� �����Ű�� 
               --�ڡڡڡڡڡڡڡڡ�  B���տ� �Ӽ��� ������� �ۼ����ָ� �������� �ȴ�.
               
               
---A 2005�⵵ 4�� �ǸŻ�ǰ
SELECT DISTINCT A.CART_PROD �ǸŻ�ǰ
      ,P.PROD_NAME  ��ǰ��
      ,P.PROD_SALE
     
FROM CART A, PROD P
WHERE A.CART_PROD = P.PROD_ID
AND SUBSTR(A.CART_NO,1,8) BETWEEN '20050401' AND '20050430'
AND EXISTS(
--B 2005�⵵ 6�� �ǸŻ�ǰ
SELECT DISTINCT C.CART_PROD �ǸŻ�ǰ
      ,P.PROD_NAME ��ǰ��
FROM CART C, PROD P
WHERE C.CART_PROD = P.PROD_ID
AND C.CART_NO LIKE '200506%'
AND C.CART_PROD = A.CART_PROD  --- �ڡڡڡڡ�
);

--- EXISTS �����
--A����
SELECT A.MEM_ID
      ,A.MEM_NAME
FROM MEMBER A
WHERE A.MEM_MILEAGE > 1000

AND EXISTS(
--B����
SELECT 1
FROM MEMBER B
WHERE B.MEM_JOB = '�л�'
AND A.MEM_ID = B.MEM_ID     --- �ڡڡڡڡ�
);

--P.265
--2005�⵵ ���űݾ� 2õ�� �̻� ��������� �����Ͽ� 
--�˻��Ͻÿ� ?
--(Alias�� ȸ��ID, ȸ����, '�������)
--(���űݾ� : SUM(CART.CART_QTY * PROD.PROD_SALE))
--A���̺�
SELECT M.MEM_ID ȸ��ID
     , M.MEM_NAME ȸ����
     , �����  �����
FROM   MEMBER A;

--2005�⵵ ���űݾ� 2õ�� �̻� �����
SELECT M.MEM_ID
      ,SUM(C.CART_QTY * P.PROD_SALE)
FROM MEMBER M, CART C, PROD P
WHERE P.PROD_ID = C.CART_PROD
AND   M.MEM_ID = C.CART_MEMBER
AND   C.CART_NO LIKE '2005%'
GROUP BY M.MEM_ID
HAVING SUM(C.CART_QTY * P.PROD_SALE)>= 20000000 ;
-----------------------------------
--A���̺�
SELECT A.MEM_ID ȸ��ID
     , A.MEM_NAME ȸ����
     , '�����' �����
FROM   MEMBER A

WHERE EXISTS(

--2005�⵵ ���űݾ� 2õ�� �̻� �����
SELECT 1

     --  M.MEM_ID
     -- ,SUM(C.CART_QTY * P.PROD_SALE)
FROM MEMBER M, CART C, PROD P
WHERE P.PROD_ID = C.CART_PROD
AND   M.MEM_ID = C.CART_MEMBER
AND   C.CART_NO LIKE '2005%'
GROUP BY M.MEM_ID
HAVING SUM(C.CART_QTY * P.PROD_SALE)>= 20000000 
AND A.MEM_ID = M.MEM_ID    --�ڡڡڡڡڡڡڡڡڡڡڡڡ�
);


--------------------------------------------------------------------
--EXISTST 2������
--2005�⵵ ���Աݾ� 1õ���� �̻� ����ŷ�ó�� �����Ͽ�
--�˻��Ͻÿ�  ?
--(ALIAS �� �ŷ�ó�ڵ�, �ŷ�ó��, '����ŷ�ó')
--���űݾ� : SUM(BUYPROD.BUY_QTY*BUYPROD.BUY_COST))

--A
SELECT A.BUYER_ID
      ,A.BUYER_NAME
      , '����ŷ�ó' ����ŷ�ó
FROM BUYER A

WHERE EXISTS(

--2005�⵵ ���Աݾ� 1õ���� �̻�
--B
SELECT P.PROD_BUYER
      ,SUM(BP.BUY_QTY * BP.BUY_COST)
FROM PROD P, BUYPROD BP
WHERE P.PROD_ID = BP.BUY_PROD
AND BP.BUY_DATE LIKE '05%'
AND A.BUYER_ID = P.PROD_BUYER   --�ڡڡڡڡڡڡڡڡڡڡ�

GROUP BY P.PROD_BUYER
HAVING SUM(BP.BUY_QTY * BP.BUY_COST) >= 10000000
);



---------------
--P.266
--2005�⵵ ��ǰ�� ����, ������Ȳ�� ��ȸ (UNION�� ���)

--A
SELECT TO_CHAR(BUY_DATE,'YYYY/MM/DD')  ����
      ,A.PROD_NAME ��ǰ��
      ,BP.BUY_QTY   ����
      , '����' ����
FROM  BUYPROD BP, PROD A
WHERE BUY_PROD = PROD_ID
AND BUY_DATE BETWEEN '2005-01-01' AND '2005-12-31'

UNION

--B
SELECT TO_CHAR(TO_DATE(SUBSTR(CART_NO,1,8),'YYYY/MM/DD'),'YYYY/MM/DD')  ����
      ,P.PROD_NAME  ��ǰ��
      ,C.CART_QTY
      , '����' ����
FROM CART C, PROD P      
WHERE C.CART_PROD = P.PROD_ID
AND C.CART_NO LIKE '2005%'
ORDER BY 1, ��ǰ��;


----P.267
----����� ����
----RANK() : ���� ����Լ�
----DENSE_RANK() : ���� ��� �Լ�(���� ���ϰ��� �ϳ��� �����Ͽ� ���� �ο�)
--���� �ο�)
SELECT RANK('c001')
      WITHIN GROUP (ORDER BY CART_MEMBER) RANK
      , DENSE_RANK('c001')
WITHIN GROUP(ORDER BY CART_MEMBER) DENSE_RANK
FROM CART;


SELECT CART_MEMBER
FROM CART
ORDER BY 1;

--�м��빮��
--��ٱ��� (CART) ���̺��� ȸ������  ȸ�����̵�� 
--���ż�, ���ż����� ���
SELECT CART_MEMBER
      ,CART_QTY
      , RANK() OVER(ORDER BY CART_QTY DESC) AS RANK
      , DENSE_RANK() OVER(ORDER BY CART_QTY DESC) AS RANK_DESC
FROM CART;

--CART ���̺��� ���̵� 'a001'�� ȸ����
--ȸ�����̵�, ��ǰ�ڵ�, ���ż�, ���ż������� ���
--���Կ� ���� ���Ұ� --> �м��빮������ Ǯ��

SELECT CART_MEMBER  ȸ��ID
      ,CART_QTY     ���ż�
      ,CART_PROD      ��ǰ�ڵ�
      ,RANK() OVER(ORDER BY CART_QTY DESC) ����
      ,DENSE_RANK() OVER(ORDER BY CART_QTY DESC) ����
FROM CART
WHERE CART_MEMBER = 'a001';

--CART ���̺��� ����Ͽ� ȸ�����̵�, ���ż� 
-- ȸ���� ���ż����� ���

SELECT CART_MEMBER ȸ�����̵�
      ,CART_QTY ���ż�
      ,RANK() OVER (PARTITION BY CART_MEMBER ORDER BY CART_QTY DESC) ȸ�������ż�����
FROM CART;

---P.268
--ROWNUN : ����Ŭ ���������� ó���ϱ� ���� �� ���ڵ忡 ���� �ϷĹ�ȣ

SELECT ROWNUM
      ,L.LPROD_ID
      ,L.LPROD_GU
      ,L.LPROD_NM
FROM LPROD L;


-----
SELECT T.*
FROM
(
---INLINE VIEW (ROUWNUM �߾���)
SELECT ROWNUM RNUM
      ,L.LPROD_ID
      ,L.LPROD_GU
      ,L.LPROD_NM
FROM LPROD L

) T
WHERE T.RNUM BETWEEN (2*5)-4 AND (3*5)
;

--P.0269 (W�߾Ⱦ���)
--ROWID : ���̺��� Ư�� ���ڵ�� �����ϰ� �����ϱ� ����
--         ������ �ּҰ�, �����ͺ��̽� ������ ������ ����



SELECT LPROD_GU
      ,LPROD_NM
      ,ROWID
      FROM LPROD
      ORDER BY 3 ASC;
      
      

--RATIO_TO_REPORT : ��ü��� ROW�� ����
--�����ϴ� ������ ������

SELECT T1.VAL
      ,RATIO_TO_REPORT(T1.VAL) OVER() * 100 || '%'
FROM
(

----UNION : �ߺ� 1ȸ �ڵ�����O / UNION ALL : �ߺ� ��� , �ڵ�����X
      
  SELECT 10 VAL FROM DUAL
  UNION ALL
  SELECT 20 VAL FROM DUAL
  UNION ALL 
  SELECT 30 VAL FROM DUAL
  UNION ALL
  SELECT 40 VAL FROM DUAL
  )T1;


--a001ȸ���� ������ ��ǰ�� ������ Ȱ���Ͽ�
--���Ű��� (cart_qty) ��� �ش� ���Ű��� ����
--�����ϴ� ������ ���ϱ�
--alias : ȸ��id, ��ǰ�ڵ�, ���ż�, ��������

SELECT CART_PROD  ��ǰ�ڵ�
      ,CART_MEMBER ȸ��ID
      ,CART_QTY ���ż�
      ,ROUND(RATIO_TO_REPORT(CART_QTY) OVER () *100,2) ��������
        
FROM CART
WHERE CART_MEMBER = 'a001';    
      
---P.270
---ROLLUP : �Ұ踦 ���ϴ� ��
--��ǰ�з���, �ŷ�ó�� �԰���� �԰����� ���� ���غ���
--ALIAS : PROD_LGU , PROD_BUYER, IN_AMT, SUM_COST

SELECT P.PROD_LGU
      ,P.PROD_BUYER
      ,COUNT(BP.BUY_PROD) IN_AMT
      ,SUM(BP.BUY_COST) SUM_COST
FROM PROD P, BUYPROD BP
WHERE P.PROD_ID = BP.BUY_PROD
GROUP BY ROLLUP(P.PROD_LGU, P.PROD_BUYER);


----ROLLUP�� UNION ALL �� �ٲٱ�
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

--CUBE : ��� �Ұ�
SELECT P.PROD_LGU
      ,P.PROD_BUYER
      ,COUNT(BP.BUY_PROD) IN_AMT
      ,SUM(BP.BUY_COST) SUM_COST
FROM PROD P, BUYPROD BP
WHERE P.PROD_ID = BP.BUY_PROD
GROUP BY CUBE(P.PROD_LGU, P.PROD_BUYER);

---CUBE --> UNION ALL�� ��ȯ
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
-----> ��� ����


--------GROUP BY CUBE(A,B)
-----> GROUP BY A,B
-----> UNION ALL
-----> GROUP BY A
-----> UNION ALL
-----> GROUP BY B
-----> UNION ALL
-----> ��� ����


---P.273
---GROUPING SET �Լ� : �׷��� ������ �������ϰ�� ���

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

---> ���� ���� GROUPING SET���� �ٲܰ��
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
-- LAG �Լ� : �������� ������ 
SELECT LPROD_GU
      ,LPROD_NM
      ,LAG(LPROD_GU) OVER (ORDER BY LPROD_GU ASC) ����������
FROM LPROD;

--LEAD �Լ� : �������� ������
SELECT LPROD_GU
      ,LPROD_NM
      ,LEAD(LPROD_GU) OVER (ORDER BY LPROD_GU ASC) ����������
FROM LPROD;


--P.295---07.06
/
SET SERVEROUTPUT ON;
/
DECLARE
 v_i        NUMBER(9,2) := 123456.78;
 v_str      VARCHAR2(20) := 'ȫ�浿';
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
    v_name := 'ȫ�浿';
--  DBMS_OUTPUT.ENABLE;
    DBMS_OUTPUT.PUT_LINE('v_i :' || v_i);
    DBMS_OUTPUT.PUT_LINE('v_name :' || v_name);
    DBMS_OUTPUT.PUT_LINE('c_pi :' || c_pi);
    DBMS_OUTPUT.PUT_LINE('v_date :' || v_date);
END;
/
    
---�б⹮
--P.296
--������ TRUE�̸� ���� ������ �����ϰ�,
--������ FALSE �� ���õ� ������ ����Ѵ�.
--ELSIF���� ������ �����ϴ�, ELSE ���� �Ѱ��� �����ϴ�

DECLARE
V_NUM NUMBER := 37;
BEGIN 
--DBMS_OUTPUT.ENABLE;
IF MOD(V_NUM, 2) = 0 THEN
DBMS_OUTPUT.PUT_LINE( V_NUM || '�� ¦��');

ELSE
DBMS_OUTPUT.PUT_LINE(V_NUM || '�� Ȧ��');
END IF;
END;
/

--P.296
--���ǿ� ���� ���� ELSIF

DECLARE
V_NUM  NUMBER := 55;
BEGIN
DBMS_OUTPUT.ENABLE;
IF V_NUM > 90 THEN
DBMS_OUTPUT.PUT_LINE('��');

ELSIF V_NUM > 80 THEN
DBMS_OUTPUT.PUT_LINE('��');


ELSIF V_NUM > 70 THEN
DBMS_OUTPUT.PUT_LINE('��');

ELSE
DBMS_OUTPUT.PUT_LINE('�й��ض� �ּ���');
END IF;
END;
/


---- SELECT , INTO ��

DECLARE
--������ ���� : SCALAR(�Ϲ�), REFERENCE(����), COMPOSITE(�迭), BIND(���ε� IN/OUT)
-- ��ǰ���̺��� �ǸŰ��÷��� �ڷ��� �� ũ�⸦ ����.
V_AVG_SALE PROD.PROD_SALE%TYPE;
V_SALE NUMBER := 500000;
BEGIN
SELECT AVG(PROD_SALE) INTO V_AVG_SALE FROM PROD;
IF V_SALE < V_AVG_SALE THEN
DBMS_OUTPUT.PUT_LINE('��� �ܰ��� 500000 �ʰ��Դϴ�.');
ELSE 
DBMS_OUTPUT.PUT_LINE('��մܰ��� 500000 �����Դϴ�.');
END IF;
END;
/

--P.297
--ȸ�����̺��� ���̵� 'e001' �� ȸ����  
--���ϸ����� 5000�� ������ 'VIP ȸ��' 
--�׷��� �ʴٸ� '�Ϲ�ȸ��'���� 
--����Ͻÿ�. (ȸ���̸�, ���ϸ��� ����)

/
DECLARE
--SCALAR ����
V_MILEAGE NUMBER;



BEGIN
SELECT MEM_MILEAGE INTO V_MILEAGE
FROM MEMBER WHERE MEM_ID = 'e001';

IF V_MILEAGE > 5000 THEN
DBMS_OUTPUT.PUT_LINE('VIPȸ��');

ELSE
DBMS_OUTPUT.PUT_LINE('�Ϲ�ȸ��');

END IF;
END;
/

--P.297 
--CASE �� :SQL���� ����ϴ� CASE���� ������
--         �������� END CASE�� �����ٴ� ����

DECLARE
V_NUM NUMBER := 77;

BEGIN
V_NUM := TRUNC(V_NUM /10);

CASE V_NUM
WHEN 10 THEN
DBMS_OUTPUT.PUT_LINE('��' || '(' || V_NUM || ')');

WHEN 9 THEN
DBMS_OUTPUT.PUT_LINE('��' || '(' || V_NUM || ')');

WHEN 8 THEN
DBMS_OUTPUT.PUT_LINE('��' || '(' || V_NUM || ')');

WHEN 7 THEN
DBMS_OUTPUT.PUT_LINE('��' || '(' || V_NUM || ')');

ELSE
DBMS_OUTPUT.PUT_LINE('�й��սô�');
END CASE;
END;
/

--��ǰ�з��� ȭ��ǰ�� ��ǰ�� ����ǸŰ���
--���� �� ����ǸŰ��� 3,000�� �̸��̸� 
--�δ�, 3,000�� �̻� ~ 6,000�� �̸��̸� ����,
--6,000�� �̻� ~ 9,000�� �̸��̸� ��δ�,
--9,000�� �̻��̸� �ʹ���δٸ� ����ϱ�
--��, CASE �� (SEARCHED CASE EXPRESSION) ����Ͽ� ó���ϱ�
--������� : ȭ��ǰ�� ����ǸŰ��� 5000���̰� �����̴�.

/
DECLARE
V_AVG_SALE NUMBER;

BEGIN

SELECT ROUND(AVG(NVL(PROD_SALE,0)),2) INTO V_AVG_SALE 
FROM PROD
WHERE PROD_LGU = (SELECT LPROD_GU FROM LPROD WHERE LPROD_NM = 'ȭ��ǰ');

DBMS_OUTPUT.PUT_LINE('V_AVG_SALE :' || V_AVG_SALE);

CASE WHEN V_AVG_SALE < 3000 THEN
DBMS_OUTPUT.PUT_LINE('ȭ��ǰ�� ����ǸŰ���' || V_AVG_SALE || '�̰� �δ�');

WHEN V_AVG_SALE >= 3000 AND V_AVG_SALE < 6000 THEN
DBMS_OUTPUT.PUT_LINE('ȭ��ǰ�� ����ǸŰ���' || V_AVG_SALE || '�̰� �����̴�');

WHEN V_AVG_SALE >= 6000 AND V_AVG_SALE < 9000 THEN
DBMS_OUTPUT.PUT_LINE('ȭ��ǰ�� ����ǸŰ���' || V_AVG_SALE || '�̰� ��δ�');

WHEN V_AVG_SALE >= 9000 THEN
DBMS_OUTPUT.PUT_LINE('ȭ��ǰ�� ����ǸŰ���' || V_AVG_SALE || '�̰� �ʹ� ��δ�');

ELSE 
DBMS_OUTPUT.PUT_LINE('ȭ��ǰ����ǸŰ���' || V_AVG_SALE || '�̰� ��Ÿ�̴�');
END CASE;
END;
/


--����ġ ��ü�� ������ �˻��Ͽ�
--������ ���� ����ϱ�
--�뱸, �λ� : �泲
--���� : ��û
--����, ��õ : ������
--��Ÿ : ��Ÿ
--��, CASE�� ����ϱ�

/

DECLARE
V_BUYER_ADD1 VARCHAR2(60);

BEGIN
SELECT SUBSTR(BUYER_ADD1,1,2) INTO V_BUYER_ADD1
FROM BUYER
WHERE BUYER_NAME = '����ġ';

DBMS_OUTPUT.PUT_LINE('�ּ� : ' || V_BUYER_ADD1);

CASE WHEN V_BUYER_ADD1 = '�뱸' OR V_BUYER_ADD1 =  '�λ�' THEN
DBMS_OUTPUT.PUT_LINE('�泲�� ' || V_BUYER_ADD1 || ' �̴�');


ELSE
DBMS_OUTPUT.PUT_LINE('�泲��' || V_BUYER_ADD1 || '�̴�');

END CASE;
END;
/


---------------------

DECLARE
    V_ADD1 VARCHAR2(60);
BEGIN
    --�뱸
    SELECT SUBSTR(BUYER_ADD1,1,2) INTO V_ADD1
    FROM   BUYER WHERE BUYER_NAME = '����ġ';
    
    --�뱸, �λ� : �泲
    CASE WHEN V_ADD1 IN('�뱸','�λ�') THEN
            DBMS_OUTPUT.PUT_LINE('�뱸, �λ� : �泲');
    --���� : ��û
         WHEN V_ADD1 IN('����') THEN
            DBMS_OUTPUT.PUT_LINE('���� : ��û');
    --����, ��õ : ������  
         WHEN V_ADD1 IN('����','��õ') THEN
            DBMS_OUTPUT.PUT_LINE('����, ��õ : ������');
    --��Ÿ : ��Ÿ
         ELSE
            DBMS_OUTPUT.PUT_LINE('��Ÿ');
    END CASE;
END;
/

----------------------
--CASE����
--��ٱ��� ���̺��� 2005�⵵ a001 ȸ���� ���űݾ��� ���� ���ؼ�
--1000���� �̸��� '�����', 1000���� �̻� 2000���� �̸��� '�ǹ�',
--2000���� �̻� 3000���� �̸��� '���', 3000���� �̻� 4000���� �̸��� '�÷�Ƽ��'
-- �� �̻��� '���̾�'
--����غ���
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
                DBMS_OUTPUT.PUT_LINE('���űݾ��� ���� ' || V_QTY || '�̰� ������̴�');
            WHEN V_QTY >= 1000 AND V_QTY < 2000 THEN
                DBMS_OUTPUT.PUT_LINE('���űݾ��� ���� ' || V_QTY || '�̰� �ǹ��̴�');
            WHEN V_QTY >= 2000 AND V_QTY < 3000 THEN
                DBMS_OUTPUT.PUT_LINE('���űݾ��� ���� ' || V_QTY || '�̰� ����̴�');
            WHEN V_QTY >= 3000 AND V_QTY < 4000 THEN
                DBMS_OUTPUT.PUT_LINE('���űݾ��� ���� ' || V_QTY || '�̰� �÷�Ƽ���̴�');
            ELSE
                DBMS_OUTPUT.PUT_LINE('���űݾ��� ���� ' || V_QTY || '�̰� ���̾��̴�');
    END CASE;
END;
/

--CASE ���� 
--ȸ�����̺��� ������ ������ ȸ���� �˻��Ͽ�
--ȸ������ 3�� �̸��̸� '�Ҹ���
--3���̻� 6�� �̸� '��Ŭ'
--6�� �̻� 9�� �̸� '���Ƹ�'
-- �� �̻��̸� '��ȸ' ����� ����غ���


/
DECLARE
V_MEMBER VARCHAR2(30);

BEGIN
SELECT COUNT(MEM_ID) INTO V_MEMBER      
FROM MEMBER
WHERE SUBSTR(MEM_ADD1,1,2) = '����';

CASE WHEN V_MEMBER < 3 THEN
    DBMS_OUTPUT.PUT_LINE('������ ��� ��  ' || V_MEMBER || '���� �Ҹ����̴�');
    WHEN  V_MEMBER >=3 AND V_MEMBER <6 THEN
    DBMS_OUTPUT.PUT_LINE('������ ��� �� ' || V_MEMBER || '���� ��Ŭ�̴�');
    WHEN  V_MEMBER >=6 AND V_MEMBER <9 THEN
    DBMS_OUTPUT.PUT_LINE('������ ��� �� ' || V_MEMBER || '���� ���Ƹ��̴�');
    ELSE
    DBMS_OUTPUT.PUT_LINE('������ ��� �� ' || V_MEMBER || '�� �̻��� ��ȸ�̴�');
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
WHERE MEM_ADD1 LIKE '����%';
----SEARCHED CASE EXPRESSION
CASE WHEN CNT_MEM < 3 THEN
       DBMS_OUTPUT.PUT_LINE('�Ҹ���');
     WHEN CNT_MEM >=3 AND CNT_MEM <  6 THEN 
        DBMS_OUTPUT.PUT_LINE('��Ŭ');
     WHEN CNT_MEM >= 6 AND CNT_MEM < 9 THEN
       DBMS_OUTPUT.PUT_LINE('���Ƹ�');
     ELSE
     DBMS_OUTPUT.PUT_LINE('��ȸ');
END CASE;
END;
/


--P.298
--WHILE : �ݺ��ɶ����� ������ Ȯ��. ������ TRUE �̾�� LOOP ����
---1~10���� ���ϱ�
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
    DBMS_OUTPUT.PUT_LINE('1���� 10������ �� =' || V_SUM);
    END;
    /
    
    --P. 298
    --���� WHILE ���� ����Ͽ� ������ �����
    
/
DECLARE
V_A NUMBER := 2;
V_B NUMBER := 1;
BEGIN
    WHILE V_A<=9 LOOP
    DBMS_OUTPUT.PUT_LINE(V_A || '��');
    
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
 ---LOOP��
 -- ������ ���� �ܼ��� ���� ����(���ѹݺ�)
 --EXIT ���� ����Ͽ� �ݺ����� ��������

/
 SET SERVEROUTPUT ON;
/

 DECLARE
 V_VAR NUMBER := 1; 
 BEGIN 
    LOOP
    
    --V_VAR:  ������ ����  
    DBMS_OUTPUT.PUT_LINE(V_VAR);   
    V_VAR := V_VAR +1;
    --���� ������>
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
 --��������
 V_SUM NUMBER := 0;
 
 BEGIN 
    LOOP
    
    --V_VAR:  ������ ����  
    DBMS_OUTPUT.PUT_LINE(V_VAR);   
    -- ���� := ���� + �������
    V_VAR := V_VAR +1;
    V_SUM := V_SUM + V_VAR;
    
    --���� ������>
    IF V_VAR > 10 THEN
        EXIT;
        END IF;
    END LOOP;  
    DBMS_OUTPUT.PUT_LINE('1���� 10������ �� = ' || V_SUM);
 END;
 /    


-----P.300
--GOTO
-- I GO TO SCHOOL BY BUS.

/
DECLARE
V_VAR NUMBER :=1;
--���� ����
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
--LOOP �� EXIT WHEN ������ ����Ͽ�
--�������� ����ϱ�
--2�ܺ��� 9�ܱ��� ���



/
DECLARE
    V_DAN NUMBER := 2;
    V_NUM NUMBER := 1;    
    
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE(V_DAN || '��');
            
    -----------������ ���--------------------
        LOOP 
        DBMS_OUTPUT.PUT_LINE(V_DAN || ' X ' || V_NUM || '=' || (V_DAN *V_NUM));                         
        V_NUM := V_NUM +1;  
        
        -- V_NUM�� 10�� �Ǵ� ���� �ݺ����� ������
        EXIT WHEN V_NUM > 9;
        END LOOP;
            
            V_NUM := 1;           
            V_DAN := V_DAN +1;
     ------������ ��� ��------------
     
     
            --- V_DAN�� 10�̵Ǹ� ����������          
            EXIT WHEN V_DAN > 9;
            END LOOP;
            END;
 /
-------------------------------
--P.300
--FOR��

DECLARE
    I NUMBER; -- ���� ����
BEGIN
    -- I : �ڵ����� ������ ����.
    --������ DECLARE���� �������� �ʴ��� ���������� �ڵ����� ����Ǵ� �����ν�
    --���������� �ڵ����� ����Ǵ� ����
    --�⺻������ 1�� ������
    --1..10 => 1�� ���� ��, 10�� ���ᰪ,
    -- ���۰� �տ� REVERSE �� �մٸ� 1�� ���ҵ�. REVERSE 1..10
    
    FOR I IN REVERSE 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/

/

DECLARE
BEGIN 
    FOR V_DAN IN 2..9 LOOP
        DBMS_OUTPUT.PUT_LINE(V_DAN || '��');
        
            
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
--�� ���� ����

/
DECLARE
BEGIN
    --7��
    FOR I IN 1..7 LOOP
    --1~7�� 
    FOR J IN 1..I LOOP
    DBMS_OUTPUT.PUT('*');
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
END;    
/
----P.301
--EXCEPTION(���� ó�� , ���� ó��)
--  1. ���ǵ� ORCALE SERVER ERROR (�����ʿ� X , ���� �߻��ϴ� ����)
--  2. ���ǵ��� ���� ORCALE SERVER ERROR (���� �ʿ�, �Ͻ������� �߻�)
--  3. ����� ���� ERROR (

--��ǰ�з��ڵ尡 P201�� ��ǰ�з���? ���� ĳ���
DECLARE
    V_NM VARCHAR2(60);
BEGIN
    SELECT LPROD_NM + 0 INTO V_NM
    FROM LPROD
    WHERE LPROD_GU = 'P201';  --P201, P202..
    DBMS_OUTPUT.PUT_LINE('V_NM : '  || V_NM);
    --���ǵ� ���� ó��
    EXCEPTION
        WHEN NO_DATA_FOUND THEN ---ORA-01403
            DBMS_OUTPUT.PUT_LINE('�ش� �����Ͱ� �����ϴ�');
        WHEN TOO_MANY_ROWS THEN    --ORA--01422
            DBMS_OUTPUT.PUT_LINE('�� �� �̻��� ���� ���Խ��ϴ�');        
        WHEN OTHERS THEN --ORA-01722
            DBMS_OUTPUT.PUT_LINE('��Ÿ���� : ' || SQLERRM);
END;
/


----
--id�� z001�� ȸ���� �̸��� ������ ���ϱ�
--��, �ش� ������ ���� ��� ����ó�� �Ͻÿ�
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
        DBMS_OUTPUT.PUT_LINE('�ش絥���Ͱ� �����ϴ�');
        WHEN OTHERS THEN --ORA-01722
        DBMS_OUTPUT.PUT_LINE('�����߻� : ' || SQLERRM);
END;
/

---P.301
-- ���� ���� �ʴ� ������ ���
/
DECLARE
    --EXCEPTION�� ���� ����
    EXP_REFERENCE EXCEPTION;
    --EXCEPTION�� ������ 2292�� ������ ����
    PRAGMA EXCEPTION_INIT(EXP_REFERENCE, -2292);
BEGIN
    --ORA-02292(CHILD RECORD FOUND)
    DELETE FROM LPROD WHERE LPROD_GU = 'P101';  --integrity constraint : ���Ἲ ����

    EXCEPTION
        WHEN EXP_REFERENCE THEN
            DBMS_OUTPUT.PUT_LINE('�����Ұ� : ' || SQLERRM);
        WHERE OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('��Ÿ���� : ' || SQLERRM);
END;
/

---P.302 ����� ���� ERROR
ACCEPT P_LGU PROMPT '����Ϸ��� ��ǰ�з��ڵ带 �Է��ϼ���:'
DECLARE
    
    --EXCEPTION �� ����
    EXP_LPROD_GU EXCEPTION;
    
    --ACCEPT�� P_LGU ������ ���� ����Ϸ��� �ּҸ� ã�ư�����.
    V_LGU VARCHAR2(10) := '&P_LGU';
BEGIN
    IF V_LGU IN ('P101','P102','P201','P202') THEN
        --�߻�Ű��
        RAISE EXP_LPROD_GU;
    END IF;
        DBMS_OUTPUT.PUT_LINE('��ϰ���');
    EXCEPTION
        WHEN EXP_LPROD_GU THEN
            DBMS_OUTPUT.PUT_LINE(V_LGU || '�� ��ϺҰ�');
        
END;
/


---CURSOR
--2005�⵵ ��ǰ�� ���Լ����� �հ�
/
DECLARE
    V_PROD VARCHAR2(20);
    V_QTY NUMBER;
    -- Ŀ�� ����
    CURSOR GAEDDONGI IS
        SELECT BUY_PROD, SUM(BUY_QTY) FROM BUYPROD
        WHERE EXTRACT(YEAR FROM BUY_DATE) = 2005
        GROUP BY BUY_PROD ORDER BY BUY_PROD ASC;
BEGIN
    --�����͸� �޸𸮷� BIND(�ø�)
    OPEN GAEDDONGI;
    --�۾� ����
    --���� ���� ����Ŵ ��ġ -> ���
    FETCH GAEDDONGI INTO V_PROD, V_QTY;
    DBMS_OUTPUT.PUT_LINE(V_PROD || ',' || V_QTY);
    FETCH GAEDDONGI INTO V_PROD, V_QTY;
    DBMS_OUTPUT.PUT_LINE(V_PROD || ',' || V_QTY);
    
    --�����͸� �޸𸮿��� ����
    CLOSE GAEDDONGI;
END;
/

/
--CURSOR
--2005�⵵ ��ǰ�� ���Լ����� �հ�
DECLARE
    V_PROD VARCHAR2(20);
    V_QTY NUMBER;
    --Ŀ�� ����
    CURSOR GAEDDONGI IS
        SELECT BUY_PROD, SUM(BUY_QTY) FROM BUYPROD
        WHERE EXTRACT(YEAR FROM BUY_DATE) = 2005
        GROUP BY BUY_PROD ORDER BY BUY_PROD ASC;
BEGIN
    --�����͸� �޸𸮷� BIND(�ø�)
    OPEN GAEDDONGI;
    
    -p-
    --�۾� ����
    --���� ���� ����Ŵ. ����
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
    
    --�����͸� �޸𸮿��� ����
    CLOSE GAEDDONGI;
END;
/

--07.11


--������ ������ �޾� �̸�ȸ����� ���ϸ����� ����ϴ� Ŀ��

/
SET SERVEROUTPUT ON; 

ACCEPT V_JOB PROMPT '������ �Է����ּ���:'
/
DECLARE
    V_NAME VARCHAR2(60);
    V_MILEAGE NUMBER;
-- SELECT ��� ���տ� CUR��� �̸��� ����
CURSOR CUR IS
SELECT MEM_NAME
        , MEM_MILEAGE
        FROM MEMBER
        WHERE MEM_JOB = '&V_JOB';
BEGIN
  -- ������ �޸𸮷� ���ε�
    OPEN CUR;
    
    --�����
    FETCH CUR INTO V_NAME, V_MILEAGE;
    --��ġ�޴��� �����Ͱ� �ճ�?
    WHILE CUR%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE(V_NAME ||
    ',' || V_MILEAGE);
    FETCH CUR INTO V_NAME, V_MILEAGE;
    END LOOP;
    --�޸𸮿��� ����
    CLOSE CUR;
END;
/

--FORLOOP�� �̿��ϴ� CURSOR
--�� �ݺ��ϴ� ���� Ŀ���� �ڵ����� OPEN �ϰ� ������� ó���Ǹ�
--�ڵ����� Ŀ���� CLOSE �Ѵ�.

/
ACCEPT V_JOB PROMPT '������ �Է����ּ���:'
/
DECLARE
-- SELECT ��� ���տ� CUR��� �̸��� ����
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
ACCEPT V_JOB PROMPT '������ �Է����ּ���:'
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


--CURSOR ����

/*
ȸ���� ����ݾ��� �� SUM(PROD_SALE*CART_QTY)
�� 2000000�� �ʰ��ϴ� ȸ���� ����غ���
*/

--ALIAS : ȸ��ID, ȸ����, ����ݾ� ��
--CURSOR�� ����ؼ� ����غ���


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
    
---������ Ǯ��-----  HAVING �� ���� ������ ��ߵ�.

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

--������ ����� �̸� ������ �� SQL �����

-- �������ν����� ó�� ����ɶ� ������ �˻��ϰ� �����ϵȴ�.
--�����ϵ� ������ ���ν��� ĳ�ÿ� ����ǹǷ� ���Ŀ� ȣ��ɶ� ������ ����ɼ� �ִ�.

--Ŭ���̾�Ʈ�� ó�� �縰 ����



---- P.304
-- ��ǰ�ڵ带 �Ű����� (parameter)�� �Ͽ� ������ ADD

SELECT PROD_ID
    ,PROD_TOTALSTOCK
FROM PROD

----------���ν��� ����
--������ : �����м� + �ǹ̺м��� ó���ǰ�, ������ ĳ�ð����� �����.
-- ����Ŭ�� �����ϴ� ���� �ٲ�

--BINT���� : �Ű�����(�Ķ����(�μ�)�� ó��)
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
        DBMS_OUTPUT.PUT_LINE('�����߻� : ' || SQLERRM);
        

END;
/
EXEC USP_UPDATE('P102000006',50);
/

------------------------------------

--���ν��� ��������1
CREATE TABLE PROCTEST(
  PROC_SEQ NUMBER,
  PROC_CONTENT VARCHAR2(30),
  CONSTRAINT PK_PROCTEST PRIMARY KEY(PROC_SEQ)
);

--1-1) ���ν��� PROC_TEST1�� ����.
--�����ϸ� PROCTEST ���̺� 
--1, '������' �����Ͱ� �߰��ǵ��� ó��
--2.  '������2'
--3.  '������3'
SELECT *FROM PROCTEST;

INSERT INTO PROCTEST(PROC_SEQ, PROC_CONTENT) VALUES(1,'������1');
INSERT INTO PROCTEST(PROC_SEQ, PROC_CONTENT) VALUES(2,'������2');
INSERT INTO PROCTEST(PROC_SEQ, PROC_CONTENT) VALUES(3,'������3');

/*
INSERT INTO ���̺�� (�÷����) VALUES (����);

UPDATE ���̺��
SET �÷� = ��
WHERE ����;

DELETE FROM ���̺��
WHERE ����;
*/

CREATE OR REPLACE PROCEDURE PROC_TEST1(V_SEQ IN NUMBER)
IS
BEGIN
INSERT INTO PROCTEST(PROC_SEQ, PROC_CONTENT) VALUES(V_SEQ, ' ������' || V_SEQ);

END;
/
EXEC PROC_TEST1(3);
/

------------------------
--���ν��� ��������1
CREATE TABLE PROCTEST(
  PROC_SEQ NUMBER,
  PROC_CONTENT VARCHAR2(30),
  CONSTRAINT PK_PROCTEST PRIMARY KEY(PROC_SEQ)
);

--1-1) ���ν��� PROC_TEST1�� ����.
--�����ϸ� PROCTEST ���̺� 
--1, '������1' �����Ͱ� �߰��ǵ��� ó��
--2, '������2'
--3, '������3'
--...
SELECT * FROM PROCTEST;
/
CREATE OR REPLACE PROCEDURE PROC_TEST1(V_SEQ IN NUMBER)
IS
BEGIN
    INSERT INTO PROCTEST(PROC_SEQ, PROC_CONTENT) VALUES(V_SEQ,'������'||V_SEQ);
    
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('���� �߻� : ' || SQLERRM);
END;
/
EXEC PROC_TEST1(3);
/


-----------------
--P.305
--ȸ�� ���̵� �Է¹޾� (IN ���ε� ����) �̸��� ��̸� OUT �Ű����� (OUT ���ε庯��)�� ó��
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
--ȸ�����̵�(MEM_ID) �� ������ �Է¹޾� ���ϸ��� ����(MEM_MILEAGE)��
--������Ʈ �ϴ� ���ν���(usp_member_update)�� �����ϱ�
--EXECUTE�� ���� ������(a001)ȸ���� ���ϸ��� ���� 
--100�� �߰��Ͽ� 5ȸ�� ���� 500���� �ø���.





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

---ȸ�����̵� �������� �ش� �̸��� ���� �ϼ��� �Լ� �����
CREATE OR REPLACE FUNCTTON FN_GETNNAME(P_ID IN VARCHAR2)

    
IS
V_NAME


FROM MEMBER
WHERE MEM_ID = P_ID
--���ν����� �޸� �Լ����� RETORN(0)
    RETURN V_NAME;
        EXCEPTION

END;

/
SELECT FN_GETNAME('��Ӵ�') FROM DUAL;


---------------

--�Լ�����
--������ ���� ����Ͻÿ�
-- ��ǰ�ڵ�, ��ǰ��, �Լ����� FN_PRODNM
SELECT PROD_ID ��ǰ�ڵ�
      ,PROD_NAME ��ǰ��
      ,PROD_LGU ��з��ڵ�
      ,PROD_LGU ��з���
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
--�⵵ �� ��ǰ�ڵ带 �Է¹����� �ش�⵵�� ��� �Ǹ� Ƚ���� ��ȯ

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
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('���ܹ߻�'||SQLERRM);
    
END;

/
VAR QTY NUMBER
EXEC :QTY := FN_PRODAVGQTY(P_PROD_ID =>'P10100002');
PRINT QTY
EXEC :QTY := FN_PRODAVGQTY(2005,'P101000002');
PRINT QTY

SELECT PROD_ID
    ,  PROD_NAME
    ,  FN_PRODAVGQTY(2004,PROD_ID) "2004�� ��� �Ǹ�Ƚ��"
    ,  FN_PRODAVGQTY(2005,PROD_ID) "2005�� ��� �Ǹ�Ƚ��"
FROM PROD;


/
SET SERVEROUTPUT ON; 
/


---Ʈ���� ---
CREATE OR REPLACE TRIGGER TG_LPROD_IN
---LPROD ���̺� �����Ͱ� INSERT�� �Ŀ� ....BEGIN�� ó������

AFTER INSERT
ON LPROD
BEGIN
    DBMS_OUTPUT.PUT_LINE('��ǰ�з��� �߰��Ǿ����ϴ�');
    END;
    /
----������� Ʈ���� Ȯ��
SELECT TRIGGER_NAME FROM USER_TRIGGERS;
/

INSERT INTO LPROD(LPROD_ID, LPROD_GU, LPROD_NM) 
VALUES(
(SELECT MAX(LPROD_ID) + 1 FROM LPROD),
(SELECT 'P' || (SUBSTR(MAX(LPROD_GU),2)+1) FROM LPROD),
'Ʈ�����߰���1');

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
    DBMS_OUTPUT.PUT_LINE('��ǰ�з��� �߰��Ǿ����ϴ�');
    ---NEW : ��� INSERT�� ���ο� ����
    INSERT INTO LPROD_BAK(LPROD_ID, LPROD_GU, LPROD_NM)
    VALUES(:NEW.LPROD_ID, :NEW.LPROD_GU, :NEW.LPROD_NM);
    END;
    /
---���� ���� ���̺�
CREATE TABLE EMP01(
    EMPNO NUMBER(4) PRIMARY KEY,
    EMPNAME VARCHAR2(45),
    ENPJOB VARCHAR2(60)
    );
-- �޿� ���� ���̺�
CREATE TABLE SAL01(
SALNO NUMBER(4) PRIMARY KEY,
SAL NUMBER(7,2),
EMPNO NUMBER(4) REFERENCES EMP01(EMPNO)
);

---�޿���ȣ�� �ڵ������ϴ� �������� �����ϰ�
-- �� �������κ��� �ϷĹ�ȣ�� ��� �޿���ȣ�� �ο�
/
CREATE SEQUENCE SAL01_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TRG_02
-- Ÿ�̹� : AFTER(~�Ŀ�), �̺�Ʈ : INSERT(�Է�)
AFTER INSERT
ON EMP01
FOR EACH ROW
BEGIN
    INSERT INTO SAL01 VALUES(
    SAL01_SEQ.NEXTVAL, 200, :NEW.EMPNO);
    END;
    /
    
    INSERT INTO EMP01 VALUES(2201, '������', '���������');
    INSERT INTO EMP01 VALUES(2202, '���˹���', '������');
    /
    SELECT *FROM EMP01;
    SELECT *FROM SAL01;
    SELECT *FROM EMP01 A, SAL01 B WHERE A.EMPNO = B.ENPNO;
    /
    --����� �����Ǹ� �� ����� �޿� ������ �ڵ� �����Ǵ� Ʈ���Ÿ� �ۼ��غ������Ѵ�.
    
    
    DELETE FROM EMP01 WHERE EMPNO=2201;
    DELETE FROM EMP01 WHERE EMPNO=2; 
    /* �����ȣ 3�� �޿� ���̺��� �����ϱ� ������ ������ �Ұ����ϴ�
    ����� �����Ƿ��� �� ����� �޿� ������ �޿� ���̺��� �����Ǿ��
    
    */
    
    CREATE OR REPLACE TRIGER TRG_02
    --- �̺�Ʈ  : DELETE, Ÿ�̹� : AFTER => EMP01 ���̺��� �����Ͱ� ��������  BEGIN ����
    AFTER DELETE
    ON EMP01
    FOR EACH ROW
    BEGIN
        --OLD : 2203 ������ �ζ� ��÷�� ������ ��
        DELETE FROM SAL01 
        WHERE EMPNO= :OLD.EMPNO;
        END;
        /
        
        DELETE FROM EMP01
        WHERE EMPNO = 2201;
        
-------------------��Ű��
--PACKAGE : ���´�
CREATE OR REPLACE PACKAGE PROD_MGR
IS
--�����
    --��������
    P_PROD_LGU  PROD.PROD_LGU%TYPE;  
    --���ν���
    PROCEDURE PROD_LIST;
    PROCEDURE PROD_LIST (P_PROD_LGU  IN  PROD.PROD_LGU%TYPE);
    --�Լ�
    FUNCTION PROD_COUNT RETURN NUMBER;
    --����������
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
              DBMS_OUTPUT.PUT_LINE ( '��ǰ �з��� �����ϴ�.'); 
        WHEN  OTHERS  THEN  
             DBMS_OUTPUT.PUT_LINE ( '��Ÿ ���� :' || SQLERRM  ); 
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
        DBMS_OUTPUT.PUT_LINE ( '��Ÿ ���� :' || SQLERRM  ); 
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


---------------------��Ű�� ���� ���� -------------------
CREATE OR REPLACE PACKAGE PKG_EASY
IS
    V_NAME VARCHAR2(60);
    --ȸ���� ���̵� �� ���ڸ� �޾� ���ϸ��� �ο�
    PROCEDURE PROC_MILEAGE_UP(P_ID IN VARCHAR2, P_MILEAGE IN NUMBER);
    --ȸ���� ���̵� �޾� �̸��� ����
    FUNCTION  FN_GET_NAME(P_ID IN VARCHAR2)
        RETURN VARCHAR2;
END PKG_EASY;
/
CREATE OR REPLACE PACKAGE BODY PKG_EASY
IS
    --ȸ���� ���̵� �� ���ڸ� �޾� ���ϸ��� �ο�->�󼼳���
    PROCEDURE PROC_MILEAGE_UP(P_ID IN VARCHAR2, P_MILEAGE IN NUMBER)
    IS
    BEGIN
        UPDATE MEMBER
        SET    MEM_MILEAGE = MEM_MILEAGE + P_MILEAGE
        WHERE  MEM_ID = P_ID;
    END PROC_MILEAGE_UP;
    
    --ȸ���� ���̵� �޾� �̸��� ����->�󼼳���
    FUNCTION  FN_GET_NAME(P_ID IN VARCHAR2)
        RETURN VARCHAR2
    IS
    BEGIN
        SELECT MEM_NAME INTO V_NAME FROM MEMBER WHERE MEM_ID = P_ID;
        RETURN V_NAME;
    END FN_GET_NAME;
END PKG_EASY;
/
--������� �������� ��
EXEC PKG_EASY.PROC_MILEAGE_UP('a001',500);
/
SELECT MEM_ID, MEM_MILEAGE FROM MEMBER WHERE MEM_ID = 'a001';
/
SELECT PKG_EASY.FN_GET_NAME('a001') FROM DUAL;
/