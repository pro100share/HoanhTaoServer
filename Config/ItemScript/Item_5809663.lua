local dwItemId = 5809663			--����ID ����
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
		CTitleSystem:AddTitle(10141)		---�ϱ�
		objPlayer:GetSystem('CBuffSystem'):AddBuff(10083);			--buffID
		return false
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 