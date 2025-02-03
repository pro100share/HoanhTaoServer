--[[
   [ \brief 排行榜奖励
   [ \author 赵旭
   [ \date 2014-05-05
   ]]

-- 系统对象
_G.CChartAwardSystem = {};

-- 已经领取的奖励列表 {榜单1, 榜单2 ...}
CChartAwardSystem.tReceived = {};

--[[
   [ \brief 构造函数
   [ \return object 系统
   ]]
function CChartAwardSystem:new()
	local obj = CSystem:new("CChartAwardSystem");
	for index, value in pairs(CChartAwardSystem) do
        if type(value) == "function" then
            obj[index] = value;
        end
	end
	return obj;
end

--[[
   [ \brief 创建函数
   ]]
function CChartAwardSystem:Create()
	self.oDB = CChartAwardDB:new(
        self:GetPlayer():GetDBQuery(), 
        self
    );
    self.oDB:Create();

    self.tReceived = self:GetPlayer():
        GetLineData("CChartAwardSystem")[1].tReceived;

    return true;
end

--[[
   [ \brief 换线同步数据
   ]]
function CChartAwardSystem:OnChangeLineBegin()
	self:GetPlayer():SetLineData("CChartAwardSystem", 
        {tReceived = self.tReceived});
end

--[[
   [ \brief 请求领取奖励
   [ \param number nID 奖励编号
   ]]
function CChartAwardSystem:ChartAwardGet(nID)
    local nErrorCode = _G.ChartAwardConfig:CanGet(self, nID);
    if nErrorCode == 0 then
        if self:GiveAwardItem(nID) then
            self:SaveReceived(nID);
        else
            nErrorCode = _G.ChartAwardConfig.ErrorCode[1];
        end
    end
    self:SendResultMsg(nErrorCode, nID);
end

--[[
   [ \brief 给予玩家奖励项
   [ \param number nID 排行榜编号
   [ \return 是否成功
   ]]
function CChartAwardSystem:GiveAwardItem(nID)
    local tAwardItems = {};
    for k, v in pairs(_G.ChartAwardConfig:GetAwardItem(
            nID, 
            CChartManager:GetChartNumber(
                nID, "dwRoleID", self:GetPlayer():GetRoleID()
            )
        )) do
        table.insert(tAwardItems, {
            dwItemEnum = v.ItemEnumID;
            dwItemNumber = v.ItemNumber;
            dwBindType = v.BindType;
            dwLifeTime = v.LifeTime;
        });
    end
    local oItemSystem = self:GetPlayer():GetSystem("CItemSystem");
    if oItemSystem:IsEnumItemListCanAddToPacket(tAwardItems) then
        oItemSystem:AddEnumItemListToPacket(
            tAwardItems, 
            _G.ItemSysOperType.ChartAward
        );
        return true;
    else
        return false;
    end
end

--[[
   [ \brief 保存玩家已经领取的奖励
   [ \param number nID 排行榜编号
   ]]
function CChartAwardSystem:SaveReceived(nID)
    self.tReceived[nID] = nID;
    self.oDB:InsertReceived(self:GetPlayer():GetRoleID(), nID);
end

--[[
   [ \brief 发送已领取奖励列表
   ]]
function CChartAwardSystem:SendReceivedsMsgImpl()
  self:GetPlayer().ChartAwardSyncReceivedsMsg{IDs = self.tReceived};
end

--[[
   [ \brief 发送领取奖励消息
   [ \param number nErrorCode 错误码
   [ \param number nID 奖励编号
   ]]
function CChartAwardSystem:SendResultMsg(nErrorCode, nID)
    self:GetPlayer().ChartAwardResultMsg{ErrorCode = nErrorCode; ID = nID};
end

--[[
   [ \brief 删除玩家接收的奖励记录
   [ \param number nID 奖励编号
   ]]
function CChartAwardSystem:DeleteReceivedImpl(nID)
    self.tReceived[nID] = nil;
end

