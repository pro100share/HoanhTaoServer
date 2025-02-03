local dwItemId = 6304078    --好称号礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{5809399,1,1};     ---神功盖世称号卡*1
		{5809398,5,1};     ---惊世骇俗称号卡*1
		{5809397,12,1};     ---震古铄今称号卡*1
		{5920005,1000,1};     ---钱袋(500万)*1
		{4100451,500,1};     ---风云名帖*1
		{5809367,1000,5};     ---星灵*5
		{9405045,2000,2};     ---聚力丹*2
		{5940006,1500,1};     ---真气丹(1万)*1
		{4902012,190,1};     ---精炼锤*1
		{4902007,1000,1};     ---金锄头*1
		{4100440,1500,2};     ---虎骨壮筋散*2
		{2400130,1292,1};     ---五倍经验丹*1
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
		if (id==5809399 or id==5809398 or id==5809397) then
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







 