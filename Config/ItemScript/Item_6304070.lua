local dwItemId = 6304070    --修行礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{5806005,1,30};     ---修行领悟丹·尊*30
		{5806005,5,8};     ---修行领悟丹·尊*8
		{5806005,4,6};     ---修行领悟丹·尊*6
		{5806005,10,3};     ---修行领悟丹·尊*3
		{5806005,300,1};     ---修行领悟丹·尊*1
		{4100410,500,5};     ---古书注解*5
		{4100410,1000,2};     ---古书注解*2
		{4100410,2000,1};     ---古书注解*1
		{5920005,2000,1};     ---钱袋(500万)*1
		{2400130,1000,1};     ---五倍经验丹*1
		{4100440,1000,1};     ---虎骨壮筋散*1
		{3900030,980,2};     ---3品宝石精华*2
		{5801005,1200,1};     ---坐骑赐福丹·尊*1
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
		if (id==5806005) then
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







 