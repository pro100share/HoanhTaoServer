--[[
   [ \brief 侠客岛倒计时界面配置表
   [ \author 路广华
   [ \date 2014-07-22
   [ 用于该系统客户端及服务器数据相关配置
   ]]

-- 配置表
_G.KnightIslandConfig = {};
-- 文字说明
KnightIslandConfig.Text = {
	Day = "<font color = '#4daeed'>%d天</font>";
	Hour = "<font color = '#4daeed'>%d时</font>";
	Min = "<font color = '#4daeed'>%d分</font>";
	Sec = "<font color = '#4daeed'>%d秒</font>";
	BeFlush = "<font color = '#31cf32'>已刷新</font>";
	BeKilled = "<font color = '#FF0000'>已击杀</font>";
	WarLast = "<font color = '#FFFF00'>活动剩余时间：</font><font color = '#4daeed'>%s</font>";
};
-- boss信息
-- [bossID] = {FlushTime 刷新时间; Type 类型; IconID 头像ID; name 姓名;}
KnightIslandConfig.BossInfo = {
	-- 三个boss
	[50760004] = {FlushTime = 6; Type = 1; IconID = 50720008; name = "<font color = '#FFFF00'>金不换</font>";};
	[50760005] = {FlushTime = 16; Type = 1; IconID = 10051001; name = "<font color = '#FFFF00'>白自在</font>";};
	[50760006] = {FlushTime = 26; Type = 1; IconID = 50012001; name = "<font color = '#FFFF00'>木岛主</font>";};
	-- 两个飞贼
	[50760017] = {FlushTime = 17; Type = 2; IconID = 10022099; name = "<font color = '#FFFF00'>不三不四</font>";};
	[50760018] = {FlushTime = 17; Type = 2; IconID = 10022099; name = "<font color = '#FFFF00'>不三不四</font>";};
	-- 一个宝箱
	[50760003] = {FlushTime = 24; Type = 3; IconID = 1122; name = "<font color = '#FFFF00'>金宝箱</font>"};
};
-- 两个飞贼的ID
KnightIslandConfig.ThiefID = {
	[1] = 50760017;
	[2] = 50760018;
};
-- 客户端显示的顺序
-- {[序号] = bossID;}
KnightIslandConfig.BossShowID = {
	[1] = 50760004;
	[2] = 50760005;
	[3] = 50760006;
	[4] = 50760017;
	[5] = 50760003;
};
-- 头像的高度和宽度
KnightIslandConfig.IconSize = {
	Height = 56;
	Width = 52;
};
-- 活动倒计时的位置
KnightIslandConfig.PanelPos = {
	UpPos = 2;
	DownPos = 348;
};

