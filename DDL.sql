CREATE TABLE UserList
(
	userID               VARCHAR2(10) NOT NULL ,
	pwd                  VARCHAR2(20) NOT NULL ,
	email                VARCHAR2(30) NOT NULL ,
	userType             SMALLINT NOT NULL 
);

CREATE UNIQUE INDEX XPKUser ON UserList
(userID   ASC);

ALTER TABLE UserList
	ADD CONSTRAINT  XPKUser PRIMARY KEY (userID);

CREATE TABLE Gpurchase
(
	boardNum             NUMBER NOT NULL ,
	boardDate            DATE NULL ,
	userID               VARCHAR2(10) NOT NULL ,
	price                NUMBER NULL ,
	sdate                DATE NOT NULL ,
	edate                DATE NOT NULL ,
	boardContent         VARCHAR2(3000) NOT NULL ,
	cartAdded            NUMBER NULL ,
	boardHit             NUMBER NULL ,
	replyCnt             NUMBER NULL ,
	boardTitle           VARCHAR2(50) NOT NULL ,
	boardImage           VARCHAR2(100) NULL ,
	goalNum              NUMBER NULL 
);

CREATE UNIQUE INDEX XPKGpurchase ON Gpurchase
(boardNum   ASC);

ALTER TABLE Gpurchase
	ADD CONSTRAINT  XPKGpurchase PRIMARY KEY (boardNum);
    
ALTER TABLE Gpurchase
	ADD (CONSTRAINT R_3 FOREIGN KEY (userID) REFERENCES UserList (userID) ON DELETE CASCADE);
    
CREATE SEQUENCE  "SSD0202"."GBN_SEQ"
MINVALUE 1 MAXVALUE 999999999999999999999999999 
INCREMENT BY 1 START WITH 1 
CACHE 20 NOORDER  NOCYCLE ; 

CREATE TABLE GpurchaseReply
(
	userID               VARCHAR2(10) NOT NULL ,
	boardNum             NUMBER NOT NULL ,
	replyNum             NUMBER NOT NULL ,
	replyDate            DATE NULL ,
	replyContent         VARCHAR2(200) NOT NULL ,
	replyGID             NUMBER NULL ,
	replyParents         NUMBER NULL ,
	replyOrder           NUMBER NULL 
);

CREATE UNIQUE INDEX XPKGpurchase_Reply ON GpurchaseReply
(replyNum   ASC);

ALTER TABLE GpurchaseReply
	ADD CONSTRAINT  XPKGpurchase_Reply PRIMARY KEY (replyNum);

ALTER TABLE GpurchaseReply
	ADD (CONSTRAINT R_16 FOREIGN KEY (boardNum) REFERENCES Gpurchase (boardNum) ON DELETE CASCADE);

ALTER TABLE GpurchaseReply
	ADD (CONSTRAINT R_24 FOREIGN KEY (userID) REFERENCES UserList (userID) ON DELETE CASCADE);
    
CREATE SEQUENCE  "SSD0202"."GRN_SEQ"
MINVALUE 1 MAXVALUE 999999999999999999999999999 
INCREMENT BY 1 START WITH 1
CACHE 20 NOORDER  NOCYCLE ;

CREATE TABLE GpurchaseCart
(
	boardNum             NUMBER NOT NULL ,
	userID               VARCHAR2(10) NOT NULL 
);

CREATE UNIQUE INDEX XPKGpurchaseCart ON GpurchaseCart
(boardNum   ASC,userID   ASC);

ALTER TABLE GpurchaseCart
	ADD CONSTRAINT  XPKGpurchaseCart PRIMARY KEY (boardNum,userID);

CREATE TABLE Info
(
	boardNum             NUMBER NOT NULL ,
	boardDate            DATE NULL ,
	userID               VARCHAR2(10) NOT NULL ,
	boardContent         VARCHAR2(3000) NOT NULL ,
	boardLike            NUMBER NULL ,
	boardHit             NUMBER NULL ,
	replyCnt             NUMBER NULL ,
	boardTitle           VARCHAR2(50) NOT NULL ,
	boardImage           VARCHAR2(100) NULL 
);

CREATE UNIQUE INDEX XPKInfo ON Info
(boardNum   ASC);

ALTER TABLE Info
	ADD CONSTRAINT  XPKInfo PRIMARY KEY (boardNum);
    
ALTER TABLE Info
	ADD (CONSTRAINT R_10 FOREIGN KEY (userID) REFERENCES UserList (userID) ON DELETE CASCADE);

CREATE SEQUENCE  "SSD0202"."INBN_SEQ"
MINVALUE 1 MAXVALUE 999999999999999999999999999 
INCREMENT BY 1 START WITH 1 
CACHE 20 NOORDER  NOCYCLE ;

CREATE TABLE InfoReply
(
	userID               VARCHAR2(10) NOT NULL ,
	boardNum             NUMBER NOT NULL ,
	replyNum             NUMBER NOT NULL ,
	replyDate            DATE NULL ,
	replyContent         VARCHAR2(200) NOT NULL ,
	replyGID             NUMBER NULL ,
	replyParents         NUMBER NULL ,
	replyOrder           NUMBER NULL 
);

CREATE UNIQUE INDEX XPKInfo_Reply ON InfoReply
(replyNum   ASC);

ALTER TABLE InfoReply
	ADD CONSTRAINT  XPKInfo_Reply PRIMARY KEY (replyNum);
    
ALTER TABLE InfoReply
	ADD (CONSTRAINT R_20 FOREIGN KEY (boardNum) REFERENCES Info (boardNum) ON DELETE CASCADE);

ALTER TABLE InfoReply
	ADD (CONSTRAINT R_29 FOREIGN KEY (userID) REFERENCES UserList (userID) ON DELETE CASCADE);
    
CREATE SEQUENCE  "SSD0202"."INRN_SEQ"
MINVALUE 1 MAXVALUE 999999999999999999999999999 
INCREMENT BY 1 START WITH 1 
CACHE 20 NOORDER  NOCYCLE ;

CREATE TABLE InfoLike
(
	boardNum             NUMBER NOT NULL ,
	userID               VARCHAR2(10) NOT NULL 
);

CREATE UNIQUE INDEX XPKInfoLike ON InfoLike
(boardNum   ASC,userID   ASC);

ALTER TABLE InfoLike
	ADD CONSTRAINT  XPKInfoLike PRIMARY KEY (boardNum,userID);


CREATE TABLE Inquiry
(
	boardNum             NUMBER NOT NULL ,
	boardDate            DATE NULL ,
	userID               VARCHAR2(10) NOT NULL ,
	boardContent         VARCHAR2(3000) NOT NULL ,
	boardLike            NUMBER NULL ,
	boardHit             NUMBER NULL ,
	answerCnt            NUMBER NULL ,
	boardTitle           VARCHAR2(50) NOT NULL ,
	boardImage           VARCHAR2(100) NULL ,
	isSelected           SMALLINT NULL 
);

CREATE UNIQUE INDEX XPKInquiry ON Inquiry
(boardNum   ASC);

ALTER TABLE Inquiry
	ADD CONSTRAINT  XPKInquiry PRIMARY KEY (boardNum);
    
ALTER TABLE Inquiry
	ADD (CONSTRAINT R_7 FOREIGN KEY (userID) REFERENCES UserList (userID) ON DELETE CASCADE);
    
CREATE SEQUENCE  "SSD0202"."IQBN_SEQ"
MINVALUE 1 MAXVALUE 999999999999999999999999999 
INCREMENT BY 1 START WITH 1 
CACHE 20 NOORDER  NOCYCLE ;

CREATE TABLE Answer
(
	userID               VARCHAR2(10) NOT NULL ,
	boardNum             NUMBER NOT NULL ,
	answerNum            NUMBER NOT NULL ,
	answerDate           DATE NULL ,
	answerContent        VARCHAR2(200) NOT NULL ,
	replyGID             NUMBER NULL ,
	replyParents         NUMBER NULL ,
	replyOrder           NUMBER NULL ,
	isSelected           SMALLINT NULL 
);

CREATE UNIQUE INDEX XPKInquiry_Reply ON Answer
(answerNum   ASC);

ALTER TABLE Answer
	ADD CONSTRAINT  XPKInquiry_Reply PRIMARY KEY (answerNum);
    
