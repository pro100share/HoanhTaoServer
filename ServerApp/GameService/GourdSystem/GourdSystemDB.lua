
--[[
	时间：2014-1-2
	功能：酒葫芦数据库
	作者：魏云
--]]


_G.CGourdSystemDB = {};

function CGourdSystemDB:new(objDB,objUser)
	local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	for i, v in pairs(CGourdSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
----插入信息
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

----更新 信息

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