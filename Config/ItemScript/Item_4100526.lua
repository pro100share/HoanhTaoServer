local dwItemId = 4100526
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	for i = 1, 3 do
		objItemSys:GetPlayer():GetSystem("CCollectJewelLevelSystem"):
			ResetStateInfo(i);
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )












 
