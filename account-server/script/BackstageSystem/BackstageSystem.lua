local base = _G;
base.BackstageSystem = {};

local setHandler = {};
BackstageSystem.strEventHandlerDir = AccountService.strScriptDir .. "BackstageSystem/EventHandler/";
BackstageSystem.QueryCFGSend = true;

-- 命令列表
-- key:命令名，value:处理类型1-后台2-游戏服
BackstageSystem.CmdList = {
    query_item 			= 1;
    game_data 			= 1;
    role_list 			= 1;
    query_cfg 			= 1;
    send_notice 		= 2;
    send_mail 			= 2;
    kick_off 			= 2;
    chat_ban 			= 2;
    map_jump 			= 2;
    add_exp 			= 2;
    del_item 			= 2;
    lock_player 		= 2;
    onlinenum 			= 2;
    get_pos 			= 2;
    role_name			= 1;
    query_gold			= 1;
    query_order_form 	= 1;
    get_prop			= 2;
	change_mall			= 2;
    reload              = 2;
};

local RegistGS;

function BackstageSystem:FireEvent(id, ...)
    if setHandler[id] then
        return setHandler[id](...);
	else
		base.Log:Error("ID No Exist");
		base.Log:Error(id);
		base.Log:Error(debug.traceback());
    end
end

function BackstageSystem:RegistEvent(id, fun)
	if setHandler[id] then
		base.Log:Error("ID Registed");
		base.Log:Error(id);
		base.Log:Error(debug.traceback());
	else
		setHandler[id] = fun;
	end
end

function BackstageSystem:Init()
end

function BackstageSystem:Destroy()
end

function BackstageSystem:OnServerInfo(dwID, strData)
	base.Log:Info("---OnServerInfo Start---");
	
    local dwServerID = RegistGS(strData);
	base.Log:Info(dwServerID);
    _RegistGS(dwID, dwServerID);
    ChargeSystem:SyncCharge(dwServerID);
	
	base.Log:Info("---OnServerInfo End---");
end

function BackstageSystem:OnGetConfigInfo(dwHttpID, setData)
	base.Log:Info("---OnGetConfigInfo Start---");
	
	if setData.force and (tonumber(setData.force) == 1) then
		BackstageSystem.QueryCFGSend = true;
	end
	
	if BackstageSystem.QueryCFGSend then
        local setConfig = ConfigSystem:Get();
		base.Net:SendToHttp(dwHttpID, base.json.encode(setConfig));
		BackstageSystem.QueryCFGSend = false;
	else
		base.Net:SendToHttp(dwHttpID, "");
	end
	
	base.Log:Info("---OnGetConfigInfo End---");
end

function BackstageSystem:Dispose(dwMType, dwID, strData)
	base.Log:Info("---BackstageSystem:Dispose Start---");
	
	local setData = json.decode(strData);
	BackstageSystem:DoCommand(dwID, setData);
	
	base.Log:Info("---BackstageSystem:Dispose Start---");
end

function BackstageSystem:DoCommand(dwHttpID, tCmd)
	base.Log:Info("---DoCommand Start---");

	tCmd.server_id, tCmd.account_id = base.GetMergeInfo(tCmd.server_id, tCmd.account_id);
	
	local dwType, strCmdName;
	dwType, strCmdName = self:GetCmdName(tCmd);
	if dwType == 1 then
		local setData = BackstageSystem:FireEvent(strCmdName, tCmd);
		local strData = base.json.encode(setData);
		base.Net:SendToHttp(dwHttpID, strData);
	elseif dwType == 2 then
		local dwServerID = tCmd.server_id;
		tCmd.http_id = dwHttpID;
		local strData = base.json.encode(tCmd);
		if type(dwServerID) == "table" then
            local dwSendNumber = 0;
			for k, v in pairs(dwServerID) do
				if _IsExistGS(v) == 0 then
					base.Error:Send(dwHttpID, 2, v);
				else
                    dwSendNumber = dwSendNumber + 1;
					base.Net:SendToGS(v,
                        AccountService.setMessageID.Command,
                        strData);
                    if dwSendNumber > 10 then
                        _Sleep(1000);
                        dwSendNumber = 0;
                    end
				end
			end
		else
            if tonumber(dwServerID) ~= -1 and _IsExistGS(dwServerID) == 0 then
                base.Error:Send(dwHttpID, 2, dwServerID);
            else
                base.Net:SendToGS(dwServerID,
                    AccountService.setMessageID.Command,
                    strData);
            end
		end
	else
		base.Error:Send(dwHttpID, 1);
    end

	base.Log:Info("---DoCommand End---");
end

function BackstageSystem:GetCmdName(setData)
    if self.CmdList[setData.op] then
        if setData.line_id ~= nil then
                setData._op = setData.op;
                setData.op = "map_role";
                return 2;
        end
        
        return self.CmdList[setData.op], setData.op;
    else
        return 0;
    end
end

RegistGS = function (sData)
	local tData = base.json.decode(sData);
    base.db.Connect(tData.Network.dwServerHostID,
            tData.szAdmDBIP,
            tData.AccountDB.ConnParam.szDBName,
            tData.szAdmDBUser,
            tData.szAdmDBPwd,
            1);
	base.db.Connect(tData.Network.dwServerHostID,
            tData.szAdmDBIP,
            tData.RoleDB.ConnParam.szDBName,
            tData.szAdmDBUser,
            tData.szAdmDBPwd,
            2);
	return tData.Network.dwServerHostID;
end
