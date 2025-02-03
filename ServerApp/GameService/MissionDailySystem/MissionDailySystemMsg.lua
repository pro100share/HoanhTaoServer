
--
define.ServMissionDailyMsg
{
	user = NONE, 
	Type = -1,
	Param = {},
}
when{ user = NONE }
ServMissionDailyMsg = checkUser
when{ }
function ServMissionDailyMsg(user,Type,Param)
    local missionDailySystem = user:GetSystem("CMissionDailySystem");
	if not missionDailySystem then
		return;
	end;
	missionDailySystem:Decode(Type,Param);
end



-------广播
define.ServMissionDailyUniCastMsg
{
	user = NONE, 
	Param = {},
}
when{ user = NONE }
ServMissionDailyUniCastMsg = checkUser
when{ }
function ServMissionDailyUniCastMsg(user,Param)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		--if objPlayer:GetInfo().dwLevel >= n_BroadCastLevel then
			table.insert(setNet, objPlayer.objNet);
		--end;
	end;
	_groupcallout(setNet, "CltMissionDailyMsg", {Type = MissionDailyMsgConfig.OtherGetChargeGiftSure,Param = Param});
end