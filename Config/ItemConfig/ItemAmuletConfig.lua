--护身宝甲窗口枚举
_G.enAmuletWnd = 
{
	eIntensify	= 1,
	eUpgrade	= 2,
}

--护身宝甲消耗枚举
_G.enAmuletCost = 
{
	eStone		= 1,
	eMoney		= 2,
	eBindGold	= 3,
	eGold		= 4,
}

--护身宝甲ID
--_G.dwAmuletID = 1500010;

--宝甲系统名字
_G.AmuletName = '护身宝甲'

--按钮名变动
_G.AmuletStartBtnName = { rongliang = '宝甲熔炼', shengjie = '宝甲升阶' }
_G.AmuletUpgradeAutoBtnName = { start = '自动升阶',stop = '停止自动' }

--护身宝甲评分公式
_G.AmuletScoreFunction = function(dwLevel,dwRank,dwGrowthValue,dwAmuletInlayLevel)
	local dwScore = 0
	--基础属性+当前溶解属性
	--当前溶解攻击力=最小攻击力 + (最大攻击力 - 最小攻击力)*（当前溶解度/当前级别溶解度）	

	local InlayConfig = AmuletInlayConfig.Data[dwAmuletInlayLevel] or {};
	dwScore = dwScore+(AmuletLevelPropertyConfig[dwLevel].dwAttack + (AmuletRankConfig[dwRank].dwAttackMin + (AmuletRankConfig[dwRank].dwAttackMax - AmuletRankConfig[dwRank].dwAttackMin) * dwGrowthValue / AmuletRankConfig[dwRank].dwMaxGrowth))*EquipGradeConfig.dwAttack + (InlayConfig.Attack or 0);
	dwScore = dwScore+(AmuletLevelPropertyConfig[dwLevel].dwDefense + (AmuletRankConfig[dwRank].dwDefenseMin + (AmuletRankConfig[dwRank].dwDefenseMax - AmuletRankConfig[dwRank].dwDefenseMin) * dwGrowthValue/ AmuletRankConfig[dwRank].dwMaxGrowth))*EquipGradeConfig.dwDefense + (InlayConfig.Defense or 0);
	dwScore = dwScore+(AmuletLevelPropertyConfig[dwLevel].dwHPMax +  (AmuletRankConfig[dwRank].dwHPMaxMin + (AmuletRankConfig[dwRank].dwHPMaxMax - AmuletRankConfig[dwRank].dwHPMaxMin) * dwGrowthValue / AmuletRankConfig[dwRank].dwMaxGrowth))*EquipGradeConfig.dwHPMax + (InlayConfig.HPMax or 0);
	dwScore = dwScore+(AmuletLevelPropertyConfig[dwLevel].dwFlee + (AmuletRankConfig[dwRank].dwFleeMin + (AmuletRankConfig[dwRank].dwFleeMax - AmuletRankConfig[dwRank].dwFleeMin) * dwGrowthValue  / AmuletRankConfig[dwRank].dwMaxGrowth))*EquipGradeConfig.dwFlee + (InlayConfig.Flee or 0);

	return math.floor(dwScore);
end;

--宝甲显示技能
_G.FSkillShowInfo = {
	szAllSkillType = "被动技能",

	[1] = {ID = 11011, img = "Icon_Buff_9005_1.png",szActivate = "<font size='12' color='#f15d27'>激活条件：柔藤背心</font>", grayImg = "Icon_Buff_9005_0.png", des = "<font color='#FFFF00'>触发宝甲效果时有一定几率<font color='#00FF00'>抵御名剑剑气·断骨</font>效果</font>", name = "<font color='#03B3FD'>抵御·断骨</font>", rate = 0.1},
	[2] = {ID = 11014, img = "Icon_Buff_9006_1.png", szActivate = "<font size='12' color='#f15d27'>激活条件：蟒鳞软甲</font>",grayImg = "Icon_Buff_9006_0.png", des = "<font color='#FFFF00'>触发宝甲效果时有一定几率<font color='#00FF00'>抵御名剑剑气·悬心</font>效果</font>", name = "<font color='#03B3FD'>抵御·悬心</font>", rate = 0.1},
	[3] = {ID = 11012, img = "Icon_Buff_1014_1.png",szActivate = "<font size='12' color='#f15d27'>激活条件：荆棘护镜</font>", grayImg = "Icon_Buff_1014_0.png", des = "<font color='#FFFF00'>触发宝甲效果时有一定几率<font color='#00FF00'>抵御名剑剑气·灼魂</font>效果</font>", name = "<font color='#B032EE'>抵御·灼魂</font>", rate = 0.1},
	[4] = {ID = 11013, img = "Icon_Buff_9006_1.png", szActivate = "<font size='12' color='#f15d27'>激活条件：含沙射影</font>",grayImg = "Icon_Buff_9006_0.png", des = "<font color='#FFFF00'>触发宝甲效果时有一定几率<font color='#00FF00'>抵御名剑剑气·饮恨</font>效果</font>", name = "<font color='#B032EE'>抵御·饮恨</font>", rate = 0.1},
	[5] = {ID = 11015, img = "Icon_Buff_9002_1.png", szActivate = "<font size='12' color='#f15d27'>激活条件：软猬甲</font>",grayImg = "Icon_Buff_9002_0.png", des = "<font color='#FFFF00'>触发宝甲效果时<font color='#00FF00'>抵御名剑剑气·一剑封喉</font>50%伤害（八阶以上可抵消75%伤害）</font>", name = "<font color='#FFFF00'>抵御·封喉</font>", rate = 1},
	[6] = {ID = 11016, img = "Icon_BaoJia_atkspd09_1.png", szActivate = "<font size='12' color='#f15d27'>激活条件：狻猊铠</font>",grayImg = "Icon_BaoJia_atkspd09_0.png", des = "<font color='#FFFF00'>触发宝甲效果时有10%几率<font color='#00FF00'>抵御名剑剑气·无坚不裂</font>效果（十阶以上20%几率抵御）</font>", name = "<font color='#FFFF00'>抵御·坚裂</font>", rate = 0},
	[7] = {ID = 11017, img = "Icon_Buff_9001_1.png", szActivate = "<font size='12' color='#f15d27'>激活条件：蚩尤天衣</font>",grayImg = "Icon_Buff_9001_0.png", des = "<font color='#FFFF00'>触发宝甲效果时有一定几率<font color='#00FF00'>增加5000点伤害抵御</font><p><font color='#afafaf'>(该效果仅由名剑伤害触发)</font>", name = "<font color='#FFFF00'>蚩尤护体</font>", rate = 0.1},
	--下面这个必须有，但没实际用处，
	[8] = {ID = 11018, img = "Icon_Buff_9004_1.png", szActivate = "<font size='12' color='#f15d27'>激活条件：狻猊铠</font>",grayImg = "Icon_Buff_9004_0.png", des = "<font color='#FFFF00'>触发宝甲效果时有一定几率<font color='#00FF00'>抵御名剑剑气·玄冥剑气</font>效果（十阶20%几率抵抗）</font>", name = "<font color='#FFFF00'>抵御·玄冥</font>", rate = 0.2},
	}


