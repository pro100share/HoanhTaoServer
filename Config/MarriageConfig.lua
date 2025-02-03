--婚姻系统配置文件
----婚姻系统系统提示
_G.MarriageError = 
{
	--求婚功能系统提示
	eSelfMarried 		= 1,
	eCannotFindTarget 	= 2,
	eSameSex 			= 3,
	eTargetMarried 		= 4,
	eNoMarriageKeepsake = 5,
	eNotMarriageKeepsake = 6,
	eAlreadyProposeTo	= 7,
	eTargetNotHaveAuthority = 8,
	eAlreadyBePropose 	= 9,
	[1] = _G.SysStringConfigInfo[6001110048],
	[2] = _G.SysStringConfigInfo[6001110002],
	[3] = _G.SysStringConfigInfo[6001110003],
	[4] = _G.SysStringConfigInfo[6001110004],
	[5] = _G.SysStringConfigInfo[6001110005],
	[6] = _G.SysStringConfigInfo[6001110006],
	[7] = _G.SysStringConfigInfo[6001110007],
	[8] = _G.SysStringConfigInfo[6001110008],
	[9] = _G.SysStringConfigInfo[6001110049],
	eAcceptProposeMale		= 10,
	eAcceptProposeFemale	= 11,
	eProposeAcceptedMale	= 12,
	eProposeAcceptedFemale	= 13,
	eProposeRefused			= 14,
	eProposeAutoRefused		= 15,
	[10] = _G.SysStringConfigInfo[6001110010],
	[11] = _G.SysStringConfigInfo[6001110011],
	[12] = _G.SysStringConfigInfo[6001110012],
	[13] = _G.SysStringConfigInfo[6001110013],
	[14] = _G.SysStringConfigInfo[6001110014],
	[15] = _G.SysStringConfigInfo[6001110053],
	
	--夫妻聊天系统提示
	eChatEmpty			= 20,
	[20] = _G.SysStringConfigInfo[6001110033],
	eHaveNewChat		= 21,
	[21] = _G.SysStringConfigInfo[6001110034],
	
	eTaToYou_Male			= _G.SysStringConfigInfo[6001160028],
	eYouToTa_Male 			= _G.SysStringConfigInfo[6001160029],
	
	eTaToYou_Female			= _G.SysStringConfigInfo[6001160030],
	eYouToTa_Female 		= _G.SysStringConfigInfo[6001160031],
	
	eTaToYou_Color	= _G.SysColorConfigInfo.eTaToYou_Color;
	eYouToTa_Color	= _G.SysColorConfigInfo.eYouToTa_Color;
	eDelete_Color	= _G.SysColorConfigInfo.eDelete_Color;
	
	eMateOnline		= 25,
	[25] = _G.SysStringConfigInfo[6001110050],
	eMateOffLine	= 26,
	[26] = _G.SysStringConfigInfo[6001110037],
	eAnnoyCD		= 27,
	[27] = _G.SysStringConfigInfo[6001110017],
	eBeAnnoy		= 28,
	[28] = _G.SysStringConfigInfo[6001110038],
	
	--离婚功能系统提示
	eMateNotOnline		= 31,
	[31] = _G.SysStringConfigInfo[6001110015],
	eMoneyNotEnough		= 32,
	[32] = _G.SysStringConfigInfo[6001110016],
	eDivorceAccepted	= 33,
	[33] = _G.SysStringConfigInfo[6001130002],
	eDivorceRefused		= 34,
	[34] = _G.SysStringConfigInfo[6001130003],
	eCompelDivorceTo	= 35,
	[35] = _G.SysStringConfigInfo[6001130004],
	eDivorceComplete	= 36,
	[36] = _G.SysStringConfigInfo[6001130005],
	
	--结婚信物功能系统提示
	eKeepsakeChanged	= 38,
	[38] = _G.SysStringConfigInfo[6001110031],
	eLevelLow			= 39,
	[39] = _G.SysStringConfigInfo[6001110030],
	
	eMoneyCannotBuy		= 40,
	[40] = _G.SysStringConfigInfo[6001110018],
	eNoEmptySlot		= 41,
	[41] = _G.SysStringConfigInfo[6001110019],
	eNoOldKeepsake		= 42,
	[42] = _G.SysStringConfigInfo[6001110020],
	eMoneyCannotHold		= 43,
	[43] = _G.SysStringConfigInfo[6001110021],
	eCannotEatMyselfBanquet = 44,
	[44] = _G.SysStringConfigInfo[6001110022],
	eCannotGiveSelfMarryMoney = 45,
	[45] = _G.SysStringConfigInfo[6001110023],
	eLastMarryMoneyNotGet = 46,
	[46] = _G.SysStringConfigInfo[6001110024],
	eNoEnoughPlace = 47,
	[47] = _G.SysStringConfigInfo[6001110025],
	eIsHaveBanquetInList = 48,
	[48] = _G.SysStringConfigInfo[6001110026],
	eBookingSuccess = 49,
	[49] = _G.SysStringConfigInfo[6001110032],
	eNoMarryMoney = 50,
	[50] = _G.SysStringConfigInfo[6001110027],
	eAlreadyEatThis = 51,
	[51] = _G.SysStringConfigInfo[6001110039],
	eAlreadyEatFull = 52,
	[52] = _G.SysStringConfigInfo[6001110028],
	eUnableTarget = 53,
	[53] = _G.SysStringConfigInfo[6001110029],
	
	LowLevel	= _G.SysStringConfigInfo[6001160032];
	MiddleLevel = _G.SysStringConfigInfo[6001160033];
	HighLevel	= _G.SysStringConfigInfo[6001160034];
	
	
	--结婚系统邮件配置
	[54] = _G.SysStringConfigInfo[6001160035];
	[55] = _G.SysStringConfigInfo[6001160036];
	[56] = _G.SysStringConfigInfo[6001160037];
	
	eTargetNotHoldBanquet = _G.SysStringConfigInfo[6001110051];
	GiveMarryMoneySuc = _G.SysStringConfigInfo[6001110052];
	
	--[100] = "<p><font color='#00FF00'>结婚流程<br/>",
	[101] = _G.SysStringConfigInfo[6001160015],
	[102] = _G.SysStringConfigInfo[6001160016],
	[103] = _G.SysStringConfigInfo[6001160017],
	[104] = _G.SysStringConfigInfo[6001160018],
	[105] = _G.SysStringConfigInfo[6001160019],
	
	[111] = _G.SysStringConfigInfo[6001160021],
	[112] = _G.SysStringConfigInfo[6001160022],
	[113] = _G.SysStringConfigInfo[6001160023],
	[114] = _G.SysStringConfigInfo[6001160024],
	[115] = _G.SysStringConfigInfo[6001160025],
	[116] = _G.SysStringConfigInfo[6001160026],
	[117] = _G.SysStringConfigInfo[6001160027],
}

