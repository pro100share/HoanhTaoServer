--[[
�ļ���BaseService/PlayerManager.lua
������CPlayerManager
����˵�����������ϵ�������ҵĹ�����
��ע��
���ߣ��ܻ���
�汾��v1.0
�޸��ߣ�
]] 
_G.CPlayerManager = {}

CPlayerManager.setAllPlayer = {};			--��������������ң�������������ң��������߼����
CPlayerManager.setAllPlayerByRoleID = {};	--��������������ң���ɫ��ң���Һͽ�ɫid�Ķ�Ӧ�б�
CPlayerManager.setAllPlayerByRoleName = setmetatable({},{__mode="v"});--[szRoleName] = objPlayer
CPlayerManager.setAllSavingAccount = {};	--�����������ڴ洢���ݿ�����

CPlayerManager.setCrossAllPlayer = {};  --��������������ң�������������ң��������߼����
CPlayerManager.setCrossPlayerByRoleID = {};  --��¼�������ս��ԭ��������ɫ��Ϣ��Ӧ�б�
CPlayerManager.setCrossAllPlayerByRoleName = setmetatable({},{__mode="v"});--[szRoleName] = objPlayer


function CPlayerManager:Create()
	if not CConfig.bIsCrossSvr then
		self.dwHostInfoID = CConfig.RoleDB.dwDBRoleMaxCount * CConfig.Network.dwServerHostID;
	end;
	CMemoryDebug:Show("ObjPlayer");
    
    self.UpdateTime = GetCurTime(true) + 30;
    self.CurPlayerNum = 0;
    return true;
end; 

function CPlayerManager:Update(dwInterval)
    if GetCurTime(true) > self.UpdateTime then
        _info("Online Player Num:"..self.CurPlayerNum);
        _info("Saving Player Num:"..self:CountSavingAccount());
        self.UpdateTime = GetCurTime(true) + 30;
    end;
    return true;
end;

function CPlayerManager:Destroy()
	for I,Player in pairs(self.setAllPlayer)do
		Player:Destroy(false);
	end;
end; 

--����һ�����
function CPlayerManager:CreatePlayer(dwAccountID)
	local objPlayer = self.setAllPlayer[dwAccountID];
	if objPlayer ~= nil then
		_info('Player is Exists:',dwAccountID);--����Ѿ�����
		return;
	end; 
	local sSessionInfo = CKernelApp:PopSessionInfo(dwAccountID);
	if not sSessionInfo then
		_info('SessionInfo is not Exists:',dwAccountID);--û��������Ϣ
        CKernelApp:SendDelPlayer(dwAccountID, nil, _G.GSDelPlayerReason.NetClose)--֪ͨKS�������ʧ�ܡ�
		return;
	end
	local sPlayerInfo = sSessionInfo.sInfo
	if not sPlayerInfo then
		_info('PlayerInfo is not Exists:',dwAccountID);--û�������Ϣ
		return;
	end 
	objPlayer = CPlayer:new(dwAccountID,CPlayerDBQuery:GetDBQuery(),sPlayerInfo)

	if not objPlayer then
	    _info('Create Player Obj Error');
		return;
	end; 
	CGameService:BindPlayer(dwAccountID,objPlayer); --���������
	
	local bIsChangeLine = sPlayerInfo.IsChangeLine
	
	if not objPlayer:Create(bIsChangeLine) then
		_info('Player Do Create Func Error');
		return nil;
	end; 
	if not self:AddPlayer(objPlayer) then
		return;
	end; 
	--֪ͨ�ͻ��˽�����·
	if bIsChangeLine == 0 then
		pcall(
            function ()
               CLogSystemManager:login(objPlayer);
               CLogSystemManager:info(objPlayer);
            end
        );
		objPlayer.EnterGameServiceResultMsg{}
	else
		local mapSys = objPlayer:GetSystem("CMapSystem");
		mapSys:ExecChangeMap({bIsChangeLine=1});
	end;
	-- if bIsChangeLine then
		-- local mapSys = objPlayer:GetSystem("CMapSystem");
		-- mapSys:ExecChangeMap({bIsChangeLine=true});
	-- else
        -- pcall(
            -- function ()
               -- CLogSystemManager:login(objPlayer);
               -- CLogSystemManager:info(objPlayer);
            -- end
        -- );
		-- objPlayer.EnterGameServiceResultMsg{}
	-- end;

	return objPlayer;
end; 


function _G.checkUser(_args)
    _args.user = CGameService:GetClientByNet(_from);
end; 

function _G.checkKSUser(_args)
	_args.user = CPlayerManager:GetPlayer(_args._aid);
end;