--宝甲阶级配置 
_G.AmuletLevelConfig =
{
	szUIType = 'UISword',		--模型配置

	eDescribeProperty = {strAttack = '攻击 ',strDefence = '防御 ',strShenfa = '身法 ',strHPMax = '生命 ',},			--显示的属性名
	
	szShow = '未达成',
	[1] = {strLevel = '一阶',strName = '乌蚕衣',dwMaxRank = 4, strSkillDecribe = "抵御名剑伤害：LV1...",				--阶级名，宝甲名，最大该阶等级，技能描述
--			dwBaseAttack = 1,dwBaseDefence = 2,dwBaseShenFa = 3,dwSubDamage = 4,										--基础属性
			model = {	
					sknFile = "A_Equip_BaoJia_01.skn"; sklFile="A_Equip_BaoJia.skl"; sanFile ="A_Equip_BaoJia_DaiJi.san"; param_1_x = -0.1; param_1_y =-7.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_BaoJia_XiuXian.san";AvatarRect = {x = 1024, y = 1024}; 
					},																									--模型
			action = {{pfxId = 2510,bindPos ="dummy01"}},																	--模型动作
			skillShowInfo = 
			{
			[1] = 80000,
			}																					--拥有技能
			},

			
	[2] = {strLevel = '二阶',strName = '鲛绡衣',dwMaxRank = 8, strSkillDecribe = "",
--			dwBaseAttack = 10,dwBaseDefence = 20,dwBaseShenFa = 30,dwSubDamage = 40,
			model = {
					sknFile = "A_Equip_BaoJia_02.skn"; sklFile="A_Equip_BaoJia.skl"; sanFile ="A_Equip_BaoJia_DaiJi.san";  param_1_x = -0.1; param_1_y =-7.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_BaoJia_XiuXian.san";AvatarRect = {x = 1024, y = 1024};
					},
			action = {{pfxId = 2520,bindPos ="dummy01"}}, 
			skillShowInfo = {
			[1] = 80001,
			}	
			},
			
			
	[3] = {strLevel = '三阶',strName = '柔藤背心',dwMaxRank = 12, strSkillDecribe = "",
--			dwBaseAttack = 1,dwBaseDefence = 2,dwBaseShenFa = 3,dwSubDamage = 4,
			model = {
					sknFile = "A_Equip_BaoJia_03.skn"; sklFile="A_Equip_BaoJia.skl"; sanFile ="A_Equip_BaoJia_DaiJi.san"; param_1_x = -0.1; param_1_y =-7.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;  lieAction = "A_Equip_BaoJia_XiuXian.san";AvatarRect = {x = 1024, y = 1024};
					},
			action = {{pfxId = 2530,bindPos ="dummy01"}},
			skillShowInfo = {
			[1] = 80002,
			[2] = 11011,
			}
			},
			
	[4] = {strLevel = '四阶',strName = '蟒鳞软甲',dwMaxRank = 16, strSkillDecribe = "",
--			dwBaseAttack = 1,dwBaseDefence = 2,dwBaseShenFa = 3,dwSubDamage = 4,
			model = {
					sknFile = "A_Equip_BaoJia_04.skn"; sklFile="A_Equip_BaoJia.skl"; sanFile ="A_Equip_BaoJia_DaiJi.san"; param_1_x = -0.1; param_1_y =-7.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;  lieAction = "A_Equip_BaoJia_XiuXian.san";AvatarRect = {x = 1024, y = 1024};
					},
			action = {{pfxId = 2540,bindPos ="dummy01"}},
			skillShowInfo = {
			[1] = 80003,
			[2] = 11011,
			[3] = 11014,
			}
			},
			
	[5] = {strLevel = '五阶',strName = '荆棘护镜',dwMaxRank = 20, strSkillDecribe = "",
--			dwBaseAttack = 1,dwBaseDefence = 2,dwBaseShenFa = 3,dwSubDamage = 4,
			model = {
					sknFile = "A_Equip_BaoJia_05.skn"; sklFile="A_Equip_BaoJia.skl"; sanFile ="A_Equip_BaoJia_DaiJi.san"; param_1_x = -0.1; param_1_y =-7.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;  lieAction = "A_Equip_BaoJia_XiuXian.san";AvatarRect = {x = 1024, y = 1024};
					},
			action = {{pfxId = 2550,bindPos ="dummy01"}},
			skillShowInfo = {
			[1] = 80004,
			[2] = 11011,
			[3] = 11014,
			[4] = 11012,
			
			}
			},	
			
	[6] = {strLevel = '六阶',strName = '含沙射影',dwMaxRank = 24, strSkillDecribe = "",
--			dwBaseAttack = 1,dwBaseDefence = 2,dwBaseShenFa = 3,dwSubDamage = 4,
			model = {
					sknFile = "A_Equip_BaoJia_06.skn"; sklFile="A_Equip_BaoJia.skl"; sanFile ="A_Equip_BaoJia_DaiJi.san";  param_1_x = -0.1; param_1_y =-7.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;  lieAction = "A_Equip_BaoJia_XiuXian.san";AvatarRect = {x = 1024, y = 1024};
					},
			action = {{pfxId = 2560,bindPos ="dummy01"}},
			skillShowInfo = {
			[1] = 80005,
			[2] = 11011,
			[3] = 11014,
			[4] = 11012,
			[5] = 11013,
			
			}
			},
			
	[7] = {strLevel = '七阶',strName = '软猬甲',dwMaxRank = 28, strSkillDecribe = "",
--			dwBaseAttack = 1,dwBaseDefence = 2,dwBaseShenFa = 3,dwSubDamage = 4,
			model = {
					sknFile = "A_Equip_BaoJia_07.skn"; sklFile="A_Equip_BaoJia.skl"; sanFile ="A_Equip_BaoJia_DaiJi.san";  param_1_x = -0.1; param_1_y =-7.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;  lieAction = "A_Equip_BaoJia_XiuXian.san";AvatarRect = {x = 1024, y = 1024};
					},
			action = {{pfxId = 2570,bindPos ="dummy01"}},
			skillShowInfo = {
			[1] = 80006,
			[2] = 11011,
			[3] = 11014,
			[4] = 11012,
			[5] = 11013,
			[6] = 11015,
			}
			},	 
	[8] = {strLevel = '八阶',strName = '金丝铠甲',dwMaxRank = 32, strSkillDecribe = "",
--			dwBaseAttack = 1,dwBaseDefence = 2,dwBaseShenFa = 3,dwSubDamage = 4,
			model = {
					sknFile = "A_Equip_BaoJia_08.skn"; sklFile="A_Equip_BaoJia.skl"; sanFile ="A_Equip_BaoJia_DaiJi.san";  param_1_x = -0.1; param_1_y =-7.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;  lieAction = "A_Equip_BaoJia_XiuXian.san";AvatarRect = {x = 1024, y = 1024};
					},
			action = {{pfxId = 2580,bindPos ="dummy01"}},
			skillShowInfo = {
			[1] = 80007,
			[2] = 11011,
			[3] = 11014,
			[4] = 11012,
			[5] = 11013,
			[6] = 11015,
			};
			},	
---------------
	[9] = {strLevel = '九阶',strName = '狻猊铠',dwMaxRank = 36, strSkillDecribe = "",
--			dwBaseAttack = 1,dwBaseDefence = 2,dwBaseShenFa = 3,dwSubDamage = 4,
			model = {
					sknFile = "A_Equip_BaoJia_09.skn"; sklFile="A_Equip_BaoJia.skl"; sanFile ="A_Equip_BaoJia_DaiJi.san";  param_1_x = -0.1; param_1_y =-7.0; param_1_z = 2;param_2_x = 0; param_2_y = 0.8; param_2_z = 0;  lieAction = "A_Equip_BaoJia_XiuXian.san";AvatarRect = {x = 1024, y = 900};
					},
			action = {{pfxId = 2590,bindPos ="dummy01"}},
			skillShowInfo = {
			[1] = 80008,
			[2] = 11011,
			[3] = 11014,
			[4] = 11012,
			[5] = 11013,
			[6] = 11015,
			[7] = 11016,
			};
			},	
	[10] = {strLevel = '十阶',strName = '涅槃羽织',dwMaxRank = 40, strSkillDecribe = "",
--			dwBaseAttack = 1,dwBaseDefence = 2,dwBaseShenFa = 3,dwSubDamage = 4,
			model = {
					sknFile = "A_Equip_BaoJia_10.skn"; sklFile="A_Equip_BaoJia.skl"; sanFile ="A_Equip_BaoJia_DaiJi.san";  param_1_x = -0.1; param_1_y =-7.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;  lieAction = "A_Equip_BaoJia_XiuXian.san";AvatarRect = {x = 1024, y = 1024};
					},
			action = {{pfxId = 2600,bindPos ="dummy01"}},
			skillShowInfo = {
			[1] = 80009,
			[2] = 11011,
			[3] = 11014,
			[4] = 11012,
			[5] = 11013,
			[6] = 11015,
			[7] = 11016,
			};
			},		
	[11] = {strLevel = '十一阶',strName = '蚩尤天衣',dwMaxRank = 44, strSkillDecribe = "",
			model = {
					sknFile = "A_Equip_BaoJia_11.skn"; sklFile="A_Equip_BaoJia.skl"; sanFile ="A_Equip_BaoJia_DaiJi.san";  param_1_x = -0.1; param_1_y =-7.8; param_1_z = 2;param_2_x = 0; param_2_y = -0.05; param_2_z = 0;  lieAction = "A_Equip_BaoJia_XiuXian.san";AvatarRect = {x = 1020, y = 1024};
					},
			action = {{pfxId = 2610,bindPos ="dummy01"}},
			skillShowInfo = {
			[1] = 80010,
			[2] = 11011,
			[3] = 11014,
			[4] = 11012,
			[5] = 11013,
			[6] = 11015,
			[7] = 11016,
			[8] = 11017,
			};
			},
	[12] = {strLevel = '十二阶',strName = '焚天幻神甲',dwMaxRank = 48, strSkillDecribe = "",
			model = {
					sknFile = "A_Equip_BaoJia_12.skn"; sklFile="A_Equip_BaoJia.skl"; sanFile ="A_Equip_BaoJia_DaiJi.san";  param_1_x = -0.1; param_1_y =-7.8; param_1_z = 2;param_2_x = 0; param_2_y = -0.05; param_2_z = 0;  lieAction = "A_Equip_BaoJia_XiuXian.san";AvatarRect = {x = 1020, y = 1024};
					},
			action = {{pfxId = 2620,bindPos ="dummy01"}},
			skillShowInfo = {
			[1] = 80010,
			[2] = 11011,
			[3] = 11014,
			[4] = 11012,
			[5] = 11013,
			[6] = 11015,
			[7] = 11016,
			[8] = 11017,			
			};
			},			
}
--阶级属性
_G.AmuletLevelPropertyConfig={ 
	[1]={dwAttack=34,dwDefense=17,dwHPMax=136,dwFlee=9,},
	[2]={dwAttack=168,dwDefense=84,dwHPMax=672,dwFlee=35,},
	[3]={dwAttack=368,dwDefense=184,dwHPMax=1472,dwFlee=68,},
	[4]={dwAttack=630,dwDefense=315,dwHPMax=2520,dwFlee=106,},
	[5]={dwAttack=1190,dwDefense=595,dwHPMax=4760,dwFlee=185,},
	[6]={dwAttack=2000,dwDefense=1000,dwHPMax=8000,dwFlee=287,},
	[7]={dwAttack=3210,dwDefense=1605,dwHPMax=12840,dwFlee=429,},
	[8]={dwAttack=4880,dwDefense=2440,dwHPMax=19520,dwFlee=611,},
	[9]={dwAttack=8750,dwDefense=3575,dwHPMax=35750,dwFlee=715,},
	[10]={dwAttack=13750,dwDefense=5085,dwHPMax=50850,dwFlee=1017,},
	[11]={dwAttack=27250,dwDefense=11835,dwHPMax=148080,dwFlee=1152,},
	[12]={dwAttack=32275,dwDefense=16138,dwHPMax=161375,dwFlee=3229,},	
}


