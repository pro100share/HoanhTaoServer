--[[
   [ \brief 排行榜奖励
   [ \author 赵旭
   [ \date 2014-05-05
   ]]

local szSql = 
[[
    SELECT * FROM "T_Role_Chart_Award" WHERE "RoleID" = '%s'
]];
CLoginMode:AddMode(
    SystemNameToID.CChartAwardSystem, 
    szSql, 
    {{Param = ParamType.dwRoleID;}}, 
    1
);
