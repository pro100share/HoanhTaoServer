--[[
	[ \brief 盾牌系统 配置文件
	[ \author 路广华，沈祺
	[ \date 2014-6-17
	]]


_G.CShieldConfig = {

	--文字显示信息
	Text = {
			IncomeInfo = "法宝铸造值 +%d";
			sLadder = "<font color='#FFFF00'>%d 阶</font>";
			sLevel = "<font color='#FFFF00'>%d 级</font>";
			ShuoMing = "<font color='#4daeed'>1.大侠每日可通过提交封神玉、惊神玉2种道具获得法宝升阶所需的铸造值<br/></font><font color='#4daeed'>2.封神玉、惊神玉这两种道具每日可提交数量有限</font><font color='#ff0000'>（每日6：00点重置）</font>";
			sZhuZao = "<font color='#4daeed'>%d铸造值</font>";
			Counts = "不限";
			Counts2 = "%d次";
			ItemDes = "<font color='#4daeed'>使用<font color='#4daeed'>%s</font>可快速获取法宝铸造值（每%d个可提升%d铸造值）</font>";
			GoldDes = "<font color='#4daeed'>使用<font color='#4daeed'>%s</font>可快速获取法宝铸造值（每%d元宝可提升%d铸造值）</font>";
			ItemLess = "物品数量不足!";
			GoldLess = "元宝数量不足！";
			CountLess = "本日的次数不足!";
			CountMore = "铸造的次数过多";
			Broadcast	= "恭喜大侠%s将法宝提升至%s";
			IWantStr = "我也试试！";
			NoAuth = "71级开启法宝功能";
			HasAuth = "<font color='#ffffff'>当前法宝阶段：</font><font color='#4daeed'>%s阶</font><br/><font color='#ffffff'>当前法宝等级：</font><font color='#4daeed'>%s级</font><br/><font color='#FFFF00'>【点击法宝按钮打开法宝界面】</font>";
			ZeroErr = "输入数量不能为0";
			NoAuthText	= "对方暂未开启法宝，无法查看";	--查看别人没有权限提示
	};
	--[[使用物品增加经验
		[标号] = {Type = 物品类型（1：类型；2：元宝）；
				  ItemID = 物品ID；
				  BaseNum = 每次消耗的基数；
				  Exp = 每个基数对应的经验；
				  Count = 每天可以消耗的次数(-1 为不限制)；2500161
		}
	]]
	ItemInfo = {
		[1] = {Type = 1; ItemID = 4100509; BaseNum = 1; Exp = 200; Count = 10};
		[2] = {Type = 1; ItemID = 4100510; BaseNum = 1; Exp = 500; Count = 30};
		[3] = {Type = 2; ItemID = 2500161; BaseNum = 100; Exp = 350; Count = 20};
		[4] = {Type = 1; ItemID = 4100511; BaseNum = 1; Exp = 600; Count = -1};
	};
	--元宝ID
	GoldID = 2500161;
	--物品使用次数更新时间
	ResetTime = "06:00";

	--公告等级
	MessageLadder = 1;

	--批量使用的最大值
	MaxNum = 99999;

	--等级属性
	LevelInfo = {
	 --等级     经验           攻击            防御         生命           抵抗暴击           破甲抵抗                 霸体值上限                霸体减伤
		[1]={Exp = 500;  dwAttack = 720;  dwDefense = 792;  dwHPMax = 2880;  dwCritDown = 472;  dwPoJiaDiKang = 436;  dwForbidLimitParam = 500;  dwCutHurtRate   = 0.03;};
		[2]={Exp = 1100;  dwAttack = 810;  dwDefense = 891;  dwHPMax = 3240;  dwCritDown = 481;  dwPoJiaDiKang = 447;  dwForbidLimitParam = 600;  dwCutHurtRate   = 0.031;};
		[3]={Exp = 1900;  dwAttack = 900;  dwDefense = 990;  dwHPMax = 3600;  dwCritDown = 490;  dwPoJiaDiKang = 458;  dwForbidLimitParam = 700;  dwCutHurtRate   = 0.032;};
		[4]={Exp = 3000;  dwAttack = 990;  dwDefense = 1089;  dwHPMax = 3960;  dwCritDown = 499;  dwPoJiaDiKang = 468;  dwForbidLimitParam = 800;  dwCutHurtRate   = 0.033;};
		[5]={Exp = 4500;  dwAttack = 1080;  dwDefense = 1188;  dwHPMax = 4320;  dwCritDown = 508;  dwPoJiaDiKang = 479;  dwForbidLimitParam = 900;  dwCutHurtRate   = 0.034;};
		[6]={Exp = 6500;  dwAttack = 1215;  dwDefense = 1336;  dwHPMax = 4860;  dwCritDown = 521;  dwPoJiaDiKang = 495;  dwForbidLimitParam = 1100;  dwCutHurtRate   = 0.035;};
		[7]={Exp = 9150;  dwAttack = 1350;  dwDefense = 1485;  dwHPMax = 5400;  dwCritDown = 535;  dwPoJiaDiKang = 512;  dwForbidLimitParam = 1300;  dwCutHurtRate   = 0.036;};
		[8]={Exp = 12550;  dwAttack = 1485;  dwDefense = 1633;  dwHPMax = 5940;  dwCritDown = 548;  dwPoJiaDiKang = 528;  dwForbidLimitParam = 1500;  dwCutHurtRate   = 0.037;};
		[9]={Exp = 16800;  dwAttack = 1620;  dwDefense = 1782;  dwHPMax = 6480;  dwCritDown = 562;  dwPoJiaDiKang = 544;  dwForbidLimitParam = 1700;  dwCutHurtRate   = 0.038;};
		[10]={Exp = 22000;  dwAttack = 1755;  dwDefense = 1930;  dwHPMax = 7020;  dwCritDown = 575;  dwPoJiaDiKang = 560;  dwForbidLimitParam = 1900;  dwCutHurtRate   = 0.039;};
		[11]={Exp = 28250;  dwAttack = 1980;  dwDefense = 2178;  dwHPMax = 7920;  dwCritDown = 598;  dwPoJiaDiKang = 587;  dwForbidLimitParam = 2400;  dwCutHurtRate   = 0.041;};
		[12]={Exp = 35800;  dwAttack = 2205;  dwDefense = 2425;  dwHPMax = 8820;  dwCritDown = 620;  dwPoJiaDiKang = 614;  dwForbidLimitParam = 2900;  dwCutHurtRate   = 0.043;};
		[13]={Exp = 44750;  dwAttack = 2430;  dwDefense = 2673;  dwHPMax = 9720;  dwCritDown = 643;  dwPoJiaDiKang = 641;  dwForbidLimitParam = 3400;  dwCutHurtRate   = 0.045;};
		[14]={Exp = 55200;  dwAttack = 2655;  dwDefense = 2920;  dwHPMax = 10620;  dwCritDown = 665;  dwPoJiaDiKang = 668;  dwForbidLimitParam = 3900;  dwCutHurtRate   = 0.047;};
		[15]={Exp = 67250;  dwAttack = 2880;  dwDefense = 3168;  dwHPMax = 11520;  dwCritDown = 688;  dwPoJiaDiKang = 695;  dwForbidLimitParam = 4400;  dwCutHurtRate   = 0.049;};
		[16]={Exp = 81000;  dwAttack = 3240;  dwDefense = 3564;  dwHPMax = 12960;  dwCritDown = 724;  dwPoJiaDiKang = 738;  dwForbidLimitParam = 4900;  dwCutHurtRate   = 0.051;};
		[17]={Exp = 96800;  dwAttack = 3600;  dwDefense = 3960;  dwHPMax = 14400;  dwCritDown = 760;  dwPoJiaDiKang = 782;  dwForbidLimitParam = 5400;  dwCutHurtRate   = 0.053;};
		[18]={Exp = 114750;  dwAttack = 3960;  dwDefense = 4356;  dwHPMax = 15840;  dwCritDown = 796;  dwPoJiaDiKang = 825;  dwForbidLimitParam = 5900;  dwCutHurtRate   = 0.055;};
		[19]={Exp = 134950;  dwAttack = 4320;  dwDefense = 4752;  dwHPMax = 17280;  dwCritDown = 832;  dwPoJiaDiKang = 868;  dwForbidLimitParam = 6400;  dwCutHurtRate   = 0.057;};
		[20]={Exp = 157500;  dwAttack = 4680;  dwDefense = 5148;  dwHPMax = 18720;  dwCritDown = 868;  dwPoJiaDiKang = 911;  dwForbidLimitParam = 6900;  dwCutHurtRate   = 0.059;};
		[21]={Exp = 182500;  dwAttack = 5265;  dwDefense = 5791;  dwHPMax = 21060;  dwCritDown = 926;  dwPoJiaDiKang = 981;  dwForbidLimitParam = 7700;  dwCutHurtRate   = 0.062;};
		[22]={Exp = 210400;  dwAttack = 5850;  dwDefense = 6435;  dwHPMax = 23400;  dwCritDown = 985;  dwPoJiaDiKang = 1052;  dwForbidLimitParam = 8500;  dwCutHurtRate   = 0.065;};
		[23]={Exp = 241300;  dwAttack = 6435;  dwDefense = 7078;  dwHPMax = 25740;  dwCritDown = 1043;  dwPoJiaDiKang = 1122;  dwForbidLimitParam = 9300;  dwCutHurtRate   = 0.068;};
		[24]={Exp = 275300;  dwAttack = 7020;  dwDefense = 7722;  dwHPMax = 28080;  dwCritDown = 1102;  dwPoJiaDiKang = 1192;  dwForbidLimitParam = 10100;  dwCutHurtRate   = 0.071;};
		[25]={Exp = 312500;  dwAttack = 7605;  dwDefense = 8365;  dwHPMax = 30420;  dwCritDown = 1160;  dwPoJiaDiKang = 1262;  dwForbidLimitParam = 10900;  dwCutHurtRate   = 0.074;};
		[26]={Exp = 353000;  dwAttack = 8550;  dwDefense = 9405;  dwHPMax = 34200;  dwCritDown = 1255;  dwPoJiaDiKang = 1376;  dwForbidLimitParam = 11900;  dwCutHurtRate   = 0.077;};
		[27]={Exp = 397350;  dwAttack = 9495;  dwDefense = 10444;  dwHPMax = 37980;  dwCritDown = 1349;  dwPoJiaDiKang = 1489;  dwForbidLimitParam = 12900;  dwCutHurtRate   = 0.08;};
		[28]={Exp = 445650;  dwAttack = 10440;  dwDefense = 11484;  dwHPMax = 41760;  dwCritDown = 1444;  dwPoJiaDiKang = 1602;  dwForbidLimitParam = 13900;  dwCutHurtRate   = 0.083;};
		[29]={Exp = 498000;  dwAttack = 11385;  dwDefense = 12523;  dwHPMax = 45540;  dwCritDown = 1538;  dwPoJiaDiKang = 1716;  dwForbidLimitParam = 14900;  dwCutHurtRate   = 0.086;};
		[30]={Exp = 554500;  dwAttack = 12330;  dwDefense = 13563;  dwHPMax = 49320;  dwCritDown = 1633;  dwPoJiaDiKang = 1829;  dwForbidLimitParam = 15900;  dwCutHurtRate   = 0.089;};
		[31]={Exp = 615250;  dwAttack = 13680;  dwDefense = 15048;  dwHPMax = 54720;  dwCritDown = 1768;  dwPoJiaDiKang = 1991;  dwForbidLimitParam = 17100;  dwCutHurtRate   = 0.094;};
		[32]={Exp = 680900;  dwAttack = 15030;  dwDefense = 16533;  dwHPMax = 60120;  dwCritDown = 1903;  dwPoJiaDiKang = 2153;  dwForbidLimitParam = 18300;  dwCutHurtRate   = 0.099;};
		[33]={Exp = 751550;  dwAttack = 16380;  dwDefense = 18018;  dwHPMax = 65520;  dwCritDown = 2038;  dwPoJiaDiKang = 2315;  dwForbidLimitParam = 19500;  dwCutHurtRate   = 0.104;};
		[34]={Exp = 827300;  dwAttack = 17730;  dwDefense = 19503;  dwHPMax = 70920;  dwCritDown = 2173;  dwPoJiaDiKang = 2477;  dwForbidLimitParam = 20700;  dwCutHurtRate   = 0.109;};
		[35]={Exp = 908250;  dwAttack = 19080;  dwDefense = 20988;  dwHPMax = 76320;  dwCritDown = 2308;  dwPoJiaDiKang = 2639;  dwForbidLimitParam = 21900;  dwCutHurtRate   = 0.114;};
		[36]={Exp = 994500;  dwAttack = 20880;  dwDefense = 22968;  dwHPMax = 83520;  dwCritDown = 2488;  dwPoJiaDiKang = 2855;  dwForbidLimitParam = 23400;  dwCutHurtRate   = 0.119;};
		[37]={Exp = 1086800;  dwAttack = 22680;  dwDefense = 24948;  dwHPMax = 90720;  dwCritDown = 2668;  dwPoJiaDiKang = 3071;  dwForbidLimitParam = 24900;  dwCutHurtRate   = 0.124;};
		[38]={Exp = 1185250;  dwAttack = 24480;  dwDefense = 26928;  dwHPMax = 97920;  dwCritDown = 2848;  dwPoJiaDiKang = 3287;  dwForbidLimitParam = 26400;  dwCutHurtRate   = 0.129;};
		[39]={Exp = 1289950;  dwAttack = 26280;  dwDefense = 28908;  dwHPMax = 105120;  dwCritDown = 3028;  dwPoJiaDiKang = 3503;  dwForbidLimitParam = 27900;  dwCutHurtRate   = 0.134;};
		[40]={Exp = 1401000;  dwAttack = 28080;  dwDefense = 30888;  dwHPMax = 112320;  dwCritDown = 3208;  dwPoJiaDiKang = 3719;  dwForbidLimitParam = 29400;  dwCutHurtRate   = 0.139;};
	};

	--属性顺序
	ShunXu = {
				[1] = "dwHPMax";
				[2] = "dwAttack";
				[3] = "dwDefense";
				[4] = "dwCritDown";
				[5] = "dwPoJiaDiKang";
				[6] = "dwForbidLimitParam";
				[7] = "dwCutHurtRate";
				-- [8] = "dwCutHurtRate";
	};


	--[[
		盾牌名称
		[阶数] = {Name = 盾牌名称}；
	]]
	ShieldName =
			{
				[1] = {Name = "一阶·云鹤瑶璧";};
				[2] = {Name = "二阶·琼霄螭纹佩";};
				[3] = {Name = "三阶·伽罗降魔杵";};
				[4] = {Name = "四阶·瑶碧福寿链";};
				[5] = {Name = "五阶·七宝菩提子";};
				[6] = {Name = "六阶·妙华蝉翼扇";};
				[7] = {Name = "七阶·龙鳞明光铠";};
				[8] = {Name = "八阶·仁王盾";};
	};
	--[[
		界面属性格式化字符串
		[属性名称] = 格式化字符串；
	]]
	ProperyName 	= {
						dwHPMax 		= "<font color='#FFFF00'>生命</font> + %d ";
						dwCritDown 	    = "<font color='#FFFF00'>暴击抵抗</font> + %d ";
						dwAttack 		= "<font color='#FFFF00'>攻击</font> + %d "; 
						dwDefense 		= "<font color='#FFFF00'>防御</font> + %d ";
						dwCrit 			= "<font color='#FFFF00'>暴击</font> + %d ";
						dwForbidLimitParam 	= "<font color='#FFFF00'>霸体值上限</font> + %d ";				
						dwPoJiaDiKang 	= "<font color='#FFFF00'>破甲抵抗</font> + %d";
						dwCutHurtRate 	= "<font color='#FFFF00'>霸体减伤</font> + %d%%";
	};

	--[[
		模型配置
		[阶数] = {model = 模型；action = 动作}；
	]]
	ModelInfo = {
				AvatarRect	= {x = 1100, y = 1100};
				--阶数
				[1] = {
					model = {	
						sknFile = "A_Equip_FaBao_01.skn"; sklFile="A_Equip_FaBao_01.skl"; sanFile ="A_Equip_FaBao_01_XiuXian.san|fabao_01.tag";
						param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_FaBao_01_DaiJi.san"; 
					};
					action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
				};
				[2] = {
					model = {
						sknFile = "A_Equip_FaBao_02.skn"; sklFile="A_Equip_FaBao_02.skl"; sanFile ="A_Equip_FaBao_02_XiuXian.san|fabao_02.tag";
						param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0;lieAction = "A_Equip_FaBao_02_DaiJi.san";
					};
					action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}}, 
				};
				[3] = {
					model = {
						sknFile = "A_Equip_FaBao_03.skn"; sklFile="A_Equip_FaBao_03.skl"; sanFile ="A_Equip_FaBao_03_XiuXian.san|fabao_03.tag"; 
						param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_FaBao_03_DaiJi.san";
					};
					action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
				};
				[4] = {
					model = {
						sknFile = "A_Equip_FaBao_04.skn"; sklFile="A_Equip_FaBao_04.skl"; sanFile ="A_Equip_FaBao_04_XiuXian.san|fabao_04.tag";
						param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_FaBao_04_DaiJi.san";
					},
					action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
				};
				[5] = {
					model = {
						sknFile = "A_Equip_FaBao_05.skn"; sklFile="A_Equip_FaBao_05.skl"; sanFile ="A_Equip_FaBao_05_XiuXian.san|fabao_05.tag"; 
						param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_FaBao_05_DaiJi.san";
					},
					action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
				};
				[6] = {
					model = {
						sknFile = "A_Equip_FaBao_06.skn"; sklFile="A_Equip_FaBao_06.skl"; sanFile ="A_Equip_FaBao_06_XiuXian.san|fabao_06.tag"; 
						param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_FaBao_06_DaiJi.san";
					},
					action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
				};
				[7] = {
					model = {
						sknFile = "A_Equip_FaBao_07.skn"; sklFile="A_Equip_FaBao_07.skl"; sanFile ="A_Equip_FaBao_07_XiuXian.san|fabao_07.tag"; 
						param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_FaBao_07_DaiJi.san";
					},
					action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
				};
				[8] = {
					model = {
						sknFile = "A_Equip_FaBao_08.skn"; sklFile="A_Equip_FaBao_08.skl"; sanFile ="A_Equip_FaBao_08_XiuXian.san|fabao_08.tag"; 
						param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_FaBao_08_DaiJi.san";
					},
					action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
				};
				[9] = {
					model = {
						sknFile = "A_Equip_FaBao_09.skn"; sklFile="A_Equip_FaBao_09.skl"; sanFile ="A_Equip_FaBao_09_XiuXian.san"; 
						param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_FaBao_09_DaiJi.san";
					},
					action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
				};
	};

	--技能显示信息
	SkillShowInfo = {
		[1] = {
				skillId = 110001; 
				img = "Icon_sk_yangxin_1.png";
				grayImg = "Icon_sk_yangxin_0.png"; 
				des = "<font color='#FFFF00'>您获得法宝后，在战斗过程中，可抵消敌方<font color='#00FF00'>暗器伤害</font></font>";
				name = "<font color='#03B3FD'>法宝·养心</font>";
				enableMethod = "<font size='12' color='#f15d27'> </font>";
				skillType = "<font color='#ffc721'>【被动技能】</font>";
		};
		[2] = {
				skillId = 110002; 
				img = "Icon_sk_jiexing_1.png"; 
				grayImg = "Icon_sk_jiexing_0.png";
				des = "<font color='#FFFF00'>触发法宝效果时，有一定几率抵抗<font color='#00FF00'>暗器·跛足</font>效果</font>"; 
				name = "<font color='#03B3FD'>法宝·捷行</font>"; 
				enableMethod = "<font size='12' color='#f15d27'>激活条件：伽罗降魔杵</font>";
				skillType = "<font color='#ffc721'>【被动技能】</font>";
		};
		[3] = {
				skillId = 110003; 
				img = "Icon_sk_yiqi_1.png"; 
				grayImg = "Icon_sk_yiqi_0.png";
				des = "<font color='#FFFF00'>触发法宝效果时，有一定几率抵抗<font color='#00FF00'>暗器·锁喉</font>效果</font>"; 
				name = "<font color='#B032EE'>法宝·益气</font>"; 
				enableMethod = "<font size='12' color='#f15d27'>激活条件：瑶碧福寿链</font>";
				skillType = "<font color='#ffc721'>【被动技能】</font>";
		};
		[4] = {
				skillId = 110004; 
				img = "Icon_sk_shoushen_1.png"; 
				grayImg = "Icon_sk_shoushen_0.png";
				des = "<font color='#FFFF00'>触发法宝效果时，有一定几率抵抗<font color='#00FF00'>暗器·失心</font>效果</font>";  
				name = "<font color='#B032EE'>法宝·守神</font>"; 
				enableMethod = "<font size='12' color='#f15d27'>激活条件：七宝菩提子</font>";
				skillType = "<font color='#ffc721'>【被动技能】</font>";
		};
		[5] = {
				skillId = 110005; 
				img = "Icon_sk_jusheng_1.png";  
				grayImg = "Icon_sk_jusheng_0.png";
				des = "<font color='#FFFF00'>触发法宝效果时，有一定几率抵抗<font color='#00FF00'>暗器·割腕</font>效果</font>";
				name = "<font color='#FFFF00'>法宝·聚生</font>"; 
				enableMethod = "<font size='12' color='#f15d27'>激活条件：妙华蝉翼扇</font>";
				skillType = "<font color='#ffc721'>【被动技能】</font>";
		};
	};

	--[[
		[阶数] = {
				[显示顺序] = 技能ID,	
		}
	]]
	SkillOpenInfo = {
				[1] = {
					[1] = 110001,
				};
				[2] = {
					[1] = 110001,
				};
				[3] = {
					[1] = 110001,
					[2] = 110002,
				};
				[4] = {
					[1] = 110001,
					[2] = 110002,
					[3] = 110003,
				};
				[5] = {
					[1] = 110001,
					[2] = 110002,
					[3] = 110003,
					[4] = 110004,
				};
				[6] = {
					[1] = 110001,
					[2] = 110002,
					[3] = 110003,
					[4] = 110004,
					[5] = 110005,					
				};
				[7] = {
					[1] = 110001,
					[2] = 110002,
					[3] = 110003,
					[4] = 110004,
					[5] = 110005,
				};
				[8] = {
					[1] = 110001,
					[2] = 110002,
					[3] = 110003,
					[4] = 110004,
					[5] = 110005,
				};
	};


	--技能1的伤害抵抗
	HarmFree = {
			[1] = 0.02,
			[2] = 0.02,
			[3] = 0.02,
			[4] = 0.03,
			[5] = 0.03,
			[6] = 0.05,
			[7] = 0.05,
			[8] = 0.05,
			[9] = 0.06,
			[10] = 0.06,
			[11] = 0.08,
			[12] = 0.08,
			[13] = 0.08,
			[14] = 0.09,
			[15] = 0.09,
			[16] = 0.11,
			[17] = 0.11,
			[18] = 0.11,
			[19] = 0.12,
			[20] = 0.12,
			[21] = 0.14,
			[22] = 0.14,
			[23] = 0.14,
			[24] = 0.15,
			[25] = 0.15,
			[26] = 0.17,
			[27] = 0.17,
			[28] = 0.17,
			[29] = 0.18,
			[30] = 0.18,
			[31] = 0.2,
			[32] = 0.2,
			[33] = 0.2,
			[34] = 0.21,
			[35] = 0.21,
			[36] = 0.23,
			[37] = 0.23,
			[38] = 0.23,
			[39] = 0.24,
			[40] = 0.24,

	};
	--盾牌系统概率 { [技能ID] = { [级数] = 概率} }
	BuffRateData = {
		[110001] = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
			[13] = 1,
			[14] = 1,
			[15] = 1,
			[16] = 1,
			[17] = 1,
			[18] = 1,
			[19] = 1,
			[20] = 1,
			[21] = 1,
			[22] = 1,
			[23] = 1,
			[24] = 1,
			[25] = 1,
			[26] = 1,
			[27] = 1,
			[28] = 1,
			[29] = 1,
			[30] = 1,
			[31] = 1,
			[32] = 1,
			[33] = 1,
			[34] = 1,
			[35] = 1,
			[36] = 1,
			[37] = 1,
			[38] = 1,
			[39] = 1,
			[40] = 1,
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
			[11] = 0.05,
			[12] = 0.05,
			[13] = 0.05,
			[14] = 0.05,
			[15] = 0.05,
			[16] = 0.08,
			[17] = 0.08,
			[18] = 0.08,
			[19] = 0.08,
			[20] = 0.08,
			[21] = 0.1,
			[22] = 0.1,
			[23] = 0.1,
			[24] = 0.1,
			[25] = 0.1,
			[26] = 0.12,
			[27] = 0.12,
			[28] = 0.12,
			[29] = 0.12,
			[30] = 0.12,
			[31] = 0.15,
			[32] = 0.15,
			[33] = 0.15,
			[34] = 0.15,
			[35] = 0.15,
			[36] = 0.18,
			[37] = 0.18,
			[38] = 0.18,
			[39] = 0.18,
			[40] = 0.18,

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
			[16] = 0.05,
			[17] = 0.05,
			[18] = 0.05,
			[19] = 0.05,
			[20] = 0.05,
			[21] = 0.08,
			[22] = 0.08,
			[23] = 0.08,
			[24] = 0.08,
			[25] = 0.08,
			[26] = 0.1,
			[27] = 0.1,
			[28] = 0.1,
			[29] = 0.1,
			[30] = 0.1,
			[31] = 0.1,
			[32] = 0.1,
			[33] = 0.1,
			[34] = 0.1,
			[35] = 0.1,
			[36] = 0.12,
			[37] = 0.12,
			[38] = 0.12,
			[39] = 0.12,
			[40] = 0.12,

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
			[26] = 0.08,
			[27] = 0.08,
			[28] = 0.08,
			[29] = 0.08,
			[30] = 0.08,
			[31] = 0.08,
			[32] = 0.08,
			[33] = 0.08,
			[34] = 0.08,
			[35] = 0.08,
			[36] = 0.1,
			[37] = 0.1,
			[38] = 0.1,
			[39] = 0.1,
			[40] = 0.1,

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
			[26] = 0.05,
			[27] = 0.05,
			[28] = 0.05,
			[29] = 0.05,
			[30] = 0.05,
			[31] = 0.08,
			[32] = 0.08,
			[33] = 0.08,
			[34] = 0.08,
			[35] = 0.08,
			[36] = 0.1,
			[37] = 0.1,
			[38] = 0.1,
			[39] = 0.1,
			[40] = 0.1,

		};
	};
};

