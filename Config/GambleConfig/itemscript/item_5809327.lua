local dwItemId = 5809327
local ItemScriptObj = {};
local biao = {
			{4100410,3};--古书注解×1、
			{9405010,3};--神龙果×1、
			{4100140,4};--强化石×2
			{4100130,3};---升阶玄晶×1、
			{4100110,3};--剑魂石×1、
			{3900030,3};--3品宝石精华×1、
			{5500020,3};--扩展符×1、
			{2500030,3};--闭关要诀×1、
			{4100010,5};--千纸鹤×3、
			{4100080,4};--亮银沙×2
			{4100430,3};--檀心丹×1、
			{9405040,3};--坐骑资质丹×1
			{4100421,3};--一品金鳞甲片×1
			{5940003,3};--真气丹1000×1	
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







 