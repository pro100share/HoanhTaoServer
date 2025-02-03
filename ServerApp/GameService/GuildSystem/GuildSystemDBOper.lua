--[[
功能：帮派系统之摇奖数据库（服务器）
版本：v1.0
作者：魏云
时间：2013-08-29
]]
----------------------------------------------------------------------------------

_G.CGuildSystemDBOper = {};
function CGuildSystemDBOper:new(objDB,objUser)
	
	local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	for i, v in pairs(CGuildSystemDBOper) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
---插入
function CGuildSystemDBOper:InsertGuildLDTakeAwardTime(dwCurLDTime)
	local objPlayer = self.objUser:GetPlayer()
	if(not objPlayer) then
		return false;
	end
	local SqlCmd = self.objDBQuery:CreateInsertCmd('T_Role_GuildLD'); 
	SqlCmd.Wheres.dwRoleID  =  objPlayer:GetRoleID(); 
	SqlCmd.Fields.dwCurLDTime = dwCurLDTime;
	SqlCmd:execute()
end
----更新

function CGuildSystemDBOper:UpdateGuildLDTakeAwardTime(dwCurLDTime)
	local objPlayer = self.objUser:GetPlayer()
	if(not objPlayer) then
		return false;
	end
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_GuildLD');
	SqlCmd.Wheres.dwRoleID =  objPlayer:GetRoleID(); 
	SqlCmd.Fields.dwCurLDTime = dwCurLDTime;
	SqlCmd:execute()
end
