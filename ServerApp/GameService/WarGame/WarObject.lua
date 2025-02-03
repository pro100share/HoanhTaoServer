--世家战地图

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

--同步鼎血量的最大改变值
local m_TrophyChgMax = 15;

--踢出角色的时间间隔
local m_KickPlayerTick = 500;

_G.CWarObject = {};

function CWarObject:new()
	local obj = {};
	obj.setAllMap = {};
	obj.setAllPlayer = {};
	
	--地图中鼎的数据
	--dwGuildID：工会ID
	--szOwner：工会名字
	--dwHPValue：血量
	--dwChgValue；上次同步血量之后的改变量，每次同步清空
	--tmChangeTime：鼎更换主人的时间点
	obj.setTrophyInfo = {};
	obj.dwSendTick = 0;
	
	--角色列表收益
	obj.setHarvestList = {};
	
	--杀人数的统计表
	--[roleid] = {szRoleName,dwKillTotal,dwKillCombo,dwKillComboMax,dwScore}
	obj.setRoleFightInfo = {};
	
	obj.setSortByKillTotle = {};
	obj.setSortByKillComboMax = {};
	obj.setSortByScore = {};
	
	obj.setTeamScoreSort = {};     --战场组队积分
	obj.setTeamScore = {};
	
	obj.setSplMemberList = {};--特殊成员列表
	
	obj.objMyTimer = COwnTimer:new();
	
	obj.setNumberRecord = {};--计数器
	
	obj.dwWarUpdateTick = nil;
	obj.dwPlayerUpdateTick = nil;
	
	obj.setRoleLength = {};--角色在战场中的时长
    
    -- 记录侠客岛中的怪物宝箱信息
    obj.tXiaKeMonster = nil;
	
	--用于确认角色唯一性的参数
	obj.dwMaxIndex = 1;
	obj.setRole2Index = {};
	obj.setIndex2Role = {};
	
	---
	for i,v in pairs(CWarObject) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CWarObject:Init(dwCfgID)
	self.dwCfgID = dwCfgID;
	self.setExecBack = {};
	self.dwBeginTime = GetCurTime();
	
	self:CreateOwnMap();
	
	self:EventGameStart();
    
    if dwCfgID == 10070 then
        self.tXiaKeMonster = {};
    end
end;

function CWarObject:Update(dwInv)
	-- local tbCfg = WarConfig[self.dwCfgID];
	-- if tbCfg and tbCfg.UpdateByWar then
		-- tbCfg:UpdateByWar(self);
	-- end
	
	self.objMyTimer:Update(dwInv);
	
	--执行踢出角色的队列，逐次把角色踢出战场
	self:UpdateDoKick();
	
	if self.isDeling then
		local tmNow = GetCurTime();
		if tmNow - self.tmDeleteTime > 600000 then
			--结束后10分钟，强制所有人下线
			for _,id in pairs(self.setAllPlayer)do
				local objPlayer = CMapManager:GetPlayer(id);
				if objPlayer then
					objPlayer.CreateGameSessionRequestMsg{ResultCode = -25}
					_closenet(objPlayer.objNet);
				end
			end
			
			CWarHost:DeleteWar(self.dwCfgID);
		end
	end
end;

function CWarObject:UpdateDoKick()
	-- if not self.isDeling then
		-- return;
	-- end
	
	if #self.setExecBack == 0 then
		return;
	end
	
	if not self.dwLastKick then
		self.dwLastKick = 0;
	end
	
	local dwNow = GetCurTime();
	if dwNow - self.dwLastKick < m_KickPlayerTick then
		return;
	end
	self.dwLastKick = dwNow;
	
	local dwID = self.setExecBack[1];
	if dwID then
		_info("CWarObject:UpdateDoKick=======11", dwID)
		local objPlayer = CMapManager:GetPlayer(dwID);
		if objPlayer then
			objPlayer:GetSystem("CWarSystem"):Back();
			_info("CWarObject:UpdateDoKick=======22", dwID)	
		end
		table.remove(self.setExecBack,1);
	end
end;

function CWarObject:BeginDelete()
	if self.dwCfgID == 10040 then
		_info("=====QYSD_BeginDelete=====")
	end
	self:KickAllPlayer();
	self:EventGameOver();
	
	self.isDeling = true;
	self.tmDeleteTime = GetCurTime();

	--传递信息给盟主系统
	local dwV = 0;
	for n,v in pairs(self.setSplMemberList)do
		dwV = n;
		break;
	end
	CAllianceLeaderManager:OnRecvWarEnd(dwV,self.dwCfgID)
	
	local isNone = true;
	for n,v in pairs(self.setAllPlayer)do
		isNone = false;
		break;
	end
	if isNone then
		CWarHost:DeleteWar(self.dwCfgID);
	end
	
	for _,id in pairs(self.setAllPlayer)do
		local objPlayer = CMapManager:GetPlayer(id);
		if objPlayer then
			objPlayer.OnDeleteTrophyInfoMsg{}
		end
	end
end;

function CWarObject:Delete()
	for k,map in pairs(self.setAllMap)do
		CMapManager.setAllMap[k] = nil;
		map:Destroy();
	end
	
	self.setAllMap = {};
	self.setAllPlayer = {};
	self.setExecBack = {};
	self.dwLastKick = nil;
    self.tXiaKeMonster = nil;
end;

--创建战争旗下的所有地图
function CWarObject:CreateOwnMap()
	local tbCfg = WarConfig[self.dwCfgID];
    if not tbCfg then
        _err("CWarObject:CreateOwnMap() WarConfig Error", self.dwCfgID);
        return;
    end
	for n,dwMapID in pairs(tbCfg.MapSet)do
		local map = MapInfoConfig[dwMapID]; 
		if map and type(map) == "table" then
			local objMap = CMap:new(dwMapID, map.dwMapType, map.szMapCog,map.dwHeight,CKernelApp.dwLineID);
			if not objMap then
				_info("objMap is null by CWarObject:CreateOwnMap( )");
				return false;
			end;
			if not objMap:Create() then
				_info("map:Create() is null by CWarObject:CreateOwnMap( )");
				return false;
			end;
			CMapManager:AddMap( objMap );
			
			self.setAllMap[dwMapID] = objMap;
		end
	end
