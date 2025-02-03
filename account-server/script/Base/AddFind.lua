local base = _G;

local strFindSql = 
[[
SELECT *
FROM (%s) AS t
WHERE t."%s" = '%s'
]]

local AddFind;

AddFind = function (strKey, strValue, strSql)
	if strKey == nil or strValue == nil then
		return strSql;
	end
    return string.format(strFindSql,
        strSql,
        tostring(strKey),
        tostring(strValue));
end

_G.AddFind = AddFind;
