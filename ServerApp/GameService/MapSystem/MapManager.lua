--[[
功能：地图管理器，每个线路有一个
作者：周华杰，
时间：2011-12-22
]]

--map系统需要的回调函数
_G.OnMoveStop = function(dwMapID,dwRoleType,dwRoleID,tbPos)
	local objMap = CMapManager:GetMap(dwMapID);
	if not objMap then
		return;
	end
	
	if dwRoleType == 1 then
		local objMonster = objMap:GetMonsterByObjID(dwRoleID);
		if not objMonster then
			return;
		end
		
		local objMoveSys = objMonster:GetSystem("CMonsterMoveSystem");
		if objMoveSys then
			objMoveSys:DoneWithMoveEnd(tbPos);
		end
	elseif dwRoleType == 0 then
		local objPlayer = objMap:GetPlayerByRoleID(dwRoleID)
		if not objPlayer then
			return;
		end
		
		local objMapSys = objPlayer:GetSystem("CMapSystem");
		if objMapSys then
			objMapSys:DoneWithMoveEnd(tbPos);
		end
	elseif dwRoleType == 2 then
		local objPet = objMap:GetPetByRoleID(dwRoleID);
		if not objPet then
			return;
		end
		
		objPet:DoneWithMoveEnd(tbPos);
	end
end;
_G.OnAreaChange = function(dwMapID,dwRoleType,dwRoleID,dwOldArea,dwNewArea)
	local objMap = CMapManager:GetMap(dwMapID);
	if not objMap then
		return;
	end
	
	if dwRoleType == 1 then
		local objMonster = objMap:GetMonsterByObjID(dwRoleID);
		if not objMonster then
			return;
		end
		
		-- local objMoveSys = objMonster:GetSystem("CMonsterMoveSystem");
		-- if objMoveSys then
			-- objMoveSys:DoneWithMoveEnd(tbPos);
		-- end
	elseif dwRoleType == 0 then
		local objPlayer = objMap:GetPlayerByRoleID(dwRoleID)
		if not objPlayer then
			return;
		end
		
		local objMapSys = objPlayer:GetSystem("CMapSystem");
		if objMapSys then
			objMapSys:DoneWithAreaChange(dwOldArea,dwNewArea);
		end
	elseif dwRoleType == 2 then
		
	end
end;
_G.OnCheckerChange = function(dwMapID,dwRoleType,dwRoleID,tbOldID,tbNewID)
	local objMap = CMapManager:GetMap(dwMapID);
	if not objMap then
		return;
	end
	
	if dwRoleType == 1 then
		local objMonster = objMap:GetMonsterByObjID(dwRoleID);
		if not objMonster then
			return;
		end
		
		local objMoveSys = objMonster:GetSystem("CMonsterMoveSystem");
		if objMoveSys then
			objMoveSys:DoneWithCheckerChange(tbOldID,tbNewID);
		end
	elseif dwRoleType == 0 then
		local objPlayer = objMap:GetPlayerByRoleID(dwRoleID)
		if not objPlayer then
			return;
		end
		
		local objMapSys = objPlayer:GetSystem("CMapSystem");
		if objMapSys then
			objMapSys:DoneWithViewChange(tbOldID,tbNewID);
		end
	elseif dwRoleType == 2 then
		local objPet = objMap:GetPetByRoleID(dwRoleID);
		if not objPet then
			return;
		end
		
		objPet:DoneWithCheckerChange(tbOldID,tbNewID);
	end
end
_G.OnSpeedChange = function(dwMapID,dwRoleType,dwRoleID,fSpeed,fX,fY)
	local objMap = CMapManager:GetMap(dwMapID);
	if not objMap then
		return;
	end
	
	local tbPos = 
	{
		x = fX;
		y = fY;
	}
	
	if dwRoleType == 1 then
		local objMonster = objMap:GetMonsterByObjID(dwRoleID);
		if not objMonster then
			return;
		end
		
		local objMoveSys = objMonster:GetSystem("CMonsterMoveSystem");
		if objMoveSys then
			objMoveSys:DoneWithSpeedChange(fSpeed,tbPos);
		end
	elseif dwRoleType == 0 then
		local objPlayer = objMap:GetPlayerByRoleID(dwRoleID)
		if not objPlayer then
			return;
		end
		
		local objMapSys = objPlayer:GetSystem("CMapSystem");
		if objMapSys then
			objMapSys:DoneWithSpeedChange(fSpeed,tbPos);
		end
	elseif dwRoleType == 2 then
		local objPet = objMap:GetPetByRoleID(dwRoleID);
		if not objPet then
			return;
		end
		
		objPet:DoneWithSpeedChange(fSpeed,tbPos);
	end
