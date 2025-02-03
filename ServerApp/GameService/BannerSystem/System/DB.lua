--[[
	[\brief 战旗系统数据库操作器
	[\author 王凌波
	[\date 2014-7-16
  ]]

-- 战旗数据库操作器
_G.CBannerSystemDB = {};

-- 数据库中战旗表的表名
local DBTableName = "T_Role_Banner_Info";

--[[
    [\brief 新建数据库操作器
    [\param table oDBQuery 数据库查询器对象
    [\param table oSystem 要操作的系统对象
    [\return table 数据库操作器对象
  ]]
function CBannerSystemDB:new(oDBQuery, oSystem)
    local oObj = {};
    oObj.oDBQuery = oDBQuery;
    oObj.oSystem  = oSystem;
    for k, v in pairs(self) do
        if type(v) == "function" then
            oObj[k] = v;
        end
    end
    return oObj;
end

--[[
    [\brief 检查系统数据库模块有效性
    [\return boolean true表示合法，false表示非法
    [\return number 玩家的角色id
  ]]
function CBannerSystemDB:CheckDBValidityAndGetRoleID()
    local nRoleID = self.oSystem:GetPlayer():GetRoleID();
    if not self.oDBQuery then 
        _err("oDBQuery doesNot exist in CBannerSystemDB");
        return false;
    end
    if not self.oSystem then 
        _err("oSystem doesNot exist in CBannerSystemDB");
        return false;
    end
    if nRoleID == 0 then 
        _err("nRoleID == 0 in CBannerSystemDB");
        return false;
    end
    return true, nRoleID;
end

--[[
    [\brief 将战旗系统属性插入数据库
    [\return boolean 是否插入成功，true成功，false未成功
  ]]
function CBannerSystemDB:Insert() 
    local bValid, nRoleID = self:CheckDBValidityAndGetRoleID();
    if not bValid then return false; end

    local oSystem = self.oSystem;
    local SqlCmd = self.oDBQuery:CreateInsertCmd(DBTableName);
    SqlCmd.Fields.dwRoleID = nRoleID;
    SqlCmd.Fields.dwEXP = oSystem.nEXP;
    SqlCmd.Fields.bBless = oSystem.bBless;
    SqlCmd.Fields.bConsume = oSystem.bConsume;
    SqlCmd.Fields.dwLook = oSystem.nLook;
    SqlCmd.Fields.dwStartTime = oSystem.nStartTime;
    SqlCmd:execute();
    return true;
end

--[[
    [\brief 执行更新数据库操作
    [\return boolean 是否更新成功，true成功，false未成功
  ]]
function CBannerSystemDB:Update() 
    local bValid, nRoleID = self:CheckDBValidityAndGetRoleID();
    if not bValid then return false; end

    local oSystem = self.oSystem;
    local SqlCmd = self.oDBQuery:CreateUpdateCmd(DBTableName);
    SqlCmd.Wheres.dwRoleID = nRoleID;
    SqlCmd.Fields.dwEXP = oSystem.nEXP;
    SqlCmd.Fields.bBless = oSystem.bBless;
    SqlCmd.Fields.bConsume = oSystem.bConsume;
    SqlCmd.Fields.dwLook = oSystem.nLook;
    SqlCmd.Fields.dwStartTime = oSystem.nStartTime;
    SqlCmd:execute();
    return true;
end
