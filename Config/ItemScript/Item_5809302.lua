local dwItemId = 5809302
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
	{9405040,300,1};		
	{5501135,200,1};		
	{5919002,150,1};
	{5919001,200,1};
	{5919003,100,1};		
	{4100400,200,1};		
	{2400100,200,1};
	{2400120,150,1};
	{2400130,100,1};	
	{5940006,500,1};
	{5930006,500,1};
	{4902008,300,1};
	{4902007,180,1};
	{4902009,500,1};
	{2500310,500,1};
	{4900050,500,5};
	{4901000,800,10};
	{5809263,100,1};
	{5802004,150,1};
	{5803004,150,1};
	{5804004,150,1};
	{5801004,150,1};
	{5802005,80,1};
	{5803005,80,1};
	{5804005,80,1};
	{5801005,80,1};
	{2500050,300,2};
	{9405010,300,2};
	{4100110,300,2};
	{4100130,300,2};
	{2500050,200,4};
	{9405010,200,4};
	{4100110,200,4};
	{4100130,200,4};
	{4100210,500,18};
	{4100320,500,3};
	{5809256,200,1};
	{5809258,200,1};
	{5809257,200,1};
	
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
	if not objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used, true) then
		--什么都不返回  标示 删除道具，返回大于0的标示 错误提示
		return 6000810018;
	end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 