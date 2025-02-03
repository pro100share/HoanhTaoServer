--[[
	--功能：聚灵珠数据库类
	--作者：魏云
	--时间：2013-11-22
--]]

_G.CCollectJewelSystemDB = {};
function CCollectJewelSystemDB:new(objDB,objUser)
	local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	for i, v in pairs(CCollectJewelSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

----插入信息
function CCollectJewelSystemDB:InsertCollectJewelInfo()
	local objPlayer = self.objUser:GetPlayer()
	if(not objPlayer) then
		return false;
	end
	local SqlCmd = self.objDBQuery:CreateInsertCmd('T_Role_CollectJewel'); 
	SqlCmd.Wheres.dwRoleID  = objPlayer:GetRoleID(); 
	SqlCmd.Fields.dwInjectJewelUseNum = self.objUser:UpdateStr(self.objUser.InjectJewelUseNum);
	SqlCmd.Fields.dwInjectJewelState = self.objUser:UpdateStr(self.objUser.InjectJewelState);
	SqlCmd.Fields.dwInjectJewelProcess = self.objUser:UpdateStr(self.objUser.InjectJewelProcess);
	SqlCmd.Fields.dwInjectJewelUseTotalNum = self.objUser.InjectJewelUseTotalNum;
	SqlCmd.Fields.dwInjectJewelAddCanUseNum = self.objUser:UpdateStr(self.objUser.InjectJewelAddCanUseNum);
	SqlCmd.Fields.dwInjectJewelAddCanUseTotalNum = self.objUser.InjectJewelAddCanUseTotalNum;
	SqlCmd:execute()
	return true;
end

----更新 信息

function CCollectJewelSystemDB:UpdateCollectJewelInfo()
	local objPlayer = self.objUser:GetPlayer()
	if(not objPlayer) then
		return false;
	end
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_CollectJewel');
	SqlCmd.Wheres.dwRoleID  = objPlayer:GetRoleID(); 
	SqlCmd.Fields.dwInjectJewelUseNum = self.objUser:UpdateStr(self.objUser.InjectJewelUseNum);
	SqlCmd.Fields.dwInjectJewelState = self.objUser:UpdateStr(self.objUser.InjectJewelState);
	SqlCmd.Fields.dwInjectJewelProcess = self.objUser:UpdateStr(self.objUser.InjectJewelProcess);
	SqlCmd.Fields.dwInjectJewelUseTotalNum = self.objUser.InjectJewelUseTotalNum;
	SqlCmd.Fields.dwInjectJewelAddCanUseNum = self.objUser:UpdateStr(self.objUser.InjectJewelAddCanUseNum);
	SqlCmd.Fields.dwInjectJewelAddCanUseTotalNum = self.objUser.InjectJewelAddCanUseTotalNum;
	SqlCmd:execute();
	return true;
end