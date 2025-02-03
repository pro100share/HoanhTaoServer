
------------------------------------------------
---------------网络底层排序管理器---------------
------------------------------------------------
_G.CNetAppGroup = {}
--netApp组
function CNetAppGroup:New(name)
	local obj = {};
	obj.sGroupName = name;
	obj.nGlobalID  = _now() + math.random(10000);
	_info("-------new NetGroup---- ID:", obj.nGlobalID);
	obj.nSendIndex = 0;		--发送消息ID
	obj.nRecvIndex = 1;		--接收消息ID
	obj.tMsgCallIn = {};
	setmetatable(obj, {__index = CNetAppGroup});
	return obj;
end;
--获取组唯一ID
function CNetAppGroup:GetGlobalID()
	return self.nGlobalID;
end;
--获得组内发送排序ID
function CNetAppGroup:GetSendIndex()
	self.nSendIndex = self.nSendIndex + 1;
	return self.nSendIndex;
end;
--添加接收到的消息
function CNetAppGroup:AddCallInMsg(net, index, name, arg)
	--_info("app recv @@@@@", self:GetGlobalID(), index, self.nRecvIndex);
	self.tMsgCallIn[index] = {net, name, arg};
	local nextData = self.tMsgCallIn[self.nRecvIndex];
	while nextData do
		self.tMsgCallIn[self.nRecvIndex] = nil;
		_G._from = nextData[1]; 
		_G[nextData[2]](nextData[3]);
		self.nRecvIndex = self.nRecvIndex + 1;
		nextData = self.tMsgCallIn[self.nRecvIndex];
	end;
	if (index - self.nRecvIndex) > 50 then
		_err("!!!!!!!!!!!!!!!!!!!!!!");
		self.nRecvIndex = self.nRecvIndex + 1;
	end;
end;

_G.CNetAppSortManager = {
	tNameToGroup = {};
	tNetToGroup = {};
};
--将netApp添加到管理器
function CNetAppSortManager:AddNetApp(netApp, name)
	if type(name) ~= "string" then return end;
	if not self.tNameToGroup[name] then
		 local netGroup = CNetAppGroup:New(name);
		 for k, v in pairs(self.tNameToGroup) do
			if v:GetGlobalID() == netGroup:GetGlobalID() then
				_err("@@@@@");
				_err("@@@@@");
				_err("@@@@@");
			end;
		 end;
		 self.tNameToGroup[name] = netGroup;
	end;
	self.tNetToGroup[netApp] = self.tNameToGroup[name];
end;
--通过netApp获得netApp组
function CNetAppSortManager:GetNetAppGroupByNet(netApp)
	return self.tNetToGroup[netApp];
end;
------------------------------------------------
---------------网络底层排序管理器---------------
------------------------------------------------
local function pairsByKeys(t,f)
	local a = {};
	for n in pairs(t) do table.insert(a,n) end;
	table.sort(a,f);
	local i = 0;
	local iter = function()
		i = i +1;
		if a[i] == nil then 
			return a[i], nil;
		else 
			return a[i],t[a[i]];
		end;
	end;
	return iter;
end;

	
local function _mycallout(net,calloutFunc)
	if getmetatable(net) == nil then
		setmetatable(net,{__index=function(net,func,arg) 
			if type(func) =='string' and func:byte(1) >= 65 and func:byte(1) <= 91 then
				return function(arg) 
					local funcid = net.RemoteMsgList[func]; 
					if not funcid then
						print("func is null by out",func);
						return false;
					end; 
					local newArg ; 
					if funcid[2] then
						newArg ={};
						local n = 1;
						for i,v in pairsByKeys(funcid[2]) do 
							newArg[n] = arg[v];
							n = n +1; 
						end;
					end;
					newArg._aid = arg._aid;
					local netGroup = CNetAppSortManager:GetNetAppGroupByNet(net);
					if netGroup then
						newArg._index = netGroup:GetSendIndex();
						--_info("app send ####", netGroup:GetGlobalID(), newArg._index);
					end;
					-- for i,v in pairsByKeys(arg) do 
						-- table.insert(newArg,v);
					-- end;  
					calloutFunc(net[1] or net,_encode(funcid[1],newArg)); 
					return true;
				end
			end
		end
		})
	end;
	return net;
end;

local function _mycallin(net,data,from ,to)  
	local name,arg = _decode(data,from,to);  
	if type(name) == 'number' then
		local nameid = name; 
		name = _G.setAllMsgList[nameid][1]; 
		if not name then
			print("nameid is null",nameid);
			return;
		end; 
		if name and type(name) == 'string' and type(_G[name]) == 'function' and type(arg) =='table' then
			local n = 1;
			local newArg = {};
			local argTable = _defvalues(_G[name],nil,true);  
			for i,v in pairsByKeys(argTable) do 
				newArg[i] = arg[n];
				n = n +1;
			end; 
			newArg._aid =  arg._aid;
			local netGroup = CNetAppSortManager:GetNetAppGroupByNet(net)
			if netGroup then
				netGroup:AddCallInMsg(net, arg._index, name, newArg);
			else
				_G._from = net; 
				_G[name](newArg);
			end;
			--_enqueue(os.now(0)+1,net,_G[name],arg);    
		end; 
	else  
		net.client:ProcProtoMsg(net,name,arg); 
	end;
