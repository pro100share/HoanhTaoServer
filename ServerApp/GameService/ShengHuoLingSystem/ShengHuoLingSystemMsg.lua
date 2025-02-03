--[[
	[ \brief 圣火令系统消息文件
	[ \author 李中昌
	[ \date 2014-5-6
	[ 处理圣火令系统消息
	]]

-- 圣火令强化槽位
define.ShengHuoLingStrengthMsg
{
	-- 默认参数 玩家对象
	user			= NONE,
	-- 槽位组的索引
	GroupIndex		= 0, 
	-- 槽位的索引
	SlotIndex		= 0, 
}
when {user = NONE}
ShengHuoLingStrengthMsg = checkUser;
when{}
function ShengHuoLingStrengthMsg(user, GroupIndex, SlotIndex)
	local shengHuoLingSystem = user:GetSystem("CShengHuoLingSystem");
	if shengHuoLingSystem then
		shengHuoLingSystem:Strength(GroupIndex, SlotIndex);
	end
end

-- 查看玩家圣火令
define.ShengHuoLingSys_ViewOtherMsg
{
	-- 默认参数 玩家对象
	user = NONE,
	-- 被查看玩家的roleID
	RoleID = 0,
}
when{user = NONE}
ShengHuoLingSys_ViewOtherMsg = checkUser
when{}
function ShengHuoLingSys_ViewOtherMsg(user, RoleID)
	local shengHuoLingSystem = user:GetSystem("CShengHuoLingSystem");
	if not shengHuoLingSystem then
		_info("shengHuoLingSystem is nil ===ShengHuoLingSys_ViewOtherMsg");
		return;
	end
	shengHuoLingSystem:ViewOtherProcess(RoleID);
end


---------------------------------------------广播-----------------------------------------------------------
-- 套装广播 套装等级达到一定等级广播
define.ShengHuoLingSuitBoardcastMsg
{	
	-- 玩家的roleID
	RoleId = 0,
	-- 玩家的角色名
    RoleName = "",
	-- 槽位组索引
    GroupIndex = 0,
	-- 套装等级
	Level = 0,
}
when{}
function ShengHuoLingSuitBoardcastMsg(RoleId, RoleName, GroupIndex, Level)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end
	_groupcallout(setNet, "ShengHuoLingSuitBoardcastMsg", {RoleId = RoleId,
		RoleName = RoleName, GroupIndex = GroupIndex, Level = Level});	
end
