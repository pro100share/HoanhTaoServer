
--[[
	--在线礼包系统相关配置
	--
	--时间：2013-11-29
--]]

----获取奖励类别信息表
_G.ShakeAwardTypeInfoConfig = {
	[1] = {weightValue = 950},  ---weightValue 权重
	[2] = {weightValue = 400},
	[3] = {weightValue = 200},
	[4] = {weightValue = 50},
}

	local timejg = {300,600,900,1800,1800,2400,3000,3600};
-----在线礼包系统配置表
_G.OnlineAwardsConfig = {
	ResetTime = "24:00";
	MaxNum = 8;---今日可使用最大次数
	ItemInfos = {
		[1] = { --{itemId:物品枚举Id,itemNum:数量，itemType:是否绑定，itemWeightValue:权重，isBroadCast:是否广播}
			[1] = {itemId = 5920002,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[2] = {itemId = 5910003,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[3] = {itemId = 5930003,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[4] = {itemId = 5940003,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[5] = {itemId = 2500071,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[6] = {itemId = 2500081,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[7] = {itemId = 2400000,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[8] = {itemId = 2400010,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[9] = {itemId = 2500030,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[10] = {itemId = 2500040,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[11] = {itemId = 2400110,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[12] = {itemId = 2400260,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[13] = {itemId = 5600020,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[14] = {itemId = 5500020,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[15] = {itemId = 5500010,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[16] = {itemId = 4100010,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[17] = {itemId = 2500090,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[18] = {itemId = 5500030,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[19] = {itemId = 2500190,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[20] = {itemId = 2500060,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
		};
		[2] = {
			[1] = {itemId = 5920003,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[2] = {itemId = 5910004,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[3] = {itemId = 5930004,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[4] = {itemId = 5940004,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[5] = {itemId = 4100140,itemNum = 2,itemType = 1,weightValue = 10,isBroadCast = false},
			[6] = {itemId = 4100080,itemNum = 2,itemType = 1,weightValue = 10,isBroadCast = false},
			[7] = {itemId = 9405010,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[8] = {itemId = 4100210,itemNum = 3,itemType = 1,weightValue = 10,isBroadCast = false},
			[9] = {itemId = 4100290,itemNum = 2,itemType = 1,weightValue = 10,isBroadCast = false},
			[10] = {itemId = 2500050,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[11] = {itemId = 3900020,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[12] = {itemId = 5600030,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[13] = {itemId = 4100410,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[14] = {itemId = 4100430,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[15] = {itemId = 5809368,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[16] = {itemId = 5809367,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
		};
		[3] = {
			[1] = {itemId = 5920004,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[2] = {itemId = 5910005,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[3] = {itemId = 5930005,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[4] = {itemId = 5940005,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[5] = {itemId = 4100120,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[6] = {itemId = 3900030,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[7] = {itemId = 4100110,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[8] = {itemId = 4100130,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[9] = {itemId = 5600040,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[10] = {itemId = 2400120,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[11] = {itemId = 2500331,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[12] = {itemId = 5950010,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
		};
		[4] = {
			[1] = {itemId = 5920005,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[2] = {itemId = 5910006,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[3] = {itemId = 5930006,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[4] = {itemId = 5940006,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[5] = {itemId = 3900040,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[6] = {itemId = 9405011,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[7] = {itemId = 5950001,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[8] = {itemId = 5950002,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
			[9] = {itemId = 5950003,itemNum = 1,itemType = 1,weightValue = 10,isBroadCast = false},
		};		
	};
	
	probability = function(Data)
		local dwMax = 0;
		for location,dwProp in pairs(Data) do
			dwMax = dwMax + dwProp.weightValue
		end
		local dwRes = math.random(1,dwMax)
		local dwCur = 0;
		for location,dwProp in pairs(Data) do
			dwCur = dwCur + dwProp.weightValue
			if dwRes <= dwCur then
				return location;
			end
		end
	end;
	----获取n随机奖励物品类别信息
	GetRanderShakeAwardTypes = function(shakeAwardNum)----shakeAwardNum 今日摇奖次数
		local tabTypes = {};
		tabTypes = {{Type = 1,Num = 7},{Type = 2,Num = 6},{Type = 3,Num = 4},{Type = 4,Num = 3}};
		return tabTypes;
	end;
	
	
	----获取n奖励物品索引信息
	GetRanderShakeAwardIndexList = function(tabInfo)
		local tempTabInfo = {};
		local tempInfo = {Type = 0,Index = 0};
		local tempItemInfo = {};
		local index = 0;
		for k,v in pairs(tabInfo) do
			tempItemInfo = {};
			for i = 1,#_G.OnlineAwardsConfig.ItemInfos[v.Type] do
				tempItemInfo[i] = {};
				tempItemInfo[i].weightValue = _G.OnlineAwardsConfig.ItemInfos[v.Type][i].weightValue
				tempItemInfo[i].index = i;
			end
			tempInfo.Type = v.Type;
			for i = 1,v.Num do
				index = _G.OnlineAwardsConfig.probability(tempItemInfo)
				tempInfo.Index = tempItemInfo[index].index
				tempItemInfo[tempInfo.Index] = nil;
				local index = #tempTabInfo + 1;
				tempTabInfo[index] = {};
				tempTabInfo[index].Type = tempInfo.Type;
				tempTabInfo[index].Index = tempInfo.Index;
			end
		end
		return tempTabInfo;
	end;
	----获取本次摇奖物品信息
	GetRanderShakeAwardInfo = function(tabInfo)
		local tempTabInfo = {Type = 0,Index = 0};
		local typeIndex = _G.OnlineAwardsConfig.probability(_G.ShakeAwardTypeInfoConfig)
		tempTabInfo.Type = typeIndex;
		local Data = {};
		for k,v in pairs(tabInfo) do
			if(v.Type == typeIndex) then
				local index = #Data + 1;
				Data[index] = {};
				Data[index].weightValue = _G.OnlineAwardsConfig.ItemInfos[typeIndex][v.Index].weightValue
				Data[index].Index = v.Index;
			end
		end
		local index = _G.OnlineAwardsConfig.probability(Data)
		tempTabInfo.Index = Data[index].Index
		return tempTabInfo;
	end;

	--根据抽奖次数返回时间间隙
	GetShakeTimeGap = function(shakeAwardNum)
		if shakeAwardNum == 0 then return 0; end
		local base = 1000; -->1秒
		local timeGap = timejg[shakeAwardNum]*base;
		return timeGap
	end;
	
	--根据抽奖次数返回抽奖时旋转次数
	GetLoopNum = function(shakeAwardNum)
		local num = shakeAwardNum;
		if not num or num == 0 then
			num = 1;
		end
		return num;
	end;
	
	--
	SetMaiInfo = function(AwardInfo)
		local mailMsg = {
			sender = "系统邮件";--发件人
			sender_id = "10086";---运营用的
			lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
			topic = "在线抽奖";
			content = "您的背包已满，在线礼包获得的奖励通过邮件发送给您，请注意查收";
			gold = 0;
			bindgold = 0;
			money = 0;
			item = 	{[AwardInfo.AwardItemID]={
					num = AwardInfo.AwardItemNum;
					bind = AwardInfo.AwardItemBindType;--1是绑定，0是非绑定
					},
				},
			--ID 和 数量
			equip = 
			{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

			};
			
		};
		return mailMsg;
	end;
};

--在线礼包文本配置
_G.OnlineAwardsTextConfig = {
	szTimes = "<font color='#FF0000'>%s:</font><font color='#FF0000'>%s</font>"; -->界面图标时间
	szMainTopEnd = "获取奖励", -->界面图标时间结束提示
	szNotShake = "您的在线时间不足",
	szStarShake = "点击后开始摇奖",
	szShaking = "您正在抽奖，惊喜马上揭晓",
	szClickTips = "本日剩余抽奖次数:%d",
	szPackEmpty = "奖励物品已发送至背包",
	szPackFull = "您的背包已满，抽奖获得的奖励通过邮件发送给您，请注意查收",
	szEmail = "抽奖获得的奖励通过邮件发送给您，请注意查收",
	szBroadCast = "<font ><font %s>%s</font>在在线礼包内抽取了<font color='%s'>%s*%d</font>道具</font>",
	szNotCount = "您本日的抽奖次数已用完",
	--szNotShakeNum = "您本日的抽奖次数已用完",
};
