--[[
	--聚灵珠系统相关配置
	--
	--时间：2013-11-21
--]]

--获取奖励物品列表类型
_G.GetCollectAwardType = {
	fillType = 1, -->注灵
	gainsType = 2, -->收获
};

--奖励物品类型配置
_G.CollectAwardType = {
	Exp = 1, -->经验
	Money = 2, -->银两
	Pneuma = 3, -->真气
	Cash = 4, -->礼金
	Item = 5, -->物品
	FenyYunValue = 6, ---->风云声望 
	
	
	--奖励类型对应图标
	RewardIcon = {
		[1] = {
			szIcon = "Qita_exp.png";
			szDes = "经验:%d";
			szMyriad = "%s万";
			szNormal = "%s";
		};
		[2] = {
			szIcon = "Qita_money.png";
			szDes = "金钱:%d";
			szMyriad = "%s万";
			szNormal = "%s";
		};
		[3] = {
			szIcon = "Qita_zhenqi.png";
			szDes = "真气:%d";
			szMyriad = "%s万";
			szNormal = "%s";
		};
		[4] = {
			szIcon = "Qita_lijin.png";
			szDes = "礼金:%d";
			szMyriad = "%s万";
			szNormal = "%s";
		};
		[6] = {
			szIcon = "Qita_shengwang.png";
			szDes = "风云声望:%d";
			szMyriad = "%s万";
			szNormal = "%s";
		};
	};
};

