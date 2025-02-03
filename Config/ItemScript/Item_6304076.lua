local dwItemId = 6304076    --吴子本草
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{8100690,5,1};     ---吴子兵法雕版*1
		{8100590,5,1};     ---本草纲目雕版*1
		{5809366,1,1};     ---战魂诏令·神威*1
		{9405042,5,1};     ---无极仙元丹·真*1
		{4100451,500,1};     ---风云名帖*1
		{9405046,1984,2};     ---固甲丹*2
		{9405051,1000,2};     ---化身金丹*2
		{5920005,1000,1};     ---钱袋(500万)*1
		{5940006,1500,1};     ---真气丹(1万)*1
		{4902007,1000,1};     ---金锄头*1
		{4100450,1800,2};     ---侠客秘传*2
		{4100449,1200,2};     ---水玉嵌珠·小*2
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
		if (id==8100690 or id==8100590) then
			local objPlayer = objItemSys:GetPlayer()
			local Name = objPlayer:GetName()
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







 