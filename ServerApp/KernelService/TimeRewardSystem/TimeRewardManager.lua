--[[
	KS
	时间奖励
	周长沙
	2013-4-7
--]]
_G.CTimeRewardManager = CSingle:new();
CSingleManager:AddSingle(CTimeRewardManager);

CTimeRewardManager.Info = {}
local szDBName = "T_Server_Info"
---------------------------------------------------------------
function CTimeRewardManager:Create()
	self.objDB = CPlayerDBQuery:GetDBQuery()
	self.szCmdDel = [[delete from "]]..szDBName..[[" where "dwServerHostID" = $1;]];
	self.szCmdInsert = [[insert into "]]..szDBName..[[" values($1,$2);]];
	self.szCmdClear = [[delete from "]]..szDBName..[[";]];
	self.szCmdRead = [[select * from "]]..szDBName..[[" where "dwServerHostID" = $1;]];
	self.szCmdUpdate = [[update "]]..szDBName..[[" set "dwStartTime"=$1 where "dwServerHostID" = $2;]];
	self:DBRead()
	return true;
end
function CTimeRewardManager:Update()
	return true;
end;
function CTimeRewardManager:Destroy()
end;
----------------------------------------------------------------
function CTimeRewardManager:GetServerStartTime()
	return self.Info.dwStartTime or _now()
end

function CTimeRewardManager:SendServerTimeInfo(dwLineID)
	local objLine = CGameLineManager:GetLine(dwLineID)
	if objLine then
		objLine.TimeRewardServerTimeMsg{Info=self.Info}
	else
		for k,objLine in pairs(CGameLineManager:GetAllLine()) do
			objLine.TimeRewardServerTimeMsg{Info=self.Info}
		end
	end
end
----------------------------------------------------------------
function CTimeRewardManager:DBRead()
	local Info = self.objDB:execute(self.szCmdRead,CConfig.Network.dwServerHostID)
	if Info then
		self.Info = Info[1]
		self:SendServerTimeInfo(9999)
		return;
	end
	self:DBInsert()
end

function CTimeRewardManager:DBInsert()
	local dwNowTime = CTimeFormat:GetTodayStartMsec()+1
	self.objDB:execute(self.szCmdInsert,CConfig.Network.dwServerHostID,dwNowTime)
	self.Info = {
		dwServerHostID = CConfig.Network.dwServerHostID;
		dwStartTime = dwNowTime
	}
end





















