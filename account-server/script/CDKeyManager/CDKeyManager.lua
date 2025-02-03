_G.CDKeyManager = {}
local base = _G
-------------------------------------------------------------------
local szCmdSelectCode = [[select "dwAccountID","dwTeamID","dwType" from "T_CD_Key" where "szCode"='%s';]];
local szCmdSelectAcc = [[select count(*) from "T_CD_Key" where "dwAccountID"=%s and ("dwTeamID"=%s or "dwType"=%s);]];
local szCmdWrite = [[update "T_CD_Key" set "dwAccountID"=%s,"dwServerID"=%s,"dwTime"=%s where "szCode"='%s';]];
local szCmdCancel = [[update "T_CD_Key" set "dwAccountID"=0,"dwServerID"=0,"dwTime"=0 where "szCode"='%s';]];
-------------------------------------------------------------------

function CDKeyManager:Dispose(dwMType, dwID, strData)
	local _r,_l = pcall(function() base.json.decode(strData) end)
	if not _r then
		local JsonData = json.encode({})
		return Net:SendToGS(dwID, dwMType, JsonData)
	end
	local tData = base.json.decode(strData);
	if tData.op == 1 then
		local szCode = tData.szCode
		local dwAccountID = tData.dwAccountID
		local dwServerID = tData.dwServerID
		
		local Data = {
			res = 4;
			szCode = szCode;
			dwAccountID = dwAccountID;
			dwServerID = dwServerID;
			dwType = 0;
		};
		
		local res = base.GetShareDB():Exec(szCmdSelectCode,szCode)
		if res and res[1] then
			local Info = res[1]
			if tonumber(Info.dwAccountID) == 0 then
				local dwTeamID = tonumber(Info.dwTeamID)
				local dwType = tonumber(Info.dwType)
				local dwParam = dwTeamID
				if dwParam == 0 then
					dwParam = dwType
				end
				
				if dwTeamID == 9999 then
					Data.res = 0
					Data.dwType = dwType
					self:WriteDB(szCode,dwAccountID,dwServerID)
				else
					local res = base.GetShareDB():Exec(szCmdSelectAcc,dwAccountID,dwParam,dwParam)
					if res and res[1] and (tonumber(res[1].count)>0) then
						Data.res = 2
					else
						Data.res = 0
						Data.dwType = dwType
						self:WriteDB(szCode,dwAccountID,dwServerID)
					end
				end
			else--该领取码被使用过了
				Data.res = 1
			end
		else--该领取码不存在
			Data.res = 4
		end
		
		local JsonData = json.encode(Data)
		return Net:SendToGS(dwID, dwMType, JsonData)
	elseif tData.op == 2 then
		local szCode = tData.szCode
		self:CancelDB(szCode)
		return 0;
	end
end

function CDKeyManager:WriteDB(szCode,dwAccountID,dwServerID)
	return base.GetShareDB():Exec(szCmdWrite,dwAccountID,dwServerID,_now(),szCode)
end

function CDKeyManager:CancelDB(szCode)
	return base.GetShareDB():Exec(szCmdCancel,szCode)
end











