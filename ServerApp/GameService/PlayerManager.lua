--[[
文件：BaseService/PlayerManager.lua
类名：CPlayerManager
功能说明：服务器上的所有玩家的管理器
备注：
作者：周华杰
版本：v1.0
修改者：
]] 
_G.CPlayerManager = {}

CPlayerManager.setAllPlayer = {};			--用来保存所有玩家，这里是网络玩家，不属于逻辑玩家
CPlayerManager.setAllPlayerByRoleID = {};	--用来保存所有玩家，角色玩家，玩家和角色id的对应列表
CPlayerManager.setAllPlayerByRoleName = setmetatable({},{__mode="v"});--[szRoleName] = objPlayer
CPlayerManager.setAllSavingAccount = {};	--用来保存正在存储数据库的玩家

CPlayerManager.setCrossAllPlayer = {};  --用来保存所有玩家，这里是网络玩家，不属于逻辑玩家
CPlayerManager.setCrossPlayerByRoleID = {};  --记录换进跨服战后，原服务器角色信息对应列表
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

--创建一个玩家
function CPlayerManager:CreatePlayer(dwAccountID)
	local objPlayer = self.setAllPlayer[dwAccountID];
	if objPlayer ~= nil then
		_info('Player is Exists:',dwAccountID);--玩家已经在线
		return;
	end; 
	local sSessionInfo = CKernelApp:PopSessionInfo(dwAccountID);
	if not sSessionInfo then
		_info('SessionInfo is not Exists:',dwAccountID);--没有连接信息
        CKernelApp:SendDelPlayer(dwAccountID, nil, _G.GSDelPlayerReason.NetClose)--通知KS创建玩家失败。
		return;
	end
	local sPlayerInfo = sSessionInfo.sInfo
	if not sPlayerInfo then
		_info('PlayerInfo is not Exists:',dwAccountID);--没有玩家信息
		return;
	end 
	objPlayer = CPlayer:new(dwAccountID,CPlayerDBQuery:GetDBQuery(),sPlayerInfo)

	if not objPlayer then
	    _info('Create Player Obj Error');
		return;
	end; 
	CGameService:BindPlayer(dwAccountID,objPlayer); --绑定玩家网络
	
	local bIsChangeLine = sPlayerInfo.IsChangeLine
	
	if not objPlayer:Create(bIsChangeLine) then
		_info('Player Do Create Func Error');
		return nil;
	end; 
	if not self:AddPlayer(objPlayer) then
		return;
	end; 
	--通知客户端进入线路
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
	--获取临时信息
	local sSessionInfo = CKernelApp:GetSessionInfo(dwAccountID);
	if not sSessionInfo then
		-- print("CreateSession not exists",dwAccountID);
		return -1; 
	end; 
	local sPlayerInfo = sSessionInfo.sInfo;
	if not sPlayerInfo then
		return -3; 
	end; 
	--验证玩家信息
	local szStr =  ("themgai1"..tostring(sPlayerInfo.dwTimeStamp )):md5();
	if not szStr:lead(szSign) then
		_info("szSign Error!! ",szSign,szStr);
		return -2; 
	end;
	CGameService:BindAccount(netObj,dwAccountID);	--绑定账号 
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
	sPlayerInfo.szSign = info.szSign; --玩家验证信息
	sPlayerInfo.dwGold = info.dwGold; --玩家的元宝信息 
	--验证玩家信息
	local szStr = sPlayerInfo.szSign;
	if szSign ~= szStr then
		_info("CrossCreatePlayer szSign Error!! ",szSign,szStr);
		return -2; 
	end;
	CGameService:BindAccount(netObj,dwAccountID);	--绑定账号 
	
	local objPlayer = self.setAllPlayer[dwAccountID];
	if objPlayer ~= nil then
		_info('Player is Exists:',dwAccountID);--玩家已经在线
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
		--通知KS,Client连接成功
		CKernelApp.CreatePlayerSystemMsg{ AccountID = dwAccID,IsChangeLine = sPlayerInfo.IsChangeLine };
	end;
end;

-------------------------------------------------------------------
------------------------*******跨服战场**********------------------
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
		--通知KS,Client连接成功
		CKernelApp.CrossCreatePlayerSystemMsg{ AccountID = dwAccID,IsChangeLine = sPlayerInfo.IsChangeLine };
	end;
end;
-------------------------------------------------------------------
----------------------------**********------------------------------
-------------------------------------------------------------------

--添加一个玩家
function CPlayerManager:AddPlayer(objPlayer) 
	self.setAllPlayer[objPlayer:GetAccountID()] = objPlayer;
	self.setAllPlayerByRoleID[objPlayer:GetRoleID()] = objPlayer;
	self.setAllPlayerByRoleName[objPlayer:GetName()] = objPlayer;
	CMemoryDebug:AddObject("ObjPlayer",objPlayer);
    self.CurPlayerNum = self.CurPlayerNum + 1;
	return objPlayer;
end;

--删除一个玩家，玩家下线
function CPlayerManager:DelPlayer(dwAccountID,bIsChangeLine)
    --需要删除玩家的时候，这里要调用一下释放
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
		--处理角色的同步
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
		--处理好友系统
		CKernelApp.GSPlayerLogoutMsg{RoleId = objPlayer:GetRoleID()};
		--CFriendManager:DelFriendSystem(objPlayer:GetRoleID(), objPlayer:GetInfo().szRoleName );--将自己从全局管理器注销
		--处理队伍系统
		objPlayer:GetSystem("CTeamSystem"):ExitTeam(false);
		--处理摊位
		CPlayerShopManager:DelShop(objPlayer:GetRoleID());
		--处理结婚
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
		--暂时在原服务器存储玩家数据
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

--强制删除一个玩家
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

--更具玩家角色id取玩家
function CPlayerManager:GetPlayerByRoleID(dwRoleID)
	return self.setAllPlayerByRoleID[dwRoleID];
end;
--更具玩家角色名取玩家
function CPlayerManager:GetPlayerByRoleName(szRoleName)
	return self.setAllPlayerByRoleName[szRoleName];
end;
--获取当前在线的玩家的ID列表，key是序号，value是玩家的RoleID
function CPlayerManager:GetAllPlayerRoleIDs()
	local ids = {}
	for dwRoleID,value in pairs(self.setAllPlayerByRoleID) do
		table.insert( ids, dwRoleID );
	end
	return ids;
end
--正在存储数据库的玩家
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

--回连KS之后，发送角色信息到KS
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

--重连后，KS已经创建角色，各个系统发送自己的数据到KS
function CPlayerManager:DoneWithReConnectSystem()
	for dwAccountID,objPlayer in pairs(self.setAllPlayer)do
		objPlayer.objSystemMgr:KSReConnect();
	end
end;