end;

--把所有角色踢出
function CWarObject:KickAllPlayer()
	-- for n,id in pairs(self.setAllPlayer)do
		-- local objPlayer = CMapManager:GetPlayer(id);
		-- --print("============================~")
		-- if objPlayer then
		-- --print("============================~~")
			-- objPlayer:GetSystem("CWarSystem"):Back();
		-- end
	-- end
	--self.setAllPlayer = {};
	--用一个新表存储当前所有角色，然后根据这个拷贝表来踢出角色
	self.setExecBack = {};
	for n,v in pairs(self.setAllPlayer)do
		table.insert(self.setExecBack,n);
	end
	_info("CWarObject:KickAllPlayer===========")
	-- table.print(self.setExecBack)
end;

function CWarObject:KickPlayer(dwRoleID)
	if not self.setAllPlayer[dwRoleID] then
		return;
	end
	local objPlayer = CMapManager:GetPlayer(dwRoleID);
	if objPlayer then
		if objPlayer:GetSystem("CTeamSystem") then
			objPlayer:GetSystem("CTeamSystem"):ExitTeam(false);
		end;
	end
	table.insert(self.setExecBack,dwRoleID)
end;

-------------------------------------------------------------------------------
function CWarObject:EnterPlayer(objPlayer)
	self.setAllPlayer[objPlayer:GetRoleID()] = objPlayer:GetRoleID();
	--print("----------------------------EnterPlayer",objPlayer:GetRoleID())
	
	objPlayer:GetSystem("CWarSystem"):EnterWar(self.dwCfgID);
	
	self:EventPlayerEnter(objPlayer);
	
	local tbName = {};
	for id,dwBeginTime in pairs(self.setSplMemberList)do
		local objMem = CMapManager:GetPlayer(id);
		if objMem then
			-- table.insert(tbName,objMem:GetName())
			tbName[objMem:GetName()] = self:GetSplLength(id);
		end
	end
	objPlayer:GetSystem("CWarSystem"):SendSplMember(tbName);
end;

function CWarObject:ExitPlayer(objPlayer)
	self.setAllPlayer[objPlayer:GetRoleID()] = nil;
	--print("----------------------------ExitPlayer",objPlayer:GetRoleID())
	if self.isDeling then
		local isAllClear = true;
		for _,id in pairs(self.setAllPlayer)do
			isAllClear = false;
			break;
		end
		
		if isAllClear then
			CWarHost:DeleteWar(self.dwCfgID);
		end
	else
		self:EventPlayerExit(objPlayer);
	end
end;

--获取一个进入战争的地图ID和坐标点ID
function CWarObject:GetEnterMap()
	local tbCfg = WarConfig[self.dwCfgID];
	
	local tbEnterMap = tbCfg.EnterMapSet;
	
	local dwMap,tbPoint = GetRandTableValue(tbEnterMap);
	if not tbPoint then
		return;
	end
	
	local _,dwPointIndex = GetRandTableValue(tbPoint);
	
	return dwMap,dwPointIndex;
end;

--获得退出战场的目标点
function CWarObject:GetExitInfo()
	local tbCfg = WarConfig[self.dwCfgID];
	if not tbCfg.ExitMapPosList then
		return nil;
	end
	
	local dwNum = #tbCfg.ExitMapPosList;
	if dwNum == 0 then
		return nil;
	end
	
	local dwRnd = math.random(dwNum);
	
	return tbCfg.ExitMapPosList[dwRnd];
end;

--对战场中所有人广播
-- function CWarObject:BroadcastMsg(szFuncName,...)
	-- local args = {...};
	
	-- for id,_ in pairs(self.setAllPlayer)do
		-- local objPlayer = CMapManager:GetPlayer(id);
		-- if objPlayer then
			-- local objWarSys = objPlayer:GetSystem("CWarSystem");
			-- if objWarSys and objWarSys[szFuncName] then
				-- objWarSys[szFuncName](objWarSys,unpack(args));
			-- end
		-- end
	-- end
-- end;

function CWarObject:BroadcastMsg(szMsgName,Param)
	local tbNet = {};
	
	for id,_ in pairs(self.setAllPlayer)do
		local objPlayer = CMapManager:GetPlayer(id);
		if objPlayer then
			table.insert(tbNet,objPlayer.objNet);
		end
	end
	
	_groupcallout(tbNet,szMsgName,Param);
end;

-------------------------------------------------------------------------------
--需要响应的事件
function CWarObject:EventPlayerEnter(objPlayer)
	local cfgWar = WarConfig[self.dwCfgID];
	if cfgWar and cfgWar.EventEnterPlayer then
		cfgWar:EventEnterPlayer(self,objPlayer);
	end
	
	local dwRoleID = objPlayer:GetRoleID();
	
	--给角色分配一个index
	self.setRole2Index[dwRoleID] = self.dwMaxIndex;
	self.setIndex2Role[self.dwMaxIndex] = dwRoleID;
	self:BeginPlayerUpdate(dwRoleID,self.dwMaxIndex);
	-- print("===EventPlayerEnter===",dwRoleID,self.dwMaxIndex)
	self.dwMaxIndex = self.dwMaxIndex + 1;
end;

function CWarObject:EventPlayerExit(objPlayer)
	local cfgWar = WarConfig[self.dwCfgID];
	if cfgWar and cfgWar.EventExitPlayer then
		cfgWar:EventExitPlayer(self,objPlayer);
	end
	
	local dwRoleID = objPlayer:GetRoleID();
	
	--收回角色的index
	local dwMyIndex = self.setRole2Index[dwRoleID];
	if dwMyIndex then
		self.setIndex2Role[dwMyIndex] = nil;
	end
	self.setRole2Index[dwRoleID] = nil;
end;

