
_G.CRewardCodeSystem = {}
local cfgCode = RewardCodeConfig
local cfgReward = RewardTypeConfig
------------------------------------------------------------------------------------------
function CRewardCodeSystem:new()
	local obj = CSystem:new("CRewardCodeSystem");
	for k,v in pairs(CRewardCodeSystem) do
		if type(v)=="function" then
			obj[k] = v
		end
	end
	return obj
end
function CRewardCodeSystem:Create()
	self.bWaite = false
	return true
end
function CRewardCodeSystem:Update()
	return true
end
function CRewardCodeSystem:Destroy()
	return true
end
--------------------------------------------------------------------------------------------
--Clt请求领奖
function CRewardCodeSystem:CltAskForGet(szCode)
	if self.bWaite then
		return
	end
	if string.len(szCode) > 100 then
		self:CltSendRes(4)
		return
	end
	self:KSAskForCheck(dwType,szCode,dwTeam)
	--[[
	local dwType = cfgCode[szCode]
	if dwType then
		local dwTeam = cfgReward[dwType].dwTeam or dwType
		self:KSAskForCheck(dwType,szCode,dwTeam)
	else--改领取码不存在
		self:CltSendRes(4)
	end
	--]]
	self:GetPlayer():GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventRewardCDKey,1)
end
--KS返回是否可领奖
function CRewardCodeSystem:RecvKSRes(dwRes,dwType,szCode)
	self.bWaite = false
	if dwRes~=0 then
		self:CltSendRes(dwRes)
		return;
	else
		local Item = cfgReward[dwType]
		local objPlayer = self:GetPlayer()
		if objPlayer then 
			local sysScript = objPlayer:GetSystem("CScriptSystem")
			if sysScript:AddPackItem(Item.dwItemEnum,Item.dwItemNumber,Item.dwBindType) then
				----add by lkj 2013-07-17
				local comgiftSys = objPlayer:GetSystem("CCommercialGiftSys");
				if comgiftSys then
					comgiftSys:GetGift(dwType);
				end;
				----add end
				self:CltSendRes(0)
				self:KSSendRes(0,dwType,szCode)
				return 0
			else--背包空间不足
				self:CltSendRes(3)
				self:KSSendRes(3,dwType,szCode)
			end
		else--找不到玩家
			self:KSSendRes(-1,dwType,szCode)
		end
	end
end
--------------------------------------------------------------------------------------------
--向KS发送领奖请求
function CRewardCodeSystem:KSAskForCheck(dwType,szCode,dwTeam)
	self.bWaite = true
	local objPlayer = self:GetPlayer()
	CKernelApp.KSRewardCodeAskForCheckMsg{_aid=objPlayer:GetAccountID(),Info={dwType,szCode,dwTeam}};
end
--向KS发送领奖结果
function CRewardCodeSystem:KSSendRes(dwRes,dwType,szCode)
	local objPlayer = self:GetPlayer()
	CKernelApp.KSRewardCodeAskForGetMsg{_aid=objPlayer:GetAccountID(),Info={dwRes,dwType,szCode}};
end
--向Clt返回领奖结果
function CRewardCodeSystem:CltSendRes(dwRes)
	local objPlayer = self:GetPlayer()
	objPlayer.RewardCodeOnResMsg{Res=dwRes}
end
