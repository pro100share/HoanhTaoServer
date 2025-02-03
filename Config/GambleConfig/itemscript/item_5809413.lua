﻿local dwItemId = 5809413
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	
		local objPlayer = objItemSys:GetPlayer();
		if objPlayer then
			local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
			if not CTitleSystem then
				return
			end
			CTitleSystem:AddTitle(10091)		
			objPlayer:GetSystem('CBuffSystem'):AddBuff(8975);
		end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 