local base = _G;
_G.Log = {};

local BuildTxt;

function Log:Error(...)
	print(BuildTxt(...));
    _Error(BuildTxt(...));
end

BuildTxt = function (...)
    local strTxt = "";
    local first = true;
    for k, v in pairs({...}) do
        if first then
            first = false;
        else
            strTxt = strTxt .. ", ";
        end
        strTxt = strTxt .. tostring(v);
    end
    return strTxt;
end

function Log:Warning(...)
	print(BuildTxt(...));
    _Warning(BuildTxt(...));
end

function Log:Info(...)
	print(BuildTxt(...));
	if not base._NINFO then
		_Info(BuildTxt(...));
	end
end
