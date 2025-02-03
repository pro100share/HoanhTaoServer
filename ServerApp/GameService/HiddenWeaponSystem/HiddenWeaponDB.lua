--[[
	[\brief：暗器系统
	[\author：沈祺
	[\date：2014-04-22
	[类似于名剑系统；
	[暗器可以升级可以升阶，消耗道具;
	[使用暗器需要毒标类物品;
	]]

_G.CHiddenWeaponDB = {};

function CHiddenWeaponDB:New(objDB, objSys)
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

--插入数据库
function CHiddenWeaponDB:InsertHiddenWeaponInfo()
	local objPlayer = self.objSys:GetPlayer();
	if not objPlayer then
		return false;
	end

	local oSqlcmd = self.objDB:CreateInsertCmd('T_Role_HiddenWeapon');
	oSqlcmd.Wheres.dwRoleID = self.objSys:GetPlayer():GetRoleID();
	oSqlcmd.Fields.dwHiddenWeaponExp = 0;
	oSqlcmd.Fields.dwHWLevel = 1;
	oSqlcmd.Fields.bIsOpen = false;
	oSqlcmd:execute();
	return true;
end

--更新DB
function CHiddenWeaponDB:UpdateDB()
	local oSqlcmd = self.objDB:CreateUpdateCmd("T_Role_HiddenWeapon");
	local nRoleId = self.objSys:GetPlayer():GetRoleID();

	oSqlcmd.Wheres.dwRoleID = nRoleId;
	oSqlcmd.Fields.dwHiddenWeaponExp = self.objSys.oHiddenWeapon.nExp;
	oSqlcmd.Fields.dwHWLevel = self.objSys.oHiddenWeapon.nLevel;
	oSqlcmd.Fields.bIsOpen = self.objSys.oHiddenWeapon.bIsOpen;
	oSqlcmd:execute();
end