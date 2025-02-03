local dwItemId = 6300566    --超值幸运礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{4100111,25,10};     ---剑魂玉
		{4100131,25,10};     ---云母金精
		{9405011,25,10};     ---龙池甘露
		{4900109,10,5};     ---小金砖
		{4900163,5,1};     ---黄金碎片
		{4900170,5,1};     ---龙纹玉
		{9405041,4,1};     ---无极仙元丹·灵
		{9405042,1,1};     ---无极仙元丹·真
		{9405043,0,1};     ---无极仙元丹·尊
};

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)

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
	if not objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used, true) then
		--什么都不返回  标示 删除道具，返回大于0的标示 错误提示
		return 6000810018;
	end;

end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 