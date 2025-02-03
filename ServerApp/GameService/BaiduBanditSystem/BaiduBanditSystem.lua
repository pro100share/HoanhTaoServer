_G.CBaiduBanditSystem = {}
-----------------------------------------------------------------------------
function CBaiduBanditSystem:new()
	local obj = CSystem:new("CBaiduBanditSystem");
	for i,v in pairs(CBaiduBanditSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
-----------------------------------------------------------------------------
function CBaiduBanditSystem:Create()
	local objPlayer = self:GetPlayer();
	local tabData = objPlayer:GetLineData("CBaiduBanditSystem")
	tabData = tabData or {}
	local tabInfo = tabData[1] or {}
	self.dwItemID = tabInfo.dwItemID
	self.dwReward = tabInfo.dwReward
	return true
end
function CBaiduBanditSystem:Update(dwInterval)
	return true
end
function CBaiduBanditSystem:Destroy()
	if self.dwReward then self:Send() end
	return true
end
function CBaiduBanditSystem:OnChangeLineBegin(dwNewLineID)
	--[[
	local objPlayer = self:GetPlayer()
	local tabData = {}
	tabData.dwItemID = self.dwItemID
	tabData.dwReward = self.dwReward
	objPlayer:SetLineData("CBaiduBanditSystem",tabData)
	--]]
end


--启动换线时候的检查
function CBaiduBanditSystem:OnChangeLineCheck(dwNewLineID)
	if self.dwReward then
		return false
	end
	return true
end;

-----------------------------------------------------------------------------
function CBaiduBanditSystem:Use(dwItemID)
	--if self.dwItemID then return end
	if self.dwReward then return end
	local objSystem = self:GetPlayer():GetSystem('CItemSystem')
	local objItem = objSystem:GetItem(dwItemID)
	if not objItem then return end
	self.dwItemID = dwItemID
	self:GetPlayer().OnShowBaiduBanditMsg{ ItemID = dwItemID }
end
function CBaiduBanditSystem:Start()
	if not self.dwItemID then return end
	if self.dwReward then return end
	local objSystem = self:GetPlayer():GetSystem("CItemSystem")
	local objItem = objSystem:GetItem(self.dwItemID)
	if not objItem then return end
	local dwProbability = 0
	for dwIndex,tabItem in pairs(BaiduBanditConfig.Reward) do
		dwProbability = dwProbability + tabItem.dwProbability
	end
	local dwReward,dwResult = 1,math.random(0,dwProbability)
	local dwProbability = 0
	for dwIndex,tabItem in pairs(BaiduBanditConfig.Reward) do
		dwProbability = dwProbability + tabItem.dwProbability
		if dwResult <= dwProbability then
			dwReward = dwIndex
			break
		end
	end
	objSystem:DelItemNumber(self.dwItemID,1,ItemSysOperType.Used)
	self.dwItemID = nil
	self:GetPlayer().OnRunBaiduBanditMsg{ Target = dwReward }
	self.dwReward = dwReward
end
function CBaiduBanditSystem:End()
	if self.dwItemID then return end
	if not self.dwReward then return end
	local tabCfg = BaiduBanditConfig.Reward[self.dwReward]
	if not tabCfg then return end
	local tabItem = {}
	tabItem.dwItemEnum = tabCfg.dwItemEnum
	tabItem.dwItemNumber = tabCfg.dwItemNumber
	tabItem.dwBindType = enItemBindType.eYes
	local objSystem = self:GetPlayer():GetSystem("CItemSystem")
	local bResult = objSystem:AddEnumItemListToPacket(
		{ tabItem }, ItemSysOperType.Bandit
	)
	if not bResult then self:Send() end
	self.dwReward = nil
end
function CBaiduBanditSystem:Send()
	if not self.dwReward then return end
	local tabCfg = BaiduBanditConfig.Reward[self.dwReward]
	if not tabCfg then return end
	local tabItem = SItemMessage:new()
	tabItem.dwItemEnum = tabCfg.dwItemEnum
	tabItem.dwItemNumber = tabCfg.dwItemNumber
	tabItem.dwBindType = enItemBindType.eYes
	local objMail = CMail:new()
	local tabString = BaiduBanditConfig.String
	objMail:SetSender( -10086, tabString[1] )
	local tabInfo = self:GetPlayer():GetInfo()
	objMail:SetReceiver( tabInfo.dwRoleID, self.szRoleName )
	objMail:SetContent( tabString[2],tabString[3] )
	objMail:SetLifeTime( SMailInfo.life*24*60*60*1000 )
	objMail:SetAccessory( 0, 0, 0, { tabItem } )
	CMailManager:SendMail( objMail )
	return true
end
-----------------------------------------------------------------------------