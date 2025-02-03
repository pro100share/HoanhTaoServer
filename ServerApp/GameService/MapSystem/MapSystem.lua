--[[
功能：地图系统类
作者：秦隆吉
时间：2011-12-22
修改者:周华杰
]]
_G.CMapSystem = {};
function CMapSystem:new()
	local obj = CSystem:new("CMapSystem");
	obj.fXPos = 0;		--玩家的x位置
	obj.fYPos = 0;		--玩家的Y位置
	obj.fDirValue = 0;   --玩家的方向
	obj.fSpeed = 500;	 --玩家的移动速度
	obj.dwCurMapID = 0 ; --玩家当前所在地图
	obj.sDuplInfo   = nil ;--如果是副本的时候用来记录副本ID,同时也表示是不是在副本中
	
	obj.objCurChecker = nil; --玩家当前所在的格子
	obj.objDBQuery = nil;    --对应的数据库操作模块
	
	obj.bIsCanSync = false;  --玩家当前是不是需要同步  
	obj.dwLostMoveTime = 0; --用来记录上一次模拟位移的时间，用于计算模拟位移
	
	obj.bMoving = false; --当前是否在移动中
	---------------------------------------------add by dll 2012-5-23
	
	obj.fXPosDes = 0;		--玩家的移动终点x位置
	obj.fYPosDes = 0;		--玩家的移动终点Y位置
	obj.bUseCanToChecker = false;
	obj.dwTimeStamp = 0
	---------------------------------------------add by dll 2012-7-3 缓冲切换格子
	obj.setOldPlayer = {}
	obj.setNewPlayer = {}
	---
	obj.dwLogicID = 0;
	
	obj.dwErrorCount = 0;	--记录移动时异常的次数
	
	obj.setUpdateTick = {};--上次同步的时间
	
	-- obj.fMoveEndSpeedCode = 0;--移动速度检测
	-- obj.dwMoveCheckCount = 0;--移动检测的次数
	
	for i,v in pairs(CMapSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

function CMapSystem:Create(bIsChangeLine)
    -- 创建数据库对象  
	self.bSafeFlag = false;
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end; 
	local objDB = objPlayer:GetDBQuery();
	self.objDBQuery = CMapSystemDBQuery:new(objDB,self);
	if not self.objDBQuery then
		return false;
	end; 
	
		
	if objPlayer:GetLineData("CMapSystem") then
		local Data = objPlayer:GetLineData("CMapSystem")[1];
		if Data then
			self.dwCurMapID = Data[1];
			self.fXPos = Data[2];
			self.fYPos = Data[3];
			self.fDirValue = Data[4];
		end;
	end;
	
	--发送玩家自己的显示信息
	--主玩家信息 
	local sInfo = objPlayer:GetInfo();
	local tbSendInfo = {};
	for n,v in pairs(sInfo)do
		local key = GetAttrNameToIndex(n);
		if key then
			tbSendInfo[key] = v;
		end
	end
	--发玩家属性
	objPlayer.OnMeShowInfoMsg{PlayerInfo = tbSendInfo};
	--清空移动同步时间倒计时
	self.dwLostMoveTime = 0;
	--初始化玩家移动速度
	local objSkillSystem = objPlayer:GetSystem("CSkillSystem");
	if objSkillSystem and not CConfig.bIsCrossSvr then
		self.fSpeed = objSkillSystem:GetInfo().dwMoveSpeed;
	else
		self.fSpeed = 500;
	end;
	--是否需要修正
	local isNeedRepair = true;
	local DataBase = objPlayer:GetLineData("CWarSystem");
	if DataBase then
		local Data = DataBase[1];
		if Data then
			if Data.isEnter then
				--如果是进入战场，就不需要对角色的地图进行修复
				--WarSystem的OnChangeLineEnd中会修改角色的地图信息
				isNeedRepair = false;
			end
		end
	end
	local DuplData = objPlayer:GetLineData("CDuplSystem")[1]
	if DuplData then
		
		if DuplData[9] then
			isNeedRepair = false;
		end;
	end;
	
	if isNeedRepair then
		local objMap = self:GetCurMap();
		if not objMap then
			--发现地图不正确，尝试修复
			self:RepairMapInfo();
			objMap = self:GetCurMap();
		end; 
		if objMap then
			local cfgMap = MapInfoConfig[objMap.MapID];
			
			local fRX = cfgMap.fReviseX or 0;
			local fRY = cfgMap.fReviseY or 0;
			local posBeg = {x = fRX,y = fRY};
			local posEnd = {x = self.fXPos,y = self.fYPos};
			if not objMap:CanMoveTo(posBeg,posEnd) then
				self.fXPos = fRX;		--玩家的x位置
				self.fYPos = fRY;		--玩家的Y位置 
			end
		end;
	end
	
	self.dwLogicID = _CreateMapNode(0,objPlayer:GetRoleID(),objPlayer.objNet);
	
	return true;
end
local DoPlayerFuncAddNewPlayer = function(dwRoleID,OtherPlayer,sendFunc,obj)
	local objMapSystem = OtherPlayer:GetSystem("CMapSystem");
	if not objMapSystem then
		return false;
	end;
	--玩家还未同步允许
	if not objMapSystem.bIsCanSync then
		return false;
	end;
	
	if not sendFunc(obj,OtherPlayer) then
		return false; 
	end;
	return true;
end;
local DoPlayerFuncDelOldPlayer = function(dwRoleID,objPlayer,sendFunc) 
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	if not objMapSystem then
		return false;
	end;
	--玩家还未同步允许
	if not objMapSystem.bIsCanSync then
		return false;
	end; 
	objPlayer.OnHidePlayerMsg{List = {dwRoleID}}; 
	return true;
end; 
function CMapSystem:Update(dwInterval)
	local objPlayer = self:GetPlayer();
	local tbPos = self:GetPlayerPos();
	for dwRoleID,_ in pairs(self.setNewPlayer) do
		if dwRoleID ~= objPlayer:GetRoleID() then
			local objNew = objPlayer:GetOtherPlayer(dwRoleID,2);
			if objNew then
				DoPlayerFuncAddNewPlayer(dwRoleID,objNew,self.SendPlayerToMe,self)
				DoPlayerFuncAddNewPlayer(dwRoleID,objNew,self.SendMeToPlayer,self);
			end
			self.setNewPlayer[dwRoleID] = nil
			break
		end;
	end;
	
end

function CMapSystem:Destroy()
	--玩家退出线
	--quying chg 2012-07-19 
	local objPlayer = self:GetPlayer();
	if not CConfig.bIsCrossSvr then
		local duplSystem = objPlayer:GetSystem("CDuplSystem");
		local duplId = 0;
		if duplSystem then
			duplId = duplSystem:GetDuplId();
		end;
	
		local tbMapInfo = nil;
		local objWarSys = objPlayer:GetSystem("CWarSystem");
		if objWarSys then
			tbMapInfo = objWarSys:DoneWithOffLine(self);
		end
		
		local duplSystem = objPlayer:GetSystem("CDuplSystem");
		if duplSystem then
			tbMapInfo = duplSystem:DoneDuplWithOffLine(self);
		end;
		
		-- local objCrossSys = objPlayer:GetSystem("CCrossSvrSystem");
		-- if objCrossSys then
			-- tbMapInfo = objCrossSys:DoneWithOffLine(self);
		-- end;
		
		if self.objDBQuery then
			self.objDBQuery:SaveMapInfo(duplId,tbMapInfo);
		end;
	end;
	--处理退出地图 
	self:DoPlayerExitGame(); 
	--退出地图
	CMapManager:ExitMap(objPlayer);
	
	_DeleteMapNode(self.dwLogicID);
	--CGameLineManager:ExitLine(objPlayer);
end;

--修复地图数据
function CMapSystem:RepairMapInfo()
	self.dwCurMapID = ResetMapInfoByError.dwMapID; --玩家当前所在地图
	
	local cfgMap = MapInfoConfig[self.dwCurMapID];
	if not cfgMap then
		return;
	end
	local pointInfo = cfgMap.point[ResetMapInfoByError.dwPointID];
	
	self.fXPos = pointInfo.fXPos;		--玩家的x位置
	self.fYPos = pointInfo.fYPos;		--玩家的Y位置
	self.fDirValue = math.random(0,6);   --玩家的方向
end;

function CMapSystem:GetLogicID()
	return self.dwLogicID;
end

function CMapSystem:GetCurMapID()
	if self.sDuplInfo then
		return self.sDuplInfo.dwMapID,self.sDuplInfo.dwMapCfgId;
	else
		return self.dwCurMapID;
	end
end;
---------------------------------------------------------------
---------------------------------------------------------------
--返回一个范围内的玩家
--return : {dwRoleID,objPlayer} dwRange == 0 返回所有玩家
function CMapSystem:GetPlayerByRange(dwRange)
	------------------------------add by 段磊磊 2012-4-9
	local objMe = self:GetPlayer();
	if not objMe then
		return false;
	end;
	local Map = self:GetCurMap()
	local t = {}
	local dwDis = 0
	local allPlayer = Map:GetCanLookPlayer(objMe)
	for k,v in pairs (allPlayer) do
		dwDis = objMe:GetDisByPlayer(k);
		if dwDis ~= -1 and dwDis <= dwRange then
			t[k] = allPlayer[k]
		end
	end
	return t
	--------------------------add end
end;

--返回一定范围内的怪物 dwRange == 0 返回所有怪物
function CMapSystem:GetMonsterByRange(dwRange)
	local Map = self:GetCurMap()	
	local mgrMonster = Map:GetMonsterMgr()
	local vPos = self:GetPlayerPos()
	return mgrMonster:GetMonsterObjIdByPosNRange(dwRange,vPos)
end;
--通过RoleID得到玩家
function CMapSystem:GetRoleByID(dwRoleID)
	local map = self:GetCurMap();
	if not map then
		_err("map id error",self:GetCurMapID());
		return false;
	end;
	return map:GetPlayerByRoleID(dwRoleID);
	
end;
--得到所有玩家
function CMapSystem:GetAllPlayer()
	local map = self:GetCurMap();
	if not map then
		_err("map id error",self:GetCurMapID());
		return false;
	end;
	return map:GetAllPlayer();
	
end;
--返回玩家自身的地图位置
function CMapSystem:GetPlayerPos()
	local tbRsl = {x=self.fXPos;y=self.fYPos};
	
	if self.tbMoveActionInfo and self.tbMoveActionInfo.dwBegin then
		local dwTimeDis = GetCurTime() - self.tbMoveActionInfo.dwBegin;
		
		if dwTimeDis < 0 then
			dwTimeDis = 0;
		end
		
		if dwTimeDis < self.tbMoveActionInfo.dwTime then
			tbRsl.x = self.fXPos + self.tbMoveActionInfo.vecDis.x*dwTimeDis/self.tbMoveActionInfo.dwTime;
			tbRsl.y = self.fYPos + self.tbMoveActionInfo.vecDis.y*dwTimeDis/self.tbMoveActionInfo.dwTime;
		else
			self:EndMoveAction();
			
			tbRsl.x = self.fXPos;
			tbRsl.y = self.fYPos;
		end
		
		return tbRsl;
	end
	
	if self.bMoving then
		local dwTimeDis = GetCurTime() - self.tmMoveBegin;
		
		tbRsl.x = self.fXPos + self.vecSpeed.x*dwTimeDis;
		tbRsl.y = self.fYPos + self.vecSpeed.y*dwTimeDis;
	end
	
	return tbRsl;
end;

------对角色的移动技能导致的位置偏差进行修正的函数
function CMapSystem:BeginMoveAction(dwTime,vecPos)
	if not vecPos.x then
		self.tbMoveActionInfo = nil;
		return;
	end
	if not vecPos.y then
		self.tbMoveActionInfo = nil;
		return;
	end
	
	self.tbMoveActionInfo = {};
	
	local posDis = {};
	posDis.x = vecPos.x - self.fXPos;
	posDis.y = vecPos.y - self.fYPos;
	
	self.tbMoveActionInfo.dwBegin = GetCurTime();
	self.tbMoveActionInfo.dwTime = dwTime;
	self.tbMoveActionInfo.vecDis = posDis;
	self.tbMoveActionInfo.vecMoceTo = vecPos;
end;

function CMapSystem:EndMoveAction()
	-- local tbNowPos = self:GetPlayerPos();
	-- print(GetCurTime().."===EndMoveAction===")
	if self.tbMoveActionInfo then
		self.fXPos = self.tbMoveActionInfo.vecMoceTo.x;
		self.fYPos = self.tbMoveActionInfo.vecMoceTo.y;
	end
	
	self.tbMoveActionInfo = nil;
end;

------
--返回位置函数，按照技能接口的需求修改了返回值
function CMapSystem:GetPlayerMapPos()
	local vecCurPos = self:GetPlayerPos();
	
	if self.sDuplInfo then
		return self.sDuplInfo.dwMapID, vecCurPos.x, vecCurPos.y, self.sDuplInfo.dwMapCfgId;
	end;
	return self.dwCurMapID,vecCurPos.x,vecCurPos.y;
end;

--获取到玩家所在的地图
function CMapSystem:GetCurMap()
	if self.sDuplInfo then 
		return CMapManager:GetMap(self.sDuplInfo.dwMapID);
	else
		return CMapManager:GetMap(self.dwCurMapID);
	end;
end;

function CMapSystem:GetCurMapForLog()
	local objMap = self:GetCurMap();
	if not objMap then
		return {};
	end
	
	return objMap;
end;

---------------------------------------------------------------
--游戏消息 处理
---------------------------------------------------------------
--处理进入游戏请求
function CMapSystem:EnterGame() 
	if self.dwCurMapID == 0 then 
		self:SendEnterMapResult(-1);
		return false;
	end; 
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		self:SendEnterMapResult(-1);
		return false;
	end; 
	local map = self:GetCurMap();
	if not map then
		_err("map id error",self:GetCurMapID());
		self:SendEnterMapResult(-1);
		return false;
	end;  
	--进入地图
	if not map:AddPlayer(objPlayer) then
		_err("Enter map error",objPlayer:GetRoleID());
		self:SendEnterMapResult(-1);
		return false;
	end;  
	--进入成功
	self:SendEnterMapResult(0);
	--调用进入场景脚本
	map:CallEnterScript(objPlayer)
	if not CMapManager:EnterMap(objPlayer) then
		return;
	end;
	return true;
end;

--处理玩家离开游戏
function CMapSystem:DoPlayerExitGame()
	local map = self:GetCurMap();
	if not map then
		_info("error:map is nill by CMapSystem:DoPlayerExitGame",self.dwCurMapID);
		return false;
	end;
	self:DoPlayerExitMap(map,true);
end;

--处理玩家退出当前地图
function CMapSystem:DoPlayerExitMap(objMap,isOver) 
	--删除自己	 
	local objMe = self:GetPlayer();
	if not objMe then 
		return false;
	end; 
	--不是退出游戏的话退出战斗状态
	if not isOver then
		local sysState = objMe:GetSystem("CStateSystem");
		if sysState then
			sysState:ChangeState(enPlayerState.ePS_Normal);
		end; 
	end
	objMap:DelPlayer(objMe);
	
	self.setUpdateTick = {};
	
	--通知其他玩家  
	local setPlayer = objMap:GetAllPlayer();
	if not setPlayer then 
		return false;
	end; 
	--先把别人发送给自己
	local DoPlayerFunc = function(dwRoleID,objPlayer,sendFunc) 
		local objMapSystem = objPlayer:GetSystem("CMapSystem");
		if not objMapSystem then
			return false;
		end;
		--玩家还未同步允许
		if not objMapSystem.bIsCanSync then
			return false;
		end; 
		objPlayer.DelRoleMsg{RoleID = dwRoleID};
		objMapSystem.setUpdateTick[dwRoleID] = nil;
		return true;
	end; 
	for dwRoleID,objPlayer in pairs(setPlayer) do
	   DoPlayerFunc(objMe:GetRoleID(),objPlayer);
	end;
	--可视范围置空
	--self.setCanSeeEntity = {}
end;

--处理切换地图请求
function CMapSystem:ChangeMapRequest()  --quying chg 2012-04-21  增加两个参数,用作副本传送
	local objMe = self:GetPlayer();
	if not objMe then
		self:SendEnterMapResult(-1);
		return false;
	end;
	if self.isChangeMaping then
		-- self:SendEnterMapResult(-1);
		-- _info("Change Map Fail,Changing map",objMe:GetRoleID());
		return false;
	end;
	local CurMap = self:GetCurMap();--可以更具是不是副本取得不同的地图
	if not CurMap then
		_err("CurMap id error",self:GetCurMapID());
		self:SendChangeMapResult(-1);
		return false;
	end;
	--获取当前所在的传送点
	local TransPoint = CurMap:GetTransPoint(objMe);
	
	if not TransPoint then
		--不在传送点
		self:SendChangeMapResult(-1);
		return false;
	end;
	local cfgMap = MapInfoConfig[CurMap.MapID];
	if not cfgMap:TransMapEvent(TransPoint,objMe)  then
		self:SendChangeMapResult(-1);
		return false;
	end;
	--切换成
	self:SendChangeMapResult(0); 
	return true; 
end;
function CMapSystem:MapAskForChangeMap(dwMapId,dwVip)
	local objPlayer = self:GetPlayer()
	local objStateSys = objPlayer:GetSystem("CStateSystem");
	if not objStateSys:CheckPlayerAction(enPlayerAction.ePA_ChgMap) then
		return;
	end
	--战场中不能传送
	local objWarSys = objPlayer:GetSystem("CWarSystem");
	if objWarSys then
		if objWarSys.dwCurWarID ~= 0 then
			return;
		end
	end
	
	dwVip = 0;
	
	if dwVip > 0 then
		local sysItem = objPlayer:GetSystem("CItemSystem")
		if sysItem:IsGoldEnough(dwVip) then
			sysItem:CostGold(dwVip, _G.ItemSysOperType.TransMap)--记录服务付费
			self:ExecTransforMap(dwMapId,99)
		end
	else
		local sysVip = objPlayer:GetSystem("CVipSystem")
		if sysVip:IsVip() then
			--sysVip:ChangeTransNum(-1)
			local cfgMap = MapInfoConfig[dwMapId];
			if cfgMap then
				if cfgMap.dwLevel then
					if objPlayer:GetLevel() < cfgMap.dwLevel then
						return;
					end
				end
				self:ExecTransforMap(dwMapId,99);
			end
		end
	end
end

--复活用把人强制移动到某个地图的某个坐标
function CMapSystem:ReliveTransport()
	local objMe = self:GetPlayer();
	if not objMe then 
		return false;
	end;
	--
	
	local CurMap = self:GetCurMap();
	if not CurMap then
		_err("CurMap id error",self:GetCurMapID()); 
		return false;
	end;
	
	local sPoint, dwPointId = CurMap:GetRelivePoint();
	local cfgMap = MapInfoConfig[CurMap.MapID];
	if not cfgMap:TransMapEvent(sPoint,objMe, dwPointId) then
		return false;
	end;
	if self.sDuplInfo then
		objMe:GetSystem("CDuplSystem"):ExecExitDuplByDead();
	end;
	return true; 
end;

function CMapSystem:ReqEnterDupl(dwDuplID,dwPointID, index)
	local objMe = self:GetPlayer();
	local objDuplSystem = objMe:GetSystem("CDuplSystem");
	if not objMe then
		return;
	end;
	return objDuplSystem:ReqEnterDupl(dwDuplID,dwPointID, index);
end;

function CMapSystem:ReqEnterByItem(dwDuplID,dwPointID, index, itemEnum)
	local objMe = self:GetPlayer();
	local objDuplSystem = objMe:GetSystem("CDuplSystem");
	if not objMe then
		return;
	end;
	return objDuplSystem:ReqEnterByItem(dwDuplID,dwPointID, index, itemEnum);
end;

function CMapSystem:ReqEnterDuplXY(dwDuplID,dwMapID,fXPos,fYPos,fDirValue)
	local objMe = self:GetPlayer();
	local objDuplSystem = objMe:GetSystem("CDuplSystem");
	return objDuplSystem:ReqEnterDuplXY(dwDuplID,dwMapID,fXPos,fYPos,fDirValue)
end;

function CMapSystem:ExecEnterDupl(dwDuplID,dwMapID,dwPointID)
	local objMe = self:GetPlayer();
	local objDuplSystem = objMe:GetSystem("CDuplSystem");
	return objDuplSystem:ExecEnterDupl(dwDuplID,dwMapID,dwPointID);
end;

function CMapSystem:ExecEnterDuplXY(dwDuplID,dwMapID,fXPos,fYPos,fDirValue)
	local objMe = self:GetPlayer();
	local objDuplSystem = objMe:GetSystem("CDuplSystem");
	return objDuplSystem:ExecEnterDuplXY(dwDuplID,dwMapID,fXPos,fYPos,fDirValue)
end;

function CMapSystem:ExecExitDupl(dwMapID,dwPointID)
	local objMe = self:GetPlayer();
	local objDuplSystem = objMe:GetSystem("CDuplSystem");
	return objDuplSystem:ExecExitDupl(dwMapID,dwPointID)
end;

function CMapSystem:ExecExitDuplXY(dwMapID,fXPos,fYPos,fDirValue)
	local objMe = self:GetPlayer();
	local objDuplSystem = objMe:GetSystem("CDuplSystem");
	return objDuplSystem:ExecExitDuplXY(dwMapID,fXPos,fYPos,fDirValue, true)
end;

--提供给脚本调用的传说送接口
function CMapSystem:ExecTransforMap(dwNewMapID,dwPointID)
	local newMapInfo = MapInfoConfig[dwNewMapID];
	if not newMapInfo then
		_err("newMapInfo id error",dwNewMapID);
		self:SendChangeMapResult(-1);
		return false;
	end;
	local newPoint = newMapInfo.point[dwPointID];
	
	--改变自己的地图属性 
	local fXPos = newPoint.fXPos + math.random(-newPoint.fRange,newPoint.fRange);		--玩家的x位置
	local fYPos = newPoint.fYPos + math.random(-newPoint.fRange,newPoint.fRange);		--玩家的Y位置
	local fDirValue = math.random(0,6);   --玩家的方向
    return self:ExecTransforMapXY(dwNewMapID,fXPos,fYPos,fDirValue);
end;
---世家召唤传送
function CMapSystem:ExecTransforMapToPoint(tabInfo) 
	local fXPos = tabInfo.fXPos + math.random(-_G.GuildCallMemberConfig.FRange,_G.GuildCallMemberConfig.FRange);		--玩家的x位置
	local fYPos = tabInfo.fYPos + math.random(-_G.GuildCallMemberConfig.FRange,_G.GuildCallMemberConfig.FRange);		--玩家的Y位置
	local fDirValue = math.random(0,6);   --玩家的方向
    return self:ExecTransforMapXY(tabInfo.dwNewMapID,fXPos,fYPos,fDirValue);
end
function CMapSystem:ExecTransforMapXY(dwNewMapID,fXPos,fYPos,fDirValue)
	--检测map是否存在
	if self.sDuplInfo then --副本之间的传送
		if not CMapManager:GetMap(dwNewMapID) then
			local duplSys = self:GetPlayer():GetSystem("CDuplSystem");
			local dupl = duplSys.objCurDupl;
			local map = dupl.maps[dwNewMapID];
			if map then
				if not CMapManager:GetMap(map.DuplMapID) then
					_err();
					return false;
				end; 
			else
				_err();
				return false;
			end;
		end;
	else
		if not CConfig.bIsCrossSvr then
			local duplSystem = self:GetPlayer():GetSystem("CDuplSystem");
			if duplSystem then
				if duplSystem.objCurDupl then
					local duplId = duplSystem.objCurDupl.dwCfgID
					if DuplConfig[duplId].bInShow == 0 then 
						if not CMapManager:GetMap(dwNewMapID) then
							local dupl = duplSystem.objCurDupl;
							local map = dupl.maps[dwNewMapID];
							if map then
								if not CMapManager:GetMap(map.DuplMapID) then
									_err();
									return false;
								end; 
							else
								_err();
								return false;
							end;
						end;
					else
						if not CMapManager:GetMap(dwNewMapID) then
							_err();
							return false;
						end; 
					end
				end
			end;
		end;
	end; 
	 
	--进入的新地图
	local newMapInfo = MapInfoConfig[dwNewMapID];
	if not newMapInfo then
		_err("newMapInfo id error",dwNewMapID); 
		return false;
	end;   
	
	--改变自己的地图属性   
	local sInfo = 
	{ 
		dwMapID =  dwNewMapID ,
		fXPos = fXPos,		--玩家的x位置
		fYPos = fYPos,		--玩家的Y位置
		fDirValue = fDirValue,   --玩家的方向 
	}; 
	if self.sDuplInfo then --副本之间的传送
		local duplSys = self:GetPlayer():GetSystem("CDuplSystem");
		local dupl = duplSys.objCurDupl;
		if dupl then
			local map = dupl.maps[dwNewMapID];
			if map then
				sInfo.sDuplInfo = {};
				sInfo.sDuplInfo.dwLineID = self.sDuplInfo.dwLineID;
				dupl.map = map;
				sInfo.sDuplInfo.dwMapID = dupl.map.DuplMapID;
				sInfo.sDuplInfo.dwMapCfgId = dwNewMapID;
				sInfo.dwMapID = dupl.map.DuplMapID;
			else
				sInfo.sDuplInfo = {};
				sInfo.sDuplInfo.dwLineID = self.sDuplInfo.dwLineID;
				sInfo.sDuplInfo.dwMapID = dwNewMapID;
			end;
		end;
	else
		if not CConfig.bIsCrossSvr then
			local duplSystem = self:GetPlayer():GetSystem("CDuplSystem");
			if duplSystem.objCurDupl then
				local duplId = duplSystem.objCurDupl.dwCfgID
				if DuplConfig[duplId].bInShow == 0 then 
					local dupl = duplSystem.objCurDupl;
					if dupl then
						local map = dupl.maps[dwNewMapID];
						if map then
							sInfo.sDuplInfo = {};
							sInfo.sDuplInfo.dwLineID = dupl:GetFbEntityId();
							dupl.map = map;
							sInfo.sDuplInfo.dwMapID = dupl.map.DuplMapID;
							sInfo.sDuplInfo.dwMapCfgId = dwNewMapID;
							sInfo.dwMapID = dupl.map.DuplMapID;
						else
							sInfo.sDuplInfo = {};
							sInfo.sDuplInfo.dwLineID = dupl:GetFbEntityId();
							sInfo.sDuplInfo.dwMapID = dwNewMapID;
						end;
					end;
				end;
			end
		end;
	end; 
	--切换地图接口
	return self:ExecChangeMap(sInfo)	
end;

--[[
sInfo---
:dwLineID,
dwMapID,
fXPos,
fYPos,
fDirValue
,sDuplInfo{dwMapID,dwLineID, dwMapCfgId}
--]]

--地图部分整合
function CMapSystem:ExecChangeMap(sInfo)
	local sInfo = sInfo or {};
	local objMe = self:GetPlayer();
	if not objMe then
		_err("objMe is nil by ExecChangeMap");
		return;
	end;
	--退出原来的地图先，
	local CurMap = self:GetCurMap();
	if not CurMap then
		_err("CurMap id error",self:GetCurMapID()); 
		return false;
	end;
	--记录原来的地图ID
	local oldMapID = CurMap.MapID;
	-------------------段磊磊 add 2012-3-29 交易中断
	if not CConfig.bIsCrossSvr then
		local objTradeSys = objMe:GetSystem('CTradeSystem')
		if objTradeSys then
			objTradeSys:BreakTrade(TradeMsgConfig.OutOfRanged,TradeMsgConfig.OutOfRanged)
		end
	end;
	------------------------  add end
	self:DoPlayerExitMap(CurMap);
	------------------------
	--进入新地图
	if not sInfo.sDuplInfo then	
		if not CMapManager:EnterMap(objMe) then
			return false;
		end; 			
		self.dwCurMapID = sInfo.dwMapID or self.dwCurMapID ; --玩家当前所在地图 
		self.sDuplInfo = nil;
	else 
		self.sDuplInfo = sInfo.sDuplInfo;
	end; 
	self.fXPos = sInfo.fXPos or self.fXPos;		--玩家的x位置
	self.fYPos = sInfo.fYPos or self.fYPos;		--玩家的Y位置
	self.fDirValue = sInfo.fDirValue or self.fDirValue;	  --玩家的方向 
	--进入地图 
	local newMap =  self:GetCurMap();
	if not newMap or not newMap:AddPlayer(objMe) then
		_err("Enter newMap error",newMap,self:GetCurMapID());
		return false;
	end; 
	self:MoveStopRequest(self.fXPos,self.fYPos,self.fDirValue,true);
	local objMap = self:GetCurMap();
	if not objMap then
		return;
	end;
	local cfgMap = MapInfoConfig[objMap.MapID];
	if not cfgMap then
		return;
	end; 
	local posBeg = {x = cfgMap.fReviseX or 0,y = cfgMap.fReviseY or 0};
	local posEnd = {x = self.fXPos,y = self.fYPos};
	if not objMap:CanMoveTo(posBeg,posEnd) then
		self.fXPos = cfgMap.fReviseX or 0;		--玩家的x位置
		self.fYPos = cfgMap.fReviseY or 0;		--玩家的Y位置 
	end
	--发送进入地图信息 
	local sMapInfo = {};
	sMapInfo[1] = sInfo.bIsChangeLine;
	sMapInfo[6] = sInfo.bIsChangeLine;
	if self.isMustReload then
		self.isMustReload = nil;
		sMapInfo[6] = false;
	end
	sMapInfo[2] = self.fXPos;
	sMapInfo[3] = self.fYPos;
	sMapInfo[4] = self.fDirValue;
	sMapInfo[5] = newMap.MapID;
	sMapInfo[7] = self.bExitCross;
	-- print("=======ExecChangeMapMsg=====",newMap.MapID,sMapInfo[1],self.isMustReload)
	objMe.ExecChangeMapMsg{MapInfo= sMapInfo};
	self.isChangeMaping = true;
	--玩家切换地图的时候，发送数据到数据中心--周兴团--8-31；需要排除换线的情况
	if oldMapID ~= newMap.MapID then
		CLogSystemManager:map( self:GetPlayer(), oldMapID, newMap.MapID );
	end
	_info("----------------------14------------");
	return true;
end; 


--处理读取自己地图的所有玩家信息
function CMapSystem:ReadRoleRequest(dwRoleID)
	self.isChangeMaping = nil;
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("objPlayer is null by CMapSystem:ReadRoleRequest");
		self:SendReadRoleResult(0,-1);
		return false;
	end;
	--获取地图
	local map = self:GetCurMap();
	if not map then
		_err("map id error",self:GetCurMapID());
		self:SendReadRoleResult(0,-1);
		return false;
	end;
	-- CCheckerManager:InitCanSeeEntity(map,self.setCanSeeEntity,self.dwCheckerX,self.dwCheckerY)
	local setPlayer = map:GetCanLookPlayer(objPlayer);
	if not setPlayer then
		self:SendReadRoleResult(0,0);   --周围没人
		return false;
	end; 
	
	--先把别人发送给自己
	local DoPlayerFunc = function(dwRoleID,OtherPlayer,sendFunc,obj)
	
		local objMapSystem = OtherPlayer:GetSystem("CMapSystem");
		if not objMapSystem then
			return false;
		end;
		--玩家还未同步允许
		if not objMapSystem.bIsCanSync then
			return false;
		end;
		
		if not sendFunc(obj,OtherPlayer,true) then
			return false; 
		end;
		return true;
	end;
	self.bIsCanSync = true;
	local dwCount = 0; 
	for dwRoleID,Player in pairs(setPlayer) do
		if dwRoleID ~= objPlayer:GetRoleID() then
			if DoPlayerFunc(dwRoleID,Player,self.SendPlayerToMe,self) then
				dwCount = dwCount +1;
			end;
		end;
	end;
	
	--把自己发送给其他人
	for dwRoleID,Player in pairs(setPlayer) do
		if dwRoleID ~= objPlayer:GetRoleID() then
			DoPlayerFunc(dwRoleID,Player,self.SendMeToPlayer,self);
		end;
	end;
	map:CallEnterScript(self:GetPlayer())
	self:SendReadRoleResult(dwCount,0); 
	return true;
end; 

function CMapSystem:DoEnterScene(bInitGame)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("objPlayer is null by CMapSystem:ReadRoleRequest");
		self:SendReadRoleResult(0,-1);
		return false;
	end;
	objPlayer.isLoadEnd = true;
	--到这里为止，客户端和服务器已经完成初始化和数据同步
--	print("NOTICE:Now Load End")
	objPlayer.OnInitViewPfxMsg{RoleID = objPlayer:GetRoleID(),PfxList = objPlayer.setPfxList};
	objPlayer.OnInitViewModelMsg{RoleType = enEntType.eEntType_Player,RoleID = objPlayer:GetRoleID(),ModelList = objPlayer.setModelList};
	if bInitGame == 0 then
		objPlayer.objSystemMgr:EnterScene();
		objPlayer.OnServerLoadEndMsg{};
		--lw：内功的初始化在这里做 2012-7-31
		objPlayer:GetSystem("CSkillSystem"):OnEnterGameOver();
		objPlayer:GetSystem("CPKSystem"):OnEnterGameOver();
	elseif bInitGame == 1 then
		objPlayer.objSystemMgr:ChangeSceneEnd(); 
		
		if objPlayer.bIsChangeLine then
			objPlayer:GetSystem("CSkillSystem"):OnEnterScene();
			objPlayer.bIsChangeLine = nil;
		end
	elseif bInitGame == 2 then
		-- objPlayer.objSystemMgr:EnterScene();
		-- objPlayer.OnServerLoadEndMsg{};
		-- --lw：内功的初始化在这里做 2012-7-31
		-- objPlayer:GetSystem("CSkillSystem"):OnEnterGameOver();
	end;
end;
 
--玩家模拟位移
function CMapSystem:UpdateMovePos()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local tmCur = GetCurTime();
	local tmInterval = tmCur - self.dwLostMoveTime;
	if tmInterval <= 0 then
		return ;
	end; 
	if self.bUseCanTo then
		local map = self:GetCurMap();
		if not map:CanMoveTo(Vector2.new(self.fXPos,self.fYPos),
		Vector2.new(self.fXPos + self.vecSpeed.x* tmInterval,
		self.fYPos + self.vecSpeed.y* tmInterval)) then 
			self:MoveStopRequest(self.fXPos,self.fYPos,self.fDirValue);
			return;
		end;
	end;
--	print(os.now())

	self:UpdatePos(self.fXPos + self.vecSpeed.x* tmInterval,self.fYPos + self.vecSpeed.y* tmInterval)
	self.dwLostMoveTime = tmCur;
	--quying chg 2012-05-10 玩家是否处于安全区
	self:EnterArea();

	------------------------------------add by dll

	-------------------------------------add end
end;

function CMapSystem:EnterArea()
	print("CMapSystem:EnterArea+++++++++++++++++++++++++++++")
	local objPlayer = self:GetPlayer();
	if not objPlayer then	
		return;
	end;
	local mapId = self:GetPlayerMapPos();
	local mapInfo = SafeSideConfig[mapId];
	if not mapInfo then return end;
	for _, info in pairs(mapInfo) do
		local xPos = info.xPos;
		local yPos = info.yPos;
		local dwRange = info.dwRange;
		
		if math.sqrt((xPos - self.fXPos) ^ 2 + (yPos - self.fYPos) ^ 2) <= dwRange then 
			if self.bSafeFlag ~= true then
				self.bSafeFlag = true;
				objPlayer:OnEnterSafeArea();
				objPlayer.ReturnSafeSideInfoMsg{BSafeFlag = true};
			end;
			return;
		end;
	end;
	if self.bSafeFlag ~= false then
		self.bSafeFlag = false;
		objPlayer:OnEnterDangerArea();
		objPlayer.ReturnSafeSideInfoMsg{BSafeFlag = false};
	end;
end;

--进入场景时判断初次安全区
function CMapSystem:SceneAreaOnEnter()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;

	local dwArea = _GetCurAreaInfo(self:GetLogicID());
	--print("=========first enter=========",dwArea)
	if dwArea == 999 then
		self.bSafeFlag = true;
		objPlayer:OnEnterSafeArea();
		objPlayer.ReturnSafeSideInfoMsg{BSafeFlag = self.bSafeFlag or false};
	else
		self.bSafeFlag = false;
		objPlayer:OnEnterDangerArea();
		objPlayer.ReturnSafeSideInfoMsg{BSafeFlag = self.bSafeFlag or false};
	end
end;

--客户端进入游戏登入所有场景之后
function CMapSystem:OnEnterScene()
--	print("OnEnterScene")
	self:SceneAreaOnEnter();
end;

--切换场景完毕
function CMapSystem:OnChangeSceneEnd()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local buffSystem = objPlayer:GetSystem("CBuffSystem");
	-- print("OnChangeSceneEnd")
	if buffSystem then
		--buffSystem:UnRegisterSystem();
		buffSystem:ClearRegisterTbl();
	end;
	self:SceneAreaOnEnter();
	
	-- self.fMoveEndSpeedCode = 0;
	-- self.dwMoveCheckCount = 0;
	
	--self.setUpdateTick = {};
end;

--处理网络消息
function CMapSystem:MoveToRequest(fXSrc,fYSrc,fXDis,fYDis,bUseCanTo,fSpeedB,fSpeedA,fSpeedP)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("objPlayer is null by CMapSystem:ReadRoleRequest");
		self:SendMoveResult(-1);
		return false;
	end;
	
	if objPlayer:IsDead() then
		return false;
	end
	
	--获取地图
	local map = self:GetCurMap();
	if not map then
		_err("map id error",self:GetCurMapID());
		self:SendMoveResult(-1);
		return false;
	end;
	
	--强制位移过程中，不可以移动
	if self.tbMoveActionInfo then
		return false;
	end
	
	local objSklSys = objPlayer:GetSystem("CSkillSystem");
	self.fSpeed = objSklSys:GetInfo().dwMoveSpeed;
	-- print("===MoveToRequest===",fSpeedB,fSpeedA,fSpeedP)
	--判断服务器的速度和客户端速度是否一致
	local fClientSpeed = (fSpeedB+fSpeedA) * (fSpeedP+1)
	if fClientSpeed > self.fSpeed  then
		--如果客户端速度快于服务器，要求客户端再发送一次速度
		--如果上一次发送，客户端没有回应
		-- print("===move check C===",fSpeedB,fSpeedA,fSpeedP)
		local fB,fA,fP = objSklSys:GetSpeedValue();
		
		self.tbSpeedPhoto = {};
		self.tbSpeedPhoto[1] = fB;
		self.tbSpeedPhoto[2] = fA;
		self.tbSpeedPhoto[3] = fP;
		-- print("===move check S===",fB,fA,fP)
		if self.tmSendSpeedCheck then
			local tmNow = GetCurTime();
			
			--如果上次发送后10s，客户端都没有返回，踢下线
			if tmNow - self.tmSendSpeedCheck > 10000 then
				_info("Kick Role By Time Out",objPlayer:GetRoleID())
				objPlayer.CreateGameSessionRequestMsg{ResultCode = -25}
				_closenet(objPlayer.objNet);
				return;
			end;
		else
			self.tmSendSpeedCheck = GetCurTime();
		end
		
		objPlayer.OnSpeedSendMsg{};
	end
	
	--判断是不是可以位移
	self:UpdatePos(fXSrc,fYSrc)
	-- self.fXPos = fXSrc;
	-- self.fYPos = fYSrc; 
	--计算速度
	local vecSrc = Vector2.new(fXSrc,fYSrc);
	local vecTgt = Vector2.new(fXDis,fYDis);
	
	local vecDist = Vector2.sub(vecTgt,vecSrc);
	vecDist:normalize();
	self.vecSpeed = Vector2.mul(vecDist,self.fSpeed/100000);
	
	-- print(GetCurTime()..":MoveToRequest")
	-- self.fFromX = fXSrc;
	-- self.fFromY = fYSrc;
     
	--通知其他人自己的移动
	self.fXMoveBegin = fXSrc;
	self.fYMoveBegin = fYSrc;
	self.fXPosDes = fXDis
	self.fYPosDes = fYDis
	self.bUseCanToChecker = bUseCanTo
	
	_MoveToRequest(self:GetLogicID(),fXSrc,fYSrc,fXDis,fYDis,self.fSpeed);
	
	_mapcallout("OnPlayerMoveToMsg", 
	{
		RoleID = objPlayer:GetRoleID(),
		XSrc = math.floor(fXSrc*100),
		YSrc = math.floor(fYSrc*100),
		XDis = math.floor(fXDis*100),
		YDis = math.floor(fYDis*100),
		Speed = math.floor(self.fSpeed*100),
		UseCanTo = bUseCanTo,
	},self:GetLogicID(),false);
	
	self:SendMoveResult(0);
		--开始模拟
	-- self.dwLostMoveTime = os.now();
	-- self.bUseCanTo = bUseCanTo;
	self.bMoving = true;
	
	--记录移动信息，用于获取坐标时的修正
	self.tmMoveBegin = GetCurTime();
	--self.vecSpeed
	-- print("===MoveToRequest===",GetCurTime(),fXSrc,fYSrc,fXDis,fYDis)
	
	if objPlayer:GetSystem("CStateSystem") then
		objPlayer:GetSystem("CStateSystem"):CheckPlayerAction(enPlayerAction.ePA_Move);
	end;
end;

function CMapSystem:DoneWithViewChange(tbOldID,tbNewID)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	--print("==DoneWithViewChange==",objSelf:GetRoleID())
	local tbOldNet = {}
	for n,dwID in pairs(tbOldID)do
		--print("====DoneWithViewChange old======",n,dwID)
		if dwID ~= objSelf:GetRoleID() then
			self.setNewPlayer[dwID] = nil;
			local objPlayer = objSelf:GetOtherPlayer(dwID,2);
			if objPlayer then
				--objPlayer.OnHidePlayerMsg{List = {objSelf:GetRoleID()}};
				table.insert(tbOldNet,objPlayer.objNet)
			end
		else
			tbOldID[n] = nil;
		end
	end
	
	--同步新角色的位置信息
	local tbPosList = {}
	for n,dwID in pairs(tbNewID)do
		--print("====DoneWithViewChange new======",n,dwID)
		
		self.setNewPlayer[dwID] = dwID;
		--self.setOldPlayer[dwID] = nil;
	end
	
	_groupcallout(tbOldNet,"OnHidePlayerMsg",{List = {objSelf:GetRoleID()}});

	objSelf.OnHidePlayerMsg{List = tbOldID};
	
	
	local sysMonster = objSelf:GetSystem("CMonsterSystem")
	sysMonster:OnChangeMapChecker()
	-- local sysNpc = objSelf:GetSystem("CNPCSystem")
	-- sysNpc:OnChangeMapChecker(tbOldNpc,tbNewNpc)
	local sysDrop = objSelf:GetSystem("CDropSystem")
	sysDrop:OnChangeMapChecker()
	if not CConfig.bIsCrossSvr then
		local sysMartial = objSelf:GetSystem("CPetSystem");
		sysMartial:SendMapPetInfo();
	end;
end;

function CMapSystem:DoneWithAreaChange(dwOldArea,dwNewArea)
	local objPlayer = self:GetPlayer();
	if dwOldArea == 999 then
		self.bSafeFlag = false;
		objPlayer:OnEnterDangerArea();
		objPlayer.ReturnSafeSideInfoMsg{BSafeFlag = false};
		return;
	end
	
	if dwNewArea == 999 then
		self.bSafeFlag = true;
		objPlayer:OnEnterSafeArea();
		objPlayer.ReturnSafeSideInfoMsg{BSafeFlag = true};
		return;
	end
	
	local objMap = self:GetCurMap();
	if objMap then
		objMap:EventPlayerAreaChange(objPlayer,dwOldArea,dwNewArea);
	end
end;

--处理玩家停止移动消息
function CMapSystem:MoveStopRequest(fXStop,fYStop,fDirValue,isForbidNotice)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("objPlayer is null by CMapSystem:ReadRoleRequest");
		--self:SendMoveStopResult(-1);
		return false;
	end;
	if objPlayer:IsDead() then
		return false;
	end
	--获取地图
	local map = self:GetCurMap();
	if not map then
		_err("map id error",self:GetCurMapID());
		--self:SendMoveStopResult(-1);
		return false;
	end;
	-- print(GetCurTime()..":MoveStopRequest")
	-- --验证停止位置和服务器预算的位置
	-- if self.tmMoveBegin then
		-- local tbServerPos = self:GetPlayerPos();
		-- local fXdis = fXStop - tbServerPos.x;
		-- local fYdis = fYStop - tbServerPos.y;
		-- local fDis = math.sqrt(fXdis*fXdis + fYdis*fYdis);
		-- if fDis > 1 then
			-- -- print("===Stop Distance Long",objPlayer:GetRoleID(),fDis);
			-- local tmDis = GetCurTime()-self.tmMoveBegin;
			-- local fLongDis = math.sqrt((fXStop-self.fXMoveBegin)*(fXStop-self.fXMoveBegin) + (fYStop-self.fYMoveBegin)*(fYStop-self.fYMoveBegin));
			-- if tmDis == 0 then
				-- tmDis = 15;
			-- end
			
			-- local fDisSpeed = fLongDis*100000/tmDis;
			-- -- print("===Stop time===",tmDis,fLongDis,fDisSpeed,self.fSpeed)
			
			-- self.fMoveEndSpeedCode = self.fMoveEndSpeedCode + fDisSpeed - self.fSpeed;
			-- self.dwMoveCheckCount = self.dwMoveCheckCount + 1;
			-- -- print("===Stop fXStop,fYStop,tbServerPos.x,tbServerPos.===",fXStop,fYStop,tbServerPos.x,tbServerPos.y);
			-- -- print("===Stop==",self.tbMoveActionInfo);
			-- -- if self.tbMoveActionInfo then
				-- -- local dwTimeDis = GetCurTime() - self.tbMoveActionInfo.dwBegin;
				-- -- print("===tbMoveActionInfo===",dwTimeDis,self.tbMoveActionInfo.dwTime)
				-- -- print("===tbMoveActionInfo===",self.tbMoveActionInfo.vecDis.x,self.tbMoveActionInfo.vecDis.y)
			-- -- end
			-- -- print("===Stop self.vecSpeed.x,self.vecSpeed.y==",self.vecSpeed.x,self.vecSpeed.y);
			-- -- print("===Stop self.fXPos,self.fYPos==",self.fXPos,self.fYPos);
			-- -- print("===Stop self.fFromX,self.fFromY,self.bMoving===",self.fFromX,self.fFromY,self.bMoving)
			-- -- print("===Stop time===",GetCurTime()-self.tmMoveBegin)
			-- -- objPlayer.CreateGameSessionRequestMsg{ResultCode = -25}
			-- -- _closenet(objPlayer.objNet);
			-- -- return false;
			
			-- --如果出现10次以上的违例
			-- print("===Stop per===",self.fMoveEndSpeedCode,self.dwMoveCheckCount,self.fMoveEndSpeedCode/self.dwMoveCheckCount)
			-- if self.dwMoveCheckCount > 10 then
				-- local fPerDis = self.fMoveEndSpeedCode / self.dwMoveCheckCount;
				
				-- if fPerDis > 50 then
					-- objPlayer.CreateGameSessionRequestMsg{ResultCode = -25}
					-- _closenet(objPlayer.objNet);
				-- end
			-- end
		-- end
	-- end
	
	self.tbSpeedPhoto = nil;
	
	_StopMove(self:GetLogicID(),fXStop,fYStop);
	
	--修正位置--停止位移
	self.dwLostMoveTime = 0;
	self.fXPos = fXStop;		--玩家的x位置
	self.fYPos = fYStop;		--玩家的Y位置
	
	--玩家的方向
	if not fDirValue then
		fDirValue = self.fDirValue;
	else
		self.fDirValue = fDirValue
	end
	
	self.bMoving = false;
	
	if not isForbidNotice then
		_mapcallout("OnPlayerMoveEndMsg", 
		{
			RoleID = objPlayer:GetRoleID(),
			XStop = math.floor(fXStop*100),
			YStop = math.floor(fYStop*100),
			DirValue = math.floor(fDirValue*100)
		},self:GetLogicID(),false);
	end
	
	--print("======move stop======",objPlayer:GetRoleID(),fXStop,fYStop,fDirValue)
	--保存自己的位置
	if self.objDBQuery then
		local tbMapInfo = nil;
		if not CConfig.bIsCrossSvr then
			local objWarSys = objPlayer:GetSystem("CWarSystem");
			if objWarSys then
				tbMapInfo = objWarSys:DoneWithOffLine(self);
			end
			self.objDBQuery:SaveMapInfo(nil,tbMapInfo)
		end;
	end;
	--self:SendMoveStopResult(0);
end;

function CMapSystem:DoneWithMoveEnd(tbPos)
	-- --修正位置--停止位移
	-- print("!!!DoneWithMoveEnd===")
	-- print(debug.traceback())
	self.bMoving = false;
	self.fXPos = tbPos.x;		--玩家的x位置
	self.fYPos = tbPos.y;		--玩家的Y位置
end;

function CMapSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer();
	local Data = {};
	Data[1] = self.dwCurMapID;
	Data[2] = self.fXPos;
	Data[3] = self.fYPos;
	Data[4] = self.fDirValue;
	objPlayer:SetLineData("CMapSystem",Data);
end;

function CMapSystem:OnEnterCrossBegin()
	-- local objPlayer = self:GetPlayer();
	-- local Data = {};
	-- Data[1] = self.dwCurMapID;
	-- Data[2] = self.fXPos;
	-- Data[3] = self.fYPos;
	-- Data[4] = self.fDirValue;
	-- objPlayer:SetCrossSvrData("CMapSystem",Data);
end;
------------------------------------------------
----发送网络消息
--发送进入地图结果消息
function CMapSystem:SendEnterMapResult(nResultCode)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end; 
	
	local sMapInfo = {};
	sMapInfo[1] = self.fXPos;
	sMapInfo[2] = self.fYPos;
	sMapInfo[3] =self.fDirValue;
	sMapInfo[4] =self.dwCurMapID;
		
	objPlayer.OnEnterGameResultMsg{ResultCode = nResultCode,GameInfo = sMapInfo};

end;
--发送传送地图返回消息
function CMapSystem:SendChangeMapResult(nResultCode)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end;
	objPlayer.OnChangeMapResultMsg{ResultCode = nResultCode};

end;

--发送读取玩家结果
function CMapSystem:SendReadRoleResult(dwCount,nResultCode)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end;
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	local mapId = self:GetPlayerMapPos();
	if mapId > 99999 then
		local map = CMapManager:GetMap(mapId);
		if not map then
			_err();
			return;
		end;
		mapId = map.MapID;
	end;
	local flag = false;
	if MapInfoConfig[mapId].dwMapType == 1 then
		flag = true;
	end;
	
	local level = objPlayer:GetInfo().dwLevel;
	local num = 1;
	local playerTbl = self:GetAllPlayer()
	if playerTbl then
		for _, player in pairs(playerTbl) do
			local info = player:GetInfo();
			local tempLevel = info.dwLevel;
			if tempLevel > level then
				num = num + 1;
			end;
		end;
	end
    objPlayer.OnReadRoleResultMsg{ResultCode = nResultCode,RoleCount = dwCount, Flag = flag, Num = num}
end;

--发送玩家信息
function CMapSystem:SendPlayerToMe(objOtherPlayer,isMust)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	--print("I get a player info")
	self:SendAddPlayerInfo(objPlayer,objOtherPlayer,isMust); 
	return true;
end;

--发送自己给其他玩家
function CMapSystem:SendMeToPlayer(objOtherPlayer,isMust)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end;
	--print("I send info to a player")
	self:SendAddPlayerInfo(objOtherPlayer,objPlayer,isMust); 
	--如果玩家正在移动，得发送移动信息
	
end;

function CMapSystem:SendNowPosInfo(objSendr)
	local objSelf = self:GetPlayer();
	
	if self.bMoving then
		local tbPos = self:GetPlayerPos();
		objSendr.OnPlayerMoveToMsg
		{
			RoleID = objSelf:GetRoleID(),
			XSrc = math.floor(tbPos.x*100),
			YSrc = math.floor(tbPos.y*100),
			XDis = math.floor(self.fXPosDes*100),
			YDis = math.floor(self.fYPosDes*100),
			Speed = math.floor(self.fSpeed*100),
			UseCanTo = self.bUseCanToChecker,
		};
	else
		objSendr.OnPlayerMoveEndMsg
		{
			RoleID = objSelf:GetRoleID(),
			XStop = math.floor(self.fXPos*100),
			YStop = math.floor(self.fYPos*100),
			DirValue = math.floor(self.fDirValue*100);
		}
	end
end;
 
--位移请求结果
function CMapSystem:SendMoveResult(nResCode)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end;
	objPlayer.OnMoveResultMsg{ResultCode = nResCode}
end;
--位移停止请求
function CMapSystem:SendMoveStopResult(nResCode)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end;
	objPlayer.OnMoveStopResultMsg{ResultCode = nResCode}
end;

--移动过程总失败后，服务器判断
-- function CMapSystem:SendMoveFail()
   
-- end;

--使用技能时进行位置同步
function CMapSystem:BroadcastPositionInfo(xPos,yPos,fDirValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end;
	--获取地图
	local map = self:GetCurMap();
	if not map then
		_err("map id error",self:GetCurMapID());
		return ;
	end;
	self:UpdatePos(xPos,yPos)
	-- self.fXPos = xPos;		--玩家的x位置
	-- self.fYPos = yPos;		--玩家的Y位置
	self.fDirValue = fDirValue;   --玩家的方向
	
	--通知其他玩家
	_mapcallout("OnPlayerMoveEndMsg", 
	{
		RoleID = objPlayer:GetRoleID(),
		XStop = math.floor(fXStop*100),
		YStop = math.floor(fYStop*100),
		DirValue = math.floor(fDirValue*100)
	},self:GetLogicID(),false)
end;

--强制停止移动
-- function CMapSystem:CoerceStopMove()
	
-- end;
--改变玩家坐标
function CMapSystem:UpdatePos(dwValueX,dwValueY)
	self.fXPos = dwValueX
	self.fYPos = dwValueY
	-- print('self.fXPos =',self.fXPos)
	-- print('self.posTopLeft.x =',self.posTopLeft.x)
	-- print('self.posBottomRight.x =',self.posBottomRight.x)
	-- print('self.fYPos =',self.fYPos)
	-- print('self.posTopLeft.y =',self.posTopLeft.y)
	-- print('self.posBottomRight.y =',self.posBottomRight.y)
end

--获得所在区域状态（true为安全区);
function CMapSystem:GetPlayerSafeState()
	return self.bSafeFlag;
end;

function CMapSystem:ChgMapState(openFlag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not CConfig.bIsCrossSvr then
		local teamSystem = objPlayer:GetSystem("CTeamSystem");
		if openFlag then
			teamSystem:OpenMiddleMap();
		else
			teamSystem:CloseMiddleMap();
		end;
	end;
end;

function CMapSystem:SetMapDuplInfo()
	-- local objPlayer = self:GetPlayer();
	-- if not objPlayer then
		-- return;
	-- end;
	-- local mapSystem = objPlayer:GetSystem("CMapSystem");
	self.sDuplInfo = nil;
end;

function CMapSystem:SetMoveSpeed(fNewSpeed)
	local objMap = self:GetCurMap();
	if not objMap then
		--角色还没进入地图，跳过
		return;
	end
	
	if fNewSpeed == 0 then
		local tbPos = self:GetPlayerPos();
		self:MoveStopRequest(tbPos.x,tbPos.y);
	else
		if self.bMoving then
			_ChangeSpeed(self:GetLogicID(),fNewSpeed);
		end
	end
end;

function CMapSystem:DoneWithSpeedChange(fNewSpeed,tbPosNow)
	local objPlayer = self:GetPlayer();
	
	self.fSpeed = fNewSpeed*100000;
	self:UpdatePos(tbPosNow.x,tbPosNow.y);
	
	self.tmMoveBegin = GetCurTime();
	self.fXMoveBegin = tbPosNow.x;
	self.fYMoveBegin = tbPosNow.y;
	
	_mapcallout("OnPlayerMoveToMsg", 
	{
		RoleID = objPlayer:GetRoleID(),
		XSrc = math.floor(tbPosNow.x*100),
		YSrc = math.floor(tbPosNow.y*100),
		XDis = math.floor(self.fXPosDes*100),
		YDis = math.floor(self.fYPosDes*100),
		Speed = math.floor(self.fSpeed*100),
		UseCanTo = bUseCanTo,
	},self:GetLogicID(),false);
end;

function CMapSystem:ClearMoveInfo()
	self.bMoving = false;
	
	self.tbMoveActionInfo = nil;
end;

-------------------------------------------------------------------------------

function CMapSystem:RequestCreateRole(dwRoleID)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local objMap =  self:GetCurMap();
	if not objMap then
		return;
	end
	local allPlayer = objMap:GetPlayerByRoleID(objSelf);
	if not allPlayer then
		-- local pos = self:GetPlayerPos();
		-- print("===RequestCreateRole===",pos.x,pos.y)
		return;
	end
	local objNeed = allPlayer[dwRoleID];
	if not objNeed then
		return;
	end
	
	self:SendAddPlayerInfo(objSelf,objNeed,true);
end;

--客户端发送再次检测的速度值
function CMapSystem:SpeedCheckAgain(fSpeedB,fSpeedA,fSpeedP)
	self.tmSendSpeedCheck = nil;
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	if not self.tbSpeedPhoto then
		return;
	end
	
	local objSklSystem = objSelf:GetSystem("CSkillSystem");
	
	local fB,fA,fP = self.tbSpeedPhoto[1],self.tbSpeedPhoto[2],self.tbSpeedPhoto[3];
	-- print("===SpeedCheckAgain C===",fSpeedB,fSpeedA,fSpeedP)
	-- print("===SpeedCheckAgain B===",fB,fA,fP)
	local isFail = false;
	
	if fSpeedB ~= fB then
		isFail = true;
	end
	
	local fDisA = fSpeedA - fA
	if fDisA > 0.01 then
		isFail = true;
	end
	
	local fDisP = fSpeedP - fP;
	if fDisP > 0.01 then
		isFail = true;
	end
	
	self.tbSpeedPhoto = nil;
	
	if isFail then
		_info("Kick Role By Speed Error",objSelf:GetRoleID(),fSpeedB,fSpeedA,fSpeedP,fB,fA,fP)
		objSelf.CreateGameSessionRequestMsg{ResultCode = -25}
		_closenet(objSelf.objNet);
	end
end;


