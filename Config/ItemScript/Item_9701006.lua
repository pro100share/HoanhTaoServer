 local dwItemId = 9701006
 local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--function ItemScriptObj:CheckForUse(objItemSys, objItem)
	--return 0;
--end

--ʹ����Ʒ
function ItemScriptObj:OnUseItem(objItemSys, objItem)
    local objPlayer = objItemSys:GetPlayer();
	local petSys = objPlayer:GetSystem("CPetSystem");
	if(not petSys) then
	    return false;
	end
	local objPet = petSys:GetPetObj(10051001)
	if(not objPet) then
	    return 8008000411;
	end
	
	---�ж��Ƿ񳬹�����
	local tempPer = objPet.dwFper/100+0.01;
	if(tempPer > PetFunctionConfig.PetRoleAddPerMaxConfig[10051001]) then
		return 8008000412;
	end
----���ó���������԰ٷֱ�
    objPet:SetFPer(0.01);
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )