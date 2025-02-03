
--[[
功能：疯狂的锄头数据库类（服务器）
作者：魏云
时间：2013-8-22
--]]

_G.CFrenzyHoeSystemDBOper = {};
function CFrenzyHoeSystemDBOper:new(objDB,objUser)
	local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	for i, v in pairs(CFrenzyHoeSystemDBOper) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

---更新玩家奖励信息
function CFrenzyHoeSystemDBOper:UpdateFrenzyHoeRoleInfo()
	local objPlayer = self.objUser:GetPlayer()
	if(not objPlayer) then
		return false;
	end
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_FrenzyHoe');
	SqlCmd.Wheres.dwRoleId = objPlayer:GetRoleID();
	_info("=====self.objUser.dataAwardList.dwFrendNum=====",self.objUser.dataAwardList.dwFrendNum)
	SqlCmd.Fields.dwFrendNum = self.objUser.dataAwardList.dwFrendNum
	SqlCmd.Fields.dwAwardItemId = self.objUser.dataAwardList.dwAwardItemId
	SqlCmd.Fields.dwIsGet = self.objUser.dataAwardList.dwIsGet
	SqlCmd.Fields.dwHoeItemId = self.objUser.dataAwardList.dwHoeItemId;
	SqlCmd.Fields.dwAwardItemNum = self.objUser.dataAwardList.dwAwardItemNum
	SqlCmd:execute()
end

----插入 挖宝事件信息
function CFrenzyHoeSystemDBOper:InsertFrenzyHoeItemInfo(awardItemId)
	local objPlayer = self.objUser:GetPlayer()
	if(not objPlayer) then
		return false;
	end
	local SqlCmd = self.objDBQuery:CreateInsertCmd('T_Item_FrenzyHoe'); ---挖宝事件表
	SqlCmd.Wheres.dwAwardItemId  = awardItemId; 
	SqlCmd.Fields.szRoleName = objPlayer:GetName();
	SqlCmd.Fields.dwRoleId = objPlayer:GetRoleID();
	SqlCmd:execute()
end

----更新 挖宝事件信息

function CFrenzyHoeSystemDBOper:UpdateFrenzyHoeItemInfo(awardItemId)
	local objPlayer = self.objUser:GetPlayer()
	if(not objPlayer) then
		return false;
	end
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Item_FrenzyHoe');
	SqlCmd.Wheres.dwAwardItemId = awardItemId;
	SqlCmd.Fields.dwRoleId = objPlayer:GetRoleID()
	SqlCmd.Fields.szRoleName = objPlayer:GetName()
	SqlCmd:execute()
end


