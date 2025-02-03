local base = _G;

local strPageSql = 
[[
SELECT *
FROM (
    SELECT *,
    ROW_NUMBER() OVER (ORDER BY t.* ASC) AS "index"
    FROM (%s) AS t
) AS t
WHERE
t."index" >= %d AND t."index" <= %d
]]

local AddPaging;

AddPaging = function (dwPage, dwPageSize, strSql)
	if not dwPage or not dwPageSize then
		return strSql;
	end
    local dwUp = (dwPage - 1) * dwPageSize + 1;
    local dwDown = dwUp + dwPageSize;
    return string.format(strPageSql, strSql, dwUp, dwDown);
end

_G.AddPaging = AddPaging;