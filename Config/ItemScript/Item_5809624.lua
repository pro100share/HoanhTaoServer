local dwItemId = 5809624  --修行卡
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	--print( "-------------------111111111111111------------------" )
	--获得Player 系统对象
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return 0;
	end
	--print( "-------------------22222222222222222------------------" )
	--获得sysscript系统对象
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if not sysScript then
		return 0;
	end
	--print( "-------------------33333333333333------------------" )
	--检测名剑系统是否开放
	local ChackSys = sysScript:HasAuthority("XiuXing")	
	if not ChackSys then
		return 9000210044;
	end
	--print( "-------------------66666666666666------------------" )
	--检测修行系统是否开放
	local cpracticeSystem = objPlayer:GetSystem('CPracticeSystem')
	if not cpracticeSystem then
		return ;
	end
	--print( "-------------------77777777777777------------------" )
	local lv =cpracticeSystem:GetPracticeLevel()
	if lv == 9 then
		cpracticeSystem:UpdatePracticeLevel(lv)
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





 