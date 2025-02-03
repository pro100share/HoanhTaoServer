_G.CGestSystemDB = {}
function CGestSystemDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CGestSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CGestSystemDB:UsualMethod()
	if not self.m_ObjDB then
		_info("self.m_ObjDB is null by CGestSystemDB");
		return false;
	end;
	if not self.m_ObjSys then
		_info("self.m_ObjSys is null by CGestSystemDB");
		return false;
	end;
	
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CGestSystemDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CGestSystemDB");
		return false;
	end;
	return true, dwRoleID;
end;
--插入数据
function CGestSystemDB:InsertData()
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateInsertCmd('T_Role_Gest_Info');
	SqlCmd.Fields.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwGestLevel = 1;   --等级
	SqlCmd.Fields.dwGestProgress = 0;    --修复进度
	SqlCmd.Fields.dwChooseMode = 0;   --开启模式
	SqlCmd.Fields.dwRealizeLevel = 0;   --领悟等级
	SqlCmd:execute();
end;

--更新等级及修复进度
function CGestSystemDB:UpdateLevel(dwGestLevel, dwGestProgress)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Gest_Info')
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwGestLevel = dwGestLevel;    --等级
	SqlCmd.Fields.dwGestProgress = dwGestProgress;  --修复进度
	SqlCmd:execute()
end;
--更新选择模式
function CGestSystemDB:UpdateMode(dwMode)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Gest_Info')
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwChooseMode = dwMode;    --开启模式
	SqlCmd:execute()
end;
--更新最高级领悟状态
function CGestSystemDB:UpdateRealize(dwGestLevel, dwRealizeLevel)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Gest_Info')
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwGestLevel = dwGestLevel;    --等级
	SqlCmd.Fields.dwRealizeLevel = dwRealizeLevel;    --
	SqlCmd:execute()
end;