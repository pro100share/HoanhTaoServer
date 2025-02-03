local base = _G;

local strGetConfigSql = 
[[
SELECT *
FROM "T_Merge"
WHERE "dwOSID" = '%d'
]];
local strMergeRoleNameFormat = "[%d区] %s";

local GetMergeInfo;
local GetNewAccountID;
local GetNewServerID;
local GetOriginAccountID;
local GetMergeRoleName;

-- @brief 获取合服后信息
-- @param dwOSID number 原服务器ID
-- @param dwOAID number 原账号ID
-- @return number number 合服后服务器ID、账号ID
GetMergeInfo = function (dwOSID, dwOAID)
    local dwNAID = GetNewAccountID(dwOAID, dwOSID);
	local dwNSID = GetNewServerID(dwOSID);
    return dwNSID, dwNAID;
end

GetNewAccountID = function (dwOAID, dwOSID)
    if dwOAID == nil then
        return nil;
    end
    local dwNAID = dwOAID;
    if dwOAID then
        if type(dwNAID) == "table" then
            for k, v in pairs(dwOAID) do
                dwNAID[k] = tonumber(v) * 10000 + tonumber(dwOSID);
            end
        else
            dwNAID = tonumber(dwOAID) * 10000 + tonumber(dwOSID);
        end
    end
    return dwNAID;
end

GetNewServerID = function (dwOSID)
    if dwOSID == nil then
        return nil;
    end
    local dwNSID = dwOSID;
    if type(dwOSID) == "table" then
        for k, v in pairs(dwOSID) do
            local setData = base.GetShareDB():Exec(strGetConfigSql, v);
            if setData[1] then
                dwNSID[k] = setData[1].dwNSID;
            else
                dwNSID[k] = v;
            end
        end
    else
        local setData = base.GetShareDB():Exec(strGetConfigSql, dwOSID);
        if setData[1] then
            dwNSID = setData[1].dwNSID;
        else
            dwNSID = dwOSID;
        end
    end
    return dwNSID;
end

GetOriginAccountID = function (dwNAID)
    return math.floor(dwNAID / 10000);
end

GetMergeRoleName = function (dwServerID, strRoleName)
    return string.format(strMergeRoleNameFormat,
        tonumber(dwServerID),
        strRoleName);
end

_G.GetMergeInfo = GetMergeInfo;
_G.GetOriginAccountID = GetOriginAccountID;
_G.GetMergeRoleName = GetMergeRoleName;
