
_G.DBConfig = {}
------------------------------------------------------------------
DBConfig.TableStN = {};DBConfig.TableNtS = {};
DBConfig.IndexStN = {};DBConfig.IndexNtS = {};
DBConfig.FieldStN = {};DBConfig.FieldNtS = {};
local AddTable = function(szTable,tbIndex,tbField)
	for k,v in pairs(tbIndex) do
		for _k,_v in pairs(tbField) do
			if v == _v then table.remove(tbField,_k) break end
		end
	end
	local dwCount = #DBConfig.TableNtS + 1
	DBConfig.TableStN[szTable] = dwCount
	DBConfig.TableNtS[dwCount] = szTable
	DBConfig.IndexStN[szTable] = {}
	DBConfig.IndexNtS[dwCount] = {}
	DBConfig.FieldStN[szTable] = {}
	DBConfig.FieldNtS[dwCount] = {}
	for dwNumber,szString in ipairs(tbIndex) do
		DBConfig.IndexStN[szTable][szString] = dwNumber
		DBConfig.IndexNtS[dwCount][dwNumber] = szString
	end
	for dwNumber,szString in ipairs(tbField) do
		DBConfig.FieldStN[szTable][szString] = dwNumber
		DBConfig.FieldNtS[dwCount][dwNumber] = szString
	end
end
------------------------------------------------------------------
AddTable('T_Role_Info',{'dwRoleID'},{'dwTotalExp','bOnline'})

AddTable('T_Role_Achievement_New',{'dwRoleID','dwAchievementID'},{'eState','dwDate','dwProgress'})

AddTable('T_HideAchievement',{'dwAchievementID'},{'szRoleName','dwRoleID'})

AddTable('T_Role_Amulet',{'RoleID'},{'AmuletGrowth','AmuletScore','AmuletLevel','AmuletRank','AmuletIntensifyPerConfig','AmuletIntensifyColorConfig','AmuletInlayLevel', 'Aptitude'})

AddTable('T_Role_Auto_Battle_Setting',{'dwRoleID'},{'dwHpRate','dwHpOrder','dwMpRate','dwMpOrder','bUseDoubleExp','bPickEquip','bPickMedicine','bPickGold','bPickMaterial','dwProfType','dwEquipLevel','dwEquipQuality','dwSkill1','dwSkill2','dwSkill3','dwSkill4','dwSkill5','dwSkill6','dwRange','dwGoBackTime','bMonsterChoose','bAutoAlive','bautoMatic'})

AddTable('T_Role_Bourn',{'dwRoleID'},{'dwBournExp','dwBournPVPExp','dwBournLv'})

AddTable('T_Role_Buff_Info',{'dwRoleID','dwBuffID','dwEntityID'},{'dwTime','dwValue','dwLeaveTime','dwLevel','dwEffectNum','dwClassId','dwReleaseType','dwReleaseId', 'dwFixTime'})

AddTable('T_Role_Collect',{'dwRoleID','dwPageID','dwSeriesID'},{'dwState','szNum'})

AddTable('T_Role_DataCenter',{'dwRoleID'},{'dwKillBoss','dwKillPlayer'})

AddTable('T_Dupl_Info',{'dwRoleId','dwDuplId'},{'dwEntityId','dwTimes','dwDateTimes'})

AddTable('T_Dupl_ZL_Info',{'roleId'},{'bossTimes'})

AddTable('T_Dupl_JiFen_Info', {'dwRoleId', 'dwDuplId'}, {'dwRoleId', 'dwDuplId', 'szRoleName', 'dwScore'})

AddTable('T_Dupl_ZL_Boss_Record', {'roleId'}, {'roleId', 'hitBossInfo'})

AddTable('T_Role_FiveElem',{'dwRoleID'},{'dwMetalLv','dwWoodLv','dwWaterLv','dwFireLv','dwEarthLv','dwMetalValue','dwWoodValue','dwWaterValue','dwFireValue','dwEarthValue','dwCountTime','dwDantianLv','dwMetalTime','dwWoodTime','dwWaterTime','dwFireTime','dwEarthTime','szFillParam'})

AddTable('T_Role_Friend',{'dwRoleID','dwFriendID'},{'dwFlag','dwMeetTime','dwLastTime','dwVip','dwLevel','strName','dwHead','dwProf','dwEnemy','dwInjectFlag'})

AddTable('T_Role_Mail',{'dwMailID','dwReceiver'},{'dwSender','strSender','strReceiver','strTopic','strContent','dwReceiveTime','dwLifeTime','dwGold','dwBindGold','dwMoney','dwItemID1','dwItemID2','dwItemID3','dwItemID4','dwItemID5','dwItemState','dwReadState'})

