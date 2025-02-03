local base = _G;

local ReLoad

ReLoad = function(t)
	local dwID = tonumber(t.id)
	
	local res,_log = CScriptManager:ReLoad(dwID)

    local ret = {};
    ret.http_id = t.http_id;
    ret.result = res;
	ret.info = _log;
    BackstageSystem:SendToAS(BackstageSystem.setMessageID.Command, base.json.encode(ret));
end

BackstageSystem:RegistEvent("reload", ReLoad);
