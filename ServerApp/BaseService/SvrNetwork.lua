local _mycallout,_mycallin,onHead,onBodyMain,onBodyOther,reallySend,ProcGeneralMsg,ProcTransMsg; 
------------------------------------------------------------------------------------------------
-----------------------------网络底层排序管理器----------------------------------------
------------------------------------------------------------------------------------------------
_G.CSvrApp = {}
--netApp组
function CSvrApp:New(sName,groupID)
	local obj = {};
	obj.nGroupID  = groupID ; --有服务器统一分配
	obj.sName		= sName;	--名称
	
	
	obj.nCallOutIndexSet	= 1; --发送缓冲set ID
	obj.nCallOutIndexGet	= 1; --发送缓冲get ID
	obj.setMsgCallOut = {};	--要发送的消息集合 
	obj.nRecvIndex = 1;		--接收消息ID
	obj.setMsgCallIn = {};	--接收到的消息集合
	
	obj.nInCounts = 0;
	obj.nWaitIndex	= 0;
	obj.nWaitTime	= 0;
	obj.nRealWaitTime = 0;
	
	obj.setNets = {};		--组内网络集合
	obj.nNetNum = 0;
	obj.nSendNum = 10;
	obj.lastSendTime = _now();
	obj.nNextNetIndex = 0;	--下一个要使用的网络索引
	
	--方法拷贝
	for k, v in pairs(CSvrApp) do
		if type(v) == "function" then
			obj[k] = v;
		end;
	end; 
	return obj;
end; 
--update
function CSvrApp:Update(bUpdate) 
	self.bUpdate = bUpdate;
	--先执行 
	self:ExecuteRecv();
	--再发送
	self:SendCallout(); 
	return true;
end;  

--获取可用net
function CSvrApp:GetNet()
	if self.nNetNum > 0 then
		self.nNextNetIndex = self.nNextNetIndex + 1;
		while self.nNextNetIndex > self.nNetNum do
			self.nNextNetIndex = self.nNextNetIndex - self.nNetNum;
		end;
		return self.setNets[self.nNextNetIndex]; 
	end;
end; 

----------------------------------------------------------------------------------------
--主动连接的情况 
----------------------------------------------------------------------------------------
define.AsyncMainConnect{Obj={}}
when{}
function AsyncMainConnect(Obj)
	Obj:MainConnectTo();
end;

function CSvrApp:ConnectTo(sConnStr, objOwner, remoteMsgList, nNetCounts)
	self.setTempNet = {};
	self.sConnStr	= sConnStr;  
	self.objOwner	= objOwner;			--拥有者 
	self.RemoteMsgList = remoteMsgList;	--对端消息协议 
	self.nNetCounts	= nNetCounts;	--需保持网络连接个数
	self.lastHeartBeatTime = _now() + 60000; --心跳
	AsyncMainConnect{_delay=0.1,Obj=self}; 
	--self:MainConnectTo();
end;

--服务器层网络客户端连接到指定服务器
function CSvrApp:MainConnectTo()
	_info("connect to ", self.sConnStr);
	self.objMainNet = _connect(
		self.sConnStr,
		function (objMainNet,ip,port,myip,myport)
			objMainNet.dwWaitTime = 6000000;
			objMainNet:receive(8,onHead,objMainNet.dwWaitTime);
			reallySend(objMainNet,_encode(SortMsgDefine.EnterGameRequest,{_G.DBSvrMsgID, self.nGlobalID}));
			objMainNet.objOwner = self;
			objMainNet.onBody = onBodyMain;
			_info("CSvrApp main net connect1111",self.nGlobalID);
		end,
		function (objMainNet,ifTimeout,ifNotconn,...)
			_err("MainSocket Disconnect....",ifTimeout,ifNotconn,...);
			self.bMainConnected = false;
			_info("CSvrApp main net disconnect !!!");
			self.objOwner:OnDisconnect(); --主连接断开，调用外部
		end,
		0 
	);
	if not self.objMainNet then
		_err("connect mainNet error !!!");
	end;
end;  

define.ConnectServer{Obj={}}
when{};
function ConnectServer(Obj) 
	Obj:OtherConnectTo();
end;

