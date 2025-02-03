local dwItemId = 6304086    --圣兽丹礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{4100508,1,50};     ---圣兽丹*50
		{4100508,1,30};     ---圣兽丹*30
		{4100508,5,10};     ---圣兽丹*10
		{4100508,10,5};     ---圣兽丹*5
		{4100508,100,1};     ---圣兽丹*1
		{5809580,8,1};     ---风云声望丹·小*1
		{4100440,1000,2};     ---虎骨壮筋散*2
		{5940006,800,2};     ---真气丹(1万)*2
		{9405040,1000,1};     ---坐骑资质丹*1
		{5920005,1000,1};     ---钱袋(500万)*1
		{4100449,1500,2};     ---水玉嵌珠·小*2
		{9701015,1500,2};     ---返神丹*2
		{9405045,1500,2};     ---聚力丹*2
		{2400130,1576,1};     ---五倍经验丹*1
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
		if id == 4100508 or id == 5809580 then
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







 
