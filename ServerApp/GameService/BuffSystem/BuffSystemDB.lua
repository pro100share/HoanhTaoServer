--[[
	buff相关的数据库操作
	曲莹
	2012-02-24
]]--

_G.CBuffSystemDB = {}
function CBuffSystemDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	
	for i, v in pairs(CBuffSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CBuffSystemDB:UsualMethod()
	if not self.m_ObjDB then
		_info("self.m_ObjDB is null by CBuffSystemDB:UsualMethod");
		return false;
	end;
	if not self.m_ObjSys then
		_info("self.m_ObjSys is null by CBuffSystemDB:UsualMethod");
		return false;
	end;
	
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CBuffSystemDB:UsualMethod");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CBuffSystemDB:UsualMethod");
		return false;
	end;
	return true, dwRoleID;
end;
--基础sql语句
--insert
function CBuffSystemDB:InsertBuffDate(buffId, entityId, dwTime, dwValue, leaveTime, level, effectNum, classId, releaseType, releaseId, dwFixTime)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateInsertCmd('T_Role_Buff_Info')
	SqlCmd.Fields.dwRoleID = dwRoleId;
	SqlCmd.Fields.dwBuffID = buffId;
	SqlCmd.Fields.dwEntityID = entityId;
	SqlCmd.Fields.dwTime = dwTime;
	SqlCmd.Fields.dwValue =  dwValue;
	SqlCmd.Fields.dwLeaveTime = leaveTime;
	SqlCmd.Fields.dwLevel = level;
	SqlCmd.Fields.dwEffectNum = effectNum;
	SqlCmd.Fields.dwClassId = classId;
	SqlCmd.Fields.dwReleaseType = releaseType;
	SqlCmd.Fields.dwReleaseId = releaseId;
	SqlCmd.Fields.dwFixTime = dwFixTime;
	SqlCmd:execute();
end;
--update
function CBuffSystemDB:UpdateBuffDate(dwBuffId, dwTime, value, leaveTime, level, effectNum, classId, releaseType, releaseId, dwEntityId, dwFixTime)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Buff_Info')
	SqlCmd.Wheres.dwRoleID = dwRoleId;
	SqlCmd.Fields.dwTime = dwTime;
	SqlCmd.Fields.dwValue =  value;
	SqlCmd.Fields.dwLeaveTime = leaveTime;
	SqlCmd.Fields.dwLevel = level;
	SqlCmd.Fields.dwEffectNum = effectNum;
	SqlCmd.Fields.dwClassId = classId;
	SqlCmd.Fields.dwReleaseType = releaseType;
	SqlCmd.Fields.dwReleaseId = releaseId;
	SqlCmd.Fields.dwFixTime = dwFixTime;
	SqlCmd.Wheres.dwBuffID = dwBuffId;
	SqlCmd.Wheres.dwEntityID = dwEntityId;
	SqlCmd:execute();
end;

function CBuffSystemDB:DelBuffByClass(dwRoleID, dwClassId)
	local SqlCmd = self.m_ObjDB:CreateDeleteCmd('T_Role_Buff_Info')
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Wheres.dwClassId = dwClassId;
	SqlCmd:execute();
end;

function CBuffSystemDB:DelBuffById(dwRoleID)
	local SqlCmd = self.m_ObjDB:CreateDeleteCmd('T_Role_Buff_Info')
	SqlCmd.Wheres.dwRoleID = dwRoleID
	SqlCmd:execute();
end;

function CBuffSystemDB:DelBuff(dwRoleID, buffId, entityId)
	local SqlCmd = self.m_ObjDB:CreateDeleteCmd('T_Role_Buff_Info')
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Wheres.dwBuffID = buffId;
	SqlCmd.Wheres.dwEntityID = entityId;
	SqlCmd:execute();
