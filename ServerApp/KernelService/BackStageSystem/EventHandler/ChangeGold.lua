local base = _G;

local ChangeGold

ChangeGold = function(t)
	local ObjPlayer = nil;
	if t.role_id ~= nil and t.role_id ~= "" then
		ObjPlayer = CPlayerManager:GetPlayerByRoleID(tonumber(t.role_id))
	elseif t.role_name ~= nil and t.role_name ~= "" then
		ObjPlayer = CPlayerManager:GetPlayerByRoleName(tostring(t.role_name))
	elseif t.account_id and t.account_id ~= "" then
		ObjPlayer = CPlayerManager:GetPlayer(tonumber(t.account_id))
	end
	if ObjPlayer ~= nil then
		local dwGold = tonumber(t.gold)
		ObjPlayer:ChargeGold( dwGold )
	else
		CAccountDBQuery:SaveGoldToDB(tonumber(t.account_id), tonumber(t.gold));
	end
	local ret = {};
    ret.http_id = t.http_id;
    ret.result = 1;
    BackstageSystem:SendToAS(BackstageSystem.setMessageID.Command, base.json.encode(ret));
end



BackstageSystem:RegistEvent("change_gold", ChangeGold);