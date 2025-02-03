-- 8113005
local dwItemId = 8113010
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

function ItemScriptObj:OnUseItem(objItemSys, objItem)
	if not objItemSys:IsPacketSlotEnoughFor(1) then return 9000110010 end;
	local objPlayer = objItemSys:GetPlayer()
	if not objPlayer then
		return 4000110013;
	end;
	
	local dwRand = math.random(10000);
	local ID = 2400110;
	
	if (dwRand <= 2000) then
		ID = 9405010;	
	elseif (dwRand <= 4000) then
		ID = 4100410;	
	elseif (dwRand <= 6000) then
		ID = 4100210;	
	elseif (dwRand <= 8000) then
		ID = 4100130;	
	elseif (dwRand <= 9000) then
		ID = 3900010;	
	elseif (dwRand <= 9500) then
		ID = 3900020;	
	elseif (dwRand <= 9800) then
		ID = 3900030;	
	elseif (dwRand <= 9900) then
		ID = 3900040;	
	else
		ID = 5940003;	
	end
	

	local addTable = {};
	--[[
	_G.enItemBindType.eNo-- Khong Khoa
	_G.enItemBindType.eYes-- Khoa
	]]
	local item1 = {}
	item1.dwItemEnum = ID; -- Id Vat pham
	item1.dwItemNumber = 1; -- So Luong
	item1.dwBindType = enItemBindType.eYes;
	table.insert(addTable, item1);
	if not objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used,true) then
		return 6000810018;
	end;

	if (dwRand > 8000) then
		local dwMapId,Pos = sysMap.dwCurMapID,sysMap:GetPlayerPos()
		sysScript:PlayPfx(110006,Pos.x,Pos.y,0,bAll)
	end
	objPlayer:AddExp(300000);
	return false;
end

CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )