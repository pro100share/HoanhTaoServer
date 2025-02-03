local dwItemId = 5809272
local ItemScriptObj = {};
local biao = {
			{2500050,1};
			{9405010,1};
			{4100140,3};
			{4100130,1};
			{4100110,1};
			{3900030,1};
			{5500020,1};
			{4100080,2};
			{4100010,3};
			{2500071,2};
			{2500081,2};
		};	
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local addTable = {};
	for loop = 1,#biao do
		local item1 = {};
		--物品ID
		item1.dwItemEnum = biao[loop][1];
		--数量
		item1.dwItemNumber = biao[loop][2];
		--绑定类型 
		item1.dwBindType = enItemBindType.eYes;
		table.insert(addTable, item1);
	end
	--_G.ItemSysOperType.Used 用于记录的 必须填
	if not objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used,true) then
		--什么都不返回  标示 删除道具，返回大于0的标示 错误提示
		return 6000810018;
	end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 