AddTable('T_Role_Mood',{'dwRoleID'},{'dwMood1','dwMood2','dwMood3','dwMood4','szSign'})

AddTable('T_Role_Gift',{'dwRoleID'},{'dwLevelGiftSeq','dwTimeGiftSeq','dwTimeRemain'})

AddTable('T_Role_GrowupTarget',{'dwRoleID','dwIndex'},{'setCanGet','setHasGet'})

AddTable('T_Role_ItemSystem',{'dwRoleID'},{'dwPacketSlotNum','dwPacketMoney','dwStorageSlotNum','dwStorageMoney','dwNextItemID','dwBindGold','dwGold'})

AddTable('T_Role_Item_Normal',{'dwItemID','dwRoleID'},{'dwPosSlot','dwItemEnum','dwItemNumber','dwBindType','dwBornTime','dwLifeTime','strDoodle'})

AddTable('T_Role_Item_Equip',{'dwItemID','dwRoleID'},{'dwPosSlot','dwItemEnum','dwItemNumber','dwBindType','dwBornTime','dwLifeTime','strDoodle','strPropertyInfo','dwStrongLevel','dwTianSheng','dwEndure'})

AddTable('T_Role_Mall',{'dwRoleID'},{'dwMallValue'})

AddTable('T_Role_Map_Info',{'dwRoleID'},{'dwMapID','fXPos','fYPos','fDirValue','fSpeed','dwDuplId'})

AddTable('T_Role_MarriageRoleEatInfo',{'RoleID'},{'LastEatTime','NpcInfo'})

AddTable('T_Role_Martial_Info',{'dwRoleID'},{'dwSkillID'})

AddTable('T_Role_MissionDaily',{'dwRoleID'},{'dwActivePoint','dwActivePointTotal','dwOnLineTime','dwOnLineDay','setDailyGift','setWeeklyGift','setEventInfo','setExchangeGift','dwSignTime','setOtherGift','dwWeiWangLevel','setWeiWangGift'})

AddTable('T_Role_MountSystem',{'n_RoleID'},{'n_MountSlotNum','n_ActiveMountID','n_NextInstID'})

AddTable('T_Role_Mount',{'n_RoleID','n_InstID'},{'n_EnumID','n_Level','n_Exp','n_GongJiAptitude','n_FangYuAptitude','n_GenGuAptitude','n_JiQiaoAptitude','b_IsBind','s_Equip','s_Skill','n_Quality','n_Point','n_Rank','n_RankExp'})

AddTable('T_Role_Muse',{'dwRoleID'},{'dwMuseBegin','dwBeInjectCount','dwAddMuseCount','dwMyInjectExpCount','dwGiftCount'})

AddTable('T_Role_NoviceGuide_New',{'dwRoleID','dwGuideID'},{})

AddTable('T_Role_NpcConnection',{'dwRoleID'},{'sztNpcCurTearchNum'})

AddTable('T_Role_Refresh',{'dwRoleID','dwDataID'},{'dwValue','dwUpdate'})

AddTable('T_Role_Plus_Info',{'dwRoleID'},{'dwMuseBegin','dwPKMode','dwPKValue'})

AddTable('T_Role_PlayerShopItem',{'dwRoleID','dwItemID'},{'bPriceType','dwPrice','szShopName'})

AddTable('T_Role_PlayerShopName',{'dwRoleID'},{'szShopName'})

AddTable('T_Role_Pulse',{'dwRoleID'},{'dwPulse1','dwPulse2','dwPulse3','dwPulse4','dwPulse5','dwPulse6','dwPulse7','dwPulse8','dwTotalExp','dwLastTimes','dwCountTime','dwWuValue','dwWuType','dwDraPul'})

AddTable('T_Role_LevelRecord',{'dwRoleID'},{'dwAccountID','szRoleName','dupl','equip','amulet','mount','pulse','sword','bourn','skill','level','prof','leveltime'})

AddTable('T_Role_LevelTotal',{'dwRoleID'},{'dwAccountID','szRoleName','pulse','sword','mount','amulet','shizhan','skill','dupl','fengyun','online','level','prof'})

