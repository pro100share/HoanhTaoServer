local dwItemId = 6304074    --孙子孟德
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{8100680,5,1};     ---孙子兵法雕版*1
		{8100640,5,1};     ---孟德新书雕版*1
		{5501190,1,50};     ---无相元珠*50
		{5809368,5,2};     ---星轨*2
		{4100410,5,2};     ---古书注解*2
		{9405051,1000,2};     ---化身金丹*2
		{4100446,2000,2};     ---檀木托*2
		{9405048,2000,2};     ---敏身丹*2
		{5920005,1000,1};     ---钱袋(500万)*1
		{4100210,1500,2};     ---精铁锭*2
		{5809367,1000,5};     ---星灵*5
		{5940006,1479,1};     ---真气丹(1万)*1
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
		if (id==8100680 or id==8100640 or id==5501190) then
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







 