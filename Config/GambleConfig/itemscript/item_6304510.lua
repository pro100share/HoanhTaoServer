local dwItemId = 6304510    --江湖礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{4100450,50,5};   --侠客秘传
		{4100450,100,1};   --侠客秘传
		{5805002,250,1};   --江湖威望丹·中
		{6300419,500,1};   --强化石中包
		{2500310,250,1};   --强化经验丹
		{5809335,500,1};   --精血丹·中
		{5809334,1000,1};   --精血丹·小
		{5805001,2350,1};   --江湖威望丹·小
		{5910004,2500,1};   --礼金券(500礼金)
		{6300418,2500,1};   --强化石小包
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
	if not objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used,true) then
		--什么都不返回  标示 删除道具，返回大于0的标示 错误提示
		return 6000810018;
	end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 