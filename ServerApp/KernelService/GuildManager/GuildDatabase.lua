--[[
功能：帮派系统数据库操作
版本：v1.0
作者：郭肇义
时间：2012-05-04
]]

-------------------------------------------------------------------------------
--DB命令类
-------------------------------------------------------------------------------
_G.CGuildDBCommand = {}
function CGuildDBCommand:Create(objDB)
	self.objDB = objDB
	return self
end;
-------------------------------------------------------------------------------
--获取条目
function CGuildDBCommand:Select(szTable,tabPrime)
	local tabEntryList = nil
	local szCmd = 'select * from "'..szTable..'"'
	if tabPrime then
		local dwIndex = 1
		local tabValue = {}
		szCmd = szCmd..' where '
		for k,v in pairs(tabPrime) do
			szCmd = szCmd..'"'..k..'" = $'..dwIndex..' and '
			tabValue[dwIndex] = v
			dwIndex = dwIndex + 1
		end
		szCmd = string.sub(szCmd,1,-5)
		tabEntryList = self.objDB:execute_sync(szCmd,unpack(tabValue))
	else
		tabEntryList = self.objDB:execute_sync(szCmd)
	end
	return tabEntryList
end
--删除条目
function CGuildDBCommand:Delete(szTable,tabPrime)
	local szCmd = 'delete from "'..szTable..'"'
	if tabPrime then
		local dwIndex = 1
		local tabValue = {}
		szCmd = szCmd..' where '
		for k,v in pairs(tabPrime) do
			szCmd = szCmd..'"'..k..'" = $'..dwIndex..' and '
			tabValue[dwIndex] = v
			dwIndex = dwIndex + 1
		end
		szCmd = string.sub(szCmd,1,-5)
		self.objDB:execute_async(szCmd,unpack(tabValue))
	else
		self.objDB:execute_async(szCmd)
	end
end
--更新条目
function CGuildDBCommand:Update(szTable,tabData,tabPrime)
	local szCmd = 'update "'..szTable..'" set '
	local tabValue = {}
	local dwIndex = 1
	for k,v in pairs(tabData or {}) do
		szCmd = szCmd..'"'..k..'" = $'..dwIndex..','
		tabValue[dwIndex] = v
		dwIndex = dwIndex + 1
	end
	szCmd = string.sub(szCmd,1,-2)
	if tabPrime then
		szCmd = szCmd..' where '
		for k,v in pairs(tabPrime) do
			szCmd = szCmd..'"'..k..'" = $'..dwIndex..' and '
			tabValue[dwIndex] = v
			dwIndex = dwIndex + 1
		end
		szCmd = string.sub(szCmd,1,-5)
	end
	self.objDB:execute_async(szCmd,unpack(tabValue))
	return true
end
--插入条目
function CGuildDBCommand:Insert(szTable,tabData,tabPrime)
	local szCmd = 'insert into "'..szTable..'" ('
	local tabValue = {}
	local dwIndex = 1
	for k,v in pairs(tabData or {}) do
		szCmd = szCmd..'"'..k..'",'
		tabValue[dwIndex] = v
		dwIndex = dwIndex + 1
	end
	for k,v in pairs(tabPrime or {}) do
		szCmd = szCmd..'"'..k..'",'
		tabValue[dwIndex] = v
		dwIndex = dwIndex + 1
	end
	szCmd = string.sub(szCmd,1,-2)
	szCmd = szCmd ..') values('
	for k,v in pairs(tabValue) do
		szCmd = szCmd..'$'..k..','
	end
	szCmd = string.sub(szCmd,1,-2)
	szCmd = szCmd..')'
	self.objDB:execute_async(szCmd,unpack(tabValue))
	return true
end
-------------------------------------------------------------------------------
--ID生成器
-------------------------------------------------------------------------------
_G.CGuildIDFactory = {}
function CGuildIDFactory:Create()
	self.tabID = {}
	local dwCount = CConfig.RoleDB.dwDBRoleMaxCount
	local dwHostID = CConfig.Network.dwServerHostID
	local dwMinID = dwCount * dwHostID
	local dwMaxID = dwCount * (dwHostID + 1)
	local szSql = 'select max("dwGuildID") from "T_Guild_Info" '
	szSql = szSql..' where "dwGuildID" > $1 and "dwGuildID" < $2'
	local objDBQuery = CPlayerDBQuery:GetDBQuery()
	local tabData = objDBQuery:execute(szSql,dwMinID,dwMaxID)
	if tabData and tabData[1].max then
		self.tabID.dwGuildID = tabData[1].max
	else
		self.tabID.dwGuildID = dwMinID + 1
	end
	local szSql = 'select max("dwLogID") from "T_Guild_Log" '
	szSql = szSql..'where "dwLogID" > $1 and "dwLogID" < $2'
	local tabData = objDBQuery:execute(szSql,dwMinID,dwMaxID)
	if tabData and tabData[1].max then
		self.tabID.dwLogID = tabData[1].max
	else
		self.tabID.dwLogID = dwMinID + 1
	end
end
function CGuildIDFactory:Generate(szIndex)
	local dwCurID = self.tabID[szIndex] + 1
	self.tabID[szIndex] = dwCurID
	return dwCurID
end
-------------------------------------------------------------------------------
--数据表
-------------------------------------------------------------------------------
_G.CGuildDataTable = {}
function CGuildDataTable:new(szTable,tabPrimeKey,tabDataKey)
	local obj = {}
	obj.szTable = szTable
	obj.tabPrimeKey = tabPrimeKey
	obj.tabDataKey = tabDataKey
	setmetatable( obj,{ __index = self } )
	return obj
end
function CGuildDataTable:Select(tabInfo)
	local tabPrime = self:Format(tabInfo)
	return CGuildDBCommand:Select(self.szTable,tabPrime)
end
function CGuildDataTable:Delete(tabInfo)
	local tabPrime = self:Format(tabInfo)
	return CGuildDBCommand:Delete(self.szTable,tabPrime)
end
function CGuildDataTable:Insert(tabInfo)
	local tabPrime,tabData = self:Format(tabInfo)
	return CGuildDBCommand:Insert(self.szTable,tabData,tabPrime)
end
function CGuildDataTable:Update(tabInfo)
	local tabPrime,tabData = self:Format(tabInfo)
	return CGuildDBCommand:Update(self.szTable,tabData,tabPrime)
end
function CGuildDataTable:Format(tabInfo)
	tabInfo = tabInfo or {}
	local tabPrime = nil
	for _,szIndex in pairs(self.tabPrimeKey) do
		local v = tabInfo[szIndex]
		if v then
			tabPrime = tabPrime or {}
			tabPrime[szIndex] = v
		end
	end
	local tabData = nil
	for _,szIndex in pairs(self.tabDataKey) do
		local v = tabInfo[szIndex]
		if v then
			tabData = tabData or {}
			tabData[szIndex] = v
		end
	end
	return tabPrime,tabData
end
-------------------------------------------------------------------------------
--数据库
-------------------------------------------------------------------------------
_G.CGuildDatabase = {}
CGuildDatabase.tabDataTable = {}
function CGuildDatabase:AddTable(szName,tabPrimeKey,tabDataKey)
	local obj = CGuildDataTable:new(szName,tabPrimeKey,tabDataKey)
	self.tabDataTable[szName] = obj
end
function CGuildDatabase:GetTable(szName)
	return self.tabDataTable[szName]
end
-------------------------------------------------------------------------------