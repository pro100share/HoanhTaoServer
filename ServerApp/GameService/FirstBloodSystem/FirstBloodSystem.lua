--[[
功能：第一次记录
作者：周长沙
时间：2013-4-22
]]
-------------------------------------
_G.CFirstBloodSystem = {}

local cfg = FirstBloodConfig

local dbTableName = "T_Role_FirstBlood"
local dbCountTableName = "T_Role_CountNumber"
---------------------------------------
function CFirstBloodSystem:new()
	local obj = CSystem:new("CFirstBloodSystem");
	obj.Data = {}
	for i,v in pairs(CFirstBloodSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CFirstBloodSystem:Create(IsChangeLine)
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return false;
	end;
	local Data = objPlayer:GetLineData("CFirstBloodSystem")
	if Data then
		self.Data = Data[1][1] or {}
		self.CountData = Data[1][2] or {}
	end
end

function CFirstBloodSystem:Update()
end

function CFirstBloodSystem:Destroy()
end

function CFirstBloodSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer()
	objPlayer:SetLineData("CFirstBloodSystem",{self.Data,self.CountData})
end

function CFirstBloodSystem:OnEventCenter(szEventName,...)
	if _G.FirstBloodSwitch then 
		local dwIndex = CFirstBloodManager:GetEventIndex(szEventName)
		if dwIndex and not self.Data[dwIndex] then
			local param = {...}
			self:SaveFrist(dwIndex,param)
		end
	end
	if _G.CountNumberSwitch then 
		local dwIndex = CFirstBloodManager:GetCountEventIndex(szEventName)
		if dwIndex then
			if self.CountData[dwIndex] then
				self.CountData[dwIndex] = self.CountData[dwIndex] + 1
				self:SaveCount(dwIndex)
			else
				self:InsertCount(dwIndex)
			end
		end
	end
end
function CFirstBloodSystem:InsertCount(dwIndex)
	local objPlayer = self:GetPlayer()	
	local Field = {}
	Field.dwIndex = dwIndex
	Field.dwRoleID = objPlayer:GetRoleID()
	Field.dwCount = 1
	self.CountData[dwIndex] = 1
	self:DBWriteCount(Field)
end
function CFirstBloodSystem:SaveCount(dwIndex)
	local objPlayer = self:GetPlayer()	
	local Field = {}
	Field.dwCount = self.CountData[dwIndex]
	self:DBUpdate(Field,dwIndex)
end
function CFirstBloodSystem:DBWriteCount(Field)
	local objPlayer = self:GetPlayer()
	local objDB = objPlayer:GetDBQuery();
	local SqlCmd = objDB:CreateInsertCmd(dbCountTableName);
	SqlCmd.Fields = Field;
	SqlCmd:execute()
end
function CFirstBloodSystem:DBUpdate(Field,dwIndex)
	local objPlayer = self:GetPlayer()
	local objDB = objPlayer:GetDBQuery();
	local SqlCmd = objDB:CreateUpdateCmd(dbCountTableName);
	SqlCmd.Fields = Field;
	SqlCmd.Wheres.dwRoleID = objPlayer:GetRoleID()
	SqlCmd.Wheres.dwIndex = dwIndex
	SqlCmd:execute()
end
function CFirstBloodSystem:SaveFrist(dwIndex,param)
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	local dwSubIndex = cfg[dwIndex].dwSubParamIndex
	
	local Field = {}
	Field.dwIndex = dwIndex
	Field.dwRoleID = objPlayer:GetRoleID()
	Field.dwLevel = objPlayer:GetLevel()
	Field.dwTaskID = sysTask:GetMainTask()
	Field.dwGold = sysItem:GetGoldNum()
	Field.dwBindGold = sysItem:GetBindGoldNum()
	Field.dwMoney = sysItem:GetAllMoney()
	if dwSubIndex>0 then
		if type(param[dwSubIndex])=="table" then
			Field.szSubParam = json.encode(param[dwSubIndex])
		else
			Field.szSubParam = tostring(param[dwSubIndex])
		end
	end
	self.Data[dwIndex] = Field
	self:DBWrite(Field)
end

function CFirstBloodSystem:DBWrite(Field)
	local objPlayer = self:GetPlayer()
	local objDB = objPlayer:GetDBQuery();
	local SqlCmd = objDB:CreateInsertCmd(dbTableName);
	SqlCmd.Fields = Field;
	SqlCmd:execute()
end
















