local dwItemId = 5809524
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local ItemData = {
	[1] = {8100701,8100702,8100703,8100704,8100705,8100706,8100707,8100708,8100709,8100710},
	[2] = {8100711,8100712,8100713,8100714,8100715,8100716},
	[3] = {8100717,8100718,8100719,8100720,8100721,8100722},
	[4] = {8100723,8100724},
	[5] = {8100725,8100726,8100727,8100728,8100729,8100730,8100731,8100732,8100733,8100734},
	[6] = {8100735,8100736,8100737,8100738,8100739,8100740},
	[7] = {8100741,8100742,8100743,8100744,8100745,8100746},
	[8] = {8100747,8100748},
	[9] = {8100749,8100750,8100751,8100752,8100753,8100754,8100755,8100756,8100757,8100758},
	[10] = {8100759,8100760,8100761,8100762,8100763,8100764},
	[11] = {8100765,8100766,8100767,8100768,8100769,8100770},
	[12] = {8100771,8100772},
	[13] = {8100773,8100774,8100775,8100776,8100777,8100778,8100779,8100780,8100781,8100782},
	[14] = {8100783,8100784,8100785,8100786,8100787,8100788},
	[15] = {8100789,8100790,8100791,8100792,8100793,8100794},
	[16] = {8100795,8100796},
	[17] = {8100797,8100798,8100799,8100800,8100801,8100802,8100803,8100804,8100805,8100806},
	[18] = {8100807,8100808,8100809,8100810,8100811,8100812},
	[19] = {8100813,8100814,8100815,8100816,8100817,8100818},
	[20] = {8100819,8100820},
}; 

local data = {
	{ItemData[1],1500,1},
	{ItemData[2],1000,1},
	{ItemData[3],600,1},
	{ItemData[4],300,1},
	{ItemData[5],1500,1},
	{ItemData[6],1000,1},
	{ItemData[7],600,1},
	{ItemData[8],200,1},
	{ItemData[9],1500,1},
	{ItemData[10],1000,1},
	{ItemData[11],600,1},
	{ItemData[12],200,1},
	{ItemData[13],1500,1},
	{ItemData[14],1000,1},
	{ItemData[15],600,1},
	{ItemData[16],200,1},
	{ItemData[17],1500,1},
	{ItemData[18],1000,1},
	{ItemData[19],600,1},
	{ItemData[20],200,1},
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







 