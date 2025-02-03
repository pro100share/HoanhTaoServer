----------------------------------------------------------------------------------
--邀请玩家
function CGuildPlayerMsg:InvitePlayer(dwRoleID)
	--check
	local dwSrcID,dwTarID = self.dwSrcID,dwRoleID
	local objMember = CGuildMemberMgr:Get(dwSrcID)
	if not objMember then
		self:NotifyPlayer(dwSrcID,'Notice',1,6001010020)
		return
	end
	if not CGuildManager:GetAuthority(objMember.dwRank,'Recruit') then
		self:NotifyPlayer(dwSrcID,'Notice',1,6001010021)
		return
	end
	local dwGuildID = objMember.dwGuildID
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then return end
	local dwLevel = objGuild.dwLevel
	local dwCurMember = objGuild.dwMember
	local dwMaxMember = GuildLevelConfig[dwLevel].dwMember
	if dwCurMember >= dwMaxMember then
		self:NotifyPlayer(dwSrcID,'Notice',1,6001010022)
		return
	end
	local objPlayer = CGameLineManager:GetPlayer(dwTarID)
	if not objPlayer then
		self:NotifyPlayer(dwSrcID,'Notice',1,6001010023)
		return
	end
	local objInvite = CGuildInviteMgr:Get(dwSrcID,dwTarID)
	if objInvite then
		self:NotifyPlayer(dwSrcID,'Notice',1,6001020009)
		return
	end
	local objTarMember = CGuildMemberMgr:Get(dwTarID)
	if objTarMember then
		if objTarMember.dwGuildID == dwGuildID then
			self:NotifyPlayer(dwSrcID,'Notice',1,6001010024)
		else
			self:NotifyPlayer(dwSrcID,'Notice',1,6001010025)
		end
		return
	end
	--execute
	local objInvite = CGuildInvite:new()
	objInvite.dwSrcID = dwSrcID
	objInvite.dwTarID = dwTarID
	objInvite.dwGuildID = dwGuildID
	CGuildInviteMgr:Add(objInvite)
	self:NotifyPlayer(dwSrcID,'Notice',1,6001010041)
	local szRoleName = objMember.szRoleName
	self:NotifyPlayer(dwTarID,'OnInvitePlayer',dwSrcID,dwGuildID,szRoleName)
end
----------------------------------------------------------------------------------
--接受邀请
function CGuildPlayerMsg:AcceptInvite(dwRoleID,tabRole)
	--check
	local dwSrcID,dwTarID = dwRoleID,self.dwSrcID
	local objInvite = CGuildInviteMgr:Get(dwSrcID,dwTarID)
	if not objInvite then return end
	local dwGuildID = objInvite.dwGuildID
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then
		self:NotifyPlayer(dwTarID,'Notice',1,6001010028)
		return
	end
	local objMember = CGuildMemberMgr:Get(dwTarID)
	if objMember then
		if objMember.dwGuildID == dwGuildID then
			self:NotifyPlayer(dwTarID,'Notice',1,6001010026)
		else
			self:NotifyPlayer(dwTarID,'Notice',1,6001010027)
		end
		return
	end
	local dwLevel = objGuild.dwLevel
	local dwCurMember = objGuild.dwMember
	local dwMaxMember = GuildLevelConfig[dwLevel].dwMember
	if dwCurMember >= dwMaxMember then
		self:NotifyPlayer(dwTarID,'Notice',1,6001010029)
		return
	end
	local objQuit = CGuildQuitMgr:Get(dwTarID)
	if objQuit then
		if _now() - objQuit.dwDate < GuildQuitConfig.dwTime then
			self:NotifyPlayer(dwTarID,'Notice',1,6001010044)
			return
		else
			CGuildQuitMgr:Del(dwTarID):Delete()
		end
	end
	--execute
	tabRole.dwGuildID = dwGuildID
	tabRole.bOnline = true
	local objMember = CGuildMember:new(tabRole)
	CGuildMemberMgr:Add(objMember):Insert()
	CGuildManager:DoEvent('Join',tabRole.dwRoleID)
	CGuildMemberMgr:InitPlayer(tabRole.dwRoleID)
	self:NotifyPlayer(tabRole.dwRoleID,'OnJoinGuild')
	local tabRefresh = {}
	tabRefresh.dwMember = objGuild.dwMember
	self:NotifyGuild(dwGuildID,'OnRefreshGuild',tabRefresh)
	local tabRefresh = {}
	table.insert(tabRefresh,{ dwTarID,true })
	self:NotifyGuild(dwGuildID,'OnRefreshMemberList',tabRefresh)
	local szRoleName = tabRole.szRoleName
	self:NotifyGuild(dwGuildID,'Notice',3,6001020006,szRoleName)
	local eType = enGuildLog.eMember
	CGuildManager:InsertLog(dwGuildID,eType,6001060004,szRoleName)
