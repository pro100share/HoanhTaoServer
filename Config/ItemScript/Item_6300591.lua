local dwItemId = 6300591    --登陆大礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{9701019,800,2};     ---欧阳锋令牌碎片*2
		{9701019,500,3};     ---欧阳锋令牌碎片*3
		{2400140,500,1};     ---十倍经验丹*1
		{4900170,200,1};     ---龙纹玉*1
		{4900170,100,2};     ---龙纹玉*2
		{5809366,100,1};     ---战魂诏令·神威*1
		{4900109,300,2};     ---小金砖*2
		{5940008,1000,1};     ---真气丹(10万)*1
		{2400120,1000,1};     ---三倍经验丹*1
		{2500072,1400,3};     ---九花玉露丸·大*3
		{2500072,1000,5};     ---九花玉露丸·大*5
		{5920005,1500,1};     ---钱袋(500万)*1
		{9405041,200,1};     ---无极仙元丹·灵*1
		{9405042,10,1};     ---无极仙元丹·真*1
		{4902008,1390,1};     ---银锄头*1
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
	if objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used, true) then
		if (id==9405042 or id==9405041) then
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







 