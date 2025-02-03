local dwItemId = 2500350
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	local QingYunLingSystem = objPlayer:GetSystem('CQingYunLingSystem');
	local Exp = 10000;
	local nReslut= QingYunLingSystem:OnUseItemGetExp(Exp)
	if nReslut == 1 then
		return 4000110061;	--没有激活勋章
	elseif nReslut == 2 then
		return 4000110062;	--勋章已到最高级
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )






 