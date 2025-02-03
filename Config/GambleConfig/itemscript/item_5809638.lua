local dwItemId = 5809638  --血魔功卡
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
	local ChackSys = sysScript:HasAuthority("XueMoGong")	
	if not ChackSys then
		return 13001710001;
	end
	--print( "-------------------66666666666666------------------" )
	local cMegaKillSystem = objPlayer:GetSystem('CMegaKillSystem')
	if not cMegaKillSystem then
		return ;
	end
	--print( "-------------------77777777777777------------------" )
	
	local lv = cMegaKillSystem:GetLevelVal()
	if lv == 7  then 
		cMegaKillSystem:SetLevel(lv+1)
	elseif lv <7 then
		return 13009500107;
	elseif lv >7 and lv <10 then
		return 13009500116;
	elseif lv >=10 then
		return 13009500108;
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )





 