--2012.5.17
--作者：段磊磊
--活动系统
_G.CMovementSystemMgr = CSingle:new();
CSingleManager:AddSingle(CMovementSystemMgr,true);
function CMovementSystemMgr:Create()
	self.dwTimeStamp = 0
	self.dwExpValue = 0
	---------------------
	--人物打怪经验加成率
	self.m_perMRoleAddExp = 1;
	--人物演武经验加成率
	self.m_perWRoleAddExp = 1;
	--坐骑经验加成率
	self.m_perMountAddExp = 1;
	--演武五行真气加成率
	self.m_perAddFiveElem = 1;
    self.bChange = true;

    self.tNoticeList ={} ;
	---------------------
	---------------------
	self.tAddMovement = {}
	self.tChangeMovement = {}
	MovementExConfigStart();
end

function CMovementSystemMgr:Update(dwInterval)
	local nowTime = GetCurTime();
	if self.WaitListHead and nowTime > self.WaitListHead.ActionTime then
		local task = self.WaitListHead;
		self.WaitListHead = self.WaitListHead.Next;
		task.Next = nil
		task:DoProcess(1,false,false);
    end
    if self.WillWaitListHead then
        local task = self.WillWaitListHead 
        local tInfo = MovementConfig:GetNoticeInfo(task.dwMovementID)
        if tInfo and nowTime >= (task.ActionTime - tInfo.nShowTime) then
			task:TellClientWillBegin();
            self.WillWaitListHead = self.WillWaitListHead.Next;
            task.Next = nil
            task:DoProcess(2,true,true);
        end
	end
	if self.ProcessListHead and nowTime > self.ProcessListHead.FinishTime then
		local task = self.ProcessListHead;
		self.ProcessListHead = self.ProcessListHead.Next;
		task.Next = nil
		task:DoProcess(3,false,false);
	end

	return;
end;
function CMovementSystemMgr:Destroy()
end;

function CMovementSystemMgr:CreateAllMovement()
	for k,v in pairs (MovementExConfig) do
		for k1,v1 in pairs (v.Time) do
			local s,f = CMovementSystemMgr:GetTimeStampTable(v1.StartTime,v1.FinishTime)
			if s and f then
				CMovement:new(k, s,f)
			end
		end
	end
end;

--通过配置时间得到实际时间戳表
function CMovementSystemMgr:GetTimeStampTable(beginTime,endTime)
	local year, month, day, hour, minute, second = CTimeFormat:todate(GetCurTime(1), true, false);
	if beginTime.dwWeek then
		local week = tonumber(beginTime.dwWeek);
		if week < 0 or week > 6 then return nil end;
		local todayWeek = CTimeFormat:DayToWeek(year, month, day);
		if todayWeek > week then--说明已过
			day = day - (todayWeek - week);
		else
			day = day + (week - todayWeek);
		end;
	end;
	if beginTime.dwTime then
		local _, _, s_Hour, s_Minute = string.find(beginTime.dwTime, "(%d*):(%d*)");
		hour = tonumber(s_Hour);
		minute = tonumber(s_Minute);
		second = 0;
		if not hour or not minute then return nil end;
	end;

	local bTime = {};
	bTime.dwYear		= year;
	bTime.dwMonth		= month;
	bTime.dwDay 		= day;
	bTime.dwHour 		= hour;
	bTime.dwMinute 	= minute;
	bTime.dwSecond 	= second;
	
	bTime.isWeekType = beginTime.dwWeek
		
	if endTime.dwWeek then
		local week = tonumber(endTime.dwWeek);
		if week < 0 or week > 6 then return nil end;
		local todayWeek = CTimeFormat:DayToWeek(year, month, day);
		if todayWeek > week then--说明已过
			day = day - (todayWeek - week);
		else
			day = day + (week - todayWeek);
		end;
	end;
	if endTime.dwTime then
		local _, _, s_Hour, s_Minute = string.find(endTime.dwTime, "(%d*):(%d*)");
		hour = tonumber(s_Hour);
		minute = tonumber(s_Minute);
		second = 0;
		if not hour or not minute then return nil end;
	end;
	local eTime = {};
	eTime.dwYear		= year;
	eTime.dwMonth		= month;
	eTime.dwDay 		= day;
	eTime.dwHour 		= hour;
	eTime.dwMinute 	= minute;
	eTime.dwSecond 	= second;
	--开始时间戳表和结束时间戳表
	return bTime,eTime
