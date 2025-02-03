local base = _G;

local strSqlScriptDir = ChargeSystem.strEventHandlerDir .. "OverCharge/SqlScript/";
local setSqls = {
	over_charge = {
		file = "OverCharge.sql";
		sentence = nil;
	};
};

local LoadSql;
local OverCharge;

-- @brief 加载sql脚本
LoadSql = function ()
    for k, v in pairs(setSqls) do
        v.sentence = base.db.LoadSql(strSqlScriptDir .. v.file);
    end
end

OverCharge = function (tData)
	if not ChargeConfig.DB.db_ip then
		return;
	end

	base.Log:Info("---OverCharge Start---");
	local sql = string.format(setSqls.over_charge.sentence, tostring(tData["order_form"]));
	base.Log:Info(sql);
	base.db.Exec(ChargeConfig.DB.id, 1, sql);
	base.Log:Info("---OverCharge End---");
end

LoadSql();
ChargeSystem:RegistEvent("over_charge", OverCharge);