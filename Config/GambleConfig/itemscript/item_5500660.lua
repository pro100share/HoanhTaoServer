local dwItemId = 5500660
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

local Equip = {
--镰
[1] = {1104030,1204030,1214030,1224030,1234030,1450030,1254030,1400030,1410030,1420030,1430030,1440030};
--刀
[2] = {1102030,1202030,1212030,1222030,1232030,1450030,1252030,1400030,1410030,1420030,1430030,1440030};
--剑
[3] = {1101030,1201030,1211030,1221030,1231030,1450030,1251030,1400030,1410030,1420030,1430030,1440030};
--枪
[4] = {1103030,1203030,1213030,1223030,1233030,1450030,1253030,1400030,1410030,1420030,1430030,1440030};
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







 