local dwItemId = 4100522
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	objItemSys:GetPlayer():GetSystem("CCollectJewelLevelSystem"):
		ResetStateInfo(1);
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )












 
