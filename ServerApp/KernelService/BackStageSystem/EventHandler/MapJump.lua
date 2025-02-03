local base = _G;

local MapJump

MapJump = function(t)
	local ObjPlayer = nil;
	if t.role_id ~= nil and t.role_id ~= "" then
		ObjPlayer = CPlayerManager:GetPlayerByRoleID(tonumber(t.role_id))
	elseif t.role_name ~= nil and t.role_name ~= "" then
		ObjPlayer = CPlayerManager:GetPlayerByRoleName(tostring(t.role_name))
	end
	if ObjPlayer ~= nil then
		t.role_id = ObjPlayer:GetRoleID();
		t.user_id = dwNetID
		ObjPlayer.objLine.KSBackStageMsg{Param = t}
	else
        local ret = {};
        ret.http_id = t.http_id;
        ret.result = 0;
        BackstageSystem:SendToAS(BackstageSystem.setMessageID.Command, base.json.encode(ret));
	end
end

BackstageSystem:RegistEvent("map_jump", MapJump);
