/*
Navicat PGSQL Data Transfer

Source Server         : 999adm
Source Server Version : 90106
Source Host           : s999.hstx.5ding.com:5432
Source Database       : 5ding_Account
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90106
File Encoding         : 65001

Date: 2013-10-14 09:52:06
*/


-- ----------------------------
-- Sequence structure for "my_T_Login_Minute_seq"
-- ----------------------------
DROP SEQUENCE "my_T_Login_Minute_seq";
CREATE SEQUENCE "my_T_Login_Minute_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Account_dwAccountID_seq"
-- ----------------------------
DROP SEQUENCE "T_Account_dwAccountID_seq";
CREATE SEQUENCE "T_Account_dwAccountID_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 8
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Account_Info_dwAccountID_seq"
-- ----------------------------
DROP SEQUENCE "T_Account_Info_dwAccountID_seq";
CREATE SEQUENCE "T_Account_Info_dwAccountID_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 81659
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Booth_Log_seq"
-- ----------------------------
DROP SEQUENCE "T_Booth_Log_seq";
CREATE SEQUENCE "T_Booth_Log_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 178
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Charge_Count_seq"
-- ----------------------------
DROP SEQUENCE "T_Charge_Count_seq";
CREATE SEQUENCE "T_Charge_Count_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Charge_Info_seq"
-- ----------------------------
DROP SEQUENCE "T_Charge_Info_seq";
CREATE SEQUENCE "T_Charge_Info_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 2209
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Copy_Log_seq"
-- ----------------------------
DROP SEQUENCE "T_Copy_Log_seq";
CREATE SEQUENCE "T_Copy_Log_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1461
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Equip_Log_seq"
-- ----------------------------
DROP SEQUENCE "T_Equip_Log_seq";
CREATE SEQUENCE "T_Equip_Log_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 223369
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Income_Other_seq"
-- ----------------------------
DROP SEQUENCE "T_Income_Other_seq";
CREATE SEQUENCE "T_Income_Other_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3178
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Login_Day_seq"
-- ----------------------------
DROP SEQUENCE "T_Login_Day_seq";
CREATE SEQUENCE "T_Login_Day_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 8001
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Login_Lost_seq"
-- ----------------------------
DROP SEQUENCE "T_Login_Lost_seq";
CREATE SEQUENCE "T_Login_Lost_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 993816
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Login_Minute_seq"
-- ----------------------------
DROP SEQUENCE "T_Login_Minute_seq";
CREATE SEQUENCE "T_Login_Minute_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 283637
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Login_Minutes_seq"
-- ----------------------------
DROP SEQUENCE "T_Login_Minutes_seq";
CREATE SEQUENCE "T_Login_Minutes_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Login_Role_seq"
-- ----------------------------
DROP SEQUENCE "T_Login_Role_seq";
CREATE SEQUENCE "T_Login_Role_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 15002
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Mail_Log_seq"
-- ----------------------------
DROP SEQUENCE "T_Mail_Log_seq";
CREATE SEQUENCE "T_Mail_Log_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 6
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Manager_Log_seq"
-- ----------------------------
DROP SEQUENCE "T_Manager_Log_seq";
CREATE SEQUENCE "T_Manager_Log_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 561
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Online_Info_seq"
-- ----------------------------
DROP SEQUENCE "T_Online_Info_seq";
CREATE SEQUENCE "T_Online_Info_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 290745
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Point_Cost_seq"
-- ----------------------------
DROP SEQUENCE "T_Point_Cost_seq";
CREATE SEQUENCE "T_Point_Cost_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 427258
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Prop_Buy_seq"
-- ----------------------------
DROP SEQUENCE "T_Prop_Buy_seq";
CREATE SEQUENCE "T_Prop_Buy_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 489329
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Prop_Log_seq"
-- ----------------------------
DROP SEQUENCE "T_Prop_Log_seq";
CREATE SEQUENCE "T_Prop_Log_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1003934
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_RegAccount_Info_seq"
-- ----------------------------
DROP SEQUENCE "T_RegAccount_Info_seq";
CREATE SEQUENCE "T_RegAccount_Info_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 4817
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_RegCreate_Info_seq"
-- ----------------------------
DROP SEQUENCE "T_RegCreate_Info_seq";
CREATE SEQUENCE "T_RegCreate_Info_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 76330
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Task_Log_seq"
-- ----------------------------
DROP SEQUENCE "T_Task_Log_seq";
CREATE SEQUENCE "T_Task_Log_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 281631
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Trade_Log_seq"
-- ----------------------------
DROP SEQUENCE "T_Trade_Log_seq";
CREATE SEQUENCE "T_Trade_Log_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 687207
 CACHE 1;

