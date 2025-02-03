local dwItemId = 5809686
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
	{8700023,670,1};
	{8700024,670,1};
	{8700025,670,1};
	{8700026,670,1};
	{8700027,670,1};
	{8700028,670,1};
	{8700029,670,1};
	{8700034,670,1};
	{8700035,670,1};
	{8700036,670,1};
	{8700037,670,1};
	{8700038,670,1};
	{8700039,670,1};
	{8700040,670,1};
	{8700041,670,1};
};

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)

	if not objItemSys:IsPacketSlotEnoughFor(1) then return 9000110010 end;
	
	local id,Count = ArticleSustain:probability(data)
	local addTable = {};
	
	print("ItemScriptObj:OnUseItem",id,Count)
	--[[
	_G.enItemBindType.eNo--未绑定
	_G.enItemBindType.eYes--已绑定
	]]
	--碎片
	local item1 = {}
	--物品ID
	item1.dwItemEnum = id;
	--数量
	item1.dwItemNumber = Count;
	--绑定类型 
	item1.dwBindType = enItemBindType.eYes;
	table.insert(addTable, item1);
	--_G.ItemSysOperType.Used 用于记录的 必须填
	if not objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used,true) then
		--什么都不返回  标示 删除道具，返回大于0的标示 错误提示
		return 6000810018;
	end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 