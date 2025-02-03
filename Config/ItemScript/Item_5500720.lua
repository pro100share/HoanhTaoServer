local dwItemId = 5500720
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
function ItemScriptObj:CheckForUse(objItemSys, objItem, sysScript)
	if objItemSys:GetBindGold() + 666 > _G.InitConfig.dwMaxMoney then
		return false;
	end
	return 0;
end;

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	objItemSys:AddBindGold(666, _G.ItemSysOperType.Used);
	return false
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 