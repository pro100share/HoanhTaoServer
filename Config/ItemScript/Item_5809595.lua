local dwItemId = 5809595  --噬鳄龟卡
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
	
	if cmountSystem:GetMountGrade() == 6 then 
		cmountSystem:SetMountEnumID(90701)
		return false;
	end
	return 13009500110
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )





 