--子连接连接
function CSvrApp:OtherConnectTo()
	if not self.bMainConnected then return end;
	_info("connect to ", self.sConnStr);
	
	for i=1, (self.nNetCounts - self.nNetNum) do
		_info("connect to SvrNet----", i);
		local socket = _connect(
			self.sConnStr,
			function (socket,ip,port,myip,myport)
				socket.dwWaitTime = 6000000;
				socket:receive(8,onHead,socket.dwWaitTime);
				reallySend(socket,_encode(SortMsgDefine.EnterGameRequest,{_G.DBSvrMsgID, self.nGlobalID}));
				socket.objOwner = self;
				socket.onBody = onBodyOther;
				self:OnNetsConnect(socket);
			end,
			function (socket,ifTimeout,ifNotconn,...)
				_err("OtherNet Disconnect....", ifTimeout, ifNotconn, ...);
				self:OnNetsDisconnect(socket);
			end,
			0
		);
		self.setTempNet[socket] = true;
	end;
end; 

--子连接连接上
function CSvrApp:OnNetsConnect(socket)
	_info("connected");
	self.setTempNet[socket] = nil;
	table.insert(self.setNets, socket);
	self.nNetNum = self.nNetNum + 1; 
	if not self.bOwerConnected then
		self.objOwner:OnConnect(self);
		self.bOwerConnected = true;
	end; 
end;
--子连接断开
function CSvrApp:OnNetsDisconnect(socket)
	self.setTempNet[socket] = nil; 
	for k, v in ipairs(self.setNets) do
		if v == socket then
			table.remove(self.setNets, k);
			self.nNetNum = self.nNetNum - 1;
			--重连
			ConnectServer{_delay=0.1,Obj=self};
			break;
		end;
	end; 
end;   
------------------------------------------------------------------------------
------------------------------被动连接网络管理------------------------
------------------------------------------------------------------------------- 
--增加子网络连接
function CSvrApp:AddNet(net)
	table.insert(self.setNets, net);
	self.nNetNum = self.nNetNum + 1; 
	net.objOwner = self; 
	net:receive(8,onHead,net.dwWaitTime);
	net.onBody = onBodyOther;
	net.ProcDisconnect = self.ProcOtherNetDisconnect;
end;
--增加主网络
function CSvrApp:SetMainNet(net)
	self.objMainNet = net;
	_mycallout(self);
	net.objOwner = self; 
	net:receive(8,onHead,net.dwWaitTime);
	net.onBody = onBodyMain;
	net.ProcDisconnect = self.ProcMainNetDisconnect;
end;

--处理网络断开（服务器端）
function CSvrApp:ProcMainNetDisconnect(net) --主网络断开
	self.objMainNet = nil;
	return true;
end;
function CSvrApp:ProcOtherNetDisconnect(net)  
	for k, v in ipairs(self.setNets) do
		if v == net then
			table.remove(self.setNets, k);
			self.nNetNum = self.nNetNum - 1; 
			break;
		end;
	end;
	return false;
end;



----------------------------------------------------------------------------------------------------------------
--异步发送和接收数据
----------------------------------------------------------------------------------------------------------------
--添加接收到的消息
function CSvrApp:AddCallInMsg(index, name, arg,ProcessMsgFunc) 
	self.setMsgCallIn[index] = {name,arg,ProcessMsgFunc};
	self:RecvMsg(index);
	self.nInCounts = self.nInCounts + 1;
	if not self.bUpdate then
		self:Update(false);
	end;
end;
----添加发送数据
function CSvrApp:AddNetData(name, arg)
	self:SendData(name, arg);
end;
 
--发送数据
function CSvrApp:SendData(name, arg)  
	self.setMsgCallOut[self.nCallOutIndexSet] = {name, arg};
	self.nCallOutIndexSet = self.nCallOutIndexSet + 1;
	if not self.bUpdate then
		self:Update(false);
	end;
end;


