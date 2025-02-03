local dwItemId = 6304089    --淬炎礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{4100453,1,50};     ---淬炎晶*50
		{4100453,5,30};     ---淬炎晶*30
		{4100453,10,20};     ---淬炎晶*20
		{4100453,80,10};     ---淬炎晶*10
		{4100453,300,5};     ---淬炎晶*5
		{4100500,5,2};     ---圣火令*2
		{4100500,50,1};     ---圣火令*1
		{3900040,948,1};     ---4品宝石精华*1
		{9405051,1000,2};     ---化身金丹*2
		{4100440,1100,2};     ---虎骨壮筋散*2
		{9405046,1500,2};     ---固甲丹*2
		{5920005,1000,1};     ---钱袋(500万)*1
		{4902007,1200,1};     ---金锄头*1
		{2400130,2000,1};     ---五倍经验丹*1
		{5940006,801,2};     ---真气丹(1万)*2
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
		if id == 4100453 or id == 4100500 then
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







 
