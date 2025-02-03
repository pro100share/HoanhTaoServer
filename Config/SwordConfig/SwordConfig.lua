_G.SwordBasicConfig = 
{
	--阶数
	[1] = {
		name = "鱼肠",   --名称
		model = {	
			sknFile = "A_Equip_BaoJian_01.skn"; sklFile="A_Equip_BaoJian.skl"; sanFile ="A_Equip_BaoJian_DaiJi.san"; param_1_x = -0.169; param_1_y =-9.339; param_1_z = 2.874;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_NPC_Equip_BaoJian_DaiJi.san"; 
		},
		action = {{pfxId = 2010,bindPos ="tx1"},{pfxId = 2019,bindPos ="tx1"}},
		skillId = 70000,   --技能id 用这个触发底下的3个技能伤害做到技能里面
		skillType = "",
		--用于显示用的技能
		skillTbl = {
		},
		nextLadder = 1,
		level = 4,
	},
	[2] = {
		name = "绿虹",   --名称
		model = {
			sknFile = "A_Equip_BaoJian_02.skn"; sklFile="A_Equip_BaoJian.skl"; sanFile ="A_Equip_BaoJian_DaiJi.san"; param_1_x = -0.169; param_1_y =-9.339; param_1_z = 2.874;param_2_x = 0; param_2_y = 0; param_2_z = 0;lieAction = "A_NPC_Equip_BaoJian_DaiJi.san";
		},
		action = {{pfxId = 2020,bindPos ="tx1"},{pfxId = 2029,bindPos ="tx1"}}, 
		skillId = 70001,   --技能id
		skillType = "",
		--用于显示用的技能
		skillTbl = {
		},
		nextLadder = 2,
		level = 8,
	},	
	[3] = {
		name = "赤霄",   --名称
		model = {
			sknFile = "A_Equip_BaoJian_03.skn"; sklFile="A_Equip_BaoJian.skl"; sanFile ="A_Equip_BaoJian_DaiJi.san"; param_1_x = -0.169; param_1_y =-9.339; param_1_z = 2.874;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_NPC_Equip_BaoJian_XiuXian.san";
		},
		action = {{pfxId = 2030,bindPos ="tx1"},{pfxId = 2039,bindPos ="tx1"}},
		skillId = 70002,   --技能id
		skillType = "",
		--用于显示用的技能
		skillTbl = {
			[1] = 11011,
		},
		nextLadder = 3,
		level = 12,
	},	
	[4] = {
		name = "紫电",   --名称
		model = {
			sknFile = "A_Equip_BaoJian_04.skn"; sklFile="A_Equip_BaoJian.skl"; sanFile ="A_Equip_BaoJian_DaiJi.san"; param_1_x = -0.169; param_1_y =-9.339; param_1_z = 2.874;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_NPC_Equip_BaoJian_XiuXian.san";
		},
		action = {{pfxId = 2040,bindPos ="tx1"},{pfxId = 2049,bindPos ="tx1"}},
		skillId = 70003,   --技能id
		skillType = "",
		--用于显示用的技能
		skillTbl = {
			[1] = 11011,
			[2] = 11014,
			
		},
		nextLadder = 4,
		level = 16,
	},	
	[5] = {
		name = "青霜",   --名称
		model = {
			sknFile = "A_Equip_BaoJian_05.skn"; sklFile="A_Equip_BaoJian.skl"; sanFile ="A_Equip_BaoJian_DaiJi.san"; param_1_x = -0.169; param_1_y =-9.339; param_1_z = 2.874;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_NPC_Equip_BaoJian_XiuXian.san";
		},
		action = {{pfxId = 2050,bindPos ="tx1"},{pfxId = 2059,bindPos ="tx1"}},
		skillId = 70004,   --技能id
		skillType = "",
		--用于显示用的技能
		skillTbl = {
			[1] = 11011,
			[2] = 11014,
			[3] = 11012,
		},
		nextLadder = 5,
		level = 20,
	},	
	[6] = {
		name = "巨阙",   --名称
		model = {
			sknFile = "A_Equip_BaoJian_06.skn"; sklFile="A_Equip_BaoJian.skl"; sanFile ="A_Equip_BaoJian_DaiJi.san"; param_1_x = -0.169; param_1_y =-9.339; param_1_z = 2.874;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_NPC_Equip_BaoJian_XiuXian.san";
		},
		action = {{pfxId = 2060,bindPos ="tx1"},{pfxId = 2069,bindPos ="tx1"}},
		skillId = 70005,   --技能id
		skillType = "",
		--用于显示用的技能
		skillTbl = {
			[1] = 11011,
			[2] = 11014,
			[3] = 11012,
			[4] = 11013,
		},
		nextLadder = 6,
		level = 24,
	},	
	[7] = {
		name = "转魄",   --名称
		model = {
			sknFile = "A_Equip_BaoJian_07.skn"; sklFile="A_Equip_BaoJian.skl"; sanFile ="A_Equip_BaoJian_DaiJi.san"; param_1_x = -0.169; param_1_y =-9.339; param_1_z = 2.874;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_NPC_Equip_BaoJian_XiuXian.san";
		},
		action = {{pfxId = 2070,bindPos ="tx1"},{pfxId = 2079,bindPos ="tx1"},{pfxId = 2079,bindPos ="tx1"}},
		skillId = 70006,   --技能id
		skillType = "",
		--用于显示用的技能
		skillTbl = {
			[1] = 11011,
			[2] = 11014,
			[3] = 11012,
			[4] = 11013,
			[5] = 11015,
		},
		nextLadder = 7,
		level = 28,
	},	
	[8] = {
		name = "太阿",   --名称
		model = {
			sknFile = "A_Equip_BaoJian_08.skn"; sklFile="A_Equip_BaoJian.skl"; sanFile ="A_Equip_BaoJian_DaiJi.san"; param_1_x = -0.169; param_1_y =-9.339; param_1_z = 2.874;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_NPC_Equip_BaoJian_XiuXian.san";
		},
		action = {{pfxId = 2080,bindPos ="tx1"},{pfxId = 2089,bindPos ="tx1"},{pfxId = 2089,bindPos ="tx1"}},
		skillId = 70007,   --技能id
		skillType = "",
		--用于显示用的技能
		skillTbl = {
			[1] = 11011,
			[2] = 11014,
			[3] = 11012,
			[4] = 11013,
			[5] = 11015,
		},
		nextLadder = 8,
		level = 32,
	},
	[9] = {
		name = "湛卢",   --名称
		model = {
			sknFile = "A_Equip_BaoJian_09.skn"; sklFile="A_Equip_BaoJian.skl"; sanFile ="A_Equip_BaoJian_DaiJi.san"; param_1_x = -0.169; param_1_y =-9.339; param_1_z = 2.874;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_NPC_Equip_BaoJian_XiuXian.san";
		},
		action = {{pfxId = 2090,bindPos ="tx1"},{pfxId = 2099,bindPos ="tx1"}},
		skillId = 70008,   --技能id
		skillType = "",
		--用于显示用的技能
		skillTbl = {
			[1] = 11011,
			[2] = 11014,
			[3] = 11012,
			[4] = 11013,
			[5] = 11015,
			[6] = 11016,          --无坚不裂 9阶 布甲图片
		},
		nextLadder = 9,
		level = 36,
	},	
	
	[10] = {
		name = "伽蓝",   --名称
		model = {
		--！！！紫电模型
		sknFile = "A_Equip_BaoJian_10.skn"; sklFile="A_Equip_BaoJian.skl"; sanFile ="A_Equip_BaoJian_DaiJi.san"; param_1_x = -0.169; param_1_y =-9.339; param_1_z = 2.874;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_NPC_Equip_BaoJian_XiuXian.san";
		},
		action = {{pfxId = 2100,bindPos ="tx1"},{pfxId = 2109,bindPos ="tx1"}},
		skillId = 70009,   --技能id
		skillType = "",
		--用于显示用的技能
		skillTbl = {
			[1] = 11011,
			[2] = 11014,
			[3] = 11012,
			[4] = 11013,
			[5] = 11015,
			[6] = 11016,		--无坚不裂 9阶 铁甲图片
		},
		nextLadder = 10,
		level = 40,
	},	
	
		
	[11] = {
		name = "龙渊",   --名称
		model = {
		--！！！紫电模型
		sknFile = "A_Equip_BaoJian_11.skn"; sklFile="A_Equip_BaoJian.skl"; sanFile ="A_Equip_BaoJian_DaiJi.san"; param_1_x = -0.169; param_1_y =-9.339; param_1_z = 2.874;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_NPC_Equip_BaoJian_XiuXian.san";
		},
		action = {{pfxId = 2110,bindPos ="tx1"},{pfxId = 2109,bindPos ="tx1"}},
		skillId = 70010,   --技能id
		skillType = "",
		--用于显示用的技能
		skillTbl = {
			[1] = 11011,
			[2] = 11014,
			[3] = 11012,
			[4] = 11013,
			[5] = 11015,
			[6] = 11016,		--无坚不裂 9阶 铁甲图片
			[7] = 11017,		--玄冥剑气 11阶
		},
		nextLadder = 11,
		level = 44,
	},
	
	[12] = {
		name = "腾空",   --名称
		model = {
		--！！！腾空模型
		sknFile = "A_NPC_Equip_BaoJian_12.skn"; sklFile="A_Equip_BaoJian.skl"; sanFile ="A_Equip_BaoJian_DaiJi.san"; param_1_x = -3; param_1_y =-9.339; param_1_z = 4;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_NPC_Equip_BaoJian_XiuXian.san";
		},
		action = {{pfxId = 2120,bindPos ="tx1"},{pfxId = 2129,bindPos ="tx1"}},
		skillId = 70010,   --技能id
		skillType = "",
		--用于显示用的技能
		skillTbl = {
			[1] = 11011,
			[2] = 11014,
			[3] = 11012,
			[4] = 11013,
			[5] = 11015,
			[6] = 11016,		--无坚不裂 9阶 铁甲图片
			[7] = 11017,		--玄冥剑气 11阶
		},
		nextLadder = 12,
		level = 48,
	},	
}	

