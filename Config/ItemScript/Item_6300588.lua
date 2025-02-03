local dwItemId = 6300588    --回归礼包(7天)
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,数量
local data = {
		{4100523, 1};	--朱雀聚灵开启卡*1
		{2400120, 3};	--三倍*3
		{2400130, 3};	--五倍*3
		{2400140, 3};	--十倍*3
		{5500082, 10};	--斗神令*10
		{4100513, 3};	--不灭金丹*3
		{5809112, 1};	--5倍剑气符*1
		{5809117, 1};	--宝甲5倍熔炼符*1
		{4100525, 3};	--通天塔再次挑战书*3
};

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	if not objItemSys:IsPacketSlotEnoughFor(9) then return 9000110010; end
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







 