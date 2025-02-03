_G.CExpIntegrateManager = CSingle:new();
CSingleManager:AddSingle(CExpIntegrateManager);


--存储本次开奖的信息
CExpIntegrateManager.AllServreMaxLevel = _G.ExpIntegrateConfig.InitAllSMaxLevel;

function CExpIntegrateManager:Create()
	return true
end


function CExpIntegrateManager:RequestInitInfoFromKS()
	CKernelApp.OnReqExpIntegrateMsg
	{
		LineID = CKernelApp.dwLineID;
	}
end;

function CExpIntegrateManager:OnKSReConnect()
	--print("CExpIntegrateManager:OnKSReConnect+++++++++++++++++++++++++++++++++++++++++++")
	self:RequestInitInfoFromKS();
end;

function CExpIntegrateManager:OnKSConnect()
	--print("CExpIntegrateManager:OnKSConnect+++++++++++++++++++++++++++++++++++++++++++++")
	self:RequestInitInfoFromKS();
end;


-----------------------------------------------------------------------------------------
------------------------------外部函数---------------------------------------------

function CExpIntegrateManager:UpdateMaxLevel(MaxLevel)
	--print("CExpIntegrateManager:UpdateMaxLevel+++++++++++++++++++++++++++++++++++++++++++++++")
	self.AllServreMaxLevel = MaxLevel;
	
	
	--服务器所有玩家重新计算经验加成
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		objPlayer:GetSystem("CExpIntegrateSystem"):CalcExpAddPer();
	end;
	
	--给所有客户端发送最大等级消息
	self:SyncMaxlLevel();
end

--给客户端发送最大等级消息
function CExpIntegrateManager:SyncMaxlLevel()
	--print("CExpIntegrateManager:SyncMaxlLevel+++++++++++++++++++++++++++++++++++++++++++++++++")
	local setNet = {};
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "SynExpInteMaxLevelMsg", {WorldMaxlLevel = self.AllServreMaxLevel});
end

--得到全服最大等级
function CExpIntegrateManager:GetMaxLevel()
	return self.AllServreMaxLevel;
end