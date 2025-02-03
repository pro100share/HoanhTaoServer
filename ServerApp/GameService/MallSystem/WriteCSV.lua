local base = _G;

local _DEBUG = false;

local WriteCSV;
local DoWrite;
local GetKeyStr;
local GetValueStr;

-- @p-code
-- ��ȡд���ļ�·��
    -- ���file���ڣ�д�뵽ָ��·��
    -- ����д�뵽csv��·��
-- дģʽ��IO
    -- ���ʧ�ܷ���false
-- д�ļ�
-- �ر�IO
-- ����true

-- @brief дCSV�ļ�
-- @param csv table CSV����
-- @param file string д���ļ�����·��
                    -- nil-csvԭ·��
                    -- string-ָ��·��
-- @return boolean �Ƿ�ɹ�
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
-- ѭ��data��Ԫ�ر��浽v
    -- ���v���ַ���˵��Ϊע��
        -- ֱ��д���ļ�
    -- ����
        -- ����ǿ�table
            -- д��һ������
        -- ����
            -- ��������ĵ�һ��ֵ����Ϊkeyֱ��д��
            -- ������Ϊvalueͨ��key�������ָ���Ϊ����������˳��д��
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
