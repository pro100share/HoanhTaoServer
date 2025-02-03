local dwItemId = 5500641
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)

	if not objItemSys:IsPacketSlotEnoughFor(1) then return 9000110010 end;

	local dwRand = math.random(10000);
	
	--默认的陨石碎片*1
	local Id,Count = 4900010,1;
	
	if (dwRand <= 450) then
		--强化石
		Id,Count = 4100140,1;
	elseif (dwRand <= 2450) then
		--3W银两
		Id,Count = 5929001,1;
	elseif (dwRand <= 3250) then
		--8W银两
		Id,Count = 5929002,1;
	elseif (dwRand <= 3450) then
		--20W银两
		Id,Count = 5929003,2;
	elseif (dwRand <= 4450) then
		--陨石碎片*3
		Id,Count = 4900010,3;
	elseif (dwRand <= 4500) then
		--强化石*3
		Id,Count = 4100140,3;
	end
	

	local addTable = {};

	--[[
	_G.enItemBindType.eNo--未绑定
	_G.enItemBindType.eYes--已绑定
	]]
	--碎片
	local item1 = {}
	--物品ID
	item1.dwItemEnum = Id;
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







 