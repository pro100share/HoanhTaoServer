local base = _G;
_G.Error = {};

local strFormat = "{message : %s}";
local setType = {
    [1]     = "[COMMAND] [NO EXIST]";
    [2]     = "[COMMAND] [SERVER (%s) NO EXIST]";
};

function Error:Send(dwHttpID, dwType, ...)
	local strMsg = setType[dwType];
    if strMsg then
		local setArg = {...};
		if next(setArg) then
			strMsg = string.format(strMsg, unpack(setArg));
		end
		local strTxt = string.format(strFormat, strMsg);
        base.Net:SendToHttp(dwHttpID, strTxt);
    else
		base.Log:Error("Unknown Error Code");
        base.Log:Error(dwHttpID, dwType);
        base.Log:Error(debug.traceback());
    end
end
