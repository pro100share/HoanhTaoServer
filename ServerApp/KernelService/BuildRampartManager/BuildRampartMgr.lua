--[[
功能：修城墙ks管理器
类型：继承于CSingle类，用来管理修城墙进度及数值
版本：
	v1.0	21:15 2013-4-26	create by qy
]]

_G.CBuildMgr = CSingle:new();
CSingleManager:AddSingle(CBuildMgr);
--create
function CBuildMgr:Create()	
	self.PlanLapFul = false;
	self:GetBuildPlan();
	self:GetMaxContribute();
	--暂时屏蔽每日定时清理捐献次数等信息
	self:ClearContriValue();
	--检测是否已经清除捐献数据
	self:CheakClearData();
	return true;
end;

--每天12点清除捐献次数
function CBuildMgr:ClearContriValue()
	local Time = {dwTime = "00:01"};
	local CycleType
		= _G.CAlarmTaskCycleType.eDay;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {CBuildMgr};
	local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, CBuildMgr.ClearContriInfo, Param);
end;

--清除数据库数据并处理逻辑
function CBuildMgr:ClearContriInfo()
	CPlayerDBQuery:GetDBQuery():execute('update "T_Build_Rampart_Info" set "dwLabourValue" = $1, "dwWoodValue" = $2, "dwStoneValue" = $3, "dwLabourCD" = $4, "dwWoodCD" = $5, "dwStoneCD" = $6', 0,0,0,_now(),_now(),_now());
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.UpdateContriNumMsg{};	
	end;	
end;

--update
function CBuildMgr:Update(dwInterval)
	return true;
end;
--destroy
function CBuildMgr:Destroy()
end;
-------------------------
--从数据库中读出
function CBuildMgr:GetBuildPlan()
	local res = CPlayerDBQuery:GetDBQuery():execute('select "dwBuildPlan", "dwBuildValue" from "T_Build_Rampart_Plan"');
	if not res then
		CPlayerDBQuery:GetDBQuery():execute('insert into "T_Build_Rampart_Plan" values($1, $2)', 0, 0);
		self.BuildPlan = 0;
		self.BuildPlanValue = 0;
	else
		self.BuildPlan = res[1].dwBuildPlan;
		self.BuildPlanValue = res[1].dwBuildValue;
	end;
	self.PlanLapFul = self.BuildPlanValue >= _G.BuildConfig["totalContri"];
end;

function CBuildMgr:GetBuildPlanInfo()
	return self.BuildPlan, self.BuildPlanValue, self.PlanLapFul;
end;
function CBuildMgr:SetBuildPlan(value)
	local totalValue = _G.BuildConfig["totalContri"];
	local curPlanValue = self.BuildPlanValue + value;
	if curPlanValue > totalValue then
		curPlanValue = totalValue;
	end;
	local curPlanPer = curPlanValue / totalValue;
	local updateFlag = false;
	if curPlanPer >=  _G.BuildConfig["rate"][self.BuildPlan + 1] then
		self.BuildPlan = self.BuildPlan + 1;
		CPlayerDBQuery:GetDBQuery():execute('update "T_Build_Rampart_Plan" set "dwBuildPlan" = $1, "dwBuildValue" = $2', self.BuildPlan, curPlanValue);
		updateFlag = true;
		for i,objLine in pairs(CGameLineManager:GetAllLine()) do
			objLine.BRSys_BroadCastMsg{CurPer = self.BuildPlan};
		end;	
		CPlayerDBQuery:GetDBQuery():execute('update "T_Build_Rampart_Info" set "dwState" = $1, "dwStateFlag" = $2', self.BuildPlan, updateFlag);
	else
		CPlayerDBQuery:GetDBQuery():execute('update "T_Build_Rampart_Plan" set "dwBuildValue" = $1', curPlanValue);
	end;
	self.BuildPlanValue = curPlanValue;
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.ChgBuildPlanMsg{Plan = self.BuildPlan, PlanValue = curPlanValue, UpdateFlag = updateFlag, PlanLapFul = self.BuildPlanValue >= _G.BuildConfig["totalContri"]};	
	end;
	--捐献值已满
	if self.BuildPlanValue >= _G.BuildConfig["totalContri"] then
		self.BuildPlanValue = _G.BuildConfig["totalContri"];
		self.PlanLapFul = true;
		CBuildMgr:ClearContri();
	end;
