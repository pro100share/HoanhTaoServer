local dwItemId = 2500010
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--检测物品是否可以使用
function ItemScriptObj:CheckForUse(objItemSys, objItem, scriptSys)
	local objPlayer = objItemSys:GetPlayer();
	local currentLv = objPlayer:GetLevel();
	local maxLv = RoleUpLevelConfig.dwMaxLevel or 60;
	if currentLv >= maxLv then
		objItemSys:OnError( 4000110001 );--提示等级已满
		return false;
	end
	return 0;
end

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	local currentLv = objPlayer:GetLevel();
	local nextLv = currentLv + 1;
	local maxLv = RoleUpLevelConfig.dwMaxLevel or 60;
	if nextLv > maxLv then
		nextLv = maxLv;
	end
	local expget = RoleUpLevelConfig[nextLv].dwExp - RoleUpLevelConfig[currentLv].dwExp;
	objPlayer:AddExp(expget);
	return false;--扣除物品
end


-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 