--[[ 	
	挑战群侠系统
	author lizc
	2013.10.30
--]]

--字符串格式0=3543534,1,3;342343,0,3;]1=......]
local function ParseStr(str, t)
	local prestigeIndex = 0;
	while true do
		local equalIndex = prestigeIndex + 1;
		prestigeIndex = string.find(str, "]", equalIndex)
		if not prestigeIndex then break end;
		local prestigeStr = string.sub(str, equalIndex, prestigeIndex - 1)
		equalIndex = string.find(prestigeStr, "=", 1)
		if not equalIndex then
			_err("CChallengeQunXiaSystem cant find equalIndex")
		end
		local prestigeLevel = string.sub(prestigeStr, 1, equalIndex - 1)
		local allCountStr = string.sub(prestigeStr, equalIndex + 1)
		--下面开始解析等号后面的内容
		local lastIndex = 0;
		while true do
			local nextIndex = lastIndex + 1;
			lastIndex = string.find(allCountStr, ";", nextIndex)
			if not lastIndex then break end;
			local qunXiaStr = string.sub(allCountStr, nextIndex, lastIndex - 1)
			local m1 = string.find(qunXiaStr, ",", 1)
			if not m1 then 
				_err("CChallengeQunXiaSystem cant find m1")
			end
			local qunXiaID = string.sub(qunXiaStr, 1, m1 - 1)
			local countStr = string.sub(qunXiaStr, m1 + 1)
			local m2 = string.find(countStr, ",", 1)
			if not m2 then
				_err("CChallengeQunXiaSystem cant find m2")
			end
			local curCount = string.sub(countStr, 1, m2 -1)
			local maxCount = string.sub(countStr, m2 + 1)
			
			prestigeLevel = tonumber(prestigeLevel);
			qunXiaID = tonumber(qunXiaID);
			curCount = tonumber(curCount);
			maxCount = tonumber(maxCount)
			if not prestigeLevel or not qunXiaID or not curCount or not maxCount then
				_err("CChallengeQunXiaSystem ParseStr err");
			end
			
			t[prestigeLevel][qunXiaID] = {curCount = curCount, maxCount = maxCount,};
		end
		
	end
end;

--字符串格式0=3543534,1,3;342343,0,3;]1=......]
local function FormatStr(t)
	local tempStr = "";
	for ptestigeLevel, qunXiaList in pairs(t) do
		tempStr = tempStr .. ptestigeLevel .. "=";
		for qunXiaID, qunXia in pairs(qunXiaList) do
			tempStr = tempStr .. qunXiaID .. "," .. qunXia.curCount .. "," .. qunXia.maxCount ..";";
		end
		tempStr = tempStr .. "]";
	end;
	return tempStr;
end

_G.CChallengeQunXiaSystem = {};

