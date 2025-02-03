
--[[
���ܣ����ĳ�ͷ���ݿ��ࣨ��������
���ߣ�κ��
ʱ�䣺2013-8-22
--]]

_G.CFrenzyHoeSystemDBOper = {};
function CFrenzyHoeSystemDBOper:new(objDB,objUser)
	local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --��Ӧ�����
	for i, v in pairs(CFrenzyHoeSystemDBOper) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

---������ҽ�����Ϣ
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

----���� �ڱ��¼���Ϣ
function CFrenzyHoeSystemDBOper:InsertFrenzyHoeItemInfo(awardItemId)
	local objPlayer = self.objUser:GetPlayer()
	if(not objPlayer) then
		return false;
	end
	local SqlCmd = self.objDBQuery:CreateInsertCmd('T_Item_FrenzyHoe'); ---�ڱ��¼���
	SqlCmd.Wheres.dwAwardItemId  = awardItemId; 
	SqlCmd.Fields.szRoleName = objPlayer:GetName();
	SqlCmd.Fields.dwRoleId = objPlayer:GetRoleID();
	SqlCmd:execute()
end

----���� �ڱ��¼���Ϣ

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


