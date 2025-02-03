﻿local dwItemId = 2200030
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	
	local bUse = false;
	local dwError = 0;
	

	--蓝
	if objPlayer:GetSystem('CSkillSystem'):ChangeAttr("dwMP", 220) then
		bUse = true;
		objPlayer:GetSystem('CSkillSystem'):ExecSkillEvent("EventMedicine", 2, 220);
	else
		dwError = 6000610020;
	end;

	

	
	if not bUse then return dwError end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

