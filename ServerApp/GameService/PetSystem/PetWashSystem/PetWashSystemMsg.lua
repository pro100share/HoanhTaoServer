--«Î«Û≥ËŒÔœ¥¡∑
define.RequestPetWashMsg
{
	user = NONE,
	DwPetId = 0,
	IsRuneActive = false,
	IsAutoBuy	= false,
	IsUseGold	= false,
}
when{ user = NONE }
RequestPetWashMsg = checkUser
when{ }
function RequestPetWashMsg(user, DwPetId, IsRuneActive, IsAutoBuy, IsUseGold)
	local petSystem = user:GetSystem("CPetSystem");
	if not petSystem then
		return;
	end;
	petSystem.petWash:Wash(DwPetId, IsRuneActive, IsAutoBuy, IsUseGold);
end; 


--π„≤•
define.PetWashBoardcastMsg
{
	RoleId = 0,
	PetId = 0,
    RoleName = "",
    WashLevel = 0,
	SetAttr = {},
}
when{}
function PetWashBoardcastMsg(RoleId, PetId, RoleName, WashLevel, SetAttr)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "PetWashBoardcastMsg", {RoleId = RoleId, PetId = PetId, RoleName = RoleName, WashLevel = WashLevel, SetAttr = SetAttr});	
end;

