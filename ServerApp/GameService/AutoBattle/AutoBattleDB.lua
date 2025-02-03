_G.CAutoBattleDB = {}
function CAutoBattleDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CAutoBattleDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CAutoBattleDB:UsualMethod()
	if not self.m_ObjDB then
		_info("self.m_ObjDB is null by CAutoBattleDB");
		return false;
	end;
	if not self.m_ObjSys then
		_info("self.m_ObjSys is null by CAutoBattleDB");
		return false;
	end;
	
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CAutoBattleDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CAutoBattleDB");
		return false;
	end;
	return true, dwRoleID;
end;

function CAutoBattleDB:InitAddAutoData(dwProf, skillTbl)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateInsertCmd('T_Role_Auto_Battle_Setting')   --insert
	SqlCmd.Fields.dwRoleID = dwRoleId;
	SqlCmd.Fields.dwHpRate = AutoMonsterConfig["dwAutoHPPer"] * 100;
	SqlCmd.Fields.dwHpOrder = AutoMonsterConfig["dwLifeRecoverRule"];
	SqlCmd.Fields.dwMpRate = AutoMonsterConfig["dwAutoMPPer"] * 100;
	SqlCmd.Fields.dwMpOrder =  AutoMonsterConfig["dwManaRecoverRule"];
	SqlCmd.Fields.bUseDoubleExp = false;
	SqlCmd.Fields.bPickEquip = true;
	SqlCmd.Fields.bPickMedicine = true;
	SqlCmd.Fields.bPickGold = true;
	SqlCmd.Fields.bPickMaterial = true;
	SqlCmd.Fields.dwProfType = AutoMonsterConfig["dwEquipPickProf"];
	SqlCmd.Fields.dwEquipLevel = AutoMonsterConfig["dwEquipPickLevel"];
	SqlCmd.Fields.dwEquipQuality = AutoMonsterConfig["dwEquipPickQuality"];
	SqlCmd.Fields.dwRange = AutoMonsterConfig["dwAttackBound"];
	SqlCmd.Fields.dwGoBackTime = AutoMonsterConfig["dwGoBackCitye"];
	SqlCmd.Fields.bMonsterChoose = true;
	SqlCmd.Fields.bAutoAlive = false;
	SqlCmd.Fields.bautoMatic = false;
	local skillNum = 1;
	local uiSkillTbl = AutoBattleSkill[dwProf][1];
	for _, skillId in pairs(uiSkillTbl) do
		local info = skillTbl[skillId];
		if info then	
			SqlCmd.Fields["dwSkill"..skillNum] = skillId;
			skillNum = skillNum + 1;
		end;
		if skillNum >= 7 then
			break;
		end;
	end;
	if skillNum < 7 then
		for i = skillNum, 6 do
			SqlCmd.Fields["dwSkill"..i] = 0;
		end;
	end;
	SqlCmd:execute();
end;

function CAutoBattleDB:SetAutoData(info)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Auto_Battle_Setting')
	for key, value in pairs(info) do
		SqlCmd.Fields[key] = value;
	end;
	SqlCmd.Wheres.dwRoleID = dwRoleId;
	SqlCmd:execute();
end;

function CAutoBattleDB:RecoverAutoData(dwProf, skillInfo)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Auto_Battle_Setting')
	SqlCmd.Wheres.dwRoleID = dwRoleId;
	SqlCmd.Fields.dwHpRate = AutoMonsterConfig["dwAutoHPPer"] * 100;
	SqlCmd.Fields.dwHpOrder = AutoMonsterConfig["dwLifeRecoverRule"];
	SqlCmd.Fields.dwMpRate = AutoMonsterConfig["dwAutoMPPer"] * 100;
	SqlCmd.Fields.dwMpOrder =  AutoMonsterConfig["dwManaRecoverRule"];
	SqlCmd.Fields.bUseDoubleExp = false;
	SqlCmd.Fields.bPickEquip = true;
	SqlCmd.Fields.bPickMedicine = true;
	SqlCmd.Fields.bPickGold = true;
	SqlCmd.Fields.bPickMaterial = true;
	SqlCmd.Fields.dwProfType = AutoMonsterConfig["dwEquipPickProf"];
	SqlCmd.Fields.dwEquipLevel = AutoMonsterConfig["dwEquipPickLevel"];
	SqlCmd.Fields.dwEquipQuality = AutoMonsterConfig["dwEquipPickQuality"];
	SqlCmd.Fields.dwRange = AutoMonsterConfig["dwAttackBound"];
	SqlCmd.Fields.dwGoBackTime = AutoMonsterConfig["dwGoBackCitye"];
	SqlCmd.Fields.bMonsterChoose = true;
	SqlCmd.Fields.bAutoAlive = false;
	local skillNum = 0;
	local uiSkillTbl = AutoBattleSkill[dwProf][1];
	for _, skillId in pairs(uiSkillTbl) do
		local info = skillInfo[skillId];
		if info then
			skillNum = skillNum + 1;
			SqlCmd.Fields["dwSkill"..skillNum] = skillId;
		end;
		if skillNum >= 6 then
			break;
		end;
	end;
	if skillNum < 6 then
		for i = skillNum + 1, 6 do
			SqlCmd.Fields["dwSkill"..i] = 0;
		end;
	end;
	SqlCmd:execute();
end;