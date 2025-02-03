local dwItemId = 5809613  --名剑卡
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
	local ChackSys = sysScript:HasAuthority("Sword")	
	if not ChackSys then
		return 9000210037;
	end
	--print( "-------------------66666666666666------------------" )
	--获得名剑对象
	local cswordSystem = objPlayer:GetSystem('CSwordSystem')
	if not cswordSystem then
		return ;
	end
	--print( "-------------------77777777777777------------------" )
	local Level = cswordSystem:GetSwordLadder();
	if Level == 8 then
		cswordSystem:UpdateSwordLadder(Level +1)
	elseif Level < 8 then
		return 13009500107;
	elseif Level > 8 and Level <10 then
		return 13009500116;
	elseif Level >= 10 then
		return 13009500108;
	end 

	
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )





 