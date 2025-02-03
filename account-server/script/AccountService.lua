local base = _G;
_G.AccountService = {};

AccountService.strWorkDir = "./";
AccountService.strScriptDir = "../script/";

function AccountService:Load()
    dofile(self.strScriptDir .. "Project.lua");
	BackstageSystem:Init();
	ChargeSystem:Init();
	UrlManager:Init();
end

function AccountService:OnReceiveH(dwMType, dwID, strData)
	base.Log:Info("---AccountService:OnReceiveH Start---");
	
	base.Log:Info(dwMType, dwID, strData);
	local setData = base.PraseStrToArray(_UrlUTF8ToAscii(strData));
	if setData.op == "query_cfg" then
		BackstageSystem:OnGetConfigInfo(dwID, setData);
	else
		_RegistWorker("BackstageSystem:Dispose", dwMType, dwID, base.json.encode(setData));
	end
	
	base.Log:Info("---AccountService:OnReceiveH End---");
end

function AccountService:OnAcceptGS(strIP, dwID)
	base.Log:Info("---AccountService:OnAcceptGS Start---");
	base.Log:Info(strIP, dwID);
	base.Log:Info("---AccountService:OnAcceptGS End---");
end

function AccountService:OnCloseGS(strIP, dwID)
	base.Log:Info("---AccountService:OnCloseGS Start---");
	base.Log:Info(strIP, dwID);
	base.Log:Info("---AccountService:OnCloseGS End---");
end

function AccountService:OnReceiveGS(dwMType, dwID, strData)
	base.Log:Info("---AccountService:OnReceiveGS Start---");
	
	base.Log:Info(dwMType, dwID, strData);
	if dwMType == self.setMessageID.ServerInfo then
		BackstageSystem:OnServerInfo(dwID, strData);
	elseif dwMType == self.setMessageID.Command then
		local setData = base.json.decode(strData);
		if setData.op then
			_RegistWorker("BackstageSystem:Dispose", dwMType, setData.http_id, strData);
		else 
			base.Net:SendToHttp(setData.http_id, strData);
		end
	elseif dwMType == self.setMessageID.Charge then
		_RegistWorker("ChargeSystem:Dispose", ChargeSystem.setType.Over, dwID, strData);
	elseif dwMType == self.setMessageID.Url then
		_RegistWorker("UrlManager:Dispose", dwMType, dwID, strData);
	elseif dwMType == self.setMessageID.CDKey then
		_RegistWorker("CDKeyManager:Dispose", dwMType, dwID, strData);
	else
		base.Log:Error("Unknown Type");
	end
	
	base.Log:Info("---AccountService:OnReceiveGS End---");
end

function AccountService:OnReceiveC(dwMType, dwID, strData)
	base.Log:Info("---AccountService:OnReceiveC Start---");
	
	base.Log:Info(dwMType, dwID, strData);
	strData = _UrlUTF8ToAscii(strData);
	_RegistWorker("ChargeSystem:Dispose", ChargeSystem.setType.Charge, dwID, strData);
	
	base.Log:Info("---AccountService:OnReceiveC End---");
end

AccountService:Load();
