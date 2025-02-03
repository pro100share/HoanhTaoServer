local dwItemId = 6304085    --青云礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{4900107,1,50};     ---青云碎片*50
		{4900107,1,20};     ---青云碎片*20
		{4900107,8,10};     ---青云碎片*10
		{4900107,10,5};     ---青云碎片*5
		{4900107,30,3};     ---青云碎片*3
		{4900107,100,1};     ---青云碎片*1
		{9405042,1,1};     ---无极仙元丹·真*1
		{4100451,800,1};     ---风云名帖*1
		{4902007,1500,1};     ---金锄头*1
		{4100449,1749,1};     ---水玉嵌珠·小*1
		{5920005,1000,1};     ---钱袋(500万)*2
		{4100442,2000,2};     ---九转熊蛇丸*2
		{2400130,2000,1};     ---五倍经验丹*1
		{5940006,800,2};     ---真气丹(1万)*2
};

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)

	local id,Count = ArticleSustain:probability(data)
	local addTable = {};
	
	--[[
	_G.enItemBindType.eNo--未绑定
	_G.enItemBindType.eYes--已绑定
	]]
	--碎片
	local item1 = {}
	--物品ID
	item1.dwItemEnum = id;
	--数量
	item1.dwItemNumber = Count;
	--绑定类型 
	item1.dwBindType = enItemBindType.eYes;
	table.insert(addTable, item1);
	--_G.ItemSysOperType.Used 用于记录的 必须填
	if objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used,true) then
		if id == 4900107 or id == 9405042 then
			local Name = objItemSys:GetPlayer():GetName()
			--道具名称
			local a = OtherBaseData[dwItemId].strName
			--开启后获得的道具ID
			local b = OtherBaseData[id].strName
			--数量和开启道具拼接
			local m = ""..b.."x"..Count
			CScriptManager:ChatNoticeAll(string.format(SysStringConfigInfo[4000110047],Name,a,m),1,true)
		end
	else
		--什么都不返回  标示 删除道具，返回大于0的标示 错误提示
		return 6000810018;
	end;

end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 