function CWarObject:EventGameStart()
	local cfgWar = WarConfig[self.dwCfgID];
	if not cfgWar then
		return;
	end
	
	if cfgWar.EventGameStart then
		cfgWar:EventGameStart(self);
	end
	
	self:BeginWarUpdate();
end;

function CWarObject:EventGameOver()
	local cfgWar = WarConfig[self.dwCfgID];
	if cfgWar then
		if cfgWar.EventGameOver then
			cfgWar:EventGameOver(self);
		end
		
		if cfgWar.WarLogRecod then
			cfgWar:WarLogRecod(self);
		end
	end
end;

function CWarObject:EventTrophyChg(dwMonsterID,objPlayer)
	local objGuildSys = objPlayer:GetSystem("CGuildSystem");
	if not objGuildSys then
		return;
	end
	--鼎的索引
	local dwTrophyID = WarTrophyConfig[dwMonsterID];
	if not dwTrophyID then
		return;
	end
	
	local szNewName = objGuildSys:GetGuildName();
	--print("==========EventTrophyChg============",dwTrophyID,szNewName)
	--self:BroadcastMsg("SendTrophyChangeMsg",dwTrophyID,szNewName);
	self:BroadcastMsg("OnTrophyChangeMsg",
	{
		TrophyID = dwTrophyID;
		NewGuildName = szNewName;
	})
	
	self.setTrophyInfo[dwTrophyID].szOwner = szNewName;
	self.setTrophyInfo[dwTrophyID].dwGuildID = objGuildSys:GetGuildID();
	self.setTrophyInfo[dwTrophyID].tmChangeTime = GetCurTime();
end;

function CWarObject:EventTrophtHPChg(dwMonsterID,dwHP)
	local dwTrophyID = WarTrophyConfig[dwMonsterID];
	if not dwTrophyID then
		return;
	end
	
	local tbInfo = self.setTrophyInfo[dwTrophyID];
	
	local dwDis = dwHP - tbInfo.dwHPValue;
	tbInfo.dwChgValue = tbInfo.dwChgValue + dwDis;
	tbInfo.dwHPValue = dwHP;
	--print("======EventTrophtHPChg=======",dwTrophyID,dwHP,tbInfo.dwChgValue,m_TrophyChgMax)
	--HP为0，则怪物死亡，必须广播
	--如果变化值没有超过规定值，就不发送
	if dwHP > 0 then
		if math.abs(tbInfo.dwChgValue) < m_TrophyChgMax then
			return;
		end
	end
	
	local tbSendInfo = {};
	tbSendInfo[dwTrophyID] = tbInfo.dwHPValue;
	
	--self:BroadcastMsg("SendTrophyHPInfo",tbSendInfo);
	self:BroadcastMsg("OnTrophyHPChgMsg",
	{
		ChgInfo = tbSendInfo;
	})
	
	tbInfo.dwChgValue = 0;
end;

--战场中杀死人
function CWarObject:EventKillPlayer(objKiller,objDeader)
	local cfgWar = WarConfig[self.dwCfgID];
	if cfgWar and cfgWar.EventKillPlayer then
		cfgWar:EventKillPlayer(self,objKiller,objDeader);
	end
end;

function CWarObject:EventUpdateForWar()
	if self.dwCfgID == 10040 then
		_info("===QYSD_EventUpdateForWar===",self.isDeling,self:GetNumber("num10040"))
	end
	
	local cfgWar = WarConfig[self.dwCfgID];
	if cfgWar and cfgWar.UpdateForWar then
		cfgWar:UpdateForWar(self);
	end
	
	self:BeginWarUpdate();
end;

function CWarObject:EventUpdateForPlayer(dwRoleID,dwMyIndex)
	-- print("===EventUpdateForPlayer===",dwRoleID,dwMyIndex)
	--角色有效性判断
	if self.setIndex2Role[dwMyIndex] ~= dwRoleID then
		-- print("===EventUpdateForPlayer 1===")
		return;
	end
	if self.setRole2Index[dwRoleID] ~= dwMyIndex then
		-- print("===EventUpdateForPlayer 2===")
		return;
	end
	
	local objPlayer = CMapManager:GetPlayer(dwRoleID)
	if not objPlayer then
		-- print("===EventUpdateForPlayer 3===")
		return;
	end

	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return;
	end
	-- print("===EventUpdateForPlayer 101===")
	local tbScript = CScriptManager:GetScript(5,objMapSys.dwCurMapID);
	if tbScript and tbScript.UpdateForPlayer then
		tbScript:UpdateForPlayer(self,objPlayer);
	end
	
	self:BeginPlayerUpdate(dwRoleID,dwMyIndex);
end;

--玩家在战场中退队后将玩家踢出副本
function CWarObject:EventKickPlayerOutWar(objPlayer)
	local cfgWar = WarConfig[self.dwCfgID];
	if cfgWar and cfgWar.KickPlayerOutWar then
		cfgWar:KickPlayerOutWar(self, objPlayer);
	end
end;
-------------------------------------------------------------------------------
--设置鼎的信息
function CWarObject:SetTrophyInfo()
	for n,v in pairs(WarTrophyConfig)do
		self.setTrophyInfo[v] = {};
	end
	
	local cfgWar = WarConfig[self.dwCfgID];
	if not cfgWar then
		return;
	end
	
	for mapid,monid in pairs(cfgWar.TrophyMonster)do
		local objMap = self.setAllMap[mapid];
		if objMap then
			local tbList = objMap:GetMonsterMgr():GetMonsterById(monid,true);
			
			local dwTrophyID = WarTrophyConfig[monid];
			if dwTrophyID then
				for _,objMon in pairs(tbList)do
					--每个鼎只会有一个
					self.setTrophyInfo[dwTrophyID].szOwner = "";
					self.setTrophyInfo[dwTrophyID].dwGuildID = 0;
					self.setTrophyInfo[dwTrophyID].dwHPValue = objMon:GetHP();
					self.setTrophyInfo[dwTrophyID].dwChgValue = 0;
					self.setTrophyInfo[dwTrophyID].tmChangeTime = 0;
					objMon.dwOwnWarID = self.dwCfgID;
					break;
				end
			end
		end
	end
