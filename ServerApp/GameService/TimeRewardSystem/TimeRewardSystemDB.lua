--[[
功能：在线奖励 系统数据库操作（服务器）
作者：周长沙
时间：2013-4-7
]]

_G.CTimeRewardSystemDB = {}
local dbTableName = "T_Role_Time_Reward"
----------------------------------------------------------------
function CTimeRewardSystemDB:new(objDB,objUser)
	local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	setmetatable(obj,{__index=self})
	return obj;
end
-----------------------------------------------------------------
function CTimeRewardSystemDB:Insert()
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CTimeRewardSystemDB");
		return false;
	end;
	local dwRoleID = self.objUser:GetRoleID()
	local SqlCmd = self.objDBQuery:CreateInsertCmd(dbTableName);
	SqlCmd.Fields = {};
	SqlCmd.Fields.dwRoleID = dwRoleID
	SqlCmd:execute()
end

function CTimeRewardSystemDB:Update(Info)
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CTimeRewardSystemDB");
		return false;
	end;
	local SqlCmd = self.objDBQuery:CreateUpdateCmd(dbTableName);
	SqlCmd.Wheres.dwRoleID = self.objUser:GetRoleID()
	SqlCmd.Fields = Info
	SqlCmd:execute()
	return true
end

























