local dwItemId = 6304077    --更上一层楼
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{4100131,1,10};     ---云母金精*10
		{4100131,8,5};     ---云母金精*5
		{4100131,10,1};     ---云母金精*1
		{4100111,1,10};     ---剑魂玉*10
		{4100111,8,5};     ---剑魂玉*5
		{4100111,10,1};     ---剑魂玉*1
		{9405042,5,1};     ---无极仙元丹·真*1
		{4902013,500,1};     ---钻石锄头*1
		{5940006,1457,1};     ---真气丹(1万)*1
		{9405048,2000,2};     ---敏身丹*2
		{4100442,1500,1};     ---九转熊蛇丸*1
		{5809367,1000,5};     ---星灵*5
		{4100440,1500,2};     ---虎骨壮筋散*2
		{4100447,2000,2};     ---烙画图谱*2
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
		if (id==4100131 or id==4100111) then
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







 