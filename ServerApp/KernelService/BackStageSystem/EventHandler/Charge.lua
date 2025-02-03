local base = _G;
local _DEBUG = true;

local check_sql = 
[[
SELECT COUNT(*)
FROM "T_Charge_Info"
WHERE "dwOrderID" = '%s'
]];
local sqls_logger_sentence = 
[[
INSERT INTO "T_Charge_Info"
VALUES('%s','%s','%s','%s','%s')
]];
local sqls_do_charge_sentence = 
[[
UPDATE "T_Account"
SET "dwGlod" = "dwGlod" + %d
WHERE "dwAccountID" = '%s'
]];

local strDeleteOrderFormSql = 
[[
DELETE FROM "T_Charge_Info" 
WHERE "dwOrderID" = '%s'
]]

local strGetBalanceSql = 
[[
SELECT "dwGlod" AS "dwGold"
FROM "T_Account"
WHERE "dwAccountID" = '%s'
]];

local strGetRoleInfoSql = 
[[
SELECT "dwRoleID", "dwTotalExp"
FROM "T_Role_Info"
WHERE "dwAccountID" = '%s'
]];

local Charge;
local OrderExist;
local DoCharge;
local Notice;
local Logging;
local GetBalance;
local GetRoleInfo;
local Reply;

Charge = function (sData)
    if _DEBUG then
        print("\n");
        print("---Charge---");
    end
    
	local tData = base.json.decode(sData);
    if OrderExist(tData) then
		Reply(tData);
	elseif DoCharge(tData) then
        Notice(tData);
        Logging(tData);
        Reply(tData);
    end

    if _DEBUG then
        print("---Charge---");
        print("\n");
    end
end

OrderExist = function (tData)
    if _DEBUG then
        print("\n");
        print("---OrderExist---");
    end

    local sql = string.format(check_sql, tostring(tData["order_form"]));
    if _DEBUG then
        print(sql);
    end
    local res = CAccountDBQuery:Exec(sql);
    if _DEBUG then
        print(res);
        print("---OrderExist---");
        print("\n");
    end
    if res[1].count > 0 then
        return true;
    else
        return false;
    end
end

DoCharge = function (tData)
    if _DEBUG then
        print("\n");
        print("---DoCharge---");
    end
	local log_sql = string.format(sqls_logger_sentence,
        tostring(tData["account_id"]),
        tostring(tData["order_form"]),
        tostring(tData["quantity"]),
        tostring(tData["type"]),
        tostring(tData["time"]));
    if _DEBUG then
        print(log_sql);
    end
	local setRes = CAccountDBQuery:Exec(log_sql);
    if setRes and (tonumber(setRes) > 0) then
        local do_charge_sql = string.format(sqls_do_charge_sentence,
            tonumber(tData["gold"]),
            tostring(tData["account_id"]));
        if _DEBUG then
            print(do_charge_sql);
        end
        setRes = CAccountDBQuery:Exec(do_charge_sql);
		if not setRes or (tonumber(setRes) <= 0) then
			local strSql = string.format(strDeleteOrderFormSql, tostring(tData.order_form));
			if _DEBUG then
				print(strSql);
			end
			local setRes = CAccountDBQuery:Exec(strSql);
			if setRes and (tonumber(setRes) > 0) then
				_info("[CHARGE][ERROR] Delete OrderForm Success");
			else
				_info("[CHARGE][ERROR] Delete OrderForm Fail");
			end
		end
    end
    if _DEBUG then
        print("---DoCharge---");
        print("\n");
    end
	if setRes and (tonumber(setRes) > 0) then
		return true;
	else
		local strErrMsg = string.format("[CHARGE][ERROR] OrderForm(%s), AccountID(%s)", 
			tostring(tData.order_form), 
			tostring(tData.account_id));
		_info(strErrMsg);
		return false;
	end
end

Notice = function (tData)
    if _DEBUG then
        print("\n");
        print("---Notice---");
    end
	CScriptManager:OnGetChargeInfo(tData.order_form,
            tData.account_id,
            tData.gold,
            os.utc(1));
	local player = CAccountDBQuery:GetOnlinePlayer(tData["account_id"]);
	if player then
        if _DEBUG then
            print("player", player);
            print("dwGold", tData.gold);
        end
        player:ChargeGold(tData.gold);
	end
	
    if _DEBUG then
        print("---Notice---");
        print("\n");
    end
end

Logging = function (tData)
    if _DEBUG then
        print("\n");
        print("---Logging---");
    end

	GetBalance(tData);
    GetRoleInfo(tData);
    CLogSystemManager:recharge(tData["account_id"],
        tData["gold"],
        tData["quantity"],
        tonumber(tData["balance"]) + tonumber(tData["gold"]),
        tData["level"],
        tData["order_form"],
		tData["role_id"]);

    if _DEBUG then
        print("---Logging---");
        print("\n");
    end
end

GetBalance = function (setData)
    if _DEBUG then
        print("\n");
        print("-GetBalance-");
    end
	local strSql = string.format(strGetBalanceSql, setData.account_id);
    if _DEBUG then
        print(strSql);
    end
    local setRes = CAccountDBQuery:Exec(strSql);
    if setRes and setRes[1] then
        setData.balance = tonumber(setRes[1].dwGold) - setData.gold;
    else
        setData.balance = 0;
    end
    if _DEBUG then
        print("-GetBalance-");
        print("\n");
    end
end

GetRoleInfo = function (setData)
    if _DEBUG then
        print("\n");
        print("-GetRoleInfo-");
    end
	local strSql = string.format(strGetRoleInfoSql, setData.account_id);
    if _DEBUG then
        print(strSql);
    end
    local setRes = CAccountDBQuery:RoleDBExec(strSql);
    if setRes and setRes[1] then
        setData.role_id = setRes[1].dwRoleID;
        setData.level = RoleUpLevelConfig:
            ExpToLevel(tonumber(setRes[1].dwTotalExp)) or 1;
    else
        setData.role_id = 0;
        setData.level = 0;
    end
    if _DEBUG then
        print("-GetRoleInfo-");
        print("\n");
    end
end

Reply = function (tData)
	BackstageSystem:SendToAS(BackstageSystem.setMessageID.Charge,
		json.encode({ order_form = tData["order_form"] }));
end

BackstageSystem:RegistEvent("charge", Charge);
