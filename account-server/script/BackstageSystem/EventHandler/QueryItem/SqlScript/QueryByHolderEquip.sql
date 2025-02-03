_G.strSql = 
[[
SELECT
"dwItemEnum" AS "dwEnumID",
"dwItemID" AS "dwInstID",
"dwItemNumber" AS "dwCount",
"dwPosSlot",
"dwStrongLevel",
"strPropertyInfo"
FROM "T_Role_Item_Equip"
WHERE "dwRoleID" = '%s' AND ("dwPosSlot" >= %d AND "dwPosSlot" < %d)
]]
