--[[
功能：地图
作者：周华杰
时间：2011-12-22
]]
_G.CMap = { }CMemoryDebug:Show("ObjMap");
--构造方法
function CMap:new( mapID, mapType, mapPath,mapLength, dwLineID, duplDiffTbl, duplMapId)
	local obj = {};
	setmetatable(obj, {__index = CMap});
	obj.MapID = mapID;
	obj.DuplMapID = duplMapId;
	obj.dwMapType = mapType;
	obj.szMapCog = mapPath;
	obj.dwLineID = dwLineID;
	--副本难度系数tbl
	obj.duplDiffTbl = duplDiffTbl;
	--怪物管理器
	obj.objMonMgr = CMonsterManager:new(obj)
	--npc管理器
	obj.objNpcMgr = CNPCManager:new(obj)
	--掉落管理器
	obj.objDropMgr = CDropManager:new(obj)
	obj.setAllPlayer = {};
	
	obj.setAllPet = {};--地图上的所有宠物对象
	
	--地图积分
	obj.setPlayerIntegral = {};
	
	------------add by dll 2012-5-22
	--地图格子二维数组,CMapChecker对象
	obj.setChecker = {};
	--格子边界坐标数组
	obj.setCoordinateX = {};
	obj.setCoordinateY = {};
	--地图边长
	obj.dwLength = mapLength;
	------------add end
	
	----add by zcs
	obj.dwPlayerNum = 0--地图当前玩家数量
	----add end
	
	obj.dwLogicID = 0;--逻辑ID
	
	obj.objMyTimer = COwnTimer:new();
	obj.bTimerNeedUpdate = true;
	
	CMemoryDebug:AddObject("ObjMap", obj);
	return obj;
end

function CMap:Create() 
	local szAllFile = (CConfig.szCogPath or "../Client/resfile/scn/terrain/")..string.lower(self.szMapCog);
	local dwCheckerLength = MapInfoConfig.fCheckerLength;
	if self.dwMapType ~= 0 then
		dwCheckerLength = self.dwLength;
		
		local cfg = MapInfoConfig[self.MapID];
		if cfg and cfg.dwNeedChecker==1 then
			dwCheckerLength = MapInfoConfig.fCheckerLength;
		end
	end
	self.dwLogicID = _CreateMapLogic(self:GetRealID(),self.MapID,self.dwLength,dwCheckerLength,0,0,szAllFile);
	------------add end
	--创建npc
	if not self.objNpcMgr:Create() then
		return false
	end
	--创建怪物
	if not self.objMonMgr:Create(self.duplDiffTbl) then
		return false
	end
	--创建掉落管理器
	if not self.objDropMgr:Create() then
		return false
	end
	
	self.tbFun = CScriptManager:GetScript(ScriptTypeConfig.MapLogic,self.MapID) or {};
	return true;
end;
function CMap:Update(dwDelayTime)
	if self.tbFun.Update then
		self.tbFun:Update();
	end
	if self.bTimerNeedUpdate then
		self.objMyTimer:Update(dwDelayTime);
	end
	if (self.dwPlayerNum==0) and (self.objMonMgr.dwNowEscortNum==0) and not MapInfoConfig[self.MapID].bPlayerDrive then 
		self.objMonMgr:StopDriver()
		return 
	end;--zcs add 2012-11-7
	--怪物更新
	self.objMonMgr:Update(dwDelayTime)
	--npc更新
	self.objNpcMgr:Update(dwDelayTime)
	--掉落更新
	self.objDropMgr:Update(dwDelayTime)
end;

function CMap:Destroy()
	self.dupl = nil;
	--销毁怪物
	self.objMonMgr:Destroy()
	--销毁npc
	self.objNpcMgr:Destroy()
	--销毁掉落
	self.objDropMgr:Destroy()
	
	_DeleteMapLogic(self.dwLogicID);
	self:DelIntegral();
end;
function CMap:GetRealID()
	if self.DuplMapID then
		return self.DuplMapID;
	else
		return self.MapID;
	end
end

--获得此地图所在线路
function CMap:GetLineID()
	return self.dwLineID
