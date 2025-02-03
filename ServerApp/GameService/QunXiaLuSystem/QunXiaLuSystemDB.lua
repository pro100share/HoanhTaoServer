--[[
���ܣ�Ⱥ��¼ϵͳ���ݿ����
�汾��
	v1.0	2013-11-1 create by lizc
]]

_G.CQunXiaLuSystemDB = {};

function CQunXiaLuSystemDB:new(objDB, objSys)
	local obj = {};
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CQunXiaLuSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
--���ϵͳ���ݿ�ģ����Ч��
function CQunXiaLuSystemDB:CheckDBValidityAndGetRoleID()
	if not self.m_ObjDB then
		_err("self.m_ObjDB is null by CQunXiaLuSystemDB");
		return false;
	end;
	if not self.m_ObjSys then
		_err("self.m_ObjSys is null by CQunXiaLuSystemDB");
		return false;
	end;
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_err("objPlayer is null by CQunXiaLuSystemDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_err("dwRoleID == 0  by CQunXiaLuSystemDB");
		return false;
	end;
	return true, dwRoleID;
end;



--����Ⱥ��¼ϵͳ������Ϣ
function CQunXiaLuSystemDB:InsertQunXiaLuSysInfo(db_Info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CQunXiaLuSystemDB:InsertQunXiaLuSysInfo");
		return false;
	end;
	
	
	local SqlCmd = self.m_ObjDB:CreateInsertCmd("T_Role_QunXiaLu");
	SqlCmd.Fields.dwRoleID			= RoleID;
	SqlCmd.Fields.dwHotelLastTime	= db_Info.dwHotelLastTime;
	SqlCmd.Fields.dwHotelPrestigeCount	= db_Info.dwHotelPrestigeCount;
	SqlCmd.Fields.dwHotelGoldCount 	= db_Info.dwHotelGoldCount;
	SqlCmd.Fields.szHotelCard 	= db_Info.szHotelCard;
	SqlCmd.Fields.szGroupSlot 	= db_Info.szGroupSlot;
	SqlCmd.Fields.szDaXiaSlot 	= db_Info.szDaXiaSlot;
	SqlCmd:execute()
	return true;
end;



------------------------------------------------------------------------------------------------------------------------
----------------------------------------------Ⱥ��¼----���ƿ�ջ��Ϣ--------------------------------------------
------------------------------------------------------------------------------------------------------------------------

--���·��ƿ�ջ��Ƭ��Ϣ
function CQunXiaLuSystemDB:UpdateHotelCardInfo(db_Info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CQunXiaLuSystemDB:UpdateHotelCardInfo");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_QunXiaLu");
	SqlCmd.Wheres.dwRoleID			= RoleID;
	SqlCmd.Fields.szHotelCard		= db_Info.szHotelCard;
	SqlCmd:execute()
	return true;
end;

--���·��ƿ�ջ�ϴ�ˢ��ʱ��
function CQunXiaLuSystemDB:UpdateHotelLastTime(db_Info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CQunXiaLuSystemDB:UpdateHotelLastTime");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_QunXiaLu");
	SqlCmd.Wheres.dwRoleID			= RoleID;
	SqlCmd.Fields.dwHotelLastTime	= db_Info.dwHotelLastTime;
	SqlCmd:execute()
	return true;
end;

--���·��ƿ�ջ���շ�������ˢ�´���
function CQunXiaLuSystemDB:UpdateHotelPrestigeCount(db_Info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CQunXiaLuSystemDB:UpdateHotelPrestigeCount");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_QunXiaLu");
	SqlCmd.Wheres.dwRoleID				= RoleID;
	SqlCmd.Fields.dwHotelPrestigeCount	= db_Info.dwHotelPrestigeCount;
	SqlCmd:execute()
	return true;
end;

--���·��ƿ�ջ���ս��ˢ�´���
function CQunXiaLuSystemDB:UpdateHotelGoldCount(db_Info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CQunXiaLuSystemDB:UpdateHotelGoldCount");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_QunXiaLu");
	SqlCmd.Wheres.dwRoleID			= RoleID;
	SqlCmd.Fields.dwHotelGoldCount	= db_Info.dwHotelGoldCount;
	SqlCmd:execute()
	return true;
end;

----------------------------------------------����ΪȺ��������ݿ��������--------------------------
function CQunXiaLuSystemDB:UpdateGroupSlotInfo(db_Info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CQunXiaLuSystemDB:UpdateHotelGoldCount");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_QunXiaLu");
	SqlCmd.Wheres.dwRoleID			= RoleID;
	SqlCmd.Fields.szGroupSlot		= db_Info.szGroupSlot;
	SqlCmd:execute()
	return true;
end;


----------------------------------------------����Ϊ����¼���ݿ��������--------------------------
function CQunXiaLuSystemDB:UpdateDaXiaSlotInfo(db_Info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CQunXiaLuSystemDB:UpdateHotelGoldCount");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_QunXiaLu");
	SqlCmd.Wheres.dwRoleID			= RoleID;
	SqlCmd.Fields.szDaXiaSlot		= db_Info.szDaXiaSlot;
	SqlCmd:execute()
	return true;
end;

