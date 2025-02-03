local dwMapID = 8060;
local MapLogic = {};
local t = {}
----------------------------------------------------------------------------
function MapLogic:UpdateForPlayer(objWar,objPlayer)
	if objWar.isDeling then
		return;
	end
	
	local t = WarAddition.XiangYang 
	objWar:ChangeRoleScore(objPlayer,t.Award)
end;

----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.MapLogic,dwMapID,MapLogic)
----------------------------------------------------------------------------