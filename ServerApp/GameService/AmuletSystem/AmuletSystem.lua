--[[
功能：宝甲系统类（服务器）
版本：v1.0
作者：郭肇义
时间：2012-03-14 
修改：粟宇征
时间：2012-11-08
]]
_G.CAmuletSystem = {};

CAmuletSystem.dwAmuletLevel = nil;							--宝甲阶级
CAmuletSystem.dwAmuletRank =  nil;							--宝甲等级
CAmuletSystem.dwGrowthValue = nil;							--宝甲成长值
CAmuletSystem.dwAmuletIntensifyPerConfig =	nil;			--熔炼配置职业
CAmuletSystem.dwAmuletIntensifyColorConfig = nil;			--熔炼配置颜色
CAmuletSystem.dwAmuletRink = nil;							--熔炼排名
CAmuletSystem.dwAmuletInlayLevel = nil;                     --镶嵌
CAmuletSystem.dwAptitude = nil;                             --资质

function CAmuletSystem:new()
	local obj = CSystem:new("CAmuletSystem");
	obj.ItemSystem = nil;
	for index, value in pairs(CAmuletSystem) do
		if type(value) == "function" then
			obj[index] = value;
		end;
	end;
	return obj;
end;
----------------------------------------------------------------------------------------------------
function CAmuletSystem:Create(bIsChangeLine)
	--获得player
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CAmuletSystem Create Cannot get player");
		return false;
	end;
	--初始化DB
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		_err("CAmuletSystem Create Cannot get DBQuery");
		return false;
	end;
	self.objDBQuery = CAmuletSystemDB:new(objDB, self);
	--初始化数值
	local tabResult = objPlayer:GetLineData("CAmuletSystem")[1]
    if bIsChangeLine ~= 2 and (tabResult.dwAmuletLevel == nil or tabResult.dwAmuletRank == nil) then
        _err("[AmuletSystem] Data error kill player");
        _closenet(objPlayer.objNet);
    end
	self.dwAmuletLevel = tabResult.dwAmuletLevel
	self.dwAmuletRank =  tabResult.dwAmuletRank
	self.dwGrowthValue = tabResult.dwAmuletGrowth
	self.dwAmuletIntensifyPerConfig = tabResult.dwAmuletIntensifyPerConfig;
    if not self.dwAmuletIntensifyColorConfig or 
            self.dwAmuletIntensifyColorConfig == 0 then
        self.dwAmuletIntensifyColorConfig = 1;
    end
	self.dwAmuletIntensifyColorConfig = tabResult.dwAmuletIntensifyColorConfig;
    if not self.dwAmuletIntensifyPerConfig or 
           self.dwAmuletIntensifyPerConfig == 0 then
        self.dwAmuletIntensifyPerConfig = 1;
    end

	if not CConfig.bIsCrossSvr then
		self.dwAmuletRink =	CChartManager:GetChartNumber(_G.enChartType.eAmulet,'dwRoleID',self:GetPlayer():GetRoleID())
	end;
	self.dwAmuletInlayLevel = tabResult.dwAmuletInlayLevel

	self.dwAmuletRink =	0;
    self.dwAmuletInlayLevel = tabResult.dwAmuletInlayLevel;
    self.dwAptitude = tabResult.dwAptitude;

	self:UpdataAttr()
	
	------add by lkj 2013-07-18
	--宝甲升阶折扣
	self.nDiscount_UpGrade = 1;
	--宝甲熔炼倍数
	self.nMultiple_Intensify = 1;
	------add end
	
	return true;
end;

------add by lkj 2013-07-18
--设置宝甲升阶折扣
function CAmuletSystem:SetDiscount_UpGrade(value)
	self.nDiscount_UpGrade = value;
end;
--设置宝甲熔炼倍数
function CAmuletSystem:SetMultiple_Intensify(value)
	self.nMultiple_Intensify = value;
end;
------add end

function CAmuletSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer()
	objPlayer:SetLineData("CAmuletSystem",	
							{dwAmuletGrowth = self.dwGrowthValue, dwAmuletLevel = self.dwAmuletLevel, dwAmuletRank =  self.dwAmuletRank,
							dwAmuletIntensifyPerConfig = self.dwAmuletIntensifyPerConfig, dwAmuletIntensifyColorConfig = self.dwAmuletIntensifyColorConfig,dwAmuletInlayLevel = self.dwAmuletInlayLevel, dwAptitude = self.dwAptitude})
end;

function CAmuletSystem:OnEnterScene()
	self:SynTianGuanCiFu();
end

