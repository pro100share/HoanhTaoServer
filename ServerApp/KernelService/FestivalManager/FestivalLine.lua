--[[
	�
--]]
_G.CFestivalLine = {}
--------------------------------------------------------
function CFestivalLine:new(dwType,dwIndex,Festival,dwFestival,dwLine)
	if (not FestivalListConfig[dwType]) or (not FestivalListConfig[dwType][dwIndex]) then
		-- print("FestivalListConfig ERR:(dwFestival,dwLine)",dwFestival,dwLine)
	end
	local obj = setmetatable({},{__index=self})
	obj.dwType = dwType
	obj.dwIndex = dwIndex
	obj.TimeInfo = {}
	obj.CFG = FestivalListConfig[dwType][dwIndex]
	obj.Parent = Festival
	obj.dwState = 0
	obj.bCheck = false
	obj.dwFestival = dwFestival
	obj.dwLine = dwLine	
	obj.Node = {}
	return obj;
end
--------------------------------------------------------
--���� ��ʼ-���� ʱ��
function CFestivalLine:SetTimeInfo(dwStartTime)
	self.TimeInfo.dwStartTime = dwStartTime
	self.TimeInfo.dwEndTime = dwStartTime + self.CFG.dwEndTime*1000
end
--��� � ������ ����
function CFestivalLine:GetParent()
	return self.Parent
end
--��ÿ�ʼʱ��
function CFestivalLine:GetRealStartTime()
	return self.TimeInfo.dwStartTime
end
--�Ƿ�����ֹͣ
function CFestivalLine:IsForever()
	return self.CFG.dwType == FestivalTypeEnum.None
end
--�Ƿ����ڽ��У�����飩
function CFestivalLine:IsProcess()
	return self.dwState~=FestivalStateEnum.None
end
---------------------------------------------------------
--����Ƿ�ý�����
function CFestivalLine:OnEndTimeCheck(dwNowTime)
	if (dwNowTime > self.TimeInfo.dwEndTime) and not self:IsForever() then
		self:OnEnd(dwNowTime)
	else
		self:OnTimeClick(dwNowTime)
	end
end
--����Ƿ���Կ�ʼ��
function CFestivalLine:OnStartTimeCheck(dwNowTime)
	if self:IsProceed() then
		self:OnStart(dwNowTime)
	end
end
--�����и���
function CFestivalLine:OnTimeClick(dwNowTime)
	if self.dwType == FestivalListTypeEnum.Rush then
		if self.dwState ~= FestivalStateEnum.Reward then
			local dwRewardTime = self.TimeInfo.dwStartTime + self.CFG.dwRewardTime*1000
			if dwNowTime > dwRewardTime then
				self:OnReward(dwNowTime)
			end
		end
	end
end
--��ʼʱִ��
function CFestivalLine:OnStart(dwNowTime)
	local dwStart = self:GetCFGStartTime()
	_info("CFestivalLine:OnStart()",self.dwFestival,self.dwLine,dwStart)
	self.dwState = FestivalStateEnum.Start
	self:SetTimeInfo(dwStart)
	CFestivalManager:InsertLineStartInfo(self.dwFestival,self.dwLine,self.dwState,dwStart)
	----
	CFestivalManager:SendLineStart(self.dwFestival,self.dwLine)
	----
	self:OnTimeClick(dwNowTime)
end
--����ʱִ��
function CFestivalLine:OnEnd(dwNowTime)
	_info("CFestivalLine:OnEnd()",self.dwFestival,self.dwLine)
	self.dwState = FestivalStateEnum.None
	CFestivalManager:DelLineStartInfo(self.dwFestival,self.dwLine)
	----
	CFestivalManager:SendLineEnd(self.dwFestival,self.dwLine)
end
--������ʱִ�У�����ࣩ
function CFestivalLine:OnReward(dwNowTime)
	self.dwState = FestivalStateEnum.Reward
	CFestivalManager:UpdateLineStartInfo(self.dwFestival,self.dwLine,self.dwState)
	
	local Info = {}
	for dwIndex,Node in pairs(self.CFG.Festival) do
		local dwRule = Node.dwRule
		local cfgRule = FestivalScript.RushCondition[dwRule]
		local fun = FestivalStaticScript[cfgRule.fun]
		local param = cfgRule.param
		local res = fun(unpack(param))
		Info[dwIndex] = res
		for _,dwRoleID in pairs(res) do
			CFestivalManager:InsertLineRewardInfo(dwRoleID,self.dwFestival,self.dwLine,dwIndex,self:GetRealStartTime())
		end
	end
	self:SetReward(Info)
	----
	CFestivalManager:SendLineReward(self.dwFestival,self.dwLine)
