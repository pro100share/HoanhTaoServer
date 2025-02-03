print("start mergeSvr");

_G.TableInfo = {
--1
	{name = "T_Role_Info";nType = 1;Key="dwRoleID";};
	{name = "T_Role_Bourn";nType = 1;Key="dwRoleID"};
	{name = "T_Role_Item_Equip";nType = 1;Key="dwRoleID\",\"dwItemID"};
	--{name = "T_Account_Charge_Record";nType = 1;Key="dwOrderID"}; --开始
    {name = "T_Guild_Donate";nType = 1;Key="dwRoleID"};
	{name = "T_Guild_Escort";nType = 1;Key="dwGuildID"};
	{name = "T_Guild_Info";nType = 1;Key="dwGuildID"};
--2	
	{name = "T_Guild_Log";nType = 1;Key="dwLogID"};
	{name = "T_Guild_Member";nType = 1;Key="dwRoleID"};
	{name = "T_Guild_Quit";nType = 1;Key="dwRoleID"};
    {name = "T_Guild_Resource";nType = 1;Key="dwGuildID"};
	{name = "T_Guild_Shop";nType = 1;Key="dwGuildID\",\"dwItemEnum"};
	{name = "T_Role_Item_Normal";nType = 1;Key="dwRoleID\",\"dwItemID"};
	{name = "T_HideAchievement";nType = 1;Key="dwAchievementID"};
--3	
	{name = "T_Role_Achievement_New";nType = 1;Key="dwRoleID\",\"dwAchievementID"};
	{name = "T_Role_Amulet";nType = 1;Key="RoleID"};
	{name = "T_Role_Battle_Info";nType = 1;Key="dwRoleID"};
	{name = "T_Role_Buff_Info";nType = 1;Key="dwRoleID\",\"dwBuffID"};
	{name = "T_Role_Chart_Title_New";nType = 1;Key="dwRoleID"};
	{name = "T_Role_Collect";nType = 1;Key="dwRoleID\",\"dwPageID\",\"dwSeriesID"};
	{name = "T_Role_Contact";nType = 1;Key="dwRoleID\",\"dwContactID"};
--4	
	{name = "T_Role_Task";nType = 1;Key="dwRoleID\",\"dwTaskId"};
	{name = "T_Role_CountNumber";nType = 1;Key="dwRoleID\",\"dwIndex"};
	{name = "T_Role_DataCenter";nType = 1;Key="dwRoleID"};
	{name = "T_Role_Del_Info";nType = 1;Key="dwRoleID"};
	{name = "T_Role_Evaluate_New";nType = 1;Key="dwRoleID"};
	{name = "T_Role_Evaluate_Receive";nType = 1;Key="dwRoleID"};
	{name = "T_Role_Evaluate_Send";nType = 1;Key="dwResRoleID\",\"dwTarRoleID"};
--5	
	{name = "T_Role_EventCenter";nType = 1;Key="dwRoleID"};
	{name = "T_Role_ExpPresent";nType = 1;Key="dwRoleID"};
	{name = "T_Role_FirstBlood";nType = 1;Key="dwRoleID\",\"dwIndex"};
	{name = "T_Role_FiveElem";nType = 1;Key="dwRoleID"};
	{name = "T_Role_Friend";nType = 1;Key="dwRoleID\",\"dwFriendID"};
	{name = "T_Role_Full_Award";nType = 1;Key="dwRoleId"};
	{name = "T_Role_Gamble";nType = 1;Key="dwRoleID"};
--6	
	{name = "T_Role_Gift";nType = 1;Key="dwRoleID"};
	{name = "T_Role_GrowupTarget";nType = 1;Key="dwRoleID\",\"dwIndex"};
	{name = "T_Role_ItemSystem";nType = 1;Key="dwRoleID"};
	{name = "T_Role_LevelRecord";nType = 1;Key="dwRoleID"};
	{name = "T_Role_LevelTotal";nType = 1;Key="dwRoleID"};
	--{name = "T_Role_Mail";nType = 1;Key="dwID\",\"dwReceiver"};
	{name = "T_Role_Mall";nType = 1;Key="dwRoleID"};
--7	
	{name = "T_Role_Map_Info";nType = 1;Key="dwRoleID"};
	{name = "T_Role_Marriage";nType = 1;Key="HusbandRoleID\",\"WifeRoleID"};
	{name = "T_Role_MarriageChange";nType = 1;Key="RoleID"};
	{name = "T_Role_MarriageChatList";nType = 1;Key="n_RoleID\",\"n_Time"};
	{name = "T_Role_MissionDaily";nType = 1;Key="dwRoleID"};
	{name = "T_Role_Mood";nType = 1;Key="dwRoleID"};
	{name = "T_Role_Mount";nType = 1;Key="n_RoleID\",\"n_InstID"};
--8
	{name = "T_Role_MountSystem";nType = 1;Key="n_RoleID"};
	{name = "T_Role_Muse";nType = 1;Key="dwRoleID"};	
	{name = "T_Role_NoviceGuide_New";nType = 1;Key="dwRoleID\",\"dwGuideID"};
	{name = "T_Role_NpcConnection";nType = 1;Key="dwRoleID"};	
	{name = "T_Role_OnDayTime";nType = 1;Key="dwRoleID\",\"dwSystemID"};
	{name = "T_Role_Pack";nType = 1;Key="dwRoleID"};
	{name = "T_Role_PlayerShopItem";nType = 1;Key="dwRoleID\",\"dwItemID"};
--9
	{name = "T_Role_Plus_Info";nType = 1;Key="dwRoleID"};
	{name = "T_Role_Pulse";nType = 1;Key="dwRoleID"};	
	{name = "T_Role_Setting";nType = 1;Key="dwRoleID"};
	{name = "T_Role_Shortcut_Info";nType = 1;Key="dwRoleID\",\"dwShortcutID"};
	{name = "T_Role_Sword";nType = 1;Key="dwRoleId"};
	{name = "T_Role_Task_Ex";nType = 1;Key="dwRoleID"};
	{name = "T_Role_TianGuanCiFu";nType = 1;Key="n_RoleID"};
	
	{name = "T_Role_Time_Reward";nType = 1;Key="dwRoleID"};	
	{name = "T_Role_Title";nType = 1;Key="dwRoleID\",\"dwTitleID"};
	{name = "T_Role_Treasure";nType = 1;Key="dwRoleID"};
	{name = "T_Role_Vip";nType = 1;Key="dwRoleID"};
	{name = "T_Role_WantMarry";nType = 1;Key="dwRoleID"};
	{name = "T_Server_Info";nType = 1;Key="dwServerHostID"};
	{name = "T_ServerEvent";nType = 1;Key="EventID"};
	{name = "T_Account";nType = 0;Key="dwAccountID"};
	{name = "T_Account_Info";nType = 0;Key="dwAccountID"};
	{name = "T_Charge_Info";nType = 0;Key="dwAccountID"};
	{name = "T_Role_Skill_Info";nType = 1;Key="dwRoleID\",\"dwSkillID"};
	--{name = "T_Guild_Table";nType = 1;Key="szTableName";onProc=function(srcData,desData) end;};
	{name = "T_Errant_Info";nType = 1;Key="dwRoleId\",\"dwMapId"};
	{name = "T_Errant_Award_Info";nType = 1;Key="dwRoleId"};
	--10287
	{name = "T_Equip_Build_Info";nType = 1;Key="dwRoleId"};
	{name = "T_Role_EquipBuild_Info";nType = 1;Key="dwRoleId"};
	--10288
	{name = "T_Role_FoundryStone";nType = 1;Key="dwRoleID"};
	--10289
	--{name = "T_Item_FrenzyHoe";nType = 1;Key="dwAwardItemId"};
	{name = "T_Role_FrenzyHoe";nType = 1;Key="dwRoleId"};
	--10290
	{name = "T_Role_BaiduPlayer";nType = 1;Key="dwRoleID"};
	{name = "T_Practice_Info";nType = 1;Key="dwRoleId"};
	--10291
	--10292
	{name = "T_Guild_Skill";nType = 1;Key="dwGuildID"};
	{name = "T_Role_GuildSkill";nType = 1;Key="dwRoleID"};
	{name = "T_Role_KungFu_Info";nType = 1;Key="n_RoleID"};
	--10293
	{name = "T_Role_LotteryTicket_Info";nType = 1;Key="dwIndex\",\"dwServerHostID"};
	{name = "T_Lottery_Info";nType = 1;Key="dwStorageType\",\"dwRewardType\",\"dwServerHostID"};
	--10294
	{name = "T_Escort_Info";nType = 1;Key="dwRoleId"};
	{name = "T_Role_MegaKill";nType = 1;Key="dwRoleID"};
	--10295
	{name = "T_Role_GuildLD";nType = 1;Key="dwRoleID"};
	--10296
	{name = "T_Role_LoginDays";nType = 1;Key="dwRoleID"};
	{name = "T_Role_Soul_Object";nType = 1;Key="dwRoleID\",\"dwSoulID"};
	{name = "T_Role_Soul_System";nType = 1;Key="dwRoleID"};
	--10297
	{name = "T_Role_SwordFoundry";nType = 1;Key="dwRoleID"};
	{name = "T_Role_360RedJewel";nType = 1;Key="dwAccountID\",\"dwItemIndex"};
	--10299
	{name = "T_Role_LuckDraw";nType = 1;Key="dwRoleID\",\"dwIndex"};
	{name = "T_Role_MatrixMethod";nType = 1;Key="dwRoleID"};
	{name = "T_Role_UnionPlatGift";nType = 1;Key="dwRoleID"};
	--10299-test
	{name = "T_Account_Charge_Record";nType = 1;Key="dwOrderID\",\"dwAccountID"};
    {name = "T_Role_Festival";nType = 1;Key="dwRoleID\",\"dwFestival\",\"dwIndex\",\"dwLine"};
	{name = "T_Account_CommercialAct";nType = 1;Key="dwAccountID\",\"dwActID\",\"dwDays\",\"dwIndex"};
	--10300
	{name = "t_role_qihun";nType = 1;Key="roleid"};
	{name = "T_PetSkill_Info";nType = 1;Key="dwRoleID"};
	{name = "T_Pet_Info";nType = 1;Key="dwRoleId\",\"dwPetId"};
	{name = "T_PetSkill_Learned";nType = 1;Key="dwRoleID\",\"dwPetEnumId"};
	{name = "T_PetEquip_Info";nType = 1;Key="dwRoleID\",\"dwPetEnumId"};
	--10301
	{name = "T_Errant_Honor_Info";nType = 1;Key="dwRoleId"};
	{name = "T_Role_YWZ";nType = 1;Key="dwRoleID\",\"dwImageID"};
	--10302
	{name = "T_Role_OnlineAwards";nType = 1;Key="dwRoleID"};
	{name = "T_Role_CollectJewel";nType = 1;Key="dwRoleID"};
	--10303
	{name = "T_Role_QunXia";nType = 1;Key="dwRoleID"};
	{name = "T_Iron_Cloth_Info";nType = 1;Key="dwRoleId"};
	--10304
	{name = "T_Role_CollectJewelLevel";nType = 1;Key="dwRoleID"};
	{name = "T_Role_WuXiaLing";nType = 1;Key="RoleID"};
	--10305
	{name = "T_PetBourn_Info";nType = 1;Key="dwRoleID\",\"dwPetEnumId"};
	{name = "T_Role_BournHideAttr";nType = 1;Key="RoleID"};
	{name = "T_Role_PractiseSkill";nType = 1;Key="dwRoleID"};
	--10306
	--10307
	{name = "t_role_addattrs";nType = 1;Key="roleid"};
	{name = "T_Role_AchieveMedal";nType = 1;Key="dwRoleID"};
	{name = "T_Role_QunXiaLu";nType = 1;Key="dwRoleID"};
	{name = "T_PetAptitude_Info";nType = 1;Key="dwRoleID\",\"dwPetEnumId"};
	{name = "T_Role_Gourd";nType = 1;Key="dwRoleID"};
	--10308
	{name = "T_PetWash_Info";nType = 1;Key="dwRoleID\",\"dwPetEnumId"};
	--10309
	--10310
	--10311
	--10312
	--10313
	{name = "T_Role_Cross_Info";nType = 1;Key="dwRoleId"};
	--10314
	--10315
	{name = "T_Role_Gest_Info";nType = 1;Key="dwRoleId"};
	{name = "T_Role_HuaShenDan";nType = 1;Key="dwRoleID"};
	{name = "T_Role_FashionDress";nType = 1;Key="dwRoleID\",\"dwDressID"};
	--10316
	--10317
	{name = "T_Role_QingYunLing";nType = 1;Key="dwRoleID"};
	--10318
	{name = "T_Role_ShengHuoLing";nType = 1;Key="dwRoleID"};
	--10319
	{name = "T_Role_Chart_Award";nType = 1;Key="RoleID\",\"ID"};
	--10320
	--10321
	{name = "T_Role_HiddenWeapon";nType = 1;Key="dwRoleID"};
	--{name = "T_Dupl_NewZL_Record";nType = 1;Key="nWave"};
	{name = "T_Role_ZhenlongChess";nType = 1;Key="dwRoleID"};
	--10322
	{name = "T_Role_DuGuJiuJian_Info";nType = 1;Key="dwRoleId"};
	--10323
	{name = "T_Role_KungFuExtend";nType = 1;Key="nRoleId"};
	--10324
	{name = "T_Role_ZhanQiJue_Info";nType = 1;Key="dwRoleId"};
	--10325
	{name = "T_Role_TongTianTower_Info";nType = 1;Key="nRoleId"};
	{name = "T_Role_Shield";nType = 1;Key="nRoleID"};
	--10326
	{name = "T_Role_GoldenBody";nType = 1;Key="nRoleId"};
	--10327
	{name = "T_Role_TalkSword";nType = 1;Key="nRoleID"};
	{name = "T_TalkSwordRewardRank";nType = 1;Key="nRoleID"};
	--10328
	{name = "T_Role_Curio";nType = 1;Key="nRoleId"};
	{name = "T_Role_HeroToken_Info";nType = 1;Key="dwRoleId"};
	--10329
	
	--10330
	{name = "T_Role_Banner_Info";nType = 1;Key="dwRoleID"};
	{name = "T_Role_Recycling";nType = 1;Key="nRoleId"};
}

