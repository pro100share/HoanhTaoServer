--[[
	[\brief 响应客户端事件
	[\author 王凌波
	[\date 2014-6-19
  ]]

-- 公用函数，配置文件
local ShareFunction = _G.ZhanQiJueFunctions;
local tConfig       = _G.ZhanQiJueConfig;

--[[
    [\brief 响应点击修炼
    [\param number nPracticeID 修炼类型id，1表示“修炼”，2表示“一键修炼”
  ]]
function CZhanQiJueSystem:OnHitPractice(nPracticeID)
    if not self:HasAuthority(self.sAuthority) then 
        return;
    end
    local tResult = ShareFunction.CheckPractice(false, self.nEXP, 
        self.bBless, self);
    if tResult.bLimitAvoid     then return; end  -- 如果超限
    if not tResult.bItemEnough then return; end  -- 如果道具不够

    -- 消耗物品，增加修炼值
    local nDeltaEXP, nDeltaBonus = self:HitAddEXP(
        self:ConsumeItem(nPracticeID));
    -- 更新数据库
    self.oDB:Update({nEXP = self.nEXP, bBless = self.bBless});
    -- 向客户端发响应消息
    self:GetPlayer().ZhanQiJue_RespondPracticeMsg{
        nEXP = self.nEXP,
        nDeltaEXP = nDeltaEXP, 
        nDeltaBonus = nDeltaBonus, 
        bBless = self.bBless};
    -- 如果到达了能够达到的最大经验
    if self.nEXP == tConfig.DanList[#tConfig.DanList].nMaxEXP then 
        -- 广播
        self:Broadcast();
    else
        -- 没有达到最大经验则无需广播
    end
end

--[[
    [\brief 响应点击赐福
  ]]
function CZhanQiJueSystem:OnHitBless()
    if not self:HasAuthority(self.sAuthority) then 
        return;
    end
    local nPhase  = ShareFunction.GetPhaseAndIndex(self.nEXP, self.bBless);
    local CBlessSystem = self:GetPlayer():GetSystem("CTianGuanCiFuSystem");
    local tResult = ShareFunction.CheckBless(false, nPhase, 
        CBlessSystem:Get_ZhanQiJue(), self);
    if tResult.bLimitAvoid then return; end         -- 如果超限
    if not tResult.bItemEnough then return; end     -- 如果道具不够
    if not self.bBless then return; end             -- 如果赐福没有开启

    local tInfo = tConfig.BlessList[nPhase];
    -- 消耗物品
    self:GetPlayer():GetSystem("CItemSystem"):DelEnumItemInPacket(
        tInfo.nId, tInfo.nNum, false, _G.ItemSysOperType.ZhanQiJue);
    -- 判这次赐福是否成功，成功则升阶，否则增加赐福值
    local bSuccess = self:BlessArbiter(nPhase);
    local nDelta = 0;
    if bSuccess then 
        -- 更新属性
        self.bBless = false;
        self:SetEXP(self.nEXP);
        CBlessSystem:Set_ZhanQiJue(0, false);
        -- 更新数据库
        self.oDB:Update({bBless = self.bBless});
        -- 广播
        if nPhase + 1 >= tConfig.BroadcastMinPhase then 
            self:Broadcast(); 
        end
    else
        nDelta = CBlessSystem:Add_ZhanQiJue(nPhase);
    end
    -- 向客户端发消息
    self:GetPlayer().ZhanQiJue_RespondBlessMsg{
        bSuccess = bSuccess,
        nBlessEXP = CBlessSystem:Get_ZhanQiJue(), 
        nDelta = nDelta};
end

--[[
    [\brief 点击查看界面事件
    [\param number dwRoleId 要查看的其他玩家的角色id
  ]]
function CZhanQiJueSystem:OnHitCheckOther(dwRoleId)
    _G.GSRemoteCall(dwRoleId, "CZhanQiJueSystem", "BeChecked", 
        {self:GetPlayer():GetRoleID()});
end
