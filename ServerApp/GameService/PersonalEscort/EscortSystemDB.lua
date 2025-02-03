--[[
	个人押镖数据
	曲莹
	2013-09-06
	]]--

_G.CEscortSystemDB = {}
function CEscortSystemDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CEscortSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CEscortSystemDB:UsualMethod()
	if not self.m_ObjDB then
		_info("self.m_ObjDB is null by CEscortSystemDB");
		return false;
	end;
	if not self.m_ObjSys then
		_info("self.m_ObjSys is null by CEscortSystemDB");
		return false;
	end;
	
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CEscortSystemDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CEscortSystemDB");
		return false;
	end;
	return true, dwRoleID;
end;

--update T_Escort_Info	dwEscortNum  --刷新出镖次数
function CEscortSystemDB:UpdateEscortNum(dwRoleID, dwEscortNum)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Escort_Info')
	SqlCmd.Fields.dwEscortNum = dwEscortNum;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd:execute();
end;

--update T_Escort_Info dwShellEscortNum --
function CEscortSystemDB:UpdateShellEscortNum(dwRoleID, dwShellEscortNum)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Escort_Info')
	SqlCmd.Fields.dwShellEscortNum = dwShellEscortNum;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd:execute();
end;

--update T_Escort_Info	dwRefQuality --刷新洗练镖车品质次数
function CEquipBuildSystemDB:UpdateRefQuality(dwRoleID, dwRefQuality)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Escort_Info')
	SqlCmd.Fields.dwRefQuality = dwRefQuality;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd:execute();
end;

--update T_Escort_Info	dwEscortID --设置抢镖id
function CEscortSystemDB:SetEscortID(dwRoleID, dwEscortID)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Escort_Info')
	SqlCmd.Fields.dwEscortID = dwEscortID;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd:execute();
end;

--update T_Escort_Info	--更新押镖全表信息
function CEscortSystemDB:SetEscortInfo(dwRoleID)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Escort_Info')
	SqlCmd.Fields.dwEscortNum = 0;
	SqlCmd.Fields.dwRefQuality = 0;
	SqlCmd.Fields.dwEscortID = 0;
	SqlCmd.Fields.dwGetType = 0;
	SqlCmd.Fields.dwType = 0;
	SqlCmd.Fields.dwQuality = 0;
	SqlCmd.Fields.dwShellEscortNum = 0;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd:execute();
end;

--update T_Escort_Info	--刷新抢镖的信息
function CEscortSystemDB:SetRubEscortInfo(dwRoleID, escortId, dwType, dwQuality, dwGetType, dwMapId)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Escort_Info')
	SqlCmd.Fields.dwEscortID = escortId;
	SqlCmd.Fields.dwType = dwType;
	SqlCmd.Fields.dwQuality = dwQuality;
	SqlCmd.Fields.dwGetType = dwGetType;
	SqlCmd.Fields.dwMapId = dwMapId;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd:execute();
end;

--update T_Escort_Info	--刷新已有镖车的品质
function CEscortSystemDB:SetEscortQuality(dwRoleID, dwEscortId, dwQuality, dwRefQuality)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Escort_Info')
	SqlCmd.Fields.dwEscortID = dwEscortId;
	SqlCmd.Fields.dwQuality = dwQuality;
	SqlCmd.Fields.dwRefQuality = dwRefQuality;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd:execute();
end;
