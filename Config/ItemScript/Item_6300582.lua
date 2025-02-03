local dwItemId = 6300582    --华山论剑二十强礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{4100502,1000,1};     ---天女散花*1
		{4100010,500,1};     ---千纸鹤*1
		{5940006,1200,1};     ---真气丹(1W)*1
		{4100453,500,1};     ---淬炎晶*1
		{2500342,500,1};     ---索魂丹碎片*1
		{9405010,1000,1};     ---神龙果*1
		{4100110,800,1};     ---剑魂石*1
		{4100501,500,1};     ---千机铁*1
		{4100410,300,1};     ---古书注解*1
		{4100430,800,1};     ---檀心丹*1
		{2500331,500,1};     ---斩魄精元丹*1
		{2500050,500,1};     ---武尊残章*1
		{4100120,300,1};     ---升阶玄铁*1
		{4100507,200,1};     ---灵兽丹*1
		{3900030,200,1};     ---3品宝石精华*1
		{3900040,200,1};     ---4品宝石精华*1
		{2500344,500,1};     ---易筋经注碎片*1
		{2500346,500,1};     ---紫微星图碎片*1
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
	if objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used, true) then
		if (id==4100507) then
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







 