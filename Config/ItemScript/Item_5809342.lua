local dwItemId = 5809342
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
	{5920004,400,1};
	{5920004,500,2};
	{5920004,600,3};
	
	{5940003,400,1};
	{5940003,500,2};
	{5940003,600,3};
	{5940003,770,5};
	
	{4100110,1000,2};
	{4100110,900,3};
	{4100110,800,4};
	{4100110,700,5};
	{4100110,600,6};
	
	{4100290,400,18};
	{4100290,300,28};
	{4100290,200,38};
	
	{4100300,300,8};
	{4100300,200,18};
	{4100300,100,28};
	
	{4100310,100,6};
	{4100310,70,10};
	{4100310,40,18};
	
	{4100320,50,3};
	{4100320,30,6};
	{4100320,20,9};
	
	{5802004,150,1};
	{5802004,100,2};
	{5802004,50,3};
	
	{5802005,10,1};
	{5802005,20,2};
	{5802005,30,3};
	
	{5802001,30,1};
	{5802002,20,1};
	{5802003,10,1};	
	

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







 