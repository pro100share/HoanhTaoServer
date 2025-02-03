local dwItemId = 5809589
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	if not objPlayer then return end
	
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Imp = sysScript:HasAuthority("Mount")			
	
	if not Imp then 
		return 9000210008		
	end
	
	local Lv = objPlayer:GetSystem("CMountSystem"):GetMountGrade()
	if Lv < 4 then
		return 13002000001
	end
	
	local soulSystem = objPlayer:GetSystem("CSoulSystem");
	if not soulSystem then return end
	if not soulSystem:AddSoul(47) then
		return 700010210001;
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )