local dwItemId = 5809665  --宝甲卡
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
	local ChackSys = sysScript:HasAuthority("Amulet")	
	if not ChackSys then
		return 9000210011;
	end
	--print( "-------------------66666666666666------------------" )
	local cAmuletSystem = objPlayer:GetSystem('CAmuletSystem')
	if not cAmuletSystem then
		return 0;
	end
	--print( "-------------------77777777777777------------------" )
	local Level = cAmuletSystem:GetLevel()
	local Rank =cAmuletSystem:GetRank()
	if Level == 9 then
		cAmuletSystem:AlterLevelAndRank(10, 37)
	elseif Level < 9 then
		return 13009500107;
	elseif Level >= 10 then
		return 13009500108;			
	end 
	local dwRoleID = objPlayer:GetRoleID()
	local szName = objPlayer:GetName()
	cAmuletSystem:BoradCast(szName,dwRoleID)
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )





 