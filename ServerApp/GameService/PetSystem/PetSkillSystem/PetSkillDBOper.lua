--[[功能：宠物技能数据库类（服务器）作者：魏云时间：2013-9-17--]]_G.CPetSkillDBOper ={}function CPetSkillDBOper:new(objDB,objUser)	local obj = {};	obj.objDB = objDB;      --对应的数据库 	obj.objUser = objUser;		for i, v in pairs(CPetSkillDBOper) do		if type(v) == "function" then			obj[i] = v;		end;	end;	return obj;end---更新 宠物已学技能function CPetSkillDBOper:UpdatePetSkillLearned(petEnumID,RoleID,skillStr,lockStr,isOpenStr)	if not self.objDB then		_info("self.objDB is null by CPetSkillDBOper:UpdatePetSkillLearned");		return false;	end	local SqlCmd = self.objDB:CreateUpdateCmd('T_PetSkill_Learned');				SqlCmd.Wheres.dwRoleID			= RoleID; 	SqlCmd.Wheres.dwPetEnumId		= petEnumID;		--技能ID 	SqlCmd.Fields.dwSkillList		= skillStr;	SqlCmd.Fields.dwSkillLockList	= lockStr;	SqlCmd.Fields.dwSkillIsOpenList	= isOpenStr;	SqlCmd:execute()end---插入 宠物已学技能function CPetSkillDBOper:InsertPetSkillLearned(petEnumID,RoleID,skillStr,lockStr,isOpenStr)	if not self.objDB then		_info("self.objDB is null by CPetSkillDBOper:UpdatePetSkillLearned");		return false;	end	--print("petEnumIDpetEnInsertPetSkillLearnedumIDpetEnumID",petEnumID)	local SqlCmd = self.objDB:CreateInsertCmd('T_PetSkill_Learned');				SqlCmd.Wheres.dwRoleID			= RoleID; 	SqlCmd.Wheres.dwPetEnumId		= petEnumID;		--技能ID 	SqlCmd.Fields.dwSkillList		= skillStr;	SqlCmd.Fields.dwSkillLockList	= lockStr;	SqlCmd.Fields.dwSkillIsOpenList	= isOpenStr;	SqlCmd:execute()end---更新 宠物可学技能function CPetSkillDBOper:UpdatePetSkillInfo(idstr,dwRoleID,levelstr)	if not self.objDB then		_info("self.objDB is null by CPetSkillDBOper:UpdatePetSkillInfo");		return false;	end	local SqlCmd = self.objDB:CreateUpdateCmd('T_PetSkill_Info');				SqlCmd.Wheres.dwRoleID			= dwRoleID; 	SqlCmd.Fields.dwSkillIdStr 		= idstr;		--技能ID 	SqlCmd.Fields.dwSkillLevelStr   = levelstr;     --技能等级	SqlCmd:execute()end---插入 宠物可学技能function CPetSkillDBOper:InsertPetSkillInfo(Info)	if not self.objDB then		_info("self.objDB is null by CPetSkillDBOper:InsertPetSkillInfo");		return false;	end	local SqlCmd = self.objDB:CreateInsertCmd('T_PetSkill_Info');				SqlCmd.Wheres.dwRoleID			= Info.dwRoleID; 	SqlCmd.Fields.dwSkillIdStr 		= Info.idstr;		 --技能ID 	SqlCmd.Fields.dwSkillLevelStr   = Info.levelstr;     --技能等级	SqlCmd:execute()end