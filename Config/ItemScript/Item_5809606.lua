local dwItemId = 5809606  --实战卡
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
	local ChackSys = sysScript:HasAuthority("Bourn")	
	if not ChackSys then
		return 3000310011;
	end
	--print( "-------------------66666666666666------------------" )
	local cbournSystem = objPlayer:GetSystem('CBournSystem')
	if not cbournSystem then
		return 0;
	end
	--print( "-------------------77777777777777------------------" )
	local Lv = cbournSystem:GetBournLv();
	if Lv == 6 then
		cbournSystem:UpBournLevel(Lv+1)
	elseif Lv <6 then
		return 13009500107;
	elseif Lv >6 and Lv < 9 then 
		return 13009500116;
	elseif Lv >=9 then 
		return 13009500108;
	end
	
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )





 