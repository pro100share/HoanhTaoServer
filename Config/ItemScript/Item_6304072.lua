local dwItemId = 6304072    --侠客加成礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{9701002,100,1};     ---杨虎属性加成卡*1
		{9701003,100,1};     ---康兴哥属性加成卡*1
		{9701004,100,1};     ---许竹青属性加成卡*1
		{9701005,100,1};     ---李莫愁属性加成卡*1
		{2500011,10,1};     ---幻灵丹*1
		{9405041,10,1};     ---无极仙元丹·灵*1
		{5920005,1000,1};     ---钱袋(500万)*1
		{9405046,2000,2};     ---固甲丹*2
		{4100449,1640,2};     ---水玉嵌珠·小*2
		{4902012,140,1};     ---精炼锤*1
		{4100450,1800,2};     ---侠客秘传*2
		{4902007,1000,1};     ---金锄头*1
		{5940006,1000,1};     ---真气丹(1万)*1
		{9405050,1000,2};     ---洗髓灌顶丹*2
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
		if (id==9701002 or id==9701003 or id==9701004 or id==9701005 or id==2500011 or id==9405041) then
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







 