--[[
功能：定时器，当需要在未来某个时刻执行一个函数时候，可以将其注册到该定时器
备注：
作者：刘科建
版本：v1.0 created 03/23/2012
--]]
local function IsLeapYear(year)
	if (year % 400 == 0) or ((year % 4 == 0) and (year % 100 ~= 0)) then
		return true;
	end;
	return false;
end;
local Day1 = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
local Day2 = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
--定时器
_G.CAlarmClock = CSingle:new();
--任务链表
CAlarmClock.TaskListHead = nil;
--任务ID，顺延++
CAlarmClock.dwGlobalID = 0;
--注册到全局控制，让系统自动更新
CSingleManager:AddSingle(CAlarmClock,true);

if CConfig.bIsCrossSvr then
	print("CSingleManager:RegistCSSingle(CAlarmClock, true)")
	CSingleManager:RegistCSSingle(CAlarmClock, true);
end

--更新定时器
function CAlarmClock:Update()
	local nowTime = _now();
	--print('nowTime ====',nowTime,self.TaskListHead.ActionTime);
	if self.TaskListHead and nowTime > self.TaskListHead.ActionTime then
		local task = self.TaskListHead;
		self.TaskListHead = self.TaskListHead.Next;
		--print('~~~~~~~~~~~~~task.Func(unpack(task.Param));',task.Func)
		task.Func(unpack(task.Param));
		if task.RunTimes then
			task.RunTimes = task.RunTimes - 1;
			if task.RunTimes == 0 then
				task = nil;
				--[[
				self:Trace();
				--]]
				return true;
			end;
		end;
		task:Action();
		--[[
		self:Trace();
		--]]
	end;
	return true;
end;

--遍历队列里所有任务并打印
function CAlarmClock:Trace()
	_info("------------------------------------")
	local temp1 = self.TaskListHead;
	while temp1 do
		_info(temp1.GlobalID, _G.CTimeFormat:mtodate(temp1.ActionTime));
		temp1 = temp1.Next;
	end;
	_info("------------------------------------")
end;

--定时器周期类型
_G.CAlarmTaskCycleType = {
	eMinute = 1,--周期单位分钟
	eHour	= 2,--周期单位小时
	eDay	= 3,--周期单位天
	eWeek	= 4,--周期单位周
	eMonth  = 5,--周期单位月
	eYear	= 6,--周期单位年
};

_G.CAlarmTask = {};
function CAlarmTask:new(GlobalID, Time, CycleType, CycleTime, RunTimes, Func, Param)
	local obj = {};
	obj.GlobalID = GlobalID;
	
	obj.ActionTime = CTimeFormat:GetThisTimeMsec(Time.n_Year, Time.n_Month, Time.n_Day, Time.n_Hour, Time.n_Minute, Time.n_Second);
	
	if CycleType == _G.CAlarmTaskCycleType.eMinute then
		obj.CycleTime = CycleTime * ONE_MINUTE_MSEC;
	elseif CycleType == _G.CAlarmTaskCycleType.eHour then
		obj.CycleTime = CycleTime * ONE_HOUR_MSEC;
	elseif CycleType == _G.CAlarmTaskCycleType.eDay then
		obj.CycleTime = CycleTime * ONE_DAY_MSEC;
	elseif CycleType == _G.CAlarmTaskCycleType.eWeek then
		obj.CycleTime = CycleTime * ONE_WEEK_MSEC;
	else
		obj.CycleType = CycleType;
		obj.CycleTimes = CycleTime;
	end;
	
	while obj.ActionTime <= _now() do
		if obj.CycleTime then
			obj.ActionTime = obj.ActionTime + obj.CycleTime;
		else
			if obj.CycleType == _G.CAlarmTaskCycleType.eMonth then
				local year, month, day, hour, minute, second = CTimeFormat:mtodate(obj.ActionTime, true, false);
				month = month + obj.CycleTimes;
				while month > 12 do
					year = year + 1;
					month = month - 12;
				end;
				obj.ActionTime = CTimeFormat:GetThisTimeMsec(year, month, day, hour, minute, second);
			elseif obj.CycleType == _G.CAlarmTaskCycleType.eYear then
				local year, month, day, hour, minute, second = CTimeFormat:mtodate(obj.ActionTime, true, false);
				year = year + obj.CycleTimes;
				obj.ActionTime = CTimeFormat:GetThisTimeMsec(year, month, day, hour, minute, second);
			end;
		end;
	end;
	
	if RunTimes and RunTimes > 0 then
		obj.RunTimes = RunTimes;
	else
		obj.RunTimes = nil;
	end;
	obj.Func = Func;
	obj.Param = Param;
	obj.Next = nil;