end;

--得出
function CWarObject:SendResultToGuild()
	local tbResultInfo = {};
	
	for id,info in pairs(self.setTrophyInfo)do
		tbResultInfo[id] = info.dwGuildID;
	end
	
	for n,v in pairs(tbResultInfo)do
		-- print("CWarObject:SendResultToGuild",n,v)
	end
	
	--CKernelApp.KSUpdateGuildTrophyMsg{TabInfo = tbResultInfo};
	CGuildSystem:UpdateTrophy(tbResultInfo);
end;

--获取鼎已经被占领的时间：毫秒
function CWarObject:GetTrophyTime(dwTrophyID)
	local tbInfo = self.setTrophyInfo[dwTrophyID];
	if not tbInfo then
		return 0;
	end
	
	if tbInfo.tmChangeTime == 0 then
		return 0;
	end
	
	local tmNow = GetCurTime();
	
	local tmUsed = tmNow - tbInfo.tmChangeTime;
	
	return tmUsed;
end

-------------------------------------------------------------------------------
--关于战场内部的杀人统计
function CWarObject:CreateNewInfo(dwRoleID,szName)
	self.setRoleFightInfo[dwRoleID] = {};
	self.setRoleFightInfo[dwRoleID].szRoleName = szName;
	self.setRoleFightInfo[dwRoleID].dwKillTotal = 0;
	self.setRoleFightInfo[dwRoleID].dwKillCombo = 0;
	self.setRoleFightInfo[dwRoleID].dwKillComboMax = 0;
	self.setRoleFightInfo[dwRoleID].dwScore = 0;
end;

--总杀人数增加
function CWarObject:AddKillNumAll(objPlayer)
	local dwRoleID = objPlayer:GetRoleID();
	
	if not self.setRoleFightInfo[dwRoleID] then
		self:CreateNewInfo(dwRoleID,objPlayer:GetName());
	end
	local tbMyInfo = self.setRoleFightInfo[dwRoleID];
	tbMyInfo.dwKillTotal = tbMyInfo.dwKillTotal + 1;
	
	objPlayer:GetSystem("CWarSystem"):SendMyKillNum(tbMyInfo.dwKillTotal,tbMyInfo.dwKillCombo);
	
	self:UpdateSortByTotle(dwRoleID,tbMyInfo.dwKillTotal)
end;

--连杀数增加
function CWarObject:AddKillNumCon(objPlayer)
	local dwRoleID = objPlayer:GetRoleID();
	
	if not self.setRoleFightInfo[dwRoleID] then
		self:CreateNewInfo(dwRoleID,objPlayer:GetName());
	end
	local tbMyInfo = self.setRoleFightInfo[dwRoleID];
	tbMyInfo.dwKillCombo = tbMyInfo.dwKillCombo + 1;
	
	if tbMyInfo.dwKillCombo > tbMyInfo.dwKillComboMax then
		tbMyInfo.dwKillComboMax = tbMyInfo.dwKillCombo;
	end
	
	objPlayer:GetSystem("CWarSystem"):SendMyKillNum(tbMyInfo.dwKillTotal,tbMyInfo.dwKillCombo);
	
	self:UpdateSortByCombo(dwRoleID,tbMyInfo.dwKillComboMax);
	
	--notice
	local tbInfo = KillComboNoticeNum[tbMyInfo.dwKillCombo];
	if tbInfo then
		local szGuildName = "";
		local szSelfName = objPlayer:GetName();
		local objGuildSys = objPlayer:GetSystem("CGuildSystem");
		if objGuildSys then
			szGuildName = objGuildSys:GetGuildName();
		end
		
		self:BroadcastWarNotice(tbInfo.broadtype,tbInfo.noticetype,tbInfo.strid,szGuildName,szSelfName,tbMyInfo.dwKillCombo);
	end
end;

--清空连杀数
function CWarObject:ClearKillNumCon(objPlayer)
	local dwRoleID = objPlayer:GetRoleID();
	
	if not self.setRoleFightInfo[dwRoleID] then
		self:CreateNewInfo(dwRoleID,objPlayer:GetName());
		return;--如果是初始则没有改变就不需要记录了
	end
	
	local tbMyInfo = self.setRoleFightInfo[dwRoleID];
	tbMyInfo.dwKillCombo = 0;
	
	objPlayer:GetSystem("CWarSystem"):SendMyKillNum(tbMyInfo.dwKillTotal,tbMyInfo.dwKillCombo);
end;

local function IsInTable(tbTest,val)
	for n,v in pairs(tbTest)do
		if v == val then
			return true;
		end
	end
	return nil;
end;

--
function CWarObject:UpdateSortByTotle(dwRoleID,dwValue)
	local isNeedSend = nil;
	
	local isInSort = IsInTable(self.setSortByKillTotle,dwRoleID);
	
	if isInSort then
		table.sort(self.setSortByKillTotle,
			function(a,b)
				local dwAV = self.setRoleFightInfo[a].dwKillTotal;
				local dwBV = self.setRoleFightInfo[b].dwKillTotal;
				return dwAV > dwBV;
			end);
		isNeedSend = true;
	else
		if self.setSortByKillTotle[10] then
			--表满了
			local dwSortValue = self:GetKillNumAll(self.setSortByKillTotle[10]);
			if dwValue > dwSortValue then
				--新值超过最后的排名
				self.setSortByKillTotle[11] = dwRoleID;
				
				table.sort(self.setSortByKillTotle,
					function(a,b)
						local dwAV = self.setRoleFightInfo[a].dwKillTotal;
						local dwBV = self.setRoleFightInfo[b].dwKillTotal;
						return dwAV > dwBV;
					end);
				self.setSortByKillTotle[11] = nil;
				isNeedSend = true;
			end
		else
			--这个表没有满，直接添加
			table.insert(self.setSortByKillTotle,dwRoleID);
			isNeedSend = true;
		end
	end
	
	if isNeedSend then
		local tbSend = {};
		local tbRoleInfo = self.setRoleFightInfo[dwRoleID];
		tbSend[tbRoleInfo.szRoleName] = tbRoleInfo.dwKillTotal;
		
		--self:BroadcastMsg("SendSortInfoAll",tbSend);
		self:BroadcastMsg("OnUpdateKillAllMsg",
		{
			KillInfo = tbSend;
		});
	end
