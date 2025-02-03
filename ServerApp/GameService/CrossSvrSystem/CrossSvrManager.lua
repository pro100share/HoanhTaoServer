_G.CCrossSvrManager = CSingle:new();
CSingleManager:RegistCSSingle(CCrossSvrManager, true);

function CCrossSvrManager:Create()
	self.setAllCrossGame = {}; --��¼���еĿ��ս��
	self.bDataEnd = {};
	self.bConnect = {};
	self.NetTbl = {};
	if not _G.TestVersion then
		self:LoadCreateCross();
		self:HotUpdate();
	else
		self.Flag = false;
		self:TestLoadCreateCross()
	end;
	return true;
end;

--�������ʱ���ȸ���
function CCrossSvrManager:HotUpdate()
	for dwCrossId, cfg in pairs(_G.CrossSvrHotUpdateConfig) do
			local weekTbl = cfg.WeeklyOpenDay;
			for _, week in pairs(weekTbl) do
				--֪ͨ������ʼ
				CAlarmClock:AddTask(
					{dwWeek = week - 1, dwTime = cfg.NoticeStartTime},
					CAlarmTaskCycleType.eWeek, 1, 0,
					function() self:NoticeCrossWillEnter(dwCrossId) end, {}
				);
				--֪ͨ������ʼ
				CAlarmClock:AddTask(
					{dwWeek = week - 1, dwTime = cfg.EnterTime},
					CAlarmTaskCycleType.eWeek, 1, 0,
					function() self:NoticeCrossEnter(dwCrossId) end, {}
				);
				--֪ͨ��������
				CAlarmClock:AddTask(
					{dwWeek = week - 1, dwTime = cfg.StopEnterTime},
					CAlarmTaskCycleType.eWeek, 1, 0,
					function() self:NoticeCrossStopEnter(dwCrossId) end, {}
				);
				--֪ͨ�˳�
				CAlarmClock:AddTask(
					{dwWeek = week - 1, dwTime = cfg.ExitTime},
					CAlarmTaskCycleType.eWeek, 1, 0,
					function() self:NoticeCrossExit(dwCrossId) end, {}
				);
			end;
		end;
end

function CCrossSvrManager:Update(dwInv)
	if _G.TestVersion then
		if self.UpdateTime then	
			self.UpdateTime = self.UpdateTime + dwInv;
			if not self.Flag  then
				if self.UpdateTime >= _G.TestStopTime * 60 * 60 * 1000 then
					--print("============CCrossSvrManager:Update1================");
					self:NoticeCrossStopEnter(10001);
					self.Flag = true;
				end;
			end;
			if self.UpdateTime >= _G.TestTime * 60 * 60 * 1000 then
				self:NoticeCrossExit(10001);
				self.UpdateTime = nil;
			end;
		end;
	end;
	for n,cross in pairs(self.setAllCrossGame)do
		if cross.bStart then
			cross:Update(dwInv);
		end;
	end
	return true;
end;

function CCrossSvrManager:TestLoadCreateCross()
	for dwCrossId, cfg in pairs(_G.CrossSvrHotUpdateConfig) do
		if cfg.CreateTime == -1 then
			self:TextCreateCross(dwCrossId);
		end;
	end;
	self:EventGameStart();
end;

--����ս��
function CCrossSvrManager:TextCreateCross(dwCrossId)
	if self.setAllCrossGame[dwCrossId] then
		--print("has cross game",dwCrossId)
		return;
	end
	local objCross = CCrossSvrObject:new();
	objCross:Init(dwCrossId);
	self.setAllCrossGame[dwCrossId] = objCross;
	CKernelApp.OnKSCreateCrossMsg{ToLineId = CKernelApp.dwLineID, CrossId = dwCrossId, BEnter = true, Type = 13009300002};
	self.UpdateTime = 0;
	return objCross;
end;

function CCrossSvrManager:NoticeCrossWillEnter(dwCrossId)
	CKernelApp.OnKSCreateCrossMsg{ToLineId = CKernelApp.dwLineID, CrossId = dwCrossId, BEnter = true, Type = 13009300001};
end;

--֪ͨ������ս��
function CCrossSvrManager:NoticeCrossEnter(dwCrossId)	
	CKernelApp.OnKSDelCrossInfoMsg{ToLineId = CKernelApp.dwLineID, CrossId = dwCrossId};
	--˵��ս���Ѿ�������
	if self.setAllCrossGame[dwCrossId] then	
		CKernelApp.OnKSCreateCrossMsg{ToLineId = CKernelApp.dwLineID, CrossId = dwCrossId, BEnter = true, Type = 13009300002};
		self.setAllCrossGame[dwCrossId]:EventGameStart();
	end;
