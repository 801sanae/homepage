select * from BOARD b;

select * from GUESTBOOK g;


select * from member;

--insert
INSERT INTO BOARD
     VALUES (board_no_seq.NEXTVAL,'title','content',123,'mname',0,SYSDATE );
	 

SELECT 
no, title, content, member_no,view_cnt,reg_date
FROM board 
WHERE no=14;
			

--초기화
drop table board;
drop sequence board_no_seq;

drop table member;
drop sequence member_no_seq;

drop table guestbook;
drop sequence guestbook_seq;

CREATE TABLE board
( 
no           NUMBER(8),
title        VARCHAR2(200) NOT NULL,
CONTENT      VARCHAR2(4000) NOT NULL,
member_no    NUMBER(8),
member_name  VARCHAR2(3000),
view_cnt     NUMBER(10),
reg_date     DATE NOT NULL
);

ALTER TABLE board
ADD ( CONSTRAINT board_no_pk PRIMARY KEY ( no ) );

CREATE SEQUENCE board_no_seq
 START WITH     1
 INCREMENT BY   1
 MAXVALUE       99999999
 NOCACHE
 NOCYCLE;			 

CREATE TABLE member
( 
no        NUMBER(8),
name      VARCHAR2(30),
email     VARCHAR2(80),
password  VARCHAR2(30),
gender    VARCHAR2(10)
) ;

ALTER TABLE member
ADD ( CONSTRAINT member_no_pk PRIMARY KEY ( no ) );

CREATE SEQUENCE member_no_seq
 START WITH     1
 INCREMENT BY   1
 MAXVALUE       99999999
 NOCACHE
 NOCYCLE;
 
CREATE TABLE GUESTBOOK (
  NO NUMBER(20) NOT NULL,
  NAME VARCHAR2(20) NOT NULL, 
  PASSWORD VARCHAR2(50) NOT NULL,
  MESSAGE VARCHAR2(2000) NOT NULL,
  REG_DATE DATE,
  PRIMARY KEY (NO) 
);

CREATE SEQUENCE GUESTBOOK_SEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999
NOCACHE
NOCYCLE;			 
				
