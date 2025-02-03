--[[
说明：武侠令登陆模块
作者：赵旭
时间: 2013-12-13
]] 

local dwSystemID = SystemNameToID.CWuXiaLingSystem;
local szSql = 
[[
select * from "T_Role_WuXiaLing" where "RoleID" = '%s'
]];
local tbParam = { { Param = ParamType.dwRoleID; } };
CLoginMode:AddMode(dwSystemID, szSql, tbParam, 1);