end
----------------------------------------------------------------------------------
--拒绝邀请
function CGuildPlayerMsg:RefuseInvite(dwRoleID,tabRole)
	--check
	local dwSrcID,dwTarID = dwRoleID,self.dwSrcID
	local objInvite = CGuildInviteMgr:Get(dwSrcID,dwTarID)
	if not objInvite then return end
	local dwGuildID = objInvite.dwGuildID
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then return end
	--execute
	self:NotifyPlayer(dwSrcID,'Notice',1,6001010007,tabRole.szRoleName)
end
----------------------------------------------------------------------------------
--申请公会
function CGuildPlayerMsg:ApplyGuild(tabRole,dwGuildID,dwTarID)
	--check
	local dwRoleID = self.dwSrcID
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if objMember then return end
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then
		local objMember = CGuildMemberMgr:Get(dwTarID)
		if not objMember then return end
		dwGuildID = objMember.dwGuildID
		objGuild = CGuildInfoMgr:Get(dwGuildID)
		if not objGuild then return end
	end
	local dwLevel = objGuild.dwLevel
	local dwCurMember = objGuild.dwMember
	local dwMaxMember = GuildLevelConfig[dwLevel].dwMember
	if dwCurMember >= dwMaxMember then
		self:NotifyPlayer(dwRoleID,'Notice',1,6001010016)
		return
	end
	local objQuit = CGuildQuitMgr:Get(dwRoleID)
	if objQuit then
		if _now() - objQuit.dwDate < GuildQuitConfig.dwTime then
			self:NotifyPlayer(dwRoleID,'Notice',1,6001010044)
			return
		else
			CGuildQuitMgr:Del(dwRoleID):Delete()
		end
	end
	--execute
	tabRole.dwGuildID = dwGuildID
	if objGuild.bAutoAcceptFlag and
		tabRole.dwLevel > objGuild.dwAutoAcceptLevel
	then
		local objMember = CGuildMember:new(tabRole)
		objMember.bOnline = true
		CGuildMemberMgr:Add(objMember):Insert()
		CGuildManager:DoEvent('Join',dwRoleID)
		CGuildMemberMgr:InitPlayer(dwRoleID)
		self:NotifyPlayer(dwRoleID,'OnJoinGuild')
		local tabRefresh = {}
		tabRefresh.dwMember = objGuild.dwMember
		self:NotifyGuild(dwGuildID,'OnRefreshGuild',tabRefresh)
		local tabRefresh = {}
		table.insert(tabRefresh,{ dwRoleID,true })
		self:NotifyGuild(dwGuildID,'OnRefreshMemberList',tabRefresh)
		local szRoleName = tabRole.szRoleName
		self:NotifyGuild(dwGuildID,'Notice',3,6001020006,szRoleName)
		local eType = enGuildLog.eMember
		CGuildManager:InsertLog(dwGuildID,eType,6001060004,szRoleName)
	else
		local objApply = CGuildApplyMgr:Get(dwGuildID,dwRoleID)
		if objApply then
			objApply.dwDate = _now()
			objApply.dwLevel = tabRole.dwLevel
			objApply.dwPower = tabRole.dwPower
			objApply:Update()
		else
			objApply = CGuildApply:new(tabRole)
			CGuildApplyMgr:Add(objApply):Insert()
		end
		self:NotifyPlayer(dwRoleID,'Notice',1,6001020010)
		local tabMemberList = CGuildMemberMgr:GetMemberList(dwGuildID)
		for dwRoleID in pairs(tabMemberList) do
			local tabMember = CGuildMemberMgr:Get(dwRoleID)
			local dwRank = tabMember.dwRank
			if CGuildManager:GetAuthority(dwRank,'Recruit') then
				self:NotifyPlayer(tabMember.dwRoleID,'OnApplyGuild',true)
			end
		end
	end
