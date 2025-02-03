--圣火令系统配置文件

--槽位表
_G.ShengHuoLingSlotConfig =
{
	--槽位id
	[1] =
	{
	    LightImage = "img://gn_shl_yanxin_l.png";
		GrayImage =	"img://gn_shl_yanxin_h.png";
		name = "<p><font color='#FFFF00'>【焰心】</p>", 
		--槽位等级 = {属性， 消耗圣火令道具数量， 强化消耗道具数量,强化 消耗银币数量}

		[-1] = {attr = {dwAttack = 0,}, cardCount = 1, itemCount = 0, silver = 0,},
		[0] = {attr = {dwAttack = 150,dwMPMax = 35,}, cardCount = 1, itemCount = 0, silver = 0,},
		[1] = {attr = {dwAttack = 210,dwMPMax = 41,}, cardCount = 0, itemCount = 10, silver = 150000,},
		[2] = {attr = {dwAttack = 285,dwMPMax = 48,}, cardCount = 0, itemCount = 20, silver = 200000,},
		[3] = {attr = {dwAttack = 375,dwMPMax = 57,}, cardCount = 0, itemCount = 35, silver = 300000,},
		[4] = {attr = {dwAttack = 495,dwMPMax = 69,}, cardCount = 0, itemCount = 55, silver = 400000,},
		[5] = {attr = {dwAttack = 645,dwMPMax = 84,}, cardCount = 0, itemCount = 85, silver = 500000,},
		[6] = {attr = {dwAttack = 825,dwMPMax = 102,}, cardCount = 0, itemCount = 125, silver = 700000,},
		[7] = {attr = {dwAttack = 1050,dwMPMax = 125,}, cardCount = 0, itemCount = 180, silver = 900000,},
		[8] = {attr = {dwAttack = 1320,dwMPMax = 152,}, cardCount = 0, itemCount = 225, silver = 1200000,},
		[9] = {attr = {dwAttack = 1650,dwMPMax = 185,}, cardCount = 0, itemCount = 275, silver = 1500000,},
		[10] = {attr = {dwAttack = 2085,dwMPMax = 228,}, cardCount = 0, itemCount = 330, silver = 2000000,},
	};
	[2] =
	{
	    LightImage = "img://gn_shl_yanshen_l.png";
		GrayImage =	"img://gn_shl_yanshen_h.png";
		name = "<p><font color='#FFFF00'>【炎身】</p>",
		[-1] = {attr = {dwMPMax = 0,dwHPMax = 0,}, cardCount = 3, itemCount = 0, silver = 0,},
		[0] = {attr = {dwMPMax = 35,dwHPMax = 1050,}, cardCount = 3, itemCount = 0, silver = 0,},
		[1] = {attr = {dwMPMax = 41,dwHPMax = 1470,}, cardCount = 0, itemCount = 10, silver = 150000,},
		[2] = {attr = {dwMPMax = 48,dwHPMax = 1995,}, cardCount = 0, itemCount = 20, silver = 200000,},
		[3] = {attr = {dwMPMax = 57,dwHPMax = 2625,}, cardCount = 0, itemCount = 35, silver = 300000,},
		[4] = {attr = {dwMPMax = 69,dwHPMax = 3465,}, cardCount = 0, itemCount = 55, silver = 400000,},
		[5] = {attr = {dwMPMax = 84,dwHPMax = 4515,}, cardCount = 0, itemCount = 85, silver = 500000,},
		[6] = {attr = {dwMPMax = 102,dwHPMax = 5775,}, cardCount = 0, itemCount = 125, silver = 700000,},
		[7] = {attr = {dwMPMax = 125,dwHPMax = 7350,}, cardCount = 0, itemCount = 180, silver = 900000,},
		[8] = {attr = {dwMPMax = 152,dwHPMax = 9240,}, cardCount = 0, itemCount = 225, silver = 1200000,},
		[9] = {attr = {dwMPMax = 185,dwHPMax = 11550,}, cardCount = 0, itemCount = 275, silver = 1500000,},
		[10] = {attr = {dwMPMax = 228,dwHPMax = 14595,}, cardCount = 0, itemCount = 330, silver = 2000000,},
	};
	[3] =
	{
	    LightImage = "img://gn_shl_laowen_l.png";
		GrayImage =	"img://gn_shl_laowen_h.png";
		name = "<p><font color='#FFFF00'>【烙纹】</p>",
		[-1] = {attr = {dwHPMax = 0,dwDefense = 0,}, cardCount = 6, itemCount = 0, silver = 0,},
		[0] = {attr = {dwHPMax = 1050,dwDefense = 95,}, cardCount = 6, itemCount = 0, silver = 0,},
		[1] = {attr = {dwHPMax = 1470,dwDefense = 125,}, cardCount = 0, itemCount = 10, silver = 150000,},
		[2] = {attr = {dwHPMax = 1995,dwDefense = 162,}, cardCount = 0, itemCount = 20, silver = 200000,},
		[3] = {attr = {dwHPMax = 2625,dwDefense = 207,}, cardCount = 0, itemCount = 35, silver = 300000,},
		[4] = {attr = {dwHPMax = 3465,dwDefense = 267,}, cardCount = 0, itemCount = 55, silver = 400000,},
		[5] = {attr = {dwHPMax = 4515,dwDefense = 342,}, cardCount = 0, itemCount = 85, silver = 500000,},
		[6] = {attr = {dwHPMax = 5775,dwDefense = 432,}, cardCount = 0, itemCount = 125, silver = 700000,},
		[7] = {attr = {dwHPMax = 7350,dwDefense = 545,}, cardCount = 0, itemCount = 180, silver = 900000,},
		[8] = {attr = {dwHPMax = 9240,dwDefense = 680,}, cardCount = 0, itemCount = 225, silver = 1200000,},
		[9] = {attr = {dwHPMax = 11550,dwDefense = 845,}, cardCount = 0, itemCount = 275, silver = 1500000,},
		[10] = {attr = {dwHPMax = 14595,dwDefense = 1062,}, cardCount = 0, itemCount = 330, silver = 2000000,},
	};
	[4] =
	{
	    LightImage = "img://gn_shl_chiding_l.png";
		GrayImage =	"img://gn_shl_chiding_h.png";
		name = "<p><font color='#FFFF00'>【炽顶】</p>",
		[-1] = {attr = {dwDefense = 0,dwAttack = 0, dwHPMax = 0,}, cardCount = 10, itemCount = 0, silver = 0,},
		[0] = {attr = {dwDefense = 95,dwAttack = 150, dwHPMax = 1050,}, cardCount = 10, itemCount = 0, silver = 0,},
		[1] = {attr = {dwDefense = 125,dwAttack = 210, dwHPMax = 1470,}, cardCount = 0, itemCount = 10, silver = 150000,},
		[2] = {attr = {dwDefense = 162,dwAttack = 285, dwHPMax = 1995,}, cardCount = 0, itemCount = 20, silver = 200000,},
		[3] = {attr = {dwDefense = 207,dwAttack = 375, dwHPMax = 2625,}, cardCount = 0, itemCount = 35, silver = 300000,},
		[4] = {attr = {dwDefense = 267,dwAttack = 495, dwHPMax = 3465,}, cardCount = 0, itemCount = 55, silver = 400000,},
		[5] = {attr = {dwDefense = 342,dwAttack = 645, dwHPMax = 4515,}, cardCount = 0, itemCount = 85, silver = 500000,},
		[6] = {attr = {dwDefense = 432,dwAttack = 825, dwHPMax = 5775,}, cardCount = 0, itemCount = 125, silver = 700000,},
		[7] = {attr = {dwDefense = 545,dwAttack = 1050, dwHPMax = 7350,}, cardCount = 0, itemCount = 180, silver = 900000,},
		[8] = {attr = {dwDefense = 680,dwAttack = 1320, dwHPMax = 9240,}, cardCount = 0, itemCount = 225, silver = 1200000,},
		[9] = {attr = {dwDefense = 845,dwAttack = 1650, dwHPMax = 11550,}, cardCount = 0, itemCount = 275, silver = 1500000,},
		[10] = {attr = {dwDefense = 1062,dwAttack = 2085, dwHPMax = 14595,}, cardCount = 0, itemCount = 330, silver = 2000000,},
	};
	[5] =
	{
	    LightImage = "img://gn_shl_mingzuo_l.png";
		GrayImage =	"img://gn_shl_mingzuo_h.png";
		name = "<p><font color='#FFFF00'>【明座】</p>",
		[-1] = {attr = {dwDefense = 0, dwMPMax = 0,dwAttack = 0,}, cardCount = 15, itemCount = 0, silver = 0,},
		[0] = {attr = {dwDefense = 95, dwMPMax = 35,dwAttack = 150,}, cardCount = 15, itemCount = 0, silver = 0,},
		[1] = {attr = {dwDefense = 125, dwMPMax = 41,dwAttack = 210,}, cardCount = 0, itemCount = 10, silver = 150000,},
		[2] = {attr = {dwDefense = 162, dwMPMax = 48,dwAttack = 285,}, cardCount = 0, itemCount = 20, silver = 200000,},
		[3] = {attr = {dwDefense = 207, dwMPMax = 57,dwAttack = 375,}, cardCount = 0, itemCount = 35, silver = 300000,},
		[4] = {attr = {dwDefense = 267, dwMPMax = 69,dwAttack = 495,}, cardCount = 0, itemCount = 55, silver = 400000,},
		[5] = {attr = {dwDefense = 342, dwMPMax = 84,dwAttack = 645,}, cardCount = 0, itemCount = 85, silver = 500000,},
		[6] = {attr = {dwDefense = 432, dwMPMax = 102,dwAttack = 825,}, cardCount = 0, itemCount = 125, silver = 700000,},
		[7] = {attr = {dwDefense = 545, dwMPMax = 125,dwAttack = 1050,}, cardCount = 0, itemCount = 180, silver = 900000,},
		[8] = {attr = {dwDefense = 680, dwMPMax = 152,dwAttack = 1320,}, cardCount = 0, itemCount = 225, silver = 1200000,},
		[9] = {attr = {dwDefense = 845, dwMPMax = 185,dwAttack = 1650,}, cardCount = 0, itemCount = 275, silver = 1500000,},
		[10] = {attr = {dwDefense = 1062, dwMPMax = 228,dwAttack = 2085,}, cardCount = 0, itemCount = 330, silver = 2000000,},
	};
	[6] =
	{
	    LightImage = "img://gn_shl_baobing_l.png";
		GrayImage =	"img://gn_shl_baobing_h.png";
		name = "<p><font color='#FFFF00'>【宝柄】</p>",
		[-1] = {attr = {dwAttack = 0, dwHPMax = 0,dwDefense = 0, dwMPMax = 0,}, cardCount = 20, itemCount = 0, silver = 0,},
		[0] = {attr = {dwAttack = 150, dwHPMax = 1050,dwDefense = 95, dwMPMax = 35,}, cardCount = 20, itemCount = 0, silver = 0,},
		[1] = {attr = {dwAttack = 210, dwHPMax = 1470,dwDefense = 125, dwMPMax = 41,}, cardCount = 0, itemCount = 10, silver = 150000,},
		[2] = {attr = {dwAttack = 285, dwHPMax = 1995,dwDefense = 162, dwMPMax = 48,}, cardCount = 0, itemCount = 20, silver = 200000,},
		[3] = {attr = {dwAttack = 375, dwHPMax = 2625,dwDefense = 207, dwMPMax = 57,}, cardCount = 0, itemCount = 35, silver = 300000,},
		[4] = {attr = {dwAttack = 495, dwHPMax = 3465,dwDefense = 267, dwMPMax = 69,}, cardCount = 0, itemCount = 55, silver = 400000,},
		[5] = {attr = {dwAttack = 645, dwHPMax = 4515,dwDefense = 342, dwMPMax = 84,}, cardCount = 0, itemCount = 85, silver = 500000,},
		[6] = {attr = {dwAttack = 825, dwHPMax = 5775,dwDefense = 432, dwMPMax = 102,}, cardCount = 0, itemCount = 125, silver = 700000,},
		[7] = {attr = {dwAttack = 1050, dwHPMax = 7350,dwDefense = 545, dwMPMax = 125,}, cardCount = 0, itemCount = 180, silver = 900000,},
		[8] = {attr = {dwAttack = 1320, dwHPMax = 9240,dwDefense = 680, dwMPMax = 152,}, cardCount = 0, itemCount = 225, silver = 1200000,},
		[9] = {attr = {dwAttack = 1650, dwHPMax = 11550,dwDefense = 845, dwMPMax = 185,}, cardCount = 0, itemCount = 275, silver = 1500000,},
		[10] = {attr = {dwAttack = 2085, dwHPMax = 14595,dwDefense = 1062, dwMPMax = 228,}, cardCount = 0, itemCount = 330, silver = 2000000,},
	};
}


