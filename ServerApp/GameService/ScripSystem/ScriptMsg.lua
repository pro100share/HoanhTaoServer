--收到公告
_define()
define.ScriptOnRecvSystemNoticeMsg
{
	Str = ""
}
when{}
function ScriptOnRecvSystemNoticeMsg(Str)
	CScriptManager:LineNotice(Str)
end;

define.ScriptChatNoticeMsg
{
	Str = "";
	Channel = 0;
	System = false;
	Param = {}; 
	Str2 = "";
	HideHead = false;
}
when{}
function ScriptChatNoticeMsg(Str,Channel,System,Param,Str2,HideHead)
	CScriptManager:ChatNotice(Str,Channel,System,Param,Str2,HideHead)
end

define.ScriptTipNoticeMsg
{
	Str = "";
    Link = "";
}
when{}
function ScriptTipNoticeMsg(Str, Link)
	CScriptManager:TipNotice(Str, Link)
end;

define.ScriptChargeInfoMsg
{
	Info = {}
}
when{}
function ScriptChargeInfoMsg(Info)
	CScriptManager:OnRecvChargeInfo(Info)
end

define.ScriptUrlInfoMsg
{
	Info = {}
}
when{}
function ScriptUrlInfoMsg(Info)
	CScriptManager:OnRecvUrlInfo(Info)
end
--------------------------------------------------------
define.ScriptMicInfoMsg
{
	user = NONE;
	IsMic = 0;
}
when{ user = NONE }
ScriptMicInfoMsg = checkUser
when{}
function ScriptMicInfoMsg(user,IsMic)
	local sys = user:GetSystem("CScriptSystem");
	if not sys then return end;
	sys:OnRecvMicInfo(IsMic)
end