AddTable('T_Role_Setting',{'dwRoleID'},{'dwOthersModel','dwRoleLight','dwRoleShadow','dwEnvShadow','dwBGMOpen','dwBGMVolume','dwSFXOpen','dwSFXVolume',
'dwIncomeTips','dwOthersBlood','dwMyBlood','dwOthersName','dwOthersPopText','dwBeAddedNotice','dwAcceptPrivate',
'dwAcceptTeam','dwAcceptFaction','dwAcceptTrade','dwAcceptProposal','dwSkillShake','dwOthersShadow','dwMonsterShadow',
'dwFloodLight','dwWeather','dwOthersPopTextCnd','dwMonsterName','dwMonsterBlood','dwMyPopText','dwHurtNotice',
'dwAutoMartial','dwRedNotice'})

AddTable('T_Role_Shortcut_Info',{'dwRoleID','dwShortcutID'},{'dwType','dwDataID','ItemType'})

AddTable('T_Role_Skill_Info',{'dwRoleID','dwSkillID'},{'dwSkillLevel','dwSkillKnowValue','dwOpenFlag'})

AddTable('T_Role_Battle_Info',{'dwRoleID'},{'dwCurHP','dwCurMP','dwMuscle','dwPhysique','dwOrgan','dwTechnique','dwDander','dwPoint','dwCaromCount','dwOtherPoint'})
	
AddTable('T_Role_Sword',{'dwRoleId'},{'dwSwordLadder', 'dwSwordLevel','dwSwordGas','dwUseCardState','dwAptitude'})

AddTable('T_Role_Task',{'dwRoleID','dwTaskId'},{'dwState','dwAcceptTimes','dwCompleteTimes','dwLastAcceptTime','dwLastCompleteTime','dwMon1','dwItem1','dwExplore1','dwUse1','dwSp1','dwLastAcceptLevel','dwLastCompleteLevel','dwLoopId','dwQuality','dwNpc1',})

AddTable('T_Role_Task_Ex',{'dwRoleID'},{'dwDailyLoop','dwUpdateTime','dwWeeklyLoop','dwNowLoop','dwNowTask'})

AddTable('T_Role_TianGuanCiFu',{'n_RoleID'},{'n_EquipUpGrade','n_MountUpGrade','n_AmuletUpGrade','n_JingJieUp','n_SwordUpGrade','n_EquipStrong','n_KungFuStudy','n_MegaKill','n_HiddenWeapon','n_ZhanQiJue','n_GoldenBody', 'n_Banner'})

AddTable('T_Role_Vip',{'dwRoleID'},{'dwTimeLast','dwTransportNum','dwGetItem'})

AddTable('T_Role_Time_Reward',{'dwRoleID'},{'szLoginReward','dwLastLoginTime','szSignin','szSigninReward','dwWeekLoginTime','dwWeekMoneyGet','dwLastSigninTime','dwWeekMoneyTime','dwWeekStartTime'})

AddTable('T_Role_FirstBlood',{'dwRoleID','dwIndex'},{'dwLevel','dwTaskID','dwGold','dwBindGold','dwMoney','szSubParam'})

AddTable('T_Build_Rampart_Info',{'dwRoleId'},{'dwRoleId', 'dwLabourValue', 'dwWoodValue', 'dwStoneValue', 'dwStateFlag', 'dwDiploidExp', 'strGetAward', 'dwLabourCD','dwWoodCD', 'dwStoneCD', 'strRoleName', 'dwContriValue', 'dwIconId'})

AddTable('T_Role_CountNumber',{'dwRoleID','dwIndex'},{'dwCount'})

AddTable('T_Role_Title',{'dwRoleID','dwTitleID'},{'dwShow','dwUpdate'})

AddTable('T_Role_Festival',{'dwRoleID','dwFestival','dwLine','dwIndex'},{'dwGetTimes','dwTime'})

AddTable('T_Account_Charge_Record',{'dwOrderID','dwAccountID'},{'dwGold','dwTime'})

AddTable('T_Role_Full_Award',{'dwRoleId'},{'dwAccountId','dwAddiAwardPhase','dwPerAwardPhase'})

AddTable('T_Role_Evaluate_Send_New',{'dwRoleID'},{'szEvaluate','dwUpdate'})

AddTable('T_Role_OnlineGift',{'dwRoleID'},{'dwOnlineTime','szAward'})

AddTable('T_Role_Baidu',{'dwRoleID'},{'szParam'})

AddTable('T_CommercialGift',{'dwAccountID'},{'strType'})

AddTable('T_Role_Inject_Log',{'dwRoleID','dwInjectID','dwTime'},{})

AddTable('T_Account_CommercialAct',{'dwAccountID', 'dwActID', 'dwDays', 'dwIndex'},{'dwGetTimes'})

AddTable('T_Role_FoundryStone',{'dwRoleID'},{'strType'})

AddTable('T_Errant_Info',{'dwRoleId','dwMapId'},{'szKillMonster'})

