--[[
功能：排行榜数据库操作
版本：v1.0
作者：郭肇义
时间：2012-04-05
]]

_G.CChartManagerDB = {}
-----------------------------------------------------------------------------------------------
--创建系统数据库
function CChartManagerDB:Create(objDB)
	self.objDB = objDB
	return self
end;
-----------------------------------------------------------------------------------------------
--接口
-----------------------------------------------------------------------------------------------
function CChartManagerDB:GetChartList()
	return self.objDB:execute_sync('SELECT T1.*, T2."dwAccountID" FROM "T_Role_Chart_List" AS T1 LEFT JOIN "T_Role_Info" AS T2 ON T1."dwRoleID" = T2."dwRoleID"') or {}
end
function CChartManagerDB:SetChartList(eType,dwNumber,tabParam)
	tabParam = tabParam or {}
	local szCmd = 'update "T_Role_Chart_List" set "dwRoleID" = $3, "szRoleName" = $4, "dwValue" = $5, "dwChange" = $6 where "eType" = $1 and "dwNumber" = $2'
	self.objDB:execute_async(szCmd,eType,dwNumber,tabParam.dwRoleID or 0,tabParam.szRoleName or '',tabParam.dwValue or 0,tabParam.dwChange or 0)
end
function CChartManagerDB:AddChartList(eType,dwNumber,tabParam)
	tabParam = tabParam or {}
	local szCmd = 'insert into "T_Role_Chart_List" ("eType","dwNumber","dwRoleID","szRoleName","dwValue","dwChange") values($1,$2,$3,$4,$5,$6)'
	self.objDB:execute_async(szCmd,eType,dwNumber,tabParam.dwRoleID or 0,tabParam.szRoleName or '',tabParam.dwValue or 0,tabParam.dwChange or 0)
end
function CChartManagerDB:DelChartList(eType,dwNumber)
	local szCmd = 'delete from "T_Role_Chart_List" where "eType" = $1 and "dwNumber" = $2'
	self.objDB:execute_async(szCmd,eType,dwNumber)
end
-----------------------------------------------------------------------------------------------
function CChartManagerDB:GetChartData()
	return self.objDB:execute_sync('select * from "T_Role_Chart_Data"') or {}
end
function CChartManagerDB:SetChartData(eType,dwRoleID,tabParam)
	tabParam = tabParam or {}
	local szCmd = 'update "T_Role_Chart_Data" set "dwValue" = $3 where "eType" = $1 and "dwRoleID" = $2'
	self.objDB:execute_async(szCmd,eType,dwRoleID,tabParam.dwValue or 0)
end
function CChartManagerDB:AddChartData(eType,dwRoleID,tabParam)
	tabParam = tabParam or {}
	local szCmd = 'insert into "T_Role_Chart_Data" ("eType","dwRoleID","szRoleName","dwValue") values($1,$2,$3,$4)'
	self.objDB:execute_async(szCmd,eType,dwRoleID,tabParam.szRoleName or '',tabParam.dwValue or 0)
end
function CChartManagerDB:DelChartData(eType,tabParam)
	if type(tabParam) == 'number' then
		local szCmd = 'delete from "T_Role_Chart_Data" where "eType" = $1 and "dwRoleID" = $2'
		self.objDB:execute_async(szCmd,eType,tabParam)
	end
	if type(tabParam) == 'table' then
		local szCmd = 'delete from "T_Role_Chart_Data" where "eType" = $1 and "dwValue" < $2'
		self.objDB:execute_async(szCmd,eType,tabParam.dwValue or 0)
	end
end
-----------------------------------------------------------------------------------------------