--	_info("add-new", obj.GlobalID, _G.CTimeFormat:mtodate(obj.ActionTime));
	for k, v in pairs(CAlarmTask) do
		if type(v) == "function" then
			obj[k] = v;
		end;
	end;
	return obj;
end;
function CAlarmTask:Action()
	if self.CycleTime then
		self.ActionTime = self.ActionTime + self.CycleTime;
	else
		if self.CycleType == _G.CAlarmTaskCycleType.eMonth then
			local year, month, day, hour, minute, second = CTimeFormat:mtodate(self.ActionTime, true, false);
			month = month + self.CycleTimes;
			while month > 12 do
				year = year + 1;
				month = month - 12;
			end;
			self.ActionTime = CTimeFormat:GetThisTimeMsec(year, month, day, hour, minute, second);
		elseif self.CycleType == _G.CAlarmTaskCycleType.eYear then
			local year, month, day, hour, minute, second = CTimeFormat:mtodate(self.ActionTime, true, false);
			year = year + self.CycleTimes;
			self.ActionTime = CTimeFormat:GetThisTimeMsec(year, month, day, hour, minute, second);
		end;
	end;
	_G.CAlarmClock:AddTaskInList(self);
end;
--添加定时任务
----Time结构体定义任务从什么时候开始，如开始时间小于os.now()，会自动按循环周期向后滚动直到大于os.now()。
--------从os.now()开始，则为空表{}

--------指定已经换算好毫秒数，则为{dwMsec = 12345678};
--------今天的几点几分，如20点30分，则为 {dwTime = "20:30"}
--------本月的几号的几点几分，如5号的20点30分，则为{dwDay = "5", dwTime = "20:30" };
--------本年的几月几号的几点几分，如5月5号的20点30分，则为{dwMonth = "5", dwDay = "5", dwTime = "20:30"};
--------几年几月几号的几点几分，如2012年5月5号20点30分，则为{dwYear = "2012", dwMonth = "5", dwDay = "5", dwTime = "20:30"};

--------本周星期几的几点几分，如星期一20点30分，则为{dwWeek = "0", dwTime = "20:30"}周一是0， 以此类推，6为周日
--****dwWeek 和 dwYear dwMonth dwDay 不应该同时出现
--------几月第几个星期几的几点几分，如5月第一个星期日20点30分，则为。。。待定，需要时候再加。

----CycleType	循环周期单位
---- _G.CAlarmTaskCycleType = {
	-- eMinute 	= 1,--周期单位分钟
	-- eHour	= 2,--周期单位小时
	-- eDay	= 3,--周期单位天
	--eWeek	= 4,--周期单位周
	--eMonth  	= 5,--周期单位月
	--eYear	= 6,--周期单位年
-- --};
--****用月和年作为循环周期，请确保day不为28以上，尤其是月为周期，因为月份有小月大月。。。
----CycleTime	循环间隔 几分钟、几小时、几天、几周、几月、几年
----RunTimes	循环执行次数，大于0为有效次数，小于等于0为无限循环直到海枯石烂
----Func		执行的函数
----Param		执行的函数参数表
----返回值为任务ID，用于删除操作，如返回0，则说明添加任务失败
function CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, Func, Param, b_IsTest)
	--if not b_IsTest then return 0 end;
	--检测参数有效性
	local year, month, day, hour, minute, second;
	if CycleTime <= 0 then
		_err("CycleTime <= 0!!!");
		return 0;
	end;
	if (CycleType < _G.CAlarmTaskCycleType.eMinute) or (CycleType > _G.CAlarmTaskCycleType.eYear) then
		_err("CycleType error <= 0!!!");
		return 0;
	end;
	if type(Param) ~= "table" then
		_err("Param error");
		return 0;
	end;
	if Time.dwMsec then
		local msec = tonumber(Time.dwMsec);
		if not msec then return 0 end;
		year, month, day, hour, minute, second = CTimeFormat:mtodate(msec, true, false)
	else
		year, month, day, hour, minute, second = CTimeFormat:todate(os.now(1), true, false);
		if Time.dwWeek then
			local week = tonumber(Time.dwWeek);
			if week < 0 or week > 6 then return 0 end;
			local todayWeek = CTimeFormat:DayToWeek(year, month, day);
			if todayWeek > week then--说明已过
				day = day - (todayWeek - week);
			else
				day = day + (week - todayWeek);
			end;
		else
			if Time.dwYear then
				year = tonumber(Time.dwYear);
				if not year then return 0 end;
			end;
			if Time.dwMonth then
				month = tonumber(Time.dwMonth);
				if not month then return 0 end;
				if month < 1 or month > 12 then return 0 end;
			end;
			if Time.dwDay then
				day = tonumber(Time.dwDay);
				if not day then return 0 end;
				local days = IsLeapYear(year) and Day2 or Day1;
				if day < 1 or day > days[month] then return 0 end;
			end;
		end;
		if Time.dwTime then
			local _, _, s_Hour, s_Minute = string.find(Time.dwTime, "(%d*):(%d*)");
			hour = tonumber(s_Hour);
			minute = tonumber(s_Minute);
			second = 0;
			if not hour or not minute then return 0 end;
		end;
	end;
	
	Time = {};
	Time.n_Year		= year;
	Time.n_Month	= month;
	Time.n_Day 		= day;
	Time.n_Hour 	= hour;
	Time.n_Minute 	= minute;
	Time.n_Second 	= second;
	
	--通过，往任务队列中插入
	self.dwGlobalID = self.dwGlobalID + 1;
	local task = CAlarmTask:new(self.dwGlobalID, Time, CycleType, CycleTime, RunTimes, Func, Param);
	self:AddTaskInList(task);
	return self.dwGlobalID;
