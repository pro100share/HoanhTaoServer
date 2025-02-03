--[[
功能：Gs首充管理器
类型：继承于CSingle类，
版本：
	v1.0	21:15 2013-11-6	create by qy
]]

_G.CFullAwardManager = CSingle:new();
CSingleManager:AddSingle(CFullAwardManager, true);
--create
function CFullAwardManager:Create()	
	self.dwVersionId = _G.FullAwardVersion;
	self.dwVersionTime = 0;
	self.dwLastTime = 0;
	self.dwUpdateTime = 60000;
	self:SynFullVersionOnCreate();
	return true;
end;

function CFullAwardManager:SynFullVersionOnCreate()
	CKernelApp.SetKsFullVersionMsg{Line = CKernelApp.dwLineID, VersionId = self.dwVersionId};
end;

--活动充值版本号
function CFullAwardManager:GetFullVersionId()
	return self.dwVersionId;
end;
--活动充值版本开始时间
function CFullAwardManager:GetFullVersionTime()
	return self.dwVersionTime;
end;

function  CFullAwardManager:SetFullTime(dwTime)
	self.dwVersionTime = dwTime;
end;

function CFullAwardManager:Update(dwInter)
	local now = GetCurTime();
	if not self.dwLastTime then
		self.dwLastTime = GetCurTime();
	end;
	if now - self.dwLastTime >= self.dwUpdateTime then
		if self.dwVersionId ~= _G.FullAwardVersion then
			self.dwVersionId = _G.FullAwardVersion;
			CKernelApp.SetKsFullVersionMsg{Line = CKernelApp.dwLineID, VersionId = self.dwVersionId};
			local onlinePlayerTbl = CPlayerManager.setAllPlayer;
			for id, player in pairs(onlinePlayerTbl) do
				if player then
					player.SendFullConfigMsg{FullAwardConfig = _G.FullAwardConfig.reward, FullAwardInfo = _G.FullAwardInfo};
				end;
			end;
		end;
		self.dwLastTime = GetCurTime();
	end;
end;
--设置首充奖励领取情况
function CFullAwardManager:SetFullAwardInfo(addiAwardPhase, perAwardPhase)
	local onlinePlayerTbl = CPlayerManager.setAllPlayer;
	local setNet = {}; 
	for id, player in pairs(onlinePlayerTbl) do
		if player and player:GetSystem("CFullAwardSys") then
			player:GetSystem("CFullAwardSys"):SetFullInfo(addiAwardPhase, perAwardPhase);
		end;
	end;
end;
