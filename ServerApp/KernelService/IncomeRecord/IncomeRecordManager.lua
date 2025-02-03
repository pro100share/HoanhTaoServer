_G.CIncomeRecordManager = {}
CIncomeRecordManager.Record = {}
--------------------------------------------------
local Node = {}
function Node:new()
	local obj = {}
	for k,v in pairs(Node) do
		obj[k] = v
	end
	obj.exp 	= 0	--经验
	obj.jin 	= 0	--金
	obj.mu 		= 0	--木
	obj.shui	= 0	--水
	obj.huo		= 0	--火
	obj.tu		= 0 --土
	obj.ri		= 0	--日环
	obj.zhou	= 0	--周环
	obj.shi		= 0	--世家
	obj.mo		= 0	--怪
	obj.bo		= 0	--boss
	obj.fb		= 0	--fb
	obj.time	= 0	--
	return obj
end
function Node:Set(Data)
	self.exp 	= Data.exp
	self.jin 	= Data.jin
	self.mu 	= Data.mu
	self.shui	= Data.shui
	self.huo	= Data.huo
	self.tu		= Data.tu
	self.ri		= Data.ri
	self.zhou	= Data.zhou
	self.shi	= Data.shi
	self.mo		= Data.mo
	self.bo		= Data.bo
	self.fb		= Data.fb
	self.time	= Data.time
end
function Node:Get()
	local Data = {}
	Data.exp 	= self.exp
	Data.jin 	= self.jin
	Data.mu 	= self.mu
	Data.shui	= self.shui
	Data.huo	= self.huo
	Data.tu		= self.tu
	Data.ri		= self.ri
	Data.zhou	= self.zhou
	Data.shi	= self.shi
	Data.mo		= self.mo
	Data.bo		= self.bo
	Data.fb		= self.fb
	Data.time	= self.time
	return Data
end
--------------------------------------------------

function CIncomeRecordManager:Ask(objPlayer,RoleID)
	if not self.Record[RoleID] then
		self.Record[RoleID] = Node:new()
	end
	self:Send(objPlayer,RoleID)
end

function CIncomeRecordManager:Rcv(objPlayer,RoleID,Data)
	if not self.Record[RoleID] then
		self.Record[RoleID] = Node:new()
	end
	self.Record[RoleID]:Set(Data)
end

function CIncomeRecordManager:Send(objPlayer,RoleID)
	-- local Data = self:GetData(RoleID)
	-- objPlayer.GSRecvKSDataMsg{Data=Data}
end

function CIncomeRecordManager:GetData(RoleID)
	return self.Record[RoleID]:Get()
end