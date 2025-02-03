--[[
	[ \brief 暗器系统 配置文件
	[ \author 路广华，沈奇
	[ \date 2014-5-10
--]]
_G.HiddenWeaponConfig =
{
	-- --基础技能ID
	baseSkill = 100000;
	--暗器技能触发概率 { [级数] = 技能触发的概率 }
	skillRateData = {
		[1] = 0.03,
		[2] = 0.03,
		[3] = 0.03,
		[4] = 0.03,
		[5] = 0.03,
		[6] = 0.05,
		[7] = 0.05,
		[8] = 0.05,
		[9] = 0.05,
		[10] = 0.05,
		[11] = 0.08,
		[12] = 0.08,
		[13] = 0.08,
		[14] = 0.08,
		[15] = 0.08,
		[16] = 0.1,
		[17] = 0.1,
		[18] = 0.1,
		[19] = 0.1,
		[20] = 0.1,
		[21] = 0.13,
		[22] = 0.13,
		[23] = 0.13,
		[24] = 0.13,
		[25] = 0.13,
		[26] = 0.16,
		[27] = 0.16,
		[28] = 0.16,
		[29] = 0.16,
		[30] = 0.16,
		[31] = 0.20,
		[32] = 0.20,
		[33] = 0.20,
		[34] = 0.20,
		[35] = 0.20,
		[36] = 0.24,
		[37] = 0.24,
		[38] = 0.24,
		[39] = 0.24,
		[40] = 0.24,
		[41] = 0.30,
		[42] = 0.30,
		[43] = 0.30,
		[44] = 0.30,
		[45] = 0.30,
	};

	--暗器系统BUFF概率 { [技能ID] = { [级数] = 概率} }
	buffRateData = {
		[110001] = {
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 0,
			[5] = 0,
			[6] = 0,
			[7] = 0,
			[8] = 0,
			[9] = 0,
			[10] = 0,
			[11] = 0,
			[12] = 0,
			[13] = 0,
			[14] = 0,
			[15] = 0,
			[16] = 0,
			[17] = 0,
			[18] = 0,
			[19] = 0,
			[20] = 0,
			[21] = 0.05,
			[22] = 0.05,
			[23] = 0.05,
			[24] = 0.05,
			[25] = 0.05,
			[26] = 0.10,
			[27] = 0.10,
			[28] = 0.10,
			[29] = 0.10,
			[30] = 0.10,
			[31] = 0.10,
			[32] = 0.10,
			[33] = 0.10,
			[34] = 0.10,
			[35] = 0.10,
			[36] = 0.15,
			[37] = 0.15,
			[38] = 0.15,
			[39] = 0.15,
			[40] = 0.15,
			[41] = 0.15,
			[42] = 0.15,
			[43] = 0.15,
			[44] = 0.15,
			[45] = 0.15,
		};
		[110002] = {
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 0,
			[5] = 0,
			[6] = 0,
			[7] = 0,
			[8] = 0,
			[9] = 0,
			[10] = 0,
			[11] = 0,
			[12] = 0,
			[13] = 0,
			[14] = 0,
			[15] = 0,
			[16] = 0.05,
			[17] = 0.05,
			[18] = 0.05,
			[19] = 0.05,
			[20] = 0.05,
			[21] = 0.10,
			[22] = 0.10,
			[23] = 0.10,
			[24] = 0.10,
			[25] = 0.10,
			[26] = 0.10,
			[27] = 0.10,
			[28] = 0.10,
			[29] = 0.10,
			[30] = 0.10,
			[31] = 0.15,
			[32] = 0.15,
			[33] = 0.15,
			[34] = 0.15,
			[35] = 0.15,
			[36] = 0.15,
			[37] = 0.15,
			[38] = 0.15,
			[39] = 0.15,
			[40] = 0.15,
			[41] = 0.20,
			[42] = 0.20,
			[43] = 0.20,
			[44] = 0.20,
			[45] = 0.20,
		};
		[110003] = {
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 0,
			[5] = 0,
			[6] = 0,
			[7] = 0,
			[8] = 0,
			[9] = 0,
			[10] = 0,
			[11] = 0,
			[12] = 0,
			[13] = 0,
			[14] = 0,
			[15] = 0,
			[16] = 0,
			[17] = 0,
			[18] = 0,
			[19] = 0,
			[20] = 0,
			[21] = 0,
			[22] = 0,
			[23] = 0,
			[24] = 0,
			[25] = 0,
			[26] = 0.05,
			[27] = 0.05,
			[28] = 0.05,
			[29] = 0.05,
			[30] = 0.05,
			[31] = 0.05,
			[32] = 0.05,
			[33] = 0.05,
			[34] = 0.05,
			[35] = 0.05,
			[36] = 0.10,
			[37] = 0.10,
			[38] = 0.10,
			[39] = 0.10,
			[40] = 0.10,
			[41] = 0.10,
			[42] = 0.10,
			[43] = 0.10,
			[44] = 0.10,
			[45] = 0.10,
		};
		[110004] = {
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 0,
			[5] = 0,
			[6] = 0,
			[7] = 0,
			[8] = 0,
			[9] = 0,
			[10] = 0,
			[11] = 0.05,
			[12] = 0.05,
			[13] = 0.05,
			[14] = 0.05,
			[15] = 0.05,
			[16] = 0.05,
			[17] = 0.05,
			[18] = 0.05,
			[19] = 0.05,
			[20] = 0.05,
			[21] = 0.10,
			[22] = 0.10,
			[23] = 0.10,
			[24] = 0.10,
			[25] = 0.10,
			[26] = 0.10,
			[27] = 0.10,
			[28] = 0.10,
			[29] = 0.10,
			[30] = 0.10,
			[31] = 0.10,
			[32] = 0.10,
			[33] = 0.10,
			[34] = 0.10,
			[35] = 0.10,
			[36] = 0.20,
			[37] = 0.20,
			[38] = 0.20,
			[39] = 0.20,
			[40] = 0.20,
			[41] = 0.20,
			[42] = 0.20,
			[43] = 0.20,
			[44] = 0.20,
			[45] = 0.20,
		};
		[110005] = {
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 0,
			[5] = 0,
			[6] = 0,
			[7] = 0,
			[8] = 0,
			[9] = 0,
			[10] = 0,
			[11] = 0,
			[12] = 0,
			[13] = 0,
			[14] = 0,
			[15] = 0,
			[16] = 0,
			[17] = 0,
			[18] = 0,
			[19] = 0,
			[20] = 0,
			[21] = 0,
			[22] = 0,
			[23] = 0,
			[24] = 0,
			[25] = 0,
			[26] = 0,
			[27] = 0,
			[28] = 0,
			[29] = 0,
			[30] = 0,
			[31] = 0.05,
			[32] = 0.05,
			[33] = 0.05,
			[34] = 0.05,
			[35] = 0.05,
			[36] = 0.10,
			[37] = 0.10,
			[38] = 0.10,
			[39] = 0.10,
			[40] = 0.10,
			[41] = 0.10,
			[42] = 0.10,
			[43] = 0.10,
			[44] = 0.10,
			[45] = 0.10,
		};
	};

	--增加暗器经验的物品
	--[物品ID] = 增加的经验值 
	AddExp = {
			[4100502] = 200; 
	};
	--开启暗器需要的物品，即投掷的物品
	--[编号] = 物品ID
	useItem = {
			[1] = 4100503;
	};
	--成功使用技能增加的修炼值
	useSkillExp = 3;

	--阶数公告等级,几阶开始公告
	messageClass = 1;

	--经验值获取等级差
	expLevelDiff = 10;

	--开启“自动升阶”的阶数
	AutoUpLadder = 3;
	
	--自动升阶的间隔时间(单位：毫秒)
	AutoUpTime = 2000;
	
	--批量使用的最大值
	MaxNum = 99;
	--阶数
	classInfo =
	{
		--[[
			[阶数] = {
						needItems  升阶所需物品 ： [物品ID] = 个数
						nMoney = 升阶需要消耗的银两
						gold = 元宝
						levelNum = 当前阶对应几个等级，方便策划配不同等级数量的阶
						UpGaiLv = 天官赐福上显示的概率
						skillType = 技能类型
						Descrition = 技能描述 4100501
			}2400110
			]]
		[1] = {
				needItems = {
								[4100501] = 2;
				};
				nMoney = 10000;
				levelNum = 5;
				UpGaiLv = T"极高";
				skillType = "";
				Descrition = T"以铜钱磨光边缘而成，此镖易于制造，可大量携带，使用隐蔽，可攻敌之眼、咽喉等部位，只是此镖轻薄难以掌握，攻击距离有限，最大的弊病在于——穷人慎用。";
				};
		[2] = {
				needItems = {
								[4100501] = 3;
				};
				nMoney = 20000;
				levelNum = 5;
				UpGaiLv = T"高";
				skillType = "";
				Descrition = T"取火山峡谷的千年磁石打造，日照则明，月照则暗，内力深厚者可百步飞针，见血封喉，杀人于无形之中。";
				};
		[3] = {
				needItems = {
								[4100501] = 3;
				};
				nMoney = 40000;
				levelNum = 5;
				UpGaiLv = T"一般";
				skillType = "";
				Descrition = T"精铁打造的小型飞镖，做工精巧，细致，投掷时犹如流星闪过，一纵即逝，让人难以察觉，任你高手宗师，也是防不胜防。";
				};
		[4] = {
				needItems = {
								[4100501] = 4;
				};
				nMoney = 60000;
				levelNum = 5;
				UpGaiLv = T"低";
				skillType = "";
				Descrition = T"从唐门流出的暗器，刀身上锐，刃薄如纸，如飞燕之尾翼，流畅锋利，飞刀脱手直如燕击长空，迅疾轻盈，极稳极准，例无虚发。";
				};
		[5] = {
				needItems = {
								[4100501] = 5;
				};
				nMoney = 100000;
				levelNum = 5;
				UpGaiLv = T"极低";
				skillType = "";
				Descrition = T"生于雪山，本名川谷，果实圆白而坚硬，如珐琅质。又称金刚菩提子，为坚硬无比，无坚不摧之意，可摧毁一切邪恶之力，平日串成念珠持于手中，危急时数珠齐发，万难抵挡。";
				};
		[6] = {
				needItems = {
								[4100501] = 6;
				};
				nMoney = 200000;
				levelNum = 5;
				UpGaiLv = T"极低";
				skillType = "";
				Descrition = T"当今天下机械类暗器之代表作，通体由纯金打造，雕刻精细，匣内暗箭可自动连发，犹如孔雀开屏，辉煌而灿烂，然而，就在你被这种惊人的壮景感动得目眩神迷时，它已然收割去你的性命。";
				};
		[7] = {
				needItems = {
								[4100501] = 8;
				};
				nMoney = 200000;
				levelNum = 5;
				UpGaiLv = T"极低";
				skillType = "";
				Descrition = T"西域毒圣用尽毕生所研制的毒镖，集青蛇，蝎子，蛤蟆，蜘蛛，蜈蚣五毒于一体，此镖无形无影，须发内力出镖，宛若一缕青烟飘过，若中此镖，必万毒攻心，七窍出血而亡。";
				};
		[8] = {
				needItems = {
								[4100501] = 15;
				};
				nMoney = 220000;
				levelNum = 5;
				UpGaiLv = T"极低";
				skillType = "";
				Descrition = T"传说为冬日雪女的勾魂暗器，民间也传有“玄阴迎落日，冰魄尽残钩”的诗句，此针冰魄勾魂，吸人精髓，众多江湖高手皆殒命于此器之下。";
				};
		[9] = {
				needItems = {
								[4100501] = 20;
				};
				nMoney = 250000;
				levelNum = 5;
				UpGaiLv = T"极低";
				skillType = "";
				Descrition = T"上古巧匠采集神龙的尖牙，用九阳真火炼制的极品暗器，内置子母双镖，母体为盘状，子体为百余支四尖镖叠加，此器一出，如流星射月，方圆数里内无人幸免。";
				};
	};

	--升阶成功率 {[阶数] = 概率}
	
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
	};
	SuccessRate_tgValueData={

		[1]={[1]=6		,[2]=10		},
		[2]={[1]=45		,[2]=70  	},
		[3]={[1]=115	,[2]=150	},
		[4]={[1]=275	,[2]=350	},
		[5]={[1]=850	,[2]=1050	},
		[6]={[1]=2980	,[2]=3200	},
		[7]={[1]=8000	,[2]=8500	},
		[8]={[1]=10000	,[2]=11000	},
		[9]={[1]=12000	,[2]=13000	},
	};
	--天官赐福,classIndex = 阶数，tgValue = 天官经验
	SuccessRate = function(nClassIndex,tgValue)
		local rate=0
		if tgValue< _G.HiddenWeaponConfig.SuccessRate_tgValueData[nClassIndex][1] then
			rate=0
		elseif tgValue> _G.HiddenWeaponConfig.SuccessRate_tgValueData[nClassIndex][2] then
			rate=10000
		else
			rate = _G.HiddenWeaponConfig.SuccessRate_SuccessRateData[nClassIndex]*10000
		end

		return rate;
	end;

	--[[
		等级信息
		[等级] = {
					exerciseValue = 经验；
					dwAttack = 攻击；
					dwDefense = 防御；
					dwFlee = 身法；
					dwCrit = 暴击；
					dwHPMax = 生命；
					dwAppendCrit = 暴击伤害；
					dwPoJiaValue = 破甲
					dwMPMax = 内力
					dwAddHarm = 攻击能力（暗器的基础攻击属性）
					dwHarm = 额外加成的攻击（暗器的基础攻击属性）
					dwOdds = 触发的概率（暗器的基础攻击属性）
					LastTime1 = 技能失心持续时间
					LastTime2 = 技能割腕持续时间
					HPLostPer = 技能割腕掉血的百分比
					LastTime3 = 技能跛足持续时间时间
					SpeedLostPer = 技能跛足持续时间减速
					LastTime4 = 技能锁喉持续时间
					HarmCount = 技能拘魂伤害次数
		}	
	]]
	levelInfo =
	{--等级     经验               攻击             暴击      生命          破甲值           额外加成     失心时间     割腕时间     割腕掉血  跛足时间  跛足减速     锁喉时间     拘魂伤害次数
		[1] = {exerciseValue = 100;dwAttack = 1050; dwCrit=177;dwHPMax=3675; dwPoJiaValue=151; dwAddHarm=1;LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=0;SpeedLostPer=0;LastTime4=0;HarmCount=0;};
		[2] = {exerciseValue = 250;dwAttack = 1105; dwCrit=181;dwHPMax=3867; dwPoJiaValue=155; dwAddHarm=1;LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=0;SpeedLostPer=0;LastTime4=0;HarmCount=0;};
		[3] = {exerciseValue = 450;dwAttack = 1160; dwCrit=185;dwHPMax=4060; dwPoJiaValue=159; dwAddHarm=2; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=0;SpeedLostPer=0;LastTime4=0;HarmCount=0;};
		[4] = {exerciseValue = 750;dwAttack = 1215; dwCrit=189;dwHPMax=4252; dwPoJiaValue=162; dwAddHarm=2; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=0;SpeedLostPer=0;LastTime4=0;HarmCount=0;};
		[5] = {exerciseValue = 1150;dwAttack = 1270; dwCrit=193;dwHPMax=4445; dwPoJiaValue=166; dwAddHarm=3; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=0;SpeedLostPer=0;LastTime4=0;HarmCount=0;};
		[6] = {exerciseValue = 1750;dwAttack = 1440; dwCrit=213;dwHPMax=5040; dwPoJiaValue=183; dwAddHarm=5; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=0;SpeedLostPer=0;LastTime4=0;HarmCount=0;};
		[7] = {exerciseValue = 2550;dwAttack = 1550; dwCrit=223;dwHPMax=5425; dwPoJiaValue=192; dwAddHarm=5; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=0;SpeedLostPer=0;LastTime4=0;HarmCount=0;};
		[8] = {exerciseValue = 3650;dwAttack = 1660; dwCrit=233;dwHPMax=5810; dwPoJiaValue=201; dwAddHarm=6; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=0;SpeedLostPer=0;LastTime4=0;HarmCount=0;};
		[9] = {exerciseValue = 5050;dwAttack = 1770; dwCrit=243;dwHPMax=6195; dwPoJiaValue=210; dwAddHarm=6; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=0;SpeedLostPer=0;LastTime4=0;HarmCount=0;};
		[10] = {exerciseValue = 6850;dwAttack = 1880; dwCrit=252;dwHPMax=6580; dwPoJiaValue=218; dwAddHarm=7; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=0;SpeedLostPer=0;LastTime4=0;HarmCount=0;};
		[11] = {exerciseValue = 9050;dwAttack = 2160; dwCrit=283;dwHPMax=7560; dwPoJiaValue=245; dwAddHarm=10; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=2;SpeedLostPer=5;LastTime4=0;HarmCount=0;};
		[12] = {exerciseValue = 11750;dwAttack = 2325; dwCrit=298;dwHPMax=8137; dwPoJiaValue=258; dwAddHarm=10; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=2;SpeedLostPer=5;LastTime4=0;HarmCount=0;};
		[13] = {exerciseValue = 14950;dwAttack = 2490; dwCrit=312;dwHPMax=8715; dwPoJiaValue=271; dwAddHarm=11; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=2;SpeedLostPer=5;LastTime4=0;HarmCount=0;};
		[14] = {exerciseValue = 18750;dwAttack = 2655; dwCrit=326;dwHPMax=9292; dwPoJiaValue=283; dwAddHarm=11; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=2;SpeedLostPer=5;LastTime4=0;HarmCount=0;};
		[15] = {exerciseValue = 23150;dwAttack = 2820; dwCrit=339;dwHPMax=9870; dwPoJiaValue=295; dwAddHarm=12; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=2;SpeedLostPer=5;LastTime4=0;HarmCount=0;};
		[16] = {exerciseValue = 31650;dwAttack = 3240; dwCrit=381;dwHPMax=11340; dwPoJiaValue=332; dwAddHarm=15; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=2;SpeedLostPer=10;LastTime4=2;HarmCount=0;};
		[17] = {exerciseValue = 44450;dwAttack = 3515; dwCrit=405;dwHPMax=12302; dwPoJiaValue=353; dwAddHarm=15; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=2;SpeedLostPer=10;LastTime4=2;HarmCount=0;};
		[18] = {exerciseValue = 61750;dwAttack = 3790; dwCrit=428;dwHPMax=13265; dwPoJiaValue=374; dwAddHarm=16; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=2;SpeedLostPer=10;LastTime4=2;HarmCount=0;};
		[19] = {exerciseValue = 83750;dwAttack = 4065; dwCrit=450;dwHPMax=14227; dwPoJiaValue=394; dwAddHarm=16; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=2;SpeedLostPer=10;LastTime4=2;HarmCount=0;};
		[20] = {exerciseValue = 110650;dwAttack = 4340; dwCrit=472;dwHPMax=15190; dwPoJiaValue=413; dwAddHarm=17; LastTime1=0;LastTime2=0;HPLostPer=0;LastTime3=2;SpeedLostPer=10;LastTime4=2;HarmCount=0;};
		[21] = {exerciseValue = 143350;dwAttack = 5010; dwCrit=534;dwHPMax=17535; dwPoJiaValue=468; dwAddHarm=20; LastTime1=2;LastTime2=0;HPLostPer=0;LastTime3=2;SpeedLostPer=10;LastTime4=2;HarmCount=0;};
		[22] = {exerciseValue = 182050;dwAttack = 5395; dwCrit=565;dwHPMax=18882; dwPoJiaValue=495; dwAddHarm=20; LastTime1=2;LastTime2=0;HPLostPer=0;LastTime3=2;SpeedLostPer=10;LastTime4=2;HarmCount=0;};
		[23] = {exerciseValue = 226950;dwAttack = 5780; dwCrit=595;dwHPMax=20230; dwPoJiaValue=522; dwAddHarm=21; LastTime1=2;LastTime2=0;HPLostPer=0;LastTime3=2;SpeedLostPer=10;LastTime4=2;HarmCount=0;};
		[24] = {exerciseValue = 278250;dwAttack = 6165; dwCrit=624;dwHPMax=21577; dwPoJiaValue=548; dwAddHarm=21; LastTime1=2;LastTime2=0;HPLostPer=0;LastTime3=2;SpeedLostPer=10;LastTime4=2;HarmCount=0;};
		[25] = {exerciseValue = 336150;dwAttack = 6550; dwCrit=651;dwHPMax=22925; dwPoJiaValue=572; dwAddHarm=22; LastTime1=2;LastTime2=0;HPLostPer=0;LastTime3=2;SpeedLostPer=10;LastTime4=2;HarmCount=0;};
		[26] = {exerciseValue = 401750;dwAttack = 7490; dwCrit=732;dwHPMax=26215; dwPoJiaValue=644; dwAddHarm=25; LastTime1=2;LastTime2=2;HPLostPer=3;LastTime3=3;SpeedLostPer=10;LastTime4=3;HarmCount=0;};
		[27] = {exerciseValue = 475250;dwAttack = 8095; dwCrit=778;dwHPMax=28332; dwPoJiaValue=685; dwAddHarm=25; LastTime1=2;LastTime2=2;HPLostPer=3;LastTime3=3;SpeedLostPer=10;LastTime4=3;HarmCount=0;};
		[28] = {exerciseValue = 556850;dwAttack = 8700; dwCrit=823;dwHPMax=30450; dwPoJiaValue=725; dwAddHarm=26; LastTime1=2;LastTime2=2;HPLostPer=3;LastTime3=3;SpeedLostPer=10;LastTime4=3;HarmCount=0;};
		[29] = {exerciseValue = 646750;dwAttack = 9305; dwCrit=866;dwHPMax=32567; dwPoJiaValue=763; dwAddHarm=26; LastTime1=2;LastTime2=2;HPLostPer=3;LastTime3=3;SpeedLostPer=10;LastTime4=3;HarmCount=0;};
		[30] = {exerciseValue = 745150;dwAttack = 9910; dwCrit=908;dwHPMax=34685; dwPoJiaValue=801; dwAddHarm=27; LastTime1=2;LastTime2=2;HPLostPer=3;LastTime3=3;SpeedLostPer=10;LastTime4=3;HarmCount=0;};
		[31] = {exerciseValue = 853350;dwAttack = 11270; dwCrit=1016;dwHPMax=39445; dwPoJiaValue=897; dwAddHarm=30; LastTime1=3;LastTime2=2;HPLostPer=4;LastTime3=3;SpeedLostPer=15;LastTime4=3;HarmCount=2;};
		[32] = {exerciseValue = 971550;dwAttack = 12095; dwCrit=1074;dwHPMax=42332; dwPoJiaValue=949; dwAddHarm=30; LastTime1=3;LastTime2=2;HPLostPer=4;LastTime3=3;SpeedLostPer=15;LastTime4=3;HarmCount=2;};
		[33] = {exerciseValue = 1099950;dwAttack = 12920; dwCrit=1130;dwHPMax=45220; dwPoJiaValue=999; dwAddHarm=31; LastTime1=3;LastTime2=2;HPLostPer=4;LastTime3=3;SpeedLostPer=15;LastTime4=3;HarmCount=2;};
		[34] = {exerciseValue = 1238750;dwAttack = 13745; dwCrit=1185;dwHPMax=48107; dwPoJiaValue=1048; dwAddHarm=31; LastTime1=3;LastTime2=2;HPLostPer=4;LastTime3=3;SpeedLostPer=15;LastTime4=3;HarmCount=2;};
		[35] = {exerciseValue = 1388150;dwAttack = 14570; dwCrit=1238;dwHPMax=50995; dwPoJiaValue=1095; dwAddHarm=32; LastTime1=3;LastTime2=2;HPLostPer=4;LastTime3=3;SpeedLostPer=15;LastTime4=3;HarmCount=2;};
		[36] = {exerciseValue = 1549650;dwAttack = 16380; dwCrit=1372;dwHPMax=57330; dwPoJiaValue=1214; dwAddHarm=35; LastTime1=3;LastTime2=2;HPLostPer=4;LastTime3=3;SpeedLostPer=15;LastTime4=4;HarmCount=2;};
		[37] = {exerciseValue = 1723450;dwAttack = 17645; dwCrit=1457;dwHPMax=61757; dwPoJiaValue=1290; dwAddHarm=35; LastTime1=3;LastTime2=2;HPLostPer=4;LastTime3=3;SpeedLostPer=15;LastTime4=4;HarmCount=2;};
		[38] = {exerciseValue = 1909750;dwAttack = 18910; dwCrit=1540;dwHPMax=66185; dwPoJiaValue=1365; dwAddHarm=36; LastTime1=3;LastTime2=2;HPLostPer=4;LastTime3=3;SpeedLostPer=15;LastTime4=4;HarmCount=2;};
		[39] = {exerciseValue = 2108750;dwAttack = 20175; dwCrit=1621;dwHPMax=70612; dwPoJiaValue=1437; dwAddHarm=36; LastTime1=3;LastTime2=2;HPLostPer=4;LastTime3=3;SpeedLostPer=15;LastTime4=4;HarmCount=2;};
		[40] = {exerciseValue = 2320650;dwAttack = 21440; dwCrit=1700;dwHPMax=75040; dwPoJiaValue=1507; dwAddHarm=37; LastTime1=3;LastTime2=2;HPLostPer=4;LastTime3=3;SpeedLostPer=15;LastTime4=4;HarmCount=2;};
		-- [41] = {exerciseValue = 1405780;dwAttack = 24010; dwCrit=1878;dwHPMax=84035; dwPoJiaValue=1666; dwAddHarm=40; LastTime1=4;LastTime2=3;HPLostPer=4;LastTime3=4;SpeedLostPer=15;LastTime4=4;HarmCount=3;};
		-- [42] = {exerciseValue = 1513040;dwAttack = 26155; dwCrit=2019;dwHPMax=91542; dwPoJiaValue=1792; dwAddHarm=40; LastTime1=4;LastTime2=3;HPLostPer=4;LastTime3=4;SpeedLostPer=15;LastTime4=4;HarmCount=3;};
		-- [43] = {exerciseValue = 1625880;dwAttack = 28300; dwCrit=2150;dwHPMax=99050; dwPoJiaValue=1915; dwAddHarm=41; LastTime1=4;LastTime2=3;HPLostPer=4;LastTime3=4;SpeedLostPer=15;LastTime4=4;HarmCount=3;};
		-- [44] = {exerciseValue = 1744400;dwAttack = 30445; dwCrit=2290;dwHPMax=106557; dwPoJiaValue=2035; dwAddHarm=41; LastTime1=4;LastTime2=3;HPLostPer=4;LastTime3=4;SpeedLostPer=15;LastTime4=4;HarmCount=3;};
		-- [45] = {exerciseValue = 1868700;dwAttack = 32590; dwCrit=2421;dwHPMax=114065; dwPoJiaValue=2152; dwAddHarm=42; LastTime1=4;LastTime2=3;HPLostPer=4;LastTime3=4;SpeedLostPer=15;LastTime4=4;HarmCount=3;};
		};
	--[[
		技能信息
		[编号] = {
					skillId = 技能ID
					img     = 技能激活的图片
					grayImg = 技能未激活的图片
					des     = 技能描述
					name    = 技能名称
					enableMethod = 技能激活条件
		}
	]]
	SkillShowInfo = {
		[1] = {skillId = 110004, img = "Icon_sk_bozu_1.png", grayImg = "Icon_sk_bozu_0.png" , des = T"<font color='#FFFF00'>触发暗器效果时<font color='#00FF00'>降低敌方%d%%移动速度，持续%d秒</font>，暗器等级影响触发几率</font>", name = T"<font color='#03B3FD'>暗器·跛足</font>", enableMethod = T"<font size='12' color='#f15d27'>激活条件：流星镖</font>"},
		[2] = {skillId = 110002, img = "Icon_sk_suohou_1.png", grayImg = "Icon_sk_suohou_0.png" ,des = T"<font color='#FFFF00'>触发暗器效果时<font color='#00FF00'>使敌方无法使用技能，持续%d秒</font>，暗器等级影响触发几率</font>", name = T"<font color='#03B3FD'>暗器·锁喉</font>", enableMethod = T"<font size='12' color='#f15d27'>激活条件：飞燕</font>"},
		[3] = {skillId = 110001, img = "Icon_sk_20000006_1.png", grayImg = "Icon_sk_20000006_0.png" ,des = T"<font color='#FFFF00'>触发暗器效果时<font color='#00FF00'>使敌方无法命中目标，持续%d秒</font>，暗器等级影响触发几率</font>", name = T"<font color='#B032EE'>暗器·失心</font>", enableMethod = T"<font size='12' color='#f15d27'>激活条件：菩提子</font>"},
		[4] = {skillId = 110003, img = "Icon_sk_gewan_1.png", grayImg = "Icon_sk_gewan_0.png" ,des = T"<font color='#FFFF00'>触发暗器效果时<font color='#00FF00'>使敌方每秒损失%d%%血量，持续%d秒</font>，暗器等级影响触发几率</font>", name = T"<font color='#B032EE'>暗器·割腕</font>", enableMethod = T"<font size='12' color='#f15d27'>激活条件：孔雀翎</font>"},
		[5] = {skillId = 110005, img = "Icon_sk_juhun_1.png",  grayImg = "Icon_sk_juhun_0.png" ,des = T"<font color='#FFFF00'>有一定几率<font color='#00FF00'>对敌方造成%d次暗器伤害(%d阶以上可造成%d次暗器伤害)</font>，暗器等级影响触发几率</font>", name = T"<font color='#FFFF00'>暗器·拘魂</font>", enableMethod = T"<font size='12' color='#f15d27'>激活条件：五罗青烟镖</font>"},
	};
	--暗器修炼满阶后 第5个技能显示的TIPS内容
	Skill5Des2 = T"<font color='#FFFF00'>有一定几率<font color='#00FF00'>使敌方造成%d次暗器伤害</font>，暗器等级影响触发几率</font>";
	--技能类型
	HiddenWeaponSkillType = T"<font color='#ffc721'>【被动技能】</font>",
	--[[
		[阶数] = {
				[显示顺序] = 技能ID,	
		}
	]]
	skillTbl = {
				[1] = {
				};
				[2] = {
				};
				[3] = {
					[1] = 110004,
				};
				[4] = {
					[1] = 110004,
					[2] = 110002,
				};
				[5] = {
					[1] = 110004,
					[2] = 110002,
					[3] = 110001,						
				};
				[6] = {
					[1] = 110004,
					[2] = 110002,
					[3] = 110001,
					[4] = 110003,						
				};
				[7] = {
					[1] = 110004,
					[2] = 110002,
					[3] = 110001,
					[4] = 110003,
					[5] = 110005,
				};
				[8] = {
					[1] = 110004,
					[2] = 110002,
					[3] = 110001,
					[4] = 110003,
					[5] = 110005,
				};
				[9] = {
					[1] = 110004,
					[2] = 110002,
					[3] = 110001,
					[4] = 110003,
					[5] = 110005,
				};
	};
	
	--升阶后的初始经验
	AttackValue = function(attackValue, level)  --attackValue:人物攻击力, ladder:阶数, level:等级
		local AttPer = _G.HiddenWeaponConfig.levelInfo[level].dwAddHarm / 100;
		-- local HwBase = _G.HiddenWeaponConfig.levelInfo[level].dwAddHarm;
		return attackValue * (0 + AttPer); 
	end;
	--[[
		属性顺序显示
		[属性的位置序号] = 属性名称；
		
		注意：控件上只给了4个属性，要从8个属性中选4个。序号只有1，2，3，4
	]]
	Shunxu = {
				[1] = "dwHPMax";
				[2] = "dwAttack";
				[3] = "dwCrit";
				[4] = "dwPoJiaValue";
				-- [2] = "dwDefense";
				-- [3] = "dwFlee";
				--[6] = "dwAppendCrit";
				--[8] = "dwMPMax";
			  };
	--[[
		界面属性格式化字符串
		[属性名称] = 格式化字符串；
	]]
	ProperyName 	= { 																
				dwHPMax 		= T"<font color='#FFFF00'>生命</font> + %d ";
				-- dwAppendCrit 	= T"<font color='#FFFF00'>暴击伤害（百分比）</font> + %d ";
				dwAttack 		= T"<font color='#FFFF00'>攻击</font> + %d "; 
                -- dwDefense 		= T"<font color='#FFFF00'>防御</font> + %d ";
                dwCrit 			= T"<font color='#FFFF00'>暴击</font> + %d ";
                -- dwFlee 			= T"<font color='#FFFF00'>身法</font> + %d ";				
				dwPoJiaValue 	= T"<font color='#FFFF00'>破甲值</font> + %d";
				--dwMPMax 		= T"<font color='#FFFF00'>内力值</font> + %d";
			};

	--[[
		暗器名称
		[阶数] = {Name = 暗器名称}；
	]]
	GourdString =
			{
				[1] = {Name = T"一阶·金钱镖";};
				[2] = {Name = T"二阶·无影针";};
				[3] = {Name = T"三阶·流星镖";};
				[4] = {Name = T"四阶·飞燕";};
				[5] = {Name = T"五阶·菩提子";};
				[6] = {Name = T"六阶·孔雀翎";};
				[7] = {Name = T"七阶·五罗青烟镖";};
				[8] = {Name = T"八阶·玄阴冰魄针";};
				--[9] = {Name = T"九阶·子母龙牙镖";};
			};

	--[[
		模型配置
		[阶数] = {model = 模型；action = 动作}；
	]]
	ModelIDConfig = 
	{	
		AvatarRect	= {x = 1100, y = 1100};
		--阶数
		[1] = {
			model = {	
				sknFile = "A_Equip_AnQi_01.skn"; sklFile="A_Equip_AnQi_01.skl"; sanFile ="A_Equip_AnQi_01_XiuXian.san|anqi_01.tag";
				param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_AnQi_01_DaiJi.san"; 
			};
			action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
		};
		[2] = {
			model = {
				sknFile = "A_Equip_AnQi_02.skn"; sklFile="A_Equip_AnQi_02.skl"; sanFile ="A_Equip_AnQi_02_XiuXian.san|anqi_02.tag";
				param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0;lieAction = "A_Equip_AnQi_02_DaiJi.san";
			};
			action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}}, 
		};
		[3] = {
			model = {
				sknFile = "A_Equip_AnQi_03.skn"; sklFile="A_Equip_AnQi_03.skl"; sanFile ="A_Equip_AnQi_03_XiuXian.san|anqi_03.tag"; 
				param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_AnQi_03_DaiJi.san";
			};
			action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
		};
		[4] = {
			model = {
				sknFile = "A_Equip_AnQi_04.skn"; sklFile="A_Equip_AnQi_04.skl"; sanFile ="A_Equip_AnQi_04_XiuXian.san|anqi_04.tag";
				param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_AnQi_04_DaiJi.san";
			},
			action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
		};
		[5] = {
			model = {
				sknFile = "A_Equip_AnQi_05.skn"; sklFile="A_Equip_AnQi_05.skl"; sanFile ="A_Equip_AnQi_05_XiuXian.san|anqi_05.tag"; 
				param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_AnQi_05_DaiJi.san";
			},
			action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
		};
		[6] = {
			model = {
				sknFile = "A_Equip_AnQi_06.skn"; sklFile="A_Equip_AnQi_06.skl"; sanFile ="A_Equip_AnQi_06_XiuXian.san|anqi_06.tag"; 
				param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_AnQi_06_DaiJi.san";
			},
			action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
		};
		[7] = {
			model = {
				sknFile = "A_Equip_AnQi_07.skn"; sklFile="A_Equip_AnQi_07.skl"; sanFile ="A_Equip_AnQi_07_XiuXian.san|anqi_07.tag"; 
				param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_AnQi_07_DaiJi.san";
			},
			action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
		};
		[8] = {
			model = {
				sknFile = "A_Equip_AnQi_08.skn"; sklFile="A_Equip_AnQi_08.skl"; sanFile ="A_Equip_AnQi_08_XiuXian.san|anqi_08.tag"; 
				param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_AnQi_08_DaiJi.san";
			},
			action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
		};
		[9] = {
			model = {
				sknFile = "A_Equip_AnQi_09.skn"; sklFile="A_Equip_AnQi_09.skl"; sanFile ="A_Equip_AnQi_09_XiuXian.san"; 
				param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_AnQi_09_DaiJi.san";
			},
			action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
		};
	};
	--文字说明
	Text = {
			Harm = T"<font color='#4daeed'>%d(%d%%的人物攻击力)</font>";
			Odds = "<font color='#4daeed'>%d%%</font>";
			CountLess = T"如意匣数量不足，无法开启暗器使用";
			CountLess2 = T"《天女散花》数量不足，无法快速修炼";
			QuickGet = T"快速修炼";
			TuPo = T"突破瓶颈";
			StopUp = T"停止升阶";
			AutoUp = T"自动升阶";
			ItemUse1 = " <U>%sX%d</U>";
			ItemUse2 = "<U><font color='#FF0000'>%sX%d</font></U>";
			-- ItemUse1 = "%sX%d";
			-- ItemUse2 = "<font color='#FF0000'>%sX%d</font>";
			ItemUseS1 = "%s %d/%d";
			ItemUseS2 = "<font color='#FF0000'>%s %d/%d</font>";
			MoneyShow1 = "%s";
			MoneyShow2 = "<font color='#FF0000'>%s</font>";
			GetWay = T"<font color='#DCB857'>获得途径：</font><br/>" .. 
					T"<font color='#D9CCBD'>1.击杀野怪或BOSS有几率掉落 " .. 
					T"<U><a href = 'asfunction:hrefevent,1'><font color='#0dab01'>查看BOSS</font></a></U><br/>" ..
					T"2.通关副本有几率获得 ".."<U><a href = 'asfunction:hrefevent,2'>" .. 
					T"<font color='#0dab01'>立即前往</font></a></U><br/>";
			Error1 = T"升阶所需的银两不足";
			Error2 = T"升阶所需的物品不足";
			Error3 = T"购买物品的元宝不足";
			Error4 = T"购买物品的礼金不足";
			Error5 = T"您所使用的物品数量超过了升阶所需要的数量";
			UpFailure = T"大侠本次升阶尚未成功，请再接再厉！";
			IsNoHave	= T"65级开启暗器功能";	--BTNTips暂未开启暗器功能
			NoAuthText	= T"对方暂未开启暗器，无法查看";	
			IsHaveTips	= T"<font color='#ffffff'>当前暗器阶段：</font><font color='#4daeed'>%s阶</font><br/><font color='#ffffff'>当前暗器等级：</font><font color='#4daeed'>%s级</font><br/><font color='#FFFF00'>【点击暗器按钮打开暗器界面】</font>";	--BTNTips已开启
			broadcast	= T"恭喜大侠%s将暗器提升至%s";     --广播
			IWantStr    = T"我也试试！";		--广播我也试试
			AddShuXing = "+ %d";
			IncomeInfo = T"暗器修炼值 +%d";
			Jihuo = T"<font color='#ffff00'>暗器</font><br/><br/><font color='#31cf32'> 您的包裹中如意匣数量充足</font><br/><br/><font color='#4daeed'> 打开暗器界面→开启暗器使用→消耗如意匣→触发暗器能力</font><br/><br/><font color='#4daeed'> 如意匣可通过以下途径获得：</font><br/><font color='#4daeed'> 1.商城购买<br/> 2.副本掉落<br/> 3.击杀怪物掉落</font>";
			WeiJihuo = T"<font color='#ffff00'>暗器</font><br/><br/><font color='#FF0000'> 您的包裹中如意匣数量不足</font><br/><br/><font color='#4daeed'> 打开暗器界面→开启暗器使用→消耗如意匣→触发暗器能力</font><br/><br/><font color='#4daeed'> 如意匣可通过以下途径获得：</font><br/><font color='#4daeed'> 1.商城购买<br/> 2.副本掉落<br/> 3.击杀怪物掉落</font>";		
	};
}
_G.AnQiWasteYuanBao = true;   ---true:只使用元宝， false:使用元宝，礼金

