
--商业化活动类型
	--单日前一小时充值
	-- _G.CommercialActType.OneDayOneHourCharge
	--时间段内累计充值固定金额天数
	-- _G.CommercialActType.ChargeMoneyDaysNum

--商业化活动时间类型
	--绝对时间
	-- _G.CommercialActTimeType.Absolutely
	--相对时间
	-- _G.CommercialActTimeType.Relatively
	
--商业化活动奖励类型
	--金钱
	-- _G.CommercialActRewardType.Money
	--礼金
	-- _G.CommercialActRewardType.BindGold
	--元宝
	-- _G.CommercialActRewardType.Gold
	--真气
	-- _G.CommercialActRewardType.Elem
	--经验
	-- _G.CommercialActRewardType.Exp
	--道具
	-- _G.CommercialActRewardType.Item

	--编号规则
	
	
	
_G.CommercialActConfig = {
	-- [1] = {
		-- --活动ID唯一，绝对不能重复出现，新活动和老活动的ID绝对不能重复，重复的话玩家无法领取相应奖励。
		-- nGlobalID = 1;
		-- --商业化活动类型
		-- nType = _G.CommercialActType.OneDayOneHourCharge;
		-- --商业化活动时间类型
		-- nTimeType = _G.CommercialActTimeType.Absolutely;
		-- --开服前几天不出现，此字段只对绝对时间类型有效。
		-- nAvoidDay = 5;
		-- --日历时间
		-- nStartTime = 20130727;
		-- nEndTime = 20130827;
		-- --奖励
		-- tReward = {
			-- [1] = {
				-- --领取条件
				-- [_G.CommercialActRewardType.Condition] = 1;
				-- --金钱
				-- [_G.CommercialActRewardType.Money] = 188;
				-- --礼金
				-- [_G.CommercialActRewardType.BindGold] = 188;
				-- --元宝
				-- [_G.CommercialActRewardType.Gold] = 188;
				-- --真气
				-- [_G.CommercialActRewardType.Elem] = 188;
				-- --经验
				-- [_G.CommercialActRewardType.Exp] = 188;
				-- --道具
				-- [_G.CommercialActRewardType.Exp] = {
					-- {[1] = 5501060, [2] = 1,[3] = 1};--[1]道具ID，[2]个数，[3]绑定
					-- {[1] = 5501070, [2] = 1,[3] = 1};
					--{[1] = 5501060, [2] = 1, [3] = 1, [4] = 7, [5] = 20130707};--[1]道具ID，[2]个数，[3]是否绑定，[4]道具生命时间，[5]道具出生时间 缺省按领取时间算
					--{[1] = 5501070, [2] = 1, [3] = 1, [4] = 7, [5] = 20130707};
				-- };

			-- };
			-- [3] = {
				-- [_G.CommercialActRewardType.Condition] = 288;
			-- };
			-- [4] = {
				-- [_G.CommercialActRewardType.Condition] = 2000;
			-- };
		-- };
	-- };

	[108180820] = {
		--活动ID唯一，绝对不能重复出现，新活动和老活动的ID绝对不能重复，重复的话玩家无法领取相应奖励。
		nGlobalID = 108180820;
		--商业化活动类型
		nType = _G.CommercialActType.OneDayOneHourCharge;
		--商业化活动时间类型
		nTimeType = _G.CommercialActTimeType.Absolutely;
		--开服前几天不出现，此字段只对绝对时间类型有效。
		nAvoidDay = 7;
		-- --日历时间
		nStartTime = 20130818;
		nEndTime = 20130820;
		--奖励
		tReward = {
			[1] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 100;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	5501100	,[2]=	1	,[3]=1};	--不限时---金色宝箱 * 1
					{[1]=	4100010	,[2]=	5	,[3]=1};	--不限时---千纸鹤 * 5
					{[1]=	2500030	,[2]=	1	,[3]=1};	--不限时---闭关要诀 * 1
				};

			};

			[2] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 388;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	9405010	,[2]=	2	,[3]=1};	--不限时---神龙果 * 2
					{[1]=	5500020	,[2]=	2	,[3]=1};	--不限时---扩展券 * 2
					{[1]=	5940003	,[2]=	3	,[3]=1};	--不限时---真气丹(1000) * 3
				};

			};	
			
			[3] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 880;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	5501110	,[2]=	1	,[3]=1};	--不限时---钻石宝箱 * 1
					{[1]=	9405010	,[2]=	3	,[3]=1};	--不限时---神龙果 * 3
					{[1]=	5809255	,[2]=	1	,[3]=1};	--不限时---坐骑资质丹材料 * 1
					{[1]=	5945006	,[2]=	3	,[3]=1};	--不限时---土灵丹(10000) * 3
				};

			};
			
			[4] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 1888;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	9405010	,[2]=	5	,[3]=1};	--不限时---神龙果 * 5
					{[1]=	5809255	,[2]=	2	,[3]=1};	--不限时---坐骑资质丹材料 * 2
					{[1]=	2500072	,[2]=	3	,[3]=1};	--不限时---九花玉露丸·大 * 3
					{[1]=	2500082	,[2]=	3	,[3]=1};	--不限时---元气通神酒·大 * 3
					{[1]=	5943006	,[2]=	4	,[3]=1};	--不限时---水灵丹(10000) * 4
				};

			};
			
			[5] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 3888;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	9405010	,[2]=	10	,[3]=1};	--不限时---神龙果 * 10
					{[1]=	5809255	,[2]=	3	,[3]=1};	--不限时---坐骑资质丹材料 * 3
					{[1]=	2400120	,[2]=	1	,[3]=1};	--不限时---三倍经验丹 * 1
					{[1]=	5930006	,[2]=	6	,[3]=1};	--不限时---经验丹(500万) * 6
					{[1]=	5944006	,[2]=	6	,[3]=1};	--不限时---火灵丹(10000) * 6
				};

			};			

			[6] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 8888;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	9405010	,[2]=	18	,[3]=1};	--不限时---神龙果 * 18
					{[1]=	4902003	,[2]=	3	,[3]=1};	--不限时---百花露 * 3
					{[1]=	9405040	,[2]=	1	,[3]=1};	--不限时---坐骑资质丹 * 1
					{[1]=	5809252	,[2]=	1	,[3]=1};	--不限时---经验袋 * 1
					{[1]=	5942006	,[2]=	10	,[3]=1};	--不限时---木灵丹(10000) * 10
				};

			};				
			
		};
	};
	
	[108210823] = {
		--活动ID唯一，绝对不能重复出现，新活动和老活动的ID绝对不能重复，重复的话玩家无法领取相应奖励。
		nGlobalID = 108210823;
		--商业化活动类型
		nType = _G.CommercialActType.OneDayOneHourCharge;
		--商业化活动时间类型
		nTimeType = _G.CommercialActTimeType.Absolutely;
		--开服前几天不出现，此字段只对绝对时间类型有效。
		nAvoidDay = 7;
		-- --日历时间
		nStartTime = 20130821;
		nEndTime = 20130823;
		--奖励
		tReward = {
			[1] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 100;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	5501100	,[2]=	1	,[3]=1};	--不限时---金色宝箱 * 1
					{[1]=	2500071	,[2]=	3	,[3]=1};	--不限时---九花玉露丸·中 * 3
					{[1]=	5930005	,[2]=	3	,[3]=1};	--不限时---经验丹(100万) * 3
				};
			};
			
			[2] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 388;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	4100110	,[2]=	1	,[3]=1};	--不限时---剑魂石 * 1
					{[1]=	4902002	,[2]=	5	,[3]=1};	--不限时---石料 * 5
					{[1]=	5940003	,[2]=	5	,[3]=1};	--不限时---真气丹(1000) * 5
				};
			};

			[3] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 880;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	5501110	,[2]=	1	,[3]=1};	--不限时---钻石宝箱 * 1
					{[1]=	4100110	,[2]=	2	,[3]=1};	--不限时---剑魂石 * 2
					{[1]=	5809255	,[2]=	1	,[3]=1};	--不限时---坐骑资质丹材料 * 1
					{[1]=	5500020	,[2]=	8	,[3]=1};	--不限时---扩展券 * 8
				};
			};
			
			[4] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 1888;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	4100110	,[2]=	5	,[3]=1};	--不限时---剑魂石 * 5
					{[1]=	2500072	,[2]=	3	,[3]=1};	--不限时---九花玉露丸·大 * 3
					{[1]=	5930006	,[2]=	3	,[3]=1};	--不限时---经验丹(500万) * 3
					{[1]=	5809255	,[2]=	3	,[3]=1};	--不限时---坐骑资质丹材料 * 3
					{[1]=	5501135	,[2]=	1	,[3]=1};	--不限时---变异怪召唤令 * 1
				};
			};
			
			[5] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 3888;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	4100110	,[2]=	10	,[3]=1};	--不限时---剑魂石 * 10
					{[1]=	5809255	,[2]=	3	,[3]=1};	--不限时---坐骑资质丹材料 * 3
					{[1]=	2400120	,[2]=	1	,[3]=1};	--不限时---三倍经验丹 * 1
					{[1]=	5930006	,[2]=	5	,[3]=1};	--不限时---经验丹(500万) * 5
					{[1]=	5501135	,[2]=	2	,[3]=1};	--不限时---变异怪召唤令 * 2
				};
			};			

			[6] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 8888;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	4100110	,[2]=	18	,[3]=1};	--不限时---剑魂石 * 18
					{[1]=	5809255	,[2]=	5	,[3]=1};	--不限时---坐骑资质丹材料 * 5
					{[1]=	5809252	,[2]=	1	,[3]=1};	--不限时---经验袋 * 1
					{[1]=	5501135	,[2]=	3	,[3]=1};	--不限时---变异怪召唤令 * 3
					{[1]=	5940006	,[2]=	4	,[3]=1};	--不限时---真气丹(1万) * 4
				};
			};				
			
		};
	};
	
	[108240826] = {
		--活动ID唯一，绝对不能重复出现，新活动和老活动的ID绝对不能重复，重复的话玩家无法领取相应奖励。
		nGlobalID = 108240826;
		--商业化活动类型
		nType = _G.CommercialActType.OneDayOneHourCharge;
		--商业化活动时间类型
		nTimeType = _G.CommercialActTimeType.Absolutely;
		--开服前几天不出现，此字段只对绝对时间类型有效。
		nAvoidDay = 7;
		-- --日历时间
		nStartTime = 20130824;
		nEndTime = 20130826;
		--奖励
		tReward = {
			[1] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 100;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	5501100	,[2]=	1	,[3]=1};	--不限时---金色宝箱 * 1
					{[1]=	2500071	,[2]=	3	,[3]=1};	--不限时---九花玉露丸·中 * 3
					{[1]=	4100210	,[2]=	3	,[3]=1};	--不限时---精铁锭 * 3
				};
			};
			
			[2] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 388;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	4100130	,[2]=	1	,[3]=1};	--不限时---升阶玄晶 * 1
					{[1]=	4902002	,[2]=	5	,[3]=1};	--不限时---石料 * 5
					{[1]=	5940003	,[2]=	3	,[3]=1};	--不限时---真气丹(1000) * 3
				};
			};

			[3] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 880;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	5501110	,[2]=	1	,[3]=1};	--不限时---钻石宝箱 * 1
					{[1]=	4100130	,[2]=	3	,[3]=1};	--不限时---升阶玄晶 * 3
					{[1]=	4100210	,[2]=	10	,[3]=1};	--不限时---精铁锭 * 10
					{[1]=	5500020	,[2]=	8	,[3]=1};	--不限时---扩展券 * 8
				};
			};
			
			[4] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 1888;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {

					{[1]=	4100130	,[2]=	5	,[3]=1};	--不限时---升阶玄晶 * 5
					{[1]=	4100210	,[2]=	18	,[3]=1};	--不限时---精铁锭 * 18
					{[1]=	2500210	,[2]=	3	,[3]=1};	--不限时---经验丹·500万 * 3
					{[1]=	5809257	,[2]=	3	,[3]=1};	--不限时---古学志·纸 * 3
					{[1]=	2500082	,[2]=	3	,[3]=1};	--不限时---元气通神酒·大 * 3
				};
			};
			
			[5] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 3888;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	4100130	,[2]=	10	,[3]=1};	--不限时---升阶玄晶 * 10
					{[1]=	4100210	,[2]=	28	,[3]=1};	--不限时---精铁锭 * 28
					{[1]=	2400120	,[2]=	1	,[3]=1};	--不限时---三倍经验丹 * 1
					{[1]=	2500210	,[2]=	5	,[3]=1};	--不限时---经验丹·500万 * 5
					{[1]=	5809256	,[2]=	5	,[3]=1};	--不限时---古学志·墨 * 5
				};
			};			

			[6] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 8888;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	4100130	,[2]=	18	,[3]=1};	--不限时---升阶玄晶 * 18
					{[1]=	4100210	,[2]=	88	,[3]=1};	--不限时---精铁锭 * 88
					{[1]=	5809252	,[2]=	2	,[3]=1};	--不限时---经验袋 * 2
					{[1]=	5809258	,[2]=	8	,[3]=1};	--不限时---古学志·泉 * 8
					{[1]=	5940006	,[2]=	4	,[3]=1};	--不限时---真气丹(1万) * 4
				};
			};				
			
		};
	};
	
	[108270829] = {
		--活动ID唯一，绝对不能重复出现，新活动和老活动的ID绝对不能重复，重复的话玩家无法领取相应奖励。
		nGlobalID = 108270829;
		--商业化活动类型
		nType = _G.CommercialActType.OneDayOneHourCharge;
		--商业化活动时间类型
		nTimeType = _G.CommercialActTimeType.Absolutely;
		--开服前几天不出现，此字段只对绝对时间类型有效。
		nAvoidDay = 7;
		-- --日历时间
		nStartTime = 20130827;
		nEndTime = 20130829;
		--奖励
		tReward = {
			[1] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 100;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	5501100	,[2]=	1	,[3]=1};	--不限时---金色宝箱 * 1
					{[1]=	2500071	,[2]=	3	,[3]=1};	--不限时---九花玉露丸·中 * 3
					{[1]=	2500030	,[2]=	1	,[3]=1};	--不限时---闭关要诀 * 1
				};
			};
			
			[2] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 388;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	2500050	,[2]=	1	,[3]=1};	--不限时---武尊残章 * 1
					{[1]=	4902002	,[2]=	5	,[3]=1};	--不限时---石料 * 5
					{[1]=	5940003	,[2]=	3	,[3]=1};	--不限时---真气丹(1000) * 3
				};
			};

			[3] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 880;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	5501110	,[2]=	1	,[3]=1};	--不限时---钻石宝箱 * 1
					{[1]=	2500050	,[2]=	4	,[3]=1};	--不限时---武尊残章 * 4
					{[1]=	5600040	,[2]=	1	,[3]=1};	--不限时---传世藏宝图 * 1
					{[1]=	5500020	,[2]=	8	,[3]=1};	--不限时---扩展券 * 8
				};
			};
			
			[4] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 1888;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	2500050	,[2]=	8	,[3]=1};	--不限时---武尊残章 * 8
					{[1]=	5600040	,[2]=	2	,[3]=1};	--不限时---传世藏宝图 * 2
					{[1]=	5930006	,[2]=	3	,[3]=1};	--不限时---经验丹(500万) * 3
					{[1]=	5121701	,[2]=	5	,[3]=1};	--不限时---古学志·全 * 5
					{[1]=	2500082	,[2]=	3	,[3]=1};	--不限时---元气通神酒·大 * 3
				};
			};
			
			[5] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 3888;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	2500050	,[2]=	15	,[3]=1};	--不限时---武尊残章 * 15
					{[1]=	5600040	,[2]=	3	,[3]=1};	--不限时---传世藏宝图 * 3
					{[1]=	2400120	,[2]=	1	,[3]=1};	--不限时---三倍经验丹 * 1
					{[1]=	5930006	,[2]=	5	,[3]=1};	--不限时---经验丹(500万) * 5
					{[1]=	5121701	,[2]=	5	,[3]=1};	--不限时---古学志·全 * 5
				};
			};			

			[6] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 8888;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	2500050	,[2]=	20	,[3]=1};	--不限时---武尊残章 * 20
					{[1]=	5809253	,[2]=	2	,[3]=1};	--不限时---实战秘录 * 2
					{[1]=	5809252	,[2]=	2	,[3]=1};	--不限时---经验袋 * 2
					{[1]=	5121701	,[2]=	10	,[3]=1};	--不限时---古学志·全 * 10
					{[1]=	5940006	,[2]=	4	,[3]=1};	--不限时---真气丹(1万) * 4
				};
			};				
			
		};
	};
	
	[108300901] = {
		--活动ID唯一，绝对不能重复出现，新活动和老活动的ID绝对不能重复，重复的话玩家无法领取相应奖励。
		nGlobalID = 108300901;
		--商业化活动类型
		nType = _G.CommercialActType.OneDayOneHourCharge;
		--商业化活动时间类型
		nTimeType = _G.CommercialActTimeType.Absolutely;
		--开服前几天不出现，此字段只对绝对时间类型有效。
		nAvoidDay = 7;
		-- --日历时间
		nStartTime = 20130830;
		nEndTime = 20130901;
		--奖励
		tReward = {
			[1] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 100;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	5501100	,[2]=	1	,[3]=1};	--不限时---金色宝箱 * 1
					{[1]=	5121801	,[2]=	1	,[3]=1};	--不限时---绿色锄头 * 1
					{[1]=	3900010	,[2]=	18	,[3]=1};	--不限时---1品宝石精华 * 18
				};
			};
			
			[2] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 388;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	9405010	,[2]=	1	,[3]=1};	--不限时---神龙果 * 1
					{[1]=	5501140	,[2]=	1	,[3]=1};	--不限时---宝石盒子 * 1
					{[1]=	5944006	,[2]=	3	,[3]=1};	--不限时---火灵丹(10000) * 3
				};
			};

			[3] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 880;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	5501110	,[2]=	1	,[3]=1};	--不限时---钻石宝箱 * 1
					{[1]=	9405010	,[2]=	2	,[3]=1};	--不限时---神龙果 * 2
					{[1]=	5930006	,[2]=	1	,[3]=1};	--不限时---经验丹(500万) * 1
					{[1]=	5600040	,[2]=	1	,[3]=1};	--不限时---传世藏宝图 * 1
				};
			};
			
			[4] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 1888;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	9405010	,[2]=	6	,[3]=1};	--不限时---神龙果 * 6
					{[1]=	5809255	,[2]=	3	,[3]=1};	--不限时---坐骑资质丹材料 * 3
					{[1]=	5940006	,[2]=	1	,[3]=1};	--不限时---真气丹(1万) * 1
					{[1]=	4900100	,[2]=	1	,[3]=1};	--不限时---洗练类型符 * 1
					{[1]=	5501135	,[2]=	1	,[3]=1};	--不限时---变异怪召唤令 * 1
				};
			};
			
			[5] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 3888;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	9405010	,[2]=	10	,[3]=1};	--不限时---神龙果 * 10
					{[1]=	5809255	,[2]=	5	,[3]=1};	--不限时---坐骑资质丹材料 * 5
					{[1]=	2400120	,[2]=	2	,[3]=1};	--不限时---三倍经验丹 * 2
					{[1]=	5501140	,[2]=	2	,[3]=1};	--不限时---宝石盒子 * 2
					{[1]=	4900100	,[2]=	2	,[3]=1};	--不限时---洗练类型符 * 2
				};
			};			

			[6] = {
				--领取条件
				[_G.CommercialActRewardType.Condition] = 8888;
				--金钱
				[_G.CommercialActRewardType.Money] = 0;
				--礼金
				[_G.CommercialActRewardType.BindGold] = 0;
				--元宝
				[_G.CommercialActRewardType.Gold] = 0;
				--真气
				[_G.CommercialActRewardType.Elem] = 0;
				--经验
				[_G.CommercialActRewardType.Exp] = 0;
				--道具
				[_G.CommercialActRewardType.Item] = {
					{[1]=	9405010	,[2]=	18	,[3]=1};	--不限时---神龙果 * 18
					{[1]=	9405040	,[2]=	1	,[3]=1};	--不限时---坐骑资质丹 * 1
					{[1]=	5809252	,[2]=	2	,[3]=1};	--不限时---经验袋 * 2
					{[1]=	4900100	,[2]=	3	,[3]=1};	--不限时---洗练类型符 * 3
					{[1]=	5501120	,[2]=	1	,[3]=1};	--不限时---宝石宝箱 * 1
				};
			};				
			
		};
	};
};



