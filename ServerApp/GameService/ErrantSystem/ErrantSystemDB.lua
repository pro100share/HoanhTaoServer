--[[	������ϵͳ	��Ө	2013-07-08	]]--_G.CErrantSystemDB = {}function CErrantSystemDB:new(objDB, objSys)	local obj = {}	obj.m_ObjDB = objDB;	obj.m_ObjSys = objSys;	for i, v in pairs(CErrantSystemDB) do		if type(v) == "function" then			obj[i] = v;		end;	end;	return obj;end;function CErrantSystemDB:UsualMethod()	if not self.m_ObjDB then		_info("self.m_ObjDB is null by CErrantSystemDB");		return false;	end;	if not self.m_ObjSys then		_info("self.m_ObjSys is null by CErrantSystemDB");		return false;	end;		local objPlayer = self.m_ObjSys:GetPlayer();	if not objPlayer then		_info("objPlayer is null by CErrantSystemDB");		return false;	end;    local dwRoleID = objPlayer:GetRoleID();	if dwRoleID == 0 then		_info("dwRoleID == 0 by CErrantSystemDB");		return false;	end;	return true, dwRoleID;end;--update T_Errant_Infofunction CErrantSystemDB:SetErrantInfo(dwRoleID, dwMapId, killMonster)	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Errant_Info')	SqlCmd.Fields.szKillMonster = killMonster;	SqlCmd.Wheres.dwRoleId = dwRoleID;	SqlCmd.Wheres.dwMapId = dwMapId;	SqlCmd:execute();end;--update T_Errant_Award_Infofunction CErrantSystemDB:UpdateErrantAward(dwRoleID, szAwardInfo)	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Errant_Award_Info')	SqlCmd.Fields.szErrantAward = szAwardInfo;	SqlCmd.Wheres.dwRoleId = dwRoleID;	SqlCmd:execute();end;