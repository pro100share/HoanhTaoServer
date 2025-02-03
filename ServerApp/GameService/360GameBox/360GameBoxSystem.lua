--[[

]]
-------------------------------------
_G.C360GameBoxSystem = {}
-------------------------------------
local dwSystemID = GameBox360Config.dwIndex
-------------------------------------
-------------------------------------
function C360GameBoxSystem:new()
	local obj = CSystem:new("C360GameBoxSystem");
	---------------------------------------------
	---------------------------------------------
	for i,v in pairs(C360GameBoxSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function C360GameBoxSystem:Create(IsChangeLine)
	return true;
end

function C360GameBoxSystem:Update(dwInterval)
	return true
end

function C360GameBoxSystem:Destroy()
	return true
end

--获取更新系统
function C360GameBoxSystem:GetRefresh()
	local objPlayer = self:GetPlayer()
	local sysRefresh = objPlayer:GetSystem("CRefreshSystem")
	return sysRefresh
end

function C360GameBoxSystem:GetScore()--查看分数
	return self:GetRefresh():GetData(dwSystemID)
end

function C360GameBoxSystem:SetScore(dwValue)--修改分数
	return self:GetRefresh():SetData(dwSystemID,dwValue)
end
--------------------------------------------------------------------------------------
function C360GameBoxSystem:CheckReward()
	local dwRes = self:GetScore()
	if dwRes == 1 then
		self:SendRes(4)
		return false;
	end
	local Item = GameBox360Config.Item
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem")
	if not sysItem:IsEnumItemListCanAddToPacket(Item) then
		self:SendRes(2)
		return false;
	end
	return true
end

function C360GameBoxSystem:GiveReward()
	local Item = GameBox360Config.Item
	local objPlayer = self:GetPlayer()
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if not sysScript:AddItem(Item,0,0,enItemPosition.ePacket) then
		self:SendRes(2)
		return;
	end
	self:SetScore(1)
	self:SendRes(3)
end
-----------------------------------------------------------------------------------
function C360GameBoxSystem:OnRecvAskForRes()
	self:SendRes(self:GetScore())
end

function C360GameBoxSystem:OnRecvAskForReward()
	if self:CheckReward() then
		self:GiveReward()
	end
end
---------------------------------------------------------------------------------------
function C360GameBoxSystem:SendRes(dwRes)
	local objPlayer = self:GetPlayer()
	objPlayer.Syn360GameBoxInfoMsg{Res=dwRes}
end






