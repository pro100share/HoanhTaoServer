-- [[
	-- 武侠令系统配置
	-- 时间：2013-12-7
-- ]]

-- 配置项
_G.WuXiaLingConfig = {};

-- 操作数据
WuXiaLingConfig.Data = 
{
     --[[
        [ 勋章等级 = 
        [ {
        [     兑换消耗 = {银两, {威望等级, 威望值} 令牌{枚举id, 消耗数量}};
        [     获得属性 = { (0 - 表示不增长)
        [         攻击, 防御, 身法, 暴击, 生命, 暴击伤害, 移动速度, 攻击速度
        [     };
        [ };
        ]]
    [1] = 
    {
        [1] = {15000000, {1, 546}, {5809566, 18}};
        [2] = {
            800,400,64,68,4000,200
        };
    };
    [2] = 
    {
        [1] = {20000000, {1, 728}, {5809566, 24}};
        [2] = {
            1800,900,144,153,9000,400
        };
    };
	[3] = 
    {
        [1] = {35000000, {1, 1274}, {5809566, 42}};
        [2] = {
            3100,1550,248,263,15500,600
        };
    };
	[4] = 
    {
        [1] = {60000000, {1, 2184}, {5809566, 72}};
        [2] = {
            4750,2375,380,403,23750,800
        };
    };
	[5] = 
    {
        [1] = {95000000, {1, 3458}, {5809566, 114}};
        [2] = {
            6800,3400,544,577,34000,1000
        };
    };
	[6] = 
    {
        [1] = {140000000, {1, 5096}, {5809566, 168}};
        [2] = {
            9300,4650,744,789,46500,1200
        };
    };
	-- [7] = 
    -- {
        -- [1] = {195000000, {1, 7098}, {5809566, 234}};
        -- [2] = {
            -- 12300,6150,984,1044,61500,0.14
        -- };
    -- };
	-- [8] = 
    -- {
        -- [1] = {260000000, {1, 9496}, {5809566, 312}};
        -- [2] = {
            -- 15850,7925,1268,1345,79250,0.16
        -- };
    -- };
	-- [9] = 
    -- {
        -- [1] = {335000000, {1, 12194}, {5809566, 402}};
        -- [2] = {
            -- 20050,10025,1604,1702,100250,0.18
        -- };
    -- };
	-- [10] = 
    -- {
        -- [1] = {420000000, {1, 15288}, {5809566, 504}};
        -- [2] = {
            -- 25050,12525,2004,2127,125250,0.2
        -- };
    -- };
};

-- 错误码
WuXiaLingConfig.Error =
{
    -- 错误码 = 描述
	--上一阶威望勋章未兑换
    [1] = "不满足%s的兑换条件";
	--银两不足
	[2] = "不满足%s的兑换条件";
	--威望等级对应的威望值不足
	[3] = "不满足%s的兑换条件";
	--令牌数数不足
	[4] = "不满足%s的兑换条件";
};

-- 武侠令激活后增加属性tips标题
WuXiaLingConfig.szAddAttrTips =
{
    -- 系列项显示标题
    szTitle = [[<font color='#FDF445'>%s</font><br /><font color='#6BDD65'>激活后属性加成</font><br />]];
    -- 属性项
    szContent = [[<font color='#D9671B'>%s </font><font color='#D9CCBD'>+ %s</font><br />]];
    -- 人物界面激活显示标题
    szActivedTitle = [[<font color='#FDF445'>%s</font><br /><font color='#6BDD65'>当前勋章加成属性</font><br />]];
    -- 人物属性界面未激活提示
    szUnlockNotActive = "尚未有兑换的威望勋章";
};

-- 广播消息
WuXiaLingConfig.szBroadcastTex = "恭喜玩家%s在江湖上行侠仗义惩恶扬善获得<font color = '#FF6100'>%s</font>";

-- 属性项显示
WuXiaLingConfig.szShowAttrTex = {
	-- 未激活时显示
	szUnActive = "未激活",
	szActive = "%s  + %s",
};

-- 说明文字
WuXiaLingConfig.szExplainTex = "每日完成侠义任务可获取威望牌，消耗威望牌,威望,银两兑换威望勋章获得属性加成。";

-- 属性项文本（与操作数据项中获得属性对应）
--{属性项对应的键 = {属性项显示顺序,属性项中文名称}}
WuXiaLingConfig.PropertyText = {
	dwAttack        = {1,"攻    击"},
	dwDefense       = {2,"防    御"},
	dwFlee          = {3,"身    法"},
	dwCrit          = {4,"暴    击"},
	dwHPMax         = {5,"生命上限"},
	dwAppendCrit    = {6,"暴击伤害"},
	dwMoveSpeed     = {7,"移动速度"},
	dwAttackSpeed   = {8,"攻击速度"},
};

-- 勋章不同等级显示信息（与操作数据项中勋章等级对应）
--name:名称，icon：非列表图标，IconGray：非列表灰图标，nameIcon：名称图片，strIcon：列表图标，strIconGray：列表灰图标
WuXiaLingConfig.WuXiaLingInfo = {
	[1] = {name = "少侠勋章",icon = "weiwangxunzhang_b_1_1.png",IconGray = "weiwangxunzhang_b_1_0.png",nameIcon = "weiwangxunzhang_1.png",strIcon = "weiwangxunzhang_s_1_1.png",strIconGray = "weiwangxunzhang_s_1_0.png"},
	[2] = {name = "新秀勋章",icon = "weiwangxunzhang_b_2_1.png",IconGray = "weiwangxunzhang_b_2_0.png",nameIcon = "weiwangxunzhang_2.png",strIcon = "weiwangxunzhang_s_2_1.png",strIconGray = "weiwangxunzhang_s_2_0.png"},
	[3] = {name = "侠士勋章",icon = "weiwangxunzhang_b_3_1.png",IconGray = "weiwangxunzhang_b_3_0.png",nameIcon = "weiwangxunzhang_3.png",strIcon = "weiwangxunzhang_s_3_1.png",strIconGray = "weiwangxunzhang_s_3_0.png"},
	[4] = {name = "掌门勋章",icon = "weiwangxunzhang_b_4_1.png",IconGray = "weiwangxunzhang_b_4_0.png",nameIcon = "weiwangxunzhang_4.png",strIcon = "weiwangxunzhang_s_4_1.png",strIconGray = "weiwangxunzhang_s_4_0.png"},
	[5] = {name = "名宿勋章",icon = "weiwangxunzhang_b_5_1.png",IconGray = "weiwangxunzhang_b_5_0.png",nameIcon = "weiwangxunzhang_5.png",strIcon = "weiwangxunzhang_s_5_1.png",strIconGray = "weiwangxunzhang_s_5_0.png"},
	[6] = {name = "宗师勋章",icon = "weiwangxunzhang_b_6_1.png",IconGray = "weiwangxunzhang_b_6_0.png",nameIcon = "weiwangxunzhang_6.png",strIcon = "weiwangxunzhang_s_6_1.png",strIconGray = "weiwangxunzhang_s_6_0.png"},
	[7] = {name = "奇贤勋章",icon = "weiwangxunzhang_b_7_1.png",IconGray = "weiwangxunzhang_b_7_0.png",nameIcon = "weiwangxunzhang_7.png",strIcon = "weiwangxunzhang_s_7_1.png",strIconGray = "weiwangxunzhang_s_7_0.png"},
	[8] = {name = "侠圣勋章",icon = "weiwangxunzhang_b_8_1.png",IconGray = "weiwangxunzhang_b_8_0.png",nameIcon = "weiwangxunzhang_8.png",strIcon = "weiwangxunzhang_s_8_1.png",strIconGray = "weiwangxunzhang_s_8_0.png"},
	[9] = {name = "武尊勋章",icon = "weiwangxunzhang_b_9_1.png",IconGray = "weiwangxunzhang_b_9_0.png",nameIcon = "weiwangxunzhang_9.png",strIcon = "weiwangxunzhang_s_9_1.png",strIconGray = "weiwangxunzhang_s_9_0.png"},
	[10] = {name = "战神勋章",icon = "weiwangxunzhang_b_10_1.png",IconGray = "weiwangxunzhang_b_10_0.png",nameIcon = "weiwangxunzhang_10.png",strIcon = "weiwangxunzhang_s_10_1.png",strIconGray = "weiwangxunzhang_s_1_0.png"},
};
