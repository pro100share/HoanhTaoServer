local dwItemId = 4100524
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	objItemSys:GetPlayer():GetSystem("CCollectJewelLevelSystem"):
		ResetStateInfo(3);
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )












 
