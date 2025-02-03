--[[
	节日
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
--设置开始-结束时间
function CFestival:SetTimeInfo(dwStartTime)
	self.TimeInfo.dwStartTime = dwStartTime
	self.TimeInfo.dwEndTime = dwStartTime + self.CFG.dwEndTime*1000
end
--获取 活动
function CFestival:GetLine(dwIndex)
	return self.Line[dwIndex]
end
--获取开始时间
function CFestival:GetRealStartTime()
	return self.TimeInfo.dwStartTime
end
--是否已经检查过（开服时）
function CFestival:IsChecked()
	return self.bCheck
end
--是否正在进行（弱检查）
function CFestival:IsProcess()
	return self.dwState~=FestivalStateEnum.None
end
--是否永不停止
function CFestival:IsForever()
	return self.CFG.dwType == FestivalTypeEnum.None
end
--------------------------------------------------------------------
--检查是否该结束了
function CFestival:OnEndTimeCheck(dwNowTime)
	if (dwNowTime > self.TimeInfo.dwEndTime) and not self:IsForever() then
		self:OnEnd(dwNowTime)
	else
		self:OnTimeClick(dwNowTime)
	end
end
--检查是否可以开始了
function CFestival:OnStartTimeCheck(dwNowTime)
	if self:IsProceed() then
		self:OnStart(dwNowTime)
	end
end
--进行中更新
function CFestival:OnTimeClick(dwNowTime)
	for dwLine,Line in pairs(self.Line) do
		if Line:IsProcess() then
			Line:OnEndTimeCheck(dwNowTime)
		else
			Line:OnStartTimeCheck(dwNowTime)
		end
	end
end
--开始时执行
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
--结束时执行
function CFestival:OnEnd(dwNowTime)
	_info("CFestival:OnEnd()",self.dwIndex,dwNowTime)
	self.dwState = FestivalStateEnum.None
	CFestivalManager:DelFestivalStartInfo(self.dwIndex)
	----
	CFestivalManager:SendFestivalEnd(self.dwIndex)
end
--------------------------------------------------------------------
--初始化活动
function CFestival:InitLine()
	for i,Info in pairs(self.CFG.Festiva or {}) do
		local Info = Info
		local dwType = Info.dwType
		local dwIndex = Info.dwIndex
		local Line = CFestivalLine:new(dwType,dwIndex,self,self.dwIndex,i)
		self.Line[i] = Line
	end
end
--检查数据库记录的 节日 开始时间（-1为无记录）
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
--检查数据库记录的 活动 开始时间（nil 为无记录）
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
-- @brief 是否开启活动
-- @return boolean 是否
function CFestival:IsOpen()
    return self.CFG.bIsOpen;
end

--获得配置的本次节日开始时间
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
--检查节日当前是否进行中
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

--获取发送信息
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


--检查开始时间是否正常
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



