end
--加入等待队列
function CMovementSystemMgr:AddInWaitList(objMovement)
	local temp = self.WaitListHead;
	if not temp then
		self.WaitListHead = objMovement;
	elseif objMovement.ActionTime <= temp.ActionTime then
		self.WaitListHead = objMovement;
		objMovement.Next = temp;
	else
		while temp do
			if objMovement.ActionTime > temp.ActionTime and ( not temp.Next or objMovement.ActionTime <= temp.Next.ActionTime)then
				local nextTask = temp.Next;
				temp.Next = objMovement;
				objMovement.Next = nextTask;
				break;
			else
				temp = temp.Next; 
			end;
		end;
	end;
end

--加入将要等待队列
function CMovementSystemMgr:AddInWillWaitList(objMovement)
    local temp = self.WillWaitListHead;
    if not temp then
        self.WillWaitListHead = objMovement;
    elseif objMovement.ActionTime <= temp.ActionTime then
        self.WillWaitListHead = objMovement;
        objMovement.Next = temp;
    else
        while temp do
            if objMovement.ActionTime > temp.ActionTime and ( not temp.Next or objMovement.ActionTime <= temp.Next.ActionTime)then
                local nextTask = temp.Next;
                temp.Next = objMovement;
                objMovement.Next = nextTask;
                break;
            else
                temp = temp.Next; 
            end;
        end;
    end;
end
--加入进行队列
function CMovementSystemMgr:AddInProcessList(objMovement)
	local temp = self.ProcessListHead;
	if not temp then
		self.ProcessListHead = objMovement;
	elseif objMovement.FinishTime <= temp.FinishTime then
		self.ProcessListHead = objMovement;
		objMovement.Next = temp;
	else
		while temp do
			if objMovement.FinishTime > temp.FinishTime and ( not temp.Next or objMovement.FinishTime <= temp.Next.FinishTime)then
				local nextTask = temp.Next;
				temp.Next = objMovement;
				objMovement.Next = nextTask;
				break;
			else
				temp = temp.Next; 
			end;
		end;
	end;
end
--活动类
_G.CMovement = {}
function CMovement:new(dwMovementID,Time,eTime)
	local obj = {};
	local movementCfg = MovementExConfig[dwMovementID]
	obj.ActionTime = CTimeFormat:GetThisTimeMsec(Time.dwYear, Time.dwMonth, Time.dwDay, Time.dwHour, Time.dwMinute, Time.dwSecond);
	obj.FinishTime = CTimeFormat:GetThisTimeMsec(eTime.dwYear, eTime.dwMonth, eTime.dwDay, eTime.dwHour, eTime.dwMinute, eTime.dwSecond);
	
	if movementCfg.SpecialCheck then
		obj.ActionTime = movementCfg.SpecialCheck(obj.ActionTime);
		obj.FinishTime = movementCfg.SpecialCheck(obj.FinishTime);
	end
	
	if Time.isWeekType then
		obj.CycleTime = ONE_WEEK_MSEC;
	else
		obj.CycleTime = ONE_DAY_MSEC;
	end;
	obj.dwMovementID = dwMovementID;
	obj.Next = nil;
	obj.sFunc = movementCfg.sFunc;
	obj.eFunc = movementCfg.eFunc;
	obj.FinishParam = movementCfg.FinishParam;
	obj.StartParam = movementCfg.StartParam;
	for k, v in pairs(CMovement) do
		if type(v) == "function" then
			obj[k] = v;
		end;
	end;
	--等待队列按照开始时间进行排序，进行队列按照结束时间进行排序
	if GetCurTime() < obj.ActionTime then
	--加入等待队列
		local tInfo = _G.MovementConfig:GetNoticeInfo(dwMovementID)
		if tInfo and GetCurTime() <= (obj.ActionTime - tInfo.nShowTime) then
            obj:DoProcess(3,true,true)
		else
            obj:DoProcess(2,true,true)
        end
	elseif GetCurTime() >= obj.ActionTime and GetCurTime() < obj.FinishTime then
	--加入进行队列并通知客户端活动在进行
		obj:DoProcess(1,false,false)
	elseif GetCurTime() >= obj.FinishTime   then
	--开始时间和结束时间加一个循环时间后加入等待队列
		if obj.CycleTime then
			obj.ActionTime = obj.ActionTime + obj.CycleTime;
			obj.FinishTime = obj.FinishTime + obj.CycleTime;
		end;
		local tInfo = _G.MovementConfig:GetNoticeInfo(dwMovementID)
        if tInfo and GetCurTime() <= (obj.ActionTime - tInfo.nShowTime) then
            obj:DoProcess(3,true,true)
        else
            obj:DoProcess(2,true,true)
        end
	end
	return obj;
