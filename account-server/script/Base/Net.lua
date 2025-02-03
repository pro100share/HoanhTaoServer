--[[
	网络 函数
	周长沙
	2013-6-29
--]]

local base = _G;
_G.Net = {}
------------------------------------------------------------

--发送到 GameServer (KS)
function Net:SendToGS(dwServerID, dwMsgID, strData)
    if not dwServerID or not dwMsgID or not strData then
        base.Log:Error("Net:SendToGS Param Error");
        base.Log:Error(dwServerID, dwMsgID, strData);
        base.Log:Error(debug.traceback());
        return;
    end
    if tonumber(dwServerID) == -1 then
        return _SendToGSs(dwMsgID, strData, string.len(strData));
    else
        return _SendToGS( dwServerID, dwMsgID, strData, string.len(strData));
    end
end

--发送到 Http
function Net:SendToHttp(dwHttpID, strData)
    if not dwHttpID or not strData then
        base.Log:Error("Net:SendToHttp Param Error");
        base.Log:Error(dwHttpID, strData);
        base.Log:Error(debug.traceback());
        return;
    end
	return _SendToHttp(dwHttpID, strData, string.len(strData)); 
end

--发送到 Charge
function Net:SendToCharge(dwHttpID, strData)
    if not dwHttpID or not strData then
        base.Log:Error("Net:SendToCharge Param Error");
        base.Log:Error(dwHttpID, strData);
        base.Log:Error(debug.traceback());
        return;
    end
	return _SendToCharge(dwHttpID, strData, string.len(strData)); 
end
