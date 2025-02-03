--[[
	[\brief 英雄令系统配置文件
	[\author 刘昊，王凌波
	[\date 2014-7-1
	[策划可进行配置，客户端服务器公用配置文件
  ]]


_G.HeroTokenConfig = {
    --系列，其编号顺序一旦确定后不可改变，需要比当前开放的系列多配置一项（不然角标显示会有问题）
    Series = {
        [1] = {
            -- 系列(印章)名称
            sName   = "圣兽令";
            -- 令牌信息，其编号顺序一旦确定后不可改变
            tTokens = {
                [1] = {
                    -- 令牌Id
                    nId     = 2500358,
                    -- 镶嵌需求数量
                    nCount  = 1;
                    -- 令牌图片( Gray = 灰色图标；Colours = 彩色图标；)
                    Gray    = "img://gn_yxl_qilin_h.png";
                    Colours = "img://gn_yxl_qilin_l.png";
                    -- 令牌名称
                    sName   = "<font color='#FFFF00'>麒麟英雄令</front>",
                    -- 属性表 攻击、防御、生命、暴击、身法。
                    tAttr = {dwAttack = 50000;dwDefense = 10000;dwHPMax = 100000;dwFlee = 10000; dwCrit = 10000;};
                },
                [2] = {
                    nId     = 2500357,
                    nCount  = 1;
                    Gray    = "img://gn_yxl_jinlong_h.png";
                    Colours = "img://gn_yxl_jinlong_l.png";
                    sName   = "<font color='#FFFF00'>金龙英雄令</front>",
                    tAttr = {dwAttack = 30000;dwDefense = 15000;dwHPMax = 150000;dwFlee = 10000; dwCrit = 10000;};
                },
                [3] = {
                    nId     = 2500356,
                    nCount  = 1;
                    Gray    = "img://gn_yxl_xuanwu_h.png";
                    Colours = "img://gn_yxl_xuanwu_l.png";
                    sName   = "<font color='#FFFF00'>玄武英雄令</front>",
                    tAttr = {dwAttack = 20000;dwDefense = 15000;dwHPMax = 150000;dwFlee = 6000; dwCrit = 6000;};
                    ---
                },
                [4] = {
                    nId     = 2500355,
                    nCount  = 1;
                    Gray    = "img://gn_yxl_zhuque_h.png";
                    Colours = "img://gn_yxl_zhuque_l.png";
                    sName   = "<font color='#FFFF00'>朱雀英雄令</front>",
                    tAttr = {dwAttack = 30000;dwDefense = 10000;dwHPMax = 100000;dwFlee = 6000; dwCrit = 6000;};
                    ---
                },
                [5] = {
                    nId     = 2500354,
                    nCount  = 1;
                    Gray    = "img://gn_yxl_baihu_h.png";
                    Colours = "img://gn_yxl_baihu_l.png";
                    sName   = "<font color='#FFFF00'>白虎英雄令</front>",
                    tAttr = {dwAttack = 20000;dwDefense = 10000;dwHPMax = 100000;dwFlee = 10000; dwCrit = 10000;};
                    ---
                },
                [6] = {
                    nId     = 2500353,
                    nCount  = 1;
                    Gray    = "img://gn_yxl_qinglong_h.png";
                    Colours = "img://gn_yxl_qinglong_l.png";
                    sName   = "<font color='#FFFF00'>青龙英雄令</front>",
                    tAttr = {dwAttack = 20000;dwDefense = 10000;dwHPMax = 100000;dwFlee = 6000; dwCrit = 6000;};
                    },
            },
        },

        [2] = {
            -- 系列(印章)名称
            sName   = "元素令";
		    -- 令牌信息
            tTokens = {
                [1] = {
                    -- 令牌Id
                    nId     = 2500361,
                    -- 镶嵌需求数量
                    nCount  = 1;
                    -- 令牌图片( Gray = 灰色图标；Colours = 彩色图标；)
                    Gray    = "img://gn_yxl_roushui_h.png";
                    Colours = "img://gn_yxl_roushui_l.png";
                    -- 令牌名称
                    sName   = "<font color='#FFFF00'>柔水英雄令</front>",
                    -- 属性表 攻击、防御、生命、暴击、身法。
                    tAttr = {dwAttack = 150000;dwDefense = 80000;dwPoJiaValue = 12000;dwPoJiaDiKang = 14500; dwCrit = 3000;dwHPMax = 500000;dwFlee = 5000;dwCritDown = 11000;};
                },
                [2] = {
                    nId     = 2500362,
                    nCount  = 1;
                    Gray    = "img://gn_yxl_liehuo_h.png";
                    Colours = "img://gn_yxl_liehuo_l.png";
                    sName   = "<font color='#FFFF00'>烈火英雄令</front>",
                    tAttr = {dwAttack = 180000;dwDefense = 120000;dwPoJiaValue = 14000;dwPoJiaDiKang = 16500; dwCrit = 4500;dwHPMax = 570000;dwFlee = 6500;dwCritDown = 15000;};
                },
                [3] = {
                    nId     = 2500363,
                    nCount  = 1;
                    Gray    = "img://gn_yxl_leiting_h.png";
                    Colours = "img://gn_yxl_leiting_l.png";
                    sName   = "<font color='#FFFF00'>雷霆英雄令</front>",
                    tAttr = {dwAttack = 220000;dwDefense = 145000;dwPoJiaValue = 16500;dwPoJiaDiKang = 19000; dwCrit = 5200;dwHPMax = 680000;dwFlee = 7200;dwCritDown = 18000;};
                    ---
                },
                [4] = {
                    nId     = 2500364,
                    nCount  = 1;
                    Gray    = "img://gn_yxl_jifeng_h.png";
                    Colours = "img://gn_yxl_jifeng_l.png";
                    sName   = "<font color='#FFFF00'>疾风英雄令</front>",
                    tAttr = {dwAttack = 280000;dwDefense = 165000;dwPoJiaValue = 19500;dwPoJiaDiKang = 21500; dwCrit = 7000;dwHPMax = 800000;dwFlee = 8350;dwCritDown = 20000;};
                    ---
                },
                [5] = {
                    nId     = 2500365,
                    nCount  = 1;
                    Gray    = "img://gn_yxl_guangming_h.png";
                    Colours = "img://gn_yxl_guangming_l.png";
                    sName   = "<font color='#FFFF00'>光明英雄令</front>",
                    tAttr = {dwAttack = 380000;dwDefense = 190000;dwPoJiaValue = 21500;dwPoJiaDiKang = 22500; dwCrit = 8000;dwHPMax = 900000;dwFlee = 10100;dwCritDown = 22500;};
                    ---
                },
                [6] = {
                    nId     = 2500366,
                    nCount  = 1;
                    Gray    = "img://gn_yxl_anhei_h.png";
                    Colours = "img://gn_yxl_anhei_l.png";
                    sName   = "<font color='#FFFF00'>暗黑英雄令</front>",
                    tAttr = {dwAttack = 500000;dwDefense = 215000;dwPoJiaValue = 23000;dwPoJiaDiKang = 24000; dwCrit = 9500;dwHPMax = 1000000;dwFlee = 12000;dwCritDown = 23000;};
                    },
                    ---
            },
        },
       [3] = {
            -- 系列(印章)名称
            sName   = "元素令";
		    -- 令牌信息
            tTokens = {
                [1] = {
                    -- 令牌Id
                    nId     = 2500361,
                    -- 镶嵌需求数量
                    nCount  = 1;
                    -- 令牌图片( Gray = 灰色图标；Colours = 彩色图标；)
                    Gray    = "img://gn_yxl_roushui_h.png";
                    Colours = "img://gn_yxl_roushui_l.png";
                    -- 令牌名称
                    sName   = "<font color='#FFFF00'>柔水英雄令</front>",
                    -- 属性表 攻击、防御、生命、暴击、身法。
                    tAttr = {dwAttack = 150000;dwDefense = 80000;dwPoJiaValue = 12000;dwPoJiaDiKang = 14500; dwCrit = 3000;dwHPMax = 500000;dwFlee = 5000;dwCritDown = 11000;};
                },
                [2] = {
                    nId     = 2500362,
                    nCount  = 1;
                    Gray    = "img://gn_yxl_liehuo_h.png";
                    Colours = "img://gn_yxl_liehuo_l.png";
                    sName   = "<font color='#FFFF00'>烈火英雄令</front>",
                    tAttr = {dwAttack = 180000;dwDefense = 120000;dwPoJiaValue = 14000;dwPoJiaDiKang = 16500; dwCrit = 4500;dwHPMax = 570000;dwFlee = 6500;dwCritDown = 15000;};
                },
                [3] = {
                    nId     = 2500363,
                    nCount  = 1;
                    Gray    = "img://gn_yxl_leiting_h.png";
                    Colours = "img://gn_yxl_leiting_l.png";
                    sName   = "<font color='#FFFF00'>雷霆英雄令</front>",
                    tAttr = {dwAttack = 220000;dwDefense = 145000;dwPoJiaValue = 16500;dwPoJiaDiKang = 19000; dwCrit = 5200;dwHPMax = 680000;dwFlee = 7200;dwCritDown = 18000;};
                    ---
                },
                [4] = {
                    nId     = 2500364,
                    nCount  = 1;
                    Gray    = "img://gn_yxl_jifeng_h.png";
                    Colours = "img://gn_yxl_jifeng_l.png";
                    sName   = "<font color='#FFFF00'>疾风英雄令</front>",
                    tAttr = {dwAttack = 280000;dwDefense = 165000;dwPoJiaValue = 19500;dwPoJiaDiKang = 21500; dwCrit = 7000;dwHPMax = 800000;dwFlee = 8350;dwCritDown = 20000;};
                    ---
                },
                [5] = {
                    nId     = 2500365,
                    nCount  = 1;
                    Gray    = "img://gn_yxl_guangming_h.png";
                    Colours = "img://gn_yxl_guangming_l.png";
                    sName   = "<font color='#FFFF00'>光明英雄令</front>",
                    tAttr = {dwAttack = 380000;dwDefense = 190000;dwPoJiaValue = 21500;dwPoJiaDiKang = 22500; dwCrit = 8000;dwHPMax = 900000;dwFlee = 10100;dwCritDown = 22500;};
                    ---
                },
                [6] = {
                    nId     = 2500366,
                    nCount  = 1;
                    Gray    = "img://gn_yxl_anhei_h.png";
                    Colours = "img://gn_yxl_anhei_l.png";
                    sName   = "<font color='#FFFF00'>暗黑英雄令</front>",
                    tAttr = {dwAttack = 500000;dwDefense = 215000;dwPoJiaValue = 23000;dwPoJiaDiKang = 24000; dwCrit = 9500;dwHPMax = 1000000;dwFlee = 12000;dwCritDown = 23000;};
                    },
                    ---
            },
        },

    };

    --开启令牌系列系
    OpenLadder = 2;
    -- 界面配置
    UI = {
        --[[
            属性顺序显示
            [属性的位置序号] = 属性名称；
        ]]
        --总属性
        Shunxu = {
             "dwAttack";
             "dwDefense";
             "dwPoJiaValue";
             "dwPoJiaDiKang";
             "dwCrit";
             "dwHPMax";
			 "dwFlee";
             "dwCritDown";	 
        };
        -- 系列1
        Shunxu1 = {
             "dwAttack";
             "dwDefense";
             "dwFlee";
             "dwHPMax";
             "dwCrit";
        };
        -- 系列2
        Shunxu2 = {
             "dwAttack";
             "dwDefense";
             "dwPoJiaValue";
             "dwPoJiaDiKang";
             "dwCrit";
             "dwHPMax";
			 "dwFlee";
             "dwCritDown";	
        };

        --界面属性格式化字符串
        --[属性名称] = 格式化字符串
        ProperyName = {                                                      --TIPS属性字符串
            dwAttack   = "攻击 + ";
            dwHPMax    = "生命 + ";
            dwFlee     = "身法 + ";
            dwDefense  = "防御 + ";
            dwCrit     = "暴击 + ";
            dwPoJiaValue = "破甲 + ";
            dwPoJiaDiKang = "伤害抵御 + ";
			dwCritDown = "暴击抵抗 + ";
        };

        --未开放
		NoOpen = "暂未开放,敬请期待！";
		-- 总属性加成个数
        Number = 8;
	--	ShuXing1 = "当前属性加成<br/>";
		item = "背包内无所需物品";
		ImgTips = "<br/><font color='#ff9900'>英雄令活动获得</font>";
        --显示绿色“已镶嵌”
		ImgTips1 =	"（已镶嵌）<br/><br/>";
		--显示红色“未镶嵌”
		ImgTips2 = "（未镶嵌）<br/><br/>";
		ImgTips3 = "已镶嵌英雄令：%s个<br/>";
		ImgTips4 = "<font color='#00aeff'>令牌属性加成</font>";
		
		prompt = "<font size='13' color='#00FF00'>镶嵌需要消耗一个</font>%s<font size='13' color='#00FF00'>，是否继续？</font>";
        sBroadCast = "恭喜%s大侠集齐%s，闯荡江湖更添一份胜算！";
        IsNoHaveAut = "暂时没开启";
        Blank = "<p align = 'center'>";
        Wrap = "</p>";
        IsEnough   = "<font color='#00FF00'>%s</font>";    --已镶嵌 绿
        IsNoEnough = "<font color='#FF0000'>%s</font>";    --未镶嵌 红
		Tips = "点击可查看英雄令";
    };
};
