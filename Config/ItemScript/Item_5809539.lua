local dwItemId = 5809539
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
			CTitleSystem:AddTitle(10127)		
			objPlayer:GetSystem('CBuffSystem'):AddBuff(10058);
		end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )