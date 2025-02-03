
-- local function func(objPlayer,tbInfoList,isNewRole)
	-- local dwAccountID = objPlayer:GetAccountID();
	-- local dwRoleID = objPlayer:GetRoleID();
	
	-- local tabList = {}
	-- local szCmd = 'select * from "T_ServerEvent" where "EventType" = $1'
	-- local dbres; 
	-- for i = 1,_G.dwServerEventTypeNum do
		-- dbres = objPlayer:GetDBQuery():execute(szCmd, i);
		-- tabList[i] = {}
		-- local index = 1;
		-- for k,v in pairs(dbres or {}) do
			-- tabList[i][index] = {}

			-- tabList[i][index].eEventType = v.EventType
			-- tabList[i][index].dwCompleteRoleID = v.CompleteRoleID
			-- if tabList[i][index].dwCompleteRoleID ~= -1 then
				-- tabList[i][index].szCompleteRoleName = v.CompleteRoleName
			-- else
				-- tabList[i][index].szCompleteRoleName = ' '
			-- end
			-- tabList[i][index].dwCompleteTime = v.CompleteTime
			-- tabList[i][index].dwData1 = v.dwData1
			-- tabList[i][index].szData1 = v.szData1
			-- tabList[i][index].dwEventID = v.EventID
			-- index = index + 1;
		-- end
	-- end
	
	-- CTransitManager:RecvData(dwAccountID,"CServerEventSystem",tabList);
-- end;

-- CLoginCall:AddCall("CServerEventSystem",func);