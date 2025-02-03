--[[
	活动综合配置
	周长沙
	2013-5-15
--]]

_G.FestivalTypeEnum = {--活动类型配置--开始时间：结束时间
	None = 0;--一直存在
	Server = 1;--根据服务器开启时间
	Date = 2;--根据月日
	Acti = 3;--根据上一层开启时间
	MergeServer=4;--根据合服开始时间
}
_G.FestivalListTypeEnum = {--活动子类型配置
	Rush = 1;--冲榜类
	Back = 2;--回馈类
	Other = 3;--其他类
}
_G.FestivalPanelTypeEnum = {--活动子面板配置
	Rush = 1;--冲榜类面板
	Back = 2;--回馈类面板
	Market = 3;--推销类
	Exchange = 4;--兑换类
	Reward = 5;--奖励领取类
}
_G.FestivalListConfig = {}--活动穷举配置

_G.FestivalRuleTypeEnum = {--规则类型配置
	AND = 1;
	OR = 2;
}
_G.FestivalBackTypeEnum = {--回馈类 细分
	Mount = 1;--坐骑
	Sword = 2;--名剑
	Amulet = 3;--宝甲
	Bourn = 4;--实战
	Practice =5; --修行
	KungFu=6;--易筋经
	MegaKill=7;--血魔功
}
_G.FestivalStateEnum = { --活动状态配置
	None = 0;--未开始
	Start = 1;--进行中
	Reward = 2;--领奖中
}

_G.FestivalMoneyEnum = {
	[5500900] = 1;	--真气
	[5500910] = 2;	--元宝
	[5500920] = 3;	--银两
	[5500930]= 4;	--礼金
	[5500940] = 5;	--经验
};

_G.FestivalChargeEnum = {--充值时间类型
	None = 0;	--无
	Day = 1;	--日
	Week = 2;	--周
	Sin	= 3;	--单笔
	All	= 4;	--全部
};



_G.FestivalCareEvent = { --活动关注的事件中心事件
	["EventChargeRecord"] = 1;	--充值
	["EventVipLastTime"] = 1;	--vip
	["EventBournUp"] = 1;	--实战
	["EventMountUpGrade"] = 1;	--坐骑
	["EventUpSword"] = 1;	--名剑
	["EventUpgradeAmulet"] = 1;	--宝甲
}


_G.FestivalMainConfig = {}--活动配置






