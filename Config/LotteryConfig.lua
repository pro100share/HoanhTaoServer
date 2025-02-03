--抽签系统配置文件

_G.LotteryConfig = {
	--[[CAlarmClock:AddTask({dwTime = "24:00"}, CAlarmTaskCycleType.eDay, 1, 0,
		function() self:ResetValue() end, {}--]]
	--开奖时间
	DrawingTime = {
		"20:30",
	};
	
	--抽奖总签数 （从数字1开始 ）
	TicketAllCount = 99;
	--抽奖中奖签数
	TicketDrawCount = 3;
	--广播重复次数
	BroadCastCount = 3;
	--当剩余签数等于某值时 给客户端发送广播消息
	TicketBroadcastCount = 10;
	
	--最小的开奖时间间隔（只用于固定开奖时间） 一小时
	MinDrawInterval = ONE_HOUR_MSEC;
	
	--签的状态
	TicketStateEnum = {
		unselected = 1,
		selectedByOther = 2,
		selectedByMe = 3,
	};
	SilverFlag  = false;  -- false表示金钱屏蔽
	--购买一个签 需要的抽签凭证ID和数量
	NeedItem = {itemEnumId = 2500330, itemCount = 1, silver = 0};
	
	--购买成功奖励礼包ID
	BuySuccessGiftEnumId = 6300497;
};


--抽奖系统中奖奖励配置
_G.LotteryRewardConfig = {
	[1] = {
		[1] = {[6300485] = 1, silver = 0, weight = 2500,},
		[2] = {[6300488] = 1, silver = 0, weight = 2500,},
		[3] = {[6300491] = 1, silver = 0, weight = 2500,},
		[4] = {[6300494] = 1, silver = 0, weight = 2500,},
	};
	
	[2] = {
		[1] = {[6300486] = 1,  silver = 0, weight = 2500,},
		[2] = {[6300489] = 1, silver = 0, weight = 2500,},
		[3] = {[6300492] = 1, silver = 0, weight = 2500,},
		[4] = {[6300495] = 1, silver = 0, weight = 2500,},
	};
	
	[3] = {
		[1] = {[6300487] = 1, silver = 0, weight = 2500,},
		[2] = {[6300490] = 1, silver = 0, weight = 2500,},
		[3] = {[6300493] = 1, silver = 0, weight = 2500,},
		[4] = {[6300496] = 1, silver = 0, weight = 2500,},
	};
	
	--得到计算用的权重
	GetCalWeight = function(dwRewardType, dwRewardIndex)
		local retValue = 0;
		
		for i = 1, dwRewardIndex do
			retValue = retValue + LotteryRewardConfig[dwRewardType][i].weight
		end
		
		return retValue
	end
	
};
_G.LotteryStrConfig = {
	checkBoxStr = "历史中奖几率：%d%%<br>历史购买人数：%d<br>%s";
	MyTicketStr = "您已购买的签数为%s";
	NoTicketStr = "您还没有购买签数";
	TicketStateEnumStr = {
		"可购买",
		"您已够买此号",
		"已被抢购",
	};
	IWantStr = "我也来买";
	NumStr1  = "本轮抽签最后剩余%d签，售完既开奖";
	NumStr  = "剩余签字：%d个，剩余签字售完将提前开奖";
	NeedItemNum1 = "%d/%d"; 		--物品充足
	NeedItemNum2 = "<font color='#ff0000'>%d/%d</font>";			--物品不足
	RuleStr = "1、购买签数需要持有活动道具“签筒”。<br>2、本轮签数售完后即刻开奖，每日开奖次数不限，若当日签数未售完，则于20:30定时开奖。<br>3、若上一轮开奖时间在19:30-20:30之间，且新一轮的签数未售完，则当日20:30不开奖。";
	BroadCastStr = "本轮抽奖结果已经诞生：一等奖：%s 奖品:%s二等奖:%s 奖品:%s三等奖:%s 奖品:%s";
	RewardStr = "%s x %d ";
	silver = "%d";
	MyRewardStr1 = "恭喜您抽签获得了一等奖，请到您的邮箱内查收奖品";
	MyRewardStr2 = "恭喜您抽签获得了二等奖，请到您的邮箱内查收奖品";
	MyRewardStr3 = "恭喜您抽签获得了三等奖，请到您的邮箱内查收奖品";
	NoCanBuyStr = "签数已经售完";
	BuySuccessStr = "购买成功";
	NoCanBuyStr1 = "此签已被您购买";
	NoCanBuyStr2 = "此签已被其他玩家购买";
	NoCanBuyStr3 = "背包空间不足，无法收取礼包，请整理背包";
	NoCanBuyStr4 = "请检查您的签筒道具数量，签筒道具数量不足";
	NoCanBuyStr5 = "银两不足";
	NoCanBuyStr6 = "已开奖，开启新的一轮抽奖";
	None = "无人中奖";        --没人中奖
	text1 = "奖品名";        --没人中奖
	strTime= {
		[1] = "今日";
		[2] = "明日"
	};  
};


--抽签开奖后 邮件相关配置
_G.LotteryMail = {
	--中奖者配置
	DrawRole = {
		topic = "抽签奖励发送",
	};
	
	--未中奖者配置
	OtherRole = {
		topic = "抽签结果",
	};
	
	
	RewardTypeStr = {
		"一",
		"二",
		"三",
		"四",
		"五",
	};

	GetDrawRoleContent = function(dwRewardType,  dwRewardIndex)
		print("GetDrawRoleContent",dwRewardType,dwRewardIndex)
		local rewardCfg = LotteryRewardConfig[dwRewardType][dwRewardIndex]
		
		local itemStuff = ""
		for itemEnumId, itemNum in pairs(rewardCfg) do
			if type(itemEnumId) == "number" then
				itemStuff = itemStuff..OtherBaseData[itemEnumId].strName.."x"..itemNum..","
			end
		end
		
		itemStuff = string.sub(itemStuff, 1, -2)
		
		local tempStr = string.format("恭喜您获得了抽签活动的%s等奖，获得物品%s。", LotteryMail.RewardTypeStr[dwRewardType], itemStuff)
		
		if rewardCfg.silver and rewardCfg.silver ~= 0 then
			tempStr = string.format("恭喜您获得了抽签活动的%s等奖，获得物品%s，获得银币%s。", LotteryMail.RewardTypeStr[dwRewardType], itemStuff, rewardCfg.silver)
		end
		
		return tempStr
	end;

	GetOtherRoleContent = function(dwSetBuyTicket, dwDrawTicket)
		local buyTicketStuff = ""
		for k, v in pairs(dwSetBuyTicket) do
			buyTicketStuff = buyTicketStuff..v.."，"
		end
		--buyTicketStuff = string.sub(buyTicketStuff, 1, -2)
		
		local drawTicket = ""
		local drawCount = #dwDrawTicket
		for k, v in pairs(dwDrawTicket) do
			if drawCount == k then
				drawTicket = drawTicket..v
				break
			end
			drawTicket = drawTicket..v.."，"
		end
		--drawTicket = string.sub(drawTicket, 1, -2)
		
		local retStr = "您购买的签数为："..buyTicketStuff.."中奖签数为："..drawTicket.."。"
		return retStr
	end;
};