--执行接收到的
function CSvrApp:ExecuteRecv()
	local InData = self.setMsgCallIn[self.nRecvIndex];
	local nExcuteNum = 0;
	while InData do
		self.setMsgCallIn[self.nRecvIndex] = nil; 
		if InData[3] then
			InData[3](self,InData);
		end;
		self.nRecvIndex = self.nRecvIndex + 1;
		self.nInCounts = self.nInCounts - 1;
		nExcuteNum = nExcuteNum + 1;
		if nExcuteNum > 200 then
			_info("SvrApp callin buff has:", self.nInCounts);
			break;
		end;
		InData = self.setMsgCallIn[self.nRecvIndex];
	end;
	 
	if (self.nWaitIndex ~= self.nRecvIndex) or (self.nInCounts == 0) then
		self.nWaitTime = 0;
		self.nWaitIndex = self.nRecvIndex;
	else
		if self.nWaitTime ~= 0 then
			local dwInterval = _now() - self.nWaitTime;--延迟
			if dwInterval > 20000 then   --超过20s，标记为错误消息
				_info("SvrNet msg lost!!!:", self.nRecvIndex);
				self:RecvMsg(self.nRecvIndex) --牺牲一条消息来清掉对端的缓冲
				self.nRecvIndex = self.nRecvIndex + 1;
			elseif  self.dwWaitCount <= (dwInterval / 5000) then--没5s发送一个请求包
				_info("SvrNet !!!!!", self.nRecvIndex, dwInterval);
				self:ReGetMsg(self.nRecvIndex);
				self.dwWaitCount = self.dwWaitCount +1;
			end;
		else
			self.nWaitTime = _now(); --第一次等待
			self.dwWaitCount = 1;
		end; 
	end; 
	
	-- local nowTime = os.now();
	-- if (self.nWaitIndex == self.nRecvIndex) and (self.nInCounts > 0) then
		-- if self.nWaitTime < nowTime then
			-- if self.nRealWaitTime < nowTime then
				-- _info("SvrNet msg lost!!!:", self.nRecvIndex);
				-- self.nRecvIndex = self.nRecvIndex + 1;
				-- return;
			-- end;
			-- _info("SvrNet !!!!!", self.nRecvIndex, nowTime - self.nWaitTime);
			-- self:ReGetMsg(self.nRecvIndex);
			-- self.nWaitTime = nowTime + 5000;--等待5秒
		-- end;
	-- else
		-- self.nWaitIndex = self.nRecvIndex;
		-- self.nWaitTime = nowTime + 5000;
		-- self.nRealWaitTime = nowTime + 20000;
	-- end;
end;
--发送发出去的
function CSvrApp:SendCallout()
	local nowTime = _now();
	if self.lastHeartBeatTime and nowTime > self.lastHeartBeatTime then
		_info("send heart baeat request!!!!");--发送心跳包
		reallySend(self.objMainNet, _encode("hb"));
		self.lastHeartBeatTime = nowTime + 60000;
	end;   
	
	if nowTime > self.lastSendTime then
		self.lastSendTime = nowTime + 100;
		self.nSendNum = self.nNetNum * (CConfig.Network.dwSocketSendNum or 5) + 5;--如果nNetNum为0的话用主连接发出去10个
		
		--[[
		local setDelget = self.nCallOutIndexSet - self.nCallOutIndexGet;
		if (setDelget > 0) or (sendDelRecv > 0) then
			_info("SvrNet buff num----", setDelget, sendDelRecv, self.nCallOutIndexSet);
		end;
		]]
	end; 
	local outData = self.setMsgCallOut[self.nCallOutIndexGet]; 
	while outData and (self.nSendNum > 0) do 
		self.nSendNum = self.nSendNum - 1;
		outData[3] = self.nCallOutIndexGet;
		self.nCallOutIndexGet = self.nCallOutIndexGet + 1;
		local net = self:GetNet();
		if net then 
			reallySend(net, _encode(outData[1],outData[2],outData[3]));
		else
			_err("net counts 0 !!!!");
			return;
		end;
		outData = self.setMsgCallOut[self.nCallOutIndexGet];
	end;
end;

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
 
----------------------------------------------------------------------------------------------------------------------------------------
--协议部分
---------------------------------------------------------------------------------------------------------------------------------------- 
define.AsyncOnConnect{Obj={}}
when{};
function AsyncOnConnect(Obj) 
	Obj.objOwner:OnConnect(Obj);--服务器接到信息回执
