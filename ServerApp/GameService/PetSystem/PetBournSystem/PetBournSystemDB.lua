--[[
功能：宠物境界数据库类
作者：李中昌
时间：2013-12-23
--]]

_G.CPetBournDB ={}
function CPetBournDB:new(objDB,objPetBourn)
	local obj = {};
	obj.objDB = objDB;      --对应的数据库 
	obj.objPetBourn = objPetBourn;
	
	for i, v in pairs(CPetBournDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end


--检查系统数据库模块有效性
function CPetBournDB:CheckDBValidity()
	if not self.objDB then
		_info("self.objDB is null by CPetBournDB");
		return false;
	end;
	if not self.objPetBourn then
		_info("self.objPetBourn is null by CPetBournDB");
		return false;
	end;
	local objPlayer = self.objPetBourn.petSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CPetBournDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0  by CPetBournDB");
		return false;
	end;
	return true, dwRoleID;
end;
---------------------------------------------------------------------------------------------


---更新 宠物装备
function CPetBournDB:UpdatePetBourn(petEnumID, dwExp)
	local isValide, roleId = self:CheckDBValidity();
	if not isValide then
		return false;
	end
	local SqlCmd = self.objDB:CreateUpdateCmd('T_PetBourn_Info');			
	SqlCmd.Wheres.dwRoleID			= roleId; 
	SqlCmd.Wheres.dwPetEnumId		= petEnumID;		
	SqlCmd.Fields.dwExp				= dwExp;
	SqlCmd:execute()
end


---插入 宠物装备信息
function CPetBournDB:InsertPetBourn(petEnumID, dwExp)
	local isValide, roleId = self:CheckDBValidity();
	if not isValide then
		return false;
	end

	local SqlCmd = self.objDB:CreateInsertCmd('T_PetBourn_Info');			
	SqlCmd.Fields.dwRoleID			= roleId; 
	SqlCmd.Fields.dwPetEnumId		= petEnumID;		
	SqlCmd.Fields.dwExp				= dwExp;
	
	SqlCmd:execute()
end
