local dwItemId = 5809660			--����ID  ����
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--ʹ����Ʒ
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	if objPlayer then
		local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
		if not CTitleSystem then
			return
		end
		CTitleSystem:AddTitle(10138)		---�ϱ�
		objPlayer:GetSystem('CBuffSystem'):AddBuff(10080);			--buffID
		return false
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 