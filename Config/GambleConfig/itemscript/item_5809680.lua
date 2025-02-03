﻿ local dwItemId = 5809680
 local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

function ItemScriptObj:CheckForUse(objItemSys, objItem)
	return 0;
end


--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	local sysAchievement = objPlayer:GetSystem('CAchievementSystem')
	if not sysAchievement:IsHaveAchievement(701201) then 
	sysAchievement:AddAchievement(701201)
	return false;
	elseif sysAchievement:IsHaveAchievement(701201) then
	return 13009300017;
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )