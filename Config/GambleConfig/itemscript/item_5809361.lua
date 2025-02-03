local dwItemId = 5809361
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
	{4100130,200,5};
	{4100130,300,10};
	{4100130,400,15};
	{4100130,300,20};
	{4100130,200,25};
	
	{9405010,200,5};
	{9405010,400,10};
	{9405010,500,15};
	{9405010,300,20};
	{9405010,200,25};
	
	{4100110,200,5};
	{4100110,300,10};
	{4100110,400,15};
	{4100110,300,20};
	{4100110,200,25};
	
	{2500050,200,5};
	{2500050,300,10};
	{2500050,400,15};
	{2500050,300,20};
	{2500050,200,25};
	
	{4100410,200,5};
	{4100410,300,10};
	{4100410,400,15};
	{4100410,300,20};
	{4100410,200,25};
	
	{4100430,200,5};
	{4100430,300,10};
	{4100430,400,15};
	{4100430,300,20};
	{4100430,200,25};
	
	{2500331,200,5};
	{2500331,300,10};
	{2500331,400,15};
	{2500331,300,20};
	{2500331,200,25};
	
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







 