end;

--
function CWarObject:UpdateSortByCombo(dwRoleID,dwValue)
	local isNeedSend = nil;
	
	local isInSort = IsInTable(self.setSortByKillComboMax,dwRoleID);
	
	if isInSort then
		table.sort(self.setSortByKillComboMax,
			function(a,b)
				local dwAV = self.setRoleFightInfo[a].dwKillComboMax;
				local dwBV = self.setRoleFightInfo[b].dwKillComboMax;
				return dwAV > dwBV;
			end);
		isNeedSend = true;
	else
		if self.setSortByKillComboMax[10] then
			--表满了
			local dwSortValue = self:GetKillNumConMax(self.setSortByKillComboMax[10]);
			if dwValue > dwSortValue then
				--新值超过最后的排名
				self.setSortByKillComboMax[11] = dwRoleID;
				
				table.sort(self.setSortByKillComboMax,
					function(a,b)
						local dwAV = self.setRoleFightInfo[a].dwKillComboMax;
						local dwBV = self.setRoleFightInfo[b].dwKillComboMax;
						return dwAV > dwBV;
					end);
				self.setSortByKillComboMax[11] = nil;
				isNeedSend = true;
			end
		else
			--这个表没有满，直接添加
			table.insert(self.setSortByKillComboMax,dwRoleID);
			isNeedSend = true;
		end
	end
	
	
	if isNeedSend then
		local tbSend = {};
		local tbRoleInfo = self.setRoleFightInfo[dwRoleID];
		tbSend[tbRoleInfo.szRoleName] = tbRoleInfo.dwKillComboMax;
		
		self:BroadcastMsg("OnUpdateKillConMsg",
		{
			KillInfo = tbSend;
		});
	end
end;

--获取杀人数
function CWarObject:GetKillNumAll(dwRoleID)
	local dwNum = 0;
	
	if self.setRoleFightInfo[dwRoleID] then
		dwNum = self.setRoleFightInfo[dwRoleID].dwKillTotal;
	end
	
	return dwNum;
end;

--获取连杀数
function CWarObject:GetKillNumCon(dwRoleID)
	local dwNum = 0;
	
	if self.setRoleFightInfo[dwRoleID] then
		dwNum = self.setRoleFightInfo[dwRoleID].dwKillCombo;
	end
	
	return dwNum;
end;

--获取连杀最大数
function CWarObject:GetKillNumConMax(dwRoleID)
	local dwNum = 0;
	
	if self.setRoleFightInfo[dwRoleID] then
		dwNum = self.setRoleFightInfo[dwRoleID].dwKillComboMax;
	end
	
	return dwNum;
end;

--是否在榜单中
function CWarObject:IsInSortList(dwRoleID,isTotleList)
	local szListName = "setSortByKillComboMax";
	if isTotleList then
		szListName = "setSortByKillTotle";
	end
	
	for _,id in pairs(self[szListName])do
		if id == dwRoleID then
			return true;
		end
	end
	
	return false;
end;

--被杀者是否是杀人者的仇人
function CWarObject:CheckKillEnmity(objKiller,objDeader)
	local dwDeadID = objDeader:GetRoleID();
	local objKillSys = objKiller:GetSystem("CWarSystem");
	if objKillSys then
		return objKillSys.dwMyEnmity == dwDeadID;
	end
end;

--发送榜单数据
function CWarObject:SendKillSortToPlayer(objPlayer)
	local objWarSys = objPlayer:GetSystem("CWarSystem");
	if not objWarSys then
		return;
	end
	
	local tbListAll = {};
	local tbListCon = {};
	local isNeedAll = nil;
	local isNeedCon = nil;
	
	for _,id in pairs(self.setSortByKillTotle)do
		local tbRoleInfo = self.setRoleFightInfo[id];
		tbListAll[tbRoleInfo.szRoleName] = tbRoleInfo.dwKillTotal;
		isNeedAll = true;
	end
	for _,id in pairs(self.setSortByKillComboMax)do
		local tbRoleInfo = self.setRoleFightInfo[id];
		tbListCon[tbRoleInfo.szRoleName] = tbRoleInfo.dwKillComboMax;
		isNeedCon = true;
	end
	
	if isNeedAll then
		objWarSys:SendSortInfoAll(tbListAll);
	end
	if isNeedCon then
		objWarSys:SendSortInfoCon(tbListCon);
	end
end;

--统计世家占领的鼎的总分
function CWarObject:CountTrophyScore(guildID)
	local dwScore = 0;
	
	for id,info in pairs(self.setTrophyInfo)do
		if info.dwGuildID == guildID then
			dwScore = dwScore + TrophyScore[id];
		end
	end
	
	return dwScore;
end;

-------------------------------------------------------------------------------
--广播消息
--dwBroadType:1--战场内；2--本地服务器；3--KS广播全部服务器
function CWarObject:BroadcastWarNotice(dwBroadType,dwNoticeType,dwStringID,...)
	local tbParam = {...};
	
	if dwBroadType == 1 then
		-- for id,_ in pairs(self.setAllPlayer)do
			-- local objPlayer = CMapManager:GetPlayer(id);
			-- if objPlayer then
				-- objPlayer.OnWarNoticeMsg
				-- {
					-- NoticeType = dwNoticeType;
					-- StringID = dwStringID;
					-- Param = tbParam;
				-- }
			-- end
		-- end
		self:BroadcastMsg("OnWarNoticeMsg",
		{
			NoticeType = dwNoticeType;
			StringID = dwStringID;
			Param = tbParam;
		});
	elseif dwBroadType == 2 then
		CWarJoin:BroadcastWarNotice(dwNoticeType,dwStringID,tbParam);
	elseif dwBroadType == 3 then
		CWarHost:BroadcastWarNotice(dwNoticeType,dwStringID,tbParam)
	end