--宝甲等级配置
_G.AmuletRankConfig =
{
	eDescribeProperty = {strAppendAttack = '攻击 ',strAppendDefence = '防御 ',strAppendShenFa = '身法 ',strAppendHPLimited = '生命 '},			--显示的属性名
	
	[1] = {dwMaxGrowth = 6000,dwAttackMin=0,dwAttackMax=16,dwDefenseMin=0,dwDefenseMax=8,dwHPMaxMin=0,dwHPMaxMax=64,dwFleeMin=0,dwFleeMax=6,},		--等级属性
	[2] = {dwMaxGrowth = 7000,dwAttackMin=16,dwAttackMax=34,dwDefenseMin=8,dwDefenseMax=17,dwHPMaxMin=64,dwHPMaxMax=136,dwFleeMin=6,dwFleeMax=11,},
	[3] = {dwMaxGrowth = 8500,dwAttackMin=34,dwAttackMax=54,dwDefenseMin=17,dwDefenseMax=27,dwHPMaxMin=136,dwHPMaxMax=216,dwFleeMin=11,dwFleeMax=16,},
	[4] = {dwMaxGrowth = 10500,dwAttackMin=54,dwAttackMax=76,dwDefenseMin=27,dwDefenseMax=38,dwHPMaxMin=216,dwHPMaxMax=304,dwFleeMin=16,dwFleeMax=21,},
	[5] = {dwMaxGrowth = 10000,dwAttackMin=76,dwAttackMax=102,dwDefenseMin=38,dwDefenseMax=51,dwHPMaxMin=304,dwHPMaxMax=408,dwFleeMin=21,dwFleeMax=27,},
	[6] = {dwMaxGrowth = 15500,dwAttackMin=102,dwAttackMax=130,dwDefenseMin=51,dwDefenseMax=65,dwHPMaxMin=408,dwHPMaxMax=520,dwFleeMin=27,dwFleeMax=33,},
	[7] = {dwMaxGrowth = 22500,dwAttackMin=130,dwAttackMax=160,dwDefenseMin=65,dwDefenseMax=80,dwHPMaxMin=520,dwHPMaxMax=640,dwFleeMin=33,dwFleeMax=39,},
	[8] = {dwMaxGrowth = 32000,dwAttackMin=160,dwAttackMax=192,dwDefenseMin=80,dwDefenseMax=96,dwHPMaxMin=640,dwHPMaxMax=768,dwFleeMin=39,dwFleeMax=45,},
	[9] = {dwMaxGrowth = 30000,dwAttackMin=192,dwAttackMax=232,dwDefenseMin=96,dwDefenseMax=116,dwHPMaxMin=768,dwHPMaxMax=928,dwFleeMin=45,dwFleeMax=52,},
	[10] = {dwMaxGrowth = 50000,dwAttackMin=232,dwAttackMax=277,dwDefenseMin=116,dwDefenseMax=139,dwHPMaxMin=928,dwHPMaxMax=1108,dwFleeMin=52,dwFleeMax=60,},
	[11] = {dwMaxGrowth = 85000,dwAttackMin=277,dwAttackMax=327,dwDefenseMin=139,dwDefenseMax=164,dwHPMaxMin=1108,dwHPMaxMax=1308,dwFleeMin=60,dwFleeMax=68,},
	[12] = {dwMaxGrowth = 135000,dwAttackMin=327,dwAttackMax=382,dwDefenseMin=164,dwDefenseMax=191,dwHPMaxMin=1308,dwHPMaxMax=1528,dwFleeMin=68,dwFleeMax=77,},
	[13] = {dwMaxGrowth = 200000,dwAttackMin=382,dwAttackMax=448,dwDefenseMin=191,dwDefenseMax=224,dwHPMaxMin=1528,dwHPMaxMax=1792,dwFleeMin=77,dwFleeMax=87,},
	[14] = {dwMaxGrowth = 295000,dwAttackMin=448,dwAttackMax=518,dwDefenseMin=224,dwDefenseMax=259,dwHPMaxMin=1792,dwHPMaxMax=2072,dwFleeMin=87,dwFleeMax=98,},
	[15] = {dwMaxGrowth = 425000,dwAttackMin=518,dwAttackMax=592,dwDefenseMin=259,dwDefenseMax=296,dwHPMaxMin=2072,dwHPMaxMax=2368,dwFleeMin=98,dwFleeMax=108,},
	[16] = {dwMaxGrowth = 580000,dwAttackMin=592,dwAttackMax=670,dwDefenseMin=296,dwDefenseMax=335,dwHPMaxMin=2368,dwHPMaxMax=2680,dwFleeMin=108,dwFleeMax=119,},
	[17] = {dwMaxGrowth = 600000,dwAttackMin=670,dwAttackMax=790,dwDefenseMin=335,dwDefenseMax=395,dwHPMaxMin=2680,dwHPMaxMax=3160,dwFleeMin=119,dwFleeMax=136,},
	[18] = {dwMaxGrowth = 650000,dwAttackMin=790,dwAttackMax=920,dwDefenseMin=395,dwDefenseMax=460,dwHPMaxMin=3160,dwHPMaxMax=3680,dwFleeMin=136,dwFleeMax=154,},
	[19] = {dwMaxGrowth = 750000,dwAttackMin=920,dwAttackMax=1060,dwDefenseMin=460,dwDefenseMax=530,dwHPMaxMin=3680,dwHPMaxMax=4240,dwFleeMin=154,dwFleeMax=172,},
	[20] = {dwMaxGrowth = 900000,dwAttackMin=1060,dwAttackMax=1210,dwDefenseMin=530,dwDefenseMax=605,dwHPMaxMin=4240,dwHPMaxMax=4840,dwFleeMin=172,dwFleeMax=192,},
	[21] = {dwMaxGrowth = 1000000,dwAttackMin=1210,dwAttackMax=1385,dwDefenseMin=605,dwDefenseMax=693,dwHPMaxMin=4840,dwHPMaxMax=5540,dwFleeMin=192,dwFleeMax=214,},
	[22] = {dwMaxGrowth = 1200000,dwAttackMin=1385,dwAttackMax=1570,dwDefenseMin=693,dwDefenseMax=785,dwHPMaxMin=5540,dwHPMaxMax=6280,dwFleeMin=214,dwFleeMax=236,},
	[23] = {dwMaxGrowth = 1500000,dwAttackMin=1570,dwAttackMax=1780,dwDefenseMin=785,dwDefenseMax=890,dwHPMaxMin=6280,dwHPMaxMax=7120,dwFleeMin=236,dwFleeMax=261,},
	[24] = {dwMaxGrowth = 1900000,dwAttackMin=1780,dwAttackMax=2000,dwDefenseMin=890,dwDefenseMax=1000,dwHPMaxMin=7120,dwHPMaxMax=8000,dwFleeMin=261,dwFleeMax=286,},
	[25] = {dwMaxGrowth = 2100000,dwAttackMin=2000,dwAttackMax=2280,dwDefenseMin=1000,dwDefenseMax=1140,dwHPMaxMin=8000,dwHPMaxMax=9120,dwFleeMin=286,dwFleeMax=319,},
	[26] = {dwMaxGrowth = 2400000,dwAttackMin=2280,dwAttackMax=2585,dwDefenseMin=1140,dwDefenseMax=1293,dwHPMaxMin=9120,dwHPMaxMax=10340,dwFleeMin=319,dwFleeMax=353,},
	[27] = {dwMaxGrowth = 2800000,dwAttackMin=2585,dwAttackMax=2915,dwDefenseMin=1293,dwDefenseMax=1458,dwHPMaxMin=10340,dwHPMaxMax=11660,dwFleeMin=353,dwFleeMax=389,},
	[28] = {dwMaxGrowth = 3300000,dwAttackMin=2915,dwAttackMax=3270,dwDefenseMin=1458,dwDefenseMax=1635,dwHPMaxMin=11660,dwHPMaxMax=13080,dwFleeMin=389,dwFleeMax=427,},
	[29] = {dwMaxGrowth = 3800000,dwAttackMin=3270,dwAttackMax=3695,dwDefenseMin=1635,dwDefenseMax=1848,dwHPMaxMin=13080,dwHPMaxMax=14780,dwFleeMin=427,dwFleeMax=472,},
	[30] = {dwMaxGrowth = 4400000,dwAttackMin=3695,dwAttackMax=4145,dwDefenseMin=1848,dwDefenseMax=2073,dwHPMaxMin=14780,dwHPMaxMax=16580,dwFleeMin=472,dwFleeMax=519,},
	[31] = {dwMaxGrowth = 5100000,dwAttackMin=4145,dwAttackMax=4620,dwDefenseMin=2073,dwDefenseMax=2310,dwHPMaxMin=16580,dwHPMaxMax=18480,dwFleeMin=519,dwFleeMax=566,},
	[32] = {dwMaxGrowth = 5900000,dwAttackMin=4620,dwAttackMax=5120,dwDefenseMin=2310,dwDefenseMax=2560,dwHPMaxMin=18480,dwHPMaxMax=20480,dwFleeMin=566,dwFleeMax=615,},
	[33] = {dwMaxGrowth = 6800000,dwAttackMin=5120,dwAttackMax=5720,dwDefenseMin=2560,dwDefenseMax=2860,dwHPMaxMin=20480,dwHPMaxMax=28600,dwFleeMin=615,dwFleeMax=673,},
	[34] = {dwMaxGrowth = 7800000,dwAttackMin=5720,dwAttackMax=6360,dwDefenseMin=2860,dwDefenseMax=3180,dwHPMaxMin=28600,dwHPMaxMax=31800,dwFleeMin=673,dwFleeMax=734,},
	[35] = {dwMaxGrowth = 8900000,dwAttackMin=6360,dwAttackMax=7040,dwDefenseMin=3180,dwDefenseMax=3520,dwHPMaxMin=31800,dwHPMaxMax=35200,dwFleeMin=734,dwFleeMax=797,},
	[36] = {dwMaxGrowth = 10100000,dwAttackMin=7040,dwAttackMax=7760,dwDefenseMin=3520,dwDefenseMax=3880,dwHPMaxMin=35200,dwHPMaxMax=38800,dwFleeMin=797,dwFleeMax=863,},
	[37] = {dwMaxGrowth = 11400000,dwAttackMin=7760,dwAttackMax=8610,dwDefenseMin=3880,dwDefenseMax=4305,dwHPMaxMin=38800,dwHPMaxMax=43050,dwFleeMin=863,dwFleeMax=940,},
	[38] = {dwMaxGrowth = 12800000,dwAttackMin=8610,dwAttackMax=9515,dwDefenseMin=4305,dwDefenseMax=4758,dwHPMaxMin=43050,dwHPMaxMax=47575,dwFleeMin=940,dwFleeMax=1020,},
	[39] = {dwMaxGrowth = 14300000,dwAttackMin=9515,dwAttackMax=10475,dwDefenseMin=4758,dwDefenseMax=5238,dwHPMaxMin=47575,dwHPMaxMax=52375,dwFleeMin=1020,dwFleeMax=1103,},
	[40] = {dwMaxGrowth = 15900000,dwAttackMin=10475,dwAttackMax=11490,dwDefenseMin=5238,dwDefenseMax=5745,dwHPMaxMin=52375,dwHPMaxMax=57450,dwFleeMin=1103,dwFleeMax=1189,},
	--11阶--熔炼度
	[41] = {dwMaxGrowth = 17600000,dwAttackMin=11490,dwAttackMax=12665,dwDefenseMin=5745,dwDefenseMax=6333,dwHPMaxMin=57450,dwHPMaxMax=63325,dwFleeMin=1189,dwFleeMax=1288,},
	[42] = {dwMaxGrowth = 19400000,dwAttackMin=12665,dwAttackMax=13920,dwDefenseMin=6333,dwDefenseMax=6960,dwHPMaxMin=63325,dwHPMaxMax=69600,dwFleeMin=1288,dwFleeMax=1392,},
	[43] = {dwMaxGrowth = 21300000,dwAttackMin=13920,dwAttackMax=15255,dwDefenseMin=6960,dwDefenseMax=7628,dwHPMaxMin=69600,dwHPMaxMax=76275,dwFleeMin=1392,dwFleeMax=1501,},
	[44] = {dwMaxGrowth = 23300000,dwAttackMin=15255,dwAttackMax=16670,dwDefenseMin=7628,dwDefenseMax=8335,dwHPMaxMin=76275,dwHPMaxMax=83350,dwFleeMin=1501,dwFleeMax=1614,},
	--12阶--熔炼度
	[45] = {dwMaxGrowth = 25400000,dwAttackMin=16670,dwAttackMax=18285,dwDefenseMin=8335,dwDefenseMax=9143,dwHPMaxMin=83350,dwHPMaxMax=91425,dwFleeMin=1614,dwFleeMax=1742,},
	[46] = {dwMaxGrowth = 27600000,dwAttackMin=18285,dwAttackMax=20020,dwDefenseMin=9143,dwDefenseMax=10010,dwHPMaxMin=91425,dwHPMaxMax=100100,dwFleeMin=1742,dwFleeMax=1877,},
	[47] = {dwMaxGrowth = 29900000,dwAttackMin=20020,dwAttackMax=21875,dwDefenseMin=10010,dwDefenseMax=10938,dwHPMaxMin=100100,dwHPMaxMax=109375,dwFleeMin=1877,dwFleeMax=2020,},
	[48] = {dwMaxGrowth = 32300000,dwAttackMin=21875,dwAttackMax=23850,dwDefenseMin=10938,dwDefenseMax=11925,dwHPMaxMin=109375,dwHPMaxMax=119250,dwFleeMin=2020,dwFleeMax=2169,},
	}


