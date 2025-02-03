

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local setAllInfo = {};
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_Shortcut_Info" where "dwRoleID" = $1', dwRoleID);
    if #(dbres) > 0 then
		for i, row in pairs(dbres) do
            local sInfo = {};
            sInfo.dwType        =  row.dwType;
            sInfo.dwShortcutID	=  row.dwShortcutID;--快捷栏id
            sInfo.dwDataID		=  row.dwDataID;		--对应的数据
            sInfo.ItemType      =  row.ItemType;
            setAllInfo[sInfo.dwShortcutID] = sInfo;
        end;
    end;
	
	local Data = {};
	Data[1] = setAllInfo;
	
	CTransitManager:RecvData(dwAccountID,"CShortcutSystem", Data);
	return true;
end


CLoginCall:AddCall("CShortcutSystem",func);