function CPlayerManager:CreateSession(netObj,dwAccountID,szSign)
	local objUser = CPlayerManager:GetPlayer(dwAccountID);
	if objUser then
		-- print("CreateSession objUser exists",dwAccountID);
		return -5; 
	end; 
	--��ȡ��ʱ��Ϣ
	local sSessionInfo = CKernelApp:GetSessionInfo(dwAccountID);
	if not sSessionInfo then
		-- print("CreateSession not exists",dwAccountID);
		return -1; 
	end; 
	local sPlayerInfo = sSessionInfo.sInfo;
	if not sPlayerInfo then
		return -3; 
	end; 
	--��֤�����Ϣ
	local szStr =  ("themgai1"..tostring(sPlayerInfo.dwTimeStamp )):md5();
	if not szStr:lead(szSign) then
		_info("szSign Error!! ",szSign,szStr);
		return -2; 
	end;
	CGameService:BindAccount(netObj,dwAccountID);	--���˺� 
	self:ProcCreateSession(dwAccountID,sPlayerInfo); 
	return 0;
end;

function CPlayerManager:CrossCreatePlayer(netObj,dwAccountID,szSign)
	_info("======CrossCreatePlayer111=======", netObj, _from);
	local client = CGameService:GetClientByNet(netObj); 
	if not client then return end;
    client.dwAccountID = dwAccountID;
	local objUser = CPlayerManager:GetPlayer(dwAccountID);
	if objUser then
		-- print("CrossCreatePlayer objUser exists",dwAccountID);
		return -5; 
	end; 
	local info = CTransitManager:GetData(dwAccountID,"Player")[1];
	local sPlayerInfo = {};
	sPlayerInfo.szSign = info.szSign; --�����֤��Ϣ
	sPlayerInfo.dwGold = info.dwGold; --��ҵ�Ԫ����Ϣ 
	--��֤�����Ϣ
	local szStr = sPlayerInfo.szSign;
	if szSign ~= szStr then
		_info("CrossCreatePlayer szSign Error!! ",szSign,szStr);
		return -2; 
	end;
	CGameService:BindAccount(netObj,dwAccountID);	--���˺� 
	
	local objPlayer = self.setAllPlayer[dwAccountID];
	if objPlayer ~= nil then
		_info('Player is Exists:',dwAccountID);--����Ѿ�����
		return;
	end; 
	objPlayer = CPlayer:new(dwAccountID,nil,sPlayerInfo)
	if not objPlayer then
	    _info('Create Player Obj Error');
		return;
	end;
	CGameService:BindPlayer(dwAccountID,objPlayer)
	_info("======CrossCreatePlayer666====11===");
	if not objPlayer:Create(2) then
		_info('Player Do Create Func Error');
		return nil;
	end; 
	if not self:AddPlayer(objPlayer) then
		return;
	end; 
	CTransitManager:ClearData(dwAccountID);
	_info("======CrossCreatePlayer888=======");

	return objPlayer;
end;

function CPlayerManager:ProcCreateSession(dwAccID,sPlayerInfo)
	if not sPlayerInfo then 
		local sSessionInfo = CKernelApp:GetSessionInfo(dwAccID);
		if not sSessionInfo then
			_info("ProcCreateSession error!!!!!!");
			return ;
		end;
		sPlayerInfo = sSessionInfo.sInfo;
		if not sPlayerInfo then
			return -1; 
		end; 
	end; 
	if not sPlayerInfo.dwReadyState then
		sPlayerInfo.dwReadyState = 1;
	elseif sPlayerInfo.dwReadyState == 1 then 
		--֪ͨKS,Client���ӳɹ�
		CKernelApp.CreatePlayerSystemMsg{ AccountID = dwAccID,IsChangeLine = sPlayerInfo.IsChangeLine };
	end;
end;

-------------------------------------------------------------------
------------------------*******���ս��**********------------------
-------------------------------------------------------------------
function CPlayerManager:CrossProcCreateSession(dwAccID,sPlayerInfo)
	if not sPlayerInfo then 
		local sSessionInfo = CKernelApp:GetSessionInfo(dwAccID);
		if not sSessionInfo then
			_info("ProcCreateSession error!!!!!!");
			return ;
		end;
		sPlayerInfo = sSessionInfo.sInfo;
		if not sPlayerInfo then
			return -1; 
		end; 
	end; 
	if not sPlayerInfo.dwReadyState then
		sPlayerInfo.dwReadyState = 1;
	elseif sPlayerInfo.dwReadyState == 1 then 
		--֪ͨKS,Client���ӳɹ�
		CKernelApp.CrossCreatePlayerSystemMsg{ AccountID = dwAccID,IsChangeLine = sPlayerInfo.IsChangeLine };
	end;
end;
-------------------------------------------------------------------
----------------------------**********------------------------------
-------------------------------------------------------------------

