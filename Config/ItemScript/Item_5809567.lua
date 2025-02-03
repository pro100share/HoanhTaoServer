local dwItemId = 5809567  --坐骑卡
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	print( "-------------------111111111111111------------------" )
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return 0;
	end
	print( "-------------------22222222222222222------------------" )
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if not sysScript then
		return 0;
	end
	print( "-------------------33333333333333------------------" )
	local ChackSys = sysScript:HasAuthority("Mount")	
	if not ChackSys then
		return 9000210008;
	end
	print( "-------------------66666666666666------------------" )
	local cmountSystem = objPlayer:GetSystem('CMountSystem')
	if not cmountSystem then
		return;
	end
	print( "-------------------77777777777777------------------" )
	
	local lv = cmountSystem:GetMountGrade()		--获得当前坐骑的等级
	---print( "Lv=============================",Lv )
	if lv == 6 then 
		cmountSystem:SetMountEnumID(90701)
	elseif lv == 7 then 
		cmountSystem:SetMountEnumID(90801)
	elseif lv == 8 then 
		cmountSystem:SetMountEnumID(90901)
	elseif lv == 9 then 
		cmountSystem:SetMountEnumID(100901)
	elseif lv == 10 then 
		cmountSystem:SetMountEnumID(110901)
	elseif lv == 11 then 
		cmountSystem:SetMountEnumID(120901)	
	elseif lv >= 12 then 
		return 13009500108;
	elseif lv < 6 then 
		return 13009500107
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )





 