
--领取物品
define.ServGrowupTargetMsg
{
	user = NONE, 
	StepID = -1,
	TargetID = -1,
}
when{ user = NONE }
ServGrowupTargetMsg = checkUser
when{ }
function ServGrowupTargetMsg(user,StepID,TargetID)
    local growupTargetSystem = user:GetSystem("CGrowupTargetSystem");
	if not growupTargetSystem then
		return;
	end;
	growupTargetSystem:DecodeMsg(StepID,TargetID);
end

-------广播
define.ServTargetUniCastMsg
{
	user = NONE, 
	Info = {},
}
when{ user = NONE }
ServTargetUniCastMsg = checkUser
when{ }
function ServTargetUniCastMsg(user,Info)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		if objPlayer:GetInfo().dwLevel >= BroadCastConfig.GrowupTargetMsg then
			table.insert(setNet, objPlayer.objNet);
		end
	end;
	_groupcallout(setNet, "CltGrowupTargetMsg", {Type = GrowupTargetMsgConfig.PlayerCompleteOneStep,Info = Info});
end