end
--获得怪物管理器
function CMap:GetMonsterMgr()
	return self.objMonMgr;
end
--根据对象id获得Monster
function CMap:GetMonsterByObjID(dwObjID)
	return self.objMonMgr:GetMonsterInfo(dwObjID)
end
--获得npc管理器
function CMap:GetNpcMgr()
	return self.objNpcMgr
end
--根据id获得npc
function CMap:GetNpcByObjID(dwObjID)
	return self.objNpcMgr:GetNpcInfo(dwObjID)
end
--获得掉落管理器
function CMap:GetDropMgr()
	return self.objDropMgr
end
--根据id获得物品
function CMap:GetItemByObjID(dwObjID)
	return self.objDropMgr:GetItem(dwObjID)
end
function CMap:GetMapLogicID()
	return self.dwLogicID;
end

function CMap:AddPlayer(objPlayer)
	if self.setAllPlayer[objPlayer:GetRoleID()] then
		--已经存在
		_err("self.setAllPlayer");
		return false;
	end; 
	
	local objMapSystem = objPlayer:GetSystem('CMapSystem');
	if not objMapSystem then
		return false;
	end
	objMapSystem:ClearMoveInfo();
	--local tbPos = objMapSystem:GetPlayerPos();
	if not self:IsUsefulPos(objMapSystem.fXPos,objMapSystem.fYPos) then
		self:ResetPlayer(objMapSystem)
		-- _err("player pos out map")
		-- return false;
	end
	
	--进入地图后的PK广播
	local objPKSys = objPlayer:GetSystem("CPKSystem");
	if objPKSys and objPKSys.dwPKValue >= PKConfig.dwNoticeGuilty then
		local dwWordID = 2000360004;
		
		local tbNet = {};
		for k,v in pairs(self.setAllPlayer)do
			table.insert(tbNet,v.objNet);
		end
		
		_groupcallout(tbNet,
		"OnWarSystemNoticeMsg", 
		{
			StringID = dwWordID;
			Param = {objPlayer:GetName()};
			RoleID = objPlayer:GetRoleID();
		});
	end
	
	_InsertNode(self:GetMapLogicID(),objMapSystem.dwLogicID,objMapSystem.fXPos,objMapSystem.fYPos);
	
	self.setAllPlayer[objPlayer:GetRoleID()] = objPlayer;
	self.dwPlayerNum = self.dwPlayerNum + 1;
	
	-- if self.tbFun.EventPlayerEnter then
		-- self.tbFun:EventPlayerEnter(self,objPlayer);
	-- end
	self:InitIntegral(objPlayer);
	
	if MapEventCenterConfig[self.MapID] then
		objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(MapEventCenterConfig[self.MapID]);
	end
	return true;
end;
--调用进入场景脚本
function CMap:CallEnterScript(objPlayer)
	if self.tbFun.EventPlayerEnter then
		self.tbFun:EventPlayerEnter(self,objPlayer);
	end
end
--重置玩家到出生点
function CMap:ResetPlayer(objMapSystem)
	local vPos = MapInfoConfig[self.MapID].point[99]
	objMapSystem.fXPos = vPos.fXPos
	objMapSystem.fYPos = vPos.fYPos
	
	-- self:AddPlayer(objPlayer)
end

function CMap:DelPlayer(objPlayer)
	if not self.setAllPlayer[objPlayer:GetRoleID()] then
		--已经存在
		return false;
	end; 
	self.setAllPlayer[objPlayer:GetRoleID()] = nil;
	local objMapSystem = objPlayer:GetSystem('CMapSystem');
	if not CConfig.bIsCrossSvr then
		local objPetSystem = objPlayer:GetSystem('CPetSystem');
		if objPetSystem then
			objPetSystem:OnLeaveCurMap();
		end
	end;
	_RemoveNode(self.dwLogicID,objMapSystem.dwLogicID);
	
	self.dwPlayerNum = self.dwPlayerNum - 1
	
	if self.tbFun.EventPlayerExit then
		self.tbFun:EventPlayerExit(self,objPlayer);
	end
	-- if self.setPlayerIntegral[objPlayer:GetRoleID()] then
		-- self.setPlayerIntegral[objPlayer:GetRoleID()] = nil;
	-- end;
