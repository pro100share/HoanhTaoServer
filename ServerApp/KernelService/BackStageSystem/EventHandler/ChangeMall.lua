local base = _G;

local ChangeMall;

ChangeMall = function(setData)
	for k, v in pairs(setData.data) do
		-- print(k, v);
	end
	for _, objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.KSOnChangeMallRequestMsg{ParamMsg = setData.data};
	end
    BackstageSystem:SendToAS(BackstageSystem.setMessageID.Command,
        base.json.encode({http_id = setData.http_id; result = 1;}));
end

BackstageSystem:RegistEvent("change_mall", ChangeMall);
