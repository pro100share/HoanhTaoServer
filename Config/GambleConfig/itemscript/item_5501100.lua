local dwItemId = 5501100
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

local data = {
		{5920004,2,3};
		{5920005,2,1};
		{5940003,3,10};
		{5940006,3,2};
		{5919001,5,1};
		{5919002,10,1};
		{5919003,4,1};
		{5602030,3,2};
		{5930003,1,8};
		{5930004,1,5};
		{5930006,4,1};
		{9405010,10,2};
		{4100130,10,2};
		{4100110,10,2};
		{4100120,10,2};
		{2500050,10,2};
		{2400110,6,5};
		{4901000,6,5};
};


-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)

	if not objItemSys:IsPacketSlotEnoughFor(1) then return 9000110010 end;

	local id,Count = ArticleSustain:probability(data)

	local addTable = {};

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







 