end


_G.CMapManager = CSingle:new()
-- function CMapManager:new()
	-- local obj = {};
	-- obj.setAllMap = {};
	-- obj.MapConfig = _G.MapInfoConfig;
	
	-- for i ,v in pairs(CMapManager) do
		-- if type(v) == "function" then
			-- obj[i] = v;
		-- end;
	-- end;
	-- return obj;
-- end;

CSingleManager:RegistCSSingle(CMapManager, true);
CSingleManager:AddSingle(CMapManager,true);
CMapManager.nDuplMapID = 100000;
CMapManager.setAllMap = {};
CMapManager.setAllPlayer = {};
CMapManager.MapConfig = _G.MapInfoConfig;
--服务器启动便创建服务器配置的所有地图
function CMapManager:Create(setMapID,dwLineID)
	--print("===CMapManager:Create===",_G.WarHostFlag)
	if _G.WarHostFlag == 0 then
		for i,dwMapID in pairs(GameLineConfig.setMapConfig) do
			local map = self.MapConfig[dwMapID]; 
			if map and type(map) == "table" then
				local objMap = CMap:new(dwMapID, map.dwMapType, map.szMapCog,map.dwHeight,CKernelApp.dwLineID);
				if not objMap then
					_info("objMap is null by CMapManager:Create( )");
					return false;
				end;
				if not objMap:Create() then
					_info("map:Create() is null by CMapManager:Create( )");
					return false;
				end;
				self:AddMap( objMap );
			end;
		end;
	end
	
	_svr:LoadAreaInfo(_G.MapAreaConfig)
	
	_SetStopCall("OnMoveStop");
	_SetAreaCall("OnAreaChange");
	_SetCheckerCall("OnCheckerChange");
	_SetSpeedCall("OnSpeedChange");
	
	return true;
end

function CMapManager:CreateDupl(setMapID, dupl)
	for i,dwMapID in pairs(setMapID) do
		local map = self.MapConfig[dwMapID]; 
		if map and type(map) == "table" then
			local objMap = CMap:new(dwMapID, map.dwMapType, map.szMapCog,map.dwHeight,CKernelApp.dwLineID, dupl.duplDiffTbl, self.nDuplMapID);
			self.nDuplMapID = self.nDuplMapID + 1;
			if not objMap then
				_info("objMap is null by CMapManager:CreateDupl( )");
				return false;
			end;
			if not objMap:Create() then
				_info("map:Create() is null by CMapManager:CreateDupl( )");
				return false;
			end;
			
			if not dupl.map then
				dupl.map = objMap;
				dupl.maps = {};
			end;
			dupl.maps[dwMapID] = objMap;
			objMap.dupl = dupl;
			self:AddDuplMap( objMap );
		end;
	end;
	return true;
end;

--驱动地图
function CMapManager:Update(dwInv)
	for k, map in pairs(self.setAllMap) do
		map:Update(dwInv);
	end
	return true;
end;

--释放地图
function CMapManager:Destroy()
	for k, map in pairs(self.setAllMap) do
		map:Destroy();
		table.remove(self.setAllMap,k);
	end
	self.setAllMap = {};
end;

function CMapManager:EnterMap(objPlayer)
	-- if self.setAllPlayer[objPlayer:GetRoleID()] then
		--已经存在
		-- return false;
	-- end; 
	self.setAllPlayer[objPlayer:GetRoleID()] = objPlayer;
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	local mapId = objMapSystem.dwCurMapID ;
	local map = self.setAllMap[mapId];
	if not map then
		return false;
	end;
	self.setAllPlayer[objPlayer:GetRoleID()] = objPlayer;
	return true;
end;

function CMapManager:ExitMap(objPlayer)
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	if not objMapSystem then
		return ;
	end;
	self.setAllPlayer[objPlayer:GetRoleID()] = nil;
end;

--添加地图
function CMapManager:AddMap(map)
	self.setAllMap[map.MapID] = map;
end
--添加副本地图
function CMapManager:AddDuplMap(map)
	self.setAllMap[map.DuplMapID] = map;
end;

--根据地图ID得到地图
function CMapManager:GetMap(dwMapID )
	return self.setAllMap[dwMapID];
end

function CMapManager:GetPlayer(dwRoleID)
	if not dwRoleID or dwRoleID == 0 then
		return self.setAllPlayer;
	end;
	return self.setAllPlayer[dwRoleID];
end;

--释放地图
function CMapManager:DestroyMap(mapId)
	self.setAllMap[mapId] = nil;
end;