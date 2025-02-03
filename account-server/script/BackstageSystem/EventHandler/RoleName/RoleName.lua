local base = _G;

local load_sql;
local role_name;

local eSex = 
{
	[1] = 2;
	[2] = 1;
	[3] = 1;
	[4] = 2;
};

local sql_script_dir = BackstageSystem.strEventHandlerDir .. "RoleName/SqlScript/";
local query_cmd = {
    sql_script = "GetRoleName.sql",
    sql = nil,
	format = function (setData)
		if setData == nil or setData[1] == nil then
			return {};
		end
		local setRet = setData[1];
		setRet.dwLevel = base.RoleUpLevelConfig:ExpToLevel(tonumber(setRet.dwTotalExp)) or 1;
		setRet.dwTotalExp = nil;
		setRet.dwSex = eSex[tonumber(setRet.dwProf)];
		setRet.tmCreateRoleTime = CTimeFormat:MsecToUTC(tonumber(setRet.tmCreateRoleTime));
		return setRet;
	end
};

load_sql = function ()
    query_cmd.sql = base.db.LoadSql(sql_script_dir .. query_cmd.sql_script);
end

role_name = function (tCmd)
    local sql = string.format(query_cmd.sql, tostring(tCmd.account_id));
    local setData = base.db.Exec(tCmd.server_id, 2, sql);
	return query_cmd.format(setData);
end

load_sql();
BackstageSystem:RegistEvent("role_name", role_name);