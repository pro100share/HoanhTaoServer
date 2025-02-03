local dwItemId = 6300578    --华山论剑第一名
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{4100502,1500,1};     ---天女散花*1
		{2500340,700,1};     ---勋章经验丹*1
		{2500342,1500,1};     ---索魂丹碎片*1
		{4100430,800,1};     ---檀心丹*1
		{2500331,800,1};     ---斩魄精元丹*1
		{4100507,500,1};     ---灵兽丹*1
		{4100451,500,1};     ---风云名帖*1
		{3900060,500,1};     ---6品宝石精华*1
		{3900070,500,1};     ---7品宝石精华*1
		{3900080,10,1};     ---8品宝石精华*1
		{2500343,300,1};     ---易筋经注*1
		{2500345,400,1};     ---紫微星图*1
		{2500051,500,1};     ---武尊通鉴*1
		{5501190,1000,1};     ---无相元珠*1
		{4100508,480,1};     ---圣兽丹*1
		{9405043,10,1};     ---无极仙元丹·尊*1
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
		if (id==9405043) then
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







 