 local dwItemId = 9701010
 local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--function ItemScriptObj:CheckForUse(objItemSys, objItem)
	--return 0;
--end

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
    local objPlayer = objItemSys:GetPlayer();
	local petSys = objPlayer:GetSystem("CPetSystem");
	if(not petSys) then
	    return false;
	end
	local objPet = petSys:GetPetObj(50302063)
	if(not objPet) then
	    return 8008000411;
	end
	
	---判断是否超过上限
	local tempPer = objPet.dwFper/100+0.01;
	if(tempPer > PetFunctionConfig.PetRoleAddPerMaxConfig[50302063]) then
		return 8008000412;
	end
----设置宠物加人属性百分比
    objPet:SetFPer(0.01);
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )