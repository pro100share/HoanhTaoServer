

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local dbres1 = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_Task" where "dwRoleID" = $1', dwRoleID);
    if #(dbres1) > 0 then
		for i=1, #dbres1, 10 do
            local Data = {}
            for j=0,9 do
                table.insert(Data,dbres1[i+j])
            end
            CTransitManager:RecvData(dwAccountID,"CTaskSystem",Data)
        end
    end;
	
    local dbres2 = tbInfoList[2]---objPlayer:GetDBQuery():execute('select * from "T_Role_Task_Ex" where "dwRoleID" = $1', dwRoleID);
    if #(dbres2) > 0 then
		CTransitManager:RecvData(dwAccountID,"CTaskSystemEx", dbres2)
    else--if isNewRole then
        local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd("T_Role_Task_Ex");
        SqlCmd.Fields.dwRoleID = dwRoleID;
        SqlCmd:execute();
    end;
    
	return true;
end;


CLoginCall:AddCall("CTaskSystem",func);



