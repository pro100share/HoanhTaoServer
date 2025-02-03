----------------------------------------------------------------------------------
--修改公告
function CGuildPlayerMsg:ModifyAnnounce(szText)
	--check
	local dwRoleID = self.dwSrcID
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then return end
	local dwGuildID = objMember.dwGuildID
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then return end
	local dwRank = objMember.dwRank
	local bFlag = CGuildManager:GetAuthority(dwRank,'Announce')
	if not bFlag then return end
	--execute
	objGuild.szAnnounce = szText
	objGuild:Update()
	local tabRefresh = { szAnnounce = szText }
	self:NotifyGuild(objGuild.dwGuildID,'OnRefreshGuild',tabRefresh)
end
----------------------------------------------------------------------------------
--升级世家
function CGuildPlayerMsg:UpgradeGuild()
	--check
	local dwRoleID = self.dwSrcID
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then return end
	local dwGuildID = objMember.dwGuildID
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then return end
	local dwRank = objMember.dwRank
	local bFlag = CGuildManager:GetAuthority(dwRank,'Upgrade')
	if not bFlag then 
		self:NotifyGuild(dwGuildID,'OnUpgradeGuildFail',dwRoleID)
		return 
	end
	if objGuild.dwLevel >= #GuildLevelConfig then return end
	local tabCost = GuildTotemConfig[objGuild.dwLevel].tabUpgrade
	if objGuild.dwActive < tabCost.dwActive then return end
	local objResource = CGuildResourceMgr:Get(dwGuildID)
	if not objResource then return end
	local tabIndex = { 'dwMoney','dwItem1','dwItem2','dwItem3','dwItem4' }
	for _,szIndex in pairs(tabIndex) do
		if objResource[szIndex] < tabCost[szIndex] then return end
	end
	--execute
	for _,szIndex in pairs(tabIndex) do
		objResource[szIndex] = objResource[szIndex] - tabCost[szIndex]
	end
	objResource:Update()
	objGuild.dwLevel = objGuild.dwLevel + 1
	objGuild:Update()
	local tabRefresh = {}
	tabRefresh.dwLevel = objGuild.dwLevel
	self:NotifyGuild(dwGuildID,'OnRefreshGuild',tabRefresh)
	local dwLevel = objGuild.dwLevel
	local dwMember = GuildLevelConfig[dwLevel].dwMember
	local eType = enGuildLog.eDonate
	CGuildManager:InsertLog(dwGuildID,eType,6001060003,dwLevel,dwMember)
	self:NotifyGuild(dwGuildID,'Notice',3,6001020007,dwLevel,dwMember)
	self:NotifyGuild(dwGuildID,'OnUpgradeGuild')

    CLogSystemManager:guild(dwRoleID,
            dwGuildID,
            objGuild.szGuildName,
            5,
            {});
end
----------------------------------------------------------------------------------
