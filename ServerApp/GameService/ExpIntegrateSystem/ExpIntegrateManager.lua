_G.CExpIntegrateManager = CSingle:new();
CSingleManager:AddSingle(CExpIntegrateManager);


--�洢���ο�������Ϣ
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
------------------------------�ⲿ����---------------------------------------------

function CExpIntegrateManager:UpdateMaxLevel(MaxLevel)
	--print("CExpIntegrateManager:UpdateMaxLevel+++++++++++++++++++++++++++++++++++++++++++++++")
	self.AllServreMaxLevel = MaxLevel;
	
	
	--����������������¼��㾭��ӳ�
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		objPlayer:GetSystem("CExpIntegrateSystem"):CalcExpAddPer();
	end;
	
	--�����пͻ��˷������ȼ���Ϣ
	self:SyncMaxlLevel();
end

--���ͻ��˷������ȼ���Ϣ
function CExpIntegrateManager:SyncMaxlLevel()
	--print("CExpIntegrateManager:SyncMaxlLevel+++++++++++++++++++++++++++++++++++++++++++++++++")
	local setNet = {};
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "SynExpInteMaxLevelMsg", {WorldMaxlLevel = self.AllServreMaxLevel});
end

--�õ�ȫ�����ȼ�
function CExpIntegrateManager:GetMaxLevel()
	return self.AllServreMaxLevel;
end