--���һ�����
function CPlayerManager:AddPlayer(objPlayer) 
	self.setAllPlayer[objPlayer:GetAccountID()] = objPlayer;
	self.setAllPlayerByRoleID[objPlayer:GetRoleID()] = objPlayer;
	self.setAllPlayerByRoleName[objPlayer:GetName()] = objPlayer;
	CMemoryDebug:AddObject("ObjPlayer",objPlayer);
    self.CurPlayerNum = self.CurPlayerNum + 1;
	return objPlayer;
end;

--ɾ��һ����ң��������
function CPlayerManager:DelPlayer(dwAccountID,bIsChangeLine)
    --��Ҫɾ����ҵ�ʱ������Ҫ����һ���ͷ�
	local objPlayer = self.setAllPlayer[dwAccountID] or self.setCrossAllPlayer[dwAccountID];
	if objPlayer then
		local roleId = objPlayer:GetRoleID();
		_info("Player Exit Line", dwAccountID, bIsChangeLine);
		self.setAllPlayerByRoleID[objPlayer:GetRoleID()] = nil;
		self.setAllPlayerByRoleName[objPlayer:GetName()] = nil;
		self.setAllPlayer[dwAccountID] = nil;
        self.setCrossAllPlayer[objPlayer:GetAccountID()] = nil;
		self.setCrossPlayerByRoleID[objPlayer:GetRoleID()] = nil;
		self.setCrossAllPlayerByRoleName[objPlayer:GetName()] = nil;
		_info("===DelPlayer1====", CConfig.bIsCrossSvr);
		objPlayer:Destroy(bIsChangeLine);
		if CConfig.bIsCrossSvr then
			_info("===DelPlayer2====");
			local netId = self.NetTbl[dwAccountId];
			_callouttoline("SendCrossInfoMsg", {RoleId = roleId,AccountID = dwAccountID, EnterFlag = false}, 0, netId);
		end;
	else
		_info("player not exist", dwAccountID);
	end;
end;

function CPlayerManager:DelPlayerByCross(dwAccountID)
	_info("------------CPlayerManager:DelPlayerByCross------++++++", dwAccountID);
	local objPlayer = self.setAllPlayer[dwAccountID];
	if objPlayer then
		CKernelApp.SendCrossInfoMsg{RoleId = objPlayer:GetRoleID(), AccountID = dwAccountID, EnterFlag = true};
		--�����ɫ��ͬ��
		local playerTbl = objPlayer:GetOtherPlayer(nil,1)
		local map = objPlayer:GetSystem("CMapSystem"):GetCurMap();
		local tbOldID = {};
		local i = 1;
		local tbOldNet = {}
		for dwID, player in pairs(playerTbl)do
			if dwID ~= objPlayer:GetRoleID() then
				if player then
					tbOldID[i] = dwID;
					i = i + 1;
					table.insert(tbOldNet,player.objNet)
				end
			end
		end
		
		_groupcallout(tbOldNet,"OnHidePlayerMsg",{List = {objPlayer:GetRoleID()}});

		objPlayer.OnHidePlayerMsg{List = tbOldID};
		--�������ϵͳ
		CKernelApp.GSPlayerLogoutMsg{RoleId = objPlayer:GetRoleID()};
		--CFriendManager:DelFriendSystem(objPlayer:GetRoleID(), objPlayer:GetInfo().szRoleName );--���Լ���ȫ�ֹ�����ע��
		--�������ϵͳ
		objPlayer:GetSystem("CTeamSystem"):ExitTeam(false);
		--����̯λ
		CPlayerShopManager:DelShop(objPlayer:GetRoleID());
		--������
		local marrySystem = objPlayer:GetSystem("CMarriageSystem")
		if marrySystem then
			for k, v in pairs(marrySystem.BeProposeToList) do
				_G.GSRemoteCall(k, "CMarriageSystem", "ProposeRefused", {objPlayer:GetRoleID(), objPlayer:GetInfo().szRoleName}, nil);
			end;
			if marrySystem:IsMarried() then
				local marryId =  marrySystem:GetMateRoleID()
				_G.GSRemoteCall(marryId, "CMarriageSystem", "BeNoticeMateOffline", nil, nil);
			end;
		end;
		_info("CPlayerManager:DelPlayerByCross", dwAccountID, objPlayer);
		--��ʱ��ԭ�������洢�������
		self.setCrossAllPlayer[objPlayer:GetAccountID()] = objPlayer;
		self.setCrossPlayerByRoleID[objPlayer:GetRoleID()] = objPlayer;
		self.setCrossAllPlayerByRoleName[objPlayer:GetName()] = objPlayer;
		
		self.setAllPlayerByRoleID[objPlayer:GetRoleID()] = nil;
		self.setAllPlayerByRoleName[objPlayer:GetName()] = nil;
		self.setAllPlayer[dwAccountID] = nil;
		CMapManager.setAllPlayer[objPlayer:GetRoleID()] = nil;	
		map.setAllPlayer[objPlayer:GetRoleID()] = nil;
	else
		_info("player not exist", dwAccountID);
	end;
