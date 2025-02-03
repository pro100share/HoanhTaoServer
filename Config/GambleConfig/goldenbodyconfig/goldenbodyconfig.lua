--[[
	[\brief 金身系统配置文件
	[\author 李中昌, 裴雪阳
	[\date 2014-7-1
	[策划可进行配置，客户端服务器公用配置文件
  ]]


_G.GoldenBodyConfig = {
	-- 每阶的内丹个数
	nNeiDanCount = 9;
	
	--每隔多少秒发送一次自动突破请求
	nTime = 1;
	-- 修炼值的单位量
	nPracticeCount = 1;
	-- 修炼值的单位时间 
    -- 引用BaseService\DriverManager.lua 的_G.eInterval
	nPracticeTime = 5; -- 实际十分钟
	-- 修炼值的最大值
	nMaxPractice = 100;
	-- 隐藏的最大值
	nMaxPracticePro = 300;
	-- 使用道具增加的修炼值
	nAddPractice1 = 200;
	nAddPractice2 = 100;
	
	--[[
        内丹列表(key-内丹索引; value-内丹信息值)
        nMaxEXP：		该内丹最大历练值
       nPractice：    	修炼一次该内丹所需修炼值
        nSilver：   		修炼一次该内丹所需银两
	nExp:			修炼一次该内丹所需经验值
        nPlus：  		修炼一次增加的修炼值
        nBonus： 		暴击一次增加的修炼值
        nBonusChance:	暴击概率，0.1表示10%
        Attr:    		该内丹属性加成
	nSheLi:		突破的时候需要消耗的舍利子的数量
        ]]
	DanList = {
		[1] =  {nMaxEXP=0,nPractice=20,nSilver=240000,nExp=2856000,nPlus=70,nBonus=140,nBonusChance=0.02,Attr = {dwAttack=68,dwDefense=34,dwHPMax=306,dwCrit=32,dwCritDown=33,dwPoJiaDiKang=33},},
		[2] =  {nMaxEXP=750,nPractice=20,nSilver=245000,nExp=3284000,nPlus=75,nBonus=150,nBonusChance=0.02,Attr = {dwAttack=150,dwDefense=75,dwHPMax=675,dwCrit=65,dwCritDown=67,dwPoJiaDiKang=68},},
		[3] =  {nMaxEXP=1600,nPractice=20,nSilver=250000,nExp=3712000,nPlus=80,nBonus=160,nBonusChance=0.02,Attr = {dwAttack=260,dwDefense=130,dwHPMax=1170,dwCrit=100,dwCritDown=102,dwPoJiaDiKang=104},},
		[4] =  {nMaxEXP=2550,nPractice=20,nSilver=255000,nExp=4140000,nPlus=85,nBonus=170,nBonusChance=0.02,Attr = {dwAttack=398,dwDefense=199,dwHPMax=1791,dwCrit=135,dwCritDown=138,dwPoJiaDiKang=142},},
		[5] =  {nMaxEXP=3600,nPractice=20,nSilver=260000,nExp=4568000,nPlus=90,nBonus=180,nBonusChance=0.02,Attr = {dwAttack=564,dwDefense=282,dwHPMax=2538,dwCrit=171,dwCritDown=176,dwPoJiaDiKang=182},},
		[6] =  {nMaxEXP=4750,nPractice=20,nSilver=265000,nExp=4996000,nPlus=95,nBonus=190,nBonusChance=0.02,Attr = {dwAttack=758,dwDefense=379,dwHPMax=3411,dwCrit=209,dwCritDown=215,dwPoJiaDiKang=223},},
		[7] =  {nMaxEXP=6000,nPractice=20,nSilver=270000,nExp=5424000,nPlus=100,nBonus=200,nBonusChance=0.02,Attr = {dwAttack=980,dwDefense=490,dwHPMax=4410,dwCrit=247,dwCritDown=255,dwPoJiaDiKang=266},},
		[8] =  {nMaxEXP=7350,nPractice=20,nSilver=275000,nExp=5852000,nPlus=105,nBonus=210,nBonusChance=0.02,Attr = {dwAttack=1230,dwDefense=615,dwHPMax=5535,dwCrit=287,dwCritDown=297,dwPoJiaDiKang=310},},
		[9] =  {nMaxEXP=8800,nPractice=20,nSilver=275000,nExp=5852000,nPlus=105,nBonus=210,nBonusChance=0.02,Attr = {dwAttack=1508,dwDefense=754,dwHPMax=6786,dwCrit=328,dwCritDown=340,dwPoJiaDiKang=356},},
		[10] = {nMaxEXP=11500,nPractice=30,nSilver=430000,nExp=14416000,nPlus=145,nBonus=290,nBonusChance=0.02,Attr = {dwAttack=1914,dwDefense=957,dwHPMax=8613,dwCrit=374,dwCritDown=389,dwPoJiaDiKang=409},},
		[11] = {nMaxEXP=14400,nPractice=30,nSilver=440000,nExp=15272000,nPlus=150,nBonus=300,nBonusChance=0.02,Attr = {dwAttack=2248,dwDefense=1124,dwHPMax=10116,dwCrit=417,dwCritDown=435,dwPoJiaDiKang=458},},
		[12] = {nMaxEXP=17500,nPractice=30,nSilver=450000,nExp=16128000,nPlus=155,nBonus=310,nBonusChance=0.02,Attr = {dwAttack=2610,dwDefense=1305,dwHPMax=11745,dwCrit=461,dwCritDown=482,dwPoJiaDiKang=509},},
		[13] = {nMaxEXP=20800,nPractice=30,nSilver=460000,nExp=16984000,nPlus=160,nBonus=320,nBonusChance=0.02,Attr = {dwAttack=3000,dwDefense=1500,dwHPMax=13500,dwCrit=506,dwCritDown=530,dwPoJiaDiKang=561},},
		[14] = {nMaxEXP=24300,nPractice=30,nSilver=470000,nExp=17840000,nPlus=165,nBonus=330,nBonusChance=0.02,Attr = {dwAttack=3418,dwDefense=1709,dwHPMax=15381,dwCrit=552,dwCritDown=580,dwPoJiaDiKang=615},},
		[15] = {nMaxEXP=28000,nPractice=30,nSilver=480000,nExp=18696000,nPlus=170,nBonus=340,nBonusChance=0.02,Attr = {dwAttack=3864,dwDefense=1932,dwHPMax=17388,dwCrit=599,dwCritDown=631,dwPoJiaDiKang=670},},
		[16] = {nMaxEXP=31900,nPractice=30,nSilver=490000,nExp=19552000,nPlus=175,nBonus=350,nBonusChance=0.02,Attr = {dwAttack=4338,dwDefense=2169,dwHPMax=19521,dwCrit=647,dwCritDown=683,dwPoJiaDiKang=727},},
		[17] = {nMaxEXP=36000,nPractice=30,nSilver=500000,nExp=20408000,nPlus=180,nBonus=360,nBonusChance=0.02,Attr = {dwAttack=4840,dwDefense=2420,dwHPMax=21780,dwCrit=697,dwCritDown=736,dwPoJiaDiKang=786},},
		[18] = {nMaxEXP=40300,nPractice=30,nSilver=500000,nExp=20408000,nPlus=180,nBonus=360,nBonusChance=0.02,Attr = {dwAttack=5370,dwDefense=2685,dwHPMax=24165,dwCrit=747,dwCritDown=791,dwPoJiaDiKang=846},},
		[19] = {nMaxEXP=46950,nPractice=40,nSilver=770000,nExp=35680000,nPlus=240,nBonus=480,nBonusChance=0.02,Attr = {dwAttack=6228,dwDefense=3114,dwHPMax=28026,dwCrit=811,dwCritDown=861,dwPoJiaDiKang=925},},
		[20] = {nMaxEXP=53900,nPractice=40,nSilver=785000,nExp=36964000,nPlus=245,nBonus=490,nBonusChance=0.02,Attr = {dwAttack=6814,dwDefense=3407,dwHPMax=30663,dwCrit=863,dwCritDown=919,dwPoJiaDiKang=989},},
		[21] = {nMaxEXP=61150,nPractice=40,nSilver=800000,nExp=38248000,nPlus=250,nBonus=500,nBonusChance=0.02,Attr = {dwAttack=7428,dwDefense=3714,dwHPMax=33426,dwCrit=917,dwCritDown=978,dwPoJiaDiKang=1054},},
		[22] = {nMaxEXP=68700,nPractice=40,nSilver=815000,nExp=39532000,nPlus=255,nBonus=510,nBonusChance=0.02,Attr = {dwAttack=8070,dwDefense=4035,dwHPMax=36315,dwCrit=972,dwCritDown=1038,dwPoJiaDiKang=1121},},
		[23] = {nMaxEXP=76550,nPractice=40,nSilver=830000,nExp=40816000,nPlus=260,nBonus=520,nBonusChance=0.02,Attr = {dwAttack=8740,dwDefense=4370,dwHPMax=39330,dwCrit=1028,dwCritDown=1099,dwPoJiaDiKang=1189},},
		[24] = {nMaxEXP=84700,nPractice=40,nSilver=845000,nExp=42100000,nPlus=265,nBonus=530,nBonusChance=0.02,Attr = {dwAttack=9438,dwDefense=4719,dwHPMax=42471,dwCrit=1085,dwCritDown=1162,dwPoJiaDiKang=1259},},
		[25] = {nMaxEXP=93150,nPractice=40,nSilver=860000,nExp=43384000,nPlus=270,nBonus=540,nBonusChance=0.02,Attr = {dwAttack=10164,dwDefense=5082,dwHPMax=45738,dwCrit=1143,dwCritDown=1226,dwPoJiaDiKang=1330},},
		[26] = {nMaxEXP=101900,nPractice=40,nSilver=875000,nExp=44668000,nPlus=275,nBonus=550,nBonusChance=0.02,Attr = {dwAttack=10918,dwDefense=5459,dwHPMax=49131,dwCrit=1202,dwCritDown=1291,dwPoJiaDiKang=1403},},
		[27] = {nMaxEXP=110950,nPractice=40,nSilver=875000,nExp=44668000,nPlus=275,nBonus=550,nBonusChance=0.02,Attr = {dwAttack=11700,dwDefense=5850,dwHPMax=52650,dwCrit=1262,dwCritDown=1358,dwPoJiaDiKang=1478},},
		[28] = {nMaxEXP=123450,nPractice=50,nSilver=1260000,nExp=66648000,nPlus=355,nBonus=710,nBonusChance=0.02,Attr = {dwAttack=13010,dwDefense=6505,dwHPMax=58545,dwCrit=1343,dwCritDown=1449,dwPoJiaDiKang=1583},},
		[29] = {nMaxEXP=136350,nPractice=50,nSilver=1280000,nExp=68360000,nPlus=360,nBonus=720,nBonusChance=0.02,Attr = {dwAttack=13848,dwDefense=6924,dwHPMax=62316,dwCrit=1406,dwCritDown=1519,dwPoJiaDiKang=1661},},
		[30] = {nMaxEXP=149650,nPractice=50,nSilver=1300000,nExp=70072000,nPlus=365,nBonus=730,nBonusChance=0.02,Attr = {dwAttack=14714,dwDefense=7357,dwHPMax=66213,dwCrit=1469,dwCritDown=1589,dwPoJiaDiKang=1740},},
		[31] = {nMaxEXP=163350,nPractice=50,nSilver=1320000,nExp=71784000,nPlus=370,nBonus=740,nBonusChance=0.02,Attr = {dwAttack=15608,dwDefense=7804,dwHPMax=70236,dwCrit=1534,dwCritDown=1661,dwPoJiaDiKang=1821},},
		[32] = {nMaxEXP=177450,nPractice=50,nSilver=1340000,nExp=73496000,nPlus=375,nBonus=750,nBonusChance=0.02,Attr = {dwAttack=16530,dwDefense=8265,dwHPMax=74385,dwCrit=1599,dwCritDown=1734,dwPoJiaDiKang=1904},},
		[33] = {nMaxEXP=191950,nPractice=50,nSilver=1360000,nExp=75208000,nPlus=380,nBonus=760,nBonusChance=0.02,Attr = {dwAttack=17480,dwDefense=8740,dwHPMax=78660,dwCrit=1666,dwCritDown=1809,dwPoJiaDiKang=1988},},
		[34] = {nMaxEXP=206850,nPractice=50,nSilver=1380000,nExp=76920000,nPlus=385,nBonus=770,nBonusChance=0.02,Attr = {dwAttack=18458,dwDefense=9229,dwHPMax=83061,dwCrit=1734,dwCritDown=1885,dwPoJiaDiKang=2074},},
		[35] = {nMaxEXP=222150,nPractice=50,nSilver=1400000,nExp=78632000,nPlus=390,nBonus=780,nBonusChance=0.02,Attr = {dwAttack=19464,dwDefense=9732,dwHPMax=87588,dwCrit=1803,dwCritDown=1962,dwPoJiaDiKang=2162},},
		[36] = {nMaxEXP=237850,nPractice=50,nSilver=1400000,nExp=78632000,nPlus=390,nBonus=780,nBonusChance=0.02,Attr = {dwAttack=20498,dwDefense=10249,dwHPMax=92241,dwCrit=1873,dwCritDown=2040,dwPoJiaDiKang=2251},},
		[37] = {nMaxEXP=258100,nPractice=60,nSilver=1900000,nExp=107320000,nPlus=490,nBonus=980,nBonusChance=0.02,Attr = {dwAttack=22260,dwDefense=11130,dwHPMax=100170,dwCrit=1971,dwCritDown=2153,dwPoJiaDiKang=2382},},
		[38] = {nMaxEXP=278850,nPractice=60,nSilver=1925000,nExp=109460000,nPlus=495,nBonus=990,nBonusChance=0.02,Attr = {dwAttack=23350,dwDefense=11675,dwHPMax=105075,dwCrit=2043,dwCritDown=2234,dwPoJiaDiKang=2474},},
		[39] = {nMaxEXP=300100,nPractice=60,nSilver=1950000,nExp=111600000,nPlus=500,nBonus=1000,nBonusChance=0.02,Attr = {dwAttack=24468,dwDefense=12234,dwHPMax=110106,dwCrit=2117,dwCritDown=2316,dwPoJiaDiKang=2568},},
		[40] = {nMaxEXP=321850,nPractice=60,nSilver=1975000,nExp=113740000,nPlus=505,nBonus=1010,nBonusChance=0.02,Attr = {dwAttack=25614,dwDefense=12807,dwHPMax=115263,dwCrit=2191,dwCritDown=2400,dwPoJiaDiKang=2663},},
		[41] = {nMaxEXP=344100,nPractice=60,nSilver=2000000,nExp=115880000,nPlus=510,nBonus=1020,nBonusChance=0.02,Attr = {dwAttack=26788,dwDefense=13394,dwHPMax=120546,dwCrit=2266,dwCritDown=2485,dwPoJiaDiKang=2760},},
		[42] = {nMaxEXP=366850,nPractice=60,nSilver=2025000,nExp=118020000,nPlus=515,nBonus=1030,nBonusChance=0.02,Attr = {dwAttack=27990,dwDefense=13995,dwHPMax=125955,dwCrit=2343,dwCritDown=2572,dwPoJiaDiKang=2859},},
		[43] = {nMaxEXP=390100,nPractice=60,nSilver=2050000,nExp=120160000,nPlus=520,nBonus=1040,nBonusChance=0.02,Attr = {dwAttack=29220,dwDefense=14610,dwHPMax=131490,dwCrit=2421,dwCritDown=2659,dwPoJiaDiKang=2959},},
		[44] = {nMaxEXP=413850,nPractice=60,nSilver=2075000,nExp=122300000,nPlus=525,nBonus=1050,nBonusChance=0.02,Attr = {dwAttack=30478,dwDefense=15239,dwHPMax=137151,dwCrit=2499,dwCritDown=2748,dwPoJiaDiKang=3061},},
		[45] = {nMaxEXP=438100,nPractice=60,nSilver=2075000,nExp=122300000,nPlus=525,nBonus=1050,nBonusChance=0.02,Attr = {dwAttack=31764,dwDefense=15882,dwHPMax=142938,dwCrit=2579,dwCritDown=2838,dwPoJiaDiKang=3165},},
		[46] = {nMaxEXP=468000,nPractice=70,nSilver=2690000,nExp=157696000,nPlus=645,nBonus=1290,nBonusChance=0.02,Attr = {dwAttack=33978,dwDefense=16989,dwHPMax=152901,dwCrit=2695,dwCritDown=2972,dwPoJiaDiKang=3321},},
		[47] = {nMaxEXP=498500,nPractice=70,nSilver=2720000,nExp=160264000,nPlus=650,nBonus=1300,nBonusChance=0.02,Attr = {dwAttack=35320,dwDefense=17660,dwHPMax=158940,dwCrit=2777,dwCritDown=3065,dwPoJiaDiKang=3428},},
		[48] = {nMaxEXP=529600,nPractice=70,nSilver=2750000,nExp=162832000,nPlus=655,nBonus=1310,nBonusChance=0.02,Attr = {dwAttack=36690,dwDefense=18345,dwHPMax=165105,dwCrit=2860,dwCritDown=3159,dwPoJiaDiKang=3536},},
		[49] = {nMaxEXP=561300,nPractice=70,nSilver=2780000,nExp=165400000,nPlus=660,nBonus=1320,nBonusChance=0.02,Attr = {dwAttack=38088,dwDefense=19044,dwHPMax=171396,dwCrit=2944,dwCritDown=3255,dwPoJiaDiKang=3646},},
		[50] = {nMaxEXP=593600,nPractice=70,nSilver=2810000,nExp=167968000,nPlus=665,nBonus=1330,nBonusChance=0.02,Attr = {dwAttack=39514,dwDefense=19757,dwHPMax=177813,dwCrit=3029,dwCritDown=3352,dwPoJiaDiKang=3757},},
		[51] = {nMaxEXP=626500,nPractice=70,nSilver=2840000,nExp=170536000,nPlus=670,nBonus=1340,nBonusChance=0.02,Attr = {dwAttack=40968,dwDefense=20484,dwHPMax=184356,dwCrit=3115,dwCritDown=3450,dwPoJiaDiKang=3871},},
		[52] = {nMaxEXP=660000,nPractice=70,nSilver=2870000,nExp=173104000,nPlus=675,nBonus=1350,nBonusChance=0.02,Attr = {dwAttack=42450,dwDefense=21225,dwHPMax=191025,dwCrit=3203,dwCritDown=3549,dwPoJiaDiKang=3985},},
		[53] = {nMaxEXP=694100,nPractice=70,nSilver=2900000,nExp=175672000,nPlus=680,nBonus=1360,nBonusChance=0.02,Attr = {dwAttack=43960,dwDefense=21980,dwHPMax=197820,dwCrit=3291,dwCritDown=3650,dwPoJiaDiKang=4102},},
		[54] = {nMaxEXP=728800,nPractice=70,nSilver=2900000,nExp=175672000,nPlus=680,nBonus=1360,nBonusChance=0.02,Attr = {dwAttack=45498,dwDefense=22749,dwHPMax=204741,dwCrit=3381,dwCritDown=3752,dwPoJiaDiKang=4219},},
		[55] = {nMaxEXP=770250,nPractice=80,nSilver=3630000,nExp=217776000,nPlus=820,nBonus=1640,nBonusChance=0.02,Attr = {dwAttack=48164,dwDefense=24082,dwHPMax=216738,dwCrit=3514,dwCritDown=3907,dwPoJiaDiKang=4402},},
		[56] = {nMaxEXP=812400,nPractice=80,nSilver=3665000,nExp=220772000,nPlus=825,nBonus=1650,nBonusChance=0.02,Attr = {dwAttack=49758,dwDefense=24879,dwHPMax=223911,dwCrit=3606,dwCritDown=4012,dwPoJiaDiKang=4523},},
		[57] = {nMaxEXP=855250,nPractice=80,nSilver=3700000,nExp=223768000,nPlus=830,nBonus=1660,nBonusChance=0.02,Attr = {dwAttack=51380,dwDefense=25690,dwHPMax=231210,dwCrit=3698,dwCritDown=4118,dwPoJiaDiKang=4646},},
		[58] = {nMaxEXP=898800,nPractice=80,nSilver=3735000,nExp=226764000,nPlus=835,nBonus=1670,nBonusChance=0.02,Attr = {dwAttack=53030,dwDefense=26515,dwHPMax=238635,dwCrit=3792,dwCritDown=4225,dwPoJiaDiKang=4770},},
		[59] = {nMaxEXP=943050,nPractice=80,nSilver=3770000,nExp=229760000,nPlus=840,nBonus=1680,nBonusChance=0.02,Attr = {dwAttack=54708,dwDefense=27354,dwHPMax=246186,dwCrit=3887,dwCritDown=4334,dwPoJiaDiKang=4896},},
		[60] = {nMaxEXP=988000,nPractice=80,nSilver=3805000,nExp=232756000,nPlus=845,nBonus=1690,nBonusChance=0.02,Attr = {dwAttack=56414,dwDefense=28207,dwHPMax=253863,dwCrit=3983,dwCritDown=4444,dwPoJiaDiKang=5023},},
		[61] = {nMaxEXP=1033650,nPractice=80,nSilver=3840000,nExp=235752000,nPlus=850,nBonus=1700,nBonusChance=0.02,Attr = {dwAttack=58148,dwDefense=29074,dwHPMax=261666,dwCrit=4080,dwCritDown=4555,dwPoJiaDiKang=5152},},
		[62] = {nMaxEXP=1080000,nPractice=80,nSilver=3875000,nExp=238748000,nPlus=855,nBonus=1710,nBonusChance=0.02,Attr = {dwAttack=59910,dwDefense=29955,dwHPMax=269595,dwCrit=4179,dwCritDown=4668,dwPoJiaDiKang=5283},},
		[63] = {nMaxEXP=1127050,nPractice=80,nSilver=3875000,nExp=238748000,nPlus=855,nBonus=1710,nBonusChance=0.02,Attr = {dwAttack=61700,dwDefense=30850,dwHPMax=277650,dwCrit=4278,dwCritDown=4782,dwPoJiaDiKang=5415},},
		[64] = {nMaxEXP=1181950,nPractice=90,nSilver=4720000,nExp=287560000,nPlus=1015,nBonus=2030,nBonusChance=0.02,Attr = {dwAttack=64818,dwDefense=32409,dwHPMax=291681,dwCrit=4429,dwCritDown=4958,dwPoJiaDiKang=5623},},
		[65] = {nMaxEXP=1237650,nPractice=90,nSilver=4760000,nExp=290984000,nPlus=1020,nBonus=2040,nBonusChance=0.02,Attr = {dwAttack=66664,dwDefense=33332,dwHPMax=299988,dwCrit=4530,dwCritDown=5074,dwPoJiaDiKang=5759},},
		[66] = {nMaxEXP=1294150,nPractice=90,nSilver=4800000,nExp=294408000,nPlus=1025,nBonus=2050,nBonusChance=0.02,Attr = {dwAttack=68538,dwDefense=34269,dwHPMax=308421,dwCrit=4633,dwCritDown=5192,dwPoJiaDiKang=5896},},
		[67] = {nMaxEXP=1351450,nPractice=90,nSilver=4840000,nExp=297832000,nPlus=1030,nBonus=2060,nBonusChance=0.02,Attr = {dwAttack=70440,dwDefense=35220,dwHPMax=316980,dwCrit=4736,dwCritDown=5311,dwPoJiaDiKang=6035},},
		[68] = {nMaxEXP=1409550,nPractice=90,nSilver=4880000,nExp=301256000,nPlus=1035,nBonus=2070,nBonusChance=0.02,Attr = {dwAttack=72370,dwDefense=36185,dwHPMax=325665,dwCrit=4841,dwCritDown=5432,dwPoJiaDiKang=6175},},
		[69] = {nMaxEXP=1468450,nPractice=90,nSilver=4920000,nExp=304680000,nPlus=1040,nBonus=2080,nBonusChance=0.02,Attr = {dwAttack=74328,dwDefense=37164,dwHPMax=334476,dwCrit=4947,dwCritDown=5554,dwPoJiaDiKang=6317},},
		[70] = {nMaxEXP=1528150,nPractice=90,nSilver=4960000,nExp=308104000,nPlus=1045,nBonus=2090,nBonusChance=0.02,Attr = {dwAttack=76314,dwDefense=38157,dwHPMax=343413,dwCrit=5054,dwCritDown=5677,dwPoJiaDiKang=6460},},
		[71] = {nMaxEXP=1588650,nPractice=90,nSilver=5000000,nExp=311528000,nPlus=1050,nBonus=2100,nBonusChance=0.02,Attr = {dwAttack=78328,dwDefense=39164,dwHPMax=352476,dwCrit=5162,dwCritDown=5801,dwPoJiaDiKang=6605},},
		[72] = {nMaxEXP=1649950,nPractice=90,nSilver=5000000,nExp=311528000,nPlus=1050,nBonus=2100,nBonusChance=0.02,Attr = {dwAttack=80370,dwDefense=40185,dwHPMax=361665,dwCrit=5271,dwCritDown=5927,dwPoJiaDiKang=6752},},
		[73] = {nMaxEXP=1720200,nPractice=100,nSilver=5960000,nExp=367048000,nPlus=1230,nBonus=2460,nBonusChance=0.02,Attr = {dwAttack=83940,dwDefense=41970,dwHPMax=377730,dwCrit=5439,dwCritDown=6124,dwPoJiaDiKang=6986},},
		[74] = {nMaxEXP=1791350,nPractice=100,nSilver=6005000,nExp=370900000,nPlus=1235,nBonus=2470,nBonusChance=0.02,Attr = {dwAttack=86038,dwDefense=43019,dwHPMax=387171,dwCrit=5550,dwCritDown=6253,dwPoJiaDiKang=7136},},
		[75] = {nMaxEXP=1863400,nPractice=100,nSilver=6050000,nExp=374752000,nPlus=1240,nBonus=2480,nBonusChance=0.02,Attr = {dwAttack=88164,dwDefense=44082,dwHPMax=396738,dwCrit=5662,dwCritDown=6382,dwPoJiaDiKang=7287},},
		[76] = {nMaxEXP=1936350,nPractice=100,nSilver=6095000,nExp=378604000,nPlus=1245,nBonus=2490,nBonusChance=0.02,Attr = {dwAttack=90318,dwDefense=45159,dwHPMax=406431,dwCrit=5776,dwCritDown=6513,dwPoJiaDiKang=7441},},
		[77] = {nMaxEXP=2010200,nPractice=100,nSilver=6140000,nExp=382456000,nPlus=1250,nBonus=2500,nBonusChance=0.02,Attr = {dwAttack=92500,dwDefense=46250,dwHPMax=416250,dwCrit=5890,dwCritDown=6645,dwPoJiaDiKang=7595},},
		[78] = {nMaxEXP=2084950,nPractice=100,nSilver=6185000,nExp=386308000,nPlus=1255,nBonus=2510,nBonusChance=0.02,Attr = {dwAttack=94710,dwDefense=47355,dwHPMax=426195,dwCrit=6006,dwCritDown=6779,dwPoJiaDiKang=7752},},
		[79] = {nMaxEXP=2160600,nPractice=100,nSilver=6230000,nExp=390160000,nPlus=1260,nBonus=2520,nBonusChance=0.02,Attr = {dwAttack=96948,dwDefense=48474,dwHPMax=436266,dwCrit=6122,dwCritDown=6914,dwPoJiaDiKang=7909},},
		[80] = {nMaxEXP=2237150,nPractice=100,nSilver=6275000,nExp=394012000,nPlus=1265,nBonus=2530,nBonusChance=0.02,Attr = {dwAttack=99214,dwDefense=49607,dwHPMax=446463,dwCrit=6240,dwCritDown=7050,dwPoJiaDiKang=8069},},
		[81] = {nMaxEXP=2314600,nPractice=100,nSilver=6275000,nExp=394012000,nPlus=1265,nBonus=2530,nBonusChance=0.02,Attr = {dwAttack=101508,dwDefense=50754,dwHPMax=456786,dwCrit=6359,dwCritDown=7188,dwPoJiaDiKang=8230},},
		[82] = {nMaxEXP=2402100,nPractice=100,nSilver=7350000,nExp=456240000,nPlus=1465,nBonus=2930,nBonusChance=0.02,Attr = {dwAttack=105530,dwDefense=52765,dwHPMax=474885,dwCrit=6545,dwCritDown=7406,dwPoJiaDiKang=8490},},
		[83] = {nMaxEXP=2490600,nPractice=100,nSilver=7400000,nExp=460520000,nPlus=1470,nBonus=2940,nBonusChance=0.02,Attr = {dwAttack=107880,dwDefense=53940,dwHPMax=485460,dwCrit=6666,dwCritDown=7546,dwPoJiaDiKang=8654},},
		[84] = {nMaxEXP=2580100,nPractice=100,nSilver=7450000,nExp=464800000,nPlus=1475,nBonus=2950,nBonusChance=0.02,Attr = {dwAttack=110258,dwDefense=55129,dwHPMax=496161,dwCrit=6788,dwCritDown=7688,dwPoJiaDiKang=8820},},
		[85] = {nMaxEXP=2670600,nPractice=100,nSilver=7500000,nExp=469080000,nPlus=1480,nBonus=2960,nBonusChance=0.02,Attr = {dwAttack=112664,dwDefense=56332,dwHPMax=506988,dwCrit=6911,dwCritDown=7831,dwPoJiaDiKang=8987},},
		[86] = {nMaxEXP=2762100,nPractice=100,nSilver=7550000,nExp=473360000,nPlus=1485,nBonus=2970,nBonusChance=0.02,Attr = {dwAttack=115098,dwDefense=57549,dwHPMax=517941,dwCrit=7035,dwCritDown=7975,dwPoJiaDiKang=9157},},
		[87] = {nMaxEXP=2854600,nPractice=100,nSilver=7600000,nExp=477640000,nPlus=1490,nBonus=2980,nBonusChance=0.02,Attr = {dwAttack=117560,dwDefense=58780,dwHPMax=529020,dwCrit=7160,dwCritDown=8120,dwPoJiaDiKang=9327},},
		[88] = {nMaxEXP=2948100,nPractice=100,nSilver=7650000,nExp=481920000,nPlus=1495,nBonus=2990,nBonusChance=0.02,Attr = {dwAttack=120050,dwDefense=60025,dwHPMax=540225,dwCrit=7287,dwCritDown=8267,dwPoJiaDiKang=9500},},
		[89] = {nMaxEXP=3042600,nPractice=100,nSilver=7700000,nExp=486200000,nPlus=1500,nBonus=3000,nBonusChance=0.02,Attr = {dwAttack=122568,dwDefense=61284,dwHPMax=551556,dwCrit=7414,dwCritDown=8415,dwPoJiaDiKang=9673},},
		[90] = {nMaxEXP=3138100,nPractice=100,nSilver=7700000,nExp=486200000,nPlus=1500,nBonus=3000,nBonusChance=0.02,Attr = {dwAttack=125114,dwDefense=62557,dwHPMax=563013,dwCrit=7543,dwCritDown=8564,dwPoJiaDiKang=9849},},
	 },

	--[[
        天官赐福列表(key-赐福开始时所处的阶段; value-赐福信息值)
        nId: 	赐福所需物品id
		nNum: 	每次赐福所需物品数量
		nRate: 	进入tRange后的赐福成功几率
		tRange: 赐福值的范围，此范围之前成功率为0，之中成功率为nRate，之后成功率为100%
        ]]
	BlessList = {
		[1] = {nId = 4100512, nNum = 2, nRate = 0.5, tRange = {nFloor = 30, nCeil = 80}, name =T"铜皮石肤",rank = T"极高",},
		[2] = {nId = 4100512, nNum = 3, nRate = 0.3, tRange = {nFloor = 120, nCeil = 210}, name =T"钢筋铁骨",rank = T"高",},
		[3] = {nId = 4100512, nNum = 5, nRate = 0.25, tRange = {nFloor = 300, nCeil = 550}, name =T"玉质金相",rank = T"一般",},
		[4] = {nId = 4100512, nNum = 7, nRate = 0.15, tRange = {nFloor = 800, nCeil = 1500}, name =T"循经贯脉",rank = T"低",},
		[5] = {nId = 4100512, nNum = 10, nRate = 0.1, tRange = {nFloor = 2000, nCeil = 3000}, name =T"刀枪不入",rank = T"极低",},
		[6] = {nId = 4100512, nNum = 15, nRate = 0.05, tRange = {nFloor = 4000, nCeil = 5000}, name =T"坚不可摧",rank = T"极低",},
		[7] = {nId = 4100512, nNum = 20, nRate = 0.03, tRange = {nFloor = 6500, nCeil = 8000}, name =T"稳如泰山",rank = T"极低",},
		[8] = {nId = 4100512, nNum = 25, nRate = 0.02, tRange = {nFloor = 9000, nCeil = 12500}, name =T"金身不破",rank = T"极低",},
		[9] = {nId = 4100512, nNum = 30, nRate = 0.01, tRange = {nFloor = 12000, nCeil = 15000}, name =T"宝体通神",rank = T"极低",},
		[10] = {nId = 4100512, nNum = 35, nRate = 0.01, tRange = {nFloor = 25000, nCeil = 30000}, name =T"万劫不磨",rank = T"极低",},
		 },

	BoardcastLevel = {9,18,27,36,45,54,63,72,81,90},
    ------------------------------------以上数值类的配置信息均可由公用函数获取-------------------------------------------
	
	ArrtConfig ={
		Shunxu1 = {"dwAttack";"dwDefense";"dwHPMax";"dwCrit";"dwCritDown";"dwPoJiaDiKang";}; --等级属性
		Shunxu2 = {"dwAttack";"dwDefense";"dwHPMax";"dwCrit";"dwCritDown";"dwPoJiaDiKang";}; --套装属性
		Shunxu3 = {"dwAttack";"dwDefense";"dwHPMax";"dwCrit";"dwCritDown";"dwPoJiaDiKang";}; --
		Shuxing =  {
				dwAttack 	= T"攻击 +%s";
				dwDefense 	= T"防御 +%s";
				dwMPMax     = T"内力 +%s";
				dwHPMax     = T"生命 +%s";
				dwFlee 		= T"身法 +%s";
				dwCrit 		= T"暴击 +%s";
				dwCritDown  = T"暴击抵抗 +%s";
				dwPoJiaValue = T"破甲攻击 +%s";
				dwPoJiaDiKang = T"伤害抵御 +%s";
					};			
				};
			
	pearlname = {[1] =T"引气",[2] = T"筑基",[3] = T"金丹", [4] = T"元婴", [5] = T"炼神", [6]= T"返虚", [7] =T"合道",[8] = T"渡劫",[9] = T"大乘" },
	IsEnough = "<font color='#31cf32'>%s</font>";--材料符合
	IsNoEnough = "<font color='#FF0000'>%s</font>";	--材料不符
	IntorduceText = T"1、修炼消耗修炼值、经验和银两<br/>2、可以服用“修炼丹”、“不灭金丹”快速恢复修炼值<br/>3、修炼丹在卧虎藏龙副本和通天塔中掉落<br/>4、修炼值达到上限后不会再增加";--介绍
	
	sLabel1 = T"<font color='#FFFF00'>【内丹·%s】";
	sLabel2 = T"<font color='#4daeed'>激活后属性提升至";
	sLabel3 = T"<font color='#FFFFFF'>开启条件：";
	sLabel4 = T"激活内丹·%s";
	sLabel5 = T"（已激活）";
	sLabel6 = T"<font color='#FF0000'>（未激活）";
	sLabel7 = T"【金身加成】"; --查看
	sLabel8 = T"%s×%s(拥有：%s)";
	
	BroadString3 = T"恭喜%s大侠成功把金身之%s境界修炼圆满，请再接再厉！我也试试";	
	BroadString2 = T"恭喜%s大侠成功把金身之%s境界修炼圆满，请再接再厉！我也试试";
	BroadString1 = T"恭喜%s大侠成功把金身之%s境界修炼圆满，请再接再厉！";
	Image = "img://gn_ZhanQiJue_jingjie.png";
	sLabel9 = T"成功率：%s";
	sText  = T"修炼值：<font size='13' color='#31cf32'>每10分钟恢复1点修炼值</font>";
	Zidong = T"自动突破";
	Quxiao = T" 取消自动";
	CifuText = T"赐福 + "
}