--等级升级剑气  
--dwGas:剑气   dwAttackNum：攻击个数
_G.SwordLevelLimit = {

 [1] = {dwGas = 	800		, dwAttackNum = 2} , 
 [2] = {dwGas = 	1100	, dwAttackNum = 2} , 
 [3] = {dwGas = 	1350	, dwAttackNum = 2} , 
 [4] = {dwGas = 	1750	, dwAttackNum = 2} , 
 [5] = {dwGas = 	2300	, dwAttackNum = 3} , 
 [6] = {dwGas = 	3200	, dwAttackNum = 3} , 
 [7] = {dwGas = 	4200	, dwAttackNum = 3} , 
 [8] = {dwGas = 	5300	, dwAttackNum = 3} , 
 [9] = {dwGas = 	4700	, dwAttackNum = 4} , 
 [10] = {dwGas =	5600	 , dwAttackNum = 4} , 
 [11] = {dwGas =	6700	 , dwAttackNum = 4} , 
 [12] = {dwGas =	8000	 , dwAttackNum = 4} , 
 [13] = {dwGas =	8000	 , dwAttackNum = 5} , 
 [14] = {dwGas =	9000	 , dwAttackNum = 5} , 
 [15] = {dwGas =	10500	 , dwAttackNum = 5} , 
 [16] = {dwGas =	12500	 , dwAttackNum = 5} , 
 [17] = {dwGas =	15000	 , dwAttackNum = 6} , 
 [18] = {dwGas =	17000	 , dwAttackNum = 6} , 
 [19] = {dwGas =	21000	 , dwAttackNum = 6} , 
 [20] = {dwGas =	27000	 , dwAttackNum = 6} , 
 [21] = {dwGas =	30000	 , dwAttackNum = 7}, 
 [22] = {dwGas =	33000	 , dwAttackNum = 7}, 
 [23] = {dwGas =	39000	 , dwAttackNum = 7}, 
 [24] = {dwGas =	48000	 , dwAttackNum = 7}, 
 [25] = {dwGas =	40000	 , dwAttackNum = 8} , 
 [26] = {dwGas =	44000	 , dwAttackNum = 8} , 
 [27] = {dwGas =	52000	 , dwAttackNum = 8} , 
 [28] = {dwGas =	64000	 , dwAttackNum = 8} , 
 [29] = {dwGas =	50000	 , dwAttackNum = 9} , 
 [30] = {dwGas =	55000	 , dwAttackNum = 9} , 
 [31] = {dwGas =	65000	 , dwAttackNum = 9} , 
 [32] = {dwGas =	80000	 , dwAttackNum = 9} , 
 [33] = {dwGas =	60000	 , dwAttackNum = 10} , 
 [34] = {dwGas =	80000	 , dwAttackNum = 10} , 
 [35] = {dwGas =	90000	 , dwAttackNum = 10} , 
 [36] = {dwGas =	100000	 , dwAttackNum = 10} , 
 [37] = {dwGas =	70000	 , dwAttackNum = 11} , 
 [38] = {dwGas =	90000	 , dwAttackNum = 11} , 
 [39] = {dwGas =	110000	 , dwAttackNum = 11} , 
 [40] = {dwGas =	130000	 , dwAttackNum = 11} , 
--开11阶
 [41] = {dwGas =	140000	 , dwAttackNum = 12} , 
 [42] = {dwGas =	150000	 , dwAttackNum = 12} , 
 [43] = {dwGas =	160000	 , dwAttackNum = 12} , 
 [44] = {dwGas =	180000	 , dwAttackNum = 12} , 
 [45] = {dwGas =	190000	 , dwAttackNum = 13} , 
 [46] = {dwGas =	200000	 , dwAttackNum = 13} , 
 [47] = {dwGas =	210000	 , dwAttackNum = 13} , 
 [48] = {dwGas =	230000	 , dwAttackNum = 13} ,  
}

