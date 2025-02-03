local dwItemId = 6300598	--项链礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local addTable = {};

	local item1 = {};
	item1.dwItemEnum	= 2400011;
	item1.dwItemNumber= 1;
	item1.dwBindType = enItemBindType.eYes;
	item1.setProperty = CGlobalItemManager:GetPropertyByQuality(2400011, 3);
	table.insert(addTable, item1);

	--_G.ItemSysOperType.Used 用于记录的 必须填
	if not objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used,true) then
		--什么都不返回  标示 删除道具，返回大于0的标示 错误提示
		return 6000810018;
	end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

