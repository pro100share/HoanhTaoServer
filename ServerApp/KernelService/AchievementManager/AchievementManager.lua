
_G.CAchievementManager = CSingle:new();
CSingleManager:AddSingle(CAchievementManager);
--create
function CAchievementManager:Create()
	self.tabHideAchievementList = {}
	local szCmd = 'select * from "T_Role_Achievement_Hide"';
	local tabRes = CPlayerDBQuery:GetDBQuery():execute(szCmd);
	for k,v in pairs(tabRes or {}) do
		self.tabHideAchievementList[v.dwAchievementID] = v;
	end
	return true;
end;
--update
function CAchievementManager:Update(dwInterval)
	return true;
end;
--destroy
function CAchievementManager:Destroy()
end;

function CAchievementManager:GetHideAchievementList()
	return self.tabHideAchievementList;
end;

function CAchievementManager:AddHideAchievement(dwAchievementID,dwRoleID,szRoleName)
	if self.tabHideAchievementList[dwAchievementID] then return end
	local tabHideAchievement = {};
	tabHideAchievement.dwAchievementID = dwAchievementID;
	tabHideAchievement.dwRoleID = dwRoleID;
	tabHideAchievement.szRoleName = szRoleName;
	self.tabHideAchievementList[dwAchievementID] = tabHideAchievement;
	
	local szCmd = 'insert into "T_Role_Achievement_Hide" ("dwAchievementID","dwRoleID","szRoleName") VALUES($1,$2,$3)';
	CPlayerDBQuery:GetDBQuery():execute(szCmd,dwAchievementID,dwRoleID,szRoleName);
	
	return true;
end;