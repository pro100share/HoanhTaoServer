--[[
	[\brief 系统基本函数
	[\author 王凌波
	[\date 2014-7-2
	[供系统内部调用
  ]]

-- 公用函数
local ShareFunction = _G.HeroTokenFunctions;

--[[
    [\brief 向客户端同步数据
  ]]
function CHeroTokenSystem:Synchronize() 
    self:GetPlayer().HeroToken_SynchronizeMsg{sEnbeded = 
        self:TableToString(self.tEnbeded)};
end

--[[
    [\brief 开启系统
  ]]
function CHeroTokenSystem:Open()
    -- 如果数据缓存中有值
    if self.tCache.tEnbeded then 
        self:SetEnbeded(self.tCache.tEnbeded);
    else
        -- 赋予有效初始值
        self:SetEnbeded(ShareFunction.InitTable());
        -- 存数据库
        self.oDB:Insert({sEnbeded = 
            self:TableToString(self.tEnbeded)});
    end
end

--[[
    [\brief 关闭系统
  ]]
function CHeroTokenSystem:Close()
    -- 赋予无效初始值
    self:SetEnbeded(ShareFunction.InitTable());
end

--[[
    [\brief 增加属性
  ]]
function CHeroTokenSystem:AddAttribute()
    local oAttr = _G.SSingleAttrChange:new();
    local tPlusAttr = ShareFunction.GetTotalAttr(self.tEnbeded);
    for k, v in pairs(tPlusAttr) do
        oAttr[k] = oAttr[k] + v;
    end
    self:GetPlayer():GetSystem("CSkillSystem"):
        NotifyHeroTokenUpdate(oAttr);
end

--[[
    [\brief 设置令牌状态集合
    [\param table tEnbeded 新的令牌状态集合
  ]]
function CHeroTokenSystem:SetEnbeded(tEnbeded)
    self.tEnbeded = tEnbeded;
    self:AddAttribute();
end

--[[
    [\brief 消耗物品
    [\param number nSeriesIndex 系列索引
    [\param number nTokenIndex 令牌索引
  ]]
function CHeroTokenSystem:ConsumeItem(nSeriesIndex, nTokenIndex) 
    self:GetPlayer():GetSystem("CItemSystem"):DelEnumItemInPacket(
        ShareFunction.GetTokenId(nSeriesIndex, nTokenIndex), 
        ShareFunction.GetNeedCount(nSeriesIndex, nTokenIndex), 
        false, 
        _G.ItemSysOperType.HeroToken);
end

--[[
    [\brief 镶嵌令牌
    [\param number nSeriesIndex 系列索引
    [\param number nTokenIndex 令牌索引
  ]]
function CHeroTokenSystem:EnbedToken(nSeriesIndex, nTokenIndex)
    -- 消耗物品
    self:ConsumeItem(nSeriesIndex, nTokenIndex);
    -- 更新属性
    self.tEnbeded[nSeriesIndex][nTokenIndex] = true;
    self:SetEnbeded(self.tEnbeded);
end

--[[
    [\brief 向客户端广播
    [\如果一个系列的令牌都已镶嵌，则向客户端广播
  ]]
function CHeroTokenSystem:Broadcast(nSeriesIndex)
    -- 该系列令牌是否全部镶嵌
    for k, v in pairs(self.tEnbeded[nSeriesIndex]) do
        if not v then return; end
    end
    
    local oPlayer = self:GetPlayer();
    CGameApp.HeroToken_AllNoticeMsg{nRoleID = oPlayer:GetRoleID(), 
        sName = oPlayer:GetName(), 
        nSeriesIndex = nSeriesIndex}
end

--[[
    [\brief 被其他玩家查看信息
    [\param number nFromRoleId 查看者的角色id
  ]]
function CHeroTokenSystem:BeChecked(nFromRoleId)
    _G.GSRemoteCall(nFromRoleId, "CHeroTokenSystem", "CheckOther", 
        {self:HasAuthority(self.sAuthority), self.tEnbeded});
end

--[[
    [\brief 向客户端发送查看结果
    [\param table tEnbeded 被查看者的令牌镶嵌状态表
  ]]
function CHeroTokenSystem:CheckOther(bAuthority, tEnbeded)
    self:GetPlayer().HeroToken_RespondCheckOtherMsg{bAuthority = 
        bAuthority, sEnbeded = self:TableToString(tEnbeded)};
end

--[[
    [\brief 将本地集合转换成记录已镶嵌的字串
    [\param table tEnbeded 令牌镶嵌状态集合
    [\return string sEnbeded 记录已镶嵌的字串
  ]]
function CHeroTokenSystem:TableToString(tEnbeded) 
    local sEnbeded = "";
    -- 遍历状态表
    for k, v in pairs(tEnbeded) do 
        -- 构建系列
        sEnbeded = sEnbeded .. k .. ":";
        for k1, v1 in pairs(v) do
            -- 构建令牌
            if v1 then sEnbeded = sEnbeded .. k1 .. ","; end
        end
    end
    return sEnbeded;
end