ALTER TABLE Answer
	ADD (CONSTRAINT R_22 FOREIGN KEY (userID) REFERENCES UserList (userID) ON DELETE CASCADE);

ALTER TABLE Answer
	ADD (CONSTRAINT R_45 FOREIGN KEY (boardNum) REFERENCES Inquiry (boardNum) ON DELETE CASCADE);
    
CREATE SEQUENCE  "SSD0202"."ABN_SEQ"
MINVALUE 1 MAXVALUE 999999999999999999999999999 
INCREMENT BY 1 START WITH 1 
CACHE 20 NOORDER  NOCYCLE ;

CREATE TABLE InquiryLike
(
	boardNum             NUMBER NOT NULL ,
	userID               VARCHAR2(10) NOT NULL 
);

CREATE UNIQUE INDEX XPKInquiryLike ON InquiryLike
(boardNum   ASC,userID   ASC);

ALTER TABLE InquiryLike
	ADD CONSTRAINT  XPKInquiryLike PRIMARY KEY (boardNum,userID);

CREATE TABLE OrderList
(
	orderNum             NUMBER NOT NULL ,
	orderDate            DATE NULL ,
	price                NUMBER NULL ,
	userID               VARCHAR2(10) NOT NULL ,
	bank                 VARCHAR2(10) NULL ,
	cardNum              VARCHAR2(20) NULL ,
	cvc                  VARCHAR2(10) NULL ,
	expireDate               DATE NULL ,
	address              VARCHAR2(20) NULL 
);

CREATE UNIQUE INDEX XPKOrder ON OrderList
(orderNum   ASC);

ALTER TABLE OrderList
	ADD CONSTRAINT  XPKOrder PRIMARY KEY (orderNum);
    
ALTER TABLE OrderList
	ADD (CONSTRAINT R_8 FOREIGN KEY (userID) REFERENCES UserList (userID) ON DELETE CASCADE);
    
CREATE SEQUENCE  "SSD0202"."ON_SEQ"
MINVALUE 1 MAXVALUE 999999999999999999999999999 
INCREMENT BY 1 START WITH 1 
CACHE 20 NOORDER  NOCYCLE ;

CREATE TABLE SLineItem
(
	price                NUMBER NULL ,
	boardNum             NUMBER NULL ,
	lineItemNum          NUMBER NOT NULL ,
	orderNum             NUMBER NOT NULL 
);

CREATE UNIQUE INDEX XPKSLineItem ON SLineItem
(lineItemNum   ASC,orderNum   ASC);

ALTER TABLE SLineItem
	ADD CONSTRAINT  XPKSLineItem PRIMARY KEY (lineItemNum,orderNum);

ALTER TABLE SLineItem
	ADD (CONSTRAINT R_52 FOREIGN KEY (orderNum) REFERENCES OrderList (orderNum)ON DELETE CASCADE); 

ALTER TABLE SLineItem
	ADD (CONSTRAINT R_49 FOREIGN KEY (boardNum) REFERENCES Secondhand (boardNum)ON DELETE CASCADE);  
    
CREATE SEQUENCE  "SSD0202"."SLIN_SEQ"
MINVALUE 1 MAXVALUE 999999999999999999999999999 
INCREMENT BY 1 START WITH 1 
CACHE 20 NOORDER  NOCYCLE ;

CREATE TABLE GLineItem
(
	price                NUMBER NULL ,
	boardNum             NUMBER NULL ,
	lineItemNum          NUMBER NOT NULL ,
	orderNum             NUMBER NOT NULL 
);

CREATE UNIQUE INDEX XPKLineItem ON GLineItem
(lineItemNum   ASC,orderNum   ASC);

ALTER TABLE GLineItem
	ADD CONSTRAINT  XPKLineItem PRIMARY KEY (lineItemNum,orderNum);
    
ALTER TABLE GLineItem
	ADD (CONSTRAINT R_46 FOREIGN KEY (orderNum) REFERENCES OrderList (orderNum)ON DELETE CASCADE);  
    
ALTER TABLE GLineItem
	ADD (CONSTRAINT R_47 FOREIGN KEY (boardNum) REFERENCES Gpurchase (boardNum)ON DELETE CASCADE);  
    
CREATE SEQUENCE  "SSD0202"."GLIN_SEQ"
MINVALUE 1 MAXVALUE 999999999999999999999999999 
INCREMENT BY 1 START WITH 1 
CACHE 20 NOORDER  NOCYCLE ;

CREATE TABLE Petsitter
(
	boardNum             NUMBER NOT NULL ,
	boardDate            DATE NULL ,
	userID               VARCHAR2(10) NOT NULL ,
	boardContent         VARCHAR2(3000) NOT NULL ,
	petSize              VARCHAR2(5) NULL ,
	petLocal             VARCHAR2(30) NULL ,
	petCarrer            NUMBER NULL ,
	petPrice             NUMBER NULL ,
	petDay               VARCHAR2(10) NULL ,
	boardLike            NUMBER NULL ,
	boardHit             NUMBER NULL ,
	boardTitle           VARCHAR2(50) NOT NULL ,
	replyCnt             NUMBER NULL ,
	boardImage           VARCHAR2(100) NULL 
);

CREATE UNIQUE INDEX XPKPetsitter ON Petsitter
(boardNum   ASC);

ALTER TABLE Petsitter
	ADD CONSTRAINT  XPKPetsitter PRIMARY KEY (boardNum);
    
ALTER TABLE Petsitter
	ADD (CONSTRAINT R_1 FOREIGN KEY (userID) REFERENCES UserList (userID) ON DELETE CASCADE);
    
CREATE SEQUENCE  "SSD0202"."PBN_SEQ"
MINVALUE 1 MAXVALUE 999999999999999999999999999 
INCREMENT BY 1 START WITH 1 
CACHE 20 NOORDER  NOCYCLE ;

CREATE TABLE PetsitterReply
(
	userID               VARCHAR2(10) NOT NULL ,
	boardNum             NUMBER NOT NULL ,
	replyNum             NUMBER NOT NULL ,
	replyDate            DATE NULL ,
	replyContent         VARCHAR2(200) NOT NULL ,
	replyGID             NUMBER NULL ,
	replyParents         NUMBER NULL ,
	replyOrder           NUMBER NULL 
);

CREATE UNIQUE INDEX XPKPetsitter_Reply ON PetsitterReply
(replyNum   ASC);

ALTER TABLE PetsitterReply
	ADD CONSTRAINT  XPKPetsitter_Reply PRIMARY KEY (replyNum);

ALTER TABLE PetsitterReply
	ADD (CONSTRAINT R_17 FOREIGN KEY (boardNum) REFERENCES Petsitter (boardNum) ON DELETE CASCADE);

ALTER TABLE PetsitterReply
	ADD (CONSTRAINT R_25 FOREIGN KEY (userID) REFERENCES UserList (userID) ON DELETE CASCADE);
    
CREATE SEQUENCE  "SSD0202"."PRN_SEQ"
MINVALUE 1 MAXVALUE 999999999999999999999999999 
INCREMENT BY 1 START WITH 1 
CACHE 20 NOORDER  NOCYCLE ;
    
CREATE TABLE PetsitterLike
(
	boardNum             NUMBER NOT NULL ,
	userID               VARCHAR2(10) NOT NULL 
);

CREATE UNIQUE INDEX XPKPetsitterLike ON PetsitterLike
(boardNum   ASC,userID   ASC);

ALTER TABLE PetsitterLike
	ADD CONSTRAINT  XPKPetsitterLike PRIMARY KEY (boardNum,userID);

ALTER TABLE PetsitterLike
	ADD (CONSTRAINT R_30 FOREIGN KEY (boardNum) REFERENCES Petsitter (boardNum) ON DELETE CASCADE);

ALTER TABLE PetsitterLike
	ADD (CONSTRAINT R_33 FOREIGN KEY (userID) REFERENCES UserList (userID) ON DELETE CASCADE);
    
CREATE TABLE Review
(
	boardNum             NUMBER NOT NULL ,
	boardDate            DATE NULL ,
	userID               VARCHAR2(10) NOT NULL ,
	boardContent         VARCHAR2(3000) NOT NULL ,
	boardLike            NUMBER NULL ,
	boardHit             NUMBER NULL ,
	replyCnt             NUMBER NULL ,
	boardTitle           VARCHAR2(50) NOT NULL ,
	boardImage           VARCHAR2(100) NULL ,
	rating               NUMBER(5,1) NULL 
);