function CAmuletSystem:OnEnterCrossBegin()
	self:GetPlayer():SetCrossSvrData("CAmuletSystem", {
        dwAmuletGrowth = 0,
        dwAmuletLevel = self.dwAmuletLevel,
        dwAmuletRank =  1,
        dwAmuletIntensifyPerConfig = 1,
        dwAmuletIntensifyColorConfig = 1,
        dwAmuletInlayLevel = 0,
        dwAptitude = 0
    });
end

function CAmuletSystem:SynTianGuanCiFu()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CAmuletSystem Cannot get player SynTianGuanCiFu");
		return;
	end;
	local restTime = self:GetRestTime();
	objPlayer.AmuletSys_SynTianGuanCiFuMsg{RestTime = restTime};
end

function CAmuletSystem:GetRestTime()
	local endTime = CTimeFormat:GetTodayThisTimeMsec(6, 0);
	local restTime = 0;
	
	if GetCurTime() < endTime then
		restTime = endTime - GetCurTime();
	end;	
	if GetCurTime() > endTime then
		restTime = 24 * 60 * 60 * 1000 - (GetCurTime() - endTime);
	end;
	return restTime;
end

----------------------------------------------------------------------------------------------------
--熔炼宝甲
function CAmuletSystem:Intensify()
	if self:CheckIntensify() then
		self:DoIntensify()
	end
end;
--升阶宝甲
function CAmuletSystem:Upgrade(tabInfo)
	if self:CheckUpgrade(tabInfo) then
		self:DoUpgrade()
	end
end;
--牺牲道具
function CAmuletSystem:Sacrifice(tabInfo)
	if self:CheckSacrifice(tabInfo) then
		self:DoSacrifice(tabInfo)
	end
end

-- @brief 获取宝甲信息
-- @param dwRoleID number 目标角色id
function CAmuletSystem:GetAmuletInfo(dwRoleID)
    local dwSelfRoleID = self:GetPlayer():GetRoleID();
    if dwSelfRoleID == dwRoleID then
        self:BuildAmuletInfo(dwSelfRoleID);
    else
        GSRemoteCall(dwRoleID,
                    "CAmuletSystem",
                    "BuildAmuletInfo",
                    { dwSelfRoleID } ,
                    nil);
    end
end

-- @brief 组装宝甲信息
-- @param dwRoleID number 返回目标角色id
function CAmuletSystem:BuildAmuletInfo(dwRoleID)
    local tPlayer = self:GetPlayer();
    local dwSelfRoleID = tPlayer:GetRoleID();
    local tAmuletSystem = tPlayer:GetSystem('CAmuletSystem');
    local tTianGuanCiFuSystem = tPlayer:GetSystem('CTianGuanCiFuSystem');
    local tInfo = {
        dwRoleID = dwSelfRoleID,
        dwGrowthValue = tAmuletSystem.dwGrowthValue,
        dwGiftValue = tTianGuanCiFuSystem:Get_AmuletUpGrade(),
        dwLevel = tAmuletSystem.dwAmuletLevel,
        dwRank = tAmuletSystem.dwAmuletRank,
        dwRink = CChartManager:GetChartNumber(_G.enChartType.eAmulet,
                                              'dwRoleID',
                                              tAmuletSystem:
                                              GetPlayer():
                                              GetRoleID()),
		bHavePower = self:HasAuthority('Amulet'),
        dwAmuletInlayLevel = tAmuletSystem.dwAmuletInlayLevel,
        dwAptitude = tAmuletSystem.dwAptitude
    };

    if dwSelfRoleID == dwRoleID then
        self:SendAmuletInfo(tInfo);
    else
        GSRemoteCall(dwRoleID,
                        "CAmuletSystem",
                        "SendAmuletInfo",
                        { tInfo } ,
                        nil);
    end
end

-- @brief 发送宝甲信息到客户端
-- @param tInfo table 信息
function CAmuletSystem:SendAmuletInfo(tInfo)
    self:GetPlayer().OnGetAmuletInfoMsg{
		dwRoleID = tInfo.dwRoleID,
		dwGrowthValue = tInfo.dwGrowthValue,
		dwGiftValue = tInfo.dwGiftValue,
		dwLevel = tInfo.dwLevel,
		dwRank = tInfo.dwRank,
		dwRink = tInfo.dwRink,
		bHavePower = tInfo.bHavePower,
		dwAmuletInlayLevel = tInfo.dwAmuletInlayLevel,
        dwAptitude = tInfo.dwAptitude
    };
end

