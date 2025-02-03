local base = _G;

local LockPlayer

LockPlayer = function(t)
	local dwRoleID = tonumber(t.role_id)
	local szRoleName = tostring(t.role_name)
	local dwTime = tonumber(t.time) or 0
	local szReason = tostring(t.reason) or "no reason"
	
	local res = 0
	
	if dwRoleID then
		res = 1
		CPlayerManager:LockPlayerDownByRoleID(dwRoleID,dwTime,szReason)
	elseif szRoleName then
		res = 1
		CPlayerManager:LockPlayerDownByRoleName(szRoleName,dwTime,szReason)
	end
	
	local Info = {};
	Info.result = res;
	Info.http_id = t.http_id;
	BackstageSystem:SendToAS(BackstageSystem.setMessageID.Command, base.json.encode(Info));
end

BackstageSystem:RegistEvent("lock_player", LockPlayer);