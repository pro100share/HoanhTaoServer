--[[
功能：坐骑系统数据库操作
版本：
	v1.0	2012-04-10 create by lkj
]]

_G.CMountSystemDB = {};

function CMountSystemDB:new(objDB, objSys)
	local obj = {};
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CMountSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
--检查系统数据库模块有效性
function CMountSystemDB:CheckDBValidityAndGetRoleID()
	if not self.m_ObjDB then
		_err("self.m_ObjDB is null by CMountSystemDB");
		return false;
	end;
	if not self.m_ObjSys then
		_err("self.m_ObjSys is null by CMountSystemDB");
		return false;
	end;
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_err("objPlayer is null by CMountSystemDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_err("dwRoleID == 0  by CMountSystemDB");
		return false;
	end;
	return true, dwRoleID;
end;
------------------------------------------------------------------------------------------------------------------------
----------------------------------------------玩家坐骑系统信息相关--------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--更新玩家坐骑系统信息
function CMountSystemDB:UpdateMountSysInfo(info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CMountSystemDB:UpdateMountSysInfo");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_MountSystem");
	SqlCmd.Fields.n_MountSlotNum	= info.n_MountSlotNum;
	SqlCmd.Fields.n_ActiveMountID	= info.n_ActiveMountID;
	SqlCmd.Fields.n_NextInstID		= info.n_NextInstID;
	SqlCmd.Wheres.n_RoleID			= RoleID;
	SqlCmd:execute()
	return true;
end;
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--保存坐骑信息
function CMountSystemDB:SaveMountInfo(info, bIsNew)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CMountSystemDB:SaveMountInfo");
		return false;
	end;
	if bIsNew then
		local SqlCmd = self.m_ObjDB:CreateInsertCmd("T_Role_Mount");
		SqlCmd.Fields.n_RoleID       	= RoleID;
		SqlCmd.Fields.n_InstID			= info.n_InstID;
		SqlCmd.Fields.n_EnumID			= info.n_EnumID;
		SqlCmd.Fields.n_Level			= info.n_Level;
		SqlCmd.Fields.n_Exp				= info.n_Exp;
		SqlCmd.Fields.n_GongJiAptitude	= info.n_GongJiAptitude;
		SqlCmd.Fields.n_FangYuAptitude	= info.n_FangYuAptitude;
		SqlCmd.Fields.n_GenGuAptitude	= info.n_GenGuAptitude;
		SqlCmd.Fields.n_JiQiaoAptitude	= info.n_JiQiaoAptitude;
		SqlCmd.Fields.b_IsBind			= info.b_IsBind;
		SqlCmd.Fields.s_Equip			= info.s_Equip;
		SqlCmd.Fields.s_Skill			= info.s_Skill;
		SqlCmd.Fields.n_Quality			= info.n_Quality;
		SqlCmd.Fields.n_Point			= info.n_Point;
		SqlCmd.Fields.n_Rank			= info.n_Rank;
		SqlCmd.Fields.n_RankExp			= info.n_RankExp;
		SqlCmd:execute()
	else
		local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_Mount");
		SqlCmd.Wheres.n_RoleID = RoleID;
		SqlCmd.Wheres.n_InstID = info.n_InstID;
		
		SqlCmd.Fields.n_EnumID			= info.n_EnumID;
		SqlCmd.Fields.n_Level			= info.n_Level;
		SqlCmd.Fields.n_Exp				= info.n_Exp;
		SqlCmd.Fields.n_GongJiAptitude	= info.n_GongJiAptitude;
		SqlCmd.Fields.n_FangYuAptitude	= info.n_FangYuAptitude;
		SqlCmd.Fields.n_GenGuAptitude	= info.n_GenGuAptitude;
		SqlCmd.Fields.n_JiQiaoAptitude	= info.n_JiQiaoAptitude;
		SqlCmd.Fields.b_IsBind			= info.b_IsBind;
		SqlCmd.Fields.s_Equip			= info.s_Equip;
		SqlCmd.Fields.s_Skill			= info.s_Skill;
		SqlCmd.Fields.n_Quality			= info.n_Quality;
		SqlCmd.Fields.n_Point			= info.n_Point;
		SqlCmd.Fields.n_Rank			= info.n_Rank;
		SqlCmd.Fields.n_RankExp			= info.n_RankExp;
		SqlCmd:execute()
	end;
	return true;
end;
--从数据库中删除坐骑
-- function CMountSystemDB:DeleteMountInst(n_MountInstID)
	-- local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	-- if not validity then 
		-- _err("DB invalidity by CMountSystemDB:SaveMountInfo");
		-- return false;
	-- end;
	-- local SqlCmd = self.m_ObjDB:CreateDeleteCmd("T_Role_Mount");
	-- SqlCmd.Wheres.n_RoleID = RoleID;
	-- SqlCmd.Wheres.n_InstID = n_MountInstID;
	-- SqlCmd:execute();
-- end;