CREATE UNIQUE INDEX XPKReview ON Review
(boardNum   ASC);

ALTER TABLE Review
	ADD CONSTRAINT  XPKReview PRIMARY KEY (boardNum);
    
ALTER TABLE Review
    ADD (CONSTRAINT R_5 FOREIGN KEY (userID) REFERENCES UserList (userID)ON DELETE CASCADE);
    
CREATE SEQUENCE  "SSD0202"."RBN_SEQ"
MINVALUE 1 MAXVALUE 999999999999999999999999999 
INCREMENT BY 1 START WITH 1 
CACHE 20 NOORDER  NOCYCLE ;

CREATE TABLE ReviewReply
(
	userID               VARCHAR2(10) NOT NULL ,
	boardNum             NUMBER NOT NULL ,
	replyNum             NUMBER NOT NULL ,
	replyDate            DATE NULL ,
	replyContent         VARCHAR2(200) NOT NULL ,
	replyGID             NUMBER NULL ,
	replyParents         NUMBER NULL ,
	replyOrder           NUMBER NULL 
);

CREATE UNIQUE INDEX XPKReview_Reply ON ReviewReply
(replyNum   ASC);

ALTER TABLE ReviewReply
	ADD CONSTRAINT  XPKReview_Reply PRIMARY KEY (replyNum);
    
ALTER TABLE ReviewReply
	ADD (CONSTRAINT R_15 FOREIGN KEY (boardNum) REFERENCES Review (boardNum) ON DELETE CASCADE);

ALTER TABLE ReviewReply
	ADD (CONSTRAINT R_27 FOREIGN KEY (userID) REFERENCES UserList (userID) ON DELETE CASCADE);
    
CREATE SEQUENCE  "SSD0202"."RRN_SEQ"
MINVALUE 1 MAXVALUE 999999999999999999999999999 
INCREMENT BY 1 START WITH 1 
CACHE 20 NOORDER  NOCYCLE ;

CREATE TABLE ReviewLike
(
	boardNum             NUMBER NOT NULL ,
	userID               VARCHAR2(10) NOT NULL 
);

CREATE UNIQUE INDEX XPKReviewLike ON ReviewLike
(boardNum   ASC,userID   ASC);

ALTER TABLE ReviewLike
	ADD CONSTRAINT  XPKReviewLike PRIMARY KEY (boardNum,userID);
    
ALTER TABLE ReviewLike
	ADD (CONSTRAINT R_40 FOREIGN KEY (boardNum) REFERENCES Review (boardNum) ON DELETE CASCADE);

ALTER TABLE ReviewLike
	ADD (CONSTRAINT R_41 FOREIGN KEY (userID) REFERENCES UserList (userID) ON DELETE CASCADE);

CREATE TABLE Secondhand
(
	boardNum             NUMBER NOT NULL ,
	boardDate            DATE NULL ,
	userID               VARCHAR2(10) NOT NULL ,
	boardcontent         VARCHAR2(3000) NOT NULL ,
	cartAdded            NUMBER NULL ,
	price                NUMBER NULL ,
	boardImage           VARCHAR2(100) NULL ,
	boardHit             NUMBER NULL ,
	replyCnt             NUMBER NULL ,
	boardTitle           VARCHAR2(50) NOT NULL 
);

CREATE UNIQUE INDEX XPKSecondhand ON Secondhand
(boardNum   ASC);

ALTER TABLE Secondhand
	ADD CONSTRAINT  XPKSecondhand PRIMARY KEY (boardNum);
    
ALTER TABLE Secondhand
	ADD (CONSTRAINT R_6 FOREIGN KEY (userID) REFERENCES UserList (userID) ON DELETE CASCADE);
    
CREATE SEQUENCE  "SSD0202"."SBN_SEQ"
MINVALUE 1 MAXVALUE 999999999999999999999999999 
INCREMENT BY 1 START WITH 1 
CACHE 20 NOORDER  NOCYCLE ;

CREATE TABLE SecondhandReply
(
	userID               VARCHAR2(10) NOT NULL ,
	boardNum             NUMBER NOT NULL ,
	replyNum             NUMBER NOT NULL ,
	replyDate            DATE NULL ,
	replyContent         VARCHAR2(200) NOT NULL ,
	replyGID             NUMBER NULL ,
	replyParents         NUMBER NULL ,
	replyOrder           NUMBER NULL 
);

CREATE UNIQUE INDEX XPKSecondhand_Reply ON SecondhandReply
(replyNum   ASC);

ALTER TABLE SecondhandReply
	ADD CONSTRAINT  XPKSecondhand_Reply PRIMARY KEY (replyNum);
    
ALTER TABLE SecondhandReply
	ADD (CONSTRAINT R_18 FOREIGN KEY (boardNum) REFERENCES Secondhand (boardNum) ON DELETE CASCADE);

ALTER TABLE SecondhandReply
	ADD (CONSTRAINT R_28 FOREIGN KEY (userID) REFERENCES UserList (userID) ON DELETE CASCADE);
    
CREATE SEQUENCE  "SSD0202"."SRN_SEQ"
MINVALUE 1 MAXVALUE 999999999999999999999999999 
INCREMENT BY 1 START WITH 1
CACHE 20 NOORDER  NOCYCLE ;

CREATE TABLE SecondhandCart
(
	boardNum             NUMBER NOT NULL ,
	userID               VARCHAR2(10) NOT NULL 
);

CREATE UNIQUE INDEX XPKSecondhandCart ON SecondhandCart
(boardNum   ASC,userID   ASC);

ALTER TABLE SecondhandCart
	ADD CONSTRAINT  XPKSecondhandCart PRIMARY KEY (boardNum,userID);

ALTER TABLE SecondhandCart
	ADD (CONSTRAINT R_38 FOREIGN KEY (boardNum) REFERENCES Secondhand (boardNum) ON DELETE CASCADE);

ALTER TABLE SecondhandCart
	ADD (CONSTRAINT R_39 FOREIGN KEY (userID) REFERENCES UserList (userID) ON DELETE CASCADE);


-- Gpurchase
CREATE OR REPLACE TRIGGER GpurchaseBoardNum_TRG
BEFORE INSERT ON Gpurchase
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
	SELECT GBN_SEQ.NEXTVAL INTO:new.boardNum FROM dual;
END;

--GpurchaseReply
CREATE OR REPLACE TRIGGER GpurchaseReplyNum_TRG
BEFORE INSERT ON GpurchaseReply
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
	SELECT GRN_SEQ.NEXTVAL INTO:new.replyNum FROM dual;
END;

--Info
CREATE OR REPLACE TRIGGER InfoBoardNum_TRG
BEFORE INSERT ON Info
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
	SELECT INBN_SEQ.NEXTVAL INTO:new.boardNum FROM dual;
END;

--InfoReply
CREATE OR REPLACE TRIGGER InfoReplyNum_TRG
BEFORE INSERT ON InfoReply
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
	SELECT INRN_SEQ.NEXTVAL INTO:new.replyNum FROM dual;
END;

--Inquiry
CREATE OR REPLACE TRIGGER InquiryBoardNum_TRG
BEFORE INSERT ON Inquiry
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
	SELECT IQBN_SEQ.NEXTVAL INTO:new.boardNum FROM dual;
END;

--Answer
CREATE OR REPLACE TRIGGER AnswerNum_TRG
BEFORE INSERT ON Answer
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
	SELECT ABN_SEQ.NEXTVAL INTO:new.answerNum FROM dual;
END;

--OrderList
CREATE OR REPLACE TRIGGER OrderNum_TRG
BEFORE INSERT ON OrderList
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
	SELECT ON_SEQ.NEXTVAL INTO:new.orderNum FROM dual;
END;

--SLineItem
CREATE OR REPLACE TRIGGER SLineItemNum_TRG
BEFORE INSERT ON SLineItem
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
	SELECT SLIN_SEQ.NEXTVAL INTO:new.lineItemNum FROM dual;
END;

--GLineItem
CREATE OR REPLACE TRIGGER GLineItemNum_TRG
BEFORE INSERT ON GLineItem
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
	SELECT GLIN_SEQ.NEXTVAL INTO:new.lineItemNum FROM dual;
