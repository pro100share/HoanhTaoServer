--[[
	[ \brief：护身镜系统
	[ \author：沈祺
	[ \date：2014-06-16
	[ 护身镜系统为暗器系统姊妹篇
	[ 主要是抵抗暗器技能BUFF等
	]]

--数据库对象
_G.CShieldDB = {};

--[[
	[ \brief 构造函数
	[ 构造函数
	[ \param object objDB DB对象
	[ \param object objSys 系统对象
	]]
function CShieldDB:new(objDB, objSys)
	local obj={};
	obj.objDB = objDB;
	obj.objSys = objSys;
	for k,v in pairs(self) do
		if(type(v)=="function") then
			obj[k]=v;
		end
	end
	return obj;
end

--[[
	[ \brief 插入一条数据
	]]
function CShieldDB:InsertShieldInfo()
	local oSqlcmd = self.objDB:CreateInsertCmd('T_Role_Shield');
	oSqlcmd.Wheres.nRoleID = self.objSys:GetPlayer():GetRoleID();
	oSqlcmd.Fields.nExp = self.objSys.tShieldInfo.nExp;
	oSqlcmd.Fields.nCount1 = _G.CShieldConfig:GetItemInfo(
								_G.CShieldSystem.DEFINE.COUNT1).Count;
	oSqlcmd.Fields.nCount2 = _G.CShieldConfig:GetItemInfo(
								_G.CShieldSystem.DEFINE.COUNT2).Count;
	oSqlcmd.Fields.nCount3 = _G.CShieldConfig:GetItemInfo(
								_G.CShieldSystem.DEFINE.COUNT3).Count;
	oSqlcmd:execute();
	return true;
end

--[[
	[ \brief 更新DB数据库
	[ 更新盾牌经验及使用次数
	]]
function CShieldDB:UpdateDB()
	local oSqlcmd = self.objDB:CreateUpdateCmd("T_Role_Shield");
	local nRoleID = self.objSys:GetPlayer():GetRoleID();

	oSqlcmd.Wheres.nRoleID = nRoleID;
	oSqlcmd.Fields.nExp = self.objSys.tShieldInfo.nExp;
	oSqlcmd.Fields.nCount1 = self.objSys.tShieldInfo.tCount[1];
	oSqlcmd.Fields.nCount2 = self.objSys.tShieldInfo.tCount[2];
	oSqlcmd.Fields.nCount3 = self.objSys.tShieldInfo.tCount[3];
	oSqlcmd:execute();
end
