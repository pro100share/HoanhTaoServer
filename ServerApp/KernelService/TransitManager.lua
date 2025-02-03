--[[
	KS �ϵ�������תվ
--]]
_G.CTransitManager = {
	setChangeLineDataOK = {};
	setChangeLineClientOK = {};
}
-----------------------------------------

-----------------------------------------
CTransitManager.Send = {}
-----------------------------------------
function CTransitManager:Create()
	return true
end
function CTransitManager:Update(e)
	return true
end
function CTransitManager:Destroy()
	return true
end
-----------------------------------------

-- define.LIS_UpdateLineDataMsg
-- {
    -- AccountID   = 0;
    -- SystemName  = "";
    -- Data        = {};
-- }
-- when{}
-- function LIS_UpdateLineDataMsg(AccountID, SystemName, Data)
    -- CTransitManager:AddPlayerData(AccountID, SystemName, Data)
-- end;



--�����跢�͵��������
function CTransitManager:AddPlayerData(dwAccountID,szSystemName,vData)
	if not self.Send[dwAccountID] then
		self.Send[dwAccountID] = {}
	end
	table.insert(self.Send[dwAccountID],{szSystemName=szSystemName,vData=vData})
end
--�����������
function CTransitManager:SendPlayerData(ObjNet,dwAccountID)
	local Info = self.Send[dwAccountID]
	if not Info then return end
	for k,v in pairs(Info) do
		ObjNet.GSOnRecvTransitDataMsg{AccountId=dwAccountID,SystemName=v.szSystemName,Data=v.vData};
	end
	self:ClearData(dwAccountID)
end
--����������
function CTransitManager:ClearData(dwAccountID)
	self.Send[dwAccountID] = nil;
	self.setChangeLineClientOK[dwAccountID] = nil;
	self.setChangeLineDataOK[dwAccountID] = nil;
end

-- define.GSSendChangeLineDataEndMsg
-- {
	-- AccountID = 0;
-- }
-- when{}
-- function GSSendChangeLineDataEndMsg(AccountID)
	-- CTransitManager:ChangeLineDataOK(AccountID);
-- end;

-- function CTransitManager:ChangeLineDataOK(AccountID)
	-- _info("***changelinedataok***", AccountID);
	-- if self.setChangeLineClientOK[AccountID] then
		-- self.setChangeLineClientOK[AccountID] = nil;
		-- CGameLineManager:CreatePlayerSystemByChange(AccountID)
	-- else
		-- self.setChangeLineDataOK[AccountID] = true;
	-- end;
-- end;

function CTransitManager:ChangeLineClientOK(AccountID)
	_info("***changelineclientok***", AccountID);
	CGameLineManager:CreatePlayerSystemByChange(AccountID);
	-- if self.setChangeLineDataOK[AccountID] then
		-- self.setChangeLineDataOK[AccountID] = nil;
		
	-- else
		-- self.setChangeLineClientOK[AccountID] = true;
	-- end;
end;

------------------------------------------------------------------
function CTransitManager:CrossLineClientOK(AccountID)
	CGameLineManager:CreatePlayerSystemByChange(AccountID);
end;



