local dwItemId = 5809596  --白虎卡
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
		return 0 ;
	end
	
	if cmountSystem:GetMountGrade() == 7 then 
		cmountSystem:SetMountEnumID(90801)
		return false;
	end
	return 13009500111	
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )





 