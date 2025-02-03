--[[
	[\brief 服务器接收的消息
	[\author 王凌波
	[\date 2014-7-2
  ]]

--[[
    [\brief 定义点击镶嵌消息
  ]]
define.HeroToken_OnHitEnbedMsg
{   
    -- 玩家对象
    user = NONE,
    -- 系列索引
    nSeriesIndex = 0,
    -- 令牌索引
    nTokenIndex = 0,
}
when {user = NONE}
HeroToken_OnHitEnbedMsg = checkUser;
when{}
function HeroToken_OnHitEnbedMsg(user, nSeriesIndex, nTokenIndex)
    user:GetSystem("CHeroTokenSystem"):OnHitEnbed(nSeriesIndex, nTokenIndex);
end

--[[
    [\brief 定义查看消息
  ]]
define.HeroToken_OnHitCheckOtherMsg
{
    -- 玩家对象
    user = NONE,
    -- 玩家ID
    nRoleID = 0,
}
when {user = NONE}
HeroToken_OnHitCheckOtherMsg = checkUser;
when{}
function HeroToken_OnHitCheckOtherMsg(user, nRoleID)
    user:GetSystem("CHeroTokenSystem"):OnHitCheckOther(nRoleID);
end

--[[
    [\brief 通知所有玩家消息
    ]]
define.HeroToken_AllNoticeMsg
{   
    -- 玩家对象
    user = NONE,
    -- 玩家角色ID
    nRoleID = 0,
    -- 玩家姓名
    sName = "",
    -- 系列索引
    nSeriesIndex = 0,

}
when {user = NONE}
HeroToken_AllNoticeMsg = checkUser;
when{}
function HeroToken_AllNoticeMsg(user, nRoleID, sName, nSeriesIndex)
    local tNet = {};
    for i, oPlayer in pairs(CPlayerManager.setAllPlayer) do
        table.insert(tNet, oPlayer.objNet);
    end
    _groupcallout(tNet, "HeroToken_BroadcastSeriesMsg", {
        nRoleID = nRoleID,
        sName = sName, 
        nSeriesIndex = nSeriesIndex});
end