end;

-------------------------------------------------------------------------------
--盟主战需要用到的有关盟主设置的函数

function CWarObject:SetSplMember(dwPlayerID)
	if not self.setAllPlayer[dwPlayerID] then
		-- print("=====player not member=====",dwPlayerID)
		return;
	end
	
	self.setSplMemberList[dwPlayerID] = GetCurTime();
	
	--广播特效
	local objPlayer = CMapManager:GetPlayer(dwPlayerID);
	if objPlayer then
		objPlayer:AddViewPfx(52);
	end
	
	local tbName = {};
	for id,dwTime in pairs(self.setSplMemberList)do
		local objMem = CMapManager:GetPlayer(id);
		if objMem then
			-- table.insert(tbName,objMem:GetName())
			tbName[objMem:GetName()] = self:GetSplLength(id);
		end
	end
	
	self:BroadcastMsg("OnUpdateSplMemberMsg",
	{
		List = tbName;
	});
end;

function CWarObject:RmvSplMember(dwPlayerID)
	self.setSplMemberList[dwPlayerID] = nil;
	
	--删除特效
	local objPlayer = CMapManager:GetPlayer(dwPlayerID);
	if objPlayer then
		objPlayer:RmvViewPfx(52);
	end
	
	local tbName = {};
	for id,dwTime in pairs(self.setSplMemberList)do
		local objMem = CMapManager:GetPlayer(id);
		if objMem then
			-- table.insert(tbName,objMem:GetName())
			tbName[objMem:GetName()] = self:GetSplLength(id);
		end
	end
	
	self:BroadcastMsg("OnUpdateSplMemberMsg",
	{
		List = tbName;
	});
end;

function CWarObject:IsSplMember(dwPlayerID)
	return self.setSplMemberList[dwPlayerID] ~= nil;
end;

function CWarObject:IsHaveSplMember()
	for n,v in pairs(self.setSplMemberList)do
		return true;
	end
	return false;
end;

function CWarObject:GetSplLength(dwPlayerID)
	local dwBeginTime = self.setSplMemberList[dwPlayerID];
	if not dwBeginTime then
		return 0;
	end
	
	local tmNow = GetCurTime();
	
	return (tmNow-dwBeginTime);
end;

-------------------------------------------------------------------------------
--战场数量计算器
function CWarObject:CreateNumber(szName,dwBaseValue)
	self.setNumberRecord[szName] = dwBaseValue or 0;
end

function CWarObject:ChangeNumber(szName,dwChangeValue)
	if not self.setNumberRecord[szName] then
		return;
	end
	
	self.setNumberRecord[szName] = self.setNumberRecord[szName] + dwChangeValue;
end;

function CWarObject:GetNumber(szName)
	return self.setNumberRecord[szName] or 0;
end;

-------------------------------------------------------------------------------
function CWarObject:SendAllEscortFail()
	for k,objMap in pairs(self.setAllMap)do
		objMap:GetMonsterMgr():SendAllRoleEscortFail()
	end
end;

-------------------------------------------------------------------------------
--设置战场中Update回调的时间级别
function CWarObject:SetUpdateTimeForPlayer(dwTime)
	self.dwPlayerUpdateTick = dwTime;
end;

function CWarObject:SetUpdateTimeForWar(dwTime)
	self.dwWarUpdateTick = dwTime;
end;

function CWarObject:BeginWarUpdate()
	if self.dwCfgID == 10040 then
		_info("===QYSD_BeginWarUpdate===",self.dwWarUpdateTick,self.isDeling,self:GetNumber("num10040"))
	end
	
	if self.dwWarUpdateTick then
		self.objMyTimer:AddEvent(self.dwWarUpdateTick,function()
			self:EventUpdateForWar()
		end);
	end
end;

function CWarObject:BeginPlayerUpdate(dwRoleID)
	if self.dwPlayerUpdateTick then
		local dwMyIndex = self.setRole2Index[dwRoleID];
		if dwMyIndex then
			self.objMyTimer:AddEvent(self.dwPlayerUpdateTick,function()
				self:EventUpdateForPlayer(dwRoleID,dwMyIndex)
			end);
		end
	end
end;

-------------------------------------------------------------------------------
--战场积分相关函数
function CWarObject:ChangeRoleScore(objPlayer,dwScore)
	local dwRoleID = objPlayer:GetRoleID();
	
	if not self.setRoleFightInfo[dwRoleID] then
		self:CreateNewInfo(dwRoleID,objPlayer:GetName());
	end
	local tbMyInfo = self.setRoleFightInfo[dwRoleID];
	tbMyInfo.dwScore = tbMyInfo.dwScore + dwScore;
	
	local objWarSys = objPlayer:GetSystem("CWarSystem");
	if objWarSys then
		objWarSys:SendMyScore(tbMyInfo.dwScore);
	end
	-- objPlayer.OnWarMyScoreMsg
	-- {
		-- Score = tbMyInfo.dwScore;
	-- }
	
	self:UpdateSortByScore(dwRoleID,tbMyInfo.dwScore);
end;