END;

--petsitter
CREATE OR REPLACE TRIGGER PetBoardNum_TRG
BEFORE INSERT ON Petsitter
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
	SELECT PBN_SEQ.NEXTVAL INTO:new.boardNum FROM dual;
END;

--petsitterReply
CREATE OR REPLACE TRIGGER PetsitterReplyNum_TRG
BEFORE INSERT ON PetsitterReply
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
	SELECT PRN_SEQ.NEXTVAL INTO:new.replyNum FROM dual;
END;

--Review
CREATE OR REPLACE TRIGGER ReviewBoardNum_TRG
BEFORE INSERT ON Review
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
	SELECT RBN_SEQ.NEXTVAL INTO:new.boardNum FROM dual;
END;

--ReviewReply
CREATE OR REPLACE TRIGGER ReviewReplyNum_TRG
BEFORE INSERT ON ReviewReply
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
	SELECT RRN_SEQ.NEXTVAL INTO:new.replyNum FROM dual;
END;

--Secondhand
CREATE OR REPLACE TRIGGER SecondhandBoardNum_TRG
BEFORE INSERT ON Secondhand
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
	SELECT SBN_SEQ.NEXTVAL INTO:new.boardNum FROM dual;
END;

--SecondhandReply
CREATE OR REPLACE TRIGGER SecondhandReplyNum_TRG
BEFORE INSERT ON SecondhandReply
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
	SELECT SRN_SEQ.NEXTVAL INTO:new.replyNum FROM dual;
END;

CREATE  TRIGGER  tD_UserList AFTER DELETE ON UserList for each row
-- erwin Builtin Trigger
-- DELETE trigger on UserList 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  InfoLike on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00117264", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="InfoLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM InfoLike
      WHERE
        /*  %JoinFKPK(InfoLike,:%Old," = "," AND") */
        InfoLike.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because InfoLike exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  SecondhandCart on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="SecondhandCart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_41", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM SecondhandCart
      WHERE
        /*  %JoinFKPK(SecondhandCart,:%Old," = "," AND") */
        SecondhandCart.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because SecondhandCart exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  ReviewLike on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="ReviewLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM ReviewLike
      WHERE
        /*  %JoinFKPK(ReviewLike,:%Old," = "," AND") */
        ReviewLike.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because ReviewLike exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  InquiryLike on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="InquiryLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM InquiryLike
      WHERE
        /*  %JoinFKPK(InquiryLike,:%Old," = "," AND") */
        InquiryLike.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because InquiryLike exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  GpurchaseCart on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="GpurchaseCart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_35", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM GpurchaseCart
      WHERE
        /*  %JoinFKPK(GpurchaseCart,:%Old," = "," AND") */
        GpurchaseCart.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because GpurchaseCart exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  PetsitterLike on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="PetsitterLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM PetsitterLike
      WHERE
        /*  %JoinFKPK(PetsitterLike,:%Old," = "," AND") */
        PetsitterLike.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because PetsitterLike exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  InfoReply on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="InfoReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM InfoReply
      WHERE
        /*  %JoinFKPK(InfoReply,:%Old," = "," AND") */
        InfoReply.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because InfoReply exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  SecondhandReply on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="SecondhandReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM SecondhandReply
      WHERE
        /*  %JoinFKPK(SecondhandReply,:%Old," = "," AND") */
        SecondhandReply.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because SecondhandReply exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  ReviewReply on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="ReviewReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM ReviewReply
      WHERE
        /*  %JoinFKPK(ReviewReply,:%Old," = "," AND") */
        ReviewReply.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because ReviewReply exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  Answer on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Answer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM Answer
      WHERE
        /*  %JoinFKPK(Answer,:%Old," = "," AND") */
        Answer.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because Answer exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  PetsitterReply on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="PetsitterReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_25", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM PetsitterReply
      WHERE
        /*  %JoinFKPK(PetsitterReply,:%Old," = "," AND") */
        PetsitterReply.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because PetsitterReply exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  GpurchaseReply on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="GpurchaseReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM GpurchaseReply
      WHERE
        /*  %JoinFKPK(GpurchaseReply,:%Old," = "," AND") */
        GpurchaseReply.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because GpurchaseReply exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  Info on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Info"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM Info
      WHERE
        /*  %JoinFKPK(Info,:%Old," = "," AND") */
        Info.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because Info exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  OrderList on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="OrderList"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM OrderList
      WHERE
        /*  %JoinFKPK(OrderList,:%Old," = "," AND") */
        OrderList.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because OrderList exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  Inquiry on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Inquiry"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM Inquiry
      WHERE
        /*  %JoinFKPK(Inquiry,:%Old," = "," AND") */
        Inquiry.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because Inquiry exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  Secondhand on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Secondhand"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM Secondhand
      WHERE
        /*  %JoinFKPK(Secondhand,:%Old," = "," AND") */
        Secondhand.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because Secondhand exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  Review on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Review"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM Review
      WHERE
        /*  %JoinFKPK(Review,:%Old," = "," AND") */
        Review.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because Review exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  Gpurchase on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Gpurchase"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM Gpurchase
      WHERE
        /*  %JoinFKPK(Gpurchase,:%Old," = "," AND") */
        Gpurchase.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because Gpurchase exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  Petsitter on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Petsitter"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM Petsitter
      WHERE
        /*  %JoinFKPK(Petsitter,:%Old," = "," AND") */
        Petsitter.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete UserList because Petsitter exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_UserList AFTER UPDATE ON UserList for each row
-- erwin Builtin Trigger
-- UPDATE trigger on UserList 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* UserList  InfoLike on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00145d4a", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="InfoLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM InfoLike
      WHERE
        /*  %JoinFKPK(InfoLike,:%Old," = "," AND") */
        InfoLike.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because InfoLike exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  SecondhandCart on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="SecondhandCart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_41", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM SecondhandCart
      WHERE
        /*  %JoinFKPK(SecondhandCart,:%Old," = "," AND") */
        SecondhandCart.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because SecondhandCart exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  ReviewLike on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="ReviewLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM ReviewLike
      WHERE
        /*  %JoinFKPK(ReviewLike,:%Old," = "," AND") */
        ReviewLike.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because ReviewLike exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  InquiryLike on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="InquiryLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM InquiryLike
      WHERE
        /*  %JoinFKPK(InquiryLike,:%Old," = "," AND") */
        InquiryLike.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because InquiryLike exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  GpurchaseCart on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="GpurchaseCart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_35", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM GpurchaseCart
      WHERE
        /*  %JoinFKPK(GpurchaseCart,:%Old," = "," AND") */
        GpurchaseCart.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because GpurchaseCart exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  PetsitterLike on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="PetsitterLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM PetsitterLike
      WHERE
        /*  %JoinFKPK(PetsitterLike,:%Old," = "," AND") */
        PetsitterLike.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because PetsitterLike exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  InfoReply on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="InfoReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM InfoReply
      WHERE
        /*  %JoinFKPK(InfoReply,:%Old," = "," AND") */
        InfoReply.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because InfoReply exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  SecondhandReply on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="SecondhandReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM SecondhandReply
      WHERE
        /*  %JoinFKPK(SecondhandReply,:%Old," = "," AND") */
        SecondhandReply.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because SecondhandReply exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  ReviewReply on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="ReviewReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM ReviewReply
      WHERE
        /*  %JoinFKPK(ReviewReply,:%Old," = "," AND") */
        ReviewReply.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because ReviewReply exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  Answer on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Answer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Answer
      WHERE
        /*  %JoinFKPK(Answer,:%Old," = "," AND") */
        Answer.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because Answer exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  PetsitterReply on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="PetsitterReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_25", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM PetsitterReply
      WHERE
        /*  %JoinFKPK(PetsitterReply,:%Old," = "," AND") */
        PetsitterReply.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because PetsitterReply exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  GpurchaseReply on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="GpurchaseReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM GpurchaseReply
      WHERE
        /*  %JoinFKPK(GpurchaseReply,:%Old," = "," AND") */
        GpurchaseReply.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because GpurchaseReply exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  Info on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Info"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Info
      WHERE
        /*  %JoinFKPK(Info,:%Old," = "," AND") */
        Info.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because Info exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  OrderList on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="OrderList"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM OrderList
      WHERE
        /*  %JoinFKPK(OrderList,:%Old," = "," AND") */
        OrderList.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because OrderList exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  Inquiry on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Inquiry"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Inquiry
      WHERE
        /*  %JoinFKPK(Inquiry,:%Old," = "," AND") */
        Inquiry.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because Inquiry exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  Secondhand on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Secondhand"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Secondhand
      WHERE
        /*  %JoinFKPK(Secondhand,:%Old," = "," AND") */
        Secondhand.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because Secondhand exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  Review on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Review"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Review
      WHERE
        /*  %JoinFKPK(Review,:%Old," = "," AND") */
        Review.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because Review exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  Gpurchase on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Gpurchase"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Gpurchase
      WHERE
        /*  %JoinFKPK(Gpurchase,:%Old," = "," AND") */
        Gpurchase.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because Gpurchase exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  Petsitter on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Petsitter"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="userID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.userID <> :new.userID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Petsitter
      WHERE
        /*  %JoinFKPK(Petsitter,:%Old," = "," AND") */
        Petsitter.userID = :old.userID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update UserList because Petsitter exists.'
      );
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_Gpurchase AFTER DELETE ON Gpurchase for each row
-- erwin Builtin Trigger
-- DELETE trigger on Gpurchase 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Gpurchase  GpurchaseCart on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001e8c0", PARENT_OWNER="", PARENT_TABLE="Gpurchase"
    CHILD_OWNER="", CHILD_TABLE="GpurchaseCart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM GpurchaseCart
      WHERE
        /*  %JoinFKPK(GpurchaseCart,:%Old," = "," AND") */
        GpurchaseCart.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Gpurchase because GpurchaseCart exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Gpurchase  GpurchaseReply on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Gpurchase"
    CHILD_OWNER="", CHILD_TABLE="GpurchaseReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM GpurchaseReply
      WHERE
        /*  %JoinFKPK(GpurchaseReply,:%Old," = "," AND") */
        GpurchaseReply.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Gpurchase because GpurchaseReply exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_Gpurchase BEFORE INSERT ON Gpurchase for each row
