local dwItemId = 6304518    --特级坐骑礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{2400210,1500,10};     ---坐骑双倍经验丹*10
		{5809522,1500,10};     ---战魂诏令·稀有*10
		{9405010,1500,3};     ---神龙果*3
		{9405011,1500,3};     ---龙池甘露*3
		{9405052,1500,3};     ---坐骑转生丹*3
		{9405040,1000,5};     ---坐骑资质丹*5
		{5809523,500,3};     ---战魂诏令·奇珍*3
		{9405010,250,15};     ---神龙果*15
		{9405011,250,15};     ---龙池甘露*15
		{9405052,250,15};     ---坐骑转生丹*15
		{9405040,150,25};     ---坐骑资质丹*25
		{5802000,60,1};     ---坐骑赐福丹*1
		{5809365,35,1};     ---战魂诏令·传世*1
		{5809567,5,1};     ---坐骑卡*1
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
		if (id==5809567 or id==5809365) then
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







 