_G.SwordDataConfig = {
	--【swordInst】
	----获得等阶	swordInst:GetSwordLadder()
	----获得等级	swordInst:GetSwordLevel()
	----获得剑气	swordInst:GetSwordGas()
	--评分
	-- EquipGradeConfig = 
-- {
	-- dwAttack = 1.3;				--攻击力
	-- dwDefense = 1.05;			--防御力
	-- dwCrit = 0.8;				--暴击
	-- dwFlee = 0.7;				--身法
	-- dwAttackSpeed = 1;			--攻击速度
	-- dwMoveSpeed = 2;			--移动速度
	-- dwHPMax = 0.25;				--生命上限
	-- dwMPMax = 0.1;				--内力上限
	-- dwRemitAttack = 20;			--伤害减免
-- };
	MarkValue = function(swordInst)  --ladder:阶数, level:等级, swordgas:剑气

	local ladder=swordInst:GetSwordLadder()
	local lv=swordInst:GetSwordLevel()
	local dwRsl=0
	dwRsl=dwRsl+(SwordDataConfig.PropertyType_ablities_data[lv].dwAttack or 0)*EquipGradeConfig.dwAttack
	dwRsl=dwRsl+(SwordDataConfig.PropertyType_ablities_data[lv].dwDefense or 0)*EquipGradeConfig.dwDefense
	dwRsl=dwRsl+(SwordDataConfig.PropertyType_ablities_data[lv].dwCrit or 0)*EquipGradeConfig.dwCrit
	-- dwRsl=dwRsl+(SwordDataConfig.PropertyType_ablities_data[lv].dwFlee or 0)*EquipGradeConfig.dwFlee
	-- dwRsl=dwRsl+(SwordDataConfig.PropertyType_ablities_data[lv].dwAttackSpeed or 0)*EquipGradeConfig.dwAttackSpeed
	dwRsl=dwRsl+(SwordDataConfig.PropertyType_ablities_data[lv].dwHPMax or 0)*EquipGradeConfig.dwHPMax
	-- dwRsl=dwRsl+(SwordDataConfig.PropertyType_ablities_data[lv].dwMPMax or 0)*EquipGradeConfig.dwMPMax
	-- dwRsl=dwRsl+(SwordDataConfig.PropertyType_ablities_data[lv].dwRemitAttack or 0)*EquipGradeConfig.dwRemitAttack
	-- dwRsl=dwRsl+(SwordDataConfig.PropertyType_ablities_data[lv].dwAttack or 0)*EquipGradeConfig.dwAttack*SwordLevelLimit[lv].dwAttackNum*SwordDataConfig.AttackValue_DamageRet[lv]*SwordDataConfig.HappenRate_HappenRatedata[lv]
		return math.floor(dwRsl/5)*5;
	end;
	--攻击值
	AttackValue_DamageRet={
	[1]=0.3,
	[2]=0.33,
	[3]=0.36,
	[4]=0.39,
	[5]=0.42,
	[6]=0.45,
	[7]=0.48,
	[8]=0.51,
	[9]=0.54,
	[10]=0.57,
	[11]=0.60,
	[12]=0.63,
	[13]=0.66,
	[14]=0.69,
	[15]=0.72,
	[16]=0.75,
	[17]=0.78,
	[18]=0.81,
	[19]=0.84,
	[20]=0.87,
	[21]=0.90,
	[22]=0.93,
	[23]=0.96,
	[24]=0.99,
	[25]=1.02,
	[26]=1.05,
	[27]=1.08,
	[28]=1.11,
	[29]=1.14,
	[30]=1.17,
	[31]=1.20,
	[32]=1.23,
	[33]=1.26,
	[34]=1.29,
	[35]=1.32,
	[36]=1.35,
	[37]=1.38,
	[38]=1.41,
	[39]=1.44,
	[40]=1.47,
--开11阶
	[41]=1.5,
	[42]=1.53,
	[43]=1.56,
	[44]=1.59,
	[45]=1.62,
	[46]=1.65,
	[47]=1.68,
	[48]=1.71,	
	};
	
	AttackValue = function(attackValue, swordInst)  --attackValue:人物攻击力, ladder:阶数, level:等级
	local Level = swordInst:GetSwordLevel()
		return attackValue*_G.SwordDataConfig.AttackValue_DamageRet[Level]; 
	end;
	--触发几率(真实)
	HappenRate_HappenRatedata={
	[ 1 ] = 0.05 ,
	[ 2 ] = 0.05 ,
	[ 3 ] = 0.05 ,
	[ 4 ] = 0.05 ,
	[ 5 ] = 0.1 ,
	[ 6 ] = 0.1 ,
	[ 7 ] = 0.1,
	[ 8 ] = 0.1 ,
	[ 9 ] = 0.15 ,
	[ 10 ] = 0.15 ,
	[ 11 ] = 0.15 ,
	[ 12 ] = 0.15 ,
	[ 13 ] = 0.2 ,
	[ 14 ] = 0.2 ,
	[ 15 ] = 0.2 ,
	[ 16 ] = 0.2 ,
	[ 17 ] = 0.25 ,
	[ 18 ] = 0.25 ,
	[ 19 ] = 0.25 ,
	[ 20 ] = 0.25 ,
	[ 21 ] = 0.30 ,
	[ 22 ] = 0.30 ,
	[ 23 ] = 0.30 ,
	[ 24 ] = 0.30 ,
	[ 25 ] = 0.35 ,
	[ 26 ] = 0.35 ,
	[ 27 ] = 0.35 ,
	[ 28 ] = 0.35 ,
	[ 29 ] = 0.40 ,
	[ 30 ] = 0.40 ,
	[ 31 ] = 0.40 ,
	[ 32 ] = 0.40 ,
	[ 33 ] = 0.45 ,
	[ 34 ] = 0.45 ,
	[ 35 ] = 0.45 ,
	[ 36 ] = 0.45 ,
	[ 37 ] = 0.50 ,
	[ 38 ] = 0.50 ,
	[ 39 ] = 0.50 ,
	[ 40 ] = 0.50 ,
	--11阶
	[ 41 ] = 0.55 ,
	[ 42 ] = 0.55 ,
	[ 43 ] = 0.55 ,
	[ 44 ] = 0.55 ,
	[ 45 ] = 0.6 ,
	[ 46 ] = 0.6 ,
	[ 47 ] = 0.6 ,
	[ 48 ] = 0.6 ,	
	};
	HappenRate = function(swordInst)         --ladder:阶数, level:等级
	local Level = swordInst:GetSwordLevel()
		return _G.SwordDataConfig.HappenRate_HappenRatedata[Level]*10000;
	end;
	--触发几率(显示)
	ShowRate_HappenRateX={
	[ 1 ] = 0.05 ,
	[ 2 ] = 0.05 ,
	[ 3 ] = 0.05 ,
	[ 4 ] = 0.05 ,
	[ 5 ] = 0.1 ,
	[ 6 ] = 0.1 ,
	[ 7 ] = 0.1,
	[ 8 ] = 0.1 ,
	[ 9 ] = 0.15 ,
	[ 10 ] = 0.15 ,
	[ 11 ] = 0.15 ,
	[ 12 ] = 0.15 ,
	[ 13 ] = 0.2 ,
	[ 14 ] = 0.2 ,
	[ 15 ] = 0.2 ,
	[ 16 ] = 0.2 ,
	[ 17 ] = 0.25 ,
	[ 18 ] = 0.25 ,
	[ 19 ] = 0.25 ,
	[ 20 ] = 0.25 ,
	[ 21 ] = 0.30 ,
	[ 22 ] = 0.30 ,
	[ 23 ] = 0.30 ,
	[ 24 ] = 0.30 ,
	[ 25 ] = 0.35 ,
	[ 26 ] = 0.35 ,
	[ 27 ] = 0.35 ,
	[ 28 ] = 0.35 ,
	[ 29 ] = 0.40 ,
	[ 30 ] = 0.40 ,
	[ 31 ] = 0.40 ,
	[ 32 ] = 0.40 ,
	[ 33 ] = 0.45 ,
	[ 34 ] = 0.45 ,
	[ 35 ] = 0.45 ,
	[ 36 ] = 0.45 ,
	[ 37 ] = 0.50 ,
	[ 38 ] = 0.50 ,
	[ 39 ] = 0.50 ,
	[ 40 ] = 0.50 ,
	--11阶
	[ 41] = 0.55 ,
	[ 42 ] = 0.55 ,
	[ 43 ] = 0.55 ,
	[ 44 ] = 0.55 ,
	[45] = 0.6 ,
	[46] = 0.6 ,
	[47] = 0.6 ,
	[48] = 0.6 ,	
	};
	
	ShowRate = function(swordInst)            --ladder:阶数, level:等级
	local Level = swordInst:GetSwordLevel()
		return _G.SwordDataConfig.ShowRate_HappenRateX[Level]*10000;
	end;
	--升阶所需银两
	

	NeedGold_moneydata={
	[ 1 ] = 10000	,
	[ 2 ] = 20000	,
	[ 3 ] = 40000	,
	[ 4 ] = 60000	,
	[ 5 ] = 100000	,
	[ 6 ] = 200000	,
	[ 7 ] = 200000	,
	[ 8 ] = 220000	,       --8进9
	[ 9 ] = 250000	,		--9进10	
	--11阶---
	[ 10 ] = 300000	,		--9进10	
	[11] = 350000   ,       --10进11
	};
	NeedGold = function(swordInst)
	local Ladder = swordInst:GetSwordLadder()
	local money = _G.SwordDataConfig.NeedGold_moneydata[Ladder] or 1000;
		
		return money;
	end;
	--需要消耗的物品id
	StoneId = function(swordInst)
	local Ladder = swordInst:GetSwordLadder()
		if Ladder<=1 then return 4100010    --千纸鹤
		elseif	Ladder< 10 then return 4100110    --剑魂石
		else return 4100111    --剑魂玉 11阶升阶道具
		end;
	end;
	--各阶升阶所需道具数量
	NeedStone_stonedata={
		[1]=5,
		[2]=2,
		[3]=3,
		[4]=4,
		[5]=5,
		[6]=6,
		[7]=8,
		[8]=20,
		[9]=24,
		--11阶--
		[10]=10,
		[11]=12,
		};
		
	NeedStone = function(swordInst)
	local Ladder = swordInst:GetSwordLadder()
		local stone = _G.SwordDataConfig.NeedStone_stonedata[Ladder] or 1
		return stone;
	end;
	--升阶成功率
	SuccessRate_SuccessRateData ={
	[1]=0.5,
	[2]=0.25,
	[3]=0.25,
	[4]=0.2,
	[5]=0.1,
	[6]=0.1,
	[7]=0.06,
	[8]=0.03,
	[9]=0.02,
	--11阶  100/1000
	[10]=0.1,
	[11]=0.1
	};
	SuccessRate_tgValueData={

		[1]={[1]=6		,[2]=10		},
		[2]={[1]=45		,[2]=70  	},
		[3]={[1]=115	,[2]=150	},
		[4]={[1]=275	,[2]=350	},
		[5]={[1]=850	,[2]=1050	},
		[6]={[1]=2980	,[2]=3200	},
		[7]={[1]=8000	,[2]=8500	},
		[8]={[1]=10000	,[2]=11000	},   --8阶升9阶
		[9]={[1]=12000	,[2]=13000	},	--9阶进10
		[10]={[1]=18900	,[2]=19000	},	--10阶进11	
		[11]={[1]=20000	,[2]=21500	},	--11阶进12		
	};
	SuccessRate = function(swordInst, tgValue)   --ladder:阶数, level:等级, tgValue:天官赐福值
	local rate=0
	local Ladder = swordInst:GetSwordLadder()
	if tgValue< _G.SwordDataConfig.SuccessRate_tgValueData[Ladder][1] then
		rate=0
	elseif tgValue> _G.SwordDataConfig.SuccessRate_tgValueData[Ladder][2] then
		rate=10000
	else rate= _G.SwordDataConfig.SuccessRate_SuccessRateData[Ladder]*10000
	end
	
		return rate;
	end;  
	AddSwordGas = function(swordInst)
		return 1;
	end; 
	--dwHPMax	--生命max
	--dwMPMax	--内力max
	--dwAttack	--攻击
	--dwDefense --防御
	--dwFlee	--身法
	--dwCrit	--暴击
	--dwMoveSpeed   --移动速度
	PropertyType_ablities_data={
		[1]={dwAttack=70,dwDefense=35,dwHPMax=245,dwCrit=14,},
		[2]={dwAttack=80,dwDefense=40,dwHPMax=280,dwCrit=15,},
		[3]={dwAttack=90,dwDefense=45,dwHPMax=315,dwCrit=17,},
		[4]={dwAttack=100,dwDefense=50,dwHPMax=350,dwCrit=18,},
		[5]={dwAttack=290,dwDefense=145,dwHPMax=1015,dwCrit=52,},
		[6]={dwAttack=310,dwDefense=155,dwHPMax=1085,dwCrit=54,},
		[7]={dwAttack=330,dwDefense=165,dwHPMax=1155,dwCrit=57,},
		[8]={dwAttack=350,dwDefense=175,dwHPMax=1225,dwCrit=59,},
		[9]={dwAttack=610,dwDefense=305,dwHPMax=2135,dwCrit=101,},
		[10]={dwAttack=640,dwDefense=320,dwHPMax=2240,dwCrit=104,},
		[11]={dwAttack=670,dwDefense=335,dwHPMax=2345,dwCrit=106,},
		[12]={dwAttack=700,dwDefense=350,dwHPMax=2450,dwCrit=109,},
		[13]={dwAttack=1080,dwDefense=540,dwHPMax=3780,dwCrit=165,},
		[14]={dwAttack=1120,dwDefense=560,dwHPMax=3920,dwCrit=168,},
		[15]={dwAttack=1160,dwDefense=580,dwHPMax=4060,dwCrit=171,},
		[16]={dwAttack=1200,dwDefense=600,dwHPMax=4200,dwCrit=174,},
		[17]={dwAttack=1800,dwDefense=900,dwHPMax=6300,dwCrit=257,},
		[18]={dwAttack=1860,dwDefense=930,dwHPMax=6510,dwCrit=261,},
		[19]={dwAttack=1920,dwDefense=960,dwHPMax=6720,dwCrit=265,},
		[20]={dwAttack=1980,dwDefense=990,dwHPMax=6930,dwCrit=269,},
		[21]={dwAttack=3240,dwDefense=1620,dwHPMax=11340,dwCrit=434,},
		[22]={dwAttack=3320,dwDefense=1660,dwHPMax=11620,dwCrit=438,},
		[23]={dwAttack=3400,dwDefense=1700,dwHPMax=11900,dwCrit=441,},
		[24]={dwAttack=3480,dwDefense=1740,dwHPMax=12180,dwCrit=445,},
		[25]={dwAttack=5500,dwDefense=2750,dwHPMax=19250,dwCrit=693,},
		[26]={dwAttack=5600,dwDefense=2800,dwHPMax=19600,dwCrit=695,},
		[27]={dwAttack=5700,dwDefense=2850,dwHPMax=19950,dwCrit=697,},
		[28]={dwAttack=5800,dwDefense=2900,dwHPMax=20300,dwCrit=699,},
		[29]={dwAttack=8350,dwDefense=4175,dwHPMax=29225,dwCrit=993,},
		[30]={dwAttack=8500,dwDefense=4250,dwHPMax=29750,dwCrit=997,},
		[31]={dwAttack=8650,dwDefense=4325,dwHPMax=30275,dwCrit=1000,},
		[32]={dwAttack=8800,dwDefense=4400,dwHPMax=30800,dwCrit=1004,},
		[33]={dwAttack=12100,dwDefense=6050,dwHPMax=42350,dwCrit=1331,},
		[34]={dwAttack=12300,dwDefense=6150,dwHPMax=43050,dwCrit=1335,},
		[35]={dwAttack=12500,dwDefense=6250,dwHPMax=43750,dwCrit=1339,},
		[36]={dwAttack=12700,dwDefense=6350,dwHPMax=44450,dwCrit=1343,},
		[37]={dwAttack=16700,dwDefense=8350,dwHPMax=58450,dwCrit=1837,},
		[38]={dwAttack=17000,dwDefense=8500,dwHPMax=59500,dwCrit=1841,},
		[39]={dwAttack=17300,dwDefense=8650,dwHPMax=60550,dwCrit=1845,},
		[40]={dwAttack=17600,dwDefense=8800,dwHPMax=61600,dwCrit=1849,},
		--11阶
		[41]={dwAttack=30100,dwDefense=16300,dwHPMax=124100,dwCrit=3099,},
		[42]={dwAttack=31100,dwDefense=16900,dwHPMax=129100,dwCrit=3199,},
		[43]={dwAttack=32100,dwDefense=17500,dwHPMax=134100,dwCrit=3299,},
		[44]={dwAttack=33100,dwDefense=18100,dwHPMax=139100,dwCrit=3399,},
		[45]={dwAttack=48500,dwDefense=31500,dwHPMax=265200,dwCrit=4550,},
		[46]={dwAttack=49500,dwDefense=32800,dwHPMax=270200,dwCrit=4650,},
		[47]={dwAttack=50500,dwDefense=34100,dwHPMax=275200,dwCrit=4750,},
		[48]={dwAttack=51500,dwDefense=35500,dwHPMax=280200,dwCrit=4850,},		
	};
	PropertyType = function(swordInst)
	local Ladder = swordInst:GetSwordLevel()
		local tbl = _G.SwordDataConfig.PropertyType_ablities_data[Ladder];
		local tb = {};
		for k,v in pairs(tbl)do
			tb[k] = v
		end
		return tb
	end;
	AvatarRect	= {x = 500, y = 500};
	--成功率显示
	SuccessStrdata={
	[1]="中",
	[2]="中",
	[3]="低",
	[4]="很低",
	[5]="很低",
	[6]="极低",
	[7]="极低",
	[8]="极低",
	[9]="极低",
	--11阶
	[10]="极低",
	[11]="极低"
	},
	
	SuccessStr = function(swordInst)
	local Ladder = swordInst:GetSwordLadder()
		local str = "";
		str=_G.SwordDataConfig.SuccessStrdata[Ladder]
		return str;
	end;
	
	AddExp 	= function(swordInst, nPlayerLevel)
		local nExp 	= nPlayerLevel * (nPlayerLevel*(5+nPlayerLevel/20) *0.2);
	return math.floor(nExp)	;
	end	;
	----特殊属性卡片ID
	PropertyCardItemID = function()
		local itemID = 5509001;
		return itemID;
	end;
	-----激活特殊卡片消耗材料信息
	ActProCardConInfo = function()
		local conInfo = {itemID = 4100110,itemNum = 2000};
		return conInfo;
	end;
	
	-----特殊卡片属性加成
	AddProCardAttr = function()
		local t_attr = _G.SSingleAttrChange:new();
		t_attr.dwAttack = 4000;
		t_attr.dwDefense= 2000;
		t_attr.dwHPMax= 30000;
		t_attr.dwCrit= 500;
		return t_attr;
	end;
	----卡片评分
	CardMarkValue = function()
		local dwRsl=0
		dwRsl=dwRsl+(SwordDataConfig.AddProCardAttr().dwAttack or 0)*EquipGradeConfig.dwAttack
		dwRsl=dwRsl+(SwordDataConfig.AddProCardAttr().dwDefense or 0)*EquipGradeConfig.dwDefense
		dwRsl=dwRsl+(SwordDataConfig.AddProCardAttr().dwCrit or 0)*EquipGradeConfig.dwCrit
		dwRsl=dwRsl+(SwordDataConfig.AddProCardAttr().dwHPMax or 0)*EquipGradeConfig.dwHPMax
		return math.floor(dwRsl/5)*5;
	end;
	--卡片配置
	PropertyCard = {
						IsNoCan1 = "已经激活！"; --激活后点击提示
						IsNoCan2 = "所需道具不足";--材料不足的提示
						szName   = "<font size='18' color='#B032EE'>剑气·流血</font>";
						IsActive1 = "<font size='10' color='#afafaf'>未激活";
						IsActive2 = "<font size='10' color='#f15d27'>已激活";
						Icon1     = "Icon_BaoJian_atkspd07_0.png";  	--未激活图标	
						Icon2	  = "Icon_BaoJian_atkspd07_1.png";		--激活图标
						Level	  = "1";				--等级
						SkillType = "【被动技能】";				--技能状态"
						Active1   = "<font size='12' color='#f15d27'>激活方式：点击图标</font><br/><font size='12' color='#f15d27'>激活材料：</font><font size='12' color='#FFFFFF'>剑魂石×2000</font>"; --未激活状态
						Active2   = "";										       --激活状态
						Nengli    = "<font color='#FFFF00'>触发名剑效果时<font color='#00FF00'>在一定时间内每秒减少敌方3%最大血量</font>，名剑等级影响触发几率</font><font color='#FF0000'>(伤害不超过角色攻击力)</font><br/>额外属性：<br/><font color='#00FF00'>暴击 500</font><br/><font color='#00FF00'>防御 2000</font><br/><font color='#00FF00'>生命 30000</font><br/><font color='#00FF00'>攻击 4000</font>";    --激活状态
	};
}

