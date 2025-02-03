local dwItemId = 5809585
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)

	--获得Player对象
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return 0;
	end
	--获得CScriptSystem对象
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if not sysScript then
		return 0;
	end
	--检测LronCloth系统权限
	local Imp = sysScript:HasAuthority("Collect")	
	if not Imp then
		return 13001510005;
	end
	
	--获得CYouWuZhiSystem对象
	local cyouWuZhiSystem = objPlayer:GetSystem("CYouWuZhiSystem")
	if not cyouWuZhiSystem then
		return 0;
	end
	
	if cyouWuZhiSystem:_checkCompleted(2) then
		return 13001510007;
	end
	
	cyouWuZhiSystem:CompletePicture(2)
	
	return false;
	
	
	
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 