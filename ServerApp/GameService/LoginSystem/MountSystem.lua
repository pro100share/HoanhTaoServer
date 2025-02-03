

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local Data = {}
	--从数据库中读取系统信息
	local dbres1 = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_MountSystem" where "n_RoleID" = $1', dwRoleID);
    if #(dbres1) > 0 then
		Data[1] = dbres1[1].n_MountSlotNum; --坐骑栏位
		Data[2] = dbres1[1].n_ActiveMountID;--默认激活坐骑ID   
		Data[3] = dbres1[1].n_NextInstID;   --从数据库中获取下一个新坐骑的实例ID
    else--if isNewRole then
		Data[1] = _G.CMountSystemConfig.InitialSlotNum;
		Data[2] = 0;
		Data[3] = 1;
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd("T_Role_MountSystem");
		SqlCmd.Fields.n_RoleID       	= dwRoleID;
		SqlCmd.Fields.n_MountSlotNum	= Data[1];
		SqlCmd.Fields.n_ActiveMountID	= Data[2];
		SqlCmd.Fields.n_NextInstID		= Data[3];
		SqlCmd:execute();
    end;
    Data[4] = false;   --骑乘状态
	--从数据库中读取所有坐骑信息
	local dbres2 = tbInfoList[2]--objPlayer:GetDBQuery():execute('select * from "T_Role_Mount" where "n_RoleID" = $1', dwRoleID);
    if #(dbres2) > 0 then
		Data[5] = dbres2;
    else
        Data[5] = {};
    end;
    
	CTransitManager:RecvData(dwAccountID,"CMountSystem", Data);
	return true;
end;


CLoginCall:AddCall("CMountSystem", func);



