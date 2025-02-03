local dwItemId = 6300563    --排行榜黄金礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{9405011,5,5};     ---龙池甘露*5
		{4100140,1500,5};     ---强化石*5
		{5500081,1700,5};     ---群侠帖*5
		{4100400,395,3};     ---云英之玉*3
		{4100442,1500,2};     ---九转熊蛇丸*2
		{5501190,600,10};     ---无相元珠*10
		{2500040,2500,10};     ---益元丹*10
		{4100448,1800,5};     ---蜂蜡*5
};

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)

	local id,Count = ArticleSustain:probability(data)
	local addTable = {};
	local objPlayer = objItemSys:GetPlayer()
	local Scriptsys = objPlayer:GetSystem("CScriptSystem")
		
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
	Scriptsys:AddPackItem(2400120,3,enItemBindType.eYes)
	Scriptsys:AddPackItem(5940005,3,enItemBindType.eYes)
	Scriptsys:AddPackItem(5910005,1,enItemBindType.eYes)	

end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 