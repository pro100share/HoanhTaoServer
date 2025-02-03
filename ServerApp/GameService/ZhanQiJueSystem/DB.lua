--[[
	[\brief 战骑诀数据库操作器
	[\author 王凌波
	[\date 2014-6-19
  ]]

-- 战骑诀系统数据库操作器
_G.CZhanQiJueSystemDB = {};

-- 数据库中战骑诀表的表名
local DBTableName = "T_Role_ZhanQiJue_Info";

--[[
    [\brief 新建数据库操作器
    [\param table oDBQuery 数据库查询器对象
    [\param table oSystem 要操作的系统对象
    [\return table 数据库操作器对象
  ]]
function CZhanQiJueSystemDB:new(oDBQuery, oSystem)
	local oObj    = {};
	oObj.oDBQuery = oDBQuery;
	oObj.oSystem  = oSystem;
	for i, v in pairs(self) do
		if type(v) == "function" then
			oObj[i] = v;
		end
	end
	return oObj;
end

--[[
	[\brief 检查系统数据库模块有效性
	[\return boolean true表示合法，false表示非法
	[\return number 玩家的角色id
  ]]
function CZhanQiJueSystemDB:CheckDBValidityAndGetRoleID()
    local nRoleID = self.oSystem:GetPlayer():GetRoleID();
    -- 如果没有数据库查询器
    if not self.oDBQuery then 
        _err("oDBQuery doesNot exist in CHeroTokenSystemDB");
        return false;
    end
    -- 如果没有对应的系统
    if not self.oSystem then 
        _err("oSystem doesNot exist in CHeroTokenSystemDB");
        return false;
    end
    -- 如果没有角色id
    if nRoleID == 0 then 
        _err("nRoleID == 0 in CHeroTokenSystemDB");
        return false;
    end
	return true, nRoleID;
end

--[[
    [\brief 执行插入数据库操作
    [\param table tInfo 要插入的数据
    [\return boolean true表示操作成功，false表示操作未成功
  ]]
function CZhanQiJueSystemDB:Insert(tInfo) 
	-- 数据库合法性检查
    local bValid, nRoleID = self:CheckDBValidityAndGetRoleID();
    if not bValid then return false; end
    -- 检查是否有字段
    local nEXP, bBless = tInfo.nEXP, tInfo.bBless;
    if nEXP == nil or bBless == nil then 
        _err("No field when CZhanQiJueSystemDB Insert");
        return false;
    end
    -- 执行插入操作
    local SqlCmd = self.oDBQuery:CreateInsertCmd(DBTableName);
    SqlCmd.Fields.dwRoleId = nRoleID;
    SqlCmd.Fields.dwEXP	= nEXP;
    SqlCmd.Fields.bBless = bBless;
    SqlCmd:execute();
    return true;
end

--[[
    [\brief 执行更新数据库操作
    [\param table tInfo 要更新的数据
    [\return boolean true表示操作成功，false表示操作未成功
  ]]
function CZhanQiJueSystemDB:Update(tInfo) 
	-- 数据库合法性检查
    local bValid, nRoleID = self:CheckDBValidityAndGetRoleID();
    if not bValid then return false; end
    -- 检查是否有字段
    local nEXP, bBless = tInfo.nEXP, tInfo.bBless;
    if nEXP == nil and bBless == nil then 
        _err("No field when CZhanQiJueSystemDB Update");
        return false;
    end
    -- 执行更新操作
    local SqlCmd = self.oDBQuery:CreateUpdateCmd(DBTableName);
    SqlCmd.Wheres.dwRoleId = nRoleID;
    if nEXP ~= nil then SqlCmd.Fields.dwEXP = nEXP; end
    if bBless ~= nil then SqlCmd.Fields.bBless = bBless; end
    SqlCmd:execute();
    return true;
end
