local dwItemId = 2100060
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	
	local bUse = false;
	local dwError = 0;
	
	--血
	if objPlayer:GetSystem('CSkillSystem'):ChangeAttr("dwHP", 2200) then
		bUse = true;
		objPlayer:GetSystem('CSkillSystem'):ExecSkillEvent("EventMedicine", 1, 2200);
	else
		dwError = 6000610019;
	end;

	

	
	if not bUse then return dwError end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

	

 