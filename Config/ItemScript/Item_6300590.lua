local dwItemId = 6300590    --回归礼包(30天)
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,数量
local data = {
		{4100523, 1};	--朱雀聚灵开启卡*1
		{4100522, 1};	--白虎聚灵开启卡*1
		{4100524, 1};	--青龙聚灵开启卡*1
		{2400120, 15};	--三倍*15
		{2400130, 15};	--五倍*15
		{2400140, 15};	--十倍*15
		{5500082, 50};	--斗神令*50
		{4100513, 10};	--不灭金丹*10
		{5809113, 3};	--10倍剑气符*3
		{5809118, 3};	--宝甲10倍熔炼符*3
		{4100525, 15};	--通天塔再次挑战书*15
};

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	if not objItemSys:IsPacketSlotEnoughFor(11) then return 9000110010; end
	--[[
	_G.enItemBindType.eNo--未绑定
	_G.enItemBindType.eYes--已绑定
	]]
	for i = 1, #data do
		objItemSys:GetPlayer():GetSystem("CScriptSystem"):
			AddPackItem(data[i][1],data[i][2],enItemBindType.eYes);
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 