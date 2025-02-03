--[[
	消息缓冲处理
	周长沙
	2012-6-29
--]]
_G.CNetQueue = {}--链表
CNetQueue[1] = nil--表头
CNetQueue[2] = nil--表尾
----------------------------------------------
local PlayerQueue = {}
----------------------------------------------
local CNode = {}--节点
--新建一个节点
function CNode:new(fun,param,net)
	local obj = {}
	for k,v in pairs(CNode) do
		obj[k] = v
	end
	obj.fun = fun
	obj.param = param
	obj.net = net
	obj.pNext = nil
	return obj
end
--设置指向下一个节点
function CNode:SetNext(node)
	self.pNext = node
	return node
end
--执行本节点函数
function CNode:Do()
	if not PlayerQueue[self.net] then
		return (self.pNext and self.pNext:Do())
	else
		table.remove(PlayerQueue[self.net],1)
	end
	local net = _G._from
	_G._from = self.net;
	local bRes, dbres=pcall(function() return self.fun(self.param) end);
	if not bRes then
		print("[netError]",dbres);
	end;
	_G._from = net
	return self.pNext
end
----------------------------------------------
--获取一次循环处理的节点数量
function CNetQueue:GetCount()
	return _G.NetQueueCount;
end
--更新
function CNetQueue:Update()
	for i=1,self:GetCount() do
		if not self:Do() then
			return;
		end
	end
	if self[1] then
		print("more then "..self:GetCount().." msg in this update!!")
	end
end
--插入一个节点
function CNetQueue:Insert(fun,param,net)
	local node = CNode:new(fun,param,net)
	if not PlayerQueue[net] then
		PlayerQueue[net] = {}
	end
	table.insert(PlayerQueue[net],node)
	if not self[1] then
		self[1] = node
		self[2] = node
		return;
	end
	self[2] = self[2]:SetNext(node)
end
--处理队列的第一个节点
function CNetQueue:Do()
	if self[1] then
		self[1] = self[1]:Do()
		if not self[1] then
			self[2] = nil
		end
		return true
	end
	return false;
end
----------------------------------------------
--玩家断线时
function CNetQueue:OnDisconnect(objNet)
	if PlayerQueue[objNet] then
		for k,v in pairs(PlayerQueue[objNet]) do
			local net = _G._from
			_G._from = v.net;
			local bRes, dbres=pcall(function() return v.fun(v.param) end);
			if not bRes then
				print("error:",dbres);
			end;
			_G._from = net
		end
		PlayerQueue[objNet] = nil
	end
end











