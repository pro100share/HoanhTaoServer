local dwItemId = 5809687
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
	{8700042,770,1};
	{8700043,770,1};
	{8700044,770,1};
	{8700045,770,1};
	{8700046,770,1};
	{8700047,770,1};
	{8700048,770,1};
	{8700049,770,1};
	{8700050,770,1};
	{8700051,770,1};
	{8700052,770,1};
	{8700053,770,1};
	{8700054,770,1};
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







 