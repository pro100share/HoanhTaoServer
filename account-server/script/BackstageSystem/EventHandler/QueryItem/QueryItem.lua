local base = _G;

local query_cmd;

local load_sql;
local query_item;
local parse;

local sql_script_dir = BackstageSystem.strEventHandlerDir .. "QueryItem/SqlScript/";
query_cmd = {
    [1] = {
        [1] = {
            sql_script = "QueryAllNormal.sql";
            sql = nil;
        };
        [2] = {
            sql_script = "QueryAllEquip.sql";
            sql = nil;
        };
    };
    [2] = {
        [1] = {
            sql_script = "QueryByHolderNormal.sql";
            sql = nil;
        };
        [2] = {
            sql_script = "QueryByHolderEquip.sql";
            sql = nil;
        };
    };
    [3] = {
        [1] = {
            sql_script = "Soul.sql";
            sql = nil;
            format = function (data)
                if data == nil or next(data) == nil then
                    return;
                end
                local setResult = {};
                for k, v in pairs(data) do
                    table.insert(setResult, {
                        [1] = v.dwSoulID;
                        [2] = v.dwEnumID;
                        [3] = v.dwHolderType;
                        [4] = v.dwPosID;
                        [5] = v.dwExp;
                    });
                end
                return setResult;
            end;
        };
    };
	format = function (data)
        for k, v in pairs(data) do
            v.dwHolder = math.floor(v.dwPosSlot / 10000);
            v.dwSlot = v.dwPosSlot % 10000;
            v.dwPosSlot = nil;
			if v.strPropertyInfo then
				v.setProp = query_cmd.parse(v.strPropertyInfo);
                v.strPropertyInfo = nil;
			end
        end
        return data;
    end;
    parse = function (data)
        local ret = {};

        if not data or data == "" then
            return ret;
        end

        local endidx = 0, key, val;
        for i = 1, 6 do
            _, endidx, key, val =
                string.find(data, "(%d+),(%d+);", endidx);
            if endidx then
                ret[i] = {
                    dwPropertyType = tonumber(key),
                    dwValue = tonumber(val)
                };
            else
                break;
            end
        end

        return ret;
    end;
};

-- @brief 加载sql脚本
load_sql = function ()
    for k, v in pairs(query_cmd) do
        if type(v) ~= "function" then
            for k2, v2 in pairs(v) do
                v2.sql = base.db.LoadSql(sql_script_dir .. v2.sql_script);
            end
        end
    end
end

-- @brief 查询玩家的物品
-- @param tCmd table 命令表
-- @retrun json 查询结果
query_item = function (tCmd)
	base.GetRoleID:Attempt(tCmd);
	if not next(tCmd.role_id) then
		return {};
    else
        tCmd.role_id = tCmd.role_id[1];
	end
	
    local cmd_type = tonumber(tCmd.type);
    if cmd_type <= 10 then
        local cmd;
        local sqls = {};
        if cmd_type == 0 then
            cmd = query_cmd[1];
            for k, v in pairs(cmd) do
                table.insert(sqls,
                    string.format(v.sql, tostring(tCmd.role_id)));
            end
        else
            cmd = query_cmd[2];
            local pos_lft = cmd_type * 10000;
            local pos_rht = pos_lft + 9999;
            for k, v in pairs(cmd) do
                local sql = string.format(v.sql,
                    tostring(tCmd.role_id),
                    pos_lft,
                    pos_rht);
                table.insert(sqls, sql);
            end
        end
        local rets = {};
        for k, v in pairs(sqls) do
            local sql = base.AddFind("dwEnumID", tCmd.enum_id, v);
            sql = base.AddPaging(tCmd.page, tCmd.page_size, sql);
            local ret = base.db.Exec(tCmd.server_id, 2, sql);
            if ret then
                for k, v in pairs(query_cmd.format(ret)) do
                    table.insert(rets, v);
                end
            end
        end
        return rets;
    else
        cmd = query_cmd[3][cmd_type - 10];
        return cmd.format(
            base.db.Exec(
                tCmd.server_id, 2, base.AddPaging(
                    tCmd.page, tCmd.page_size, string.format(
                        cmd.sql, tostring(tCmd.role_id)
                    )
                )
            )
        );
    end
end

load_sql();
BackstageSystem:RegistEvent("query_item", query_item);
