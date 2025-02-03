--[[
功能：童姥功系统配置表
作者：赵飞
时间：2013-12-23
--]]
_G.PractiseSkillConfig={
	TxNum = 6; --升级后倒数
	PfxConfig = {
		90007,				--倒数时的特效
		7000100,				--倒数完的特效
	};
		SuitConfig = {	--ItemID 消耗物品 --Num 消耗数量 --Level 几重颗升级  --Name 套装名字 -- Img 彩图片 -- Img0 灰图片
				[1] = {ItemID = 4100443;Num = 80;Level =1;Name = "筑基";Img = "img://tlg_1.png";Img0 = "img://tlg_0.png";effect = "";};
				[2] = {ItemID = 4100443;Num = 120;Level =2;Name = "固本";Img = "img://tlg_2.png";Img0 = "img://tlg_0.png";effect = ""; };
				[3] = {ItemID = 4100443;Num = 240;Level =3;Name = "归元";Img = "img://tlg_3.png";Img0 = "img://tlg_0.png";effect = "";};
				[4] = {ItemID = 4100443;Num = 480;Level =4;Name = "积精";Img = "img://tlg_4.png";Img0 = "img://tlg_0.png";effect = "";};
				[5] = {ItemID = 4100443;Num = 840;Level =5;Name = "炼气";Img = "img://tlg_5.png";Img0 = "img://tlg_0.png";effect = ""; };
				[6] = {ItemID = 4100443;Num = 1300;Level =6;Name = "还虚";Img = "img://tlg_6.png";Img0 = "img://tlg_0.png";effect = ""; };
				[7] = {ItemID = 4100443;Num = 2000;Level =7;Name = "化神";Img = "img://tlg_7.png";Img0 = "img://tlg_0.png";effect = "<font color='#FFFF00' size='16'>激活后可使用童姥功专属角色头像</font>"; };
		};
		--套装属性
		SuitAttr = {
			[1]={dwAttack=1000,dwDefense=500,dwFlee=100,dwCrit=120,dwHPMax=5000,dwCritDown=150,dwPoJiaDiKang=200,},
			[2]={dwAttack=2000,dwDefense=1000,dwFlee=200,dwCrit=240,dwHPMax=10000,dwCritDown=300,dwPoJiaDiKang=400,},
			[3]={dwAttack=4000,dwDefense=2000,dwFlee=400,dwCrit=480,dwHPMax=20000,dwCritDown=600,dwPoJiaDiKang=800,},
			[4]={dwAttack=8000,dwDefense=4000,dwFlee=800,dwCrit=960,dwHPMax=40000,dwCritDown=1200,dwPoJiaDiKang=1600,},
			[5]={dwAttack=14000,dwDefense=7000,dwFlee=1400,dwCrit=1680,dwHPMax=70000,dwCritDown=2100,dwPoJiaDiKang=2800,},
			[6]={dwAttack=22000,dwDefense=11000,dwFlee=2200,dwCrit=2640,dwHPMax=110000,dwCritDown=3300,dwPoJiaDiKang=4400,},
			[7]={dwAttack=32000,dwDefense=16000,dwFlee=3200,dwCrit=3840,dwHPMax=160000,dwCritDown=4800,dwPoJiaDiKang=6400,},
		};
		--童姥功属性及经验配置
		LevelConfig = {	--Exp 升级经验 
			[1]={dwAttack=80,dwDefense=40,dwFlee=8,dwCrit=9,dwHPMax=400,dwCritDown=12,dwPoJiaDiKang=16,Exp =5000,},
			[2]={dwAttack=130,dwDefense=65,dwFlee=13,dwCrit=15,dwHPMax=650,dwCritDown=19,dwPoJiaDiKang=26,Exp =7000,},
			[3]={dwAttack=180,dwDefense=90,dwFlee=18,dwCrit=21,dwHPMax=900,dwCritDown=27,dwPoJiaDiKang=36,Exp =9000,},
			[4]={dwAttack=230,dwDefense=115,dwFlee=23,dwCrit=27,dwHPMax=1150,dwCritDown=34,dwPoJiaDiKang=46,Exp =11000,},
			[5]={dwAttack=280,dwDefense=140,dwFlee=28,dwCrit=33,dwHPMax=1400,dwCritDown=42,dwPoJiaDiKang=56,Exp =13000,},
			[6]={dwAttack=330,dwDefense=165,dwFlee=33,dwCrit=39,dwHPMax=1650,dwCritDown=49,dwPoJiaDiKang=66,Exp =15000,},
			[7]={dwAttack=380,dwDefense=190,dwFlee=38,dwCrit=45,dwHPMax=1900,dwCritDown=57,dwPoJiaDiKang=76,Exp =17000,},
			[8]={dwAttack=430,dwDefense=215,dwFlee=43,dwCrit=51,dwHPMax=2150,dwCritDown=64,dwPoJiaDiKang=86,Exp =19000,},
			[9]={dwAttack=480,dwDefense=240,dwFlee=48,dwCrit=57,dwHPMax=2400,dwCritDown=72,dwPoJiaDiKang=96,Exp =21000,},
			[10]={dwAttack=530,dwDefense=265,dwFlee=53,dwCrit=63,dwHPMax=2650,dwCritDown=79,dwPoJiaDiKang=106,Exp =23000,},
			[11]={dwAttack=600,dwDefense=300,dwFlee=60,dwCrit=72,dwHPMax=3000,dwCritDown=90,dwPoJiaDiKang=120,Exp =27000,},
			[12]={dwAttack=670,dwDefense=335,dwFlee=67,dwCrit=80,dwHPMax=3350,dwCritDown=100,dwPoJiaDiKang=134,Exp =31000,},
			[13]={dwAttack=740,dwDefense=370,dwFlee=74,dwCrit=88,dwHPMax=3700,dwCritDown=111,dwPoJiaDiKang=148,Exp =35000,},
			[14]={dwAttack=810,dwDefense=405,dwFlee=81,dwCrit=97,dwHPMax=4050,dwCritDown=121,dwPoJiaDiKang=162,Exp =39000,},
			[15]={dwAttack=880,dwDefense=440,dwFlee=88,dwCrit=105,dwHPMax=4400,dwCritDown=132,dwPoJiaDiKang=176,Exp =43000,},
			[16]={dwAttack=950,dwDefense=475,dwFlee=95,dwCrit=114,dwHPMax=4750,dwCritDown=142,dwPoJiaDiKang=190,Exp =47000,},
			[17]={dwAttack=1020,dwDefense=510,dwFlee=102,dwCrit=122,dwHPMax=5100,dwCritDown=153,dwPoJiaDiKang=204,Exp =51000,},
			[18]={dwAttack=1090,dwDefense=545,dwFlee=109,dwCrit=130,dwHPMax=5450,dwCritDown=163,dwPoJiaDiKang=218,Exp =55000,},
			[19]={dwAttack=1160,dwDefense=580,dwFlee=116,dwCrit=139,dwHPMax=5800,dwCritDown=174,dwPoJiaDiKang=232,Exp =59000,},
			[20]={dwAttack=1230,dwDefense=615,dwFlee=123,dwCrit=147,dwHPMax=6150,dwCritDown=184,dwPoJiaDiKang=246,Exp =63000,},
			[21]={dwAttack=1340,dwDefense=670,dwFlee=134,dwCrit=160,dwHPMax=6700,dwCritDown=201,dwPoJiaDiKang=268,Exp =71000,},
			[22]={dwAttack=1450,dwDefense=725,dwFlee=145,dwCrit=174,dwHPMax=7250,dwCritDown=217,dwPoJiaDiKang=290,Exp =79000,},
			[23]={dwAttack=1560,dwDefense=780,dwFlee=156,dwCrit=187,dwHPMax=7800,dwCritDown=234,dwPoJiaDiKang=312,Exp =87000,},
			[24]={dwAttack=1670,dwDefense=835,dwFlee=167,dwCrit=200,dwHPMax=8350,dwCritDown=250,dwPoJiaDiKang=334,Exp =95000,},
			[25]={dwAttack=1780,dwDefense=890,dwFlee=178,dwCrit=213,dwHPMax=8900,dwCritDown=267,dwPoJiaDiKang=356,Exp =103000,},
			[26]={dwAttack=1890,dwDefense=945,dwFlee=189,dwCrit=226,dwHPMax=9450,dwCritDown=283,dwPoJiaDiKang=378,Exp =111000,},
			[27]={dwAttack=2000,dwDefense=1000,dwFlee=200,dwCrit=240,dwHPMax=10000,dwCritDown=300,dwPoJiaDiKang=400,Exp =119000,},
			[28]={dwAttack=2110,dwDefense=1055,dwFlee=211,dwCrit=253,dwHPMax=10550,dwCritDown=316,dwPoJiaDiKang=422,Exp =127000,},
			[29]={dwAttack=2220,dwDefense=1110,dwFlee=222,dwCrit=266,dwHPMax=11100,dwCritDown=333,dwPoJiaDiKang=444,Exp =135000,},
			[30]={dwAttack=2330,dwDefense=1165,dwFlee=233,dwCrit=279,dwHPMax=11650,dwCritDown=349,dwPoJiaDiKang=466,Exp =143000,},
			[31]={dwAttack=2520,dwDefense=1260,dwFlee=252,dwCrit=302,dwHPMax=12600,dwCritDown=378,dwPoJiaDiKang=504,Exp =159000,},
			[32]={dwAttack=2710,dwDefense=1355,dwFlee=271,dwCrit=325,dwHPMax=13550,dwCritDown=406,dwPoJiaDiKang=542,Exp =175000,},
			[33]={dwAttack=2900,dwDefense=1450,dwFlee=290,dwCrit=348,dwHPMax=14500,dwCritDown=435,dwPoJiaDiKang=580,Exp =191000,},
			[34]={dwAttack=3090,dwDefense=1545,dwFlee=309,dwCrit=370,dwHPMax=15450,dwCritDown=463,dwPoJiaDiKang=618,Exp =207000,},
			[35]={dwAttack=3280,dwDefense=1640,dwFlee=328,dwCrit=393,dwHPMax=16400,dwCritDown=492,dwPoJiaDiKang=656,Exp =223000,},
			[36]={dwAttack=3470,dwDefense=1735,dwFlee=347,dwCrit=416,dwHPMax=17350,dwCritDown=520,dwPoJiaDiKang=694,Exp =239000,},
			[37]={dwAttack=3660,dwDefense=1830,dwFlee=366,dwCrit=439,dwHPMax=18300,dwCritDown=549,dwPoJiaDiKang=732,Exp =255000,},
			[38]={dwAttack=3850,dwDefense=1925,dwFlee=385,dwCrit=462,dwHPMax=19250,dwCritDown=577,dwPoJiaDiKang=770,Exp =271000,},
			[39]={dwAttack=4040,dwDefense=2020,dwFlee=404,dwCrit=484,dwHPMax=20200,dwCritDown=606,dwPoJiaDiKang=808,Exp =287000,},
			[40]={dwAttack=4230,dwDefense=2115,dwFlee=423,dwCrit=507,dwHPMax=21150,dwCritDown=634,dwPoJiaDiKang=846,Exp =303000,},
			[41]={dwAttack=4580,dwDefense=2290,dwFlee=458,dwCrit=549,dwHPMax=22900,dwCritDown=687,dwPoJiaDiKang=916,Exp =343000,},
			[42]={dwAttack=4930,dwDefense=2465,dwFlee=493,dwCrit=591,dwHPMax=24650,dwCritDown=739,dwPoJiaDiKang=986,Exp =383000,},
			[43]={dwAttack=5280,dwDefense=2640,dwFlee=528,dwCrit=633,dwHPMax=26400,dwCritDown=792,dwPoJiaDiKang=1056,Exp =423000,},
			[44]={dwAttack=5630,dwDefense=2815,dwFlee=563,dwCrit=675,dwHPMax=28150,dwCritDown=844,dwPoJiaDiKang=1126,Exp =463000,},
			[45]={dwAttack=5980,dwDefense=2990,dwFlee=598,dwCrit=717,dwHPMax=29900,dwCritDown=897,dwPoJiaDiKang=1196,Exp =503000,},
			[46]={dwAttack=6330,dwDefense=3165,dwFlee=633,dwCrit=759,dwHPMax=31650,dwCritDown=949,dwPoJiaDiKang=1266,Exp =543000,},
			[47]={dwAttack=6680,dwDefense=3340,dwFlee=668,dwCrit=801,dwHPMax=33400,dwCritDown=1002,dwPoJiaDiKang=1336,Exp =583000,},
			[48]={dwAttack=7030,dwDefense=3515,dwFlee=703,dwCrit=843,dwHPMax=35150,dwCritDown=1054,dwPoJiaDiKang=1406,Exp =623000,},
			[49]={dwAttack=7380,dwDefense=3690,dwFlee=738,dwCrit=885,dwHPMax=36900,dwCritDown=1107,dwPoJiaDiKang=1476,Exp =663000,},
			[50]={dwAttack=7730,dwDefense=3865,dwFlee=773,dwCrit=927,dwHPMax=38650,dwCritDown=1159,dwPoJiaDiKang=1546,Exp =703000,},
			[51]={dwAttack=8400,dwDefense=4200,dwFlee=840,dwCrit=1008,dwHPMax=42000,dwCritDown=1260,dwPoJiaDiKang=1680,Exp =823000,},
			[52]={dwAttack=9070,dwDefense=4535,dwFlee=907,dwCrit=1088,dwHPMax=45350,dwCritDown=1360,dwPoJiaDiKang=1814,Exp =943000,},
			[53]={dwAttack=9740,dwDefense=4870,dwFlee=974,dwCrit=1168,dwHPMax=48700,dwCritDown=1461,dwPoJiaDiKang=1948,Exp =1063000,},
			[54]={dwAttack=10410,dwDefense=5205,dwFlee=1041,dwCrit=1249,dwHPMax=52050,dwCritDown=1561,dwPoJiaDiKang=2082,Exp =1183000,},
			[55]={dwAttack=11080,dwDefense=5540,dwFlee=1108,dwCrit=1329,dwHPMax=55400,dwCritDown=1662,dwPoJiaDiKang=2216,Exp =1303000,},
			[56]={dwAttack=11750,dwDefense=5875,dwFlee=1175,dwCrit=1410,dwHPMax=58750,dwCritDown=1762,dwPoJiaDiKang=2350,Exp =1423000,},
			[57]={dwAttack=12420,dwDefense=6210,dwFlee=1242,dwCrit=1490,dwHPMax=62100,dwCritDown=1863,dwPoJiaDiKang=2484,Exp =1543000,},
			[58]={dwAttack=13090,dwDefense=6545,dwFlee=1309,dwCrit=1570,dwHPMax=65450,dwCritDown=1963,dwPoJiaDiKang=2618,Exp =1663000,},
			[59]={dwAttack=13760,dwDefense=6880,dwFlee=1376,dwCrit=1651,dwHPMax=68800,dwCritDown=2064,dwPoJiaDiKang=2752,Exp =1783000,},
			[60]={dwAttack=14430,dwDefense=7215,dwFlee=1443,dwCrit=1731,dwHPMax=72150,dwCritDown=2164,dwPoJiaDiKang=2886,Exp =1903000,},
			[61]={dwAttack=15740,dwDefense=7870,dwFlee=1574,dwCrit=1888,dwHPMax=78700,dwCritDown=2361,dwPoJiaDiKang=3148,Exp =2263000,},
			[62]={dwAttack=17050,dwDefense=8525,dwFlee=1705,dwCrit=2046,dwHPMax=85250,dwCritDown=2557,dwPoJiaDiKang=3410,Exp =2623000,},
			[63]={dwAttack=18360,dwDefense=9180,dwFlee=1836,dwCrit=2203,dwHPMax=91800,dwCritDown=2754,dwPoJiaDiKang=3672,Exp =2983000,},
			[64]={dwAttack=19670,dwDefense=9835,dwFlee=1967,dwCrit=2360,dwHPMax=98350,dwCritDown=2950,dwPoJiaDiKang=3934,Exp =3343000,},
			[65]={dwAttack=20980,dwDefense=10490,dwFlee=2098,dwCrit=2517,dwHPMax=104900,dwCritDown=3147,dwPoJiaDiKang=4196,Exp =3703000,},
			[66]={dwAttack=22290,dwDefense=11145,dwFlee=2229,dwCrit=2674,dwHPMax=111450,dwCritDown=3343,dwPoJiaDiKang=4458,Exp =4063000,},
			[67]={dwAttack=23600,dwDefense=11800,dwFlee=2360,dwCrit=2832,dwHPMax=118000,dwCritDown=3540,dwPoJiaDiKang=4720,Exp =4423000,},
			[68]={dwAttack=24910,dwDefense=12455,dwFlee=2491,dwCrit=2989,dwHPMax=124550,dwCritDown=3736,dwPoJiaDiKang=4982,Exp =4783000,},
			[69]={dwAttack=26220,dwDefense=13110,dwFlee=2622,dwCrit=3146,dwHPMax=131100,dwCritDown=3933,dwPoJiaDiKang=5244,Exp =5143000,},
			[70]={dwAttack=27530,dwDefense=13765,dwFlee=2753,dwCrit=3303,dwHPMax=137650,dwCritDown=4129,dwPoJiaDiKang=5506,Exp =5503000,},
		};
		--童姥功经验转换修为值参数
		ExpChange = {
			[1]=0.001;
			[2]=0.00099;
			[3]=0.00098;
			[4]=0.00097;
			[5]=0.00096;
			[6]=0.00095;
			[7]=0.00094;
			[8]=0.00093;
			[9]=0.00092;
			[10]=0.00091;
			[11]=0.0009;
			[12]=0.00089;
			[13]=0.00088;
			[14]=0.00087;
			[15]=0.00086;
			[16]=0.00085;
			[17]=0.00084;
			[18]=0.00083;
			[19]=0.00082;
			[20]=0.00081;
			[21]=0.0008;
			[22]=0.00079;
			[23]=0.00078;
			[24]=0.00077;
			[25]=0.00076;
			[26]=0.00075;
			[27]=0.00074;
			[28]=0.00073;
			[29]=0.00072;
			[30]=0.00071;
			[31]=0.0007;
			[32]=0.00069;
			[33]=0.00068;
			[34]=0.00067;
			[35]=0.00066;
			[36]=0.00065;
			[37]=0.00064;
			[38]=0.00063;
			[39]=0.00062;
			[40]=0.00061;
			[41]=0.0006;
			[42]=0.00059;
			[43]=0.00058;
			[44]=0.00057;
			[45]=0.00056;
			[46]=0.00055;
			[47]=0.00054;
			[48]=0.00053;
			[49]=0.00052;
			[50]=0.00051;
			[51]=0.0005;
			[52]=0.00049;
			[53]=0.00048;
			[54]=0.00047;
			[55]=0.00046;
			[56]=0.00045;
			[57]=0.00044;
			[58]=0.00043;
			[59]=0.00042;
			[60]=0.00041;
			[61]=0.0001;
			[62]=0.0001;
			[63]=0.0001;
			[64]=0.0001;
			[65]=0.0001;
			[66]=0.0001;
			[67]=0.0001;
			[68]=0.0001;
			[69]=0.0001;
			[70]=0.0001;
		};
	--战斗属性
	Shunxu = {"dwAttack";"dwDefense";"dwFlee";"dwCrit";"dwHPMax";"dwCritDown";"dwPoJiaDiKang";}; --属性顺序显示
	ProperyName 	= { 																--界面属性字符串
				dwHPMax 		= "生命 + %d ";
				dwCritDown 		= "暴击抵抗 + %d ";
				dwAttack 		= "攻击 + %d "; 
                dwDefense 		= "防御 + %d ";
                dwCrit 			= "暴击 + %d ";
                dwFlee 			= "身法 + %d ";				
				dwPoJiaDiKang 	= "伤害抵御 + %d";
			};
	ProperyName1 	= { 																--属性表属性字符串
				dwHPMax 		= "<font color='#FFFF00'>生命</font> + %d ";
				dwCritDown 		= "<font color='#FFFF00'>暴击抵抗</font> + %d ";
				dwAttack 		= "<font color='#FFFF00'>攻击</font> + %d "; 
                dwDefense 		= "<font color='#FFFF00'>防御</font> + %d ";
                dwCrit 			= "<font color='#FFFF00'>暴击</font> + %d ";
                dwFlee 			= "<font color='#FFFF00'>身法</font> + %d ";				
				dwPoJiaDiKang 	= "<font color='#FFFF00'>伤害抵御</font> + %d";
			};
		Text = {
				StrItem 	= "使用%s可快速获得修为值";  				-- 使用物品可快速获得修为值
				StrLv   	= "<font color='#4daeed'>Lv.%d</font>";		--等级配置
				StrCho  	= "<font color='#4daeed'>%d重</font>";		--重配置
				SuitTips	= "<p><font color='#FFFF00' size='16'>【童姥功·%s】</font>%s</p>";					--套装Tips
				StrDo		= "（已激活）";								--激活
				StrNot		= "<font color='#FF0000'>（未激活）</font>";--未激活
				StrSuit1	= "<p><font color='#4daeed'>激活后属性加成提升至</font></p>";	
				StrSuit2	= "<p><font color='#4daeed'>当前属性加成提升至:</font></p>";
				StrSuit3	= "<p><font color='#4daeed'>【童姥功*%s效果-%s】:</font></p>";	
				StrSuit4	= "<p><font color='#4daeed'>【童姥功专属角色头像】:</font></p>";
				Condition1  = "<p><font color='#FFFFFF'>激活所需:满足以下条件后点击按钮即可升级</font></p>";				
				Condition2  = "<p><font color='#FFFFFF'>开启条件:</font>激活童姥功·%s</p>";
				Condition3  = "<p>1.童姥功修炼阶段达%s重</p>";
				Condition4  = "<p><font color='#FFFFFF'>2.消耗%s:%s颗</font></p>";
				IsEnough	= "<font color='#FFFFFF'>%s</font>";	--物品充足
				IsNoEnough	= "<font color='#FF0000'>%s</font>";	--物品不足			
				IsNoCan1	= "开启条件不足，无法激活";	--此套装未达开启条件
				IsNoCan2	= "激活条件不足，无法激活";	--激活套装童姥功级别不足
				IsNoCan3	= "凝血炼骨丹不足，无法激活";	--激活套装童姥功物品不足	
				IsNoCan4	= "您的童姥功修炼已达极致";	--童姥功已经满级无需再兑换		
				IsNoCan5	= "九转熊蛇丸不足，无法使用";	--六合八荒物品不足
				IsNoCan6	= "激活【童姥功·化神】才可选择更换头像";	--六合八荒物品不足
				IsNoCan7	= "您没有足够的经验兑换修为值";	--没有足够的经验兑换修为
				IsNoCan8	= "您已激活了，无需再次激活";	--没有足够的经验兑换修为
				IsNoHaveAut	= "对方暂未开启童姥功，无法查看";	--查看别人没有权限提示
				IsNoOnLine	= "被查看的玩家没在线";	--查看别人没有在线	
				broadcast	    = "恭喜大侠%s童姥功修炼阶段已达%d重!";     --广播
				broadcast1	    = "恭喜大侠%s童姥功修炼阶段已达7重，童姥功修炼已达极致！";     --满级广播
				Suitcast	    = "恭喜大侠%s成功激活童姥功·%s";     --套装广播
				Suitcast1	    = "恭喜大侠%s成功激活童姥功·%s，获得童姥功专属角色头像！";     --套装满级广播	
				IWantStr		= "我也试试！";		--广播我也试试
				IsZero		    = "";		--经验值是零提示！  为空时不提示
				ChangeUp		= "修为值 + %d";		--经验值是零提示！  为空时不提示
				StrUseItem		= "<font color='#FFFF00'>使用六合八荒可快速获取修为值</font>";		--使用物品Tips
				UpExpBtn		= "<font color='#4daeed'>1.请先调整兑换消耗人物经验<br/>2.确认后点击“兑换修为”按钮便可获取修为值</font>";		--兑换修为BtnTips
				UpTouBtn		= "<font color='#FFFF00'>激活童姥功·化神后点击单选框可使用童姥功专属角色头像</font>";		--换头像文字描述BtnTips
		};
		ItemConfig = { -- 六合八荒
			ItemID = 4100442,Num = 1,Exp = 5000,
		};
		BuffConfig = {--BUFF配置
			[2500090] = 50,
			[2500100] = 100,
			[2500110] = 300,
		};
				----特殊头像配置
		RoleModelConfig = {
			[1] = {
				IconID = 1005,
			},
			[2] = {
				IconID = 2005,
			},
			[3] = {
				IconID = 3005,
			},
			[4] = {
				IconID = 4005,
			},
		};
		---人物特效配置
		SuitStarPfxConfig = {
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 0,
			[5] = 0,
			[6] = 0,
			[7] = 0,
		};

};

--经验兑换童姥功修为
--参数 dwLevel:童姥功等级   dwMendValue:当前修为,dwExp:当前兑换经验
--返回 dwSkilExp童姥功修为
function PractiseSkillConfig:GetPractiseSkilExp(dwLevel, dwMendValue,dwExp)
	local ExpInfo = self.ExpChange
	local LCfg = self.LevelConfig
	local dwSkilExp = 0
	local dwNeed = 0
	for i = dwLevel,#ExpInfo do
		local Need = math.floor(LCfg[i].Exp - dwMendValue)
		local NeedExp = math.floor(1/ExpInfo[i]*Need)
		if dwExp > NeedExp then
			dwSkilExp = dwSkilExp + Need
			dwExp = dwExp - NeedExp
			dwNeed = dwNeed + NeedExp
			dwMendValue = 0
		else
			dwSkilExp = dwSkilExp + math.floor(ExpInfo[i]*dwExp)
			dwNeed = dwNeed + dwExp
			break;
		end
	end
	return dwSkilExp,dwNeed
end