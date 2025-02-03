local dwItemId = 2500011
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	
	local objPlayer = objItemSys:GetPlayer();
	local currentLv = objPlayer:GetLevel();
	local TargeLv = 50;
	local MaxLv = RoleUpLevelConfig.dwMaxLevel
	local Jingyan = 10000000
	if currentLv >= TargeLv then
		if currentLv < MaxLv then
			-- local expget = RoleUpLevelConfig[MaxLv].dwExp - RoleUpLevelConfig[currentLv].dwExp;--9614142397
			-- if expget >= Jingyan then
				objPlayer:AddExp(Jingyan);			
			-- else
				-- objPlayer:AddExp(expget);
			-- end
			return false;
		end
		if(objPlayer.sRoleInfo.dwExp < _G.RoleUpLevelConfig[MaxLv+1].dwExp) then
			objPlayer:AddExp(Jingyan)
			return false
		end		
	else
		local nextLv = currentLv + 1; 
		if nextLv > MaxLv then
			--objItemSys:OnError( 4000110001 );--提示等级已满
			nextLv = MaxLv
		end			
		local expget = RoleUpLevelConfig[nextLv].dwExp - RoleUpLevelConfig[currentLv].dwExp;
		objPlayer:AddExp(expget);
		return false;
	end
	
	return 4001370003;	--提示等级已满
	

	
	
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

	