--更新宝甲信息
function CAmuletSystem:UpdateAmuletInfo(dwGiftValue)
	local tPlayer = self:GetPlayer();
	local tInfo = {
		dwRoleID = tPlayer:GetRoleID(),
		dwGrowthValue = self.dwGrowthValue,
		dwGiftValue = dwGiftValue,
		dwLevel = self.dwAmuletLevel,
		dwRank = self.dwAmuletRank,
		dwRink = CChartManager:GetChartNumber(_G.enChartType.eAmulet,'dwRoleID',tPlayer:GetRoleID()),
		bHavePower = true,
        dwAmuletInlayLevel = self.dwAmuletInlayLevel,
        dwAptitude = self.dwAptitude
	};
	self:SendAmuletInfo(tInfo);
end
----------------------------------------------------------------------------------------------------

--获得宝甲成长度
function CAmuletSystem:GetGrowth()
	return self.dwGrowthValue or 0
end

--获得宝甲等级
function CAmuletSystem:GetRank()
	if (self.dwAmuletRank == nil) or (self.dwAmuletRank == 0) then
		return 1;
	end
	return self.dwAmuletRank;
end

--获得宝甲阶数
function CAmuletSystem:GetLevel()
	if (self.dwAmuletLevel == nil) or (self.dwAmuletLevel == 0) then
		return 1;
	end
	return self.dwAmuletLevel;
end

----------------------------------------------------------------------------------------------------
--写入熔炼配置到数据库
function CAmuletSystem:WriteIntensifyConfig(tConfig)
	--更新数据
	self.objDBQuery:SetAmuletIntensifyPerConfig(tConfig.electProfession);
	local value = 0;
	for i = 1,6 do
		if tConfig[i] then
			value = value + 10^((7-i)-1);
		else
			value = value + 2*(10^((7-i)-1));
		end
	end
	
	self.objDBQuery:SetAmuletIntensifyColorConfig(value);
	
	self.dwAmuletIntensifyPerConfig = tConfig.electProfession;
	self.dwAmuletIntensifyColorConfig = value;
end


--发送熔炼配置给客户端
function CAmuletSystem:IntensifyConfig()
	local tabResult = {
		AmuletIntensifyPerConfig = self.dwAmuletIntensifyPerConfig,
		AmuletIntensifyColorConfig = self.dwAmuletIntensifyColorConfig,
	}
	self:GetPlayer().OnAmuletIntensifyConfigMsg{Result = tabResult or {}};
end


--检测熔炼
function CAmuletSystem:CheckIntensify()
	--检测祭品
	local objSystem = self:GetPlayer():GetSystem('CItemSystem')
	local tabSacrificeList = objSystem:GetAllItemInAmulet()
	for k,v in pairs(tabSacrificeList) do
		if not self:IsSacrifice(v) then
			return false
		end
	end

	--检测等级 成长
	if self.dwAmuletRank >= AmuletLevelConfig[self.dwAmuletLevel].dwMaxRank and self.dwGrowthValue >= AmuletRankConfig[self.dwAmuletRank].dwMaxGrowth then
		return false
	end

	return true
end;

--执行熔炼
function CAmuletSystem:DoIntensify()
	local objSystem = self:GetPlayer():GetSystem('CItemSystem')
	local tabSacrificeList = objSystem:GetAllItemInAmulet()

	--增加成长度
	local dwAddGrowthValue,tabSacrificeCost = self:GetAddGrowthValue(tabSacrificeList)

	--当前成长度
	self.dwGrowthValue = self.dwGrowthValue + dwAddGrowthValue

	local bMax = false

	if self.dwGrowthValue >= AmuletRankConfig[self.dwAmuletRank].dwMaxGrowth then
		--检测等级
		bMax = true
		if self.dwAmuletRank >= AmuletLevelConfig[self.dwAmuletLevel].dwMaxRank then
			self.dwGrowthValue = AmuletRankConfig[self.dwAmuletRank].dwMaxGrowth;
			--全满物品放回背包
			if self:IsMaxGrade() then
				local objSystem = self:GetPlayer():GetSystem('CItemSystem')
				local tabSacrificeList = objSystem:GetAllItemInAmulet()
				for _,objItem in pairs(tabSacrificeList) do
					objSystem:TrySplitItemToHolder(objItem:GetInstID(), objItem:GetCount(), enItemPosition.ePacket);
				end
			end
		else
			self.dwAmuletRank = self.dwAmuletRank + 1;
			self.dwGrowthValue = 0;
		end
	end
	
	--删除祭品
	for _,v in pairs(tabSacrificeCost) do
		if v.objItem:IsEquip() then
			objSystem:DelObjItem(v.objItem:GetInstID(), _G.ItemSysOperType.Amulet);
		elseif self:IsIntensifyStone(v.objItem) then
			objSystem:DelItemNumber(v.objItem:GetInstID(), v.dwNumber, _G.ItemSysOperType.Amulet)
		end;
	end
	--更新数据
	self.objDBQuery:SetAmuletGrowth(self.dwGrowthValue)
	self.objDBQuery:SetAmuletRank(self.dwAmuletRank)
	--属性更新
	self:UpdataAttr();
	--通知客户端
	local tabResult = { dwGrowthValue = self.dwGrowthValue,bMax = bMax,dwRank = self.dwAmuletRank }
	self:GetPlayer().OnAmuletIntensifyMsg{Result = tabResult or {}}
	--抛出事件
	self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(
		enumPlayerEventType.EventIntenAmulet,
		self.dwAmuletRank,
		self.dwGrowthValue
	)
	--记录日志
	local dwRoleID = self:GetPlayer():GetRoleID()
	local tabMatList = {}
	for k,v in pairs(tabSacrificeCost) do
		local res = { dwItemEnum = v.objItem:GetEnumID(), number = v.dwNumber }
		table.insert(tabMatList,res)
	end
