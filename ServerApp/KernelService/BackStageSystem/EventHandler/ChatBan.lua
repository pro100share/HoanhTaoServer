local base = _G;

local ChatBan

ChatBan = function(t)
	local ObjPlayer = nil;
	local dwRoleID = tonumber(t.role_id)
	local szRoleName = tostring(t.role_name)
	if t.role_id ~= nil and t.role_id ~= "" then
		ObjPlayer = CPlayerManager:GetPlayerByRoleID(dwRoleID)
	elseif t.role_name ~= nil and t.role_name ~= "" then
		ObjPlayer = CPlayerManager:GetPlayerByRoleName(szRoleName)
	end
	
	local objDB = CPlayerDBQuery:GetDBQuery()
	local dwStart = math.floor(_now()/1000)
	local dwLast =  math.floor((tonumber(t.last) or 0)/1000)
	local result = objDB:execute([[update "T_Role_Info" set "dwBanStart"=$1,"dwBanTime"=$2 where "dwRoleID"=$3 or "szRoleName"=$4]],dwStart,dwLast,dwRoleID or 0,szRoleName or "")
	
	if ObjPlayer ~= nil then
		t.role_id = ObjPlayer:GetRoleID();
		t.user_id = dwNetID
		ObjPlayer.objLine.KSBackStageMsg{Param = t}
		return true
	else
		local Info = {}
		Info.result = 1;
		Info.http_id = t.http_id
		BackstageSystem:SendToAS(BackstageSystem.setMessageID.Command, base.json.encode(Info));
		return false
	end
end

BackstageSystem:RegistEvent("chat_ban", ChatBan);

