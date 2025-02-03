--[[
功能：功法系统数据库操作
版本：
	v1.0	2012-04-10 create by lkj
]]

_G.CFashionDressSystemDB = {};

function CFashionDressSystemDB:new(objDB, objSys)
	local obj = {};
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CFashionDressSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
--检查系统数据库模块有效性
function CFashionDressSystemDB:CheckDBValidityAndGetRoleID()
	if not self.m_ObjDB then
		_err("self.m_ObjDB is null by CFashionDressSystemDB");
		return false;
	end;
	if not self.m_ObjSys then
		_err("self.m_ObjSys is null by CFashionDressSystemDB");
		return false;
	end;
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_err("objPlayer is null by CFashionDressSystemDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_err("dwRoleID == 0  by CFashionDressSystemDB");
		return false;
	end;
	return true, dwRoleID;
end;
------------------------------------------------------------------------------------------------------------------------
----------------------------------------------玩家时装系统信息相关--------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--插入玩家所有时装信息
function CFashionDressSystemDB:InsertFashionDressInfo(db_Info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CFashionDressSystemDB:InsertFashionDressInfo");
		return false;
	end;
	
	
	local SqlCmd = self.m_ObjDB:CreateInsertCmd("T_Role_FashionDress");
	SqlCmd.Fields.dwRoleID			= RoleID;
	SqlCmd.Fields.dwDressID 		= db_Info.dressID;
	SqlCmd.Fields.dwDeleteTime		= db_Info.deleteTime;
	SqlCmd.Fields.bRenew			= db_Info.bRenew;
	SqlCmd.Fields.bInBox			= db_Info.bInBox;
	SqlCmd:execute()
	return true;
end;

--插入玩家化身丹 和 所有已经装备的时装信息
function CFashionDressSystemDB:InsertHuaShenDanInfo(db_Info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CFashionDressSystemDB:InertHuaShenDanInfo");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateInsertCmd("T_Role_HuaShenDan");
	SqlCmd.Fields.dwRoleID			= RoleID;
	SqlCmd.Fields.dwExp 			= db_Info.dwExp;
	SqlCmd.Fields.szEquip			= db_Info.szEquip;
	SqlCmd.Fields.nBoxNum			= db_Info.nBoxNum;
	SqlCmd:execute()
	-- print("CFashionDressSystemDB:InsertHuaShenDanInfo=====", RoleID)
	return true;
end

--更新玩家所有时装信息
function CFashionDressSystemDB:UpdateFashionDressInfo(info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CFashionDressSystemDB:UpdateFashionDressInfo");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_FashionDress");
	SqlCmd.Wheres.dwRoleID			= RoleID;
	SqlCmd.Wheres.dwDressID			= info.dressID;
	SqlCmd.Fields.dwDeleteTime		= info.deleteTime;
	SqlCmd.Fields.bRenew			= info.bRenew;
	SqlCmd:execute()
	return true;
end;


--更新玩家化身丹和所有已装备时装信息
function CFashionDressSystemDB:UpdateHuaShenDanInfo(info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CFashionDressSystemDB:UpdateHuaShenDanInfo");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_HuaShenDan");
	SqlCmd.Wheres.dwRoleID			= RoleID;
	SqlCmd.Fields.dwExp 			= info.dwExp;
	SqlCmd.Fields.szEquip			= info.szEquip;
	SqlCmd:execute()
	return true;
end


--删除时装信息
function CFashionDressSystemDB:DeleteFashionDressInfo(info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CFashionDressSystemDB:UpdateHuaShenDanInfo");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateDeleteCmd("T_Role_FashionDress");
	SqlCmd.Wheres.dwRoleID			= RoleID;
	SqlCmd.Wheres.dwDressID			= info.dressID;
	SqlCmd:execute()
	return true;
end
--删除时装信息
function CFashionDressSystemDB:UpdateFashionDressBox(nDressID,bInBox)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CFashionDressSystemDB:UpdateHuaShenDanInfo");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_FashionDress");
	SqlCmd.Wheres.dwRoleID			= RoleID;
	SqlCmd.Wheres.dwDressID			= nDressID;
	SqlCmd.Fields.bInBox			= bInBox;	
	SqlCmd:execute()
	return true;
end
--删除时装信息
function CFashionDressSystemDB:UpdateFashionBoxNum(nBoxNum)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CFashionDressSystemDB:UpdateHuaShenDanInfo");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_HuaShenDan");
	SqlCmd.Wheres.dwRoleID			= RoleID;
	SqlCmd.Fields.dwBoxNum			= nBoxNum;
	SqlCmd:execute()
	return true;
end