end
----------------------------------------------------------------------------------------------------
--检测升阶
function CAmuletSystem:CheckUpgrade(tabInfo)
	--是否满阶
	if self:IsMaxGrade() then
		return false
	end
	--是否满等级 满成长
	if self.dwAmuletRank ~= AmuletLevelConfig[self.dwAmuletLevel].dwMaxRank or self.dwGrowthValue < AmuletRankConfig[self.dwAmuletRank].dwMaxGrowth then
		return false
	end
	--是否够消耗
	if not self:IsEnoughCost(tabInfo) then
		return false
	end
	return true
end;
--add by lkj 2013-07-25
--检测宝甲是否能够升阶
function CAmuletSystem:CheckCanUpgrade()
	--是否满阶
	if self:IsMaxGrade() then
		return false
	end
	--是否满等级 满成长
	if self.dwAmuletRank ~= AmuletLevelConfig[self.dwAmuletLevel].dwMaxRank or self.dwGrowthValue < AmuletRankConfig[self.dwAmuletRank].dwMaxGrowth then
		return false
	end
	return true
end;
--add end

--执行升阶
function CAmuletSystem:DoUpgrade()
	local objItemSystem = self:GetPlayer():GetSystem('CItemSystem')
	
	--删除消耗品
	----强化石信息
	local dwStoneEnum,dwCostStone = AmuletUpgradeConfig.CostStone(self.dwAmuletLevel);
	local isOK, _ = objItemSystem:DelEnumItemInPacket(dwStoneEnum, dwCostStone, false, _G.ItemSysOperType.Amulet);
	if not isOK then
		_err("stone num not enough!!!");
		return false;
	end;
	----银两信息
	local dwCostMoney = math.ceil(AmuletUpgradeConfig.CostMoney(self.dwAmuletLevel) * self.nDiscount_UpGrade);
	----删除银两
	if not objItemSystem:CostPacketMoney(dwCostMoney, _G.ItemSysOperType.Amulet) then
		_err("money not enough!!!");
		return false;
	end;
	--计算升阶结果
	local bFlag = false
	local objGiftSyetem = self:GetPlayer():GetSystem('CTianGuanCiFuSystem')
	local dwGiftValue = objGiftSyetem:Get_AmuletUpGrade()
	local dwBaseSuccessRate = AmuletUpgradeConfig.TrueSuccessRate(self.dwAmuletLevel,dwGiftValue)
	if math.random() < dwBaseSuccessRate then
		bFlag = true
	end
	if objGiftSyetem:IsAmuletUpGradeMax() then
		bFlag = true
	end
	
	local dwAddExp = 0;
	if bFlag then
		-----------------
		--日志记录
		local dwBegin = objGiftSyetem:Get_AmuletUpGrade();
		local dwEnd = 0;
		CLogSystemManager:cifu(self:GetPlayer(), 4, self.dwAmuletLevel, 1, dwBegin, dwEnd);
		-----------------
		self.dwAmuletLevel = self.dwAmuletLevel + 1;
		self.dwAmuletRank = self.dwAmuletRank + 1;
		self.dwGrowthValue = 0;
		objGiftSyetem:Set_AmuletUpGrade(0)
		local szName = self:GetPlayer():GetInfo().szRoleName
		local dwRoleID = self:GetPlayer():GetRoleID()
		if self.dwAmuletLevel >= AmuletUpgradeConfig.dwBroadCastLevel then
			self:BoradCast(szName,dwRoleID)
		end
		--属性更新
		self:UpdataAttr();
		
	else
		objGiftSyetem:Add_AmuletUpGrade(self.dwAmuletLevel)
		local objPlayer = self:GetPlayer();
		

		local addExpNum = self:GetPlayer():GetSystem("CRefreshSystem"):GetData(0101);
		
		if addExpNum and addExpNum > 0 then
			dwAddExp = AmuletUpgradeConfig.GetFailureAddExp(self.dwAmuletLevel,objPlayer:GetLevel());
			objPlayer:AddExp(dwAddExp);
			self:GetPlayer():GetSystem("CRefreshSystem"):SetData(0101,addExpNum - 1);
		end
	end
	
	--更新数据
	self.objDBQuery:SetAmuletGrowth(self.dwGrowthValue)
	self.objDBQuery:SetAmuletLevel(self.dwAmuletLevel)
	self.objDBQuery:SetAmuletRank(self.dwAmuletRank)
		
	--通知客户端
	local tabResult = {
		Result = bFlag,
		addGiftValue = (objGiftSyetem:Get_AmuletUpGrade() - dwGiftValue),
		addExp = dwAddExp,
		GiftValue = objGiftSyetem:Get_AmuletUpGrade(),
		GrowthValue = self.dwGrowthValue,
		Level = self.dwAmuletLevel,
		Rank = self.dwAmuletRank
	}
	self:GetPlayer().OnAmuletUpgradeMsg{Result = tabResult or {}};
	--抛出事件
	self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(
		enumPlayerEventType.EventUpgradeAmulet,
		self.dwAmuletLevel,
		self.dwAmuletRank,
		self.dwGrowthValue,
		objGiftSyetem:Get_AmuletUpGrade()
	);
