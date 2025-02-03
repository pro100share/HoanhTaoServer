----------------------------------------------------------------------------------
--初始化成员
function CGuildPlayerMsg:InitPlayer()
	--check
	local dwRoleID = self.dwSrcID
	if not dwRoleID then return end
	--execute
	CGuildMemberMgr:InitPlayer(dwRoleID)
end
----------------------------------------------------------------------------------
--任命成员
function CGuildPlayerMsg:AppointMember(dwRoleID,dwRank)
	--check
	local dwSrcID,dwTarID = self.dwSrcID,dwRoleID
	local objSrcMember = CGuildMemberMgr:Get(dwSrcID)
	if not objSrcMember then return end
	local dwGuildID = objSrcMember.dwGuildID
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then return end
	local bFlag = CGuildManager:GetAuthority(objSrcMember.dwRank,'Appoint')
	if not bFlag then return end
	local objTarMember = CGuildMemberMgr:Get(dwTarID)
	if not objTarMember then return end
	if objTarMember.dwGuildID ~= objSrcMember.dwGuildID then return end
	if objTarMember.dwRoleID == objSrcMember.dwRoleID then return end
	if objSrcMember.dwRank > dwRank then return end
	if objTarMember.dwRank == dwRank then
		local szTitle = GuildRankConfig[dwRank].szName
		local szName = objTarMember.szRoleName
		self:NotifyPlayer(dwSrcID,'Notice',1,6001010008,szName,szTitle)
		return
	end
	if dwRank == 2 then
		if objGuild.dwElderCount >= 2 then return end
	end
	--execute
	local eType = enGuildLog.eAppoint
	if objTarMember.dwRank == 2 then
		local szName = objTarMember.szRoleName
		CGuildManager:InsertLog(dwGuildID,eType,6001060010,szName)
		objGuild.dwElderCount = objGuild.dwElderCount - 1
	end
	if dwRank == 1 then
		local objLeader = CGuildMemberMgr:Get(objGuild.dwLeaderID)
		objLeader.dwRank = #GuildRankConfig
		objLeader:Update()
		local tabRefresh = { dwRank = objLeader.dwRank }
		local dwRoleID = objGuild.dwLeaderID
		self:NotifyPlayer(dwRoleID,'OnRefreshPlayer',tabRefresh)
		local dwRoleID = objTarMember.dwRoleID
		local szName = objTarMember.szRoleName
		objGuild.dwLeaderID = dwRoleID
		objGuild.szLeaderName = szName
		local tabRefresh = { dwLeaderID = dwRoleID,szLeaderName = szName }
		self:NotifyGuild(dwGuildID,'OnRefreshGuild',tabRefresh)
		CGuildManager:InsertLog(dwGuildID,eType,6001060007,szName)
		
		--设置家主的离线时间
		local dwSendTime = -1;
		local objRole = CPlayerManager:GetPlayerByRoleID(dwRoleID);
		if objRole then
			objGuild.tmLeaderOffTime = -1;
		else
			objGuild.tmLeaderOffTime = CGuildInfoMgr:ReadLeaderOffTime(dwRoleID);
			
			dwSendTime = _now() - objGuild.tmLeaderOffTime;
		end
		
		self:NotifyGuild(dwGuildID,'OnUpdateLeaderOffTime',dwSendTime)
	end
	if dwRank == 2 then
		local szName = objTarMember.szRoleName
		CGuildManager:InsertLog(dwGuildID,eType,6001060008,szName)
		objGuild.dwElderCount = objGuild.dwElderCount + 1
	end
	local szName = objTarMember.szRoleName
	local szLast = GuildRankConfig[objTarMember.dwRank].szName
	local szNext = GuildRankConfig[dwRank].szName
	self:NotifyGuild(dwGuildID,'Notice',3,6001020004,szName,szLast,szNext)
	objTarMember.dwRank = dwRank
	objTarMember:Update()
	local tabRefresh = { dwRank = dwRank }
	self:NotifyPlayer(dwTarID,'OnRefreshPlayer',tabRefresh)
end
----------------------------------------------------------------------------------
--领取福利
function CGuildPlayerMsg:ReceiveWelfare()
	--check
	local dwRoleID = self.dwSrcID
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then return end
	local objGuild = CGuildInfoMgr:Get(objMember.dwGuildID)
	if not objGuild then return end
	if CTimeFormat:isToday(objMember.dwWelfare) then return end
	--execute
	objMember.dwWelfare = _now()
	objMember:Update()
	self:NotifyPlayer(dwRoleID,'OnReceiveWelfare')
	local tabRefresh = {}
	tabRefresh.dwWelfare = objMember.dwWelfare
	self:NotifyPlayer(dwRoleID,'OnRefreshPlayer',tabRefresh)
	objGuild.dwSignIn = objGuild.dwSignIn + 1
	local tabRefresh = {}
	tabRefresh.dwSignIn = objGuild.dwSignIn
	self:NotifyPlayer(dwRoleID,'OnRefreshGuild',tabRefresh)
end
----------------------------------------------------------------------------------

function CGuildPlayerMsg:KickGuildLeader(dwGuildID,dwRoleID)
	local tabGuild = CGuildInfoMgr:Get(dwGuildID);
	local szLeaderName = tabGuild.szLeaderName;
	local dwLeaderID = tabGuild.dwLeaderID;
	
	local res = false;
	local isCanKick = true;
	if tabGuild.tmLeaderOffTime < 0 then
		isCanKick = false;
	else
		if _now() - tabGuild.tmLeaderOffTime < GuildKickLeaderConfig.tmKickTimeLength then
			isCanKick = false;
		end
	end
	
	if isCanKick then
		res = CGuildServerMsg:AppointLeader(dwGuildID,dwRoleID)
	end
	
	if res then
		tabGuild = CGuildInfoMgr:Get(dwGuildID);
		local szKickName = tabGuild.szLeaderName;
		self:NotifyGuild(dwGuildID,'OnKickGuildLeader',szKickName,szLeaderName)
		
		CGuildManager:InsertLog(dwGuildID,enGuildLog.eAppoint,6001060009,szLeaderName)
		CGuildManager:InsertLog(dwGuildID,enGuildLog.eAppoint,6001060007,szKickName)
		
		--给原家主发邮件
		CMailManager:SendConfigMail( GuildKickLeaderConfig.dwNoticeMailCfg, dwLeaderID )
	end
	
	self:NotifyPlayer(dwRoleID,"KickGuildLeaderResult",res);
	self:NotifyPlayer(dwRoleID,'OnKickOverRes',res);
end;