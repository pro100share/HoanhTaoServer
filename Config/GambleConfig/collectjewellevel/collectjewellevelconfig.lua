--[[
	--聚灵珠系统相关配置
	--
	--时间：2013-12-13
--]]

	local lj = {
		[1] = {[10] = 500,[15] = 100,[20] = 100,[25] = 100,[30] = 100,[35] = 100,[40] = 100,[45] = 100,[50] = 100,[55] = 100,[60] = 200,[65] = 200,[70] = 200,[75] = 200,[80] = 200,[85] = 200,[90] = 300,[95] = 300,[100] = 300,[105] = 300,[110] = 300,};
		[2] = {[10] = 5000,[15] = 1000,[20] = 1000,[25] = 1000,[30] = 1000,[35] = 1000,[40] = 1000,[45] = 1000,[50] = 1000,[55] = 1000,[60] = 2000,[65] = 2000,[70] = 2000,[75] = 2000,[80] = 2000,[85] = 2000,[90] = 3000,[95] = 3000,[100] = 3000,[105] = 3000,[110] = 3000,};
		[3] = {[10] = 25000,[15] = 5000,[20] = 5000,[25] = 5000,[30] = 5000,[35] = 5000,[40] = 5000,[45] = 5000,[50] = 5000,[55] = 5000,[60] = 6000,[65] = 6000,[70] = 6000,[75] = 6000,[80] = 6000,[85] = 6000,[90] = 8000,[95] = 8000,[100] = 8000,[105] = 8000,[110] = 8000,};
	};
	local money = {
		[1] = {[10] = 10000,[15] = 10000,[20] = 10000,[25] = 10000,[30] = 10000,[35] = 10000,[40] = 10000,[45] = 10000,[50] = 10000,[55] = 10000,[60] = 20000,[65] = 20000,[70] = 20000,[75] = 20000,[80] = 20000,[85] = 20000,[90] = 30000,[95] = 30000,[100] = 30000,[105] = 30000,[110] = 30000,};
		[2] = {[10] = 50000,[15] = 50000,[20] = 50000,[25] = 50000,[30] = 50000,[35] = 50000,[40] = 50000,[45] = 50000,[50] = 50000,[55] = 50000,[60] = 60000,[65] = 60000,[70] = 60000,[75] = 60000,[80] = 60000,[85] = 60000,[90] = 80000,[95] = 80000,[100] = 80000,[105] = 80000,[110] = 80000,};
		[3] = {[10] = 100000,[15] = 100000,[20] = 100000,[25] = 100000,[30] = 100000,[35] = 100000,[40] = 100000,[45] = 100000,[50] = 100000,[55] = 100000,[60] = 200000,[65] = 200000,[70] = 200000,[75] = 200000,[80] = 200000,[85] = 200000,[90] = 300000,[95] = 300000,[100] = 300000,[105] = 300000,[110] = 300000,};
	};
	local zhenqi = {
		[1] = {[10] = 500,[15] = 500,[20] = 500,[25] = 500,[30] = 500,[35] = 500,[40] = 500,[45] = 500,[50] = 500,[55] = 500,[60] = 600,[65] = 600,[70] = 600,[75] = 600,[80] = 600,[85] = 600,[90] = 800,[95] = 800,[100] = 800,[105] = 800,[110] = 800,};
		[2] = {[10] = 1000,[15] = 1000,[20] = 1000,[25] = 1000,[30] = 1000,[35] = 1000,[40] = 1000,[45] = 1000,[50] = 1000,[55] = 1000,[60] = 2000,[65] = 2000,[70] = 2000,[75] = 2000,[80] = 2000,[85] = 2000,[90] = 3000,[95] = 3000,[100] = 3000,[105] = 3000,[110] = 3000,};
		[3] = {[10] = 2000,[15] = 2000,[20] = 2000,[25] = 2000,[30] = 2000,[35] = 2000,[40] = 2000,[45] = 2000,[50] = 2000,[55] = 2000,[60] = 3000,[65] = 3000,[70] = 3000,[75] = 3000,[80] = 3000,[85] = 3000,[90] = 5000,[95] = 5000,[100] = 5000,[105] = 5000,[110] = 5000,};
	};
	local hf = {100,1000,5000};-------聚灵珠实际花费
	local zq = {888,8888,29888};-----显示用的 鼠标指向聚灵显示用的
