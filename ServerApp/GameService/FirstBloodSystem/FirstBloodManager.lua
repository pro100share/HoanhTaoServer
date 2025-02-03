

_G.CFirstBloodManager = CSingle:new();
--插入单体管理器
CSingleManager:AddSingle(CFirstBloodManager);
------------------------------------------------
CFirstBloodManager.Data = {}
CFirstBloodManager.CountData = {}
local fbcfg = FirstBloodConfig
local cncfg = CountNumberConfig



--初始化
function CFirstBloodManager:Create()
	self:Init()
end

function CFirstBloodManager:Update()
end

function CFirstBloodManager:Destroy()
end
------------------------------------------------
--初始化配置
function CFirstBloodManager:Init()
	for k,v in pairs(fbcfg) do
		self.Data[v.szEventName] = k
	end
	for k,v in pairs(cncfg) do
		self.CountData[v] = k
	end
end

--获得事件id
function CFirstBloodManager:GetEventIndex(szEventName)
	return self.Data[szEventName]
end

--获得计数事件id
function CFirstBloodManager:GetCountEventIndex(szEventName)
	return self.CountData[szEventName]
end





