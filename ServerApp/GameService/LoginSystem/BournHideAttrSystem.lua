--[[
说明：实战隐藏属性登陆数据
作者：赵旭
时间: 2013-12-13
]] 

local function func(objPlayer, tbInfoList, isNewRole)
    local setRecord = tbInfoList[1];
    local setData = {
        Level = 0;
    };
    if #setRecord > 0 then
        setData.Level = setRecord[1].Level;
    else
        local SqlCmd = objPlayer:GetDBQuery():
            CreateInsertCmd('T_Role_BournHideAttr');
        SqlCmd.Fields.RoleID = objPlayer:GetRoleID();
        SqlCmd.Wheres.Level = 0;
        SqlCmd:execute();
    end

	CTransitManager:RecvData(objPlayer:GetAccountID(),
        "CBournHideAttrSystem",
        setData);
    return true;
end

CLoginCall:AddCall("CBournHideAttrSystem", func);