--技能触发概率 key为等级
_G.SkillHappenRate={
	[ 1 ] = 0.1 ,
	[ 2 ] = 0.105 ,
	[ 3 ] = 0.11 ,
	[ 4 ] = 0.115 ,
	[ 5 ] = 0.12 ,
	[ 6 ] = 0.125 ,
	[ 7 ] = 0.13 ,
	[ 8 ] = 0.135 ,
	[ 9 ] = 0.14 ,
	[ 10 ] = 0.145 ,
	[ 11 ] = 0.15 ,
	[ 12 ] = 0.155 ,
	[ 13 ] = 0.16 ,
	[ 14 ] = 0.165 ,
	[ 15 ] = 0.17 ,
	[ 16 ] = 0.175 ,
	[ 17 ] = 0.18 ,
	[ 18 ] = 0.185 ,
	[ 19 ] = 0.19 ,
	[ 20 ] = 0.195 ,
	[ 21 ] = 0.2 ,
	[ 22 ] = 0.205 ,
	[ 23 ] = 0.21 ,
	[ 24 ] = 0.215 ,
	[ 25 ] = 0.22 ,
	[ 26 ] = 0.225 ,
	[ 27 ] = 0.23 ,
	[ 28 ] = 0.235 ,
	[ 29 ] = 0.24 ,
	[ 30 ] = 0.245 ,
	[ 31 ] = 0.25 ,
	[ 32 ] = 0.255 ,
	[ 33 ] = 0.26 ,
	[ 34 ] = 0.265 ,
	[ 35 ] = 0.27 ,
	[ 36 ] = 0.275 ,
	[ 37 ] = 0.28 ,
	[ 38 ] = 0.285 ,
	[ 39 ] = 0.29 ,
	[ 40 ] = 0.295 ,
	[ 41 ] = 0.300 ,   --开11阶
	[ 42 ] = 0.305 ,
	[ 43 ] = 0.310,
	[ 44 ] = 0.315 ,
	[ 45 ] = 0.320 ,	
	[ 46 ] = 0.325 ,	
	[ 47 ] = 0.330 ,	
	[ 48 ] = 0.335 ,	
};

