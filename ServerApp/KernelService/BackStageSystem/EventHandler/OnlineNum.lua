local base = _G;
local OnlineNum

OnlineNum = function(t)
	local ret = {};
	ret.http_id = t.http_id;
	ret.result = 1;
	ret.info = {
		num = CPlayerManager.dwMaxCount;
	};
	BackstageSystem:SendToAS(BackstageSystem.setMessageID.Command, base.json.encode(ret));
end

BackstageSystem:RegistEvent("onlinenum", OnlineNum);