AddTable('T_Errant_Award_Info',{'dwRoleId'},{'szErrantAward'})

AddTable('T_Equip_Build_Info',{'dwRoleId'},{'szBuildInfo', "dwSuitLevel"})
AddTable('T_Role_EquipBuild_Info',{'dwRoleId'},{"dwCritBless", 'dwBuildNum'})

AddTable('T_Role_Soul_System',{'dwRoleID'},{"dwPacketNumber", 'dwClickIndex', 'dwSoulChip', 'strActiveSuit'})

AddTable('T_Role_Soul_Object',{'dwRoleID','dwSoulID'},{"dwEnumID", 'dwHolderType', 'dwPosID', 'dwExp'})

AddTable('T_Item_FrenzyHoe',{'dwAwardItemId'},{'dwRoleId','szRoleName'})

AddTable('T_Role_FrenzyHoe',{'dwRoleId'},{'dwAwardItemId','dwIsGet','dwFrendNum','dwHoeItemId','dwAwardItemNum'})

AddTable('T_Role_BaiduPlayer',{'dwRoleID'},{'dwGetOnceTime','dwGetDailyTime'})

AddTable('T_Practice_Info',{'dwRoleId'},{'dwCurLevel', 'dwCurProgress','dwCurHideLevel'})

AddTable('T_Role_GuildSkill',{'dwRoleID'},{"szSkill"})
AddTable('T_PetSkill_Info',{'dwRoleID'},{'dwSkillIdStr','dwSkillLevelStr'})

AddTable('T_PetSkill_Learned',{'dwRoleID','dwPetEnumId'},{'dwSkillList', 'dwSkillLockList','dwSkillIsOpenList'})

AddTable('T_Role_KungFu_Info',{'n_RoleID'},{"s_StudyProcess",})
AddTable('T_Pet_Info',{'dwRoleId','dwPetId'},{'dwLevel', 'dwExp','dwState', 'dwDayConsult', 'dwConsult','dwHp','dwLastDieTime','dwDayImpart','dwAllImpart','dwFper'})


AddTable('T_Escort_Info',{'dwRoleId'},{'dwEscortNum','dwRefQuality','dwEscortID','dwType','dwQuality','dwMapId', 'dwGetType', 'dwShellEscortNum'})

AddTable('T_Role_MegaKill',{'dwRoleID'},{'dwSoulNum','dwRandomNum','dwBuyNum','dwLevel','strAttrs','strKillRecord','dwAptitude'})

AddTable('T_Role_GuildLD',{'dwRoleID'},{'dwCurLDTime'})

AddTable('T_Role_LoginDays',{'dwRoleID'},{'dwRoleID','szLoginDays'})

AddTable('T_Role_SwordFoundry',{'dwRoleID'},{'dwSwordEumeID','dwStartNum','dwSkilledValue'})
AddTable('T_Role_LuckDraw',{'dwRoleID','dwIndex'},{"dwID","dwEnumID","dwNumber","dwPriceType","dwPrice","dwBindType","dwBuyFlag"})
AddTable('T_Role_MatrixMethod',{'dwRoleID'},{'dwOrdinaryStarTotalExp','dwSuitStarLevel','dwHideStarLevel','dwUsedFreeNum'})

AddTable('T_Role_UnionPlatGift',{'dwRoleID'},{'setHasGet'})

AddTable('T_Role_360RedJewel',{'dwItemIndex', 'dwAccountID'},{})

AddTable('t_role_qihun',{'roleid'},{'times', 'awards', 'selects'})

AddTable('T_PetEquip_Info',{'dwRoleID','dwPetEnumId'},{'szPetEquip'})

AddTable('T_Errant_Honor_Info',{'dwRoleId'},{'dwErrantLevel', 'dwErrantStar', 'dwErrantValue'})


AddTable('T_Role_YWZ',{'dwRoleID','dwImageID'},{'ImageData'})

AddTable('T_Iron_Cloth_Info',{'dwRoleId'},{'dwClothLevel', 'dwClothExp', 'dwForbidValue', 'dwSuitLevel'});

AddTable('T_Role_CollectJewel',{'dwRoleID'},{'dwInjectJewelUseNum','dwInjectJewelState','dwInjectJewelProcess','dwInjectJewelUseTotalNum','dwInjectJewelAddCanUseNum','dwInjectJewelAddCanUseTotalNum'})

AddTable('T_Role_OnlineAwards',{'dwRoleID'},{'dwUsedNum','dwAwardIndexs','dwAwardTypes','dwAwardStates','dwInterTime'})

