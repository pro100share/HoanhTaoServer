local dwItemId = 4100525
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	if not objItemSys:GetPlayer():GetSystem("CTongTianTowerSystem"):Reset(false) then
		return 14000100006;
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )












 
