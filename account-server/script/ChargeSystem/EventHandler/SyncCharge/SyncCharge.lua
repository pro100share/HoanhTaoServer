local base = _G;

local strSqlScriptDir = ChargeSystem.strEventHandlerDir .. "SyncCharge/SqlScript/";
local setSqls = {
	sync_charge = {
		file = "SyncCharge.sql";
		sentence = nil;
	};
};

local sync_cache = nil;

local LoadSql;
local OverCharge;

-- @brief 加载sql脚本
LoadSql = function ()
    for k, v in pairs(setSqls) do
        v.sentence = base.db.LoadSql(strSqlScriptDir .. v.file);
    end
end

SyncCharge = function (server_id)
	base.Log:Info("---SyncCharge Start---");
	if not ChargeConfig.DB.db_ip then
		return;
	end
    local rdata = nil;
    if not sync_cache then
        local sql = string.format(setSqls.sync_charge.sentence, server_id);
		base.Log:Info(sql);
        sync_cache = base.db.Exec(ChargeConfig.DB.id, 1, sql);
    end
    if sync_cache then
        if next(sync_cache) then
            for k, v in pairs(sync_cache) do
                rdata = v.szCommand;
				base.Log:Info(v.szCommand);
                table.remove(sync_cache, k);
                break;
            end
        else
            sync_cache = nil;
        end
    end
	base.Log:Info(rdata);
	base.Log:Info("---SyncCharge End---");
    return rdata;
end

LoadSql();
ChargeSystem:RegistEvent("sync_charge", SyncCharge);
