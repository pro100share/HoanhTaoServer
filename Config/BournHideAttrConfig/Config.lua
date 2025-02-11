﻿-- [[
	-- 实战隐藏属性系统配置
	-- 时间：2013-12-19
-- ]]

-- 实战隐藏属性配置对象
_G.BournHideAttrConfig = {};

-- 操作数据
BournHideAttrConfig.Data = 
{
     --[[
        [ 隐藏属性等级 = 
        [ {
        [     激活消耗 = {无字天书.上{枚举id, 消耗数量},无字天书.下{枚举id, 消耗数量}};
        [     加成属性 = { (0 - 表示不增长)
        [        生命, 攻击, 防御,暴击, 身法,伤害减免, 武功层数
        [     };
        [ };
        ]]
    [1] = 
    {
        [1] = {{4902010, 60}, {4902011, 60}};   --无字天书·上卷+无字天书·下卷
        [2] = { 10000,2000,2190,400,200,100,0 };
    };
    [2] = 
    {
        [1] = {{4902010, 110}, {4902011, 110}};   --无字天书·上卷+无字天书·下卷
        [2] = { 20000,4000,4380,800,400,200,0 };
    };
	[3] = 
    {
       [1] = {{4902010, 180}, {4902011, 180}};   --无字天书·上卷+无字天书·下卷
       [2] = { 30000,6000,6570,1200,600,300,0 };
    };
	[4] = 
    {
        [1] = {{4902010, 270}, {4902011, 270}};   --无字天书·上卷+无字天书·下卷
        [2] = { 40000,8000,8760,1600,800,400,0 };
    };
	[5] = 
    {
        [1] = {{4902010, 380}, {4902011, 380}};   --无字天书·上卷+无字天书·下卷
        [2] = { 50000,10000,10950,2000,1000,500,0 };
    };
	[6] = 
    {
        [1] = {{4902010, 520}, {4902011, 520}};   --无字天书·上卷+无字天书·下卷
        [2] = { 60000,12000,13140,2400,1200,600,1 };
    };
	[7] = 
    {
        [1] = {{4902010, 690}, {4902011, 690}};   --无字天书·上卷+无字天书·下卷
        [2] = { 70000,14000,15330,2800,1400,700,2 };
    };
	[8] = 
    {
       [1] = {{4902010, 890}, {4902011, 890}};   --无字天书·上卷+无字天书·下卷
       [2] = { 80000,16000,17520,3200,1600,800,3 };
    };
	[9] = 
    {
        [1] = {{4902010, 1130}, {4902011, 1130}};   --无字天书·上卷+无字天书·下卷
        [2] = { 90000,18000,19710,3600,1800,900,4 };
    };
	[10] = 
    {
        [1] = {{4902010, 1420}, {4902011, 1420}};   --无字天书·上卷+无字天书·下卷
        [2] = { 100000,20000,21900,4000,2000,1000,5 };
    };
};

-- 错误码
BournHideAttrConfig.Error =
{
    -- 错误码 = 描述
	--无字天书.上不足
    [1] = "道具不足！无法激活隐藏属性";
	--无字天书.下不足
	[2] = "道具不足！无法激活隐藏属性";
};

-- 属性项文本（与操作数据项中获得属性对应）
--{属性项对应的键 = {属性项显示顺序,属性项中文名称}}
BournHideAttrConfig.PropertyText = {
	dwHPMax         = {1,"生命上限"},
	dwAttack        = {2,"攻    击"},
	dwDefense       = {3,"防    御"},
	dwCrit          = {4,"暴    击"},
	dwFlee          = {5,"身    法"},
	dwRemitAttack   = {6,"伤害减免"},
	dwAllSkillUpLv  = {7,"武功层数"},
};

--激活等级满时实战界面隐藏属性图标！！！（图标放在控件里）
--BournHideAttrConfig.FullIcon = "-4.png";

--人物名称左下角提示图标
BournHideAttrConfig.RoleIcon = {
	[1] = "jjyc_01_logo.png";
	[2] = "jjyc_02_logo.png";
	[3] = "jjyc_03_logo.png";
	[4] = "jjyc_04_logo.png";
	[5] = "jjyc_05_logo.png";
	[6] = "jjyc_06_logo.png";
	[7] = "jjyc_07_logo.png";
	[8] = "jjyc_08_logo.png";
	[9] = "jjyc_09_logo.png";
	[10] = "jjyc_10_logo.png";
};

--已获得属性显示格式  
BournHideAttrConfig.HadAddAttr = [[<font size='14' color='#b87409'>%s:</font><font size='14' color='#c8a750'>%d</font>]];

--界面满足条件和未满足条件颜色值
BournHideAttrConfig.Color = {
	--消耗物品
	[1] = "#FFFFFF"; -->数量充足
	[2] = "#FF0000"; -->数量不足+所需数量
	--
	[3] = "#00FF00"; -->激活次数
	[4] = "#00FF00"; -->激活总次数
};

--领取不成功提示
BournHideAttrConfig.szNotGet = "不满足激活条件！";

-- 广播消息
BournHideAttrConfig.szBroadcastTex = "恭喜<font color='#22a6fa'>%s</font>大侠凭借超凡悟性，参透无字天书，领悟实战境界之精深奥义，激活隐藏属性，获得大幅属性提升！从此睥睨天下，何人能敌！";
