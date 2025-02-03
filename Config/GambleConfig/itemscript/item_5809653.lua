local dwItemId = 5809653  --北斗七星卡
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
	local ChackSys = sysScript:HasAuthority("MatrixMethod")	
	if not ChackSys then
		return 13008000003;
	end
	--print( "-------------------66666666666666------------------" )
	local cMatrixMethodSystem = objPlayer:GetSystem('CMatrixMethodSystem')
	if not cMatrixMethodSystem then
		return ;
	end
	--print( "-------------------77777777777777------------------" )
	
	local lv = cMatrixMethodSystem.ResData.dwSuitStarLevel
	if lv == 3 then
		cMatrixMethodSystem:UseItemSuitStarAddLevel(1)
	elseif lv < 3 then 
		return 13009500107;
	elseif lv > 3 and lv < 10 then
		return 13009500116;
	elseif lv >= 10 then 
		return 13009500108;
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )





 