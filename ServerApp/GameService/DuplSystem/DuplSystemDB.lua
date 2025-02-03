--[[
	副本相关的数据库操作
	曲莹
	2012-02-24
]]--

_G.CDuplSystemDB = {}
function CDuplSystemDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CDuplSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CDuplSystemDB:UsualMethod()
	if not self.m_ObjDB then
		_info("self.m_ObjDB is null by CDuplSystemDB");
		return false;
	end;
	if not self.m_ObjSys then
		_info("self.m_ObjSys is null by CDuplSystemDB");
		return false;
	end;
	
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CDuplSystemDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CDuplSystemDB");
		return false;
	end;
	return true, dwRoleID;
end;

--insert T_Dupl_Info
function CDuplSystemDB:AddDuplInfo(dwRoleID, duplId, entityId)
	local SqlCmd = self.m_ObjDB:CreateInsertCmd('T_Dupl_Info')
	SqlCmd.Fields.dwRoleId = dwRoleID
	SqlCmd.Fields.dwDuplId = duplId;
	SqlCmd.Fields.dwEntityId = entityId;
	SqlCmd.Fields.dwTimes = 1;
	SqlCmd.Fields.dwDateTimes = GetCurTime();
	SqlCmd:execute();
end;
--update T_Dupl_Info
function CDuplSystemDB:SetDuplInfo(dwRoleID, times, entityId, duplId)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Dupl_Info')
	SqlCmd.Fields.dwTimes = times;
	SqlCmd.Fields.dwEntityId = entityId;
	SqlCmd.Fields.dwDateTimes = GetCurTime();
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd.Wheres.dwDuplId = duplId;
	SqlCmd:execute();
end;
--只更新进入副本次数
function CDuplSystemDB:UpdateDuplTimes(dwRoleID, times, duplId)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Dupl_Info')
	SqlCmd.Fields.dwTimes = times;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd.Wheres.dwDuplId = duplId;
	SqlCmd:execute();
end;
--更新时间及进入副本次数
function CDuplSystemDB:UpdateDuplTimesAndCreateTime(dwRoleID, times, duplId)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Dupl_Info')
	SqlCmd.Fields.dwTimes = times;
	SqlCmd.Fields.dwDateTimes = GetCurTime();
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd.Wheres.dwDuplId = duplId;
	SqlCmd:execute();
end;
function CDuplSystemDB:UpdateDuplEnterTime(dwRoleID, duplId)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Dupl_Info')
	SqlCmd.Fields.dwTimes = 0;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd.Wheres.dwDuplId = duplId;
	SqlCmd:execute();
end;
--delete T_Dupl_Info
function CDuplSystemDB:DelDuplInfo(dwRoleID, duplId)
	local SqlCmd = self.m_ObjDB:CreateDeleteCmd('T_Dupl_Info')
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd.Wheres.dwDuplId = duplId;
	SqlCmd:execute();
end;
-----------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------保存副本信息----------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
--记录进入副本的次数
function CDuplSystemDB:GetEnterFbTimes(duplId, entityId, enterTimes)
	local flag, dwRoleID = self:UsualMethod();
	if not flag then
		return false;
	end;
	if not enterTimes then
		self:AddDuplInfo(dwRoleID, duplId, entityId);
		return true, 1;
	else
		if enterTimes >= DuplConfig[duplId].dwEnterTimes then			
			return false, enterTimes + 1;
		else
			local times = enterTimes + 1;
			self:SetDuplInfo(dwRoleID, times, entityId, duplId);
			return true, times;
		end;
	end;
end;

--更新进入副本的次数(通过道具)
function CDuplSystemDB:UpdateEnterTimes(duplId, entityId, enterTimes)
	local flag, dwRoleID = self:UsualMethod();
	if not flag then
		return false;
	end;
	local times = enterTimes + 1;
	self:SetDuplInfo(dwRoleID, times, entityId, duplId)
end;

-------------------------------------修改珍珑棋局副本进度---------------------------------------
function CDuplSystemDB:UpdateData(dwRoleID, planNum)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Dupl_ZL_Info');
	SqlCmd.Fields.bossTimes = planNum;
	SqlCmd.Wheres.roleId = dwRoleID;
	SqlCmd:execute();
end;
function CDuplSystemDB:UpdateZLPlan(planNum)
	local flag, dwRoleID = self:UsualMethod();
	if not flag then
		return false;
	end;
	self:UpdateData(dwRoleID, planNum)
end;
-------------------------------------修改积分信息---------------------------------------
--update T_Dupl_JiFen_Info
function CDuplSystemDB:UpdateJiFenInfo(dwRoleID, duplId, dwScore)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Dupl_JiFen_Info')
	SqlCmd.Fields.dwScore = dwScore;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd.Wheres.dwDuplId = duplId;
	SqlCmd:execute();
end;

--update T_Dupl_ZL_Boss_Record
function CDuplSystemDB:UpdateZLBossInfo(dwRoleID, bossInfo)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Dupl_ZL_Boss_Record')
	SqlCmd.Fields.hitBossInfo = bossInfo;
	SqlCmd.Wheres.roleId = dwRoleID;
	SqlCmd:execute();
end;