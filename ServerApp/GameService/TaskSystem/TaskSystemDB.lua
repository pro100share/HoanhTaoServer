--[[
功能：任务系统数据库操作（服务器）
作者：周长沙
时间：2012-2-11
]]

_G.CTaskSystemDB = {}
local dbTableName = "T_Role_Task"
local dbExTableName = "T_Role_Task_Ex"
------------------------------------------
local function GetNowTime()
	return GetCurTime()
end
------------------------------------------
function CTaskSystemDB:new(objDB,objUser)
	local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	for i, v in pairs(CTaskSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
-------------------------------------------------------------------------------------------------------
--插入一条任务信息
function CTaskSystemDB:AddTaskInfo(Pack)
	local SqlCmd = self.objDBQuery:CreateInsertCmd(dbTableName);
	SqlCmd.Fields = Pack;
	SqlCmd:execute()
	return true;
end
--更新一条任务信息
function CTaskSystemDB:UpdateTaskInfo(Pack)
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CTaskSystemDB");
		return false;
	end;
	
	local SqlCmd = self.objDBQuery:CreateUpdateCmd(dbTableName);
	SqlCmd.Wheres.dwRoleID = Pack.dwRoleID;
	SqlCmd.Wheres.dwTaskId = Pack.dwTaskId;
	SqlCmd.Fields = Pack
	SqlCmd:execute()
	return true;
end
-------------------------------------------------------------------------------------------
--插入特殊任务信息
function CTaskSystemDB:InsertTaskExInfo(dwRoleID)
	local SqlCmd = self.objDBQuery:CreateInsertCmd(dbExTableName);
	SqlCmd.Fields = {dwRoleID=dwRoleID};
	SqlCmd:execute()
end
function CTaskSystemDB:UpdateTaskExInfo(dwRoleID,dwDailyLoop,dwWeeklyLoop,dwNowLoop,dwNowLoopTaskId)
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CTaskSystemDB");
		return false;
	end;
	
	local SqlCmd = self.objDBQuery:CreateUpdateCmd(dbExTableName);
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Fields = {
		dwDailyLoop=dwDailyLoop;
		dwUpdateTime=GetNowTime();
		dwWeeklyLoop=dwWeeklyLoop;
		dwNowLoop=dwNowLoop;
		dwNowTask=dwNowLoopTaskId;
	};
	SqlCmd:execute()
	return true;
end


--更新日环信息
function CTaskSystemDB:UpdateDaily(dwRoleID,dwDailyLoop)
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CTaskSystemDB");
		return false;
	end;
	
	local SqlCmd = self.objDBQuery:CreateUpdateCmd(dbExTableName);
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Fields = {dwDailyLoop=dwDailyLoop;dwDailyUpdateTime=GetNowTime()}
	SqlCmd:execute()
	return true;
end
--更新周环信息
function CTaskSystemDB:UpdateWeekly(dwRoleID,dwWeeklyLoop)
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CTaskSystemDB");
		return false;
	end;
	
	local SqlCmd = self.objDBQuery:CreateUpdateCmd(dbExTableName);
	SqlCmd.Wheres.dwRoleID = dwRoleID
	SqlCmd.Fields = {dwWeeklyLoop=dwWeeklyLoop;dwWeeklyUpdateTime=GetNowTime()}
	SqlCmd:execute()
	return true;
end
--更新随机信息
function CTaskSystemDB:UpdateRandom(dwRoleID,dwRandomLoop)
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CTaskSystemDB");
		return false;
	end;
	
	local SqlCmd = self.objDBQuery:CreateUpdateCmd(dbExTableName);
	SqlCmd.Wheres.dwRoleID = dwRoleID
	SqlCmd.Fields = {dwRandomLoop=dwRandomLoop;dwRandomUpdateTime=GetNowTime()}
	SqlCmd:execute()
	return true;
end







