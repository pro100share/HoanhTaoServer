--[[
˵����360����ϵͳ��½�������ݻ�ȡ��
���ߣ�����
]] 

local dwSystemID = SystemNameToID.C360RedJewelSystem;
local szSql = 
[[
select * from "T_Role_360RedJewel" where "dwAccountID" = '%s'
]];
local tbParam = { { Param = ParamType.dwAccountID; } };
CLoginMode:AddMode(dwSystemID, szSql, tbParam, 1);
