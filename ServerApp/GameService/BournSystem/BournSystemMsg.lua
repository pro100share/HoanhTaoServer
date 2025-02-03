
--提升境界
define.ServUpBournLvMsg
{
	user = NONE, 
	BournLv = -1,
	Info = {},
}
when{ user = NONE }
ServUpBournLvMsg = checkUser
when{ }
function ServUpBournLvMsg(user,BournLv,Info)
    local bournSystem = user:GetSystem("CBournSystem");
	if not bournSystem then
		return;
	end;
	bournSystem:UpBournLv(BournLv,Info);
end

-------广播
define.ServBournUniCastMsg
{
	user = NONE, 
	BournLv = -1,
	RoleID = -1,
	RoleName = '',
}
when{ user = NONE }
ServBournUniCastMsg = checkUser
when{ }
function ServBournUniCastMsg(user,BournLv,RoleID,RoleName)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	local tempInfo = {}
	tempInfo[1] = BournLv
	tempInfo[2] = RoleID
	tempInfo[3] = RoleName
	_groupcallout(setNet, "CltFlushBournMsg", {Type = enumBournMsg.One,Info = tempInfo});
	if BournLv == BournConfig.Num + 1 then
		_groupcallout(setNet, "CltFlushBournMsg", {Type = enumBournMsg.Full,Info = tempInfo});
	end

end