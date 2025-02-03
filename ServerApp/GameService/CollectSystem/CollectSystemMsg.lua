
--[[
	收集系统消息 GS
	周长沙
	2013-1-24
--]]
_define()
-----------------------------------------------------
define.CollectSubmitItemMsg
{
	user = NONE;
	Info = {};
}
when{ user = NONE }
CollectSubmitItemMsg = checkUser
when{}
function CollectSubmitItemMsg(user,Info)
	local sysCollect = user:GetSystem("CCollectSystem")
	if not sysCollect then return end;
	sysCollect:OnRecvHandInMsg(Info)
end

define.CollectComposeItemMsg
{
	user = NONE;
	Info = {};
}
when{ user = NONE }
CollectComposeItemMsg = checkUser
when{}
function CollectComposeItemMsg(user,Info)
	local sysCollect = user:GetSystem("CCollectSystem")
	if not sysCollect then return end;
	sysCollect:OnRecvComposeMsg(Info)
end
