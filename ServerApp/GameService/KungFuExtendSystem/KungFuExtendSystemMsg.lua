--[[
	[ \brief 功法扩展系统消息文件
	[ \author 李中昌
	[ \date 2014-6-9
	[ 处理功法扩展系统消息
	]]

-- 功法扩展 请求扩展
define.KungFuExtendRequestMsg
{
	-- 默认参数 玩家对象
	user			= NONE,
	-- 系统枚举
	SystemEnum		= 0, 
	-- 扩展次数
	OptCount		= 0, 
}
when {user = NONE}
KungFuExtendRequestMsg = checkUser;
when{}
function KungFuExtendRequestMsg(user, SystemEnum, OptCount)
	local kungFuExtendSystem = user:GetSystem("CKungFuExtendSystem");
	if kungFuExtendSystem then
		kungFuExtendSystem:Extend(SystemEnum, OptCount);
	end
end

-- 套装广播 套装等级达到一定等级广播
define.KungFuExtendBoardcastMsg
{	
	-- 玩家的roleID
	RoleID = 0,
	-- 玩家的角色名
    RoleName = "",
	--系统标识
	SystemEnum = 0,
	-- 套装等级
	Level = 0,
}
when{}
function KungFuExtendBoardcastMsg(RoleID, RoleName, SystemEnum, Level)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end
	_groupcallout(setNet, "KungFuExtendBoardcastMsg", {RoleID = RoleID,
		RoleName = RoleName, SystemEnum = SystemEnum, Level = Level});	
end
