-------------------------------------------------------------------------------
--公会管理器
-------------------------------------------------------------------------------
_G.CGuildManager = CSingle:new()
_G.CGuildManager.tabMgrList = {}
CSingleManager:AddSingle(CGuildManager,true)
-------------------------------------------------------------------------------
function CGuildManager:Create()
	--DBCommand
	local objDB = CPlayerDBQuery:GetDBQuery()
	CGuildDBCommand:Create(objDB);
	--IDFactory
	CGuildIDFactory:Create();
	--SystemList
	for _,objMgr in ipairs(self.tabMgrList) do
		objMgr:Create()
	end
	--------------------------fix--------------------------
	local tabList = {}
	local fn = function(objGuild)
		if objGuild.dwMember == 0 then
			table.insert(tabList,objGuild.dwGuildID)
		end
	end
	CGuildInfoMgr:Iterator(fn)
	for _,dwGuildID in pairs(tabList) do
		CGuildInfoMgr:Del(dwGuildID):Delete()
	end
	--------------------------end--------------------------
	--SortGuild
	CGuildInfoMgr:Sort()
	self:ClearCurTime() ---零点清世家摇奖当前次数
	
	--设置家主离线时间
	CGuildInfoMgr:InitGuildLeaderOffTime();
	return true;
end;
function CGuildManager:Update(dwInterval)
	for _,objMgr in ipairs(self.tabMgrList) do
		objMgr:Update(dwInterval)
	end
	return true;
end;
function CGuildManager:Destroy()
	for _,objMgr in ipairs(self.tabMgrList) do
		objMgr:Destroy()
	end
	return true;
end;
-------------------------------------------------------------------------------
function CGuildManager:AddMgr(objMgr)
	table.insert(self.tabMgrList,objMgr)
end
function CGuildManager:DoEvent(szEvent,...)
	for k,v in pairs(self.tabMgrList) do
		local fn = v[szEvent]
		if fn then fn(v,...) end
	end
end
--更新抽奖次数
function CGuildManager:ClearCurTime()
	local Time = {dwTime = "24:00"};
	local CycleType
		= _G.CAlarmTaskCycleType.eDay;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {CGuildManager};
	local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, function() CGuildManager:ClearCurTimeInfo() end, Param);
end;

function CGuildManager:ClearCurTimeInfo()
	CPlayerDBQuery:GetDBQuery():execute('update "T_Role_GuildLD" set "dwCurLDTime" = $1', 0);
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.OnGuildServerMsg{ Cmd = 'ClearCurTimeInfo',Info = {} }
	end
end;












-------------------------------------------------------------------------------
--多维表
-------------------------------------------------------------------------------
_G.CGuildMutiMap = {}
function CGuildMutiMap:new(deep)
	local obj = {}
	obj.deep = deep
	obj.data = {}
	setmetatable(obj,{ __index = self })
	return obj
end
function CGuildMutiMap:Get(...)
	local arg = {...}
	local des = self.data
	for i = 1,self.deep do
		local idx = arg[i]
		des = des[idx]
		if not des then break end
	end
	return des
end
function CGuildMutiMap:Set(...)
	local arg = {...}
	local des = self.data
	for i = 1,self.deep - 1 do
		local idx = arg[i]
		des[idx] = des[idx] or {}
		des = des[idx]
	end
	des[arg[self.deep]] = arg[self.deep + 1]
end
function CGuildMutiMap:Iterator(fn,i,des)
	i = i or self.deep
	des = des or self.data
	if i == 1 then
		for k,v in pairs(des) do
			fn(v)
		end
	elseif i > 1 then
		for k,v in pairs(des) do
			self:Iterator(fn,i-1,v)
		end
	end
end
-------------------------------------------------------------------------------
--管理器基类
-------------------------------------------------------------------------------
_G.CGuildBaseMgr = {}
function CGuildBaseMgr:inherit()
	local class = {}
	setmetatable(class,{ __index = self })
	CGuildManager:AddMgr(class)
	return class
end
function CGuildBaseMgr:Create()
end
function CGuildBaseMgr:Update(dwInterval)
end
function CGuildBaseMgr:Destroy()
end
-------------------------------------------------------------------------------
--数据基类
-------------------------------------------------------------------------------
_G.CGuildData = {}
function CGuildData:new(data)
	local obj = {}
	setmetatable(obj,{ __index = self })
	obj:Create(data or {})
	return obj
end
function CGuildData:inherit()
	local class = {}
	setmetatable(class,{ __index = self })
	return class
end
function CGuildData:Insert()
	if self.table then
		CGuildDatabase:GetTable(self.table):Insert(self)
	end
	return self
end
function CGuildData:Delete()
	if self.table then
		CGuildDatabase:GetTable(self.table):Delete(self)
	end
	return self
end
function CGuildData:Update()
	if self.table then
		CGuildDatabase:GetTable(self.table):Update(self)
	end
	return self
end
-----------------------------------------------------------------------------------------------