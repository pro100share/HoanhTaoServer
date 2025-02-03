/*
Navicat PGSQL Data Transfer

Source Server         : 999adm
Source Server Version : 90106
Source Host           : s999.hstx.5ding.com:5432
Source Database       : 5ding_Role
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90106
File Encoding         : 65001

Date: 2014-02-12 20:01:29
*/


-- ----------------------------
-- Sequence structure for "T_Guild_Apply_dwApplyID_seq"
-- ----------------------------
DROP SEQUENCE "T_Guild_Apply_dwApplyID_seq";
CREATE SEQUENCE "T_Guild_Apply_dwApplyID_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 160
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Guild_Info_dwGuildID_seq"
-- ----------------------------
DROP SEQUENCE "T_Guild_Info_dwGuildID_seq";
CREATE SEQUENCE "T_Guild_Info_dwGuildID_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 29
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Role_id_seq"
-- ----------------------------
DROP SEQUENCE "T_Role_id_seq";
CREATE SEQUENCE "T_Role_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 2
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Role_Info_dwRoleID_seq"
-- ----------------------------
DROP SEQUENCE "T_Role_Info_dwRoleID_seq";
CREATE SEQUENCE "T_Role_Info_dwRoleID_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 10902
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Role_Item_seq"
-- ----------------------------
DROP SEQUENCE "T_Role_Item_seq";
CREATE SEQUENCE "T_Role_Item_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 732115
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Role_Mail_seq"
-- ----------------------------
DROP SEQUENCE "T_Role_Mail_seq";
CREATE SEQUENCE "T_Role_Mail_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 41286
 CACHE 1;

