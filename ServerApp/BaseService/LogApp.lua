--[[
文件：BaseService/LogApp.lua
类名：CLogApp
功能说明：游戏服务器针对于日志服务器的客户端
备注：
作者：刘科建
版本：v1.0 8/15/2012 热烈庆祝日本投降67周年
修改者：
]]

_G.CLogApp = {};

---------------------------------------
------------CLogApp网络层--------------
---------------------------------------
local onHead, onBody
function onHead(net,head, from, to) 
	local len = string.to32b(head, from)-8;
	if len < 0 or len > 16384 then
		net:close()
		_err('invalid net data',len,head:tostr(from,to));
	end 
	net:receive(len, onBody, 6000000)
end
function onBody(net,data, from, to) 
	net:receive(8, onHead, 6000000)
	--_mycallin(net.objOwner, data, from, to);
end; 

local function reallySend(net,data)
	local len = #data + 8;
	local head = string.from32b(len) .. "\0\0\0\0"; 
	local ok, result = pcall(net.send, net, head)
	if not ok then 
		_err(debug.traceback(resutlt)) 
		return 
	end
	local ok, result = pcall(net.send, net, data)
	if not ok then 
		_err(debug.traceback(resutlt)) 
		return 
	end
end


--新建
function CLogApp:Create(objMonitor)
	self.sConnStr	= "127.0.0.1:";		--连接参数
	self.nNetCounts	= 10;			--需保持网络连接个数
	
	self.setTempNet		= {};		--网络连接暂时引用，以免网络连接被释放
	self.setNets 		= {};		--网络连接集合
	self.nNetNum		= 0;		--具体网络连接个数
	self.nextNetIndex	= 0;		--下一个net index	
	self.nSendNum		= 10;		
	self.lastSendTime 	= _now();	--上一次update驱动的发送消息时间
	
	self.nCallOutIndexSet	= 1;	--发送缓冲set ID
	self.nCallOutIndexGet	= 1; 	--发送缓冲get ID
	self.setMsgCallOut 		= {};	--要发送的消息集合
	self.nDataCounts		= 0;	--消息集合中剩余的消息个数
	
	self.bConnect		= false;
	self.lastConnectTo	= _now();
	
	if self.sConnStr and self.sConnStr ~= "" then
		self.bNeedConnect = true;
	end;
	--监听者
	self.objMonitor = objMonitor;
	
	return true;
end;
--update
function CLogApp:Update(bUpdate)

	if self.bNeedConnect then
		if self.bConnect then
			self:SendCallout();
		else
			self:ConnectTo();
		end;
		
		if self.nDataCounts > 5000 then
			_info("CLogApp MsgPool Over:", self.nDataCounts);
		end;
	end;
	
	return true;
end;

--发送发出去的
function CLogApp:SendCallout()
	local nowTime = _now();
	if nowTime > self.lastSendTime then
		self.lastSendTime = nowTime + 100;
		self.nSendNum = self.nNetNum * (CConfig.Network.dwSocketSendNum or 5);
	end;
	
	local nextData = self.setMsgCallOut[self.nCallOutIndexGet];
	for i=self.nSendNum, 0, -1 do
		self.nSendNum = self.nSendNum - 1;
		if nextData then
			local net = self:GetNet();
			if net then
				reallySend(net, _encode(nextData[1], nextData[2]));
			else
				_err("net counts 0 !!!!");
				return;
			end;
			self.setMsgCallOut[self.nCallOutIndexGet] = nil;
			self.nDataCounts = self.nDataCounts - 1;
			self.nCallOutIndexGet = self.nCallOutIndexGet + 1;
			nextData = self.setMsgCallOut[self.nCallOutIndexGet];
		else
			break;
		end;
	end;
	
end;


function CLogApp:ConnectTo()
	if self.nNetNum >= self.nNetCounts then
		return;
	end;
	if _now() - self.lastConnectTo < 200 then
		return;
	end;
	
	--_info("CLogApp:ConnectTo()----", self.sConnStr, self.nNetNum);
	local socket = _connect(
		self.sConnStr,
		function (socket,ip,port,myip,myport)
			socket:receive(8, onHead, 6000000);
			socket.objOwner = self;
			self:OnNetsConnect(socket);
		end,
		function (socket,ifTimeout,ifNotconn,...)
			--_info("LogApp Net Disconnect....", ifTimeout, ifNotconn, ...);
			self:OnNetsDisconnect(socket);
		end,
		0
	);
	self.setTempNet[socket] = true;
	
	self.lastConnectTo = _now();
end;


function CLogApp:OnNetsConnect(socket)
	self.setTempNet[socket] = nil;
	table.insert(self.setNets, socket);
	self.nNetNum = self.nNetNum + 1;
	if self.nNetNum >= self.nNetCounts then
		self.bConnect = true;
		if self.objMonitor then
			self.objMonitor:OnLogAppConnected();
		end;
	end;
end;
function CLogApp:OnNetsDisconnect(socket)
	self.setTempNet[socket] = nil;
	local pos = 0;
	for k, v in ipairs(self.setNets) do
		if v == socket then
			pos = k;
			break;
		end;
	end;
	if pos > 0 then
		--删除连接
		table.remove(self.setNets, pos);
		self.nNetNum = self.nNetNum - 1;
		if self.nNetNum < self.nNetCounts then
			self.bConnect = false;
		end;
	end;
end;
--获取一个net连接
function CLogApp:GetNet()
	if self.nNetNum > 0 then
		self.nextNetIndex = self.nextNetIndex + 1;
		while self.nextNetIndex > self.nNetNum do
			self.nextNetIndex = self.nextNetIndex - self.nNetNum;
		end;
		return self.setNets[self.nextNetIndex];
	end;
end;

function CLogApp:SendToLogServer(nType, tParam)
	if self.bNeedConnect then
		self.setMsgCallOut[self.nCallOutIndexSet] = {nType, tParam};
		self.nCallOutIndexSet = self.nCallOutIndexSet + 1;
		self.nDataCounts = self.nDataCounts + 1;
	end;
end;



