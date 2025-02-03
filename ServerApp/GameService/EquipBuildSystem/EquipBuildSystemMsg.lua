--�����������װ��
define.ReqEquipBuidMsg
{
	user = NONE, 
	SlotPos = 1,
	Type = 1,
}
when{ user = NONE }
ReqEquipBuidMsg = checkUser
when{ }
function ReqEquipBuidMsg(user, SlotPos, Type)
	local equipBuild = user:GetSystem("CEquipBuildSystem");
	if not equipBuild then
		return;
	end;
	equipBuild:ReqEquipBuild(SlotPos, Type);
end;

--�㲥
define.EquipBuildSys_BroadCastMsg
{
	PlayerName = "",
    PlayerRoleID = 0,
    SlotPos = 0,
    Level = 0,
}
when{}
function EquipBuildSys_BroadCastMsg(PlayerName, PlayerRoleID, SlotPos, Level)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "EquipBuildSys_BroadCastMsg", {PlayerName = PlayerName, PlayerRoleID = PlayerRoleID, SlotPos = SlotPos, Level = Level});	
end;

--ÿ��00�㶨ʱ����װ������ͨ��Ԫ����������
define.UpdateEquipBuildMsg
{
}
when{}
function UpdateEquipBuildMsg()
	local onlinePlayerTbl = CPlayerManager.setAllPlayer;
	local setNet = {}; 
	for id, player in pairs(onlinePlayerTbl) do
		if player and player:GetSystem("CEquipBuildSystem"):HasAuthority("ZhuangBeiXiuLian") then
			local system = player:GetSystem("CEquipBuildSystem");
			system:SetEquipBuildNum()
			if player then
				table.insert(setNet, player.objNet);
			end;
		end;
	end;
	_groupcallout(setNet, "ResetEquipBuildNumMsg", {});	
end;

--�鿴�Է�װ��������Ϣ
define.EquipBuildSys_ViewOtherSwordMsg
{
	user = NONE,
	RoleID = 0, 
}
when{ user = NONE }
EquipBuildSys_ViewOtherSwordMsg = checkUser
when{ }
function EquipBuildSys_ViewOtherSwordMsg(user, RoleID)
	local equipBuild = user:GetSystem("CEquipBuildSystem");
	if not equipBuild then
		return;
	end;
	equipBuild:ViewOtherEquipBuild(RoleID);
end;

--�������������װ
define.ReqUpEquipSuitMsg
{
	user = NONE, 
}
when{ user = NONE }
ReqUpEquipSuitMsg = checkUser
when{ }
function ReqUpEquipSuitMsg(user)
	local equipBuild = user:GetSystem("CEquipBuildSystem");
	if not equipBuild then
		return;
	end;
	equipBuild:ActivateSuit();
end;