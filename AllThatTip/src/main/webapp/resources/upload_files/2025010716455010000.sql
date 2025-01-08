﻿
-------------------------------- 게시판 --------------------------------


DROP TABLE BOARD;
DROP TABLE BOARD_TYPE;
DROP TABLE BD_ATTACHMENT;

DROP TABLE REVIEW;
DROP TABLE REVIEW_ATTACHMENT;

DROP TABLE COMMENT;
DROP TABLE COMMENT_ATTACHMENT;

DROP TABLE REPLY;
DROP TABLE REPLY_ATTACHMENT;


-------------------------------- 기본 게시판 --------------------------------

CREATE TABLE BOARD (
	BOARD_NO		NUMBER		NOT NULL,
	BOARD_TYPE		NUMBER		NOT NULL,
	USER_NO			NUMBER		NOT NULL,
	BOARD_TITLE		VARCHAR2(500)		NOT NULL,
	BOARD_CONTENT	VARCHAR2(4000)		NOT NULL,
	CREATE_DATE		DATE	DEFAULT SYSDATE	NULL,
	COUNT			NUMBER	DEFAULT 0	NULL,
	STAUS			CHAR(1)	DEFAULT Y	NULL
);

COMMENT ON COLUMN BOARD.BOARD_NO IS 'SEQUENCE 사용';

COMMENT ON COLUMN BOARD.STAUS IS '등록시 Y / 삭제 시 N로 업데이트';


CREATE TABLE BOARD_TYPE (
	BOARD_TYPE		NUMBER				NOT NULL,
	BOARD_CD_NAME	VARCHAR2(100)		NULL
);

COMMENT ON COLUMN BOARD_TYPE.BOARD_TYPE IS '10 공지사항 20 FAQ 30 Q&A 40 중고거래';

COMMENT ON COLUMN BOARD_TYPE.BOARD_CD_NAME IS '10 공지사항 20 FAQ 30 Q&A 40중고거래';


