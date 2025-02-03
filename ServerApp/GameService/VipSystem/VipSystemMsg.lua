
--增加时间
define.ServVipUseCardMsg
{
	user = NONE, 
	CardID = -1,
}
when{ user = NONE }
ServVipUseCardMsg = checkUser
when{ }
function ServVipUseCardMsg(user,CardID)
    local vipSystem = user:GetSystem("CVipSystem");
	if not vipSystem then
		return;
	end;
	vipSystem:UseCard(CardID);
end

define.ServVipMsg
{
	user = NONE, 
	Type = -1,
}
when{ user = NONE }
ServVipMsg = checkUser
when{ }
function ServVipMsg(user,Type)
    local vipSystem = user:GetSystem("CVipSystem");
	if not vipSystem then
		return;
	end;
	vipSystem:DecodeMsg(Type);
end

-------广播
define.ServVipUniCastMsg
{
	user = NONE, 
	RoleID = -1,
	RoleName = ''
}
when{ user = NONE }
ServVipUniCastMsg = checkUser
when{ }
function ServVipUniCastMsg(user,RoleID,RoleName)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		if objPlayer:GetInfo().dwLevel >= BroadCastConfig.VIP then
			table.insert(setNet, objPlayer.objNet);
		end
	end;
	local info = {RoleID,RoleName};
	_groupcallout(setNet, "CltDecodeVipMsg", {Type = VipMsgConfig.UniCast,Info = info});
end
