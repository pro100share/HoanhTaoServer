local dwItemId = 6304073    --黄帝有礼
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{8100620,5,1};     ---黄帝内经雕版*1
		{3900100,1,1};     ---10品宝石精华*1
		{9405042,5,1};     ---无极仙元丹·真*1
		{4100451,500,1};     ---风云名帖*1
		{9405047,2000,2};     ---狂袭丹*2
		{5920005,1000,1};     ---钱袋(500万)*1
		{4100210,1489,2};     ---精铁锭*2
		{5809367,1000,5};     ---星灵*5
		{5940006,1040,1};     ---真气丹(1万)*1
		{4902007,1000,1};     ---金锄头*1
		{4100450,1800,2};     ---侠客秘传*2
		{4902012,160,1};     ---精炼锤*1
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
		if (id==8100620 or id==3900100) then
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







 