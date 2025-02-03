local GetPos

GetPos = function(t)
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
		return true
	else
		_info('BackStageSystem No This Player');
		return false
	end
end

BackstageSystem:RegistEvent("get_pos", GetPos);