end
--���ÿ���ȡ��������Ա��Ϣ������ࣩ
function CFestivalLine:SetReward(Info)
	for dwIndex,Node in pairs(Info) do
		self.Node[dwIndex] = {}
		for _,dwRoleID in pairs(Node) do
			local dwRoleID = dwRoleID
			if type(dwRoleID)=="table" then
				dwRoleID = dwRoleID.dwRoleID
			end
			local Player = COfflineInfoManager:GetRoleInfo(dwRoleID)
			if Player then
				local Data = {}
				Data.dwRoleID = dwRoleID
				Data.dwIncoID = Player:GetIncoID()
				Data.szName = Player.szName
				Data.dwLevel = Player.dwLevel
				table.insert(self.Node[dwIndex],Data)
			end
		end
	end
end
----------------------------------------------------------
--������ݿ��¼�Ŀ�ʼʱ�䣨nil Ϊ�޼�¼��
function CFestivalLine:CheckStartTime(Info)
	self.bCheck = true
	Info = Info or {}
	local dwStartTime = Info.dwStartTime or -1
	local dwState = Info.dwState
	
	if (dwStartTime+self.CFG.dwEndTime*1000 < _now()) then
		CFestivalManager:DelLineStartInfo(self.dwFestival,self.dwLine)
	end
	if not self:IsProceed(dwStartTime) then
		self.dwState = FestivalStateEnum.None
		CFestivalManager:DelLineStartInfo(self.dwFestival,self.dwLine)
	else
		self.dwState = dwState
		self:SetTimeInfo(dwStartTime)
		self:ReadRewardInfo()
	end
end
--��ȡ���콱��Ա��Ϣ
function CFestivalLine:ReadRewardInfo()
	if self.dwType ~= FestivalListTypeEnum.Rush then return end;
	if self.dwState ~= FestivalStateEnum.Reward then return end;
	local Data = CFestivalManager:ReadLineRewardInfo(self.dwFestival,self.dwLine)
	local Info = {}
	for k,v in pairs(Data) do
		Info[v.dwIndex] = Info[v.dwIndex] or {}
		table.insert(Info[v.dwIndex],v)
	end
	self:SetReward(Info)
end
----------------------------------------------------------
--������õĿ�ʼʱ��
function CFestivalLine:GetCFGStartTime()
	local dwNowTime = _now()
	local dwServerStartTime = CTimeRewardManager:GetServerStartTime()
	local dwParentStartTime = self:GetParent():GetRealStartTime()
	
	if self.CFG.dwType==FestivalTypeEnum.None then
		return 0
	elseif (self.CFG.dwType==FestivalTypeEnum.Server) then
		return dwServerStartTime + self.CFG.StartTime[1]*1000
	elseif (self.CFG.dwType==FestivalTypeEnum.Acti) then
		return dwParentStartTime + self.CFG.StartTime[3]*1000
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
	elseif self.CFG.dwType== FestivalTypeEnum.MergeServer then
		return CMergeServerTime:getMergeServerTime() + self.CFG.StartTime[1]*1000
	end
end
--�����ǰ�Ƿ������
function CFestivalLine:IsProceed(dwStartTime)
	local dwNow = _now()
	local dwNowStartTime = dwStartTime or self:GetCFGStartTime()
	local dwNowEndTIme = dwNowStartTime + self.CFG.dwEndTime*1000
	if dwNowStartTime == -1 then
		return false;
	end
	
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
function CFestivalLine:GetSendInfo()
	if not self:IsProcess() then return end;
	local Info = {}
	
	Info.dwType = self.dwType
	Info.dwIndex = self.dwIndex
	Info.TimeInfo = self.TimeInfo
	Info.dwState = self.dwState
	Info.dwFestival = self.dwFestival
	Info.dwLine = self.dwLine
	Info.Node = self.Node
	return Info
end

--��鿪ʼʱ���Ƿ�����
function CFestivalLine:CheckStartInfo(dwStartTime)
	local dwServerStartTime = CTimeRewardManager:GetServerStartTime()
	local dwParentStartTime = self:GetParent():GetRealStartTime()
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
	elseif self.CFG.dwType== FestivalTypeEnum.MergeServer then
		return (CMergeServerTime:getMergeServerTime() + self.CFG.StartTime[1]*1000)==dwStartTime
	end
end















