--请求升级宠物装备
define.RequestPetEquipLevelUpMsg
{
	user = NONE,
	DwPetId = 0,
	EquipType = 0,
}
when{ user = NONE }
RequestPetEquipLevelUpMsg = checkUser
when{ }
function RequestPetEquipLevelUpMsg(user, DwPetId, EquipType)
	local petSystem = user:GetSystem("CPetSystem");
	if not petSystem then
		return;
	end;
	petSystem.petEquip:UplevelEquip(DwPetId, EquipType);
end; 



--广播
define.PetEquipUpGradeMsg
{
	RoleId = 0,
    RoleName = "",
    PetId = 0,
    EquipType = 0,
	CurLevel = 0,
}
when{}
function PetEquipUpGradeMsg(RoleId, RoleName, PetId, EquipType, CurLevel)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "PetEquipUpGradeMsg", {RoleId = RoleId, RoleName = RoleName, PetId = PetId, EquipType = EquipType, CurLevel = CurLevel});	
end;