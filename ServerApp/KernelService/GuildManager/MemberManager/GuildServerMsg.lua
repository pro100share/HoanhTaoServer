----------------------------------------------------------------------------------
--成员更新
function CGuildServerMsg:UpdatePlayer(tabData)
	if not tabData.dwRoleID then return end
	local objMember = CGuildMemberMgr:Get(tabData.dwRoleID)
	if not objMember then return false end
	if tabData.dwPower then
		local objGuild = CGuildInfoMgr:Get(objMember.dwGuildID)
		local dwPower = tabData.dwPower - objMember.dwPower
		objGuild.dwPower = objGuild.dwPower + dwPower
	end
	for k,v in pairs(tabData) do
		objMember[k] = v
	end
	objMember:Update()
end
----------------------------------------------------------------------------------
--成员被杀
function CGuildServerMsg:GuildRevenge(tabData)
	local dwGuildID = tabData.dwGuildID
	if not dwGuildID then return end
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then return end
	CGuildPlayerMsg:NotifyGuild(dwGuildID,'OnGuildRevenge',tabData)
end
----------------------------------------------------------------------------------
--修改家主
function CGuildServerMsg:AppointLeader(dwGuildID,dwRoleID)
	--check
	if not dwGuildID then print("===AppointLeader -1===") return end
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then print("===AppointLeader -2===") return end
	if not dwRoleID then print("===AppointLeader -3===") return end
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then print("===AppointLeader -4===") return end
	if objMember.dwGuildID ~= dwGuildID then print("===AppointLeader -5===") return end
	local dwLeaderID = objGuild.dwLeaderID
	local objLeader = CGuildMemberMgr:Get(dwLeaderID)
	if not objLeader then print("===AppointLeader -6===") return end
	if objLeader.dwRoleID == dwRoleID then return end
	
	--record
	local szOldName = objGuild.szLeaderName;
	local szOldLast = GuildRankConfig[1].szName;
	
	--execute
	objGuild.dwLeaderID = objMember.dwRoleID
	objGuild.szLeaderName = objMember.szRoleName
	if objMember.dwRank == 2 then
		objGuild.dwElderCount = objGuild.dwElderCount - 1
	end
	if objMember.dwRank == 3 then
		
	end
	
	local szLast = GuildRankConfig[objMember.dwRank].szName
	
	local tabRefresh = {}
	tabRefresh.dwLeaderID = objGuild.dwLeaderID
	tabRefresh.szLeaderName = objGuild.szLeaderName
	CGuildPlayerMsg:NotifyGuild(dwGuildID,'OnRefreshGuild',tabRefresh)
	
	objGuild.tmLeaderOffTime = -1;
	CGuildPlayerMsg:NotifyGuild(dwGuildID,'OnUpdateLeaderOffTime',-1)
	
	objLeader.dwRank = #GuildRankConfig
	local szOldNext = GuildRankConfig[objLeader.dwRank].szName;
	objLeader:Update()
	local tabRefresh = { dwRank = objLeader.dwRank }
	CGuildPlayerMsg:NotifyPlayer(dwLeaderID,'OnRefreshPlayer',tabRefresh)
	
	objMember.dwRank = 1
	objMember:Update()
	local tabRefresh = { dwRank = objMember.dwRank }
	CGuildPlayerMsg:NotifyPlayer(dwRoleID,'OnRefreshPlayer',tabRefresh)
	
	local szName = objMember.szRoleName
	local szNext = GuildRankConfig[1].szName
	CGuildPlayerMsg:NotifyGuild(dwGuildID,'Notice',3,6001020004,szName,szLast,szNext)
	
	CGuildPlayerMsg:NotifyGuild(dwGuildID,'Notice',3,6001020004,szOldName,szOldLast,szOldNext)
	
	return true;
end
----------------------------------------------------------------------------------