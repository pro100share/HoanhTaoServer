--[[
	[\brief 战旗管理器基础方法
	[\author 王凌波
	[\date 2014-7-16
  ]]

-- 战旗公用函数
local tFunc = _G.BannerFunctions;

--[[
    [\brief 检查战旗作用时间
  ]]
function CBannerManager:CheckTime()
    -- 遍历所有已插的旗
    for k, v in pairs(self.tAllBanners) do
        if _now() > 
                v.nTime + tFunc.GetDuration(v.nLevel) then -- 如果作用时间结束
            self:DelBanner(k);
        else
            -- 遍历下一个已插的旗
        end
    end
end

--[[
    [\brief 将战旗添加到战旗集合中
    [\param number nRoleID 插旗的玩家的ID
    [\param object oBanner 战旗对象
  ]]
function CBannerManager:AddBanner(nRoleID, oBanner)
    self.tAllBanners[nRoleID] = oBanner;
end

--[[
    [\brief 将战旗从战旗集合中删除
    [\param number nRoleID 插旗的玩家的ID
  ]]
function CBannerManager:DelBanner(nRoleID)
    if not self.tAllBanners[nRoleID] then 
        return;
    end
    self.tAllBanners[nRoleID]:Delete();
    self.tAllBanners[nRoleID] = nil;
end

--[[
    [\brief 获取队伍中的所有玩家的ID
    [\param object oTeamSys 队伍系统对象
    [\return table tIDs 同队伍的玩家ID集合
  ]]
function CBannerManager:GetMateIDs(oTeamSys)
    local tIDs = {};
    -- 做克隆
    for _, v in pairs(oTeamSys:GetTeamMembers()) do 
        if not CPlayerManager:GetPlayerByRoleID(v):IsDead() then
            tIDs[#tIDs + 1] = v;
        end
    end
    local nCapID = oTeamSys:GetCaptainId();
    local bInside = false;
    for _, nID in pairs(tIDs) do
        if nID == nCapID then 
            -- 找到队长ID，置位，跳出循环
            bInside = true;
            break;
        else
            -- 遍历下一个ID
        end
    end
    if bInside then
        -- 无需操作
    else
        if not CPlayerManager:GetPlayerByRoleID(nCapID):IsDead() then
            tIDs[#tIDs + 1] = nCapID;
        end
    end
    return tIDs;
end

--[[
    [\brief 获取与插旗玩家同队玩家的ID，无队伍则只有自己
    [\param number nRoleID 插战旗的玩家的ID
    [\return table 玩家ID集合
  ]]
function CBannerManager:GetRoleIDs(nRoleID)
    local oPlayer = CPlayerManager:GetPlayerByRoleID(nRoleID);
    if not oPlayer then
        return {};
    end
    local tIDs = {};
    local oTeamSystem = oPlayer:GetSystem("CTeamSystem");
    if oTeamSystem:GetTeamMembers() then -- 如果有队伍
        tIDs = self:GetMateIDs(oTeamSystem);
    else
        if not oPlayer:IsDead() then
            tIDs[#tIDs + 1] = oPlayer:GetRoleID();
        end
    end
    return tIDs;
end

--[[
    [\brief 判断玩家是否在战旗影响范围内
    [\param object oBanner 战旗对象
    [\param object oPlayer 玩家对象
    [\return boolean 是否在范围内，true为在，false为不在
  ]]
function CBannerManager:InScope(oBanner, oPlayer)
    local tPos = oPlayer:GetSystem("CMapSystem"):GetPlayerPos();
    return (oBanner.nX - tPos.x) ^ 2 + (oBanner.nY - tPos.y) ^ 2 <= 
        tFunc.GetRadius(oBanner.nLevel) ^ 2;
end

--[[
    [\brief 获取因在战旗范围内而受影响的玩家ID
    [\param number nRoleID 插战旗的玩家的ID
    [\param object oBanner 战旗对象
    [\return table tIDs 受战旗影响的玩家ID集合
  ]]
function CBannerManager:GetAffectedIDs(nRoleID, oBanner)
    local tIDs = {};
    -- 遍历所有同队玩家
    for _, v in pairs(self:GetRoleIDs(nRoleID)) do
        if self:InScope(oBanner, CPlayerManager:GetPlayerByRoleID(v)) then 
            tIDs[#tIDs + 1] = v;
        else
            -- 不在战旗范围内则无需加入受影响集合
        end
    end
    return tIDs;
end

--[[
    [\brief 在受影响集合中设置影响某玩家的战旗的等级
    [\param table tAffected 受影响集合
    [\param number nRoleID 被影响的玩家ID
    [\param object oBanner 影响该玩家的战旗对象
  ]]
function CBannerManager:SetLevel(tAffected, nRoleID, oBanner)
    if tAffected[nRoleID] then -- 如果之前已受战旗影响
        if oBanner.nLevel > tAffected[nRoleID] then -- 如果这次战旗等级更高
            tAffected[nRoleID] = oBanner.nLevel;
        else
            -- 无需重置等级
        end
    else -- 如果之前没受战旗影响
        tAffected[nRoleID] = oBanner.nLevel;
    end
end

--[[
    [\brief 获取本次检测时，受战旗影响玩家集合
    [\return table tCurrentAffected 本次检测时受战旗影响玩家集合
    [注：key-受战旗影响的玩家ID，value-所有影响该玩家的战旗的最大等级
  ]]
function CBannerManager:GetCurrentAffected()
    local tCurrentAffected = {};
    -- 遍历所有已插的旗
    for k, v in pairs(self.tAllBanners) do
        -- 遍历受该战旗影响的所有玩家
        for _, nRoleID in pairs(self:GetAffectedIDs(k, v)) do
            self:SetLevel(tCurrentAffected, nRoleID, v);
        end
    end
    return tCurrentAffected;
end

--[[
    [\brief 删除战旗buff
    [\param table tCurrentAffected 本次检测时受战旗影响玩家集合
  ]]
function CBannerManager:DeleteBuff(tCurrentAffected)
    -- 遍历上次次检测时受战旗影响玩家集合
    for nRoleID, nLevel in pairs(self.tAffected) do
        if not tCurrentAffected[nRoleID] then -- 如果上次有影响而本次没影响
            self.tAffected[nRoleID] = nil;
            _G.BannerScript:DelBuff(
                CPlayerManager:GetPlayerByRoleID(nRoleID));
        else
            -- 两次都有影响则不进行删buff操作
        end
    end
end

--[[
    [\brief 加战旗buff
    [\param table tCurrentAffected 本次检测时受战旗影响玩家集合
  ]]
function CBannerManager:AddBuff(tCurrentAffected)
    -- 遍历本次检测时受战旗影响玩家集合
    for nRoleID, nLevel in pairs(tCurrentAffected) do
        local nPreLevel = self.tAffected[nRoleID];
        if nPreLevel then -- 如果上次也受影响
            if nLevel ~= nPreLevel then -- 如果本次与上次战旗等级不同
                -- 先删原来的buff
                _G.BannerScript:DelBuff(
                    CPlayerManager:GetPlayerByRoleID(nRoleID));
                -- 再加现在的buff
                _G.BannerScript:AddBuff(
                    CPlayerManager:GetPlayerByRoleID(nRoleID), 
                    nLevel);
                self.tAffected[nRoleID] = nLevel;
            end
        else -- 如果上次没受影响
            self.tAffected[nRoleID] = nLevel;
            _G.BannerScript:AddBuff(
                CPlayerManager:GetPlayerByRoleID(nRoleID), 
                nLevel);
        end
    end
end

--[[
    [\brief 更新战旗影响
  ]]
function CBannerManager:UpdateAffect()
    local tCurrentAffected = self:GetCurrentAffected();
    self:DeleteBuff(tCurrentAffected);
    self:AddBuff(tCurrentAffected);
end
