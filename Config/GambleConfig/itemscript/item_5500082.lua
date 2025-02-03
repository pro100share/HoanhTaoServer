local dwItemId = 5500082  --斗神令
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	--print( "-------------------111111111111111------------------" )
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return 0;
	end
	--print( "-------------------22222222222222222------------------" )
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if not sysScript then
		return 0;
	end
	--print( "-------------------33333333333333------------------" )
	local ChackSys = sysScript:HasAuthority("QunXia")	
	if not ChackSys then
		return 13009100104;
	end
	--print( "-------------------66666666666666------------------" )
	local challengeQunXiaSystem = objPlayer:GetSystem('CChallengeQunXiaSystem')
	if not challengeQunXiaSystem then
		return 0;
	end
	--print( "-------------------77777777777777------------------" )
	if challengeQunXiaSystem:UseItem(5500082) then
		return false;
	end
	return 0;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 