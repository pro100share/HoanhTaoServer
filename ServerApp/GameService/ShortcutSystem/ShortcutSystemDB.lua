--[[
功能：地图系统数据库操作
作者：周华杰
时间：2011-12-22
]]
_G.CShortcutSystemDBQuery = {}
function CShortcutSystemDBQuery:new(objDB,objUser)
	local obj = {};
	obj.objDB = objDB;      --对应的数据库
	obj.objUser = objUser;   --对应的玩家
	
	for i, v in pairs(CShortcutSystemDBQuery) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CShortcutSystemDBQuery:SaveShortuctIndex(sInfo,isInsert)
	if not self.objDB then
		_info("self.objDB is null by CShortcutSystemDBQuery:SaveShortuctIndex");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CShortcutSystemDBQuery:SaveShortuctIndex");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CShortcutSystemDBQuery:SaveShortuctIndex");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CShortcutSystemDBQuery:SaveShortuctIndex");
		return false;
	end;
	
	if not isInsert then
		local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Shortcut_Info');
		
		SqlCmd.Wheres.dwRoleID		= dwRoleID;
		SqlCmd.Wheres.dwShortcutID	= sInfo.dwShortcutID;
		
		--SqlCmd.Fields.dwRoleID		=  dwRoleID;
		SqlCmd.Fields.dwType		=  sInfo.dwType;
		--SqlCmd.Fields.dwShortcutID	=  sInfo.dwShortcutID;
		SqlCmd.Fields.dwDataID	    =  sInfo.dwDataID;
		SqlCmd.Fields.ItemType		=  sInfo.ItemType ;
		SqlCmd:execute()
	else
		local SqlCmd = self.objDB:CreateInsertCmd('T_Role_Shortcut_Info');
		SqlCmd.Fields.dwRoleID		=  dwRoleID;
		SqlCmd.Fields.dwType		=  sInfo.dwType;
		SqlCmd.Fields.dwShortcutID	=  sInfo.dwShortcutID;
		SqlCmd.Fields.dwDataID	    =  sInfo.dwDataID;
		SqlCmd.Fields.ItemType		=  sInfo.ItemType;
		SqlCmd:execute()
	end
end;

function CShortcutSystemDBQuery:DelShortuctIndex(dwIndex)
	if not self.objDB then
		_info("self.objDB is null by CShortcutSystemDBQuery:DelShortuctIndex");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CShortcutSystemDBQuery:DelShortuctIndex");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CShortcutSystemDBQuery:DelShortuctIndex");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CShortcutSystemDBQuery:DelShortuctIndex");
		return false;
	end;
	
	local SqlCmd = self.objDB:CreateDeleteCmd('T_Role_Shortcut_Info')
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Wheres.dwShortcutID = dwIndex;
	SqlCmd:execute();
end;

