local szTable = "T_Role_Festival"


--获得数据库操作对象
function CFestivalSystem:GetDB()
	local objPlayer = self:GetPlayer();
	return objPlayer:GetDBQuery();
end

--删除
function CFestivalSystem:DBDelIndex(Index)
	if not Index then return end;
	local objDB = self:GetDB();
	local SqlCmd = objDB:CreateDeleteCmd(szTable);
	SqlCmd.Wheres.dwRoleID = Index.dwRoleID;
	SqlCmd.Wheres.dwFestival = Index.dwFestival;
	SqlCmd.Wheres.dwLine = Index.dwLine;
	SqlCmd.Wheres.dwIndex = Index.dwIndex;
	SqlCmd:execute()
end

--插入
function CFestivalSystem:DBInsertIndex(Index)
	if not Index then return end;
	local objDB = self:GetDB();
	local SqlCmd = objDB:CreateInsertCmd(szTable);
	SqlCmd.Fields = {
		dwRoleID = Index.dwRoleID;
		dwFestival = Index.dwFestival;
		dwLine = Index.dwLine;
		dwIndex = Index.dwIndex;
		dwGetTimes = Index.dwGetTimes;
		dwTime = Index.dwTime;
	}
	SqlCmd:execute();
end

--更新
function CFestivalSystem:DBUpdateIndex(Index)
	if not Index then return end;
	local objDB = self:GetDB();
	local SqlCmd = objDB:CreateUpdateCmd(szTable);
	SqlCmd.Wheres = {
		dwRoleID = Index.dwRoleID;
		dwFestival = Index.dwFestival;
		dwLine = Index.dwLine;
		dwIndex = Index.dwIndex;
	};
	SqlCmd.Fields = {
		dwRoleID = Index.dwRoleID;
		dwFestival = Index.dwFestival;
		dwLine = Index.dwLine;
		dwIndex = Index.dwIndex;
		dwGetTimes = Index.dwGetTimes;
		dwTime = Index.dwTime;
	};
	SqlCmd:execute();
end

















