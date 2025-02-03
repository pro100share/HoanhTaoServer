local dwItemId = 6304508    --古学大礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{8100460,900,10};   --玉版纸
		{8100470,800,10};   --水纹纸
		{8100480,800,10};   --高丽纸
		{8100490,800,10};   --白鹿纸
		{8100510,900,10};   --趵突泉
		{8100520,800,10};   --中冷泉
		{8100530,800,10};   --惠山泉
		{8100540,800,10};   --虎跑泉
		{8100550,900,10};    --油烟墨
		{8100560,800,10};    --桐烟墨
		{8100570,800,10};    --松烟墨
		{8100580,800,10};    --漆烟墨
		{5809259,100,1};     --古学志·雕版盒
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







 