--[[
功能：经脉系统消息处理
作者：
时间：2012-02-02
]]

--冲穴请求
define.ServBumpPulseMsg
{
	user = NONE, 
	Type = -1,
	DrugNum = 0,
}
when{ user = NONE }
ServBumpPulseMsg = checkUser
when{ }
function ServBumpPulseMsg(user,Type,DrugNum)
    local pulseSystem = user:GetSystem("CPulseSystem");
	if not pulseSystem then
		return;
	end;
	pulseSystem:BumpPulseBefore(Type,DrugNum);
end

--冲穴倒数时间到
define.ServImprovePulseMsg
{
	user = NONE, 
	Type = -1,
}
when{ user = NONE }
ServImprovePulseMsg = checkUser
when{ }
function ServImprovePulseMsg(user,Type)
    local pulseSystem = user:GetSystem("CPulseSystem");
	if not pulseSystem then
		return;
	end;
	pulseSystem:ImprovePulse(Type);
end

--换场景
define.ServPulseChangeMapMsg
{
	user = NONE, 
}
when{ user = NONE }
ServPulseChangeMapMsg = checkUser
when{ }
function ServPulseChangeMapMsg(user)
	if not CConfig.bIsCrossSvr then
		local pulseSystem = user:GetSystem("CPulseSystem");
		if not pulseSystem then
			return;
		end;
		pulseSystem:ChangeScene();
	end;
end

-------广播
define.ServPulseUniCastMsg
{
	user = NONE, 
	RoleID = -1,
	Type = -1,
	RoleName = '',
	PulseFullNum = -1,
}
when{ user = NONE }
ServPulseUniCastMsg = checkUser
when{ }
function ServPulseUniCastMsg(user,RoleID,Type,RoleName,PulseFullNum)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltFlushPulseInfoMsg", {Type = enumPulseFeedBack.FinishOnePulse,RoleID = RoleID,Opt = Type,RoleName = RoleName});
	if PulseFullNum == #PulseConfig then
		_groupcallout(setNet, "CltFlushPulseInfoMsg", {Type = enumPulseFeedBack.FinishAllPulse,RoleID = RoleID,Opt = Type,RoleName = RoleName});
	end
end

----开启龙脉广播
define.OpenDraPulseCastMsg
{
	RoleID = 0,
	RoleName = '',
	DarPul = 0,
}
when{ }
function OpenDraPulseCastMsg(RoleID,RoleName,DarPul)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltOpenDraPulseCastMsg", {RoleID = RoleID,RoleName = RoleName,DarPul = DarPul});
end


define.OpenDragonPulseRequestMsg
{
	user = NONE,
	DragonIndex = 0;
}
when{ user = NONE }
OpenDragonPulseRequestMsg = checkUser
when{ }
function OpenDragonPulseRequestMsg(user,DragonIndex)
    local pulseSystem = user:GetSystem("CPulseSystem");
	if not pulseSystem then
		return;
	end;
	pulseSystem:UseItemOpenDraPul(DragonIndex);
end