--灵珠类型配置
_G.PearlType = {
	pearl_1 = 1,
	pearl_2 = 2,
	pearl_3 = 3,
};
local money = {1000000,5000000,10000000};
local fysw = {5000,10000,20000};
local open = {500,2500,8000};
local open2 = {50,250,800};
--聚灵珠配置
_G.CollectJewelConfig = {
	--系统自动增加进度
	SysOpenTime = "24:00",
	--刷新时间
	ResetTime = "24:00";
	--系统开启自动增加聚灵进度值
	SysAddProcess = 10; -->增加百分比
	--最大注灵次数
	maxFillCount = 100;
	
	--灵珠
	pearl = {
		[1] = {
			name = "白虎灵珠",
			maxFillCount = 1,
			maxFillValue = 100,
		},
		[2] = {
			name = "朱雀灵珠",
			maxFillCount = 1,
			maxFillValue = 100,
		},
		[3] = {
			name = "青龙灵珠",
			maxFillCount = 1,
			maxFillValue = 100,
		},
	};
	
	--奖励物品信息
	awardItem = {
		--注灵奖励
		--[1]:奖励类型，[2]:物品id/其他为增加值，[3]:消耗物品数量/非物品没有此项,[4]:物品是否为绑定
		-- 1 经验  2 银两 3 真气 4 礼金 5物品  6 风云声望
		[1] = {
			[1] = {
				[1] = {5,5809700,1,1},
				[2] = {5,4100422,1,1},
				[3] = {5,3900040,1,1},
			},
			[2] = {
				[1] = {5,5809580,1,1},
				[2] = {5,4100423,1,1},
				[3] = {5,3900050,1,1},
			},
			[3] = {
				[1] = {5,5809580,2,1},
				[2] = {5,4100424,1,1},
				[3] = {5,3900060,1,1},
			},
		};
		--收获奖励
		[2] = {
			[1] = {
				[1] = {5,9701002,1,1,},
				[2] = {5,9701003,1,1,},
				[3] = {5,5920004,1,1,},
				[4] = {5,6300545,1,1,},
			},
			[2] = {
				[1] = {5,9701004,1,1,},
				[2] = {5,9701005,1,1,},
				[3] = {5,5920005,1,1,},
				[4] = {5,6300546,1,1,},
			},
			[3] = {
				[1] = {5,9701006,1,1,},
				[2] = {5,9701007,1,1,},
				[3] = {5,9701008,1,1,},
				[4] = {5,5920006,1,1,},
				[5] = {5,6300547,1,1,},
			},
		};
	};
	--
	AddCanUseTotalNum = {
		[1326540] = 10, ---[1326540] 物品ID，10 增加的使用次数
	};
	--增加注灵次数
	--[灵珠类型] = {[物品枚举Id] = 增加注灵次数}
	AddCanUseNum = {
		[1] = {
			[135423] = 2,
		};
		[2] = {
			[1124123] = 2,
		};
		[3] = {
			[12341234] = 2,
		};
	};
	
	--根据灵珠类型获取灵珠信息
	--dwType:灵珠类型(与PearlType中类型对应)
	GetPearlInfo = function(dwType)
		if not dwType then return; end
		local tInfo = {};
		for k,v in pairs(CollectJewelConfig.pearl[dwType]) do
			tInfo[k] = v;
		end
		return tInfo
	end;
	
	--根据单个物品信息表返回(奖励物品类型,奖励的物品id/增加数量,如果是物品返回物品数量)
	--itemInfo:奖励物品信息（单个）
	GetItemInfoPer = function(itemInfo)
		if not itemInfo then return; end
		if itemInfo[1] == 5 and itemInfo[3] then
			return itemInfo[1],itemInfo[2],itemInfo[3],itemInfo[4];
		else
			return itemInfo[1],itemInfo[2];
		end
	end;
	
	--获取奖励物品信息
	--dwAwardTy:奖励物品列表类型（对应_G.GetCollectAwardType中的类型）,dwType:灵珠类型,playerLv:玩家等级
	--return:返回选择奖励物品表（奖励物品不存在返回空表）
	GetAwardItemInfo = function(dwAwardTy,dwType,playerLv)
		if not dwAwardTy or not dwType or not playerLv then return; end
		local info = {};
		local getAwardInfo = {};
		local awardItem = _G.CollectJewelConfig.awardItem;
		if not awardItem[dwAwardTy] or not awardItem[dwAwardTy][dwType] then return getAwardInfo; end
		info = awardItem[dwAwardTy][dwType];
		for index,awardInfo in ipairs(info) do
			getAwardInfo[index] = {};
			for key,value in ipairs(awardInfo) do
				getAwardInfo[index][key] = value;
			end
		end
		
		for index,awardInfo in ipairs(getAwardInfo) do
			for key,value in ipairs(awardInfo) do
				if key == 1 and value ~= 5 then
					local addValue = 0;
					if value == 1 then
						addValue = _G.CollectJewelConfig.GetAwardExp(dwAwardTy,dwType,playerLv);
					elseif value == 2 then
						addValue = _G.CollectJewelConfig.GetAwardMoney(dwAwardTy,dwType,playerLv);
					elseif value == 3 then
						addValue = _G.CollectJewelConfig.GetAwardPneuma(dwAwardTy,dwType,playerLv);
					elseif value == 4 then
						addValue = _G.CollectJewelConfig.GetAwardCash(dwAwardTy,dwType,playerLv);
					elseif value == 6 then
						addValue = _G.CollectJewelConfig.GetFengYunValue(dwAwardTy,dwType,playerLv);
					end
					getAwardInfo[index][2] = addValue;
				end
			end
		end

		return getAwardInfo;
	end;

	--获取收获奖励时增加经验值
	--dwAwardTy:奖励物品列表类型（对应_G.GetCollectAwardType中的类型）,dwType:灵珠类型,playerLv:玩家等级
	GetAwardExp = function(dwAwardTy,dwType,playerLv)
		local value = 10;
		return value;
	end;
	
	--获取收获奖励时增加金钱值
	--dwAwardTy:奖励物品列表类型（对应_G.GetCollectAwardType中的类型）,dwType:灵珠类型,playerLv:玩家等级
	GetAwardMoney = function(dwAwardTy,dwType,playerLv)
		local value = 0;
		value = money[dwType]
		return value;
	end;
	
	--获取收获奖励时增加真气值
	--dwAwardTy:奖励物品列表类型（对应_G.GetCollectAwardType中的类型）,dwType:灵珠类型,playerLv:玩家等级
	GetAwardPneuma = function(dwAwardTy,dwType,playerLv)
		local value = 100000;
		return value;
	end;
	
	--获取收获奖励时增加礼金值
	--dwAwardTy:奖励物品列表类型（对应_G.GetCollectAwardType中的类型）,dwType:灵珠类型,playerLv:玩家等级
	GetAwardCash = function(dwAwardTy,dwType,playerLv)
		local value = 10;
		return value;
	end;
	--获取收获奖励时增加风云声望值
	--dwAwardTy:奖励物品列表类型（对应_G.GetCollectAwardType中的类型）,dwType:灵珠类型,playerLv:玩家等级
	GetFengYunValue = function(dwAwardTy,dwType,playerLv)
		local value = 0;
		value = fysw[dwType]
		return value;
	end;
	--获取开始聚灵花费的元宝数
	--dwType:灵珠类型,dwCount:点击聚灵次数
	GetBeginGainsCost = function(dwType,dwCount)
		-- if not dwType or not dwCount then return 0; end
		local value = 0;
		print("===========dwType=========",dwType)
		value = open[dwType]
		return value;
	end;
	
	--获取注灵花费的元宝数
	--dwType:灵珠类型,dwCount:点击注灵次数
	GetFillCost = function(dwType,dwCount)
		-- if not dwType or not dwCount then return 0; end
		local value = 0;
		value = open2[dwType]
		return value;
	end;
	
	--获取每次注灵增加进度百分比
	--dwType:灵珠类型,dwCount:点击注灵次数
	GetAddProcess = function(dwType,dwCount)
		local value = 10;
		return value;
	end;
	
	--获取获取奖励时是否广播
	--dwType:灵珠类型,dwCount:点击注灵次数
	GetIsBroadcast = function(dwType,dwCount)
		local isBroadcast = true;
		return isBroadcast;
	end;
	
	--获取使用物品增加总的可使用注灵次数
	GetAddCanUseTotalNum = function(itemId)
		local addnum =_G.CollectJewelConfig.AddCanUseTotalNum[itemId];
		return addnum;
	end;
	
	--获取使用物品增加可使用注灵次数
	GetAddCanUseNum = function(itemId,dwType)
		local addnum =_G.CollectJewelConfig.AddCanUseNum[dwType][itemId];
		return addnum;
	end;
	
	--根据类型返回对应的颜色值（非物品）
	--itemType:物品类型
	Getcolor = function(itemType)
		return "#00FF00";
	end;
	
	SetMaiInfo = function(AwardInfo,nType)
		local mailMsg = {
			sender = "系统邮件";--发件人
			sender_id = "10086";---运营用的
			lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
			topic = "";
			content = "您的背包已满，聚灵珠注灵获得的奖励通过邮件发送给您，请注意查收";
			gold = 0;
			bindgold = 0;
			money = 0;
			item = 	{};
			--ID 和 数量
			equip = 
			{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

			};
			
		};
		if(nType == 1) then
			mailMsg.topic = "聚灵珠注灵奖励";
		elseif(nType == 2) then
			mailMsg.topic = "聚灵珠收获奖励";
		end
		for i = 1,#AwardInfo do
			if(mailMsg.item[AwardInfo[i].AwardItemID]) then
				mailMsg.item[AwardInfo[i].AwardItemID] = {num = mailMsg.item[AwardInfo[i].AwardItemID].num+1;bind = AwardInfo[i].AwardItemBindType;}
			else
				mailMsg.item[AwardInfo[i].AwardItemID] = {num = AwardInfo[i].AwardItemNum;bind = AwardInfo[i].AwardItemBindType;}
			end
		end
		return mailMsg;
	end;
};

