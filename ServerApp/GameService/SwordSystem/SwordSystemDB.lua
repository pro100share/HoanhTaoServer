_G.CSwordSystemDB = {}
function CSwordSystemDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CSwordSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CSwordSystemDB:UsualMethod()
	if not self.m_ObjDB then
		_info("self.m_ObjDB is null by CSwordSystemDB");
		return false;
	end;
	if not self.m_ObjSys then
		_info("self.m_ObjSys is null by CSwordSystemDB");
		return false;
	end;
	
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CSwordSystemDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CSwordSystemDB");
		return false;
	end;
	return true, dwRoleID;
end;
--插入数据
function CSwordSystemDB:InsertData()
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateInsertCmd('T_Role_Sword');
	SqlCmd.Fields.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwSwordLadder = 1;   --阶数
	SqlCmd.Fields.dwSwordLevel = 1;    --等级
	SqlCmd.Fields.dwSwordGas = 0;   --剑气
	SqlCmd.Fields.dwAptitude = 0;
	SqlCmd:execute();
end;

function CSwordSystemDB:UpdateData(ladder, level, swordValue)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		_info("--Sword--UpdateData--", ladder, level, swordValue);
		return; 
	end;
	_info("---Sword--UpdateData11---", dwRoleId, ladder, level, swordValue);
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Sword')
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwSwordLadder = ladder;    --阶数
	SqlCmd.Fields.dwSwordLevel = level;      --等级
	SqlCmd.Fields.dwSwordGas = swordValue;   --剑气
	SqlCmd:execute()
	_info("---Sword--UpdateData22---", dwRoleId, ladder, level, swordValue);
end;

function CSwordSystemDB:UpdateSwordGas(swordValue)
	if CConfig.bIsCrossSvr then return end;
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		_info("--Sword--UpdateSwordGas--", swordValue);
		return; 
	end;
	-- print("------UpdateSwordGas-----", swordValue, dwRoleId);
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Sword')
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwSwordGas = swordValue;   --剑气
	SqlCmd:execute()
end;
--更新名剑等级
function CSwordSystemDB:UpdateSwordLevel(level, swordValue)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		_info("--Sword--UpdateSwordLevel--", level);
		return; 
	end;
	-- print("------UpdateSwordLevel-----", level, swordValue, dwRoleId);
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Sword')
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwSwordLevel = level;      --等级
	SqlCmd.Fields.dwSwordGas = swordValue;   --剑气
	SqlCmd:execute()
end;

----更新名剑特殊属性卡片状态
function CSwordSystemDB:UpdateSwordPropertyState(state)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		_info("--Sword--UpdateSwordPropertyState--", state);
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Sword')
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwUseCardState = state;  -----状态
	SqlCmd:execute()
end
----更新名剑铸造
function CSwordSystemDB:UpdateSwordAptitude(dwAptitude)
	if CConfig.bIsCrossSvr then return end;
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		_info("--Sword--UpdateSwordPropertyState--", state);
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Sword')
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwAptitude = dwAptitude;
	SqlCmd:execute()
end