-- erwin Builtin Trigger
-- INSERT trigger on Gpurchase 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  Gpurchase on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e823", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Gpurchase"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Gpurchase because UserList does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Gpurchase AFTER UPDATE ON Gpurchase for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Gpurchase 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Gpurchase  GpurchaseCart on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="0003230e", PARENT_OWNER="", PARENT_TABLE="Gpurchase"
    CHILD_OWNER="", CHILD_TABLE="GpurchaseCart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="boardNum" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.boardNum <> :new.boardNum
  THEN
    SELECT count(*) INTO NUMROWS
      FROM GpurchaseCart
      WHERE
        /*  %JoinFKPK(GpurchaseCart,:%Old," = "," AND") */
        GpurchaseCart.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Gpurchase because GpurchaseCart exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Gpurchase  GpurchaseReply on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Gpurchase"
    CHILD_OWNER="", CHILD_TABLE="GpurchaseReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="boardNum" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.boardNum <> :new.boardNum
  THEN
    SELECT count(*) INTO NUMROWS
      FROM GpurchaseReply
      WHERE
        /*  %JoinFKPK(GpurchaseReply,:%Old," = "," AND") */
        GpurchaseReply.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Gpurchase because GpurchaseReply exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  Gpurchase on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Gpurchase"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Gpurchase because UserList does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_GpurchaseReply BEFORE INSERT ON GpurchaseReply for each row
-- erwin Builtin Trigger
-- INSERT trigger on GpurchaseReply 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  GpurchaseReply on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001f252", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="GpurchaseReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert GpurchaseReply because UserList does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Gpurchase  GpurchaseReply on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Gpurchase"
    CHILD_OWNER="", CHILD_TABLE="GpurchaseReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM Gpurchase
      WHERE
        /* %JoinFKPK(:%New,Gpurchase," = "," AND") */
        :new.boardNum = Gpurchase.boardNum;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert GpurchaseReply because Gpurchase does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_GpurchaseReply AFTER UPDATE ON GpurchaseReply for each row
-- erwin Builtin Trigger
-- UPDATE trigger on GpurchaseReply 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* UserList  GpurchaseReply on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001fca8", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="GpurchaseReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update GpurchaseReply because UserList does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Gpurchase  GpurchaseReply on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Gpurchase"
    CHILD_OWNER="", CHILD_TABLE="GpurchaseReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="boardNum" */
  SELECT count(*) INTO NUMROWS
    FROM Gpurchase
    WHERE
      /* %JoinFKPK(:%New,Gpurchase," = "," AND") */
      :new.boardNum = Gpurchase.boardNum;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update GpurchaseReply because Gpurchase does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_GpurchaseCart BEFORE INSERT ON GpurchaseCart for each row
-- erwin Builtin Trigger
-- INSERT trigger on GpurchaseCart 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  GpurchaseCart on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0002074a", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="GpurchaseCart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_35", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert GpurchaseCart because UserList does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Gpurchase  GpurchaseCart on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Gpurchase"
    CHILD_OWNER="", CHILD_TABLE="GpurchaseCart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM Gpurchase
      WHERE
        /* %JoinFKPK(:%New,Gpurchase," = "," AND") */
        :new.boardNum = Gpurchase.boardNum;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert GpurchaseCart because Gpurchase does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_GpurchaseCart AFTER UPDATE ON GpurchaseCart for each row
-- erwin Builtin Trigger
-- UPDATE trigger on GpurchaseCart 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* UserList  GpurchaseCart on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00020440", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="GpurchaseCart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_35", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update GpurchaseCart because UserList does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Gpurchase  GpurchaseCart on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Gpurchase"
    CHILD_OWNER="", CHILD_TABLE="GpurchaseCart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="boardNum" */
  SELECT count(*) INTO NUMROWS
    FROM Gpurchase
    WHERE
      /* %JoinFKPK(:%New,Gpurchase," = "," AND") */
      :new.boardNum = Gpurchase.boardNum;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update GpurchaseCart because Gpurchase does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_Info AFTER DELETE ON Info for each row
-- erwin Builtin Trigger
-- DELETE trigger on Info 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Info  InfoLike on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001bc56", PARENT_OWNER="", PARENT_TABLE="Info"
    CHILD_OWNER="", CHILD_TABLE="InfoLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM InfoLike
      WHERE
        /*  %JoinFKPK(InfoLike,:%Old," = "," AND") */
        InfoLike.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Info because InfoLike exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Info  InfoReply on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Info"
    CHILD_OWNER="", CHILD_TABLE="InfoReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM InfoReply
      WHERE
        /*  %JoinFKPK(InfoReply,:%Old," = "," AND") */
        InfoReply.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Info because InfoReply exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_Info BEFORE INSERT ON Info for each row
-- erwin Builtin Trigger
-- INSERT trigger on Info 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  Info on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000df77", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Info"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Info because UserList does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Info AFTER UPDATE ON Info for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Info 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Info  InfoLike on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="0002f9af", PARENT_OWNER="", PARENT_TABLE="Info"
    CHILD_OWNER="", CHILD_TABLE="InfoLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="boardNum" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.boardNum <> :new.boardNum
  THEN
    SELECT count(*) INTO NUMROWS
      FROM InfoLike
      WHERE
        /*  %JoinFKPK(InfoLike,:%Old," = "," AND") */
        InfoLike.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Info because InfoLike exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Info  InfoReply on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Info"
    CHILD_OWNER="", CHILD_TABLE="InfoReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="boardNum" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.boardNum <> :new.boardNum
  THEN
    SELECT count(*) INTO NUMROWS
      FROM InfoReply
      WHERE
        /*  %JoinFKPK(InfoReply,:%Old," = "," AND") */
        InfoReply.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Info because InfoReply exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  Info on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Info"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Info because UserList does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_InfoReply BEFORE INSERT ON InfoReply for each row
-- erwin Builtin Trigger
-- INSERT trigger on InfoReply 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  InfoReply on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001db88", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="InfoReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert InfoReply because UserList does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Info  InfoReply on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Info"
    CHILD_OWNER="", CHILD_TABLE="InfoReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM Info
      WHERE
        /* %JoinFKPK(:%New,Info," = "," AND") */
        :new.boardNum = Info.boardNum;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert InfoReply because Info does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_InfoReply AFTER UPDATE ON InfoReply for each row
