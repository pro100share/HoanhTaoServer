--[[
���ܣ�����ϵͳ֮ҡ�����ݿ⣨��������
�汾��v1.0
���ߣ�κ��
ʱ�䣺2013-08-29
]]
----------------------------------------------------------------------------------

_G.CGuildSystemDBOper = {};
function CGuildSystemDBOper:new(objDB,objUser)
	
	local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --��Ӧ�����
	for i, v in pairs(CGuildSystemDBOper) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
---����
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
----����

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
