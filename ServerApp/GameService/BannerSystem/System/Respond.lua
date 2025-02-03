--[[
	[\brief 战旗系统对客户端的响应文件
	[\author 王凌波
	[\date 2014-7-16
  ]]

-- 战旗配置文件
local tConfig = _G.BannerConfig;
-- 战旗公用函数
local tFunc = _G.BannerFunctions;

--[[
    [\brief 同步数据
  ]]
function CBannerSystem:Synchronize()
    if not self:HasAuthority(self.sAuthority) then 
        return;
    end

    self:GetPlayer().Banner_SynchronizeMsg{
        nEXP      = self.nEXP, 
        bBless    = self.bBless, 
        bConsume  = self.bConsume, 
        nLook     = self.nLook, 
        nLeftTime = self:GetLeftTime(_now()),
        nBlessEXP = self:GetPlayer():
            GetSystem("CTianGuanCiFuSystem"):Get_Banner()};
    self:EventDefenseChange();
end

--[[
    [\brief 响应铸造
    [\param number nCount 批量使用数量
  ]]
function CBannerSystem:RespondForge(nCount)
    if not self:HasAuthority(self.sAuthority) then 
        return;
    end
    if not self:CheckForge(nCount) then 
        return; 
    end

    self:ForgePay(nCount);
    self:AddEXP(nCount);
    self.oDB:Update();
    self:GetPlayer().Banner_RespondForgeMsg{
        nEXP = self.nEXP, 
        bBless = self.bBless};
end

--[[
    [\brief 响应升阶
    [\param boolean bUnBind 是否优先使用非绑定材料，true优先，false不优先
    [\param boolean bAutoBuy 是否自动购买所需材料，true自动，false不自动
    [\param boolean bGold 使用元宝还是礼金，true使用元宝，false使用礼金
  ]]
function CBannerSystem:RespondUpPhase(bUnBind, bAutoBuy, bGold)
    if not self:HasAuthority(self.sAuthority) then 
        return; 
    end
    if not self:CheckBless(bAutoBuy, bGold) then 
        return; 
    end

    self:BlessPay(bUnBind, bGold);
    local nPhase = tFunc.GetPhase(tFunc.GetLevel(self.nEXP, self.bBless));
    local oTianSys = self:GetPlayer():GetSystem("CTianGuanCiFuSystem");
    -- 如果此次赐福升阶成功
    if self:BlessArbiter(nPhase) then
        self:UpPhase();
    else
        oTianSys:Add_Banner(nPhase);
    end
    self:GetPlayer().Banner_RespondUpPhaseMsg{
        bBless = self.bBless, 
        nBlessEXP = oTianSys:Get_Banner()};
end

--[[
    [\brief 响应查看其他玩家信息
    [\param number nRoleID 被查看的玩家角色id
  ]]
function CBannerSystem:RespondViewOther(nRoleID)
    _G.GSRemoteCall(nRoleID, 
        "CBannerSystem", 
        "BeViewed", 
        {self:GetPlayer():GetRoleID()});
end

--[[
    [\brief 响应安插战旗
  ]]
function CBannerSystem:RespondFlag()
    if not self:HasAuthority(self.sAuthority) then 
        return; 
    end
    local nCheckResult = self:CheckFlag();
    if nCheckResult < 6 then 
        _err("Will NOT allow to flag because: "..nCheckResult);
        return; 
    end

    local nNow = _now();
    self:Flag(nNow);
    self:SetStartTime(nNow);
    self.oDB:Update();
    self:GetPlayer().Banner_RespondFlagMsg{
        nLeftTime = self:GetLeftTime(nNow)};
end

--[[
    [\brief 响应改变战旗消耗布尔值
    [\param boolean bConsume 战旗消耗布尔值
  ]]
function CBannerSystem:RespondChangeConsume(bConsume)
    if not self:HasAuthority(self.sAuthority) then 
        return; 
    end

    self:SetConsume(bConsume);
    self.oDB:Update();
    self:GetPlayer().Banner_RespondChangeConsumeMsg{
        bConsume = self.bConsume};
end

--[[
    [\brief 响应改变战旗消耗布尔值
    [\param number nLook 战旗外观编号
  ]]
function CBannerSystem:RespondLook(nLook)
    if not self:HasAuthority(self.sAuthority) then 
        return; 
    end

    self:SetLook(nLook);
    self.oDB:Update();
    self:GetPlayer().Banner_RespondLookMsg{
        nLook = self.nLook};
end
