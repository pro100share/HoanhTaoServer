----------------------------------------------------------------------------------
--删除日志
function CGuildPlayerMsg:DeleteLog(eType)
	--check
	local dwRoleID = self.dwSrcID
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then return end
	local dwGuildID = objMember.dwGuildID
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then return end
	local dwRank = objMember.dwRank
	local bFlag = CGuildManager:GetAuthority(dwRank,'Log')
	if not bFlag then return end
	--execute
	local tabLogList = CGuildLogMgr:GetLogList(dwGuildID)
	for dwLogID in pairs(tabLogList) do
		CGuildLogMgr:Del(dwLogID):Delete()
	end
end
----------------------------------------------------------------------------------