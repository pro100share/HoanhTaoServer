----------------------------------------------------------------------------------
--捐献物品
function CGuildPlayerMsg:DonateMaterial(eType,dwNumber)
	--check
	local dwRoleID = self.dwSrcID
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then return end
	local bFlag = false
	for k,v in pairs(enGuildDonate) do
		if v == eType then bFlag = true end
	end
	if not bFlag then return end
	--execute
	local dwGuildID = objMember.dwGuildID
	local tabTemp = {
		[enGuildDonate.eMoney] = { 'dwMoney',6001020011 },
		[enGuildDonate.eItem1] = { 'dwItem1',6001020012,6001070004 },
		[enGuildDonate.eItem2] = { 'dwItem2',6001020013,6001070005 },
		[enGuildDonate.eItem3] = { 'dwItem3',6001020018,6001070006 },
		[enGuildDonate.eItem4] = { 'dwItem4',6001020019,6001070007 },
	}
	local szIndex = tabTemp[eType][1]
	local objResource = CGuildResourceMgr:Get(dwGuildID)
	objResource[szIndex] = objResource[szIndex] + dwNumber
	objResource:Update()
	local objDonate = CGuildDonateMgr:Get(dwRoleID)
	if not objDonate then
		objDonate = CGuildDonate:new({ dwRoleID = dwRoleID })
		CGuildDonateMgr:Add(objDonate):Insert()
	end
	objDonate[szIndex] = objDonate[szIndex] + dwNumber
	objDonate:Update()
	
	local tabCfg = GuildDonateConfig[eType]
	local dwCount = dwNumber/tabCfg.dwCost
	local dwContribute = math.floor(dwCount*tabCfg.dwContribute)
	CGuildResourceMgr:AddContribute(dwRoleID,dwContribute)
	
	local szName = objMember.szRoleName
	local dwStringID = tabTemp[eType][2]
	local eLog = enGuildLog.eDonate
	CGuildManager:InsertLog(dwGuildID,eLog,dwStringID,szName,dwNumber)
	if tabCfg.dwTipCount and dwNumber >= tabCfg.dwTipCount then
		local e = enChatChannel.eFaction
		local dwTipID = tabTemp[eType][3]
		self:NotifyGuild(dwGuildID,'Message',e,dwTipID,szName,dwNumber)
	end
	self:NotifyPlayer(dwRoleID,'OnDonateMaterial')

    CLogSystemManager:guild(dwRoleID,
            dwGuildID,
            objMember.szGuildName,
            6,
            {});
end
----------------------------------------------------------------------------------
