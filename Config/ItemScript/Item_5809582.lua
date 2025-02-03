local dwItemId = 5809582
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
	local Imp = sysScript:HasAuthority("XiaYiXunZhang")	
	if not Imp then
		return 13009200101;
	end
	
	--获得CScriptSystem对象
	local cerrantHonorSystem = objPlayer:GetSystem("CErrantHonorSystem")
	if not cerrantHonorSystem then
		return 0;
	end
	cerrantHonorSystem:AddErrantHonorValue(50000)
	
	return false;
	
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 