_G.MarriageConfig =
{
	Congratulation	= _G.SysStringConfigInfo[6001140001],
	TimeFormat		= _G.SysStringConfigInfo[6001160003],
	BeComferDivorceStr = _G.SysStringConfigInfo[6001130001],
	IsHusband		= _G.SysStringConfigInfo[6001160001],
	IsWife 			= _G.SysStringConfigInfo[6001160002],
	--数据库中保留的最大聊天数量
	MaxChatNum = 100,
	--同队同地图增加一点亲密度CD，单位秒
	AddLoveCD	= 1800,
	--单位时间内增加多少亲密度
	AddLoveValue = 1,
	--增加亲密度的道具
	AddLoveItemID = 4100010,
	--道具一次加亲密度多少
	AddLoveOnce	= 2;
	--震他一下CD时间，单位毫秒
	AnnoyCD = 60000,
	--震他一下屏幕持续抖动时间，单位毫秒
	AnnoyStanding = 3000,
	--强制离婚消耗金钱
	CompelDivorceNeedMoney = 2000000,
	--求婚通知图标
	BeProposeToNoticeIcon = "ftb_jh_01.png",
	--婚姻技能
	----结婚就能学
	Marriage_SkillID1 = 60002;
	----有等级需求
	Marriage_SkillID2_NeedLevel = 45;
	Marriage_SkillID2 = 60003;
	Marriage_SkillID3_NeedLevel = 55;
	Marriage_SkillID3 = 60004;
	Marriage_SkillID4_NeedLevel = 65;
	Marriage_SkillID4 = 60005;
	--结婚信物商城商品个数
	GoodsNumber = 7;
	Goods_SkillID1 = 60000;
	Goods_SkillID2 = 60001;
	--商品1配置ID
	Goods_1_ItemID = 1600010;
	Goods_1600010_After_ItemID1 = 1600020;--男左，保证itemID1是左部分
	Goods_1600010_After_ItemID2 = 1600030;--女右，保证itemID2是右部分
	Goods_1600020_Before_ItemID = 1600010;--用来索引完整的itemID
	Goods_1600030_Before_ItemID = 1600010;--用来索引完整的itemID
	Goods_1600010_SkillLevel = 1;			--每个信物的技能等级
	Goods_1600020_SkillLevel = 1;
	Goods_1600030_SkillLevel = 1;
	--商品2配置ID
	Goods_2_ItemID = 1600040;
	Goods_1600040_After_ItemID1 = 1600050;
	Goods_1600040_After_ItemID2 = 1600060;
	Goods_1600050_Before_ItemID = 1600040;
	Goods_1600060_Before_ItemID = 1600040;
	Goods_1600040_SkillLevel = 2;
	Goods_1600050_SkillLevel = 2;
	Goods_1600060_SkillLevel = 2;
	--商品3配置ID
	Goods_3_ItemID = 1600070;
	Goods_1600070_After_ItemID1 = 1600080;
	Goods_1600070_After_ItemID2 = 1600090;
	Goods_1600080_Before_ItemID = 1600070;
	Goods_1600090_Before_ItemID = 1600070;
	Goods_1600070_SkillLevel = 3;
	Goods_1600080_SkillLevel = 3;
	Goods_1600090_SkillLevel = 3;
	--商品4配置ID
	Goods_4_ItemID = 1600100;
	Goods_1600100_After_ItemID1 = 1600110;
	Goods_1600100_After_ItemID2 = 1600120;
	Goods_1600110_Before_ItemID = 1600100;
	Goods_1600120_Before_ItemID = 1600100;
	Goods_1600100_SkillLevel = 4;
	Goods_1600110_SkillLevel = 4;
	Goods_1600120_SkillLevel = 4;
	--商品5配置ID
	Goods_5_ItemID = 1600130;
	Goods_1600130_After_ItemID1 = 1600140;
	Goods_1600130_After_ItemID2 = 1600150;
	Goods_1600140_Before_ItemID = 1600130;
	Goods_1600150_Before_ItemID = 1600130;
	Goods_1600130_SkillLevel = 5;
	Goods_1600140_SkillLevel = 5;
	Goods_1600150_SkillLevel = 5;
	--商品6配置ID
	Goods_6_ItemID = 1600160;
	Goods_1600160_After_ItemID1 = 1600170;
	Goods_1600160_After_ItemID2 = 1600180;
	Goods_1600170_Before_ItemID = 1600160;
	Goods_1600180_Before_ItemID = 1600160;
	Goods_1600160_SkillLevel = 6;
	Goods_1600170_SkillLevel = 6;
	Goods_1600180_SkillLevel = 6;
	--商品7配置ID
	Goods_7_ItemID = 1600190;
	Goods_1600190_After_ItemID1 = 1600200;
	Goods_1600190_After_ItemID2 = 1600210;
	Goods_1600200_Before_ItemID = 1600190;
	Goods_1600210_Before_ItemID = 1600190;
	Goods_1600190_SkillLevel = 7;
	Goods_1600200_SkillLevel = 7;
	Goods_1600210_SkillLevel = 7;

	--商品8配置ID
	Goods_8_ItemID = 1600220;
	Goods_1600220_After_ItemID1 = 1600230;
	Goods_1600220_After_ItemID2 = 1600240;
	Goods_1600230_Before_ItemID = 1600220;
	Goods_1600240_Before_ItemID = 1600220;
	Goods_1600220_SkillLevel = 8;
	Goods_1600230_SkillLevel = 8;
	Goods_1600240_SkillLevel = 8;

	--商品9配置ID
	Goods_9_ItemID = 1600250;
	Goods_1600250_After_ItemID1 = 1600260;
	Goods_1600250_After_ItemID2 = 1600270;
	Goods_1600260_Before_ItemID = 1600250;
	Goods_1600270_Before_ItemID = 1600250;
	Goods_1600250_SkillLevel = 9;
	Goods_1600260_SkillLevel = 9;
	Goods_1600270_SkillLevel = 9;
	
}
--结婚性别，key为职业，value为性别，1为男，2为女
_G.MarriageSex = 
{	[_G.enProfType.eProfType_Knife] 	= true;		--刀
	[_G.enProfType.eProfType_Sword] 	= true;		--剑
	[_G.enProfType.eProfType_Sickle] 	= false;	--镰刀
	[_G.enProfType.eProfType_Spear] 	= false;	--枪
}
--职业汉字显示
_G.ProfessionType = 
{
	[1] = _G.SysStringConfigInfo[6001160011],
	[2] = _G.SysStringConfigInfo[6001160012],
	[3] = _G.SysStringConfigInfo[6001160013],
	[4] = _G.SysStringConfigInfo[6001160014],
}
--婚宴配置
_G.MarriageBanquetConfig = 
{
	TableName				= _G.SysStringConfigInfo[6001160004],
	TimeFormat				= _G.SysStringConfigInfo[6001160005],
	MaxEatStr				= _G.SysStringConfigInfo[6001110045],
	AlreadyEatStr			= _G.SysStringConfigInfo[6001110044],
	YouMaxEatStr			= _G.SysStringConfigInfo[6001110043],
	YouAlreadyEatStr		= _G.SysStringConfigInfo[6001110042],
	WantEatNeedMoney_html	= _G.SysStringConfigInfo[6001110041],
	WantEatNeedMoney_text	= _G.SysStringConfigInfo[6001110040],
	
	MaxEatTimes = 20; --每个人一天最多可以食用次数
	
	EatAction = 5;	--吃喝动作ID
	
	BanquetType = {
		[1] = _G.SysStringConfigInfo[6001160006];
		[2] = _G.SysStringConfigInfo[6001160007];
		[3] = _G.SysStringConfigInfo[6001160008];
	};
	BanquetState = {
		[1] = _G.SysStringConfigInfo[6001160009];
		[2] = _G.SysStringConfigInfo[6001160010];
	};
	
	--婚宴结束通知图标
	BanquetOverNoticeIcon = "Icon_item_5500340_1.png",
	
	--婚宴举办城市
	BanquetHoldPlace = 1002;--襄阳城
	--婚宴举办时间 20点 0分
	BanquetHoldTime = {
		Hour = 20;
		Minute = 00;
	};
	--举办婚宴花钱
	HoldBanquetMoney = {
		[1] = 2000000,
		[2] = 5000000,
		[3] = 10000000,
	};
	--举办婚宴亲密度
	HoldBanquetLove = {
		[1] = 100,
		[2] = 500,
		[3] = 1000,
	};
	--一批酒席出现时间间隔，单位分钟
	Npc_Life_Time = 5;		--5分钟
	--小偷ID
	MonsterID = 10012010;
	FightID = 10012010; 
	AIID = 10012010; 
	DropID = 10012010;
    LookID = 10012010; 
	--刷出每桌出现小偷概率(1-10000)
	MonsterRate = function(level)
		return 5000;
	end;
	--不同档次婚宴餐桌的配置
	Npc_Level_1 = {
		ID		= 10011097;		--餐桌表现NPC id
		Time	= 4;			--出现餐桌批数
		Num		= 5;			--一批出现的个数
		EatTimes = 5;			--一桌饭菜可以被吃多少次
	};
	Npc_Level_2 = {
		ID		= 10011098;
		Time	= 10;
		Num		= 10;
		EatTimes = 10;
	};
	Npc_Level_3 = {
		ID		= 10011099;
		Time	= 10;
		Num		= 15;
		EatTimes = 15;
	};
	--食用酒席需要花钱
	NeedMoney = function(playerLevel, banquetLevel)
		--local n_UpLevelNeedExp = _G.RoleUpLevelConfig[playerLevel].dwExp  -_G.RoleUpLevelConfig[playerLevel - 1].dwExp;
		--local n_AddExp = n_UpLevelNeedExp * _G.RoleUpLevelConfig[playerLevel].dwBanquetParam;
		return banquetLevel * 50000--_G.RoleUpLevelConfig[playerLevel].dwBanquetParam + (banquetLevel -1) * 100000;
	end;
	--食用酒席加经验
	AddExp = function(playerLevel, banquetLevel)
		--local n_UpLevelNeedExp = _G.RoleUpLevelConfig[playerLevel].dwExp  -_G.RoleUpLevelConfig[playerLevel - 1].dwExp;
		--local n_AddExp = n_UpLevelNeedExp * _G.RoleUpLevelConfig[playerLevel].dwBanquetParam;
		return _G.RoleUpLevelConfig[playerLevel].dwBanquetParam + (banquetLevel -1) * 100000;
	end;
	--食用酒席加真气
	AddEnergy = function(playerLevel, banquetLevel)
		return playerLevel * banquetLevel;
	end;
};
--婚宴宴席坐标配置
_G.MarriageBanquetCoordinate = 
{
	[1] = {x =-3, y = 19.75,dir = 4.75},
	[2] = {x =4.68, y = 13.82,dir = 4.75},
	[3] = {x =4.67, y = 25.71,dir = 4.75},
	[4] = {x =-11.10, y = 15.13,dir = 4.75},
	[5] = {x =-10.94, y = 25.72,dir = 4.75},
	
	[6] = {x =2.48, y = 1.01,dir = 4.75},
	[7] = {x =-9.79, y = 2.07,dir = 4.75},
	[8] = {x =-17.54, y = 3.92,dir = 4.75},
	[9] = {x =11.65, y = 3.03,dir = 4.75},
	[10] = {x =-3.13, y = 27.00,dir = 4.75},
	
	[11] = {x =2.96, y = 36.92,dir = 4.75},
	[12] = {x =-9.26, y = 36.96,dir = 4.75},
	[13] = {x =-19.75, y = 37.29,dir = 4.75},
	[14] = {x =11.48, y = 36.76,dir = 4.75},
	[15] = {x =-3.06, y = 43.92,dir = 4.75},
	
	[16] = {x =-23.26, y = 26.29,dir = 4.75},
	[17] = {x =-23.20, y = 14.65,dir = 4.75},
	[18] = {x =17.12, y = 13.07,dir = 4.75},
	[19] = {x =17.17, y = 25.51,dir = 4.75},
	[20] = {x =25.82, y = 20.12,dir = 4.75},
}



