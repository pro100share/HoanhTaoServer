_G.strSql = 
[[
SELECT "dwAccountID", "dwRoleID", "szRoleName", "dwTotalExp"
FROM "T_Role_Info"
WHERE "dwRoleID" IN (%s)
]]