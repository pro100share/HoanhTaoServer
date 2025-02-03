local dwItemId = 5809344
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
	{5920004,200,1};
	{5920004,300,2};
	{5920004,400,3};
	
	{5940003,200,1};
	{5940003,300,2};
	{5940003,400,3};
	{5940003,500,5};
	
	{5910003,300,1};
	{5910003,400,5};
	{5910003,480,5};
	{5910003,500,8};
	{5910003,600,10};
	
	{4100130,1000,2};
	{4100130,900,3};
	{4100130,800,4};
	{4100130,700,5};
	{4100130,600,6};

	{4100210,400,18};
	{4100210,300,28};
	{4100210,200,38};
	{4100210,100,48};
	
	{5803004,150,1};
	{5803004,100,2};
	{5803004,50,3};
	
	{5803005,10,1};
	{5803005,20,2};
	{5803005,30,3};
	
	{5803001,30,1};
	{5803001,20,1};
	{5803001,10,1};	
	

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







 