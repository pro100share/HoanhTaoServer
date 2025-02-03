

_G.CClient = {};
function CClient:New(objNet, sIP)
    local obj = {};
    obj.objNet = objNet;
    obj.sIP  = sIP;
	obj.dwStayTime = _now() + 180000;
    return obj;
end;


_G.CPlayerService = {}

CPlayerService.setConnect = {}; --���Ӻ����֮��Ķ�Ӧ 
CPlayerService.setReadySession = {};

CPlayerService.setWaitingNet = {};
CPlayerService.setWaitingAccount = {};

function CPlayerService:OnConnect(objNet,dwIP)
    --print("=====OnConnect=====", objNet, dwIP);
	if self.setConnect[objNet] then
        -- print("objNet exists !!!");
		return false;
	end;
    
    local client = CClient:New(objNet, dwIP);
    _mycallout(client);
    
    self.setConnect[objNet] = client;
	return true;
end;

function CPlayerService:Update()
	local curTime = _now();
	for k, v in pairs(self.setConnect) do
		if curTime > v.dwStayTime then
			v.dwStayTime = v.dwStayTime + 30000;
			local client = self:GetClientByNet(k);
			client.CreateGameSessionRequestMsg{ResultCode = -20}
			_closenet(k);
		end;
	end;
end;

function CPlayerService:GetClientByNet(objNet)
    return self.setConnect[objNet];
end;

--���������Ͽ���ʱ��
function CPlayerService:OnDisconnect(objNet)
    local client = self.setConnect[objNet];
    if not client then return end;
    --print("=====OnDisconnect=====", objNet);
    if client.dwAccountID then
        if client.bSession then
            self.setReadySession[client.dwAccountID] = nil;
        else
            CPlayerManager:DelPlayer(client.dwAccountID);
        end;
    end;
	
	if self.setWaitingNet[objNet] then
		self.setWaitingAccount[self.setWaitingNet[objNet]] = nil;
		self.setWaitingNet[objNet] = nil;
	end;
	
    client.objNet = nil;
    self.setConnect[objNet] = nil;
end;




function CPlayerService:ReadyCreateSession(netObj,dwAccountID,dwAdultFlag, bFirstLogin,UF)
	_info("==LoginStep==2==", dwAccountID);
	local objPlayer = CPlayerManager:GetPlayer(dwAccountID);
	if objPlayer then
		if objPlayer.bSelectLining then
			self:AddWaiting(netObj, dwAccountID, dwAdultFlag, bFirstLogin, UF);
		else
			objPlayer.CreateGameSessionRequestMsg{ResultCode = -16}
			self.setConnect[objPlayer.objNet] = nil;
			_closenet(objPlayer.objNet)
			CPlayerManager:DelPlayer(dwAccountID);
			self:CreateSession(netObj,dwAccountID,dwAdultFlag,bFirstLogin,UF);
		end;
	else
		local session = self.setReadySession[dwAccountID];
		if session then--������ʺ�Ҳ��readyCreateSession
			--�ߵ���һ������
			local kickNet = session[1];
			local client = self:GetClientByNet(kickNet);
			client.CreateGameSessionRequestMsg{ResultCode = -15}
			self.setConnect[kickNet] = nil;
			_closenet(kickNet);
			--sessionֱ��ռ��
			session[1] = netObj;
			session[2] = dwAdultFlag;
			session[3] = bFirstLogin;
			session[4] = UF;
		else
			self.setReadySession[dwAccountID] = 
			{
				[1] = netObj;
				[2] = dwAdultFlag;
				[3] = bFirstLogin;
				[4] = UF;
			};
		end;
		local client = self:GetClientByNet(netObj);
		client.bSession = true;
		client.dwAccountID = dwAccountID;
	end;
end;

function CPlayerService:AddWaiting(netObj, dwAccountID, dwAdultFlag, bFirstLogin, UF)
	if self.setWaitingAccount[dwAccountID] then--����Ѿ��еȴ���net��
		local net = self.setWaitingAccount[dwAccountID][1];
		local client = self:GetClientByNet(net);
		client.CreateGameSessionRequestMsg{ResultCode = -14}
		self.setWaitingNet[net] = nil;
		self.setConnect[net] = nil;
		_closenet(net);
	end;
	self.setWaitingAccount[dwAccountID] = {
		[1] = netObj,
		[2] = dwAccountID;
		[3] = dwAdultFlag;
		[4] = bFirstLogin;
		[5] = UF;
	}
	self.setWaitingNet[netObj] = dwAccountID;
end;

function CPlayerService:RealCreateSessin(dwAccountID)
	_info("==LoginStep==9==", dwAccountID);
	local tbInfo = self.setReadySession[dwAccountID];
	if not tbInfo then
		return;
	end
	self.setReadySession[dwAccountID] = nil;
	self:CreateSession(tbInfo[1],dwAccountID,tbInfo[2],tbInfo[3], tbInfo[4]);
end;

--- ��ҷ��͹����ģ����ڴ����Ự�����Ự��������ʽ������Ϸ�߼�
function CPlayerService:CreateSession(netObj,dwAccountID,dwAdultFlag, bFirstLogin, UF)
    local client = self:GetClientByNet(netObj);
	_info("==LoginStep==10==", dwAccountID);
	local bRet, dwRoleCount, avoidTime, isAvoidValue, clearTime = self:BindSession(client,dwAccountID,dwAdultFlag, UF) ;
	if bRet < 0 then
		_info("Create Session error Close net");
		client.OnCreateSessionRetMsg{ResultCode =-3,AccountID =0,RoleCount=0, AvoidTime = 0, AvoidValue = 0, ClearTime = clearTime};
		client.CreateGameSessionRequestMsg{ResultCode = -13}
		_closenet(netObj);
		return ;
	elseif bRet == 0 then
        --�����Ự�ɹ� 
		client.OnCreateSessionRetMsg{ResultCode =0,AccountID =dwAccountID,RoleCount = dwRoleCount, AvoidTime = avoidTime, AvoidValue = isAvoidValue, ClearTime = clearTime};
	end;
end;  

--quying chg 2012-06-07
--���Ự�����磬��Ұ���һ�𣬲��ŵ��б���
function CPlayerService:BindSession(client, dwAccountID, dwAdultFlag, UF)
    local objUser = CPlayerManager:CreatePlayer(dwAccountID, dwAdultFlag);	
    if not objUser then
        _info("create user error!!!");
        return -1;
    end;
    
    --������
    objUser = CPlayerManager:AddPlayer(objUser, client.sIP, UF);
    if objUser == nil then
        _info("Add user error!!!");
        return -1;
    end;
    
 	--��Һ������Ӧ���� 
    self.setConnect[client.objNet] = objUser;
	objUser.objNet = client.objNet;
	objUser.dwStayTime = client.dwStayTime;
	_mycallout(objUser);
    
	return 0, objUser:GetRoleCount(), avoidTime, 0, clearTime;
end; 


_G.OnConnect = function(objNet, dwIP)
    CPlayerService:OnConnect(objNet, dwIP);
end;

_G.OnDisconnect = function(objNet)
    CPlayerService:OnDisconnect(objNet);
end;

_lsvr:onConnect(_G.OnConnect);
_lsvr:onDisconnect(_G.OnDisconnect);



_G.RealUpdate = function()
    CPlayerService:Update();
end;

_startupdate("RealUpdate");



