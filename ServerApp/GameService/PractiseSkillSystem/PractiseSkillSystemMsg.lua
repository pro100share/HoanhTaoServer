
--[[
	--功能：童姥功系统消息
	--作者：魏云
	--时间：2013-12-20
--]]

--玩家请求兑换修为
define.ReqExchangeMendValueMsg
{
	user = NONE,
	ExchangeExp = 0;
};
when {user = NONE}
ReqExchangeMendValueMsg = checkUser;
when{}
function ReqExchangeMendValueMsg(user,ExchangeExp)
	local Sys = user:GetSystem("CPractiseSkillSystem");
	if not Sys then
		return;
	end;
	Sys:ExchangeMendValue(ExchangeExp);
end

----使用六和八荒 获取修为值
define.ButtonExchangeMendValueMsg
{
	user = NONE,
};
when {user = NONE}
ButtonExchangeMendValueMsg = checkUser;
when{}
function ButtonExchangeMendValueMsg(user)
	local Sys = user:GetSystem("CPractiseSkillSystem");
	if not Sys then
		return;
	end;
	Sys:ButtonExchangeMendValue();
end

----开启套装星星
define.ReqOpenSuitStarMsg
{
	user = NONE,
	StarLevel = 0,
};
when {user = NONE}
ReqOpenSuitStarMsg = checkUser;
when{}
function ReqOpenSuitStarMsg(user,StarLevel)
	local Sys = user:GetSystem("CPractiseSkillSystem");
	if not Sys then
		return;
	end;
	Sys:OpenSuitStar(StarLevel);
end

---使用特殊头像

define.ReqUseSpecialPortraitMsg
{
	user = NONE,
};
when {user = NONE}
ReqUseSpecialPortraitMsg = checkUser;
when{}
function ReqUseSpecialPortraitMsg(user)
	local Sys = user:GetSystem("CPractiseSkillSystem");
	if not Sys then
		return;
	end;
	Sys:UseSpecialPortrait();
end
----查看对方童姥功信息
define.ReqViewOtherPractiseSkillMsg
{
	user = NONE,
	OtherRoleID = 0,
};
when {user = NONE}
ReqViewOtherPractiseSkillMsg = checkUser;
when{}
function ReqViewOtherPractiseSkillMsg(user,OtherRoleID)
	local Sys = user:GetSystem("CPractiseSkillSystem");
	if not Sys then
		return;
	end;
	Sys:ViewOtherPractiseSkill(OtherRoleID);
end
----广播套装
define.BroadCastSuitStarOpenMsg
{
	RoleID	= 0,
	RoleName= "",
	Level = 0,
};
when{}
function BroadCastSuitStarOpenMsg(RoleID,RoleName,Level)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltBroadCastSuitStarOpenMsg", {RoleID = RoleID,RoleName = RoleName,Level = Level});	
end

----广播等级

define.BroadCastAddLevelMsg
{
	RoleID	= 0,
	RoleName= "",
	Level = 0,
};
when{}
function BroadCastAddLevelMsg(RoleID,RoleName,Level)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltBroadCastAddLevelMsg", {RoleID = RoleID,RoleName = RoleName,Level = Level});	
end