_G.ShengHuoLingConfig =
{
	--最大套装等级
	MaxSuitLevel = 10;

	--套装广播表
	BoardcastLevel = {0, 8, 9, 10};
		--Icon_item_4900111_0 灰色图标 -- Icon_item_4900111_1 彩色图标
	EnterImg = {"img://Icon_item_4900111_0.png","img://Icon_item_4900111_1.png"};
	[1] =
	{
		PageImage = "img://gn_shl_yihui.png";
		name = "【圣火·熠辉】",
		setSlot = {1,2,3,4,5,6};
		cardId = 4100500;--镶嵌材料  圣火令
		itemId = 4100453; --强化道具  淬
		label = "<p>激活后可获得属性加成</p>";
		activit = "<p>镶嵌所需圣火令：%s/%s个</p>";
		--Img   = "img://-1.png";
		--套装属性
		suitAttr =
		{
			[0] = {dwCrit = 135,},
			[1] = {dwCrit = 280,},
			[2] = {dwCrit = 440,},
			[3] = {dwCrit = 615,},
			[4] = {dwCrit = 797,},
			[5] = {dwCrit = 987,},
			[6] = {dwCrit = 1185,},
			[7] = {dwCrit = 1405,},
			[8] = {dwCrit = 1626,},
			[9] = {dwCrit = 1851,},
			[10] = {dwCrit = 2087,},
		};
	};
	[2] =
	{
		PageImage = "img://gn_shl_liuyan.png";
		name = "【圣火·流焰】",
		setSlot = {1,2,3,4,5,6};
		cardId = 4100500;
		itemId = 4100453;
		label = "<p>激活后可获得属性加成</p>";
		activit = "<p>镶嵌所需圣火令：%s/%s个</p>";
		--Img   = "img://-2.png";
		--套装属性
		suitAttr =
		{
			[0] = {dwPoJiaValue = 103,},
			[1] = {dwPoJiaValue = 208,},
			[2] = {dwPoJiaValue = 314,},
			[3] = {dwPoJiaValue = 421,},
			[4] = {dwPoJiaValue = 529,},
			[5] = {dwPoJiaValue = 638,},
			[6] = {dwPoJiaValue = 748,},
			[7] = {dwPoJiaValue = 860,},
			[8] = {dwPoJiaValue = 972,},
			[9] = {dwPoJiaValue = 1085,},
			[10] = {dwPoJiaValue = 1198,},
		};
	};
	[3] =
	{
		PageImage =	"img://gn_shl_zhuoke.png";
		name = "【圣火·灼刻】",
		setSlot = {1,2,3,4,5,6};
		cardId = 4100500;
		itemId = 4100453;
		label = "<p>激活后可获得属性加成</p>";
		activit = "<p>镶嵌所需圣火令：%s/%s个</p>";
		--Img   = "img://-3.png";
		--套装属性
		suitAttr =
		{
			[0] = {dwAttack = 350,},
			[1] = {dwAttack = 800,},
			[2] = {dwAttack = 1400,},
			[3] = {dwAttack = 2150,},
			[4] = {dwAttack = 2975,},
			[5] = {dwAttack = 3875,},
			[6] = {dwAttack = 4850,},
			[7] = {dwAttack = 6050,},
			[8] = {dwAttack = 7265,},
			[9] = {dwAttack = 8510,},
			[10] = {dwAttack = 9875,},
		};
	};
	[4] =
	{
		PageImage =	"img://gn_shl_fengcheng.png";
		name = "【圣火·焚城】",
		setSlot = {1,2,3,4,5,6};
		cardId = 4100500;
		itemId = 4100453;
		label = "<p>激活后可获得属性加成</p>";
		activit = "<p>镶嵌所需圣火令：%s/%s个</p>";
		--Img   = "img://-4.png";
		--套装属性
		suitAttr =
		{
			[0] = {dwDefense = 175,},
			[1] = {dwDefense = 400,},
			[2] = {dwDefense = 700,},
			[3] = {dwDefense = 1075,},
			[4] = {dwDefense = 1487,},
			[5] = {dwDefense = 1937,},
			[6] = {dwDefense = 2425,},
			[7] = {dwDefense = 3025,},
			[8] = {dwDefense = 3632,},
			[9] = {dwDefense = 4255,},
			[10] = {dwDefense = 4937,},
		};
	};
	[5] =
	{
		PageImage =	"img://gn_shl_liaoyuan.png";
		name = "【圣火·燎原】",
		setSlot = {1,2,3,4,5,6};
		cardId = 4100500;
		itemId = 4100453;
		label = "<p>激活后可获得属性加成</p>";
		activit = "<p>镶嵌所需圣火令：%s/%s个</p>";
		--Img   = "img://-5.png";
		--套装属性
		suitAttr =
		{
			[0] = {dwPoJiaDiKang = 145,},
			[1] = {dwPoJiaDiKang = 290,},
			[2] = {dwPoJiaDiKang = 450,},
			[3] = {dwPoJiaDiKang = 625,},
			[4] = {dwPoJiaDiKang = 807,},
			[5] = {dwPoJiaDiKang = 997,},
			[6] = {dwPoJiaDiKang = 1195,},
			[7] = {dwPoJiaDiKang = 1415,},
			[8] = {dwPoJiaDiKang = 1636,},
			[9] = {dwPoJiaDiKang = 1861,},
			[10] = {dwPoJiaDiKang = 2097,},
		};
	};
	[6] =
	{
		PageImage =	"img://gn_shl_zhutian.png";
		name = "【圣火·烛天】",
		setSlot = {1,2,3,4,5,6};
		cardId = 4100500;
		itemId = 4100453;
		label = "<p>激活后可获得属性加成</p>";
		activit = "<p>镶嵌所需圣火令：%s/%s个</p>";
		--Img   = "img://-6.png";
		--套装属性
		suitAttr =
		{
			[0] = {dwCritDown = 135,},
			[1] = {dwCritDown = 280,},
			[2] = {dwCritDown = 440,},
			[3] = {dwCritDown = 615,},
			[4] = {dwCritDown = 797,},
			[5] = {dwCritDown = 987,},
			[6] = {dwCritDown = 1185,},
			[7] = {dwCritDown = 1405,},
			[8] = {dwCritDown = 1626,},
			[9] = {dwCritDown = 1851,},
			[10] = {dwCritDown = 2087,},
		};
	};

	--检查套装等级
	GetSuitLevel = function(setState, dwGroupIndex)
		--统计套装等级
		if not setState[dwGroupIndex] then
			--_err("ShengHuoLingConfig.GetSuitLevel cant get setState[dwGroupIndex]", dwGroupIndex);
			return ;
		end
		local suitLevel = ShengHuoLingConfig.MaxSuitLevel;
		for k, v in pairs(setState[dwGroupIndex]) do
			if v < suitLevel then
				suitLevel = v;
			end
		end
		return suitLevel;
	end;

	--得到单个槽位的属性  dwGroupIndex金木    dwSlotIndex曹魏
	GetSlotAttr = function(setState, dwGroupIndex, dwSlotIndex)
		local tempAttrInfo = SSingleAttrChange:new();

		local dwLevel = setState[dwGroupIndex][dwSlotIndex];
		if not dwLevel then
			--_err("ShengHuoLingConfig.GetSlotAttr cant get dwLevel", dwGroupIndex, dwSlotIndex)
			return tempAttrInfo;
		end

		--未镶嵌
		if dwLevel == -1 then
			return tempAttrInfo;
		end

		local dwSlot = ShengHuoLingConfig[dwGroupIndex].setSlot[dwSlotIndex];
		local attrCfg = ShengHuoLingSlotConfig[dwSlot][dwLevel].attr;
		if not attrCfg then
			--_err("ShengHuoLingConfig.GetSlotAttr cant get attrCfg", dwSlot, dwLevel);
			return tempAttrInfo;
		end

		for attrType, attrValue in pairs(attrCfg) do
			if tempAttrInfo[attrType] then
				tempAttrInfo[attrType] = tempAttrInfo[attrType] + attrValue;
			end
		end

		return tempAttrInfo;
	end;

	--得到一组的属性      dwGroupIndex金木
	GetGroupAttr = function(setState, dwGroupIndex)
		local tempAttrInfo = SSingleAttrChange:new();

		if not setState[dwGroupIndex] then
			-- _err("ShengHuoLingConfig.GetGroupAttr cant get setState[dwGroupIndex]", dwGroupIndex);
			return tempAttrInfo;
		end

		for k, v in pairs(setState[dwGroupIndex]) do
			ShengHuoLingConfig.GetSlotAttr(setState, dwGroupIndex, k):CountAttrValue(tempAttrInfo);
		end

		return tempAttrInfo;
	end;

	--得到套装属性
	GetSuitAttr = function(setState, dwGroupIndex, bIsClient)
		local tempAttrInfo = SSingleAttrChange:new();

		--统计套装等级
		local suitLevel = ShengHuoLingConfig.GetSuitLevel(setState, dwGroupIndex)
		if bIsClient then
			suitLevel = suitLevel + 1;
		end
		
		if not suitLevel then
			return tempAttrInfo;
		end

		--没有套装属性
		if suitLevel == -1 then
			return tempAttrInfo;
		end

		local suitAttrCfg = ShengHuoLingConfig[dwGroupIndex].suitAttr[suitLevel];
		if not suitAttrCfg then
			-- _err("ShengHuoLingConfig.GetSuitAttr cant get suitAttrCfg", dwGroupIndex, suitLevel);
			return tempAttrInfo;
		end

		for attrType, attrValue in pairs(suitAttrCfg) do
			if tempAttrInfo[attrType] then
				tempAttrInfo[attrType] = tempAttrInfo[attrType] + attrValue;
			end
		end

		return tempAttrInfo;
	end;
	
	--
	
	--得到所有的属性
	GetAllAttr = function(setState)
		local tempAttrInfo = SSingleAttrChange:new();

		for groupIndex, tabState in pairs(setState) do
			ShengHuoLingConfig.GetGroupAttr(setState, groupIndex):CountAttrValue(tempAttrInfo);
			ShengHuoLingConfig.GetSuitAttr(setState, groupIndex):CountAttrValue(tempAttrInfo);
		end

		return tempAttrInfo;
	end;
}

