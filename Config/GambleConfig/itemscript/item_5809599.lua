local dwItemId = 5809599  --炎龙卡
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
		return 0;
	end
	local ChackSys = sysScript:HasAuthority("Mount")	
	if not ChackSys then
		return 13009500107;
	end
	local cmountSystem = objPlayer:GetSystem('CMountSystem')
	if not cmountSystem then
		return;
	end
	
	if cmountSystem:GetMountGrade() == 10 then 
		cmountSystem:SetMountEnumID(110901)
		return false;
	end
	return 13009500114
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )





 