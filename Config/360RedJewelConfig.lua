-- [[
	-- 360红钻Config
	-- 作者：张云华
	-- 时间：2013-9-23
-- ]]

-- 360红钻相关配置信息
_G.RedJewelConfig = {
    -- @brief 获取显示信息
    -- @param number dwLevel 等级
    -- @param string strType 类型
    -- @param number dwIsActive 是否有效
    -- @param number dwGrowth 成长值
    -- @return table 信息
    -- {
        -- -- 是否有效(true - 有效, false - 无效)
        -- bResult
        -- -- 显示类型
        -- dwType
    -- }
    GetShowInfo = function (dwLevel, strType, dwIsActive, dwGrowth)
		local bResult = true;
        local dwIcon = 0;
		if dwLevel == 1 then
			dwIcon = 13;	
		elseif dwLevel == 2 then
			dwIcon = 14;
		elseif dwLevel == 3 then
			dwIcon = 15;
		elseif strType == "Y" then
			dwIcon = 16;
		else
			bResult = false;
		end
		
		local setResult = {
            bResult = bResult;
			dwType = dwIcon;
        };
        return setResult;
    end;
	
	IsShowShrtcut = true; -->是否显示红钻快捷按钮
    -- 玩家随身图片资源
    RolePng = {
        level1 = "RedJewel_1.png";
        level2 = "RedJewel_2.png";
        level3 = "RedJewel_3.png";
        level4 = "RedJewel_year.png";
    };
	--领取界面UI [1]:会员等级（1-4），giftIcon：礼包图片，explain：说明
	--rewardItem:奖励物品{物品ID配置,物品数量配置,绑定类型配置1：绑定/0不绑定,道具时效配置，如果此处没有该字段 则为非时效道具}，
	GetRedJewel = {
		[1] = {
			giftIcon = {itemId = 6305048,szPic = "Icon_item_6500550_1.png",itemNum = 1,dwBindType = 1,dwLifeTime = -1,},
			rewardItem = {
				[1] = {itemId = 2500071,itemNum = 2,dwBindType = 1,dwLifeTime = -1,},
				[2] = {itemId = 2500081,itemNum = 2,dwBindType = 1,dwLifeTime = -1,},
				[3] = {itemId = 2400110,itemNum = 1,dwBindType = 1,dwLifeTime = -1,},
				[4] = {itemId = 2500030,itemNum = 1,dwBindType = 1,dwLifeTime = -1,},
			},
			explain = "<font color='#278cf1'>360红钻会员等级达到</font><font color='#FFF000' size='14'>１</font><font color='#278cf1'>级 可领取:360《凤凰令》会员尊贵礼包</font>",
		},
		[2] = {
			giftIcon = {itemId = 6305049,szPic = "Icom_gift_011_1.png",itemNum = 1,dwBindType = 1,dwLifeTime = -1,},
			rewardItem = {
				[1] = {itemId = 2500071,itemNum = 3,dwBindType = 1,dwLifeTime = -1,},
				[2] = {itemId = 2500081,itemNum = 3,dwBindType = 1,dwLifeTime = -1,},
				[3] = {itemId = 2400110,itemNum = 2,dwBindType = 1,dwLifeTime = -1,},
				[4] = {itemId = 2500030,itemNum = 2,dwBindType = 1,dwLifeTime = -1,},
				[5] = {itemId = 5500881,itemNum = 1,dwBindType = 1,dwLifeTime = -1,},				
				},
			explain = "<font color='#278cf1'>360红钻会员等级达到</font><font color='#FFF000' size='14'>２</font><font color='#278cf1'>级 可领取:360《凤凰令》护城校尉礼包</font>",
		},
		[3] = {
			giftIcon = {itemId = 6305050,szPic = "Icom_gift_012_1.png",itemNum = 1,dwBindType = 1,dwLifeTime = -1,},
			rewardItem = {
				[1] = {itemId = 2500071,itemNum = 5,dwBindType = 1,dwLifeTime = -1,},
				[2] = {itemId = 2500081,itemNum = 5,dwBindType = 1,dwLifeTime = -1,},
				[3] = {itemId = 2400110,itemNum = 3,dwBindType = 1,dwLifeTime = -1,},
				[4] = {itemId = 5500020,itemNum = 3,dwBindType = 1,dwLifeTime = -1,},
				[5] = {itemId = 5920003,itemNum = 1,dwBindType = 1,dwLifeTime = -1,},
				[6] = {itemId = 5500882,itemNum = 1,dwBindType = 1,dwLifeTime = -1,},
				},
			explain = "<font color='#278cf1'>360红钻会员等级达到</font><font color='#FFF000' size='14'>３</font><font color='#278cf1'>级 可领取:360《凤凰令》护城都尉礼包</font>",
		},
		[4] = {
			giftIcon = {itemId = 6305051,szPic = "Icom_gift_013_1.png",itemNum = 1,dwBindType = 1,dwLifeTime = -1,},
			rewardItem = {
				[1] = {itemId = 2500071,itemNum = 5,dwBindType = 1,dwLifeTime = -1,},
				[2] = {itemId = 2500081,itemNum = 5,dwBindType = 1,dwLifeTime = -1,},				
				[3] = {itemId = 2400000,itemNum = 2,dwBindType = 1,dwLifeTime = -1,},
				[4] = {itemId = 2400010,itemNum = 2,dwBindType = 1,dwLifeTime = -1,},
				[5] = {itemId = 5500070,itemNum = 3,dwBindType = 1,dwLifeTime = -1,},
				[6] = {itemId = 5920004,itemNum = 1,dwBindType = 1,dwLifeTime = -1,},
				[7] = {itemId = 5500883,itemNum = 1,dwBindType = 1,dwLifeTime = -1,},
				},
			explain = "<font color='#278cf1'>成为360红钻用户</font><font color='#FFF000' size='14'>年费会员</font><font color='#278cf1'>可领取:360《凤凰令》护城将军礼包</font>",
		},
	},
	HadGetpic = "Qita_Checkin_yilingqu.png", --已领取图片
	GetRewardMaxNum = 10; -->能获取奖励物品的最大数
	linkUrl = "还不是360红钻会员吗？点击马上激活"; -->超链接文本
	linkTextColor = "#FFF000"; -->链接文字颜色,ps:"#00ff00"/nil:表示使用空间原色
	
    -- @brief 获取奖励项
    -- @param number dwItemIndex 奖励项索引
    -- @return table 奖励项
   GetReward = function (dwItemIndex)
        local setReward = RedJewelConfig.GetRedJewel[dwItemIndex];
        if setReward and setReward.giftIcon then
            return {[1] = setReward.giftIcon};
        else
            return {};
        end
    end;
	
	-- @brief 根据条件返回可以领取的项
    -- @param table setCondition 奖励领取条件
    --      {
    --          -- 等级
    --          dwLevel
    --          -- 类型
    --          strType
    --          -- 是否有效
    --          dwIsActive
    --          -- 成长值
    --          dwGrowth
    --      }
    -- @return table 领取项
    --      {1, 2, 3}
	GetRewardAble = function (setCondition)
		local canGetTable = {};
		
		local vipLevel = setCondition.dwLevel;
		if vipLevel then
			if vipLevel <= #_G.RedJewelConfig.GetRedJewel then
				for i=1,vipLevel do
					table.insert(canGetTable,i);
				end
			end
		end
        if setCondition.strType == "Y" then
            table.insert(canGetTable, #_G.RedJewelConfig.GetRedJewel);
        end
		
		return canGetTable;
    end;
	
	
    -- @brief 是否能领取奖励
    -- @param number dwGetType 奖励项索引
    -- @param table setCondition 奖励领取条件
    --      {
    --          -- 等级
    --          dwLevel
    --          -- 类型
    --          strType
    --          -- 是否有效
    --          dwIsActive
    --          -- 成长值
    --          dwGrowth
    --      }
    -- @param table setHadGetReward 已领取奖励表
    --      {1, 2, 3}
    -- @return number 错误码
    --      1.奖励是否存在
    --      2.领取条件是否满足
    --      3.是否已经领取过奖励
    --      4.已领取奖励
	CanGetReward = function (dwGetType, setCondition, setHadGetReward)
        if RedJewelConfig.GetRedJewel[dwGetType] == nil then
            return 2;
        end

        local state = false;
        local canGetTable = _G.RedJewelConfig.GetRewardAble(setCondition)
        for _,itemIndex in pairs(canGetTable) do
            if itemIndex == dwGetType then
                state = true;
            end
        end
        if not state then return 3; end
			
		for k, v in pairs(setHadGetReward) do
            if dwGetType == v then
                return 4;
            end
		end

	    return 0;
	end;

    -- 错误信息
    Error = {
        -- 背包空间不足
        [1] = "您的包裹已满，请整理后领取";
        -- 奖励不存在
		[2] = "您领取的奖品不存在";
        -- 不满足领取条件
		[3] = "您未满足领取条件，无法领取";
		-- 奖励已被领取
		[4] = "您已领取过该奖励";
    };
}
