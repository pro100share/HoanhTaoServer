--[[
文件：GameService/KernelApp.lua
类名：CKernelApp
功能说明：游戏服务器针对于登陆服务器的客户端，
备注：
作者：周华杰
版本：v2.0
修改者：
]] 
---------------------------------------------------------- 
--基础消息定义
---------------------------------------------------------- 

---游戏服务器注册到中心服务器的结果消息
define.GSRegResultMsg
{
	LineID=0,   --被分配到的线路，如果是-1则表示注册失败
    UserPort=0,   --跨服战服务器端口号
}
when{}
function GSRegResultMsg(LineID, UserPort)
    CConfig.CrossServiceNetwork.dwUserPort = UserPort;

	if LineID <= 0 then
		_err("Reg to Kernel Host Error ",LineID);
		return;
	end;  
	CKernelApp:ProcRegResultMsg(LineID);
	_info("Connect To Kernel Server Succes");
end;

define.GSReConnectResultMsg
{
	Code = 0;--KS重连的结果，0--失败；1--成功
}
when{}
function GSReConnectResultMsg(Code)
	if Code == 0 then
		_err("ReConnect to Kernel Host fail");
		return
	end
	
	CKernelApp:DoneWithReConnectSucc();
	_info("ReConnect To KS Succes");
end;

---------------------------------------------------------- 
--中心服务器连接器
---------------------------------------------------------- 
_G.CKernelApp = {} 
--创建
function CKernelApp:Create() 
	--连接到登陆服务器 
	local strAddr = CConfig.Network.strKernelService;
	--创建网络
	local maxMsgLen     = math.floor(CConfig.KernelServiceNetwork.dwMaxMessageLengthFromGameService % 100000);
    _info("CKernelApp:Create()", strAddr, maxMsgLen);
	_svr:KSConnect(strAddr, maxMsgLen);
    
	self.setTempPlayerInfo ={};
	self.dwLastUpdateTime =_now();
	
	return true;
end; 

function CKernelApp:OnConnect(svrNet)
	_info("CKernelApp:OnConnect", svrNet, self.dwLineID)
	self.objNet = svrNet;
	_mycallout(self);
	local dwTime = _now();
	local szStr = "themgai1"..tostring(dwTime);
	szStr = szStr:md5();
	if self.dwLineID then
		--print("CKernelApp:OnReConnect")
		self.GSReConnectRequestMsg{LineID=self.dwLineID,Sign=szStr,Time=dwTime,WarFlag=_G.WarHostFlag} 
	else
		-- print("CKernelApp:OnConnect()");
		self.GSRegRequestMsg{Sign=szStr,Time=dwTime,WarFlag=_G.WarHostFlag} 
	end
end;

function CKernelApp:OnDisconnect()
	_err("CKernelApp:OnDisconnect .......");
	--setmetatable(self, nil);
    self.objNet = nil;
end;

function CKernelApp:OnFail()
	_err("CKernelApp:OnFail .......");
end;


function CKernelApp:isConnectOK()
	return (self.objNet ~= nil);
end;

--呼出处理函数


--更新
function CKernelApp:Update()
	local tmNow = _now();
	local dwNow = tmNow - self.dwLastUpdateTime;
	if dwNow > 1000 then
		self.dwLastUpdateTime = tmNow; 
		for k,sInfo in pairs(self.setTempPlayerInfo) do
			sInfo.dwRemTime = sInfo.dwRemTime - dwNow;
			if sInfo.dwRemTime <= 0 then
				self.setTempPlayerInfo[k] = nil; 
				self:SendDelPlayer(k,sInfo.sInfo.szSign, _G.GSDelPlayerReason.OverConTime); 
				if CGameService.setAccountToNet[k] then
					-- print("===========CKernelApp:Update=========");
					_closenet(CGameService.setAccountToNet[k]);
				end;
			end;
		end; 
	end;
	--return true;
	if self.isKSDisconnect then
		local dwTick = tmNow - self.dwReConnectTime;
		if dwTick > self.dwReConnectTick then
			-- print("====Update===",dwTick,self.dwReConnectTick)
			if self:ReConnect() then
				self:ReConnectSucc();
			else
				-- if self.dwReConnectTick < 60000 then
					-- self.dwReConnectTick = self.dwReConnectTick + 5000;
				-- end
			end
			
			self.dwReConnectTime = tmNow;
		end
	end
end;



--释放function C
function CKernelApp:Destroy()
	
end;  

