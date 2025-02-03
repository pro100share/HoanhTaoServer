﻿local dwItemId = 5809119
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	local objBuffSys  = objPlayer:GetSystem('CBuffSystem')
	
	local buff = objBuffSys:GetBuffObj(73009);
	local level = nil;
	if buff then
		level = buff.m_Level;
	else
		objBuffSys:AddBuff(73009,1);
		return false;
	end 

	if (level < 1) then
		objBuffSys:AddBuff(73009,1);
		return false;
	end
	
	return 4000110036;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 