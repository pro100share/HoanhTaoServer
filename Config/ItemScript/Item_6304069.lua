local dwItemId = 6304069    --无字天书(下)礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{4902011,1,20};     ---无字天书·下卷*20
		{4902011,3,10};     ---无字天书·下卷*10
		{4902011,15,8};     ---无字天书·下卷*8
		{4902011,25,6};     ---无字天书·下卷*6
		{4902011,40,3};     ---无字天书·下卷*3
		{4902011,300,1};    ---无字天书·下卷*1
		{9405041,1,1};      ---无极仙元丹·灵*1
		{2500011,300,1};    ---幻灵丹*1
		{5801005,300,1};    ---坐骑赐福丹·尊*1
		{4100422,1500,2};   ---二品金鳞甲片*2
		{4100170,1000,2};   ---悟道残卷*2
		{5920005,2000,1};   ---钱袋(500万)*1
		{3900030,2000,2};   ---3品宝石精华*2
		{9405046,1500,2};   ---固甲丹*2
		{4100440,1015,1};   ---虎骨壮筋散*1
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
		if (id==4902011 and Count~=1 or id==9405041) then
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







 