--技能触发概率 key为等级 显示用.
_G.FSkillHappenRate={
	[ 1 ] = 1,
	[ 2 ] = 1,
	[ 3 ] = 1,
	[ 4 ] = 1,
	[ 5 ] = 1,
	[ 6 ] = 1,
	[ 7 ] = 1,
	[ 8 ] = 1,
	[ 9 ] = 1,
	[ 10 ] = 1,
	[ 11 ] = 1,
	[ 12 ] = 1,
	[ 13 ] = 1,
	[ 14 ] = 1,
	[ 15 ] = 1,
	[ 16 ] = 1,
	[ 17 ] = 1,
	[ 18 ] = 1,
	[ 19 ] = 1,
	[ 20 ] = 1,
	[ 21 ] = 1,
	[ 22 ] = 1,
	[ 23 ] = 1,
	[ 24 ] = 1,
	[ 25 ] = 1,
	[ 26 ] = 1,
	[ 27 ] = 1,
	[ 28 ] = 1,
	[ 29 ] = 1,
	[ 30 ] = 1,
	[ 31 ] = 1,
	[ 32 ] = 1,
	[ 33 ] = 1,
	[ 34 ] = 1,
	[ 35 ] = 1,
	[ 36 ] = 1,
	[ 37 ] = 1,
	[ 38 ] = 1,
	[ 39 ] = 1,
	[ 40 ] = 1,
	[ 41 ] = 1,   --开11阶
	[ 42 ] = 1,
	[ 43 ] = 1,
	[ 44 ] = 1,
	[ 45 ] = 1,   --开12阶
	[ 46 ] = 1,
	[ 47 ] = 1,
	[ 48 ] = 1,	
};

--宝甲抵挡数值
_G.Clothes_stop={
	Resistance = function(ClothesLevel)
		local clevel = ClothesLevel
		if ClothesLevel > 40  then  clevel = 40 end
		return ""..(18+(2*clevel)).."%";   
	end
};

--护身宝甲提示配置表
_G.AmuletTipConfig = 
{
	--触发提示的装备数
	dwEquipNumber = 10,
	--图标
	tabIcon = {
		--熔炼提示图标
		[ enAmuletWnd.eIntensify ]	= 'icon1.png',
		--升阶提示图标
		[ enAmuletWnd.eUpgrade ]	= 'icon1.png',
	},
}
--护身宝甲熔炼配置表
_G.AmuletIntensifyConfig = 
{
	--精铁锭配置ID
	IntensifyStoneId = 4100210,
	
	--每件牺牲装备获得熔炼值 = 牺牲装备阶数 * 10
	--amuletLevel为当前宝甲阶数
	--sacrificeLevel为牺牲装备阶数
	--sacrificeQuality为牺牲装备品质
	--sacrificeScore为牺牲装备评分
	AddIntensifyValueByEquip = function(amuletLevel,sacrificeLevel,sacrificeQuality,sacrificeScore)
		local value = 30
		if sacrificeLevel == 2 then value = 70 end 
		if sacrificeLevel == 3 then value = 140 end 
		if sacrificeLevel == 4 then value = 250 end 
		if sacrificeLevel == 5 then value = 450 end 
		if sacrificeLevel == 6 then value = 800 end
		if sacrificeLevel == 7 then value = 1500 end 		
		
		
		local Quality = 1
		if sacrificeQuality == 2 then Quality = 1.2 end 
		if sacrificeQuality == 3 then Quality = 1.5 end 
		if sacrificeQuality == 4 then Quality = 2 end 
		if sacrificeQuality == 5 then Quality = 4 end
		
		value = (value + sacrificeScore/10)*Quality
		
		
		local XiShu		=1
		local Dlevel	=0
		
		
		if amuletLevel > sacrificeLevel then
			Dlevel = amuletLevel - sacrificeLevel
			if Dlevel >= 10 then Dlevel = 10 - sacrificeLevel end        --为了保证XiShu大于0，Dlevel不能大于等于10
			XiShu = 1-(Dlevel-1)*(0.1+(Dlevel-1)*0.001)                  --宝甲阶越高，系数越小
		end

		return math.floor(value * XiShu);
	end;
	
	--每件精铁锭获得熔炼值 = 100
	--amuletLevel为当前宝甲阶数
	AddIntensifyValueByStone = function(amuletLevel)
		local value = 4000;
		return value;
	end;
	
	-- 禁止自动熔炼物品
	Forbidden = 
	{
		[1600010]=1;
		[1600020]=1;
		[1600030]=1;
		[1600040]=1;
		[1600050]=1;
		[1600060]=1;
		[1600070]=1;
		[1600080]=1;
		[1600090]=1;
		[1600100]=1;
		[1600110]=1;
		[1600120]=1;
		[1600130]=1;
		[1600140]=1;
		[1600150]=1;
		[1600160]=1;
		[1600170]=1;
		[1600180]=1;
		[1600190]=1;
		[1600200]=1;
		[1600210]=1;
		[1600220]=1;
		[1600230]=1;
		[1600240]=1;
		[1600250]=1;
		[1600260]=1;
		[1600270]=1;


	};
}