_G.DelTableInfo = { 
	"T_Account_Charge_Record",
	"T_Build_Clear",
	"T_Build_Rampart_Plan",
	"T_Build_Rampart_Info",
	"T_Alliance_Leader",
	"T_Guild_Trophy",
	"T_Dupl_Record_Info",
	"T_Dupl_Info",
	"T_Dupl_ZL_Record",
	"T_Dupl_ZL_Info", 
	"T_Dupl_EntityId_Info",  
	"T_Dupl_JiFen_Info", 
	"T_Dupl_ZL_Boss_Record",  
	"T_Role_Auto_Battle_Setting", 
	"T_Role_Martial_Info",
	"T_Role_Chat",
	"T_Festival_Info",
	"T_Festival_Line",
	"T_Role_Festival",
	"T_Guild_Apply",
	"T_Guild_Combat", 
	"T_Role_Achievement_Hide",
	"T_Role_Chart_Data",
	"T_Role_Chart_List",
	"T_Role_Refresh",
	"T_Role_Evaluate_Send_New", 
	"T_Role_MarriageBanquetList",
	"T_Role_MarriageGiftMoney",
	"T_Role_MarriageRoleToBanquet",
	"T_Role_MarriageRoleEatInfo",
	"T_Role_OnlineGift",
	"T_Role_PlayerShopName" ,
}; 