--处理注册结果
function CKernelApp:ProcRegResultMsg(dwLineID,dwPort) 
	if dwLineID < 0 then
		-- print("ProcRegResultMsg dwLineID < 0");
		return;
	end;
    _info("=====dwLineID===:", dwLineID);
	self.dwLineID = dwLineID;
    
    local strAddr = CConfig.Network.strProxyService;
	local strTsAddr = CConfig.Network.strTransService;
	local maxMsgLen = math.floor(CConfig.ProxyServiceNetwork.dwMaxMessageLengthFromServer % 100000);
	local maxTsMsgLen     = math.floor(CConfig.KernelServiceNetwork.dwMaxMessageLengthFromGameService % 100000);
	local maxGsUserCount = CConfig.ProxyServiceNetwork.nPlayerInGameNum;
	
    _info("CPSApp:Create()1 ", maxGsUserCount, maxMsgLen, self.dwLineID);
    _svr:PSConnect(strAddr,maxGsUserCount, maxMsgLen, self.dwLineID);
	_info("CTSApp:Create()2", strTsAddr, maxTsMsgLen);
    _svr:TSConnect(strTsAddr, maxTsMsgLen, self.dwLineID); 
	
		--_db:OnReceive(function(...) self:OnDelAccount(...) end);
	local szDsAddr = CConfig.Network.strDataService;
	local dwDsMsgLen = CConfig.DataServiceNetwork.dwMaxMessageLengthFromGameService;
	_info("CDSApp:Create()3",szDsAddr,dwDsMsgLen,self.dwLineID);
	--_db:Connect(szAddr,math.floor(dwMsgLen % 100000));
	if not CConfig.bIsCorssSvr then
		_svr:DSConnect(szDsAddr,math.floor(dwDsMsgLen % 100000),self.dwLineID);
	end;
	
	--KS链接成功后的处理
	for n,objSingle in pairs(CSingleManager.setAllSingle)do
		if objSingle.OnKSConnect then
			objSingle:OnKSConnect();
		end
	end
end; 
--处理ks发送过来的添加用户的消息
function CKernelApp:AddPlayerRequest(sPlayerInfo)
	local dwAccountID = sPlayerInfo.dwAccountID; --得到账号id	
	if self.setTempPlayerInfo[dwAccountID] then --已经收到过添加信息
		_info("TempPlayer Info Exists !!!!!!!!!!!!!!!!!!!!!!!!!",dwAccountID);
		self.AddPlayerResultMsg{AccountID = dwAccountID,ResultCode = -1}; 
		return;
	end;
	
	--如果有玩家在线上，强制删掉，不保存数据库
	local oldPlayer = CPlayerManager:GetPlayer(dwAccountID);
	if oldPlayer then
		_info("ERROR!!!!!!!!! user exists by AddPlayerRequest", dwAccountID);
		if oldPlayer.objNet then 
			oldPlayer.CreateGameSessionRequestMsg{ResultCode = -21}
            _closenet(oldPlayer.objNet);
		end;
		CPlayerManager:CompelDelPlayer(dwAccountID);
	end;
	local sTempInfo = {};
	sTempInfo.dwRemTime = 30000;
	sTempInfo.sInfo = sPlayerInfo; 
	self.setTempPlayerInfo[dwAccountID] = sTempInfo; 
	self.AddPlayerResultMsg{AccountID = dwAccountID,ResultCode = 0,IsChangeLine=sPlayerInfo.IsChangeLine}; 
end;

--获取会话信息
function CKernelApp:GetSessionInfo(dwAccountID)  
	return self.setTempPlayerInfo[dwAccountID];
end;

--弹出会话信息
function CKernelApp:PopSessionInfo(dwAccountID) 
	local sInfo = self.setTempPlayerInfo[dwAccountID];
	self.setTempPlayerInfo[dwAccountID] = nil; 
	return sInfo;
end;

_G.GSDelPlayerReason ={
    NetClose    = 1, --断线
    GSKick      = 2, --GS踢掉
    OverConTime = 3, --超时未连接GS
}
--想ks发送删除一个玩家
function CKernelApp:SendDelPlayer(dwAccountID,szCheckStr, dwReason)
	self.DelPlayerMsg{AccountID = dwAccountID,CheckStr = szCheckStr, Reason = dwReason};
	CTransitManager:ClearData(dwAccountID);
	CLoginDataManager:ClearData(dwAccountID);
end; 


--重新在KS注册成功后的处理
function CKernelApp:DoneWithReConnectSucc()
	_info("===DoneWithReConnectSucc===")
	--KS创建角色
	CPlayerManager:DoneWithReConnect();
	
	--Manager事件
	for n,objSingle in pairs(CSingleManager.setAllSingle)do
		if objSingle.OnKSReConnect then
			objSingle:OnKSReConnect();
		end
	end
	
	--Player的事件
	CPlayerManager:DoneWithReConnectSystem();
	
	_svr:ReconnectOver();
end;


_G.OnKSConnect = function(svrNet)
    CKernelApp:OnConnect(svrNet)
end;

_G.OnKSDisconnect = function()
    CKernelApp:OnDisconnect();
end;

_G.OnKSReconnect = function(svrNet)
	_info("===OnKSReconnect===",CKernelApp.dwLineID)
	CKernelApp:OnConnect(svrNet)
end;

_G.OnPSConnect = function()
    _info("==OnPSConnect==");
	if _G.StartFlag then
		return
	end;
	_G.StartFlag = true;
     _info'Start GameService Begin';
    if not CGameService:Create() then
        _info'Start GameService Fail';
        return;
    end;
    _info 'Start GameService Success';
    
    _startupdate("RealUpdate");
    _svr:onDestroy(_G.Destroy);
end;

_G.OnPSDisconnect = function()
    _err("CPSApp:OnDisconnect .......");
end;

_svr:onKSConnect(_G.OnKSConnect);
_svr:onKSDisconnect(_G.OnKSDisconnect);
_svr:onKSReConnect(_G.OnKSReconnect);
_svr:onPSConnect(_G.OnPSConnect);
_svr:onPSDisconnect(_G.OnPSDisconnect);




