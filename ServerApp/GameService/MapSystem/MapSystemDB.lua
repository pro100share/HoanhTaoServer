--[[
功能：地图系统数据库操作
作者：秦隆吉
时间：2011-12-22
]]
_G.CMapSystemDBQuery = {}
function CMapSystemDBQuery:new(objDB,objUser)
	local obj = {};
	obj.objDB = objDB;      --对应的数据库
	obj.objUser = objUser;   --对应的玩家
	
	for i, v in pairs(CMapSystemDBQuery) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

--将地图信息保存进数据库
function CMapSystemDBQuery:AddMapInfo(dwRoleID) 
	self.objUser.fXPos = InitConfig.fInitXPos ;--+ math.random(-6,6);		--玩家的x位置
	self.objUser.fYPos = InitConfig.fInitYPos ;--+ math.random(-6,6);		--玩家的Y位置
	self.objUser.fDirValue = InitConfig.fInitDirValue;--:+math.random(0,4);   --玩家的方向
	self.objUser.dwCurMapID = InitConfig.dwInitMapID; --初始
	--self.objUser.fSpeed = InitConfig.fInitSpeed; --初始
	
	local SqlCmd = self.objDB:CreateInsertCmd('T_Role_Map_Info');
	--SqlCmd.Fields.dwRoleID 			= sInfo.dwRoleID;			--角色ID
	SqlCmd.Fields.dwRoleID       =    dwRoleID;
	SqlCmd.Fields.fXPos				= self.objUser.fXPos;		--玩家名字
	SqlCmd.Fields.fYPos				= self.objUser.fYPos;		--玩家性别
	SqlCmd.Fields.fDirValue			= self.objUser.fDirValue;		--玩家脸型
	SqlCmd.Fields.dwMapID			= self.objUser.dwCurMapID;		--玩家发型
	--SqlCmd.Fields.fSpeed            = self.objUser.fSpeed;
	SqlCmd:execute()
	return true;
end;

--保存地图信息
function CMapSystemDBQuery:SaveMapInfo(duplId,tbMapInfo)
	if not self.objDB then
		_err("self.objDB is null by CMapSystemDBQuery");
		return false;
	end;
	if not self.objUser then
		_err("self.objUser is null by CMapSystemDBQuery");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_err("objPlayer is null by CMapSystemDBQuery");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_err("dwRoleID == 0 by CMapSystemDBQuery");
		return false;
	end;


	local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Map_Info');
	
	SqlCmd.Wheres.dwRoleID				= dwRoleID;
	
	if not tbMapInfo then
		--SqlCmd.Fields.dwRoleID 			= sInfo.dwRoleID;			--角色ID 
		SqlCmd.Fields.fXPos				= self.objUser.fXPos;		--玩家名字
		SqlCmd.Fields.fYPos				= self.objUser.fYPos;		--玩家性别
		SqlCmd.Fields.fDirValue			= self.objUser.fDirValue;		--玩家脸型
		SqlCmd.Fields.dwMapID			= self.objUser.dwCurMapID;		--玩家发型
		SqlCmd.Fields.dwDuplId          = duplId or 0;         --quying chg 2012-07-19
		--SqlCmd.Fields.fSpeed            = self.objUser.fSpeed;
	else
		SqlCmd.Fields.fXPos				= tbMapInfo.fXPos;
		SqlCmd.Fields.fYPos				= tbMapInfo.fYPos;
		SqlCmd.Fields.fDirValue			= tbMapInfo.fDirValue;
		SqlCmd.Fields.dwMapID			= tbMapInfo.dwCurMapID;
		SqlCmd.Fields.dwDuplId			= 0;
	end
	
	SqlCmd:execute()
	return true;
	
end;

