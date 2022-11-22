select *
from   mem
where  user_no = '202211002' and user_pw = '1234';

--11/09 attach 백업 테이블 컬럼을 원래 attach 테이블로 옮기기
ALTER TABLE ATTACH
ADD TID VARCHAR2(100);

ALTER TABLE ATTACH
ADD (
    ATTACH_NAME VARCHAR2(300)
   ,ATTACH_SIZE NUMBER
   ,ATTACH_TYPE VARCHAR2(30)
);

COMMIT

CREATE TABLE USERS(
    USERNAME VARCHAR2(150),
    PASSWORD VARCHAR2(150),
    ENABLED VARCHAR2(1),
    CONSTRAINT PK_USERS PRIMARY KEY(USERNAME)
);
COMMENT ON TABLE USERS IS '사용자 관리 테이블';
COMMENT ON COLUMN USERS.USERNAME IS '아이디';
COMMENT ON COLUMN USERS.PASSWORD IS '비밀번호';
COMMENT ON COLUMN USERS.ENABLED IS '사용여부';

CREATE TABLE AUTHORITIES(
    USERNAME VARCHAR2(150),
    AUTHORITY VARCHAR2(150),
    CONSTRAINT PK_AUTHORITIES PRIMARY KEY(USERNAME),
    CONSTRAINT FK_AUTHORITIES FOREIGN KEY(USERNAME)
        REFERENCES USERS(USERNAME)
);

COMMENT ON TABLE AUTHORITIES IS '사용자 권한 정보';
COMMENT ON COLUMN AUTHORITIES.USERNAME IS '아이디';
COMMENT ON COLUMN AUTHORITIES.AUTHORITY IS '권한';

INSERT INTO USERS(USERNAME, PASSWORD) VALUES('user00','1234');
INSERT INTO USERS(USERNAME, PASSWORD) VALUES('member00','1234');
INSERT INTO USERS(USERNAME, PASSWORD) VALUES('admin00','1234');

commit

INSERT INTO AUTHORITIES(USERNAME, AUTHORITY) VALUES('user00','ROLE_USER');
INSERT INTO AUTHORITIES(USERNAME, AUTHORITY) VALUES('member00','ROLE_MEMBER');
INSERT INTO AUTHORITIES(USERNAME, AUTHORITY) VALUES('admin00','ROLE_MEMBER');
INSERT INTO AUTHORITIES(USERNAME, AUTHORITY) VALUES('admin00','ROLE_ADMIN');

COMMIT

--11/10 시큐리티ㅣ 
--MEMBER 테이블을 통해 MEMBER-BNK 테이블로 복제해보자
CREATE TABLE MEMBER_BAK
AS
SELECT * FROM MEMBER;

--MEMBER 테이블 DROP
--DROP TABLE MEMBER;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'MEMBER';

COMMIT

-- 기본키/외래키 제약 사항은 복제가 안됨
CREATE TABLE MEMBER
AS
SELECT * FROM MEM


-- 로그인
SELECT MEM_ID, MEM_PASS, ENABLED FROM MEMBER
WHERE MEM_ID = 'a001';

--권한
SELECT *
FROM MEMBER M, MEMBER_AUTH MA
WHERE M.MEM_ID = MA.MEM_ID
AND M.MEM_ID = 'a001';

----카멜변환
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
WHERE TABLE_NAME = 'MEMBER';


----쿼리 변경 진행
--권한
SELECT *
FROM MEMBER M, MEMBER_AUTH MA
WHERE M.MEM_ID = MA.MEM_ID
AND M.MEM_ID = 'a001';
----------
SELECT *
FROM MEMBER A LEFT OUTER JOIN MEMBER_AUTH AUTH ON(A.MEM_ID = AUTH.MEM_ID)
WHERE A.MEM_ID = 'a001';

---
SELECT A.MEM_ID
     , A.MEM_PASS
     , A.MEM_NAME
     , A.MEM_REGNO1
     , A.MEM_REGNO2
     , A.MEM_BIR
     , A.MEM_ZIP
     , A.MEM_ADD1
     , A.MEM_ADD2
     , A.MEM_HOMETEL
     , A.MEM_COMTEL
     , A.MEM_HP
     , A.MEM_MAIL
     , A.MEM_JOB
     , A.MEM_LIKE
     , A.MEM_MEMORIAL
     , A.MEM_MEMORIALDAY
     , A.MEM_MILEAGE
     , A.MEM_DELETE
     , A.ENABLED
     , AUTH.AUTH
FROM   MEMBER A LEFT OUTER JOIN MEMBER_AUTH AUTH ON(A.MEM_ID = AUTH.MEM_ID)
WHERE  A.MEM_ID = 'a001';

--- 자동로그인을위한 테이블만들기
CREATE TABLE PERSISTENT_LOGINS(
    USERNAME VARCHAR2(150),
    SERIES VARCHAR2(150),
    TOKEN VARCHAR2(150),
    LAST_USED DATE,
    CONSTRAINT PK_PL PRIMARY KEY(SERIES)
);

