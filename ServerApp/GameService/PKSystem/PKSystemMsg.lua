--[[
功能：PK系统的消息
作者：刘炜
时间：2012-2-16
]]

define.OnPKModeSetRequestMsg
{
	user = NONE,
	Mode = 0,
};
when{user = NONE}
OnPKModeSetRequestMsg = checkUser;
when{}
function OnPKModeSetRequestMsg(user,Mode)
	local PKSystem = user:GetSystem("CPKSystem");
	if not PKSystem then
		return;
	end;
	PKSystem:SetPKModeByClient(Mode);
end;

--设置加点方式
define.OnSetPointModeMsg
{
	user = NONE,
	Mode = 0;--0：手动；1：自动
}
when {user = NONE}
OnSetPointModeMsg = checkUser;
when{}
function OnSetPointModeMsg(user,Mode)
	local PKSystem = user:GetSystem("CPKSystem");
	if not PKSystem then
		return;
	end;
	PKSystem:SetPointMode(Mode);
end;