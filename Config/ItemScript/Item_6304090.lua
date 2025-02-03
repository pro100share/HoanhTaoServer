local dwItemId = 6304090    --玄宫礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{2500346,1,50};     ---紫薇星图碎片*50
		{2500346,5,30};     ---紫薇星图碎片*30
		{2500346,10,20};     ---紫薇星图碎片*20
		{2500346,80,10};     ---紫薇星图碎片*10
		{2500346,300,3};     ---紫薇星图碎片*3
		{4902012,1,10};     ---精炼槌*10
		{5809368,800,2};     ---星轨*2
		{5930005,1000,2};     ---经验丹(100万)*2
		{4100450,2000,2};     ---侠客秘传*2
		{3900040,1003,1};     ---4品宝石精华*1
		{9701015,1500,2};     ---返神丹*2
		{4100449,1500,2};     ---水玉嵌珠·小*2
		{5920005,1000,1};     ---钱袋(500万)*1
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
		if id == 2500346 or id == 4902012 then
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







 
