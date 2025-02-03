local dwItemId = 5500060
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	objPlayer:GetSystem('CVipSystem'):UseCard(objItem:GetEnumID());
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )


