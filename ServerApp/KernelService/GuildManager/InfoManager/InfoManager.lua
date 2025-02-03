-------------------------------------------------------------------------------
--公会信息数据
-------------------------------------------------------------------------------
local szTable = 'T_Guild_Info'
local tabPrimeKey = { 'dwGuildID' }
local tabDataKey = {
	'szGuildName','dwLevel','dwDate','szAnnounce','dwActive',
	'bAutoAcceptFlag','dwAutoAcceptLevel',
}
CGuildDatabase:AddTable(szTable,tabPrimeKey,tabDataKey)
-------------------------------------------------------------------------------
_G.CGuildInfo = CGuildData:inherit()
CGuildInfo.table = 'T_Guild_Info'
function CGuildInfo:Create(tabInfo)
	self.dwGuildID = tabInfo.dwGuildID --公会ID
	self.szGuildName = tabInfo.szGuildName or '' --公会名
	self.dwLevel = tabInfo.dwLevel or 1 --等级
	self.dwActive = tabInfo.dwActive or 0 --活跃度
	self.dwDate = tabInfo.dwDate or _now() --创建时间
	self.szAnnounce = tabInfo.szAnnounce or '' --公告
	self.bAutoAcceptFlag = tabInfo.bAutoAcceptFlag or false --自动接受申请
	self.dwAutoAcceptLevel = tabInfo.dwAutoAcceptLevel or 30 --自动接受等级
	-- no record
	self.dwNumber = tabInfo.dwNumber or 0 --排名
	self.dwMember = tabInfo.dwMember or 0 --成员数
	self.dwPower = tabInfo.dwPower or 0 --战斗力
	self.dwLeaderID = tabInfo.dwLeaderID or 0 --族长ID
	self.szLeaderName = tabInfo.szLeaderName or '' --族长名
	self.dwElderCount = tabInfo.dwElderCount or 0 --长老数
	self.dwSignIn = tabInfo.dwSignIn or 0 --签到数
	self.tmLeaderOffTime = -1;--家主离线时间
end
-------------------------------------------------------------------------------
--公会信息系统
-------------------------------------------------------------------------------
_G.CGuildInfoMgr = CGuildBaseMgr:inherit()
function CGuildInfoMgr:Create()
	self.tabDataMap = {}
	self.tabOrderList = {}
	CAlarmClock:AddTask(
		{dwTime = '03:00'},CAlarmTaskCycleType.eDay,1,0,
		function() self:Sort() end,{}
	);
	CAlarmClock:AddTask(
		{dwTime = '00:00'},CAlarmTaskCycleType.eDay,1,0,
		function() self:Refresh() end,{}
	);
	local objDB = CGuildDatabase:GetTable('T_Guild_Info')
	local tabRes = objDB:Select() or {}
	for _,v in pairs(tabRes) do
		local objGuild = CGuildInfo:new(v)
		self:Add(objGuild)
	end
end
function CGuildInfoMgr:Add(objGuild)
	objGuild.dwNumber = #self.tabOrderList + 1
	local dwGuildID = objGuild.dwGuildID
	table.insert(self.tabOrderList,dwGuildID)
	self.tabDataMap[dwGuildID] = objGuild
	return objGuild
end
function CGuildInfoMgr:Get(dwGuildID)
	return self.tabDataMap[dwGuildID]
end
function CGuildInfoMgr:Del(dwGuildID)
	local objGuild = self.tabDataMap[dwGuildID]
	if not objGuild then return end
	self.tabDataMap[dwGuildID] = nil
	local dwIndex
	for k,v in pairs(self.tabOrderList) do
		if v == dwGuildID then dwIndex = k end
	end
	if dwIndex then
		table.remove(self.tabOrderList,dwIndex)
		for i = dwIndex,#self.tabOrderList do
			local dwGuildID = self.tabOrderList[i]
			local objGuild = self.tabDataMap[dwGuildID]
			objGuild.dwNumber = i
		end
	end
	return objGuild
end
-------------------------------------------------------------------------------
function CGuildInfoMgr:Iterator(fn)
	for k,v in pairs(self.tabDataMap) do fn(v) end
end
function CGuildInfoMgr:GetOrder()
	return self.tabOrderList
end
function CGuildInfoMgr:Sort()
	local temp = {}
	for k,v in pairs(self.tabDataMap) do
		table.insert(temp,v)
	end
	local fnSort = function(a,b)
		if a.dwPower ~= b.dwPower then
			return a.dwPower > b.dwPower
		end
		return a.dwGuildID < b.dwGuildID
	end
	table.sort(temp,fnSort)
	
	self.tabOrderList = {}
	for dwNumber,objGuild in pairs(temp) do
		objGuild.dwNumber = dwNumber
		self.tabOrderList[dwNumber] = objGuild.dwGuildID
	end
end
function CGuildInfoMgr:Refresh()
	for k,v in pairs(self.tabDataMap) do v.dwSignIn = 0 end
end

function CGuildInfoMgr:InitGuildLeaderOffTime()
	for id,objGuild in pairs(self.tabDataMap)do
		objGuild.tmLeaderOffTime = self:ReadLeaderOffTime(objGuild.dwLeaderID);
	end
end
function CGuildInfoMgr:ReadLeaderOffTime(dwRoleID)
	local dbres = CPlayerDBQuery:GetDBQuery():execute_sync('select "tmDownlineTime" from "T_Role_Info" where "dwRoleID"=$1',dwRoleID);
	if dbres then
		return dbres[1].tmDownlineTime;
	end
end;
-------------------------------------------------------------------------------