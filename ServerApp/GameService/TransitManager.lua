--[[
	KS 上的数据中转站
--]]
_G.CTransitManager = {}
----------------------------------------------
define.GSOnRecvTransitDataMsg
{
	AccountId = 0;
	SystemName = "";
	Data = {};
}
when{}
function GSOnRecvTransitDataMsg(AccountId,SystemName,Data)
	CTransitManager:RecvData(AccountId,SystemName,Data)
end
----------------------------------------------
local PlayerData = {}
function PlayerData:new(dwType)
	local obj = {}
	obj.dwType = dwType;
	obj.setPlayerFun = {}
	obj.setPlayerData = {}
	obj.setRcevData = {}
	obj.setSendData = {}
	return obj;
end
----------------------------------------------
CTransitManager.Send = {}
CTransitManager.fps = 60;
CTransitManager.Rcev = {}
function CTransitManager:Create()
	return true
end
 
function CTransitManager:Update(e)
	local sendOver = {};
	for dwAccountID, playerData in pairs(self.Send) do
		if playerData.bReady then
			if #playerData.setSendData > 0 then
				local sendData = playerData.setSendData[1];
				if CKernelApp.objNet then
					_callouttoline(CKernelApp.objNet, "GSOnRecvTransitDataMsg", {AccountId=dwAccountID,SystemName=sendData.szSystemName,Data=sendData.vData}, playerData.dwChangeToLineID);
					table.remove(playerData.setSendData, 1);
				end;
			else
				table.insert(sendOver, dwAccountID);
			end;
		end;
	end;
	
	for _, dwAccountID in ipairs(sendOver) do
		CKernelApp.GSSendChangeLineDataEndMsg{AccountID = dwAccountID};
		pcall(self.Send[dwAccountID].setPlayerFun);
		CPlayerManager.CurPlayerNum = CPlayerManager.CurPlayerNum - 1;
		CTransitManager:ClearData(dwAccountID);
		CLoginDataManager:ClearData(dwAccountID);
	end;
	
	return true
end
function CTransitManager:Destroy()
	return true
end
-------------------------------------
----插入需发送的玩家数据
-- function CTransitManager:AddPlayerData(dwAccountID,szSystemName,vData)
	-- if not self.Send[dwAccountID] then
		-- self.Send[dwAccountID] = PlayerData:new(1)
	-- end
	-- table.insert(self.Send[dwAccountID].setPlayerData,{szSystemName=szSystemName,vData=vData})
-- end
----开始发送数据
-- function CTransitManager:SendPlayerData(dwAccountID,funWhenComplete,dwChangeToLineID)
	-- if not self.Send[dwAccountID] then
		-- self.Send[dwAccountID] = PlayerData:new(1)
	-- end
	-- self.Send[dwAccountID].setSendData = self.Send[dwAccountID].setPlayerData
	-- self.Send[dwAccountID].setPlayerFun = funWhenComplete
	-- if CKernelApp.objNet then
		-- for _, sendData in ipairs(self.Send[dwAccountID].setSendData) do
			--_callouttoline("GSOnRecvTransitDataMsg", {AccountId=dwAccountID,SystemName=sendData.szSystemName,Data=sendData.vData}, dwChangeToLineID);
		-- end;
		-- CKernelApp.GSSendChangeLineDataEndMsg{AccountID = dwAccountID};
	-- end;
	-- pcall(self.Send[dwAccountID].setPlayerFun);
-- end


----------------------------
function CTransitManager:RecvData(dwAccountID,szSystemName,vData)
	if not self.Rcev[dwAccountID] then
		self.Rcev[dwAccountID] = PlayerData:new(2)
	end
	if not self.Rcev[dwAccountID].setRcevData[szSystemName] then
		self.Rcev[dwAccountID].setRcevData[szSystemName] = {}
	end
	table.insert(self.Rcev[dwAccountID].setRcevData[szSystemName],vData)
end
----------------------------
function CTransitManager:GetData(dwAccountID,szSystemName)
	if self.Rcev[dwAccountID] then
		return self.Rcev[dwAccountID].setRcevData[szSystemName]
	end
end
function CTransitManager:ClearData(dwAccountID)
	self.Send[dwAccountID] = nil
	self.Rcev[dwAccountID] = nil
end
-----------------------------





















