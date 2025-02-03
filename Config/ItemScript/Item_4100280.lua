local dwItemId = 4100280
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--检测物品是否可以使用
function ItemScriptObj:CheckForUse(objItemSys, objItem, scriptSys)
	if not objItemSys:IsEquipNeedRepair() then
		objItemSys:OnError( 6000510022 );--提示
		return false;
	end
	return 0;
end
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	objItemSys:RepairEquipsPutOn(true);
	objItemSys:OnError( 6000510024 );--提示
end


-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 