local dwItemId = 5500680
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

local Equip = {
--抵抗
5113718,5113818,5113918,5113720,5113820,5113920,5113721,5113821,5113921,5113722,5113822,5113922,5113723,5113823,5113923,5113724,5113824,5113924,5113725,
5113825,5113925,5113726,5113826,5113926,5113727,5113827,5113927,5113728,5113828,5113928,
--绝招
5111703,5111803,5111903,5111707,5111807,5111907,5111708,5111808,5111908,5111709,5111809,
5111909,5111717,5111817,5111917,5111716,5111816,5111916,
--内功
5112706,5112806,5112906,5112708,5112808,5112908,5112709,5112809,5112909,5112717,
5112817,5112917,5112711,5112811,5112911,5112716,5112816,5112916,

};

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
--	local ZhiYe =  objItemSys:GetPlayer():GetInfo().dwProf
	if not objItemSys:IsPacketSlotEnoughFor(1) then return 9000110010 end;

	local addTable = {};
	
	local dwRand = math.random(#Equip);

	local item1 = {};
	item1.dwItemEnum	= Equip[dwRand];
	item1.dwItemNumber= 1;
	item1.dwBindType = enItemBindType.eYes;
	--item1.setProperty = CGlobalItemManager:GetPropertyByQuality(Equip[ZhiYe][dwRand], 3);
	table.insert(addTable, item1);
	

	--_G.ItemSysOperType.Used 用于记录的 必须填
	if not objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used,true) then
		--什么都不返回  标示 删除道具，返回大于0的标示 错误提示
		return 6000810018;
	end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

