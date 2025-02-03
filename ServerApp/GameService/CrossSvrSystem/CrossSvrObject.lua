_G.CCrossSvrObject = {};

function CCrossSvrObject:new()
	local obj = {};
	obj.setAllMap = {};
	obj.setAllPlayer = {};
	obj.setAllEnterPlayer = {};
	obj.PlayerNum = 0;
	--��ɫ�б�����
	obj.setHarvestList = {};
	obj.PKMode = {};
	
	--ɱ������ͳ�Ʊ�
	--[roleid] = {szRoleName,dwKillTotal,dwKillCombo,dwKillComboMax,dwScore}
	obj.setRoleFightInfo = {};
	obj.setCrossSortByKillTotle = {};
	obj.setSortByKillComboMax = {};
	
	obj.objMyTimer = COwnTimer:new();
	
	obj.setNumberRecord = {};--������
	
	obj.dwCrossUpdateTick = nil;
	obj.dwPlayerUpdateTick = nil;
	
	obj.setRoleLength = {};--��ɫ��ս���е�ʱ��
	
	--����ȷ�Ͻ�ɫΨһ�ԵĲ���
	obj.dwMaxIndex = 1;
	obj.setRole2Index = {};
	obj.setIndex2Role = {};
	
	--������Ʒ��� (������ ���콣...��
	--  -1 Ϊ��ЧroleId
	obj.itemHoldRoleId = -1;
	obj.itemGetRoleId = -1;
	
	--���ս��ʼʱ��	
	obj.dwStartTime = 0;
	
	--��������ֵ
	obj.dwHonor = {};
	for i,v in pairs(CCrossSvrObject) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CCrossSvrObject:Update(dwInv)
	self.objMyTimer:Update(dwInv);

    local dwIndex = self.setKickAllPlayerIndex;
    if dwIndex ~= nil and dwIndex > 0 then
        local setData = self.setKickAllPlayerData;
        for i = 1, 10 do
            dwIndex = dwIndex - 1;
            if setData[dwIndex] then
                self:KickPlayer(setData[dwIndex]);
            else
                setData = nil;
                self:EventGameOver();
                self.bStart = false;
                break;
            end
        end
        self.setKickAllPlayerData = setData;
        self.setKickAllPlayerIndex = dwIndex;
    end
end

--��տ��ս����
function CCrossSvrObject:ClearCrossData()
	self:KickAllPlayer();
end;

--�߳�ȫ����ɫ
function CCrossSvrObject:KickAllPlayer()
    local setData = {};
    local dwIndex = 1;
	for dwRoleID, objPlayer in pairs(self.setAllEnterPlayer) do
        setData[dwIndex] = objPlayer;
        dwIndex = dwIndex + 1;
	end
    self.setKickAllPlayerData = setData;
    self.setKickAllPlayerIndex = dwIndex;
end;

function CCrossSvrObject:KickPlayer(objPlayer)
    local b, s = pcall(
        function()
            local dwRoleID = objPlayer:GetRoleID();
            if self.setAllPlayer[dwRoleID] then
                self.setAllPlayer[dwRoleID]:
                    GetSystem("CCrossSvrSystem"):ReqExitCross(true);
            else
                self:KickOfflinePlayer(objPlayer);
            end
        end
    );
    if not b then
        _err("[CrossService]", s);
    end
end

--�߳������߽�ɫ
function CCrossSvrObject:KickOfflinePlayer(objPlayer)
	local dwRoleID = objPlayer:GetRoleID()
    local dwLength = self:GetRoleLength(dwRoleID);
    local dwExp = _G.Function.Exp(objPlayer, dwLength);
    local dwAccountId = objPlayer:GetAccountID();
    local dwHoldId, dwHoldAccountId, dwHoldName = self:GetItemRoleID();
    local corssSvrCfg = _G.CrossSvrConfig[self.dwCfgID];
    local dwHonorValue = self:GetHonorById(dwRoleID);
    dwHonorValue = dwHonorValue + corssSvrCfg.BaseHonor;
    if dwHonorValue > corssSvrCfg.MaxHonor then
        dwHonorValue = corssSvrCfg.MaxHonor;
    end
	_info("CCrossSvrObject:KickOfflinePlayer=======", dwHonorValue, dwAccountId);
    local info = {
        dwCrossId = self.dwCfgID;
        dwHoldId = dwHoldId;
        dwHoldAccountId = dwHoldAccountId;
        dwHoldName = dwHoldName;
        bOver = true;
        dwHonorValue = dwHonorValue;
        dwExp = dwExp;
		bIsOfflinePlayer = true;
    };
	info.dwKillerNum = self:GetPlayerKillNum(dwRoleID);
	info.dwRank = self:GetPlayerKillIndex(dwRoleID);
    _callouttoline("SendCrossOverMsg", 
        {
            AccId = objPlayer:GetAccountID(), 
            RoleId = objPlayer:GetRoleID(), 
            Honor = dwHonorValue, 
            Exp = dwExp
        }, 
        0, 
        CCrossSvrManager.NetTbl[objPlayer:GetAccountID()]);
    CKernelApp.SendExitCrossMsg{Info = info, 
        RoleId = objPlayer:GetRoleID(), 
        AccID = objPlayer:GetAccountID(), 
        Flag = false};
    _info("[CrossService] KickOfflinePlayer", 
        objPlayer:GetAccountID(), 
        objPlayer:GetRoleID());
end

function CCrossSvrObject:EventGameOver()
	local tbCfg = _G.CrossSvrConfig[self.dwCfgID];
	if tbCfg then
		if tbCfg.EventGameOver then
			tbCfg:EventGameOver(self);
		end
	end;
	self.setAllPlayer = {};
	self.setAllEnterPlayer = {};
	--��ɫ�б�����
	self.setHarvestList = {};
	
	--ɱ������ͳ�Ʊ�
	self.setRoleFightInfo = {};
	
	self.setCrossSortByKillTotle = {};
	self.setSortByKillComboMax = {};
	
	self.setNumberRecord = {};--������
	
	self.dwCrossUpdateTick = nil;
	self.dwPlayerUpdateTick = nil;
	
	self.setRoleLength = {};--��ɫ��ս���е�ʱ��
	
	--����ȷ�Ͻ�ɫΨһ�ԵĲ���
	self.dwMaxIndex = 1;
	self.setRole2Index = {};
	self.setIndex2Role = {};
	
	--��������ֵ
	self.dwHonor = {};
end;

--��ȡtable�������key+value
local function GetRandTableValue(tb)
	local dwMax = 0;
	
	for k,v in pairs(tb)do
		dwMax = dwMax + 1000;
	end
	
	local dwRand = math.random(dwMax);
	dwMax = 0;
	
	for k,v in pairs(tb)do
		dwMax = dwMax + 1000;
		if dwRand <= dwMax then
			return k,v;
		end
	end
	
	return nil,nil
end;

-----------------------------------------------------------------------------------------------------
----------------------------------------���ÿ��ս���ص�---------------------------------------------
-----------------------------------------------------------------------------------------------------
--����ս����Update�ص���ʱ�伶��
function CCrossSvrObject:SetUpdateTimeForPlayer(dwTime)
	self.dwPlayerUpdateTick = dwTime;
end;

function CCrossSvrObject:SetUpdateTimeForCross(dwTime)
	self.dwCrossUpdateTick = dwTime;
end;

function CCrossSvrObject:BeginCrossUpdate()
	 if self.dwCrossUpdateTick then
		self.objMyTimer:AddEvent(self.dwCrossUpdateTick,function()
			self:EventUpdateForCross()
		end);
	 end
end;

function CCrossSvrObject:BeginPlayerUpdate(dwRoleID)
	if self.dwPlayerUpdateTick then
		local dwMyIndex = self.setRole2Index[dwRoleID];
		if dwMyIndex then
			self.objMyTimer:AddEvent(self.dwPlayerUpdateTick,function()
				self:EventUpdateForPlayer(dwRoleID,dwMyIndex)
			end);
		end
	end
end;

function CCrossSvrObject:EventUpdateForCross()
	local cfgCross = CrossSvrConfig[self.dwCfgID];
	if cfgCross and cfgCross.UpdateForCross then
		cfgCross:UpdateForCross(self);
	end
	
	self:BeginCrossUpdate();
end;

-------------------------------------��ʼ�����ս��---------------------------------
------------------------------------------------------------------------------------
function CCrossSvrObject:Init(dwCfgID)
	self.dwCfgID = dwCfgID;
	self:CreateOwnMap();
end;

--��ȡһ�����ս��ͼID�������ID
function CCrossSvrObject:GetEnterMap()
	local tbCfg = _G.CrossSvrConfig[self.dwCfgID];
	
	local tbEnterMap = tbCfg.EnterMapSet;
	
	local dwMap,tbPoint = GetRandTableValue(tbEnterMap);
	if not tbPoint then
		return;
	end
	
	local _,dwPointIndex = GetRandTableValue(tbPoint);
	
	return dwMap,dwPointIndex;
end;

function CCrossSvrObject:CreateOwnMap()
	local tbCfg = CrossSvrConfig[self.dwCfgID];
	if not tbCfg then
		return;
	end;
	for n,dwMapID in pairs(tbCfg.MapSet)do
		local map = MapInfoConfig[dwMapID]; 
		if map and type(map) == "table" then
			local objMap = CMap:new(dwMapID, map.dwMapType, map.szMapCog,map.dwHeight,CKernelApp.dwLineID);
			if not objMap then
				_info("objMap is null by CCrossSvrObject:CreateOwnMap( )");
				return false;
			end;
			if not objMap:Create() then
				_info("map:Create() is null by CCrossSvrObject:CreateOwnMap( )");
				return false;
			end;
			CMapManager:AddMap(objMap);
			self.setAllMap[dwMapID] = objMap;
		end
	end
end;

function CCrossSvrObject:IsOpen()
	return true;
end;

--��ҽ�����ս��
function CCrossSvrObject:EnterPlayer(objPlayer)
	if self.setAllPlayer[objPlayer:GetRoleID()] then
        self.setAllEnterPlayer[objPlayer:GetRoleID()] = objPlayer;
        self.setAllPlayer[objPlayer:GetRoleID()] = objPlayer;
		return;
	end;
	--��¼���н��������
	self.setAllEnterPlayer[objPlayer:GetRoleID()] = objPlayer
	self.setAllPlayer[objPlayer:GetRoleID()] = objPlayer;
	self.PlayerNum = self.PlayerNum + 1;
	objPlayer:GetSystem("CCrossSvrSystem"):EnterCross(self.dwCfgID);
	CKernelApp.SendCrossNumMsg{CrossId = self.dwCfgID, LineId = CKernelApp.dwLineID, PlayerNum = self.PlayerNum};
	self:EventPlayerEnter(objPlayer);
    if not self.setRoleFightInfo[objPlayer:GetRoleID()] then
		self:CreateKillInfo(objPlayer:GetRoleID(), objPlayer:GetName());
	end
    CCSKillChartSystemManager:SendChartList(objPlayer);
end;

function CCrossSvrObject:EventGameStart()
	local cfgCross = CrossSvrConfig[self.dwCfgID];
	if not cfgCross then
		return;
	end
	self.dwBeginTime = GetCurTime();
	if cfgCross.EventGameStart then
		cfgCross:EventGameStart(self);
	end
	self.bStart = true;
	self:BeginCrossUpdate();
end;

--��Ҫ��Ӧ���¼�
function CCrossSvrObject:EventPlayerEnter(objPlayer)
	local cfgCross = CrossSvrConfig[self.dwCfgID];
	if cfgCross and cfgCross.EventEnterPlayer then
		cfgCross:EventEnterPlayer(self,objPlayer);
	end
	
	local dwRoleID = objPlayer:GetRoleID();
	
	--����ɫ����һ��index
	self.setRole2Index[dwRoleID] = self.dwMaxIndex;
	self.setIndex2Role[self.dwMaxIndex] = dwRoleID;
	self:BeginPlayerUpdate(dwRoleID,self.dwMaxIndex);
	self.dwMaxIndex = self.dwMaxIndex + 1;
end;

function CCrossSvrObject:ExitPlayer(objPlayer)
	if not self.setAllPlayer[objPlayer:GetRoleID()] then
		return;
	end;
	local stateSystem = objPlayer:GetSystem("CStateSystem")
	stateSystem:ChangeState(enPlayerState.ePS_Normal);
	local mountSystem = objPlayer:GetSystem("CMountSystem");
	mountSystem:RideDown();
	self.setAllPlayer[objPlayer:GetRoleID()] = nil;
	self.PlayerNum = self.PlayerNum - 1;
	objPlayer:GetSystem("CCrossSvrSystem"):ExitCross();
	CKernelApp.SendCrossNumMsg{CrossId = self.dwCfgID, LineId = CKernelApp.dwLineID, PlayerNum = self.PlayerNum};
	self:EventPlayerExit(objPlayer);
end;

function CCrossSvrObject:EventPlayerExit(objPlayer)
	local cfgCross = CrossSvrConfig[self.dwCfgID];
	if cfgCross and cfgCross.EventExitPlayer then
		cfgCross:EventExitPlayer(self,objPlayer);
	end
	local dwRoleID = objPlayer:GetRoleID();
	--�ջؽ�ɫ��index
	local dwMyIndex = self.setRole2Index[dwRoleID];
	if dwMyIndex then
		self.setIndex2Role[dwMyIndex] = nil;
	end
	self.PlayerNum = self.PlayerNum - 1;
	self.setRole2Index[dwRoleID] = nil;
end;

--���¿��ս�������
function CCrossSvrObject:EventUpdateForPlayer(dwRoleID,dwMyIndex)
	--��ɫ��Ч���ж�
	if self.setIndex2Role[dwMyIndex] ~= dwRoleID then
		return;
	end
	if self.setRole2Index[dwRoleID] ~= dwMyIndex then
		return;
	end
	
	local objPlayer = CMapManager:GetPlayer(dwRoleID)
	if not objPlayer then
		return;
	end

	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return;
	end
	local tbScript = CScriptManager:GetScript(5,objMapSys.dwCurMapID);
	if tbScript and tbScript.UpdateForPlayer then
		tbScript:UpdateForPlayer(self,objPlayer);
	end
	
	self:BeginPlayerUpdate(dwRoleID,dwMyIndex);
end;

--ս����ɱ����
function CCrossSvrObject:EventKillPlayer(objKiller,objDeader)
	--����������ڳ��������� 
	self:ItemHoldBreak(objDeader);
	
	local killerID = objKiller:GetRoleID();
	local deadID = objDeader:GetRoleID();
	if(not self.setAllPlayer[killerID] or not self.setAllPlayer[deadID]) then
		return ;---�쳣����
	end
	
	if(killerID == deadID) then
		return;
	end
	self:ClearCrossKillNumCon(objDeader); ----��������ߵ���ն��
	-----��ɱ��ȡ����ֵ
	local cfgCross = CrossSvrConfig[self.dwCfgID];
	local dwHonorValue = 0; ----��ʱ����
	if cfgCross and cfgCross.EventKillPlayer then
		dwHonorValue = cfgCross:EventKillPlayer(self,objKiller,objDeader);
	end
	-----��¼����ֵ
    self:SetHonorById(killerID, dwHonorValue);
    CCSKillChartSystemManager:Trigger(objKiller);
	----��¼��ɱ��
	self:AddCrossKillNumAll(objKiller);
	----��¼��ն��
	self:AddCrossKillNumCon(objKiller);
	----������Ϣ���ͻ���
	local killTotal = self.setRoleFightInfo[killerID].dwKillTotal ;
	local killCombo = self.setRoleFightInfo[killerID].dwKillComboMax;
	local OwnerHonor = self.dwHonor[killerID];
	objKiller:GetSystem("CCrossSvrSystem"):SendMyKillNum(killTotal,killCombo,OwnerHonor);
end;

--��������ֵ
function CCrossSvrObject:GetHonorById(dwRoleID)
	return self.dwHonor[dwRoleID] or 0;
end;

--��������ֵ
function CCrossSvrObject:SetHonorById(dwRoleID, dwHonorValue)
	if not self.dwHonor[dwRoleID] then
		self.dwHonor[dwRoleID] = dwHonorValue;
	else
		self.dwHonor[dwRoleID] = self.dwHonor[dwRoleID] + dwHonorValue;
	end;
end;

---------------------------------------------------------------------
---------------------------------------------------------------------
function CCrossSvrObject:SetRoleTime(objPlayer)
	local dwRoleID = objPlayer:GetRoleID();
	if not self.setRoleLength[dwRoleID] then
		self.setRoleLength[dwRoleID] = {};
	end
	
	self.setRoleLength[dwRoleID].dwLength = self.setRoleLength[dwRoleID].dwLength or 0;
	--self.setRoleLength[dwRoleID].dwGetCode = self.setRoleLength[dwRoleID].dwGetCode or 0;
	self.setRoleLength[dwRoleID].dwEnterTime = GetCurTime();
end;

function CCrossSvrObject:RoleLeaveCross(objPlayer)
	local dwRoleID = objPlayer:GetRoleID();
	if not self.setRoleLength[dwRoleID] then
		return;
	end
	
	local dwLength = GetCurTime() - self.setRoleLength[dwRoleID].dwEnterTime;
	self.setRoleLength[dwRoleID].dwLength = self.setRoleLength[dwRoleID].dwLength + dwLength;
end;

function CCrossSvrObject:GetRoleLength(dwRoleID)
	if not self.setRoleLength[dwRoleID] then
		return 0;
	end
	local dwLength = self.setRoleLength[dwRoleID].dwLength;
	dwLength = dwLength + (GetCurTime() - self.setRoleLength[dwRoleID].dwEnterTime);
	
	return dwLength;
end;

-------------------------------------------------------------------------------------------
---------------------------------------ɱ�˰�----------------------------------------------
-------------------------------------------------------------------------------------------
--��ʼ�����ɱ����Ϣ
function CCrossSvrObject:CreateKillInfo(dwRoleID,szName)
	self.setRoleFightInfo[dwRoleID] = {};
    self.setRoleFightInfo[dwRoleID].dwRoleID = dwRoleID;
	self.setRoleFightInfo[dwRoleID].szRoleName = szName;
	self.setRoleFightInfo[dwRoleID].dwKillTotal = 0;
	self.setRoleFightInfo[dwRoleID].dwKillCombo = 0;
	self.setRoleFightInfo[dwRoleID].dwKillComboMax = 0;
	self.setRoleFightInfo[dwRoleID].dwScore = 0;
	self.setRoleFightInfo[dwRoleID].selfIndex = 0;-----ɱ�����а��Լ�������
end;

--�޸����ɱ����Ϣ
--��ɱ��������
function CCrossSvrObject:AddCrossKillNumAll(objPlayer)
	local dwRoleID = objPlayer:GetRoleID();
	self.setRoleFightInfo[dwRoleID].dwKillTotal = self.setRoleFightInfo[dwRoleID].dwKillTotal + 1;
end;

--��ɱ������
function CCrossSvrObject:AddCrossKillNumCon(objPlayer)
	local dwRoleID = objPlayer:GetRoleID();
	
	self.setRoleFightInfo[dwRoleID].dwKillCombo = self.setRoleFightInfo[dwRoleID].dwKillCombo + 1;
	if self.setRoleFightInfo[dwRoleID].dwKillCombo > self.setRoleFightInfo[dwRoleID].dwKillComboMax then
		self.setRoleFightInfo[dwRoleID].dwKillComboMax = self.setRoleFightInfo[dwRoleID].dwKillCombo;
	end
end;

--�����ɱ��
function CCrossSvrObject:ClearCrossKillNumCon(objPlayer)
	local dwRoleID = objPlayer:GetRoleID();
	
	if not self.setRoleFightInfo[dwRoleID] then
		return;--����ǳ�ʼ��û�иı�Ͳ���Ҫ��¼��
	end
	self.setRoleFightInfo[dwRoleID].dwKillCombo = 0;
end;

--�����������߼�
-------------------------------------------------------------------
--���߳��п�ʼ
function CCrossSvrObject:ItemHoldBegin(objPlayer)
	if self.itemHoldRoleId == -1 then
		local roleId = objPlayer:GetRoleID();
		local accountId = objPlayer:GetAccountID();
		local roleName = objPlayer:GetName();
		
        self:SetItemHoldRoleID(roleId, accountId, roleName);
        CCSKillChartSystemManager:Trigger(objPlayer);

		--��ʱ��ʼ 
		local corssSvrCfg = _G.CrossSvrConfig[self.dwCfgID];
		local holdTime = corssSvrCfg.ItemHoldTime;
		self.holdTaskId = _G.CAlarmClock:AddTask({}, _G.CAlarmTaskCycleType.eMinute, holdTime, 1,
		function()
			self:ItemHoldFlish(objPlayer)
		end,
		{});
	
	
		--���м�����֮�󷢹㲥
		self.itemBoradcastId = _G.CAlarmClock:AddTask({}, _G.CAlarmTaskCycleType.eMinute, corssSvrCfg.ItemBroadcastTime, 1,
		function()
			--���͹㲥
			local corssSvrCfg = _G.CrossSvrConfig[self.dwCfgID];
			local msg = string.format(SysStringConfigInfo[13009300006], roleName, corssSvrCfg.ItemBroadcastTime);
			self:SendCrossMsgToPlayer(msg);
		end,
		{});
		
		objPlayer:GetSystem("CCrossSvrSystem"):SendItemHoldState(1);
		objPlayer:AddViewModel(corssSvrCfg.ItemModelId);
		objPlayer:AddViewPfx(corssSvrCfg.ItemPfxId);
	else
		_err("CCrossSvrObject:ItemHoldBegin------item has a holder!");
	end
end

--���߳��б����
function CCrossSvrObject:ItemHoldBreak(objPlayer)
	local roleId = objPlayer:GetRoleID();
	
	if self.itemHoldRoleId == roleId then
		self.itemHoldRoleId = -1;
		self.itemHoldAccountId = -1;
		self.itemHoldName = "";
		_G.CAlarmClock:DelTask(self.holdTaskId);
		_G.CAlarmClock:DelTask(self.itemBoradcastId);
		objPlayer:GetSystem("CCrossSvrSystem"):SendItemHoldState(2);
		
		--ˢ��������
		local cfgCross = CrossSvrConfig[self.dwCfgID];
		if cfgCross and cfgCross.ReflushItem then
			cfgCross:ReflushItem(objPlayer);
		end
		
		objPlayer:RmvViewModel(cfgCross.ItemModelId)
		objPlayer:RmvViewPfx(cfgCross.ItemPfxId)
	end
end

--��õ���
function CCrossSvrObject:ItemHoldFlish(objPlayer)
	if self.itemGetRoleId == -1 then
		
		local roleId = objPlayer:GetRoleID();
		local accountId = objPlayer:GetAccountID();
		local roleName = objPlayer:GetName();
		self:SetItemGetRoleID(roleId, accountId, roleName);
		
        CCSKillChartSystemManager:Trigger(objPlayer);
		
		self.itemHoldRoleId = -1;
		objPlayer:GetSystem("CCrossSvrSystem"):SendItemHoldState(3);
		
		local cfgCross = CrossSvrConfig[self.dwCfgID];
		objPlayer:RmvViewModel(cfgCross.ItemModelId);
		objPlayer:RmvViewPfx(cfgCross.ItemPfxId)
		
		--���͹㲥
		local corssSvrCfg = _G.CrossSvrConfig[self.dwCfgID];
		local msg = string.format(SysStringConfigInfo[13009300005], roleName, corssSvrCfg.ItemHoldTime);
		self:SendCrossMsgToPlayer(msg);
		
		--��ǰ����������������ݿ�
		CKernelApp.AHeadGetSwordMsg{CrossId = self.dwCfgID, HoldId = self.itemGetRoleId, HoldAccountId = self.itemGetAccountId, HoldName = self.itemGetName};
	else
		_err("CCrossSvrObject:ItemHoldFlish------item has a player!")
	end
end

--ս������ʱ����
--�������-1 ������û����������Ʒ 
function CCrossSvrObject:GetItemRoleID()
	if self.itemGetRoleId ~= -1 then
		return self.itemGetRoleId, self.itemGetAccountId, self.itemGetName;
	end
	
	return	self.itemHoldRoleId, self.itemHoldAccountId, self.itemHoldName;
end

-- ����������������
function CCrossSvrObject:SetItemHoldRoleID(dwRoleID, dwAccountID, szRoleName)
    self.itemHoldRoleId = dwRoleID;
    self.itemHoldAccountId = dwAccountID;
    self.itemHoldName = szRoleName;
end

-- ���������������
function CCrossSvrObject:SetItemGetRoleID(dwRoleID, dwAccountID, szRoleName)
    self.itemGetRoleId = dwRoleID;
    self.itemGetAccountId = dwAccountID;
    self.itemGetName = szRoleName;
end

----��ȡ���ս����Ϣ
function CCrossSvrObject:GetRoleFightInfo(RoleID)
    if (not self.setRoleFightInfo[RoleID]) then
        return {};
    end
    return self.setRoleFightInfo[RoleID];
end

----��ȡ���ɱ�����а�����
function CCrossSvrObject:GetPlayerKillIndex(RoleID)
	return CCSKillChartSystemManager:FindMemberRank(RoleID);
end

----��ȡ���ɱ����
function CCrossSvrObject:GetPlayerKillNum(RoleID)
	if(not self.setRoleFightInfo[RoleID]) then
		return 0;
	end
	return self.setRoleFightInfo[RoleID].dwKillTotal;
end

--�����ս������ҷ��͵���Ϣ
function CCrossSvrObject:SendCrossMsgToPlayer(szStr)
	--ֻ��ʾ�㲥��Ϣ
	CScriptManager:ChatNotice("",nil,false,{},szStr)
end;