_G.ShengConfig = {
	
	Shunxu1 = {"dwAttack";"dwDefense";"dwMPMax";"dwHPMax";}; --基本属性加成
	Shunxu2 = {"dwAttack";"dwDefense";"dwCrit";"dwPoJiaValue";"dwPoJiaDiKang";"dwCritDown";}; --套装属性
	Shunxu3 = {"dwAttack";"dwDefense";"dwHPMax";"dwMPMax";"dwCrit";"dwPoJiaValue";"dwPoJiaDiKang";"dwCritDown";}; --总属性
	Shuxing =  {
			dwAttack 	= "攻击 + %s";
			dwDefense 	= "防御 + %s";
			dwMPMax     = "内力 + %s";
			dwHPMax     = "生命 + %s";
			dwFlee 		= "身法 + %s";
			dwCrit 		= "暴击 + %s";
			dwCritDown  = "暴击抵抗 + %s";
			dwPoJiaValue = "破甲攻击 + %s";
			dwPoJiaDiKang = "伤害抵御 + %s";
			dwCritDown = "暴击抵抗 + %s";
		};
	--强化满了的tips
	NewInfo = "<font color='#4daeed'>当前属性加成";
	NewlevelConfig = "<font color='#FFFFFF'>当前强化等级: %s/%s";
	FulllevelConfig = "当前等级已满";

    ShongHuoLingInfo="img://fengyunyaopao_zhong_1_1.png";
	--ItemImage = ;--分页签图片
	--ItemButtonImage =; --圣火令按钮图片
    ShengExplain = "1、镶嵌消耗圣火令，强化消耗淬炎晶和银两，等级越高消耗越多。<br/>2、当前分页圣火令全部镶嵌成功后可激活套装属性。<br/>3、每个圣火令的套装属性各不相同。<br/>4、当前分页圣火令全部强化等级提高可以增加套装属性。";  --说明
    BtnTips = "<p><font color='#FFFFFF'>点击按钮激活当前属性</p>";

	--强化tips
	NewLevel = "<font color='#FFFFFF'>当前强化等级 :%s";
	QiangConsumeMoney =	"<font color='#FFFFFF'>强化消耗银两 : %s";
	QiangConsumeYan = "<font color='#FFFFFF'>强化消耗淬炎晶 :%s";
	QiangInfo = "<font color='#4daeed'>强化后可获得属性加成:";
    QiangNow = "<font color='#4daeed'>当前属性加成:";           


	--镶嵌tips
	XiangNeed = "<font color='#FFFFFF'>镶嵌所需圣火令 ：%s"; --白色
	JIhuoInfo = "<font color='#4daeed'>激活后可获得属性加成";
	


	IsEnough = "<font color='#FFFFFF'>%s/%s</font>";--物品充足   白色
	IsNoEnough = "<font color='#FF0000'>%s/%s</font>";	--物品不足  --红色

	MoneyIsNoEnough = "<font color='#FF0000'>%s</font>";   --金钱不足
	MoneyIsEnough = "<font color='#FFFFFF'>%s</font>";   --金钱充足

	NoticeXiangContinue = "镶嵌需要消耗%s个圣火令";
	NoticeQiangContinue = "强化需要消耗%s个淬炎晶、%s银两";
	Fulllevel = "大侠已成功强化至满级";
	
	NoViewMassge = "圣火令尚未开放，需人物达到30级。";
	YesViewMassge = "点击圣火令按钮，打开圣火令界面"; --打开界面接口

	MassgeOne = "恭贺%s大侠成功激活%s，百尺竿头，更进一步！";
    MassgeTwo = " 恭贺%s大侠成功将%s强化至%s，请再接再厉！";
    MassgeThere = "恭贺%s大侠成功将%s强化至满级，号令天下，莫敢不从!";

    ButtonLabel1 = "镶嵌";
	ButtonLabel2 = "强化";
	
	

	


};


-- function ShengConfig:setText(i)
 -- local str = "";
 -- for k,v in pairs(ShengConfig.Shuxing) do
 -- str = str..string.format("<p>%s+%s</p>",ShengConfig.Shuxing[k],1000);
 -- end
 -- str = str..
 -- return str;
 -- end


 -- function ShengConfig:Getnumber(caoID)
 -- local nAttack = 0;
 -- local nDefense = 0;
 -- local nHPMax = 0;
-- for i=0,#ShengHuoLingSlotConfig.caoID 10 do
		-- nAttack =nAttack + i.attr.dwAttack  ;
		-- nDefense = nDefense +i.attr.dwDefense;
		-- nHPMax = nHPMax + i.attr.dwHPMax ;
-- end
-- end


