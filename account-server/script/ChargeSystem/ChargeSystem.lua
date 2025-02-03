local base = _G;
_G.ChargeSystem = {};

ChargeSystem.strEventHandlerDir = AccountService.strScriptDir .. "ChargeSystem/EventHandler/";
ChargeSystem.setType = {
	Charge = 1;
	Over = 2;
};
ChargeSystem.setResult = {
	Success = 1;
	ServerNotExist = 10;
	AccountNotExist = 11;
	OrderFormExist = 12;
	GoldAbnormal = 13;
	SignInvalid = 14;
};

local setHandler = {};

local strGNSCSI = 
[[
SELECT DISTINCT("dwServerID")
FROM "T_Cache"
]];

function ChargeSystem:FireEvent(id, ...)
	base.Log:Info("---ChargeSystem:FireEvent Start---");
    if setHandler[id] then
        return setHandler[id](...);
    else
		base.Log:Info("No Have Command");
    end
	base.Log:Info("---ChargeSystem:FireEvent End---");
end

function ChargeSystem:RegistEvent(id, fun)
	base.Log:Info("---ChargeSystem:RegistEvent Start---");
	if setHandler[id] then
		base.Log:Info("Command Repeat", id);
	else
		setHandler[id] = fun;
	end
	base.Log:Info("---ChargeSystem:RegistEvent End---");
end

function ChargeSystem:Init()
	if ChargeConfig.DB.db_ip == nil then
		return;
	end
	
	base.db.Connect(ChargeConfig.DB.id,
			ChargeConfig.DB.db_ip,
            ChargeConfig.DB.db_name,
            ChargeConfig.DB.db_user,
            ChargeConfig.DB.db_passwd,
			1);
	
    if ChargeConfig.SyncPeriod ~= nil and ChargeConfig.SyncPeriod ~= 0 then
        local dwPeriod = ChargeConfig.SyncPeriod;
        local dwSurplus = dwPeriod;
        base.Task:RegistJob(
            1, 
            base.Task.setType.Interval, 
            "ChargeSystem:SyncAllCharge", 
            dwPeriod, 
            dwSurplus);
    end
end

function ChargeSystem:Destroy()
    if ChargeConfig.DB.db_ip == nil then
        return;
    end

    if ChargeConfig.SyncPeriod ~= nil and ChargeConfig.SyncPeriod ~= 0 then
        base.Task.UnRegistJob(1);
    end
	
	base.db.Close(ChargeConfig.DB.id);
end

function ChargeSystem:Dispose(dwMType, dwID, strData)
	base.Log:Info("---ChargeSystem:Dispose Start---");
	
	if dwMType == ChargeSystem.setType.Charge then
		ChargeSystem:Charge(dwID, strData);
	elseif dwMType == ChargeSystem.setType.Over then
		ChargeSystem:OverCharge(strData)
	end
	
	base.Log:Info("---ChargeSystem:Dispose Start---");
end

function ChargeSystem:Charge(dwHttpID, strData)
	if not ChargeConfig.DB.db_ip then
		return;
	end
	base.Log:Info("---ChargeSystem:Charge Start---");
	base.Log:Info(strData);
	
    local setData = base.PraseStrToArray(strData);

    local dwType, dwServerID, setRData;
    dwType, dwServerID, setRData = ChargeSystem:FireEvent(setData.op, setData);

    local strResult = tostring(dwType);
    base.Net:SendToCharge(dwHttpID, strResult);
    
    if dwType == self.setResult.Success then
        local strRData = json.encode(setRData);
        base.Net:SendToGS(dwServerID,
            AccountService.setMessageID.Charge,
            strRData);
    end
	base.Log:Info("---ChargeSystem:Charge End---");
end

function ChargeSystem:OverCharge(strData)
	if not ChargeConfig.DB.db_ip then
		return;
	end
	base.Log:Info("---ChargeSystem:OverCharge Start---");
	base.Log:Info(strData);
    local setData = base.json.decode(strData);
    ChargeSystem:FireEvent("over_charge", setData);
	base.Log:Info("---ChargeSystem:OverCharge End---");
end

function ChargeSystem:SyncCharge(dwServerID)
	if not ChargeConfig.DB.db_ip then
		return;
	end
	base.Log:Info("---ChargeSystem:SyncCharge Start---");
	local strRData = ChargeSystem:FireEvent("sync_charge", dwServerID);
    while strRData do
		local setData = json.decode(strRData);
		base.Net:SendToGS(setData.server_id, 
			AccountService.setMessageID.Charge, 
			strRData);
		strRData = ChargeSystem:FireEvent("sync_charge", dwServerID);
    end
	base.Log:Info("---ChargeSystem:SyncCharge End---");
end

function ChargeSystem:SyncAllCharge()
    base.Log:Info("---ChargeSystem:SyncAllCharge---");
    local setData = base.db.Exec(ChargeConfig.DB.id, 1, strGNSCSI);
    if setData ~= nil then
        for k, v in pairs(setData) do
            self:SyncCharge(v.dwServerID);
        end
    end
    base.Log:Info("---ChargeSystem:SyncAllCharge---");
end
