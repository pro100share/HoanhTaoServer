local dwItemId = 2500349
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--ʹ����Ʒ
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	local QingYunLingSystem = objPlayer:GetSystem('CQingYunLingSystem');
	local Exp = 1000;
	local nReslut= QingYunLingSystem:OnUseItemGetExp(Exp)
	if nReslut == 1 then
		return 4000110061;	--û�м���ѫ��
	elseif nReslut == 2 then
		return 4000110062;	--ѫ���ѵ���߼�
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )






 