﻿local dwItemId = 5809546
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	objPlayer:GetSystem('CBuffSystem'):AddBuff(10065,1);
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )
