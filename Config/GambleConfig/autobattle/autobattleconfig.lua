_G.AutoMonsterConfig = { 
	dwLifeRecoverRule = 0,			--吃血药的默认配置，0为从大到小，1为从小到大
	dwManaRecoverRule = 0,		--吃蓝药的默认配置，0为从大到小，1为从小到大
	dwDefaultLifeRate = 50,				--默认使用保命技能的生命比例,50指50%
	dwEquipPickProf = 0,				--默认捡装备设置(全部职业)
	dwEquipPickLevel = 0,               --默认捡装备设置(全部阶数)
	dwEquipPickQuality = 0,             --默认捡装备设置(全部品质)
	
	bJoinTeam = 1,				--是否接受组队请求，1为是，0为否。
	bMonsterChoose = 1,			--是否避开变异怪与BOSS，1为是，0为否
	brevive = 1,					--是否自动原地复活
	dwGoBackCitye = 600,              --默认回城时间
	dwAttackBound = 15,
	dwAutoHPPer = 0.7,--默认回血限度
	dwAutoMPPer = 0.5,--默认回蓝限度
};

_G.AutoAttackBound = {
	[0] = 10,
	[1] = 15,
	[2] = 20,
}

_G.AutoBattleWndMsg = {
	[1] = T"从大到小",
	[2] = T"从小到大",
}

_G.PickEquipProf = {
	[0] = T"全部职业",
	[1] = T"镰",
	[2] = T"刀",
	[3] = T"剑",
	[4] = T"枪",
}

_G.PickEquipLevel = {
	[0] = T"全部阶数",
	[1] = T"≥二阶",
	[2] = T"≥三阶",
	[3] = T"≥四阶",
	[4] = T"≥五阶",
	[5] = T"≥六阶",
	[6] = T"≥七阶",
	
}

_G.PickEquipQuality = {
	[0] = T"全部品质",
	[1] = T"≥绿色",
	[2] = T"≥蓝色",
	[3] = T"≥紫色",
	
}

_G.AutoBattleSkill = {
--剑
	[enProfType.eProfType_Sword] ={
		--招式
		[1] = {	
			21001,
			21004,
			21003,
			21005,
			11017,
			11007,
			11003,
			11008,
			11009,
		},
	--	[2] = {22000},
		[3] = {11001},
	},
	--刀
	[enProfType.eProfType_Knife] ={
		--招式
		[1] = {	
			
			31001,
			31004,
			31003,
			31005,
			11017,
			11007,
			11003,
			11008,
			11009,
		},
	--	[2] = {32000},
		[3] = {11001},
	},
	--枪
	[enProfType.eProfType_Spear] ={
		--招式
		[1] = {
			
			41001,
			41004,
			41003,
			41005,
			11017,
			11007,
			11003,
			11008,
			11009,
		},	
	--	[2] = {42000},
		[3] = {11001},		
	},
	--镰刀
	[enProfType.eProfType_Sickle] ={
		--招式
		[1] = {					
			51001,
			51004,
			51003,
			51005,
			11017,
			11007,
			11003,
			11008,
			11009,
		},
	--	[2] = {52000},
		[3] = {11001},
	},
}

_G.AutoBattleBasicSkill = {
--剑
	[enProfType.eProfType_Sword] ={
		--招式	
		21000,	
	},
	--刀
	[enProfType.eProfType_Knife] ={
		--招式
		31000,
	},
	--枪
	[enProfType.eProfType_Spear] ={
		--招式
		41000,	
	},
	--镰刀
	[enProfType.eProfType_Sickle] ={
		--招式				
		51000,
	},
}

_G.AutoRunDes = 3;
_G.DoubleExpBuffId = 2400110;
_G.DoubleExpItemId = 2400110;
_G.StopBattle = T"停止挂机";
_G.StartBattle = T"开始挂机";
_G.PickUpSpace = 200;
_G.CancelHitRange = 5;   --取消打怪的范围

--单位：秒
_G.CheckEnterBattle = {
	["FreeTime"] = 30,
	["FightTime"] = 30,
}

--自动挂机时不能使用的技能表
_G.EnableSkill = {
	[11002] = true,
}
