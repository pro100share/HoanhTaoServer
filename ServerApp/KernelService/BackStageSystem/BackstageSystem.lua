local base = _G;
local _DEBUG = false;
base.BackstageSystem = {};

local handler = {};

function BackstageSystem:FireEvent(id, ...)
    if _DEBUG then
        -- print("\n");
        -- print("---BackstageSystem:FireEvent---");
    end
    if handler[id] then
        return handler[id](...);
    else
        if _DEBUG then
            -- print("No Have Command", id);
        end
    end
    if _DEBUG then
        -- print("---BackstageSystem:FireEvent---");
        -- print("\n");
    end
end

function BackstageSystem:RegistEvent(id, fun)
    if _DEBUG then
        -- print("\n");
        -- print("---BackstageSystem:RegistEvent---");
    end
	if handler[id] then
        if _DEBUG then
            -- print("Command Repeat", id);
        end
	else
		handler[id] = fun;
	end
    if _DEBUG then
        -- print("---BackstageSystem:RegistEvent---");
        -- print("\n");
    end
end

function BackstageSystem:OnConnect()
	BackstageSystem:FireEvent("server_info");
	CRewardCodeManager:OnASConnect()
end

function BackstageSystem:OnRecevie(dwMType, sData)
    if dwMType == self.setMessageID.Command then
        BackstageSystem:DoCommand(sData);
    end
	if dwMType == self.setMessageID.Charge then
		BackstageSystem:FireEvent("charge", sData);
	end
	if dwMType == self.setMessageID.Url then
		CScriptManager:OnGetUrlInfo(json.decode(sData))
	end
	if dwMType == self.setMessageID.CDKey then
		CRewardCodeManager:OnRecvASRes(json.decode(sData))
	end
end

function BackstageSystem:OnClose()
    CRewardCodeManager:OnASClose()
end

function BackstageSystem:DoCommand(sData)
    if _DEBUG then
        -- print("\n");
        -- print("---BackstageSystem:DoCommand---");
		-- print(sData);
    end
	local tData = json.decode(sData);
    if _DEBUG then
        -- print(tData.op);
    end
	if _DEBUG then
        -- print("---BackstageSystem:DoCommand---");
        -- print("\n");
    end
	self:FireEvent(tData["op"], tData);
end

function BackstageSystem:SendToAS(dwMType, sData)
	_SendASCommand(dwMType, sData);
end
