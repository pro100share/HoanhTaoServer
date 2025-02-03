local dwItemId = 5809565  --麒麟坐骑卡
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
	local ChackSys = sysScript:HasAuthority("Mount")	
	if not ChackSys then
		return 9000210008;
	end
	--print( "-------------------66666666666666------------------" )
	local cmountSystem = objPlayer:GetSystem('CMountSystem')
	if not cmountSystem then
		return ;
	end
	--print( "-------------------77777777777777------------------" )
	
	local Lv = cmountSystem:GetMountGrade()
	if Lv==12 then
		return 7000170003;
	end
	local Chack = cmountSystem:SetMountEnumID(120901)
	if Chack then
		return false;
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )





 