--_G.dwServerID = 21;
_G.UpdateSql = {
    szNameSql = "update \"%s\" set \"%s\"=concat('[%d区] ',\"%s\") ;";
    szIDSql = "update \"%s\" set \"%s\"=(\"%s\"*10000)+%d ;";
}
-- _G.DBInfo ={
	-- szIP = "10.1.104.201:5432";
	-- szUser = "postgres";
	-- szPwd = "Zhj@123";
	-- szAName = "h21f_GD_Account";
	-- szRName = "h21f_GD_Role";
-- } 
_G.NameTableInfo = { 
	{"T_Role_Info" , "szRoleName"};
	{"T_Role_Friend" , "strName"};
	{"T_Guild_Member" , "szRoleName"};
	{"T_Dupl_ZL_Record" , "roleName"};
	{"T_Dupl_JiFen_Info" , "szRoleName"};
	{"T_Dupl_Record_Info" , "roleName"};
	{"T_Build_Rampart_Info" , "strRoleName"};
	{"T_Role_Mail" , "strReceiver"};
	{"T_Role_Chart_List" , "szRoleName"};
	{"T_Role_Chart_Data" , "szRoleName"};
	{"T_Role_Achievement_Hide" , "szRoleName"};
	{"T_Role_MarriageChange" , "sFormerName"}; 
	{"T_Role_MarriageGiftMoney" , "GuestName"};
	{"T_Role_Marriage" , "HusbandName"};
	{"T_Role_Marriage" , "WifeName"};
	{"T_Role_MarriageBanquetList" , "HusbandName"}; 
	{"T_Role_MarriageBanquetList" , "WifeName"}; 
	{"T_Guild_Info" , "szGuildName"};
	{"T_Role_MarriageChange" , "sFormerName"};
	{"T_Alliance_Leader" , "szGuildName"};
}

