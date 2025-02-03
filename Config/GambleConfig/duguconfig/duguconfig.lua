--[[
	[\brief 独孤九剑系统配置文件
	[\author 王凌波, 裴雪阳
	[\date 2014-5-30
	[策划可进行配置，客户端服务器公用配置文件
  ]]

-- 配置列表(key-子列表名称; value-成员信息)
_G.DuGuConfig = {
	-- 最大等级的索引
	nMaxLevel = 90;

	-- 广播新阶段的初始阶段索引
	nBroadCastMinPhase = 1;

	-- 每日清零修炼次数的时间
	sResetTime = "06:00",

    -- 单位道具历练值加成
    nItemPlus = 400,

	-- 历练值列表(key-修炼等级; value-该等级的最低历练值)
    EXPList = {
        [1] = 0,      -- 1式0级
        [2] = 500 ,
        [3] = 1040 ,
        [4] = 1640 ,
        [5] = 2320 ,
        [6] = 3100 ,
        [7] = 4000 ,
        [8] = 5040 ,
        [9] = 6240 ,
        [10] = 7620 , -- 1式9级
        [11] = 9200 , -- 2式0级
        [12] = 11020 , 
        [13] = 13100 ,
        [14] = 15460 ,
        [15] = 18120 ,
        [16] = 21100 ,
        [17] = 24420 ,
        [18] = 28100 ,
        [19] = 32160 ,
        [20] = 36620 , -- 2式9级
        [21] = 41500 , -- 3式0级
        [22] = 46880 , 
        [23] = 52780 ,
        [24] = 59220 ,
        [25] = 66220 ,
        [26] = 73800 ,
        [27] = 81980 ,
        [28] = 90780 ,
        [29] = 100220 ,
        [30] = 110320 , -- 3式9级
        [31] = 121100 , -- 4式0级
        [32] = 132680 , 
        [33] = 145080 ,
        [34] = 158320 ,
        [35] = 172420 ,
        [36] = 187400 ,
        [37] = 203280 ,
        [38] = 220080 ,
        [39] = 237820 ,
        [40] = 256520 , -- 4式9级
        [41] = 276200 , -- 5式0级
        [42] = 297020 , 
        [43] = 319000 ,
        [44] = 342160 ,
        [45] = 366520 ,
        [46] = 392100 ,
        [47] = 418920 ,
        [48] = 447000 ,
        [49] = 476360 ,
        [50] = 507020 , -- 5式9级
        [51] = 539000 , -- 6式0级
        [52] = 572500 , 
        [53] = 607540 ,
        [54] = 644140 ,
        [55] = 682320 ,
        [56] = 722100 ,
        [57] = 763500 ,
        [58] = 806540 ,
        [59] = 851240 ,
        [60] = 897620 , -- 6式9级
        [61] = 945700 , -- 7式0级
        [62] = 995720 , 
        [63] = 1047700 ,
        [64] = 1101660 ,
        [65] = 1157620 ,
        [66] = 1215600 ,
        [67] = 1275620 ,
        [68] = 1337700 ,
        [69] = 1401860 ,
        [70] = 1468120 , -- 7式9级
        [71] = 1536500 , -- 8式0级
        [72] = 1607280 , 
        [73] = 1680480 ,
        [74] = 1756120 ,
        [75] = 1834220 ,
        [76] = 1914800 ,
        [77] = 1997880 ,
        [78] = 2083480 ,
        [79] = 2171620 ,
        [80] = 2262320 , -- 8式9级
        [81] = 2355600 , -- 9式0级
        [82] = 2451780 , 
        [83] = 2550880 ,
        [84] = 2652920 ,
        [85] = 2757920 ,
        [86] = 2865900 ,
        [87] = 2976880 ,
        [88] = 3090880 ,
        [89] = 3207920 ,
        [90] = 3328020 , -- 9式9级
        -- [90] = 3451200 , 
         },

	-- 等级加成属性列表(key-修炼等级; value-等级对应的属性加成)
	AttrList = {
	
	    [1] ={dwAttack = 0, dwDefense = 0, dwHPMax = 0, dwFlee = 0, dwCrit = 0, dwCritDown = 0, dwPoJiaDiKang = 0},
		--[1] = {dwAttack = 770, dwDefense = 893, dwHPMax = 2695, dwFlee = 427, dwCrit = 346, dwCritDown = 338, dwPoJiaDiKang = 415 },
		[2] = {dwAttack = 814, dwDefense = 932, dwHPMax = 2849, dwFlee = 431, dwCrit = 348, dwCritDown = 340, dwPoJiaDiKang = 422 },
		[3] = {dwAttack = 858, dwDefense = 972, dwHPMax = 3003, dwFlee = 435, dwCrit = 351, dwCritDown = 342, dwPoJiaDiKang = 428 },
		[4] = {dwAttack = 902, dwDefense = 1011, dwHPMax = 3157, dwFlee = 440, dwCrit = 354, dwCritDown = 345, dwPoJiaDiKang = 435 },
		[5] = {dwAttack = 946, dwDefense = 1051, dwHPMax = 3311, dwFlee = 444, dwCrit = 356, dwCritDown = 347, dwPoJiaDiKang = 441 },
		[6] = {dwAttack = 990, dwDefense = 1091, dwHPMax = 3465, dwFlee = 449, dwCrit = 359, dwCritDown = 349, dwPoJiaDiKang = 448 },
		[7] = {dwAttack = 1034, dwDefense = 1130, dwHPMax = 3619, dwFlee = 453, dwCrit = 362, dwCritDown = 351, dwPoJiaDiKang = 455 },
		[8] = {dwAttack = 1078, dwDefense = 1170, dwHPMax = 3773, dwFlee = 457, dwCrit = 364, dwCritDown = 353, dwPoJiaDiKang = 461 },
		[9] = {dwAttack = 1122, dwDefense = 1209, dwHPMax = 3927, dwFlee = 462, dwCrit = 367, dwCritDown = 356, dwPoJiaDiKang = 468 },
		[10] = {dwAttack = 1166, dwDefense = 1249, dwHPMax = 4081, dwFlee = 466, dwCrit = 369, dwCritDown = 358, dwPoJiaDiKang = 474 },
		[11] = {dwAttack = 1232, dwDefense = 1308, dwHPMax = 4312, dwFlee = 473, dwCrit = 373, dwCritDown = 361, dwPoJiaDiKang = 484 },
		[12] = {dwAttack = 1298, dwDefense = 1368, dwHPMax = 4543, dwFlee = 479, dwCrit = 377, dwCritDown = 364, dwPoJiaDiKang = 494 },
		[13] = {dwAttack = 1364, dwDefense = 1427, dwHPMax = 4774, dwFlee = 486, dwCrit = 381, dwCritDown = 368, dwPoJiaDiKang = 504 },
		[14] = {dwAttack = 1430, dwDefense = 1487, dwHPMax = 5005, dwFlee = 493, dwCrit = 385, dwCritDown = 371, dwPoJiaDiKang = 514 },
		[15] = {dwAttack = 1496, dwDefense = 1546, dwHPMax = 5236, dwFlee = 499, dwCrit = 389, dwCritDown = 374, dwPoJiaDiKang = 524 },
		[16] = {dwAttack = 1562, dwDefense = 1605, dwHPMax = 5467, dwFlee = 506, dwCrit = 393, dwCritDown = 378, dwPoJiaDiKang = 534 },
		[17] = {dwAttack = 1628, dwDefense = 1665, dwHPMax = 5698, dwFlee = 512, dwCrit = 397, dwCritDown = 381, dwPoJiaDiKang = 544 },
		[18] = {dwAttack = 1694, dwDefense = 1724, dwHPMax = 5929, dwFlee = 519, dwCrit = 401, dwCritDown = 384, dwPoJiaDiKang = 554 },
		[19] = {dwAttack = 1760, dwDefense = 1784, dwHPMax = 6160, dwFlee = 526, dwCrit = 405, dwCritDown = 388, dwPoJiaDiKang = 564 },
		[20] = {dwAttack = 1826, dwDefense = 1843, dwHPMax = 6391, dwFlee = 532, dwCrit = 409, dwCritDown = 391, dwPoJiaDiKang = 573 },
		[21] = {dwAttack = 1936, dwDefense = 1942, dwHPMax = 6776, dwFlee = 543, dwCrit = 416, dwCritDown = 396, dwPoJiaDiKang = 590 },
		[22] = {dwAttack = 2046, dwDefense = 2041, dwHPMax = 7161, dwFlee = 554, dwCrit = 422, dwCritDown = 402, dwPoJiaDiKang = 606 },
		[23] = {dwAttack = 2156, dwDefense = 2140, dwHPMax = 7546, dwFlee = 565, dwCrit = 429, dwCritDown = 407, dwPoJiaDiKang = 623 },
		[24] = {dwAttack = 2266, dwDefense = 2239, dwHPMax = 7931, dwFlee = 576, dwCrit = 435, dwCritDown = 413, dwPoJiaDiKang = 639 },
		[25] = {dwAttack = 2376, dwDefense = 2338, dwHPMax = 8316, dwFlee = 587, dwCrit = 442, dwCritDown = 418, dwPoJiaDiKang = 656 },
		[26] = {dwAttack = 2486, dwDefense = 2437, dwHPMax = 8701, dwFlee = 598, dwCrit = 449, dwCritDown = 424, dwPoJiaDiKang = 672 },
		[27] = {dwAttack = 2596, dwDefense = 2536, dwHPMax = 9086, dwFlee = 609, dwCrit = 455, dwCritDown = 429, dwPoJiaDiKang = 689 },
		[28] = {dwAttack = 2706, dwDefense = 2635, dwHPMax = 9471, dwFlee = 620, dwCrit = 462, dwCritDown = 435, dwPoJiaDiKang = 705 },
		[29] = {dwAttack = 2816, dwDefense = 2734, dwHPMax = 9856, dwFlee = 631, dwCrit = 468, dwCritDown = 440, dwPoJiaDiKang = 722 },
		[30] = {dwAttack = 2926, dwDefense = 2833, dwHPMax = 10241, dwFlee = 642, dwCrit = 475, dwCritDown = 446, dwPoJiaDiKang = 738 },
		[31] = {dwAttack = 3102, dwDefense = 2991, dwHPMax = 10857, dwFlee = 660, dwCrit = 486, dwCritDown = 455, dwPoJiaDiKang = 765 },
		[32] = {dwAttack = 3300, dwDefense = 3170, dwHPMax = 11550, dwFlee = 680, dwCrit = 498, dwCritDown = 465, dwPoJiaDiKang = 795 },
		[33] = {dwAttack = 3498, dwDefense = 3348, dwHPMax = 12243, dwFlee = 699, dwCrit = 509, dwCritDown = 474, dwPoJiaDiKang = 824 },
		[34] = {dwAttack = 3696, dwDefense = 3526, dwHPMax = 12936, dwFlee = 719, dwCrit = 521, dwCritDown = 484, dwPoJiaDiKang = 854 },
		[35] = {dwAttack = 3894, dwDefense = 3704, dwHPMax = 13629, dwFlee = 739, dwCrit = 533, dwCritDown = 494, dwPoJiaDiKang = 884 },
		[36] = {dwAttack = 4092, dwDefense = 3882, dwHPMax = 14322, dwFlee = 759, dwCrit = 545, dwCritDown = 504, dwPoJiaDiKang = 913 },
		[37] = {dwAttack = 4290, dwDefense = 4061, dwHPMax = 15015, dwFlee = 779, dwCrit = 557, dwCritDown = 514, dwPoJiaDiKang = 943 },
		[38] = {dwAttack = 4488, dwDefense = 4239, dwHPMax = 15708, dwFlee = 798, dwCrit = 569, dwCritDown = 524, dwPoJiaDiKang = 973 },
		[39] = {dwAttack = 4686, dwDefense = 4417, dwHPMax = 16401, dwFlee = 818, dwCrit = 581, dwCritDown = 534, dwPoJiaDiKang = 1002 },
		[40] = {dwAttack = 4884, dwDefense = 4595, dwHPMax = 17094, dwFlee = 838, dwCrit = 593, dwCritDown = 544, dwPoJiaDiKang = 1032 },
		[41] = {dwAttack = 5170, dwDefense = 4853, dwHPMax = 18095, dwFlee = 867, dwCrit = 610, dwCritDown = 558, dwPoJiaDiKang = 1075 },
		[42] = {dwAttack = 5456, dwDefense = 5110, dwHPMax = 19096, dwFlee = 895, dwCrit = 627, dwCritDown = 572, dwPoJiaDiKang = 1118 },
		[43] = {dwAttack = 5742, dwDefense = 5367, dwHPMax = 20097, dwFlee = 924, dwCrit = 644, dwCritDown = 587, dwPoJiaDiKang = 1161 },
		[44] = {dwAttack = 6028, dwDefense = 5625, dwHPMax = 21098, dwFlee = 952, dwCrit = 661, dwCritDown = 601, dwPoJiaDiKang = 1204 },
		[45] = {dwAttack = 6314, dwDefense = 5882, dwHPMax = 22099, dwFlee = 981, dwCrit = 678, dwCritDown = 615, dwPoJiaDiKang = 1247 },
		[46] = {dwAttack = 6600, dwDefense = 6140, dwHPMax = 23100, dwFlee = 1010, dwCrit = 696, dwCritDown = 630, dwPoJiaDiKang = 1290 },
		[47] = {dwAttack = 6886, dwDefense = 6397, dwHPMax = 24101, dwFlee = 1038, dwCrit = 713, dwCritDown = 644, dwPoJiaDiKang = 1332 },
		[48] = {dwAttack = 7172, dwDefense = 6654, dwHPMax = 25102, dwFlee = 1067, dwCrit = 730, dwCritDown = 658, dwPoJiaDiKang = 1375 },
		[49] = {dwAttack = 7458, dwDefense = 6912, dwHPMax = 26103, dwFlee = 1095, dwCrit = 747, dwCritDown = 672, dwPoJiaDiKang = 1418 },
		[50] = {dwAttack = 7744, dwDefense = 7169, dwHPMax = 27104, dwFlee = 1124, dwCrit = 764, dwCritDown = 687, dwPoJiaDiKang = 1461 },
		[51] = {dwAttack = 8140, dwDefense = 7526, dwHPMax = 28490, dwFlee = 1164, dwCrit = 788, dwCritDown = 707, dwPoJiaDiKang = 1521 },
		[52] = {dwAttack = 8536, dwDefense = 7882, dwHPMax = 29876, dwFlee = 1203, dwCrit = 812, dwCritDown = 726, dwPoJiaDiKang = 1580 },
		[53] = {dwAttack = 8932, dwDefense = 8238, dwHPMax = 31262, dwFlee = 1243, dwCrit = 835, dwCritDown = 746, dwPoJiaDiKang = 1639 },
		[54] = {dwAttack = 9328, dwDefense = 8595, dwHPMax = 32648, dwFlee = 1282, dwCrit = 859, dwCritDown = 766, dwPoJiaDiKang = 1699 },
		[55] = {dwAttack = 9724, dwDefense = 8951, dwHPMax = 34034, dwFlee = 1322, dwCrit = 883, dwCritDown = 786, dwPoJiaDiKang = 1758 },
		[56] = {dwAttack = 10120, dwDefense = 9308, dwHPMax = 35420, dwFlee = 1362, dwCrit = 907, dwCritDown = 806, dwPoJiaDiKang = 1818 },
		[57] = {dwAttack = 10516, dwDefense = 9664, dwHPMax = 36806, dwFlee = 1401, dwCrit = 930, dwCritDown = 825, dwPoJiaDiKang = 1877 },
		[58] = {dwAttack = 10912, dwDefense = 10020, dwHPMax = 38192, dwFlee = 1441, dwCrit = 954, dwCritDown = 845, dwPoJiaDiKang = 1936 },
		[59] = {dwAttack = 11308, dwDefense = 10377, dwHPMax = 39578, dwFlee = 1480, dwCrit = 978, dwCritDown = 865, dwPoJiaDiKang = 1996 },
		[60] = {dwAttack = 11704, dwDefense = 10733, dwHPMax = 40964, dwFlee = 1520, dwCrit = 1002, dwCritDown = 885, dwPoJiaDiKang = 2055 },
		[61] = {dwAttack = 12232, dwDefense = 11208, dwHPMax = 42812, dwFlee = 1573, dwCrit = 1033, dwCritDown = 911, dwPoJiaDiKang = 2134 },
		[62] = {dwAttack = 12760, dwDefense = 11684, dwHPMax = 44660, dwFlee = 1626, dwCrit = 1065, dwCritDown = 938, dwPoJiaDiKang = 2214 },
		[63] = {dwAttack = 13288, dwDefense = 12159, dwHPMax = 46508, dwFlee = 1678, dwCrit = 1097, dwCritDown = 964, dwPoJiaDiKang = 2293 },
		[64] = {dwAttack = 13816, dwDefense = 12634, dwHPMax = 48356, dwFlee = 1731, dwCrit = 1128, dwCritDown = 990, dwPoJiaDiKang = 2372 },
		[65] = {dwAttack = 14344, dwDefense = 13109, dwHPMax = 50204, dwFlee = 1784, dwCrit = 1160, dwCritDown = 1017, dwPoJiaDiKang = 2451 },
		[66] = {dwAttack = 14872, dwDefense = 13584, dwHPMax = 52052, dwFlee = 1837, dwCrit = 1192, dwCritDown = 1043, dwPoJiaDiKang = 2530 },
		[67] = {dwAttack = 15400, dwDefense = 14060, dwHPMax = 53900, dwFlee = 1890, dwCrit = 1224, dwCritDown = 1070, dwPoJiaDiKang = 2610 },
		[68] = {dwAttack = 15928, dwDefense = 14535, dwHPMax = 55748, dwFlee = 1942, dwCrit = 1255, dwCritDown = 1096, dwPoJiaDiKang = 2689 },
		[69] = {dwAttack = 16456, dwDefense = 15010, dwHPMax = 57596, dwFlee = 1995, dwCrit = 1287, dwCritDown = 1122, dwPoJiaDiKang = 2768 },
		[70] = {dwAttack = 16984, dwDefense = 15485, dwHPMax = 59444, dwFlee = 2048, dwCrit = 1319, dwCritDown = 1149, dwPoJiaDiKang = 2847 },
		[71] = {dwAttack = 17666, dwDefense = 16099, dwHPMax = 61831, dwFlee = 2116, dwCrit = 1359, dwCritDown = 1183, dwPoJiaDiKang = 2949 },
		[72] = {dwAttack = 18348, dwDefense = 16713, dwHPMax = 64218, dwFlee = 2184, dwCrit = 1400, dwCritDown = 1217, dwPoJiaDiKang = 3052 },
		[73] = {dwAttack = 19030, dwDefense = 17327, dwHPMax = 66605, dwFlee = 2253, dwCrit = 1441, dwCritDown = 1251, dwPoJiaDiKang = 3154 },
		[74] = {dwAttack = 19712, dwDefense = 17940, dwHPMax = 68992, dwFlee = 2321, dwCrit = 1482, dwCritDown = 1285, dwPoJiaDiKang = 3256 },
		[75] = {dwAttack = 20394, dwDefense = 18554, dwHPMax = 71379, dwFlee = 2389, dwCrit = 1523, dwCritDown = 1319, dwPoJiaDiKang = 3359 },
		[76] = {dwAttack = 21076, dwDefense = 19168, dwHPMax = 73766, dwFlee = 2457, dwCrit = 1564, dwCritDown = 1353, dwPoJiaDiKang = 3461 },
		[77] = {dwAttack = 21758, dwDefense = 19782, dwHPMax = 76153, dwFlee = 2525, dwCrit = 1605, dwCritDown = 1387, dwPoJiaDiKang = 3563 },
		[78] = {dwAttack = 22440, dwDefense = 20396, dwHPMax = 78540, dwFlee = 2594, dwCrit = 1646, dwCritDown = 1422, dwPoJiaDiKang = 3666 },
		[79] = {dwAttack = 23122, dwDefense = 21009, dwHPMax = 80927, dwFlee = 2662, dwCrit = 1687, dwCritDown = 1456, dwPoJiaDiKang = 3768 },
		[80] = {dwAttack = 23804, dwDefense = 21623, dwHPMax = 83314, dwFlee = 2730, dwCrit = 1728, dwCritDown = 1490, dwPoJiaDiKang = 3870 },
		[81] = {dwAttack = 24662, dwDefense = 22395, dwHPMax = 86317, dwFlee = 2816, dwCrit = 1779, dwCritDown = 1533, dwPoJiaDiKang = 3999 },
		[82] = {dwAttack = 25520, dwDefense = 23168, dwHPMax = 89320, dwFlee = 2902, dwCrit = 1831, dwCritDown = 1576, dwPoJiaDiKang = 4128 },
		[83] = {dwAttack = 26378, dwDefense = 23940, dwHPMax = 92323, dwFlee = 2987, dwCrit = 1882, dwCritDown = 1618, dwPoJiaDiKang = 4256 },
		[84] = {dwAttack = 27236, dwDefense = 24712, dwHPMax = 95326, dwFlee = 3073, dwCrit = 1934, dwCritDown = 1661, dwPoJiaDiKang = 4385 },
		[85] = {dwAttack = 28094, dwDefense = 25484, dwHPMax = 98329, dwFlee = 3159, dwCrit = 1985, dwCritDown = 1704, dwPoJiaDiKang = 4514 },
		[86] = {dwAttack = 28952, dwDefense = 26256, dwHPMax = 101332, dwFlee = 3245, dwCrit = 2037, dwCritDown = 1747, dwPoJiaDiKang = 4642 },
		[87] = {dwAttack = 29810, dwDefense = 27029, dwHPMax = 104335, dwFlee = 3331, dwCrit = 2088, dwCritDown = 1790, dwPoJiaDiKang = 4771 },
		[88] = {dwAttack = 30668, dwDefense = 27801, dwHPMax = 107338, dwFlee = 3416, dwCrit = 2140, dwCritDown = 1833, dwPoJiaDiKang = 4900 },
		[89] = {dwAttack = 31526, dwDefense = 28573, dwHPMax = 110341, dwFlee = 3502, dwCrit = 2191, dwCritDown = 1876, dwPoJiaDiKang = 5028 },
		[90] = {dwAttack = 32582, dwDefense = 29523, dwHPMax = 114037, dwFlee = 3608, dwCrit = 2254, dwCritDown = 1929, dwPoJiaDiKang = 5187 },
		 },

	-- 剑套装加成属性列表(key-剑套装id; value-剑套装对应的属性加成)，注：此加成是叠加的
	SwordAttrList = {
		[1] = {dwAttack = 1400, dwDefense = 1580, dwHPMax = 5500, dwFlee = 340, dwCrit = 384, dwCritDown = 270, dwPoJiaDiKang = 410,  },
		[2] = {dwAttack = 2400, dwDefense = 2280, dwHPMax = 8000, dwFlee = 440, dwCrit = 444, dwCritDown = 320, dwPoJiaDiKang = 560,  },
		[3] = {dwAttack = 3600, dwDefense = 3120, dwHPMax = 11000, dwFlee = 560, dwCrit = 516, dwCritDown = 380, dwPoJiaDiKang = 740,  },
		[4] = {dwAttack = 5100, dwDefense = 4170, dwHPMax = 14750, dwFlee = 710, dwCrit = 606, dwCritDown = 455, dwPoJiaDiKang = 965,  },
		[5] = {dwAttack = 6900, dwDefense = 5430, dwHPMax = 19250, dwFlee = 890, dwCrit = 714, dwCritDown = 545, dwPoJiaDiKang = 1235,  },
		[6] = {dwAttack = 9400, dwDefense = 7180, dwHPMax = 25500, dwFlee = 1140, dwCrit = 864, dwCritDown = 670, dwPoJiaDiKang = 1610,  },
		[7] = {dwAttack = 12200, dwDefense = 9140, dwHPMax = 32500, dwFlee = 1420, dwCrit = 1032, dwCritDown = 810, dwPoJiaDiKang = 2030,  },
		[8] = {dwAttack = 15200, dwDefense = 11240, dwHPMax = 40000, dwFlee = 1720, dwCrit = 1212, dwCritDown = 960, dwPoJiaDiKang = 2480,  },
		[9] = {dwAttack = 18700, dwDefense = 13690, dwHPMax = 48750, dwFlee = 2070, dwCrit = 1422, dwCritDown = 1135, dwPoJiaDiKang = 3005,  },
		 },

	-- 修炼列表(key-修炼类型id; value-修炼信息)
	PracticeList = {
		-- 修炼信息列表(key-信息名称; value-信息值)
		[1] = {
			sFlag 		= "Primary", 	-- 无需配置，默认值
			nTimesLimit = 100, 		-- 修炼次数限制。 T"无限"：无限制，10: 10次限制
			sName 		= T"剑魂石", 	-- 修炼所需物品名称：T"檀香丹"( 可配置 ) or T"元宝"
			nType 		= 1, 			-- 修炼所需物品类型：1：道具，2：元宝
			nId 		= 4100110, 		-- 所需物品的id
			nNum        = 1,            -- 每一次耗费物品(或元宝)的数量
			dwPlus 		= 50, 		-- 修炼成功后增加的历练值
		},
		[2] = {
			sFlag 		= "Intermediate",
			nTimesLimit = 100,
			sName 		= T"九剑残章",
			nType 		= 1,
			nId 		= 4100506,
			nNum        = 1,
			dwPlus 		= 550,
		},
		[3] = {
			sFlag 		= "Advanced",
			nTimesLimit = 50,
			sName 		= T"元宝",
			nType 		= 2,
			nId 		= 2500161,
			nNum        = 100,
			dwPlus 		= 250,
		},
	},

	-- 技能列表(key-信息名称; value-信息值)
	SkillList = {
		dwId 			= 110000, 	-- 技能Id
		nActivateLevel 	= 21, 		-- 开启技能的修炼等级
		-- 技能等级列表(key-技能等级; value-信息值)
		-- 技能隐藏属性列表(key-隐藏属性id; value-解锁该隐藏属性的剑id)
		tLevel = {
			[1] = {nChance = 8, nPracLVMin = 21, nPracLVMax = 30},
			[2] = {nChance = 10, nPracLVMin = 31, nPracLVMax = 40},
			[3] = {nChance = 13, nPracLVMin = 41, nPracLVMax = 50},
			[4] = {nChance = 15, nPracLVMin = 51, nPracLVMax = 60},
			[5] = {nChance = 18, nPracLVMin = 61, nPracLVMax = 70},
			[6] = {nChance = 20, nPracLVMin = 71, nPracLVMax = 80},
			[7] = {nChance = 25, nPracLVMin = 81, nPracLVMax = 90},
		};
	},

	-- 技能buff的tips列表(key-解锁的剑的最大索引; value-打开的buff的最大索引)
	BuffTipsList = {
		[1] = 1,
		[2] = 1,
		[3] = 1,
		[4] = 1,
		[5] = 1,
		[6] = 2,
		[7] = 3,
		[8] = 4,
		[9] = 5,
	},
	
	-- buff(BuffPer：触发几率；Att：攻击；Crit：暴击；Def：防御；PoJia：破甲；Hp：血量)
	buff = {
		[1] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[2] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[3] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[4] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[5] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[6] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[7] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[8] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[9] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[10] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[11] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[12] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[13] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[14] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[15] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[16] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[17] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[18] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[19] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[20] = {BuffPer = 0, Att = 0, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[21] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[22] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[23] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[24] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[25] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[26] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[27] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[28] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[29] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[30] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[31] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[32] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[33] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[34] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[35] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[36] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[37] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[38] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[39] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[40] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[41] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[42] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[43] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[44] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[45] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[46] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[47] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[48] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[49] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[50] = {BuffPer = 100, Att = 15, Crit = 0, Def = 0, PoJia = 0, Hp = 0 },
		[51] = {BuffPer = 100, Att = 15, Crit = 25, Def = 0, PoJia = 0, Hp = 0 },
		[52] = {BuffPer = 100, Att = 15, Crit = 25, Def = 0, PoJia = 0, Hp = 0 },
		[53] = {BuffPer = 100, Att = 15, Crit = 25, Def = 0, PoJia = 0, Hp = 0 },
		[54] = {BuffPer = 100, Att = 15, Crit = 25, Def = 0, PoJia = 0, Hp = 0 },
		[55] = {BuffPer = 100, Att = 15, Crit = 25, Def = 0, PoJia = 0, Hp = 0 },
		[56] = {BuffPer = 100, Att = 15, Crit = 25, Def = 0, PoJia = 0, Hp = 0 },
		[57] = {BuffPer = 100, Att = 15, Crit = 25, Def = 0, PoJia = 0, Hp = 0 },
		[58] = {BuffPer = 100, Att = 15, Crit = 25, Def = 0, PoJia = 0, Hp = 0 },
		[59] = {BuffPer = 100, Att = 15, Crit = 25, Def = 0, PoJia = 0, Hp = 0 },
		[60] = {BuffPer = 100, Att = 15, Crit = 25, Def = 0, PoJia = 0, Hp = 0 },
		[61] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 0, Hp = 0 },
		[62] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 0, Hp = 0 },
		[63] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 0, Hp = 0 },
		[64] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 0, Hp = 0 },
		[65] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 0, Hp = 0 },
		[66] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 0, Hp = 0 },
		[67] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 0, Hp = 0 },
		[68] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 0, Hp = 0 },
		[69] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 0, Hp = 0 },
		[70] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 0, Hp = 0 },
		[71] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 0 },
		[72] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 0 },
		[73] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 0 },
		[74] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 0 },
		[75] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 0 },
		[76] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 0 },
		[77] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 0 },
		[78] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 0 },
		[79] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 0 },
		[80] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 0 },
		[81] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 20 },
		[82] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 20 },
		[83] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 20 },
		[84] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 20 },
		[85] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 20 },
		[86] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 20 },
		[87] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 20 },
		[88] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 20 },
		[89] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 20 },
		[90] = {BuffPer = 100, Att = 15, Crit = 25, Def = 35, PoJia = 40, Hp = 20 },
		 },
	
	-- 激活剑套装列表(key-剑套装id; value-所需物品id、所需物品数量)
	SwordNeed = {                         --name 
		[1] = { nId = 4100505, nNum = 50  ,name1 = T"<font color='#FFFF00' size='16'>【独孤九剑·御剑】</font><font color='#FF0000'>(未激活)</font>",name2 =T"<font color='#FFFF00' size='16'>【独孤九剑·御剑 】</font>(已激活)"},
		[2] = { nId = 4100505, nNum = 90  ,name1 = T"<font color='#FFFF00' size='16'>【独孤九剑·御气】</font><font color='#FF0000'>(未激活)</font>",name2 =T"<font color='#FFFF00' size='16'>【独孤九剑·御气 】</font>(已激活)"},
		[3] = { nId = 4100505, nNum = 170  ,name1 = T"<font color='#FFFF00' size='16'>【独孤九剑·御神】</font><font color='#FF0000'>(未激活)</font>",name2 =T"<font color='#FFFF00' size='16'>【独孤九剑·御神 】</font>(已激活)"},
		[4] = { nId = 4100505, nNum = 320  ,name1 = T"<font color='#FFFF00' size='16'>【独孤九剑·残念】</font><font color='#FF0000'>(未激活)</font>",name2 =T"<font color='#FFFF00' size='16'>【独孤九剑·残念 】</font>(已激活)"},
		[5] = { nId = 4100505, nNum = 600  ,name1 = T"<font color='#FFFF00' size='16'>【独孤九剑·残式】</font><font color='#FF0000'>(未激活)</font>",name2 =T"<font color='#FFFF00' size='16'>【独孤九剑·残式 】</font>(已激活)"},
		[6] = { nId = 4100505, nNum = 1100  ,name1 = T"<font color='#FFFF00' size='16'>【独孤九剑·残影】</font><font color='#FF0000'>(未激活)</font>",name2 =T"<font color='#FFFF00' size='16'>【独孤九剑·残影 】</font>(已激活)"},
		[7] = { nId = 4100505, nNum = 1800  ,name1 = T"<font color='#FFFF00' size='16'>【独孤九剑·无招】</font><font color='#FF0000'>(未激活)</font>",name2 =T"<font color='#FFFF00' size='16'>【独孤九剑·无招 】</font>(已激活)"},
		[8] = { nId = 4100505, nNum = 2800  ,name1 = T"<font color='#FFFF00' size='16'>【独孤九剑·无形】</font><font color='#FF0000'>(未激活)</font>",name2 =T"<font color='#FFFF00' size='16'>【独孤九剑·无形 】</font>(已激活)"},
		[9] = { nId = 4100505, nNum = 3600  ,name1 = T"<font color='#FFFF00' size='16'>【独孤九剑·无心】</font><font color='#FF0000'>(未激活)</font>",name2 =T"<font color='#FFFF00' size='16'>【独孤九剑·无心 】</font>(已激活)"},
	},

	
	Stage = {  
			   [1] = T"<font color='#4daeed'>总诀式</font>";
	           [2] = T"<font color='#4daeed'>破剑式</font>";
			   [3] = T"<font color='#4daeed'>破刀式</font>";
			   [4] = T"<font color='#4daeed'>破枪式</font>";
			   [5] = T"<font color='#4daeed'>破鞭式</font>";
			   [6] = T"<font color='#4daeed'>破索式</font>";
			   [7] = T"<font color='#4daeed'>破掌式</font>";
			   [8] = T"<font color='#4daeed'>破箭式</font>";
			   [9] = T"<font color='#4daeed'>破气式</font>";
			};	
	Stage2 = {  
			   [1] = T"总诀式";
	           [2] = T"破剑式";
			   [3] = T"破刀式";
			   [4] = T"破枪式";
			   [5] = T"破鞭式";
			   [6] = T"破索式";
			   [7] = T"破掌式";
			   [8] = T"破箭式";
			   [9] = T"破气式";
			};
	
			
	ArrtConfig ={
	
				Shunxu1 = {"dwAttack";"dwDefense";"dwHPMax";"dwFlee";"dwCrit";"dwCritDown";"dwPoJiaDiKang";}; --基本属性加成
				Shunxu2 = {"dwAttack";"dwDefense";"dwHPMax";"dwFlee";"dwCrit";"dwCritDown";"dwPoJiaDiKang";}; --套装属性
				Shunxu3 = {"dwAttack";"dwDefense";"dwHPMax";"dwFlee";"dwCrit";"dwCritDown";"dwPoJiaDiKang";}; --九剑激活tips
				Shuxing =  {
						dwAttack 	= T"攻击 + %s";
						dwDefense 	= T"防御 + %s";
						dwMPMax     = T"内力 + %s";
						dwHPMax     = T"生命 + %s";
						dwFlee 		= T"身法 + %s";
						dwCrit 		= T"暴击 + %s";
						dwCritDown  = T"暴击抵抗 + %s";
						dwPoJiaValue = T"破甲攻击 + %s";
						dwPoJiaDiKang = T"伤害抵御 + %s";
						-- dwCritDown = T"暴击抵抗 + %s";
					};
				Shuxing4 = { 																--属性表属性字符串
							dwAttack 	= T"<font color='#FFFF00'>攻击</font> + %s ";
							dwDefense 	= T"<font color='#FFFF00'>防御</font> + %s";
							dwMPMax     = T"<font color='#FFFF00'>内力</font> + %s";
							dwHPMax     = T"<font color='#FFFF00'>生命</font> + %s";
							dwFlee 		= T"<font color='#FFFF00'>身法</font> + %s";
							dwCrit 		= T"<font color='#FFFF00'>暴击</font> + %s";
							dwCritDown  = T"<font color='#FFFF00'>暴击抵抗</font> + %s";
							dwPoJiaValue = T"<font color='#FFFF00'>破甲攻击</font> + %s";
							dwPoJiaDiKang = T"<font color='#FFFF00'>伤害抵御</font> + %s";
			};	
					
					
				};
				
	SwordText = {
				[1] = T"【修炼至破刀式】  触发增加自身15%攻击</font>";
				[2] = T"【独孤九剑·残影】触发增加自身25%暴击</font>";
				[3] = T"【独孤九剑·无招】触发增加自身35%防御</font>";
				[4] = T"【独孤九剑·无形】触发增加自身40%破甲攻击</font>";
				[5] = T"【独孤九剑·无心】触发恢复自身20%生命</font>";
				};	
				
				
    --StrDo = T"（已激活）";								--激活
	--StrNot	= T"<font color='#FF0000'>（未激活）</font>";--未激活
	
    --Name = T"<font color='#FFFF00' size='16'>独孤九剑.%s重 </font><font color='#FF0000'>(未激活)</font>";
    Need1 = T"<font color='#FFFFFF'>激活所需 ：满足以下条件后点击按钮即可升级 <br>1. 独孤九剑修炼阶段达%s </font><br><font color='#FFFFFF'>2. 消耗%s：%s/%s把</font> <br><font color='#4daeed'>激活后可获得属性</font>";--白色
	Need2 = T"<font color='#FFFFFF'>激活所需 ：满足以下条件后点击按钮即可升级 <br>1. 独孤九剑修炼阶段达%s </font><br><font color='#FFFFFF'>2. 消耗%s：</font><font color='#FF0000'>%s/%s把</font> <br><font color='#4daeed'>激活后可获得属性</font>";--红色
	--YName =  T"<font color='#FFFF00' size='16'>独孤九剑.%s重 </font>(已激活)"; 
    sLabel = T"<font color='#4daeed'>当前效果</font>";	
	sLabe2 = T"<font color='#FFFF00'>【激活独孤九剑技能·%s】</font>";
	--sLabe3 = T"（触发技能时额外增加自身20%攻击）";
	sLabe4 = T"<font color='#FFFF00'>【激活独孤九剑技能·%s】</font>";
	
	Dugulabe = { 
	           [1] = T"御剑";
	           [2] = T"御气";
			   [3] = T"御神";
			   [4] = T"残念";
			   [5] = T"残式";
	           [6] = T"残影";
	           [7] = T"无招";
	           [8] = T"无形";
	           [9] = T"无心";
	           };
		   
				
	sLabe5 = T"使用%s可快速获取独孤九剑修炼值（每个可提升%s点修炼值）";
	sLabe6 = T"使用元宝可快速获取独孤九剑修炼值（每消耗%s元宝可提升%s点修炼值）";

	sLv = "<font color='#4daeed'>Lv.%s</font>";
	stigger = "<font color='#4daeed'>%s %%</font>";
	stime = T"可修炼次数 %s";
	sliulianzhi = T"<font color='#4daeed'>%s 修炼值</font>";
	smode = T"<font color='#4fd388'>剑招修炼</font> <font color='#4daeed'>剑意修炼</font> <font color='#e082da'>剑魂修炼</font>",  --修炼值获取方式
	
	sNotice1 = T"该修炼已达今日次数上限，无法修炼";
	sNotice4 = T"独孤九剑修炼+ %s";
	

	sNotice5 = T"恭喜大侠%s成功修炼独孤九剑·%s";
	sNotice6 = T"恭喜大侠%s成功激活独孤九剑·%s，实力大增！";
	
    szName 	= T"<font color='#FFFF00'>无剑无我</font>";	--技能名称
	szIcon1	= "img://Icon_sk_wjww_1.png";		--技能图标 彩色
	szIcon2 =  "img://Icon_sk_wjww_0.png";   	--技能图标 灰色
	szActive =	T"修炼至破刀式";				--激活条件
	szLearn	= "";			--技能学习状态  --不要
	szType	=	T"被动技能";		       --武学类型
    szDes	= T"<font color='#4daeed'>修炼至破刀式便可开启”无剑无我“技能，激活独孤九剑·残影、无招、无形、无心可获得额外技能效果</font><font color='#FFFF00'>（技能效果为同时触发，持续10秒）</font>";				--描述
		
	
	IsEnough = "<font color='#4fd388' size='12'>%s</font>";--激活后    拼接技能tips 绿色
	IsNoEnough = "<font color='#CCCCCC' size='12'>%s</font>";	--激活前  拼接技能tips 灰色
	IsOther = "<font color='#FFFF00'>%s</font>";--金色  
	
	StageColor1 ="<font color='#FFFFFF'>%s</font>";  --满足条件
	StageColor2 ="<font color='#FF0000'>%s</font>";  --不满足条件
	
}


