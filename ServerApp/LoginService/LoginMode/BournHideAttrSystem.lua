--[[
说明：实战隐藏属性登陆模块
作者：赵旭
时间: 2013-12-13
]] 

local dwSystemID = SystemNameToID.CBournHideAttrSystem;
local szSql = 
[[
select * from "T_Role_BournHideAttr" where "RoleID" = '%s'
]];
local tbParam = { { Param = ParamType.dwRoleID; } };
CLoginMode:AddMode(dwSystemID, szSql, tbParam, 1);
