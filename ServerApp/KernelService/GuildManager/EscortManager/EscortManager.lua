-------------------------------------------------------------------------------
--公会押镖数据
-------------------------------------------------------------------------------
local szTable = 'T_Guild_Escort'
local tabPrimeKey = { 'dwGuildID' }
local tabDataKey =  { 'dwCount','dwCall','dwLevel' }
CGuildDatabase:AddTable(szTable,tabPrimeKey,tabDataKey)
-------------------------------------------------------------------------------
_G.CGuildEscort = CGuildData:inherit()
CGuildEscort.table = 'T_Guild_Escort'
function CGuildEscort:Create(tabInfo)
	self.dwGuildID = tabInfo.dwGuildID --公会ID
	self.dwLevel = tabInfo.dwLevel or 1 --镖车等级
	self.dwCount = tabInfo.dwCount or 0 --押镖次数
	self.dwCall = tabInfo.dwCall or 0 --呼叫族人
	-- no record
	self.dwState = tabInfo.dwState or 0 --押镖状态
	self.dwDoing = tabInfo.dwDoing or 0 --押镖等级
	self.dwLineID = tabInfo.dwLineID or 0 --押镖路线
	self.dwServerID = tabInfo.dwServerID or 0 --服务器ID
	self.dwLastTime = tabInfo.dwLastTime or 0 --持续时间
	self.tabEscortPlayer = tabInfo.tabEscortPlayer or {} --押镖玩家
	self.tabRewardPlayer = tabInfo.tabRewardPlayer or {} --奖励玩家
	--fix
	if self.dwLevel == 0 then self.dwLevel = 1 end
end
-------------------------------------------------------------------------------
--公会押镖系统
-------------------------------------------------------------------------------
_G.CGuildEscortMgr = CGuildBaseMgr:inherit()
function CGuildEscortMgr:Create()
	self.tabDataMap = {}
	local objDB = CGuildDatabase:GetTable('T_Guild_Escort')
	local tabRes = objDB:Select() or {}
	for _,v in pairs(tabRes) do
		local objEscort = CGuildEscort:new(v)
		self:Add(objEscort)
	end
	local tb = { dwTime = "00:00" }
	local fn = function() self:Refresh() end
	CAlarmClock:AddTask(tb,CAlarmTaskCycleType.eDay,1,0,fn,{})
end
function CGuildEscortMgr:Update(dwInterval)
	for k,v in pairs(self.tabDataMap) do
		v.dwLastTime = v.dwLastTime + dwInterval
	end
	return true
end
function CGuildEscortMgr:Add(objEscort)
	local dwGuildID = objEscort.dwGuildID
	self.tabDataMap[dwGuildID] = objEscort
	return objEscort
end
function CGuildEscortMgr:Get(dwGuildID)
	return self.tabDataMap[dwGuildID]
end
function CGuildEscortMgr:Del(dwGuildID)
	local objEscort = self.tabDataMap[dwGuildID]
	if not objEscort then return end
	self.tabDataMap[dwGuildID] = nil
	return objEscort
end
-------------------------------------------------------------------------------
function CGuildEscortMgr:Build(dwGuildID)
	local tabEscort = { dwGuildID = dwGuildID }
	local objEscort = CGuildEscort:new(tabEscort)
	CGuildEscortMgr:Add(objEscort):Insert()
end
function CGuildEscortMgr:Dismiss(dwGuildID)
	if self:Get(dwGuildID) then
		self:Del(dwGuildID):Delete()
	end
end
-------------------------------------------------------------------------------
--刷新运镖信息
function CGuildEscortMgr:Refresh()
	for k,v in pairs(self.tabDataMap) do
		v.dwCount,v.dwCall = 0,0
		v.dwState,v.dwDoing,v.dwLineID = 0,0,0
	end
	local objDB = CGuildDatabase:GetTable('T_Guild_Escort')
	local tabInfo = { dwCount = 0,dwCall = 0 }
	objDB:Update(tabInfo)
end
--邮件发放玩家奖励
function CGuildEscortMgr:MailPlayerReward(dwGuildID,dwRoleID)
	local objEscort = self.tabDataMap[dwGuildID]
	local szName = objEscort.tabRewardPlayer[dwRoleID]
	if not szName then return end
	local dwLevel = objEscort.dwLevel
	local tabCfg = GuildEscortConfig.Car[dwLevel].Reward

	local objMail = CMail:new()
	objMail:SetSender( -10086, GuildEscortConfig.Mail.Sender )
	objMail:SetReceiver( dwRoleID, szName )
	objMail:SetLifeTime( SMailInfo.life*24*60*60*1000 )
	local szTitle = GuildEscortConfig.Mail.Title
	local szText = GuildEscortConfig.Mail.szMailTxt
	objMail:SetContent( szTitle, szText )
	local tabItemList = {}
	for k,v in pairs(tabCfg.Item) do
		local objItem = SItemMessage:new()
		objItem.dwItemEnum = v.dwItemId
		objItem.dwItemNumber = v.dwNum
		objItem.dwBindType = v.dwBind
		objItem.dwLifeTime = -1
		table.insert( tabItemList, objItem )
	end
	objMail:SetAccessory( 0, 0, tabCfg.dwMoney, tabItemList )
	CMailManager:SendMail( objMail )
	
	CGuildResourceMgr:AddContribute(dwRoleID,tabCfg.dwContribute)
	local dwServerID = objEscort.dwServerID
	CGuildServerMsg:NotifyServer(dwServerID,'GetEscortReward',dwRoleID,tabCfg.dwContribute);
	objEscort.tabRewardPlayer[dwRoleID] = nil
end
--通知服务器刷新镖车
function CGuildEscortMgr:NotifyEscortBorn(dwGuildID)
	local objEscort = self.tabDataMap[dwGuildID]
	objEscort.dwState = 2
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	if not objGuild then return end
	local dwRoleID = objGuild.dwLeaderID
	local szGuildName = objGuild.szGuildName
	local dwServerID = objEscort.dwServerID
	CGuildServerMsg:NotifyServer(
		dwServerID,'OnEscortBorn',dwGuildID,szGuildName,dwRoleID,
		objEscort.dwDoing,objEscort.dwLineID,objEscort.tabEscortPlayer
	)
	for dwRoleID in pairs(objEscort.tabEscortPlayer) do
		CGuildPlayerMsg:NotifyPlayer(
			dwRoleID,'OnEscortBorn',
			objEscort.dwDoing,objEscort.dwLineID,objEscort.dwServerID
		)
	end
end
-------------------------------------------------------------------------------