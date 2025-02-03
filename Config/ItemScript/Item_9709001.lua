local dwItemId = 9709001
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	
	local bUse = false;
	local dwError = 0;
	--血
	if objPlayer:GetSystem('CPetSystem'):ChangeOutputPetHp(250) then
		bUse = true;
	else
		dwError = 6000610019;
	end;
	
	if not bUse then return dwError end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

	
