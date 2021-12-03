CREATE TABLE MEMBERS (
    IDX NUMBER(10) PRIMARY KEY,
    NAME VARCHAR2(30),
    AGE NUMBER(3),
    ADDR VARCHAR2(150),
    REGDATE DATE
);

CREATE SEQUENCE MEMBERS_SEQ NOCACHE;

INSERT INTO MEMBERS
VALUES (MEMBERS_SEQ.NEXTVAL, '홍길동1', 27, '서울', SYSDATE);
INSERT INTO MEMBERS
VALUES (MEMBERS_SEQ.NEXTVAL, '홍길동2', 30, '대전', SYSDATE);
INSERT INTO MEMBERS
VALUES (MEMBERS_SEQ.NEXTVAL, '홍길동3', 40, '대구', SYSDATE);
INSERT INTO MEMBERS
VALUES (MEMBERS_SEQ.NEXTVAL, '홍길동4', 50, '부산', SYSDATE);
COMMIT;
SELECT * FROM MEMBERS ORDER BY NAME;