end
----------------------------------------------------------------------------------
--接受申请
function CGuildPlayerMsg:AcceptApply(dwTarID)
	--check
	local dwSrcID = self.dwSrcID
	local objMember = CGuildMemberMgr:Get(dwSrcID)
	if not objMember then return end
	local dwGuildID = objMember.dwGuildID
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then return end
	local objApply = CGuildApplyMgr:Get(dwGuildID,dwTarID)
	if not objApply then return false end
	local dwRank = objMember.dwRank
	local bFlag = CGuildManager:GetAuthority(dwRank,'Recruit')
	if not bFlag then
		self:NotifyPlayer(dwSrcID,'Notice',1,6001010047)
		return
	end
	CGuildApplyMgr:Del(dwGuildID,dwTarID):Delete()
	local szRoleName = objApply.szRoleName
	local objQuit = CGuildQuitMgr:Get(dwTarID)
	if objQuit then
		if _now() - objQuit.dwDate < GuildQuitConfig.dwTime then
			self:NotifyPlayer(dwSrcID,'Notice',1,6001010045,szRoleName)
			return
		else
			CGuildQuitMgr:Del(dwTarID):Delete()
		end
	end
	local objMember = CGuildMemberMgr:Get(dwTarID)
	if objMember then
		if objMember.dwGuildID == dwGuildID then
			self:NotifyPlayer(dwSrcID,'Notice',1,6001010017,szRoleName)
		else
			self:NotifyPlayer(dwSrcID,'Notice',1,6001010018,szRoleName)
		end
		return
	end
	local dwLevel = objGuild.dwLevel
	local dwCurMember = objGuild.dwMember
	local dwMaxMember = GuildLevelConfig[dwLevel].dwMember
	if dwCurMember >= dwMaxMember then
		self:NotifyPlayer(dwSrcID,'Notice',1,6001010019)
		return
	end
	--execute
	local objMember = CGuildMember:new(objApply)
	if CGameLineManager:GetPlayer(dwTarID) then
		objMember.bOnline = true
	end
	CGuildMemberMgr:Add(objMember):Insert()
	CGuildManager:DoEvent('Join',dwTarID)
	CGuildMemberMgr:InitPlayer(dwTarID)
	self:NotifyPlayer(dwTarID,'OnJoinGuild')
	local tabRefresh = {}
	tabRefresh.dwMember = objGuild.dwMember
	self:NotifyGuild(dwGuildID,'OnRefreshGuild',tabRefresh)
	local tabRefresh = {}
	table.insert(tabRefresh,{ dwTarID,true })
	self:NotifyGuild(dwGuildID,'OnRefreshMemberList',tabRefresh)
	self:NotifyGuild(dwGuildID,'Notice',3,6001020006,szRoleName)
	local eType = enGuildLog.eMember
	CGuildManager:InsertLog(dwGuildID,eType,6001060004,szRoleName)
	if not next(CGuildApplyMgr:GetApplyList()) then
		local tabMemberList = CGuildMemberMgr:GetMemberList(dwGuildID)
		for dwRoleID in pairs(tabMemberList) do
			local tabMember = CGuildMemberMgr:Get(dwRoleID)
			local dwRank = tabMember.dwRank
			if CGuildManager:GetAuthority(dwRank,'Recruit') then
				self:NotifyPlayer(tabMember.dwRoleID,'OnApplyGuild',false)
			end
		end
	end
end
----------------------------------------------------------------------------------
--拒绝申请
function CGuildPlayerMsg:RefuseApply(dwTarID)
	--check
	local dwSrcID = self.dwSrcID
	local objMember = CGuildMemberMgr:Get(dwSrcID)
	if not objMember then return end
	local dwGuildID = objMember.dwGuildID
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then return end
	local objApply = CGuildApplyMgr:Get(dwGuildID,dwTarID)
	if not objApply then return end
	local dwRank = objMember.dwRank
	if not CGuildManager:GetAuthority(dwRank,'Recruit') then
		self:NotifyPlayer(dwSrcID,'Notice',1,6001010047)
		return
	end
	--execute
	CGuildApplyMgr:Del(dwGuildID,dwTarID):Delete()
	if not next(CGuildApplyMgr:GetApplyList()) then
		local tabMemberList = CGuildMemberMgr:GetMemberList(dwGuildID)
		for dwRoleID in pairs(tabMemberList) do
			local tabMember = CGuildMemberMgr:Get(dwRoleID)
			local dwRank = tabMember.dwRank
			if CGuildManager:GetAuthority(dwRank,'Recruit') then
				self:NotifyPlayer(tabMember.dwRoleID,'OnApplyGuild',false)
			end
		end
	end
end
----------------------------------------------------------------------------------
--删除申请
function CGuildPlayerMsg:DeleteApply()
	--check
	local dwRoleID = self.dwSrcID
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then return end
	local dwGuildID = objMember.dwGuildID
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then return end
	local dwRank = objMember.dwRank
	local bFlag = CGuildManager:GetAuthority(dwRank,'Recruit')
	if not bFlag then return end
	--execute
	local tabApplyList = CGuildApplyMgr:GetApplyList(dwGuildID)
	for dwRoleID in pairs(tabApplyList) do
		CGuildApplyMgr:Del(dwGuildID,dwRoleID):Delete()
	end
