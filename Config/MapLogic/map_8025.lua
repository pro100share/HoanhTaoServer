local dwMapID = 8025;
local save = 1;
local MapLogic = {};

----------------------------------------------------------------------------
--MapId 地图ID，dwMonsterId 怪物ID，dwFightId 战斗ID，dwAIId AI，dwDropId 掉落
--objScriptSys:AddMonSP(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,dwDelay)
function MapLogic:UpdateForPlayer(objWar,objPlayer)
	if objWar.isDeling then
		return;
	end
	
	local objWarSystem = objPlayer:GetSystem("CWarSystem");
	if not objWarSystem then
		return;
	end

	if not objWar then
		return;
	end
	
	local dwRoleID = objPlayer:GetRoleID()
	local luv = objWar:GetRoleLength(dwRoleID)
	
	local value = objWar:GetRoleCode(dwRoleID)
	--8分钟奖励
	if (1000*60*8 <= luv and value == 0) then
		CMailManager:SendConfigMail( 13009100, dwRoleID)
		objWar:SetRoleCode(dwRoleID,1)
	--20分钟奖励
	elseif (1000*60*20 <= luv and value == 1) then
		CMailManager:SendConfigMail( 13009100, dwRoleID)
		objWar:SetRoleCode(dwRoleID,2)
	end
	
	
	--每分钟奖励
	War_MapAddition:XiShuoTianXia(objWar,objPlayer,objWarSystem)
end;

----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.MapLogic,dwMapID,MapLogic)
----------------------------------------------------------------------------