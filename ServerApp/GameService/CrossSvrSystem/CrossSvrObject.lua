_G.CCrossSvrObject = {};

function CCrossSvrObject:new()
	local obj = {};
	obj.setAllMap = {};
	obj.setAllPlayer = {};
	obj.setAllEnterPlayer = {};
	obj.PlayerNum = 0;
	--角色列表收益
	obj.setHarvestList = {};
	obj.PKMode = {};
	
	--杀人数的统计表
	--[roleid] = {szRoleName,dwKillTotal,dwKillCombo,dwKillComboMax,dwScore}
	obj.setRoleFightInfo = {};
	obj.setCrossSortByKillTotle = {};
	obj.setSortByKillComboMax = {};
	
	obj.objMyTimer = COwnTimer:new();
	
	obj.setNumberRecord = {};--计数器
	
	obj.dwCrossUpdateTick = nil;
	obj.dwPlayerUpdateTick = nil;
	
	obj.setRoleLength = {};--角色在战场中的时长
	
	--用于确认角色唯一性的参数
	obj.dwMaxIndex = 1;
	obj.setRole2Index = {};
	obj.setIndex2Role = {};
	
	--抢夺物品相关 (屠龙刀 倚天剑...）
	--  -1 为无效roleId
	obj.itemHoldRoleId = -1;
	obj.itemGetRoleId = -1;
	
	--跨服战开始时间	
	obj.dwStartTime = 0;
	
	--储存荣誉值
	obj.dwHonor = {};
	for i,v in pairs(CCrossSvrObject) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CCrossSvrObject:Update(dwInv)
	self.objMyTimer:Update(dwInv);

    local dwIndex = self.setKickAllPlayerIndex;
    if dwIndex ~= nil and dwIndex > 0 then
        local setData = self.setKickAllPlayerData;
        for i = 1, 10 do
            dwIndex = dwIndex - 1;
            if setData[dwIndex] then
                self:KickPlayer(setData[dwIndex]);
            else
                setData = nil;
                self:EventGameOver();
                self.bStart = false;
                break;
            end
        end
        self.setKickAllPlayerData = setData;
        self.setKickAllPlayerIndex = dwIndex;
    end
end

--清空跨服战数据
function CCrossSvrObject:ClearCrossData()
	self:KickAllPlayer();
end;

--踢出全部角色
function CCrossSvrObject:KickAllPlayer()
    local setData = {};
    local dwIndex = 1;
	for dwRoleID, objPlayer in pairs(self.setAllEnterPlayer) do
        setData[dwIndex] = objPlayer;
        dwIndex = dwIndex + 1;
	end
    self.setKickAllPlayerData = setData;
    self.setKickAllPlayerIndex = dwIndex;
end;

function CCrossSvrObject:KickPlayer(objPlayer)
    local b, s = pcall(
        function()
            local dwRoleID = objPlayer:GetRoleID();
            if self.setAllPlayer[dwRoleID] then
                self.setAllPlayer[dwRoleID]:
                    GetSystem("CCrossSvrSystem"):ReqExitCross(true);
            else
                self:KickOfflinePlayer(objPlayer);
            end
        end
    );
    if not b then
        _err("[CrossService]", s);
    end
end

--踢出不在线角色
function CCrossSvrObject:KickOfflinePlayer(objPlayer)
	local dwRoleID = objPlayer:GetRoleID()
    local dwLength = self:GetRoleLength(dwRoleID);
    local dwExp = _G.Function.Exp(objPlayer, dwLength);
    local dwAccountId = objPlayer:GetAccountID();
    local dwHoldId, dwHoldAccountId, dwHoldName = self:GetItemRoleID();
    local corssSvrCfg = _G.CrossSvrConfig[self.dwCfgID];
    local dwHonorValue = self:GetHonorById(dwRoleID);
    dwHonorValue = dwHonorValue + corssSvrCfg.BaseHonor;
    if dwHonorValue > corssSvrCfg.MaxHonor then
        dwHonorValue = corssSvrCfg.MaxHonor;
    end
	_info("CCrossSvrObject:KickOfflinePlayer=======", dwHonorValue, dwAccountId);
    local info = {
        dwCrossId = self.dwCfgID;
        dwHoldId = dwHoldId;
        dwHoldAccountId = dwHoldAccountId;
        dwHoldName = dwHoldName;
        bOver = true;
        dwHonorValue = dwHonorValue;
        dwExp = dwExp;
		bIsOfflinePlayer = true;
    };
	info.dwKillerNum = self:GetPlayerKillNum(dwRoleID);
	info.dwRank = self:GetPlayerKillIndex(dwRoleID);
    _callouttoline("SendCrossOverMsg", 
        {
            AccId = objPlayer:GetAccountID(), 
            RoleId = objPlayer:GetRoleID(), 
            Honor = dwHonorValue, 
            Exp = dwExp
        }, 
        0, 
        CCrossSvrManager.NetTbl[objPlayer:GetAccountID()]);
    CKernelApp.SendExitCrossMsg{Info = info, 
        RoleId = objPlayer:GetRoleID(), 
        AccID = objPlayer:GetAccountID(), 
        Flag = false};
    _info("[CrossService] KickOfflinePlayer", 
        objPlayer:GetAccountID(), 
        objPlayer:GetRoleID());
end

function CCrossSvrObject:EventGameOver()
	local tbCfg = _G.CrossSvrConfig[self.dwCfgID];
	if tbCfg then
		if tbCfg.EventGameOver then
			tbCfg:EventGameOver(self);
		end
	end;
	self.setAllPlayer = {};
	self.setAllEnterPlayer = {};
	--角色列表收益
	self.setHarvestList = {};
	
	--杀人数的统计表
	self.setRoleFightInfo = {};
	
	self.setCrossSortByKillTotle = {};
	self.setSortByKillComboMax = {};
	
	self.setNumberRecord = {};--计数器
	
	self.dwCrossUpdateTick = nil;
	self.dwPlayerUpdateTick = nil;
	
	self.setRoleLength = {};--角色在战场中的时长
	
	--用于确认角色唯一性的参数
	self.dwMaxIndex = 1;
	self.setRole2Index = {};
	self.setIndex2Role = {};
	
	--储存荣誉值
	self.dwHonor = {};
end;

--获取table中随机的key+value
local function GetRandTableValue(tb)
	local dwMax = 0;
	
	for k,v in pairs(tb)do
		dwMax = dwMax + 1000;
	end
	
	local dwRand = math.random(dwMax);
	dwMax = 0;
	
	for k,v in pairs(tb)do
		dwMax = dwMax + 1000;
		if dwRand <= dwMax then
			return k,v;
		end
	end
	
	return nil,nil
end;

-----------------------------------------------------------------------------------------------------
----------------------------------------设置跨服战场回调---------------------------------------------
-----------------------------------------------------------------------------------------------------
--设置战场中Update回调的时间级别
function CCrossSvrObject:SetUpdateTimeForPlayer(dwTime)
	self.dwPlayerUpdateTick = dwTime;
end;

function CCrossSvrObject:SetUpdateTimeForCross(dwTime)
	self.dwCrossUpdateTick = dwTime;
end;

function CCrossSvrObject:BeginCrossUpdate()
	 if self.dwCrossUpdateTick then
		self.objMyTimer:AddEvent(self.dwCrossUpdateTick,function()
			self:EventUpdateForCross()
		end);
	 end
end;

function CCrossSvrObject:BeginPlayerUpdate(dwRoleID)
	if self.dwPlayerUpdateTick then
		local dwMyIndex = self.setRole2Index[dwRoleID];
		if dwMyIndex then
			self.objMyTimer:AddEvent(self.dwPlayerUpdateTick,function()
				self:EventUpdateForPlayer(dwRoleID,dwMyIndex)
			end);
		end
	end
end;

function CCrossSvrObject:EventUpdateForCross()
	local cfgCross = CrossSvrConfig[self.dwCfgID];
	if cfgCross and cfgCross.UpdateForCross then
		cfgCross:UpdateForCross(self);
	end
	
	self:BeginCrossUpdate();
end;

-------------------------------------初始化跨服战场---------------------------------
------------------------------------------------------------------------------------
function CCrossSvrObject:Init(dwCfgID)
	self.dwCfgID = dwCfgID;
	self:CreateOwnMap();
end;

--获取一个跨服战地图ID和坐标点ID
function CCrossSvrObject:GetEnterMap()
	local tbCfg = _G.CrossSvrConfig[self.dwCfgID];
	
	local tbEnterMap = tbCfg.EnterMapSet;
	
	local dwMap,tbPoint = GetRandTableValue(tbEnterMap);
	if not tbPoint then
		return;
	end
	
	local _,dwPointIndex = GetRandTableValue(tbPoint);
	
	return dwMap,dwPointIndex;
end;

function CCrossSvrObject:CreateOwnMap()
	local tbCfg = CrossSvrConfig[self.dwCfgID];
	if not tbCfg then
		return;
	end;
	for n,dwMapID in pairs(tbCfg.MapSet)do
		local map = MapInfoConfig[dwMapID]; 
		if map and type(map) == "table" then
			local objMap = CMap:new(dwMapID, map.dwMapType, map.szMapCog,map.dwHeight,CKernelApp.dwLineID);
			if not objMap then
				_info("objMap is null by CCrossSvrObject:CreateOwnMap( )");
				return false;
			end;
			if not objMap:Create() then
				_info("map:Create() is null by CCrossSvrObject:CreateOwnMap( )");
				return false;
			end;
			CMapManager:AddMap(objMap);
			self.setAllMap[dwMapID] = objMap;
		end
	end
end;

function CCrossSvrObject:IsOpen()
	return true;
end;

--玩家进入跨服战场
function CCrossSvrObject:EnterPlayer(objPlayer)
	if self.setAllPlayer[objPlayer:GetRoleID()] then
        self.setAllEnterPlayer[objPlayer:GetRoleID()] = objPlayer;
        self.setAllPlayer[objPlayer:GetRoleID()] = objPlayer;
		return;
	end;
	--记录所有进入过的人
	self.setAllEnterPlayer[objPlayer:GetRoleID()] = objPlayer
	self.setAllPlayer[objPlayer:GetRoleID()] = objPlayer;
	self.PlayerNum = self.PlayerNum + 1;
	objPlayer:GetSystem("CCrossSvrSystem"):EnterCross(self.dwCfgID);
	CKernelApp.SendCrossNumMsg{CrossId = self.dwCfgID, LineId = CKernelApp.dwLineID, PlayerNum = self.PlayerNum};
	self:EventPlayerEnter(objPlayer);
    if not self.setRoleFightInfo[objPlayer:GetRoleID()] then
		self:CreateKillInfo(objPlayer:GetRoleID(), objPlayer:GetName());
	end
    CCSKillChartSystemManager:SendChartList(objPlayer);
end;

function CCrossSvrObject:EventGameStart()
	local cfgCross = CrossSvrConfig[self.dwCfgID];
	if not cfgCross then
		return;
	end
	self.dwBeginTime = GetCurTime();
	if cfgCross.EventGameStart then
		cfgCross:EventGameStart(self);
	end
	self.bStart = true;
	self:BeginCrossUpdate();
end;

--需要响应的事件
function CCrossSvrObject:EventPlayerEnter(objPlayer)
	local cfgCross = CrossSvrConfig[self.dwCfgID];
	if cfgCross and cfgCross.EventEnterPlayer then
		cfgCross:EventEnterPlayer(self,objPlayer);
	end
	
	local dwRoleID = objPlayer:GetRoleID();
	
	--给角色分配一个index
	self.setRole2Index[dwRoleID] = self.dwMaxIndex;
	self.setIndex2Role[self.dwMaxIndex] = dwRoleID;
	self:BeginPlayerUpdate(dwRoleID,self.dwMaxIndex);
	self.dwMaxIndex = self.dwMaxIndex + 1;
end;

function CCrossSvrObject:ExitPlayer(objPlayer)
	if not self.setAllPlayer[objPlayer:GetRoleID()] then
		return;
	end;
	local stateSystem = objPlayer:GetSystem("CStateSystem")
	stateSystem:ChangeState(enPlayerState.ePS_Normal);
	local mountSystem = objPlayer:GetSystem("CMountSystem");
	mountSystem:RideDown();
	self.setAllPlayer[objPlayer:GetRoleID()] = nil;
	self.PlayerNum = self.PlayerNum - 1;
	objPlayer:GetSystem("CCrossSvrSystem"):ExitCross();
	CKernelApp.SendCrossNumMsg{CrossId = self.dwCfgID, LineId = CKernelApp.dwLineID, PlayerNum = self.PlayerNum};
	self:EventPlayerExit(objPlayer);
end;

function CCrossSvrObject:EventPlayerExit(objPlayer)
	local cfgCross = CrossSvrConfig[self.dwCfgID];
	if cfgCross and cfgCross.EventExitPlayer then
		cfgCross:EventExitPlayer(self,objPlayer);
	end
	local dwRoleID = objPlayer:GetRoleID();
	--收回角色的index
	local dwMyIndex = self.setRole2Index[dwRoleID];
	if dwMyIndex then
		self.setIndex2Role[dwMyIndex] = nil;
	end
	self.PlayerNum = self.PlayerNum - 1;
	self.setRole2Index[dwRoleID] = nil;
end;

--更新跨服战场中玩家
function CCrossSvrObject:EventUpdateForPlayer(dwRoleID,dwMyIndex)
	--角色有效性判断
	if self.setIndex2Role[dwMyIndex] ~= dwRoleID then
		return;
	end
	if self.setRole2Index[dwRoleID] ~= dwMyIndex then
		return;
	end
	
	local objPlayer = CMapManager:GetPlayer(dwRoleID)
	if not objPlayer then
		return;
	end

	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return;
	end
	local tbScript = CScriptManager:GetScript(5,objMapSys.dwCurMapID);
	if tbScript and tbScript.UpdateForPlayer then
		tbScript:UpdateForPlayer(self,objPlayer);
	end
	
	self:BeginPlayerUpdate(dwRoleID,dwMyIndex);
end;

--战场中杀死人
function CCrossSvrObject:EventKillPlayer(objKiller,objDeader)
	--如果死者正在持有屠龙刀 
	self:ItemHoldBreak(objDeader);
	
	local killerID = objKiller:GetRoleID();
	local deadID = objDeader:GetRoleID();
	if(not self.setAllPlayer[killerID] or not self.setAllPlayer[deadID]) then
		return ;---异常保护
	end
	
	if(killerID == deadID) then
		return;
	end
	self:ClearCrossKillNumCon(objDeader); ----清空死亡者的连斩数
	-----击杀获取荣誉值
	local cfgCross = CrossSvrConfig[self.dwCfgID];
	local dwHonorValue = 0; ----临时数据
	if cfgCross and cfgCross.EventKillPlayer then
		dwHonorValue = cfgCross:EventKillPlayer(self,objKiller,objDeader);
	end
	-----记录荣誉值
    self:SetHonorById(killerID, dwHonorValue);
    CCSKillChartSystemManager:Trigger(objKiller);
	----记录击杀数
	self:AddCrossKillNumAll(objKiller);
	----记录连斩数
	self:AddCrossKillNumCon(objKiller);
	----发送消息给客户端
	local killTotal = self.setRoleFightInfo[killerID].dwKillTotal ;
	local killCombo = self.setRoleFightInfo[killerID].dwKillComboMax;
	local OwnerHonor = self.dwHonor[killerID];
	objKiller:GetSystem("CCrossSvrSystem"):SendMyKillNum(killTotal,killCombo,OwnerHonor);
end;

--设置荣誉值
function CCrossSvrObject:GetHonorById(dwRoleID)
	return self.dwHonor[dwRoleID] or 0;
end;

--增加荣誉值
function CCrossSvrObject:SetHonorById(dwRoleID, dwHonorValue)
	if not self.dwHonor[dwRoleID] then
		self.dwHonor[dwRoleID] = dwHonorValue;
	else
		self.dwHonor[dwRoleID] = self.dwHonor[dwRoleID] + dwHonorValue;
	end;
end;

---------------------------------------------------------------------
---------------------------------------------------------------------
function CCrossSvrObject:SetRoleTime(objPlayer)
	local dwRoleID = objPlayer:GetRoleID();
	if not self.setRoleLength[dwRoleID] then
		self.setRoleLength[dwRoleID] = {};
	end
	
	self.setRoleLength[dwRoleID].dwLength = self.setRoleLength[dwRoleID].dwLength or 0;
	--self.setRoleLength[dwRoleID].dwGetCode = self.setRoleLength[dwRoleID].dwGetCode or 0;
	self.setRoleLength[dwRoleID].dwEnterTime = GetCurTime();
end;

function CCrossSvrObject:RoleLeaveCross(objPlayer)
	local dwRoleID = objPlayer:GetRoleID();
	if not self.setRoleLength[dwRoleID] then
		return;
	end
	
	local dwLength = GetCurTime() - self.setRoleLength[dwRoleID].dwEnterTime;
	self.setRoleLength[dwRoleID].dwLength = self.setRoleLength[dwRoleID].dwLength + dwLength;
end;

function CCrossSvrObject:GetRoleLength(dwRoleID)
	if not self.setRoleLength[dwRoleID] then
		return 0;
	end
	local dwLength = self.setRoleLength[dwRoleID].dwLength;
	dwLength = dwLength + (GetCurTime() - self.setRoleLength[dwRoleID].dwEnterTime);
	
	return dwLength;
end;

-------------------------------------------------------------------------------------------
---------------------------------------杀人榜----------------------------------------------
-------------------------------------------------------------------------------------------
--初始化玩家杀人信息
function CCrossSvrObject:CreateKillInfo(dwRoleID,szName)
	self.setRoleFightInfo[dwRoleID] = {};
    self.setRoleFightInfo[dwRoleID].dwRoleID = dwRoleID;
	self.setRoleFightInfo[dwRoleID].szRoleName = szName;
	self.setRoleFightInfo[dwRoleID].dwKillTotal = 0;
	self.setRoleFightInfo[dwRoleID].dwKillCombo = 0;
	self.setRoleFightInfo[dwRoleID].dwKillComboMax = 0;
	self.setRoleFightInfo[dwRoleID].dwScore = 0;
	self.setRoleFightInfo[dwRoleID].selfIndex = 0;-----杀人排行榜自己的排名
end;

--修改玩家杀人信息
--总杀人数增加
function CCrossSvrObject:AddCrossKillNumAll(objPlayer)
	local dwRoleID = objPlayer:GetRoleID();
	self.setRoleFightInfo[dwRoleID].dwKillTotal = self.setRoleFightInfo[dwRoleID].dwKillTotal + 1;
end;

--连杀数增加
function CCrossSvrObject:AddCrossKillNumCon(objPlayer)
	local dwRoleID = objPlayer:GetRoleID();
	
	self.setRoleFightInfo[dwRoleID].dwKillCombo = self.setRoleFightInfo[dwRoleID].dwKillCombo + 1;
	if self.setRoleFightInfo[dwRoleID].dwKillCombo > self.setRoleFightInfo[dwRoleID].dwKillComboMax then
		self.setRoleFightInfo[dwRoleID].dwKillComboMax = self.setRoleFightInfo[dwRoleID].dwKillCombo;
	end
end;

--清空连杀数
function CCrossSvrObject:ClearCrossKillNumCon(objPlayer)
	local dwRoleID = objPlayer:GetRoleID();
	
	if not self.setRoleFightInfo[dwRoleID] then
		return;--如果是初始则没有改变就不需要记录了
	end
	self.setRoleFightInfo[dwRoleID].dwKillCombo = 0;
end;

--抢夺道具相关逻辑
-------------------------------------------------------------------
--道具持有开始
function CCrossSvrObject:ItemHoldBegin(objPlayer)
	if self.itemHoldRoleId == -1 then
		local roleId = objPlayer:GetRoleID();
		local accountId = objPlayer:GetAccountID();
		local roleName = objPlayer:GetName();
		
        self:SetItemHoldRoleID(roleId, accountId, roleName);
        CCSKillChartSystemManager:Trigger(objPlayer);

		--计时开始 
		local corssSvrCfg = _G.CrossSvrConfig[self.dwCfgID];
		local holdTime = corssSvrCfg.ItemHoldTime;
		self.holdTaskId = _G.CAlarmClock:AddTask({}, _G.CAlarmTaskCycleType.eMinute, holdTime, 1,
		function()
			self:ItemHoldFlish(objPlayer)
		end,
		{});
	
	
		--持有几分钟之后发广播
		self.itemBoradcastId = _G.CAlarmClock:AddTask({}, _G.CAlarmTaskCycleType.eMinute, corssSvrCfg.ItemBroadcastTime, 1,
		function()
			--发送广播
			local corssSvrCfg = _G.CrossSvrConfig[self.dwCfgID];
			local msg = string.format(SysStringConfigInfo[13009300006], roleName, corssSvrCfg.ItemBroadcastTime);
			self:SendCrossMsgToPlayer(msg);
		end,
		{});
		
		objPlayer:GetSystem("CCrossSvrSystem"):SendItemHoldState(1);
		objPlayer:AddViewModel(corssSvrCfg.ItemModelId);
		objPlayer:AddViewPfx(corssSvrCfg.ItemPfxId);
	else
		_err("CCrossSvrObject:ItemHoldBegin------item has a holder!");
	end
end

--道具持有被打断
function CCrossSvrObject:ItemHoldBreak(objPlayer)
	local roleId = objPlayer:GetRoleID();
	
	if self.itemHoldRoleId == roleId then
		self.itemHoldRoleId = -1;
		self.itemHoldAccountId = -1;
		self.itemHoldName = "";
		_G.CAlarmClock:DelTask(self.holdTaskId);
		_G.CAlarmClock:DelTask(self.itemBoradcastId);
		objPlayer:GetSystem("CCrossSvrSystem"):SendItemHoldState(2);
		
		--刷新屠龙刀
		local cfgCross = CrossSvrConfig[self.dwCfgID];
		if cfgCross and cfgCross.ReflushItem then
			cfgCross:ReflushItem(objPlayer);
		end
		
		objPlayer:RmvViewModel(cfgCross.ItemModelId)
		objPlayer:RmvViewPfx(cfgCross.ItemPfxId)
	end
end

--获得道具
function CCrossSvrObject:ItemHoldFlish(objPlayer)
	if self.itemGetRoleId == -1 then
		
		local roleId = objPlayer:GetRoleID();
		local accountId = objPlayer:GetAccountID();
		local roleName = objPlayer:GetName();
		self:SetItemGetRoleID(roleId, accountId, roleName);
		
        CCSKillChartSystemManager:Trigger(objPlayer);
		
		self.itemHoldRoleId = -1;
		objPlayer:GetSystem("CCrossSvrSystem"):SendItemHoldState(3);
		
		local cfgCross = CrossSvrConfig[self.dwCfgID];
		objPlayer:RmvViewModel(cfgCross.ItemModelId);
		objPlayer:RmvViewPfx(cfgCross.ItemPfxId)
		
		--发送广播
		local corssSvrCfg = _G.CrossSvrConfig[self.dwCfgID];
		local msg = string.format(SysStringConfigInfo[13009300005], roleName, corssSvrCfg.ItemHoldTime);
		self:SendCrossMsgToPlayer(msg);
		
		--提前获得屠龙刀存入数据库
		CKernelApp.AHeadGetSwordMsg{CrossId = self.dwCfgID, HoldId = self.itemGetRoleId, HoldAccountId = self.itemGetAccountId, HoldName = self.itemGetName};
	else
		_err("CCrossSvrObject:ItemHoldFlish------item has a player!")
	end
end

--战场结束时调用
--如果返回-1 代表是没有人抢到物品 
function CCrossSvrObject:GetItemRoleID()
	if self.itemGetRoleId ~= -1 then
		return self.itemGetRoleId, self.itemGetAccountId, self.itemGetName;
	end
	
	return	self.itemHoldRoleId, self.itemHoldAccountId, self.itemHoldName;
end

-- 设置屠龙刀持有者
function CCrossSvrObject:SetItemHoldRoleID(dwRoleID, dwAccountID, szRoleName)
    self.itemHoldRoleId = dwRoleID;
    self.itemHoldAccountId = dwAccountID;
    self.itemHoldName = szRoleName;
end

-- 设置屠龙刀获得者
function CCrossSvrObject:SetItemGetRoleID(dwRoleID, dwAccountID, szRoleName)
    self.itemGetRoleId = dwRoleID;
    self.itemGetAccountId = dwAccountID;
    self.itemGetName = szRoleName;
end

----获取玩家战斗信息
function CCrossSvrObject:GetRoleFightInfo(RoleID)
    if (not self.setRoleFightInfo[RoleID]) then
        return {};
    end
    return self.setRoleFightInfo[RoleID];
end

----获取玩家杀人排行榜名次
function CCrossSvrObject:GetPlayerKillIndex(RoleID)
	return CCSKillChartSystemManager:FindMemberRank(RoleID);
end

----获取玩家杀人数
function CCrossSvrObject:GetPlayerKillNum(RoleID)
	if(not self.setRoleFightInfo[RoleID]) then
		return 0;
	end
	return self.setRoleFightInfo[RoleID].dwKillTotal;
end

--给跨服战场内玩家发送的消息
function CCrossSvrObject:SendCrossMsgToPlayer(szStr)
	--只显示广播消息
	CScriptManager:ChatNotice("",nil,false,{},szStr)
end;
