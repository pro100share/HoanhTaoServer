--[[
文件：src/GameCore/Timer.lua
类名：CTimer
功能：定时器，当需要在未来某个时刻执行一个函数时候，可以将其注册到该定时器
备注：
作者：周华杰
版本：v1.0
--]]

_G.CTimer = CSingle:new();
CTimer.setAllTimer = {}
CTimer.dwGloablID = 0 

CSingleManager:AddSingle(CTimer,true);--注册到全局控制，让系统自动更新，
--增加定时器
function CTimer:AddTimer( dwTime, bPause, Func, Param )
	self.dwGloablID = self.dwGloablID + 1
	self.setAllTimer[self.dwGloablID] = { 
	dwRemain = dwTime, 
	bPause = bPause, 
	Func = Func, 
	Param = Param}; 
	return self.dwGloablID;
end

--更新定时器
function CTimer:Update( e )  
	for k, v in pairs( self.setAllTimer ) do 
		if( not v.bPause ) then 
			v.dwRemain = v.dwRemain - e
			if ( v.dwRemain <= 0 ) then
                self.setAllTimer[k] = nil
				v.Func( unpack(v.Param or {}) )
			end
		end
	end
end

--删除定时器
function CTimer:RemoveTimer(dwID)
	if( self.setAllTimer[dwID] ) then
		self.setAllTimer[dwID] = nil
	else
		print( '-----CTimer:removeTimer----is nil' )
		--print( debug.traceback() )
	end
end

--暂停定时器
function CTimer:PauseTimer(dwID)
	if( self.setAllTimer[dwID] ) then
		self.setAllTimer[dwID].bPause = true
	else
		print( '-----CTimer:pauseTimer----is nil' )
		--print( debug.traceback() )
	end
end

--继续暂停的定时器
function CTimer:ContinueTimer(dwID)
	if( self.setAllTimer[dwID] ) then
		self.setAllTimer[dwID].bPause = false;
	else
		print( '-----CTimer:continueTimer----is nil' )
		--print( debug.traceback() )
	end
end

-------------------------------------------------------------------------------
--需要new的timer
_G.COwnTimer = {}
function COwnTimer:new()
	local obj = { _now(), nil, nil };
	setmetatable(obj,{ __index = COwnTimer });
	return obj;
end
function COwnTimer:AddEvent(delay,func)
	local exec = self[1] + delay;
	local node = { exec, func }
	if (not self[2]) or (not self[3]) then
		self[2],self[3] = node,node;
	elseif self[2][1] >= exec then
		node[3],self[2] = self[2],node;
	elseif self[3][1] <= exec then
		self[3][3],self[3] = node,node;
	else
		local temp = self[2];
		while(temp[3][1] <= exec) do
			temp = temp[3];
		end
		node[3],temp[3] = temp[3],node;
	end
end
function COwnTimer:Update(ival)
	self[1] = self[1] + ival;
	local exec,node = self[1],self[2];
	while(node and node[1] < exec) do
		self[2] = self[2][3];
		if not self[2] then
			self[3] = nil;
		end
		node[2]();
		node = self[2];
	end
end
