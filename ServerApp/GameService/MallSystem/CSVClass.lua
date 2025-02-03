local base = _G;

local _DEBUG = false;

local NewCSV;

NewCSV = function (file, data, key, value)
    local CSVClass = {};

    CSVClass._file = file;
    CSVClass._data = data;
    CSVClass._key = key;
    CSVClass._value = value;

    function CSVClass:GetFile()
        return self._file;
    end

    function CSVClass:GetData()
        return self._data;
    end

    function CSVClass:GetKey()
        return self._key;
    end

    function CSVClass:GetValue()
        return self._value;
    end

    function CSVClass:AddValue(value)
        if type(value) == "table" then
            table.insert(self._value, value);
        end
        table.insert(self._data, value);
    end

    function CSVClass:DelValue(idx)
        local value = self._value[idx];
        local len = table.getn(self._data);
        for i = idx, len do
            if self._data[i] == value then
                table.remove(self._value, idx);
                table.remove(self._data, i);
                break;
            end
        end
    end

    return CSVClass;
end

_G.NewCSV = NewCSV;
