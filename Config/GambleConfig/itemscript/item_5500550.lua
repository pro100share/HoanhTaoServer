local dwItemId = 5500550
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem, sysScript)
	if not self.bChange then
		self.bChange = true
		sysScript:ChangeLook(1007)
	else
		self.bChange = nil
		sysScript:ChangeLook(0) 
	end
	return 0;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 