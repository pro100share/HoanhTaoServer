
local function func(objPlayer)
	local Data1 = {}
	
	Data1.dwEventID = CSeverEventDataManager:GetEventID();
	
	objPlayer:SetLineData("CServerEventSystem_KS", Data1);
end;

CLoginCall:AddCall(func);