end; 

----------------------------------------------------
----------------------------------------------------  
local onHead,onBody;
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
	--_callin(net, data, from, to) 
	_mycallin(net.obj,data,from,to);
end; 

local function calloutClient(net,data, from, to)
	local len = #data + 8;--:len()+8;--to - from + 1; 
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
 
-- local function calloutUser(user,name, args, data, from, to) 
	-- local net = user.objNet;--nets[user.user]
	-- data,from,to = _encode(name,args);
	-- if net then
		-- calloutClient(net[1],data, from, to);
	-- end
-- end; 
----------------------------------------------------
--客户端网络
----------------------------------------------------
_G.CNetApp = {};
--CNetApp.RemoteMsgList = {};
--CNetApp.setAllMsgList = {};
function CNetApp:new(name)
	local obj = {};
	
	for i,v in pairs(CNetApp) do
		obj[i] = v;
	end;
	CNetAppSortManager:AddNetApp(obj, name)
	
	return obj;
end;

--服务器端客户端网络连接到指定服务器
function CNetApp:ConnectTo(host,objClient, remoteMsgList)  
	self.objClient = objClient;
	self.RemoteMsgList = remoteMsgList;
	local socket = _connect(
		host,
		function (socket,ip,port,myip,myport)
			socket:receive(8,onHead,6000000)
			
			_mycallout(self, calloutClient); 
			self.client = self;
			local netGroup = CNetAppSortManager:GetNetAppGroupByNet(self);
			local netGroupID;
			if netGroup then
				netGroupID = netGroup:GetGlobalID();
			end;
			calloutClient(socket,_encode(SortMsgDefine.EnterGameRequest,{_G.DBSvrMsgID, netGroupID}));
			self.objClient:OnConnect(self);
		end,
		function (socket,ifTimeout,ifNotconn,...)
			print("CNetApp Disconnect",ifTimeout,ifNotconn);
			self.objClient:OnDisconnect();
		end,
		0
	); 
	self[1] = socket;
	socket.obj = self;
	
	return self;
	--return socket;
end; 

--服务器上客户端
function CNetApp:ProcProtoMsg(objNet,name,arg)
	-- if name:lead"1002" then---1进入游戏请求结果 
		-- print("Client 1002");
		-- self:SendMsgList(objNet);
	-- elseif name:lead"1003" then --消息序列消息
		-- print("Client 1003");
		-- for i,v in pairs(arg) do
			-- CNetApp.RemoteMsgList[v[1]] = {i,v[2]};
		-- end;
	-- elseif name:lead"1004" then --服务器已经准备好接收消息
		-- print("Client 1004");
		-- self.objClient:OnConnect(objNet);
	-- end;
end; 

function CNetApp:SendData(data)
	local netGroup = CNetAppSortManager:GetNetAppGroupByNet(self);
	if netGroup then
		data[2]._index = netGroup:GetSendIndex();
		--_info("app send ####", netGroup:GetGlobalID(), data[2]._index);
	end;
	calloutClient(self[1],_encode(data[1], data[2]));
end;


----生成消息队列
-- function CNetApp:InitMsgList() 
	-- for func,v in pairsByKeys(_G) do 
		-- if type(func) == 'string' and type(v) == 'function' and func:byte(1) >= 65 and func:byte(1) <= 91 and string.find(func,"ACCMsg") then
			-- local argTable = _defvalues(_G[func],nil,true); 
			-- local newArgTable;
			-- if argTable then
				-- newArgTable = {};
				-- for i,v in pairsByKeys(argTable) do
					-- table.insert(newArgTable,i);
				-- end;
			-- end;
			-- table.insert(CNetApp.setAllMsgList,{func,newArgTable}); 
		-- end;
	-- end;
-- end;
-- define.AsyncSendMsgListByClient{net = {},msgTable = {},bIsNed = false}
-- when{}
-- function AsyncSendMsgListByClient(net,msgTable,bIsNed)  
	-- calloutClient(net[1],"1003",msgTable, _encode("1003",msgTable));  
	-- if bIsNed then 
		-- calloutClient(net[1],"1004",{},_encode("1004",{})); 
	-- end;
-- end;
----发送消息序列到指定网络
-- function  CNetApp:SendMsgList(net)
	-- local n= 0;
	-- local dwCount = SortQueueConfig.dwMsgListCount;
	-- while (true) do
		-- local SendMsgTible = {};
		-- for nIndex = 1,dwCount do
			-- local id = nIndex+n*dwCount;
			-- if CNetApp.setAllMsgList[id] then
				-- SendMsgTible[id] = CNetApp.setAllMsgList[id];
			-- else
				-- AsyncSendMsgListByClient{_delay=SortQueueConfig.dwMsgListInterval*n,net = net,msgTable = SendMsgTible,bIsNed = true};
				-- return;
			-- end;
		-- end; 
		-- AsyncSendMsgListByClient{_delay=SortQueueConfig.dwMsgListInterval*n,net = net,msgTable = SendMsgTible,bIsNed = false};
		-- n= n +1;
	-- end; 
-- end;
 