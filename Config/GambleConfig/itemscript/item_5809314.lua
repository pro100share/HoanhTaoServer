local dwItemId = 5809314
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
	--需要公告的
	{5500040,50,1};
	{4100140,1,100};
	{4100140,1,50};
	{4100140,1,30};
	{4100140,1,10};
	{4100140,10,2};
	--不需要公告的
	{4100140,300,1};
	{9405010,200,1};
	{2400010,1500,1};
	{2400030,1500,1};
	{5500080,500,1};
	{2400110,2000,2};
	{5500010,3936,4};
	
};

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)

	if not objItemSys:IsPacketSlotEnoughFor(1) then return 9000110010 end;

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
		if (id==5500040) or (id==4100140 and Count~=1) then
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







 