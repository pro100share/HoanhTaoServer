--[[
	[\brief 服务器接收的消息
	[\author 王凌波
	[\date 2014-6-19
  ]]

-- 定义点击修炼消息
define.ZhanQiJue_OnHitPracticeMsg
{
    -- 玩家对象
    user = NONE,
    -- 修炼类型id
    nPracticeID = 0,
}
when {user = NONE}
ZhanQiJue_OnHitPracticeMsg = checkUser;
when{}
function ZhanQiJue_OnHitPracticeMsg(user, nPracticeID)
    user:GetSystem("CZhanQiJueSystem"):OnHitPractice(nPracticeID);
end

--[[
    [\brief 定义点击赐福消息
  ]]
define.ZhanQiJue_OnHitBlessMsg
{
    -- 玩家对象
    user = NONE,
}
when {user = NONE}
ZhanQiJue_OnHitBlessMsg = checkUser;
when{}
function ZhanQiJue_OnHitBlessMsg(user)
    user:GetSystem("CZhanQiJueSystem"):OnHitBless();
end

--[[
    [\brief 定义点击查看消息
  ]]
define.ZhanQiJue_OnHitCheckOtherMsg
{
    -- 玩家对象
    user = NONE,
    -- 被查看的玩家id
    dwRoleId = 0,
}
when {user = NONE}
ZhanQiJue_OnHitCheckOtherMsg = checkUser;
when{}
function ZhanQiJue_OnHitCheckOtherMsg(user, dwRoleId)
    user:GetSystem("CZhanQiJueSystem"):OnHitCheckOther(dwRoleId);
end
