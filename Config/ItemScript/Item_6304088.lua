local dwItemId = 6304088    --伐脉礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{2500344,1,50};     ---易筋经注碎片*50
		{2500344,5,30};     ---易筋经注碎片*30
		{2500344,10,20};     ---易筋经注碎片*20
		{2500344,80,10};     ---易筋经注碎片*10
		{2500344,300,3};     ---易筋经注碎片*3
		{2500011,1,1};     ---幻灵丹*1
		{9405051,1000,2};     ---化身金丹*2
		{3900040,1000,1};     ---4品宝石精华*1
		{5940006,800,2};     ---真气丹(1万)*2
		{4100450,2000,2};     ---侠客秘传*2
		{4100449,1500,2};     ---水玉嵌珠·小*2
		{5920005,1000,1};     ---钱袋(500万)*1
		{9405047,1500,2};     ---狂袭丹*2
		{5809368,803,2};     ---星轨*2
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
		if id == 2500344 or id == 2500011 then
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







 
