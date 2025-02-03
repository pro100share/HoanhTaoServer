local dwItemId = 2300120
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});


-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	objPlayer:GetSystem('CFiveElemSystem'):AddElemTime('dwWood',60*60*1000)
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 