if CSingle then
	_G.CMemoryDebug = CSingle:new();
	CSingleManager:AddSingle(CMemoryDebug,true);
else
	_G.CMemoryDebug = {};
end;

CMemoryDebug.setObjectInfo = {};
CMemoryDebug.dwCollectgarTime = _now();
CMemoryDebug.dwTableCountTime = _now();
function CMemoryDebug:Create() 
	return true;
end;

function CMemoryDebug:Update(dwInterval)
	if _now() - self.dwCollectgarTime >= 30 * 1000 then
		self.dwCollectgarTime = _now();
		collectgarbage("collect");
		_info("============collectgarbage============");
		_info("memory:"..collectgarbage("count"));
		_info("======================================");
	--	self:Print();
	end;

--[[
	if _now() - self.dwTableCountTime >= 60 * 1000 then
		_info("==============memorycount=============");
		self.dwTableCountTime = _now();
		self:MemoryCount();
		_info("======================================");
	end;
--]]
end;

function CMemoryDebug:Destroy()
	
end;

function CMemoryDebug:AddObject(szObjName,obj)
	if not self.setObjectInfo[szObjName] then
		local sInfo = {false,{}} 
		setmetatable(sInfo[2],{__mode="k"});
		self.setObjectInfo[szObjName] = sInfo;
	end;
	self.setObjectInfo[szObjName][2][obj] = _now();
end;

function CMemoryDebug:Show(szObjName,bIsShow)
	local bIsShow = bIsShow or true;
	if not self.setObjectInfo[szObjName] then
		local sInfo = {false,{}} 
		setmetatable(sInfo[2],{__mode="k"});
		self.setObjectInfo[szObjName] = sInfo;
	end;
	self.setObjectInfo[szObjName][1] = bIsShow;
end;

function CMemoryDebug:Print()
	collectgarbage("collect");
	for i,objectInfo in pairs(self.setObjectInfo) do
		if objectInfo[1] then
			local dwCount = 0;
			for k, v in pairs(objectInfo[2]) do
				dwCount = dwCount + 1;
			end;
			_info(i.." Count:"..dwCount);
			--[[
			if i == "ObjPlayer" then
				local obj = next(objectInfo[2]);
				if obj then _info(self:MemoryTrace(obj)) end;
			end;
			--]]
		end;
	end;
end;
---------------------------------------------------------------------------------
function CMemoryDebug:MemoryTrace(o)
	self.MemoryTraceList = {}
	setmetatable(self.MemoryTraceList, {__mode = 'k'});
	self.MemoryTraceList[CMemoryDebug] = true
	return self:_MemoryTrace(_G,o)
end

function CMemoryDebug:_MemoryTrace(t,o)
	if self.MemoryTraceList[t] then return end
	self.MemoryTraceList[t] = true
	
	local b
	for k,v in pairs(t) do
		if v == o then
			b = k
			break
		end
	end
	if b then
		return 'MemoryTrace # '..tostring(o)..' << '..tostring(b)
	else
		for k,v in pairs(t) do
			if type(v) == 'table' then
				local s = self:_MemoryTrace(v,o)
				if s then
					return s..' << '..tostring(k)
				end
			end
		end
	end
end

--------------------------------------------------------
CMemoryDebug.MemoryCountInfo = {}
setmetatable(CMemoryDebug.MemoryCountInfo, {__mode = 'k'});
function CMemoryDebug:MemoryCount()
	_G.MemoryCountFile = _G.MemoryCountFile or 0
	_G.MemoryCountFile = _G.MemoryCountFile + 1
	
	self.MemoryCountList = {}
	setmetatable(self.MemoryCountList, {__mode = 'k'});
	self.MemoryCountList[CMemoryDebug] = true
	
	self.MemoryCountInterval = {}
	setmetatable(self.MemoryCountInterval, {__mode = 'k'});
	self:_MemoryCount(_G)
	
	local tabOrder = {}
	for k,v in pairs(self.MemoryCountInterval) do
		local temp = {}
		temp.o = k
		temp.d = v
		temp.a = self.MemoryCountInfo[k]
		table.insert(tabOrder,temp)
	end
	table.sort(tabOrder,function(a,b) return a.d > b.d end)
	
	local szServer = "ks";
	if CKernelApp then szServer = "gs"..CKernelApp.dwLineID end
	local f = io.open('log\\'..szServer..'_'..MemoryCountFile..'.lua','w')
	if f then
		for i = 1,20 do
			local v = tabOrder[i]
			if v then
				local s = self:MemoryTrace(v.o)
				if s then
					f:write(tostring(v.o)..'\t'..tostring(v.d)..'\t'..tostring(v.a))
					f:write(' \n')
					f:write(s)
					f:write(' \n')
				end
			end
		end
		f:close()
	end
end

function CMemoryDebug:_MemoryCount(t)
	if self.MemoryCountList[t] then return end
	self.MemoryCountList[t] = true
	
	local dwCount = 0
	for k,v in pairs(t) do
		dwCount = dwCount + 1
		if type(v) == 'table' then
			self:_MemoryCount(v)
		end
	end
	local n = self.MemoryCountInfo[t]
	local dwInterval = dwCount - (n or 0)
	self.MemoryCountInterval[t] = dwInterval
	self.MemoryCountInfo[t] = dwCount
end