_G.DesConfig = {
	["descript"] = "<p>1.在您获得名剑后，在战斗过程中，名剑会自动触发使用。<br/>2. 每次触发使用名剑时，剑气均会增加，当剑气满值时，将会自动提升名剑等级。<br/>3. 当名剑等级满级后，才能继续升阶到下一阶段</p>",
	["history"] = {
		[1] = "<p align = 'center'><font size='14' color='#DCB857'>名剑来历</font></p><p>  昔年吴王阖闾使专诸刺吴王僚所用之宝剑。此剑剑身短小，可藏于鱼腹，然其“逆理不顺，不可服也，臣以弑君，子以杀父”，天生不祥，故虽锋利，但多藏秘处，人罕见之。</p>",
		[2] = "<p align = 'center'><font size='14' color='#DCB857'>名剑来历</font></p><p>  欧冶子所铸六剑之一。初为战国时的赵国以重金购得，后落入秦将白起之手。秦亡之后，此剑失踪。机缘之下，于今重见天日，锋芒不减，饮血后虹光更胜。</p>",
		[3] = "<p align = 'center'><font size='14' color='#DCB857'>名剑来历</font></p><p>  汉高祖微时所得神铁铸成，后以此剑斩白蛇起义，立不世之功，是为王者霸道之剑。剑上有七采珠、九华玉为饰，剑刃常若霜雪，光彩射人。</p>",
		[4] = "<p align = 'center'><font size='14' color='#DCB857'>名剑来历</font></p><p>  三国时吴帝孙权所藏，不知何人所铸。相传吴帝出巡，某夜见东方山谷中紫气如华，翌日遣人寻至紫气聚集之地，掘土十丈，晴天忽而霹雳，天火降，宝剑出。</p>",
		[5] = "<p align = 'center'><font size='14' color='#DCB857'>名剑来历</font></p><p>  欧冶子所铸六剑之一。因其剑身常泛青光，凛然如霜雪，故得此名。此剑剑气冷冽，剑气过体，如置冰窟，非常人所能承受。</p>",
		[6] = "<p align = 'center'><font size='14' color='#DCB857'>名剑来历</font></p><p>  欧冶子所铸六剑之一。此剑钝而厚重，但剑身坚不可摧，出鞘时，剑气四溢而浑厚，杀气腾腾而磅礴，无锋而胜，大巧不工，乃旷世利器。</p>",
		[7] = "<p align = 'center'><font size='14' color='#DCB857'>名剑来历</font></p><p>  相传越王勾践以白马白牛祀昆吾之神，从昆吾山采精金铸冶八剑，此剑即为其中之一。据晋王嘉《拾遗记》记载：越王八剑，威不可挡，鬼神共忌。转魄出鞘，以之指月，可令蟾兔为之倒转，非人间之器也。</p>",
		[8] = "<p align = 'center'><font size='14' color='#DCB857'>名剑来历</font></p><p>  上古十大名剑之一。传说为欧冶子与干将两大铸剑名师联手所造，楚国镇国至宝。此剑出时，如呼百兽，似挟飓风，楚王曾以此剑之磅礴剑气退去晋国围城之大军，挽倾国之危。</p>",
		[9] = "<p align = 'center'><font size='14' color='#DCB857'>名剑来历</font></p><p>  欧冶子奉越王命于湛卢山辟地设炉，历时三载铸成此剑。湛卢出鞘，精光贯天，日月争耀，星斗避彩，鬼神悲号。湛卢剑为仁者之剑，无坚不摧而不带杀气。岳飞生前曾佩戴此剑，风波亭事发后，此剑不知去向。</p>",
		[10] = "<p align = 'center'><font size='14' color='#DCB857'>名剑来历</font></p><p>  万载菩提木所制，坚逾金钢，可避百邪，任何神刃亦无法损伤分毫；传言需九世修行方知此剑之神通，于心怀世俗者眼中不过一条枯枝。伽蓝出鞘时，先有黑云盖顶，而后佛光满地，天地变色，日月无光，神魔皆逃。越女阿青曾持此剑，教三千吴士狼狈而逃。</p>",
		[11] = "<p align = 'center'><font size='14' color='#DCB857'>名剑来历</font></p><p>  上古十大名剑之一。传说欧冶子为铸此剑，凿开茨山，引山中寒泉而入剑池，是名“七星”；俯视剑身，如同登高山而望深渊，飘渺深邃，剑气磅礴凝重，犹如巨龙盘卧，是名“龙渊”。故名此剑曰“七星龙渊”，简称“龙渊”。</p>",
		[12] = "<p align = 'center'><font size='14' color='#DCB857'>名剑来历</font></p><p>  上古人皇颛顼氏所有。《拾遗记》载曰：“颛顼高阳氏有此剑，若四方有兵，以此剑飞赴指其方则克”，在匣中常如龙吟虎啸，闻之丧胆。”。</p>",
		},
}

