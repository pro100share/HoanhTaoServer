local base = _G;
local GetProp;

GetProp = function(setData)
	local setRet = {};
	setRet.http_id = setData.http_id;
	
	local ObjPlayer = CPlayerManager:GetPlayerByRoleID(tonumber(setData.role_id));
	if ObjPlayer ~= nil then
		setData.role_id = ObjPlayer:GetRoleID();
		ObjPlayer.objLine.KSBackStageMsg{Param = setData}
	else
		setRet.result = 0;
		BackstageSystem:SendToAS(BackstageSystem.setMessageID.Command, base.json.encode(setRet));
	end
end

BackstageSystem:RegistEvent("get_prop", GetProp);