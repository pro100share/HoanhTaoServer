_G.strSql = 
[[
SELECT
"dwItemEnum" AS "dwEnumID",
"dwItemID" AS "dwInstID",
"dwItemNumber" AS "dwCount",
"dwPosSlot"
FROM "T_Role_Item_Normal"
WHERE "dwRoleID" = '%s' AND ("dwPosSlot" >= %d AND "dwPosSlot" < %d)
]]
