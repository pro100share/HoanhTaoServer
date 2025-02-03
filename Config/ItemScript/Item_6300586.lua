local dwItemId = 6300586
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local ItemData = {
	[1] = {8300025,8300029,8300033},
	[2] = {8300026,8300030,8300034},
	[3] = {8300027,8300031,8300035},
	[4] = {8300028,8300032},
	[5] = {8300036}
}; 

local data = {
	{ItemData[1],1600,1},
	{ItemData[2],1000,1},
	{ItemData[3],600,1},
	{ItemData[4],150,1},
	{ItemData[5],100,1},
};

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)

	if not objItemSys:IsPacketSlotEnoughFor(1) then return 9000110010 end;

	local itemTable,Count = ArticleSustain:probability(data)
	local dwRand = math.random( #itemTable )
	local id = itemTable[dwRand];
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







 