-- erwin Builtin Trigger
-- UPDATE trigger on InfoReply 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* UserList  InfoReply on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001de00", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="InfoReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update InfoReply because UserList does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Info  InfoReply on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Info"
    CHILD_OWNER="", CHILD_TABLE="InfoReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="boardNum" */
  SELECT count(*) INTO NUMROWS
    FROM Info
    WHERE
      /* %JoinFKPK(:%New,Info," = "," AND") */
      :new.boardNum = Info.boardNum;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update InfoReply because Info does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_InfoLike BEFORE INSERT ON InfoLike for each row
-- erwin Builtin Trigger
-- INSERT trigger on InfoLike 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Info  InfoLike on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001d7d3", PARENT_OWNER="", PARENT_TABLE="Info"
    CHILD_OWNER="", CHILD_TABLE="InfoLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM Info
      WHERE
        /* %JoinFKPK(:%New,Info," = "," AND") */
        :new.boardNum = Info.boardNum;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert InfoLike because Info does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* UserList  InfoLike on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="InfoLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert InfoLike because UserList does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_InfoLike AFTER UPDATE ON InfoLike for each row
-- erwin Builtin Trigger
-- UPDATE trigger on InfoLike 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Info  InfoLike on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001e110", PARENT_OWNER="", PARENT_TABLE="Info"
    CHILD_OWNER="", CHILD_TABLE="InfoLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="boardNum" */
  SELECT count(*) INTO NUMROWS
    FROM Info
    WHERE
      /* %JoinFKPK(:%New,Info," = "," AND") */
      :new.boardNum = Info.boardNum;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update InfoLike because Info does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  InfoLike on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="InfoLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update InfoLike because UserList does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_Inquiry AFTER DELETE ON Inquiry for each row
-- erwin Builtin Trigger
-- DELETE trigger on Inquiry 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Inquiry  InquiryLike on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001c03a", PARENT_OWNER="", PARENT_TABLE="Inquiry"
    CHILD_OWNER="", CHILD_TABLE="InquiryLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM InquiryLike
      WHERE
        /*  %JoinFKPK(InquiryLike,:%Old," = "," AND") */
        InquiryLike.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Inquiry because InquiryLike exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Inquiry  Answer on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Inquiry"
    CHILD_OWNER="", CHILD_TABLE="Answer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM Answer
      WHERE
        /*  %JoinFKPK(Answer,:%Old," = "," AND") */
        Answer.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Inquiry because Answer exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_Inquiry BEFORE INSERT ON Inquiry for each row
-- erwin Builtin Trigger
-- INSERT trigger on Inquiry 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  Inquiry on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000dd8f", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Inquiry"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Inquiry because UserList does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Inquiry AFTER UPDATE ON Inquiry for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Inquiry 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Inquiry  InquiryLike on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="000302ea", PARENT_OWNER="", PARENT_TABLE="Inquiry"
    CHILD_OWNER="", CHILD_TABLE="InquiryLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="boardNum" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.boardNum <> :new.boardNum
  THEN
    SELECT count(*) INTO NUMROWS
      FROM InquiryLike
      WHERE
        /*  %JoinFKPK(InquiryLike,:%Old," = "," AND") */
        InquiryLike.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Inquiry because InquiryLike exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Inquiry  Answer on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Inquiry"
    CHILD_OWNER="", CHILD_TABLE="Answer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="boardNum" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.boardNum <> :new.boardNum
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Answer
      WHERE
        /*  %JoinFKPK(Answer,:%Old," = "," AND") */
        Answer.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Inquiry because Answer exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  Inquiry on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Inquiry"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Inquiry because UserList does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_Answer BEFORE INSERT ON Answer for each row
-- erwin Builtin Trigger
-- INSERT trigger on Answer 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  Answer on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001e814", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Answer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Answer because UserList does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Inquiry  Answer on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Inquiry"
    CHILD_OWNER="", CHILD_TABLE="Answer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM Inquiry
      WHERE
        /* %JoinFKPK(:%New,Inquiry," = "," AND") */
        :new.boardNum = Inquiry.boardNum;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Answer because Inquiry does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Answer AFTER UPDATE ON Answer for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Answer 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* UserList  Answer on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001d0f3", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Answer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Answer because UserList does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Inquiry  Answer on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Inquiry"
    CHILD_OWNER="", CHILD_TABLE="Answer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="boardNum" */
  SELECT count(*) INTO NUMROWS
    FROM Inquiry
    WHERE
      /* %JoinFKPK(:%New,Inquiry," = "," AND") */
      :new.boardNum = Inquiry.boardNum;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Answer because Inquiry does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_InquiryLike BEFORE INSERT ON InquiryLike for each row
-- erwin Builtin Trigger
-- INSERT trigger on InquiryLike 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  InquiryLike on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001f912", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="InquiryLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert InquiryLike because UserList does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Inquiry  InquiryLike on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Inquiry"
    CHILD_OWNER="", CHILD_TABLE="InquiryLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM Inquiry
      WHERE
        /* %JoinFKPK(:%New,Inquiry," = "," AND") */
        :new.boardNum = Inquiry.boardNum;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert InquiryLike because Inquiry does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_InquiryLike AFTER UPDATE ON InquiryLike for each row
-- erwin Builtin Trigger
-- UPDATE trigger on InquiryLike 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* UserList  InquiryLike on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001ef8a", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="InquiryLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update InquiryLike because UserList does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Inquiry  InquiryLike on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Inquiry"
    CHILD_OWNER="", CHILD_TABLE="InquiryLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="boardNum" */
  SELECT count(*) INTO NUMROWS
    FROM Inquiry
    WHERE
      /* %JoinFKPK(:%New,Inquiry," = "," AND") */
      :new.boardNum = Inquiry.boardNum;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update InquiryLike because Inquiry does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_OrderList AFTER DELETE ON OrderList for each row
-- erwin Builtin Trigger
-- DELETE trigger on OrderList 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* OrderList  GLineItem on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001d093", PARENT_OWNER="", PARENT_TABLE="OrderList"
    CHILD_OWNER="", CHILD_TABLE="GLineItem"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_46", FK_COLUMNS="orderNum" */
    SELECT count(*) INTO NUMROWS
      FROM GLineItem
      WHERE
        /*  %JoinFKPK(GLineItem,:%Old," = "," AND") */
        GLineItem.orderNum = :old.orderNum;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete OrderList because GLineItem exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* OrderList  SLineItem on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="OrderList"
    CHILD_OWNER="", CHILD_TABLE="SLineItem"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="orderNum" */
    SELECT count(*) INTO NUMROWS
      FROM SLineItem
      WHERE
        /*  %JoinFKPK(SLineItem,:%Old," = "," AND") */
        SLineItem.orderNum = :old.orderNum;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete OrderList because SLineItem exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_OrderList BEFORE INSERT ON OrderList for each row
-- erwin Builtin Trigger
-- INSERT trigger on OrderList 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  OrderList on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e0ea", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="OrderList"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert OrderList because UserList does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_OrderList AFTER UPDATE ON OrderList for each row
-- erwin Builtin Trigger
-- UPDATE trigger on OrderList 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* OrderList  GLineItem on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00030788", PARENT_OWNER="", PARENT_TABLE="OrderList"
    CHILD_OWNER="", CHILD_TABLE="GLineItem"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_46", FK_COLUMNS="orderNum" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.orderNum <> :new.orderNum
  THEN
    SELECT count(*) INTO NUMROWS
      FROM GLineItem
      WHERE
        /*  %JoinFKPK(GLineItem,:%Old," = "," AND") */
        GLineItem.orderNum = :old.orderNum;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update OrderList because GLineItem exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* OrderList  SLineItem on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="OrderList"
    CHILD_OWNER="", CHILD_TABLE="SLineItem"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="orderNum" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.orderNum <> :new.orderNum
  THEN
    SELECT count(*) INTO NUMROWS
      FROM SLineItem
      WHERE
        /*  %JoinFKPK(SLineItem,:%Old," = "," AND") */
        SLineItem.orderNum = :old.orderNum;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update OrderList because SLineItem exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  OrderList on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="OrderList"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update OrderList because UserList does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_SLineItem BEFORE INSERT ON SLineItem for each row