--护身宝甲升阶配置表
_G.AmuletUpgradeConfig = 
{
	--升阶所需材料名
--	szStuffName = '升阶玄晶',
	
	--材料来源描述	暂用坐骑配置(需要改会报错)
	szStuffDescribe = "<font color='#DCB857'>获得途径：</font><br/><font color='#D9CCBD'>1.击杀野怪或BOSS有几率掉落 ".."<U><a href = 'asfunction:hrefevent,CUIMissionDailyEx:OpenPanel(3)'><font color='#0dab01'>查看BOSS</font></a></U><br/>" ..
		"2.通关副本有几率获得 ".."<U><a href = 'asfunction:hrefevent,CUIDuplWnd:OpenWnd()'><font color='#0dab01'>立即前往</font></a></U><br/>3.更多获取途径请查看物品描述";
	
	--触发广播等级
	dwBroadCastLevel = 5,
	--升阶广播信息
--	szBroadCastInfo = '恭喜玩家@N，成功将@L升阶到@C',
	szHtmlText = '我来试试',
	szHtmlRoleColor = '#00FF00',
	szHtmlAmuletColor = '#0000ff',
	--升阶NPC的ID
	dwNpcId = 10021013,
	
	--自动升阶配置
	--按钮位置
	StartBtn_x = { mid = 158,left = 90 },
	--自动升阶时间间隔(毫秒)
	dwTimeInterval = 1000,
	--自动升阶功能开放阶数
	dwAutoLevel = 3,


	--升阶失败增加经验
	GetFailureAddExp = function(amuletLevel,nPlayerLevel)

		local dwExp = nPlayerLevel * (nPlayerLevel*(5+nPlayerLevel/20) *0.2);
		
		return math.floor(dwExp);
	end;
	
	
	--客户端成功率公式 = 110% - （当前阶数） * 10% 
	----amuletLevel为当前宝甲阶数
	BaseSuccessRate_ratedata={
		[1]="中",
		[2]="中",
		[3]="低",
		[4]="低",
		[5]="低",
		[6]="低",
		[7]="低",
		--扩展
		[8]="低",
		[9]="低",
		[10]="低",    --开11
		[11]="低",		
		};
		
	GiftValueUpMax={
				[1]={up = 1,Max = 10},
				[2]={up = 0.1,Max = 10},
				[3]={up = 0.01,Max = 10},
				[4]={up = 0.01,Max = 10},
				[5]={up = 0.01,Max = 10},
				[6]={up = 0.01,Max = 10},
				[7]={up = 0.01,Max = 10},
				--扩展
				[8]={up = 0.01,Max = 10},
				[9]={up = 0.01,Max = 10},
				[10]={up = 0.01,Max = 10}, --开11
				[11]={up = 0.01,Max = 10},				
				};
	BaseSuccessRate = function(amuletLevel)

		local rate = AmuletUpgradeConfig.BaseSuccessRate_ratedata[amuletLevel] or 0.1

		return rate;
	end;
	
	--服务器成功率公式
	----amuletLevel为当前宝甲阶数
	----giftValue为天官赐福
	TrueSuccessRate_Amulet_data={
		[1]=0.5,
		[2]=0.3,
		[3]=0.3,
		[4]=0.25,
		[5]=0.15,
		[6]=0.1,
		[7]=0.05,
		--扩展9,10
		[8]=0.2,
		[9]=0.1,
		[10]=0.05, --开11阶 50/1000
		[11]=0.05,		
		};
	TrueSuccessRate_Amulet_giftValueku={	

		[1]={[1]=7		,[2]=12	    },
		[2]={[1]=40		,[2]=60	    },
		[3]={[1]=100 	,[2]=135	},
		[4]={[1]=250	,[2]=300	},
		[5]={[1]=730	,[2]=860	},
		[6]={[1]=2500	,[2]=2850	},
		[7]={[1]=6800	,[2]=7500	},
		[8]={[1]=10500	,[2]=11000	},
		[9]={[1]=12500	,[2]=13000	},
		[10]={[1]=13800	,[2]=14000	},   --开11阶		
		[11]={[1]=14500		,[2]=15500	    }, 
		--下面的没用临时配的	
		[12]={[1]=17000		,[2]=18800	    }, 		
		};

	TrueSuccessRate = function(amuletLevel,giftValue)
		local rate= _G.AmuletUpgradeConfig.TrueSuccessRate_Amulet_data[amuletLevel] or 0.3
		
		if giftValue<_G.AmuletUpgradeConfig.TrueSuccessRate_Amulet_giftValueku[amuletLevel][1] then rate =0
		elseif giftValue>=_G.AmuletUpgradeConfig.TrueSuccessRate_Amulet_giftValueku[amuletLevel][2] then rate =1
		end
	
		return rate;
	end;
	
	--材料及数量 = 
	----amuletLevel为当前宝甲阶数
	CostStone_stonedata={
		[1]={dwItemID = 4100010,dwItemCount = 5,dwLiJin = true,},
		[2]={dwItemID = 4100130,dwItemCount = 2,dwLiJin = false,},
		[3]={dwItemID = 4100130,dwItemCount = 3,dwLiJin = false,},
		[4]={dwItemID = 4100130,dwItemCount = 4,dwLiJin = false,},
		[5]={dwItemID = 4100130,dwItemCount = 5,dwLiJin = false,},
		[6]={dwItemID = 4100130,dwItemCount = 6,dwLiJin = false,},
		[7]={dwItemID = 4100130,dwItemCount = 8,dwLiJin = false,},
		[8]={dwItemID = 4100130,dwItemCount = 20,dwLiJin = false,},
		--9，,10阶
		[9]={dwItemID = 4100130,dwItemCount = 25,dwLiJin = false,},
		[10]={dwItemID = 4100131,dwItemCount = 10,dwLiJin = false,},--开11阶云母金精
		[11]={dwItemID = 4100131,dwItemCount = 10,dwLiJin = false,}, 
		--[12]={dwItemID = 4100131,dwItemCount = 10,dwLiJin = false,},		
		};
	
	CostStone = function(amuletLevel)
		local setData = _G.AmuletUpgradeConfig.CostStone_stonedata[amuletLevel];
		if(amuletLevel < 1 or amuletLevel > 11) then
			return 0, 0, false;
		end
		return setData.dwItemID, setData.dwItemCount or 1, setData.dwLiJin;
	end;
	
	--消耗银两 = （当前阶数 ） * 5000
	----amuletLevel为当前宝甲阶数
	CostMoney_moneydata={
		[1]=10000,
		[2]=20000,
		[3]=40000,
		[4]=60000,
		[5]=100000,
		[6]=200000,
		[7]=200000,
		---9-10阶
		[8]=300000,
		[9]=500000,	
		[10]=800000, --开11阶	
		[11]=855000,		
		};
	
	CostMoney = function(amuletLevel)
		local money = _G.AmuletUpgradeConfig.CostMoney_moneydata[amuletLevel] or 1000 ;
		return money;
	end;
	
	--消耗礼金 = 10
	----amuletLevel为当前宝甲阶数
	--CostBindGold = function(amuletLevel)
	--	local money = 2;
	--	return money;
	--end;
	
	--消耗元宝 = 10
	----amuletLevel为当前宝甲阶数
	--CostGold = function(amuletLevel)
	--	local money = 1;
	--	return money;
	--end;
};

