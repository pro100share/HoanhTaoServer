define.RequestAddictedNoticeMsg
{
	user = NONE,
}
when{ user = NONE }
RequestAddictedNoticeMsg = checkUser
when{}
function RequestAddictedNoticeMsg(user)
	--CKernelApp.RequestAddictedNoticeMsg{_aid=user:GetAccountID()};
	local objSys = user:GetSystem("CAvoidAddictedSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestAddictedNotice");
		return; 
	end;
	-- print("Get RequestAddictedNoticeMsg")
	objSys:RequestAddictedNotice();
end

define.OnReceiveAddictedNoticeMsg
{ 
	user = NONE;
	Tips = 0;
	GameTime = 0;
	AdultFlag = 0;
}
when{user = NONE}
OnReceiveAddictedNoticeMsg = checkKSUser
when{}
function OnReceiveAddictedNoticeMsg(user,Tips,GameTime,AdultFlag)
	user:GetSystem("CAvoidAddictedSystem"):SynchronizeNotify( Tips, GameTime, AdultFlag );
	--user.OnReceiveAddictedNoticeMsg{Tips=Tips,GameTime=GameTime}
end

define.OnReceiveAddictedUpdateMsg
{
	user = NONE,
	Value = 0
}
when{user = NONE}
OnReceiveAddictedUpdateMsg = checkKSUser
when{}
function OnReceiveAddictedUpdateMsg(user,Value)
	user:GetSystem("CAvoidAddictedSystem"):NotifyIncome( Value );
	--user:UpdateAddicted( Value );
end

define.OnCancelAddictedStateMsg
{
	user = NONE
}
when{user = NONE}
OnCancelAddictedStateMsg = checkKSUser
when{}
function OnCancelAddictedStateMsg(user)
	user:GetSystem("CAvoidAddictedSystem"):SynchronizeCancel();
	--user.OnCancelAddictedStateMsg{}
end












