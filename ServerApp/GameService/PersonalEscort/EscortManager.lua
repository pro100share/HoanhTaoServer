--[[
���ܣ�����Ѻ�ڹ�����
���ߣ���Ө
ʱ�䣺2013-09-06
]]
_G.CEscortManager = {}
if _G.WarHostFlag ~= 0 then
	CSingleManager:AddSingle(CEscortManager);
end

--��������Ѻ�ڹ�����
function CEscortManager:Create()
	self.EscortInfo = {};
	self.NextRefTime = 0;
	self.RunEscortInfo = {};  --[roleId] = {monsterId}
	self:CheckAddTask();
	self.ReEscortInfo = {}; --[roleId] = {monsterEntityId} ��¼����ֵid���ڳ�ʵ��id
end;

function CEscortManager:CheckAddTask()
	local _, _, startHour, startMin = string.find(_G.RefreshMonsterTime.dwStartTime, "(%d*).(%d*)");
	local _, _, endHour, endMin = string.find(_G.RefreshMonsterTime.dwEndTime, "(%d*).(%d*)");
	local startTime = _G.CTimeFormat:GetTodayThisTimeMsec(tonumber(startHour), tonumber(startMin));
	local endTime = _G.CTimeFormat:GetTodayThisTimeMsec(tonumber(endHour), tonumber(endMin));
	if GetCurTime() > startTime and GetCurTime() < endTime then
		local dwDoTime = 1;	
		while(true) do
			local dwTaskTime = startTime + (_G.RefreshMonsterTime.dwSpaceTime * dwDoTime) * 60000
			if dwTaskTime >= GetCurTime() then
				if dwTaskTime >= endTime then
					break;
				else
					local hour, mins = _G.CTimeFormat:sec2format(dwTaskTime / 1000);
					local timeStr = string.format('%02d:%02d',hour, mins);
					local hour1, mins1 = _G.CTimeFormat:sec2format((dwTaskTime - _G.RefreshMonsterTime.dwWarnSpaceTime * 60000) / 1000)
					local timeStr1 = string.format('%02d:%02d',hour1, mins1);
					_info("------Escort--test1-----", timeStr);
					self:AddMidEscortTask(timeStr);
					self:AddMidWarnEscortTask(timeStr1);
					break;
				end;
			else
				dwDoTime = dwDoTime + 1;
			end;
		end;
	end;
	_info("------Escort--test2-----");
	self:AddEscortTask();
	self:AddWarnTask();
end;

function CEscortManager:AddMidEscortTask(timeStr)
	--ˢ���ڳ���ʱ��
	local startTime = timeStr;
	local Time = {dwTime = startTime};   --��ʼ��ʱ��
	local CycleType
		= _G.CAlarmTaskCycleType.eDay ;
	local CycleTime = 1;
	local RunTimes = 1;
	for dwMapId, _ in pairs(_G.RefreshMonster) do
		local Param = {CEscortManager,dwMapId};
		_info("------Escort--test7-----", dwMapId);
		CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, CEscortManager.AddMidRefEscortTask, Param);
	end;
end;

function CEscortManager:AddMidWarnEscortTask(timeStr)
	--ˢ���ڳ���ʱ��
	local startTime = timeStr;
	local Time = {dwTime = startTime};   --��ʼ��ʱ��
	local CycleType
		= _G.CAlarmTaskCycleType.eDay ;
	local CycleTime = 1;
	local RunTimes = 1;
	local Param = {CEscortManager};
	CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, CEscortManager.SendWarnInfoTask, Param);
end;

