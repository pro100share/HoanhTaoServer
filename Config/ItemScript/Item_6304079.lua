local dwItemId = 6304079    --完美礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{5950030,1,5};     ---完美属性卷轴*5
		{5950030,3,3};     ---完美属性卷轴*3
		{5950030,8,1};     ---完美属性卷轴*1
		{2500010,1,1};     ---冲灵丹*1
		{9405042,5,1};     ---无极仙元丹·真*1
		{4100451,500,1};     ---风云名帖*1
		{4100442,1000,1};     ---九转熊蛇丸*1
		{9405047,2000,2};     ---狂袭丹*2
		{4100440,1500,2};     ---虎骨壮筋散*2
		{4902012,175,1};     ---精炼锤*1
		{4100447,2000,2};     ---烙画图谱*2
		{5940006,807,1};     ---真气丹(1万)*1
		{4100450,1500,2};     ---侠客秘传*2
		{2400130,500,1};     ---五倍经验丹*1
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
		if (id==5950030) then
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







 