_G.DoLieActionTime = 20 * 1000;   --20秒

_G.SkillShowInfo = {
	[1] = {skillId = 11011, img = "Icon_BaoJian_atkspd04_1.png", grayImg = "Icon_BaoJian_atkspd04_0.png" , des = "<font color='#FFFF00'>触发名剑效果时<font color='#00FF00'>降低敌方50%身法</font>，名剑等级影响触发几率</font>", name = "<font color='#03B3FD'>剑气·断骨</font>", enableMethod = "<font size='12' color='#f15d27'>激活条件：赤霄</font>"},
	[2] = {skillId = 11014, img = "Icon_BaoJian_atkspd05_1.png", grayImg = "Icon_BaoJian_atkspd05_0.png" ,des = "<font color='#FFFF00'>触发名剑效果时<font color='#00FF00'>降低敌方50%暴击</font>，名剑等级影响触发几率</font>", name = "<font color='#03B3FD'>剑气·悬心</font>", enableMethod = "<font size='12' color='#f15d27'>激活条件：紫电</font>"},
	[3] = {skillId = 11012, img = "Icon_BaoJian_movspd05_1.png", grayImg = "Icon_BaoJian_movspd05_0.png" ,des = "<font color='#FFFF00'>触发名剑效果时<font color='#00FF00'>降低敌方50%移动速度</font>，名剑等级影响触发几率</font>", name = "<font color='#B032EE'>剑气·灼魂</font>", enableMethod = "<font size='12' color='#f15d27'>激活条件：青霜</font>"},
	[4] = {skillId = 11013, img = "Icon_BaoJian_atkspd06_1.png", grayImg = "Icon_BaoJian_atkspd06_0.png" ,des = "<font color='#FFFF00'>触发名剑效果时<font color='#00FF00'>一定时间内持续对敌方造成多次伤害</font>，名剑等级影响持续伤害、触发几率</font>", name = "<font color='#B032EE'>剑气·饮恨</font>", enableMethod = "<font size='12' color='#f15d27'>激活条件：巨阙</font>"},
	[5] = {skillId = 11015, img = "SK_Baojian_yijianfenghou_1.png",  grayImg = "SK_Baojian_yijianfenghou_0.png" ,des = "<font color='#FFFF00'>有一定几率<font color='#00FF00'>造成5倍(八阶以上可造成10倍)</font>名剑伤害</font>", name = "<font color='#FFFF00'>一剑封喉</font>", enableMethod = "<font size='12' color='#f15d27'>激活条件：转魄</font>"},
	[6] = {skillId = 11016, img = "Icon_BaoJian_breach10_1.png",  grayImg = "Icon_BaoJian_breach10_0.png" ,des = "<font color='#FFFF00'>触发名剑效果时<font color='#00FF00'>使敌方在一定时间内所受伤害增加60%(十阶以上增加120%)</font>，名剑等级影响触发几率</font><p><font color='#afafaf'>(该效果仅对玩家有效)</font>", name = "<font color='#FFFF00'>无坚不裂</font>", enableMethod = "<font size='12' color='#f15d27'>激活条件：湛卢</font>"},
	--11阶
	[7] = {skillId = 11017, img = "Icon_BaoJian_hp07_1.png",  grayImg = "Icon_BaoJian_hp07_0.png" ,des = "<font color='#FFFF00'>触发名剑效果时<font color='#00FF00'>增加自身10%攻击力</font>，名剑等级影响触发几率</font>", name = "<font color='#FFFF00'>龙渊剑气</font>", enableMethod = "<font size='12' color='#f15d27'>激活条件：龙渊</font>"},
	}