end
--删除任务 globalID为AddTask时返回的self.dwGlobalID
function CAlarmClock:DelTask(globalID)
	local temp1 = self.TaskListHead;
	local temp2 = temp1.Next;
	--如果是头结点
	if temp1.GlobalID == globalID then
		self.TaskListHead = temp2;
		return true;
	end;
	--向后查找
	while temp2 do
		if temp2.GlobalID == globalID then
			temp1.Next = temp2.Next;
			temp2 = nil;
			return true;
		else
			temp1 = temp2;
			temp2 = temp2.Next;
		end;
	end;
	return false;
end;
--将任务添加到链表中
function CAlarmClock:AddTaskInList(task)
	local temp = self.TaskListHead;
	if not temp then
		self.TaskListHead = task;
	elseif task.ActionTime <= temp.ActionTime then
		self.TaskListHead = task;
		task.Next = temp;
	else
		while temp do
			if task.ActionTime > temp.ActionTime and ( not temp.Next or task.ActionTime <= temp.Next.ActionTime)then
				local nextTask = temp.Next;
				temp.Next = task;
				task.Next = nextTask;
				break;
			else
				temp = temp.Next; 
			end;
		end;
	end;
	--[[测试用
	self:Trace();
	--]]
end;


-------------------------------------------------test----------------------------------------------------------
-- local Time1 = {dwWeek = "0", dwTime = "21:45"};
-- local Time2 = {dwWeek = "1", dwTime = "21:45"};
-- local Time3 = {dwWeek = "2", dwTime = "21:45"};
-- local Time4 = {dwWeek = "3", dwTime = "21:45"};
-- local Time5 = {dwWeek = "4", dwTime = "21:45"};
-- local Time6 = {dwWeek = "5", dwTime = "21:45"};
-- local Time7 = {dwWeek = "6", dwTime = "21:45"};
-- local Time1 = {
	-- dwYear = "2012",
	-- dwMonth = "05",
	-- dwDay = "09",
	-- dwTime = "21:30"
-- };
--_G.CAlarmClock:AddTask({}, _G.CAlarmTaskCycleType.eMinute, 5, 2, print, {"-------1"}, true);
-- _G.CAlarmClock:AddTask(Time1, _G.CAlarmTaskCycleType.eHour, 1, 2, print, {"-------2"}, true);
-- _G.CAlarmClock:AddTask(Time1, _G.CAlarmTaskCycleType.eDay, 1, 2, print, {"-------3"}, true);
-- _G.CAlarmClock:AddTask(Time1, _G.CAlarmTaskCycleType.eWeek, 1, 2, print, {"-------4"}, true);
-- _G.CAlarmClock:AddTask(Time1, _G.CAlarmTaskCycleType.eWeek, 5, 2, print, {"-------5"}, true);
-- _G.CAlarmClock:AddTask(Time1, _G.CAlarmTaskCycleType.eMonth, 1, 2, print, {"-------6"}, true);
-- _G.CAlarmClock:AddTask(Time1, _G.CAlarmTaskCycleType.eMonth, 5, 2, print, {"-------7"}, true);
-- _G.CAlarmClock:AddTask(Time1, _G.CAlarmTaskCycleType.eYear, 1, 2, print, {"-------8"}, true);
-- _G.CAlarmClock:AddTask(Time1, _G.CAlarmTaskCycleType.eYear, 5, 2, print, {"-------9"}, true);