-- ----------------------------
-- Sequence structure for "T_Role_Mail_Seq"
-- ----------------------------
DROP SEQUENCE "T_Role_Mail_Seq";
CREATE SEQUENCE "T_Role_Mail_Seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Table structure for "T_Account_Charge_Record"
-- ----------------------------
DROP TABLE "T_Account_Charge_Record";
CREATE TABLE "T_Account_Charge_Record" (
"dwOrderID" text NOT NULL,
"dwAccountID" int8 NOT NULL,
"dwGold" int8,
"dwTime" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Account_CommercialAct"
-- ----------------------------
DROP TABLE "T_Account_CommercialAct";
CREATE TABLE "T_Account_CommercialAct" (
"dwAccountID" int8 NOT NULL,
"dwActID" int4 NOT NULL,
"dwDays" int4 NOT NULL,
"dwIndex" int4 NOT NULL,
"dwGetTimes" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Alliance_Leader"
-- ----------------------------
DROP TABLE "T_Alliance_Leader";
CREATE TABLE "T_Alliance_Leader" (
"dwType" int2 NOT NULL,
"szGuildName" text,
"szAvaInfo" text,
"szText" text
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Build_Clear"
-- ----------------------------
DROP TABLE "T_Build_Clear";
CREATE TABLE "T_Build_Clear" (
"dwClearBuildTime" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Build_Rampart_Info"
-- ----------------------------
DROP TABLE "T_Build_Rampart_Info";
CREATE TABLE "T_Build_Rampart_Info" (
"dwRoleId" int8 NOT NULL,
"dwLabourValue" int8 DEFAULT 0 NOT NULL,
"dwWoodValue" int8 DEFAULT 0 NOT NULL,
"dwStoneValue" int8 DEFAULT 0 NOT NULL,
"dwState" int8 DEFAULT 1 NOT NULL,
"dwStateFlag" bool DEFAULT false NOT NULL,
"dwDiploidExp" bool DEFAULT false NOT NULL,
"strGetAward" varchar DEFAULT ''::character varying NOT NULL,
"dwLabourCD" int8 DEFAULT 0 NOT NULL,
"dwWoodCD" int8 DEFAULT 0 NOT NULL,
"dwStoneCD" int8 DEFAULT 0 NOT NULL,
"strRoleName" varchar NOT NULL,
"dwContriValue" int8 DEFAULT 0 NOT NULL,
"dwIconId" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Build_Rampart_Plan"
-- ----------------------------
DROP TABLE "T_Build_Rampart_Plan";
CREATE TABLE "T_Build_Rampart_Plan" (
"dwBuildPlan" int8 DEFAULT 0 NOT NULL,
"dwBuildValue" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_CommercialGift"
-- ----------------------------
DROP TABLE "T_CommercialGift";
CREATE TABLE "T_CommercialGift" (
"dwAccountID" int8 NOT NULL,
"strType" varchar(1024) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Dupl_EntityId_Info"
-- ----------------------------
DROP TABLE "T_Dupl_EntityId_Info";
CREATE TABLE "T_Dupl_EntityId_Info" (
"dwDuplEntityId" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Dupl_Info"
-- ----------------------------
DROP TABLE "T_Dupl_Info";
CREATE TABLE "T_Dupl_Info" (
"dwRoleId" int8 NOT NULL,
"dwDuplId" int8 NOT NULL,
"dwEntityId" int8 NOT NULL,
"dwTimes" int8 NOT NULL,
"dwDateTimes" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Dupl_JiFen_Info"
-- ----------------------------
DROP TABLE "T_Dupl_JiFen_Info";
CREATE TABLE "T_Dupl_JiFen_Info" (
"dwRoleId" int8 NOT NULL,
"dwDuplId" int8 NOT NULL,
"szRoleName" varchar NOT NULL,
"dwScore" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Dupl_Record_Info"
-- ----------------------------
DROP TABLE "T_Dupl_Record_Info";
CREATE TABLE "T_Dupl_Record_Info" (
"duplId" int8 NOT NULL,
"roleId" int8 NOT NULL,
"lifeTime" int8 DEFAULT 2400000 NOT NULL,
"roleName" varchar(50) DEFAULT ''::character varying NOT NULL,
"iconId" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Dupl_ZL_Boss_Record"
-- ----------------------------
DROP TABLE "T_Dupl_ZL_Boss_Record";
CREATE TABLE "T_Dupl_ZL_Boss_Record" (
"roleId" int8 NOT NULL,
"hitBossInfo" varchar DEFAULT ''::character varying NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Dupl_ZL_Info"
-- ----------------------------
DROP TABLE "T_Dupl_ZL_Info";
CREATE TABLE "T_Dupl_ZL_Info" (
"roleId" int8 NOT NULL,
"bossTimes" int8 DEFAULT 5 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Dupl_ZL_Record"
-- ----------------------------
DROP TABLE "T_Dupl_ZL_Record";
CREATE TABLE "T_Dupl_ZL_Record" (
"waveId" int8 NOT NULL,
"roleId" int8 DEFAULT 0 NOT NULL,
"roleName" varchar(64) DEFAULT ''::character varying NOT NULL,
"times" int8 DEFAULT 0 NOT NULL,
"iconId" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Equip_Build_Info"
-- ----------------------------
DROP TABLE "T_Equip_Build_Info";
CREATE TABLE "T_Equip_Build_Info" (
"dwRoleId" int8 NOT NULL,
"szBuildInfo" text NOT NULL,
"dwSuitLevel" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Errant_Award_Info"
-- ----------------------------
DROP TABLE "T_Errant_Award_Info";
CREATE TABLE "T_Errant_Award_Info" (
"dwRoleId" int8 NOT NULL,
"szErrantAward" varchar DEFAULT ''::character varying NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Errant_Honor_Info"
-- ----------------------------
DROP TABLE "T_Errant_Honor_Info";
CREATE TABLE "T_Errant_Honor_Info" (
"dwRoleId" int8 NOT NULL,
"dwErrantLevel" int4 DEFAULT 1 NOT NULL,
"dwErrantStar" int4 DEFAULT 1 NOT NULL,
"dwErrantValue" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Errant_Info"
-- ----------------------------
DROP TABLE "T_Errant_Info";
CREATE TABLE "T_Errant_Info" (
"dwRoleId" int8 NOT NULL,
"dwMapId" int8 NOT NULL,
"szKillMonster" text NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Escort_Info"
-- ----------------------------
DROP TABLE "T_Escort_Info";
CREATE TABLE "T_Escort_Info" (
"dwRoleId" int8 NOT NULL,
"dwEscortNum" int8 DEFAULT 0 NOT NULL,
"dwRefQuality" int8 DEFAULT 0 NOT NULL,
"dwEscortID" int8 DEFAULT 0 NOT NULL,
"dwType" int8 DEFAULT 0 NOT NULL,
"dwQuality" int8 DEFAULT 0 NOT NULL,
"dwMapId" int8 DEFAULT 0 NOT NULL,
"dwGetType" int8 DEFAULT 0 NOT NULL,
"dwShellEscortNum" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Festival_Info"
-- ----------------------------
DROP TABLE "T_Festival_Info";
CREATE TABLE "T_Festival_Info" (
"dwFestival" int4 NOT NULL,
"dwStartTime" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Festival_Line"
-- ----------------------------
DROP TABLE "T_Festival_Line";
CREATE TABLE "T_Festival_Line" (
"dwFestival" int4 NOT NULL,
"dwLine" int4 NOT NULL,
"dwState" int4,
"dwStartTime" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Full_Award_Version"
-- ----------------------------
DROP TABLE "T_Full_Award_Version";
CREATE TABLE "T_Full_Award_Version" (
"dwFullVersionId" int8 DEFAULT 0 NOT NULL,
"dwTime" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Guild_Apply"
-- ----------------------------
DROP TABLE "T_Guild_Apply";
CREATE TABLE "T_Guild_Apply" (
"dwApplyID" int8 DEFAULT nextval('"T_Guild_Apply_dwApplyID_seq"'::regclass),
"dwRoleID" int8 NOT NULL,
"dwGuildID" int8 NOT NULL,
"szRoleName" text,
"dwLevel" int4,
"dwDate" int8,
"dwClass" int4,
"szText" text,
"dwPower" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Guild_Combat"
-- ----------------------------
DROP TABLE "T_Guild_Combat";
CREATE TABLE "T_Guild_Combat" (
"dwRoleID" int8 NOT NULL,
"dwKillTotal" int8 NOT NULL,
"dwKillCombo" int8 NOT NULL,
"dwGainExp" int8 NOT NULL,
"dwGainMetal" int8 NOT NULL,
"dwGainWood" int8 NOT NULL,
"dwGainWater" int8 NOT NULL,
"dwGainEarth" int8 NOT NULL,
"dwGainFire" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Guild_Donate"
-- ----------------------------
DROP TABLE "T_Guild_Donate";
CREATE TABLE "T_Guild_Donate" (
"dwRoleID" int8 NOT NULL,
"dwMoney" int8,
"dwItem1" int8,
"dwItem2" int8,
"dwItem3" int8,
"dwItem4" int8,
"dwContribute" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Guild_Escort"
-- ----------------------------
DROP TABLE "T_Guild_Escort";
CREATE TABLE "T_Guild_Escort" (
"dwGuildID" int8 NOT NULL,
"dwLevel" int4,
"dwCount" int4,
"dwCall" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Guild_Info"
-- ----------------------------
DROP TABLE "T_Guild_Info";
CREATE TABLE "T_Guild_Info" (
"dwGuildID" int8 DEFAULT nextval('"T_Guild_Info_dwGuildID_seq"'::regclass) NOT NULL,
"szGuildName" text,
"dwLevel" int4,
"dwDate" int8,
"szAnnounce" text,
"dwMoney" int8 DEFAULT 0,
"dwItem1" int8 DEFAULT 0,
"dwItem2" int8 DEFAULT 0,
"bAutoAcceptFlag" bool DEFAULT false,
"dwAutoAcceptLevel" int4 DEFAULT 30,
"dwTotemLevel" int4 DEFAULT 0,
"dwItem3" int8,
"dwItem4" int8,
"dwActive" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Guild_Log"
-- ----------------------------
DROP TABLE "T_Guild_Log";
CREATE TABLE "T_Guild_Log" (
"dwLogID" int8 NOT NULL,
"eType" int4,
"szText" text,
"dwDate" int8,
"dwGuildID" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Guild_Member"
-- ----------------------------
DROP TABLE "T_Guild_Member";
CREATE TABLE "T_Guild_Member" (
"dwRoleID" int8 NOT NULL,
"szRoleName" text,
"dwLevel" int4,
"dwClass" int4,
"dwDate" int8,
"dwRank" int4,
"dwContribute" int8,
"dwGuildID" int8,
"dwWelfare" int8 DEFAULT 0,
"dwPower" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Guild_Quit"
-- ----------------------------
DROP TABLE "T_Guild_Quit";
CREATE TABLE "T_Guild_Quit" (
"dwRoleID" int8 NOT NULL,
"dwDate" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Guild_Resource"
-- ----------------------------
DROP TABLE "T_Guild_Resource";
CREATE TABLE "T_Guild_Resource" (
"dwGuildID" int8 NOT NULL,
"dwMoney" int8,
"dwItem1" int8,
"dwItem2" int8,
"dwItem3" int8,
"dwItem4" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Guild_Shop"
-- ----------------------------
DROP TABLE "T_Guild_Shop";
CREATE TABLE "T_Guild_Shop" (
"dwGuildID" int8 NOT NULL,
"dwItemEnum" int8 NOT NULL,
"dwItemNumber" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Guild_Skill"
-- ----------------------------
DROP TABLE "T_Guild_Skill";
CREATE TABLE "T_Guild_Skill" (
"dwGuildID" int8 NOT NULL,
"szSkill" text NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Guild_Table"
-- ----------------------------
DROP TABLE "T_Guild_Table";
CREATE TABLE "T_Guild_Table" (
"szTableName" text NOT NULL,
"dwEntryID" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Guild_Trophy"
-- ----------------------------
DROP TABLE "T_Guild_Trophy";
CREATE TABLE "T_Guild_Trophy" (
"dwTrophyID" int4 NOT NULL,
"dwGuildID" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_HideAchievement"
-- ----------------------------
DROP TABLE "T_HideAchievement";
CREATE TABLE "T_HideAchievement" (
"dwRoleID" int8,
"szRoleName" text,
"dwAchievementID" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Iron_Cloth_Info"
-- ----------------------------
DROP TABLE "T_Iron_Cloth_Info";
CREATE TABLE "T_Iron_Cloth_Info" (
"dwRoleId" int8 NOT NULL,
"dwClothLevel" int8 DEFAULT 1 NOT NULL,
"dwClothExp" int8 DEFAULT 0 NOT NULL,
"dwForbidValue" int8 DEFAULT 0 NOT NULL,
"dwSuitLevel" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Item_FrenzyHoe"
-- ----------------------------
DROP TABLE "T_Item_FrenzyHoe";
CREATE TABLE "T_Item_FrenzyHoe" (
"dwAwardItemId" int8 NOT NULL,
"dwRoleId" int8,
"szRoleName" varchar
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Lottery_Info"
-- ----------------------------
DROP TABLE "T_Lottery_Info";
CREATE TABLE "T_Lottery_Info" (
"dwStorageType" int4 NOT NULL,
"dwDrawCount" int8 NOT NULL,
"dwRewardType" int4 NOT NULL,
"dwRewardIndex" int4 NOT NULL,
"dwDrawTicket" int4,
"dwDrawTime" int8,
"szRoleName" varchar(100),
"dwRoleID" int8 DEFAULT 0,
"dwServerHostID" int4 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "T_Lottery_Info"."dwStorageType" IS '瀛樺偍绫诲瀷锛?浠ｈ〃涓婃寮€濂栫殑淇℃伅锛?浠ｈ〃褰撳墠寮€濂栫殑淇℃伅';
COMMENT ON COLUMN "T_Lottery_Info"."dwRewardType" IS '濂栧姳绫诲瀷';
COMMENT ON COLUMN "T_Lottery_Info"."dwDrawTicket" IS '涓鍙风爜';
COMMENT ON COLUMN "T_Lottery_Info"."dwRoleID" IS '涓鑰卹oleID';

-- ----------------------------
-- Table structure for "T_Mall_Limit"
-- ----------------------------
DROP TABLE "T_Mall_Limit";
CREATE TABLE "T_Mall_Limit" (
"dwID" int4 DEFAULT 0 NOT NULL,
"dwEnumID" int4 DEFAULT 0,
"dwNumber" int4 DEFAULT 0,
"dwTimeTick" int8 DEFAULT 0,
"dwPriceType" int4 DEFAULT 0,
"dwPrice" int4 DEFAULT 0,
"dwBindType" int4 DEFAULT 0,
"dwLength" int4 DEFAULT 0,
"dwBeginDay" int4 DEFAULT 0,
"dwHotFlag" int4 DEFAULT 0,
"dwDiscount" int4 DEFAULT 0
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Pet_Info"
-- ----------------------------
DROP TABLE "T_Pet_Info";
CREATE TABLE "T_Pet_Info" (
"dwRoleId" int8 NOT NULL,
"dwPetId" int8 NOT NULL,
"dwLevel" int8 DEFAULT 0 NOT NULL,
"dwExp" int8 DEFAULT 0 NOT NULL,
"dwState" int8 DEFAULT 1 NOT NULL,
"dwDayConsult" int8 DEFAULT 0 NOT NULL,
"dwConsult" int8 DEFAULT 0 NOT NULL,
"dwHp" int8 DEFAULT 0 NOT NULL,
"dwLastDieTime" int8 DEFAULT 0 NOT NULL,
"dwDayImpart" int8 DEFAULT 0 NOT NULL,
"dwAllImpart" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_PetAptitude_Info"
-- ----------------------------
DROP TABLE "T_PetAptitude_Info";
CREATE TABLE "T_PetAptitude_Info" (
"dwRoleID" int8 NOT NULL,
"dwPetEnumId" int8 NOT NULL,
"dwMp" int8 DEFAULT 0 NOT NULL,
"dwAttack" int8 DEFAULT 0 NOT NULL,
"dwDefense" int8 DEFAULT 0 NOT NULL,
"dwCrit" int8 DEFAULT 0 NOT NULL,
"dwFlee" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_PetBourn_Info"
-- ----------------------------
DROP TABLE "T_PetBourn_Info";
CREATE TABLE "T_PetBourn_Info" (
"dwRoleID" int8 NOT NULL,
"dwPetEnumId" int8 NOT NULL,
"dwExp" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_PetEquip_Info"
-- ----------------------------
DROP TABLE "T_PetEquip_Info";
CREATE TABLE "T_PetEquip_Info" (
"dwRoleID" int8 NOT NULL,
"dwPetEnumId" int8 NOT NULL,
"szPetEquip" varchar(32) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_PetSkill_Info"
-- ----------------------------
DROP TABLE "T_PetSkill_Info";
CREATE TABLE "T_PetSkill_Info" (
"dwRoleID" int8 NOT NULL,
"dwSkillIdStr" varchar(1024),
"dwSkillLevelStr" varchar(1024)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_PetSkill_Learned"
-- ----------------------------
DROP TABLE "T_PetSkill_Learned";
CREATE TABLE "T_PetSkill_Learned" (
"dwRoleID" int8 NOT NULL,
"dwPetEnumId" int8 NOT NULL,
"dwSkillList" varchar(1024),
"dwSkillLockList" varchar(1024),
"dwSkillIsOpenList" varchar(1024)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_PetWash_Info"
-- ----------------------------
DROP TABLE "T_PetWash_Info";
CREATE TABLE "T_PetWash_Info" (
"dwRoleID" int8 NOT NULL,
"dwPetEnumId" int8 NOT NULL,
"szAttr" varchar NOT NULL,
"dwWashCount" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Practice_Info"
-- ----------------------------
DROP TABLE "T_Practice_Info";
CREATE TABLE "T_Practice_Info" (
"dwRoleId" int8 NOT NULL,
"dwCurLevel" int8 DEFAULT 0 NOT NULL,
"dwCurProgress" int8 DEFAULT 0 NOT NULL,
"dwCurHideLevel" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role"
-- ----------------------------
DROP TABLE "T_Role";
CREATE TABLE "T_Role" (
"id" int4 DEFAULT nextval('"T_Role_id_seq"'::regclass) NOT NULL,
"dwUserID" int4,
"szRoleName" varchar(100),
"tsRegDate" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_360RedJewel"
-- ----------------------------
DROP TABLE "T_Role_360RedJewel";
CREATE TABLE "T_Role_360RedJewel" (
"dwAccountID" int8 NOT NULL,
"dwItemIndex" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_AchieveMedal"
-- ----------------------------
DROP TABLE "T_Role_AchieveMedal";
CREATE TABLE "T_Role_AchieveMedal" (
"dwRoleID" int8 NOT NULL,
"dwAchievePointPlus" int4 DEFAULT 0 NOT NULL,
"strMedalList" varchar
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Achievement_Hide"
-- ----------------------------
DROP TABLE "T_Role_Achievement_Hide";
CREATE TABLE "T_Role_Achievement_Hide" (
"dwAchievementID" int8 NOT NULL,
"dwRoleID" int8,
"szRoleName" text
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Achievement_New"
-- ----------------------------
DROP TABLE "T_Role_Achievement_New";
CREATE TABLE "T_Role_Achievement_New" (
"dwRoleID" int8 NOT NULL,
"dwAchievementID" int8 NOT NULL,
"eState" int4,
"dwDate" int8,
"dwProgress" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "t_role_addattrs"
-- ----------------------------
DROP TABLE "t_role_addattrs";
CREATE TABLE "t_role_addattrs" (
"roleid" int8 NOT NULL,
"records" text NOT NULL,
"attrs" text NOT NULL,
"totaltimes" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Amulet"
-- ----------------------------
DROP TABLE "T_Role_Amulet";
CREATE TABLE "T_Role_Amulet" (
"RoleID" int8 NOT NULL,
"AmuletGrowth" int8 DEFAULT 0,
"AmuletGift" int8 DEFAULT 0,
"AmuletScore" int8 DEFAULT 0,
"AmuletLevel" int8 DEFAULT 1,
"AmuletRank" int8 DEFAULT 1,
"AmuletIntensifyPerConfig" int8 DEFAULT 0,
"AmuletIntensifyColorConfig" int8 DEFAULT 0,
"AmuletInlayLevel" int8 DEFAULT 0,
"Aptitude" int8 DEFAULT 0
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Auto_Battle_Setting"
-- ----------------------------
DROP TABLE "T_Role_Auto_Battle_Setting";
CREATE TABLE "T_Role_Auto_Battle_Setting" (
"dwRoleID" int8 NOT NULL,
"dwHpRate" int8 NOT NULL,
"dwHpOrder" int8 NOT NULL,
"dwMpRate" int8 NOT NULL,
"dwMpOrder" int8 NOT NULL,
"bUseDoubleExp" bool NOT NULL,
"bPickEquip" bool NOT NULL,
"bPickMedicine" bool NOT NULL,
"bPickGold" bool NOT NULL,
"bPickMaterial" bool NOT NULL,
"dwProfType" int8 NOT NULL,
"dwEquipLevel" int8 NOT NULL,
"dwEquipQuality" int8 NOT NULL,
"dwSkill1" int8 NOT NULL,
"dwSkill2" int8 NOT NULL,
"dwSkill3" int8 NOT NULL,
"dwSkill4" int8 NOT NULL,
"dwSkill5" int8 NOT NULL,
"dwSkill6" int8 NOT NULL,
"dwRange" int8 NOT NULL,
"dwGoBackTime" int8 NOT NULL,
"bMonsterChoose" bool NOT NULL,
"bAutoAlive" bool NOT NULL,
"bautoMatic" bool DEFAULT false NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Baidu"
-- ----------------------------
DROP TABLE "T_Role_Baidu";
CREATE TABLE "T_Role_Baidu" (
"dwRoleID" int8 NOT NULL,
"szParam" varchar
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_BaiduPlayer"
-- ----------------------------
DROP TABLE "T_Role_BaiduPlayer";
CREATE TABLE "T_Role_BaiduPlayer" (
"dwRoleID" int8 NOT NULL,
"dwGetOnceTime" int8 DEFAULT 0,
"dwGetDailyTime" int8 DEFAULT 0
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Battle_Info"
-- ----------------------------
DROP TABLE "T_Role_Battle_Info";
CREATE TABLE "T_Role_Battle_Info" (
"dwRoleID" int8 NOT NULL,
"dwCurHP" int4 DEFAULT 0 NOT NULL,
"dwCurMP" int4 DEFAULT 0 NOT NULL,
"dwMuscle" int4 DEFAULT 0 NOT NULL,
"dwPhysique" int4 DEFAULT 0 NOT NULL,
"dwOrgan" int4 DEFAULT 0 NOT NULL,
"dwTechnique" int4 DEFAULT 0 NOT NULL,
"dwDander" int4 DEFAULT 0 NOT NULL,
"dwPoint" int4 DEFAULT 0 NOT NULL,
"dwCaromCount" int4 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "T_Role_Battle_Info"."dwMuscle" IS '臂力';
COMMENT ON COLUMN "T_Role_Battle_Info"."dwPhysique" IS '体魄';
COMMENT ON COLUMN "T_Role_Battle_Info"."dwOrgan" IS '根骨';
COMMENT ON COLUMN "T_Role_Battle_Info"."dwTechnique" IS '技巧';
COMMENT ON COLUMN "T_Role_Battle_Info"."dwDander" IS '怒气';
COMMENT ON COLUMN "T_Role_Battle_Info"."dwPoint" IS '潜力点';
COMMENT ON COLUMN "T_Role_Battle_Info"."dwCaromCount" IS '连击次数';

-- ----------------------------
-- Table structure for "T_Role_Bourn"
-- ----------------------------
DROP TABLE "T_Role_Bourn";
CREATE TABLE "T_Role_Bourn" (
"dwRoleID" int8 NOT NULL,
"dwBournExp" int8 NOT NULL,
"dwBournPVPExp" int8 NOT NULL,
"dwBournLv" int2 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_BournHideAttr"
-- ----------------------------
DROP TABLE "T_Role_BournHideAttr";
CREATE TABLE "T_Role_BournHideAttr" (
"RoleID" int8 NOT NULL,
"Level" int2
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Buff_Info"
-- ----------------------------
DROP TABLE "T_Role_Buff_Info";
CREATE TABLE "T_Role_Buff_Info" (
"dwRoleID" int8 NOT NULL,
"dwBuffID" int8 NOT NULL,
"dwEntityID" int8 NOT NULL,
"dwTime" int8 NOT NULL,
"dwValue" float8 NOT NULL,
"dwLeaveTime" int8,
"dwLevel" int8,
"dwEffectNum" int8,
"dwClassId" int8,
"dwReleaseType" int4,
"dwReleaseId" int8,
"dwFixTime" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Chart_Data"
-- ----------------------------
DROP TABLE "T_Role_Chart_Data";
CREATE TABLE "T_Role_Chart_Data" (
"eType" int2 NOT NULL,
"dwRoleID" int8 NOT NULL,
"szRoleName" text,
"dwValue" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Chart_List"
-- ----------------------------
DROP TABLE "T_Role_Chart_List";
CREATE TABLE "T_Role_Chart_List" (
"eType" int2 NOT NULL,
"dwNumber" int4 NOT NULL,
"dwRoleID" int8,
"szRoleName" text,
"dwValue" int8,
"dwChange" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Chart_Title_New"
-- ----------------------------
DROP TABLE "T_Role_Chart_Title_New";
CREATE TABLE "T_Role_Chart_Title_New" (
"dwRoleID" int8 NOT NULL,
"bAchievement" bool,
"bCombo" bool,
"bElement" bool,
"bKiller" bool,
"bLevel" bool,
"bPulse" bool,
"bWeath" bool,
"bBoss" bool DEFAULT true NOT NULL,
"bAmulet" bool DEFAULT true NOT NULL,
"bBourn" bool DEFAULT true NOT NULL,
"bGuild" bool DEFAULT true NOT NULL,
"bMount" bool DEFAULT true NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Chat"
-- ----------------------------
DROP TABLE "T_Role_Chat";
CREATE TABLE "T_Role_Chat" (
"dwRoleID" int8 NOT NULL,
"dwMessageID" int8 NOT NULL,
"dwSendTo" int8,
"dwTime" int8,
"dwChannel" int4,
"strText" varchar
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "T_Role_Chat"."dwChannel" IS '聊天频道';
COMMENT ON COLUMN "T_Role_Chat"."strText" IS '聊天信息';

-- ----------------------------
-- Table structure for "T_Role_Collect"
-- ----------------------------
DROP TABLE "T_Role_Collect";
CREATE TABLE "T_Role_Collect" (
"dwRoleID" int8 DEFAULT 0 NOT NULL,
"dwPageID" int4 DEFAULT 0 NOT NULL,
"dwSeriesID" int4 DEFAULT 0 NOT NULL,
"dwState" int2 DEFAULT 0,
"szNum" text
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_CollectJewel"
-- ----------------------------
DROP TABLE "T_Role_CollectJewel";
CREATE TABLE "T_Role_CollectJewel" (
"dwRoleID" int8 NOT NULL,
"dwInjectJewelUseNum" varchar(1024),
"dwInjectJewelState" varchar(1024),
"dwInjectJewelProcess" varchar(1024),
"dwInjectJewelUseTotalNum" int8,
"dwInjectJewelAddCanUseNum" varchar(1024),
"dwInjectJewelAddCanUseTotalNum" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_CollectJewelLevel"
-- ----------------------------
DROP TABLE "T_Role_CollectJewelLevel";
CREATE TABLE "T_Role_CollectJewelLevel" (
"dwRoleID" int8 NOT NULL,
"dwCollectJewelState" varchar(1024),
"dwCollectJewelLevel" varchar(1024)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Contact"
-- ----------------------------
DROP TABLE "T_Role_Contact";
CREATE TABLE "T_Role_Contact" (
"dwRoleID" int8 NOT NULL,
"dwContactID" int8 NOT NULL,
"dwLastTime" int8,
"dwVip" int4,
"dwLevel" int4,
"strName" varchar
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "T_Role_Contact"."dwLastTime" IS '最后一次交谈的时间';

-- ----------------------------
-- Table structure for "T_Role_CountNumber"
-- ----------------------------
DROP TABLE "T_Role_CountNumber";
CREATE TABLE "T_Role_CountNumber" (
"dwRoleID" int8 NOT NULL,
"dwIndex" int4 NOT NULL,
"dwCount" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_DataCenter"
-- ----------------------------
DROP TABLE "T_Role_DataCenter";
CREATE TABLE "T_Role_DataCenter" (
"dwRoleID" int8 NOT NULL,
"dwKillPlayer" int4 DEFAULT 0,
"dwKillBoss" int4 DEFAULT 0
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Del_Info"
-- ----------------------------
DROP TABLE "T_Role_Del_Info";
CREATE TABLE "T_Role_Del_Info" (
"dwRoleID" int8 NOT NULL,
"dwTime" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_EquipBuild_Info"
-- ----------------------------
DROP TABLE "T_Role_EquipBuild_Info";
CREATE TABLE "T_Role_EquipBuild_Info" (
"dwRoleId" int8 NOT NULL,
"dwCritBless" int8 DEFAULT 0 NOT NULL,
"dwBuildNum" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Evaluate_New"
-- ----------------------------
DROP TABLE "T_Role_Evaluate_New";
CREATE TABLE "T_Role_Evaluate_New" (
"dwRoleID" int8 NOT NULL,
"dwFlower" int8,
"dwEgg" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Evaluate_Receive"
-- ----------------------------
DROP TABLE "T_Role_Evaluate_Receive";
CREATE TABLE "T_Role_Evaluate_Receive" (
"dwRoleID" int8 NOT NULL,
"dwFlower" int8,
"dwEgg" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Evaluate_Send"
-- ----------------------------
DROP TABLE "T_Role_Evaluate_Send";
CREATE TABLE "T_Role_Evaluate_Send" (
"dwResRoleID" int8 NOT NULL,
"dwTarRoleID" int8 NOT NULL,
"dwEgg" int8,
"dwFlower" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Evaluate_Send_New"
-- ----------------------------
DROP TABLE "T_Role_Evaluate_Send_New";
CREATE TABLE "T_Role_Evaluate_Send_New" (
"dwRoleID" int8 NOT NULL,
"szEvaluate" text NOT NULL,
"dwUpdate" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_EventCenter"
-- ----------------------------
DROP TABLE "T_Role_EventCenter";
CREATE TABLE "T_Role_EventCenter" (
"dwRoleID" int8 NOT NULL,
"dwKillMonsterNum" int8,
"dwKillPlayerNum" int8,
"dwLevel" int8,
"dwEquipStrongNum" int8,
"dwStoneSetNum" int8,
"dwMarryDinnerNum" int8,
"dwAddFriendNum" int8,
"dwDoubleMonkNum" int8,
"dwMarryNum" int8,
"dwUseWeaponNum" int8,
"dwUseJpWeaponNum" int8,
"dwSendExpNum" int8,
"dwTaskNum" int8,
"dwContinueKillNum" int8 DEFAULT 0,
"dwElemLv" int8 DEFAULT 0,
"dwDantianLv" int8 DEFAULT 0,
"dwSkillLv" int8 DEFAULT 0,
"dwPulseLv" int8 DEFAULT 0,
"dwPulse1Lv" int8 DEFAULT 0,
"dwPulse2Lv" int8 DEFAULT 0,
"dwPulse3Lv" int8 DEFAULT 0,
"dwPulse4Lv" int8 DEFAULT 0,
"dwPulse5Lv" int8 DEFAULT 0,
"dwPulse6Lv" int8 DEFAULT 0,
"dwPulse7Lv" int8 DEFAULT 0,
"dwPulse8Lv" int8 DEFAULT 0,
"dwElemComboLv" int8 DEFAULT 0,
"dwBournLv" int8 DEFAULT 0,
"dwAmuletLv" int8 DEFAULT 0,
"dwMountLv" int8 DEFAULT 0,
"dwSwordLv" int8 DEFAULT 0,
"dwStrongLv" int8 DEFAULT 0
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_ExpPresent"
-- ----------------------------
DROP TABLE "T_Role_ExpPresent";
CREATE TABLE "T_Role_ExpPresent" (
"dwRoleID" int8 NOT NULL,
"dwExpGiveRemain" int4,
"dwExpInSlot" int4,
"dwTimeSended" int4,
"dwReqExpLvl" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Festival"
-- ----------------------------
DROP TABLE "T_Role_Festival";
CREATE TABLE "T_Role_Festival" (
"dwRoleID" int8 NOT NULL,
"dwFestival" int4 NOT NULL,
"dwLine" int4 NOT NULL,
"dwIndex" int4 NOT NULL,
"dwGetTimes" int4,
"dwTime" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_FirstBlood"
-- ----------------------------
DROP TABLE "T_Role_FirstBlood";
CREATE TABLE "T_Role_FirstBlood" (
"dwIndex" int4 NOT NULL,
"dwRoleID" int8 NOT NULL,
"dwLevel" int4,
"dwTaskID" int4,
"dwGold" int8,
"dwBindGold" int8,
"dwMoney" int8,
"szSubParam" text
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_FiveElem"
-- ----------------------------
DROP TABLE "T_Role_FiveElem";
CREATE TABLE "T_Role_FiveElem" (
"dwRoleID" int8 NOT NULL,
"dwMetalLv" int4 NOT NULL,
"dwWoodLv" int4 NOT NULL,
"dwWaterLv" int4 NOT NULL,
"dwFireLv" int4 NOT NULL,
"dwEarthLv" int4 NOT NULL,
"dwMetalValue" int8 NOT NULL,
"dwWoodValue" int8 NOT NULL,
"dwWaterValue" int8 NOT NULL,
"dwFireValue" int8 NOT NULL,
"dwEarthValue" int8 NOT NULL,
"dwCountTime" int8 NOT NULL,
"dwDantianLv" int4,
"dwMetalTime" int8,
"dwWoodTime" int8,
"dwWaterTime" int8,
"dwFireTime" int8,
"dwEarthTime" int8,
"szFillParam" text
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_FoundryStone"
-- ----------------------------
DROP TABLE "T_Role_FoundryStone";
CREATE TABLE "T_Role_FoundryStone" (
"dwRoleID" int8 NOT NULL,
"strType" varchar(1024)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_FrenzyHoe"
-- ----------------------------
DROP TABLE "T_Role_FrenzyHoe";
CREATE TABLE "T_Role_FrenzyHoe" (
"dwRoleId" int8 NOT NULL,
"dwAwardItemId" int8,
"dwIsGet" int2,
"dwFrendNum" int8,
"dwHoeItemId" int8,
"dwAwardItemNum" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Friend"
-- ----------------------------
DROP TABLE "T_Role_Friend";
CREATE TABLE "T_Role_Friend" (
"dwRoleID" int8 NOT NULL,
"dwFriendID" int8 NOT NULL,
"dwFlag" int4,
"dwMeetTime" int8,
"dwLastTime" int8,
"dwVip" int4,
"dwLevel" int4,
"strName" varchar,
"dwHead" int4,
"dwProf" int4,
"dwEnemy" int4 DEFAULT 0,
"dwInjectFlag" int2 DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "T_Role_Friend"."dwFlag" IS '好友的标记，好友、仇人、黑名单。';
COMMENT ON COLUMN "T_Role_Friend"."dwMeetTime" IS '相识的时间';
COMMENT ON COLUMN "T_Role_Friend"."dwLastTime" IS '最后一次被杀的时间';

-- ----------------------------
-- Table structure for "T_Role_Full_Award"
-- ----------------------------
DROP TABLE "T_Role_Full_Award";
CREATE TABLE "T_Role_Full_Award" (
"dwRoleId" int8 NOT NULL,
"dwAccountId" int8 NOT NULL,
"dwAddiAwardPhase" int8 DEFAULT 0 NOT NULL,
"dwPerAwardPhase" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Gamble"
-- ----------------------------
DROP TABLE "T_Role_Gamble";
CREATE TABLE "T_Role_Gamble" (
"dwRoleID" int8 DEFAULT 0 NOT NULL,
"dwGambleTime" int4 DEFAULT 0,
"dwFreeTime" int4 DEFAULT 0,
"szResult" text,
"dwTime" int8 DEFAULT 0
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Gift"
-- ----------------------------
DROP TABLE "T_Role_Gift";
CREATE TABLE "T_Role_Gift" (
"dwRoleID" int8 NOT NULL,
"dwLevelGiftSeq" int4 NOT NULL,
"dwTimeGiftSeq" int4 NOT NULL,
"dwTimeRemain" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Gourd"
-- ----------------------------
DROP TABLE "T_Role_Gourd";
CREATE TABLE "T_Role_Gourd" (
"dwRoleID" int8 NOT NULL,
"dwMendLevel" int8,
"dwCurSkillValue" int8,
"dwCurItemInfos" varchar(1024),
"dwAdornState" int8,
"dwAddTimesItemIndex" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_GrowupTarget"
-- ----------------------------
DROP TABLE "T_Role_GrowupTarget";
CREATE TABLE "T_Role_GrowupTarget" (
"dwRoleID" int8 NOT NULL,
"dwIndex" int4 NOT NULL,
"setCanGet" text NOT NULL,
"setHasGet" text NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_GuildLD"
-- ----------------------------
DROP TABLE "T_Role_GuildLD";
CREATE TABLE "T_Role_GuildLD" (
"dwRoleID" int8 NOT NULL,
"dwCurLDTime" int2
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_GuildSkill"
-- ----------------------------
DROP TABLE "T_Role_GuildSkill";
CREATE TABLE "T_Role_GuildSkill" (
"dwRoleID" int8 NOT NULL,
"szSkill" text NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Info"
-- ----------------------------
DROP TABLE "T_Role_Info";
CREATE TABLE "T_Role_Info" (
"dwRoleID" int8 DEFAULT nextval('"T_Role_Info_dwRoleID_seq"'::regclass) NOT NULL,
"dwAccountID" int8 NOT NULL,
"szRoleName" varchar(50) NOT NULL,
"dwSex" int2 NOT NULL,
"dwProf" int2 NOT NULL,
"dwFace" int4 NOT NULL,
"dwHair" int4 NOT NULL,
"dwDress" int4,
"dwHand" int4,
"dwShoe" int4,
"dwTotalExp" int8 NOT NULL,
"dwIncoID" int2 NOT NULL,
"dwArms" int4,
"dwDefDress" int4,
"dwDefHand" int4,
"dwDefShoe" int4,
"dwHorseID" int4,
"tmDownlineTime" int8,
"tmUplineTime" int8,
"dwDefFace" int4,
"dwDefHair" int4,
"dwDressLevel" int4,
"dwHandLevel" int4,
"dwShoeLevel" int4,
"dwArmsLevel" int4,
"tmCreateRoleTime" int8,
"dwExpGiveRemain" int4 DEFAULT 0,
"dwExpInSlot" int4 DEFAULT 0,
"dwLockStart" int8 DEFAULT 0,
"dwLockTime" int8 DEFAULT 0,
"szLockReason" varchar,
"dwBanStart" int8 DEFAULT 0,
"dwBanTime" int8 DEFAULT 0,
"szBanReason" varchar,
"strActSuit" text,
"szIP" varchar DEFAULT '0.0.0.0'::character varying NOT NULL,
"bOnline" bool DEFAULT false NOT NULL,
"dwNewRoleFlag" int2 DEFAULT 0 NOT NULL,
"dwIncoIDTemp" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "T_Role_Info"."dwAccountID" IS 'aa';
COMMENT ON COLUMN "T_Role_Info"."dwFace" IS '脸部模型';
COMMENT ON COLUMN "T_Role_Info"."dwHair" IS '头发';
COMMENT ON COLUMN "T_Role_Info"."dwDress" IS '身体-衣服';
COMMENT ON COLUMN "T_Role_Info"."dwHand" IS '手';
COMMENT ON COLUMN "T_Role_Info"."dwShoe" IS '脚';
COMMENT ON COLUMN "T_Role_Info"."dwTotalExp" IS '总经验';
COMMENT ON COLUMN "T_Role_Info"."dwIncoID" IS '头像标志';
COMMENT ON COLUMN "T_Role_Info"."dwArms" IS '脚';
COMMENT ON COLUMN "T_Role_Info"."dwDefDress" IS '武器';
COMMENT ON COLUMN "T_Role_Info"."dwDefHand" IS '武器';
COMMENT ON COLUMN "T_Role_Info"."dwDefShoe" IS '武器';
COMMENT ON COLUMN "T_Role_Info"."dwHorseID" IS '武器ID';
COMMENT ON COLUMN "T_Role_Info"."dwDefFace" IS '默认脸型';
COMMENT ON COLUMN "T_Role_Info"."dwDefHair" IS '默认发型';
COMMENT ON COLUMN "T_Role_Info"."dwDressLevel" IS '衣服强化等级';
COMMENT ON COLUMN "T_Role_Info"."dwHandLevel" IS '手套强化等级';
COMMENT ON COLUMN "T_Role_Info"."dwShoeLevel" IS '靴子强化等级';
COMMENT ON COLUMN "T_Role_Info"."dwArmsLevel" IS '武器强化等级';
COMMENT ON COLUMN "T_Role_Info"."dwLockStart" IS '封号开始的时间，单位秒';
COMMENT ON COLUMN "T_Role_Info"."dwLockTime" IS '封号时长，单位秒';
COMMENT ON COLUMN "T_Role_Info"."szLockReason" IS '封号的原因';
COMMENT ON COLUMN "T_Role_Info"."dwBanStart" IS '禁言开始的时间，单位秒';
COMMENT ON COLUMN "T_Role_Info"."dwBanTime" IS '禁言的时间，单位秒';
COMMENT ON COLUMN "T_Role_Info"."szBanReason" IS '禁言的理由';
COMMENT ON COLUMN "T_Role_Info"."strActSuit" IS '目前激活的套装ID';
COMMENT ON COLUMN "T_Role_Info"."dwNewRoleFlag" IS '是否是新创建的角色';

-- ----------------------------
-- Table structure for "T_Role_Inject_Log"
-- ----------------------------
DROP TABLE "T_Role_Inject_Log";
CREATE TABLE "T_Role_Inject_Log" (
"dwRoleID" int8 NOT NULL,
"dwInjectID" int8 DEFAULT 0 NOT NULL,
"dwTime" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Item_Equip"
-- ----------------------------
DROP TABLE "T_Role_Item_Equip";
CREATE TABLE "T_Role_Item_Equip" (
"dwItemID" int8 DEFAULT 0 NOT NULL,
"dwRoleID" int8 DEFAULT 0 NOT NULL,
"dwPosSlot" int4 NOT NULL,
"dwItemEnum" int4 NOT NULL,
"dwItemNumber" int2 NOT NULL,
"dwBindType" int2 NOT NULL,
"dwBornTime" int8 NOT NULL,
"dwLifeTime" int8 NOT NULL,
"strDoodle" text NOT NULL,
"strPropertyInfo" text NOT NULL,
"dwStrongLevel" int2 DEFAULT 0 NOT NULL,
"dwTianSheng" int4 DEFAULT 0 NOT NULL,
"dwEndure" int2 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "T_Role_Item_Equip"."dwItemID" IS '物品ID';
COMMENT ON COLUMN "T_Role_Item_Equip"."dwRoleID" IS '所有人ID';
COMMENT ON COLUMN "T_Role_Item_Equip"."dwPosSlot" IS '物品位置，包括容器类型和容器位置';
COMMENT ON COLUMN "T_Role_Item_Equip"."dwItemEnum" IS '物品类型';
COMMENT ON COLUMN "T_Role_Item_Equip"."dwItemNumber" IS '堆叠数量';
COMMENT ON COLUMN "T_Role_Item_Equip"."dwBindType" IS '绑定类型';
COMMENT ON COLUMN "T_Role_Item_Equip"."dwBornTime" IS '创建时间';
COMMENT ON COLUMN "T_Role_Item_Equip"."dwLifeTime" IS '剩余生命长度';
COMMENT ON COLUMN "T_Role_Item_Equip"."strDoodle" IS '物品附加字符串';
COMMENT ON COLUMN "T_Role_Item_Equip"."strPropertyInfo" IS '附加属性数据';
COMMENT ON COLUMN "T_Role_Item_Equip"."dwStrongLevel" IS '强化等级';
COMMENT ON COLUMN "T_Role_Item_Equip"."dwTianSheng" IS '天生等级';

-- ----------------------------
-- Table structure for "T_Role_Item_Normal"
-- ----------------------------
DROP TABLE "T_Role_Item_Normal";
CREATE TABLE "T_Role_Item_Normal" (
"dwItemID" int8 DEFAULT 0 NOT NULL,
"dwRoleID" int8 DEFAULT 0 NOT NULL,
"dwPosSlot" int4 NOT NULL,
"dwItemEnum" int4 NOT NULL,
"dwItemNumber" int2 NOT NULL,
"dwBindType" int2 NOT NULL,
"dwBornTime" int8 NOT NULL,
"dwLifeTime" int8 NOT NULL,
"strDoodle" text NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "T_Role_Item_Normal"."dwItemID" IS '物品ID';
COMMENT ON COLUMN "T_Role_Item_Normal"."dwRoleID" IS '所有人ID';
COMMENT ON COLUMN "T_Role_Item_Normal"."dwPosSlot" IS '物品位置，包括容器类型和容器位置';
COMMENT ON COLUMN "T_Role_Item_Normal"."dwItemEnum" IS '物品类型';
COMMENT ON COLUMN "T_Role_Item_Normal"."dwItemNumber" IS '堆叠数量';
COMMENT ON COLUMN "T_Role_Item_Normal"."dwBindType" IS '绑定类型';
COMMENT ON COLUMN "T_Role_Item_Normal"."dwBornTime" IS '创建时间';
COMMENT ON COLUMN "T_Role_Item_Normal"."dwLifeTime" IS '剩余生命长度';
COMMENT ON COLUMN "T_Role_Item_Normal"."strDoodle" IS '物品附加字符串';

-- ----------------------------
-- Table structure for "T_Role_ItemSystem"
-- ----------------------------
DROP TABLE "T_Role_ItemSystem";
CREATE TABLE "T_Role_ItemSystem" (
"dwRoleID" int8 NOT NULL,
"dwPacketSlotNum" int2 NOT NULL,
"dwPacketMoney" int4 NOT NULL,
"dwStorageSlotNum" int2 NOT NULL,
"dwStorageMoney" int4 NOT NULL,
"dwNextItemID" int4 NOT NULL,
"dwGold" int4 NOT NULL,
"dwBindGold" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_KungFu_Info"
-- ----------------------------
DROP TABLE "T_Role_KungFu_Info";
CREATE TABLE "T_Role_KungFu_Info" (
"n_RoleID" int8 NOT NULL,
"s_StudyProcess" varchar(256) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_LevelRecord"
-- ----------------------------
DROP TABLE "T_Role_LevelRecord";
CREATE TABLE "T_Role_LevelRecord" (
"dwRoleID" int8 NOT NULL,
"dwAccountID" int8,
"szRoleName" varchar,
"dupl" int4 DEFAULT 0,
"equip" int4 DEFAULT 0,
"amulet" int4 DEFAULT 0,
"mount" int4 DEFAULT 0,
"pulse" int4 DEFAULT 0,
"sword" int4 DEFAULT 0,
"bourn" int4 DEFAULT 0,
"skill" int4 DEFAULT 0,
"level" int4 DEFAULT 0,
"prof" int4 DEFAULT 0,
"leveltime" varchar DEFAULT ''::character varying
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "T_Role_LevelRecord"."dupl" IS '角色第一次进入副本的等级';
COMMENT ON COLUMN "T_Role_LevelRecord"."equip" IS '角色第一次强化等级';
COMMENT ON COLUMN "T_Role_LevelRecord"."amulet" IS '角色第一次升级护身宝甲等级';
COMMENT ON COLUMN "T_Role_LevelRecord"."mount" IS '角色第一次坐骑升阶等级';
COMMENT ON COLUMN "T_Role_LevelRecord"."pulse" IS '第一次升级经脉等级';
COMMENT ON COLUMN "T_Role_LevelRecord"."sword" IS '第一次升级宝剑的等级';
COMMENT ON COLUMN "T_Role_LevelRecord"."bourn" IS '第一次升级境界的等级';
COMMENT ON COLUMN "T_Role_LevelRecord"."skill" IS '第一次升级技能的等级';
COMMENT ON COLUMN "T_Role_LevelRecord"."leveltime" IS '达到某一个等级所需的时间';

-- ----------------------------
-- Table structure for "T_Role_LevelTotal"
-- ----------------------------
DROP TABLE "T_Role_LevelTotal";
CREATE TABLE "T_Role_LevelTotal" (
"dwRoleID" int8 NOT NULL,
"dwAccountID" int8,
"szRoleName" varchar,
"pulse" int4 DEFAULT 0,
"sword" int4 DEFAULT 0,
"mount" int4 DEFAULT 0,
"amulet" int4 DEFAULT 0,
"shizhan" int4 DEFAULT 0,
"skill" int4 DEFAULT 0,
"dupl" int4 DEFAULT 0,
"fengyun" int4 DEFAULT 0,
"online" int8 DEFAULT 0,
"level" int4 DEFAULT 0,
"prof" int4 DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "T_Role_LevelTotal"."pulse" IS '经脉总层数';
COMMENT ON COLUMN "T_Role_LevelTotal"."sword" IS '宝剑总层数';
COMMENT ON COLUMN "T_Role_LevelTotal"."mount" IS '坐骑阶数';
COMMENT ON COLUMN "T_Role_LevelTotal"."amulet" IS '护身宝甲阶数';
COMMENT ON COLUMN "T_Role_LevelTotal"."shizhan" IS '实战进阶层数';
COMMENT ON COLUMN "T_Role_LevelTotal"."skill" IS '角色技能总层数';
COMMENT ON COLUMN "T_Role_LevelTotal"."dupl" IS '角色副本进入次数';
COMMENT ON COLUMN "T_Role_LevelTotal"."fengyun" IS '角色完成风云任务的总数';
COMMENT ON COLUMN "T_Role_LevelTotal"."online" IS '角色总的在线时间';

-- ----------------------------
-- Table structure for "T_Role_LoginDays"
-- ----------------------------
DROP TABLE "T_Role_LoginDays";
CREATE TABLE "T_Role_LoginDays" (
"dwRoleID" int8 NOT NULL,
"szLoginDays" varchar(366) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_LotteryTicket_Info"
-- ----------------------------
DROP TABLE "T_Role_LotteryTicket_Info";
CREATE TABLE "T_Role_LotteryTicket_Info" (
"dwIndex" int4 NOT NULL,
"dwRoleID" int8 DEFAULT 0 NOT NULL,
"dwSelectedCount" int8 DEFAULT 0 NOT NULL,
"dwDrawCount" int8 DEFAULT 0 NOT NULL,
"dwServerHostID" int4 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "T_Role_LotteryTicket_Info"."dwSelectedCount" IS '鍘嗗彶琚€変腑娆℃暟';
COMMENT ON COLUMN "T_Role_LotteryTicket_Info"."dwDrawCount" IS '涓娆℃暟';

-- ----------------------------
-- Table structure for "T_Role_LuckDraw"
-- ----------------------------
DROP TABLE "T_Role_LuckDraw";
CREATE TABLE "T_Role_LuckDraw" (
"dwRoleID" int8 DEFAULT 0 NOT NULL,
"dwIndex" int4 DEFAULT 0 NOT NULL,
"dwID" int4 DEFAULT 0 NOT NULL,
"dwEnumID" int4 DEFAULT 0 NOT NULL,
"dwNumber" int4 DEFAULT 0 NOT NULL,
"dwPriceType" int4 DEFAULT 0 NOT NULL,
"dwPrice" int4 DEFAULT 0 NOT NULL,
"dwBindType" int4 DEFAULT 0 NOT NULL,
"dwBuyFlag" int4 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Mail"
-- ----------------------------
DROP TABLE "T_Role_Mail";
CREATE TABLE "T_Role_Mail" (
"dwMailID" int8,
"dwSender" int8,
"dwReceiver" int8 NOT NULL,
"strSender" varchar,
"strReceiver" varchar,
"strTopic" varchar,
"strContent" varchar,
"dwReceiveTime" int8,
"dwLifeTime" int4,
"dwGold" int4 DEFAULT 0,
"dwBindGold" int4 DEFAULT 0,
"dwMoney" int4 DEFAULT 0,
"dwItemState" int4 DEFAULT 1,
"dwReadState" int4 DEFAULT 1,
"dwID" int8 DEFAULT nextval('"T_Role_Mail_seq"'::regclass) NOT NULL,
"dwItemID1" varchar,
"dwItemID2" varchar,
"dwItemID3" varchar,
"dwItemID4" varchar,
"dwItemID5" varchar
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "T_Role_Mail"."dwMailID" IS '邮件ID';
COMMENT ON COLUMN "T_Role_Mail"."dwSender" IS '邮件发送者的ID';
COMMENT ON COLUMN "T_Role_Mail"."dwReceiver" IS '邮件接受者的ID';
COMMENT ON COLUMN "T_Role_Mail"."strSender" IS '邮件发送者的名字';
COMMENT ON COLUMN "T_Role_Mail"."strReceiver" IS '邮件接受者的名字';
COMMENT ON COLUMN "T_Role_Mail"."strTopic" IS '主题';
COMMENT ON COLUMN "T_Role_Mail"."strContent" IS '内容';
COMMENT ON COLUMN "T_Role_Mail"."dwReceiveTime" IS '收件时间';
COMMENT ON COLUMN "T_Role_Mail"."dwLifeTime" IS '生命时长，单位毫秒';
COMMENT ON COLUMN "T_Role_Mail"."dwGold" IS '携带的银两';
COMMENT ON COLUMN "T_Role_Mail"."dwBindGold" IS '礼金数量';
COMMENT ON COLUMN "T_Role_Mail"."dwMoney" IS '银两数量';
COMMENT ON COLUMN "T_Role_Mail"."dwItemState" IS '物品是否已经领取';
COMMENT ON COLUMN "T_Role_Mail"."dwReadState" IS '邮件是否已经阅读';

-- ----------------------------
-- Table structure for "T_Role_Mall"
-- ----------------------------
DROP TABLE "T_Role_Mall";
CREATE TABLE "T_Role_Mall" (
"dwRoleID" int8 NOT NULL,
"dwMallValue" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Map_Info"
-- ----------------------------
DROP TABLE "T_Role_Map_Info";
CREATE TABLE "T_Role_Map_Info" (
"dwRoleID" int8 NOT NULL,
"dwMapID" int4 NOT NULL,
"fXPos" float4,
"fYPos" float4,
"fDirValue" float4,
"fSpeed" float4,
"dwDuplId" int8 DEFAULT (0)::bigint NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Marriage"
-- ----------------------------
DROP TABLE "T_Role_Marriage";
CREATE TABLE "T_Role_Marriage" (
"HusbandRoleID" int8 NOT NULL,
"WifeRoleID" int8 NOT NULL,
"MarriedTime" int8 NOT NULL,
"HusbandName" varchar(50) NOT NULL,
"WifeName" varchar(50) NOT NULL,
"dwLove" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_MarriageBanquetList"
-- ----------------------------
DROP TABLE "T_Role_MarriageBanquetList";
CREATE TABLE "T_Role_MarriageBanquetList" (
"HusbandRoleID" int8 NOT NULL,
"WifeRoleID" int8 NOT NULL,
"BanquetID" int4 NOT NULL,
"HoldTime" int8 NOT NULL,
"HoldPlace" int4 NOT NULL,
"HoldLine" int2 NOT NULL,
"HoldLevel" int2 NOT NULL,
"HusbandName" varchar(50) NOT NULL,
"WifeName" varchar(50) NOT NULL,
"IsHeld" int2 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_MarriageChange"
-- ----------------------------
DROP TABLE "T_Role_MarriageChange";
CREATE TABLE "T_Role_MarriageChange" (
"RoleID" int8 NOT NULL,
"ItemEnumID" int4 NOT NULL,
"sFormerName" varchar(50) DEFAULT ''::character varying NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_MarriageChatList"
-- ----------------------------
DROP TABLE "T_Role_MarriageChatList";
CREATE TABLE "T_Role_MarriageChatList" (
"n_RoleID" int8 NOT NULL,
"b_Recv" bool NOT NULL,
"n_Time" int8 NOT NULL,
"s_MsgText" text NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_MarriageGiftMoney"
-- ----------------------------
DROP TABLE "T_Role_MarriageGiftMoney";
CREATE TABLE "T_Role_MarriageGiftMoney" (
"BanquetID" int4 NOT NULL,
"GuestRoleID" int8 NOT NULL,
"GuestName" varchar(50) NOT NULL,
"GiftMoney" int4 NOT NULL,
"GuestLevel" int2 NOT NULL,
"HusbandRecv" int2 NOT NULL,
"WifeRecv" int2 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_MarriageRoleEatInfo"
-- ----------------------------
DROP TABLE "T_Role_MarriageRoleEatInfo";
CREATE TABLE "T_Role_MarriageRoleEatInfo" (
"RoleID" int8 NOT NULL,
"LastEatTime" int8 NOT NULL,
"NpcInfo" varchar(1024) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_MarriageRoleToBanquet"
-- ----------------------------
DROP TABLE "T_Role_MarriageRoleToBanquet";
CREATE TABLE "T_Role_MarriageRoleToBanquet" (
"RoleID" int8 NOT NULL,
"BanquetID" int4 NOT NULL,
"time" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Martial_Info"
-- ----------------------------
DROP TABLE "T_Role_Martial_Info";
CREATE TABLE "T_Role_Martial_Info" (
"dwRoleID" int8 DEFAULT 0 NOT NULL,
"dwSkillID" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_MatrixMethod"
-- ----------------------------
DROP TABLE "T_Role_MatrixMethod";
CREATE TABLE "T_Role_MatrixMethod" (
"dwRoleID" int8 NOT NULL,
"dwOrdinaryStarTotalExp" varchar(1024),
"dwSuitStarLevel" int8,
"dwHideStarLevel" int8,
"dwUsedFreeNum" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_MegaKill"
-- ----------------------------
DROP TABLE "T_Role_MegaKill";
CREATE TABLE "T_Role_MegaKill" (
"dwRoleID" int8 NOT NULL,
"dwSoulNum" int4 NOT NULL,
"dwRandomNum" int2 NOT NULL,
"dwBuyNum" int2 NOT NULL,
"dwLevel" int2 NOT NULL,
"strAttrs" text NOT NULL,
"strKillRecord" text NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_MissionDaily"
-- ----------------------------
DROP TABLE "T_Role_MissionDaily";
CREATE TABLE "T_Role_MissionDaily" (
"dwRoleID" int8 NOT NULL,
"dwActivePoint" int4 NOT NULL,
"dwActivePointTotal" int4 NOT NULL,
"dwOnLineTime" int8 NOT NULL,
"setDailyGift" text NOT NULL,
"setWeeklyGift" text NOT NULL,
"setEventInfo" text NOT NULL,
"setExchangeGift" text NOT NULL,
"dwSignTime" int8 DEFAULT 0 NOT NULL,
"setOtherGift" text,
"dwOnLineDay" int8 DEFAULT 0 NOT NULL,
"dwWeiWangLevel" int4,
"setWeiWangGift" text
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Mood"
-- ----------------------------
DROP TABLE "T_Role_Mood";
CREATE TABLE "T_Role_Mood" (
"dwRoleID" int8 NOT NULL,
"dwMood1" int2,
"dwMood2" int2,
"dwMood3" int2,
"dwMood4" int2,
"szSign" varchar
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Mount"
-- ----------------------------
DROP TABLE "T_Role_Mount";
CREATE TABLE "T_Role_Mount" (
"n_RoleID" int8 NOT NULL,
"n_InstID" int4 NOT NULL,
"n_EnumID" int4 NOT NULL,
"n_Level" int2 NOT NULL,
"n_Exp" int8 NOT NULL,
"n_GongJiAptitude" int4 NOT NULL,
"n_FangYuAptitude" int4 NOT NULL,
"n_GenGuAptitude" int4 NOT NULL,
"n_JiQiaoAptitude" int4 NOT NULL,
"b_IsBind" bool NOT NULL,
"s_Equip" varchar(256) NOT NULL,
"s_Skill" varchar(256) NOT NULL,
"n_Quality" int2 NOT NULL,
"n_Point" int4 DEFAULT 0 NOT NULL,
"n_Rank" varchar(1024) DEFAULT 0 NOT NULL,
"n_RankExp" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_MountSystem"
-- ----------------------------
DROP TABLE "T_Role_MountSystem";
CREATE TABLE "T_Role_MountSystem" (
"n_RoleID" int8 NOT NULL,
"n_MountSlotNum" int2 NOT NULL,
"n_ActiveMountID" int4 NOT NULL,
"n_NextInstID" int4 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Muse"
-- ----------------------------
DROP TABLE "T_Role_Muse";
CREATE TABLE "T_Role_Muse" (
"dwRoleID" int8 NOT NULL,
"dwMuseBegin" int8 DEFAULT 0 NOT NULL,
"dwBeInjectCount" int4 DEFAULT 0,
"dwAddMuseCount" int4 DEFAULT 0,
"dwMyInjectExpCount" int4 DEFAULT 0,
"dwGiftCount" int4 DEFAULT 0
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_NoviceGuide_New"
-- ----------------------------
DROP TABLE "T_Role_NoviceGuide_New";
CREATE TABLE "T_Role_NoviceGuide_New" (
"dwRoleID" int8 NOT NULL,
"dwGuideID" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_NpcConnection"
-- ----------------------------
DROP TABLE "T_Role_NpcConnection";
CREATE TABLE "T_Role_NpcConnection" (
"dwRoleID" int8 NOT NULL,
"sztNpcCurTearchNum" text
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_OnDayTime"
-- ----------------------------
DROP TABLE "T_Role_OnDayTime";
CREATE TABLE "T_Role_OnDayTime" (
"szIsReset" text,
"szData" text,
"dwSystemID" int8 NOT NULL,
"dwRoleID" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_OnlineAwards"
-- ----------------------------
DROP TABLE "T_Role_OnlineAwards";
CREATE TABLE "T_Role_OnlineAwards" (
"dwRoleID" int8 NOT NULL,
"dwUsedNum" int8,
"dwAwardIndexs" varchar(1024),
"dwAwardTypes" varchar(1024),
"dwAwardStates" varchar(1024),
"dwInterTime" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_OnlineGift"
-- ----------------------------
DROP TABLE "T_Role_OnlineGift";
CREATE TABLE "T_Role_OnlineGift" (
"dwRoleID" int8 NOT NULL,
"dwOnlineTime" int4 NOT NULL,
"szAward" varchar(256) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Pack"
-- ----------------------------
DROP TABLE "T_Role_Pack";
CREATE TABLE "T_Role_Pack" (
"dwRoleID" int8 NOT NULL,
"dwPackExtend" int4,
"dwPackMoney" int4,
"dwGold" int4,
"dwBindGold" int4,
"dwStorageExtend" int4,
"dwStorageMoney" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_PlayerShopItem"
-- ----------------------------
DROP TABLE "T_Role_PlayerShopItem";
CREATE TABLE "T_Role_PlayerShopItem" (
"szShopName" text NOT NULL,
"dwItemID" int8 NOT NULL,
"bPriceType" int8 NOT NULL,
"dwPrice" int8 NOT NULL,
"dwRoleID" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_PlayerShopName"
-- ----------------------------
DROP TABLE "T_Role_PlayerShopName";
CREATE TABLE "T_Role_PlayerShopName" (
"szShopName" text NOT NULL,
"dwRoleID" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Plus_Info"
-- ----------------------------
DROP TABLE "T_Role_Plus_Info";
CREATE TABLE "T_Role_Plus_Info" (
"dwRoleID" int8 NOT NULL,
"dwMuseBegin" int8 DEFAULT 0 NOT NULL,
"dwPKMode" int8 DEFAULT 1 NOT NULL,
"dwPKValue" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_PractiseSkill"
-- ----------------------------
DROP TABLE "T_Role_PractiseSkill";
CREATE TABLE "T_Role_PractiseSkill" (
"dwRoleID" int8 NOT NULL,
"dwPractiseLevel" int8,
"dwMendValue" int8,
"dwStarLevel" int8,
"dwHeadState" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Pulse"
-- ----------------------------
DROP TABLE "T_Role_Pulse";
CREATE TABLE "T_Role_Pulse" (
"dwRoleID" int8 NOT NULL,
"dwPulse1" int2 NOT NULL,
"dwPulse2" int2 NOT NULL,
"dwPulse3" int2 NOT NULL,
"dwPulse4" int2 NOT NULL,
"dwPulse5" int2 NOT NULL,
"dwPulse6" int2 NOT NULL,
"dwPulse7" int2 NOT NULL,
"dwPulse8" int2 NOT NULL,
"dwTotalExp" int8 NOT NULL,
"dwLastTimes" int2 NOT NULL,
"dwCountTime" int8,
"dwWuValue" int8 DEFAULT 0,
"dwWuType" int2 DEFAULT 0,
"dwDraPul" int2
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "t_role_qihun"
-- ----------------------------
DROP TABLE "t_role_qihun";
CREATE TABLE "t_role_qihun" (
"roleid" int8 NOT NULL,
"times" int4 NOT NULL,
"awards" text NOT NULL,
"selects" text NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_QunXia"
-- ----------------------------
DROP TABLE "T_Role_QunXia";
CREATE TABLE "T_Role_QunXia" (
"dwRoleID" int8 NOT NULL,
"maxTotalCount" int4 DEFAULT 0 NOT NULL,
"curTotalCount" int4 DEFAULT 0 NOT NULL,
"setQunXiaCount" varchar NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_QunXiaLu"
-- ----------------------------
DROP TABLE "T_Role_QunXiaLu";
CREATE TABLE "T_Role_QunXiaLu" (
"dwRoleID" int8 NOT NULL,
"dwHotelLastTime" int8 DEFAULT 0 NOT NULL,
"dwHotelPrestigeCount" int4 DEFAULT 0 NOT NULL,
"dwHotelGoldCount" int4 DEFAULT 0 NOT NULL,
"szHotelCard" varchar NOT NULL,
"szGroupSlot" varchar NOT NULL,
"szDaXiaSlot" varchar NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Refresh"
-- ----------------------------
DROP TABLE "T_Role_Refresh";
CREATE TABLE "T_Role_Refresh" (
"dwRoleID" int8 NOT NULL,
"dwDataID" int8 NOT NULL,
"dwValue" int8,
"dwUpdate" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Setting"
-- ----------------------------
DROP TABLE "T_Role_Setting";
CREATE TABLE "T_Role_Setting" (
"dwRoleID" int8 NOT NULL,
"dwOthersModel" int2,
"dwRoleLight" int2,
"dwRoleShadow" int2,
"dwEnvShadow" int2,
"dwBGMOpen" int2,
"dwBGMVolume" int2,
"dwSFXOpen" int2,
"dwSFXVolume" int2,
"dwIncomeTips" int2,
"dwOthersBlood" int2,
"dwMyBlood" int2,
"dwOthersName" int2,
"dwOthersPopText" int2,
"dwBeAddedNotice" int2,
"dwAcceptPrivate" int2,
"dwAcceptTeam" int2,
"dwAcceptFaction" int2,
"dwAcceptTrade" int2,
"dwAcceptProposal" int2,
"dwSkillShake" int2,
"dwOthersShadow" int2,
"dwMonsterShadow" int2,
"dwFloodLight" int2 DEFAULT 0,
"dwWeather" int2,
"dwOthersPopTextCnd" int2 DEFAULT 1,
"dwMonsterName" int2 DEFAULT 1,
"dwMonsterBlood" int2 DEFAULT 1,
"dwMyPopText" int2 DEFAULT 1,
"dwHurtNotice" int2 DEFAULT 1,
"dwAutoMartial" int2 DEFAULT 1,
"dwRedNotice" int2 DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "T_Role_Setting"."dwHurtNotice" IS '被击提示';
COMMENT ON COLUMN "T_Role_Setting"."dwAutoMartial" IS '自动演武';

-- ----------------------------
-- Table structure for "T_Role_Shortcut_Info"
-- ----------------------------
DROP TABLE "T_Role_Shortcut_Info";
CREATE TABLE "T_Role_Shortcut_Info" (
"dwRoleID" int8 NOT NULL,
"dwShortcutID" int2 NOT NULL,
"dwType" int2 NOT NULL,
"dwDataID" int4 NOT NULL,
"ItemType" int4 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "T_Role_Shortcut_Info"."dwRoleID" IS '角色ID';
COMMENT ON COLUMN "T_Role_Shortcut_Info"."dwShortcutID" IS '扩展ID';
COMMENT ON COLUMN "T_Role_Shortcut_Info"."dwType" IS 'dw品，2技能';
COMMENT ON COLUMN "T_Role_Shortcut_Info"."dwDataID" IS 'dw品ID，2技能ID';
COMMENT ON COLUMN "T_Role_Shortcut_Info"."ItemType" IS '是不是扩展的';

-- ----------------------------
-- Table structure for "T_Role_Skill_Info"
-- ----------------------------
DROP TABLE "T_Role_Skill_Info";
CREATE TABLE "T_Role_Skill_Info" (
"dwSkillID" int8 NOT NULL,
"dwRoleID" int8 NOT NULL,
"dwSkillLevel" int4,
"dwSkillKnowValue" int4,
"dwOpenFlag" int4 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "T_Role_Skill_Info"."dwOpenFlag" IS '0';

-- ----------------------------
-- Table structure for "T_Role_Soul_Object"
-- ----------------------------
DROP TABLE "T_Role_Soul_Object";
CREATE TABLE "T_Role_Soul_Object" (
"dwRoleID" int8 DEFAULT 0 NOT NULL,
"dwSoulID" int4 DEFAULT 0 NOT NULL,
"dwEnumID" int4 DEFAULT 0,
"dwHolderType" int4 DEFAULT 0,
"dwPosID" int4 DEFAULT 0,
"dwExp" int4 DEFAULT 0
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Soul_System"
-- ----------------------------
DROP TABLE "T_Role_Soul_System";
CREATE TABLE "T_Role_Soul_System" (
"dwRoleID" int8 DEFAULT 0 NOT NULL,
"dwPacketNumber" int4 DEFAULT 0,
"dwClickIndex" int4 DEFAULT 0,
"dwSoulChip" int4 DEFAULT 0,
"strActiveSuit" varchar
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Sword"
-- ----------------------------
DROP TABLE "T_Role_Sword";
CREATE TABLE "T_Role_Sword" (
"dwRoleId" int8 NOT NULL,
"dwSwordLadder" int8 NOT NULL,
"dwSwordLevel" int8 NOT NULL,
"dwSwordGas" int8 NOT NULL,
"dwUseCardState" int2 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_SwordFoundry"
-- ----------------------------
DROP TABLE "T_Role_SwordFoundry";
CREATE TABLE "T_Role_SwordFoundry" (
"dwRoleID" int8 NOT NULL,
"dwSwordEumeID" int4,
"dwStartNum" int4,
"dwSkilledValue" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Task"
-- ----------------------------
DROP TABLE "T_Role_Task";
CREATE TABLE "T_Role_Task" (
"dwRoleID" int8 DEFAULT 0 NOT NULL,
"dwTaskId" int4 DEFAULT 0 NOT NULL,
"dwState" int2 DEFAULT 0,
"dwAcceptTimes" int4 DEFAULT 0,
"dwCompleteTimes" int4 DEFAULT 0,
"dwLastAcceptTime" int8 DEFAULT 0,
"dwLastCompleteTime" int8 DEFAULT 0,
"dwMon1" int8 DEFAULT 0,
"dwItem1" int8 DEFAULT 0,
"dwExplore1" int2 DEFAULT 0,
"dwUse1" int2 DEFAULT 0,
"dwSp1" int2 DEFAULT 0,
"dwLastAcceptLevel" int4 DEFAULT 1,
"dwLastCompleteLevel" int4 DEFAULT 1,
"dwLoopId" int4 DEFAULT 0,
"dwQuality" int4 DEFAULT 1,
"dwNpc1" int2 DEFAULT 0
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Task_Ex"
-- ----------------------------
DROP TABLE "T_Role_Task_Ex";
CREATE TABLE "T_Role_Task_Ex" (
"dwRoleID" int8 NOT NULL,
"dwDailyLoop" int4 DEFAULT 0,
"dwUpdateTime" int8 DEFAULT 0,
"dwWeeklyLoop" int4 DEFAULT 0,
"dwNowLoop" int4 DEFAULT 0,
"dwNowTask" int4 DEFAULT 0
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_TianGuanCiFu"
-- ----------------------------
DROP TABLE "T_Role_TianGuanCiFu";
CREATE TABLE "T_Role_TianGuanCiFu" (
"n_RoleID" int8 NOT NULL,
"n_EquipUpGrade" int4 NOT NULL,
"n_MountUpGrade" int4 NOT NULL,
"n_AmuletUpGrade" int4 NOT NULL,
"n_JingJieUp" int4 DEFAULT 0 NOT NULL,
"n_SwordUpGrade" int4 DEFAULT 0 NOT NULL,
"n_EquipStrong" int4 DEFAULT 0 NOT NULL,
"n_EquipUpGrade1" int4 DEFAULT 0 NOT NULL,
"n_EquipUpGrade2" int4 DEFAULT 0 NOT NULL,
"n_MountUpGrade1" int4 DEFAULT 0 NOT NULL,
"n_MountUpGrade2" int4 DEFAULT 0 NOT NULL,
"n_AmuletUpGrade1" int4 DEFAULT 0 NOT NULL,
"n_AmuletUpGrade2" int4 DEFAULT 0 NOT NULL,
"n_JingJieUp1" int4 DEFAULT 0 NOT NULL,
"n_JingJieUp2" int4 DEFAULT 0 NOT NULL,
"n_SwordUpGrade1" int4 DEFAULT 0 NOT NULL,
"n_SwordUpGrade2" int4 DEFAULT 0 NOT NULL,
"n_EquipStrong1" int4 DEFAULT 0 NOT NULL,
"n_EquipStrong2" int4 DEFAULT 0 NOT NULL,
"n_KungFuStudy" int4 DEFAULT 0 NOT NULL,
"n_MegaKill" int4 DEFAULT 0 NOT NULL,
"n_MegaKill1" int4 DEFAULT 0 NOT NULL,
"n_MegaKill2" int4 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Time_Reward"
-- ----------------------------
DROP TABLE "T_Role_Time_Reward";
CREATE TABLE "T_Role_Time_Reward" (
"dwRoleID" int8 NOT NULL,
"szLoginReward" text,
"dwLastLoginTime" int8 DEFAULT 0,
"szSignin" text,
"szSigninReward" text,
"dwWeekLoginTime" int8,
"dwWeekMoneyGet" int8,
"dwLastSigninTime" int8,
"dwWeekMoneyTime" int8,
"dwWeekStartTime" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Title"
-- ----------------------------
DROP TABLE "T_Role_Title";
CREATE TABLE "T_Role_Title" (
"dwRoleID" int8 NOT NULL,
"dwTitleID" int4 NOT NULL,
"dwShow" int4,
"dwUpdate" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Treasure"
-- ----------------------------
DROP TABLE "T_Role_Treasure";
CREATE TABLE "T_Role_Treasure" (
"dwRoleID" int8 NOT NULL,
"dwTime" int8,
"dwCount" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_UnionPlatGift"
-- ----------------------------
DROP TABLE "T_Role_UnionPlatGift";
CREATE TABLE "T_Role_UnionPlatGift" (
"dwRoleID" int8 NOT NULL,
"setHasGet" text
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_Vip"
-- ----------------------------
DROP TABLE "T_Role_Vip";
CREATE TABLE "T_Role_Vip" (
"dwRoleID" int8 NOT NULL,
"dwTimeLast" int8 NOT NULL,
"dwTransportNum" int4 NOT NULL,
"dwGetItem" int2 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_WantMarry"
-- ----------------------------
DROP TABLE "T_Role_WantMarry";
CREATE TABLE "T_Role_WantMarry" (
"dwRoleID" int8 NOT NULL,
"strMessage" varchar,
"dwTime" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_WuXiaLing"
-- ----------------------------
DROP TABLE "T_Role_WuXiaLing";
CREATE TABLE "T_Role_WuXiaLing" (
"RoleID" int8 DEFAULT 0 NOT NULL,
"Insignia" int2 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Role_YWZ"
-- ----------------------------
DROP TABLE "T_Role_YWZ";
CREATE TABLE "T_Role_YWZ" (
"dwRoleID" int8 NOT NULL,
"dwImageID" int4 NOT NULL,
"ImageData" text
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Server_Info"
-- ----------------------------
DROP TABLE "T_Server_Info";
CREATE TABLE "T_Server_Info" (
"dwServerHostID" int4 NOT NULL,
"dwStartTime" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_Server_MergeServer_Info"
-- ----------------------------
DROP TABLE "T_Server_MergeServer_Info";
CREATE TABLE "T_Server_MergeServer_Info" (
"dwServerHostID" int4 NOT NULL,
"dwStartTime" int8,
"dwTimes" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "T_ServerEvent"
-- ----------------------------
DROP TABLE "T_ServerEvent";
CREATE TABLE "T_ServerEvent" (
"EventType" int8,
"CompleteRoleID" int8,
"CompleteRoleName" text,
"CompleteTime" int8,
"dwData1" int8,
"szData1" text,
"EventID" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for "test"
-- ----------------------------
DROP TABLE "test";
CREATE TABLE "test" (
"id" int4 NOT NULL,
"name" text,
"dd" int2,
"z1" int8,
"z2" bool,
"z3" varchar,
"z4" text,
"z5" char(1)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "T_Guild_Apply_dwApplyID_seq" OWNED BY "T_Guild_Apply"."dwApplyID";
ALTER SEQUENCE "T_Guild_Info_dwGuildID_seq" OWNED BY "T_Guild_Info"."dwGuildID";
ALTER SEQUENCE "T_Role_id_seq" OWNED BY "T_Role"."id";

-- ----------------------------
-- Indexes structure for table T_Account_Charge_Record
-- ----------------------------
CREATE INDEX "T_Account_Charge_Record_dwAccountID_Index" ON "T_Account_Charge_Record" USING btree ("dwAccountID");

-- ----------------------------
-- Primary Key structure for table "T_Account_Charge_Record"
-- ----------------------------
ALTER TABLE "T_Account_Charge_Record" ADD PRIMARY KEY ("dwOrderID", "dwAccountID");

-- ----------------------------
-- Primary Key structure for table "T_Account_CommercialAct"
-- ----------------------------
ALTER TABLE "T_Account_CommercialAct" ADD PRIMARY KEY ("dwAccountID", "dwActID", "dwDays", "dwIndex");

-- ----------------------------
-- Primary Key structure for table "T_Alliance_Leader"
-- ----------------------------
ALTER TABLE "T_Alliance_Leader" ADD PRIMARY KEY ("dwType");

-- ----------------------------
-- Primary Key structure for table "T_Build_Rampart_Info"
-- ----------------------------
ALTER TABLE "T_Build_Rampart_Info" ADD PRIMARY KEY ("dwRoleId");

-- ----------------------------
-- Primary Key structure for table "T_CommercialGift"
-- ----------------------------
ALTER TABLE "T_CommercialGift" ADD PRIMARY KEY ("dwAccountID");

-- ----------------------------
-- Primary Key structure for table "T_Dupl_Info"
-- ----------------------------
ALTER TABLE "T_Dupl_Info" ADD PRIMARY KEY ("dwRoleId", "dwDuplId");

-- ----------------------------
-- Primary Key structure for table "T_Dupl_JiFen_Info"
-- ----------------------------
ALTER TABLE "T_Dupl_JiFen_Info" ADD PRIMARY KEY ("dwRoleId", "dwDuplId");

-- ----------------------------
-- Primary Key structure for table "T_Dupl_Record_Info"
-- ----------------------------
ALTER TABLE "T_Dupl_Record_Info" ADD PRIMARY KEY ("duplId");

-- ----------------------------
-- Primary Key structure for table "T_Dupl_ZL_Boss_Record"
-- ----------------------------
ALTER TABLE "T_Dupl_ZL_Boss_Record" ADD PRIMARY KEY ("roleId");

-- ----------------------------
-- Primary Key structure for table "T_Dupl_ZL_Info"
-- ----------------------------
ALTER TABLE "T_Dupl_ZL_Info" ADD PRIMARY KEY ("roleId");

-- ----------------------------
-- Primary Key structure for table "T_Dupl_ZL_Record"
-- ----------------------------
ALTER TABLE "T_Dupl_ZL_Record" ADD PRIMARY KEY ("waveId");

-- ----------------------------
-- Primary Key structure for table "T_Equip_Build_Info"
-- ----------------------------
ALTER TABLE "T_Equip_Build_Info" ADD PRIMARY KEY ("dwRoleId");

-- ----------------------------
-- Primary Key structure for table "T_Errant_Award_Info"
-- ----------------------------
ALTER TABLE "T_Errant_Award_Info" ADD PRIMARY KEY ("dwRoleId");

-- ----------------------------
-- Primary Key structure for table "T_Errant_Honor_Info"
-- ----------------------------
ALTER TABLE "T_Errant_Honor_Info" ADD PRIMARY KEY ("dwRoleId");

-- ----------------------------
-- Primary Key structure for table "T_Errant_Info"
-- ----------------------------
ALTER TABLE "T_Errant_Info" ADD PRIMARY KEY ("dwRoleId", "dwMapId");

-- ----------------------------
-- Primary Key structure for table "T_Escort_Info"
-- ----------------------------
ALTER TABLE "T_Escort_Info" ADD PRIMARY KEY ("dwRoleId");

-- ----------------------------
-- Primary Key structure for table "T_Festival_Info"
-- ----------------------------
ALTER TABLE "T_Festival_Info" ADD PRIMARY KEY ("dwFestival");

-- ----------------------------
-- Primary Key structure for table "T_Festival_Line"
-- ----------------------------
ALTER TABLE "T_Festival_Line" ADD PRIMARY KEY ("dwFestival", "dwLine");

-- ----------------------------
-- Primary Key structure for table "T_Guild_Apply"
-- ----------------------------
ALTER TABLE "T_Guild_Apply" ADD PRIMARY KEY ("dwRoleID", "dwGuildID");

-- ----------------------------
-- Primary Key structure for table "T_Guild_Combat"
-- ----------------------------
ALTER TABLE "T_Guild_Combat" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Guild_Donate"
-- ----------------------------
ALTER TABLE "T_Guild_Donate" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Guild_Escort"
-- ----------------------------
ALTER TABLE "T_Guild_Escort" ADD PRIMARY KEY ("dwGuildID");

-- ----------------------------
-- Primary Key structure for table "T_Guild_Info"
-- ----------------------------
ALTER TABLE "T_Guild_Info" ADD PRIMARY KEY ("dwGuildID");

-- ----------------------------
-- Primary Key structure for table "T_Guild_Log"
-- ----------------------------
ALTER TABLE "T_Guild_Log" ADD PRIMARY KEY ("dwLogID");

-- ----------------------------
-- Primary Key structure for table "T_Guild_Member"
-- ----------------------------
ALTER TABLE "T_Guild_Member" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Guild_Quit"
-- ----------------------------
ALTER TABLE "T_Guild_Quit" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Guild_Resource"
-- ----------------------------
ALTER TABLE "T_Guild_Resource" ADD PRIMARY KEY ("dwGuildID");

-- ----------------------------
-- Primary Key structure for table "T_Guild_Shop"
-- ----------------------------
ALTER TABLE "T_Guild_Shop" ADD PRIMARY KEY ("dwGuildID", "dwItemEnum");

-- ----------------------------
-- Primary Key structure for table "T_Guild_Skill"
-- ----------------------------
ALTER TABLE "T_Guild_Skill" ADD PRIMARY KEY ("dwGuildID");

-- ----------------------------
-- Primary Key structure for table "T_Guild_Table"
-- ----------------------------
ALTER TABLE "T_Guild_Table" ADD PRIMARY KEY ("szTableName");

-- ----------------------------
-- Primary Key structure for table "T_Guild_Trophy"
-- ----------------------------
ALTER TABLE "T_Guild_Trophy" ADD PRIMARY KEY ("dwTrophyID");

-- ----------------------------
-- Primary Key structure for table "T_HideAchievement"
-- ----------------------------
ALTER TABLE "T_HideAchievement" ADD PRIMARY KEY ("dwAchievementID");

-- ----------------------------
-- Primary Key structure for table "T_Iron_Cloth_Info"
-- ----------------------------
ALTER TABLE "T_Iron_Cloth_Info" ADD PRIMARY KEY ("dwRoleId");

-- ----------------------------
-- Primary Key structure for table "T_Item_FrenzyHoe"
-- ----------------------------
ALTER TABLE "T_Item_FrenzyHoe" ADD PRIMARY KEY ("dwAwardItemId");

-- ----------------------------
-- Primary Key structure for table "T_Lottery_Info"
-- ----------------------------
ALTER TABLE "T_Lottery_Info" ADD PRIMARY KEY ("dwStorageType", "dwRewardType", "dwServerHostID");

-- ----------------------------
-- Primary Key structure for table "T_Mall_Limit"
-- ----------------------------
ALTER TABLE "T_Mall_Limit" ADD PRIMARY KEY ("dwID");

-- ----------------------------
-- Primary Key structure for table "T_Pet_Info"
-- ----------------------------
ALTER TABLE "T_Pet_Info" ADD PRIMARY KEY ("dwRoleId", "dwPetId");

-- ----------------------------
-- Primary Key structure for table "T_PetAptitude_Info"
-- ----------------------------
ALTER TABLE "T_PetAptitude_Info" ADD PRIMARY KEY ("dwRoleID", "dwPetEnumId");

-- ----------------------------
-- Primary Key structure for table "T_PetBourn_Info"
-- ----------------------------
ALTER TABLE "T_PetBourn_Info" ADD PRIMARY KEY ("dwRoleID", "dwPetEnumId");

-- ----------------------------
-- Primary Key structure for table "T_PetEquip_Info"
-- ----------------------------
ALTER TABLE "T_PetEquip_Info" ADD PRIMARY KEY ("dwRoleID", "dwPetEnumId");

-- ----------------------------
-- Primary Key structure for table "T_PetSkill_Info"
-- ----------------------------
ALTER TABLE "T_PetSkill_Info" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_PetSkill_Learned"
-- ----------------------------
ALTER TABLE "T_PetSkill_Learned" ADD PRIMARY KEY ("dwRoleID", "dwPetEnumId");

-- ----------------------------
-- Primary Key structure for table "T_PetWash_Info"
-- ----------------------------
ALTER TABLE "T_PetWash_Info" ADD PRIMARY KEY ("dwRoleID", "dwPetEnumId");

-- ----------------------------
-- Primary Key structure for table "T_Practice_Info"
-- ----------------------------
ALTER TABLE "T_Practice_Info" ADD PRIMARY KEY ("dwRoleId");

-- ----------------------------
-- Primary Key structure for table "T_Role"
-- ----------------------------
ALTER TABLE "T_Role" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table T_Role_360RedJewel
-- ----------------------------
CREATE INDEX "dwAccountID" ON "T_Role_360RedJewel" USING btree ("dwAccountID");

-- ----------------------------
-- Primary Key structure for table "T_Role_360RedJewel"
-- ----------------------------
ALTER TABLE "T_Role_360RedJewel" ADD PRIMARY KEY ("dwAccountID", "dwItemIndex");

-- ----------------------------
-- Primary Key structure for table "T_Role_AchieveMedal"
-- ----------------------------
ALTER TABLE "T_Role_AchieveMedal" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Achievement_Hide"
-- ----------------------------
ALTER TABLE "T_Role_Achievement_Hide" ADD PRIMARY KEY ("dwAchievementID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Achievement_New"
-- ----------------------------
ALTER TABLE "T_Role_Achievement_New" ADD PRIMARY KEY ("dwRoleID", "dwAchievementID");

-- ----------------------------
-- Primary Key structure for table "t_role_addattrs"
-- ----------------------------
ALTER TABLE "t_role_addattrs" ADD PRIMARY KEY ("roleid");

-- ----------------------------
-- Primary Key structure for table "T_Role_Amulet"
-- ----------------------------
ALTER TABLE "T_Role_Amulet" ADD PRIMARY KEY ("RoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Auto_Battle_Setting"
-- ----------------------------
ALTER TABLE "T_Role_Auto_Battle_Setting" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Baidu"
-- ----------------------------
ALTER TABLE "T_Role_Baidu" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_BaiduPlayer"
-- ----------------------------
ALTER TABLE "T_Role_BaiduPlayer" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Battle_Info"
-- ----------------------------
ALTER TABLE "T_Role_Battle_Info" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Bourn"
-- ----------------------------
ALTER TABLE "T_Role_Bourn" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Indexes structure for table T_Role_BournHideAttr
-- ----------------------------
CREATE INDEX "T_Role_BournHideAttr_RoleID_idx" ON "T_Role_BournHideAttr" USING btree ("RoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_BournHideAttr"
-- ----------------------------
ALTER TABLE "T_Role_BournHideAttr" ADD PRIMARY KEY ("RoleID");

-- ----------------------------
-- Indexes structure for table T_Role_Buff_Info
-- ----------------------------
CREATE INDEX "dwBuffID" ON "T_Role_Buff_Info" USING btree ("dwBuffID");
CREATE INDEX "dwEntityID" ON "T_Role_Buff_Info" USING btree ("dwEntityID");
CREATE INDEX "dwRoleID" ON "T_Role_Buff_Info" USING btree ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Buff_Info"
-- ----------------------------
ALTER TABLE "T_Role_Buff_Info" ADD PRIMARY KEY ("dwRoleID", "dwBuffID", "dwEntityID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Chart_Data"
-- ----------------------------
ALTER TABLE "T_Role_Chart_Data" ADD PRIMARY KEY ("eType", "dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Chart_List"
-- ----------------------------
ALTER TABLE "T_Role_Chart_List" ADD PRIMARY KEY ("eType", "dwNumber");

-- ----------------------------
-- Primary Key structure for table "T_Role_Chart_Title_New"
-- ----------------------------
ALTER TABLE "T_Role_Chart_Title_New" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Chat"
-- ----------------------------
ALTER TABLE "T_Role_Chat" ADD PRIMARY KEY ("dwRoleID", "dwMessageID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Collect"
-- ----------------------------
ALTER TABLE "T_Role_Collect" ADD PRIMARY KEY ("dwRoleID", "dwPageID", "dwSeriesID");

-- ----------------------------
-- Primary Key structure for table "T_Role_CollectJewel"
-- ----------------------------
ALTER TABLE "T_Role_CollectJewel" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_CollectJewelLevel"
-- ----------------------------
ALTER TABLE "T_Role_CollectJewelLevel" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Contact"
-- ----------------------------
ALTER TABLE "T_Role_Contact" ADD PRIMARY KEY ("dwRoleID", "dwContactID");

-- ----------------------------
-- Primary Key structure for table "T_Role_CountNumber"
-- ----------------------------
ALTER TABLE "T_Role_CountNumber" ADD PRIMARY KEY ("dwRoleID", "dwIndex");

-- ----------------------------
-- Primary Key structure for table "T_Role_DataCenter"
-- ----------------------------
ALTER TABLE "T_Role_DataCenter" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Del_Info"
-- ----------------------------
ALTER TABLE "T_Role_Del_Info" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_EquipBuild_Info"
-- ----------------------------
ALTER TABLE "T_Role_EquipBuild_Info" ADD PRIMARY KEY ("dwRoleId");

-- ----------------------------
-- Primary Key structure for table "T_Role_Evaluate_New"
-- ----------------------------
ALTER TABLE "T_Role_Evaluate_New" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Evaluate_Receive"
-- ----------------------------
ALTER TABLE "T_Role_Evaluate_Receive" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Evaluate_Send"
-- ----------------------------
ALTER TABLE "T_Role_Evaluate_Send" ADD PRIMARY KEY ("dwResRoleID", "dwTarRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Evaluate_Send_New"
-- ----------------------------
ALTER TABLE "T_Role_Evaluate_Send_New" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_EventCenter"
-- ----------------------------
ALTER TABLE "T_Role_EventCenter" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_ExpPresent"
-- ----------------------------
ALTER TABLE "T_Role_ExpPresent" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Festival"
-- ----------------------------
ALTER TABLE "T_Role_Festival" ADD PRIMARY KEY ("dwRoleID", "dwFestival", "dwIndex", "dwLine");

-- ----------------------------
-- Primary Key structure for table "T_Role_FirstBlood"
-- ----------------------------
ALTER TABLE "T_Role_FirstBlood" ADD PRIMARY KEY ("dwIndex", "dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_FiveElem"
-- ----------------------------
ALTER TABLE "T_Role_FiveElem" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_FoundryStone"
-- ----------------------------
ALTER TABLE "T_Role_FoundryStone" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_FrenzyHoe"
-- ----------------------------
ALTER TABLE "T_Role_FrenzyHoe" ADD PRIMARY KEY ("dwRoleId");

-- ----------------------------
-- Primary Key structure for table "T_Role_Friend"
-- ----------------------------
ALTER TABLE "T_Role_Friend" ADD PRIMARY KEY ("dwRoleID", "dwFriendID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Full_Award"
-- ----------------------------
ALTER TABLE "T_Role_Full_Award" ADD PRIMARY KEY ("dwRoleId");

-- ----------------------------
-- Primary Key structure for table "T_Role_Gamble"
-- ----------------------------
ALTER TABLE "T_Role_Gamble" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Gift"
-- ----------------------------
ALTER TABLE "T_Role_Gift" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Gourd"
-- ----------------------------
ALTER TABLE "T_Role_Gourd" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_GrowupTarget"
-- ----------------------------
ALTER TABLE "T_Role_GrowupTarget" ADD PRIMARY KEY ("dwRoleID", "dwIndex");

-- ----------------------------
-- Primary Key structure for table "T_Role_GuildLD"
-- ----------------------------
ALTER TABLE "T_Role_GuildLD" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_GuildSkill"
-- ----------------------------
ALTER TABLE "T_Role_GuildSkill" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Indexes structure for table T_Role_Info
-- ----------------------------
CREATE INDEX "T_Role_Info_dwAccountID_Index" ON "T_Role_Info" USING btree ("dwAccountID");

-- ----------------------------
-- Uniques structure for table "T_Role_Info"
-- ----------------------------
ALTER TABLE "T_Role_Info" ADD UNIQUE ("szRoleName");

-- ----------------------------
-- Primary Key structure for table "T_Role_Info"
-- ----------------------------
ALTER TABLE "T_Role_Info" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Inject_Log"
-- ----------------------------
ALTER TABLE "T_Role_Inject_Log" ADD PRIMARY KEY ("dwRoleID", "dwInjectID", "dwTime");

-- ----------------------------
-- Primary Key structure for table "T_Role_Item_Equip"
-- ----------------------------
ALTER TABLE "T_Role_Item_Equip" ADD PRIMARY KEY ("dwItemID", "dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Item_Normal"
-- ----------------------------
ALTER TABLE "T_Role_Item_Normal" ADD PRIMARY KEY ("dwItemID", "dwRoleID");

-- ----------------------------
-- Indexes structure for table T_Role_ItemSystem
-- ----------------------------
CREATE INDEX "t_role_itemsystem_index_dwroleid" ON "T_Role_ItemSystem" USING btree ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_ItemSystem"
-- ----------------------------
ALTER TABLE "T_Role_ItemSystem" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_KungFu_Info"
-- ----------------------------
ALTER TABLE "T_Role_KungFu_Info" ADD PRIMARY KEY ("n_RoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_LevelRecord"
-- ----------------------------
ALTER TABLE "T_Role_LevelRecord" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_LevelTotal"
-- ----------------------------
ALTER TABLE "T_Role_LevelTotal" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_LoginDays"
-- ----------------------------
ALTER TABLE "T_Role_LoginDays" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_LotteryTicket_Info"
-- ----------------------------
ALTER TABLE "T_Role_LotteryTicket_Info" ADD PRIMARY KEY ("dwIndex", "dwServerHostID");

-- ----------------------------
-- Primary Key structure for table "T_Role_LuckDraw"
-- ----------------------------
ALTER TABLE "T_Role_LuckDraw" ADD PRIMARY KEY ("dwRoleID", "dwIndex");

-- ----------------------------
-- Primary Key structure for table "T_Role_Mail"
-- ----------------------------
ALTER TABLE "T_Role_Mail" ADD PRIMARY KEY ("dwID", "dwReceiver");

-- ----------------------------
-- Primary Key structure for table "T_Role_Mall"
-- ----------------------------
ALTER TABLE "T_Role_Mall" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Map_Info"
-- ----------------------------
ALTER TABLE "T_Role_Map_Info" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Marriage"
-- ----------------------------
ALTER TABLE "T_Role_Marriage" ADD PRIMARY KEY ("HusbandRoleID", "WifeRoleID");

-- ----------------------------
-- Indexes structure for table T_Role_MarriageBanquetList
-- ----------------------------
CREATE INDEX "T_Role_MarriageBanquetList_HusbandRoleID_idx" ON "T_Role_MarriageBanquetList" USING btree ("HusbandRoleID");
CREATE INDEX "T_Role_MarriageBanquetList_WifeRoleID_idx" ON "T_Role_MarriageBanquetList" USING btree ("WifeRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_MarriageBanquetList"
-- ----------------------------
ALTER TABLE "T_Role_MarriageBanquetList" ADD PRIMARY KEY ("BanquetID");

-- ----------------------------
-- Primary Key structure for table "T_Role_MarriageChange"
-- ----------------------------
ALTER TABLE "T_Role_MarriageChange" ADD PRIMARY KEY ("RoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_MarriageChatList"
-- ----------------------------
ALTER TABLE "T_Role_MarriageChatList" ADD PRIMARY KEY ("n_RoleID", "n_Time");

-- ----------------------------
-- Primary Key structure for table "T_Role_MarriageGiftMoney"
-- ----------------------------
ALTER TABLE "T_Role_MarriageGiftMoney" ADD PRIMARY KEY ("BanquetID", "GuestRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_MarriageRoleEatInfo"
-- ----------------------------
ALTER TABLE "T_Role_MarriageRoleEatInfo" ADD PRIMARY KEY ("RoleID");

-- ----------------------------
-- Indexes structure for table T_Role_MarriageRoleToBanquet
-- ----------------------------
CREATE INDEX "T_Role_MarriageRoleToBanquet_RoleID_idx" ON "T_Role_MarriageRoleToBanquet" USING btree ("RoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_MarriageRoleToBanquet"
-- ----------------------------
ALTER TABLE "T_Role_MarriageRoleToBanquet" ADD PRIMARY KEY ("RoleID", "BanquetID");

-- ----------------------------
-- Primary Key structure for table "T_Role_MatrixMethod"
-- ----------------------------
ALTER TABLE "T_Role_MatrixMethod" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_MegaKill"
-- ----------------------------
ALTER TABLE "T_Role_MegaKill" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_MissionDaily"
-- ----------------------------
ALTER TABLE "T_Role_MissionDaily" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Mood"
-- ----------------------------
ALTER TABLE "T_Role_Mood" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Mount"
-- ----------------------------
ALTER TABLE "T_Role_Mount" ADD PRIMARY KEY ("n_RoleID", "n_InstID");

-- ----------------------------
-- Primary Key structure for table "T_Role_MountSystem"
-- ----------------------------
ALTER TABLE "T_Role_MountSystem" ADD PRIMARY KEY ("n_RoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Muse"
-- ----------------------------
ALTER TABLE "T_Role_Muse" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_NoviceGuide_New"
-- ----------------------------
ALTER TABLE "T_Role_NoviceGuide_New" ADD PRIMARY KEY ("dwRoleID", "dwGuideID");

-- ----------------------------
-- Primary Key structure for table "T_Role_NpcConnection"
-- ----------------------------
ALTER TABLE "T_Role_NpcConnection" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_OnDayTime"
-- ----------------------------
ALTER TABLE "T_Role_OnDayTime" ADD PRIMARY KEY ("dwRoleID", "dwSystemID");

-- ----------------------------
-- Primary Key structure for table "T_Role_OnlineAwards"
-- ----------------------------
ALTER TABLE "T_Role_OnlineAwards" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_OnlineGift"
-- ----------------------------
ALTER TABLE "T_Role_OnlineGift" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Pack"
-- ----------------------------
ALTER TABLE "T_Role_Pack" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_PlayerShopItem"
-- ----------------------------
ALTER TABLE "T_Role_PlayerShopItem" ADD PRIMARY KEY ("dwRoleID", "dwItemID");

-- ----------------------------
-- Primary Key structure for table "T_Role_PlayerShopName"
-- ----------------------------
ALTER TABLE "T_Role_PlayerShopName" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Plus_Info"
-- ----------------------------
ALTER TABLE "T_Role_Plus_Info" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_PractiseSkill"
-- ----------------------------
ALTER TABLE "T_Role_PractiseSkill" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Pulse"
-- ----------------------------
ALTER TABLE "T_Role_Pulse" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "t_role_qihun"
-- ----------------------------
ALTER TABLE "t_role_qihun" ADD PRIMARY KEY ("roleid");

-- ----------------------------
-- Primary Key structure for table "T_Role_QunXia"
-- ----------------------------
ALTER TABLE "T_Role_QunXia" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_QunXiaLu"
-- ----------------------------
ALTER TABLE "T_Role_QunXiaLu" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Refresh"
-- ----------------------------
ALTER TABLE "T_Role_Refresh" ADD PRIMARY KEY ("dwRoleID", "dwDataID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Setting"
-- ----------------------------
ALTER TABLE "T_Role_Setting" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Shortcut_Info"
-- ----------------------------
ALTER TABLE "T_Role_Shortcut_Info" ADD PRIMARY KEY ("dwRoleID", "dwShortcutID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Skill_Info"
-- ----------------------------
ALTER TABLE "T_Role_Skill_Info" ADD PRIMARY KEY ("dwSkillID", "dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Soul_Object"
-- ----------------------------
ALTER TABLE "T_Role_Soul_Object" ADD PRIMARY KEY ("dwRoleID", "dwSoulID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Soul_System"
-- ----------------------------
ALTER TABLE "T_Role_Soul_System" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Sword"
-- ----------------------------
ALTER TABLE "T_Role_Sword" ADD PRIMARY KEY ("dwRoleId");

-- ----------------------------
-- Primary Key structure for table "T_Role_SwordFoundry"
-- ----------------------------
ALTER TABLE "T_Role_SwordFoundry" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Task"
-- ----------------------------
ALTER TABLE "T_Role_Task" ADD PRIMARY KEY ("dwRoleID", "dwTaskId");

-- ----------------------------
-- Primary Key structure for table "T_Role_Task_Ex"
-- ----------------------------
ALTER TABLE "T_Role_Task_Ex" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_TianGuanCiFu"
-- ----------------------------
ALTER TABLE "T_Role_TianGuanCiFu" ADD PRIMARY KEY ("n_RoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Time_Reward"
-- ----------------------------
ALTER TABLE "T_Role_Time_Reward" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Title"
-- ----------------------------
ALTER TABLE "T_Role_Title" ADD PRIMARY KEY ("dwRoleID", "dwTitleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Treasure"
-- ----------------------------
ALTER TABLE "T_Role_Treasure" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_UnionPlatGift"
-- ----------------------------
ALTER TABLE "T_Role_UnionPlatGift" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Vip"
-- ----------------------------
ALTER TABLE "T_Role_Vip" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_WantMarry"
-- ----------------------------
ALTER TABLE "T_Role_WantMarry" ADD PRIMARY KEY ("dwRoleID");

-- ----------------------------
-- Indexes structure for table T_Role_WuXiaLing
-- ----------------------------
CREATE INDEX "RoleID" ON "T_Role_WuXiaLing" USING btree ("RoleID");

-- ----------------------------
-- Primary Key structure for table "T_Role_WuXiaLing"
-- ----------------------------
ALTER TABLE "T_Role_WuXiaLing" ADD PRIMARY KEY ("RoleID");

-- ----------------------------
-- Indexes structure for table T_Role_YWZ
-- ----------------------------
CREATE INDEX "T_Role_YWZ_dwRoleID_dwImageID_idx" ON "T_Role_YWZ" USING btree ("dwRoleID", "dwImageID");

-- ----------------------------
-- Primary Key structure for table "T_Role_YWZ"
-- ----------------------------
ALTER TABLE "T_Role_YWZ" ADD PRIMARY KEY ("dwRoleID", "dwImageID");

-- ----------------------------
-- Primary Key structure for table "T_Server_Info"
-- ----------------------------
ALTER TABLE "T_Server_Info" ADD PRIMARY KEY ("dwServerHostID");

-- ----------------------------
-- Primary Key structure for table "T_Server_MergeServer_Info"
-- ----------------------------
ALTER TABLE "T_Server_MergeServer_Info" ADD PRIMARY KEY ("dwServerHostID");

-- ----------------------------
-- Primary Key structure for table "T_ServerEvent"
-- ----------------------------
ALTER TABLE "T_ServerEvent" ADD PRIMARY KEY ("EventID");


ALTER TABLE "public"."T_Pet_Info"
ADD COLUMN "dwFper" int8 DEFAULT 0 NOT NULL;


CREATE TABLE "public"."T_Cross_Hold_Info" (
"szHoldInfo" varchar(64) DEFAULT ''::character varying NOT NULL,
"dwCrossId" int8 NOT NULL,
"bOver" bool DEFAULT false NOT NULL
)
WITH (OIDS=FALSE)
;
ALTER TABLE "public"."T_Cross_Hold_Info" ADD PRIMARY KEY ("dwCrossId");


CREATE TABLE "public"."T_Role_Cross_Info" (
"dwRoleId" int8 NOT NULL,
"dwHonor" int8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
ALTER TABLE "public"."T_Role_Cross_Info" ADD PRIMARY KEY ("dwRoleId");


ALTER TABLE "public"."T_Role_Sword"
ADD COLUMN "dwAptitude" int8;


CREATE TABLE "public"."T_Role_Gest_Info" (
"dwRoleId" int8 NOT NULL,
"dwGestLevel" int8 NOT NULL,
"dwGestProgress" int8 NOT NULL,
"dwChooseMode" int8 NOT NULL,
"dwRealizeLevel" int8 NOT NULL,
CONSTRAINT "T_Role_Gest_Info_pkey" PRIMARY KEY ("dwRoleId")
)
WITH (OIDS=FALSE)
;


CREATE TABLE "public"."T_Role_FashionDress" (
"dwRoleID" int8 NOT NULL,
"dwDressID" int4 NOT NULL,
"dwDeleteTime" int8 NOT NULL,
"bRenew" int2 NOT NULL,
CONSTRAINT "T_Role_FashionDress_pkey" PRIMARY KEY ("dwRoleID", "dwDressID")
)
WITH (OIDS=FALSE)
;



CREATE TABLE "public"."T_Role_HuaShenDan" (
"dwRoleID" int8 NOT NULL,
"dwExp" int4 DEFAULT 0 NOT NULL,
"szEquip" varchar NOT NULL,
CONSTRAINT "T_Role_HuaShenDan_pkey" PRIMARY KEY ("dwRoleID")
)
WITH (OIDS=FALSE)
;


CREATE TABLE "public"."T_Role_QingYunLing" (
"dwRoleID" int8 NOT NULL,
"dwLotteryID" varchar(1024),
"dwTotalExp" varchar(1024),
"dwNum" int4,
"dwCount" int4,
CONSTRAINT "T_Role_QingYunLing_pkey" PRIMARY KEY ("dwRoleID")
)
WITH (OIDS=FALSE)
;

CREATE TABLE "public"."T_Role_ShengHuoLing" (
"dwRoleID" int8 NOT NULL,
"szSetState" varchar NOT NULL,
CONSTRAINT "T_Role_ShengHuoLing_pkey" PRIMARY KEY ("dwRoleID")
)
WITH (OIDS=FALSE)
;

/*
Navicat PGSQL Data Transfer

Source Server         : 10.1.104.92
Source Server Version : 90106
Source Host           : 10.1.104.92:5432
Source Database       : GD_Role
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90106
File Encoding         : 65001

Date: 2014-05-05 22:07:30
*/


-- ----------------------------
-- Table structure for "T_Role_Chart_Award"
-- ----------------------------
DROP TABLE "T_Role_Chart_Award";
CREATE TABLE "T_Role_Chart_Award" (
"RoleID" int8 NOT NULL,
"ID" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Indexes structure for table T_Role_Chart_Award
-- ----------------------------
CREATE INDEX "Index1" ON "T_Role_Chart_Award" USING btree ("RoleID");
CREATE INDEX "Index2" ON "T_Role_Chart_Award" USING btree ("ID");

-- ----------------------------
-- Primary Key structure for table "T_Role_Chart_Award"
-- ----------------------------
ALTER TABLE "T_Role_Chart_Award" ADD PRIMARY KEY ("RoleID", "ID");




CREATE INDEX "idx_T_Role_Item_Equip_dwRoleID" on "T_Role_Item_Equip"("dwRoleID");
CREATE INDEX "idx_T_Role_Item_Normal_dwRoleID" on "T_Role_Item_Normal"("dwRoleID");
CREATE INDEX "idx_T_Role_Achievement_New_dwRoleID" on "T_Role_Achievement_New"("dwRoleID");
CREATE INDEX "idx_T_Role_Buff_Info_dwRoleID" on "T_Role_Buff_Info"("dwRoleID");
CREATE INDEX "idx_T_Role_Collect_dwRoleID" on "T_Role_Collect"("dwRoleID");
CREATE INDEX "idx_T_Role_Contact_dwRoleID" on "T_Role_Contact"("dwRoleID");
CREATE INDEX "idx_T_Role_Task_dwRoleID" on "T_Role_Task"("dwRoleID");
CREATE INDEX "idx_T_Role_CountNumber_dwRoleID" on "T_Role_CountNumber"("dwRoleID");
CREATE INDEX "idx_T_Role_FirstBlood_dwRoleID" on "T_Role_FirstBlood"("dwRoleID");
CREATE INDEX "idx_T_Role_Friend_dwRoleID" on "T_Role_Friend"("dwRoleID");
CREATE INDEX "idx_T_Role_GrowupTarget_dwRoleID" on "T_Role_GrowupTarget"("dwRoleID");
CREATE INDEX "idx_T_Role_Mount_dwRoleID" on "T_Role_Mount"("n_RoleID");
CREATE INDEX "idx_T_Role_NoviceGuide_New_dwRoleID" on "T_Role_NoviceGuide_New"("dwRoleID");
CREATE INDEX "idx_T_Role_OnDayTime_dwRoleID" on "T_Role_OnDayTime"("dwRoleID");
CREATE INDEX "idx_T_Role_PlayerShopItem_dwRoleID" on "T_Role_PlayerShopItem"("dwRoleID");
CREATE INDEX "idx_T_Role_Shortcut_Info_dwRoleID" on "T_Role_Shortcut_Info"("dwRoleID");
CREATE INDEX "idx_T_Role_Title_dwRoleID" on "T_Role_Title"("dwRoleID");

CREATE INDEX "idx_T_Role_Skill_Info_dwRoleID" on "T_Role_Skill_Info"("dwRoleID");
CREATE INDEX "idx_T_Role_Soul_Object_dwRoleID" on "T_Role_Soul_Object"("dwRoleID");
CREATE INDEX "idx_T_Role_LuckDraw_dwRoleID" on "T_Role_LuckDraw"("dwRoleID");
CREATE INDEX "idx_T_Role_Festival_dwRoleID" on "T_Role_Festival"("dwRoleID");
CREATE INDEX "idx_T_Pet_Info_dwRoleID" on "T_Pet_Info"("dwRoleId");

CREATE INDEX "idx_T_PetSkill_Learned_dwRoleID" on "T_PetSkill_Learned"("dwRoleID");
CREATE INDEX "idx_T_PetEquip_Info_dwRoleID" on "T_PetEquip_Info"("dwRoleID");
CREATE INDEX "idx_T_Role_YWZ_dwRoleID" on "T_Role_YWZ"("dwRoleID");
CREATE INDEX "idx_T_PetBourn_Info_dwRoleID" on "T_PetBourn_Info"("dwRoleID");
CREATE INDEX "idx_T_PetAptitude_Info_dwRoleID" on "T_PetAptitude_Info"("dwRoleID");

CREATE INDEX "idx_T_PetWash_Info_dwRoleID" on "T_PetWash_Info"("dwRoleID");
CREATE INDEX "idx_T_Role_FashionDress_Info_dwRoleID" on "T_Role_FashionDress"("dwRoleID");



ALTER TABLE "public"."T_Role_MegaKill"
ADD COLUMN "dwAptitude" int8;

--T_Role_HiddenWeapon
/*
暗器系统经验值及暗器开关
*/

CREATE TABLE "public"."T_Role_HiddenWeapon" (
"dwRoleID" int8 DEFAULT 0 NOT NULL,
"dwHiddenWeaponExp" int4 DEFAULT 0 NOT NULL,
"bIsOpen" bool DEFAULT false NOT NULL,
"dwHWLevel" int4 DEFAULT 0 NOT NULL,
CONSTRAINT "T_Role_HiddenWeapon_pkey" PRIMARY KEY ("dwRoleID")
)
WITH (OIDS=FALSE)
;


CREATE TABLE "public"."T_Dupl_NewZL_Record" (
"nRoleId" int8 NOT NULL,
"nStarLevel" int4 NOT NULL,
"sRoleName" varchar NOT NULL,
"nIconId" int4 NOT NULL,
"nWave" int4 NOT NULL,
CONSTRAINT "T_Dupl_NewZL_Record_pkey" PRIMARY KEY ("nWave")
)
WITH (OIDS=FALSE)
;

ALTER TABLE "public"."T_Role_TianGuanCiFu"
ADD COLUMN "n_HiddenWeapon" int4 DEFAULT 0 NOT NULL;


CREATE TABLE "public"."T_Role_DuGuJiuJian_Info" (
"dwRoleId" int8 NOT NULL,
"dwEXP" int8 NOT NULL,
"nActSwordId" int8 NOT NULL,
"nPrimaryTimes" int8 NOT NULL,
"nIntermediateTimes" int8 NOT NULL,
"nAdvancedTimes" int8 NOT NULL,
CONSTRAINT "T_Role_DuGuJiuJian_Info_pkey" PRIMARY KEY ("dwRoleId")
)
WITH (OIDS=FALSE)
;


CREATE TABLE "public"."T_Role_KungFuExtend" (
"nRoleId" int8 NOT NULL,
"tCount" varchar NOT NULL,
CONSTRAINT "T_Role_KungFuExtend_pkey" PRIMARY KEY ("nRoleId")
)
WITH (OIDS=FALSE)
;

CREATE TABLE "public"."T_Role_ZhanQiJue_Info" (
"dwRoleId" int8 NOT NULL,
"dwEXP" int8 NOT NULL,
"bBless" bool,
CONSTRAINT "T_Role_ZhanQiJue_Info_pkey" PRIMARY KEY ("dwRoleId")
)
WITH (OIDS=FALSE)
;


ALTER TABLE "public"."T_Role_TianGuanCiFu"
ADD COLUMN "n_ZhanQiJue" int4 DEFAULT 0 NOT NULL;

CREATE TABLE "public"."T_Role_TongTianTower_Info" (
"nRoleId" int8 NOT NULL,
"nCurLayer" int4 NOT NULL,
"nExtraCount" int4 NOT NULL,
"nAllTime" int8 NOT NULL,
"nWeekLayer" int4 NOT NULL,
"nWeekTime" int8 NOT NULL,
CONSTRAINT "T_Role_TongTianTower_Info_pkey" PRIMARY KEY ("nRoleId")
)
WITH (OIDS=FALSE)
;


CREATE TABLE "public"."T_TongTianTower_Chart" (
"nWeekType" int4 NOT NULL,
"nRoleId" int8 NOT NULL,
"sName" varchar NOT NULL,
"nLayer" int4 NOT NULL,
"nTime" int8 NOT NULL,
"nIconID" int2 DEFAULT 0 NOT NULL,
CONSTRAINT "T_TongTianTower_Chart_pkey" PRIMARY KEY ("nWeekType")
)
WITH (OIDS=FALSE)
;


CREATE TABLE "public"."T_Role_Shield" (
"nRoleID" int8 DEFAULT 0 NOT NULL,
"nExp" int4 DEFAULT 0 NOT NULL,
"nCount1" int4 DEFAULT 0 NOT NULL,
"nCount2" int4 DEFAULT 0 NOT NULL,
"nCount3" int4 DEFAULT 0 NOT NULL,
CONSTRAINT "T_Shield_pkey" PRIMARY KEY ("nRoleID")
)
WITH (OIDS=FALSE)
;

CREATE TABLE "public"."T_Role_GoldenBody" (
"nRoleId" int8 NOT NULL,
"nExp" int4 NOT NULL,
"nPractice" int4 NOT NULL,
CONSTRAINT "T_Role_GoldenBody_pkey" PRIMARY KEY ("nRoleId")
)
WITH (OIDS=FALSE)
;


ALTER TABLE "public"."T_Role_TianGuanCiFu"
ADD COLUMN "n_GoldenBody" int4 DEFAULT 0 NOT NULL;


ALTER TABLE "public"."T_Role_FashionDress"
ADD COLUMN "bInBox" bool;
ALTER TABLE "public"."T_Role_HuaShenDan"
ADD COLUMN "dwBoxNum" int4;


CREATE TABLE "public"."T_Role_TalkSword" (
"nRoleID" int8 DEFAULT 0 NOT NULL,
"nChallengeUse" int4 DEFAULT 0 NOT NULL,
"nChallengeAdd" int4 DEFAULT 0 NOT NULL,
"nCDTime" int4 DEFAULT 0 NOT NULL,
"bFullTime" bool DEFAULT true NOT NULL,
"nAttackAdd" int4 DEFAULT 0 NOT NULL,
"tReport" varchar(255) NOT NULL,
"nRewardState" int4 DEFAULT 1 NOT NULL,
CONSTRAINT "T_Role_TalkSword_pkey" PRIMARY KEY ("nRoleID")
)
WITH (OIDS=FALSE)
;

CREATE TABLE "public"."T_TalkSwordRewardRank" (
"nRoleID" int8 DEFAULT 0 NOT NULL,
"nRankID" int4 DEFAULT 0 NOT NULL,
CONSTRAINT "T_TalkSwordRewardRank_pkey" PRIMARY KEY ("nRoleID")
)
WITH (OIDS=FALSE)
;

CREATE TABLE "public"."T_TalkSwordRank" (
"nRankID" int4 DEFAULT 0 NOT NULL,
"nRoleID" int8 DEFAULT 0 NOT NULL,
"sPlayerName" varchar(50),
"nAttack" int8 DEFAULT 0 NOT NULL,
"nIconID" int4 DEFAULT 0 NOT NULL,
"nContinuousKill" int4 DEFAULT 0 NOT NULL,
"nProfessionID" int4 DEFAULT 0 NOT NULL,
"nIsRobot" int4 DEFAULT 0 NOT NULL,
"nLevel" int4 DEFAULT 1 NOT NULL,
CONSTRAINT "TalkSwordRank_pkey" PRIMARY KEY ("nRankID")
)
WITH (OIDS=FALSE)
;


ALTER TABLE "public"."T_Role_Battle_Info"
ADD COLUMN "dwOtherPoint" int4 DEFAULT 0 NOT NULL;

CREATE TABLE "public"."T_Role_Curio" (
"nRoleId" int8 NOT NULL,
"tCount" varchar NOT NULL,
CONSTRAINT "T_Role_Curio_pkey" PRIMARY KEY ("nRoleId")
)
WITH (OIDS=FALSE)
;

CREATE TABLE "public"."T_Role_HeroToken_Info" (
"dwRoleId" int8 NOT NULL,
"szEnbeded" varchar DEFAULT ''::character varying NOT NULL,
CONSTRAINT "T_Role_HeroToken_Info_pkey" PRIMARY KEY ("dwRoleId")
)
WITH (OIDS=FALSE)
;

CREATE TABLE "public"."T_Role_Banner_Info" (
"dwRoleID" int8 NOT NULL,
"dwEXP" int8 NOT NULL,
"bBless" bool NOT NULL,
"bConsume" bool DEFAULT false NOT NULL,
"dwLook" int8 DEFAULT 0 NOT NULL,
"dwStartTime" int8 DEFAULT 0 NOT NULL,
CONSTRAINT "T_Role_Banner_Info_pkey" PRIMARY KEY ("dwRoleID")
)
WITH (OIDS=FALSE)
;


ALTER TABLE "public"."T_Role_TianGuanCiFu"
ADD COLUMN "n_Banner" int4 DEFAULT 0 NOT NULL;

CREATE TABLE "public"."T_Role_Recycling" (
"nRoleId" int8 NOT NULL,
"tCount" varchar NOT NULL,
CONSTRAINT "T_Role_Recycling_pkey" PRIMARY KEY ("nRoleId")
)
WITH (OIDS=FALSE)
;


CREATE TABLE "public"."T_Role_ZhenlongChess" (
"dwRoleID" int8 NOT NULL,
"curTotalCount" int4 NOT NULL,
"curProcess" int4 NOT NULL,
"setBossCount" varchar NOT NULL,
"setBossStar" varchar NOT NULL,
"tabGetAward" varchar NOT NULL,
CONSTRAINT "T_Role_ZhenlongChess_pkey" PRIMARY KEY ("dwRoleID")
)
WITH (OIDS=FALSE)
;









