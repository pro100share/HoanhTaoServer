local dwItemId = 5500880
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
			CTitleSystem:AddTitle(10031)		--��һ�޶��ƺ�
			objPlayer:GetSystem('CBuffSystem'):AddBuff(8910);
			return false
		end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 