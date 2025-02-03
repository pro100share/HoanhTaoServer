local dwItemId = 5500650
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)

	if not objItemSys:IsPacketSlotEnoughFor(1) then return 9000110010 end;

	local dwRand = math.random(10000);
	
	local ID = 5112006;
	
	if (dwRand <= 2500) then
		ID = 5112008;
	elseif (dwRand <= 5000) then
		ID = 5112009;
	elseif (dwRand <= 7500) then
		ID = 5112016;
	end
	

	local addTable = {};
	--[[
	_G.enItemBindType.eNo--未绑定
	_G.enItemBindType.eYes--已绑定
	]]
	local item1 = {}
	--物品ID
	item1.dwItemEnum = ID;
	--数量
	item1.dwItemNumber = 1;
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







 