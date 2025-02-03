local dwItemId = 5500671
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

local Equip = {
--镰
[1] = {1104040,1104040};
--刀
[2] = {1102040,1102040};
--剑
[3] = {1101040,1102040};
--枪
[4] = {1103040,1102040};
};

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local ZhiYe =  objItemSys:GetPlayer():GetInfo().dwProf
	local addTable = {};
	
	local dwRand = math.random(#Equip[ZhiYe]);

	local item1 = {};
	item1.dwItemEnum	= Equip[ZhiYe][dwRand];
	item1.dwItemNumber= 1;
	item1.dwBindType = enItemBindType.eYes;
	item1.setProperty = CGlobalItemManager:GetPropertyByQuality(Equip[ZhiYe][dwRand], 3);
	table.insert(addTable, item1);

	--_G.ItemSysOperType.Used 用于记录的 必须填
	if not objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used,true) then
		--什么都不返回  标示 删除道具，返回大于0的标示 错误提示
		return 6000810018;
	end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

