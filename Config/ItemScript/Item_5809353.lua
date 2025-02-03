local dwItemId = 5809353
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
	[1] = --男的
	{
		{1600090,50,1};
		{1600060,100,1};
		{1600030,300,1};
		{5500020,150,1};
		{5600040,2500,1};
		{4100410,2000,1};
		{2500030,1500,1};
		{5940007,2600,1};
		{5910003,800,1};
	};	
	[2] = --女的
	{
		{1600080,50,1};
		{1600050,100,1};
		{1600020,300,1};
		{5500020,150,1};
		{5600040,2500,1};
		{4100410,2000,1};
		{2500030,1500,1};
		{5940007,2600,1};
		{5910003,800,1};	
	};
};

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)

	if not objItemSys:IsPacketSlotEnoughFor(1) then return 9000110010 end;

	local ZhiYe =  objItemSys:GetPlayer():GetInfo().dwProf
	local id,Count = nil,nil
	
	if ZhiYe==1 or ZhiYe==4 then
		id,Count = ArticleSustain:probability(data[1])
	else
		id,Count = ArticleSustain:probability(data[2])
	end 
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







 