

_G.CFirstBloodManager = CSingle:new();
--���뵥�������
CSingleManager:AddSingle(CFirstBloodManager);
------------------------------------------------
CFirstBloodManager.Data = {}
CFirstBloodManager.CountData = {}
local fbcfg = FirstBloodConfig
local cncfg = CountNumberConfig



--��ʼ��
function CFirstBloodManager:Create()
	self:Init()
end

function CFirstBloodManager:Update()
end

function CFirstBloodManager:Destroy()
end
------------------------------------------------
--��ʼ������
function CFirstBloodManager:Init()
	for k,v in pairs(fbcfg) do
		self.Data[v.szEventName] = k
	end
	for k,v in pairs(cncfg) do
		self.CountData[v] = k
	end
end

--����¼�id
function CFirstBloodManager:GetEventIndex(szEventName)
	return self.Data[szEventName]
end

--��ü����¼�id
function CFirstBloodManager:GetCountEventIndex(szEventName)
	return self.CountData[szEventName]
end





