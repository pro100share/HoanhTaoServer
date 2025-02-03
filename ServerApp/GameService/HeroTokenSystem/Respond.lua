--[[
	[\brief 响应客户端事件
	[\author 王凌波
	[\date 2014-7-2
  ]]

-- 公用函数
local ShareFunction = _G.HeroTokenFunctions;

--[[
    [\brief 响应点击镶嵌
    [\param number nSeriesIndex 系列索引
    [\param number nTokenIndex 令牌索引
  ]]
function CHeroTokenSystem:OnHitEnbed(nSeriesIndex, nTokenIndex)
    local tResult = ShareFunction.CheckEnbed(false,
        self.tEnbeded, nSeriesIndex, nTokenIndex, self);
    -- 如果没有权限
    if not self:HasAuthority(self.sAuthority) then return; end
    -- 如果已镶嵌
    if tResult.bEnbeded then return; end
    -- 如果道具不够
    if not tResult.bItemEnough then return; end
    -- 镶嵌令牌
    self:EnbedToken(nSeriesIndex, nTokenIndex);
    -- 更新数据库
    self.oDB:Update({sEnbeded =
        self:TableToString(self.tEnbeded)});
    -- 向客户端发响应消息
    self:GetPlayer().HeroToken_EnbedSuccessMsg{
        nSeriesIndex = nSeriesIndex, nTokenIndex = nTokenIndex};
    -- 广播
    self:Broadcast(nSeriesIndex);
end

--[[
    [\brief 响应点击查看
    [\param number nRoleID 被查看的玩家角色id
  ]]
function CHeroTokenSystem:OnHitCheckOther(nRoleID)
    _G.GSRemoteCall(nRoleID, "CHeroTokenSystem", "BeChecked", 
        {self:GetPlayer():GetRoleID()});
end
