--[[
	--群侠录——融合配置信息
	--时间：2013-12-31
]]

_G.QunXiaFuseConfig = {
	--合成需要的数量
	fuseNeedCount = 5;
	
	--广播品质 大于等于此品质的广播
	boradcastQuality = 4;
	
	--玩法说明
	szPlayExp = "<font color='#D9CCBD'>1.群侠卡片的品质分为：白色，绿色，蓝色，紫色，金色，稀有金色</font><br/><font color='#D9CCBD'>2.5个相同品质低一级群侠卡片可以合成高一级群侠卡片</font><br/><font color='#D9CCBD'>3.合成失败后可以返回部分参与合成的群侠卡片</font>";
	--合成物品数量
	szFuseNum = "<font color='%s'>%d/%d</font>";
	--合成材料不足
	szNotEnoughtMat = "<font color='#FFFFFF'>材料不足，无法合成！</font>";
	--消耗银两不足
	szNotEnoughtSliver = "<font color='#FFFFFF'>银两不足，无法合成！</font>";
	--本次合成材料已被使用
	szNotFuseMat = "<font color='#FFFFFF'>材料已被使用无法合成，请重新添加！</font>";
	--存在绑定材料提示
	szBindTips = "<font color='#FFFFFF'>材料中有绑定物品，合成的物品将为绑定物品。</font>";
	--最高品质提示
	szMaxQual = "<font color='#FFFFFF'>卡片已为最高品质，无法再次融合。</font>";
	--添加相同物品提示
	szAddSameQua = "<font color='#FFFFFF'>请添加相同品质的群侠卡片</font>";
	--背包中选择物品不足
	szNotPacket = "<font color='#FFFFFF'>当前群侠卡片不足，请添加其他相同品质的群侠卡片</font>";
	--广播消息
	szBroadCast = "<font >恭喜玩家%s在群侠融合中合成了</font><font color='%s'>%s</font><font >品质的</font><font color='%s'>%s</font>名卡";
	--融合失败返回(收益提示)
	szFuseFail = {
		[1] = "融合失败返还群侠卡片:";
		[2] = "%s";
	};
	--打开融合界面相对背包位移(负数左移)
	posGap = {
		x = -160;
		y = 0;
	};
	--连续点击融合按钮时间间隔
	timeGap = 1000;
	--当前选择的卡片品质已满
	szQualityFull = "<font color='#FFFFFF'>当前选择的卡片品质已满</font>";
}

--获取融合成功率
function QunXiaFuseConfig:GetSuccRate(dwQuality)
    local rate = {
	[2] = 9000,
	[3] = 8000,
	[4] = 7000,
	[5] = 5000,
	[6] = 1000
	};
	return rate[dwQuality];
end

--获取融合消耗的银两
function QunXiaFuseConfig:GetCostMoney(dwQuality)
	local cost = {
	[2] = 100000,
	[3] = 200000,
	[4] = 500000,
	[5] = 1000000,
	[6] = 3000000,
	};
	return cost[dwQuality];
end

--获取融合失败返还数量
function QunXiaFuseConfig:GetBackCarNum(dwQuality)
	return 3;
end

--获取融合成功率文本(选择融合物品品质颜色)
function QunXiaFuseConfig:GetSuccRateText(dwRate,dwQuality)
    if not dwRate or not dwQuality then return; end
	local b = {"极高","很高","较高","一般","一般"};
	return b[dwQuality] or "";
end