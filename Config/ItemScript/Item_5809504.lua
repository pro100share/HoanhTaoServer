﻿local dwItemId = 5809504
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
			CTitleSystem:AddTitle(10112)		
			objPlayer:GetSystem('CBuffSystem'):AddBuff(10043);
		end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 