local dwMapID = 8008;
local MapLogic = {};
----------------------------------------------------------------------------
--战场每分钟回调
function MapLogic:UpdateForPlayer(objWar,objPlayer)
	if objWar.isDeling then
		return;
	end
	
	War_MapAddition:GuildMinute(objWar,objPlayer)
end;

----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.MapLogic,dwMapID,MapLogic)
----------------------------------------------------------------------------