end;

function CMap:AddPet(objPet)
	if self.setAllPet[objPet:GetRoleID()] then
		return;
	end
	
	self.setAllPet[objPet:GetRoleID()] = objPet;
end;

function CMap:DelPet(objPet)
	if not self.setAllPet[objPet:GetRoleID()] then
		return;
	end
	
	self.setAllPet[objPet:GetRoleID()] = nil;
end;

--得到所有的宠物
function CMap:GetAllPet(dwRoleID)
	if dwRoleID and dwRoleID > 0 then
		return self.setAllPet[dwRoleID];
	end
	return self.setAllPet;
end

--得到所有的玩家
function CMap:GetAllPlayer(dwRoleID)
	if dwRoleID and dwRoleID >0 then
		return self.setAllPlayer[dwRoleID];
	end;
	return self.setAllPlayer;
end;
--得到本地图玩家数量
function CMap:GetAllPlayerNum()
	return self.dwPlayerNum
end
--得到自己能看到的区域的网用户
function CMap:GetCanLookPlayer(objPlayer)
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	if not mapSystem then
		return nil;
	end;
	local setCanSeePlayer = {}
	local tbID = _GetCanLookArray(mapSystem:GetLogicID(),0);
	if tbID then
		for k,v in pairs (tbID) do
			local objSee = self:GetPlayerByRoleID(v);
			if objSee then
				setCanSeePlayer[v] = objSee;
			end
		end
	end
	return setCanSeePlayer;
end;

--得到自己能看见的怪物
function CMap:GetCanLookMonster(objPlayer)
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	if not mapSystem then
		return nil;
	end;
	local setCanSeeMonster = {}
	local tbID = _GetCanLookArray(mapSystem:GetLogicID(),1);
	
	if not tbID then
		return setCanSeeMonster;
	end
	for k,v in pairs (tbID) do
		local objMonster = self.objMonMgr.Nodes[v] ;
		if objMonster then
			setCanSeeMonster[v] = objMonster;
		end
	end
	return setCanSeeMonster;
end;
--得到自己能看见的掉落物品
function CMap:GetCanLookDroper(objPlayer)
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	if not mapSystem then
		return nil;
	end;
	local setCanSeeDroper = {}
	local tbID = _GetCanLookArray(mapSystem:GetLogicID(),3);
	
	if not tbID then
		return setCanSeeDroper;
	end
	for k,v in pairs (tbID) do
		local objDrop = self.objDropMgr:GetItem(v);
		if objDrop then
			setCanSeeDroper[v] = objDrop;
		end
	end
	return setCanSeeDroper;
end;
--得到我能看到的所有演武
function CMap:GetCanLookMartial(objPlayer)
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	if not mapSystem then
		return nil;
	end;
	local setCanSeeMartial = {}
	local tbID = _GetCanLookArray(mapSystem:GetLogicID(),4);
	
	if not tbID then
		return setCanSeeMartial;
	end
	for k,v in pairs (tbID) do
		local objMartial = CMartialManager:FindMartial(v);
		if objMartial then
			setCanSeeMartial[v] = objMartial;
		end
	end
	return setCanSeeMartial;
end;
--得到能看到的所有宠物
function CMap:GetCanLookPet(objPlayer)
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	if not mapSystem then
		return nil;
	end;
	
	local setCanSeePet = {};
	local tbID = _GetCanLookArray(mapSystem:GetLogicID(),2);
	
	if not tbID then
		return setCanSeePet;
	end
	for k,v in pairs (tbID) do
		local objPet = self:GetPetByRoleID(v);
		if objPet then
			setCanSeePet[v] = objPet;
		end
	end
	return setCanSeePet;
end;

--得到能看到该怪物的所有玩家
function CMap:GetCanSeePlayer(objMonster)
	return self:GetMonsterCanSeePlayer(objMonster)
