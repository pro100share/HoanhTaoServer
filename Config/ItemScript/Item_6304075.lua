local dwItemId = 6304075    --大师在这里
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{9701006,100,1};     ---周伯通属性加成卡*1
		{9701007,100,1};     ---黄药师属性加成卡*1
		{9701008,100,1};     ---洪七公属性加成卡*1
		{9405042,5,1};     ---无极仙元丹·真*1
		{5809368,5,2};       ---星轨*2
		{9405050,1000,2};     ---洗髓灌顶丹*2
		{5920005,1000,1};     ---钱袋(500万)*1
		{9405045,1900,2};     ---聚力丹*2
		{4100448,1000,2};     ---蜂蜡*2
		{4100442,1000,1};     ---九转熊蛇丸*1
		{9405051,1000,2};     ---化身金丹*2
		{4902012,175,1};     ---精炼锤*1
		{4100450,1800,2};     ---侠客秘传*2
		{5940006,815,1};     ---真气丹(1万)*1
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
		if (id==9701006 or id==9701007 or id==9701008 or id==9405042) then
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







 