-- ----------------------------
-- Table structure for "T_Account"
-- ----------------------------
DROP TABLE "T_Account";
CREATE TABLE "T_Account" (
"dwAccountID" int8 NOT NULL,
"dwGlod" int4,
"dwMoney" int4,
"tmRegTime" int8,
"tmLostTime" int8,
"szUserName" varchar(100),
"bISGM" int2 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;


-- ----------------------------
-- Table structure for "T_Account_Info"
-- ----------------------------
DROP TABLE "T_Account_Info";
CREATE TABLE "T_Account_Info" (
"dwAccountID" int8 DEFAULT nextval('"T_Account_Info_dwAccountID_seq"'::regclass) NOT NULL,
"szAccount" varchar(100),
"szPwd" varchar(100),
"dwAdultFlag" int2 DEFAULT (0)::smallint NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Charge_Info"
-- ----------------------------
DROP TABLE "T_Charge_Info";
CREATE TABLE "T_Charge_Info" (
"dwAccountID" int8 NOT NULL,
"dwOrderID" varchar(32) NOT NULL,
"dwQuantity" varchar(64) NOT NULL,
"dwType" int2 NOT NULL,
"dwTime" varchar(64) NOT NULL
)
WITH (OIDS=FALSE)

;


-- ----------------------------
-- Table structure for "T_Gold_Error"
-- ----------------------------
DROP TABLE "T_Gold_Error";
CREATE TABLE "T_Gold_Error" (
"dwAccountID" int8 NOT NULL,
"dwGold" int8 NOT NULL,
"szSql" text NOT NULL,
"szTime" text NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Reward_Code_Info"
-- ----------------------------
DROP TABLE "T_Reward_Code_Info";
CREATE TABLE "T_Reward_Code_Info" (
"szCode" text NOT NULL,
"dwType" int4 NOT NULL,
"dwAccountID" int8 NOT NULL,
"dwServerHostID" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "T_Account_dwAccountID_seq" OWNED BY "T_Account"."dwAccountID";
ALTER SEQUENCE "T_Account_Info_dwAccountID_seq" OWNED BY "T_Account_Info"."dwAccountID";

-- ----------------------------
-- Primary Key structure for table "T_Account"
-- ----------------------------
ALTER TABLE "T_Account" ADD PRIMARY KEY ("dwAccountID");

-- ----------------------------
-- Uniques structure for table "T_Account_Info"
-- ----------------------------
ALTER TABLE "T_Account_Info" ADD UNIQUE ("szAccount");

-- ----------------------------
-- Primary Key structure for table "T_Account_Info"
-- ----------------------------
ALTER TABLE "T_Account_Info" ADD PRIMARY KEY ("dwAccountID");

-- ----------------------------
-- Primary Key structure for table "T_Charge_Info"
-- ----------------------------
ALTER TABLE "T_Charge_Info" ADD PRIMARY KEY ("dwOrderID");

-- ----------------------------
-- Primary Key structure for table "T_Reward_Code_Info"
-- ----------------------------
ALTER TABLE "T_Reward_Code_Info" ADD PRIMARY KEY ("szCode");
