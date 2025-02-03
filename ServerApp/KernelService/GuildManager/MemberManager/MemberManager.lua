-------------------------------------------------------------------------------
--公会成员数据
-------------------------------------------------------------------------------
local szTable = 'T_Guild_Member'
local tabPrimeKey = { 'dwRoleID' }
local tabDataKey = {
	'dwGuildID','szRoleName','dwLevel','dwClass','dwDate',
	'dwContribute','dwWelfare','dwRank','dwPower'
}
CGuildDatabase:AddTable(szTable,tabPrimeKey,tabDataKey)
-------------------------------------------------------------------------------
_G.CGuildMember = CGuildData:inherit()
CGuildMember.table = 'T_Guild_Member'
function CGuildMember:Create(tabInfo)
	self.dwGuildID = tabInfo.dwGuildID --公会ID
	self.dwRoleID = tabInfo.dwRoleID --玩家ID
	self.szRoleName = tabInfo.szRoleName or '' --玩家名
	self.dwLevel = tabInfo.dwLevel or 1 --玩家等级
	self.dwClass = tabInfo.dwProf or tabInfo.dwClass --玩家职业
	self.dwDate = tabInfo.dwDate or _now() --玩家加入时间
	self.dwContribute = tabInfo.dwContribute or 0 --玩家贡献度
	self.dwWelfare = tabInfo.dwWelfare or 0 --领取福利时间
	self.dwRank = tabInfo.dwRank or #GuildRankConfig --玩家职务
	self.dwPower = tabInfo.dwPower or 0 --玩家战斗力
	-- no record
	self.szGuildName = tabInfo.szGuildName or '' --玩家公会名称
	self.bOnline = tabInfo.bOnline or false --玩家是否在线
	self.dwTitle = tabInfo.dwTitle or 1 --玩家称谓
end
-------------------------------------------------------------------------------
--公会成员系统
-------------------------------------------------------------------------------
_G.CGuildMemberMgr = CGuildBaseMgr:inherit()
function CGuildMemberMgr:Create()
	self.tabDataMap = {}
	self.tabDataList = {}
	local objDB = CGuildDatabase:GetTable('T_Guild_Member')
	local tabRes = objDB:Select() or {}
	for _,v in pairs(tabRes) do
		local objMember = CGuildMember:new(v)
		self:Add(objMember)
	end
end
function CGuildMemberMgr:Add(objMember)
	local dwRoleID = objMember.dwRoleID
	self.tabDataMap[dwRoleID] = objMember
	local dwGuildID = objMember.dwGuildID
	local tabList = self.tabDataList[dwGuildID] or {}
	tabList[dwRoleID] = true
	self.tabDataList[dwGuildID] = tabList
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if objGuild then
		objMember.szGuildName = objGuild.szGuildName
		objGuild.dwMember = objGuild.dwMember + 1
		objGuild.dwPower = objGuild.dwPower + objMember.dwPower
		if objMember.dwRank == 1 then
			objGuild.dwLeaderID = objMember.dwRoleID
			objGuild.szLeaderName = objMember.szRoleName
		end
		if objMember.dwRank == 2 then
			objGuild.dwElderCount = objGuild.dwElderCount + 1
		end
		if CTimeFormat:isToday(objMember.dwWelfare) then
			objGuild.dwSignIn = objGuild.dwSignIn + 1
		end
	end
	return objMember
end
function CGuildMemberMgr:Get(dwRoleID)
	return self.tabDataMap[dwRoleID]
end
function CGuildMemberMgr:Del(dwRoleID)
	local objMember = self.tabDataMap[dwRoleID]
	if not objMember then return end
	self.tabDataMap[dwRoleID] = nil
	local dwGuildID = objMember.dwGuildID
	local tabList = self.tabDataList[dwGuildID] or {}
	tabList[dwRoleID] = nil
	self.tabDataList[dwGuildID] = tabList
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if objGuild then
		objMember.szGuildName = ''
		objGuild.dwMember = objGuild.dwMember - 1
		objGuild.dwPower = objGuild.dwPower - objMember.dwPower
		if objMember.dwRank == 1 then
			objGuild.dwLeaderID = nil
			objGuild.szLeaderName = ''
		end
		if objMember.dwRank == 2 then
			objGuild.dwElderCount = objGuild.dwElderCount - 1
		end
	end
	return objMember
end
function CGuildMemberMgr:GetMemberList(dwGuildID)
	local tabMemberList = self.tabDataList[dwGuildID]
	local temp = {}
	for k,v in pairs(tabMemberList or {}) do temp[k] = v end
	return temp
end
-------------------------------------------------------------------------------
function CGuildMemberMgr:InitPlayer(dwRoleID)
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then
		CGuildPlayerMsg:NotifyPlayer(dwRoleID,'OnInitPlayer')
		return
	end
	local dwGuildID = objMember.dwGuildID
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then
		CGuildPlayerMsg:NotifyPlayer(dwRoleID,'OnInitPlayer')
		return
	end
	local tabGuild = {}
	for k,v in pairs(objGuild) do tabGuild[k] = v end
	local tabMember = {}
	for k,v in pairs(objMember) do tabMember[k] = v end
	local objDonate = CGuildDonateMgr:Get(dwRoleID) or {}
	tabMember.dwMaxContribute = objDonate.dwContribute or 0
	local tabMemberList = CGuildMemberMgr:GetMemberList(dwGuildID)
	local tabTrophyList = CGuildTrophyMgr:GetTrophyList(dwGuildID)
	local tabChartList = CGuildChartMgr:GetChartList(dwGuildID)
	local tabSkillList = CGuildSkillMgr:GetSkillList(dwGuildID)
	--计算家主不在线的时长
	if tabGuild.tmLeaderOffTime ~= -1 then
		tabGuild.tmLeaderOffTime = _now() - tabGuild.tmLeaderOffTime or 0;
	end
	
	CGuildPlayerMsg:NotifyPlayer(
		dwRoleID,'OnInitPlayer',tabGuild,tabMember,
		tabMemberList,tabTrophyList,tabChartList,tabSkillList
	)
	local dwRank = tabMember.dwRank
	local bFlag = CGuildManager:GetAuthority(dwRank,'Recruit')
	local tabApplyList = CGuildApplyMgr:GetApplyList(dwGuildID)
	if bFlag and next(tabApplyList) then
		CGuildPlayerMsg:NotifyPlayer(dwRoleID,'OnApplyGuild',true)
	end
	local tabEscort = CGuildEscortMgr:Get(dwGuildID)
	if tabEscort then
		CGuildPlayerMsg:NotifyPlayer(dwRoleID,"OnInitEscort")
	end
	local szGuildName = CAllianceLeaderManager:GetGuildName()
	if objGuild.szGuildName == szGuildName then
		CGuildPlayerMsg:NotifyPlayer(dwRoleID,"OnInitEmperor")
	end
end
-------------------------------------------------------------------------------
