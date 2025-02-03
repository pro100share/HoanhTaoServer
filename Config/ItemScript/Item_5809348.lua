local dwItemId = 5809348
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)

	if not objItemSys:IsPacketSlotEnoughFor(1) then return 9000110010 end;

	local Gold = objItemSys:IsGoldEnough(10) 
	if not Gold then
		objItemSys:OnError(4000110057)
		return 0;
	end
	local addTable = {};	
	
	local rand = math.random(1, 10000);
	if rand <=200 then
		local item1 = {}
		--ID
		item1.dwItemEnum = 3900060
		--数量
		item1.dwItemNumber = 1;
		--绑定类型 
		item1.dwBindType = enItemBindType.eYes;
		table.insert(addTable, item1);
	end
	
	local item2 = {}
	item2.dwItemEnum = 4100110
	--数量
	item2.dwItemNumber = 8;
	--绑定类型 
	item2.dwBindType = enItemBindType.eYes;
	table.insert(addTable, item2);
	
	objItemSys:CostGold(10, _G.ItemSysOperType.ElemBalance)
	objItemSys:OnError(4000110058)
	
	
	--_G.ItemSysOperType.Used 用于记录的 必须填
	if not objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used,true) then
		--什么都不返回  标示 删除道具，返回大于0的标示 错误提示
		return 6000810018;
	end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 