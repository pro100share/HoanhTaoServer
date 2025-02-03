--离线角色数据DB

_G.COfflineInfoDB = {};

function COfflineInfoDB:Create(objDB)
	self.objDB = objDB;
	
	
	
	return self;
end;

function COfflineInfoDB:ReadRoleInfo(dwRoleID)
	local tbInfo = SOfflineRoleInfo:new();
	
	local strDB = [[select * from "T_Role_Info" where "dwRoleID" = ]]..dwRoleID;
	
	local dbrel = self.objDB:execute(strDB);
	if not dbrel then
		return nil;
	end
	local row = dbrel[1]
	if not row then
		return nil;
	end
	
	tbInfo.dwRoleID = dwRoleID;
	tbInfo.dwIncoID = row.dwIncoID or 0;
	tbInfo.dwDefIncoID = row.dwIncoIDTemp or 0;
	tbInfo.szName = row.szRoleName;
	local dwExp = row.dwTotalExp;
	local sInfo = {};
	sInfo.dwExp = dwExp;
	sInfo.dwLevel = 0;
	tbInfo.dwLevel = RoleUpLevelConfig:CompeteLevel(dwExp,sInfo);
	
	return tbInfo;
end;