function CEscortManager:SendWarnInfoTask()
	self:SendWarnInfo(54, _G.RefreshMonsterTime.dwWarnSpaceTime);
	local Time = {};   --��ʼ��ʱ��
	local CycleType
		= _G.CAlarmTaskCycleType.eMinute;
	local CycleTime1 = _G.RefreshMonsterTime.dwSpaceTime;
	local _, _, endHour, endMin = string.find(_G.RefreshMonsterTime.dwEndTime, "(%d*).(%d*)");
	local endTime = _G.CTimeFormat:GetTodayThisTimeMsec(tonumber(endHour), tonumber(endMin));
	local times =(endTime - GetCurTime()) / 60000;
	local RunTimes = math.ceil(times / _G.RefreshMonsterTime.dwSpaceTime) - 1;
	if RunTimes > 0 then
		local Param1= {CEscortManager,54, _G.RefreshMonsterTime.dwWarnSpaceTime};
		CAlarmClock:AddTask(Time, CycleType, CycleTime1, RunTimes, CEscortManager.SendWarnInfo, Param1);	
	end;
end;

function CEscortManager:AddMidRefEscortTask(dwMapId)
	_info("------Escort--test8-----", dwMapId);
	self:RefreshEscortInfo(dwMapId)
	--���ˢ���ڳ�
	local Time = {};   --��ʼ��ʱ��
	local CycleType
		= _G.CAlarmTaskCycleType.eMinute;
	local CycleTime = _G.RefreshMonsterTime.dwSpaceTime;
	local _, _, endHour, endMin = string.find(_G.RefreshMonsterTime.dwEndTime, "(%d*).(%d*)");
	local endTime = _G.CTimeFormat:GetTodayThisTimeMsec(tonumber(endHour), tonumber(endMin));
	local times =(endTime - GetCurTime()) / 60000;
	local RunTimes = math.ceil(times / _G.RefreshMonsterTime.dwSpaceTime) - 1;
	if RunTimes > 0 then
		local Param = {CEscortManager,dwMapId};
		CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, CEscortManager.RefreshEscortInfo, Param);
	end;
end;

function CEscortManager:AddEscortTask()
	--ˢ���ڳ���ʱ��
	local startTime = _G.RefreshMonsterTime.dwStartTime;
	local Time = {dwTime = startTime};   --��ʼ��ʱ��
	local CycleType
		= _G.CAlarmTaskCycleType.eDay ;
	local CycleTime = 1;
	local RunTimes = 0;
	for dwMapId, _ in pairs(_G.RefreshMonster) do
		local Param = {CEscortManager,dwMapId};
		_info("------Escort--test3-----", dwMapId);
		CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, CEscortManager.AddStartEvent, Param);
	end;
	local Param = {CEscortManager}
	CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, CEscortManager.AddStartWarnEvent, Param);
end;
function CEscortManager:AddWarnTask()
	--ˢ���ڳ���ʱ��
	local startTime = _G.RefreshMonsterTime.dwWarnTime;
	local Time = {dwTime = startTime};   --��ʼ��ʱ��
	local CycleType
		= _G.CAlarmTaskCycleType.eDay ;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {CEscortManager};
	CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, CEscortManager.SendStartWarn, Param);
end;
function CEscortManager:SendStartWarn()
	CGameApp.EscortSys_StartBroadCastMsg{
      
	};
end;
function CEscortManager:SendWarnInfo(id, dwTime)
	CGameApp.EscortSys_BroadCastMsg{
        StringId = id,
        AttrTbl = {dwTime},
	};
end;
function CEscortManager:AddStartWarnEvent()
	local Time = {};   --��ʼ��ʱ��
	local CycleType
		= _G.CAlarmTaskCycleType.eMinute;
	local CycleTime1 = _G.RefreshMonsterTime.dwSpaceTime - _G.RefreshMonsterTime.dwWarnSpaceTime;
	local RunTimes = (_G.RefreshMonsterTime.dwLength * 60 / _G.RefreshMonsterTime.dwSpaceTime) - 1;
	local Param1 = {CEscortManager,54, _G.RefreshMonsterTime.dwWarnSpaceTime};
	CAlarmClock:AddTask(Time, CycleType, CycleTime1, RunTimes, CEscortManager.SendWarnInfo, Param1);
