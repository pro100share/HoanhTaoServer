--[[
	[\brief 战骑决系统配置文件
	[\author 王凌波, 裴雪阳
	[\date 2014-6-18
	[策划可进行配置，客户端服务器公用配置文件
  ]]


_G.ZhanQiJueConfig = {

    -- 从此阶段开始，赐福成功需要广播
    BroadcastMinPhase = 3;

	--[[
        内丹列表(key-内丹索引; value-内丹信息值)
        nMaxEXP：		该内丹最大历练值
        nId：    		修炼一次该内丹所需物品id
        nNum：   		修炼一次该内丹所需物品数量
        nPlus：  		修炼一次增加的修炼值
        nBonus： 		暴击一次增加的修炼值
        nBonusChance:	暴击概率，0.1表示10%
        Attr:    		该内丹属性加成
        ]]
	DanList = {
        [1] =  {nMaxEXP = 0, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.05, Attr = {dwAttack = 270, dwDefense = 256, dwHPMax = 1161, dwFlee = 216, dwCrit = 342, dwPoJiaDiKang = 307 },},
		[2] =  {nMaxEXP = 1200, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.05, Attr = {dwAttack = 468, dwDefense = 444, dwHPMax = 2012, dwFlee = 228, dwCrit = 361, dwPoJiaDiKang = 326 },},
		[3] =  {nMaxEXP = 2400, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.05, Attr = {dwAttack = 666, dwDefense = 632, dwHPMax = 2863, dwFlee = 239, dwCrit = 381, dwPoJiaDiKang = 346 },},
		[4] =  {nMaxEXP = 4000, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.05, Attr = {dwAttack = 864, dwDefense = 820, dwHPMax = 3715, dwFlee = 251, dwCrit = 401, dwPoJiaDiKang = 366 },},
		[5] =  {nMaxEXP = 6000, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.05, Attr = {dwAttack = 1062, dwDefense = 1008, dwHPMax = 4566, dwFlee = 263, dwCrit = 421, dwPoJiaDiKang = 386 },},
		[6] =  {nMaxEXP = 8400, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.05, Attr = {dwAttack = 1260, dwDefense = 1197, dwHPMax = 5418, dwFlee = 275, dwCrit = 441, dwPoJiaDiKang = 406 },},
		[7] =  {nMaxEXP = 11200, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.05, Attr = {dwAttack = 1458, dwDefense = 1385, dwHPMax = 6269, dwFlee = 287, dwCrit = 460, dwPoJiaDiKang = 425 },},
		[8] =  {nMaxEXP = 14400, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.05, Attr = {dwAttack = 1656, dwDefense = 1573, dwHPMax = 7120, dwFlee = 299, dwCrit = 480, dwPoJiaDiKang = 445 },},
		[9] =  {nMaxEXP = 14400, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.05, Attr = {dwAttack = 1854, dwDefense = 1761, dwHPMax = 7972, dwFlee = 311, dwCrit = 500, dwPoJiaDiKang = 465 },},
		[10] = {nMaxEXP = 18000, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.05, Attr = {dwAttack = 2052, dwDefense = 1949, dwHPMax = 8823, dwFlee = 323, dwCrit = 520, dwPoJiaDiKang = 485 },},
		[11] = {nMaxEXP = 22000, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.05, Attr = {dwAttack = 2286, dwDefense = 2171, dwHPMax = 9829, dwFlee = 337, dwCrit = 543, dwPoJiaDiKang = 508 },},
		[12] = {nMaxEXP = 26400, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.05, Attr = {dwAttack = 2520, dwDefense = 2394, dwHPMax = 10836, dwFlee = 351, dwCrit = 567, dwPoJiaDiKang = 532 },},
		[13] = {nMaxEXP = 31200, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.05, Attr = {dwAttack = 2754, dwDefense = 2616, dwHPMax = 11842, dwFlee = 365, dwCrit = 590, dwPoJiaDiKang = 555 },},
		[14] = {nMaxEXP = 36400, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.05, Attr = {dwAttack = 2988, dwDefense = 2838, dwHPMax = 12848, dwFlee = 379, dwCrit = 613, dwPoJiaDiKang = 578 },},
		[15] = {nMaxEXP = 42000, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.05, Attr = {dwAttack = 3222, dwDefense = 3060, dwHPMax = 13854, dwFlee = 393, dwCrit = 637, dwPoJiaDiKang = 602 },},
		[16] = {nMaxEXP = 48000, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.05, Attr = {dwAttack = 3456, dwDefense = 3283, dwHPMax = 14860, dwFlee = 407, dwCrit = 660, dwPoJiaDiKang = 625 },},
		[17] = {nMaxEXP = 48000, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.04, Attr = {dwAttack = 3690, dwDefense = 3505, dwHPMax = 15867, dwFlee = 421, dwCrit = 684, dwPoJiaDiKang = 649 },},
		[18] = {nMaxEXP = 54400, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.04, Attr = {dwAttack = 3924, dwDefense = 3727, dwHPMax = 16873, dwFlee = 435, dwCrit = 707, dwPoJiaDiKang = 672 },},
		[19] = {nMaxEXP = 62400, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.04, Attr = {dwAttack = 4158, dwDefense = 3950, dwHPMax = 17879, dwFlee = 449, dwCrit = 730, dwPoJiaDiKang = 695 },},
		[20] = {nMaxEXP = 72000, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.04, Attr = {dwAttack = 4392, dwDefense = 4172, dwHPMax = 18885, dwFlee = 463, dwCrit = 754, dwPoJiaDiKang = 719 },},
		[21] = {nMaxEXP = 83200, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.04, Attr = {dwAttack = 4698, dwDefense = 4463, dwHPMax = 20201, dwFlee = 481, dwCrit = 784, dwPoJiaDiKang = 749 },},
		[22] = {nMaxEXP = 96000, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.04, Attr = {dwAttack = 5004, dwDefense = 4753, dwHPMax = 21517, dwFlee = 500, dwCrit = 815, dwPoJiaDiKang = 780 },},
		[23] = {nMaxEXP = 110400, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.04, Attr = {dwAttack = 5310, dwDefense = 5044, dwHPMax = 22833, dwFlee = 518, dwCrit = 846, dwPoJiaDiKang = 811 },},
		[24] = {nMaxEXP = 126400, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.04, Attr = {dwAttack = 5616, dwDefense = 5335, dwHPMax = 24148, dwFlee = 536, dwCrit = 876, dwPoJiaDiKang = 841 },},
		[25] = {nMaxEXP = 126400, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.03, Attr = {dwAttack = 5922, dwDefense = 5625, dwHPMax = 25464, dwFlee = 555, dwCrit = 907, dwPoJiaDiKang = 872 },},
		[26] = {nMaxEXP = 144000, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.03, Attr = {dwAttack = 6228, dwDefense = 5916, dwHPMax = 26780, dwFlee = 573, dwCrit = 937, dwPoJiaDiKang = 902 },},
		[27] = {nMaxEXP = 163200, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.03, Attr = {dwAttack = 6534, dwDefense = 6207, dwHPMax = 28096, dwFlee = 592, dwCrit = 968, dwPoJiaDiKang = 933 },},
		[28] = {nMaxEXP = 184000, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.03, Attr = {dwAttack = 6840, dwDefense = 6498, dwHPMax = 29412, dwFlee = 610, dwCrit = 999, dwPoJiaDiKang = 964 },},
		[29] = {nMaxEXP = 206400, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.03, Attr = {dwAttack = 7146, dwDefense = 6788, dwHPMax = 30727, dwFlee = 628, dwCrit = 1029, dwPoJiaDiKang = 994 },},
		[30] = {nMaxEXP = 230400, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.03, Attr = {dwAttack = 7452, dwDefense = 7079, dwHPMax = 32043, dwFlee = 647, dwCrit = 1060, dwPoJiaDiKang = 1025 },},
		[31] = {nMaxEXP = 256000, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.03, Attr = {dwAttack = 7902, dwDefense = 7506, dwHPMax = 33978, dwFlee = 674, dwCrit = 1105, dwPoJiaDiKang = 1070 },},
		[32] = {nMaxEXP = 283200, nId = 4100507, nNum = 1, nPlus = 200, nBonus = 400, nBonusChance = 0.03, Attr = {dwAttack = 8352, dwDefense = 7934, dwHPMax = 35913, dwFlee = 701, dwCrit = 1150, dwPoJiaDiKang = 1115 },},
		[33] = {nMaxEXP = 283200, nId = 4100507, nNum = 2, nPlus = 400, nBonus = 800, nBonusChance = 0.02, Attr = {dwAttack = 8802, dwDefense = 8361, dwHPMax = 37848, dwFlee = 728, dwCrit = 1195, dwPoJiaDiKang = 1160 },},
		[34] = {nMaxEXP = 312000, nId = 4100507, nNum = 2, nPlus = 400, nBonus = 800, nBonusChance = 0.02, Attr = {dwAttack = 9252, dwDefense = 8789, dwHPMax = 39783, dwFlee = 755, dwCrit = 1240, dwPoJiaDiKang = 1205 },},
		[35] = {nMaxEXP = 342400, nId = 4100507, nNum = 2, nPlus = 400, nBonus = 800, nBonusChance = 0.02, Attr = {dwAttack = 9702, dwDefense = 9216, dwHPMax = 41718, dwFlee = 782, dwCrit = 1285, dwPoJiaDiKang = 1250 },},
		[36] = {nMaxEXP = 374400, nId = 4100507, nNum = 2, nPlus = 400, nBonus = 800, nBonusChance = 0.02, Attr = {dwAttack = 10152, dwDefense = 9644, dwHPMax = 43653, dwFlee = 809, dwCrit = 1330, dwPoJiaDiKang = 1295 },},
		[37] = {nMaxEXP = 409600, nId = 4100507, nNum = 2, nPlus = 400, nBonus = 800, nBonusChance = 0.02, Attr = {dwAttack = 10602, dwDefense = 10071, dwHPMax = 45588, dwFlee = 836, dwCrit = 1375, dwPoJiaDiKang = 1340 },},
		[38] = {nMaxEXP = 448000, nId = 4100507, nNum = 2, nPlus = 400, nBonus = 800, nBonusChance = 0.02, Attr = {dwAttack = 11052, dwDefense = 10499, dwHPMax = 47523, dwFlee = 863, dwCrit = 1420, dwPoJiaDiKang = 1385 },},
		[39] = {nMaxEXP = 489600, nId = 4100507, nNum = 2, nPlus = 400, nBonus = 800, nBonusChance = 0.02, Attr = {dwAttack = 11502, dwDefense = 10926, dwHPMax = 49458, dwFlee = 890, dwCrit = 1465, dwPoJiaDiKang = 1430 },},
		[40] = {nMaxEXP = 534400, nId = 4100507, nNum = 2, nPlus = 400, nBonus = 800, nBonusChance = 0.02, Attr = {dwAttack = 11952, dwDefense = 11354, dwHPMax = 51393, dwFlee = 917, dwCrit = 1510, dwPoJiaDiKang = 1475 },},
		[41] = {nMaxEXP = 534400, nId = 4100507, nNum = 2, nPlus = 400, nBonus = 800, nBonusChance = 0.02, Attr = {dwAttack = 12690, dwDefense = 12055, dwHPMax = 54567, dwFlee = 961, dwCrit = 1584, dwPoJiaDiKang = 1549 },},
		[42] = {nMaxEXP = 582400, nId = 4100507, nNum = 2, nPlus = 400, nBonus = 800, nBonusChance = 0.02, Attr = {dwAttack = 13428, dwDefense = 12756, dwHPMax = 57740, dwFlee = 1005, dwCrit = 1657, dwPoJiaDiKang = 1622 },},
		[43] = {nMaxEXP = 633600, nId = 4100507, nNum = 2, nPlus = 400, nBonus = 800, nBonusChance = 0.02, Attr = {dwAttack = 14166, dwDefense = 13457, dwHPMax = 60913, dwFlee = 1049, dwCrit = 1731, dwPoJiaDiKang = 1696 },},
		[44] = {nMaxEXP = 688000, nId = 4100507, nNum = 2, nPlus = 400, nBonus = 800, nBonusChance = 0.02, Attr = {dwAttack = 14904, dwDefense = 14158, dwHPMax = 64087, dwFlee = 1094, dwCrit = 1805, dwPoJiaDiKang = 1770 },},
		[45] = {nMaxEXP = 745600, nId = 4100507, nNum = 2, nPlus = 400, nBonus = 800, nBonusChance = 0.02, Attr = {dwAttack = 15642, dwDefense = 14859, dwHPMax = 67260, dwFlee = 1138, dwCrit = 1879, dwPoJiaDiKang = 1844 },},
		[46] = {nMaxEXP = 806400, nId = 4100507, nNum = 2, nPlus = 400, nBonus = 800, nBonusChance = 0.02, Attr = {dwAttack = 16380, dwDefense = 15561, dwHPMax = 70434, dwFlee = 1182, dwCrit = 1953, dwPoJiaDiKang = 1918 },},
		[47] = {nMaxEXP = 870400, nId = 4100507, nNum = 2, nPlus = 400, nBonus = 800, nBonusChance = 0.02, Attr = {dwAttack = 17118, dwDefense = 16262, dwHPMax = 73607, dwFlee = 1227, dwCrit = 2026, dwPoJiaDiKang = 1991 },},
		[48] = {nMaxEXP = 937600, nId = 4100507, nNum = 2, nPlus = 400, nBonus = 800, nBonusChance = 0.02, Attr = {dwAttack = 17856, dwDefense = 16963, dwHPMax = 76780, dwFlee = 1271, dwCrit = 2100, dwPoJiaDiKang = 2065 },},
		[49] = {nMaxEXP = 937600, nId = 4100507, nNum = 4, nPlus = 800, nBonus = 1600, nBonusChance = 0.02, Attr = {dwAttack = 18594, dwDefense = 17664, dwHPMax = 79954, dwFlee = 1315, dwCrit = 2174, dwPoJiaDiKang = 2139 },},
		[50] = {nMaxEXP = 1008000, nId = 4100507, nNum = 4, nPlus = 800, nBonus = 1600, nBonusChance = 0.02, Attr = {dwAttack = 19332, dwDefense = 18365, dwHPMax = 83127, dwFlee = 1359, dwCrit = 2248, dwPoJiaDiKang = 2213 },},
		[51] = {nMaxEXP = 1081600, nId = 4100507, nNum = 4, nPlus = 800, nBonus = 1600, nBonusChance = 0.02, Attr = {dwAttack = 20520, dwDefense = 19494, dwHPMax = 88236, dwFlee = 1431, dwCrit = 2367, dwPoJiaDiKang = 2332 },},
		[52] = {nMaxEXP = 1158400, nId = 4100507, nNum = 4, nPlus = 800, nBonus = 1600, nBonusChance = 0.02, Attr = {dwAttack = 21708, dwDefense = 20622, dwHPMax = 93344, dwFlee = 1502, dwCrit = 2485, dwPoJiaDiKang = 2450 },},
		[53] = {nMaxEXP = 1238400, nId = 4100507, nNum = 4, nPlus = 800, nBonus = 1600, nBonusChance = 0.02, Attr = {dwAttack = 22896, dwDefense = 21751, dwHPMax = 98452, dwFlee = 1573, dwCrit = 2604, dwPoJiaDiKang = 2569 },},
		[54] = {nMaxEXP = 1321600, nId = 4100507, nNum = 4, nPlus = 800, nBonus = 1600, nBonusChance = 0.02, Attr = {dwAttack = 24084, dwDefense = 22879, dwHPMax = 103561, dwFlee = 1645, dwCrit = 2723, dwPoJiaDiKang = 2688 },},
		[55] = {nMaxEXP = 1419200, nId = 4100507, nNum = 4, nPlus = 800, nBonus = 1600, nBonusChance = 0.02, Attr = {dwAttack = 25272, dwDefense = 24008, dwHPMax = 108669, dwFlee = 1716, dwCrit = 2842, dwPoJiaDiKang = 2807 },},
		[56] = {nMaxEXP = 1531200, nId = 4100507, nNum = 4, nPlus = 800, nBonus = 1600, nBonusChance = 0.02, Attr = {dwAttack = 26460, dwDefense = 25137, dwHPMax = 113778, dwFlee = 1787, dwCrit = 2961, dwPoJiaDiKang = 2926 },},
		[57] = {nMaxEXP = 1531200, nId = 4100507, nNum = 4, nPlus = 800, nBonus = 1600, nBonusChance = 0.02, Attr = {dwAttack = 27648, dwDefense = 26265, dwHPMax = 118886, dwFlee = 1858, dwCrit = 3079, dwPoJiaDiKang = 3044 },},
		[58] = {nMaxEXP = 1657600, nId = 4100507, nNum = 4, nPlus = 800, nBonus = 1600, nBonusChance = 0.02, Attr = {dwAttack = 28836, dwDefense = 27394, dwHPMax = 123994, dwFlee = 1930, dwCrit = 3198, dwPoJiaDiKang = 3163 },},
		[59] = {nMaxEXP = 1798400, nId = 4100507, nNum = 4, nPlus = 800, nBonus = 1600, nBonusChance = 0.02, Attr = {dwAttack = 30024, dwDefense = 28522, dwHPMax = 129103, dwFlee = 2001, dwCrit = 3317, dwPoJiaDiKang = 3282 },},
		[60] = {nMaxEXP = 1953600, nId = 4100507, nNum = 4, nPlus = 800, nBonus = 1600, nBonusChance = 0.02, Attr = {dwAttack = 31212, dwDefense = 29651, dwHPMax = 134211, dwFlee = 2072, dwCrit = 3436, dwPoJiaDiKang = 3401 },},
		[61] = {nMaxEXP = 2123200, nId = 4100507, nNum = 4, nPlus = 800, nBonus = 1600, nBonusChance = 0.02, Attr = {dwAttack = 33120, dwDefense = 31464, dwHPMax = 142416, dwFlee = 2187, dwCrit = 3627, dwPoJiaDiKang = 3592 },},
		[62] = {nMaxEXP = 2307200, nId = 4100507, nNum = 4, nPlus = 800, nBonus = 1600, nBonusChance = 0.02, Attr = {dwAttack = 35658, dwDefense = 33875, dwHPMax = 153329, dwFlee = 2339, dwCrit = 3880, dwPoJiaDiKang = 3845 },},
		[63] = {nMaxEXP = 2505600, nId = 4100507, nNum = 4, nPlus = 800, nBonus = 1600, nBonusChance = 0.02, Attr = {dwAttack = 38196, dwDefense = 36286, dwHPMax = 164242, dwFlee = 2491, dwCrit = 4134, dwPoJiaDiKang = 4099 },},
		[64] = {nMaxEXP = 2718400, nId = 4100507, nNum = 4, nPlus = 800, nBonus = 1600, nBonusChance = 0.02, Attr = {dwAttack = 40734, dwDefense = 38697, dwHPMax = 175156, dwFlee = 2644, dwCrit = 4388, dwPoJiaDiKang = 4353 },},
		[65] = {nMaxEXP = 2718400, nId = 4100507, nNum = 6, nPlus = 1200, nBonus = 2400, nBonusChance = 0.01, Attr = {dwAttack = 43272, dwDefense = 41108, dwHPMax = 186069, dwFlee = 2796, dwCrit = 4642, dwPoJiaDiKang = 4607 },},
		[66] = {nMaxEXP = 2945600, nId = 4100507, nNum = 6, nPlus = 1200, nBonus = 2400, nBonusChance = 0.01, Attr = {dwAttack = 45810, dwDefense = 43519, dwHPMax = 196983, dwFlee = 2948, dwCrit = 4896, dwPoJiaDiKang = 4861 },},
		[67] = {nMaxEXP = 3187200, nId = 4100507, nNum = 6, nPlus = 1200, nBonus = 2400, nBonusChance = 0.01, Attr = {dwAttack = 48348, dwDefense = 45930, dwHPMax = 207896, dwFlee = 3100, dwCrit = 5149, dwPoJiaDiKang = 5114 },},
		[68] = {nMaxEXP = 3443200, nId = 4100507, nNum = 6, nPlus = 1200, nBonus = 2400, nBonusChance = 0.01, Attr = {dwAttack = 50886, dwDefense = 48341, dwHPMax = 218809, dwFlee = 3253, dwCrit = 5403, dwPoJiaDiKang = 5368 },},
		[69] = {nMaxEXP = 3713600, nId = 4100507, nNum = 6, nPlus = 1200, nBonus = 2400, nBonusChance = 0.01, Attr = {dwAttack = 53424, dwDefense = 50752, dwHPMax = 229723, dwFlee = 3405, dwCrit = 5657, dwPoJiaDiKang = 5622 },},
		[70] = {nMaxEXP = 3998400, nId = 4100507, nNum = 6, nPlus = 1200, nBonus = 2400, nBonusChance = 0.01, Attr = {dwAttack = 55962, dwDefense = 53163, dwHPMax = 240636, dwFlee = 3557, dwCrit = 5911, dwPoJiaDiKang = 5876 },},
		[71] = {nMaxEXP = 4297600, nId = 4100507, nNum = 6, nPlus = 1200, nBonus = 2400, nBonusChance = 0.01, Attr = {dwAttack = 59850, dwDefense = 56857, dwHPMax = 257355, dwFlee = 3791, dwCrit = 6300, dwPoJiaDiKang = 6265 },},
		[72] = {nMaxEXP = 4611200, nId = 4100507, nNum = 6, nPlus = 1200, nBonus = 2400, nBonusChance = 0.01, Attr = {dwAttack = 63738, dwDefense = 60551, dwHPMax = 274073, dwFlee = 4024, dwCrit = 6688, dwPoJiaDiKang = 6653 },},
		[73] = {nMaxEXP = 4611200, nId = 4100507, nNum = 6, nPlus = 1200, nBonus = 2400, nBonusChance = 0.01, Attr = {dwAttack = 67626, dwDefense = 64244, dwHPMax = 290791, dwFlee = 4257, dwCrit = 7077, dwPoJiaDiKang = 7042 },},
		[74] = {nMaxEXP = 4956800, nId = 4100507, nNum = 6, nPlus = 1200, nBonus = 2400, nBonusChance = 0.01, Attr = {dwAttack = 71514, dwDefense = 67938, dwHPMax = 307510, dwFlee = 4490, dwCrit = 7466, dwPoJiaDiKang = 7431 },},
		[75] = {nMaxEXP = 5334400, nId = 4100507, nNum = 6, nPlus = 1200, nBonus = 2400, nBonusChance = 0.01, Attr = {dwAttack = 75402, dwDefense = 71631, dwHPMax = 324228, dwFlee = 4724, dwCrit = 7855, dwPoJiaDiKang = 7820 },},
		[76] = {nMaxEXP = 5744000, nId = 4100507, nNum = 6, nPlus = 1200, nBonus = 2400, nBonusChance = 0.01, Attr = {dwAttack = 79290, dwDefense = 75325, dwHPMax = 340947, dwFlee = 4957, dwCrit = 8244, dwPoJiaDiKang = 8209 },},
		[77] = {nMaxEXP = 6185600, nId = 4100507, nNum = 6, nPlus = 1200, nBonus = 2400, nBonusChance = 0.01, Attr = {dwAttack = 83178, dwDefense = 79019, dwHPMax = 357665, dwFlee = 5190, dwCrit = 8632, dwPoJiaDiKang = 8597 },},
		[78] = {nMaxEXP = 6659200, nId = 4100507, nNum = 6, nPlus = 1200, nBonus = 2400, nBonusChance = 0.01, Attr = {dwAttack = 87066, dwDefense = 82712, dwHPMax = 374383, dwFlee = 5423, dwCrit = 9021, dwPoJiaDiKang = 8986 },},
		[79] = {nMaxEXP = 7164800, nId = 4100507, nNum = 6, nPlus = 1200, nBonus = 2400, nBonusChance = 0.01, Attr = {dwAttack = 90954, dwDefense = 86406, dwHPMax = 391102, dwFlee = 5657, dwCrit = 9410, dwPoJiaDiKang = 9375 },},
		[80] = {nMaxEXP = 7702400, nId = 4100507, nNum = 6, nPlus = 1200, nBonus = 2400, nBonusChance = 0.01, Attr = {dwAttack = 94842, dwDefense = 90099, dwHPMax = 407820, dwFlee = 5890, dwCrit = 9799, dwPoJiaDiKang = 9764 },},
	 },

	--[[
        天官赐福列表(key-赐福开始时所处的阶段; value-赐福信息值)
        nId: 	赐福所需物品id
		nNum: 	每次赐福所需物品数量
		nRate: 	进入tRange后的赐福成功几率
		tRange: 赐福值的范围，此范围之前成功率为0，之中成功率为nRate，之后成功率为100%
        ]]
	BlessList = {
		[1] = {nId = 4100508, nNum = 1, nRate = 0.5, tRange = {nFloor = 15, nCeil = 50}, name ="锦毛火眼",rank = "极高",},
		[2] = {nId = 4100508, nNum = 2, nRate = 0.25, tRange = {nFloor = 65, nCeil = 115}, name ="铜头铁背",rank = "高",},
		[3] = {nId = 4100508, nNum = 3, nRate = 0.25, tRange = {nFloor = 135, nCeil = 185}, name ="钢牙雳爪",rank = "一般",},
		[4] = {nId = 4100508, nNum = 4, nRate = 0.2, tRange = {nFloor = 215, nCeil = 355}, name ="降龙伏虎",rank = "低",},
		[5] = {nId = 4100508, nNum = 4, nRate = 0.1, tRange = {nFloor = 500, nCeil = 1000}, name ="混江撼岳",rank = "极低",},
		[6] = {nId = 4100508, nNum = 5, nRate = 0.1, tRange = {nFloor = 1800, nCeil = 4500}, name ="拔山覆海",rank = "极低",},
		[7] = {nId = 4100508, nNum = 6, nRate = 0.08, tRange = {nFloor = 6000, nCeil = 7800}, name ="奔雷飞电",rank = "极低",},
		[8] = {nId = 4100508, nNum = 7, nRate = 0.06, tRange = {nFloor = 11000, nCeil = 14000}, name ="摩云冲霄",rank = "极低",},
		[9] = {nId = 4100508, nNum = 8, nRate = 0.03, tRange = {nFloor = 15000, nCeil = 19000}, name ="驱神超圣",rank = "极低",},
		-- 注：第10阶段其实不需要赐福
		[10] = {nId = 4100508, nNum = 1, nRate = 0.01, tRange = {nFloor = 25000, nCeil = 30000}, name ="通天彻地",rank = "极低",},
		 },

		 
    ------------------------------------以上数值类的配置信息均可由公用函数获取-------------------------------------------
	
	ArrtConfig ={
		Shunxu1 = {"dwAttack";"dwDefense";"dwHPMax";"dwFlee";"dwCrit";"dwPoJiaDiKang";}; --等级属性
		Shunxu2 = {"dwAttack";"dwDefense";"dwHPMax";"dwFlee";"dwCrit";"dwPoJiaDiKang";}; --套装属性
		Shunxu3 = {"dwAttack";"dwDefense";"dwHPMax";"dwFlee";"dwCrit";"dwPoJiaDiKang";}; --
		Shuxing =  {
				dwAttack 	= "攻击 +%s";
				dwDefense 	= "防御 +%s";
				dwMPMax     = "内力 +%s";
				dwHPMax     = "生命 +%s";
				dwFlee 		= "身法 +%s";
				dwCrit 		= "暴击 +%s";
				dwCritDown  = "暴击抵抗 +%s";
				dwPoJiaValue = "破甲攻击 +%s";
				dwPoJiaDiKang = "伤害抵御 +%s";
					};			
				};
			
	pearlname = {[1] ="炼精",[2] = "化神",[3] = "阳魂", [4] = "阴魄", [5] = "守意", [6]= "玄关", [7] ="绛宫",[8] = "金庭", },
	IsEnough = "<font color='#31cf32'>%s</font>";--材料符合
	IsNoEnough = "<font color='#FF0000'>%s</font>";	--材料不符
	IntorduceText = "消耗“<font color='#31cf32'>灵兽丹</font>”来修炼内丹，修炼满后可以使用“<font color='#31cf32'>圣兽丹</font>”来突破当前境界。战骑境界越高，战骑属性越高。<font color='#31cf32'>每阶第一个内丹自动开启</font>。";--介绍
	
	sLabel1 = "<font color='#FFFF00'>【内丹·%s】";
	sLabel2 = "<font color='#4daeed'>激活后属性提升至";
	sLabel3 = "<font color='#FFFFFF'>开启条件：";
	sLabel4 = "激活内丹·%s";
	sLabel5 = "（已激活）";
	sLabel6 = "<font color='#FF0000'>（未激活）";
	sLabel7 = "<font color='#C56925'>【战骑决加成】<br/></font>"; --查看
	sLabel8 = "%s×%s(拥有：%s)";
	
	BroadString2 = "恭喜%s大侠成功突破至战骑诀%s境界，霸气侧漏！我也试试";
	BroadString1 = "恭喜%s大侠成功突破至战骑诀%s境界，霸气侧漏！";
	BroadString3 = "恭喜%s大侠把战骑诀修炼至圆满，神兽在手，天下我有！";
	Image = "img://gn_ZhanQiJue_jingjie.png";
	sLabel9 = "成功率：%s",
	CiFuTips = "dsjkfdsfgsdjhfjsdfsdfksdfsdghfhdgfsdj";
	sLabel10 = "赐福+";
}


