_G.strSql = 
[[
SELECT
m."dwAccountID",
m."dwRoleID",
m."szRoleName" AS "szName",
m."dwProf",
m."dwTotalExp",
m."tmCreateRoleTime" AS "create",
m."tmUplineTime",
t1."dwGold",
t1."dwBindGold",
t1."dwPacketMoney",	
t1."dwStorageMoney",
t2."szGuildName",
t3."HusbandName",
t3."WifeName",
t4."dwTimeLast" AS "dwVipTime",
t5."dwWeiWangLevel",
t5."dwActivePoint",	
m."dwBanTime",
m."szIP" AS "ip",
m."bOnline" AS "online",
m."dwLockStart" AS "bLoginBan"

FROM "T_Role_Info" AS m

LEFT JOIN "T_Role_ItemSystem" AS t1
ON m."dwRoleID" = t1."dwRoleID"

LEFT JOIN (SELECT t2."dwRoleID", t1."szGuildName" 
		   FROM "T_Guild_Info" AS t1, "T_Guild_Member" AS t2 
		   WHERE t2."dwGuildID" = t1."dwGuildID") 
		   AS t2
ON m."dwRoleID" = t2."dwRoleID"

LEFT JOIN "T_Role_Marriage" AS t3
ON m."dwRoleID" = t3."HusbandRoleID" OR m."dwRoleID" = t3."WifeRoleID"

LEFT JOIN "T_Role_Vip" AS t4
ON m."dwRoleID" = t4."dwRoleID"

LEFT JOIN "T_Role_MissionDaily" AS t5
ON m."dwRoleID" = t5."dwRoleID"

WHERE m."dwRoleID" = '%s'
]]
