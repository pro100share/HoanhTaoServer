

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local Data = {};
    local dbres = tbInfoList[1];
    if #(dbres) > 0 then
		local Row = dbres[1];
		
		local tbDulpCfg = DuplConfig[Row.dwDuplId]
		--print("===map load===",Row.dwDuplId)
        if tbDulpCfg then  --quying chg 2012-07-19 从副本中下线的玩家上线后在指定的位置
            Data[1] = tbDulpCfg.ReliveMapId; --玩家当前所在地图
            Data[2] = tbDulpCfg.Posx;		--玩家的x位置
            Data[3] = tbDulpCfg.Posy;		--玩家的Y位置
            Data[4] = 0;                                    --玩家的方向
        else
            Data[1] = Row.dwMapID;          --玩家当前所在地图
            Data[2] = Row.fXPos;		    --玩家的x位置
            Data[3] = Row.fYPos;		    --玩家的Y位置
            Data[4] = Row.fDirValue;        --玩家的方向
        end;
    else--if isNewRole then
        Data[1] = InitConfig.dwInitMapID;
        Data[2] = InitConfig.fInitXPos;
        Data[3] = InitConfig.fInitYPos;
        Data[4] = InitConfig.fInitDirValue;
        local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_Map_Info');
        SqlCmd.Fields.dwRoleID  = dwRoleID;
        SqlCmd.Fields.dwMapID	= Data[1];
        SqlCmd.Fields.fXPos		= Data[2];
        SqlCmd.Fields.fYPos		= Data[3];
        SqlCmd.Fields.fDirValue	= Data[4];
        SqlCmd:execute();
    end;
	
	CTransitManager:RecvData(dwAccountID,"CMapSystem", Data);
	return true;
end


CLoginCall:AddCall("CMapSystem",func);