end;

--更新属性
function CAmuletSystem:UpdataAttr()
	if not self.dwAmuletLevel then return end;
	if not self.dwAmuletRank then return end;
	if not self.dwGrowthValue then return end;
	if not self:HasAuthority('Amulet') then return end
	local tAttr = SSingleAttrChange:new();
	local setInlayAppendProperty = 
		AmuletInlayConfig.Data[self.dwAmuletInlayLevel] or {};
	setInlayAppendProperty = setInlayAppendProperty.AppendProperty or {};
    local setAptitudeAppendProperty = AmuletAptitudeConfig.GetProperty(self.dwAptitude) or {};

	--					基本属性												熔炼初始属性												熔炼成长加成属性
	tAttr.dwAttack = AmuletLevelPropertyConfig[self.dwAmuletLevel].dwAttack + AmuletRankConfig[self.dwAmuletRank].dwAttackMin + math.floor((AmuletRankConfig[self.dwAmuletRank].dwAttackMax - AmuletRankConfig[self.dwAmuletRank].dwAttackMin) * self.dwGrowthValue / AmuletRankConfig[self.dwAmuletRank].dwMaxGrowth) + (setInlayAppendProperty.Attack or 0) + (setAptitudeAppendProperty.Attack or 0)
	tAttr.dwDefense = AmuletLevelPropertyConfig[self.dwAmuletLevel].dwDefense + AmuletRankConfig[self.dwAmuletRank].dwDefenseMin + math.floor((AmuletRankConfig[self.dwAmuletRank].dwDefenseMax - AmuletRankConfig[self.dwAmuletRank].dwDefenseMin) * self.dwGrowthValue / AmuletRankConfig[self.dwAmuletRank].dwMaxGrowth) + (setInlayAppendProperty.Defense or 0) + (setAptitudeAppendProperty.Defense or 0)
	tAttr.dwHPMax = AmuletLevelPropertyConfig[self.dwAmuletLevel].dwHPMax + AmuletRankConfig[self.dwAmuletRank].dwHPMaxMin + math.floor((AmuletRankConfig[self.dwAmuletRank].dwHPMaxMax - AmuletRankConfig[self.dwAmuletRank].dwHPMaxMin) * self.dwGrowthValue / AmuletRankConfig[self.dwAmuletRank].dwMaxGrowth) + (setInlayAppendProperty.HPMax or 0) + (setAptitudeAppendProperty.HPMax or 0)
	tAttr.dwFlee = AmuletLevelPropertyConfig[self.dwAmuletLevel].dwFlee + AmuletRankConfig[self.dwAmuletRank].dwFleeMin + math.floor((AmuletRankConfig[self.dwAmuletRank].dwFleeMax - AmuletRankConfig[self.dwAmuletRank].dwFleeMin) * self.dwGrowthValue / AmuletRankConfig[self.dwAmuletRank].dwMaxGrowth) + (setInlayAppendProperty.Flee or 0) + (setAptitudeAppendProperty.Flee or 0)
	local objSystem = self:GetPlayer():GetSystem('CSkillSystem')
	objSystem:NotifyAmuletUpdate(tAttr)
