local dwItemId = 6300564    --排行榜白银礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{4100140,2000,10};     ---强化石*10
		{9405010,3500,20};     ---神龙果*20
		{4100120,1500,5};     ---升阶玄铁*5
		{4100210,1200,10};     ---精铁锭*10
		{5500030,1100,5};     ---恩仇令*5
		{4100290,500,10};     ---剑气石*10
		{4100430,200,2};     ---檀心丹*2
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
	Scriptsys:AddPackItem(2400110,3,enItemBindType.eYes)
	Scriptsys:AddPackItem(5940003,8,enItemBindType.eYes)
	Scriptsys:AddPackItem(5910003,8,enItemBindType.eYes)	

end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 