end;

--ֹ֪ͨͣ������ս��
function CCrossSvrManager:NoticeCrossStopEnter(dwCrossId)
	if self.setAllCrossGame[dwCrossId] then
		CKernelApp.OnKSCreateCrossMsg{ToLineId = CKernelApp.dwLineID, CrossId = dwCrossId, BEnter = false, Type = 13009400015};
	end;
end;

--֪ͨ�˳����ս��
function CCrossSvrManager:NoticeCrossExit(dwCrossId)
    _info("[CrossService] Finish Start", dwCrossId);
	local objCross = self.setAllCrossGame[dwCrossId];
	if not objCross then
        _err("[CrossService] Cross object is nil");
		return;
	end;
	objCross:ClearCrossData();
    CKernelApp.OnKSDelCrossInfoMsg{ToLineId = CKernelApp.dwLineID, 
        CrossId = dwCrossId};
    _info("[CrossService] Finish End");
end;

function CCrossSvrManager:Destroy()
end;

function CCrossSvrManager:LoadCreateCross()
	for dwCrossId, cfg in pairs(_G.CrossSvrHotUpdateConfig) do
		if cfg.CreateTime == -1 then
			self:CreateCross(dwCrossId);
		end;
	end;
end;

--����ս����ʼ
function CCrossSvrManager:EventGameStart()
	for corssId, crossSvrObj in pairs(self.setAllCrossGame) do
		crossSvrObj:EventGameStart();
	end
end

--����ս��
function CCrossSvrManager:CreateCross(dwCrossId)
	if self.setAllCrossGame[dwCrossId] then
		--print("has cross game",dwCrossId)
		return;
	end
	local objCross = CCrossSvrObject:new();
	objCross:Init(dwCrossId);
	self.setAllCrossGame[dwCrossId] = objCross;
	return objCross;
end;

function CCrossSvrManager:GetCrossObj(dwID)
	return self.setAllCrossGame[dwID];
end;

function CCrossSvrManager:GetStartTime()
	return self.dwStartTime;
end

--������ս��
function CCrossSvrManager:TryEnterCrossChange(objPlayer)
	_info("========TryEnterCrossChange=====");
	local crossSystem = objPlayer:GetSystem("CCrossSvrSystem");
	if not crossSystem then
		return;
	end;
	local dwCrossId = crossSystem.toCrossId;
	local objCross = self:GetCrossObj(dwCrossId);
	_info("========TryEnterCrossChange2=====", objCross);
	if not objCross then
		return;
	end
	--����ط�����ChangeLineEnd�е��õģ�֮��CMapSystem:ExecChangeMap�ᱻ���ã���������Ͳ�������
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return;
	end;
	local dwMapId,dwPointId = objCross:GetEnterMap();
	if (not dwMapId) or (not dwPointId) then
		return;
	end
	local cfgMap = MapInfoConfig[dwMapId];
	if not cfgMap then
		return;
	end

	local newPoint = cfgMap.point[dwPointId];
	objMapSys.dwCurMapID = dwMapId;
	objMapSys.fXPos = newPoint.fXPos + math.random(-newPoint.fRange,newPoint.fRange);
	objMapSys.fYPos = newPoint.fYPos + math.random(-newPoint.fRange,newPoint.fRange);
	objMapSys.fDirValue = math.random(0,6);
	objMapSys.isMustReload = true;
	objCross:EnterPlayer(objPlayer);
	_info("========TryEnterCrossChange3=====");
	objMapSys:ExecChangeMap({bIsChangeLine=2});
	return true;	
end;

function CCrossSvrManager:SetDataFlag(dwAccountId, dwNetId)
	self.bDataEnd[dwAccountId] = true;
	self.NetTbl[dwAccountId] = dwNetId;
	self:CrossCreatePlayer(dwAccountId);
end;

function CCrossSvrManager:ClientConnectFlag(dwAccountId, szSign)
	self.bConnect[dwAccountId] = szSign;
	self:CrossCreatePlayer(dwAccountId);
end;

function CCrossSvrManager:CrossCreatePlayer(dwAccountId)
	_info("---CrossCreatePlayer--------", dwAccountId);
	if self.bDataEnd[dwAccountId] and self.bConnect[dwAccountId] then
		local objPlayer = CPlayerManager:CrossCreatePlayer(_from,dwAccountId,self.bConnect[dwAccountId]);
		if objPlayer and type(objPlayer) ~= "number" then
			CCrossSvrManager:TryEnterCrossChange(objPlayer);
			objPlayer.objSystemMgr:EnterScene()
		end;
	end
end;