end;
--定时清空捐献
function CBuildMgr:ClearContri()
	local Time = {};
	local CycleType
		= _G.CAlarmTaskCycleType.eMinute ;
	local CycleTime = _G.BuildConfig["ClearContri"] * 60;
	local CycleTime1 =  _G.BuildConfig["ContriExp"] * 60;
	local RunTimes = 1;
	local Param = {CBuildMgr};
	--清除捐献值
	if CycleTime > 0 then
		_G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, CBuildMgr.ClearContriRecord, Param);
	end;
	--清除10倍经验
	if CycleTime1 > 0 then
		_G.CAlarmClock:AddTask(Time, CycleType, CycleTime1, RunTimes, CBuildMgr.ClearContriExp, Param);
	end;
	CPlayerDBQuery:GetDBQuery():execute('update "T_Build_Clear" set "dwClearBuildTime" = $1', _now() + _G.BuildConfig["ClearContri"] * 60 * 60 * 1000);
end;

function CBuildMgr:ClearContriRecord()
	local curPlan = 0;
	local curValue = 0;
	self.BuildPlan = curPlan;
	self.BuildPlanValue = curValue;
	CPlayerDBQuery:GetDBQuery():execute('update "T_Build_Rampart_Plan" set "dwBuildValue" = $1, "dwBuildPlan" = $2', curValue, curPlan);
	CPlayerDBQuery:GetDBQuery():execute('update "T_Build_Rampart_Info" set "dwState" = $1, "dwStateFlag" = $2, "dwDiploidExp" = $3, "strGetAward" = $4, "dwContriValue" = $5', 1, false, false, "", 0);
	self.ContributeInfo = {};
	self.ContributeInfo[0] = {"", 0, 0}; 
	self.PlanLapFul = false;
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.ChgMaxContributeMsg{RoleId = 0, ContributeValue = 0, RoleName = "", IconId = 0, UpdateFlag = true};	
	end;
end;

function CBuildMgr:ClearContriExp()
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.ClearContriExpMsg{};	
	end;
	CPlayerDBQuery:GetDBQuery():execute('update "T_Build_Clear" set "dwClearBuildTime" = $1', 0);
end;
--初始化数据
function CBuildMgr:CheakClearData()
	local res = CPlayerDBQuery:GetDBQuery():execute('select "dwClearBuildTime" from "T_Build_Clear"');
	local nowTime = 0;
	if not res then
		CPlayerDBQuery:GetDBQuery():execute('insert into "T_Build_Clear" values($1)', 0);
	else
		nowTime = res[1].dwClearBuildTime;
	end;
	if nowTime ~= 0 then
		if nowTime <= _now() then
			self:ClearAllData();
		else
			local Time = {};
			local CycleType
				= _G.CAlarmTaskCycleType.eMinute ;
			local hour, mins, sec  = CTimeFormat:sec2format((nowTime - _now())/ 1000)
			local CycleTime = mins;
			local CycleTime1 = mins;
			if CycleTime <=0 then
				CycleTime = 1;
			end;
			if CycleTime1 <=0 then
				CycleTime1 = 1;
			end;
			local RunTimes = 1;
			local Param = {CBuildMgr};
			--清除捐献值
			if CycleTime > 0 then
				_G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, CBuildMgr.ClearContriRecord, Param);
			end;
			--清除10倍经验
			if CycleTime1 > 0 then
				_G.CAlarmClock:AddTask(Time, CycleType, CycleTime1, RunTimes, CBuildMgr.ClearContriExp, Param);
			end;
		end;
	end;
end;

function CBuildMgr:ClearAllData()
	self:ClearContriRecord();
	self:ClearContriExp();
	CPlayerDBQuery:GetDBQuery():execute('update "T_Build_Clear" set "dwClearBuildTime" = $1', 0);
end;

--众志成城记录
function CBuildMgr:GetMaxContribute()
	self.ContributeInfo = {};
	local res = CPlayerDBQuery:GetDBQuery():execute('SELECT "dwRoleId", "dwIconId", "strRoleName", "dwContriValue" FROM "public"."T_Build_Rampart_Info" order by "dwContriValue" desc limit 1');
	if res then
		local result = res[1];
		self.ContributeInfo[result.dwRoleId] = {result.strRoleName, result.dwIconId, result.dwContriValue};   --名字，头像id，贡献值
	else
		self.ContributeInfo[0] = {"", 0, 0};   --名字，头像id，贡献值
	end;
end;

--修改捐献记录并同步
function CBuildMgr:ChgMaxContribute(roleId, roleName, contributeValue, iconId)
	self.ContributeInfo = {};
	self.ContributeInfo[roleId] = {roleName, iconId, contributeValue};
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.ChgMaxContributeMsg{RoleId = roleId, ContributeValue = contributeValue, RoleName = roleName, IconId = iconId, UpdateFlag = false};	
	end;	
end;

function CBuildMgr:GetContributeInfo()
	return self.ContributeInfo;
end;

