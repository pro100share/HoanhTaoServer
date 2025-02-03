local dwItemId = 7400005  --多玩
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	if objPlayer then
		local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
		if not CTitleSystem then
			return
		end
		CTitleSystem:AddTitle(10144)
		objPlayer:GetSystem('CBuffSystem'):AddBuff(10086);
	end
	--等级上限
	local Level = RoleUpLevelConfig.dwMaxLevel
	--当前等级
	local Lev = objPlayer:GetLevel();
	
	if (Lev < Level) then
		objPlayer:AddExp(50000)
		return false
	end
	
	if(objPlayer.sRoleInfo.dwExp < _G.RoleUpLevelConfig[Level+1].dwExp) then
		objPlayer:AddExp(50000)
		return false
	end		
	
	return 4001370003;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 