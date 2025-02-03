local dwItemId = 5809326
local ItemScriptObj = {};
local biao = {	
			{4100410,2};--古书注解×2、
			{9405010,2};--神龙果×2、
			{4100140,3};--强化石×3
			{4100130,2};---升阶玄晶×2、
			{4100110,2};--剑魂石×2、
			{3900030,2};--3品宝石精华×2、
			{5500020,2};--扩展符×2、
			{2500030,2};--闭关要诀×2、
			{4100010,4};--千纸鹤×4、
			{4100080,3};--亮银沙×3
			{4100430,2};--檀心丹×2、
			{9405040,2};--坐骑资质丹×2
			{4100421,2};--一品金鳞甲片×2
			{5940003,2};--真气丹1000×2	
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







 