function CWarObject:UpdateSortByScore(dwRoleID,dwValue)
	local isNeedSend = nil;
	
	local isInSort = IsInTable(self.setSortByScore,dwRoleID);
	
	if isInSort then
		table.sort(self.setSortByScore,
			function(a,b)
				local dwAV = self.setRoleFightInfo[a].dwScore;
				local dwBV = self.setRoleFightInfo[b].dwScore;
				return dwAV > dwBV;
			end);
		isNeedSend = true;
	else
		if self.setSortByScore[10] then
			--表满了
			local dwSortValue = self:GetRoleScore(self.setSortByScore[10]);
			if dwValue > dwSortValue then
				--新值超过最后的排名
				self.setSortByScore[11] = dwRoleID;
				
				table.sort(self.setSortByScore,
					function(a,b)
						local dwAV = self.setRoleFightInfo[a].dwScore;
						local dwBV = self.setRoleFightInfo[b].dwScore;
						return dwAV > dwBV;
					end);
				self.setSortByScore[11] = nil;
				isNeedSend = true;
			end
		else
			--这个表没有满，直接添加
			--因为是积分，所有要排序
			table.insert(self.setSortByScore,dwRoleID);
			table.sort(self.setSortByScore,
				function(a,b)
					local dwAV = self.setRoleFightInfo[a].dwScore;
					local dwBV = self.setRoleFightInfo[b].dwScore;
					return dwAV > dwBV;
				end);
			isNeedSend = true;
		end
	end
	
	
	if isNeedSend then
		local tbSend = {};
		local tbRoleInfo = self.setRoleFightInfo[dwRoleID];
		tbSend[tbRoleInfo.szRoleName] = tbRoleInfo.dwScore;
		
		self:BroadcastMsg("OnUpdateScoreListMsg",
		{
			List = tbSend;
		});
	end
end;

function CWarObject:GetRoleScore(dwRoleID)
	local dwNum = 0;
	
	if self.setRoleFightInfo[dwRoleID] then
		dwNum = self.setRoleFightInfo[dwRoleID].dwScore;
	end
	
	return dwNum;
end;

function CWarObject:GetScoreList()
	local tbInfo = {};
	
	for _,dwRoleID in pairs(self.setSortByScore)do
		tbInfo[dwRoleID] = self:GetRoleScore(dwRoleID);
	end
	return tbInfo;
end;

function CWarObject:SendScoreToPlayer(objPlayer)
	local tbListScore = {};
	local isNeed = false;
	
	for _,id in pairs(self.setSortByScore)do
		local tbRoleInfo = self.setRoleFightInfo[id];
		tbListScore[tbRoleInfo.szRoleName] = tbRoleInfo.dwScore;
		isNeed = true;
	end
	
	if isNeed then
		objPlayer.OnUpdateScoreListMsg{ List = tbListScore };
	end
end;

