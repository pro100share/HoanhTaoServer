local base = _G;

local load_sql;
local query_gold;

local sql_script_dir = BackstageSystem.strEventHandlerDir .. "QueryGold/SqlScript/";
local query_cmd = {
    sql_script = "QueryGold.sql",
    sql = nil
};

load_sql = function ()
    query_cmd.sql = base.db.LoadSql(sql_script_dir .. query_cmd.sql_script);
end

query_gold = function (tCmd)
    local sql = string.format(query_cmd.sql, tostring(tCmd.account_id));
    return base.db.Exec(tCmd.server_id, 1, sql);
end

load_sql();
BackstageSystem:RegistEvent("query_gold", query_gold);