end
--得到能看到该怪物的所有玩家
function CMap:GetMonsterCanSeePlayer(objMonster)
	local setCanSeePlayer = {}
	local tbID = _GetCanLookArray(objMonster:GetLogicID(),0);
	
	if not tbID then
		return setCanSeePlayer;
	end
	
	for k,v in pairs (tbID) do
		local objPlayer = self:GetPlayerByRoleID(v);
		if objPlayer then
			setCanSeePlayer[v] = objPlayer;
		end
	end
	
	return setCanSeePlayer
end;

--返回怪物范围内的一个玩家
function CMap:GetMonsterRangePlayer(objMonster,dwRange)
	local setCanSeePlayer = {}
	local tbID = _GetRoleByRange(objMonster:GetLogicID(),dwRange);
	if not tbID then
		return setCanSeePlayer;
	end
	
	for k,v in pairs (tbID) do
		local objPlayer = self:GetPlayerByRoleID(v);
		if objPlayer then
			setCanSeePlayer[v] = objPlayer;
		end
	end
	
	return setCanSeePlayer
end;

--得到能看到该物品的所有玩家
function CMap:GetDroperCanSeePlayer(objDroper)
	local setCanSeePlayer = {}
	
	local tbID = _GetCanLookArray(objDroper:GetLogicID(),0);
	if not tbID then
		return setCanSeePlayer;
	end
	
	for k,v in pairs (tbID) do
		local objPlayer = self:GetPlayerByRoleID(v);
		if objPlayer then
			setCanSeePlayer[v] = objPlayer;
		end
	end
	
	-- for k,v in pairs (objDroper.setCanSeeEntity) do
		-- for k1,_ in pairs (self.setChecker[v.x][v.y].setAllPlayer) do 
			-- setCanSeePlayer[k1] = self.setAllPlayer[k1]; 
		-- end
	-- end
	return setCanSeePlayer
end;
--得到看到这个演武的所有玩家
function CMap:GetMartialCanSeePlayer(objMartial)
	local setCanSeePlayer = {};
	
	local tbID = _GetCanLookArray(objMartial:GetLogicID(),0);
	if not tbID then
		return setCanSeePlayer;
	end
	
	for k,v in pairs (tbID) do
		local objPlayer = self:GetPlayerByRoleID(v);
		if objPlayer then
			setCanSeePlayer[v] = objPlayer;
		end
	end
	
	
	return setCanSeePlayer;
end;

--根据RoleID获得玩家
function CMap:GetPlayerByRoleID(dwRoleID)
	return self.setAllPlayer[dwRoleID];
end;

function CMap:GetPetByRoleID(dwRoleID)
	return self.setAllPet[dwRoleID];
end;

--得到地图配置
function CMap:GetConfig()
	return MapInfoConfig[self.MapID];
end;
function CMap:ComPosInRange(objPoint,vecPos) 
	local vecDist = Vector2.sub(Vector2.new(objPoint.fXPos,objPoint.fYPos),Vector2.new(vecPos.x,vecPos.y));
	return vecDist:magnitude() < objPoint.fRange;
end;
--得到玩家所在的传送点
function CMap:GetTransPoint(objPlayer) --quying chg 2012-04-21  增加两个参数,用作副本传送
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	if not mapSystem then
		return nil;
	end;
	local tbPos = mapSystem:GetPlayerPos();
	local mePos = Vector2.new(tbPos.x,tbPos.y);
	local mapInfo = self:GetConfig();
	for i,Point in pairs(mapInfo.point) do 
		if Point.dwType ~= 2 and Point.dwType ~= 4 and self:ComPosInRange(Point,mePos) then --穿出门
			return Point;
		end;
	end;
--quying add 2012-04-21
	
	return nil;
end;

