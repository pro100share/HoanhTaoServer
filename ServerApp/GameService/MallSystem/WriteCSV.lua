local base = _G;

local _DEBUG = false;

local WriteCSV;
local DoWrite;
local GetKeyStr;
local GetValueStr;

-- @p-code
-- 获取写入文件路径
    -- 如果file存在，写入到指定路径
    -- 否则写入到csv中路径
-- 写模式打开IO
    -- 如果失败返回false
-- 写文件
-- 关闭IO
-- 返回true

-- @brief 写CSV文件
-- @param csv table CSV对象
-- @param file string 写入文件完整路径
                    -- nil-csv原路径
                    -- string-指定路径
-- @return boolean 是否成功
WriteCSV = function (csv, file)
    if _DEBUG then
        -- print("\n");
        -- print("---WriteCSV---");
    end
    local _file = "";
    if file then
        _file = file;
    else
        _file = csv:GetFile();
    end
    local stream = io.open(_file, "w+");
    if not stream then
        return false;
    end
    DoWrite(stream, csv:GetData());
    stream:close();
    if _DEBUG then
        -- print("---WriteCSV---");
        -- print("\n");
    end
    return true;
end


-- @p-code
-- 循环data，元素保存到v
    -- 如果v是字符串说明为注释
        -- 直接写入文件
    -- 否则
        -- 如果是空table
            -- 写入一个空行
        -- 否则
            -- 如果遇到的第一个值，视为key直接写入
            -- 否则视为value通过key索引，分隔符为“，”，按顺序写入
DoWrite = function (stream, data)
    if _DEBUG then
        -- print("\n");
        -- print("---DoWrite---");
    end
    local key = nil;
    local first = true;
    for k, v in pairs(data) do
        local str;
        if type(v) == "string" then
            str = v;
        elseif type(v) == "table" then
            if key then
                str = GetValueStr(key, v);
            else
                key = v;
                str = GetKeyStr(v);
            end
        end
        if _DEBUG then
            -- print(str);
        end
        if first then
            first = false;
        else
            str = "\n" .. str;
        end
        stream:write(str);
    end
    if _DEBUG then
        -- print("---DoWrite---");
        -- print("\n");
    end
end

GetKeyStr = function (key)
    local str = "";
    local first = true;
    for k, v in pairs(key) do
        if first then
            first = false;
        else
            str = str .. ",";
        end
        str = str .. v;
    end
    return str;
end

GetValueStr = function (key, value)
    local str = "";
    local first = true;
    for k, v in pairs(key) do
        if first then
            first = false;
        else
            str = str .. ",";
        end
        str = str .. (value[v] or "");
    end
    return str;
end

_G.WriteCSV = WriteCSV;
