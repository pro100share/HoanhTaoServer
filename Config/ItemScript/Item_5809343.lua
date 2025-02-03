local dwItemId = 5809343
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
	{5940003,600,5};
	
	{9405010,1000,2};
	{9405010,900,3};
	{9405010,800,4};
	{9405010,700,5};
	{9405010,600,6};
	{9405010,500,7};
	{9405010,400,8};
	
	{4902005,200,2};
	{4902005,150,3};
	{4902005,100,4};
	
	{4902006,200,2};
	{4902006,150,3};
	{4902006,100,4};
	
	{4902003,200,2};
	{4902003,150,3};
	{4902003,100,4};
	
	{4902004,200,2};
	{4902004,150,3};
	{4902004,100,4};
	
	{9405040,100,1};
	{9405040,50,2};
	{9405040,30,3};
	
	{5801004,150,1};
	{5801004,100,2};
	{5801004,50,3};
	
	{5801005,10,1};
	{5801005,20,2};
	{5801005,30,3};
	
	{5801001,30,1};
	{5801002,20,1};
	{5801003,10,1};	
	

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







 