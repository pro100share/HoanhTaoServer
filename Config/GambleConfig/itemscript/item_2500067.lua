local dwItemId = 2500067  --宠物血包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return 0;
	end
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if not sysScript then
		return true;
	end
	local Imp = sysScript:HasAuthority("LronCloth")	
	if not Imp then
		return 13009400101;
	end
	local buffSys = objPlayer:GetSystem('CBuffSystem')
	if not buffSys then
		return 0;
	end
	buffSys:AddBuff(200011,1);
	return false;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 