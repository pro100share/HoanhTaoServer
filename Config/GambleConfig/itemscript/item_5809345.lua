local dwItemId = 5809345
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
	{5920004,200,1};
	{5920004,300,2};
	{5920004,400,3};
	
	{5940003,300,1};
	{5940003,400,2};
	{5940003,500,3};
	{5940003,700,5};
	
	{2500050,1000,2};
	{2500050,900,3};
	{2500050,800,4};
	{2500050,700,5};
	{2500050,600,6};
	{2500050,500,7};
	{2500050,400,8};

	{4900050,400,18};
	{4900050,300,28};
	{4900050,200,38};
	
	{5809253,80,1};
	
	{2500106,300,2};
	{2500106,200,4};
	{2500106,100,6};
	
	{2500108,150,2};
	{2500108,100,4};
	{2500108,50,6};
	
	{5804004,150,1};
	{5804004,100,2};
	{5804004,50,3};	
	
	{5804005,10,1};
	{5804005,20,2};
	{5804005,30,3};	
	
	{5804001,30,1};
	{5804001,20,1};
	{5804001,10,1};	
	

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







 