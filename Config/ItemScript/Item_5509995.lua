local dwItemId = 5509995
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	local sysBandit = objPlayer:GetSystem("CBaiduBanditSystem")
	sysBandit:Use(objItem:GetInstID())
	return 0
end


-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )












 