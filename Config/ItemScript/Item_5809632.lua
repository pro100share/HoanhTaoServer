local dwItemId = 5809632  --易筋经卡
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
	local ChackSys = sysScript:HasAuthority("YiJinJing")	
	if not ChackSys then
		return 13001710002;
	end
	--print( "-------------------66666666666666------------------" )
	local cKungFuSystem = objPlayer:GetSystem('CKungFuSystem')
	if not cKungFuSystem then
		return ;
	end
	--print( "-------------------77777777777777------------------" )
	
	local lv = cKungFuSystem:GetKungfuLevel(1)
	if lv == 9 then 
		cKungFuSystem:SetLevel(lv+1)
	elseif lv < 9 then
		return 13009500107;
	elseif lv > 9 and lv < 12 then
		return 13009500116;	
	elseif lv >= 12 then
		return 13009500108;	

	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )





 