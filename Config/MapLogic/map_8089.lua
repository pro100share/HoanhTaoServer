﻿local dwMapID = 8089;
local MapLogic = {};
local t = {}
----------------------------------------------------------------------------
function MapLogic:UpdateForPlayer(objWar,objPlayer)
	if objWar.isDeling then
		return;
	end

end;

--进入
function MapLogic:EventPlayerEnter(map,objPlayer)
	local objScriptSys = objPlayer:GetSystem("CScriptSystem");
	if not objScriptSys then
		return;
	end
	objScriptSys:Notice(13009100002,7);
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.MapLogic,dwMapID,MapLogic)
----------------------------------------------------------------------------