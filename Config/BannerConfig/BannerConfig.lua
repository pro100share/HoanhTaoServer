--[[
    [\brief 战旗系统配置文件
    [\author 刘昊，王凌波
    [\date 2014-7-15
    [策划可进行配置，客户端服务器公用配置文件
  ]]

_G.BannerConfig = {
    -- 批量使用允许的最大值
    nMaxNum = 99,

    -- 自动升阶的间隔时间(单位：毫秒)
    nInterval = 800,

    -- 开启自动赐福升阶的阶段
    nAutoBlessPhase = 3,

    -- 开始广播的阶段
    nCastBeginPhase = 1,

    -- 插战旗时消耗的物品的id
    nUseBannerID = 4100521,

    -- 插战旗时消耗的物品的数量
    nUseBannerNum = 1,

    -- 开启插战旗功能的阶段
    nFlagMinPhase = 4,

    --[[
        战旗等级列表(key-战旗等级; value-对应的信息值)
        nItemID : 铸造所需物品id
        nAddEXP : 消耗一个物品增加的铸造值
        nEXP    : 要达到该等级所需要的经验值(即该等级起始经验)
        nRate   : 该等级防御能力百分比(1表示1%)
        nTime   : 该等级战旗插旗的持续时间，同时也是该等级战旗CD时间(单位：毫秒)
        nRadius : 该等级战旗作用半径
        tAttr   : 该等级属性加成 {攻击+暴击+生命+破甲值}
        ps：修改tAttr属性加成 tAttr， Attr， AttrName 三个字段必须统一
    ]]
    LevelList = {
        [1] = {nItemID = 4100516, nAddEXP = 400, nEXP = 0, nRate = 1, nTime = 15000, nRadius = 4, tAttr = {dwAttack = 900, dwCrit = 710, dwHPMax = 4500, dwPoJiaValue = 692 },},
        [2] = {nItemID = 4100516, nAddEXP = 400, nEXP = 400, nRate = 1, nTime = 15000, nRadius = 4, tAttr = {dwAttack = 1440, dwCrit = 791, dwHPMax = 7200, dwPoJiaValue = 762 },},
        [3] = {nItemID = 4100516, nAddEXP = 400, nEXP = 1200, nRate = 1, nTime = 15000, nRadius = 4, tAttr = {dwAttack = 1980, dwCrit = 872, dwHPMax = 9900, dwPoJiaValue = 832 },},
        [4] = {nItemID = 4100516, nAddEXP = 400, nEXP = 2850, nRate = 2, nTime = 15000, nRadius = 4, tAttr = {dwAttack = 2520, dwCrit = 953, dwHPMax = 12600, dwPoJiaValue = 902 },},
        [5] = {nItemID = 4100516, nAddEXP = 400, nEXP = 6000, nRate = 2, nTime = 15000, nRadius = 4, tAttr = {dwAttack = 3060, dwCrit = 1034, dwHPMax = 15300, dwPoJiaValue = 972 },},
        [6] = {nItemID = 4100516, nAddEXP = 400, nEXP = 11500, nRate = 3, nTime = 30000, nRadius = 4.5, tAttr = {dwAttack = 3960, dwCrit = 1169, dwHPMax = 19800, dwPoJiaValue = 1089 },},
        [7] = {nItemID = 4100516, nAddEXP = 400, nEXP = 19500, nRate = 4, nTime = 30000, nRadius = 4.5, tAttr = {dwAttack = 4860, dwCrit = 1304, dwHPMax = 24300, dwPoJiaValue = 1206 },},
        [8] = {nItemID = 4100516, nAddEXP = 400, nEXP = 31050, nRate = 4, nTime = 30000, nRadius = 4.5, tAttr = {dwAttack = 5760, dwCrit = 1439, dwHPMax = 28800, dwPoJiaValue = 1323 },},
        [9] = {nItemID = 4100516, nAddEXP = 400, nEXP = 47400, nRate = 4, nTime = 30000, nRadius = 4.5, tAttr = {dwAttack = 6660, dwCrit = 1574, dwHPMax = 33300, dwPoJiaValue = 1440 },},
        [10] = {nItemID = 4100516, nAddEXP = 400, nEXP = 70000, nRate = 5, nTime = 30000, nRadius = 4.5, tAttr = {dwAttack = 7560, dwCrit = 1709, dwHPMax = 37800, dwPoJiaValue = 1557 },},
        [11] = {nItemID = 4100516, nAddEXP = 400, nEXP = 100500, nRate = 6, nTime = 45000, nRadius = 5, tAttr = {dwAttack = 8910, dwCrit = 1911, dwHPMax = 44550, dwPoJiaValue = 1733 },},
        [12] = {nItemID = 4100516, nAddEXP = 400, nEXP = 139050, nRate = 6, nTime = 45000, nRadius = 5, tAttr = {dwAttack = 10260, dwCrit = 2114, dwHPMax = 51300, dwPoJiaValue = 1908 },},
        [13] = {nItemID = 4100516, nAddEXP = 400, nEXP = 187500, nRate = 6, nTime = 45000, nRadius = 5, tAttr = {dwAttack = 11610, dwCrit = 2316, dwHPMax = 58050, dwPoJiaValue = 2084 },},
        [14] = {nItemID = 4100516, nAddEXP = 400, nEXP = 247900, nRate = 7, nTime = 45000, nRadius = 5, tAttr = {dwAttack = 12960, dwCrit = 2519, dwHPMax = 64800, dwPoJiaValue = 2259 },},
        [15] = {nItemID = 4100516, nAddEXP = 400, nEXP = 322500, nRate = 7, nTime = 45000, nRadius = 5, tAttr = {dwAttack = 14310, dwCrit = 2721, dwHPMax = 71550, dwPoJiaValue = 2435 },},
        [16] = {nItemID = 4100516, nAddEXP = 400, nEXP = 413750, nRate = 8, nTime = 60000, nRadius = 5.5, tAttr = {dwAttack = 16245, dwCrit = 3011, dwHPMax = 81225, dwPoJiaValue = 2686 },},
        [17] = {nItemID = 4100516, nAddEXP = 400, nEXP = 521800, nRate = 9, nTime = 60000, nRadius = 5.5, tAttr = {dwAttack = 18180, dwCrit = 3302, dwHPMax = 90900, dwPoJiaValue = 2938 },},
        [18] = {nItemID = 4100516, nAddEXP = 400, nEXP = 649300, nRate = 9, nTime = 60000, nRadius = 5.5, tAttr = {dwAttack = 20115, dwCrit = 3592, dwHPMax = 100575, dwPoJiaValue = 3189 },},
        [19] = {nItemID = 4100516, nAddEXP = 400, nEXP = 799100, nRate = 9, nTime = 60000, nRadius = 5.5, tAttr = {dwAttack = 22050, dwCrit = 3882, dwHPMax = 110250, dwPoJiaValue = 3441 },},
        [20] = {nItemID = 4100516, nAddEXP = 400, nEXP = 974250, nRate = 10, nTime = 60000, nRadius = 5.5, tAttr = {dwAttack = 23985, dwCrit = 4172, dwHPMax = 119925, dwPoJiaValue = 3693 },},
        [21] = {nItemID = 4100516, nAddEXP = 400, nEXP = 1178000, nRate = 11, nTime = 75000, nRadius = 6, tAttr = {dwAttack = 26685, dwCrit = 4577, dwHPMax = 133425, dwPoJiaValue = 4044 },},
        [22] = {nItemID = 4100516, nAddEXP = 400, nEXP = 1410500, nRate = 11, nTime = 75000, nRadius = 6, tAttr = {dwAttack = 29385, dwCrit = 4982, dwHPMax = 146925, dwPoJiaValue = 4395 },},
        [23] = {nItemID = 4100516, nAddEXP = 400, nEXP = 1675200, nRate = 11, nTime = 75000, nRadius = 6, tAttr = {dwAttack = 32085, dwCrit = 5387, dwHPMax = 160425, dwPoJiaValue = 4746 },},
        [24] = {nItemID = 4100516, nAddEXP = 400, nEXP = 1975750, nRate = 12, nTime = 75000, nRadius = 6, tAttr = {dwAttack = 34785, dwCrit = 5792, dwHPMax = 173925, dwPoJiaValue = 5097 },},
        [25] = {nItemID = 4100516, nAddEXP = 400, nEXP = 2316000, nRate = 12, nTime = 75000, nRadius = 6, tAttr = {dwAttack = 37485, dwCrit = 6197, dwHPMax = 187425, dwPoJiaValue = 5448 },},
        [26] = {nItemID = 4100516, nAddEXP = 400, nEXP = 2700000, nRate = 13, nTime = 90000, nRadius = 6.5, tAttr = {dwAttack = 41085, dwCrit = 6737, dwHPMax = 205425, dwPoJiaValue = 5916 },},
        [27] = {nItemID = 4100516, nAddEXP = 400, nEXP = 3127900, nRate = 14, nTime = 90000, nRadius = 6.5, tAttr = {dwAttack = 44685, dwCrit = 7277, dwHPMax = 223425, dwPoJiaValue = 6384 },},
        [28] = {nItemID = 4100516, nAddEXP = 400, nEXP = 3603950, nRate = 14, nTime = 90000, nRadius = 6.5, tAttr = {dwAttack = 48285, dwCrit = 7817, dwHPMax = 241425, dwPoJiaValue = 6852 },},
        [29] = {nItemID = 4100516, nAddEXP = 400, nEXP = 4132600, nRate = 14, nTime = 90000, nRadius = 6.5, tAttr = {dwAttack = 51885, dwCrit = 8357, dwHPMax = 259425, dwPoJiaValue = 7320 },},
        [30] = {nItemID = 4100516, nAddEXP = 400, nEXP = 4718500, nRate = 15, nTime = 90000, nRadius = 6.5, tAttr = {dwAttack = 55485, dwCrit = 8897, dwHPMax = 277425, dwPoJiaValue = 7788 },},
        [31] = {nItemID = 4100516, nAddEXP = 400, nEXP = 5366500, nRate = 16, nTime = 105000, nRadius = 7, tAttr = {dwAttack = 60120, dwCrit = 9593, dwHPMax = 300600, dwPoJiaValue = 8390 },},
        [32] = {nItemID = 4100516, nAddEXP = 400, nEXP = 6076750, nRate = 16, nTime = 105000, nRadius = 7, tAttr = {dwAttack = 64755, dwCrit = 10288, dwHPMax = 323775, dwPoJiaValue = 8993 },},
        [33] = {nItemID = 4100516, nAddEXP = 400, nEXP = 6854300, nRate = 16, nTime = 105000, nRadius = 7, tAttr = {dwAttack = 69390, dwCrit = 10983, dwHPMax = 346950, dwPoJiaValue = 9595 },},
        [34] = {nItemID = 4100516, nAddEXP = 400, nEXP = 7704400, nRate = 17, nTime = 105000, nRadius = 7, tAttr = {dwAttack = 74025, dwCrit = 11678, dwHPMax = 370125, dwPoJiaValue = 10198 },},
        [35] = {nItemID = 4100516, nAddEXP = 400, nEXP = 8632500, nRate = 17, nTime = 105000, nRadius = 7, tAttr = {dwAttack = 78660, dwCrit = 12374, dwHPMax = 393300, dwPoJiaValue = 10800 },},
        [36] = {nItemID = 4100516, nAddEXP = 400, nEXP = 9644250, nRate = 18, nTime = 120000, nRadius = 8, tAttr = {dwAttack = 84465, dwCrit = 13244, dwHPMax = 422325, dwPoJiaValue = 11555 },},
        [37] = {nItemID = 4100516, nAddEXP = 400, nEXP = 10739800, nRate = 19, nTime = 120000, nRadius = 8, tAttr = {dwAttack = 90270, dwCrit = 14115, dwHPMax = 451350, dwPoJiaValue = 12310 },},
        [38] = {nItemID = 4100516, nAddEXP = 400, nEXP = 11925000, nRate = 19, nTime = 120000, nRadius = 8, tAttr = {dwAttack = 96075, dwCrit = 14986, dwHPMax = 480375, dwPoJiaValue = 13064 },},
        [39] = {nItemID = 4100516, nAddEXP = 400, nEXP = 13205900, nRate = 19, nTime = 120000, nRadius = 8, tAttr = {dwAttack = 101880, dwCrit = 15857, dwHPMax = 509400, dwPoJiaValue = 13819 },},
        [40] = {nItemID = 4100516, nAddEXP = 400, nEXP = 14588750, nRate = 20, nTime = 120000, nRadius = 8, tAttr = {dwAttack = 107685, dwCrit = 16727, dwHPMax = 538425, dwPoJiaValue = 14574 },},
    },

    --[[
        阶段列表(key-现在所处的阶段; value-信息值)
        nItemID     : 赐福所需物品id
        nItemNum    : 每次赐福所需物品数量
        nMoney      : 每次赐福所需银两数量
        nRate       : 进入tRange后的赐福成功几率
        tRange      : 赐福值的范围，此范围之前成功率为0，之中成功率为nRate，之后成功率为100%
        ]]
    PhaseList = {
        [1] = {nItemID = 2500190, nItemNum = 1, nMoney = 10000, nRate = 0.5, tRange = {nFloor = 10, nCeil = 20},},
        [2] = {nItemID = 2500190, nItemNum = 2, nMoney = 20000, nRate = 0.25, tRange = {nFloor = 25, nCeil = 75},},
        [3] = {nItemID = 2500190, nItemNum = 3, nMoney = 40000, nRate = 0.25, tRange = {nFloor = 155, nCeil = 335},},
        [4] = {nItemID = 4100517, nItemNum = 4, nMoney = 60000, nRate = 0.2, tRange = {nFloor = 650, nCeil = 1200},},
        [5] = {nItemID = 4100517, nItemNum = 6, nMoney = 100000, nRate = 0.15, tRange = {nFloor = 1800, nCeil = 3500},},
        [6] = {nItemID = 4100517, nItemNum = 8, nMoney = 150000, nRate = 0.1, tRange = {nFloor = 4500, nCeil = 6800},},
        [7] = {nItemID = 4100517, nItemNum = 10, nMoney = 200000, nRate = 0.05, tRange = {nFloor = 7200, nCeil = 10500},},
        -- 注：最后一阶其实不需要赐福
        [8] = {nItemID = 4100517, nItemNum = 12, nMoney = 220000, nRate = 0.06, tRange = {nFloor = 16000, nCeil = 20000},},
    },

    --[[
        战旗Buff列表(key-战旗等级; value-各个Buff在该等级)
    ]]
    BuffEffect = {
        [1] = {dwAddEXP = 0, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [2] = {dwAddEXP = 0, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [3] = {dwAddEXP = 0, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [4] = {dwAddEXP = 0, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [5] = {dwAddEXP = 0, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [6] = {dwAddEXP = 0, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [7] = {dwAddEXP = 0, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [8] = {dwAddEXP = 0, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [9] = {dwAddEXP = 0, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [10] = {dwAddEXP = 0, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [11] = {dwAddEXP = 0, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [12] = {dwAddEXP = 0, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [13] = {dwAddEXP = 0, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [14] = {dwAddEXP = 0, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [15] = {dwAddEXP = 0, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [16] = {dwAddEXP = 130, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [17] = {dwAddEXP = 130, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [18] = {dwAddEXP = 130, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [19] = {dwAddEXP = 130, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [20] = {dwAddEXP = 150, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [21] = {dwAddEXP = 170, dwDefense = 7.1, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [22] = {dwAddEXP = 170, dwDefense = 7.2, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [23] = {dwAddEXP = 170, dwDefense = 7.3, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [24] = {dwAddEXP = 170, dwDefense = 7.4, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [25] = {dwAddEXP = 200, dwDefense = 7.5, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 },
        [26] = {dwAddEXP = 200, dwDefense = 8.6, dwCrit = 11.2, dwPoJiaDiKang = 0, dwAttack = 0 },
        [27] = {dwAddEXP = 200, dwDefense = 8.7, dwCrit = 11.4, dwPoJiaDiKang = 0, dwAttack = 0 },
        [28] = {dwAddEXP = 200, dwDefense = 8.8, dwCrit = 11.6, dwPoJiaDiKang = 0, dwAttack = 0 },
        [29] = {dwAddEXP = 200, dwDefense = 8.9, dwCrit = 11.8, dwPoJiaDiKang = 0, dwAttack = 0 },
        [30] = {dwAddEXP = 220, dwDefense = 9, dwCrit = 12, dwPoJiaDiKang = 0, dwAttack = 0 },
        [31] = {dwAddEXP = 240, dwDefense = 10.1, dwCrit = 13.2, dwPoJiaDiKang = 10.1, dwAttack = 0 },
        [32] = {dwAddEXP = 240, dwDefense = 10.2, dwCrit = 13.4, dwPoJiaDiKang = 10.2, dwAttack = 0 },
        [33] = {dwAddEXP = 240, dwDefense = 10.3, dwCrit = 13.6, dwPoJiaDiKang = 10.3, dwAttack = 0 },
        [34] = {dwAddEXP = 240, dwDefense = 10.4, dwCrit = 13.8, dwPoJiaDiKang = 10.4, dwAttack = 0 },
        [35] = {dwAddEXP = 260, dwDefense = 10.5, dwCrit = 14, dwPoJiaDiKang = 10.5, dwAttack = 0 },
        [36] = {dwAddEXP = 280, dwDefense = 11.6, dwCrit = 15.2, dwPoJiaDiKang = 11.6, dwAttack = 11.6 },
        [37] = {dwAddEXP = 280, dwDefense = 11.7, dwCrit = 15.4, dwPoJiaDiKang = 11.7, dwAttack = 11.7 },
        [38] = {dwAddEXP = 280, dwDefense = 11.8, dwCrit = 15.6, dwPoJiaDiKang = 11.8, dwAttack = 11.8 },
        [39] = {dwAddEXP = 280, dwDefense = 11.9, dwCrit = 15.8, dwPoJiaDiKang = 11.9, dwAttack = 11.9 },
        [40] = {dwAddEXP = 300, dwDefense = 12, dwCrit = 16, dwPoJiaDiKang = 12, dwAttack = 12 },
    },

    ------------------------------------以上数值类的配置信息均可由公用函数获取-------------------------------------------
    
    --阶数
    classInfo ={
        --[[
            [阶数] = {
                skillType  = 技能类型
                UpGaiLv    = 天官赐福上显示的概率
                Descrition = 技能介绍描述 4100501
            }
        ]]
    
		[1] = {
			Name = "一阶·长风战旗";
			skillType  = "";
			UpGaiLv    = "极高";
			Descrition = "战阵上常见的普通旌旗，一般由行伍小卒扛旗，可用于鼓舞士气，不过效用平平。";
		};
		[2] = {
			Name = "二阶·云展战旗";
			skillType  = "";
			UpGaiLv    = "高";
			Descrition = "由绣工精制的战旗，颇具气势，可用于鼓舞士气，激发参战者血性，使之更加勇武。";
		};
		[3] = {
			Name = "三阶·山啸战旗";
			skillType  = "";
			UpGaiLv    = "一般";
			Descrition = "此旗亦为绣工精制，比之云展战旗，威势更胜，凡见此旗者，莫不奋勇而起，战到最后。";
		};
		[4] = {
			Name = "四阶·沸川战旗";
			skillType  = "";	
			UpGaiLv    = "低";
			Descrition = "帆布旗面，生铁铸杆，迎风招展时，如沸水翻涌，猎猎有声。";
		};
		[5] = {
			Name = "五阶·狂澜战旗";
			skillType  = "";
			UpGaiLv    = "极低";
			Descrition = "此旗为精铁铸造旗杆，重而坚实，旗面宽大，乃密织精布所制，柔韧非常。乘风而展，观之有磅礴之势，澎湃不可当。";
		};
		[6] = {
			Name = "六阶·吞海战旗";
			skillType  = "";
			UpGaiLv    = "极低";
			Descrition = "此旗旗面乃特殊布料所制，火烧不燃，水泼不入，危急时堪作临时护甲，十分宝贵，在军中只有将领级别的人物方可拥有。";
		};	
		[7] = {
			Name = "七阶·挥日战旗";
			skillType  = "";
			UpGaiLv    = "极低";
			Descrition = "传闻此旗乃前朝武林第一世家所遗，不知其质，当旗展时，如烈日当空，灿然不可直视。";
		};
		[8] = {
			Name = "八阶·斗霆战旗";
			skillType  = "";
			UpGaiLv    = "极低";
			Descrition = "当风时如雷霆震怒，势不可收，令敌人闻之丧胆。旗杆杆头锋锐，行动时可以之击敌，快如闪电，堪为帅旗。";
		};
	};
    --[[
        技能信息
        [编号] = {
                    skillId  = 技能ID
                    img      = 技能激活的图片
                    grayImg  = 技能未激活的图片
                    des      = 技能描述
                    name     = 技能名称
                    enableMethod = 技能激活条件
        }
    ]]
    SkillShowInfo = {
        [1] = {
            skillId = 120000,
            buffType ="dwAddEXP";
            img = "Icon_ZhanQi_addexp_1.png", 
            grayImg = "Icon_ZhanQi_addexp_0.png" ,
            des = "<font color='#FFFF00'>安插战旗可在其作用范围内获得<font color='#00FF00'>经验加成%d%%, 持续%d秒</font>，战旗等级提升buff效果和持续时间</font>",
            name = "<font color='#03B3FD'>战旗·鼓舞</font>", 
            enableMethod = "<font size='12' color='#f15d27'>激活条件：沸川战旗</font>",
            skillType = "<font color='#ffc721'>【被动技能】</font>";
        },
        [2] = {
            skillId = 120001,
            buffType ="dwDefense";
            img = "Icon_ZhanQi_defense_1.png",
            grayImg = "Icon_ZhanQi_defense_0.png" ,
            des = "<font color='#FFFF00'>安插战旗可在其作用范围内获得<font color='#00FF00'>防御提升%d%%, 持续%d秒</font>，战旗等级提升buff效果和持续时间</font>", 
            name = "<font color='#03B3FD'>战旗·金刚</font>", 
            enableMethod = "<font size='12' color='#f15d27'>激活条件：狂澜战旗</font>",
            skillType = "<font color='#ffc721'>【被动技能】</font>",
        },
        [3] = {
            skillId = 120002, 
            buffType ="dwCrit";
            img = "Icon_ZhanQi_baoji_1.png", 
            grayImg = "Icon_ZhanQi_baoji_0.png" ,
            des = "<font color='#FFFF00'>安插战旗可在其作用范围内获得<font color='#00FF00'>暴击提升%d%%, 持续%d秒</font>，战旗等级提升buff效果和持续时间</font>",
            name = "<font color='#B032EE'>战旗·陷阵</font>", 
            enableMethod = "<font size='12' color='#f15d27'>激活条件：吞海战旗</font>",
            skillType = "<font color='#ffc721'>【被动技能】</font>",
        },
        [4] = {
            skillId = 120003, 
            buffType ="dwPoJiaDiKang";
            img = "Icon_ZhanQi_pojiadikang_1.png", 
            grayImg = "Icon_ZhanQi_pojiadikang_0.png" ,
            des = "<font color='#FFFF00'>安插战旗可在其作用范围内获得<font color='#00FF00'>破甲抵抗提升%d%%, 持续%d秒</font>，战旗等级提升buff效果和持续时间</font>",
            name = "<font color='#B032EE'>战旗·玄襄</font>", 
            enableMethod = "<font size='12' color='#f15d27'>激活条件：挥日战旗</font>",
            skillType = "<font color='#ffc721'>【被动技能】</font>",
        },
        [5] = {
            skillId = 120004,
            buffType ="dwAttack";
            img = "Icon_ZhanQi_gongji_1.png",
            grayImg = "Icon_ZhanQi_gongji_0.png" ,
            des = "<font color='#FFFF00'>安插战旗可在其作用范围内获得<font color='#00FF00'>攻击提升%d%%, 持续%d秒</font>，战旗等级提升buff效果和持续时间</font>",
            name = "<font color='#FFFF00'>战旗·垂天</font>", 
            enableMethod = "<font size='12' color='#f15d27'>激活条件：斗霆战旗</font>",
            skillType = "<font color='#ffc721'>【被动技能】</font>",
        },

    };

    --[[
        [阶数] = {
                [显示顺序] = 技能编号
        }
    ]]
    SkillOpenInfo = {
                [1] = 0;
                [2] = 0;
                [3] = 0;
                [4] = 1;
                [5] = 2;
                [6] = 3;
                [7] = 4;
                [8] = 5;
    };

    --[[
        属性顺序显示
        [属性的位置序号] = 属性名称；
    ]]
    Attr = {
        [1] = "dwHPMax";
        [2] = "dwAttack";
        [3] = "dwCrit";
        [4] = "dwPoJiaValue";
    };

    --界面属性格式化字符串
    --[属性名称] = 格式化字符串
    AttrName = {
        dwHPMax      = "<font color='#FFFF00'>生命</font> + %d ";
        dwAttack     = "<font color='#FFFF00'>攻击</font> + %d ";
        dwCrit       = "<font color='#FFFF00'>暴击</font> + %d ";
        dwPoJiaValue = "<font color='#FFFF00'>破甲攻击</font> + %d";
    };

    --[[
        模型配置
        [阶数] = {model = 模型；action = 动作}；
    ]]
    --模型配置
    ModelInfo = {
        AvatarRect  = {x = 800, y = 800};
        --阶数
        [1] = {
            model = {   
                sknFile = "A_Equip_ZhanQi_JieMian_01.skn"; sklFile="A_Equip_ZhanQi_JieMian_01.skl"; sanFile ="A_Equip_ZhanQi_JieMian_01_XiuXian.san|zhanqi_04_01.tag";
                param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_ZhanQi_JieMian_01_DaiJi.san"; 
            };
            action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
        };
        [2] = {
            model = {
                sknFile = "A_Equip_ZhanQi_JieMian_02.skn"; sklFile="A_Equip_ZhanQi_JieMian_02.skl"; sanFile ="A_Equip_ZhanQi_JieMian_02_XiuXian.san|zhanqi_04_02.tag";
                param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0;lieAction = "A_Equip_ZhanQi_JieMian_02_DaiJi.san";
            };
            action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}}, 
        };
        [3] = {
            model = {
                sknFile = "A_Equip_ZhanQi_JieMian_03.skn"; sklFile="A_Equip_ZhanQi_JieMian_03.skl"; sanFile ="A_Equip_ZhanQi_JieMian_03_XiuXian.san|zhanqi_04_03.tag"; 
                param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_ZhanQi_JieMian_03_DaiJi.san";
            };
            action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
        };
        [4] = {
            model = {
                sknFile = "A_Equip_ZhanQi_JieMian_04.skn"; sklFile="A_Equip_ZhanQi_JieMian_04.skl"; sanFile ="A_Equip_ZhanQi_JieMian_04_XiuXian.san|zhanqi_04_04.tag";
                param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_ZhanQi_JieMian_04_DaiJi.san";
            },
            action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
        };
        [5] = {
            model = {
                sknFile = "A_Equip_ZhanQi_JieMian_05.skn"; sklFile="A_Equip_ZhanQi_JieMian_05.skl"; sanFile ="A_Equip_ZhanQi_JieMian_05_XiuXian.san|zhanqi_04_05.tag"; 
                param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_ZhanQi_JieMian_05_DaiJi.san";
            },
            action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
        };
        [6] = {
            model = {
                sknFile = "A_Equip_ZhanQi_JieMian_06.skn"; sklFile="A_Equip_ZhanQi_JieMian_06.skl"; sanFile ="A_Equip_ZhanQi_JieMian_06_XiuXian.san|zhanqi_04_06.tag"; 
                param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_ZhanQi_JieMian_06_DaiJi.san";
            },
            action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
        };
        [7] = {
            model = {
                sknFile = "A_Equip_ZhanQi_JieMian_07.skn"; sklFile="A_Equip_ZhanQi_JieMian_07.skl"; sanFile ="A_Equip_ZhanQi_JieMian_07_XiuXian.san|zhanqi_04_07.tag"; 
                param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_ZhanQi_JieMian_07_DaiJi.san";
            },
            action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
        };
        [8] = {
            model = {
                sknFile = "A_Equip_ZhanQi_JieMian_08.skn"; sklFile="A_Equip_ZhanQi_JieMian_08.skl"; sanFile ="A_Equip_ZhanQi_JieMian_08_XiuXian.san|zhanqi_04_08.tag"; 
                param_1_x = 0; param_1_y = -2; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_ZhanQi_JieMian_08_DaiJi.san";
            },
            action = {{pfxId = 0,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
        };
    };
    --文字说明
    Text = {
        --战旗系统开放后多久显示战旗使用界面
        OpenTime = 10000;
        -- 开始按钮位置
        btn_x = 203;
        btn_y = 124;
        --防御能力
        Harm = "<font color='#4daeed'>%d(%d%%的人物防御力)</font>";
        --作用范围
        Limits = "<font color='#4daeed'>%d米</font>";
        --铸造按钮
        QuickGet = "铸造";
        --突破瓶颈
        TuPo = "突破瓶颈";
        StopUp = "停止升阶";
        AutoUp = "自动升阶";
        ItemUse1 = " <U>%sX%d</U>";
        ItemUse2 = "<U><font color='#FF0000'>%sX%d</font></U>";

        ItemUseS1 = "%s %d/%d";
        ItemUseS2 = "<font color='#FF0000'>%s %d/%d</font>";

        MoneyShow1 = "%s";
        MoneyShow2 = "<font color='#FF0000'>%s</font>";
        --物品说明
        ItemDes = "使用%s可快速获取战旗铸造值（每一个可提升%d铸造值）";
        --增加属性
        AddAttr = "+ %d";
        CountLess2 = "道具数量不足，无法铸造";
        GetWay =  "<font color='#DCB857'>获得途径：</font><br/>" .. 
        "<font color='#D9CCBD'>1.击杀BOSS有几率掉落 " .. 
        "<U><a href = 'asfunction:hrefevent,1'><font color='#0dab01'>查看BOSS</font></a></U><br/>" ..
        "2.通关副本有几率获得 ".."<U><a href = 'asfunction:hrefevent,2'>" .. 
        "<font color='#0dab01'>立即前往</font></a></U><br/>";
        Error1      = "升阶所需的银两不足";
        Error2      = "升阶所需的物品不足";
        Error3      = "购买物品的元宝不足";
        Error4      = "购买物品的礼金不足";
        UpFailure   = "大侠本次升阶尚未成功，请再接再厉！";
        IsHaveTips  = "<font color='#ffffff'>当前战旗阶段：</font><font color='#4daeed'>%s阶</font><br/><font color='#ffffff'>当前战旗等级：</font><font color='#4daeed'>%s级</font><br/><font color='#FFFF00'>【点击战旗按钮打开战旗界面】</font>";  --BTNTips已开启
        IsNoHave    = "82级开启战旗功能";  --BTNTips暂未开启战旗功能
        broadcast   = "恭喜大侠%s战旗铸造阶段已达%s";
        NoAuthText  = "对方暂未开启战旗，无法查看";  
        Tips        = "点击可选择战旗样式";
        Consumption = "战旗消耗未选中";
        ItemID1     = "所需物品不足";
        Cooling     = "冷却时间没结束";
        Activate    = "战旗激活条件：沸川战旗";
        EnterRange = "您已进入战旗作用范围，获得战旗buff";
        OutRange = "战旗buff已失效，请回到作用范围或重新插旗";
        CountLess = "您没有使用战旗的道具，无法使用战旗";
    };
};

_G.ZhanQiYuanBao = true;   ---true:只使用元宝， false:使用元宝，礼金

--[[
   [ \brief 获取技能中第一个不为零的值
   ]]
function BannerConfig:GetSkillValue()
    local tSkillValue = {dwAddEXP = 0, dwDefense = 0, dwCrit = 0, dwPoJiaDiKang = 0, dwAttack = 0 };
    for K, v in ipairs(BannerConfig.BuffEffect) do
        if tSkillValue.dwAddEXP == 0 then
            tSkillValue.dwAddEXP = v.dwAddEXP;
        elseif tSkillValue.dwDefense == 0 then
            tSkillValue.dwDefense = v.dwDefense;
        elseif tSkillValue.dwCrit == 0 then
            tSkillValue.dwCrit = v.dwCrit;  
        elseif tSkillValue.dwPoJiaDiKang == 0 then 
            tSkillValue.dwPoJiaDiKang = v.dwPoJiaDiKang;
        elseif tSkillValue.dwAttack == 0 then
            tSkillValue.dwAttack = v.dwAttack;
        end
    end
    return tSkillValue;
end

--[[
   [ \brief 测试value是否在表tab中
   [ \param table tTab 搜索的表
   [ \param table nValue 测试的值
   [ \return true 表示值在表中，false 表示值不在表中 
   ]]
function BannerConfig:TableFind(tTab, nValue)
    for k,v in pairs(tTab) do
        if v == nValue then
            return true;
        end
    end
    return false;
end
