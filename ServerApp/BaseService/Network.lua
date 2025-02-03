----------------------------------------------------
----------------------------------------------------  

function _G.pairsByKeys(t,f)
	local a = {};
	local i = 1;
	for k,_ in pairs(t) do a[i] =k; i = i+1; end;--table.insert(a,k) end;
	table.sort(a,f);--,function(a,b) if a[1] > b[1] then return true else return false end; end );
	i = 0;
	local iter = function()
		i = i +1;
		if a[i] == nil then 
			return a[i], nil;
		else 
			local key = a[i];
			return key,t[key];
		end;
	end;
	return iter;
end;

	
local function _mycallout(net,calloutFunc,bCompress)
	if getmetatable(net) == nil then
		setmetatable(net,{__index=function(net,func,arg) 
			if type(func) =='string' and func:byte(1) >= 65 and func:byte(1) <= 91 then
				return function(arg)
					local funcid = net.setRemoteMsgList[func]; 
					if not funcid then
						_err("func is null by out",func);
						return;
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
					
					calloutFunc(net[1] or net,funcid[1],newArg); 
				end
			end
		end
		})
	end;
	return net;
end;

local _mycallin; 
if CNetQueue then 
	_mycallin = function(net,name,arg)  
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
				--zcs modi 2012-6-29 
				CNetQueue:Insert(_G[name],newArg,net)
				--zcs
				
				--_enqueue(os.now(0)+1,net,_G[name],arg);    
			end; 
		else 
			net.server:ProcProtoMsg(net,name,arg); 
		end;
	end
else
	_mycallin = function(net,name,arg)  
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
				--zcs modi 2012-6-29
				_G._from = net;
				--zcs
				_G[name](newArg);
				--_enqueue(os.now(0)+1,net,_G[name],arg);    
			end; 
		else 
			net.server:ProcProtoMsg(net,name,arg); 
		end;
	end
end

local onHead,onBody;
function onHead(net,head, from, to)  
	local len = string.to32b(head, from)-8;
	if len < 0 or len > 16384 then
		net:close()
		_err('invalid net data',len,head:tostr(from,to));
	end 
	net:receive(len, onBody, net.dwWaitTime)
end

function onBody(net,data, from, to) 
	net:receive(8, onHead, net.dwWaitTime)
	--_callin(net, data, from, to) 
	--_mycallin(net.obj,data,from,to); 
	if net.obj.AcceptMsg then
		local name,arg = _decode(data); 
		if net.obj.dwAddValue then
			net.obj.dwSignValue = net.obj.dwSignValue + net.obj.dwAddValue; 
			local szSign = "ThemGaiDesign"..tostring(net.obj.dwSignValue);
			szSign= szSign:md5();
			local dwSignSize =net.obj.dwSignValue%32;
			local dwSignPos = dwSignSize-6; if dwSignPos <1 then dwSignPos =1; end;
			szSign=string.sub(szSign,dwSignPos,dwSignSize); 
			if not arg._ck:lead(szSign) then
				_info("msg error:",arg._ck,szSign);
				net:close();
				return;
			end; 
		end; 
		_mycallin(net.obj,name,arg)
	else
		print("error msg by		111111111111111111111111");
	end;
end; 

local function MySendData(net,data)
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
end;

local function calloutClient(net,name, args) 
	local data, from, to = _encode(name,args);
	MySendData(net,data);
end  

 
local function calloutUser(user,name, args, data, from, to) 
	local net; 
	if user.objNet then
		net = user.objNet;--nets[user.user]
		if net then
			calloutClient(net[1], name, args);
		end
	elseif user.objLineNet then
		net = user.objLineNet;--nets[user.user]  
		args._aid = user:GetAccountID();
		net:SendData(name, args);
	else
		print("net is null by func("..name..")");
	end;
end;


----------------------------------------------------
--服务器网络
----------------------------------------------------
_G.CNetwork = {};

function CNetwork:new(objServer)
	local obj = {}; 
	obj.objHost     = nil;			--底层句柄
	obj.dwPort		= 0;			--绑定的端口 
	obj.setNets   = {};				--用来保存网络连接
	obj.objServer = objServer; 
	for i,v in pairs(CNetwork) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
--服务器网络启动侦听
function CNetwork:Listen(szServiceConnectStr,dwWaitTime)
    self.setSendBuffer ={}; 
	self.dwCurConnectCount =0;  
	_info("create new service by:("..szServiceConnectStr..")");
	
	self.objHost = _listen(szServiceConnectStr,
	function(net,listenNet,ip,port)
		local netObj = {net}; 
		net.obj = netObj;
		net.dwWaitTime = dwWaitTime or 36000
		netObj.AcceptMsg = true;
		--if not bCallout then
			--_callout(net,calloutClient); 
		--end;
		--if not self:OnConnect(net,listenNet,ip,port) then
		netObj.server = self; --网络对象记录自己属于哪个网络
		netObj.setRemoteMsgList = {};
		_mycallout(netObj,calloutClient); 
		if not self:OnConnect(netObj,listenNet,ip,port) then
			_info("On Connect is Error close net");
			net:close();
		else
			net:receive(8,onHead, net.dwWaitTime);
		end;
	end,
	function(net,...)
		--self:OnDisconnect(net,...);
		self:OnDisconnect(net.obj,...);
	end);
	
	if not self.objHost then
	    _info 'create network error';
		return false;
    end;
	_info( "create network("..szServiceConnectStr..") success");
	return true;
