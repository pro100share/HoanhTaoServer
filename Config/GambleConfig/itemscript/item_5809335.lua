--精血丹、中
local dwItemId = 5809335
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then 
		return 
	end
	
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Imp = sysScript:HasAuthority("XueMoGong")			
	
	if not Imp then 
		return 13001710001
	end
	
	
	local megaKillSystem = objPlayer:GetSystem('CMegaKillSystem')
	if not megaKillSystem then 
		return 
	end	
	
	local value = megaKillSystem:AddRandomNum(2)
	if not value then
		return 13001710004
	end 
	megaKillSystem:AddSoulNum(200)
	
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

	
