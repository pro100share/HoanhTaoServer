--演武消息

--申请创建演武
define.OnCreateMartialRequestMsg
{
	user = NONE;
	DirValue = 0;
}
when {user = NONE}
OnCreateMartialRequestMsg = checkUser;
when{}
function OnCreateMartialRequestMsg(user,DirValue)
	local objStateSys = user:GetSystem("CStateSystem");
	if objStateSys then
		if not objStateSys:CheckPlayerAction(enPlayerAction.ePA_EnterMar) then
			return;
		end
	end
	
	local objMarSys = user:GetSystem("CMartialSystem");
	if objMarSys then
		objMarSys:CreateMartial(DirValue);
	end
end;

--申请参加演武
define.OnJoinMartialRequestMsg
{
	user = NONE;
	MartialID = 0;
}
when {user = NONE}
OnJoinMartialRequestMsg = checkUser;
when{}
function OnJoinMartialRequestMsg(user,MartialID)
	local objStateSys = user:GetSystem("CStateSystem");
	if objStateSys then
		if not objStateSys:CheckPlayerAction(enPlayerAction.ePA_Move) then
			return;
		end
	end
	
	local objMarSys = user:GetSystem("CMartialSystem");
	if objMarSys then
		objMarSys:TryEnterMartial(MartialID);
	end
end;

--已经到达演武位置
define.OnReadyMartialMsg
{
	user = NONE;
	MartialID = 0;
	Index = 0;
}
when {user = NONE}
OnReadyMartialMsg = checkUser;
when{}
function OnReadyMartialMsg(user,MartialID,Index)
	local objMarSys = user:GetSystem("CMartialSystem");
	if objMarSys then
		objMarSys:ReadyMartial(MartialID,Index);
	end
end;

--申请离开演武
define.OnLeaveMartialRequestMsg
{
	user = NONE;
}
when {user = NONE}
OnLeaveMartialRequestMsg = checkUser;
when{}
function OnLeaveMartialRequestMsg(user)
	local objMarSys = user:GetSystem("CMartialSystem");
	if objMarSys then
		objMarSys:LeaveCurMartial();
	end
end;

--设置演武技能
define.OnSetMartialSkillMsg
{
	user = NONE;
	SkillID = 0;
}
when {user = NONE}
OnSetMartialSkillMsg = checkUser;
when{}
function OnSetMartialSkillMsg(user,SkillID)
	local objMarSys = user:GetSystem("CMartialSystem");
	if objMarSys then
		objMarSys:SetMartialSkill(SkillID);
	end
end;

--客户端通知自己是否可以自动吃药
define.OnReadyFlagMsg
{
	user = NONE;
	Flag = 0;--0，不可以吃药；1~5使用不同类型的加速药，配置中写
}
when {user = NONE}
OnReadyFlagMsg = checkUser;
when{}
function OnReadyFlagMsg(user,Flag)
	local objMarSys = user:GetSystem("CMartialSystem");
	if objMarSys then
		objMarSys:AutoRadyNotice(Flag);
	end
end;


