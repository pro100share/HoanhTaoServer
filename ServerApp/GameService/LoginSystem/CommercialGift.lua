
local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	
    --�����ݿ��ж�ȡϵͳ��Ϣ
    local data;
	local res = tbInfoList[1]
    if #(res) > 0 then
		data = res[1].strType;
    else
        data = "";
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd("T_CommercialGift");
        SqlCmd.Fields.dwAccountID	= dwAccountID;
        SqlCmd.Fields.strType		= data;
        SqlCmd:execute();
    end;
	CTransitManager:RecvData(dwAccountID,"CCommercialGiftSys", {data});
	return true;
end;


CLoginCall:AddCall("CCommercialGiftSys",func);