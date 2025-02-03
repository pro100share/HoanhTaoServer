--[[
	[\brief 战旗系统养成相关方法
	[\author 王凌波
	[\date 2014-7-16
	[供系统内部调用
  ]]

-- 战旗配置文件
local tConfig = _G.BannerConfig;
-- 战旗公用函数
local tFunc = _G.BannerFunctions;

--[[
    [\brief 用缓存中的数据初始化系统属性
  ]]
function CBannerSystem:InitFromCache()
    local tCache = self.tCache;
    local nCacheEXP = tCache.nEXP;
    local nEXP_1 = tFunc.GetLevelNeedEXP(1);
    if nCacheEXP < nEXP_1 then -- 如果配置表修改导致数据库数据小于第一级经验
        self:SetEXPAndBless(nEXP_1, false);
        self.oDB:Update();
    else -- 没小于第一级经验则仍是有效值
        self:SetEXPAndBless(nCacheEXP, tCache.bBless);
    end
    self:SetConsume(tCache.bConsume);
    self:SetLook(tCache.nLook);
    self:SetStartTime(tCache.nStartTime);
end

--[[
    [\brief 赋予有效初始值，送第一级
  ]]
function CBannerSystem:InitValid()
    self:SetEXPAndBless(tFunc.GetLevelNeedEXP(1), false);
    self:SetConsume(false);
    self:SetLook(1);
    self:SetStartTime(0);
    self:GetPlayer():GetSystem("CTianGuanCiFuSystem"):
        Set_Banner(0, false);
    self.oDB:Insert();
end

--[[
    [\brief 开启系统
  ]]
function CBannerSystem:Open()
    -- 如果数据库缓存中有值
    if self.tCache.nEXP then
        self:InitFromCache();
    else
        self:InitValid();
    end
end

--[[
    [\brief 关闭系统
  ]]
function CBannerSystem:Close()
    -- 赋予无效初值
    self.nEXP = tFunc.GetLevelNeedEXP(1) - 1;
end

--[[
    [\brief 增加属性
  ]]
function CBannerSystem:AddAttribute()
    local oSkillSystem = self:GetPlayer():GetSystem("CSkillSystem");
    -- 增加定值属性
    local tAttr1 = _G.SSingleAttrChange:new();
    local nLevel = tFunc.GetLevel(self.nEXP, self.bBless);
    for k, v in pairs(tFunc.GetAttr(nLevel)) do
        tAttr1[k] = tAttr1[k] + v;
    end
    oSkillSystem:NotifyBannerUpdate(tAttr1);
    -- 增加百分比属性
    local tAttr2 = _G.SSingleAttrChange:new();
    tAttr2.dwDefense = tFunc.GetDefenseRate(nLevel) * 0.01;
    oSkillSystem:NotifyBannerUpdate(tAttr2, true);
end

--[[
    [\brief 计算用于判断赐福是否成功的目标值
    [\param number nBase 基准值
    [\param number nBlessEXP 已有的赐福值
    [\param number nPhase 所处阶段
    [\return number 目标值
  ]]
function CBannerSystem:CalTarget(nBase, nBlessEXP, nPhase)
    local tRange = tFunc.GetRange(nPhase);
    if nBlessEXP < tRange.nFloor then 
        return 0;
    elseif nBlessEXP > tRange.nCeil then
        return nBase;
    else
        return tFunc.GetBlessRate(nPhase) * nBase;
    end
end

--[[
    [\brief 赐福裁定者，裁定该阶段的此次赐福是否成功，得以升到下一阶
    [\param number nPhase 所处阶段
    [\return boolean bSuccess 是否赐福成功，true为成功，false为失败
  ]]
function CBannerSystem:BlessArbiter(nPhase)
    local CBlessSystem = self:GetPlayer():GetSystem("CTianGuanCiFuSystem");
    if CBlessSystem:IsBannerMax() then -- 如果已是最大赐福值
        return true; 
    else -- 如果还不是最大赐福值
        local nBase = 10000;
        if math.random(1, nBase) <= self:CalTarget(nBase, 
                CBlessSystem:Get_Banner(), 
                nPhase) then -- 如果随机数小于等于目标值
            -- 裁定赐福成功
            return true;
        else
            return false;
        end
    end
end

--[[
    [\brief 铸造花费
    [\param number nCount 批量使用个数
  ]]
function CBannerSystem:ForgePay(nCount)
    self:GetPlayer():GetSystem("CItemSystem"):DelEnumItemInPacket(
        tFunc.GetForgeID(tFunc.GetLevel(self.nEXP, self.bBless)), 
        nCount, 
        false, 
        _G.ItemSysOperType.Banner);
end

--[[
    [\brief 增加铸造值
    [\param number nCount 批量使用个数
  ]]
function CBannerSystem:AddEXP(nCount)
    local nLevel = tFunc.GetLevel(self.nEXP, self.bBless);
    local nNewEXP = nCount * tFunc.GetAddEXP(nLevel) + self.nEXP;
    local bNewBless = false;
    local nNext = nLevel + 1;
    local nNextEXP = tFunc.GetLevelNeedEXP(nNext);
    if nNext <= #tConfig.LevelList  and -- 如果有下一级
            nLevel % 5 == 0         and -- 是一阶中最后一级
            nNewEXP >= nNextEXP     then -- 该级经验值已升满
        -- 开启赐福
        nNewEXP = nNextEXP;
        bNewBless = true;
    end
    self:SetEXPAndBless(nNewEXP, bNewBless);
    self:AddAttribute()
end

--[[
    [\brief 赐福升阶花费
    [\param boolean bUnBind 是否优先使用非绑定材料，true优先，false不优先
    [\param boolean bGold 使用元宝还是礼金，true使用元宝，false使用礼金
  ]]
function CBannerSystem:BlessPay(bUnBind, bGold)
    local oItemSystem = self:GetPlayer():GetSystem("CItemSystem");
    local nPhase = tFunc.GetPhase(tFunc.GetLevel(self.nEXP, self.bBless));
    local nID = tFunc.GetBlessID(nPhase);
    local nNum = tFunc.GetBlessNum(nPhase);
    local sLog = _G.ItemSysOperType.Banner;
    -- 花费银两
    oItemSystem:CostPacketMoney(tFunc.GetMoney(nPhase), sLog);
    -- 花费材料或花钱
    local bIsEnough, nDelta = oItemSystem:
        CheckDelEnumItemInPacketCond(nID, nNum)
    if bIsEnough then
        oItemSystem:DelEnumItemInPacket(nID, nNum, bUnBind, sLog);
    else
        oItemSystem:DelEnumItemInPacket(nID, nNum - nDelta, bUnBind, sLog);
        if bGold then 
            oItemSystem:CostGold(tFunc.GetGold(nPhase) * nDelta, sLog);
        else
            oItemSystem:CostBindGold(tFunc.GetBindGold(nPhase) * nDelta, sLog);
        end
    end
end

--[[
    [\brief 广播
  ]]
function CBannerSystem:Broadcast()
    local nPhase = tFunc.GetPhase(tFunc.GetLevel(self.nEXP, self.bBless));
    if nPhase < tFunc.GetCastBeginPhase() then 
        return; 
    end
    
    local oPlayer = self:GetPlayer();
    CGameApp.Banner_BeNoticedMsg{nRoleID = oPlayer:GetRoleID(), 
        sName = oPlayer:GetName(), 
        nPhase = nPhase}
end

--[[
    [\brief 升阶
  ]]
function CBannerSystem:UpPhase()
    self:SetEXPAndBless(self.nEXP, false);
    self:AddAttribute()
    self:GetPlayer():GetSystem("CTianGuanCiFuSystem"):
        Set_Banner(0, false);
    self.oDB:Update();
    self:Broadcast();
end

--[[
    [\brief 被其他玩家查看信息
    [\param number nFromRoleId 查看者的角色id
  ]]
function CBannerSystem:BeViewed(nFromRoleId)
    local tParam = nil;
    if self:HasAuthority(self.sAuthority) then 
        tParam = {true, 
            self.nEXP, 
            self.bBless, 
            self:GetAddDefense(),
            self:GetPlayer():GetSystem("CKungFuExtendSystem"):
                GetCount(KungFuEnum.Banner)};
    else
        tParam = {false, nil, nil, nil, nil}
    end
     _G.GSRemoteCall(nFromRoleId, "CBannerSystem", "ViewOther", tParam);
end

--[[
    [\brief 向客户端发送查看结果
    [\param boolean bAuthority 被查看者是否有本系统权限
    [\param number nEXP 被查看者铸造值
    [\param boolean bBless 被查看者是否在赐福
    [\param number nCount 扩展次数
  ]]
function CBannerSystem:ViewOther(bAuthority, nEXP, bBless, nDefense, nCount)
    self:GetPlayer().Banner_RespondViewOtherMsg{
        bAuthority = bAuthority, 
        nEXP = nEXP, 
        bBless = bBless, 
        nDefense = nDefense,
        nCount = nCount};
end

--[[
    [\brief 获取本系统增加的防御力
    [\return number 本系统增加的防御力
  ]]
function CBannerSystem:GetAddDefense()
    local oSkillSystem = self:GetPlayer():GetSystem("CSkillSystem");
    return math.ceil(
        (oSkillSystem.sBaseInfo.dwDefense + 
            oSkillSystem.objAdvAttrInfo:GetInfo().dwDefense) * 
        tFunc.GetDefenseRate(tFunc.GetLevel(self.nEXP, self.bBless)) * 
        0.01);
end

--[[
    [\brief 安插战旗
    [\param number nNow 插旗的起始时间
  ]]
function CBannerSystem:Flag(nNow)
    local oPlayer = self:GetPlayer();
    -- 消耗所需物品
    oPlayer:GetSystem("CItemSystem"):DelEnumItemInPacket(
        tFunc.GetUseBannerID(), 
        tFunc.GetUseBannerNum(), 
        false, 
        _G.ItemSysOperType.Banner);
    -- 获取当前玩家位置
    local oMapSystem = oPlayer:GetSystem("CMapSystem");
    local tPos = oMapSystem:GetPlayerPos();
    -- 创建战旗
    local oBanner = CBanner:new();
    oBanner:Init(nNow, 
        oMapSystem:GetCurMapID(), 
        tPos.x, 
        tPos.y, 
        tFunc.GetLevel(self.nEXP, self.bBless), 
        self.nLook, 
        oPlayer:GetName(),
        oPlayer:GetSystem("CDuplSystem").bPlayerInDuplArea);
    -- 将战旗添加到管理器的战旗集合中
    CBannerManager:AddBanner(oPlayer:GetRoleID(), oBanner);
end

--[[
    [\brief 获取剩余CD时间
    [\param number nTargetTime 用于比较的目标时间
    [\return number nLeftTime 剩余CD时间
  ]]
function CBannerSystem:GetLeftTime(nTargetTime)
    local nLeftTime = self.nStartTime + 
        tFunc.GetCoolTime(tFunc.GetLevel(self.nEXP, self.bBless)) - 
        nTargetTime;
    nLeftTime = nLeftTime > 0 and nLeftTime or 0;
    return nLeftTime;
end
