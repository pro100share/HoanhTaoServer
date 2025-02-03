_G.CIncomeRecordSystem = {}
---------------------------------------------
function CIncomeRecordSystem:new()
	local obj = CSystem:new("CIncomeRecordSystem");
	for k,v in pairs(CIncomeRecordSystem) do
		if type(v)=="function" then
			obj[k] = v
		end
	end
	return obj
end
function CIncomeRecordSystem:Create()
	self.exp 	= 0
	self.jin 	= 0
	self.mu 	= 0
	self.shui	= 0
	self.huo	= 0
	self.tu		= 0
	self.ri		= 0
	self.zhou	= 0
	self.shi	= 0
	self.mo		= 0
	self.bo		= 0
	self.fb		= 0
	self.time	= 0
	self:AskForData()
	return true
end
function CIncomeRecordSystem:Update(dwDelay)
end
function CIncomeRecordSystem:Destroy()
	self:SendDataToKS()
end
---------------------------------------------
----------------------------------------事件
--系统换线结束
function CIncomeRecordSystem:OnChangeLineEnd(dwNewLineID)
	--self:SendDataToCnt()
end
--客户端进入游戏登入所有场景之后
function CIncomeRecordSystem:OnEnterScene()
	--	self:SendDataToCnt()
end;
---------------------------------------------
----------------------------------------方法
function CIncomeRecordSystem:Get()
	local Data = {}
	Data.exp 	= self.exp
	Data.jin 	= self.jin
	Data.mu 	= self.mu
	Data.shui	= self.shui
	Data.huo	= self.huo
	Data.tu		= self.tu
	Data.ri		= self.ri
	Data.zhou	= self.zhou 
	Data.shi	= self.shi
	Data.mo		= self.mo
	Data.bo		= self.bo
	Data.fb		= self.fb
	Data.time	= self.time
	return Data
end
function CIncomeRecordSystem:CheckTime()
	if not CTimeFormat:isToday(self.time) then
		self.exp 	= 0
		self.jin 	= 0
		self.mu 	= 0
		self.shui	= 0
		self.huo	= 0
		self.tu		= 0
		self.ri		= 0
		self.zhou	= 0
		self.shi	= 0
		self.mo		= 0
		self.bo		= 0
		self.fb		= 0
		self.time	= GetCurTime()
	end
end
---------------------------------------------
----------------------------------------发送
--发送请求信息
function CIncomeRecordSystem:AskForData()
	local objPlayer = self:GetPlayer()
	CKernelApp.KSIncomeAskMsg{_aid=objPlayer:GetAccountID(),RoleID=objPlayer:GetRoleID()};
end
--发送data给ks
function CIncomeRecordSystem:SendDataToKS()
	local objPlayer = self:GetPlayer()
	CKernelApp.KSIncomeRcvMsg{_aid=objPlayer:GetAccountID(),RoleID=objPlayer:GetRoleID(),Data=self:Get()};
end
--发送data给Cnt
function CIncomeRecordSystem:SendDataToCnt()
	local Data = self:Get()
	local objPlayer = self:GetPlayer()
	objPlayer.CntIncomeRcvMsg{Data=Data}
end
---------------------------------------------
----------------------------------------接收
--接收ks的数据
function CIncomeRecordSystem:RcvDataFromKS(Data)
	if CTimeFormat:isToday(Data.time) then
		self:OnAddExp(Data.exp)
		self:OnAddZQ("Metal",Data.jin)
		self:OnAddZQ("Wood",Data.mu)
		self:OnAddZQ("Water",Data.shui)
		self:OnAddZQ("Fire",Data.huo)
		self:OnAddZQ("Earth",Data.tu)
		--self:SendDataToCnt()
	end
end
--接收client的请求信息
function CIncomeRecordSystem:RcvAskFromCnt()
	self:SendDataToCnt()
end

function CIncomeRecordSystem:OnAddExp(dwExp)
	self:CheckTime()
	self.exp = self.exp + dwExp
end

local typelist = 
	{
		dwMetalValue="jin";
		dwWoodValue="mu";
		dwWaterValue="shui";
		dwFireValue="huo";
		dwEarthValue="tu";
	}
function CIncomeRecordSystem:OnAddZQ(szType,dwValue)
	if dwValue < 0 then return end;
	if (not typelist[szType]) or (not self[typelist[szType]]) then return end;
	self:CheckTime()
	self[typelist[szType]] = self[typelist[szType]] + dwValue or 0
end
function CIncomeRecordSystem:OnAddri(dwValue)
	self:CheckTime()
	self.ri = self.ri + dwValue
end
function CIncomeRecordSystem:OnAddzhou(dwValue)
	self:CheckTime()
	self.zhou = self.zhou + dwValue
end
function CIncomeRecordSystem:OnAddshi(dwValue)
	self:CheckTime()
	self.shi = self.shi + dwValue
end
function CIncomeRecordSystem:OnAddmo(dwValue)
	self:CheckTime()
	self.mo = self.mo + dwValue
end
function CIncomeRecordSystem:OnAddbo(dwValue)
	self:CheckTime()
	self.bo = self.bo + dwValue
end
function CIncomeRecordSystem:OnAddfb(dwValue)
	self:CheckTime()
	self.fb = self.fb + dwValue
end
---------------------------------------------
function CIncomeRecordSystem:OnEventCenter(szEventName,dwNum,...)
	local param = {...}
	if szEventName == enumPlayerEventType.EventCompleteTask then
		local dwTaskId = param[1]
		local dwTaskType = param[2]
		if dwTaskType==TaskTypeConfig.Daily then
			self:OnAddri(1)
		elseif dwTaskType==TaskTypeConfig.Weekly then
			self:OnAddzhou(1)
		elseif dwTaskType==TaskTypeConfig.Guild then
			self:OnAddshi(1)
		end
	elseif szEventName == enumPlayerEventType.EventKillMonster then
		self:OnAddmo(1)
	elseif szEventName == enumPlayerEventType.EventKillBossMonster then
		self:OnAddbo(1)
	elseif szEventName == enumPlayerEventType.EventEnterDungeon then
		self:OnAddfb(1)
	end
end