CREATE TABLE BD_ATTACHMENT (
	FILE_NO		NUMBER		NOT NULL,
	BOARD_NO	NUMBER		NOT NULL,
	ORIGIN_NAME	VARCHAR2(255 BYTE)		NULL,
	CHANGE_NAME	VARCHAR2(255 BYTE)		NULL,
	FILE_PATH	VARCHAR2(1000 BYTE)		NULL,
	UPLOAD_DATE	DATE	DEFAULT SYSDATE	NULL,
	STATUS		CHAR(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN BD_ATTACHMENT.FILE_NO IS 'SEQUENCE 사용';

COMMENT ON COLUMN BD_ATTACHMENT.BOARD_NO IS 'SEQUENCE 사용';

COMMENT ON COLUMN BD_ATTACHMENT.STATUS IS ''Y'등록 N삭제';

ALTER TABLE BOARD ADD CONSTRAINT PK_BOARD PRIMARY KEY (
	BOARD_NO
);

ALTER TABLE BOARD_TYPE ADD CONSTRAINT PK_BOARD_TYPE PRIMARY KEY (
	BOARD_TYPE
);

ALTER TABLE BD_ATTACHMENT ADD CONSTRAINT PK_BD_ATTACHMENT PRIMARY KEY (
	FILE_NO
);
ALTER TABLE BD_ATTACHMENT ADD CONSTRAINT FK_BOARD_TO_BD_ATTACHMENT FOREIGN KEY (
	BOARD_NO
)
REFERENCES BOARD (
	BOARD_NO
);

ALTER TABLE BOARD ADD CONSTRAINT FK_BOARD_TYPE_TO_BOARD FOREIGN KEY (
	BOARD_TYPE
)
REFERENCES BOARD_TYPE (
	BOARD_TYPE
);

ALTER TABLE BOARD ADD CONSTRAINT FK_MEMBER_TO_BOARD FOREIGN KEY (
	USER_NO
)
REFERENCES MEMBER (
	USER_NO
);

-------------------------------- 리뷰 게시판 --------------------------------

CREATE TABLE REVIEW (
	REVIEW_NO		NUMBER		NOT NULL,
	USER_NO			NUMBER		NOT NULL,
	REVIEW_TITLE	VARCHAR2(500)		NOT NULL,
	REVIEW_CONTENT	VARCHAR2(4000)		NOT NULL,
	CREATE_DATE		DATE	DEFAULT SYSDATE	NULL,
	COUNT			NUMBER	DEFAULT 0	NULL,
	STAUS			CHAR(1)	DEFAULT Y	NULL,
	Key				NUMBER		NOT NULL
);

COMMENT ON COLUMN REVIEW.REVIEW_NO IS 'SEQUENCE 사용';

COMMENT ON COLUMN REVIEW.STAUS IS '등록시 Y / 삭제 시 N로 업데이트';


CREATE TABLE REVIEW_ATTACHMENT (
	FILE_NO		NUMBER		NOT NULL,
	REVIEW_NO	NUMBER		NOT NULL,
	ORIGIN_NAME	VARCHAR2(255 BYTE)		NULL,
	CHANGE_NAME	VARCHAR2(255 BYTE)		NULL,
	FILE_PATH	VARCHAR2(1000 BYTE)		NULL,
	UPLOAD_DATE	DATE	DEFAULT SYSDATE	NULL,
	FILE_LEVEL	NUMBER		NULL,
	STATUS		CHAR(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN REVIEW_ATTACHMENT.FILE_NO IS 'SEQUENCE 사용';

COMMENT ON COLUMN REVIEW_ATTACHMENT.REVIEW_NO IS 'SEQUENCE 사용';

COMMENT ON COLUMN REVIEW_ATTACHMENT.FILE_LEVEL IS '다시 생각하기';

COMMENT ON COLUMN REVIEW_ATTACHMENT.STATUS IS ''Y'등록 N삭제';

ALTER TABLE REVIEW ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
	REVIEW_NO
);

ALTER TABLE REVIEW_ATTACHMENT ADD CONSTRAINT PK_REVIEW_ATTACHMENT PRIMARY KEY (
	FILE_NO
);

ALTER TABLE REVIEW ADD CONSTRAINT FK_MEMBER_TO_REVIEW_1 FOREIGN KEY (
	USER_NO
)
REFERENCES MEMBER (
	USER_NO
);

ALTER TABLE REVIEW ADD CONSTRAINT FK_Untitled10_TO_REVIEW_1 FOREIGN KEY (
	Key
)
REFERENCES Untitled10 (
	Key
);
-------------------------------- 댓글 --------------------------------

CREATE TABLE COMMENT (
	COMMENT_NO		NUMBER		NOT NULL,
	USER_NO			NUMBER		NOT NULL,
	COMMENT			VARCHAR2(255 BYTE)		NOT NULL,
	CREATE_DATE		SYSDATE	DEFAULT SYSDATE	NULL,
	STATUS			CHAR(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN COMMENT.COMMENT_NO IS 'SEQUENCE 사용';

COMMENT ON COLUMN COMMENT.STATUS IS ''Y'등록, 'N'삭제';


CREATE TABLE COMMENT_ATTACHMENT (
	COM_IMG_NO	NUMBER		NOT NULL,
	COMMENT_NO	NUMBER		NOT NULL,
	ORIGIN_NAME	VARCHAR2(255 BYTE)		NULL,
	CHANGE_NAME	VARCHAR2(255 BYTE)		NULL,
	FILE_PATH	VARCHAR2(1000 BYTE)		NULL,
	UPLOAD_DATE	DATE	DEFAULT SYSDATE	NULL,
	STATUS		CHAR(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN COMMENT_ATTACHMENT.COM_IMG_NO IS 'SEQUENCE 사용';

COMMENT ON COLUMN COMMENT_ATTACHMENT.COMMENT_NO IS 'SEQUENCE 사용';

COMMENT ON COLUMN COMMENT_ATTACHMENT.STATUS IS ''Y'등록, 'N'삭제';

ALTER TABLE COMMENT ADD CONSTRAINT PK_COMMENT PRIMARY KEY (
	COMMENT_NO
);

ALTER TABLE COMMENT_ATTACHMENT ADD CONSTRAINT PK_COMMENT_ATTACHMENT PRIMARY KEY (
	COM_IMG_NO
);

ALTER TABLE COMMENT ADD CONSTRAINT FK_MEMBER_TO_COMMENT_1 FOREIGN KEY (
	USER_NO
)
REFERENCES MEMBER (
	USER_NO
);

ALTER TABLE COMMENT_ATTACHMENT ADD CONSTRAINT FK_COMMENT_TO_COMMENT_ATTACHMENT_1 FOREIGN KEY (
	COMMENT_NO
)
REFERENCES COMMENT (
	COMMENT_NO
);

ALTER TABLE REPLY ADD CONSTRAINT FK_COMMENT_TO_REPLY_1 FOREIGN KEY (
	COMMENT_NO
)
REFERENCES COMMENT (
	COMMENT_NO
);

-------------------------------- 대댓글 게시판 --------------------------------

CREATE TABLE REPLY (
	REPLY_NO		NUMBER		NOT NULL,
	COMMENT_NO		NUMBER		NOT NULL,
	USER_NO			NUMBER		NOT NULL,
	REPLY_CONTENT	VARCHAR2(255 BYTE)		NOT NULL,
	CREATE_DATE		SYSDATE	DEFAULT SYSDATE	NULL,
	STATUS			CHAR(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN REPLY.REPLY_NO IS 'SEQUENCE 사용';

COMMENT ON COLUMN REPLY.COMMENT_NO IS 'SEQUENCE 사용';

COMMENT ON COLUMN REPLY.STATUS IS ''Y'등록, 'N'삭제';


CREATE TABLE REPLY_ATTACHMENT (
	COM_IMG_NO	NUMBER		NOT NULL,
	REPLY_NO	NUMBER		NOT NULL,
	ORIGIN_NAME	VARCHAR2(255 BYTE)		NULL,
	CHANGE_NAME	VARCHAR2(255 BYTE)		NULL,
	FILE_PATH	VARCHAR2(1000 BYTE)		NULL,
	UPLOAD_DATE	DATE	DEFAULT SYSDATE	NULL,
	STATUS		CHAR(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN REPLY_ATTACHMENT.COM_IMG_NO IS 'SEQUENCE 사용';

COMMENT ON COLUMN REPLY_ATTACHMENT.REPLY_NO IS 'SEQUENCE 사용';

COMMENT ON COLUMN REPLY_ATTACHMENT.STATUS IS ''Y'등록, 'N'삭제';

ALTER TABLE REPLY ADD CONSTRAINT PK_REPLY PRIMARY KEY (
	REPLY_NO
);

ALTER TABLE REPLY_ATTACHMENT ADD CONSTRAINT PK_REPLY_ATTACHMENT PRIMARY KEY (
	COM_IMG_NO
);

ALTER TABLE REPLY ADD CONSTRAINT FK_MEMBER_TO_REPLY_1 FOREIGN KEY (
	USER_NO
)
REFERENCES MEMBER (
	USER_NO
);

ALTER TABLE REPLY_ATTACHMENT ADD CONSTRAINT FK_REPLY_TO_REPLY_ATTACHMENT_1 FOREIGN KEY (
	REPLY_NO
)
REFERENCES REPLY (
	REPLY_NO
);

ALTER TABLE REVIEW_ATTACHMENT ADD CONSTRAINT FK_REVIEW_TO_REVIEW_ATTACHMENT_1 FOREIGN KEY (
	REVIEW_NO
)
REFERENCES REVIEW (
	REVIEW_NO
);






















