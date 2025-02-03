_G.strSql = 
[[
SELECT
t2."n_MountUpGrade",
t1."n_EnumID",
t1."n_InstID",
t1."n_Exp",
t1."n_Level",
t1."s_Equip"
FROM "T_Role_Mount" AS t1
LEFT JOIN "T_Role_TianGuanCiFu" AS t2
ON t1."n_RoleID" = t2."n_RoleID"
WHERE t1."n_RoleID" = '%s'
]]
