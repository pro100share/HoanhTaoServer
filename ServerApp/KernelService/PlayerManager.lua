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

CPlayerManager.setAllPlayer = {};		--用来保存所有玩家，这里是网络玩家，不属于逻辑玩家
CPlayerManager.setAllPlayerByRoleID = {};	

CPlayerManager.setEnterCrossPlayer = {};
CPlayerManager.setNoticeMethod = {}; 
CPlayerManager.setAllPlayerByRoleName = setmetatable({},{__mode="v"});--[szRoleName] = objPlayer

function CPlayerManager:Create()
    if not CConfig.bIsCrossSvr then
        self.dwHostInfoID = CConfig.RoleDB.dwDBRoleMaxCount * CConfig.Network.dwServerHostID; 
        local dwMaxRoleID = CPlayerDBQuery:GetMaxRoleID(self.dwHostInfoID,CConfig.RoleDB.dwDBRoleMaxCount) or 1;
        self.dwCurRoleID = math.mod(dwMaxRoleID,CConfig.RoleDB.dwDBRoleMaxCount);
    end

	self.lastPrintTime = os.now(1) + 30;
	self.dwMaxCount = 0;
	CMemoryDebug:Show("ObjPlayer");

    self:CreateLoginGuard();
    
    return true;
end; 

function CPlayerManager:Update(dwInterval)
    if os.now(1) >  self.lastPrintTime then
        _info("======================================");
        _info("======================================");
        _info("cur Player :",self.dwMaxCount);
        for i,v in pairs(CGameLineManager.setAllGameLine) do
            _info("line player ("..i..") count:("..v.dwCurPlayerCount..")");
        end; 
        _info("======================================");
        _info("======================================");
        self.lastPrintTime = os.now(1) + 5;
		--dll add 2013-3-22
		CLogSystemManager:online(self.dwMaxCount,self.dwMaxCount);
    end;--]]

    self:SeeLogout();

   return true;
end;

function CPlayerManager:Destroy()
    self:DestroyLoginGuard();

	for I,Player in pairs(self.setAllPlayer)do
		Player:Destroy();
	end;
end; 

function CPlayerManager:SetEnterCrossPlayer(dwAccountID, bEnterFlag)
	CPlayerManager.setEnterCrossPlayer[dwAccountID] = bEnterFlag;
end;

--创建一个玩家
function CPlayerManager:CreatePlayer(dwAccountID,dwAdultFlag,sIP)
	local objPlayer = self.setAllPlayer[dwAccountID];
	if objPlayer ~= nil then
		_info('Player is Exists:',dwAccountID);--玩家已经在线
		return nil;
	end;
	local dwGold,bIsGM = CAccountDBQuery:GetGoldByAccountID(dwAccountID);
	if dwGold < 0 then
		_err('dwGold < 0 error:',dwAccountID);--玩家已经在线
		--dwGold = 100000;
		return nil;
	end;
	objPlayer = CPlayer:new(dwAccountID,CPlayerDBQuery:GetDBQuery(),dwAdultFlag,dwGold,bIsGM,sIP);
	if objPlayer == nil then
	    _info('Create Player Obj Error');
		return nil;
	end;
	CMemoryDebug:AddObject("ObjPlayer",objPlayer);
	return objPlayer;
end;  

function _G.checkGSUser(_args) 
	 _args.user = CPlayerManager:GetPlayer(_args._aid);
end; 

 
function CPlayerManager:GetCurRoleID()
	self.dwCurRoleID = self.dwCurRoleID+1;
	return self.dwCurRoleID + self.dwHostInfoID;
end;

--添加一个玩家
function CPlayerManager:AddPlayer(objPlayer) 
	if not objPlayer:Create() then
		_info('Player Do Create Func Error');
		return nil;
	end;
	if self.setAllPlayer[objPlayer:GetAccountID()] then
		_info('Player exists !!!!');
		return nil;
	end;
	self.setAllPlayer[objPlayer:GetAccountID()] = objPlayer;
    self.dwMaxCount = self.dwMaxCount + 1;
	return objPlayer;
end;

