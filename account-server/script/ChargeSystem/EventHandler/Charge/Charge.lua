local base = _G;

local strSqlScriptDir = ChargeSystem.strEventHandlerDir .. "Charge/SqlScript/";
local setSqls = {
    order_form_exist = {
        file = "OrderFormExist.sql";
        sentence = nil;
    };
	logger = {
		file = "Logger.sql";
		sentence = nil;
	};
    do_charge = {
        file = "DoCharge.sql";
        sentence = nil;
    };
};

local LoadSql;
local Charge;
local Check;
local OrderFormExist
local Transition;
local SignInvalid;
local GetSecurityCode;
local Exec;

-- @brief 加载sql脚本
LoadSql = function ()
    for k, v in pairs(setSqls) do
        v.sentence = base.db.LoadSql(strSqlScriptDir .. v.file);
    end
end

-- @brief 执行处理
-- @param sData string 命令数据
-- @return string 错误码
Charge = function (tData)
	local nErrorCode = Check(tData);
    if nErrorCode then
        return nErrorCode;
    end

    nErrorCode = Exec(tData);
    if nErrorCode then
        return nErrorCode;
    end
	
    return ChargeSystem.setResult.Success, tData.server_id, tData;
end

-- @brief 检查待处理数据是否有效
-- @param tData table 数据表
-- @return string 错误码
Check = function (tData)
    local errcode;
	local tDataBack = tData;
	if ChargeConfig.IsSecurity then
		errcode = SignInvalid(tData);
		if errcode then
			return errcode;
		end
	end
	--base.Log:Info("order_form 1: "..tData.order_form);
	
	tData.server_id, tData.account = base.GetMergeInfo(tData.server_id, tData.account);
	--tData.order_form = tDataBack.order_form;
	--base.Log:Info("order_form: "..tData.order_form);
	--base.Log:Info("tDataBack: "..tDataBack.order_form);
	
    errcode = OrderFormExist(tData);
    if errcode then
		base.Log:Info("OrderFormExist");
        return errcode;
    end

    errcode, dwGold = Transition(tData);
    if errcode then
		base.Log:Info("Transition");
        return errcode;
    end

	tData.account_id = tData.account;
	tData.account = nil;
    tData.gold = dwGold;
	
    return errcode;
end

-- @brief 订单号是否存在
-- @param tData table 数据表
-- @return string 错误码
OrderFormExist = function (tData)
    sql = string.format(setSqls.order_form_exist.sentence, tostring(tData.order_form));
	base.Log:Info("---OrderFormExist Start---");
	base.Log:Info(tData.order_form);
	base.Log:Info(sql);
	base.Log:Info("---OrderFormExist End---");
    res = base.db.Exec(ChargeConfig.DB.id, 1, sql);
    if res and res[1] and tonumber(res[1].count) == 0  then
        return nil;
    else
        return ChargeSystem.setResult.OrderFormExist;
    end
end

-- @brief 充值数据转换游戏数据
-- @param tData table 数据表
-- @return string 错误码
Transition = function (tData)
    if tData.quantity then
        return nil, base.ChargeConfig.TransitionsG
            [tonumber(tData.type)](tData);
    else
        return ChargeSystem.setResult.GoldAbnormal;
    end
end

-- @brief 验证码是否正确
-- @param tData table 数据表
-- @return string 错误码
SignInvalid = function (tData)
	base.Log:Info("---SignInvalid Start---");
	local expect_data = GetSecurityCode(tData);
	base.Log:Info(expect_data);
    local expect_sign = expect_data:md5();
	local actual_sign = tData.sign;
	base.Log:Info(expect_sign);
	base.Log:Info(actual_sign);
	base.Log:Info("---SignInvalid End---");
    if string.upper(expect_sign) == string.upper(actual_sign) then
        return nil;
    else
        return ChargeSystem.setResult.SignInvalid;
    end
end

-- @brief 获取校验码序列值
-- @setData table 数据表
-- @return string 序列值
GetSecurityCode = function (setData)
    local code_format =
    "op=charge&server_id=%s&account=%s&order_form=%s&" ..
    "quantity=%s&type=%s&time=%s&key=%s";
    local data = string.format(code_format,
        tostring(setData.server_id),
        tostring(setData.account),
        tostring(setData.order_form),
        tostring(setData.quantity),
        tostring(setData.type),
        tostring(setData.time),
        tostring(ChargeConfig.Key));
    return data;
end;

-- @brief 执行充值
-- @param tData table 数据表
Exec = function (tData)
	base.Log:Info("---Exec Start---");
    local log_sql = string.format(setSqls.logger.sentence,
        tostring(tData.account_id),
        tostring(tData.order_form),
        tostring(tData.quantity),
        tostring(tData.type),
        tostring(tData.time));
	base.Log:Info(log_sql);
	local do_charge_sql = string.format(setSqls.do_charge.sentence,
		tostring(tData.order_form),
		tostring(tData.server_id),
		json.encode(tData));
	base.Log:Info(do_charge_sql);
	local errcode = base.db.Exec(ChargeConfig.DB.id, 1, log_sql, do_charge_sql);
	base.Log:Info("---Exec End---");
    if errcode and errcode[1] and tonumber(errcode[1].count) > 0 then
		return nil
	else
		return "15";
    end
end

LoadSql();
ChargeSystem:RegistEvent("charge", Charge);