end;  

--监听到客户端发送过来的连接 
function CNetwork:OnConnect(net,listenNet,ip,port)
	--连接计数
	self.dwCurConnectCount = self.dwCurConnectCount + 1;
	_info("Have Connect("..self.dwCurConnectCount..")"); 
	 
	self.setNets[net] = net;
	if not self.objServer then
		_err('no obj Server');
		return false;
	end;
	if not self.objServer:OnConnect(net,ip,port) then
		--self.setNets[net] = nil;
		return false;
	end;
	return true;
end;

--客户端玩家断开
function CNetwork:OnDisconnect(net, timeout,param1,param2)  
	self.dwCurConnectCount = self.dwCurConnectCount - 1;
	_info("Have disconnect("..self.dwCurConnectCount..")",self, timeout,param1,param2);
	if not self.objServer then
		_err('no obj Server');
		return;
	end; 
	self.objServer:OnDisconnect(self.setNets[net]);
	self.setNets[net] = nil;
end; 

--callout 呼出用户
function CNetwork:CalloutUser(objUser) 
	--_callout(objUser, calloutUser); 
	objUser.setRemoteMsgList = objUser.objNet.setRemoteMsgList;
	_mycallout(objUser, calloutUser);
end;  

--服务器
function CNetwork:ProcProtoMsg(objNet,name,arg)
	if name:lead(SortMsgDefine.EnterQueueRequest) then--1请求进入队列
		if self.objServer.ProcEnterQueue then
			local nResCode = self.objServer:ProcEnterQueue(objNet,arg)
			self:SendMsg(objNet[1],SortMsgDefine.EnterQueueResult,nResCode);
		else
			objNet[1]:close();
		end;
	elseif name:lead(SortMsgDefine.EnterGameRequest) then--2进入游戏请求 
		local msgType = arg[1];
		if arg[3] then 
			objNet.dwSignValue = (arg[2] - (arg[3]+arg[4]));
			if objNet.dwSignValue <= 0 then
				objNet.dwSignValue = - objNet.dwSignValue;
			end;
			objNet.dwAddValue = arg[4]; 
		end;
		if msgType == 1 then	--1说明客户端为client
			objNet.setRemoteMsgList = _G.MsgList_Client;
		elseif msgType == 4 then	--4说明连接上的客户端为Robot
			objNet.setRemoteMsgList = _G.MsgList_Robot;
		else
			_err("err msg type", msgType);
		end;
		if self.objServer.EnterGameRequest then
			local bRet = self.objServer:EnterGameRequest(objNet,arg[2])
			if bRet then
				self:SendMsg(objNet[1],SortMsgDefine.EnterGameResult,0);
			else
				self:SendMsg(objNet[1],SortMsgDefine.EnterGameResult,-1);
				CDelayerManager:Delay(eInterval._1sec,function() objNet[1]:close(); end);
			end;
		end;
	end;
end;

function CNetwork:SendMsg(net,name,arg)
	calloutClient(net,name,arg);
end;

function CNetwork:SendData(net,data)
	MySendData(net,data);
end;


_G.setAllMsgList = {};
--生成消息队列
function CNetwork:InitMsgList() 
	for func,v in pairsByKeys(_G) do 
		if type(func) == 'string' and type(v) == 'function' and func:byte(1) >= 65 and func:byte(1) <= 91 and string.find(func,"Msg") then
			local argTable = _defvalues(_G[func],nil,true); 
			local newArgTable;
			if argTable then
				newArgTable = {};
				for i,v in pairsByKeys(argTable) do
					table.insert(newArgTable,i);
				end;
			end;
			table.insert(_G.setAllMsgList,{func,newArgTable});	
		end;	
	end;
	if CConfig.bPrintMsgList and _G.PrintMsgToFile then
		local file = io.open("../Config/" .. _G.PrintMsgToFile .. ".lua", "w");
		if file then
			file:write("_G." .. _G.PrintMsgToFile .. " =\n");
			file:write("{\n");
			local str;
			for k, v in ipairs(_G.setAllMsgList) do
				str = string.format("\t%s = {\n", v[1]); 
				file:write(str);
					-------------
					str = string.format("\t\t[1] = %d;\n", k);
					file:write(str);
					----
					if v[2] then
						str = "\t\t[2] = {\n"
						file:write(str);
						--
						for index, name in ipairs(v[2]) do
							str = string.format('\t\t\t[%d] = "%s";\n', index, name);
							file:write(str);
						end;
						--
						str = "\t\t};\n";
						file:write(str);
					end;
					--------------
				str = "\t};\n";
				file:write(str);
			end;
			file:write("};\n");
			file:close();
		end;
	end;
end;


----------------------------------------------------------------
--私有变量，网络相关
----------------------------------------------------------------    
function CNetwork:int2Ip(ip,dwIndex) 
	local ip1 = ip%256
	local ip = (ip-ip1)/256
	local ip2 = ip%256
	local ip = (ip-ip2)/256
	local ip3 = ip%256
	local ip = (ip-ip3)/256
	local ip4 = ip	--zcs modi 
	if dwIndex then
		local result={ip4,ip3,ip2,ip1};
		return result[dwIndex];
	else
		return ip4.."."..ip3.."."..ip2.."."..ip1
	end;
end


