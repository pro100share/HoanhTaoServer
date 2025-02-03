--[[
说明：360红钻系统登陆服务数据获取器
作者：赵旭
]] 

local dwSystemID = SystemNameToID.C360RedJewelSystem;
local szSql = 
[[
select * from "T_Role_360RedJewel" where "dwAccountID" = '%s'
]];
local tbParam = { { Param = ParamType.dwAccountID; } };
CLoginMode:AddMode(dwSystemID, szSql, tbParam, 1);