end

--检测牺牲
function CAmuletSystem:CheckSacrifice(tabInfo)
	if not tabInfo.dwItemID then return false end
	local objSystem = self:GetPlayer():GetSystem('CItemSystem')
	local objItem = objSystem:GetItem(tabInfo.dwItemID)
	if not objItem then return false end
	if not self:IsSacrifice(objItem) then return false end
	return true
end
--执行牺牲
function CAmuletSystem:DoSacrifice(tabInfo)
	local objSystem = self:GetPlayer():GetSystem('CItemSystem')
	objSystem:TrySplitItemToHolder(tabInfo.dwItemID, tabInfo.dwNumber, tabInfo.eHolder);
end
--一键放入
function CAmuletSystem:OneKeySacrifice(tabInfo)
	local objSystem = self:GetPlayer():GetSystem('CItemSystem')
	objSystem:TryMoveItemListToAmulet(tabInfo);
end
----------------------------------------------------------------------------------------------------
--是否为祭品
function CAmuletSystem:IsSacrifice(objItem)
	--是否为祭品
	if not (objItem:IsEquip() or self:IsIntensifyStone(objItem)) then
		return false
	end
	return true
end
--是否为精铁锭
function CAmuletSystem:IsIntensifyStone(objItem)
	if objItem:GetEnumID() == AmuletIntensifyConfig.IntensifyStoneId then
		return true
	end
	return false
