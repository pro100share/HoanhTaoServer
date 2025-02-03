--[[
	--功能：在线礼包数据库类
	--作者：魏云
	--时间：2013-11-29
--]]

_G.COnlineAwardsSystemDB = {};
function COnlineAwardsSystemDB:new(objDB,objUser)
	local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	for i, v in pairs(COnlineAwardsSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

----插入信息
function COnlineAwardsSystemDB:InsertOnlineAwardsInfo()
	local objPlayer = self.objUser:GetPlayer()
	if(not objPlayer) then
		return false;
	end
	local SqlCmd = self.objDBQuery:CreateInsertCmd('T_Role_OnlineAwards'); 
	SqlCmd.Wheres.dwRoleID  = objPlayer:GetRoleID(); 
	SqlCmd.Fields.dwUsedNum = self.objUser.UsedNum;
	SqlCmd.Fields.dwAwardIndexs = self.objUser:UpdateStr(self.objUser.AwardIndexs);
	SqlCmd.Fields.dwAwardTypes = self.objUser:UpdateStr(self.objUser.AwardTypes);
	SqlCmd.Fields.dwAwardStates = self.objUser:UpdateStr(self.objUser.AwardStates);
	SqlCmd.Fields.dwInterTime = self.objUser.InterTime;
	SqlCmd:execute()
	return true;
end

----更新 信息

function COnlineAwardsSystemDB:UpdateOnlineAwardsInfo()
	local objPlayer = self.objUser:GetPlayer()
	if(not objPlayer) then
		return false;
	end
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_OnlineAwards');
	SqlCmd.Wheres.dwRoleID  = objPlayer:GetRoleID(); 
	SqlCmd.Fields.dwUsedNum = self.objUser.UsedNum;
	SqlCmd.Fields.dwAwardIndexs = self.objUser:UpdateStr(self.objUser.AwardIndexs);
	SqlCmd.Fields.dwAwardTypes = self.objUser:UpdateStr(self.objUser.AwardTypes);
	SqlCmd.Fields.dwAwardStates = self.objUser:UpdateStr(self.objUser.AwardStates);
	SqlCmd.Fields.dwInterTime = self.objUser.InterTime;
	SqlCmd:execute();
	return true;
end