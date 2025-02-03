local base = _G;

local KickOff

KickOff = function(t)
	local ObjPlayer = nil;
	local res,str = 0,""
	if t.role_id ~= nil and t.role_id ~= "" then
		ObjPlayer = CPlayerManager:GetPlayerByRoleID(tonumber(t.role_id))
	elseif t.role_name ~= nil and t.role_name ~= "" then
		ObjPlayer = CPlayerManager:GetPlayerByRoleName(tostring(t.role_name))
	elseif t.account_id ~= nil and t.account_id ~="" then
		ObjPlayer = CPlayerManager:GetPlayer(tonumber(t.account_id))
	end
	if ObjPlayer ~= nil then
		res = 1
		t.role_id = ObjPlayer:GetRoleID();
		CPlayerManager:KickPlayerDownByAccID(ObjPlayer:GetAccountID())
	else
		str = "No This Player"
		_info('BackStageSystem No This Player');
	end
	if tonumber(t.role_id)==0 then
		res = 1
		str = ""
		for k,ObjPlayer in pairs(CPlayerManager.setAllPlayerByRoleID) do
			CPlayerManager:KickPlayerDownByAccID(ObjPlayer:GetAccountID())
		end
	end
	local Info = {};
	Info.result = res;
	Info.http_id = t.http_id;
	BackstageSystem:SendToAS(BackstageSystem.setMessageID.Command, base.json.encode(Info));
end

BackstageSystem:RegistEvent("kick_off", KickOff);