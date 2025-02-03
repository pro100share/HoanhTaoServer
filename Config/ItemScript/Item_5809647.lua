local dwItemId = 5809647 --风云腰牌卡
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
	local ChackSys = sysScript:HasAuthority("XiaYiXunZhang")	
	if not ChackSys then
		return 13009200101;
	end
	--print( "-------------------66666666666666------------------" )
	local cErrantHonorSystem = objPlayer:GetSystem('CErrantHonorSystem')
	if not cErrantHonorSystem then
		return 0;
	end
	--print( "-------------------77777777777777------------------" )
	
	local lv = cErrantHonorSystem:GetErrantLevel()
	if lv == 7 then 
		cErrantHonorSystem:SetErrantLevel(lv+1)
	elseif lv < 7 then
		return 13009500107;
	elseif lv > 7 and lv <10 then
		return 13009500116;
	elseif lv >= 10 then 
		return 13009500108;
		
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )





 