end;
--处理非远端调用消息
function CSvrApp:ProcProtoMsg(name, arg) 
	if name:lead("rc") then--服务器发回来的接收到消息的回执，此消息最为频繁，故放在第一个判断中。
		-- _info("msg be received----2222222222222222", arg); 
		self.setMsgCallOut[arg] = nil; 
	elseif name:lead("hb") then--客户端发送到服务器的心跳请求
		_info("-----on heart beat----");
		reallySend(self.objMainNet, _encode("rhb"));
	elseif name:lead("rhb") then--服务器发回来心跳响应
		_info("-----on heart beat respond-----");
	elseif name:lead("rg") then--对端发过来的重新索要某条消息的请求，网络传输中该数据丢失------->>重发。
		_info("SvrApp msg be reget----", self.sName, arg);
		local data = self.setMsgCallOut[arg];
		if data then 
			reallySend(self.objMainNet, _encode("rs", data));
		else
			_info("SvrNet data already recv and delete !!!");
		end;
	elseif name:lead("rs") then --对方发送过来重发的消息arg[3]==_n_id
		if arg[3] < self.nRecvIndex then
			_info("SvrNet already recv----", arg[3]);--已经收到
			return;
		end;
		_info("SvrApp recv resend msg----", self.sName, arg[3]);
		_mycallin(self, arg[1], arg[2],arg[3]);
	elseif name:lead(_G.SortMsgDefine.EnterGameResult) then--服务器发回来唯一ID值
		if type(arg) ~= "number" or arg <= 0 then
			_err("GlobalID err!!!");
			return;
		end;
		_info("====SvrApp nGlobalID:", self.sName, arg);
		self.nGlobalID = arg;
		self.bMainConnected = true; 
		ConnectServer{_delay=0.1,Obj=self}; 
		--self:OtherConnectTo();
		_mycallout(self); 
		-- self.objOwner:OnConnect(self);--服务器接到信息回执
		--AsyncOnConnect{_delay=0.5,Obj=self};
	else
		_err("err msg!!!");
	end;
end;  
--接到消息回执
function CSvrApp:RecvMsg(index)
	reallySend(self.objMainNet, _encode("rc", index)); 
end; 
--要求重新获得某条消息
function CSvrApp:ReGetMsg(index)
	reallySend(self.objMainNet, _encode("rg", index));
end;  

---------------------------------------------------------------------------------------------------------------------
-------------------------------- 内部函数---------------------------------------
---------------------------------------------------------------------------------------------------------------------
function _mycallout(netApp) 
	if getmetatable(netApp) == nil then
		setmetatable(netApp,{__index=function(netApp,func,arg) 
			if type(func) =='string' and func:byte(1) >= 65 and func:byte(1) <= 91 then
				return function(arg) 
					local funcid = netApp.RemoteMsgList[func]; 
					if not funcid then
						_err("func is null by out",func);
						return false;
					end; 
					local newArg = {}; 
					if funcid[2] then
						local n = 1;
						for i,v in pairsByKeys(funcid[2]) do 
							newArg[n] = arg[v];
							n = n +1; 
						end;
					end;
					newArg._aid = arg._aid;  
					netApp:SendData(funcid[1], newArg);
					return true;
				end
			end
		end
		})
	end;
	return netApp;
end; 

function _mycallin(netGroup,name,arg,_n_id)  
	local nameid = name;
	name = _G.setAllMsgList[nameid][1]; 
	if not name then
		_err("nameid is null",nameid);
		return;
	end; 
	if name and type(name) == 'string' and type(_G[name]) == 'function' then
		local n = 1;
		local newArg = {};
		local argTable = _defvalues(_G[name],nil,true);  
		for i,v in pairsByKeys(argTable) do 
			newArg[i] = arg[n];
			n = n +1;
		end;  
		newArg._aid =  arg._aid;  
		netGroup:AddCallInMsg(_n_id, name, newArg,ProcGeneralMsg);   
	end;  
end
 
function onHead(net,head, from, to) 
	local len = string.to32b(head, from)-8;
	if len < 0 or len > 16384 then
		net:close()
		_err('invalid net data',len,head:tostr(from,to));
	end  
	net:receive(len, net.onBody, net.dwWaitTime)
end

--主网络消息
function onBodyMain(net,data, from, to)  
	net:receive(8, onHead, net.dwWaitTime);
	local name,arg= _decode(data,from,to);
	net.objOwner:ProcProtoMsg(name, arg); 
end; 