--删除一个玩家，玩家下线
function CPlayerManager:DelPlayer(dwAccountID)

	-- CLoginCall.setRoleLoadEnd[dwAccountID] = nil;
	-- CLoginCall.setGSReady[dwAccountID] = nil;
    --需要删除玩家的时候，这里要调用一下释放
	if not dwAccountID then
		_info("CPlayerManager:DelPlayer objPlayer dwAccountID null");
		return;
	end;
	CGameLineManager:DelTempPlayer(dwAccountID);
    local objPlayer = self.setAllPlayer[dwAccountID];
	if not objPlayer then
		_info("CPlayerManager:DelPlayer objPlayer null");
		return;
	end;
	
	if objPlayer.bLoginKick then
		_info("==LoginStep==7==", dwAccountID);
		--CLoginApp.OnKSLoginCheckOverMsg{AccountID = dwAccountID};
        self:CheckLogoutSend(dwAccountID);
	end
	
	self.setAllPlayerByRoleID[objPlayer:GetRoleID()] = nil;
	self.setAllPlayerByRoleName[objPlayer:GetInfo().szRoleName] = nil;
	self.setAllPlayer[dwAccountID] = nil;
	
	objPlayer:Destroy();
	objPlayer = nil;

	CTransitManager:ClearData(dwAccountID)
    self.dwMaxCount = self.dwMaxCount - 1;
end;

function CPlayerManager:AddPlayerToRoleList(objPlayer)
	self.setAllPlayerByRoleID[objPlayer:GetRoleID()] = objPlayer;
	self.setAllPlayerByRoleName[objPlayer:GetInfo().szRoleName] = objPlayer
	
	--角色上线，则离线数据就要清除掉
	COfflineInfoManager:DoneWithLogin(objPlayer:GetRoleID())
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
------
--接口：踢人下线by RoleID
function CPlayerManager:KickPlayerDownByRoleID(nRoleID)
	_info("want kick player down by roleID", nRoleID);
	local objUser = self:GetPlayerByRoleID(nRoleID);
	if objUser then
		local nAccID = objUser:GetAccountID()
		return self:KickPlayerDownByAccID(nAccID);
	end;
	return false;
end;
--接口：踢人下线by AccID
function CPlayerManager:KickPlayerDownByAccID(nAccID)
	_info("want kick player down by accID", nAccID);
	local objUser = self:GetPlayer(nAccID); 
	if objUser then
		if objUser.objLine then
			objUser.objLine.DelReplaceUserMsg{AccountID =nAccID};
		else 
			CPlayerManager:DelPlayer(nAccID);
		end;
		_info("kick player down by accID success", nAccID);
		return true;
	end;
	return false;
end;

--接口：封号by dwRoleID
function CPlayerManager:LockPlayerDownByRoleID(dwRoleID,dwTime,szReason)
	local dbTableName = "T_Role_Info"
	local SqlCmd = CPlayerDBQuery.objDBQuery:CreateUpdateCmd(dbTableName);
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	local Pack = {}
	Pack.dwLockStart = _now()
	Pack.dwLockTime = dwTime or 0
	Pack.szLockReason = szReason or ""
	
	SqlCmd.Fields = Pack
	local res = SqlCmd:execute()
	
	self:KickPlayerDownByRoleID(dwRoleID)
	return res
end

--接口：封号by dwRoleName
function CPlayerManager:LockPlayerDownByRoleName(szRoleName,dwTime,szReason)
	local dbTableName = "T_Role_Info"
	local SqlCmd = CPlayerDBQuery.objDBQuery:CreateUpdateCmd(dbTableName);
	SqlCmd.Wheres.szRoleName = szRoleName;
	local Pack = {}
	Pack.dwLockStart = _now()
	Pack.dwLockTime = dwTime or 0
	Pack.szLockReason = szReason or ""
	
	SqlCmd.Fields = Pack
	local res = SqlCmd:execute()
	local objPlayer = self:GetPlayerByRoleName(szRoleName)
	if objPlayer then
		local nAccID = objPlayer:GetAccountID()
		self:KickPlayerDownByAccID(nAccID)
	end
	return res
end


--
function CPlayerManager:CheckLogin(dwAccountID)
	local objRole = self.setAllPlayer[dwAccountID];
	if not objRole then
		_info("==LoginStep==4==", dwAccountID);
		return true;
	end
	  -- --在ks， 在跨服战场
	-- if CPlayerManager.setEnterCrossPlayer[dwAccountID] then
		-- _info("==LoginStep==4=1=", dwAccountID);
		-- objRole.DelReplaceUserMsg{AccountID = dwAccountID};
		-- objRole.bLoginKick = true;
		-- return false;
	-- end;
	
	if objRole.dwStateInKS < PlayerStateInKS.PSK_GS_GAMING then
		local objLine = CGameLineManager:GetLine(objRole.dwTempLine);
		if not objLine then 
			self:DelPlayer(dwAccountID);
			return true;
		end;
		objLine.DelReplaceUserMsg{AccountID = dwAccountID};
	else
		objRole.DelReplaceUserMsg{AccountID = dwAccountID};
	end;
	objRole.bLoginKick = true;
	return false;
	--[[
	if objRole.dwStateInKS == PlayerStateInKS.PSK_GS_GAMING then
		_info("==LoginStep==5==", dwAccountID);
		objRole.DelReplaceUserMsg{AccountID = dwAccountID};
	end
	
	objRole.bLoginKick = true;
	_info("user in gameline exists replace user", dwAccountID, objRole.dwStateInKS);
	if objRole.nLoginKickTime then--60秒超时踢人
		if os.now(1) > objRole.nLoginKickTime then
			self:DelPlayer(dwAccountID);
		end;
	else
		objRole.nLoginKickTime = os.now(1) + 60;
	end;
	return nil;--]]
