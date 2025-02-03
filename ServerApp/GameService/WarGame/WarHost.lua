--世家战主机

-- print("create warhost succ!")

_G.CWarHost = CSingle:new();

CSingleManager:AddSingle(CWarHost,true);

function CWarHost:Create()
	self.setAllWarGame = {};
	
	self:LoadTimeConfig();
	
	return true;
end;

function CWarHost:Update(dwInv)
	for n,war in pairs(self.setAllWarGame)do
		war:Update(dwInv);
	end
	
	return true;
end;

function CWarHost:Destroy()
	
end;

function CWarHost:OnKSReConnect()
	--print("===CWarHost onKSReConnect===")
	local tbList = {};
	for n,v in pairs(self.setAllWarGame)do
		table.insert(tbList,n);
	end
	CKernelApp.OnKSWarInitMsg{WarList = tbList};
end;

---------------------------------------------------------------------------------------------------
--创建战争
function CWarHost:CreateWar(dwWarCfgID)
	if self.setAllWarGame[dwWarCfgID] then
		-- print("has own war",dwWarCfgID)
		return;
	end
	
	if CWarJoin:IsOpen(dwWarCfgID) then
		-- print("has open war in other server",dwWarCfgID)
		return;
	end
	
	local objWar = CWarObject:new();
	objWar:Init(dwWarCfgID);
	
	self.setAllWarGame[dwWarCfgID] = objWar;
	
	CKernelApp.OnKSCreateWarMsg{WarID = dwWarCfgID,LineID = CKernelApp.dwLineID};
	
	return objWar;
end;

--
function CWarHost:BeginDeleteWar(dwWarCfgID)
	local objWar = self:FindWar(dwWarCfgID);
	if not objWar then
		return;
	end
	--print("=====================BeginDeleteWar")
	objWar:BeginDelete();
end;

--删除战争
function CWarHost:DeleteWar(dwWarCfgID)
	local objWar = self:FindWar(dwWarCfgID);
	if not objWar then
		return;
	end
	
	self.setAllWarGame[dwWarCfgID] = nil;
	
	CKernelApp.OnKSDeleteWarMsg{WarID = dwWarCfgID,LineID = CKernelApp.dwLineID};
	
	objWar:Delete();
end;

--
function CWarHost:FindWar(dwID)
	return self.setAllWarGame[dwID];
end;

--本地进入战争
function CWarHost:TryEnterWarLocal(objPlayer,dwWarID)
	local objWar = self:FindWar(dwWarID);
	if not objWar then
		--还没有进入战争地图，不做特殊处理
		return;
	end
	
	if objWar.isDeling then
		return;
	end
	
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return;
	end;
	
	local dwMap,dwIndex = objWar:GetEnterMap();
	if (not dwMap) or (not dwIndex) then
		return;
	end
	
	if not objMapSys:ExecTransforMap(dwMap,dwIndex) then
		return;
	end
	
	objPlayer:GetSystem("CWarSystem").isEntering = 1;
	objWar:EnterPlayer(objPlayer);
end;

--换线进入战争
function CWarHost:TryEnterWarChange(objPlayer,dwWarID)
	local objWar = self:FindWar(dwWarID);
	if not objWar then
		return;
	end
	
	if objWar.isDeling then
		return;
	end
	
	--换线进入的时候，直接修改MapSystem中的数据
	--这个地方是在ChangeLineEnd中调用的，之后CMapSystem:ExecChangeMap会被调用，所以这里就不调用了
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return;
	end;
	
	local dwMap,dwIndex = objWar:GetEnterMap();
	if (not dwMap) or (not dwIndex) then
		return;
	end
	
	local cfgMap = MapInfoConfig[dwMap];
	if not cfgMap then
		return;
	end
	
	local newPoint = cfgMap.point[dwIndex];
	
	objMapSys.dwCurMapID = dwMap;
	objMapSys.fXPos = newPoint.fXPos + math.random(-newPoint.fRange,newPoint.fRange);
	objMapSys.fYPos = newPoint.fYPos + math.random(-newPoint.fRange,newPoint.fRange);
	objMapSys.fDirValue = math.random(0,6);
	
	objMapSys.isMustReload = true;
	objWar:EnterPlayer(objPlayer);
	
	return true;
