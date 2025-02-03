--战魂的数据库操作

local function MakeActiveInfoToString(tbActList)
	local str = "";
	
	for dwRank,tbList in pairs(tbActList)do
		local strByList = "";
		for id,_ in pairs(tbList)do
			strByList = strByList..id..",";
		end
		
		local strByRank = dwRank..";"..strByList;
		
		str = str..strByRank.."|";
	end
	
	return str;
end;

function CSoulSystem:DBSaveSystemInfo(tbChgInfo)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local SqlCmd = self.objDB:CreateUpdateCmd("T_Role_Soul_System");
	SqlCmd.Wheres.dwRoleID = objSelf:GetRoleID();
	local isOK = false;
	for k,v in pairs(tbChgInfo)do
		SqlCmd.Fields[k] = v;
		isOK = true;
	end
	if isOK then
		SqlCmd:execute();
	end
	
end;

function CSoulSystem:SaveActiveInfo()
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local SqlCmd = self.objDB:CreateUpdateCmd("T_Role_Soul_System");
	SqlCmd.Wheres.dwRoleID = objSelf:GetRoleID();
	
	local strWrite = MakeActiveInfoToString(self.setActiveInfo);
	SqlCmd.Fields.strActiveSuit = strWrite;
	
	SqlCmd:execute();
end;

function CSoulSystem:DBInsertSoulInfo(objSoul)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local dwType,dwPos = objSoul:GetPosInfo();
	local SqlCmd = self.objDB:CreateInsertCmd("T_Role_Soul_Object");
	SqlCmd.Fields.dwRoleID			= objSelf:GetRoleID();
	SqlCmd.Fields.dwSoulID       	= objSoul:GetInstID();
	SqlCmd.Fields.dwEnumID			= objSoul:GetEnumID();
	SqlCmd.Fields.dwHolderType		= dwType;
	SqlCmd.Fields.dwPosID			= dwPos;
	SqlCmd.Fields.dwExp				= objSoul:GetExp();
	SqlCmd:execute();
	
	return true;
end;

function CSoulSystem:DBDeleteSoulInfo(dwSoulID)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local SqlCmd = self.objDB:CreateDeleteCmd("T_Role_Soul_Object");
	SqlCmd.Wheres.dwRoleID = objSelf:GetRoleID();
	SqlCmd.Wheres.dwSoulID = dwSoulID;
	SqlCmd:execute();
	
	return true;
end;

function CSoulSystem:DBUpdateSoulInfo(dwSoulID,tbUpdateInfo)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local SqlCmd = self.objDB:CreateUpdateCmd("T_Role_Soul_Object");
	SqlCmd.Wheres.dwRoleID = objSelf:GetRoleID();
	SqlCmd.Wheres.dwSoulID = dwSoulID;
	local isOK = false;
	for k,v in pairs(tbUpdateInfo)do
		SqlCmd.Fields[k] = v;
		isOK = true;
	end
	if isOK then
		SqlCmd:execute();
	end
	
end;

