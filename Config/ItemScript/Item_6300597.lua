local dwItemId = 6300597	--腰带礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

local Equip = {
--镰
[1] = 2234010;
--刀
[2] = 2232010;
--剑
[3] = 2231010;
--枪
[4] = 2233010;
};

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local ZhiYe =  objItemSys:GetPlayer():GetInfo().dwProf
	local addTable = {};

	local item1 = {};
	item1.dwItemEnum	= Equip[ZhiYe];
	item1.dwItemNumber= 1;
	item1.dwBindType = enItemBindType.eYes;
	item1.setProperty = CGlobalItemManager:GetPropertyByQuality(Equip[ZhiYe], 3);
	table.insert(addTable, item1);

	--_G.ItemSysOperType.Used 用于记录的 必须填
	if not objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used,true) then
		--什么都不返回  标示 删除道具，返回大于0的标示 错误提示
		return 6000810018;
	end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

