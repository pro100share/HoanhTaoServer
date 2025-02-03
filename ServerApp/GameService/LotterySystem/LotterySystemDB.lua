--[[
功能：抽签系统数据库操作（在KS上进行数据库操作）
版本：v1.0
作者：李中昌
时间：2012-03-22
]]

_G.CLotterySystemDB = {}
--创建系统数据库
function CLotterySystemDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CLotterySystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
--检查系统数据库模块有效性
function CLotterySystemDB:CheckDBValidityAndGetRoleID()
	if not self.m_ObjDB then
		_info("self.m_ObjDB is null by CLotterySystemDB");
		return false;
	end;
	if not self.m_ObjSys then
		_info("self.m_ObjSys is null by CLotterySystemDB");
		return false;
	end;
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CLotterySystemDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0  by CLotterySystemDB");
		return false;
	end;
	return true, dwRoleID;
end;