_G.IDTableInfo =
{
	{"T_Account",{nType = 0;Key="dwAccountID"}};
	{"T_Account_Info",{nType = 0;Key="dwAccountID"}};
	{"T_Charge_Info",{nType = 0;Key="dwAccountID"}};
	{"T_Reward_Code_Info",{nType = 0;Key="dwAccountID"}};
	
	{"T_Role_Setting",{nType = 1;Key="dwRoleID"}};
	{"T_Role_Full_Award",{nType = 1;Key="dwAccountId"}};
	{"T_Account_Charge_Record",{nType = 1;Key="dwAccountID"}};
	{"T_Role_Info",{nType = 1;Key="dwAccountID"}};
}
_G.DBFormatInfo ={
	szIP = "s%d.hstx.5ding.com:5432"; 
	szGsUser = "gameop_gs";
	szGsPwd = "gameop_gs_hstx";
	szAdmUser = "gameop_admin";
	szAdmPwd = "gameop_admin_hstx";
	szAName = "GD_Account%04d";
	szRName = "GD_Role%04d";
}

function _G.DoMergeSvr() 
	_setDBFormatInfo(DBFormatInfo);
	local dwTableCount = #TableInfo;  
	for nID = 1,dwTableCount do
		local sInfo = TableInfo[nID]; 
		_setTableInfo(nID,sInfo.name,sInfo);
	end;
	_setDelTableInfo(DelTableInfo);
end;

function _G.DoMergeConfig() 
	_setDBFormatInfo(DBFormatInfo);
	for _,info in pairs(NameTableInfo) do
		_setNameConfig(info[1],info[2]);
	end;

	for _,info in pairs(IDTableInfo) do
		_setIDConfig(info[1],info[2]);
	end;
	_setUpadteSql(UpdateSql);
end;




