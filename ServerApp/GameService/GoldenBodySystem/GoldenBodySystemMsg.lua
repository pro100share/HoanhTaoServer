--[[
    [ \brief 修炼金身系统消息文件
    [ \author 李中昌
    [ \date 2014-7-2
    [ 处理修炼金身系统消息
    ]]

-- 请求所有系统信息
define.GoldenBodyRequestAllMsg
{
	-- 默认参数 玩家对象
	user			= NONE,
}
when {user = NONE}
GoldenBodyRequestAllMsg = checkUser;
when{}
function GoldenBodyRequestAllMsg(user)
	user:GetSystem("CGoldenBodySystem"):SynAll();
end

-- 请求修炼
define.GoldenBodyReqPracticeMsg
{
	-- 默认参数 玩家对象
	user			= NONE,
}
when {user = NONE}
GoldenBodyReqPracticeMsg = checkUser;
when{}
function GoldenBodyReqPracticeMsg(user)
	user:GetSystem("CGoldenBodySystem"):Practice();
end

-- 查看请求
define.GoldenBodyViewOtherMsg
{
	-- 默认参数 玩家对象
	user			= NONE,
	RoleID			= 0,
}
when {user = NONE}
GoldenBodyViewOtherMsg = checkUser;
when{}
function GoldenBodyViewOtherMsg(user, RoleID)
	user:GetSystem("CGoldenBodySystem"):ViewOtherProcess(RoleID);
end

-- 套装广播 套装等级达到一定等级广播
define.GoldenBodyBoardcastMsg
{	
	-- 玩家的roleID
	RoleID = 0,
	-- 玩家的角色名
    RoleName = "",
	-- 等阶
	Grade = 0,
}
when{}
function GoldenBodyBoardcastMsg(RoleID, RoleName, Grade)
	local tNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(tNet, objPlayer.objNet);
	end
	_groupcallout(tNet, "GoldenBodyBoardcastMsg", {RoleID = RoleID,
		RoleName = RoleName, Grade = Grade});	
end
