--[[
	[\brief 古董系统配置文件
	[\author 李中昌, 裴雪阳
	[\date 2014-7-14
	[策划可进行配置，客户端服务器公用配置文件
  ]]
  
_G.CurioConfig = {
    tCurioList = {
		-- 古董的索引
		[1] = {
			-- 古董名称
			sName = "<font color='#FFFF00'>青花折枝花果纹六方瓶</font>",
			dwLevel = 81;
			dwLockPic = 11;
			szComTips = "六方瓶已全部收集完成<br>已获得相应属性加成";
			-- szPic = "img://collect_8100931_0.png";
			-- 古董碎片 nId = 道具id, nCount = 总数量,  nLevelNum每级的数量, tAttrIndex = 属性索引
			szDes = "<font color='#6BDD65'>青花折枝花果纹六方瓶</font><br><font color='#DCDCDC'>此类道具由古玩志初级礼包开出，通天塔BOSS有几率掉落。</font>";
			tPart = {
				[1] = {nId = 8300025, nCount = 20, nLevelNum = 4, tAttrIndex = {1,2,3,4,5,},     Pic = "img://collect_liufangbing_1.png",sNametips = "<font color='#FFFF00'>六方瓶碎片-1</font>"},
				[2] = {nId = 8300026, nCount = 20, nLevelNum = 4, tAttrIndex = {6,7,8,9,10},     Pic = "img://collect_liufangbing_2.png",sNametips = "<font color='#FFFF00'>六方瓶碎片-2</font>"},
				[3] = {nId = 8300027, nCount = 20, nLevelNum = 4, tAttrIndex = {11,12,13,14,15,},Pic = "img://collect_liufangbing_3.png",sNametips = "<font color='#FFFF00'>六方瓶碎片-3</font>"},
				[4] = {nId = 8300028, nCount = 20, nLevelNum = 4, tAttrIndex = {16,17,18,19,20,},Pic = "img://collect_liufangbing_4.png",sNametips = "<font color='#FFFF00'>六方瓶碎片-4</font>"},
					},
			-- 激活古董后额外属性的索引
			nExtra = 21,
            bIsBoardcast = true,
				},
		[2] = 	{
			sName = "<font color='#FFFF00'>成化斗彩鸡缸杯</font>",
			dwLevel = 82;
			dwLockPic = 12;
			szComTips = "成化斗彩鸡缸杯已全部收集完成<br>已获得相应属性加成";
			-- szPic = "img://collect_8100931_0.png";
			szDes = "<font color='#6BDD65'>成化斗彩鸡缸杯</font><br><font color='#DCDCDC'>此类道具由古玩志初级礼包开出，通天塔BOSS有几率掉落。</font>";
			tPart = {
				[1] = {nId = 8300029, nCount = 20, nLevelNum = 4, tAttrIndex = {22,23,24,25,26,},Pic = "img://collect_jigangbei_1.png",sNametips = "<font color='#FFFF00'>鸡缸杯碎片-1</font>"},
				[2] = {nId = 8300030, nCount = 20, nLevelNum = 4, tAttrIndex = {27,28,29,30,31},Pic = "img://collect_jigangbei_2.png",sNametips = "<font color='#FFFF00'>鸡缸杯碎片-2</font>"},
				[3] = {nId = 8300031, nCount = 20, nLevelNum = 4, tAttrIndex = {32,33,34,35,36,},Pic = "img://collect_jigangbei_3.png",sNametips = "<font color='#FFFF00'>鸡缸杯碎片-3</font>"},
				[4] = {nId = 8300032, nCount = 20, nLevelNum = 4, tAttrIndex = {37,38,39,40,41,},Pic = "img://collect_jigangbei_4.png",sNametips = "<font color='#FFFF00'>鸡缸杯碎片-4</font>"},
					},
			nExtra = 42,
            bIsBoardcast = true,
				},
		[3] = 	{
			sName = "<font color='#FFFF00'>杜虎符</font>",
			dwLevel = 83;
			dwLockPic = 13;
			szComTips = "杜虎符已全部收集完成<br>已获得相应属性加成";
			-- szPic = "img://collect_8100934_0.png";
			szDes = "<font color='#6BDD65'>杜虎符</font><br><font color='#DCDCDC'>此类道具由古玩志初级礼包开出，通天塔BOSS有几率掉落。</font>";
			tPart = {
				[1] = {nId = 8300033, nCount = 20, nLevelNum = 4, tAttrIndex = {43,44,45,46,47,},Pic = "img://collect_duhufu_1.png",sNametips = "<font color='#FFFF00'>杜虎符碎片-1</font>"},
				[2] = {nId = 8300034, nCount = 20, nLevelNum = 4, tAttrIndex = {48,49,50,51,52},Pic = "img://collect_duhufu_2.png",sNametips = "<font color='#FFFF00'>杜虎符碎片-2</font>"},
				[3] = {nId = 8300035, nCount = 20, nLevelNum = 4, tAttrIndex = {53,54,55,56,57,},Pic = "img://collect_duhufu_3.png",sNametips = "<font color='#FFFF00'>杜虎符碎片-3</font>"},
				[4] = {nId = 8300036, nCount = 20, nLevelNum = 4, tAttrIndex = {58,59,60,61,62,},Pic = "img://collect_duhufu_4.png",sNametips = "<font color='#FFFF00'>杜虎符碎片-4</font>"},
					},
            nExtra = 63,
            bIsBoardcast = true,
				},
		[4] = 	{
			sName = "<font color='#FFFF00'>东汉击鼓说唱俑</font>",
			dwLevel = 84;
			dwLockPic = 14;
			szComTips = "东汉击鼓说唱俑已全部收集完成<br>已获得相应属性加成";
			-- szPic = "img://collect_8100932_0.png";
			szDes = "<font color='#6BDD65'>东汉击鼓说唱俑</font><br><font color='#DCDCDC'>此类道具由古玩志中级礼包开出，通天塔BOSS有几率掉落。</font>";
			tPart = {
				[1] = {nId = 8300005, nCount = 20, nLevelNum = 4, tAttrIndex = {64,65,66,67,68,},Pic = "img://collect_shuochangyong_1.png",sNametips = "<font color='#FFFF00'>东汉击鼓说唱俑碎片-1</font>"},
				[2] = {nId = 8300006, nCount = 20, nLevelNum = 4, tAttrIndex = {69,70,71,72,73},Pic = "img://collect_shuochangyong_2.png",sNametips = "<font color='#FFFF00'>东汉击鼓说唱俑碎片-2</font>"},
				[3] = {nId = 8300007, nCount = 20, nLevelNum = 4, tAttrIndex = {74,75,76,77,78,},Pic = "img://collect_shuochangyong_3.png",sNametips = "<font color='#FFFF00'>东汉击鼓说唱俑碎片-3</font>"},
				[4] = {nId = 8300008, nCount = 20, nLevelNum = 4, tAttrIndex = {79,80,81,82,83,},Pic = "img://collect_shuochangyong_4.png",sNametips = "<font color='#FFFF00'>东汉击鼓说唱俑碎片-4</font>"},
					},
            nExtra = 84,
            bIsBoardcast = true,
				},
    	[5] = 	{
            sName = "<font color='#FFFF00'>四羊方尊</font>",
            dwLevel = 85;
			dwLockPic = 15;
			szComTips = "四羊方尊已全部收集完成<br>已获得相应属性加成";
            -- szPic = "img://collect_8100933_0.png";
            szDes = "<font color='#6BDD65'>四羊方尊</font><br><font color='#DCDCDC'>此类道具由古玩志中级礼包开出，通天塔BOSS有几率掉落。</font>";
            tPart = {
                [1] = {nId = 8300009, nCount = 20, nLevelNum = 4, tAttrIndex = {85,86,87,88,89,},Pic = "img://collect_siyangfangzun_1.png",sNametips = "<font color='#FFFF00'>四羊方尊碎片-1</font>"},
                [2] = {nId = 8300010, nCount = 20, nLevelNum = 4, tAttrIndex = {90,91,92,93,94},Pic = "img://collect_siyangfangzun_2.png",sNametips = "<font color='#FFFF00'>四羊方尊碎片-2</font>"},
                [3] = {nId = 8300011, nCount = 20, nLevelNum = 4, tAttrIndex ={95,96,97,98,99,},Pic = "img://collect_siyangfangzun_3.png",sNametips = "<font color='#FFFF00'>四羊方尊碎片-3</font>"},
                [4] = {nId = 8300012, nCount = 20, nLevelNum = 4, tAttrIndex = {100,101,102,103,104,},Pic = "img://collect_siyangfangzun_4.png",sNametips = "<font color='#FFFF00'>四羊方尊碎片-4</font>"},
                    },
            nExtra = 105,
            bIsBoardcast = true,
    			},	

    	[6] = 	{
            sName = "<font color='#FFFF00'>后母戊鼎</font>",
            dwLevel = 86;
			dwLockPic = 16;
			szComTips = "后母戊鼎已全部收集完成<br>已获得相应属性加成";
            -- szPic = "img://collect_8100701_0.png";
            szDes = "<font color='#6BDD65'>后母戊鼎</font><br><font color='#DCDCDC'>此类道具由古玩志中级礼包开出，通天塔BOSS有几率掉落。</font>";
            tPart = {
                [1] = {nId = 8300021, nCount = 20, nLevelNum = 4, tAttrIndex = {106,107,108,109,110,},Pic = "img://collect_houmuwuding_1.png",sNametips = "<font color='#FFFF00'>后母戊鼎碎片-1</font>"},
                [2] = {nId = 8300022, nCount = 20, nLevelNum = 4, tAttrIndex = {111,112,113,114,115},Pic = "img://collect_houmuwuding_2.png",sNametips = "<font color='#FFFF00'>后母戊鼎碎片-2</font>"},
                [3] = {nId = 8300023, nCount = 20, nLevelNum = 4, tAttrIndex = {116,117,118,119,120,},Pic = "img://collect_houmuwuding_3.png",sNametips = "<font color='#FFFF00'>后母戊鼎碎片-3</font>"},
                [4] = {nId = 8300024, nCount = 20, nLevelNum = 4, tAttrIndex = {121,122,123,124,125,},Pic = "img://collect_houmuwuding_4.png",sNametips = "<font color='#FFFF00'>后母戊鼎碎片-4</font>"},
                    },
           nExtra = 126,
           bIsBoardcast = true,
            },					
		};
		
	tAttrList = {
				[1]={dwAttack = 100,dwDefense = 50,dwHPMax = 500,dwCrit = 45,},
				[2]={dwAttack = 125,dwDefense = 62,dwHPMax = 625,dwCrit = 48,},
				[3]={dwAttack = 150,dwDefense = 75,dwHPMax = 750,dwCrit = 51,},
				[4]={dwAttack = 175,dwDefense = 87,dwHPMax = 875,dwCrit = 54,},
				[5]={dwAttack = 200,dwDefense = 100,dwHPMax = 1000,dwCrit = 58,},
				[6]={dwAttack = 225,dwDefense = 112,dwHPMax = 1125,dwCrit = 61,},
				[7]={dwAttack = 250,dwDefense = 125,dwHPMax = 1250,dwCrit = 64,},
				[8]={dwAttack = 275,dwDefense = 137,dwHPMax = 1375,dwCrit = 67,},
				[9]={dwAttack = 300,dwDefense = 150,dwHPMax = 1500,dwCrit = 71,},
				[10]={dwAttack = 325,dwDefense = 162,dwHPMax = 1625,dwCrit = 74,},
				[11]={dwAttack = 350,dwDefense = 175,dwHPMax = 1750,dwCrit = 77,},
				[12]={dwAttack = 375,dwDefense = 187,dwHPMax = 1875,dwCrit = 80,},
				[13]={dwAttack = 400,dwDefense = 200,dwHPMax = 2000,dwCrit = 84,},
				[14]={dwAttack = 425,dwDefense = 212,dwHPMax = 2125,dwCrit = 87,},
				[15]={dwAttack = 450,dwDefense = 225,dwHPMax = 2250,dwCrit = 90,},
				[16]={dwAttack = 475,dwDefense = 237,dwHPMax = 2375,dwCrit = 93,},
				[17]={dwAttack = 500,dwDefense = 250,dwHPMax = 2500,dwCrit = 97,},
				[18]={dwAttack = 525,dwDefense = 262,dwHPMax = 2625,dwCrit = 100,},
				[19]={dwAttack = 550,dwDefense = 275,dwHPMax = 2750,dwCrit = 103,},
				[20]={dwAttack = 575,dwDefense = 287,dwHPMax = 2875,dwCrit = 106,},
				[21]={dwAttack = 350,dwDefense = 175,dwHPMax = 1750,dwCrit = 45,dwAppendCrit = 70,dwPoJiaValue = 175,},
				[22]={dwAttack = 615,dwDefense = 307,dwHPMax = 3075,dwCrit = 111,},
				[23]={dwAttack = 655,dwDefense = 327,dwHPMax = 3275,dwCrit = 117,},
				[24]={dwAttack = 695,dwDefense = 347,dwHPMax = 3475,dwCrit = 122,},
				[25]={dwAttack = 735,dwDefense = 367,dwHPMax = 3675,dwCrit = 127,},
				[26]={dwAttack = 775,dwDefense = 387,dwHPMax = 3875,dwCrit = 132,},
				[27]={dwAttack = 815,dwDefense = 407,dwHPMax = 4075,dwCrit = 137,},
				[28]={dwAttack = 855,dwDefense = 427,dwHPMax = 4275,dwCrit = 143,},
				[29]={dwAttack = 895,dwDefense = 447,dwHPMax = 4475,dwCrit = 148,},
				[30]={dwAttack = 935,dwDefense = 467,dwHPMax = 4675,dwCrit = 153,},
				[31]={dwAttack = 975,dwDefense = 487,dwHPMax = 4875,dwCrit = 158,},
				[32]={dwAttack = 1015,dwDefense = 507,dwHPMax = 5075,dwCrit = 163,},
				[33]={dwAttack = 1055,dwDefense = 527,dwHPMax = 5275,dwCrit = 169,},
				[34]={dwAttack = 1095,dwDefense = 547,dwHPMax = 5475,dwCrit = 174,},
				[35]={dwAttack = 1135,dwDefense = 567,dwHPMax = 5675,dwCrit = 179,},
				[36]={dwAttack = 1175,dwDefense = 587,dwHPMax = 5875,dwCrit = 184,},
				[37]={dwAttack = 1215,dwDefense = 607,dwHPMax = 6075,dwCrit = 189,},
				[38]={dwAttack = 1255,dwDefense = 627,dwHPMax = 6275,dwCrit = 195,},
				[39]={dwAttack = 1295,dwDefense = 647,dwHPMax = 6475,dwCrit = 200,},
				[40]={dwAttack = 1335,dwDefense = 667,dwHPMax = 6675,dwCrit = 205,},
				[41]={dwAttack = 1375,dwDefense = 687,dwHPMax = 6875,dwCrit = 210,},
				[42]={dwAttack = 1125,dwDefense = 562,dwHPMax = 5625,dwCrit = 146,dwAppendCrit = 225,dwPoJiaValue = 562,},
				[43]={dwAttack = 1430,dwDefense = 715,dwHPMax = 7150,dwCrit = 217,},
				[44]={dwAttack = 1485,dwDefense = 742,dwHPMax = 7425,dwCrit = 225,},
				[45]={dwAttack = 1540,dwDefense = 770,dwHPMax = 7700,dwCrit = 232,},
				[46]={dwAttack = 1595,dwDefense = 797,dwHPMax = 7975,dwCrit = 239,},
				[47]={dwAttack = 1650,dwDefense = 825,dwHPMax = 8250,dwCrit = 246,},
				[48]={dwAttack = 1705,dwDefense = 852,dwHPMax = 8525,dwCrit = 253,},
				[49]={dwAttack = 1760,dwDefense = 880,dwHPMax = 8800,dwCrit = 260,},
				[50]={dwAttack = 1815,dwDefense = 907,dwHPMax = 9075,dwCrit = 267,},
				[51]={dwAttack = 1870,dwDefense = 935,dwHPMax = 9350,dwCrit = 275,},
				[52]={dwAttack = 1925,dwDefense = 962,dwHPMax = 9625,dwCrit = 282,},
				[53]={dwAttack = 1980,dwDefense = 990,dwHPMax = 9900,dwCrit = 289,},
				[54]={dwAttack = 2035,dwDefense = 1017,dwHPMax = 10175,dwCrit = 296,},
				[55]={dwAttack = 2090,dwDefense = 1045,dwHPMax = 10450,dwCrit = 303,},
				[56]={dwAttack = 2145,dwDefense = 1072,dwHPMax = 10725,dwCrit = 310,},
				[57]={dwAttack = 2200,dwDefense = 1100,dwHPMax = 11000,dwCrit = 318,},
				[58]={dwAttack = 2255,dwDefense = 1127,dwHPMax = 11275,dwCrit = 325,},
				[59]={dwAttack = 2310,dwDefense = 1155,dwHPMax = 11550,dwCrit = 332,},
				[60]={dwAttack = 2365,dwDefense = 1182,dwHPMax = 11825,dwCrit = 339,},
				[61]={dwAttack = 2420,dwDefense = 1210,dwHPMax = 12100,dwCrit = 346,},
				[62]={dwAttack = 2475,dwDefense = 1237,dwHPMax = 12375,dwCrit = 353,},
				[63]={dwAttack = 2200,dwDefense = 1100,dwHPMax = 11000,dwCrit = 286,dwAppendCrit = 440,dwPoJiaValue = 1100,},
				[64]={dwAttack = 2545,dwDefense = 1272,dwHPMax = 12725,dwCrit = 362,},
				[65]={dwAttack = 2615,dwDefense = 1307,dwHPMax = 13075,dwCrit = 371,},
				[66]={dwAttack = 2685,dwDefense = 1342,dwHPMax = 13425,dwCrit = 381,},
				[67]={dwAttack = 2755,dwDefense = 1377,dwHPMax = 13775,dwCrit = 390,},
				[68]={dwAttack = 2825,dwDefense = 1412,dwHPMax = 14125,dwCrit = 399,},
				[69]={dwAttack = 2895,dwDefense = 1447,dwHPMax = 14475,dwCrit = 408,},
				[70]={dwAttack = 2965,dwDefense = 1482,dwHPMax = 14825,dwCrit = 417,},
				[71]={dwAttack = 3035,dwDefense = 1517,dwHPMax = 15175,dwCrit = 426,},
				[72]={dwAttack = 3105,dwDefense = 1552,dwHPMax = 15525,dwCrit = 435,},
				[73]={dwAttack = 3175,dwDefense = 1587,dwHPMax = 15875,dwCrit = 444,},
				[74]={dwAttack = 3245,dwDefense = 1622,dwHPMax = 16225,dwCrit = 453,},
				[75]={dwAttack = 3315,dwDefense = 1657,dwHPMax = 16575,dwCrit = 462,},
				[76]={dwAttack = 3385,dwDefense = 1692,dwHPMax = 16925,dwCrit = 472,},
				[77]={dwAttack = 3455,dwDefense = 1727,dwHPMax = 17275,dwCrit = 481,},
				[78]={dwAttack = 3525,dwDefense = 1762,dwHPMax = 17625,dwCrit = 490,},
				[79]={dwAttack = 3595,dwDefense = 1797,dwHPMax = 17975,dwCrit = 499,},
				[80]={dwAttack = 3665,dwDefense = 1832,dwHPMax = 18325,dwCrit = 508,},
				[81]={dwAttack = 3735,dwDefense = 1867,dwHPMax = 18675,dwCrit = 517,},
				[82]={dwAttack = 3805,dwDefense = 1902,dwHPMax = 19025,dwCrit = 526,},
				[83]={dwAttack = 3875,dwDefense = 1937,dwHPMax = 19375,dwCrit = 535,},
				[84]={dwAttack = 3525,dwDefense = 1762,dwHPMax = 17625,dwCrit = 458,dwAppendCrit = 705,dwPoJiaValue = 1762,},
				[85]={dwAttack = 3960,dwDefense = 1980,dwHPMax = 19800,dwCrit = 546,},
				[86]={dwAttack = 4045,dwDefense = 2022,dwHPMax = 20225,dwCrit = 557,},
				[87]={dwAttack = 4130,dwDefense = 2065,dwHPMax = 20650,dwCrit = 568,},
				[88]={dwAttack = 4215,dwDefense = 2107,dwHPMax = 21075,dwCrit = 579,},
				[89]={dwAttack = 4300,dwDefense = 2150,dwHPMax = 21500,dwCrit = 591,},
				[90]={dwAttack = 4385,dwDefense = 2192,dwHPMax = 21925,dwCrit = 602,},
				[91]={dwAttack = 4470,dwDefense = 2235,dwHPMax = 22350,dwCrit = 613,},
				[92]={dwAttack = 4555,dwDefense = 2277,dwHPMax = 22775,dwCrit = 624,},
				[93]={dwAttack = 4640,dwDefense = 2320,dwHPMax = 23200,dwCrit = 635,},
				[94]={dwAttack = 4725,dwDefense = 2362,dwHPMax = 23625,dwCrit = 646,},
				[95]={dwAttack = 4810,dwDefense = 2405,dwHPMax = 24050,dwCrit = 657,},
				[96]={dwAttack = 4895,dwDefense = 2447,dwHPMax = 24475,dwCrit = 668,},
				[97]={dwAttack = 4980,dwDefense = 2490,dwHPMax = 24900,dwCrit = 679,},
				[98]={dwAttack = 5065,dwDefense = 2532,dwHPMax = 25325,dwCrit = 690,},
				[99]={dwAttack = 5150,dwDefense = 2575,dwHPMax = 25750,dwCrit = 701,},
				[100]={dwAttack = 5235,dwDefense = 2617,dwHPMax = 26175,dwCrit = 712,},
				[101]={dwAttack = 5320,dwDefense = 2660,dwHPMax = 26600,dwCrit = 723,},
				[102]={dwAttack = 5405,dwDefense = 2702,dwHPMax = 27025,dwCrit = 734,},
				[103]={dwAttack = 5490,dwDefense = 2745,dwHPMax = 27450,dwCrit = 745,},
				[104]={dwAttack = 5575,dwDefense = 2787,dwHPMax = 27875,dwCrit = 756,},
				[105]={dwAttack = 5150,dwDefense = 2575,dwHPMax = 25750,dwCrit = 669,dwAppendCrit = 1030,dwPoJiaValue = 2575,},
				[106]={dwAttack = 5675,dwDefense = 2837,dwHPMax = 28375,dwCrit = 769,},
				[107]={dwAttack = 5775,dwDefense = 2887,dwHPMax = 28875,dwCrit = 782,},
				[108]={dwAttack = 5875,dwDefense = 2937,dwHPMax = 29375,dwCrit = 795,},
				[109]={dwAttack = 5975,dwDefense = 2987,dwHPMax = 29875,dwCrit = 808,},
				[110]={dwAttack = 6075,dwDefense = 3037,dwHPMax = 30375,dwCrit = 821,},
				[111]={dwAttack = 6175,dwDefense = 3087,dwHPMax = 30875,dwCrit = 834,},
				[112]={dwAttack = 6275,dwDefense = 3137,dwHPMax = 31375,dwCrit = 847,},
				[113]={dwAttack = 6375,dwDefense = 3187,dwHPMax = 31875,dwCrit = 860,},
				[114]={dwAttack = 6475,dwDefense = 3237,dwHPMax = 32375,dwCrit = 873,},
				[115]={dwAttack = 6575,dwDefense = 3287,dwHPMax = 32875,dwCrit = 886,},
				[116]={dwAttack = 6675,dwDefense = 3337,dwHPMax = 33375,dwCrit = 899,},
				[117]={dwAttack = 6775,dwDefense = 3387,dwHPMax = 33875,dwCrit = 912,},
				[118]={dwAttack = 6875,dwDefense = 3437,dwHPMax = 34375,dwCrit = 925,},
				[119]={dwAttack = 6975,dwDefense = 3487,dwHPMax = 34875,dwCrit = 938,},
				[120]={dwAttack = 7075,dwDefense = 3537,dwHPMax = 35375,dwCrit = 951,},
				[121]={dwAttack = 7175,dwDefense = 3587,dwHPMax = 35875,dwCrit = 964,},
				[122]={dwAttack = 7275,dwDefense = 3637,dwHPMax = 36375,dwCrit = 977,},
				[123]={dwAttack = 7375,dwDefense = 3687,dwHPMax = 36875,dwCrit = 990,},
				[124]={dwAttack = 7475,dwDefense = 3737,dwHPMax = 37375,dwCrit = 1003,},
				[125]={dwAttack = 7575,dwDefense = 3787,dwHPMax = 37875,dwCrit = 1016,},
				[126]={dwAttack = 7075,dwDefense = 3537,dwHPMax = 35375,dwCrit = 919,dwAppendCrit = 1415,dwPoJiaValue = 3537,},	
		};
		
	Shunxu1 = {"dwAttack";"dwDefense";"dwHPMax";"dwCrit";}; --基本属性加成
	Shunxu2 = {"dwAttack";"dwDefense";"dwHPMax";"dwCrit";"dwAppendCrit";"dwPoJiaValue";}; --套装属性
	Shuxing =  {
			dwAttack 	= "攻    击 + %s";
			dwDefense 	= "防    御 + %s";
			dwMPMax     = "内    力 + %s";
			dwHPMax     = "生    命 + %s";
			dwFlee 		= "身    法 + %s";
			dwCrit 		= "暴    击 + %s";
			dwAppendCrit  = "暴击伤害 + %s";
			dwPoJiaValue = "破甲攻击 + %s";
			dwPoJiaDiKang = "伤害抵御 + %s";
			dwCritDown = "暴击抵抗 + %s";
				};	
		--tips
		SnameColor = "%s<br/>";
        Sxing = "<font color='#4daeed'>属性加成：<br/></font>";
		Xia = "<font color='#FFFFFF'>下级:</font>";
		Man = "<font color='#FFFFFF'>满级:</font>";
		Dang = "<font color='#FFFFFF'>当前等级:</font>";
		Jin = "(进度:%s/%s)<br/>";
		IsEnough = "<font color='#31cf32'>%s</font>";--足够
	    IsNoEnough = "<font color='#FF0000'>%s</font>";	--不足
		sLevel = "<font color='#31cf32'>  LV%s  </font>";	
		--文本
		tipBtn = "自动将背包中此类道具全部提交"; --总提交rollover事件
		sText1 = "<font color='##E28E0A'>收集进度:</font>";
		sText2 = "<br/><font color='#4daeed'>收集完成后可获得额外属性加成：<br/></font>";
        sText3 = "<br/><font color='#4daeed'>额外属性加成：<br/></font>";
        sText4 = "（未激活）";
		sText5 = "<br/><font color='#4daeed'>当前属性加成：<br/></font>";
		BroadString1 = "恭喜%s成功收集%s"; -- 广播
		BroadString3 = "恭喜%s成功收集全部古董";
		sSheng = "<br/><font color='#FFFFFF'>升级所需碎片：</font>";
		sBen = "<br/><font color='#4daeed'>本级属性加成：<br/></font>";
		sXia = "<font color='#4daeed'>下级属性加成：<br/></font>";
		nAll = 80; --每个古董碎片的总个数
		nSuiPiano = 4; -- 有几个碎片
		nLevelNum = 4; -- 没级所需的个数
		nCount = 20;
		tipPageLock = "<br/><font color='#ff0000'>需%d级解锁</font>";
  };

-- 得到碎片等级  1-5
-- nCurioIndex 古董分页签
-- nPartIndex 古董碎片id
function CurioConfig:GetCurLevel(nCurioIndex, nPartIndex, tCount)
    return math.floor(tCount[nCurioIndex][nPartIndex] / 
		self.tCurioList[nCurioIndex].tPart[nPartIndex].nLevelNum);
end

--是否激活古董
-- 得到古董是否激活
function CurioConfig:IsActive(nCurioIndex, tCount)
    for k, v in pairs(self.tCurioList[nCurioIndex].tPart) do
        if tCount[nCurioIndex][k] < v.nCount then return false; end
    end
    
    return true;
end
--是否满级
function CurioConfig:IsFulllevel(nCurioIndex, nPartIndex,tCount)
   -- for k, v in pairs(self.tCurioList[nCurioIndex].tPart) do
    if tCount[nCurioIndex][nPartIndex] < self.tCurioList[nCurioIndex].tPart[nPartIndex].nCount then return false end
    return true;
end

--是否达到第一级
function CurioConfig:IsReach(nCurioIndex, nPartIndex,tCount)
    if tCount[nCurioIndex][nPartIndex] < self.tCurioList[nCurioIndex].tPart[nPartIndex].nLevelNum then return false end
    return true;
end
--获取属性
-- 得到碎片的当前属性 
function CurioConfig:GetPartAttr(nCurioIndex, nPartIndex, tCount)
    local nLevel = self:GetCurLevel(nCurioIndex, nPartIndex, tCount);
    return self:GetPartAttrByLevel(nCurioIndex, nPartIndex, nLevel);
end

-- 根据碎片等级得到碎片的属性
function CurioConfig:GetPartAttrByLevel(nCurioIndex, nPartIndex, nLevel)
    local oAttrInfo = SSingleAttrChange:new();
    if nLevel == 0 then return oAttrInfo end
    
    local nAttrIndex = self.tCurioList[nCurioIndex].tPart[nPartIndex]
        .tAttrIndex[nLevel];
 
    for nAttrType, nAttrValue in pairs(self.tAttrList[nAttrIndex]) do
        if oAttrInfo[nAttrType] then
            oAttrInfo[nAttrType] = oAttrInfo[nAttrType] + nAttrValue;
        end
    end
        
    return oAttrInfo;
end

-- 得到古董激活后的属性
function CurioConfig:GetActiveAttr(nCurioIndex)
    local oAttrInfo = SSingleAttrChange:new();
    for nAttrType, nAttrValue in pairs(self.tAttrList[
        self.tCurioList[nCurioIndex].nExtra]) do
        if oAttrInfo[nAttrType] then
            oAttrInfo[nAttrType] = oAttrInfo[nAttrType] + nAttrValue; 
        end
    end
    return oAttrInfo;
end

-- 得到古董的所有属性（每个古董）
function CurioConfig:GetCurioAttr(nCurioIndex,tCount)
    local oAttrInfo = SSingleAttrChange:new();
	
    -- 循环所有碎片    
    for k, v in pairs(self.tCurioList[nCurioIndex].tPart) do
        self:GetPartAttr(nCurioIndex, k, tCount):CountAttrValue(oAttrInfo);
    end
    
    -- 判断是否激活了古董
    if self:IsActive(nCurioIndex, tCount) then
        self:GetActiveAttr(nCurioIndex):CountAttrValue(oAttrInfo);
    end
    return oAttrInfo;
end

-- 得到古董系统所有属性（6个古董所有）
function CurioConfig:GetAllAttr(tCount)
    local oAttrInfo = SSingleAttrChange:new();
    for k, v in pairs(self.tCurioList) do
        self:GetCurioAttr(k, tCount):CountAttrValue(oAttrInfo);
    end
    
    return oAttrInfo;
end

-- 得到碎片当前需要的物品个数 和碎片的索引
function CurioConfig:GetItemNeedNum(nCurioIndex, tCount, nItemId)
    for k, v in pairs(self.tCurioList[nCurioIndex].tPart) do
        if nItemId == v.nId then
            return v.nCount - tCount[nCurioIndex][k], k;
        end
    end
end

--得到当前古董收藏的个数
function CurioConfig:GetGuDongNum(tCount,nCurioIndex)
	local a = 0;
    for k, v in pairs(tCount[nCurioIndex]) do
		a = a + v;
    end
	return a;
end

-- 得到古董的配置收藏个数
function CurioConfig:GetConfigCount(nCurioIndex)
    local nCount = 0;
    for k, v in pairs(self.tCurioList[nCurioIndex].tPart) do 
        nCount = nCount + v.nCount;
    end
    return nCount;
end

--得到当前古董收藏的个数
function CurioConfig:IsCollectSuccess(tCount,nCurioIndex)
	local a = 0;
	local nCount = 0;
    for k, v in pairs(tCount[nCurioIndex]) do
			a = a + v;
    end
    for k, v in pairs(self.tCurioList[nCurioIndex].tPart) do 
        nCount = nCount + v.nCount;
    end
    if a == nCount then
    	return true;
    else
    	return false;
    end		
end

-- 得到是否所有古董全部搜集完成
function CurioConfig:IsFinish(tCount)
    local nCount, nConfigCount = 0, 0;
    for _, v in pairs(tCount) do 
        for _, nNum in pairs(v) do
            nCount = nCount + nNum;
        end
    end
    
    for _, v in pairs(self.tCurioList) do 
        for _, tConfig in pairs(v.tPart) do
            nConfigCount = nConfigCount + tConfig.nCount;
        end
    end
    
    return nCount == nConfigCount;
end 
