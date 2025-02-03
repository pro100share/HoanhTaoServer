
_G.RoleInfoByLS = {};
function RoleInfoByLS:new()
	local obj = {};
	
	obj.dwRoleID = 0;			--��ɫID
	obj.szRoleName = "";		--�������
	obj.dwSex = 0;			--����Ա�
	obj.dwFace = 0;			--�������
	obj.dwHair = 0;			--��ҷ���
	obj.dwProf = 0;			--���ְҵ
	
	obj.dwDress = 0;			--�·�
	obj.dwHand = 0;			--����
	obj.dwShoe = 0;			--Ь��
	obj.dwArms = 0;			--����
	
	obj.dwDressLevel = 0;			--�·�ǿ���ȼ�
	obj.dwHandLevel = 0;			--����ǿ���ȼ�
	obj.dwShoeLevel = 0;			--Ь��ǿ���ȼ�
	obj.dwArmsLevel = 0;			--����ǿ���ȼ�
	
	obj.dwExp = 0;			--��ɫ����
	obj.dwIncoID = 0;
	obj.dwLevel = 0;
	
	obj.dwGold = 0;
	
	obj.dwDefFace = 0;
	obj.dwDefHair = 0;
	obj.dwDefHand = 0;
	obj.dwDefDress = 0;
	obj.dwDefShoe = 0;
	
	obj.tmDownlineTime = 0;
	obj.tmUplineTime = 0;
	obj.tmCreateRoleTime = 0;
	obj.setActSuitList = {};
	
	obj.dwLockTime = 0;
	obj.dwLockStart = 0;
	obj.szLockReason = "";
	
	return obj;
end;

--����ϵͳ��Ӧ��ID�����ڵ�¼
_G.SystemNameToID = 
{
	CAchievementSystem = 1;
	CAmuletSystem = 2;
	CAutoBattleSystem = 3;
	CBournSystem = 4;
	CBuffSystem = 5;
	CChatSystem = 6;
	CCollectSystem = 7;
	CDataCenterSystem = 8;
	CDuplSystem = 9;
	CEvaluateSystem = 10;
	CFiveElementSystem = 11;
	CFriendSystem = 12;
	CGiftSystem = 13;
	CGrowupTargetSystem = 14;
	CItemSystem = 15;
	CMailSystem = 16;
	CMallSystem = 17;
	CMapSystem = 18;
	CMarriageSystem = 19;
	CMartialSystem = 20;
	CMissionDailySystem = 21;
	CMountSystem = 22;
	CMuseSystem = 23;
	CNoviceSystem = 24;
	CNpcConnectionSystem = 25;
	CRefreshSystem = 26;
	CPKSystem = 27;
	CPlayerShopSystem = 28;
	CPulseSystem = 29;
	CSettingSystem = 30;
	CShortcutSystem = 31;
	CSkillSystem = 32;
	CSwordSystem = 33;
	CTaskSystem = 34;
	CTimeRewardSystem = 35;
	CTianGuanCiFuSystem = 36;
	CVipSystem = 37;
	CServerEventSystem = 38;
	CFirstBloodSystem = 39;
	CBuildRampartSystem = 40;
	CTitleSystem = 41;
	CFestivalSystem = 42;
	CScriptSystem = 43;
	CFullAwardSys = 44;
	COnlineGiftSystem = 45;
	CBaiduSystem = 46;
	CCommercialGiftSys = 47;
	CCommercialActSystem = 48;
	CErrantSystem = 49;
	CEquipBuildSystem = 50;
	CStoneSystem = 51;

	CFrenzyHoeSystem = 52;
	CBaiduPlayerSystem = 53;
	CPracticeSystem = 54;

	CGuildSkill = 55;
	CKungFuSystem = 56;
	CEscortSystem = 57;
	CMegaKillSystem = 58;
	CGuildSystem = 59;
	CLoginDaysSystem=60;
	CSoulSystem = 61;
	CSwordFoundrySystem = 62;
	C360RedJewelSystem = 63;
	CMatrixMethodSystem = 64;
	CUnionPlatGiftSystem = 65;
	CQihunSystem = 66;
	CPetSkillSystem = 67;
	CPetSystem = 68;
	CPetEquipSystem = 69;
	CErrantHonorSystem = 70;
	CYouWuZhiSystem=71;
	CCollectJewelSystem = 72;
	COnlineAwardsSystem = 73;
	CChallengeQunXiaSystem = 74;
	CTieBuShanSystem = 75;
    CWuXiaLingSystem = 76;
	CCollectJewelLevelSystem = 77;
	CPractiseSkillSystem = 78;
	CPetBournSystem = 79;
    CBournHideAttrSystem = 80;
	CAddAttrSystem = 81;
	CQunXiaLuSystem = 82;
	CPetAptitudeSystem = 83;

	CGourdSystem = 84;
	CPetWashSystem = 85;
	CCrossSvrSystem = 86;
	CGestSystem = 87;
	CFashionDressSystem = 88;
	CQingYunLingSystem = 89;
	CShengHuoLingSystem = 90;
	CChartAwardSystem = 91;
	CHiddenWeaponSystem = 92;
	CZhenlongChessSystem = 93;
	CDuGuSystem = 94;
	CKungFuExtendSystem = 95;
	CZhanQiJueSystem = 96;
	CShieldSystem = 97;
	CTongTianTowerSystem = 98;
	CGoldenBodySystem = 99;
	CTalkSwordSystem = 100;
	CHeroTokenSystem = 101;
    CCurioSystem = 102;
	CBannerSystem = 103;
    CRecyclingSystem = 104;
}

_G.SystemIDToName = {};
for n,v in pairs(SystemNameToID)do
	SystemIDToName[v] = n;
end

