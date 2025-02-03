
--[[
功能：服务器大事件数据管理类(KS)
版本：v1.0
作者：粟宇征
时间：2012-12-05
]]

_G.CSeverEventDataManager = CSingle:new();
CSingleManager:AddSingle(CSeverEventDataManager);
---------------------------------------------------------------------------------------------
function CSeverEventDataManager:Create()
	self.m_tabData = {};
	self.m_dwEventID = 0;
	
	self.objDB = CPlayerDBQuery:GetDBQuery()
	if not self.objDB then 
		_info("DB invalidity by CSeverEventDataManager:Create() objDB");
		return false;
	end;
	
	self:ReadDB();
	
	return true;
end;
function CSeverEventDataManager:Update(dwInterval)
	return true;
end;
function CSeverEventDataManager:Destroy()
end;

--得到数据
function CSeverEventDataManager:GetTabData()
	return self.m_tabData or {};
end

--得到编号
function CSeverEventDataManager:GetEventID()
	return self.m_dwEventID;
end

--设置数据
function CSeverEventDataManager:SetTabData(tabData)
	self.m_tabData = tabData;
	local dwNum = 0;
	for i = 1,_G.dwServerEventTypeNum do if self.m_tabData[i] then dwNum = dwNum + #self.m_tabData[i]; end; end;
	self.m_dwEventID = dwNum
end

--添加数据
function CSeverEventDataManager:AddData(Data)
	if not self.m_tabData[Data.eEventType] then self.m_tabData[Data.eEventType] ={} end;
	self.m_dwEventID = self.m_dwEventID + 1;
	Data.dwEventID = self.m_dwEventID;
	table.insert(self.m_tabData[Data.eEventType],Data);
end

function CSeverEventDataManager:ReadDB()
	local szCmd = 'select * from "T_ServerEvent" where "EventType" = $1'
	local dbres;
	
	for i = 1,_G.dwServerEventTypeNum do
		dbres = self.objDB:execute(szCmd, i);
		self.m_tabData[i] = {}
		local index = 1;
		for k,v in pairs(dbres or {}) do
			self.m_tabData[i][index] = {}

			self.m_tabData[i][index].eEventType = v.EventType
			self.m_tabData[i][index].dwCompleteRoleID = v.CompleteRoleID
			if self.m_tabData[i][index].dwCompleteRoleID ~= -1 then
				self.m_tabData[i][index].szCompleteRoleName = v.CompleteRoleName
			else
				self.m_tabData[i][index].szCompleteRoleName = ' '
			end
			self.m_tabData[i][index].dwCompleteTime = v.CompleteTime
			self.m_tabData[i][index].dwData1 = v.dwData1
			self.m_tabData[i][index].szData1 = v.szData1
			self.m_tabData[i][index].dwEventID = v.EventID
			index = index + 1;
		end
	end
	
end;

function CSeverEventDataManager:WriteDB(Data)
	self:AddData(Data)

	local SqlCmd = self.objDB:CreateInsertCmd('T_ServerEvent')
	
	SqlCmd.Fields.EventType = Data.eEventType or -1
	SqlCmd.Fields.CompleteRoleID = Data.dwCompleteRoleID or -1
	SqlCmd.Fields.CompleteRoleName = Data.szCompleteRoleName or ' '
	SqlCmd.Fields.CompleteTime = Data.dwCompleteTime or -1
	SqlCmd.Fields.dwData1 = Data.dwData1 or -1
	SqlCmd.Fields.szData1 = Data.szData1 or ' '
	SqlCmd.Fields.EventID = self:GetEventID()
	
	SqlCmd:execute()
end;