--提示信息
_G.CollectJewelTipsConfig = {
	RewardValue = [[<font color="#FFFFFF">%s</font>]];--数值奖励显示颜色
	GainsExplain = [[<font color="#FFFFFF">聚灵进度达到</font><font color="#de00ff">100%</font><font color="#FFFFFF">可获得下列奖励</font>]]; --收获奖励说明
	FillExplain = [[<font color="#dc911a">每日自动增长10%进度，注灵可加速聚灵进度，并可获得下列奖励</font>]];	--注灵奖励说明
	CollectPro = [[<font color="#00FF00">%s</font>]];	--聚灵进度
	szBroadCastMsg = [[<font %s>%s</font><font >聚灵</font><font color="#00FFFF">%s</font><font >获得超值大奖</font><font color='%s'>%s</font>,<font color='%s'>,%s</font><font color='%s'>,%s</font><font color='%s'>,%s</font><font color='%s'>,%s</font>]]; --广播消息 --("%s聚灵%s获得超值大奖%s,%s,%s,%s,%s")
	szCostGold = "<font color='#dc911a'>是否花费%d元宝开启%s聚灵</font>",
	szNotEnoughtGold = "元宝不足",
	szStarGrains = "<p><font color='#dc911a'>花费%d元宝开启%s聚灵</font></p><p><font color='#FFFFFF'>每日可自动增加</font><font color='#de00ff'>%s</font><font color='#FFFFFF'>进度</font></p>", -->未聚灵
	szGainsing = "<p><font color='#dc911a'>目前进度：</font>%s</p><p><font color='#dc911a'>今日已注灵：</font>%d</p><p><font color='#de00ff'><font color='#ffffff'>剩余</font><font color='#de00ff'>%s</font><font color='#ffffff'>进度可收获丰厚奖励</font></p>", -->正聚灵
	szGrainsed = "<font color='#dc911a'>点击收获按钮可收获奖励</font>", -->聚灵完成
	szFill = "<p><font color='#dc911a'>消耗%d元宝注灵%s</font></p><p>增加进度</font><font color='#de00ff'>%s%%</font>进度</p>",
	szNotFillCost = "<font color='#ff0000'>此灵珠今日注灵次数已达上限</font>",
	szNotCollect = "<font color='#ff0000'>请先点击灵珠开启聚灵，才可注灵</font>",
	szFillFull = "聚灵完成，请点击收获按钮收获奖励",
	szFillBt = "<p><font color='#dc911a'>花费%d元宝注灵%s加速聚灵进度</font></p><p><font color='#dc911a'>此灵珠今日剩余注灵次数：</font>%d</p>",
	szNotCanGains = "<font color='#dc911a'>聚灵进度达到100%才可收获奖励</font>",
	szGainsItem = "灵珠奖励已发放，物品自动放入背包内",
	szEmailSuc = "灵珠奖励已发放，物品奖励请查收邮件",
	szEmailFail = "您的物品栏及邮件已满，请及时清理",
	szNotCount = "<font color='#ff0000'>今日注灵次数已达上限</font>",
	szExplain = "<font color='#ff0000'>每日已开启聚灵的灵珠会自动增加10%进度，进度达到100%点击收获领取奖励</font>",
};