--设置战场组队积分
function CWarObject:SetWarTeamScore(objPlayer, value)
	if not objPlayer then return end;
	local teamSystem = objPlayer:GetSystem("CTeamSystem");
	if not teamSystem then return end;
	local teamId = teamSystem:GetTeamId();
	if not teamId then return end;
	if not self.setTeamScore[teamId] then
		self.setTeamScore[teamId] = 0;
	end;
	self.setTeamScore[teamId] = self.setTeamScore[teamId] + value;
	self:SetWarTeamScoreSort(teamId, self.setTeamScore[teamId]);
	objPlayer:GetSystem("CWarSystem"):SendWarTeamScore(self.setTeamScore[teamId], self:GetTeamScorePosition(teamId));
	if #(self.setTeamScoreSort) >= 1 then
		for i = 1, #(self.setTeamScoreSort) do
			local teamId = self.setTeamScoreSort[i][1];
			local score = self.setTeamScoreSort[i][2];
			self:BroadcastMsg("OnUpdateAllTeamScoreMsg",
			{
				Pos = i;
				Score = score;
				TeamId = teamId;
				BOver = (#(self.setTeamScoreSort) == i);
			});
		end;
	end;
end;

--获得战场组队积分
function CWarObject:GetWarTeamScore(objPlayer)
	if not objPlayer then return end;
	local teamSystem = objPlayer:GetSystem("CTeamSystem");
	if not teamSystem then return end;
	local teamId = teamSystem:GetTeamId();
	if not teamId then return end;
	return self.setTeamScore[teamId] or 0;
end;

--清除战场组队积分
function CWarObject:ClearWarTeamScore(objPlayer)
	if not objPlayer then return end;
	local teamSystem = objPlayer:GetSystem("CTeamSystem");
	if not teamSystem then return end;
	local teamId = teamSystem:GetTeamId();
	if not teamId then return end;
	self.setTeamScore[teamId] = nil;
	for _, info in pairs(self.setTeamScoreSort) do
		if info[1] and info[1] == teamId then
			if not self.setTeamScore[teamId] then
				table.remove(self.setTeamScoreSort, _);
				break;
			end;
		end;
	end;
	table.sort(self.setTeamScoreSort, function(a, b) return (a[2] or 0) > (b[2] or 0) end);
	objPlayer:GetSystem("CWarSystem"):SendWarTeamScore(self.setTeamScore[teamId] or 0, 0);
	if not self.isDeling then
		if #(self.setTeamScoreSort) >= 1 then
			for i = 1, #(self.setTeamScoreSort) do
				local teamId = self.setTeamScoreSort[i][1];
				local score = self.setTeamScoreSort[i][2];
				self:BroadcastMsg("OnUpdateAllTeamScoreMsg",
				{
					Pos = i;
					Score = score;
					TeamId = teamId;
					BOver = (#(self.setTeamScoreSort) == i);
				});
			end;
		end;
	end;
	if #(self.setTeamScoreSort) > 3 then
		for i = 1, 3 do
			local teamId = self.setTeamScoreSort[i][1];
			local score = self.setTeamScoreSort[i][2];
			local info = CTeamManager:GetTeamInfo(teamId);
			self:BroadcastMsg("OnUpdateWarTeamScoreMsg",
			{
				Pos = i;
				Score = score;
				Info = info;
				BOver = (i == 3);
			});
		end;
	else
		if #(self.setTeamScoreSort) >= 1 then
			for i = 1, #(self.setTeamScoreSort) do
				local teamId = self.setTeamScoreSort[i][1];
				local score = self.setTeamScoreSort[i][2];
				local info = CTeamManager:GetTeamInfo(teamId);
				self:BroadcastMsg("OnUpdateWarTeamScoreMsg",
				{
					Pos = i;
					Score = score;
					Info = info;
					BOver = (#(self.setTeamScoreSort) == i);
				});
			end;
		else
			self:BroadcastMsg("OnUpdateWarTeamScoreMsg",
			{
				Pos = 0;
				Score = 0;
				Info = {};
				BOver = true;
			});
		end;
	end;
end;

function CWarObject:SetWarTeamScoreSort(teamId, value)
	local flag = false;
	local inList = false;
	if #(self.setTeamScoreSort) < 3 then
		inList = true;
	else
		if value > self.setTeamScoreSort[3][2] then
			inList = true; 
		end;
	end;
	for _, info in pairs(self.setTeamScoreSort) do
		if info[1] and info[1] == teamId then
			if value then
				if value > info[2] then
					info[2] = value;
					flag = true;
				end;
			end;
		end;
	end;
	if not flag then
		table.insert(self.setTeamScoreSort, {teamId, value});
	end;
	table.sort(self.setTeamScoreSort, function(a, b) return (a[2] or 0) > (b[2] or 0) end);
	if inList then
		if #(self.setTeamScoreSort) > 3 then
			for i = 1, 3 do
				local teamId = self.setTeamScoreSort[i][1];
				local score = self.setTeamScoreSort[i][2];
				local info = CTeamManager:GetTeamInfo(teamId);
				self:BroadcastMsg("OnUpdateWarTeamScoreMsg",
				{
					Pos = i;
					Score = score;
					Info = info;
					BOver = (i == 3);
				});
			end;
		else
			if #(self.setTeamScoreSort) >= 1 then
				for i = 1, #(self.setTeamScoreSort) do
					local teamId = self.setTeamScoreSort[i][1];
					local score = self.setTeamScoreSort[i][2];
					local info = CTeamManager:GetTeamInfo(teamId);
					self:BroadcastMsg("OnUpdateWarTeamScoreMsg",
					{
						Pos = i;
						Score = score;
						Info = info;
						BOver = (#(self.setTeamScoreSort) == i);
					});
				end;
			else
				self:BroadcastMsg("OnUpdateWarTeamScoreMsg",
				{
					Pos = 0;
					Score = 0;
					Info = {};
					BOver = true;
				});
			end;
		end;
	end;
end;

--服务端向客户端发送组队副本积分排名信息
function CWarObject:SendTeamScoreSort()
	if not self.setTeamScoreSort then
		return;
	end;
	if #(self.setTeamScoreSort) > 3 then
		local num = 3;
		for i = 1, 3 do
			local teamId = self.setTeamScoreSort[i][1];
			local score = self.setTeamScoreSort[i][2];
			local info = CTeamManager:GetTeamInfo(teamId);
			self:BroadcastMsg("OnUpdateWarTeamScoreMsg",
			{
				Pos = i;
				Score = score;
				Info = info;
				BOver = (num == i);
			});
		end;
	else
		
		if #(self.setTeamScoreSort) >= 1 then
			for i = 1, #(self.setTeamScoreSort) do
				local teamId = self.setTeamScoreSort[i][1];
				local score = self.setTeamScoreSort[i][2];
				local info = CTeamManager:GetTeamInfo(teamId);
				self:BroadcastMsg("OnUpdateWarTeamScoreMsg",
				{
					Pos = i;
					Score = score;
					Info = info;
					BOver = (i == #(self.setTeamScoreSort));
				});
			end;
		else
			self:BroadcastMsg("OnUpdateWarTeamScoreMsg",
			{
				Pos = 0;
				Score = 0;
				Info = {};
				BOver = true;
			});
		end;
	end;
end;

function CWarObject:GetTeamScorePosition(teamId)
	local position = 0;
	for index, info in pairs(self.setTeamScoreSort) do
		if info[1] and info[1] == teamId then
			position = index; 
		end;
	end;
	return position;
end;

--战场离开队伍
function CWarObject:EventKillPlayer(objKiller,objDeader)
	local cfgWar = WarConfig[self.dwCfgID];
	if cfgWar and cfgWar.EventKillPlayer then
		cfgWar:EventKillPlayer(self,objKiller,objDeader);
	end
end;

function CWarObject:GetTeamScoreList()
	return self.setTeamScoreSort;
end;

-------------------------------------------------------------------------------
function CWarObject:SetRoleTime(objPlayer)
	local dwRoleID = objPlayer:GetRoleID();
	if not self.setRoleLength[dwRoleID] then
		self.setRoleLength[dwRoleID] = {};
	end
	
	self.setRoleLength[dwRoleID].dwLength = self.setRoleLength[dwRoleID].dwLength or 0;
	self.setRoleLength[dwRoleID].dwGetCode = self.setRoleLength[dwRoleID].dwGetCode or 0;
	self.setRoleLength[dwRoleID].dwEnterTime = GetCurTime();
end;

function CWarObject:RoleLeaveWar(objPlayer)
	local dwRoleID = objPlayer:GetRoleID();
	if not self.setRoleLength[dwRoleID] then
		return;
	end
	
	local dwLength = GetCurTime() - self.setRoleLength[dwRoleID].dwEnterTime;
	
	self.setRoleLength[dwRoleID].dwLength = self.setRoleLength[dwRoleID].dwLength + dwLength;
end;

function CWarObject:GetRoleLength(dwRoleID)
	if not self.setRoleLength[dwRoleID] then
		return 0;
	end
	
	local dwLength = self.setRoleLength[dwRoleID].dwLength;
	dwLength = dwLength + (GetCurTime() - self.setRoleLength[dwRoleID].dwEnterTime);
	
	return dwLength;
end;

function CWarObject:SetRoleCode(dwRoleID,dwCode)
	if not self.setRoleLength[dwRoleID] then
		return ;
	end
	
	self.setRoleLength[dwRoleID].dwGetCode = dwCode;
end;

function CWarObject:GetRoleCode(dwRoleID)
	if not self.setRoleLength[dwRoleID] then
		return 0;
	end
	
	return self.setRoleLength[dwRoleID].dwGetCode;
end;
