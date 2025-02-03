_G.strSql = 
[[
SELECT
"AmuletLevel" AS "dwAmuletLevel",
"AmuletRank" AS "dwAmuletRank",
"AmuletGrowth" AS "dwGrowthValue"
FROM "T_Role_Amulet"
WHERE "RoleID" = '%s'
]]
