local base = _G;

local DelItem

local DelItemOffLine = function(roleid, instid)
	CPlayerDBQuery:GetDBQuery():execute('delete "T_Role_Item_Equip" where "dwItemID"=$1 and "dwRoleID"=$2', instid, roleid);
	CPlayerDBQuery:GetDBQuery():execute('delete "T_Role_Item_Normal" where "dwItemID"=$1 and "dwRoleID"=$2', instid, roleid);
end;

DelItem = function(t)
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
		if t.role_id then
			DelItemOffLine(tonumber(t.role_id),tonumber(t.inst_id));
			ret.result = 1;
		else
			ret.result = 0;
		end
        ret.http_id = t.http_id;
        BackstageSystem:SendToAS(BackstageSystem.setMessageID.Command, base.json.encode(ret));
	end
end

BackstageSystem:RegistEvent("del_item", DelItem);