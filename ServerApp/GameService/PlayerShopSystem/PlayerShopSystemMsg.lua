--[[
功能：摆摊系统消息处理
作者：
时间：2012-02-20
]]


--玩家进入游戏
define.PlayerShopEnterGameMsg
{
	user = NONE, 
}
when{ user = NONE }
PlayerShopEnterGameMsg = checkUser
when{ }
function PlayerShopEnterGameMsg(user)
    local playerShopSystem = user:GetSystem("CPlayerShopSystem");
	if not playerShopSystem then
		return;
	end;
	playerShopSystem:EnterGame();
end
----------
--GS与C交互
define.ServPlayerShopMsg
{
	user = NONE,
	Type = PlayerShopConfig.Invaild,
	ParamInfo = {},
}
when{ user = NONE }
ServPlayerShopMsg = checkUser
when{ }
function ServPlayerShopMsg(user,Type,ParamInfo)
    local playerShopSystem = user:GetSystem("CPlayerShopSystem");
	if not playerShopSystem then
		return;
	end;
	playerShopSystem:DecodeShopMsg(Type,ParamInfo);
end
-----------------------------------------------
--GS与KS通信消息
define.GServPlayerShopMsg
{
	user = NONE,
	RoleID = -1,
	Type = PlayerShopConfig.Invaild,
	ParamInfo = {},
}
when{user = NONE}
GServPlayerShopMsg = checkKSUser;
when{}
function GServPlayerShopMsg(RoleID,Type,ParamInfo)
	local objPlayer = CPlayerManager:GetPlayerByRoleID(RoleID)
	if not objPlayer then return end
	local playerShopSys = objPlayer:GetSystem('CPlayerShopSystem')
	playerShopSys:DecodeShopMsgKS(Type,ParamInfo);
end
----------------------------------------------------
--所有GS接收KS的广播消息
define.GServPlayerShopOnMsg
{
	user = NONE,
	RoleID = -1,
	Type = PlayerShopConfig.Invaild,
	ParamInfo = {},
}
when{user = NONE}
GServPlayerShopOnMsg = checkKSUser;
when{}
function GServPlayerShopOnMsg(Type,RoleID,ParamInfo)
	CPlayerShopManager:DecodeShopMsgOnKS(Type,RoleID,ParamInfo);
end
