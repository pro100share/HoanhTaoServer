----------------------------------------------------------------------------------
--获取族长信息
function CGuildManager:GetLeaderInfo(dwGuildID)
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then return end
	return CGuildMemberMgr:Get(objGuild.dwLeaderID)
end
function CGuildManager:GetLeaderInfoByRoleID(dwRoleID)
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then return end
	local objGuild = CGuildInfoMgr:Get(objMember.dwGuildID)
	if not objGuild then return end
	return CGuildMemberMgr:Get(objGuild.dwLeaderID)
end
--获取世家名称
function CGuildManager:GetGuildName(dwGuildID)
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if objGuild then return objGuild.szGuildName end
end
function CGuildManager:GetGuildNameByRoleID(dwRoleID)
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then return end
	local objGuild = CGuildInfoMgr:Get(objMember.dwGuildID)
	if objGuild then return objGuild.szGuildName end
end
function CGuildManager:GetGuildIDByRoleID(dwRoleID)
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if objMember then return objMember.dwGuildID end
end
--获取世家信息
function CGuildManager:GetGuildInfo(dwGuildID)
	return CGuildInfoMgr:Get(dwGuildID)
end
function CGuildManager:GetGuildInfoByRoleID(dwRoleID)
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then return end
	return CGuildInfoMgr:Get(objMember.dwGuildID)
end
--获取资源信息
function CGuildManager:GetResourceInfo(dwGuildID)
	local objResource = CGuildResourceMgr:Get(dwGuildID)
	if not objResource then
		objResource = CGuildResource:new()
		objResource.dwGuildID = dwGuildID
		CGuildResourceMgr:Add(objResource):Insert()
	end
	return objResource
end
--获取镖车信息
function CGuildManager:GetEscortInfo(dwGuildID)
	return CGuildEscortMgr:Get(dwGuildID)
end
--获取商店信息
function CGuildManager:GetMarketInfo(dwGuildID)
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then return end
	local tabList = {}
	for _,v in pairs(GuildShopConfig) do
		local objItem = CGuildMarketMgr:Get(dwGuildID,v.dwItemEnum)
		if not objItem then
			objItem = CGuildItem:new()
			objItem.dwGuildID = dwGuildID
			objItem.dwItemEnum = v.dwItemEnum
			objItem.dwItemNumber = v.dwItemStock
			CGuildMarketMgr:Add(objItem):Insert()
		end
		table.insert(tabList,objItem)
	end
	return tabList
end
--获取成员信息
function CGuildManager:GetMemberInfo(dwRoleID)
	return CGuildMemberMgr:Get(dwRoleID)
end
--获取权限信息
function CGuildManager:GetAuthority(dwRank,szOper)
	local tabAuthority = GuildAuthorityConfig[dwRank]
	if not tabAuthority then return end
	return tabAuthority[szOper]
end
--获取世家战标志
function CGuildManager:GetCombatFlag()
	return self.bCombatFlag
end
--设置世家战标志
function CGuildManager:SetCombatFlag(bFlag)
	self.bCombatFlag = bFlag
end
--添加日志
function CGuildManager:InsertLog(dwGuildID,eType,dwStringID,...)
	local tabLog = {}
	tabLog.dwLogID = CGuildIDFactory:Generate('dwLogID')
	tabLog.eType = eType
	tabLog.dwGuildID = dwGuildID
	local szText = SysStringConfigInfo[dwStringID]
	tabLog.szText = string.format(szText,...)
	local objLog = CGuildLog:new(tabLog)
	CGuildLogMgr:Add(objLog):Insert()
	
	local tabLogList = CGuildLogMgr:GetLogList(dwGuildID)
	local tabTemp = {}
	for dwLogID in pairs(tabLogList) do
		table.insert(tabTemp,dwLogID)
	end
	local fnSort = function(a,b)
		local objA = CGuildLogMgr:Get(a)
		local objB = CGuildLogMgr:Get(b)
		return objA.dwDate < objB.dwDate
	end
	table.sort(tabTemp,fnSort)
	if #tabTemp > 50 then
		for i = 1, #tabTemp - 50 do
			CGuildLogMgr:Del(tabTemp[i]):Delete()
		end
	end
end
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--获取世家信息列表
function CGuildManager:GetGuildInfoList(dwStart,dwEnd)
	local tabList = {}
	local tabOrder = CGuildInfoMgr:GetOrder()
	for i = dwStart,dwEnd do
		local dwGuildID = tabOrder[i]
		if dwGuildID then
			local objGuild = CGuildInfoMgr:Get(dwGuildID)
			table.insert(tabList,objGuild)
		end
	end
	tabList.dwLength = #tabOrder
	return tabList
