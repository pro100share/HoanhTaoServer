local dwItemId = 5809669
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
	{5929004,8000,1};
	{5949001,1500,1};
	{5919005,500,1};
	
};
local data1 = {
	{9405041,10000,1};
};

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)

	-- print("+++++++++++++9999+++++++++++++++")
	if not objItemSys:IsPacketSlotEnoughFor(2) then return 9000110010 end;
	-- print("+++++++++++++9999+++++++++++++++")
	local id,Count = ArticleSustain:probability(data)
	-- local id1,Count1 = ArticleSustain:probability(data1)
	local addTable = {};
	--[[
	_G.enItemBindType.eNo--未绑定
	_G.enItemBindType.eYes--已绑定
	]]
	--碎片
	local item1 = {}
	local item2 = {}
	item2.dwItemEnum = 9405041;
	item2.dwItemNumber = 1;
	item2.dwBindType = enItemBindType.eYes;
	--物品ID
	item1.dwItemEnum = id;
	--数量
	item1.dwItemNumber = Count;
	--绑定类型 
	item1.dwBindType = enItemBindType.eYes;
	table.insert(addTable, item1);
	table.insert(addTable, item2);
	--_G.ItemSysOperType.Used 用于记录的 必须填
	if not objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used,true) then
		--什么都不返回  标示 删除道具，返回大于0的标示 错误提示
		return 6000810018;
	end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 