﻿local dwItemId = 5809432
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	objPlayer:GetSystem('CBuffSystem'):AddBuff(8994,1);
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 