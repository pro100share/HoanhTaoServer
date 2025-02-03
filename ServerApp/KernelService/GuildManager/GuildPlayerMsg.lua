--[[
功能：帮派命令处理（服务器）
版本：v1.0
作者：郭肇义
时间：2012-10-10
]]
_G.CGuildPlayerMsg = {};
CGuildPlayerMsg.private = {}
----------------------------------------------------------------------------------
--全服通知
CGuildPlayerMsg.private.NotifyServer = true
function CGuildPlayerMsg:NotifyServer(szCmd,...)
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.OnGuildPlayerMsg { Cmd = szCmd,Info = {...} }
	end
end
--个人通知
CGuildPlayerMsg.private.NotifyPlayer = true
function CGuildPlayerMsg:NotifyPlayer(dwRoleID,szCmd,...)
	local objPlayer = CGameLineManager:GetPlayer(dwRoleID)
	if not objPlayer then return end
	local tabTarget = { [dwRoleID] = true }
	objPlayer.OnGuildPlayerMsg{ Target = tabTarget,Cmd = szCmd,Info = {...} }
end
--公会通知
CGuildPlayerMsg.private.NotifyGuild = true
function CGuildPlayerMsg:NotifyGuild(dwGuildID,szCmd,...)
	local tabTarget = CGuildMemberMgr:GetMemberList(dwGuildID)
	if not pairs(tabTarget)(tabTarget) then return end
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.OnGuildPlayerMsg { Target = tabTarget,Cmd = szCmd,Info = {...} }
	end
end
----------------------------------------------------------------------------------
--创建世家
function CGuildPlayerMsg:BuildGuild(tabRole,tabGuild)
	--check
	local dwRoleID = self.dwSrcID
	local szGuildName = tabGuild.szGuildName
	if ( not szGuildName ) or szGuildName == '' then return end
	local szAnnounce = tabGuild.szAnnounce
	if ( not szAnnounce ) or szAnnounce == '' then return end
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if objMember then
		self:NotifyPlayer(dwRoleID,'Notice',1,6001010036)
		return
	end
	local objQuit = CGuildQuitMgr:Get(dwRoleID)
	if objQuit then
		if _now() - objQuit.dwDate < GuildQuitConfig.dwTime then
			self:NotifyPlayer(dwRoleID,'Notice',1,6001010061)
			return false
		else
			CGuildQuitMgr:Del(dwRoleID):Delete()
		end
	end
	local bFlag = false
	local fn = function(objData)
		if objData.szGuildName == tabGuild.szGuildName then
			bFlag = true
			self:NotifyPlayer(dwRoleID,'Notice',1,6001010037)
		end
	end
	CGuildInfoMgr:Iterator(fn)
	if bFlag then return end
	--execute
	local dwGuildID = CGuildIDFactory:Generate('dwGuildID')
	tabGuild.dwGuildID = dwGuildID
	local objGuild = CGuildInfo:new(tabGuild)
	CGuildInfoMgr:Add(objGuild):Insert()
	--record
	local fnConfirm = function()
		CGuildManager:DoEvent('Build',dwGuildID)
		tabRole.dwRank = 1
		tabRole.dwGuildID = dwGuildID
		local objMember = CGuildMember:new(tabRole)
		if CGameLineManager:GetPlayer(dwRoleID) then
			objMember.bOnline = true
		end
		CGuildMemberMgr:Add(objMember):Insert()
		CGuildManager:DoEvent('Join',dwRoleID)
		CGuildMemberMgr:InitPlayer(dwRoleID)
		self:NotifyPlayer(dwRoleID,'Notice',1,6001020005)
		self:NotifyPlayer(dwRoleID,'OnJoinGuild')
		local szRoleName = objMember.szRoleName
		local szGuildName = objGuild.szGuildName
		self:NotifyServer(
			'OnDeclareGuild',szRoleName,dwRoleID,szGuildName,dwGuildID
		)
	end
	local fnCancel = function()
		CGuildInfoMgr:Del(dwGuildID):Delete()
	end
	local dwRecordID = CGuildRecord:Insert(fnConfirm,fnCancel)
	--notify
	self:NotifyPlayer(dwRoleID,'OnBuildGuild',dwRecordID)

    CLogSystemManager:guild(dwRoleID,
            dwGuildID,
            szGuildName,
            1,
            {});