-- 宝甲镶嵌配置
_G.AmuletInlayConfig =
{
	-- 数据配置
    Data = {
		-- 等级
        [1] = {
			-- 达成需要的宝甲等级
            NeedAmuletLevel = 1;
			-- 达成需要的消耗道具
            CostItem = {ID = 4100421; Num = 60;};
			-- 达成增加的属性值
			AppendProperty = {Attack = 135; Defense = 68; HPMax = 675; Flee = 17;};        
		};
		-- 同上
        [2] = {
            NeedAmuletLevel = 1;
            CostItem = {ID = 4100421; Num = 120;};
			AppendProperty = {Attack = 225; Defense = 113; HPMax = 1125; Flee = 29;};        
		};
		-- 同上
        [3] = {
            NeedAmuletLevel = 2;
            CostItem = {ID = 4100422; Num = 100;};
			AppendProperty = {Attack = 340; Defense = 170; HPMax = 1700; Flee = 43;};        
		};
		-- 同上
        [4] = {
            NeedAmuletLevel = 2;
            CostItem = {ID = 4100422; Num = 150;};
			AppendProperty = {Attack = 400; Defense = 200; HPMax = 2000; Flee = 50;};        
		};
		-- 同上
        [5] = {
            NeedAmuletLevel = 3;
            CostItem = {ID = 4100423; Num = 100;};
			AppendProperty = {Attack = 550; Defense = 275; HPMax = 2750; Flee = 69;};
		};
		-- 同上
        [6] = {
            NeedAmuletLevel = 3;
            CostItem = {ID = 4100423; Num = 150;};
			AppendProperty = {Attack = 630; Defense = 315; HPMax = 3150; Flee = 79;};
        };
		-- 同上
        [7] = {
            NeedAmuletLevel = 4;
            CostItem = {ID = 4100424; Num = 100;};
			AppendProperty = {Attack = 920; Defense = 460; HPMax = 4600; Flee = 115;};
        };
		-- 同上
        [8] = {
            NeedAmuletLevel = 4;
            CostItem = {ID = 4100424; Num = 150;};
			AppendProperty = {Attack = 1050; Defense = 525; HPMax = 5250; Flee =132;};
        };
		-- 同上
        [9] = {
            NeedAmuletLevel = 5;
            CostItem = {ID = 4100424; Num = 200;};
			AppendProperty = {Attack = 1350; Defense = 675; HPMax = 6750; Flee = 169;};
        };
		-- 同上
        [10] = {
            NeedAmuletLevel = 5;
            CostItem = {ID = 4100424; Num = 300;};
			AppendProperty = {Attack = 1600; Defense = 800; HPMax = 8000; Flee = 200;};
        };
    };
	-- 错误提示
    Error = {
		-- 已达到最大镶嵌等级
        FullLevel = 4001010028;	--"大侠之宝甲已达极致嵌甲，无需再进行镶嵌",
		-- 缺少上级镶嵌
        LackLevel = 4001010029;	--"您需要将上一位置嵌甲后才可解锁此镶嵌位置",
		-- 缺少宝甲等级
        LackAmuletLevel = 4001010030;	-----"您的宝甲等阶不足，无法镶嵌",
		-- 消耗道具不足
        ItemNotEnough = 4001010031;	----"请检查包裹内是否拥有足够数量的镶嵌材料",
    };

	-- 文本
    Text = {
		-- 镶嵌打开按钮提示
        InlayBtnTip = function ()
			local str0 = "<font color ='#FFFF00' >为宝甲镶嵌金鳞甲片，镶嵌后可以额外增加宝甲属性</font><br/>";
			local str1 = "<font color ='#4daeed'>您可以通过熔炉炼制不同品级的金鳞甲片</font><br/>";
			local str2 = "<font color ='#FFFFFF'>所需材料：</font>";
			local str3 = "<font color ='#e082da'>紫钧元、千纸鹤、亮银沙、强化石</font><br/>";
			local str = str0..str1..str2..str3;
			return str;
		end;
		
		-----玩法说明
		 InlayExplain = function ()
			local str0 = "<font color ='#4daeed'>1.为您的宝甲镶嵌金鳞甲片可提高宝甲属性</font><br/>";
			local str1 = "<font color ='#4daeed'>2.使用熔炉可以炼制不同品级的金鳞甲片</font><br/>";
			local str2 = "<font color ='#4daeed'>3.紫钧元、千纸鹤、亮银沙、强化石是炼制金鳞甲片所必需之物</font><br/>";
			local str3 = "<font color ='#4daeed'>4.镶嵌槽位开启条件：需要激活上一槽位并且满足对应槽位所需宝甲等阶</font><br/>";
			local str = str0..str1..str2..str3;
			return str;
		end;
		-- 属性加成提示
        AppendPropertyTip = function ()
			local str0 = "<font color ='#FFFF00'>总属性:%s</font><br/>";
			local str1 = "<font color ='#FFFFFF'>基础属性:%s</font><br/>";
			local str2 = "<font color ='#4daeed'>嵌甲属性:%s</font><br/>";
			local str3 = "<font color ='#B032EE'>精炼属性:%s</font><br/>";
			local str = str0..str1..str2..str3;
			-- str = string.format(str..);
			return str;
		end;
		-- 镶嵌槽提示
        Slot = {
			-- 已激活
            Activate = function ()
				local str0 = "<font color ='#FFFF00' size = '18'>%s</font><br/>";
				local str1 = "已激活<br/>";
				local str2 = "<font color ='#4daeed'>激活后可获得属性</font><br/>";
				local str3 = "<font color='#FFFFFF'>攻击 + %s</font><br/>".."<font color='#FFFFFF'>防御 + %s</font><br/>".."<font color='#FFFFFF'>生命 + %s</font><br/>".."<font color='#FFFFFF'>身法 + %s</font><br/>";
				local str = str0..str1..str2..str3;
				return str;
			end;
			-- 当前可镶嵌
            Dispose = function ()
				local str0 = "<font color ='#FFFF00' size = '18'>%s</font><br/>";
				local str1 = "<font color ='#FFFFFF'>镶嵌所需%s：</font><font color ='%s'>%d/%d 个</font><br/>";
				local str2 = "<font color ='#4daeed'>激活后可获得属性</font><br/>";
				local str3 = "<font color='#FFFFFF'>攻击 + %s</font><br/>".."<font color='#FFFFFF'>防御 + %s</font><br/>".."<font color='#FFFFFF'>生命 + %s</font><br/>".."<font color='#FFFFFF'>身法 + %s</font><br/>";
				local str = str0..str1..str2..str3;
				return str;

			end;
			-- 宝甲等阶不满足
            Lack = function ()
				local str0 = "<font color ='#FFFF00' size = '18'>%s</font><br/>";
				local str1 = "<font color='#FFFFFF'>激活条件：</font><font color ='#FFFF00'>宝甲升至%s 阶</font><br/>";
				local str2 = "<font color ='#4daeed'>激活后可获得属性</font><br/>";
				local str3 = "<font color='#FFFFFF'>攻击 + %s</font><br/>".."<font color='#FFFFFF'>防御 + %s</font><br/>".."<font color='#FFFFFF'>生命 + %s</font><br/>".."<font color='#FFFFFF'>身法 + %s</font><br/>";
				local str = str0..str1..str2..str3;
				return str;
			end;
			-- 下级镶嵌
            Next = function ()
				local str0 = "<font color ='#FFFF00' size = '18'>%s</font><br/>";
				local str1 = "<font color='#FFFFFF'>激活条件：</font><font color ='#FFFF00'>激活%s</font><br/>";
				local str2 = "<font color ='#4daeed'>激活后可获得属性</font><br/>";
				local str3 = "<font color='#FFFFFF'>攻击 + %s</font><br/>".."<font color='#FFFFFF'>防御 + %s</font><br/>".."<font color='#FFFFFF'>生命 + %s</font><br/>".."<font color='#FFFFFF'>身法 + %s</font><br/>";
				local str = str0..str1..str2..str3;
				return str;
			end;
        };
		-- 成功公告
		Notice = function (strRoleName, dwAmuletInlayLevel)
			if dwAmuletInlayLevel < 5 then
				return nil;
			end
			if dwAmuletInlayLevel ~= 10 then
				return string.format("恭喜大侠:%s宝甲御神至第%d槽位", strRoleName, dwAmuletInlayLevel);
			else
				return string.format("恭喜大侠:%s宝甲御神已达极致！", strRoleName, dwAmuletInlayLevel);
			end
        end;
    };
	
	------第几个嵌甲
	InlayNum = {
		[1] = "一";
		[2] = "二";
		[3] = "三";
		[4] = "四";
		[5] = "五";
		[6] = "六";
		[7] = "七";
		[8] = "八";
		[9] = "九";
		[10] = "十";		
	};
	

	------第几个嵌甲
	InlayName = {
		[1] = "【临】";
		[2] = "【兵】";
		[3] = "【斗】";
		[4] = "【者】";
		[5] = "【皆】";
		[6] = "【数】";
		[7] = "【组】";
		[8] = "【行】";
		[9] = "【前】";
		[10] = "【御】";
	};
	-- 图标
    Icon1 = {
		-- 已激活槽
		Activate = {
			[1] = "TX_ui_bj_qj_lin1.png";
			[2] = "TX_ui_bj_qj_bing1.png";
			[3] = "TX_ui_bj_qj_dou1.png";
			[4] = "TX_ui_bj_qj_zhe1.png";
			[5] = "TX_ui_bj_qj_jie1.png";
			[6] = "TX_ui_bj_qj_shu1.png";
			[7] = "TX_ui_bj_qj_zu1.png";
			[8] = "TX_ui_bj_qj_xing1.png";
			[9] = "TX_ui_bj_qj_qian1.png";
		};
		-- 可镶嵌槽
		Usable = {
			[1] = "TX_ui_bj_qj_lin.png";
			[2] = "TX_ui_bj_qj_bing.png";
			[3] = "TX_ui_bj_qj_dou.png";
			[4] = "TX_ui_bj_qj_zhe.png";
			[5] = "TX_ui_bj_qj_jie.png";
			[6] = "TX_ui_bj_qj_shu.png";
			[7] = "TX_ui_bj_qj_zu.png";
			[8] = "TX_ui_bj_qj_xing.png";
			[9] = "TX_ui_bj_qj_qian.png";
		};
		-- 不可镶嵌槽
        Unusable = "TX_ui_bj_qj_xiaosuo.png";
    };
	-- 图标
    Icon2 = {
		-- 已激活槽
		Activate = {
			[10] = "TX_ui_bj_qj_yu1.png";
		};
		-- 可镶嵌槽
		Usable = {
			[10] = "TX_ui_bj_qj_yu.png";
		};
		-- 不可镶嵌槽
        Unusable = "TX_ui_bj_qj_dasuo.png";

    };
	-- 特效
    Pfx = {
		-- 镶嵌槽
        slot = "TX_ui_bj_qj_cg_01";
		-- 成功 
		Success = "TX_ui_bj_qj_jh_01";
		-- 播放间隔时间
		Time = 1000;
    };
	-- 第十个按钮特效
    Pfx1 = {
		-- 镶嵌槽
        slot = "TX_ui_bj_qj_cg_02";
		-- 成功
		Success = "TX_ui_bj_qj_jh_02";
		Time = 1000;
    };
	-- 开放到等级
	Open = {
		-- 等级
		Level = 12;
		-- 点击提示
		Prompt = 4001010032;	-----"本版本暂未开放，请您敬请期待",
		-- 悬浮框提示
		Tip = 4001010033;	------	"本版本暂未开放",
	};
};