end;
-----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------保存buff的信息------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
--buff的修改
function CBuffSystemDB:ModifyBuff(buffTbl, buffLifeTbl)
	local flag, dwRoleID = self:UsualMethod();
	if not flag then
		return;
	end;
	local releaseId = 0;
	local releaseType = 0;
	for classId, classTbl in pairs(buffTbl) do
		for buffId, tbl in pairs(classTbl) do
			for entityId, buff in pairs(tbl) do
				if BuffBasicInfo[buffId].bIsLogoutSave == 1 then
					if buffLifeTbl[buffId] then	
						buff.m_time = buffLifeTbl[buffId] - GetCurTime();
					end;
					local buffType = BuffBasicInfo[buffId].dwBuffType;
					if buffType and buffType == 1 then
						buff.m_time = nil;	
					end;
					local leaveTime = 0;
					if BuffBasicInfo[buffId].bIsLogoutLast == 1 then
						leaveTime = GetCurTime();
					end;
					if BuffBasicInfo[buffId].dwChangeRule ~= 2 then   --2为共存
						self:UpdateBuffDate(buffId, buff.m_time or 0, buff.m_value, leaveTime, buff.m_Level, buff.m_EffectNum, classId, buff.m_releaseType or 0, buff.m_releaseId or 0, entityId, buff.m_Fixtime);
					else	
						self:InsertBuffDate(buffId, entityId, buff.m_time or 0, buff.m_value, leaveTime, buff.m_Level, buff.m_EffectNum, classId, buff.m_releaseType or 0, buff.m_releaseId or 0, buff.m_Fixtime)
					end;		
				end;
			end;
		end;
	end;	
end;

function CBuffSystemDB:SaveBuffOnTime(buff, isUpdate)
	local flag, dwRoleID = self:UsualMethod();
	if not flag then
		return;
	end;
	local buffId = buff.m_id;
	if BuffBasicInfo[buffId].bIsLogoutSave == 1 then
		local leaveTime = 0;
		if BuffBasicInfo[buffId].dwChangeRule ~= 2 then   --2为共存	
			if BuffBasicInfo[buffId].bIsLogoutLast == 1 then
				leaveTime = GetCurTime();
			end;
			if not isUpdate then
				self:InsertBuffDate(buff.m_id, buff.m_EntityID, buff.m_time or 0, buff.m_value, leaveTime, buff.m_Level, buff.m_EffectNum, BuffBasicInfo[buff.m_id].dwClassId, buff.m_releaseType or 0, buff.m_releaseId or 0, buff.m_Fixtime);
			else
				self:UpdateBuffDate(buff.m_id, buff.m_time or 0, buff.m_value, leaveTime, buff.m_Level, buff.m_EffectNum, BuffBasicInfo[buff.m_id].dwClassId, buff.m_releaseType or 0, buff.m_releaseId or 0, buff.m_EntityID, buff.m_Fixtime);
			end;
		else
			self:InsertBuffDate(buff.m_id, buff.m_EntityID, buff.m_time or 0, buff.m_value, leaveTime, buff.m_Level, buff.m_EffectNum, BuffBasicInfo[buff.m_id].dwClassId, buff.m_releaseType or 0, buff.m_releaseId or 0, buff.m_Fixtime);
		end;
	end;
end;
----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------删除buff-------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
--按class类删除buff
-- function CBuffSystemDB:DeleteBuffByClassId(classId)
	-- local flag, dwRoleID = self:UsualMethod();
	-- if not flag then
		-- return false;
	-- end;
	-- self:DelBuffByClass(dwRoleID, classId);
-- end;
--清空所有的buff
function CBuffSystemDB:DeleteAllBuff(buffTbl)
	local flag, dwRoleID = self:UsualMethod();
	if not flag then
		return false;
	end;
	for class_id, classTbl in pairs(buffTbl) do
		for buff_id, buffSet in pairs(classTbl) do
			for entityId, buff in pairs(buffSet) do
				self:DeleteBuff(buff_id, entityId);
			end;
		end;
	end;
--	self:DelBuffById(dwRoleID);
end;

--在数据库中删除buff
function CBuffSystemDB:DeleteBuff(buffId, entityId)
	local flag, dwRoleID = self:UsualMethod();
	if not flag then
		return false;
	end;
	self:DelBuff(dwRoleID, buffId, entityId);
end;



