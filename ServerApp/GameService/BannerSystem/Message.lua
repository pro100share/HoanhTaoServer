--[[
	[\brief 战旗服务器消息定义文件
	[\author 王凌波
	[\date 2014-7-16
    [定义服务器接收的消息
  ]]

-- 定义请求同步数据消息
define.Banner_RequestSynMsg
{
    -- 玩家对象
    user = NONE,
}
when {user = NONE}
Banner_RequestSynMsg = checkUser;
when{}
function Banner_RequestSynMsg(user)
    -- 由于客户端在OnEnterGame()中请求同步，但是服务器端在OnEnterScene()中
    -- 才初始化数据，所以会引起同步数据为空的报错，这里的将客户端请求同步
    -- 改为上线初始化完数据后同步
end

-- 定义请求铸造消息
define.Banner_RequestForgeMsg
{
    -- 玩家对象
    user = NONE,
    -- 批量使用的数量
    nCount = 0,
}
when {user = NONE}
Banner_RequestForgeMsg = checkUser;
when{}
function Banner_RequestForgeMsg(user, nCount)
    user:GetSystem("CBannerSystem"):RespondForge(nCount);
end

-- 定义请求升阶一次消息
define.Banner_RequestUpPhaseMsg
{
    -- 玩家对象
    user = NONE,
    -- 使用元宝还是礼金，true为使用元宝，false为使用礼金
    bGold = false,
    -- 是否优先使用非绑定材料，true为优先使用，false为不优先使用
    bUnBind = false,
    -- 是否自动购买所需材料，true为自动购买，false为不自动购买
    bAutoBuy = false,
}
when {user = NONE}
Banner_RequestUpPhaseMsg = checkUser;
when{}
function Banner_RequestUpPhaseMsg(user, bGold, bUnBind, bAutoBuy)
    user:GetSystem("CBannerSystem"):RespondUpPhase(bUnBind, bAutoBuy, bGold);
end

-- 定义请求查看其他玩家消息
define.Banner_RequestViewOtherMsg
{
    -- 玩家对象
    user = NONE,
    -- 被查看的玩家角色id
    nRoleID = 0,
}
when {user = NONE}
Banner_RequestViewOtherMsg = checkUser;
when{}
function Banner_RequestViewOtherMsg(user, nRoleID)
    user:GetSystem("CBannerSystem"):RespondViewOther(nRoleID);
end

-- 定义请求改变战旗消耗布尔值
define.Banner_RequestChangeConsumeMsg
{
    -- 玩家对象
    user = NONE,
    -- 战旗消耗布尔值
    bConsume = false,
}
when {user = NONE}
Banner_RequestChangeConsumeMsg = checkUser;
when{}
function Banner_RequestChangeConsumeMsg(user, bConsume)
    user:GetSystem("CBannerSystem"):RespondChangeConsume(bConsume);
end

-- 定义请求选择战旗外观
define.Banner_RequestLookMsg
{
    -- 玩家对象
    user = NONE,
    -- 战旗外观编号
    nLook = 0,
}
when {user = NONE}
Banner_RequestLookMsg = checkUser;
when{}
function Banner_RequestLookMsg(user, nLook)
    user:GetSystem("CBannerSystem"):RespondLook(nLook);
end

-- 定义请求选择战旗外观
define.Banner_RequestFlagMsg
{
    -- 玩家对象
    user = NONE,
}
when {user = NONE}
Banner_RequestFlagMsg = checkUser;
when{}
function Banner_RequestFlagMsg(user)
    user:GetSystem("CBannerSystem"):RespondFlag();
end

--[[
    [\brief 接收广播通知消息
    ]]
define.Banner_BeNoticedMsg
{   
    -- 玩家对象
    user = NONE,
    -- 玩家角色ID
    nRoleID = 0,
    -- 玩家姓名
    sName = "",
    -- 战旗系统阶段
    nPhase = 0,

}
when {user = NONE}
Banner_BeNoticedMsg = checkUser;
when{}
function Banner_BeNoticedMsg(user, nRoleID, sName, nPhase)
    local tNet = {};
    for i, oPlayer in pairs(CPlayerManager.setAllPlayer) do
        tNet[#tNet + 1] = oPlayer.objNet;
    end
    _groupcallout(tNet, "Banner_BroadcastPhaseMsg", {
        nRoleID = nRoleID,
        sName = sName, 
        nPhase = nPhase});
end
