--[[
	[\brief 系统基本函数
	[\author 王凌波
	[\date 2014-6-19
	[供系统内部调用
  ]]

-- 战骑诀配置表
local tConfig = _G.ZhanQiJueConfig;
-- 战骑诀公用函数
local ShareFunction = _G.ZhanQiJueFunctions;

--[[
    [\brief 同步数据
  ]]
function CZhanQiJueSystem:Synchronize()
    self:GetPlayer().ZhanQiJue_SynchronizeMsg{nEXP = self.nEXP,
        nBlessEXP = self:GetPlayer():GetSystem("CTianGuanCiFuSystem"):
        Get_ZhanQiJue(), bBless = self.bBless};
end

--[[
    [\brief 增加属性
  ]]
function CZhanQiJueSystem:AddAttribute()
    local tPlayerAttr = _G.SSingleAttrChange:new();
    for k, v in pairs(ShareFunction.GetAttr(self.nEXP, self.bBless)) do
        tPlayerAttr[k] = tPlayerAttr[k] + v;
    end
    self:GetPlayer():GetSystem("CSkillSystem"):
        NotifyZhanQiJueUpdate(tPlayerAttr);
end

--[[
    [\brief 计算所需物品数量和修炼路径
    [\param number nPracticeID 修炼类型id，1表示“修炼”，2表示“一键修炼”
    [\return number 所需物品数量
    [\return table 修炼值加成集合(修炼路径)
  ]]
function CZhanQiJueSystem:GetItemNum(nNextIndex, nDiffer) 
    -- 获得修炼路径
    local tPlusSet = self:GetPlusSet(nNextIndex, nDiffer);
    local nNeedNum = ShareFunction.GetDanNeedNum(nNextIndex);
    local nCountInPackage = self:GetPlayer():GetSystem("CItemSystem"):
        GetEnumItemNumInPacket(ShareFunction.GetDanNeedId(nNextIndex));
    local nUseNum = nNeedNum * (#tPlusSet);
    -- 如果背包中的物品数量不够
    if nUseNum > nCountInPackage then
        nUseNum = nCountInPackage;
        -- 校正修炼路径
        local nCutIndex = math.floor(nUseNum / nNeedNum);
        local len = #tPlusSet;
        while len > nCutIndex do
            table.remove(tPlusSet, len);
            len = len - 1;
        end
    else
        -- 背包中的物品数量足够
    end
    return nUseNum, tPlusSet;
end

--[[
    [\brief 消耗物品
    [\param number nPracticeID 修炼类型id，1表示“修炼”，2表示“一键修炼”
    [\return table 修炼值加成集合(修炼路径)
  ]]
function CZhanQiJueSystem:ConsumeItem(nPracticeID)
    local nNextIndex = ShareFunction.GetDanIndex(self.nEXP, self.bBless) + 1;
    local nDiffer = ShareFunction.GetPlus(nNextIndex);
    -- 如果是“修炼”
    if nPracticeID == 1 then
        nDiffer = ShareFunction.GetPlus(nNextIndex);
    -- 如果是“一键修炼”
    elseif nPracticeID == 2 then 
        nDiffer = ShareFunction.GetMaxEXPByIndex(nNextIndex) - self.nEXP;
    else
        _err("args error in CZhanQiJueSystem:ConsumeItem");
        return;
    end
    -- 计算所需物品数量和修炼路径
    local nUseNum, tPlusSet = self:GetItemNum(nNextIndex, nDiffer);
    -- 消耗物品
    if nUseNum > 0 then
        self:GetPlayer():GetSystem("CItemSystem"):DelEnumItemInPacket(
            ShareFunction.GetDanNeedId(nNextIndex), nUseNum, false, 
            _G.ItemSysOperType.ZhanQiJue);
    end
    return tPlusSet;
end

--[[
    [\brief 是否给暴击奖励
    [\param number nDanIndex 内丹索引
    [\return boolean 是否给暴击奖励的布尔值，true即给暴击，false则不给暴击
  ]]
function CZhanQiJueSystem:WillGiveBonus(nDanIndex) 
    return math.random(1, 100) <= 
        ShareFunction.GetBonusChance(nDanIndex) * 100;
end

--[[
    [\brief 计算某一内丹修炼某一特定长度的修炼路径
    [\param number nDanIndex 内丹索引
    [\param number nDiffer 特定长度值
    [\return table 修炼路径
  ]]
function CZhanQiJueSystem:GetPlusSet(nDanIndex, nDiffer)
    local tPlusSet = {};
    while nDiffer > 0 do
        local nRealPlus = self:WillGiveBonus(nDanIndex) and 
            ShareFunction.GetBonus(nDanIndex) or 
            ShareFunction.GetPlus(nDanIndex);
        -- 如果是合法的加成值
        if nRealPlus > 0 then 
            tPlusSet[#tPlusSet+1] = nRealPlus;
            nDiffer = nDiffer - nRealPlus;
        else
            -- while保护
            _err("nRealPlus<=0 in CZhanQiJueSystem:GetPlusSet");
            break;
        end
    end
    return tPlusSet;
end

--[[
    [\brief 增加修炼值
    [\param table tPlusSet 修炼路径
    [\return number 暴击数
  ]]
function CZhanQiJueSystem:HitAddEXP(tPlusSet) 
    local nNewEXP       = self.nEXP;
    local nNextDanIndex = ShareFunction.GetDanIndex(self.nEXP, self.bBless) + 1;
    local nMaxEXP       = ShareFunction.GetMaxEXPByIndex(nNextDanIndex);
    local nDeltaEXP, nDeltaBonus = 0, 0;
    -- 按修炼路径获得新修炼值
    for _, v in pairs(tPlusSet) do
        nNewEXP = nNewEXP + v;
        -- 如果是暴击值
        if v > ShareFunction.GetPlus(nNextDanIndex) then 
            nDeltaBonus = nDeltaBonus + v;
        else
            nDeltaEXP = nDeltaEXP + v;
        end
    end
    -- 如果超过最大经验值
    if nNewEXP > nMaxEXP then nNewEXP = nMaxEXP; end
    -- 开始赐福
    self:StartBless(nNextDanIndex, nNewEXP);
    -- 设置新修炼值
    self:SetEXP(nNewEXP);
    return nDeltaEXP, nDeltaBonus;
end

--[[
    [\brief 启动赐福
    [\param number nProcessIndex 正在修炼的内丹索引
    [\param number nNewEXP 正在修炼的内丹索引
  ]]
function CZhanQiJueSystem:StartBless(nProcessIndex, nNewEXP) 
    if nProcessIndex == #tConfig.DanList then return; end
    local nNextIndex  = nProcessIndex + 1;
    local nMaxEXP     = ShareFunction.GetMaxEXPByIndex(nProcessIndex);
    -- 如果后面没有丹
    if nNextIndex > #tConfig.DanList then return; end
    -- 如果这颗丹没修满
    if nNewEXP ~= nMaxEXP then return; end
    -- 如果不处于两阶段交界
    if nMaxEXP ~= ShareFunction.GetMaxEXPByIndex(nNextIndex) then return; end
    -- 启动赐福
    self:SetBless(true);
end

--[[
    [\brief 赐福裁定者
    [\裁定该阶段的此次赐福是否成功，得以升阶
    [\param number nPhase 阶段
    [\return boolean true为成功，false为失败
  ]]
function CZhanQiJueSystem:BlessArbiter(nPhase)
    local CBlessSystem = self:GetPlayer():GetSystem("CTianGuanCiFuSystem");
    local bSuccess = CBlessSystem:IsZhanQiJueMax();
    if bSuccess then return true; end
    local nBlessEXP = CBlessSystem:Get_ZhanQiJue();
    local tRange = ShareFunction.GetBlessRange(nPhase);
    local nBase = 10000;
    local nTarget;
    -- 计算nTarget
    if nBlessEXP < tRange.nFloor then 
        nTarget = 0;
    elseif nBlessEXP > tRange.nCeil then
        nTarget = nBase;
    else
        nTarget = ShareFunction.GetBlessRate(nPhase) * nBase;
    end
    -- 计算bSuccess
    if math.random(1, nBase) <= nTarget then
        bSuccess = true;
    end
    return bSuccess;
end

--[[
    [\brief 被其他玩家查看信息
    [\param number dwFromRoleId 查看者的角色id
  ]]
function CZhanQiJueSystem:BeChecked(dwFromRoleId)
    if not self:HasAuthority(self.sAuthority) then
        return;
    end
    _G.GSRemoteCall(dwFromRoleId, "CZhanQiJueSystem", "CheckOther",
        {ShareFunction.GetDanIndex(self.nEXP, self.bBless)});
end

--[[
    [\brief 获取查看结果
    [\param number nDanIndex 被查看者已修炼完成的最大内丹索引
  ]]
function CZhanQiJueSystem:CheckOther(nDanIndex)
    self:GetPlayer().ZhanQiJue_RespondCheckOtherMsg{nDanIndex = nDanIndex};
end

--[[
    [\brief 向客户端广播
    [当赐福成功突破到新阶段时，向客户端广播
  ]]
function CZhanQiJueSystem:Broadcast()
    -- 准备要广播的数据
    local oPlayer = self:GetPlayer();
    local nRoleId = oPlayer:GetRoleID();
    local sName   = oPlayer:GetName();
    -- 获取全部玩家
    local setNet = {};
    for i, oPlayer in pairs(CPlayerManager.setAllPlayer) do
        -- 如果达到需要被广播的等级
        if oPlayer:GetLevel() >= _G.BroadCastConfig.ZhanQiJue then 
            setNet[#setNet+1] = oPlayer.objNet;
        end
    end
    _groupcallout(setNet, "ZhanQiJue_BroadcastPhaseMsg", {
        dwRoleId = nRoleId, sName = sName, nPhase = 
        ShareFunction.GetPhaseAndIndex(self.nEXP, self.bBless)});
end

--[[
    [\brief 开启系统
  ]]
function CZhanQiJueSystem:Open() 
    -- 如果数据库缓存中有值
    if self.tCache.nEXP then 
        self:SetBless(self.tCache.bBless);
        self:SetEXP(self.tCache.nEXP);
    else
        -- 赋予有效初值
        self:SetBless(false);
        self:SetEXP(0);
        self:GetPlayer():GetSystem("CTianGuanCiFuSystem"):
            Set_ZhanQiJue(0, false);
        self.oDB:Insert({nEXP = 0, bBless = false});
    end
end

--[[
    [\brief 关闭系统
  ]]
function CZhanQiJueSystem:Close() 
    -- 赋予无效初值
    self.bBless = nil;
    self.nEXP = nil;
end
