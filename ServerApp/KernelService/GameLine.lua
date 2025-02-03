--[[
功能：游戏线路,拥有一个地图管理器
作者：周华杰
时间：2012-03-05
]]

_G.CGameLine = {} 
function CGameLine:new(dwLineID,dwPlayerCount, svrNet, dwWarFlag)  --quying chg 2012-06-26
	local obj = {};
	
	obj.dwLineID = dwLineID;
	obj.dwMaxPlayerCount = math.floor(dwPlayerCount);
	obj.dwCurPlayerCount = 0; 
	obj.dwTempPlayerCount = 0;
	obj.szName = SysStringConfigInfo[1000160004+dwLineID];
	obj.setPlayer = {};
	obj.objNet = svrNet;	--网络
	obj.dwWarFlag = dwWarFlag;
	for i , v in pairs(CGameLine) do
		if type(v) == "function" then
			obj[i] = v;
		end;
 	end;
	return obj;
end;

function CGameLine:Create()  
	_mycallout(self);
	return true;
end; 

function CGameLine:Destroy()
	 
end;


function CGameLine:PlayerEnter(objPlayer)
	if self.setPlayer[objPlayer:GetRoleID()] then
		return false;
	end;
	self.dwCurPlayerCount = self.dwCurPlayerCount +1;
	self.setPlayer[objPlayer:GetRoleID()] = objPlayer;
	return true;
end;

function CGameLine:AddOneTempPlayer()
	self.dwTempPlayerCount = self.dwTempPlayerCount + 1;
end;

function CGameLine:DelOneTempPlayer()
	self.dwTempPlayerCount = self.dwTempPlayerCount - 1;
end;

function CGameLine:PlayerExit(dwRoleID)
	if self.setPlayer[dwRoleID] then
		self.dwCurPlayerCount = self.dwCurPlayerCount - 1;
		self.setPlayer[dwRoleID] = nil;
		return true;
	end;
	return false;
end;

function CGameLine:GetPlayer(dwRoleID)
	if not dwRoleID or dwRoleID == 0 then
		return self.setPlayer;
	end;
	return self.setPlayer[dwRoleID];
end;

function CGameLine:GetID()
	return self.dwLineID;
end;

function CGameLine:IsFull()
	return ((self.dwCurPlayerCount + self.dwTempPlayerCount) >= self.dwMaxPlayerCount);
end;

function CGameLine:GetMaxCount()
	return self.dwMaxPlayerCount;
end;

function CGameLine:GetCurCount()
	return self.dwCurPlayerCount;
end;

function CGameLine:ISCanCreateDulp()
	if self:IsFull() then
		return false;
	end
	
	return self.dwWarFlag == 2;
end;
