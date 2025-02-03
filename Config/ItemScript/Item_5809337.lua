local dwItemId = 5809337
local ItemScriptObj = {};
local biao = {
			{4100410,1};--古书注解×1、
			{9405010,1};--神龙果×1、
			{4100140,2};--强化石×2
			{4100130,1};---升阶玄晶×1、
			{4100110,1};--剑魂石×1、
			{3900030,1};--3品宝石精华×1、
			{5500020,1};--扩展符×1、
			{2500030,1};--闭关要诀×1、
			{4100010,3};--千纸鹤×3、
			{4100080,2};--亮银沙×2
			{4100430,1};--檀心丹×1、
			{9405040,1};--坐骑资质丹×1
			{4100421,1};--一品金鳞甲片×1
			{5940003,1};--真气丹1000×1	
		};	
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)

	if not objItemSys:IsPacketSlotEnoughFor(1) then return 9000110010 end;

	local dwRand = math.random(#biao);
	local addTable = {};
	--[[
	_G.enItemBindType.eNo--未绑定
	_G.enItemBindType.eYes--已绑定
	]]
	--碎片
	local item1 = {}
	--物品ID
	item1.dwItemEnum = biao[dwRand][1];
	--数量
	item1.dwItemNumber = biao[dwRand][2];
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







 