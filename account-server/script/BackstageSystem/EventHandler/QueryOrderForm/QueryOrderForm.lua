local base = _G;

local load_sql;
local query_order_form;

local sql_script_dir = BackstageSystem.strEventHandlerDir .. "QueryOrderForm/SqlScript/";
local query_cmd = {
    [1] = {
        sql_script = "QueryCache.sql",
        sql = nil,
        format = function (setData)
            if setData == nil or setData[1] == nil then
                return {};
            end
            local setCommand = base.json.decode(setData[1].szCommand);
            return {
                dwOrderID = setData[1].dwOrderID;
                dwServerID = setData[1].dwServerID;
                dwAccountID = base.GetOriginAccountID(setCommand.account_id);
                dwQuantity = setCommand.quantity;
                dwTime = setCommand.time;
                dwType = setCommand.type;
            };
        end
    };
    [2] = {
        sql_script = "QueryInfo.sql",
        sql = nil,
        format = function (setData)
            if setData == nil or setData[1] == nil then
                return {};
            end
            return {
                dwOrderID = setData[1].dwOrderID;
                dwAccountID = setData[1].dwAccountID;
                dwQuantity = setData[1].dwQuantity;
                dwTime = setData[1].dwTime;
                dwType = setData[1].dwType;
            };
        end
    };
};

load_sql = function ()
    for k, v in pairs(query_cmd) do
        v.sql = base.db.LoadSql(sql_script_dir .. v.sql_script);
    end
end

query_order_form = function (tCmd)
    local setOp = query_cmd[tonumber(tCmd.type)];
    return setOp.format(
        base.db.Exec(
            ChargeConfig.DB.id, 1, string.format(
                setOp.sql, tostring(
                    tCmd.order_form
                )
            )
        )
    );
end

load_sql();
BackstageSystem:RegistEvent("query_order_form", query_order_form);