end
--是否满阶
function CAmuletSystem:IsMaxGrade()
	--local objSystem = self:GetPlayer():GetSystem('CItemSystem')

	local dwAmuletLevel = self.dwAmuletLevel;
	if (dwAmuletLevel == #AmuletLevelConfig) then
		return true
	end
	return false
end
--是否消耗足够
function CAmuletSystem:IsEnoughCost(tabInfo)
	local objItemSystem = self:GetPlayer():GetSystem('CItemSystem')
	local dwAmuletLevel = self.dwAmuletLevel
	--升阶石
	local dwStoneEnum,dwCostStone =  AmuletUpgradeConfig.CostStone(dwAmuletLevel);
	local dwStoneNum = objItemSystem:GetEnumItemNumInPacket(dwStoneEnum);
	if dwCostStone > dwStoneNum then
		--自动购买
		if tabInfo.bAutoBuy then
			local objMallSystem = self:GetPlayer():GetSystem("CMallSystem")
			local dwBuyNumber = dwCostStone - dwStoneNum;
			local bBuySuccess = false
			if tabInfo.bGold then
				bBuySuccess = objMallSystem:BuyItemByIDGold(dwBuyNumber,dwStoneEnum)
			else
				bBuySuccess = objMallSystem:BuyItemByIDBindGold(dwBuyNumber,dwStoneEnum)
			end
			if not bBuySuccess then return false end
		else
			return false
		end
	end
	--银两
	local dwCostMoney = math.ceil(AmuletUpgradeConfig.CostMoney(dwAmuletLevel) * self.nDiscount_UpGrade);
	if not objItemSystem:IsPacketMoneyEnough(dwCostMoney) then
		return false
	end;
	return true
end
--获得成长度
function CAmuletSystem:GetGrowthRate(dwGrowthValue)
	local dwMaxGrowthValue = AmuletRankConfig[self.dwAmuletRank].dwMaxGrowth
	local dwGrowthRate = dwGrowthValue/dwMaxGrowthValue
	return dwGrowthRate
end
--获得评分
function CAmuletSystem:GetScore()
	if not self:HasAuthority('Amulet') then return 0 end
	return AmuletScoreFunction(self.dwAmuletLevel,self.dwAmuletRank,self.dwGrowthValue,self.dwAmuletInlayLevel);
end

--获得返回是否触发技能ID 
function CAmuletSystem:GetSkillID()
	local dwRate = SkillHappenRate[self.dwAmuletRank]
	dwRate = dwRate or 0
	if  math.random(100) <= (dwRate * 100) then 
		return AmuletLevelConfig[self.dwAmuletLevel].skillShowInfo[1];
	else
		return 0;
	end
end

--获得增加成长值
function CAmuletSystem:GetAddGrowthValue(tabSacrificeList)
	local dwAddGrowthValue = 0
	local tabSacrificeCost = {}
	local tabEquipValueList = {}
	local tabStoneValueList = {}
	--local objItemSystem = self:GetPlayer():GetSystem('CItemSystem')
	
	for _,objItem in pairs(tabSacrificeList) do
		if objItem:IsAlive() then
			local dwAmuletLevel = self.dwAmuletLevel;
			local dwSacrificeLevel = objItem:GetLevel();
			local dwSacrificeQuality = objItem:GetQuality();
			local dwSacrificeNumber = objItem:GetCount();
			local dwAddValue = 0
			if self:IsIntensifyStone(objItem) then
				dwAddValue = math.ceil(AmuletIntensifyConfig.AddIntensifyValueByStone(dwAmuletLevel) * self.nMultiple_Intensify)
				table.insert(tabStoneValueList,{
					objItem = objItem,
					dwAddValue = dwAddValue, dwNumber = dwSacrificeNumber
				})
			end
			if objItem:IsEquip() then
				local dwSacrificeScore = objItem:GetScore();
				dwAddValue = math.ceil(AmuletIntensifyConfig.AddIntensifyValueByEquip(
					dwAmuletLevel,dwSacrificeLevel,dwSacrificeQuality,dwSacrificeScore
				) * self.nMultiple_Intensify)
				table.insert(tabEquipValueList,{
					objItem = objItem,
					dwAddValue = dwAddValue, dwNumber = dwSacrificeNumber
				})
			end
		end
	end;
	table.sort(tabEquipValueList,
		function(a,b)
			if a.dwAddValue < b.dwAddValue then
				return true
			end
		end
	)
	table.sort(tabStoneValueList,
		function(a,b)
			if a.dwNumber < b.dwNumber then
				return true
			end
		end
	)
	local dwMaxGrowthValue = AmuletRankConfig[self.dwAmuletRank].dwMaxGrowth
	for _,v in ipairs(tabEquipValueList) do
		table.insert(tabSacrificeCost,{ objItem = v.objItem, dwNumber = 1 })
		dwAddGrowthValue = dwAddGrowthValue + v.dwAddValue
		if self.dwGrowthValue + dwAddGrowthValue > dwMaxGrowthValue then
			dwAddGrowthValue = dwMaxGrowthValue - self.dwGrowthValue
			return dwAddGrowthValue,tabSacrificeCost
		end
	end
	for _,v in ipairs(tabStoneValueList) do
		local dwCurGrowthValue = v.dwAddValue * v.dwNumber
		if self.dwGrowthValue + dwAddGrowthValue + dwCurGrowthValue > dwMaxGrowthValue then
			dwCurGrowthValue = dwMaxGrowthValue - self.dwGrowthValue - dwAddGrowthValue
			local dwNumber = math.ceil(dwCurGrowthValue/v.dwAddValue)
			table.insert(tabSacrificeCost,{ objItem = v.objItem, dwNumber = dwNumber })
			dwAddGrowthValue = dwAddGrowthValue + dwCurGrowthValue
			return dwAddGrowthValue,tabSacrificeCost
		else
			table.insert(tabSacrificeCost,{ objItem = v.objItem, dwNumber = v.dwNumber })
			dwAddGrowthValue = dwAddGrowthValue + dwCurGrowthValue
		end
	end
	return dwAddGrowthValue,tabSacrificeCost
end

-- @brief 广播消息
-- @param string szName 角色名称
-- @param number dwID 角色ID
function CAmuletSystem:BoradCast(szName,dwID)
	local dwMyID = self:GetPlayer():GetRoleID()
	local tabPlayerList = CMapManager:GetPlayer();

	for dwRoleID, objPlayer in pairs(tabPlayerList) do
		objPlayer.OnGetAmuletBroadCastMsg {
			Name = szName ,
			RoleID = dwID ,
			Level = self.dwAmuletLevel ;							--宝甲阶级
			Rank = self.dwAmuletRank ;								--宝甲等级
			Time = GetCurTime() 
		}
	end
end
--打开权限事件处理
function CAmuletSystem:OnEventCenter(szEventName,Param1)
	if szEventName == enumPlayerEventType.EventGetAuthority and Param1 == 'Amulet' then
		self:UpdataAttr();
	end
end

function CAmuletSystem:Inlay()
    local dwAmuletInlayLevel = self.dwAmuletInlayLevel + 1;
    local dwErrorCode = self:CanInlay(dwAmuletInlayLevel);
    if dwErrorCode == 0 then
        self:DoInlay(dwAmuletInlayLevel);
    end
    self:GetPlayer().AmuletInlayMsg {
        dwErrorCode = dwErrorCode;
        dwAmuletInlayLevel = dwAmuletInlayLevel;
    };
end

function CAmuletSystem:CanInlay(dwAmuletInlayLevel)
    local setData = AmuletInlayConfig.Data[dwAmuletInlayLevel];
    local setError = AmuletInlayConfig.Error;
	if dwAmuletInlayLevel >= AmuletInlayConfig.Open.Level then
		return AmuletInlayConfig.Open.Prompt;
	end
    if setData == nil then
        return setError.FullLevel;
    end
    if setData.NeedAmuletLevel > self.dwAmuletLevel then
        return setError.LackAmuletLevel;
    end
    if self:GetPlayer():
            GetSystem('CItemSystem'):
            GetEnumItemNumInPacket(setData.CostItem.ID) <
                setData.CostItem.Num then
        return setError.ItemNotEnough;
    end
    return 0;
end

function CAmuletSystem:DoInlay(dwAmuletInlayLevel)
    local setData = AmuletInlayConfig.Data[dwAmuletInlayLevel];
	local isOK, _ = self:
        GetPlayer():
        GetSystem('CItemSystem'):
        DelEnumItemInPacket(setData.CostItem.ID,
            setData.CostItem.Num,
            false,
            _G.ItemSysOperType.Amulet);
	if isOK then
		self.objDBQuery:SetAmuletInlayLevel(dwAmuletInlayLevel);
        self.dwAmuletInlayLevel = dwAmuletInlayLevel;
		self:UpdataAttr();
        local strText = AmuletInlayConfig.Text.Notice(
            self:GetPlayer():GetInfo().szRoleName, self.dwAmuletInlayLevel);
        if strText then
            CScriptManager:ChatNoticeAll(nil,
                7,
                false,
                nil,
                strText,
                true);
        end
    else
		_err("CAmuletSystem:DoInlay DelItem Error");
	end
end

-- @brief 修改阶级和等级值
-- @param number dwLevel 阶级
-- @param number dwRank 等级
function CAmuletSystem:AlterLevelAndRank(dwLevel, dwRank)
    if dwLevel > 0 then
        self.dwAmuletLevel = dwLevel;
        self.objDBQuery:SetAmuletLevel(self.dwAmuletLevel)
    end
    if dwRank > 0 then
        self.dwAmuletRank = dwRank;
        self.objDBQuery:SetAmuletRank(self.dwAmuletRank)
    end

    if dwLevel > 0 or dwRank > 0 then
		self:UpdataAttr();
        self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(
            enumPlayerEventType.EventUpgradeAmulet,
            self.dwAmuletLevel,
            self.dwAmuletRank,
            self.dwGrowthValue,
            self:GetPlayer():
                GetSystem('CTianGuanCiFuSystem'):Get_AmuletUpGrade()
        );
        self:GetAmuletInfo(self:GetPlayer():GetRoleID());
    end
end

-- @brief 开始精练
function CAmuletSystem:AmuletRefine(nCount)
    local setConsume = AmuletAptitudeConfig.GetConsume(self.dwAptitude + 1);
	local Max = AmuletAptitudeConfig.GetMaxDegree(self.dwAmuletLevel) 
	if Max < (self.dwAptitude + nCount) then
		nCount = Max - self.dwAptitude 
	end
    local setParam = {
        dwItemID = setConsume.dwItemID;
        dwNum = setConsume.dwNum * nCount;
        dwLevel = self.dwAmuletLevel;
		nCount  = nCount
    };
    local dwErrorCode = AmuletAptitudeConfig.CanDo(self, setParam);
    if dwErrorCode == 0 then
        AmuletAptitudeConfig.Do(self, setParam);
        self.objDBQuery:SetAptitude(self.dwAptitude);
		self:UpdataAttr();
        self:GetAmuletInfo(self:GetPlayer():GetRoleID());
    end
    self:GetPlayer():AmuletRefineMsg{ErrorCode = dwErrorCode};
end

-- @brief 是否满精练值
function CAmuletSystem:IsFull()
   return AmuletAptitudeConfig.GetMaxDegree(self.dwAmuletLevel) <= 
       self.dwAptitude;
end

-- @brief 能否删除物品
-- @param table setData 物品信息
-- @return boolean 是否
function CAmuletSystem:IsCanDeleteItem(setData)
    if self:GetPlayer():GetSystem("CItemSystem"):
        CheckDelEnumItemInPacketCond(
            setData[1], setData[2]) then
        return true;
    else
        return false;
    end
end

-- @breif 删除物品
-- @param table setData 物品信息
function CAmuletSystem:DeleteItem(setData)
    self:GetPlayer():GetSystem("CItemSystem"):DelEnumItemInPacket(
        setData[1],
        setData[2],
        false,
        _G.ItemSysOperType.Amulet);
end

-- @brief 获取精练值
-- @return number 精练值
function CAmuletSystem:GetAptitude()
   return self.dwAptitude;
end

-- @brief 修改精练值
function CAmuletSystem:ModifyAptitude(dwValue)
   self.dwAptitude = dwValue;
end