--[[
   [ \brief 获得基本属性
   [ \param number nLevel 盾牌总等级 
   [ \return table {dwHPMax = "<font color='#FFFF00'>生命</font> + 100",...}
   ]]
function CShieldConfig:GetPropertyStr(nLevel)
	local tProperty = self:GetProInfo(nLevel);
	local sProPerty = {};
	local tProName = self.ProperyName;
	for k, v in ipairs(self.ShunXu) do
		sProPerty[k] = string.format(tProName[v], tProperty[v]);
	end
	return sProPerty;
end

--[[
   [ \brief 测试value是否在表tab中
   [ \param table tTab 搜索的表
   [ \param table nValue 测试的值
   [ \return true 表示值在表中，false 表示值不在表中 
   ]]
function CShieldConfig:TableFind(tTab, nValue)
	for k,v in pairs(tTab) do
		if v == nValue then
			return true;
		end
	end
	return false;
end


--[[
   [ \brief 获取当前等级属性
   [ \param number nLevel 传入的等级
   [ \return table 当前等级的所有属性
   [ \{dwAttack = 100, dwDefense = 150, dwForbidLimitParam = 150, dwCritDown = 100,
		dwHPMax = 100, dwAppendCrit = 100; dwPoJiaDiKang = 0; dwCutHurtRate = 0 }
   ]]
function CShieldConfig:GetProInfo(nLevel)
	local tInfo = {
					dwAttack = 0, dwHPMax = 0, dwPoJiaDiKang = 0, dwCritDown = 0, 
				    dwDefense = 0, dwForbidLimitParam = 0, dwCutHurtRate = 0
	};
	if nLevel == 0 then 
		return tInfo;
	end
	local nLevelInfo = CShieldConfig.LevelInfo[nLevel];
	for k,v in pairs(tInfo) do
		tInfo[k] = nLevelInfo[k];
	end
	tInfo.dwCutHurtRate = tInfo.dwCutHurtRate * 100;
	return tInfo;
end

--[[
   [ \brief 获取阶段和等级
   [ \param number nLevel 传入的等级
   [ \return table 该等级对应的阶数与阶段内等级
   [ \{nLadder = 阶数；nLevel = 阶段内等级}
   ]]
function CShieldConfig:GetLevelInfo(nLevel)
	local tInfo = {nLadder = 1, nLevel = 1};
	local nNum  = math.floor(nLevel%5);
	if nNum == 0 then
		tInfo.nLadder = math.floor(nLevel/5);
		tInfo.nLevel  = 5;
	else
		tInfo.nLadder = math.floor(nLevel/5) + 1;
		tInfo.nLevel  = nNum;
	end
	return tInfo;
end

--[[
   [ \brief 通过传入的经验获取总等级
   [ \param number nExp 传入的经验
   [ \return number 总等级
   ]]
function CShieldConfig:GetAllLevelInfo(nExp)
	local tLevelInfo = CShieldConfig.LevelInfo;
	local nMaxLevel = #tLevelInfo ;
	if nExp >= tLevelInfo[nMaxLevel - 1].Exp then
		return nMaxLevel;
	end
	for k,v in ipairs(tLevelInfo) do
		if nExp < v.Exp then 
			return k;
		end
	end
end

--[[
   [ \brief 获得消耗物品信息
   ]]
function CShieldConfig:GetItemInfo(nIndex)
	return CShieldConfig.ItemInfo[nIndex];
end

--[[
	[ \brief 通过传来的物品ID判断是不是该系统物品
	[ \param number nItemID 物品ID
	[ \return table 物品info
	]]
function CShieldConfig:CheckItem(nItemID)
	for i=1,#_G.CShieldConfig.ItemInfo do
		if _G.CShieldConfig.ItemInfo[i].ItemID == nItemID then
			return _G.CShieldConfig.ItemInfo[i];
		end
	end
	return {};
end

--[[
	[ \brief 通过物品ID获得物品索引
	[ \param number nItemID	物品ID
	[ \return number index 第几个物品
	]]
function CShieldConfig:GetItemIndex(nItemID)
	for i=1,#_G.CShieldConfig.ItemInfo do
		if _G.CShieldConfig.ItemInfo[i].ItemID == nItemID then
			return i;
		end
	end
	return 0;
end