end
----------------------------------------------------------------------------------
--获取世家搜索列表
function CGuildManager:GetGuildSearchList(szGuild,szLeader,dwStart,dwEnd)
	local tabSearchList = {}
	local tabGuildList = CGuildInfoMgr:GetOrder()
	for _,dwGuildID in ipairs(tabGuildList or {}) do
		local objGuild = CGuildInfoMgr:Get(dwGuildID)
		local bGuildFlag = true
		if szGuild and szGuild ~= '' then
			bGuildFlag = string.find(objGuild.szGuildName,szGuild)
		end
		local bLeaderFlag = true
		if szLeader and szLeader~= '' then
			bLeaderFlag = string.find(objGuild.szLeaderName,szLeader)
		end
		if bGuildFlag and bLeaderFlag then
			table.insert(tabSearchList,objGuild)
		end
	end
	local tabList = {}
	for i = dwStart,dwEnd do
		if tabSearchList[i] then
			table.insert(tabList,tabSearchList[i])
		end
	end
	tabList.dwLength = #tabSearchList
	return tabList
end
----------------------------------------------------------------------------------
--获取世家成员列表
function CGuildManager:GetGuildMemberList(dwGuildID)
	local tabList = {}
	local tabMemberList = CGuildMemberMgr:GetMemberList(dwGuildID)
	for dwRoleID in pairs(tabMemberList) do
		local objMember = CGuildMemberMgr:Get(dwRoleID)
		table.insert(tabList,objMember)
	end
	return tabList
end
----------------------------------------------------------------------------------
--获取世家申请列表
function CGuildManager:GetGuildApplyList(dwGuildID)
	local tabApplyList = CGuildApplyMgr:GetApplyList(dwGuildID)
	local tabList = {}
	for dwRoleID in pairs(tabApplyList) do
		local objApply = CGuildApplyMgr:Get(dwGuildID,dwRoleID)
		table.insert(tabList,objApply)
	end
	return tabList
end
----------------------------------------------------------------------------------
--获取世家捐献列表
function CGuildManager:GetGuildDonateList(dwGuildID)
	local tabList = {}
	local tabMemberList = CGuildMemberMgr:GetMemberList(dwGuildID)
	for dwRoleID in pairs(tabMemberList) do
		local objMember = CGuildMemberMgr:Get(dwRoleID)
		local objDonate = CGuildDonateMgr:Get(dwRoleID)
		if objDonate then
			objDonate.szRoleName = objMember.szRoleName
			table.insert(tabList,objDonate)
		end
	end
	return tabList
end
----------------------------------------------------------------------------------
--获取世家日志列表
function CGuildManager:GetGuildLogList(dwGuildID)
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then return end
	local tabList = {}
	local tabLogList = CGuildLogMgr:GetLogList(dwGuildID)
	for dwLogID in pairs(tabLogList) do
		local objLog = CGuildLogMgr:Get(dwLogID)
		table.insert(tabList,objLog)
	end
	return tabList
end
----------------------------------------------------------------------------------
--获取龙鼎的所有者ID
function CGuildManager:GetGuildIDByTrophyID(dwTrophyID)
	local tabTrophy = CGuildTrophyMgr:Get(dwTrophyID)
	if tabTrophy then return tabTrophy.dwGuildID end
end
----------------------------------------------------------------------------------
--获取所有鼎的所有者信息
function CGuildManager:GetAllTrophyInfo()
	local tabInfo = {}
	for i = 1,9 do
		local tabTrophy = CGuildTrophyMgr:Get(i)
		if tabTrophy then
			local tabGuild = CGuildInfoMgr:Get(tabTrophy.dwGuildID)
			if tabGuild then
				tabInfo[i] = tabGuild.szGuildName
			end
		end
	end
	return tabInfo
end
----------------------------------------------------------------------------------
--获得盟主回调
function CGuildManager:OnGainEmperor(dwGuildID)
	CGuildPlayerMsg:NotifyGuild(dwGuildID,"OnGainEmperor")
end
----------------------------------------------------------------------------------
--失去盟主回调
function CGuildManager:OnLostEmperor(dwGuildID)
	CGuildPlayerMsg:NotifyGuild(dwGuildID,"OnLostEmperor")
end
----------------------------------------------------------------------------------