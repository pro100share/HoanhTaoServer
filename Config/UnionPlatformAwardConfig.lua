-- [[
	-- 联运平台奖励领取Config
	-- 作者：张云华
	-- 时间：2013-10-16
-- ]]

--不同平台对应的图标
--[1]:趣游定义平台号（非客户端自定义平台号），{topMainIcon：主界面平台图标，AwardIcon：领取界面图标}
_G.PlatformIconConfig = {
	[41] = {topMainIcon = "lyvip_yy1.png",AwardIcon = "lyvip_yy2.png",},
}

-- 联运平台奖励领取相关配置信息
_G.UnionPlatformAwardConfig = {
	IsShowShrtcut = true; -->是否显示红钻快捷按钮
	HadGetpic = "Qita_Checkin_yilingqu.png", --已领取图片
	GetRewardMaxNum = 10; -->能获取奖励物品的最大数
	explainMainColor = "#FFF000"; -->领取物品说明文字颜色
	explainLevelColor = "#FF0000"; -->领取物品说明突出显示文字颜色
	linkTextColor = "#FFF000"; -->链接文字颜色,ps:"#00ff00"/nil:表示使用空间原色
	
    -- @brief 获取奖励项
    -- @param number dwItemIndex 奖励项索引
    -- @param number AwardList 物品信息类别
    -- @return table 奖励项
   GetReward = function (dwItemIndex,AwardList)
        if not AwardList then return; end
		local setReward = AwardList[dwItemIndex];
        if setReward and setReward.giftIcon then
			return setReward.giftIcon;
        end
    end;
	
	--根据条件返回可以领取的项
	GetRewardAble = function (setCondition,AwardList)
		local canGetTable = {};
		if not AwardList then return canGetTable; end
		
		local vipLevel = setCondition.dwVipLevel;
		if vipLevel ~= 0 and vipLevel <= #AwardList then
			for i=1,#AwardList do
				table.insert(canGetTable,i);
			end
		end
		
		return canGetTable;
    end;
	
	
    -- @brief 是否能领取奖励
    -- @param number dwGetType 奖励项索引
    -- @param table setCondition 奖励领取条件(使用nil不验证)
    --      {
    --          -- 等级
    --          dwVipLevel
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
    -- @function
    --      1.奖励是否存在
    --      2.领取条件是否满足
    --      3.是否已经领取过奖励
	--      4.奖励礼包和物品列表
	CanGetReward = function (dwGetType,setHadGetReward, setCondition,GetAwardInfo)
		if GetAwardInfo then
			local giftCfg = _G.UnionPlatformAwardConfig.GetReward(dwGetType,GetAwardInfo);
	        if not giftCfg then
				return 2;
	        end
		end

		if setCondition then
			local state = false;
			local canGetTable = _G.UnionPlatformAwardConfig.GetRewardAble(setCondition,GetAwardInfo)
			for _,itemIndex in pairs(canGetTable) do
				if itemIndex == dwGetType then
					state = true;
				end
			end
			if not state then return 3; end
		end
       
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
		-- 奖励已被领取
		[3] = "您选择的礼包当前还不能领取";
		--
		[4] = "您已领取过该奖励";
    };
	
	-- 第三方交互url
	RequestUrl = {
		--进入游戏获取平台相关信息
		awardUrl = [[http://pay.cy2009.com/gameswitch/?func_datas={"switch_op":"hs_gift","deptid":"%s"}&func_name=hs_event_gift&time=%s&sign=%s]];
		--进入游戏获取玩家会员等级相关信息
		VipUrl = [[http://pay.cy2009.com/gameswitch/?func_datas={"switch_op":"hs_level","deptid":"%s","uid":"%s"}&func_name=hs_event_level&time=%s&sign=%s]];
		
		--------test---------
		--awardUrl = [[http://pay.cy2009.com/gameswitch/?func_datas={"switch_op":"hs_gift","deptid":"41"}&func_name=hs_event_gift&time=%s&sign=%s]];
		--VipUrl = [[http://pay.cy2009.com/gameswitch/?func_datas={"switch_op":"hs_level","deptid":"41","uid":"839764098"}&func_name=hs_event_level&time=%s&sign=%s]];
	};
	
	--分割字符{“关键字”，"关键字与截取字符的位置关系"}
	Split = {
		[1] = {"等级达到","left"},
		[2] = {"年费会员","center"},
	};
	
	--客户端开放平台号
	OpenPlatFormId = {
		[1] = 20, -->联运平台客户端Id:20
	};
	
}