end;
--nType,1为加入进行队列2为加入等待队列，nFlag，true则不执行函数，nAdd,true为不增加循环时间
function CMovement:DoProcess(nType,nFlag,nAdd)
	--_err(nType,nFlag,nAdd,self.dwMovementID)
	if self.CycleTime then
		if nType == 1  then
			--开始 ，执行开始函数 并通知客户端
			self:TellClientBegin();
			if not nFlag then if self.sFunc then self.sFunc() end end;
			if not nAdd then self.ActionTime = self.ActionTime + self.CycleTime end;
			CMovementSystemMgr:AddInProcessList(self);
		elseif nType == 2 then
			--结束 ，执行结束函数
			-- self:TellClientEnd();
			-- if not nFlag then if self.eFunc then self.eFunc() end end;
			-- if not nAdd then self.FinishTime = self.FinishTime + self.CycleTime end;
			CMovementSystemMgr:AddInWaitList(self);
        else
            self:TellClientEnd();
            if not nFlag then if self.eFunc then self.eFunc() end end;
            if not nAdd then self.FinishTime = self.FinishTime + self.CycleTime end;
            CMovementSystemMgr:AddInWillWaitList(self);
		end
	end;
end;

function CMovement:TellClientWillBegin(nTime)
	--print('start dwMovementID =',self.dwMovementID)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet,"OnWillStartTimeMsg",{ID = self.dwMovementID,nTime = nTime});
end

function CMovement:TellClientBegin()
	--print('start dwMovementID =',self.dwMovementID)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
    local nTime = self.FinishTime - GetCurTime()
    _info("==========TellClientBegin=======",self.dwMovementID)
	_groupcallout(setNet,"OnStartTimeMsg",{ID = self.dwMovementID,nTime = nTime});
end

function CMovement:TellClientEnd()
	--print('end dwMovementID =',self.dwMovementID)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	 _info("==========TellClientEnd=======",self.dwMovementID)
	_groupcallout(setNet,"OnEndTimeMsg",{ID = self.dwMovementID});
end







----------获得活动经验
function CMovementSystemMgr:GetMovementExp(dwExp)
	return dwExp * self.dwExpValue
end;
function CMovementSystemMgr:ChangeMovementExp(dwExpValue)
	self.dwExpValue = self.dwExpValue + dwExpValue
end
---------------------------------------------------------------------------------------------------------------------------------------



--获得人物打怪经验加成率
function CMovementSystemMgr:GetMRoleAddExp()
	return self.m_perMRoleAddExp;
end;
--设置人物打怪经验加成率
function CMovementSystemMgr:SetMRoleAddExp(perAddExp)
	self.m_perMRoleAddExp = perAddExp;
end;

--获得人物演武经验加成率
function CMovementSystemMgr:GetWRoleAddExp()
	return self.m_perWRoleAddExp;
end;
--设置人物演武经验加成率
function CMovementSystemMgr:SetWRoleAddExp(perAddExp)
	self.m_perWRoleAddExp = perAddExp;
end;

--获得演武人物真气加成率
function CMovementSystemMgr:GetAddFiveElem()
	return self.m_perAddFiveElem;
end;
--设置演武人物真气加成率
function CMovementSystemMgr:SetAddFiveElem(perAddExp)
	self.m_perAddFiveElem = perAddExp;
end;

--获得坐骑经验加成率
function CMovementSystemMgr:GetMountAddExp()
	return self.m_perMountAddExp;
end;
--设置坐骑经验加成率
function CMovementSystemMgr:SetMountAddExp(perAddExp)
	self.m_perMountAddExp = perAddExp;
end;
























