local dwItemId = 5500460
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	local sysBandit = objPlayer:GetSystem("CBanditSystem")
	sysBandit:OnRecvUseInfo(dwItemId)
	return 0
end


-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )












 