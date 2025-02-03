--����ʹ����Ʒ������������
define.AddExpByBatchMsg
{
	user = NONE,
	ItemId = 0,
	ItemNum = 0,
}
when{ user = NONE }
AddExpByBatchMsg = checkUser
when{ }
function AddExpByBatchMsg(user, ItemId, ItemNum)
	local tieBuShanSystem = user:GetSystem("CTieBuShanSystem");
	if not tieBuShanSystem then
		return;
	end;
	tieBuShanSystem:AddProcessByBatch(ItemId, ItemNum);
end; 

--��װ����
define.UpSuitLevelMsg
{
	user = NONE,
}
when{ user = NONE }
UpSuitLevelMsg = checkUser
when{ }
function UpSuitLevelMsg(user)
	local tieBuShanSystem = user:GetSystem("CTieBuShanSystem");
	if not tieBuShanSystem then
		return;
	end;
	tieBuShanSystem:ActivationSuit();
end; 

--�鿴�Է�������
define.TieBuShanSys_ViewOtherMsg
{
	user = NONE,
	RoleID = 0, 
}
when{ user = NONE }
TieBuShanSys_ViewOtherMsg = checkUser
when{ }
function TieBuShanSys_ViewOtherMsg(user, RoleID)
	local tieBuShanSystem = user:GetSystem("CTieBuShanSystem");
	if not tieBuShanSystem then
		return;
	end;
	tieBuShanSystem:ViewOtherTieBuShan(RoleID);
end; 

--��������װ�㲥
define.TieBuShanSuitSys_BroadCastMsg
{
	PlayerName = "",
	PlayerRoleID = 0,
	SuitLevel = 0,
}
when{}
function TieBuShanSuitSys_BroadCastMsg(PlayerName, PlayerRoleID, SuitLevel)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "TieBuShanSuitBroadCastMsg", {PlayerRoleID = PlayerRoleID, PlayerName = PlayerName, SuitLevel = SuitLevel});	
end;

--�����������㲥
define.TieBuShanSys_BroadCastMsg
{
	PlayerName = "",
	PlayerRoleID = 0,
	TieBuShanLevel = 0,
}
when{}
function TieBuShanSys_BroadCastMsg(PlayerName, PlayerRoleID, TieBuShanLevel)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "TieBuShanBroadCastMsg", {PlayerRoleID = PlayerRoleID, PlayerName = PlayerName, TieBuShanLevel = TieBuShanLevel});	
end;

