local dwItemId = 5809333
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--ʹ����Ʒ
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	local sysSwordFoundry = objPlayer:GetSystem("CSwordFoundrySystem");
	--local Error = sysSwordFoundry:SetSwordFoundryByItem(objItem:GetEnumID()); ----ʹ����Ʒ��������
	local Error = sysSwordFoundry:SetSwordFoundryLevelByItem(objItem:GetEnumID(),1);---ʹ����Ʒ���Ǽ����ڶ��������Ӽ�Ϊ����
	if(Error ~= nil) then
		return 0;
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )