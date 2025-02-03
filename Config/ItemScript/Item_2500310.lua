local dwItemId = 2500310
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	--等级上限
	local Level = RoleUpLevelConfig.dwMaxLevel
	--当前等级
	local Lev = objPlayer:GetLevel();
	local Exp = RoleUpLevelConfig[Lev+1].dwExp - RoleUpLevelConfig[Lev].dwExp
	Exp = math.ceil(Exp*0.01);
	if Exp==0 then Exp=1 end
	if (Lev < Level) then
		objPlayer:AddExp(Exp)
		return false
	end

	if(objPlayer.sRoleInfo.dwExp < _G.RoleUpLevelConfig[Level+1].dwExp) then
		objPlayer:AddExp(Exp)
		return false
	end
	
	return 4001370003;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )












 