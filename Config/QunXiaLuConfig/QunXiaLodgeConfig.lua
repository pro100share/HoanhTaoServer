--[[
	--群侠录-风云客栈配置信息
	--时间：2013-12-31
]]

_G.QunXiaLodgeConfig = {
	--风云客栈固定刷新时间
	setRefreshTime = {
		"06:00",
		"08:00",
		"12:00",
		"18:00",
		"22:00",
	};
	
	--每次刷新卡片数
	refreshCardCount = 3;
	
	--广播品质 大于等于此品质的广播
	boradcastQuality = 4;
	
	--卡片标题
	szTitle = "<font color='%s'>%s名卡*</font><font color='#FFFFFF'>%d</font>";
	--消耗风云声望
	szCost = "<font color='#FFFFFF'>风云声望：%d</font>";
	--刷新时间
	szFlushTime = "<font color='#FFFFFF'>%s小时%s分钟</font>";
	--当前风云声望
	szFengYun = "<font color='#FFFFFF'>%d</font>";
	--获取风云声望
	szGetFengYun = [[<font color='#00FF00'><u><a href="asfunction:hrefevent,">获取风云声望</a></u></font>]];
	--风云声望不足
	szNotEnought = "风云声望不足，无法购买！";
	--当前背包已满
	szCurPacketFull = "您的背包已满！";
	--刷新消耗元宝不足
	szNotEnoughtGlod = "您的元宝不足！";
	--购买按钮
	szPurchase = {
		[1] = "购买";
		[2] = "已购买";
	};
	--刷新按钮提示
	szFlushBt = {
		[1] = "花费风云声望：<font color='#FF6100'>%d</font>";
		[2] = "花费元宝：<font color='#FF6100'>%d</font>";
	};
	--卡片提示
	szCardsTips = "<font color='%s'>%s</font><br/><font color='#D9CCBD'>品质：</font><font color='%s'>%s</font><br/><font color='#D9CCBD'>介绍：%s</font>";
	--消息公告
	szBroadCast = "<font >恭喜玩家%s在风云客栈刷新到</font><font color='%s'>%s</font><font >品质的</font><font color='%s'>%s</font>名卡";
}

--获取风云声望刷新消耗
--dwHonorNum:使用风云声望刷新次数
function QunXiaLodgeConfig:GetHonorCost(dwHonorNum)
	local baseErrantHonor = 5000;
	return baseErrantHonor;
end;

--获取元宝刷新消耗
--dwGoldNum:使用元宝刷新次数
function QunXiaLodgeConfig:GetGoldCost(dwGoldNum)
	local baseGold = 50;
	return baseGold ;
end;
