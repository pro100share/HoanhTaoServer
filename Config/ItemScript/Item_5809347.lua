local dwItemId = 5809347
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
	{5920004,300,1};
	{5920004,400,2};
	{5920004,500,3};
	
	{5940003,200,1};
	{5940003,300,2};
	{5940003,400,3};
	{5940003,600,5};
	
	{5930005,500,3};
	{5930005,400,4};
	{5930005,300,5};
	{5930005,200,6};

	{5910003,300,1};
	{5910003,250,2};
	{5910003,200,5};
	{5910003,150,8};
	{5910003,100,10};

	{4100430,1000,2};
	{4100430,900,3};
	{4100430,800,4};
	{4100430,700,5};
	{4100430,600,6};
	{4100430,500,7};
	{4100430,400,8};
	

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







 