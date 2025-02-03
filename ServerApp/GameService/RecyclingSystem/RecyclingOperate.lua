--[[
    [ \brief 资源回收系统活动剩余次数逻辑
    [ \author 李中昌
    [ \date 2014-8-5
    ]]

-- 配置表
local tConfig = _G.RecyclingConfig;

-- 货币类型对应操作函数表    
local tMoneyFunction = {
    [1] = function(oItemSystem, nMoney)
        return oItemSystem:CostPacketMoney(
            nMoney,
            _G.ItemSysOperType.Recycling);
    end;
    [2] = function(oItemSystem, nMoney)
        return oItemSystem:CostBindGold(
            nMoney,
            _G.ItemSysOperType.Recycling);
    end;
    [3] = function(oItemSystem, nMoney)
        return oItemSystem:CostGold(
            nMoney,
            _G.ItemSysOperType.Recycling);
    end;
};    
    
--[[ 
    [ \brief 更新所有活动的昨日剩余次数
    ]]
function CRecyclingSystem:UpdateCount()
    _G.RecyclingScript:UpdateCount(self.tCount, self:GetPlayer());
    
    self:SynchronizeAll();
end

--[[ 
    [ \brief 资源追回
    [ \param number nID 资源追回的ID: -1代表全部
    [ \param number nMoneyType 货币类型 1:银两, 2:礼金, 3:元宝 
    ]]    
function CRecyclingSystem:Recycling(nID, nMoneyType)
    -- 全部追回
    if nID == -1 then
        self:AllRecycling(nMoneyType);
    else
       self:SingleRecycling(nID, nMoneyType);
    end 
end

--[[ 
    [ \brief 次数重置归零 代表已经追回
    [ \param number nID 资源追回的ID
    ]]    
function CRecyclingSystem:ResetCount(nID)
    if nID == -1 then
        for k, v in pairs(self.tCount) do
            self.tCount[k] = 0;
        end
    elseif self.tCount[nID] then
        self.tCount[nID] = 0;
    end
    
    self:SynchronizeAll();
    self:UpdateDB();
end

--[[ 
    [ \brief 追回单个活动资源
    [ \param number nID 资源追回的ID
    [ \param number nMoneyType 货币类型 1:银两, 2:礼金, 3:元宝 
    ]]
function CRecyclingSystem:SingleRecycling(nID, nMoneyType)
    -- 检查剩余次数
    if not self.tCount[nID] or self.tCount[nID] < 1 then
        return; 
    end
    
    if tMoneyFunction[nMoneyType](
        self:GetPlayer():GetSystem("CItemSystem"),
        _G.RecyclingScript:GetNeedMoney(
            nID,
            nMoneyType,
            self.tCount[nID],
            self:GetPlayer():GetLevel())) then
        self:GiveResource(self:CalculateAllResource(nID, {}), nMoneyType);
        self:ResetCount(nID);
    end
end

--[[ 
    [ \brief 追回所有活动资源
    [ \param number nMoneyType 货币类型 1:银两, 2:礼金, 3:元宝 
    ]]
function CRecyclingSystem:AllRecycling(nMoneyType)
    local nMoney = 0;
    local tResource = {};
    for k, v in pairs(self.tCount) do
        if v > 0 then
            nMoney = nMoney + 
                _G.RecyclingScript:GetNeedMoney(
                    k,
                    nMoneyType,
                    self.tCount[k],
                    self:GetPlayer():GetLevel()
                );
            
            self:CalculateAllResource(k, tResource)
        end
    end
    
    if nMoney == 0 then
        return;
    end
    
    if tMoneyFunction[nMoneyType](
        self:GetPlayer():GetSystem("CItemSystem"),
        nMoney) then
        self:GiveResource(tResource, nMoneyType);
        self:ResetCount(-1);
    end
    
end

--[[ 
    [ \brief 统计一种类型的资源
   [ \param number nID 计算资源的ID
   [ \param number nResourceType  资源的类型
   [ \param number tResource 统计的资源表
    ]]
function CRecyclingSystem:CalculateResource(nID, nResourceType, tResource)
    if tConfig.Resources[nID].Resources[nResourceType] then
        if not tResource[nResourceType] then
            tResource[nResourceType] = 0;
        end
       
        tResource[nResourceType] = tResource[nResourceType] + 
            _G.RecyclingScript:GetPrize(
                nID,
                self.tCount[nID],
                self:GetPlayer():GetLevel()
            )[nResourceType];
    end 
end

--[[ 
    [ \brief 统计一种类型的资源
   [ \param number nID 计算资源的ID
   [ \param number tResource 统计的资源表
    ]]
function CRecyclingSystem:CalculateAllResource(nID, tResource)
    for _, v in pairs(tConfig.PicList) do
        self:CalculateResource(nID, v, tResource);
    end
    return tResource;
end    
    
--[[ 
    [ \brief 给资源
    [ \param table tResource 资源表
    [ \param number nMoneyType 货币类型 1:银两, 2:礼金, 3:元宝 
    ]]
function CRecyclingSystem:GiveResource(tResource, nMoneyType)
    -- 根据货币类型 计算给的资源百分比
    local nRate = tConfig.Percent.TheMore;
    if nMoneyType == 3 then
        nRate = tConfig.Percent.ThePerfect;
    end
    for k, v in pairs(tResource) do
        tResource[k] = math.floor(tResource[k] * (nRate/100));
    end
    local oPlayer = self:GetPlayer()
    local CItemSystem = oPlayer:GetSystem("CItemSystem")
    if tResource[tConfig.PicList.Money] and 
        CItemSystem:IsCanAddPacketMoney(tResource[tConfig.PicList.Money]) then
        CItemSystem:AddPacketMoney(
            tResource[tConfig.PicList.Money], _G.ItemSysOperType.Recycling)
    end
    if tResource[tConfig.PicList.Exp] then
        oPlayer:AddExp(tResource[tConfig.PicList.Exp]);
    end
    if tResource[tConfig.PicList.BindMoney] then
        CItemSystem:AddBindGold(
            tResource[tConfig.PicList.BindMoney], _G.ItemSysOperType.Recycling);
    end
    if tResource[tConfig.PicList.Gas] then
        local CFiveElemSystem = oPlayer:GetSystem("CFiveElemSystem")
        CFiveElemSystem:ChangeAttrAll(
            tResource[tConfig.PicList.Gas], _G.FiveElemSysOperType.Recycling)
        CFiveElemSystem:UpdateInfoToClient(oPlayer,2)
    end
    if tResource[tConfig.PicList.Reputation] then
         oPlayer:GetSystem("CErrantHonorSystem"):AddErrantHonorValue(
            tResource[tConfig.PicList.Reputation]);
    end
end
