----------------------------------------------------------------------------------
--发起押镖
function CGuildPlayerMsg:StartEscort(dwEscortLevel,dwPlayerLevel)
	--check
	local dwRoleID = self.dwSrcID
	if CGuildManager:GetCombatFlag() then
		self:NotifyPlayer(dwRoleID,'Notice',1,6001010203)
		return
	end
	local objPlayer = CGameLineManager:GetPlayer(dwRoleID)
	if not objPlayer then return end
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then return end
	local dwGuildID = objMember.dwGuildID
	local objEscort = CGuildEscortMgr:Get(dwGuildID)
	local dwCount = objEscort.dwCount
	if dwCount >= GuildEscortConfig.dwMaxCount then
		self:NotifyPlayer(dwRoleID,'Notice',1,6001010100)
		return
	end
	local dwHour = CTimeFormat:sec2format(_now()/1000)
	if dwHour >= 23 then
		self:NotifyPlayer(dwRoleID,'Notice',1,6001010101)
		return
	end
	local tabCfg = GuildEscortConfig.Car[dwEscortLevel]
	local objResource = CGuildResourceMgr:Get(dwGuildID)
	if objResource.dwMoney < tabCfg.Condition.dwMoney then
		self:NotifyPlayer(dwRoleID,'Notice',1,6001010115)
		return
	end
	if dwPlayerLevel < tabCfg.Condition.dwLevel then
		self:NotifyPlayer(dwRoleID,'Notice',1,6001010105)
		return
	end
	--exexute
	local dwCost = tabCfg.Condition.dwMoney
	objResource.dwMoney = objResource.dwMoney - dwCost
	objResource:Update()
	objEscort.dwCount = objEscort.dwCount + 1
	objEscort.dwState = 1
	objEscort.dwLastTime = 0
	local szRoleName = objPlayer:GetInfo().szRoleName
	objEscort.tabEscortPlayer = { [dwRoleID] = szRoleName }
	objEscort.tabRewardPlayer = {}
	local dwIndex = math.random(1,#tabCfg.Line)
	objEscort.dwLineID = dwIndex
	objEscort.dwDoing = dwEscortLevel
	objEscort.dwServerID = objPlayer.objLine.dwLineID
	objEscort:Update()
	self:NotifyGuild(dwGuildID,'OnStartEscort',dwEscortLevel,dwIndex)
	self:NotifyPlayer(dwRoleID,'Notice',1,6001010116)
	local dwCount = GuildEscortConfig.dwDelay/(60*1000)
	local fn = function() CGuildEscortMgr:NotifyEscortBorn(dwGuildID) end
	CAlarmClock:AddTask({},CAlarmTaskCycleType.eMinute,dwCount,1,fn,{})

	local objGuild = CGuildInfoMgr:Get(dwGuildID);
    CLogSystemManager:guild(dwRoleID,
            objGuild.dwGuildID,
            objGuild.szGuildName,
            7,
            {1, objEscort.dwDoing});
end
----------------------------------------------------------------------------------
--参与运镖
function CGuildPlayerMsg:JoinEscort(dwPlayerLevel)
	--check
	local dwRoleID = self.dwSrcID
	local objPlayer = CGameLineManager:GetPlayer(dwRoleID)
	if not objPlayer then return end
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then return end
	local dwGuildID = objMember.dwGuildID
	local objEscort = CGuildEscortMgr:Get(dwGuildID)
	if objEscort.dwState ~= 1 then
		self:NotifyPlayer(dwRoleID,'Notice',1,6001010103)
		return
	end
	local tabEscortPlayer = objEscort.tabEscortPlayer
	if tabEscortPlayer[dwRoleID] then
		self:NotifyPlayer(dwRoleID,'Notice',1,6001010104)
		return
	end
	local tabCfg = GuildEscortConfig.Car[objEscort.dwDoing]
	if dwPlayerLevel < tabCfg.Condition.dwJoinLevel then
		self:NotifyPlayer(dwRoleID,'Notice',1,6001010105)
		return
	end
	--exexute
	local szRoleName = objPlayer:GetInfo().szRoleName
	tabEscortPlayer[dwRoleID] = szRoleName
	self:NotifyPlayer(dwRoleID,'OnJoinEscort')
	self:NotifyPlayer(dwRoleID,'Notice',1,6001010117)

	local objGuild = CGuildInfoMgr:Get(dwGuildID);
    CLogSystemManager:guild(dwRoleID,
            objGuild.dwGuildID,
            objGuild.szGuildName,
            7,
            {2, objEscort.dwDoing});
end
----------------------------------------------------------------------------------
--升级镖车
function CGuildPlayerMsg:UpgradeEscort()
	--check
	local dwRoleID = self.dwSrcID
	local objPlayer = CGameLineManager:GetPlayer(dwRoleID)
	if not objPlayer then return end
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then return end
	local dwGuildID = objMember.dwGuildID
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then return end
	local objEscort = CGuildEscortMgr:Get(dwGuildID)
	local tabCfg = GuildEscortConfig.Car[objEscort.dwLevel]
	if tabCfg.dwNext == 0 then
		self:NotifyPlayer(dwRoleID,'Notice',1,6001010112)
		return
	end
	if objGuild.dwLevel < tabCfg.UpNeed.dwLevel then
		self:NotifyPlayer(dwRoleID,'Notice',1,6001010113)
		return
	end
	local objResource = CGuildResourceMgr:Get(dwGuildID)
	if not objResource then return end
	for k,v in pairs(tabCfg.UpNeed.Item) do
		local szIndex = 'dwItem'..v.dwType
		if objResource[szIndex] < v.dwNum then
			self:NotifyPlayer(dwRoleID,'Notice',1,6001010114)
			return
		end
	end
	if objResource.dwMoney < tabCfg.UpNeed.dwMoney then
		self:NotifyPlayer(dwRoleID,'Notice',1,6001010115)
		return
	end
	--exexute
	objResource.dwMoney = objResource.dwMoney - tabCfg.UpNeed.dwMoney
	for k,v in pairs(tabCfg.UpNeed.Item) do
		local szIndex = 'dwItem'..v.dwType
		objResource[szIndex] = objResource[szIndex] - v.dwNum
	end
	objResource:Update()
	objEscort.dwLevel = objEscort.dwLevel + 1
	objEscort:Update()
	self:NotifyGuild(dwGuildID,'OnUpgradeEscort')
	self:NotifyGuild(dwGuildID,'Notice',1,6001010119)

    CLogSystemManager:guild(dwRoleID,
            objGuild.dwGuildID,
            objGuild.szGuildName,
            8,
            {objEscort.dwLevel});
end
----------------------------------------------------------------------------------
--领取奖励
function CGuildPlayerMsg:EscortReward()
	--check
	local dwRoleID = self.dwSrcID
	local objPlayer = CGameLineManager:GetPlayer(dwRoleID)
	if not objPlayer then return end
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then return end
	local dwGuildID = objMember.dwGuildID
	local objEscort = CGuildEscortMgr:Get(dwGuildID)
	local tabRewardPlayer = objEscort.tabRewardPlayer
	if not tabRewardPlayer[dwRoleID] then
		self:NotifyPlayer(dwRoleID,'Notice',1,6001010109)
		return
	end
	--record
	local fnConfirm = function()
		local tabCfg = GuildEscortConfig.Car[objEscort.dwDoing].Reward
		CGuildResourceMgr:AddContribute(dwRoleID,tabCfg.dwContribute)
		self:NotifyPlayer(dwRoleID,'Notice',1,6001010120)
	end
	local szTemp = tabRewardPlayer[dwRoleID]
	local fnCancel = function()
		tabRewardPlayer[dwRoleID] = szTemp
	end
	local dwRecord = CGuildRecord:Insert(fnConfirm,fnCancel)
	--exexute
	tabRewardPlayer[dwRoleID] = nil
	local dwLevel = objEscort.dwDoing
	self:NotifyPlayer(dwRoleID,'OnEscortReward',dwRecord,dwLevel)

	local objGuild = CGuildInfoMgr:Get(dwGuildID);
    CLogSystemManager:guild(dwRoleID,
            objGuild.dwGuildID,
            objGuild.szGuildName,
            7,
            {3, objEscort.dwDoing});
end
----------------------------------------------------------------------------------