function CChallengeQunXiaSystem:new()
	local obj = CSystem:new("CChallengeQunXiaSystem");
	
	for i,v in pairs(CChallengeQunXiaSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;

function CChallengeQunXiaSystem:Create()
	--每个系统创建时都会挂接到自己的管理者player身上
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CChallengeQunXiaSystem Create Cannot get player");
		return false;
	end;
	
	--需要调用player的基础道具系统
	self.ItemSystem = objPlayer:GetSystem("CItemSystem");
	if not self.ItemSystem then
		_err("CChallengeQunXiaSystem Create Cannot get ItemSystem");
		return false;
	end;
	
	self.DuplSystem = objPlayer:GetSystem("CDuplSystem");
	if not self.DuplSystem then
		_err("CChallengeQunXiaSystem Create Cannot get CDuplSystem");
		return false;
	end;
	
	--vip系统
	self.VipSystem = objPlayer:GetSystem("CVipSystem");
	if not self.VipSystem then
		_err("CChallengeQunXiaSystem Create Cannot get VipSystem");
		return false;
	end;
	self.VipSystem:AddSys(self);
	
	--挑战群侠退出后的地图信息
	--地图系统
	self.MapSystem = objPlayer:GetSystem("CMapSystem");
	if not self.MapSystem then
		_err("CChallengeQunXiaSystem Create Cannot get MapSystem");
		return false;
	end;
	
	--local fDirValue = math.random(0,6);   --玩家的方向
	--玩家进入副本前纪录玩家地图信息 退出后回到次地图
	self.mapInfo = nil;
	
	
	--初始化DB模块
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		_err("CMountSystem Create Cannot get DBQuery");
		return false;
	end;
	self.objDBQuery = CChallengeQunXiaSystemDB:new(objDB, self);

	
	--最大总挑战次数
	self.maxTotalCount = _G.ChallengeQunXiaConfig.CalMaxChallengeCount(self.VipSystem:IsVip());
	--当前总挑战次数
	self.curTotalCount = 0;
	
	--群侠挑战次数表
	self.setQunXiaCount = {};
	--初始化群侠挑战次数
	self:InitQunXiaCount();
	
	--当前正在挑战的群侠
	self.curChallengeID = 0;
	
	--读取信息
	local Data	= objPlayer:GetLineData("CChallengeQunXiaSystem")[1];
	if not Data then
		_err("CChallengeQunXiaSystem Create CanNot GetLineData!!!");
		Data = {}
	end;
		
	if Data[1] then
		if Data[1].setQunXiaCount == "" then
			--更新数据库
			local db_Info = {};
			db_Info.maxTotalCount = self.maxTotalCount;
			db_Info.curTotalCount = self.curTotalCount;
			db_Info.setQunXiaCount = FormatStr(self.setQunXiaCount);
			self.objDBQuery:UpdateQunXiaSysInfo(db_Info);
		else 
			self.maxTotalCount = Data[1].maxTotalCount;
			self.curTotalCount = Data[1].curTotalCount;
			ParseStr(Data[1].setQunXiaCount, self.setQunXiaCount);
		end
	else
		--print("CChallengeQunXiaSystem insert DBdata");
		local db_Info = {};
		db_Info.maxTotalCount = self.maxTotalCount;
		db_Info.curTotalCount = self.curTotalCount;
		db_Info.setQunXiaCount = FormatStr(self.setQunXiaCount);
		
		self.objDBQuery:InsertQunXiaSysInfo(db_Info);
	end;
	
	return true;
end;

function CChallengeQunXiaSystem:Destroy()
end;

function CChallengeQunXiaSystem:Update()
	
end;

function CChallengeQunXiaSystem:OnEnterScene()
	--同步信息
	self:SynChallengeCount();
end;

--换线开始
function CChallengeQunXiaSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
		
	local Data = {};
	Data[1] = {};
	Data[1].maxTotalCount = self.maxTotalCount;
	Data[1].curTotalCount = self.curTotalCount;
	Data[1].setQunXiaCount = FormatStr(self.setQunXiaCount);

	objPlayer:SetLineData("CChallengeQunXiaSystem", Data);
end

function CChallengeQunXiaSystem:OnVipChange(bState)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	if bState == true then
		self.maxTotalCount = self.maxTotalCount + _G.ChallengeQunXiaConfig.VipAddCount;
		if self.maxTotalCount > _G.ChallengeQunXiaConfig.MaxChallengeCount then
			self.maxTotalCount = _G.ChallengeQunXiaConfig.MaxChallengeCount
		end
	else
		self.maxTotalCount = self.maxTotalCount - _G.ChallengeQunXiaConfig.VipAddCount;
	end
	
	local db_Info = {};
	db_Info.maxTotalCount = self.maxTotalCount;
	db_Info.curTotalCount = self.curTotalCount;
	db_Info.setQunXiaCount = FormatStr(self.setQunXiaCount);
	self.objDBQuery:UpdateQunXiaSysInfo(db_Info);
	
	--同步信息
	self:SynChallengeCount();
end

--内部调用
-------------------------------------------------------------------------------------------------------------------------------
--初始化群侠挑战次数 
--[[
self.setQunXiaCount = 
{
	[0] = 
	{
		[20002001] = {curCount = 0, maxCount = cfg.maxChallengeCount};
		...
	}
}
--]]
function CChallengeQunXiaSystem:InitQunXiaCount()
	for k, v in pairs(_G.QunXiaListConfig) do 
		if not self.setQunXiaCount[v.needPrestigeLevel] then
			self.setQunXiaCount[v.needPrestigeLevel] = {};
		end
		
		self.setQunXiaCount[v.needPrestigeLevel][k] = {curCount = 0, maxCount = v.maxChallengeCount,};
	end
end


--同步挑战次数
function CChallengeQunXiaSystem:SynChallengeCount()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	objPlayer.SynChallengeCountMsg{MaxTotalCount = self.maxTotalCount, CurTotalCount = self.curTotalCount, SetQunXiaCount = self.setQunXiaCount};
end

--外部接口
---------------------------------------------------------------------------------------------------------------------------------
function CChallengeQunXiaSystem:UseItem(itemEnumId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	local itemCfg = _G.QunXiaItemConfig[itemEnumId];

	if itemCfg.prestigeLevel == 0 then
		if self.maxTotalCount + itemCfg.addCount > _G.ChallengeQunXiaConfig.MaxChallengeCount then return end;
		self.maxTotalCount = self.maxTotalCount + itemCfg.addCount;
	--else
		-- local qunXiaList = self.setQunXiaCount[itemCfg.prestigeLevel];
		-- for k, v in pairs(qunXiaList) do
			-- v.maxCount = v.maxCount + itemCfg.addCount;
			-- self.maxTotalCount = self.maxTotalCount + itemCfg.addCount;
		-- end
	end
	
	--更新数据库
	local db_Info = {};
	db_Info.maxTotalCount = self.maxTotalCount;
	db_Info.curTotalCount = self.curTotalCount;
	db_Info.setQunXiaCount = FormatStr(self.setQunXiaCount);
	self.objDBQuery:UpdateQunXiaSysInfo(db_Info);
	
	--同步次数消息
	self:SynChallengeCount();
	return true
end


function CChallengeQunXiaSystem:ChallengeQunXia(prestigeLevel, qunXiaID)
	if prestigeLevel < 0 or qunXiaID < 0 then return end;
	
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	--如果角色在战斗状态则返回
	local stateSystem = objPlayer:GetSystem("CStateSystem");
	if stateSystem then
		local state = stateSystem:GetState();
		if state == enPlayerState.ePS_Dead then return end;
	end
	
	if not _G.ChallengeQunXiaConfig.IsOpenFB(qunXiaID) then return end;
	
	--已经在副本中不能再进入群侠挑战
	if self.DuplSystem:IsInDupl() then return end;
	
	local lastDuplObj = self.DuplSystem:GetDuplObj()
	if lastDuplObj then
		local str = string.format(SysStringConfigInfo[9000610035], DuplConfig[lastDuplObj.dwCfgID].fbname);
		self.DuplSystem:ShowMsgInfo(str, true);
		return;
	end;

	local warSystem = objPlayer:GetSystem("CWarSystem");
	if not warSystem then
		_err("CChallengeQunXiaSystem ChallengeQunXia Cannot get CWarSystem");
		return false;
	end;
	
	if warSystem:IsInWar() then return end;
	
	local qunXiaCfg = _G.QunXiaListConfig[qunXiaID];
	if not qunXiaCfg then return end;
	
	--人数不符合不能进入
	local teamSys= objPlayer:GetSystem("CTeamSystem");
	if not teamSys then
		_err("Can not get teamSys by CChallengeQunXiaSystem:ChallengeQunXia");
		return false;
	end; 
	
	-- 检查是否有组队  剧情本不能组队进入
	if teamSys:GetCaptainId() then
		self.DuplSystem:ShowMsgInfo(SysStringConfigInfo[9000610016], true);
		return false;
	end
	
	local teamMates = teamSys:GetTeamPersonNum();
	--检测组队人数
	if teamMates and (teamMates > DuplConfig[qunXiaCfg.duplID].dwPlayerCount) then
		self.DuplSystem:ShowMsgInfo(SysStringConfigInfo[13009100106], true);
		return false;
	end;
	
	--超过最大挑战次数
	if self.curTotalCount >= _G.ChallengeQunXiaConfig.MaxChallengeCount then return end;
	
	if self.curTotalCount >= self.maxTotalCount then return end;
	
	local setQunXia = self.setQunXiaCount[prestigeLevel][qunXiaID];
	if not setQunXia then return end;
	if setQunXia.curCount >= setQunXia.maxCount then return end;
	
	--检查威望等级
	local weiWangLevel = objPlayer:GetSystem("CMissionDailySystem"):GetWeiWangLevel();
	if weiWangLevel < qunXiaCfg.needPrestigeLevel then return end;
	
	--检查消耗物品
	if #qunXiaCfg.needItem > 0 then
		for itemEnumId, itemCount in pairs(qunXiaCfg.needItem) do 
			local isEnough, _ = self.ItemSystem:CheckDelEnumItemInPacketCond(itemEnumId, itemCount);
			if not isEnough then return end
		end
	end
	
	--扣除消耗物品
	for itemEnumId, itemCount in pairs(qunXiaCfg.needItem) do 
		self.ItemSystem:DelEnumItemInPacket(itemEnumId, itemCount, false, _G.ItemSysOperType.CChallengeQunXiaSystem);
	end
	
	self.curTotalCount = self.curTotalCount + 1;
	setQunXia.curCount = setQunXia.curCount + 1;
	
	--更新数据库
	local db_Info = {};
	db_Info.maxTotalCount = self.maxTotalCount;
	db_Info.curTotalCount = self.curTotalCount;
	db_Info.setQunXiaCount = FormatStr(self.setQunXiaCount);
	self.objDBQuery:UpdateQunXiaSysInfo(db_Info);
	
	--同步次数消息
	self:SynChallengeCount();
	
	--进入副本
	--local fDirValue = math.random(0,6);   --玩家的方向
	--玩家进入副本前纪录玩家地图信息 退出后回到次地图
	self.mapInfo = {}
	self.mapInfo.dwMapID,self.mapInfo.fXPos,self.mapInfo.fYPos = self.MapSystem:GetPlayerMapPos();
	self.mapInfo.fDirValue =  math.random(0,6); 
	
	
	self.curChallengeID = qunXiaID;
	self.DuplSystem:ReqEnterDupl(qunXiaCfg.duplID, 1, 1)
end

function CChallengeQunXiaSystem:GetMapInfo()
	return self.mapInfo;
end

function CChallengeQunXiaSystem:Reset()
	--最大总挑战次数
	self.maxTotalCount = _G.ChallengeQunXiaConfig.CalMaxChallengeCount(self.VipSystem:IsVip());
	--当前总挑战次数
	self.curTotalCount = 0;
	
	--群侠挑战次数表
	self.setQunXiaCount = {};
	--初始化群侠挑战次数
	self:InitQunXiaCount();
	
	
	--更新数据库
	local db_Info = {};
	db_Info.maxTotalCount = self.maxTotalCount;
	db_Info.curTotalCount = self.curTotalCount;
	db_Info.setQunXiaCount = FormatStr(self.setQunXiaCount);
	self.objDBQuery:UpdateQunXiaSysInfo(db_Info);
	
	
	--同步信息
	self:SynChallengeCount();
	
	--self:Synchronize();
end;

function CChallengeQunXiaSystem:BroadcastSuccessMsg()
	if self.curChallengeID ~= 0 then
		local myPlayer = self:GetPlayer();
		if not myPlayer then
			_err("error");
			return
		end;
		
		--广播
		local setNet = {};
		for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
			table.insert(setNet, objPlayer.objNet);
		end;
		_groupcallout(setNet, "QunXiaSuccessMsg", {RoleID = myPlayer:GetRoleID(), RoleName = myPlayer:GetName(), QunXiaID = self.curChallengeID});
		self.curChallengeID = 0;
	end;
end

function CChallengeQunXiaSystem:ExitDupl()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	--如果角色在战斗状态则返回
	local stateSystem = objPlayer:GetSystem("CStateSystem");
	local state = stateSystem:GetState();
	if stateSystem then
		if state == enPlayerState.ePS_Fight then return end;
	end
	
	self.DuplSystem:LeaveDuplByDel();
	objPlayer.QunXiaExitDuplSuccMsg{}
	
	if state == enPlayerState.ePS_Dead then
		local battleSystem = objPlayer:GetSystem("CBattleSystem");
		if not battleSystem then 
			_err("QunXiaDeadExitMsg relive cant find battleSystem")
		end
		
		battleSystem:DealQunXiaRelive()
	end
	
	--self.mapInfo = nil;
	--print("CChallengeQunXiaSystem:ExitDupl===============")
end


--群侠副本挑战失败给奖励(成功奖励在副本系统里面发)
function CChallengeQunXiaSystem:SendFailAward(dwFBID)
	local player = self:GetPlayer();
	if not player then
		_err("error");
		return
	end;
	
	local awardCfg = _G.ChallengeQunXiaConfig.failAwards(player:GetLevel(), dwFBID)
	
	local itemSystem = player:GetSystem("CItemSystem");
	if not itemSystem then
		return;
	end;
	if awardCfg.PassMoney and awardCfg.PassMoney > 0 then
		itemSystem:AddPacketMoney(awardCfg.PassMoney, _G.ItemSysOperType.FuBenReward);  --银两
	end;
	if awardCfg.Gold and awardCfg.Gold > 0 then
		itemSystem:AddBindGold(awardCfg.Gold, _G.ItemSysOperType.FuBenReward);   --礼金
	end;
	
	if awardCfg.Zhenqi then
		local objElemSystem = player:GetSystem("CFiveElemSystem");
		if objElemSystem then
			local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objElemSystem:GetElemValue()	
			--消耗真气
			objElemSystem:ChangeAttr("dwMetalValue",awardCfg.Zhenqi)
			objElemSystem:ChangeAttr("dwWoodValue",awardCfg.Zhenqi)
			objElemSystem:ChangeAttr("dwWaterValue",awardCfg.Zhenqi)
			objElemSystem:ChangeAttr("dwFireValue",awardCfg.Zhenqi)
			objElemSystem:ChangeAttr("dwEarthValue",awardCfg.Zhenqi)
			local setData = {
				[1] = {dwCurrent = uItemGold, dwChange = awardCfg.Zhenqi};
				[2] = {dwCurrent = uItemWood, dwChange = awardCfg.Zhenqi};
				[3] = {dwCurrent = uItemWater, dwChange = awardCfg.Zhenqi};
				[4] = {dwCurrent = uItemFire, dwChange = awardCfg.Zhenqi};
				[5] = {dwCurrent = uItemEarth, dwChange = awardCfg.Zhenqi};
			}
			CLogSystemManager:zhenqi(player, setData, _G.FiveElemSysOperType.Dupl)
		end;
	end;
	
	if awardCfg.Exp then
		player:AddExp(awardCfg.Exp);
	end;
	
	
	if player:GetSystem('CPlayerEventCenterSystem') and _G.EnterPassEvent[dwFBID] then
		player:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.EnterPassEvent[dwFBID]);
	end;
	player.SendQunXiaFailAwardMsg{DuplId = dwFBID}
end

