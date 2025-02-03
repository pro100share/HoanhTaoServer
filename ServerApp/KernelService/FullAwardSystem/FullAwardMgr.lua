--[[
功能：CFullAwardMgr
类型：继承于CSingle类，
版本：
	v1.0	21:15 2013-11-6 create by qy
]]

_G.CFullAwardMgr = CSingle:new();
CSingleManager:AddSingle(CFullAwardMgr);
--create
function CFullAwardMgr:Create()	
	self.dwFullVersionId = 0;
	self.dwFullVersionTime = 0;
	self.dwFullInfoId = 0;
	self:GetFullVersion();
	return true;
end;
--获得当前首充版号
function CFullAwardMgr:GetFullVersion()
	local res = CPlayerDBQuery:GetDBQuery():execute('select * from "T_Full_Award_Version"');
	local now = _now();
	if not res then
		local szCmd = 'insert into "T_Full_Award_Version" ("dwFullVersionId","dwTime") VALUES($1,$2)';
		CPlayerDBQuery:GetDBQuery():execute(szCmd,_G.FullAwardVersion, now);
		self.dwFullVersionId = _G.FullAwardVersion;
		self.dwFullVersionTime = now;
		local szCmd1 = 'update "T_Role_Full_Award" set "dwAddiAwardPhase" = $1, "dwPerAwardPhase" = $2';
		CPlayerDBQuery:GetDBQuery():execute(szCmd1,0,0);
		for i,objLine in pairs(CGameLineManager:GetAllLine()) do
			if objLine then
				objLine.SetFullAwardInfoMsg{AddiAwardPhase = 0, PerAwardPhase = 0};	
			end;
		end;
	else
		self.dwFullVersionId = res[1].dwFullVersionId;
		self.dwFullVersionTime = res[1].dwTime;
	end;	
end;

--设置新的版本号
function CFullAwardMgr:SetFullVersion(dwLine, dwVersionId)
	local line = CGameLineManager:GetLine(dwLine);
	if self.dwFullVersionId ~= dwVersionId then
		self.dwFullVersionId = dwVersionId;
		self.dwFullVersionTime = _now();
		local szCmd = 'update "T_Full_Award_Version" set "dwFullVersionId" = $1, "dwTime" = $2';
		CPlayerDBQuery:GetDBQuery():execute(szCmd, self.dwFullVersionId,self.dwFullVersionTime);
		local szCmd1 = 'update "T_Role_Full_Award" set "dwAddiAwardPhase" = $1, "dwPerAwardPhase" = $2';
		CPlayerDBQuery:GetDBQuery():execute(szCmd1,0,0);
		for i,objLine in pairs(CGameLineManager:GetAllLine()) do
			objLine.SetFullAwardInfoMsg{AddiAwardPhase = 0, PerAwardPhase = 0};	
		end;
	end;
	if line then
		line.SendFullTimeMsg{FullTime = self.dwFullVersionTime};
	end;
end;