-- erwin Builtin Trigger
-- INSERT trigger on SLineItem 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* OrderList  SLineItem on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000eb0b", PARENT_OWNER="", PARENT_TABLE="OrderList"
    CHILD_OWNER="", CHILD_TABLE="SLineItem"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="orderNum" */
    SELECT count(*) INTO NUMROWS
      FROM OrderList
      WHERE
        /* %JoinFKPK(:%New,OrderList," = "," AND") */
        :new.orderNum = OrderList.orderNum;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert SLineItem because OrderList does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_SLineItem AFTER UPDATE ON SLineItem for each row
-- erwin Builtin Trigger
-- UPDATE trigger on SLineItem 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* OrderList  SLineItem on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0000edb9", PARENT_OWNER="", PARENT_TABLE="OrderList"
    CHILD_OWNER="", CHILD_TABLE="SLineItem"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="orderNum" */
  SELECT count(*) INTO NUMROWS
    FROM OrderList
    WHERE
      /* %JoinFKPK(:%New,OrderList," = "," AND") */
      :new.orderNum = OrderList.orderNum;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update SLineItem because OrderList does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_GLineItem BEFORE INSERT ON GLineItem for each row
-- erwin Builtin Trigger
-- INSERT trigger on GLineItem 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* OrderList  GLineItem on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e573", PARENT_OWNER="", PARENT_TABLE="OrderList"
    CHILD_OWNER="", CHILD_TABLE="GLineItem"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_46", FK_COLUMNS="orderNum" */
    SELECT count(*) INTO NUMROWS
      FROM OrderList
      WHERE
        /* %JoinFKPK(:%New,OrderList," = "," AND") */
        :new.orderNum = OrderList.orderNum;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert GLineItem because OrderList does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_GLineItem AFTER UPDATE ON GLineItem for each row
-- erwin Builtin Trigger
-- UPDATE trigger on GLineItem 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* OrderList  GLineItem on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0000e48e", PARENT_OWNER="", PARENT_TABLE="OrderList"
    CHILD_OWNER="", CHILD_TABLE="GLineItem"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_46", FK_COLUMNS="orderNum" */
  SELECT count(*) INTO NUMROWS
    FROM OrderList
    WHERE
      /* %JoinFKPK(:%New,OrderList," = "," AND") */
      :new.orderNum = OrderList.orderNum;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update GLineItem because OrderList does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_Petsitter AFTER DELETE ON Petsitter for each row
-- erwin Builtin Trigger
-- DELETE trigger on Petsitter 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Petsitter  PetsitterLike on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001d6be", PARENT_OWNER="", PARENT_TABLE="Petsitter"
    CHILD_OWNER="", CHILD_TABLE="PetsitterLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM PetsitterLike
      WHERE
        /*  %JoinFKPK(PetsitterLike,:%Old," = "," AND") */
        PetsitterLike.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Petsitter because PetsitterLike exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Petsitter  PetsitterReply on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Petsitter"
    CHILD_OWNER="", CHILD_TABLE="PetsitterReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM PetsitterReply
      WHERE
        /*  %JoinFKPK(PetsitterReply,:%Old," = "," AND") */
        PetsitterReply.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Petsitter because PetsitterReply exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_Petsitter BEFORE INSERT ON Petsitter for each row
-- erwin Builtin Trigger
-- INSERT trigger on Petsitter 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  Petsitter on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e9b3", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Petsitter"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Petsitter because UserList does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Petsitter AFTER UPDATE ON Petsitter for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Petsitter 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Petsitter  PetsitterLike on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00033f6c", PARENT_OWNER="", PARENT_TABLE="Petsitter"
    CHILD_OWNER="", CHILD_TABLE="PetsitterLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="boardNum" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.boardNum <> :new.boardNum
  THEN
    SELECT count(*) INTO NUMROWS
      FROM PetsitterLike
      WHERE
        /*  %JoinFKPK(PetsitterLike,:%Old," = "," AND") */
        PetsitterLike.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Petsitter because PetsitterLike exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Petsitter  PetsitterReply on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Petsitter"
    CHILD_OWNER="", CHILD_TABLE="PetsitterReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="boardNum" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.boardNum <> :new.boardNum
  THEN
    SELECT count(*) INTO NUMROWS
      FROM PetsitterReply
      WHERE
        /*  %JoinFKPK(PetsitterReply,:%Old," = "," AND") */
        PetsitterReply.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Petsitter because PetsitterReply exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  Petsitter on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Petsitter"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Petsitter because UserList does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_PetsitterReply BEFORE INSERT ON PetsitterReply for each row
-- erwin Builtin Trigger
-- INSERT trigger on PetsitterReply 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  PetsitterReply on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001fd4c", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="PetsitterReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_25", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert PetsitterReply because UserList does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Petsitter  PetsitterReply on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Petsitter"
    CHILD_OWNER="", CHILD_TABLE="PetsitterReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM Petsitter
      WHERE
        /* %JoinFKPK(:%New,Petsitter," = "," AND") */
        :new.boardNum = Petsitter.boardNum;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert PetsitterReply because Petsitter does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_PetsitterReply AFTER UPDATE ON PetsitterReply for each row
-- erwin Builtin Trigger
-- UPDATE trigger on PetsitterReply 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* UserList  PetsitterReply on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001ec94", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="PetsitterReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_25", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update PetsitterReply because UserList does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Petsitter  PetsitterReply on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Petsitter"
    CHILD_OWNER="", CHILD_TABLE="PetsitterReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="boardNum" */
  SELECT count(*) INTO NUMROWS
    FROM Petsitter
    WHERE
      /* %JoinFKPK(:%New,Petsitter," = "," AND") */
      :new.boardNum = Petsitter.boardNum;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update PetsitterReply because Petsitter does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_PetsitterLike BEFORE INSERT ON PetsitterLike for each row
-- erwin Builtin Trigger
-- INSERT trigger on PetsitterLike 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  PetsitterLike on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001ee33", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="PetsitterLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert PetsitterLike because UserList does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Petsitter  PetsitterLike on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Petsitter"
    CHILD_OWNER="", CHILD_TABLE="PetsitterLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM Petsitter
      WHERE
        /* %JoinFKPK(:%New,Petsitter," = "," AND") */
        :new.boardNum = Petsitter.boardNum;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert PetsitterLike because Petsitter does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_PetsitterLike AFTER UPDATE ON PetsitterLike for each row
-- erwin Builtin Trigger
-- UPDATE trigger on PetsitterLike 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* UserList  PetsitterLike on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001e46c", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="PetsitterLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update PetsitterLike because UserList does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Petsitter  PetsitterLike on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Petsitter"
    CHILD_OWNER="", CHILD_TABLE="PetsitterLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="boardNum" */
  SELECT count(*) INTO NUMROWS
    FROM Petsitter
    WHERE
      /* %JoinFKPK(:%New,Petsitter," = "," AND") */
      :new.boardNum = Petsitter.boardNum;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update PetsitterLike because Petsitter does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_Review AFTER DELETE ON Review for each row
-- erwin Builtin Trigger
-- DELETE trigger on Review 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Review  ReviewLike on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001ca07", PARENT_OWNER="", PARENT_TABLE="Review"
    CHILD_OWNER="", CHILD_TABLE="ReviewLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM ReviewLike
      WHERE
        /*  %JoinFKPK(ReviewLike,:%Old," = "," AND") */
        ReviewLike.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Review because ReviewLike exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Review  ReviewReply on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Review"
    CHILD_OWNER="", CHILD_TABLE="ReviewReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM ReviewReply
      WHERE
        /*  %JoinFKPK(ReviewReply,:%Old," = "," AND") */
        ReviewReply.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Review because ReviewReply exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_Review BEFORE INSERT ON Review for each row
