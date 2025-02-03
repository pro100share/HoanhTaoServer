--[[
功能：新手引导系统数据库操作
版本：v1.0
作者：郭肇义
时间：2012-03-22
]]

_G.CAmuletSystemDB = {}
--创建系统数据库
function CAmuletSystemDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CAmuletSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
--检查系统数据库模块有效性
function CAmuletSystemDB:CheckDBValidityAndGetRoleID()
	if not self.m_ObjDB then
		_info("self.m_ObjDB is null by CAmuletSystemDB");
		return false;
	end;
	if not self.m_ObjSys then
		_info("self.m_ObjSys is null by CAmuletSystemDB");
		return false;
	end;
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CAmuletSystemDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0  by CAmuletSystemDB");
		return false;
	end;
	return true, dwRoleID;
end;
--设置护身宝甲成长
function CAmuletSystemDB:SetAmuletGrowth(dwGrowth)
	local bValidity, dwRoleID = self:CheckDBValidityAndGetRoleID();
	if not bValidity then 
		_info("DB invalidity by CAmuletSystemDB:SetAmuletGrowth");
		return false;
	end;
	if dwGrowth == nil or dwRoleID == nil then
		_info("CAmuletSystemDB:SetAmuletGrowth Data Exception");
		return false;
	end
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Amulet')
	SqlCmd.Fields.AmuletGrowth = dwGrowth
	SqlCmd.Wheres.RoleID = dwRoleID
	SqlCmd:execute()
	return true;
end
--设置护身宝甲评分
function CAmuletSystemDB:SetAmuletScore(dwScore)
	local bValidity, dwRoleID = self:CheckDBValidityAndGetRoleID();
	if not bValidity then 
		_info("DB invalidity by CAmuletSystemDB:SetAmuletScore");
		return false;
	end;
	if dwScore == nil or dwRoleID == nil then
		_info("CAmuletSystemDB:SetAmuletScore Data Exception");
		return false;
	end
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Amulet')
	SqlCmd.Fields.AmuletScore = dwScore
	SqlCmd.Wheres.RoleID = dwRoleID
	SqlCmd:execute()
	return true;
end

--设置护身宝甲阶级
function CAmuletSystemDB:SetAmuletLevel(dwLevel)
	local bValidity, dwRoleID = self:CheckDBValidityAndGetRoleID();
	if not bValidity then 
		_info("DB invalidity by CAmuletSystemDB:SetAmuletLevel");
		return false;
	end;
	if dwLevel == nil or dwRoleID == nil then
		_info("CAmuletSystemDB:SetAmuletLevel Data Exception");
		return false;
	end
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Amulet')
	SqlCmd.Fields.AmuletLevel = dwLevel
	SqlCmd.Wheres.RoleID = dwRoleID
	SqlCmd:execute()
	return true;
end

--设置护身宝甲等级
function CAmuletSystemDB:SetAmuletRank(dwRank)
	local bValidity, dwRoleID = self:CheckDBValidityAndGetRoleID();
	if not bValidity then 
		_info("DB invalidity by CAmuletSystemDB:SetAmuletRank");
		return false;
	end;
	if dwRank == nil or dwRoleID == nil then
		_info("CAmuletSystemDB:SetAmuletRank Data Exception");
		return false;
	end
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Amulet')
	SqlCmd.Fields.AmuletRank = dwRank
	SqlCmd.Wheres.RoleID = dwRoleID
	SqlCmd:execute()
	return true;
end

--设置护身保甲熔炼职业配置
function CAmuletSystemDB:SetAmuletIntensifyPerConfig(dwPerConfig)
	local bValidity, dwRoleID = self:CheckDBValidityAndGetRoleID();
	if not bValidity then 
		_info("DB invalidity by CAmuletSystemDB:SetAmuletIntensifyPerConfig");
		return false;
	end;
	if dwPerConfig == nil or dwRoleID == nil then
		_info("CAmuletSystemDB:SetAmuletIntensifyPerConfig Data Exception");
		return false;
	end
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Amulet')
	SqlCmd.Fields.AmuletIntensifyPerConfig = dwPerConfig
	SqlCmd.Wheres.RoleID = dwRoleID
	SqlCmd:execute()
	return true;
end


--设置护身保甲熔炼颜色配置
function CAmuletSystemDB:SetAmuletIntensifyColorConfig(dwColorConfig)
	local bValidity, dwRoleID = self:CheckDBValidityAndGetRoleID();
	if not bValidity then 
		_info("DB invalidity by CAmuletSystemDB:SetAmuletIntensifyColorConfig");
		return false;
	end;
	if dwColorConfig == nil or dwRoleID == nil then
		_info("CAmuletSystemDB:SetAmuletIntensifyColorConfig Data Exception");
		return false;
	end
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Amulet')
	SqlCmd.Fields.AmuletIntensifyColorConfig = dwColorConfig
	SqlCmd.Wheres.RoleID = dwRoleID
	SqlCmd:execute()
	return true;
end

--设置护身宝甲镶嵌
function CAmuletSystemDB:SetAmuletInlayLevel(dwAmuletInlayLevel)
	local bValidity, dwRoleID = self:CheckDBValidityAndGetRoleID();
	if not bValidity then 
		_info("DB invalidity by CAmuletSystemDB:SetAmuletInlayLevel");
		return false;
	end;
	if dwRoleID == nil then
		_info("CAmuletSystemDB:SetAmuletInlayLevel Data Exception");
		return false;
	end
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Amulet')
	SqlCmd.Fields.AmuletInlayLevel = dwAmuletInlayLevel
	SqlCmd.Wheres.RoleID = dwRoleID
	SqlCmd:execute()
	return true;
end

--设置护身宝甲资质
function CAmuletSystemDB:SetAptitude(dwAptitude)
	local bValidity, dwRoleID = self:CheckDBValidityAndGetRoleID();
	if not bValidity then 
		_info("DB invalidity by CAmuletSystemDB:SetAptitude");
		return false;
	end;
	if dwRoleID == nil then
		_info("CAmuletSystemDB:SetAptitude Data Exception");
		return false;
	end
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Amulet')
	SqlCmd.Fields.Aptitude = dwAptitude
	SqlCmd.Wheres.RoleID = dwRoleID
	SqlCmd:execute()
	return true;
end