end;

function CPlayerManager:RecoverCrossPlayer(dwAccountID, bFlag)
	local objPlayer = self.setCrossAllPlayer[dwAccountID];
	if objPlayer then
		if bFlag then
			self.setAllPlayerByRoleID[objPlayer:GetRoleID()] = objPlayer;
			self.setAllPlayerByRoleName[objPlayer:GetName()] = objPlayer;
			self.setAllPlayer[dwAccountID] = objPlayer; 
			
			self.setCrossAllPlayer[objPlayer:GetAccountID()] = nil;
			self.setCrossPlayerByRoleID[objPlayer:GetRoleID()] = nil;
			self.setCrossAllPlayerByRoleName[objPlayer:GetName()] = nil;
		else	
			self.setCrossAllPlayer[objPlayer:GetAccountID()] = nil;
			self.setCrossPlayerByRoleID[objPlayer:GetRoleID()] = nil;
			self.setCrossAllPlayerByRoleName[objPlayer:GetName()] = nil;
		end;
	end;
end;

--ǿ��ɾ��һ�����
function CPlayerManager:CompelDelPlayer(dwAccountID)
	local objPlayer = self.setAllPlayer[dwAccountID];
	if objPlayer then
		_info("Player Compel Exit Line", dwAccountID);
		self.CurPlayerNum = self.CurPlayerNum - 1;
		
		self.setAllPlayerByRoleID[objPlayer:GetRoleID()] = nil;
		self.setAllPlayerByRoleName[objPlayer:GetName()] = nil;
		self.setAllPlayer[dwAccountID] = nil; 
	
		if objPlayer.objDriver then
			CDriverManager:DelDriver(objPlayer.objDriver);
		end
		
		CTransitManager:ClearData(dwAccountID);
		CLoginDataManager:ClearData(dwAccountID);
	end;
end;

function CPlayerManager:GetPlayer(dwAccountID)
	return self.setAllPlayer[dwAccountID];
end; 

--������ҽ�ɫidȡ���
function CPlayerManager:GetPlayerByRoleID(dwRoleID)
	return self.setAllPlayerByRoleID[dwRoleID];
end;
--������ҽ�ɫ��ȡ���
function CPlayerManager:GetPlayerByRoleName(szRoleName)
	return self.setAllPlayerByRoleName[szRoleName];
end;
--��ȡ��ǰ���ߵ���ҵ�ID�б�key����ţ�value����ҵ�RoleID
function CPlayerManager:GetAllPlayerRoleIDs()
	local ids = {}
	for dwRoleID,value in pairs(self.setAllPlayerByRoleID) do
		table.insert( ids, dwRoleID );
	end
	return ids;
end
--���ڴ洢���ݿ�����
function CPlayerManager:AddSavingAccount(dwAccountID)
	self.setAllSavingAccount[dwAccountID] = GetCurTime()
end;
function CPlayerManager:DelSavingAccount(dwAccountID)
	local dwTime = self.setAllSavingAccount[dwAccountID]
	self.setAllSavingAccount[dwAccountID] = nil
	if not dwTime then return end
	local dwDelay = GetCurTime() - dwTime
	if dwDelay > 10000 then
		_info('error: DelSavingPlayer Cost',dwDelay)
	end
end;
function CPlayerManager:IsSavingAccount(dwAccountID)
	local dwTime = self.setAllSavingAccount[dwAccountID]
	if dwTime then
		return true
	else
		return false
	end
end;
function CPlayerManager:CountSavingAccount()
	local dwCount = 0;
	for k,v in pairs(self.setAllSavingAccount) do
		dwCount = dwCount + 1;
	end
	return dwCount;
end;

--����KS֮�󣬷��ͽ�ɫ��Ϣ��KS
function CPlayerManager:DoneWithReConnect()
	local tbRoleList = {};
	
	for dwAccountID,objPlayer in pairs(self.setAllPlayer)do
		local tbInfo = objPlayer:GetInfo();
		tbInfo.dwAccountID = dwAccountID;
		
		table.insert(tbRoleList,tbInfo);
		
		if #tbRoleList >= 7 then
			CKernelApp.OnGSReConnectRoleInfoMsg{RoleInfoList = tbRoleList};
			
			tbRoleList = {};
		end
	end
	
	if #tbRoleList > 0 then
		CKernelApp.OnGSReConnectRoleInfoMsg{RoleInfoList = tbRoleList};
		tbRoleList = {};
	end
end;

--������KS�Ѿ�������ɫ������ϵͳ�����Լ������ݵ�KS
function CPlayerManager:DoneWithReConnectSystem()
	for dwAccountID,objPlayer in pairs(self.setAllPlayer)do
		objPlayer.objSystemMgr:KSReConnect();
	end
end;