-- erwin Builtin Trigger
-- INSERT trigger on Review 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  Review on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e12b", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Review"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Review because UserList does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Review AFTER UPDATE ON Review for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Review 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Review  ReviewLike on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="000309b4", PARENT_OWNER="", PARENT_TABLE="Review"
    CHILD_OWNER="", CHILD_TABLE="ReviewLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="boardNum" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.boardNum <> :new.boardNum
  THEN
    SELECT count(*) INTO NUMROWS
      FROM ReviewLike
      WHERE
        /*  %JoinFKPK(ReviewLike,:%Old," = "," AND") */
        ReviewLike.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Review because ReviewLike exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Review  ReviewReply on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Review"
    CHILD_OWNER="", CHILD_TABLE="ReviewReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="boardNum" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.boardNum <> :new.boardNum
  THEN
    SELECT count(*) INTO NUMROWS
      FROM ReviewReply
      WHERE
        /*  %JoinFKPK(ReviewReply,:%Old," = "," AND") */
        ReviewReply.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Review because ReviewReply exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  Review on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Review"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Review because UserList does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_ReviewReply BEFORE INSERT ON ReviewReply for each row
-- erwin Builtin Trigger
-- INSERT trigger on ReviewReply 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  ReviewReply on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001f42f", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="ReviewReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert ReviewReply because UserList does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Review  ReviewReply on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Review"
    CHILD_OWNER="", CHILD_TABLE="ReviewReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM Review
      WHERE
        /* %JoinFKPK(:%New,Review," = "," AND") */
        :new.boardNum = Review.boardNum;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert ReviewReply because Review does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_ReviewReply AFTER UPDATE ON ReviewReply for each row
-- erwin Builtin Trigger
-- UPDATE trigger on ReviewReply 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* UserList  ReviewReply on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001f3de", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="ReviewReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update ReviewReply because UserList does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Review  ReviewReply on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Review"
    CHILD_OWNER="", CHILD_TABLE="ReviewReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="boardNum" */
  SELECT count(*) INTO NUMROWS
    FROM Review
    WHERE
      /* %JoinFKPK(:%New,Review," = "," AND") */
      :new.boardNum = Review.boardNum;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update ReviewReply because Review does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_ReviewLike BEFORE INSERT ON ReviewLike for each row
-- erwin Builtin Trigger
-- INSERT trigger on ReviewLike 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  ReviewLike on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001d716", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="ReviewLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert ReviewLike because UserList does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Review  ReviewLike on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Review"
    CHILD_OWNER="", CHILD_TABLE="ReviewLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM Review
      WHERE
        /* %JoinFKPK(:%New,Review," = "," AND") */
        :new.boardNum = Review.boardNum;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert ReviewLike because Review does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_ReviewLike AFTER UPDATE ON ReviewLike for each row
-- erwin Builtin Trigger
-- UPDATE trigger on ReviewLike 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* UserList  ReviewLike on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001f188", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="ReviewLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update ReviewLike because UserList does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Review  ReviewLike on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Review"
    CHILD_OWNER="", CHILD_TABLE="ReviewLike"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="boardNum" */
  SELECT count(*) INTO NUMROWS
    FROM Review
    WHERE
      /* %JoinFKPK(:%New,Review," = "," AND") */
      :new.boardNum = Review.boardNum;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update ReviewLike because Review does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_Secondhand AFTER DELETE ON Secondhand for each row
-- erwin Builtin Trigger
-- DELETE trigger on Secondhand 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Secondhand  SecondhandCart on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001e1ca", PARENT_OWNER="", PARENT_TABLE="Secondhand"
    CHILD_OWNER="", CHILD_TABLE="SecondhandCart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM SecondhandCart
      WHERE
        /*  %JoinFKPK(SecondhandCart,:%Old," = "," AND") */
        SecondhandCart.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Secondhand because SecondhandCart exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Secondhand  SecondhandReply on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Secondhand"
    CHILD_OWNER="", CHILD_TABLE="SecondhandReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM SecondhandReply
      WHERE
        /*  %JoinFKPK(SecondhandReply,:%Old," = "," AND") */
        SecondhandReply.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Secondhand because SecondhandReply exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_Secondhand BEFORE INSERT ON Secondhand for each row
-- erwin Builtin Trigger
-- INSERT trigger on Secondhand 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  Secondhand on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000eb50", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Secondhand"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Secondhand because UserList does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Secondhand AFTER UPDATE ON Secondhand for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Secondhand 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Secondhand  SecondhandCart on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00032aa5", PARENT_OWNER="", PARENT_TABLE="Secondhand"
    CHILD_OWNER="", CHILD_TABLE="SecondhandCart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="boardNum" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.boardNum <> :new.boardNum
  THEN
    SELECT count(*) INTO NUMROWS
      FROM SecondhandCart
      WHERE
        /*  %JoinFKPK(SecondhandCart,:%Old," = "," AND") */
        SecondhandCart.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Secondhand because SecondhandCart exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Secondhand  SecondhandReply on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Secondhand"
    CHILD_OWNER="", CHILD_TABLE="SecondhandReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="boardNum" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.boardNum <> :new.boardNum
  THEN
    SELECT count(*) INTO NUMROWS
      FROM SecondhandReply
      WHERE
        /*  %JoinFKPK(SecondhandReply,:%Old," = "," AND") */
        SecondhandReply.boardNum = :old.boardNum;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Secondhand because SecondhandReply exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* UserList  Secondhand on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="Secondhand"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Secondhand because UserList does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_SecondhandReply BEFORE INSERT ON SecondhandReply for each row
-- erwin Builtin Trigger
-- INSERT trigger on SecondhandReply 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  SecondhandReply on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001f4c5", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="SecondhandReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert SecondhandReply because UserList does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Secondhand  SecondhandReply on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Secondhand"
    CHILD_OWNER="", CHILD_TABLE="SecondhandReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM Secondhand
      WHERE
        /* %JoinFKPK(:%New,Secondhand," = "," AND") */
        :new.boardNum = Secondhand.boardNum;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert SecondhandReply because Secondhand does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_SecondhandReply AFTER UPDATE ON SecondhandReply for each row
-- erwin Builtin Trigger
-- UPDATE trigger on SecondhandReply 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* UserList  SecondhandReply on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00020012", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="SecondhandReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update SecondhandReply because UserList does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Secondhand  SecondhandReply on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Secondhand"
    CHILD_OWNER="", CHILD_TABLE="SecondhandReply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="boardNum" */
  SELECT count(*) INTO NUMROWS
    FROM Secondhand
    WHERE
      /* %JoinFKPK(:%New,Secondhand," = "," AND") */
      :new.boardNum = Secondhand.boardNum;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update SecondhandReply because Secondhand does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_SecondhandCart BEFORE INSERT ON SecondhandCart for each row
-- erwin Builtin Trigger
-- INSERT trigger on SecondhandCart 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* UserList  SecondhandCart on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00020988", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="SecondhandCart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_41", FK_COLUMNS="userID" */
    SELECT count(*) INTO NUMROWS
      FROM UserList
      WHERE
        /* %JoinFKPK(:%New,UserList," = "," AND") */
        :new.userID = UserList.userID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert SecondhandCart because UserList does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Secondhand  SecondhandCart on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Secondhand"
    CHILD_OWNER="", CHILD_TABLE="SecondhandCart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="boardNum" */
    SELECT count(*) INTO NUMROWS
      FROM Secondhand
      WHERE
        /* %JoinFKPK(:%New,Secondhand," = "," AND") */
        :new.boardNum = Secondhand.boardNum;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert SecondhandCart because Secondhand does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_SecondhandCart AFTER UPDATE ON SecondhandCart for each row
-- erwin Builtin Trigger
-- UPDATE trigger on SecondhandCart 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* UserList  SecondhandCart on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="000202d9", PARENT_OWNER="", PARENT_TABLE="UserList"
    CHILD_OWNER="", CHILD_TABLE="SecondhandCart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_41", FK_COLUMNS="userID" */
  SELECT count(*) INTO NUMROWS
    FROM UserList
    WHERE
      /* %JoinFKPK(:%New,UserList," = "," AND") */
      :new.userID = UserList.userID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update SecondhandCart because UserList does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Secondhand  SecondhandCart on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Secondhand"
    CHILD_OWNER="", CHILD_TABLE="SecondhandCart"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="boardNum" */
  SELECT count(*) INTO NUMROWS
    FROM Secondhand
    WHERE
      /* %JoinFKPK(:%New,Secondhand," = "," AND") */
      :new.boardNum = Secondhand.boardNum;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update SecondhandCart because Secondhand does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/