end;

--
function CWarHost:TryLevelWar(objPlayer,dwWarID)
	local objWar = self:FindWar(dwWarID);
	if not objWar then
		return;
	end
	
	objWar:ExitPlayer(objPlayer);
	
	local dwEndFlag = 0;
	if objWar.isDeling then
		dwEndFlag = 1;
	end
	--角色离开的共同点在这里
	objPlayer.OnExitWarMsg
	{
		WarEnd = dwEndFlag;
	};
end;

-------------------------------------------------------------------------------
--时间配置加载
function CWarHost:LoadTimeConfig()
	for id,cfg in pairs(WarEnterConfig)do
		if cfg.CreateTime == -1 then
			self:CreateWar(id);
		else
			local timemark = {};
			timemark.dwTime = cfg.CreateTime;
			CAlarmClock:AddTask(timemark,CAlarmTaskCycleType.eDay,1,0,
				function() self:CheckWarCreate(id) end,{});
		end
		
		
		if cfg.DeleteTime == -1 then
			-- self:CreateWar(id);
		else
			local timemark = {};
			timemark.dwTime = cfg.DeleteTime;
			CAlarmClock:AddTask(timemark,CAlarmTaskCycleType.eDay,1,0,
				function() self:CheckWarDelete(id) end,{});
		end
	end
end;

local function CountTodayWeek()
	local year, month, day = CTimeFormat:todate(GetCurTime(1), true, false);
	
	return CTimeFormat:DayToWeek(year, month, day);
end;

--
function CWarHost:CheckWarCreate(dwID)
	local cgfEnter = WarEnterConfig[dwID];
	if not cgfEnter then
		return;
	end
	
	if cgfEnter.tmServerOpenDistance then
		local tmDis = GetCurTime() - CTimeRewardManager:GetServerStartTime();
		if tmDis < cgfEnter.tmServerOpenDistance then
			return;
		end
	end
	
	local isCreate = false;
	local dwWeek = CountTodayWeek();
	for _,day in pairs(cgfEnter.WeeklyOpenDay)do
		if day == dwWeek then
			isCreate = true;
			break;
		end
	end
	
	if isCreate then
		self:CreateWar(dwID);
	end
end;

--
function CWarHost:CheckWarDelete(dwID)
	local cgfEnter = WarEnterConfig[dwID];
	if not cgfEnter then
		return;
	end
	
	local isDelete = false;
	local dwWeek = CountTodayWeek();
	for _,day in pairs(cgfEnter.WeeklyOpenDay)do
		if day == dwWeek then
			isDelete = true;
			break;
		end
	end
	
	if isDelete then
		self:BeginDeleteWar(dwID);
	end
end;

-------------------------------------------------------------------------------
--检测buff是否允许使用
--true，允许使用；false，禁止使用
function CWarHost:CheckBuffForbid(dwBuffID,dwWarID)
	local cfgWar = WarConfig[dwWarID];
	if not cfgWar then
		return true;
	end
	
	for _,id in pairs(cfgWar.BuffForbidList)do
		if dwBuffID == id then
			return false;
		end
	end
	
	return true;
end;

--
function CWarHost:BroadcastWarNotice(dwNoticeType,dwStringID,tbParam)
	CKernelApp.OnKSWarNoticeMsg
	{
		NoticeType = dwNoticeType;
		StringID = dwStringID;
		Param = tbParam;
	}
end;

-- 增加侠客岛的死亡列表
function CWarHost:AddXiaKeList(nMonsterID)
    self.setAllWarGame[10070].tXiaKeMonster[nMonsterID] = true;
    -- 向所有侠客岛中的玩家发送消息
	self.setAllWarGame[10070]:BroadcastMsg("WarXiaKeDeadListMsg",
        {DeadList = self:GetXiaKeList()});
end

-- 获取侠客岛死亡列表
function CWarHost:GetXiaKeList()
    local tRet = {};
    for k, _ in pairs(self.setAllWarGame[10070].tXiaKeMonster) do
        table.insert(tRet, k);
    end
    return tRet;
end
