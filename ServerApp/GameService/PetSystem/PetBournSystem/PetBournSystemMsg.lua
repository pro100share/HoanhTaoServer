--������������װ��
define.RequestPetBournAddExpMsg
{
	user = NONE,
	DwPetId = 0,
	IsAutoBuy	= false,
	IsUseGold	= false,
}
when{ user = NONE }
RequestPetBournAddExpMsg = checkUser
when{ }
function RequestPetBournAddExpMsg(user, DwPetId, IsAutoBuy, IsUseGold)
	local petSystem = user:GetSystem("CPetSystem");
	if not petSystem then
		return;
	end;
	petSystem.petBourn:AddExp(DwPetId, IsAutoBuy, IsUseGold);
end; 

--�����鱶��
define.RequestExpMulMsg
{
	user = NONE,
	
}
when{ user = NONE }
RequestExpMulMsg = checkUser
when{ }
function RequestExpMulMsg(user)
	local petSystem = user:GetSystem("CPetSystem");
	if not petSystem then
		return;
	end;
	petSystem.petBourn:SendExpMul();
end

--�㲥
-- define.PetEquipUpGradeMsg
-- {
	-- RoleId = 0,
    -- RoleName = "",
    -- PetId = 0,
    -- EquipType = 0,
	-- CurLevel = 0,
-- }
-- when{}
-- function PetEquipUpGradeMsg(RoleId, RoleName, PetId, EquipType, CurLevel)
	-- local setNet = {};
	-- for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		-- table.insert(setNet, objPlayer.objNet);
	-- end;
	-- _groupcallout(setNet, "PetEquipUpGradeMsg", {RoleId = RoleId, RoleName = RoleName, PetId = PetId, EquipType = EquipType, CurLevel = CurLevel});	
-- end;