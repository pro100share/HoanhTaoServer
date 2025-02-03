




local dwSystemID = SystemNameToID.CServerEventSystem;
local tbParam = {}
for i = 1,_G.dwServerEventTypeNum do
	local szSql = [[select * from "T_ServerEvent" where "EventType" = ]]..i;
	CLoginMode:AddMode(dwSystemID,szSql,tbParam,i)
end

