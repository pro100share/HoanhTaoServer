--[[
	����
--]]
_G.CFestival = {}
----------------------------------------
function CFestival:new(dwIndex)
	if not FestivalMainConfig[dwIndex] then
		-- print("FestivalMainConfig ERR:(dwIndex)",dwIndex)
	end
	local obj = setmetatable({},{__index=self})
	obj.dwIndex = dwIndex
	obj.TimeInfo = {}
	obj.CFG = FestivalMainConfig[dwIndex]
	obj.Line = {}
	obj.dwState = 0
	obj.bCheck = false
	obj:InitLine()
	return obj;
end
-------------------------------------------------------------------
--���ÿ�ʼ-����ʱ��
function CFestival:SetTimeInfo(dwStartTime)
	self.TimeInfo.dwStartTime = dwStartTime
	self.TimeInfo.dwEndTime = dwStartTime + self.CFG.dwEndTime*1000
end
--��ȡ �
function CFestival:GetLine(dwIndex)
	return self.Line[dwIndex]
end
--��ȡ��ʼʱ��
function CFestival:GetRealStartTime()
	return self.TimeInfo.dwStartTime
end
--�Ƿ��Ѿ�����������ʱ��
function CFestival:IsChecked()
	return self.bCheck
end
--�Ƿ����ڽ��У�����飩
function CFestival:IsProcess()
	return self.dwState~=FestivalStateEnum.None
end
--�Ƿ�����ֹͣ
function CFestival:IsForever()
	return self.CFG.dwType == FestivalTypeEnum.None
end
--------------------------------------------------------------------
--����Ƿ�ý�����
function CFestival:OnEndTimeCheck(dwNowTime)
	if (dwNowTime > self.TimeInfo.dwEndTime) and not self:IsForever() then
		self:OnEnd(dwNowTime)
	else
		self:OnTimeClick(dwNowTime)
	end
end
--����Ƿ���Կ�ʼ��
function CFestival:OnStartTimeCheck(dwNowTime)
	if self:IsProceed() then
		self:OnStart(dwNowTime)
	end
end
--�����и���
function CFestival:OnTimeClick(dwNowTime)
	for dwLine,Line in pairs(self.Line) do
		if Line:IsProcess() then
			Line:OnEndTimeCheck(dwNowTime)
		else
			Line:OnStartTimeCheck(dwNowTime)
		end
	end
end
--��ʼʱִ��
function CFestival:OnStart(dwNowTime)
	local dwStart = self:GetCFGStartTime()
	_info("CFestival:OnStart()",self.dwIndex,dwStart)
	self.dwState = FestivalStateEnum.Start
	self:SetTimeInfo(dwStart)
	CFestivalManager:InsertFestivalStartInfo(self.dwIndex,dwStart)
	----
	CFestivalManager:SendFestivalStart(self.dwIndex)
	----
	self:OnTimeClick(dwNowTime)
end
--����ʱִ��
function CFestival:OnEnd(dwNowTime)
	_info("CFestival:OnEnd()",self.dwIndex,dwNowTime)
	self.dwState = FestivalStateEnum.None
	CFestivalManager:DelFestivalStartInfo(self.dwIndex)
	----
	CFestivalManager:SendFestivalEnd(self.dwIndex)
end
--------------------------------------------------------------------
--��ʼ���
function CFestival:InitLine()
	for i,Info in pairs(self.CFG.Festiva or {}) do
		local Info = Info
		local dwType = Info.dwType
		local dwIndex = Info.dwIndex
		local Line = CFestivalLine:new(dwType,dwIndex,self,self.dwIndex,i)
		self.Line[i] = Line
	end
end
--������ݿ��¼�� ���� ��ʼʱ�䣨-1Ϊ�޼�¼��
function CFestival:CheckStartTime(dwStartTime)
	self.bCheck = true
	local dwNowStartTime = self:GetCFGStartTime()
	if (dwStartTime+self.CFG.dwEndTime*1000 < _now()) then
		CFestivalManager:DelFestivalStartInfo(self.dwIndex)
	end
	if not self:IsProceed(dwStartTime) then
		self.dwState = FestivalStateEnum.None
		CFestivalManager:DelFestivalStartInfo(self.dwIndex)
	else
		self.dwState = FestivalStateEnum.Start
		self:SetTimeInfo(dwStartTime)
		self:CheckLineStartTime()
	end