--[[
   [ \brief 获取当前等级属性
   [ \param number dwLevel 传入的等级
   [ \return table 当前等级的所有属性
   [ \{dwAttack = 100, dwDefense = 150, dwFlee = 150, dwCrit = 100,
		dwHPMax = 100, dwAppendCrit = 100; dwPoJiaValue = 0; dwMPMax = 0 }
   ]]
function HiddenWeaponConfig:GetProInfo(dwLevel)
	local tInfo = {dwAttack=0,dwHPMax=0,dwPoJiaValue=0,dwCrit=0 };
	if dwLevel == 0 then return tInfo end
	local dwLevelInfo =HiddenWeaponConfig.levelInfo[dwLevel]
	for k,v in pairs(tInfo) do
		tInfo[k] = dwLevelInfo[k];
	end
	return tInfo
end

--[[
   [ \brief 获取阶段和等级
   [ \param number dwLevel 传入的等级
   [ \return table 该等级对应的阶数与阶段内等级
   [ \{nLadder = 阶数；nLevel = 阶段内等级}
   ]]
function HiddenWeaponConfig:GetLevelInfo(dwLevel)
	local tInfo = {nLadder = 1,nLevel = 1}
	local Num  = math.floor(dwLevel%5) 
	if Num == 0 then
		tInfo.nLadder = math.floor(dwLevel/5);
		tInfo.nLevel  = 5
	else
		tInfo.nLadder = math.floor(dwLevel/5)+1;
		tInfo.nLevel  = Num
	end
	return tInfo
end

--[[
   [ \brief 通过传入的经验获取总等级
   [ \param number nExp 传入的经验
   [ \return number 总等级
   [ \注意：这个等级是从经验判断的，可能与实际等级不符合；
		例如1500经验，升阶前是15级，升阶后是16级；
   ]]
function HiddenWeaponConfig:GetAllLevelInfo(nExp)
	local nCount = #HiddenWeaponConfig.levelInfo ;
	if nExp >= HiddenWeaponConfig.levelInfo[nCount - 1].exerciseValue then
		return nCount;
	end
	for k,v in ipairs(HiddenWeaponConfig.levelInfo) do
		if nExp <= v.exerciseValue then 
			return k;
		end
	end
end

--[[
   [ \brief 测试value是否在表tab中
   [ \param table tTab 搜索的表
   [ \param table nValue 测试的值
   [ \return true 表示值在表中，false 表示值不在表中 
   ]]
function HiddenWeaponConfig:TableFind(tTab, nValue)
	for k,v in pairs(tTab) do
		if v == nValue then
			return true;
		end
	end
	return false;
end

--[[
   [ \brief 从商城表中获取物品的价格
   [ \param number nType 价格的类型:1 元宝；7 礼金。
   [ \param number nID 物品ID
   [ \return true 物品的价格
   ]]
function HiddenWeaponConfig:GetPrize(nType, nID)
	for k,v in pairs(MallConfig.Goods) do
		if v.type == nType and v.dwItemEnum == nID then
			return v.dwPrice;
		end
	end
	return 0;
end

--[[
   [ \brief 获得升阶需要的物品ID和数量
   [ \param number nLadder 阶数
   [ \return table 物品信息表
   [ \{nID = 物品ID, nCount = 物品数量}
   ]]
function HiddenWeaponConfig:GetUpItemInfo(nLadder)
	local tInfo = {};
	for k,v in pairs(HiddenWeaponConfig.classInfo[nLadder].needItems) do
		tInfo.nID = k;
		tInfo.nCount = v;
	end	
	return tInfo;
end

--[[
   [ \brief 获取增加经验的物品ID
   [ \return number 物品ID
   ]]
function HiddenWeaponConfig:GetAddExpItemInfo()
	local nID = 0;
	for k,v in pairs(HiddenWeaponConfig.AddExp) do
		nID = k;
	end	
	return nID;
end

--[[
   [ \brief 获取掷飞镖所需的物品ID
   [ \return number 物品ID
   ]]
function HiddenWeaponConfig:GetThrowItemInfo()
	local nID = 0;
	for k,v in pairs(HiddenWeaponConfig.useItem) do
		nID = v;
	end	
	return nID;
end

--[[
   [ \brief 获取技能中第一个不为零的值
   [ \return number 物品ID
   ]]
function HiddenWeaponConfig:GetSkillValue()
	local tSkillValue = {LastTime1=0; LastTime2=0; HPLostPer=0;
						 LastTime3=0; SpeedLostPer=0; LastTime4=0;};
	for k, v in ipairs(HiddenWeaponConfig.levelInfo) do
		if tSkillValue.LastTime1 == 0 then
			tSkillValue.LastTime1 = v.LastTime1;
		end
		if tSkillValue.LastTime2 == 0 then
			tSkillValue.LastTime2 = v.LastTime2;
		end
		if tSkillValue.HPLostPer == 0 then
			tSkillValue.HPLostPer = v.HPLostPer;
		end
		if tSkillValue.LastTime3 == 0 then
			tSkillValue.LastTime3 = v.LastTime3;
		end
		if tSkillValue.SpeedLostPer == 0 then
			tSkillValue.SpeedLostPer = v.SpeedLostPer;
		end
		if tSkillValue.LastTime4 == 0 then
			tSkillValue.LastTime4 = v.LastTime4;
		end
	end
	return tSkillValue;
end