end
----------------------------------------------------------------------------------
--自动接受
function CGuildPlayerMsg:AutoAccept(bAuto,dwLevel)
	--check
	local dwRoleID = self.dwSrcID
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then return end
	local dwGuildID = objMember.dwGuildID
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then return end
	local dwRank = objMember.dwRank
	local bFlag = CGuildManager:GetAuthority(dwRank,'Recruit')
	if not bFlag then return end
	--execute
	objGuild.bAutoAcceptFlag = bAuto
	objGuild.dwAutoAcceptLevel = dwLevel
	objGuild:Update()
	local tabRefresh = {}
	tabRefresh.bAutoAcceptFlag = bAuto
	tabRefresh.dwAutoAcceptLevel = dwLevel
	self:NotifyGuild(dwGuildID,'OnRefreshGuild',tabRefresh)
end
----------------------------------------------------------------------------------
--移除成员
function CGuildPlayerMsg:RemoveMember(dwRoleID)
	--check
	local dwSrcID,dwTarID = self.dwSrcID,dwRoleID
	if CGuildManager:GetCombatFlag() then
		self:NotifyPlayer(dwSrcID,'Notice',1,6001010203)
		return
	end
	local objSrcMember = CGuildMemberMgr:Get(dwSrcID)
	if not objSrcMember then return end
	local objGuild = CGuildInfoMgr:Get(objSrcMember.dwGuildID)
	if not objGuild then return end
	local dwRank = objSrcMember.dwRank
	local bFlag = CGuildManager:GetAuthority(dwRank,'Remove')
	if not bFlag then return end
	local objTarMember = CGuildMemberMgr:Get(dwTarID)
	if not objTarMember then return end
	if objTarMember.dwGuildID ~= objSrcMember.dwGuildID then return end
	if objTarMember.dwRoleID == objSrcMember.dwRoleID then return end
	if objTarMember.dwRank <= objSrcMember.dwRank then return end
	if CAllianceLeaderManager:IsLeader(objTarMember.szRoleName) then
		self:NotifyPlayer(dwSrcID,'Notice',1,6001020027)
		return
	end
	--execute
	self:NotifyPlayer(dwTarID,'Notice',2,6001030003)
	local dwGuildID = objGuild.dwGuildID
	local szRoleName = objTarMember.szRoleName
	local eType = enGuildLog.eMember
	CGuildManager:InsertLog(dwGuildID,eType,6001060006,szRoleName)
	CGuildManager:DoEvent('Quit',dwTarID)
	CGuildMemberMgr:Del(dwTarID):Delete()
	CGuildMemberMgr:InitPlayer(dwTarID)
	self:NotifyPlayer(dwTarID,'OnQuitGuild')
	local tabRefresh = {}
	tabRefresh.dwMember = objGuild.dwMember
	self:NotifyGuild(dwGuildID,'OnRefreshGuild',tabRefresh)
	local tabRefresh = {}
	table.insert(tabRefresh,{ dwTarID,nil })
	self:NotifyGuild(dwGuildID,'OnRefreshMemberList',tabRefresh)
	self:NotifyGuild(dwGuildID,'Notice',3,6001020001,szRoleName)

    CLogSystemManager:guild(dwTarID,
            objGuild.dwGuildID,
            objGuild.szGuildName,
            3,
            {3});
end
----------------------------------------------------------------------------------
--退出公会
function CGuildPlayerMsg:QuitGuild()
	--check
	local dwRoleID = self.dwSrcID
	if CGuildManager:GetCombatFlag() then
		self:NotifyPlayer(dwRoleID,'Notice',1,6001010203)
		return
	end
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then return end
	local dwGuildID = objMember.dwGuildID
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then return end
	if objMember.dwRank == 1 then return end
	if CAllianceLeaderManager:IsLeader(objMember.szRoleName) then
		self:NotifyPlayer(dwRoleID,'Notice',1,6001020026)
		return
	end
	--execute
	local szRoleName = objMember.szRoleName
	local eType = enGuildLog.eMember
	CGuildManager:InsertLog(dwGuildID,eType,6001060005,szRoleName)
	self:NotifyGuild(dwGuildID,'Notice',3,6001020001,szRoleName)
	CGuildManager:DoEvent('Quit',dwRoleID)
	CGuildMemberMgr:Del(dwRoleID):Delete()
	CGuildMemberMgr:InitPlayer(dwRoleID)
	self:NotifyPlayer(dwRoleID,'OnQuitGuild')
	local tabRefresh = {}
	tabRefresh.dwMember = objGuild.dwMember
	self:NotifyGuild(dwGuildID,'OnRefreshGuild',tabRefresh)
	local tabRefresh = {}
	table.insert(tabRefresh,{ dwRoleID,nil })
	self:NotifyGuild(dwGuildID,'OnRefreshMemberList',tabRefresh)

    CLogSystemManager:guild(dwRoleID,
            objGuild.dwGuildID,
            objGuild.szGuildName,
            3,
            {1});
end
----------------------------------------------------------------------------------
