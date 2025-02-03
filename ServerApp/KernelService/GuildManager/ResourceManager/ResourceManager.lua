-------------------------------------------------------------------------------
--公会资源数据
-------------------------------------------------------------------------------
local szTable = 'T_Guild_Resource'
local tabPrimeKey = { 'dwGuildID' }
local tabDataKey = {
	'dwMoney','dwItem1','dwItem2','dwItem3','dwItem4',
}
CGuildDatabase:AddTable(szTable,tabPrimeKey,tabDataKey)
-------------------------------------------------------------------------------
_G.CGuildResource = CGuildData:inherit()
CGuildResource.table = 'T_Guild_Resource'
function CGuildResource:Create(tabInfo)
	self.dwGuildID = tabInfo.dwGuildID --公会ID
	self.dwMoney = tabInfo.dwMoney or 0 --资金
	self.dwItem1 = tabInfo.dwItem1 or 0 --物品1
	self.dwItem2 = tabInfo.dwItem2 or 0 --物品2
	self.dwItem3 = tabInfo.dwItem3 or 0 --物品3
	self.dwItem4 = tabInfo.dwItem4 or 0 --物品4
end
-------------------------------------------------------------------------------
--公会资源系统
-------------------------------------------------------------------------------
_G.CGuildResourceMgr = CGuildBaseMgr:inherit()
function CGuildResourceMgr:Create()
	self.tabDataMap = {}
	local objDB = CGuildDatabase:GetTable('T_Guild_Resource')
	local tabRes = objDB:Select() or {}
	for _,v in pairs(tabRes) do
		self:Add(CGuildResource:new(v))
	end
end
function CGuildResourceMgr:Add(objResource)
	local dwGuildID = objResource.dwGuildID
	self.tabDataMap[dwGuildID] = objResource
	return objResource
end
function CGuildResourceMgr:Get(dwGuildID)
	return self.tabDataMap[dwGuildID]
end
function CGuildResourceMgr:Del(dwGuildID)
	local objResource = self.tabDataMap[dwGuildID]
	if not objResource then return end
	self.tabDataMap[dwGuildID] = nil
	return objResource
end
function CGuildResourceMgr:AddContribute(dwRoleID,dwContribute)
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if not objMember then return end
	objMember.dwContribute = objMember.dwContribute + dwContribute
	local objDonate = CGuildDonateMgr:Get(dwRoleID)
	if not objDonate then
		objDonate = CGuildDonate:new({ dwRoleID = dwRoleID })
		CGuildDonateMgr:Add(objDonate):Insert()
	end
	objDonate.dwContribute = objDonate.dwContribute + dwContribute
	objDonate:Update()
	objMember.dwTitle = GuildTitleCount(objDonate.dwContribute)
	objMember:Update()
	if dwContribute > 0 then
		local tabRefresh = {}
		tabRefresh.dwContribute = objMember.dwContribute
		tabRefresh.dwMaxContribute = objDonate.dwContribute
		tabRefresh.dwTitle = objMember.dwTitle
		CGuildPlayerMsg:NotifyPlayer(dwRoleID,'OnRefreshPlayer',tabRefresh )
		CGuildPlayerMsg:NotifyPlayer(dwRoleID,'Notice',3,6001020017,dwContribute)
	end
end
-------------------------------------------------------------------------------
function CGuildResourceMgr:Build(dwGuildID)
	local tabResource = { dwGuildID = dwGuildID }
	local objResource = CGuildResource:new(tabResource)
	CGuildResourceMgr:Add(objResource):Insert()
end
function CGuildResourceMgr:Dismiss(dwGuildID)
	if self:Get(dwGuildID) then
		self:Del(dwGuildID):Delete()
	end
end
-------------------------------------------------------------------------------
--公会捐献数据
-------------------------------------------------------------------------------
local szTable = 'T_Guild_Donate'
local tabPrimeKey = { 'dwRoleID' }
local tabDataKey = {
	'dwMoney','dwItem1','dwItem2','dwItem3','dwItem4','dwContribute',
}
CGuildDatabase:AddTable(szTable,tabPrimeKey,tabDataKey)
-------------------------------------------------------------------------------
_G.CGuildDonate = CGuildData:inherit()
CGuildDonate.table = 'T_Guild_Donate'
function CGuildDonate:Create(tabInfo)
	self.dwRoleID = tabInfo.dwRoleID --玩家ID
	self.dwMoney = tabInfo.dwMoney or 0 --资金
	self.dwItem1 = tabInfo.dwItem1 or 0 --物品1
	self.dwItem2 = tabInfo.dwItem2 or 0 --物品2
	self.dwItem3 = tabInfo.dwItem3 or 0 --物品3
	self.dwItem4 = tabInfo.dwItem4 or 0 --物品4
	self.dwContribute = tabInfo.dwContribute or 0 --贡献度
end
-------------------------------------------------------------------------------
--公会捐献系统
-------------------------------------------------------------------------------
_G.CGuildDonateMgr = CGuildBaseMgr:inherit()
function CGuildDonateMgr:Create()
	self.tabDataMap = {}
	local objDB = CGuildDatabase:GetTable('T_Guild_Donate')
	local tabRes = objDB:Select() or {}
	for _,v in pairs(tabRes) do
		self:Add(CGuildDonate:new(v))
	end
end
function CGuildDonateMgr:Add(objDonate)
	local dwRoleID = objDonate.dwRoleID
	self.tabDataMap[dwRoleID] = objDonate
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if objMember then
		local dwContribute = objDonate.dwContribute
		objMember.dwTitle = GuildTitleCount(dwContribute)
	end
	return objDonate
end
function CGuildDonateMgr:Get(dwRoleID)
	return self.tabDataMap[dwRoleID]
end
function CGuildDonateMgr:Del(dwRoleID)
	local objDonate = self.tabDataMap[dwRoleID]
	if not objDonate then return end
	self.tabDataMap[dwRoleID] = nil
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if objMember then
		objMember.dwTitle = GuildTitleCount(0)
	end
	return objDonate
end
-------------------------------------------------------------------------------
function CGuildDonateMgr:Quit(dwRoleID)
	if self:Get(dwRoleID) then
		self:Del(dwRoleID):Delete()
	end
end
-------------------------------------------------------------------------------