end;

function CPlayerManager:PlayerInGaming(player)
	player.dwStateInKS = PlayerStateInKS.PSK_GS_GAMING;
	if player.bLoginKick then
		player.DelReplaceUserMsg{AccountID = player:GetAccountID()};
	end;
end;

--[[
   [ \brief 检查玩家是否可以登录
   [ \param number nAccountID
   ]]
function CPlayerManager:RoleLoginCheck(nAccountID)
    _info("==LoginStep==3==", nAccountID);
    if CPlayerManager:CheckLogin(nAccountID) then
        _info("==LoginStep==8==", nAccountID);
        self:CheckLogoutSend(nAccountID);
	end
end

--[[
   [ \brief 检查登出结束发送登录通知
   [ \param number nAccountID 账号编号
   ]]
function CPlayerManager:CheckLogoutSend(nAccountID)
    local fLaunch = function(...)
        _KSLoginCheckOverMsg(nAccountID);
    end
    if self:CheckLogout(nAccountID) then
        fLaunch();
    else
        self:WaitLogout(nAccountID, fLaunch);
    end
end

--[[
   [ \brief 玩家登录处理
   [ \param number nAccountID 账号编号
   [ \param number nLoginLine 线路编号
   [ \param number nAdultFlag 防沉迷标识
   [ \param table tRoleInfo 角色信息
   ]]
function CPlayerManager:RoleLogin(
        nAccountID, nLoginLine, nAdultFlag, tRoleInfo)
    if not CGameLineManager:GetLine(nLoginLine) then
        CGameLineManager:SendKSSelectLineResult(nAccountID, 0, -1, szSing)
        return;
    end

    self:Launch(nAccountID, nLoginLine, nAdultFlag, tRoleInfo);
end

--[[
   [ \brief 构建玩家
   [ \param number nAccountID 账号编号
   [ \param number nLoginLine 线路编号
   [ \param number nAdultFlag 防沉迷标识
   [ \param table tRoleInfo 角色信息
   ]]
function CPlayerManager:Launch(
        nAccountID, nLoginLine, nAdultFlag, tRoleInfo)
    local objPlayer = self:CreatePlayer(nAccountID, nAdultFlag);
    if not objPlayer then
        _info("create user error!!!");
        CGameLineManager:SendKSSelectLineResult(nAccountID, 0, -1, szSing)
        return;
    end

    objPlayer = self:AddPlayer(objPlayer);
    if not objPlayer then
        _info("add user error!!!");
        CGameLineManager:SendKSSelectLineResult(nAccountID, 0, -1, szSing)
        return;
    end
    objPlayer.dwStateInKS = PlayerStateInKS.PSK_LIS_CREATE;
    objPlayer:SetInfo(tRoleInfo);
    CLoginCall:DoLogin(objPlayer);
    if not CGameLineManager:SelectGameLine(objPlayer, nLoginLine) then
        self:DelPlayer(nAccountID);
    end
end

function CPlayerManager:ReConnectRole(tbRoleList,objLine)
	for n,tbInfo in pairs(tbRoleList)do
		local objPlayer = self:CreatePlayer(tbInfo.dwAccountID,tbInfo.dwAdultFlag);
		if objPlayer then
			objPlayer:SetInfo(tbInfo);
			self:AddPlayer(objPlayer);
			self:AddPlayerToRoleList(objPlayer)
			
			objPlayer.objSystemMgr:OnRegSystems();
			objPlayer.objSystemMgr:Create();
			
			objPlayer.dwCurLine = objLine:GetID();
			
			CGameLineManager:EnterLine(objPlayer);
			
			objPlayer.objLine = objLine;
			objPlayer.objLineNet = objLine.objNet;
			
			_mycallout(objPlayer);
			objPlayer.dwStateInKS = PlayerStateInKS.PSK_GS_GAMING;
		end
	end
end;

