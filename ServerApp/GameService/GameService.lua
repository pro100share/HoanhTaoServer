--[[
文件：GameService/GameService.lua
类名：CGameService
功能说明：基础服务器，基础部分的总管理器
备注：
作者：周华杰
版本：v1.0
修改者：
]] 

_G.CPlayerGameState = {
    CreateWait  = 1;
    InGaming    = 2;
    ChangeLining= 3;
    ChangeLined = 4;
};

_G.CGameService = {}
--[[
功能：创建
备注：
]]
CGameService.setConnect = {}; --连接和玩家之间的对应 
CGameService.setAccountToNet = {}; --帐号和连接之间的对应

_G.tmCurTime = 0;
_G.GetCurTime = function(dwFlg)
	if dwFlg then
		return math.floor(_G.tmCurTime/1000);
	end
	return _G.tmCurTime;
end;

--给跨服战ks发消息
_G.CallOutToWarKs = function(msgName, arrParam)
	--换成赵旭提供的
	--CKernelApp[msgName](arrParam);
	_callouttoline(msgName, arrParam, 0, -1);
end;

function CGameService:Process(dwInterval)
    self:Update(dwInterval)
    return true;
end; 

function CGameService:Create()
	_G.tmCurTime = _now();
	
	CGameApp:Create();
	
	--连接玩家数据库
	if not CConfig.bIsCrossSvr then
		if not CPlayerDBQuery:Create() then
			return false;
		end;
	end;
	
	--创建玩家管理器
	if not CPlayerManager:Create() then
		return false;
	end;
	--创建实例管理器
	if not CSingleManager:Create() then
		return false;
	end;
	--数据中转管理器
	if not CTransitManager:Create() then
		return false;
	end;
	
	self.bIsConnect = true;
	return true;
end; 

local elapse,interval,count,last = {0,0,0,0,0},0,0,_now();
function CGameService:Update(dwInterval)
	_G.tmCurTime = _now();
	local record,current = _now(),_now();
	if current - last > 5 * 60 * 1000 then
		_info("===============interval===============");
		_info("interval:"..(interval/count));
		_info("================update================");
		_info("driver cost:"..(elapse[1]/count));
		_info("delayer cost:"..(elapse[2]/count));
		_info("player cost:"..(elapse[3]/count));
		_info("single cost:"..(elapse[4]/count));
		_info("transit cost:"..(elapse[5]/count));
		_info("================single================");
		for k,v in pairs(single_update_record) do
			_info("single obj "..k.." cost:"..(v/count));
		end
		_G.single_update_record = {};
		_info("================driver================");
		for k,v in pairs(driver_update_record) do
			local c = driver_update_count[k] or 0;
			_info("driver obj "..k.."("..c..") cost:"..(v/count));
		end
		_G.driver_update_count = {};
		_G.driver_update_record = {};
		_info("======================================");
		elapse,interval,count,last = {0,0,0,0,0},0,0,_now();
		
		_info("================memory================");
		CMemoryDebug:Print();
		_info("======================================");
	end;
	
	CDriverManager:Update(dwInterval);
	current = _now();
	elapse[1],record = elapse[1] + current - record,current;
	CDelayerManager:Update(dwInterval);
	current = _now();
	elapse[2],record = elapse[2] + current - record,current;
	CPlayerManager:Update(dwInterval);
	current = _now();
	elapse[3],record = elapse[3] + current - record,current;
	CSingleManager:Update(dwInterval);
	current = _now();
	elapse[4],record = elapse[4] + current - record,current;
	CTransitManager:Update(dwInterval);
	current = _now();
	elapse[5],record = elapse[5] + current - record,current;
	interval,count = interval + dwInterval,count + 1;
    return true;
end;

--[[
功能：程序释放，退出的时候调用
备注：
]]
function CGameService:Destroy()
	CPlayerManager:Destroy();
	CSingleManager:Destroy(); 
	CTransitManager:Destroy()
	--释放实例管理器
end;


-------------------------------------
--私有定义
------------------------------------  
--客户端连接
_G.OnConnect = function(objNet, dwIP, dwPort)
    CGameService:OnConnect(objNet, dwIP, dwPort)
end;
_svr:onConnect(_G.OnConnect);
--客户端断开连接
_G.OnDisconnect = function(objNet)
    CGameService:OnDisconnect(objNet);
end;
_svr:onDisconnect(_G.OnDisconnect);

_G.CClient = {};
function CClient:New(objNet, sIP)
    local obj = {};
    obj.objNet = objNet;
    obj.sIP  = sIP;
    obj.dwGameState = _G.CPlayerGameState.CreateWait;
    return obj;
end;

function CGameService:OnConnect(objNet, dwIP,dwPort)
	if self.setConnect[objNet] then
        _err("onconnect objNet exist!!!");
		return false;
	end;
    
     local client = CClient:New(objNet, dwIP);
    _mycallout(client);
    
    self.setConnect[objNet] = client;
    
	return true;
end;

function CGameService:GetClientByNet(objNet)
    return self.setConnect[objNet];
end;

--当客户端断开的时候
function CGameService:OnDisconnect(objNet)
	local client = self.setConnect[objNet];
	if not client then return end;
    self.setConnect[objNet] = nil;
    client.objNet = nil;
    if client.dwGameState == _G.CPlayerGameState.CreateWait then--KS还未返回创建结果
        if client.dwAccountID then
            local sSessionInfo = CKernelApp:PopSessionInfo(client.dwAccountID);
			if sSessionInfo then
				CKernelApp:SendDelPlayer(client.dwAccountID, nil, _G.GSDelPlayerReason.NetClose)--通知KS创建玩家失败。
			end
        end;
	elseif client.dwGameState == _G.CPlayerGameState.InGaming then--游戏中
        CPlayerManager:DelPlayer(client.dwAccountID);
    elseif client.dwGameState == _G.CPlayerGameState.ChangeLining then--等待KS换线返回结果
        CPlayerManager:DelPlayer(client.dwAccountID);
	end;
end; 
--quying chg 2012-06-07
--讲会话和网络，玩家绑定在一起，并放到列表中
function CGameService:BindAccount(objNet,dwAccountID) 
    self.setAccountToNet[dwAccountID] = objNet; 
end;
function CGameService:BindPlayer(dwAccountID,objPlayer)
    local objNet = self.setAccountToNet[dwAccountID];
    self.setAccountToNet[dwAccountID] = nil;
    local client = self.setConnect[objNet];
	objPlayer.objNet = objNet;
	objPlayer:SetIP(client.sIP);
	_mycallout(objPlayer);
    objPlayer.dwGameState = _G.CPlayerGameState.InGaming;
    self.setConnect[objNet] = objPlayer;
end;



