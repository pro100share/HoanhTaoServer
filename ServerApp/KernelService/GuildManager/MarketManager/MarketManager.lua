-------------------------------------------------------------------------------
--公会市场数据
-------------------------------------------------------------------------------
local szTable = 'T_Guild_Shop'
local tabPrimeKey = { 'dwGuildID','dwItemEnum' }
local tabDataKey =  { 'dwItemNumber' }
CGuildDatabase:AddTable(szTable,tabPrimeKey,tabDataKey)
-------------------------------------------------------------------------------
_G.CGuildItem = CGuildData:inherit()
CGuildItem.table = 'T_Guild_Shop'
function CGuildItem:Create(tabInfo)
	self.dwGuildID = tabInfo.dwGuildID --公会ID
	self.dwItemEnum = tabInfo.dwItemEnum --物品ID
	self.dwItemNumber = tabInfo.dwItemNumber or 0 --物品数量
end
-------------------------------------------------------------------------------
--公会市场系统
-------------------------------------------------------------------------------
_G.CGuildMarketMgr = CGuildBaseMgr:inherit()
function CGuildMarketMgr:Create()
	self.tabDataMap = CGuildMutiMap:new(2)
	local objDB = CGuildDatabase:GetTable('T_Guild_Shop')
	local tabRes = objDB:Select() or {}
	--------------------------fix--------------------------
	local tabTmp = {}
	for _,v in pairs(tabRes) do
		local bFlag = false
		for _,cfg in pairs(GuildShopConfig) do
			if v.dwItemEnum == cfg.dwItemEnum then
				bFlag = true
			end
		end
		if bFlag then
			table.insert(tabTmp,v)
		else
			objDB:Delete(v)
		end
	end
	tabRes = tabTmp
	--------------------------end--------------------------
	for _,v in pairs(tabRes) do
		local objItem = CGuildItem:new(v)
		self:Add(objItem)
	end
	
	local tb = { dwTime = "23:50" }
	local fn = function() self:Refresh() end
	CAlarmClock:AddTask(tb,CAlarmTaskCycleType.eDay,1,0,fn,{})
end
function CGuildMarketMgr:Add(objItem)
	local dwGuildID = objItem.dwGuildID
	local dwItemEnum = objItem.dwItemEnum
	self.tabDataMap:Set(dwGuildID,dwItemEnum,objItem)
	return objItem
end
function CGuildMarketMgr:Get(dwGuildID,dwItemEnum)
	return self.tabDataMap:Get(dwGuildID,dwItemEnum)
end
function CGuildMarketMgr:Del(dwGuildID,dwItemEnum)
	local objItem = self.tabDataMap:Get(dwGuildID,dwItemEnum)
	if not objItem then return end
	self.tabDataMap:Set(dwGuildID,dwItemEnum,nil)
	return objItem
end
function CGuildMarketMgr:Refresh()
	local tabRefresh = {}
	for _,v in pairs( GuildShopConfig ) do
		tabRefresh[v.dwItemEnum] = v.dwItemStock
	end
	local fn = function(objItem)
		local dwItemStock = tabRefresh[objItem.dwItemEnum]
		if not dwItemStock then return end
		objItem.dwItemNumber = dwItemStock
	end
	self.tabDataMap:Iterator(fn)
	local objDB = CGuildDatabase:GetTable('T_Guild_Shop')
	for dwItemEnum,dwItemStock in pairs(tabRefresh) do
		local tabInfo = {}
		tabInfo.dwItemEnum = dwItemEnum
		tabInfo.dwItemNumber = dwItemStock
		objDB:Update(tabInfo)
	end
end
-------------------------------------------------------------------------------
function CGuildMarketMgr:Dismiss(dwGuildID)
	local objGuild = CGuildInfoMgr:Get(dwGuildID)
	for _,cfg in pairs(GuildShopConfig) do
		local dwItemEnum = cfg.dwItemEnum
		if self:Get(dwGuildID,dwItemEnum) then
			self:Del(dwGuildID,dwItemEnum):Delete()
		end
	end
end
-------------------------------------------------------------------------------