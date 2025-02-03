local dwItemId = 6304087    --灵兽丹礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{4100507,1,50};     ---灵兽丹*50
		{4100507,1,30};     ---灵兽丹*30
		{4100507,10,10};     ---灵兽丹*10
		{4100507,80,5};     ---灵兽丹*5
		{4100507,300,1};     ---灵兽丹*1
		{9405048,1500,2};     ---敏身丹*2
		{5940006,800,2};     ---真气丹(1万)*2
		{4100440,1000,2};     ---虎骨壮筋散*2
		{9405040,800,1};     ---坐骑资质丹*1
		{5920005,1000,1};     ---钱袋(500万)*1
		{4902007,1500,1};     ---金锄头*1
		{4100448,1008,2};     ---蜂蜡*2
		{2400130,2000,1};     ---五倍经验丹*1
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
		if id == 4100507 then
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







 
