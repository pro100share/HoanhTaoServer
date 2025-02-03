local dwItemId = 6300589    --回归礼包(14天)
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,数量
local data = {
		{4100523, 1};	--朱雀聚灵开启卡*1
		{4100522, 1};	--白虎聚灵开启卡*1
		{2400120, 7};	--三倍*7
		{2400130, 7};	--五倍*7
		{2400140, 7};	--十倍*7
		{5500082, 20};	--斗神令*20
		{4100513, 5};	--不灭金丹*5
		{5809113, 1};	--10倍剑气符*1
		{5809118, 1};	--宝甲10倍熔炼符*1
		{4100525, 8};	--通天塔再次挑战书*8
};

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	if not objItemSys:IsPacketSlotEnoughFor(10) then return 9000110010; end
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







 