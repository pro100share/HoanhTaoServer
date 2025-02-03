--[[
说明：360红钻系统
作者：赵旭
]] 

-- 系统对象
_G.C360RedJewelSystem = {};
-- 数据库对象
C360RedJewelSystem.objDB = nil;
-- 红钻信息
C360RedJewelSystem.setInfo = {
	-- 等级
	dwLevel = 0;
	-- 类型
	strType = "";
	-- 是否有效
	dwIsActive = 0;
	 -- 成长值
	dwGrowth = 0;
};
-- 已领取的奖励
C360RedJewelSystem.setReward = {};

-- @brief 构造函数
-- @return object 系统
function C360RedJewelSystem:new()
	local obj = CSystem:new("C360RedJewelSystem");
	for index, value in pairs(C360RedJewelSystem) do
		if type(value) == "function" then
			obj[index] = value;
		end
	end
	return obj;
end

-- @brief 创建函数
-- @param boolean bIsChangeLine 是否换线
-- @return boolean 是否创建成功
function C360RedJewelSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if objPlayer == nil then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	if objDB == nil then
		return false;
	end;
	self.objDB = C360RedJewelSystemDB:new(objDB, self);

    local setData = objPlayer:GetLineData("C360RedJewelSystem")[1];
    self.setReward = setData.setReward;
	if bIsChangeLine == 0 then
		 self.setInfo = {
            dwLevel = 0;
            strType = "";
            dwIsActive = 0;
            dwGrowth = 0;
        };
        self:Get360RedJewel();
	else
		self.setInfo = setData.setInfo;
	end;
	
    return true;
end

-- @brief 更新函数
function C360RedJewelSystem:Update()
end

-- @brief 析构函数
function C360RedJewelSystem:Destroy()
end

-- @brief 进入场景函数
function C360RedJewelSystem:OnEnterScene()
    self:SendReward();
end

-- @brief 换线函数
-- @param number dwNewLineID 新线路ID
function C360RedJewelSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer()
    self:GetPlayer():SetLineData("C360RedJewelSystem", {
		setInfo = self.setInfo;
        setReward = self.setReward;
    });
end

-- @brief 获取360红钻信息
function C360RedJewelSystem:Get360RedJewel()
    CKernelApp.PlayerGet360RedJewelMsg {
        AccountID = self:GetPlayer():GetAccountID();
    };
end

-- @brief 接收到360红钻信息
-- @param table setInfo 信息
-- {
--      -- 等级
--      dwLevel
--      -- 类型
--      strType
--      -- 是否有效
--      dwIsActive
--      -- 成长值
--      dwGrowth
-- }
function C360RedJewelSystem:Receive360RedJewel(setInfo)
	self.setInfo = setInfo;
    local setTitleInfo = RedJewelConfig.GetShowInfo(setInfo.dwLevel,
        setInfo.strType,
        setInfo.dwIsActive,
        setInfo.dwGrowth);
    if setTitleInfo.bResult then
        local objPlayer = self:GetPlayer();
        objPlayer:GetSystem("PlayerShowTextSystem"):SetSp(setTitleInfo.dwType);
        objPlayer.Receive360RedJewelMsg {
            AccountID = objPlayer:GetAccountID();
            Level = setInfo.dwLevel;
            Type = setInfo.strType;
            IsActive = setInfo.dwIsActive;
            Growth = setInfo.dwGrowth;
        };
    end
end

-- @brief 领取360红钻奖励
-- @param number dwItemIndex 奖励项目索引
function C360RedJewelSystem:Get360RedJewelReward(dwItemIndex)
   local dwErrorCode = RedJewelConfig.CanGetReward(dwItemIndex, self.setInfo, self.setReward);
    if dwErrorCode == 0 then
        local setAddItemList = {};
        local setReward = RedJewelConfig.GetReward(dwItemIndex);
        for k, v in pairs(setReward) do
            table.insert(setAddItemList, {
                dwItemEnum = v.itemId;
                dwItemNumber = v.itemNum;
                dwBindType = v.dwBindType;
                dwLifeTime = v.dwLifeTime;
            });
        end
        local objItemSystem = self:GetPlayer():GetSystem("CItemSystem");
        if objItemSystem:IsEnumItemListCanAddToPacket(setAddItemList) then
            objItemSystem:AddEnumItemListToPacket(setAddItemList, _G.ItemSysOperType.CommercialAct);
            
            self.objDB:InsertReward(self:GetPlayer():GetAccountID(),
                dwItemIndex);
            self:CacheReward(dwItemIndex);
        else
            dwErrorCode = RedJewelConfig.Error[1];
        end
    end
    self:GetPlayer().GetRewardResultMsg {
        ResultType = dwErrorCode;
        ItemIndex = dwItemIndex;
    };
end

-- @brief 缓存已领取的奖励
-- @param number dwItemIndex 奖励项索引
function C360RedJewelSystem:CacheReward(dwItemIndex)
    table.insert(self.setReward, dwItemIndex);
end

-- @brief 发送已领取的全部奖励
function C360RedJewelSystem:SendReward()
    if next(self.setReward) == nil then
        return;
    end
    self:GetPlayer().SynGetRewardInfoMsg {
        GetInfoTable = self.setReward;
    };
end
