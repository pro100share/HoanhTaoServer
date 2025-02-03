local dwItemId = 6300567
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local dwRand = math.random(10000);
	if dwRand <= 10 then
		objItemSys:AddGold(5000, _G.ItemSysOperType.Used);
	elseif dwRand <= 40 then
		objItemSys:AddGold(2000, _G.ItemSysOperType.Used);
	elseif dwRand <= 150 then
		objItemSys:AddGold(1000, _G.ItemSysOperType.Used);
	elseif dwRand <= 800 then
		objItemSys:AddGold(500, _G.ItemSysOperType.Used);
	elseif dwRand <= 3000 then
		objItemSys:AddGold(200, _G.ItemSysOperType.Used);
	else
		objItemSys:AddGold(100, _G.ItemSysOperType.Used);
	end
	return false
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 