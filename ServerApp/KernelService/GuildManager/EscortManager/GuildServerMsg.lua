----------------------------------------------------------------------------------
--押镖更新
function CGuildServerMsg:UpdateEscort(tabData)
	if not tabData.dwGuildID then return end
	local objEscort = CGuildEscortMgr:Get(tabData.dwGuildID)
	if not objEscort then return false end
	for k,v in pairs(tabData) do
		objEscort[k] = v
	end
	objEscort:Update()
end
----------------------------------------------------------------------------------
--押镖结束
function CGuildServerMsg:EscortFinish(dwGuildID,dwRes,tabPlayerList)
	local objEscort = CGuildEscortMgr:Get(dwGuildID)
	for dwRoleID in pairs(objEscort.tabEscortPlayer) do
		CGuildPlayerMsg:NotifyPlayer(dwRoleID,'OnEscortFinish',dwRes)
	end
	if dwRes ~= 0 then objEscort.dwState = -1 return end
	objEscort.dwState = 3
--	for dwRoleID,dwTimes in pairs(tabPlayerList or {}) do
--		if dwTimes >= GuildEscortConfig.dwCheckTime then
--			local szName = objEscort.tabEscortPlayer[dwRoleID]
--			if szName then
--				objEscort.tabRewardPlayer[dwRoleID] = szName
--			end
--		end
--	end
	for k,v in pairs(objEscort.tabEscortPlayer) do
		objEscort.tabRewardPlayer[k] = v
	end
	local fn = function()
		for dwRoleID in pairs(objEscort.tabRewardPlayer) do
			CGuildEscortMgr:MailPlayerReward(dwGuildID,dwRoleID)
		end
	end
	CAlarmClock:AddTask({},CAlarmTaskCycleType.eMinute,10,1,fn,{})
end
----------------------------------------------------------------------------------
--押镖提示
function CGuildServerMsg:EscortNotice(dwGuildID,dwStringID,tabArgv)
	local objEscort = CGuildEscortMgr:Get(dwGuildID)
	local eChannel = enChatChannel.eFaction
	for dwRoleID in pairs(objEscort.tabEscortPlayer) do
		CGuildPlayerMsg:NotifyPlayer(
			dwRoleID,'Message',eChannel,dwStringID,unpack(tabArgv or {})
		)
	end
end
----------------------------------------------------------------------------------