--得到地图的复活点
--返回：mapid，pos
function CMap:GetRelivePoint()
	local mapInfo = self:GetConfig();
	local pointTbl = {};
	local Point = nil;
	local pointId = nil;
	for i,Point in pairs(mapInfo.point) do
		if Point.dwType == 4 then
			table.insert(pointTbl, i);
		end
	end
	if #(pointTbl) == 0 then
	
	elseif #(pointTbl) == 1 then
		Point = mapInfo.point[pointTbl[1]]
	elseif #(pointTbl) > 1 then
		local seed = math.random(1, #(pointTbl));
		pointId = pointTbl[seed]
		Point = mapInfo.point[pointId]
	end;
	return Point, pointId;
end; 

--寻路相关
function CMap:GetPath(vecSrc,vecDis) 
	local tbRsl = _FindPath(self:GetMapLogicID(),vecSrc.x,vecSrc.y,vecDis.x,vecDis.y);
	if not tbRsl then
		return nil;
	end;
	if not tbRsl[1] then
		return nil;
	end
	
	return tbRsl;
end;

--判断地图上某点是不是可以走
function CMap:CanMoveTo(vecSrc,vecDis)
	return _CanMoveTo(self:GetMapLogicID(),vecSrc.x,vecSrc.y,vecDis.x,vecDis.y);

end;

function CMap:EventPlayerAreaChange(objPlayer,dwOldArea,dwNewArea)
	-- if not self.tbFun then
		-- return;
	-- end
	if self.tbFun.EventAreaChange then
		self.tbFun:EventAreaChange(self,objPlayer,dwOldArea,dwNewArea);
	end
end;

-----------------------------------------------------------------------------
--通知客户端开始倒计时
function CMap:NoticeCountDown(objPlayer,dwTime)
	--print("==NoticeCountDown=== send")
	objPlayer.OnBeginCountDownMsg{LengthTime = dwTime,MapID = self.MapID};
end;

--倒计时结束
function CMap:CountDownOver(objPlayer)
	if self.tbFun.EventPlayerCountDown then
		self.tbFun:EventPlayerCountDown(self,objPlayer);
	end
end;

---通过地图获得副本对象
function CMap:GetDuplObj()
	return self.dupl;
end;

--广播消息
function CMap:BroadcastNotice(dwNoticeType,dwStringID,...)
	local tbParam = {...};
	
	for id,objPlayer in pairs(self.setAllPlayer)do
		objPlayer.OnWarNoticeMsg
		{
			NoticeType = dwNoticeType;
			StringID = dwStringID;
			Param = tbParam;
		}
	end
end;
--初始化积分
function CMap:InitIntegral(objPlayer)
	if not self.setPlayerIntegral[objPlayer:GetRoleID()] then
		self.setPlayerIntegral[objPlayer:GetRoleID()] = 0;
	end;
end;
--清空
function CMap:DelIntegral()
	self.setPlayerIntegral = {};
end;
--设置积分
function CMap:SetIntegral(objPlayer, score, duplId) 	
	if not objPlayer then
		_err("CMap:SetIntegral objPlayer is nil");
		return; 
	end;
	local playerId = objPlayer:GetRoleID();
	local haveScore = self.setPlayerIntegral[playerId] or 0;
	
	local duplSystem = objPlayer:GetSystem("CDuplSystem");
	if duplSystem then
		--请求更新积分
		if duplSystem:CheckSendJiFen() then
			self.setPlayerIntegral[playerId] = haveScore + score;
			objPlayer.SendJiFenMsg{Score = self.setPlayerIntegral[playerId]};
		end;
	end;
end;
--获得玩家的积分
function CMap:GetIntegral(objPlayer)
	if not objPlayer then
		_err("CMap:GetIntegral objPlayer is nil");
		return; 
	end;
	local playerId = objPlayer:GetRoleID();
	return self.setPlayerIntegral[playerId];
end;

--这个坐标是否是正确的
function CMap:IsUsefulPos(fX,fY)
	local fBase = self.dwLength / 2;
	
	if fX > fBase then
		return false;
	elseif fX < -fBase then
		return false;
	elseif fY > fBase then
		return false;
	elseif fY < -fBase then
		return false;
	end
	
	return true;
end;

function CMap:AddTimeEvent(dwDelay,func)
	self.objMyTimer:AddEvent(dwDelay,func)
end;

--停止所有的更新事件  停止定时刷怪
function CMap:SetTimerUpdate(bNeedUpdate)
	self.bTimerNeedUpdate = bNeedUpdate;
end
