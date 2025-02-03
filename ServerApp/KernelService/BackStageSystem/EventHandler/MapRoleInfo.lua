--查询地图中的角色

local base = _G;

local MapRole = function(t)
	local dwLineID = tonumber(t.line_id);
	local dwMapID = tonumber(t.map_id);
	
	local objLine = CGameLineManager:GetLine(dwLineID);
	if not objLine then
		local ret = {};
		ret.http_id = t.http_id;
		ret.result = 0;
		BackstageSystem:SendToAS(BackstageSystem.setMessageID.Command, base.json.encode(ret));
		return;
	end
	
	objLine.KSBackStageMsg{Param = t};
end;

BackstageSystem:RegistEvent("map_role", MapRole)

