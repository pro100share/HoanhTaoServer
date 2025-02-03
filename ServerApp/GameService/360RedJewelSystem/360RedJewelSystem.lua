--[[
˵����360����ϵͳ
���ߣ�����
]] 

-- ϵͳ����
_G.C360RedJewelSystem = {};
-- ���ݿ����
C360RedJewelSystem.objDB = nil;
-- ������Ϣ
C360RedJewelSystem.setInfo = {
	-- �ȼ�
	dwLevel = 0;
	-- ����
	strType = "";
	-- �Ƿ���Ч
	dwIsActive = 0;
	 -- �ɳ�ֵ
	dwGrowth = 0;
};
-- ����ȡ�Ľ���
C360RedJewelSystem.setReward = {};

-- @brief ���캯��
-- @return object ϵͳ
function C360RedJewelSystem:new()
	local obj = CSystem:new("C360RedJewelSystem");
	for index, value in pairs(C360RedJewelSystem) do
		if type(value) == "function" then
			obj[index] = value;
		end
	end
	return obj;
end

-- @brief ��������
-- @param boolean bIsChangeLine �Ƿ���
-- @return boolean �Ƿ񴴽��ɹ�
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

-- @brief ���º���
function C360RedJewelSystem:Update()
end

-- @brief ��������
function C360RedJewelSystem:Destroy()
end

-- @brief ���볡������
function C360RedJewelSystem:OnEnterScene()
    self:SendReward();
end

-- @brief ���ߺ���
-- @param number dwNewLineID ����·ID
function C360RedJewelSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer()
    self:GetPlayer():SetLineData("C360RedJewelSystem", {
		setInfo = self.setInfo;
        setReward = self.setReward;
    });
end

-- @brief ��ȡ360������Ϣ
function C360RedJewelSystem:Get360RedJewel()
    CKernelApp.PlayerGet360RedJewelMsg {
        AccountID = self:GetPlayer():GetAccountID();
    };
end

-- @brief ���յ�360������Ϣ
-- @param table setInfo ��Ϣ
-- {
--      -- �ȼ�
--      dwLevel
--      -- ����
--      strType
--      -- �Ƿ���Ч
--      dwIsActive
--      -- �ɳ�ֵ
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

-- @brief ��ȡ360���꽱��
-- @param number dwItemIndex ������Ŀ����
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

-- @brief ��������ȡ�Ľ���
-- @param number dwItemIndex ����������
function C360RedJewelSystem:CacheReward(dwItemIndex)
    table.insert(self.setReward, dwItemIndex);
end

-- @brief ��������ȡ��ȫ������
function C360RedJewelSystem:SendReward()
    if next(self.setReward) == nil then
        return;
    end
    self:GetPlayer().SynGetRewardInfoMsg {
        GetInfoTable = self.setReward;
    };
end