--子网络消息
function onBodyOther(net,data, from, to) 
	net:receive(8, onHead, net.dwWaitTime)
	local name,arg,_n_id = _decode(data,from,to);
	local netGroup = net.objOwner;
	if _n_id < netGroup.nRecvIndex then
		_info("SvrNet already recv----", _n_id);--已经收到
		return;
	end;
	if type(name) ~= 'number' then 
		return;
	end;
	if arg._tsk then --如果是转发消息  
		netGroup:AddCallInMsg(_n_id, name, arg,ProcTransMsg);  
	else	
		_mycallin(netGroup,name,arg,_n_id);
	end;
end; 

--处理普通消息的函数
function ProcTransMsg(netGroup,data)
	netGroup.objOwner:ProcessTransMsg(netGroup, data[1],data[2]);
end;
--处理转发消息的函数
function ProcGeneralMsg(netGroup,data) 
	_G._from = netGroup;  
	--_G[data[1]](data[2]);
	local bRet,szMsg = pcall(function() return _G[data[1]](data[2]) end);
	if not bRet then
		_info("[ERROR]",szMsg);
	end;	
end;
--- 调用网络引擎发送数据
function reallySend(net,data)
	local len = #data + 8;
	local head = string.from32b(len) .. "\0\0\0\0"; 
	net:send(head); 
	-- local ok, result = net:send(head);-- pcall(net.send, net, head)
	-- if not ok then 
		-- _err(debug.traceback(result)) 
		-- return 
	-- end
	local ok, result = pcall(net.send, net, data)
	if not ok then 
		_err(debug.traceback(result)) 
		return 
	end 
end;



--[[测试，统计用
local callinRecord = {
	lastPrintTime	= os.now();
	Record			= {};
};
function callinRecord:Print()
	if os.now() - self.lastPrintTime > 20000 then
		self.lastPrintTime = os.now();
		local tempT = {};
		for k, v in pairs(self.Record) do
			local t = {};
			t.name	= k;
			t.num	= v;
			table.insert(tempT, t);
		end;
		table.sort(tempT, function(a, b) return a.num > b.num  end);
		print("*********************************************");
		for k, v in ipairs(tempT) do
			print("===", v.name, v.num);
		end;
		print("*********************************************");
	end;
end;
--]] 
------------------------------------------------------------------------------------------------------------
------------------------------------服务器接口部分---------------------------------------------------
------------------------------------------------------------------------------------------------------------

local OnServerHead,OnServerBody,DoSend; 
_G.CSvrNet = {}; 
function CSvrNet:New(objServer)
	local obj = {}; 
	obj.objHost		= nil;			--底层句柄
	obj.objServer	= objServer;	
	obj.setNets		= {};			--连接集合
	obj.nNextGlobalID = 0;		    --组id
	obj.tIDToGroup = {};			--组集合
	
	--方法拷贝
	for i,v in pairs(CSvrNet) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end; 

function CSvrNet:Update() 
	for k, v in pairs(self.tIDToGroup) do 
		v:Update(true);
	end;
	return true;
end;

function CSvrNet:AddNetGroup(groupID)
	_info("AddNetGroup----", groupID);
	if type(groupID) ~= "number" then
		_err("addNetGroup groupID err type!!!!");
		return;
	end;
	if self.tIDToGroup[globalID] then
		_err("globalID exist !!!");
		return;
	end;
	local objGroup = CSvrApp:New("svrNet",groupID);
	self.tIDToGroup[groupID] = objGroup;
	return objGroup;
end;

--通过组ID获得netClient组
function CSvrNet:GetNetGroupByID(groupID)
	return self.tIDToGroup[groupID];
end;
--获得一个唯一组ID
function CSvrNet:GetOneGlobalID()
	self.nNextGlobalID = self.nNextGlobalID + 1;
	return self.nNextGlobalID;
end;


--服务器网络启动侦听
function CSvrNet:Listen(szServiceConnectStr, dwWaitTime)
	self.dwCurConnectCount =0;  
	_info("create new SvrNet by:("..szServiceConnectStr..")"); 
	self.objHost = _listen(
		szServiceConnectStr,
		function(net,listenNet,ip,port)
			net.dwWaitTime = dwWaitTime or 36000;
			net.server = self;
			if not self:OnConnect(net,listenNet,ip,port) then
				_info("On Connect is Error close net");
				net:close();
			else
				net:receive(8,OnServerHead, net.dwWaitTime);
			end;
		end,
		function(net, ...)
			self:OnDisconnect(net, ...);
		end
	);
	
	if not self.objHost then
	    _info 'create network error';
		return false;
    end;
	_info( "create network("..szServiceConnectStr..") success");
	return true;
