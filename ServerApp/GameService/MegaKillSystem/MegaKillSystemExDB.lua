--[[
	侠义勋章系统
	曲莹
	2013-07-30
]]--

_G.CMegaKillSystemExDB = {}
function CMegaKillSystemExDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CMegaKillSystemExDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CMegaKillSystemExDB:UsualMethod()
	if not self.m_ObjDB then
		_info("self.m_ObjDB is null by CMegaKillSystemExDB");
		return false;
	end;
	if not self.m_ObjSys then
		_info("self.m_ObjSys is null by CMegaKillSystemExDB");
		return false;
	end;
	
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CMegaKillSystemExDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CMegaKillSystemExDB");
		return false;
	end;
	return true, dwRoleID;
end;

 --[[
   [ \brief 数据库操作更新精炼数值
   [ \param number dwAptitude  精炼数值
   ]]
function CMegaKillSystemExDB:UpdateAptitude(dwAptitude)
	local flag, dwRoleID = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_MegaKill");
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwAptitude = dwAptitude;
	SqlCmd:execute();
end

