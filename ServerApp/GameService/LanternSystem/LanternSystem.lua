--[[

]]
-------------------------------------
_G.CLanternSystemSystem = {}
-------------------------------------
local dwBindType = enItemBindType.eYes
local Notice = LanternConfig.Notice
local dwSystemID = 2222
local dwSystemID1 = 2223
-------------------------------------
-------------------------------------
function CLanternSystemSystem:new()
	local obj = CSystem:new("CLanternSystemSystem");
	---------------------------------------------
	---------------------------------------------
	for i,v in pairs(CLanternSystemSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CLanternSystemSystem:Create(IsChangeLine)
	return true;
end

function CLanternSystemSystem:Update(dwInterval)
	return true
end

function CLanternSystemSystem:Destroy()
	return true
end

--获取更新系统
function CLanternSystemSystem:GetRefresh()
	local objPlayer = self:GetPlayer()
	local sysRefresh = objPlayer:GetSystem("CRefreshSystem")
	return sysRefresh
end
----------------------------------------------------
function CLanternSystemSystem:AddScore()--答对加分
	local dwScore = self:GetScore()
	--add lkj
	if dwScore >= LanternConfig.dwMaxScore then
		self:Notice(12);
		return;
	end;
	dwScore = dwScore + LanternConfig.dwScore
	if dwScore > LanternConfig.dwMaxScore then
		dwScore = LanternConfig.dwMaxScore;
		self:Notice(12);
	end;
	--add over
	self:SetScore(dwScore)
	self:Notice(2)
	
	if not self:Give() then
		self:Notice(7)
	end
end

function CLanternSystemSystem:AddScoreEx()--答对加分（双倍）
	local dwScore = self:GetScore()
	--add lkj
	if dwScore >= LanternConfig.dwMaxScore then
		self:Notice(12);
		return;
	end;
	dwScore = (dwScore + LanternConfig.dwScore) * 2
	if dwScore > LanternConfig.dwMaxScore then
		dwScore = LanternConfig.dwMaxScore;
		self:Notice(12);
	end;
	
	self:SetScore(dwScore)
	self:Notice(1)
	
	if not self:Give() then
		self:Notice(7)
	end
end

function CLanternSystemSystem:AddNoScore()--答错
	self:Notice(3)
end

function CLanternSystemSystem:ClearScore()--假花灯扣分
	self:SetScore(0)
	self:Notice(4)
end

function CLanternSystemSystem:HalfScore()--假花灯扣一半分
	local dwScore = math.floor(self:GetScore()/2)
	
	self:SetScore(dwScore)
	self:Notice(5)
end

function CLanternSystemSystem:FullScore()--假花灯不扣分
	self:Notice(6)
end

function CLanternSystemSystem:Notice(dwID)--弹提示
	local objPlayer = self:GetPlayer();
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	
	local szStr = string.format(Notice[dwID],self:GetScore())
	sysScript:Notice(szStr)
end

function CLanternSystemSystem:Give()--给花灯
	local objPlayer = self:GetPlayer();
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local dwItemID = LanternConfig.Item[0]
	
	if not sysScript:AddPackItem(dwItemID,1,dwBindType) then
		local cfg = LanternConfig.Mail
		local item = {
			dwItemEnum = dwItemID;
			dwItemNumber = 1;
			dwBindType = dwBindType;
		}
		
		local objMail = CMail:new()
		objMail:SetSender( -10086, cfg.szSender )
		objMail:SetContent( cfg.szTitle, cfg.szContent )
		objMail:SetAccessory( 0, 0, 0, {item} )
		sysScript:SendMail(objMail)
	end
	return true
end
----------------------------------------------------
function CLanternSystemSystem:ExChange(dwIndex)--兑换
	local cfg = LanternConfig.ExChange[dwIndex]
	if not cfg then
		_err("No This Item IN LanternConfig.ExChange:",dwIndex)
		return
	end
	--add lkj
	if self:GetExchangeState(dwIndex) then
		self:Notice(11);
		return;
	end;
	--add over
	local dwScore = self:GetScore()
	if dwScore<cfg[2] then
		self:Notice(8)
		return
	end
	local objPlayer = self:GetPlayer()
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if not sysScript:AddPackItem(cfg[1],1,dwBindType) then
		self:Notice(9)
	end
	self:SetScore(dwScore-cfg[2])
	--add lkj
	self:SetExchangeState(dwIndex);
	--add over
	self:Notice(10)
end

function CLanternSystemSystem:GetScore()--查看分数
	return self:GetRefresh():GetData(dwSystemID)
end

function CLanternSystemSystem:SetScore(dwValue)--修改分数
	return self:GetRefresh():SetData(dwSystemID,dwValue)
end

----
--add by lkj
local bitvalue = {
	[1] = 1;
	[2] = 2;
	[3] = 4;
}
function CLanternSystemSystem:GetExchangeState(dwIndex)
	if not bitvalue[dwIndex] then return true end;
	local temp = {};
	local value = self:GetRefresh():GetData(dwSystemID1);
	for i=#bitvalue, 1, -1 do
		if value >= bitvalue[i] then
			temp[i] = true;
			value = value - bitvalue[i];
		end;
	end;
	return temp[dwIndex];
end;

function CLanternSystemSystem:SetExchangeState(dwIndex)
	local refresh = self:GetRefresh();
	local value = refresh:GetData(dwSystemID1);
	value = value + bitvalue[dwIndex];
	refresh:SetData(dwSystemID1, value)
end;
--add over
----

----------------------------------------------------

function CLanternSystemSystem:OnRecvOpen(dwUse,dwID)
	local objPlayer = self:GetPlayer();
	local dwRoleID = objPlayer:GetRoleID()
	LanternConfig:Open(dwID,dwRoleID,dwUse,objPlayer,self)
end

function CLanternSystemSystem:OnRecvAns(dwAns,dwID)
	local objPlayer = self:GetPlayer();
	local dwRoleID = objPlayer:GetRoleID()
	if dwAns==1 then
		LanternConfig:Right(dwID,dwRoleID,objPlayer,self)
	else
		LanternConfig:Wrong(dwID,dwRoleID,objPlayer,self)
	end
end