--奖励物品类型配置
_G.CollectLevelAwardType = {
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
			szGrayIcon = "Qita_exp.png";
			szDes = T"经验:%d";
			szMyriad = T"%s万";
			szNormal = "%s";
		};
		[2] = {
			szIcon = "Qita_money.png";
			szGrayIcon = "Qita_money.png";
			szDes = T"金钱:%d";
			szMyriad = T"%s万";
			szNormal = "%s";
		};
		[3] = {
			szIcon = "Qita_zhenqi.png";
			szGrayIcon = "Qita_zhenqi.png";
			szDes = T"真气:%d";
			szMyriad = T"%s万";
			szNormal = "%s";
		};
		[4] = {
			szIcon = "Qita_lijin.png";
			szGrayIcon = "Qita_lijin.png";
			szDes = T"礼金:%d";
			szMyriad = T"%s万";
			szNormal = "%s";
		};
		[6] = {
			szIcon = "Qita_shengwang.png";
			szGrayIcon = "Qita_shengwang.png";
			szDes = T"风云声望:%d";
			szMyriad = T"%s万";
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

--聚灵珠配置
_G.CollectJewelLevelConfig = {
	--灵珠
	pearl = {
		[1] = {
			name = T"白虎灵珠",
			icon = "gn_jlz_bhbt.png", -->分页签图片
			image = "gn_jlz_bhdt.png", -->内容页面图片
		 	---物品奖励
			awardItem = {
				[10] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[15] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[15] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[20] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[25] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[30] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[35] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[40] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[45] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[50] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[55] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[60] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[65] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[70] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[75] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[80] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[85] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[90] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[95] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[100] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[105] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[110] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
			},
		},
		[2] = {
			name = T"朱雀灵珠",
			icon = "gn_jlz_zqbt.png",
			image = "gn_jlz_zqdt.png",
			---物品奖励
			awardItem = {
				[10] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[15] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[15] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[20] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[25] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[30] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[35] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[40] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[45] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[50] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[55] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[60] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[65] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[70] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[75] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[80] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[85] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[90] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[95] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[100] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[105] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[110] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
			},
		},
		[3] = {
			name = T"青龙灵珠",
			icon = "gn_jlz_qlbt.png",
			image = "gn_jlz_qldt.png",
			---物品奖励
			awardItem = {
				[10] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[15] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[15] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[20] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[25] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[30] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[35] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[40] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[45] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[50] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[55] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[60] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[65] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[70] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[75] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[80] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[85] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[90] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[95] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[100] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[105] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
				[110] = {
					[1] = {4,0,}, -->{类型,物品枚举Id,数量,是否绑定}
					[2] = {2,0,},
					[3] = {3,0,},
				},
			},
		},
	};
	--根据灵珠类型获取灵珠信息
	--dwType:灵珠类型(与PearlType中类型对应)
	GetPearlInfo = function(dwType)
		if not dwType then return; end
		local pearl = _G.CollectJewelLevelConfig.pearl;
		if pearl then
			return pearl[dwType];
		end
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
	--dwType:珠子类型（对应_G.PearlType中的类型),dwAwardLv:获取奖励等级,playerLv:玩家等级
	--return:返回选择奖励物品表（奖励物品不存在返回空表）
	GetAwardItemInfo = function(dwType,dwAwardLv,playerLv)
		if not dwType or not playerLv then return; end
		local info = {};
		local getAwardInfo = {};
		local pearlInfo = _G.CollectJewelLevelConfig.GetPearlInfo(dwType);
		local awardItem = pearlInfo.awardItem;
		if not awardItem[dwAwardLv] then return getAwardInfo; end
		info = awardItem[dwAwardLv];
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
						addValue = _G.CollectJewelLevelConfig.GetAwardExp(dwType,dwAwardLv,playerLv);
					elseif value == 2 then
						addValue = _G.CollectJewelLevelConfig.GetAwardMoney(dwType,dwAwardLv,playerLv);
					elseif value == 3 then
						addValue = _G.CollectJewelLevelConfig.GetAwardPneuma(dwType,dwAwardLv,playerLv);
					elseif value == 4 then
						addValue = _G.CollectJewelLevelConfig.GetAwardCash(dwType,dwAwardLv,playerLv);
					elseif value == 6 then
						addValue = _G.CollectJewelLevelConfig.GetFengYunValue(dwType,dwAwardLv,playerLv);
					end
					getAwardInfo[index][2] = addValue;
				end
			end
		end

		return getAwardInfo;
	end;

	--获取收获奖励时增加经验值
	--dwType:珠子类型（对应_G.PearlType中的类型）,dwAwardLv:获取奖励等级,playerLv:玩家等级
	GetAwardExp = function(dwType,dwAwardLv,playerLv)
		local value = 10;
		return value;
	end;
	
	--获取收获奖励时增加金钱值
	--dwType:珠子类型（对应_G.PearlType中的类型）,dwAwardLv:获取奖励等级,playerLv:玩家等级
	GetAwardMoney = function(dwType,dwAwardLv,playerLv)
		local value = money[dwType][dwAwardLv];
		return value;
	end;
	
	--获取收获奖励时增加真气值
	--dwType:珠子类型（对应_G.PearlType中的类型）,dwAwardLv:获取奖励等级,playerLv:玩家等级
	GetAwardPneuma = function(dwType,dwAwardLv,playerLv)
		local value = zhenqi[dwType][dwAwardLv];
		return value;
	end;
	
	--获取收获奖励时增加礼金值
	--dwType:珠子类型（对应_G.PearlType中的类型）,dwAwardLv:获取奖励等级,playerLv:玩家等级
	GetAwardCash = function(dwType,dwAwardLv,playerLv)
		local value = lj[dwType][dwAwardLv];
		return value;
	end;
	
	--获取收获奖励时增加风云声望值
	--dwType:珠子类型（对应_G.PearlType中的类型）,dwAwardLv:获取奖励等级,playerLv:玩家等级
	GetFengYunValue = function(dwType,dwAwardLv,playerLv)
		local value = 10;
		return value;
	end;
	
	--获取启灵花费的元宝数和获得奖励数
	--dwType:灵珠类型,dwCount:点击启灵次数
	GetBeginGainsCost = function(dwType,dwCount)
		if not dwType then return 0,0; end
		local costValue = hf[dwType];
		local awardValue = zq[dwType];
		return costValue,awardValue;
	end;
	
	--根据类型返回对应的颜色值（非物品）
	--itemType:物品类型
	Getcolor = function(itemType)
		return "#00FF00";
	end;
	
	SetMaiInfo = function(AwardInfo)
		local mailMsg = {
			sender = T"系统邮件";--发件人
			sender_id = "10086";---运营用的
			lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
			topic = T"聚灵珠收获奖励";
			content = T"您的背包已满，聚灵珠注灵获得的奖励通过邮件发送给您，请注意查收";
			gold = 0;
			bindgold = 0;
			money = 0;
			item = 	{};
			--ID 和 数量
			equip = 
			{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

			};
			
		};
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

--奖励礼包等级名
_G.AwardGiftName = {
	[1] = "gn_jlz_button_10.png",
	[2] = "gn_jlz_button_15.png",
	[3] = "gn_jlz_button_20.png",
	[4] = "gn_jlz_button_25.png",
	[5] = "gn_jlz_button_30.png",
	[6] = "gn_jlz_button_35.png",
	[7] = "gn_jlz_button_40.png",
	[8] = "gn_jlz_button_45.png",
	[9] = "gn_jlz_button_50.png",
	[10] = "gn_jlz_button_55.png",
	[11] = "gn_jlz_button_60.png",
	[12] = "gn_jlz_button_65.png",
	[13] = "gn_jlz_button_70.png",
	[14] = "gn_jlz_button_75.png",
	[15] = "gn_jlz_button_80.png",
	[16] = "gn_jlz_button_85.png",
	[17] = "gn_jlz_button_90.png",
	[18] = "gn_jlz_button_95.png",
	[19] = "gn_jlz_button_100.png",
	[20] = "gn_jlz_button_105.png",
	[21] = "gn_jlz_button_110.png",
};

--提示信息
_G.CollectJewelLevelTipsConfig = {
	szNotGrains = T"大侠您还未到达领取礼包所需等级";
	szGainsItem = T"大侠奖励已发送",
	szEmailSuc = T"奖励物品已发送至邮箱，请验收",
	szNotOPen = T"大侠请先启灵灵珠，才可领取奖励",
	szOpenCollcet = T"大侠只需花费%d元宝即可获得%d元宝等级礼包，是否花费%d元宝启灵聚灵珠",
	szNotCanGrains = T"大侠您还差%d级领取超值大礼";
	szOpenTips = T"大侠是否花费%d元宝启灵聚灵珠",
	szNotGlod = T"大侠您的元宝不足",
	szHadGet = T"大侠您已领取该奖励", -->点击领取奖励按钮时提示
	szGetTips = T"大侠请点击下方领取按钮领取奖励", 
	szNextGet = T"大侠当前等级已领取，请领取下一级奖励",
};