end
----------------------------------------------------------------------------------
--解散世家
function CGuildPlayerMsg:DismissGuild()
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
	local dwRank = objMember.dwRank
	local bFlag = CGuildManager:GetAuthority(dwRank,'Dismiss')
	if not bFlag then return end
	if CAllianceLeaderManager:IsLeader(objMember.szRoleName) then
		self:NotifyPlayer(dwRoleID,'Notice',1,6001020025)
		return
	end
	--execute
	local tabMemberList = CGuildMemberMgr:GetMemberList(dwGuildID)
	for dwRoleID in pairs(tabMemberList) do
		CGuildManager:DoEvent('Quit',dwRoleID)
		CGuildMemberMgr:Del(dwRoleID):Delete()
		CGuildMemberMgr:InitPlayer(dwRoleID)
		self:NotifyPlayer(dwRoleID,'OnQuitGuild')
		self:NotifyPlayer(dwRoleID,'Notice',2,6001030002)

        CLogSystemManager:guild(dwRoleID,
                objGuild.dwGuildID,
                objGuild.szGuildName,
                3,
                {2});
	end
	CGuildManager:DoEvent('Dismiss',dwGuildID)
	CGuildInfoMgr:Del(dwGuildID):Delete()

    CLogSystemManager:guild(self.dwSrcID,
            objGuild.dwGuildID,
            objGuild.szGuildName,
            4,
            {});
end
----------------------------------------------------------------------------------


---世家摇奖 
function CGuildPlayerMsg:GSStartTakeAward(dwRoleID,dwConsumeContribute)
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if(not objMember) then
		return;
	end
	local dwContribute = objMember.dwContribute; ----玩家贡献度
	if(dwConsumeContribute > dwContribute) then
		return;
	end
	objMember.dwContribute = objMember.dwContribute - dwConsumeContribute
	local tabRefresh = {}
	tabRefresh.dwContribute = dwContribute - dwConsumeContribute
	CGuildPlayerMsg:NotifyPlayer(dwRoleID,'OnRefreshPlayer',tabRefresh )
	self:NotifyPlayer(dwRoleID,'KSStartTakeAward')
end

---设置使用世家召唤令信息 
function CGuildPlayerMsg:KSWriteConcentrateDeclaration(RoleID)
	self:NotifyPlayer(RoleID,'WriteConcentrateDeclaration')
end
---设置使用世家召唤令成功
function CGuildPlayerMsg:KSCallGuildMemberSuc(RoleID)
	self:NotifyPlayer(RoleID,'CallGuildMemberSuc')
end
----开始召唤世家成员
function CGuildPlayerMsg:GSStartCallGuildMember(tabInfo)
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.OnGuildServerMsg{ Cmd = 'KSSetInfoByCallItem',Info = {tabInfo} }
	end
	local objMember = CGuildMemberMgr:Get(tabInfo.RoleID)
	if not objMember then 
		return 
	end
	local dwGuildID = objMember.dwGuildID

	local tabMemberList = CGuildMemberMgr:GetMemberList(dwGuildID)
	local Info = {};
	Info.CurfXPos =tabInfo.CurfXPos;
	Info.CurfYPos = tabInfo.CurfYPos;
	Info.CurMapID = tabInfo.CurMapID;
	Info.RoleName = tabInfo.RoleName;
	Info.RoleID = tabInfo.RoleID;
	Info.Strs = tabInfo.Strs;
	for dwRoleID,v in pairs(tabMemberList) do
		if dwRoleID ~= Info.RoleID then
			self:NotifyPlayer(dwRoleID,'KSCallGuildMemberInterface',Info)
		end
	end
	local dwInfo = {};
	self:NotifyPlayer(tabInfo.RoleID,'CallMemberBroadCastMsg',dwInfo)
end
---完成世家传送
function CGuildPlayerMsg:GSCompleteCallGuildMember()
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.OnGuildServerMsg{ Cmd = 'KSCompleteCallGuildMember',Info = {} }
	end
end