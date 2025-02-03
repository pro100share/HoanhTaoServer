_G.eInterval =  {
	_100ms		= 1,
	_1sec		= 2,
	_10sec		= 3,
	_1min		= 4,
	_10min		= 5,
	
	_100ms_a	= 6,
	_100ms_b	= 7,
	_100ms_c	= 8,
	_100ms_d	= 9,
	_100ms_e	= 10,
	_100ms_f	= 11,
	_100ms_g	= 12,
	_100ms_h	= 13,
	_100ms_i	= 14,
	_100ms_j	= 15,
	_100ms_k	= 16,
	
	_5min 		= 17,
}

local _interval = {
	[eInterval._100ms]		= 100,
	[eInterval._1sec]		= 1000,
	[eInterval._10sec]		= 10000,
	[eInterval._1min]		= 60000,
	[eInterval._10min]		= 600000,
	[eInterval._5min]		= 300000,
	
	[eInterval._100ms_a]	= 100,
	[eInterval._100ms_b]	= 100,
	[eInterval._100ms_c]	= 100,
	[eInterval._100ms_d]	= 100,
	[eInterval._100ms_e]	= 100,
	[eInterval._100ms_f]	= 100,
	[eInterval._100ms_g]	= 100,
	[eInterval._100ms_h]	= 100,
	[eInterval._100ms_i]	= 100,
	[eInterval._100ms_j]	= 100,
	[eInterval._100ms_k]	= 100,

};

local _time = 0;
local _data = {};
for _,enum in pairs(eInterval) do
	local node = {};
	node[1],node[2] = node,node;
	node[3],node[4] = enum,_time;
	node[5],node[6] = {node},function()end;
	_data[enum] = node;
end

--test
--[[test]]_G.driver_update_record = {};
--[[test]]_G.driver_update_count = {};

_G.CDriverManager = {}
function CDriverManager:Update(elapse)
	local last,next,node,update;
	_time = _time + elapse;
	for _,enum in pairs(eInterval) do
		--[[test]]local l = _now();
		update = _time + _interval[enum];
		while(_data[enum][4] <= _time) do
			node = _data[enum];
			last,next = node[1],node[2];
			_data[enum] = next;
			last[2],next[1] = next,last;
			node[6](node[5][1],update - node[4]);
			node[4] = update;
			if node[3] == enum then
				next = _data[enum];
				last = next[1];
				last[2],next[1] = node,node;
				node[1],node[2] = last,next;
			end
			--[[test]]local c = driver_update_count[enum] or 0;
			--[[test]]driver_update_count[enum] = c + 1;
		end
		--[[test]]local t = driver_update_record[enum] or 0;
		--[[test]]driver_update_record[enum] = t + _now() - l;
	end
end
function CDriverManager:AddDriver(enum,obj,func)
	if not enum then return; end
	local head = _data[enum];
	local update = _time + _interval[enum];
	local node = {head[1],head,enum,update,{obj},func};
	setmetatable(node[5],{__mode = "v"});
	head[1][2],head[1] = node,node;
	return node;
end
function CDriverManager:SetDriver(node,newe,obj,func)
	local last,next,olde = node[1],node[2],node[3];
	if newe and olde and newe ~= olde then
		--del
		if _data[olde] == node then
			_data[olde] = next;
		end
		if last[2] == node then last[2] = next; end
		if next[1] == node then next[1] = last; end
		--add
		local head = _data[newe];
		node[1],node[2] = head[1],head;
		local update = _time + _interval[newe];
		node[3],node[4] = newe,update;
		head[1][2],head[1] = node,node;
	end
	if obj then node[5][1] = obj; end
	if func then node[6] = func; end
end
function CDriverManager:DelDriver(node)
	if not node then
		_info("invalid node")
		_info(debug.traceback("",2));
		return;
	end
	local last,next,enum = node[1],node[2],node[3];
	if not enum then return; end
	if _data[enum] == node then
		_data[enum] = next;
	end
	if last[2] == node then last[2] = next; end
	if next[1] == node then next[1] = last; end
	node[3] = nil;
end

function CDriverManager:Length(enum)
	local head = _data[enum]
	if not head then return; end
	local temp,count = head,0;
	while temp[2] ~= head do
		temp,count = temp[2],count + 1;
	end
	return count;
end

--[[
local test_del = {}
function test_del:create(sign)
	self.sign = sign
	self.node = CDriverManager:AddDriver(eInterval._1sec,self,self.destory)
end
function test_del:destory()
	print("del",self.sign)
	CDriverManager:DelDriver(self.node)
end


local test_none = {}
function test_none:create(sign)
	self.sign = sign
	self.node = CDriverManager:AddDriver(eInterval._1sec,self,self.update)
end
function test_none:update()
	print("none",self.sign)
end

local data = {}
for i = 1,10 do
	if i%2 == 0 then
		data[i] = setmetatable({},{__index = test_none})
		data[i]:create(i)
	else
		data[i] = setmetatable({},{__index = test_del})
		data[i]:create(i)
	end
end

for i = 1,10 do
	print("<<<<<<<<<<<<<<<<<<<<<<<")
	local b,s = pcall(function()CDriverManager:Update(100)end)
	if not b then print(s) end
	print(">>>>>>>>>>>>>>>>>>>>>>>")
end

for i = 1,10 do
	if i%4 == 0 then
		CDriverManager:SetDriver(data[i].node,eInterval._100ms)
	end
end

for i = 1,10 do
	print("<<<<<<<<<<<<<<<<<<<<<<<")
	local b,s = pcall(function()CDriverManager:Update(100)end)
	if not b then print(s) end
	print(">>>>>>>>>>>>>>>>>>>>>>>")
end
--]]