end;  

--监听到客户端发送过来的连接 
function CSvrNet:OnConnect(net,listenNet,ip,port)
	self.dwCurConnectCount = self.dwCurConnectCount + 1;
	_info("SvrNet Have Connect("..self.dwCurConnectCount..")");  
	self.setNets[net] = {ip, port};
	if not self.objServer then
		_err('no obj Server');
		return false;
	end; 
	return true;
end;

--客户端玩家断开
function CSvrNet:OnDisconnect(net, timeout,param1,param2)  
	self.dwCurConnectCount = self.dwCurConnectCount - 1;
	_info("SvrNet Have disconnect("..self.dwCurConnectCount..")",self, timeout,param1,param2);
	if not self.objServer then
		_err('no obj Server');
		return;
	end; 
	
	if net.ProcDisconnect(net.objOwner,net) then
		self.objServer:OnDisconnect(net.objOwner); 
		self.tIDToGroup[net.objOwner.nGroupID] = nil;
	end;
	self.setNets[net] = nil;
end; 

--处理协议消息
function CSvrNet:ProcProtoMsg(net, name, arg)
	if name:lead(SortMsgDefine.EnterGameRequest) then--进入游戏请求 
		local msgType = arg[1];
		local groupID = arg[2]; 
		local netGroup ;
		if not groupID then--主连接
			groupID = self:GetOneGlobalID();
			DoSend(net, _encode(SortMsgDefine.EnterGameResult, groupID));
			netGroup = self:AddNetGroup(groupID);
			if not netGroup then
				_err("get netGroup err", groupID);
				net:close();
				return;
			end;
			local RemoteMsgList;
			if msgType == 2 then	--2说明连接上的客户端为GameServer
				RemoteMsgList = _G.MsgList_GameServer;
			elseif msgType == 3 then	--3说明连接上的客户端为KernelServer
				RemoteMsgList = _G.MsgList_KernelServer;
			else
				_err("err msg type !!!");
				net:close();
				return;
			end; 
			netGroup.RemoteMsgList = RemoteMsgList;
			netGroup:SetMainNet(net); 
			self.objServer:OnConnect(netGroup, self.setNets[net][1], self.setNets[net][2]);
		else
			netGroup = self:GetNetGroupByID(groupID);
			if not netGroup then
				_err("get netGroup err", groupID);
				net:close();
				return;
			end;
			netGroup:AddNet(net);
		end;
		netGroup.objOwner = self;
	else
		_err("err msg !!!");
		return;
	end;
end;

--处理转发消息
function CSvrNet:ProcessTransMsg(netGroup,nameid,arg)
	local dwTaskID = arg._tsk;
	arg._tsk = nil;
	if arg._rid then -- 如果有指定
		local objPlayer = CPlayerManager:GetPlayerByRoleID(arg._rid);
		if objPlayer and objPlayer.objLineNet then 
			arg._aid = objPlayer:GetAccountID();
			objPlayer.objLineNet:SendData(nameid, arg);--发送到指定玩家 
        else--错误
            if dwTaskID > 0 then --大于0
				netGroup.GSRemoteCallBackMsg{KeyID = dwTaskID,Result = -1}
			end;
			return;
		end; 
	else--需要发送到所有线 
		CGameLineManager:SendMsgToAllLine(nameid, arg);
	end;
	--成功调用回调
	if dwTaskID > 0 then
		netGroup.GSRemoteCallBackMsg{KeyID = dwTaskID, Result = 0}
	end;
end;  

----------------------------------------------------------------------------------------------------
------------------------------------------局部函数----------------------------------------------
----------------------------------------------------------------------------------------------------
function OnServerHead(net,head, from, to)
	local len = string.to32b(head, from)-8;
	if len < 0 or len > 16384 then
		net:close()
		_err('invalid net data',len,head:tostr(from,to));
	end 
	net:receive(len,OnServerBody, net.dwWaitTime)
end;

function OnServerBody(net,data, from, to)  
	local name,arg = _decode(data,from,to);
	net.server:ProcProtoMsg(net,name,arg);
end;

function DoSend(net,data)
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
end;
