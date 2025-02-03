--[[
    [ \brief 古董系统消息文件
    [ \author 李中昌
    [ \date 2014-7-16
    [ 处理功法扩展系统消息
    ]]

--  请求系统信息
define.CurioRequestInfoMsg
{
	-- 默认参数 玩家对象
	user			= NONE,
}
when {user = NONE}
CurioRequestInfoMsg = checkUser;
when{}
function CurioRequestInfoMsg(user)
	user:GetSystem("CCurioSystem"):SynCount();
end

-- 提交碎片
define.CurioCommitMsg
{
	-- 默认参数 玩家对象
	user			= NONE,
    -- 提交的物品信息
    Info            = {},
}
when {user = NONE}
CurioCommitMsg = checkUser;
when{}
function CurioCommitMsg(user, Info)
	user:GetSystem("CCurioSystem"):Commit(Info);
end

--  古董搜集完成广播 
define.CurioBoardcastMsg
{	
	-- 玩家的roleID
	RoleID = 0,
	-- 玩家的角色名
    RoleName = "",
	--系统标识
	CurioIndex = 0,
}
when{}
function CurioBoardcastMsg(RoleID, RoleName, CurioIndex)
	local tNet = {};
	for i, oPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(tNet, oPlayer.objNet);
	end
	_groupcallout(
        tNet,
        "CurioBoardcastMsg",
        {
            RoleID = RoleID,
            RoleName = RoleName,
            CurioIndex = CurioIndex,
        }
    );	
end