-- 资质配置
_G.AmuletAptitudeConfig = 
{	
    -- @brief 获取消耗
    -- @param number dwAptitude 精炼值
    -- @return table 消耗
    -- {}
    GetConsume = function (dwAptitude)
       return AmuletAptitudeConfig.Data.Consume;
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
    -- @param number dwLevel 宝甲等级
    -- @return number 次数
    GetMaxDegree = function (dwLevel)
        return AmuletAptitudeConfig.CiShu[dwLevel];
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
        for k, v in pairs(AmuletAptitudeConfig.Data.AppendProperty) do
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
        if AmuletAptitudeConfig.IsHave(setParam.dwLevel) == false then
           return AmuletAptitudeConfig.Info.NotHasAuthority;
        end
        if objSystem:IsFull() == true then
            return AmuletAptitudeConfig.Info.Full;
        end
        if objSystem:IsCanDeleteItem({setParam.dwItemID, setParam.dwNum}) == 
            false then
            return AmuletAptitudeConfig.Info.NotEnoughConsume;
        end
        return AmuletAptitudeConfig.Info.IsCan;
    end;

    -- @breif 精炼
    -- @param object objSystem 系统对象
    Do = function (objSystem, setParam)
        objSystem:DeleteItem({setParam.dwItemID, setParam.dwNum});
        objSystem:ModifyAptitude(objSystem:GetAptitude() + setParam.nCount);
    end;

    -- 资质数据
    Data = {
        --消耗信息配置 dwItemID：物品ID, dwNum 物品数量
        Consume = {dwItemID = 4902012; dwNum = 1;};
        --精炼一次增加的属性+攻击 +防御 +生命 +身法
        AppendProperty = {Attack = 6; Defense = 3; HPMax = 30; Flee = 2;};
    };
	CiShu = {
			[1] = 30;
			[2] = 60;
			[3] = 120;
			[4] = 240;
			[5] = 450;
			[6] = 800;
			[7] = 1350;
			[8] = 2150;
			[9] = 3300;
			[10] = 5000;
			[11] = 7000;
			[12] = 8000;			
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
			ImgTips = "<font color='#4daeed'>已精炼次数：</font><font color='#00FF00'>%s</font>";
			ImgTips1 = "<br/><font color='#4daeed'>下阶最大精炼次数：%d</font>";
			ImgTips2 = "<br/><font color ='#FFFF00'>精炼属性加成"; 
			IsNoCan1 = "精炼条件不足！"; --宝甲精炼未满足条件
			IsNoCan2 = "精炼次数已达本阶上限！"; --当前等阶宝甲精炼已满
			IsNoCan3 = "所需道具不足！"; --宝甲精炼物品不足
			IsNoCan4 = "精炼失败！请稍后再试";
			IsSuccess = "精炼成功！"; -- 精炼成功
			Shunxu = {"Attack";"Defense";"HPMax";"Flee";}; --属性顺序显示
			ProperyName 	= { 																--TIPS属性字符串
						HPMax 		= "生命 + ";
						Attack 		= "攻击 + "; 
						Defense 		= "防御 + ";
						Flee 			= "身法 + ";				
			};
	};
};