end
--������ݿ��¼�� � ��ʼʱ�䣨nil Ϊ�޼�¼��
function CFestival:CheckLineStartTime()
	local Data = CFestivalManager:ReadLineStartInfo(self.dwIndex)
	local Info = {}
	for k,v in pairs(Data) do
		Info[v.dwLine] = v
	end
	for dwIndex,Line in pairs(self.Line) do
		Line:CheckStartTime(Info[dwIndex])
	end
end
--------------------------------------------------------------------
-- @brief �Ƿ����
-- @return boolean �Ƿ�
function CFestival:IsOpen()
    return self.CFG.bIsOpen;
end

--������õı��ν��տ�ʼʱ��
function CFestival:GetCFGStartTime()
	local dwNowTime = _now()
	local dwServerStartTime = CTimeRewardManager:GetServerStartTime()
	if self.CFG.dwType==FestivalTypeEnum.None then
		return 0
	elseif (self.CFG.dwType==FestivalTypeEnum.Server) or (self.CFG.dwType==FestivalTypeEnum.Acti) then
		return dwServerStartTime + self.CFG.StartTime[1]*1000
	elseif self.CFG.dwType==FestivalTypeEnum.Date then
		local year,month,day,hour,min,sec = CTimeFormat:todate( math.modf(_now()/1000), true, quick)
		local StartInfo = self.CFG.StartTime[2]
		year = StartInfo.y or year
		month = StartInfo.m or month
		day = StartInfo.d or day
		hour = StartInfo.h or hour
		min = StartInfo.mi or min
		sec = StartInfo.s or 0
		local t_time = {
			year = year; month = month; day = day;
			hour = hour; min = min; sec = sec;
		}
		return _time(1, t_time)*1000
	elseif (self.CFG.dwType==FestivalTypeEnum.MergeServer) then
		return CMergeServerTime:getMergeServerTime() + self.CFG.StartTime[1]*1000
	end
end
--�����յ�ǰ�Ƿ������
function CFestival:IsProceed(dwStartTime)
    if self:IsOpen() == false then
        return false;
    end

	local dwNow = _now()
	local dwNowStartTime = dwStartTime or self:GetCFGStartTime()
	if dwNowStartTime == -1 then
		return false;
	end

	local dwNowEndTIme = dwNowStartTime + self.CFG.dwEndTime*1000
	if dwNowStartTime == 0 then
		return true
	end
	
	if not self:CheckStartInfo(dwNowStartTime) then
		return false
	end
	
	if (dwNow<dwNowStartTime) or (dwNowEndTIme<dwNow) then
		return false
	end
	return true
end

--��ȡ������Ϣ
function CFestival:GetSendInfo()
	if not self:IsProcess() then return end;
	local Info = {}
	Info.TimeInfo = self.TimeInfo
	Info.dwIndex = self.dwIndex
	Info.Line = {}
	for k,v in pairs(self.Line) do
		Info.Line[k] = v:GetSendInfo()
	end
	return Info
end

--Line
function CFestival:GetLineSendInfo(dwLine)
	return self:GetLine(dwLine):GetSendInfo()
end


--��鿪ʼʱ���Ƿ�����
function CFestival:CheckStartInfo(dwStartTime)
	local dwServerStartTime = CTimeRewardManager:GetServerStartTime()
	local dwParentStartTime = dwServerStartTime
	--------
	if self.CFG.dwType==FestivalTypeEnum.None then
		return true
	elseif (self.CFG.dwType==FestivalTypeEnum.Server) then
		return (dwServerStartTime + self.CFG.StartTime[1]*1000)==dwStartTime
	elseif (self.CFG.dwType==FestivalTypeEnum.Acti) then
		return (dwParentStartTime + self.CFG.StartTime[3]*1000)==dwStartTime
	elseif self.CFG.dwType==FestivalTypeEnum.Date then
		local year,month,day,hour,min,sec = CTimeFormat:todate( math.modf(dwStartTime/1000), true, quick)
		local StartInfo = self.CFG.StartTime[2]
		year = StartInfo.y or year
		month = StartInfo.m or month
		day = StartInfo.d or day
		hour = StartInfo.h or hour
		min = StartInfo.mi or min
		sec = StartInfo.s or 0
		local t_time = {
			year = year; month = month; day = day;
			hour = hour; min = min; sec = sec;
		}
		return _time(1, t_time)*1000==dwStartTime
	elseif self.CFG.dwType==FestivalTypeEnum.MergeServer then
		return (CMergeServerTime:getMergeServerTime() + self.CFG.StartTime[1]*1000)==dwStartTime
	end
end



















