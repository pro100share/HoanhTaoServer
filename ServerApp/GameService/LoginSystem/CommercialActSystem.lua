
local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	
    --从数据库中读取系统信息
    local data = {};
	local res = tbInfoList[1]
    if #(res) > 0 then
		for _, info in ipairs(res) do
			data[info.dwActID] = data[info.dwActID] or {};
			data[info.dwActID][info.dwDays] = data[info.dwActID][info.dwDays] or {};
			data[info.dwActID][info.dwDays][info.dwIndex] = info.dwGetTimes;
		end;
    end;
	CTransitManager:RecvData(dwAccountID,"CCommercialActSystem", data);
	return true;
end;


CLoginCall:AddCall("CCommercialActSystem",func);