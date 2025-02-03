
--[[
	ʱ�䣺2014-1-2
	���ܣ��ƺ�«���ݿ�
	���ߣ�κ��
--]]


_G.CGourdSystemDB = {};

function CGourdSystemDB:new(objDB,objUser)
	local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --��Ӧ�����
	for i, v in pairs(CGourdSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
----������Ϣ
function CGourdSystemDB:InsertGourdInfo()
	local objPlayer = self.objUser:GetPlayer()
	if(not objPlayer) then
		return false;
	end
	local SqlCmd = self.objDBQuery:CreateInsertCmd('T_Role_Gourd'); 
	SqlCmd.Wheres.dwRoleID  = objPlayer:GetRoleID(); 
	SqlCmd.Fields.dwMendLevel = self.objUser.Resdata.MendLevel;
	SqlCmd.Fields.dwCurSkillValue = self.objUser.Resdata.CurSkillValue;
	SqlCmd.Fields.dwCurItemInfos = self.objUser:UpdateStr(self.objUser.Resdata.CurItemInfos);
	SqlCmd.Fields.dwAdornState = self.objUser.Resdata.AdornState;
	SqlCmd.Fields.dwAddTimesItemIndex = self.objUser.Resdata.AddTimesItemIndex;
	SqlCmd:execute()
	return true;
end

----���� ��Ϣ

function CGourdSystemDB:UpdateGourdInfo()
	local objPlayer = self.objUser:GetPlayer()
	if(not objPlayer) then
		return false;
	end
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_Gourd');
	SqlCmd.Wheres.dwRoleID  = objPlayer:GetRoleID(); 
	SqlCmd.Fields.dwMendLevel = self.objUser.Resdata.MendLevel;
	SqlCmd.Fields.dwCurSkillValue = self.objUser.Resdata.CurSkillValue;
	SqlCmd.Fields.dwCurItemInfos = self.objUser:UpdateStr(self.objUser.Resdata.CurItemInfos);
	SqlCmd.Fields.dwAdornState = self.objUser.Resdata.AdornState;
	SqlCmd.Fields.dwAddTimesItemIndex = self.objUser.Resdata.AddTimesItemIndex;
	SqlCmd:execute();
	return true;
end