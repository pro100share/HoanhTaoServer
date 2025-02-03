local base = _G;

local TableToString;

TableToString = function (setValue)
    if not setValue then
        base.Log:Error("TableToString Param Error");
        base.Log:Error(debug.traceback());
        return "";
    end
    
	base.Log:Info("---TableToString Start---");
    local res = "";
    local first = true;
    for k, v in pairs(setValue) do
        if first then
            first = false;
        else
            res = res .. ", ";
        end
        res = res .. v;
    end
	base.Log:Info(res);
	base.Log:Info("---TableToString End---");
    return res;
end

_G.TableToString = TableToString;
