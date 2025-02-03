local dwItemId = 5500690
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

local Equip = {
--镰
[1] = {1104040,1204040,1214040,1224040,1234040,1450040,1254040,1400040,1410040,1420040,1430040,1440040};
--刀
[2] = {1102040,1202040,1212040,1222040,1232040,1450040,1252040,1400040,1410040,1420040,1430040,1440040};
--剑
[3] = {1101040,1201040,1211040,1221040,1231040,1450040,1251040,1400040,1410040,1420040,1430040,1440040};
--枪
[4] = {1103040,1203040,1213040,1223040,1233040,1450040,1253040,1400040,1410040,1420040,1430040,1440040};
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
	item1.dwStrongLevel = 10;
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