_G.WasteLiJing = true;   ---true:只使用元宝， false:使用元宝，礼金

-- 资质配置
_G.SwordAptitudeConfig = {

    -- @brief 获取消耗
    -- @param number dwAptitude 精炼值
    -- @return table 消耗
    -- {}
    GetConsume = function(dwAptitude)
       return SwordAptitudeConfig.Data.Consume;
    end;

	-- @brief 获取资质底图配置
    -- @param number dwAptitude 精炼值
    -- @return number 底图帧数  紫色1 蓝色2 绿色3 红色4
	GetLevelImg = function(dwAptitude)
		local Num = 1                   --底图帧
		if dwAptitude < 120 then        
			Num = 3						
		elseif dwAptitude < 1350 then
			Num = 2						
		elseif dwAptitude < 2150 then	
			Num = 1						
		else
			Num = 4	
		end
		return Num;
	end;
    -- @brief 获取次数上限
    -- @param number dwLevel 名剑等级
    -- @return number 次数
    GetMaxDegree = function (dwLevel)
        return SwordAptitudeConfig.CiShu[dwLevel];
    end;

	-- @brief 是否拥有精炼功能
    -- @param number dwLevel 宝甲等级
    -- @return bool  true 拥有 flase 没有
	
    IsHave = function (dwLevel)
		if dwLevel < 1 then
			return false
		end
        return true;
    end;

    -- @brief 获取增长属性
    -- @param number dwAptitude 资质值
    -- @return table 属性
    -- {}
    GetProperty = function (dwAptitude)
        local setResult = {};
        for k, v in pairs(SwordAptitudeConfig.Data.AppendProperty) do
           setResult[k] = v * dwAptitude;
        end
        return setResult;
    end;

    -- @brief 是否可以精炼
    -- @param object objSystem 系统对象
	-- @param table setParam 参数表
	--      {
	--          消耗道具标识符;    数量; 宝甲等阶
	--          dwItemID;	dwNum  ; dwLevel ;
	--      }
    -- @return boolean 是否可以精炼
    CanDo = function (objSystem,setParam)
        if SwordAptitudeConfig.IsHave(setParam.dwLevel) == false then
           return SwordAptitudeConfig.Info.NotHasAuthority;
        end
        if objSystem:IsFull() == true then
            return SwordAptitudeConfig.Info.Full;
        end
        if objSystem:IsCanDeleteItem({setParam.dwItemID, setParam.dwNum}) == 
            false then
            return SwordAptitudeConfig.Info.NotEnoughConsume;
        end
        return SwordAptitudeConfig.Info.IsCan;
    end;

    -- @breif 精炼
    -- @param object objSystem 系统对象
    Do = function (objSystem, setParam)
        objSystem:DeleteItem({setParam.dwItemID, setParam.dwNum});
        objSystem:SetAptitude(objSystem:GetAptitude() + setParam.nCount);
    end;

    -- 资质数据
    Data = {
        --消耗信息配置 dwItemID：物品ID, dwNum 物品数量
        Consume = {dwItemID = 4100454; dwNum = 10;};
        --精炼一次增加的属性+攻击 +防御 +生命 +身法
        AppendProperty = {dwAttack = 100; dwDefense = 50; dwHPMax = 500; };
    };
	----每阶铸造的次数
	CiShu = {
			[1] = 2;
			[2] = 5;
			[3] = 10;
			[4] = 20;
			[5] = 40;
			[6] = 80;
			[7] = 120;
			[8] = 240;
			[9] = 300;
			[10] = 400;
			[11] = 500;
			[12] = 700;
	};
    -- 信息配置
    Info = {
			IsCan = 0;
			NotHasAuthority = 1;
			Full			= 2;
			NotEnoughConsume = 3;
			
	};
	   -- 界面配置
    UI = {
            --精炼按钮tips表述
			BtnTips = "<font color='#4daeed'>点击按钮进行精炼</font><br/><font color='#4daeed'>消耗%s增加精炼属性</font>"; 
			BtnTips1= "%sX%d" ;
			BtnTips2= "<font color='#FF0000'>精炼次数已达本阶上限</font>" ; -- 满级tips 红
			IsEnough		= "<font color='#00FF00'>%s</font>";	--物品充足 绿
			IsNoEnough		= "<font color='#FF0000'>%s</font>";	--物品不足 红
            --精炼图形tips表述
			ImgTips = "<font color='#4daeed'>已精炼次数：</font><font color='#00FF00'>%s</font><br/>";
			ImgTips1 = "<br/><font color='#4daeed'>下阶最大精炼次数：%d</font>";
			ImgTips2 = "<br/><font color ='#FFFF00'>精炼属性加成"; 
			IsNoCan1 = "精炼条件不足！"; --宝甲精炼未满足条件
			IsNoCan2 = "精炼次数已达本阶上限！"; --当前等阶宝甲精炼已满
			IsNoCan3 = "所需道具不足！"; --宝甲精炼物品不足
			IsNoCan4 = "精炼失败！请稍后再试";
			IsSuccess = "精炼成功！"; -- 精炼成功
			Shunxu = {"dwHPMax";"dwAttack";"dwDefense";}; --属性顺序显示
			ProperyName 	= { 																--TIPS属性字符串
						dwHPMax 		= "生命 + ";
						dwAttack 		= "攻击 + "; 
						dwDefense 		= "防御 + ";				
			};
	};
};