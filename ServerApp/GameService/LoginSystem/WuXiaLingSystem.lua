--[[
说明：武侠令登陆数据
作者：赵旭
时间: 2013-12-13
]] 

local function func(objPlayer, tbInfoList, isNewRole)
    local setRecord = tbInfoList[1];
    local setData = {
        Insignia = 0;
    };
    if #setRecord > 0 then
        setData.Insignia = setRecord[1].Insignia;
    else
        local SqlCmd = objPlayer:GetDBQuery():
            CreateInsertCmd('T_Role_WuXiaLing');
        SqlCmd.Fields.RoleID = objPlayer:GetRoleID();
        SqlCmd.Wheres.Insignia = 0;
        SqlCmd:execute()
    end

	CTransitManager:RecvData(objPlayer:GetAccountID(),
        "CWuXiaLingSystem",
        setData);
    return true;
end

CLoginCall:AddCall("CWuXiaLingSystem", func);