AddTable('T_Role_QunXia',{'dwRoleID'},{'maxTotalCount','curTotalCount','setQunXiaCount'})
AddTable('T_Role_WuXiaLing',{'RoleID'},{'RoleID','Insignia'})
AddTable('T_Role_CollectJewelLevel',{'dwRoleID'},{'dwCollectJewelState','dwCollectJewelLevel'})
AddTable('T_Role_PractiseSkill',{'dwRoleID'},{'dwPractiseLevel','dwMendValue','dwStarLevel','dwHeadState'})
AddTable('T_PetBourn_Info',{'dwRoleID','dwPetEnumId'},{'dwExp'})
AddTable('T_Role_AchieveMedal',{'dwRoleID'},{'dwAchievePointPlus','strMedalList'})


AddTable('t_role_addattrs',{'roleid'},{'records', 'attrs', 'totaltimes'})
AddTable('T_Role_BournHideAttr',{'RoleID'},{'Level'})
AddTable('T_Role_Gourd',{'dwRoleID'},{'dwMendLevel','dwCurSkillValue','dwCurItemInfos','dwAdornState','dwAddTimesItemIndex'})
AddTable('T_PetAptitude_Info',{'dwRoleID','dwPetEnumId'},{'dwMp', 'dwAttack','dwDefense','dwCrit','dwFlee'})

AddTable('T_Role_QunXiaLu',{'dwRoleID'},{'dwHotelLastTime','dwHotelPrestigeCount','dwHotelGoldCount','szHotelCard','szGroupSlot','szDaXiaSlot'})

AddTable('T_PetWash_Info',{'dwRoleID','dwPetEnumId'},{'szAttr', 'dwWashCount'})
AddTable('T_Role_Cross_Info',{'dwRoleId'},{'dwHonor'})
AddTable('T_Role_Gest_Info',{'dwRoleId'},{'dwGestLevel', 'dwGestProgress', 'dwChooseMode', 'dwRealizeLevel'})
AddTable('T_Role_Cross_Info',{'dwRoleId'},{'dwHonor'})

AddTable('T_Role_FashionDress', {'dwRoleID', 'dwDressID'},{'dwDeleteTime', 'bRenew','bInBox'})
AddTable('T_Role_HuaShenDan', {'dwRoleID'}, {'dwExp', 'szEquip','dwBoxNum'})
AddTable('T_Role_QingYunLing',{'dwRoleID'},{'dwLotteryID','dwTotalExp','dwNum','dwCount'})
AddTable('T_Role_ShengHuoLing', {'dwRoleID'}, {'szSetState'})

AddTable('T_Role_DuGuJiuJian_Info', {'dwRoleId'}, {'dwEXP', 'nActSwordId', 'nPrimaryTimes', 'nIntermediateTimes', 'nAdvancedTimes', })

AddTable('T_Role_Chart_Award',{'RoleID', 'ID'},{'RoleID', 'ID'})
AddTable('T_Role_HiddenWeapon', {'dwRoleID'}, {'dwHiddenWeaponExp','bIsOpen','dwHWLevel'})
AddTable('T_Role_ZhenlongChess', {'dwRoleID'}, {'curTotalCount', 'curProcess', 'setBossCount', 'setBossStar', 'tabGetAward'})
AddTable('T_Role_KungFuExtend', {'nRoleId'}, {'tCount'})

AddTable('T_Role_ZhanQiJue_Info', {'dwRoleId'}, {'dwEXP', 'bBless' })
AddTable('T_Role_Shield', {'nRoleID'}, {'nExp', 'nCount1', 'nCount2', 'nCount3'})
AddTable('T_Role_TongTianTower_Info', {'nRoleId'}, {'nCurLayer', 'nExtraCount', 'nAllTime', 'nWeekLayer', 'nWeekTime'})
AddTable('T_Role_GoldenBody', {'nRoleId'}, {'nExp', 'nPractice' })
AddTable('T_Role_TalkSword', {'nRoleID'}, {'nChallengeUse', 'nChallengeAdd', 'nCDTime', 'bFullTime', 'nAttackAdd', 'tReport', 'nRewardState'})
AddTable('T_Role_HeroToken_Info', {'dwRoleId'}, {'szEnbeded'})
AddTable('T_Role_Curio', {'nRoleId'}, {'tCount'})

AddTable('T_Role_Banner_Info', {'dwRoleID'}, {'dwEXP', 'bBless', 'bConsume', 'dwLook', 'dwStartTime'})
AddTable('T_Role_Recycling', {'nRoleId'}, {'tCount'})
