local base = _G;

local _DEBUG = false;
local SERVER = true;

local ReadCSV;
local DoRead;
local ReadData;
local Parse;
local IsComment;
local DoParse;
local BuildKeyValue;

-- @brief 读取CSV文件
-- @param file string 文件完整路径
-- @return table 数据对象
        -- CSV = {
            -- @brief 获取文件完整路径
            -- @return string 路径
            -- GetFile();

            -- @brief 获取键
            -- @return table 键集合，例如：{"name", "age", "gender"}
            -- GetKey();

            -- @brief 获取值
            -- @return table 值集合， 例如：{
                                            -- {name = "john",
                                                -- age = "10",
                                                -- gender = "1"}
                                            -- ...
                                         -- }
            -- GetValue();
        -- };
ReadCSV = function (file)
    if _DEBUG then
        -- print("\n");
        -- print("---ReadCSV---");
    end
    local data, key, value = DoRead(file);
    if _DEBUG then
        -- print(data, key, value);
    end
    if _DEBUG then
        -- print("---ReadCSV---");
        -- print("\n");
    end
    return NewCSV(file, data, key, value);
end

DoRead = function (file)
    if _DEBUG then
        -- print("\n");
        -- print("---DoRead---");
    end
    local data = {};
    local key = nil;
    local value = {};
    if SERVER then
        for l in io.lines(file) do
            data, key, value = Parse(l, data, key, value);
        end
    else
        local data = ReadData(file);
        for k, v in pairs(data) do
            data, key, value = Parse(v, data, key, value);
        end
    end
    if _DEBUG then
        -- print("---DoRead---");
        -- print("\n");
    end
    return data, key, value;
end

ReadData = function (filepath)
    if _DEBUG then
        -- print("\n");
        -- print("---ReadData---");
    end
	local file = _File.new();
	file:open(filepath);
	local str_data = file:read(filepath);
    if _DEBUG then
        -- print(str_data);
    end

    local data = {};
    local start_idx = 1;
    local end_idx = 1;
    local is_next = true;
    while is_next do
        end_idx = string.find(str_data, "\n", start_idx);
        if end_idx then
            table.insert(data,
                string.sub(str_data,
                    start_idx,
                    end_idx - 1));
            start_idx = end_idx + 1;
        else
            table.insert(data,
                string.sub(str_data,
                start_idx,
                string.len(str_data)));
            is_next = false;
        end
    end

    file:close();

    if _DEBUG then
        for k, v in pairs(data) do
            -- print(v);
        end
        -- print("---ReadData---");
        -- print("\n");
    end

    return data;
end

Parse = function (l, data, key, value)
    local v = nil;
    if l == "" then
        v = {};
    else
        if IsComment(l) then
            v = l
        else
            v = DoParse(l);
            if key then
                v = BuildKeyValue(key, v);
                table.insert(value, v);
            else
                key = v;
            end
        end
        if _DEBUG then
            -- print(v);
        end
    end
    table.insert(data, v);
	return data, key, value;
end

IsComment = function (str)
    if _DEBUG then
        -- print("\n");
        -- print("---IsComment---");
    end
    local res;
    if string.byte("[") == string.byte(str) then
        res = true;
    else
        res = false;
    end
    if _DEBUG then
        -- print(res);
        -- print("---IsComment---");
        -- print("\n");
    end
    return res;
end

DoParse = function (str)
    if _DEBUG then
        -- print("\n");
        -- print("---Parse---");
        -- print(str);
    end
    local value = {};
    local start_idx = 1;
    local end_idx = 1;
    local loop = true;
    while loop do
		local _;
        _, end_idx = string.find(str, ",", start_idx);

        local elem;
        if end_idx == start_idx then
            elem = "";
        elseif end_idx == nil then
            if string.len(str) >= start_idx then
                elem = string.sub(str, start_idx, string.len(str));
            else
                elem = "";
            end
            end_idx = 1;
            loop = false;
        else
            elem = string.sub(str, start_idx, end_idx - 1);
        end

        if _DEBUG then
            -- print(elem);
        end
        table.insert(value, elem);

        start_idx = end_idx + 1;
    end
    if _DEBUG then
        -- print("---Parse---");
        -- print("\n");
    end
    return value;
end

-- @p-code
-- 循环key
    -- 通过key位置取value值
    -- 通过key值和value值合并成一个元素存放到容器
-- 返回容器
BuildKeyValue = function (key, value)
    if _DEBUG then
        -- print("\n");
        -- print("---BuildKeyValue---");
    end
    local kv = {};
    for k, v in pairs(key) do
        if _DEBUG then
            -- print(v, value[k]);
        end
        kv[v] = value[k];
    end
    if _DEBUG then
        -- print("---BuildKeyValue---");
        -- print("\n");
    end
    return kv;
end

_G.ReadCSV = ReadCSV;