end;
--ˢ���ڳ���ʱ��
function CEscortManager:AddStartEvent(dwMapId)
	_info("------Escort--test4-----", dwMapId);
	self:RefreshEscortInfo(dwMapId)
	--���ˢ���ڳ�
	local Time = {};   --��ʼ��ʱ��
	local CycleType
		= _G.CAlarmTaskCycleType.eMinute;
	local CycleTime = _G.RefreshMonsterTime.dwSpaceTime;
	local RunTimes = (_G.RefreshMonsterTime.dwLength * 60 / _G.RefreshMonsterTime.dwSpaceTime) - 1;
	local Param = {CEscortManager,dwMapId};
	CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, CEscortManager.RefreshEscortInfo, Param);
end;

--ˢ���ڳ���Ϣ
function CEscortManager:RefreshEscortInfo(dwMapId)
	_info("------Escort--test5-----", dwMapId);
	self.EscortInfo[dwMapId] = {};
	local info = _G.RefreshMonster[dwMapId];
	for index, monsterInfo in pairs(info) do
		for key, value in pairs(monsterInfo) do
			if not self.EscortInfo[dwMapId][index] then
				self.EscortInfo[dwMapId][index] = {};
			end;
			_info("------Escort--test6-----", dwMapId, index, key, value);
			self.EscortInfo[dwMapId][index][key] = value;
		end;
	end;
	self.NextRefTime = GetCurTime() + _G.RefreshMonsterTime.dwSpaceTime * 60 * 1000;
end;

function CEscortManager:SetEscortInfo(dwMapId, pos)
	if not self.EscortInfo[dwMapId] then
		return;
	end;
	if not self.EscortInfo[dwMapId][pos] then
		return;
	end;
	self.EscortInfo[dwMapId][pos].dwNum = self.EscortInfo[dwMapId][pos].dwNum - 1;
end;

function CEscortManager:GetNextRefTime()
	return self.NextRefTime;
end;

--���¸���Ѻ��
function CEscortManager:Update()
	return true;
end;

function CEscortManager:Destroy()
	
end;
--���Ѻ������
function CEscortManager:UpdateEscortInfo()
	self.EscortInfo = {};
	self.NextRefTime = 0;
	self.RunEscortInfo = {}; 
	local onlinePlayerTbl = CPlayerManager.setAllPlayer;
	local setNet = {}; 
	for id, player in pairs(onlinePlayerTbl) do
		if player and player:GetSystem("CEscortSystem") then
			player:GetSystem("CEscortSystem"):SetEscortInfo();
		end;
	end;
end;
--����ڳ���¼
function CEscortManager:GetEscortInfo()
	return self.EscortInfo;
end;
--����Ѻ�ڽ��
function CEscortManager:SetEscortResult(dwRoleId, result, lifeTime, dwType, dwQuality, dwBornPlayerId)
	-- if not objPlayer then
		-- return;
	-- end;
	-- local escortSystem = objPlayer:GetSystem("CEscortSystem");
	-- if not escortSystem then
		-- return;
	-- end;
	-- escortSystem:GetEscortAward(result, lifeTime, dwType, dwQuality, dwBornPlayerId);
	_G.GSRemoteCall(dwRoleId, "CEscortSystem", "GetEscortAward",{result, lifeTime, dwType, dwQuality, dwBornPlayerId, dwRoleId});
	self:RecordRunEscort(dwRoleId, nil);
end;
--�������ڵ���
function CEscortManager:RecordRunEscort(roleId, value)
	if self.RunEscortInfo then
		self.RunEscortInfo[roleId] = value;
	end;
end;
--��¼������
-- function CEscortManager:RecordReEscortInfo(roleId, value)
	-- self.ReEscortInfo[roleId] = value;
-- end;

function CEscortManager:GetRunEscort(roleId)
	if not self.RunEscortInfo then
		return 0;
	end;
	return self.RunEscortInfo[roleId] or 0;
end;

-- function CEscortManager:GetReEscortInfo(roleId)
	-- if not self.ReEscortInfo then
		-- return 0;
	-- end;
	-- return self.ReEscortInfo[roleId] or 0;
-- end;
