_G.strSql = 
[[
SELECT "dwRoleID", "szRoleName", "dwSex", "dwTotalExp", "dwProf", "tmCreateRoleTime"
FROM "T_Role_Info"
WHERE "dwAccountID" = '%s';
]]