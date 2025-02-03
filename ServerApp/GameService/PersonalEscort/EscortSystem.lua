--[[
	个人押镖
	2013-09-06
]]
_G.CEscortSystem = {};
function CEscortSystem:new()
	local obj = CSystem:new("CEscortSystem");
	obj.objDBQuery = nil;    --对应的数据库操作模
	for i,v in pairs(CEscortSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

function CEscortSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		return false;
	end;
	self.objDBQuery = CEscortSystemDB:new(objDB, self);
	self.dwEscortNum = 0; --出镖次数
	self.dwShellEscortNum = 0; --交镖次数
	self.dwRefQuality = 0;
	self.dwGetType = 0;
	self.dwEscortID = 0;
	self.dwType = 0;
	self.dwQuality = 0;
	self.dwMapId = 0;
	local info = objPlayer:GetLineData("CEscortSystem")[1];
	if info then
		self.dwEscortNum = info[1].dwEscortNum;  --出镖次数
		self.dwRefQuality = info[1].dwRefQuality; --刷新品质次数
		self.dwEscortID = info[1].dwEscortID;   --抢镖的id
		self.dwGetType = info[1].dwGetType;    --镖车来源  (1:抢,2:买)
		self.dwType = info[1].dwType;          --镖车等级
		self.dwQuality = info[1].dwQuality;    --镖车品质
		self.dwMapId = info[1].dwMapId;        --镖车地图
		self.dwShellEscortNum = info[1].dwShellEscortNum;  --交镖次数
	end;
	return true;
end;

function CEscortSystem:OnEnterScene()
	self:SendEscortState();
end;

function CEscortSystem:SendEscortState()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local dwRunFlag = CEscortManager:GetRunEscort(objPlayer:GetRoleID())
	objPlayer.SendRunEscortMsg{RunFlag = dwRunFlag};
end;

function CEscortSystem:OnDead(dwEnemyType,dwEnemyID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objWarSystem = objPlayer:GetSystem("CWarSystem");
	if objWarSystem.dwCurWarID == 0 then
		return;
	end
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	if dwEnemyType == enEntType.eEntType_Monster then
		return;
	end;
	local objEnemy = CPlayerManager:GetPlayerByRoleID(dwEnemyID);
	if not objEnemy then
		return;
	end;
	local escortSystem = objEnemy:GetSystem("CEscortSystem");
	--交镖次数已经大于可以交付次数
	if escortSystem:GetShellEscortNum() >= _G.EscortOtherInfo.ShellEscortNum then 
		return;
	end;
	--对手有未押的镖,不能劫镖
	if escortSystem:GetEscortID() ~= 0 then
		return;
	end;
	--对手正在押镖,不能劫镖
	if CEscortManager:GetRunEscort(dwEnemyID) ~= 0 then
		return;
	end;
	if CEscortManager:GetRunEscort(objPlayer:GetRoleID()) ~= 0 then
		local monsterEntityId = CEscortManager:GetRunEscort(objPlayer:GetRoleID())	
		local map = mapSystem:GetCurMap();
		if not map then
			return;
		end;		
		local monster = map.objMonMgr:GetMonsterInfo(monsterEntityId);
		local ownPlayerId = 0;
		local ownPlayerName = "";
		local monsterBornInfo = nil;
		if monster then
			monsterBornInfo = monster:GetEscortInfo();
		end;
		if not monsterBornInfo then
			return;
		end;
		ownPlayerId = monsterBornInfo.dwBornRoleID;
		ownPlayerName = monsterBornInfo.szBornName;
		
		if ownPlayerId == dwEnemyID then
			--抢回车
			self:BroadCastMsg(81, {objEnemy:GetInfo().szRoleName, objPlayer:GetInfo().szRoleName});
		else
			self:BroadCastMsg(82, {objEnemy:GetInfo().szRoleName, objPlayer:GetInfo().szRoleName, ownPlayerName});
			--劫镖
		end;
		CEscortManager:RecordRunEscort(dwEnemyID, monsterEntityId);
		CEscortManager:RecordRunEscort(objPlayer:GetRoleID(), nil);
		map.objMonMgr:DacoityRoleMonster(monsterEntityId,dwEnemyID,objEnemy:GetInfo().szRoleName)
		--刷走旧镖车,刷出新镖车	
		local dwMapID,fPosX,fPosY = monster:GetPos()
		local dwHp = monster:GetHP()
		local dwMaxHp = monster:GetMaxHP()
		escortSystem:SynEscortPos(dwHp, dwMaxHp, dwMapID, fPosX, fPosY, monsterBornInfo.dwBornTime, monsterBornInfo.dwLevel, monsterBornInfo.dwQuality)
		objPlayer.SendLostEscortMsg{};
		escortSystem:SendEscortState();
		self:SendEscortState();
	end;
end;

--开始换线记录数据
function CEscortSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local info = {};
	info.dwEscortNum = self.dwEscortNum;
	info.dwRefQuality = self.dwRefQuality;
	info.dwEscortID = self.dwEscortID;
	info.dwGetType = self.dwGetType;
	info.dwType = self.dwType;
	info.dwQuality = self.dwQuality;
	info.dwMapId = self.dwMapId;
	info.dwShellEscortNum = self.dwShellEscortNum;  --交镖次数
	local tbl = {};
	table.insert(tbl, info);
	objPlayer:SetLineData("CEscortSystem",tbl);
end;

function CEscortSystem:OnChangeLineEnd(dwNewLineID)
	self:SendEscortState();
end;

function CEscortSystem:SetEscortInfo()
	self.dwEscortNum = 0;
	self.dwRefQuality = 0;
	self.dwEscortID = 0;
	self.dwGetType = 0;
	self.dwType = 0;
	self.dwQuality = 0;
	self.dwMapId = 0;
	self.dwShellEscortNum = 0;
	self:NotifyClientEscortInfo();
end;

-- function CEscortSystem:SetBuyEscortInfo()
	-- self.dwGetType = 0;
	-- self.dwType = 0;
	-- self.dwQuality = 0;
	-- self.dwMapId = 0;
-- end;

--通知客户端个人押镖数据
function CEscortSystem:NotifyClientEscortInfo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	local dwCurMapId = mapSystem:GetCurMapID();
	if not dwCurMapId then
		return;
	end;
	local escortInfo = CEscortManager:GetEscortInfo();
	local nextRefTime = CEscortManager:GetNextRefTime() - GetCurTime();
	if not escortInfo[dwCurMapId] then
		_info("------Escort-----NotifyClientEscortInfo----", dwCurMapId);
		objPlayer.NotifyEscortInfoMsg{Info = {}, EscortNum = self.dwEscortNum, RefQualityNum = self.dwRefQuality, EscortId = self.dwEscortID, Type = self.dwType, DwQuality = self.dwQuality, NextRefTime = nextRefTime, ShellEscortNum = self.dwShellEscortNum};
		return;
	end;
	objPlayer.NotifyEscortInfoMsg{Info = escortInfo[dwCurMapId], EscortNum = self.dwEscortNum, RefQualityNum = self.dwRefQuality, EscortId = self.dwEscortID, Type = self.dwType, DwQuality = self.dwQuality, NextRefTime = nextRefTime, ShellEscortNum = self.dwShellEscortNum};
end;
--同步镖车坐标，血量等
function CEscortSystem:SynEscortPos(hp, maxHp, mapId, posx, posy, dwBornTime, dwType, dwQuality)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local restTime = _G.EscortConfig.dwFailTime - (GetCurTime() - dwBornTime);
	objPlayer.SynEscortPosMsg{Hp = hp, MaxHp = maxHp, MapId = mapId, Posx = posx, Posy = posy, RestTime = restTime, Type = dwType, Quality = dwQuality};
end;
--发送镖车相关消息
function CEscortSystem:SendEscortMsg(stringId, infoTbl)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.SendEscortMsg{StringID = stringId, AttrTbl = infoTbl}
end;
--抢镖
function CEscortSystem:ReqRubEscort(pos)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not pos or (pos > 3 or pos < 1) then
		_info("----ReqRubEscort1---", objPlayer:GetRoleID());
		return;
	end;
	if self:GetShellEscortNum() >= _G.EscortOtherInfo.ShellEscortNum then
		_info("----ReqRubEscort2---", objPlayer:GetRoleID(), self:GetShellEscortNum());
		return;
	end;
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	local dwCurMapId = mapSystem:GetCurMapID();
	if not dwCurMapId then
		_info("----ReqRubEscort3---", objPlayer:GetRoleID());
		return;
	end;
	--检测是否有个人押镖战场是否开启
	local dwCurWarId = _G.EscortOtherInfo.GetWarId(objPlayer);
	if not CWarHost:FindWar(dwCurWarId) then
		_info("----ReqRubEscort4---", objPlayer:GetRoleID());
		return;
	end;
	--正在押镖，不能抢镖
	if CEscortManager:GetRunEscort(objPlayer:GetRoleID()) ~= 0 then
		_info("----ReqRubEscort5---", objPlayer:GetRoleID());
		return;
	end;
	--如果已有镖车返回
	if self.dwEscortID > 0 then
		_info("----ReqRubEscort6---", objPlayer:GetRoleID());
		return;
	end;
	--检测镖车个数
	local refEscortInfo = CEscortManager:GetEscortInfo();
	if not refEscortInfo then
		_info("----ReqRubEscort7---", objPlayer:GetRoleID());
		return;
	end;
	local dwMonsterId = refEscortInfo[dwCurMapId][pos].dwMonsterId;
	local dwEscortNum = refEscortInfo[dwCurMapId][pos].dwNum;
	local dwQuality = refEscortInfo[dwCurMapId][pos].dwQuality;
	if dwEscortNum < 1 then  --无镖车可抢
		_info("----ReqRubEscort8---", objPlayer:GetRoleID());
		self:NotifyClientEscortInfo();
		return;
	end;
	self.dwEscortID = dwMonsterId;
	self.dwType = pos;
	self.dwQuality = dwQuality;
	self.dwGetType = 1;
	self.dwMapId = dwCurMapId;
	self.objDBQuery:SetRubEscortInfo(objPlayer:GetRoleID(), self.dwEscortID, self.dwType, self.dwQuality, self.dwGetType, self.dwMapId)
	CEscortManager:SetEscortInfo(dwCurMapId, pos)
	self:NotifyClientEscortInfo();
end;
--刷新镖车品质
function CEscortSystem:ReqRefreshEscort()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local dwCurMapId = mapSystem:GetCurMapID();
	if not dwCurMapId then
		return;
	end;
	--检测是否有个人押镖战场是否开启
	local dwCurWarId = _G.EscortOtherInfo.GetWarId(objPlayer);
	if not CWarHost:FindWar(dwCurWarId) then
		return;
	end;

	if self.dwEscortID <= 0 then
		return;
	end;
	if self.dwRefQuality >= _G.EscortOtherInfo.FreeRefreshQuality then
		local costGold = _G.PersonalEscortConfig.Refresh.Cost(objPlayer, self.dwRefQuality, self.dwType, self.dwQuality);
		if not itemSystem:IsGoldEnough(costGold) then
			return;
		end;
		itemSystem:CostGold(costGold, _G.ItemSysOperType.RefEscortQuality);
	end;
	local newQuality = _G.PersonalEscortConfig.Refresh.Result(objPlayer, self.dwRefQuality, self.dwType, self.dwQuality);
	self.dwQuality = newQuality;
	self.dwRefQuality = self.dwRefQuality + 1;
	self.dwEscortID = _G.PersonalEscortConfig.Car[self.dwType][self.dwQuality].Monster.dwMonsterId;
	self.objDBQuery:SetEscortQuality(objPlayer:GetRoleID(), self.dwEscortID, self.dwQuality, self.dwRefQuality);
	self:NotifyClientEscortInfo();
	if newQuality >= _G.EscortOtherInfo.RefreshQuality then
		self:EscortBroadCastMsg(newQuality);
	end;
end;

--购买镖车
function CEscortSystem:ReqBuyEscort(pos)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local dwCurMapId = mapSystem:GetCurMapID();
	if not dwCurMapId then
		return;
	end;
	if self:GetShellEscortNum() >= _G.EscortOtherInfo.ShellEscortNum then 
		return;
	end;
	--正在押镖，不能买镖
	if CEscortManager:GetRunEscort(objPlayer:GetRoleID()) ~= 0 then
		return;
	end;
	--如果已有镖车且为抢到的镖车返回
	-- if self.dwEscortID > 0 and self.dwGetType == 1 then
		-- return;
	-- end;
	--检测是否有个人押镖战场是否开启
	local dwCurWarId = _G.EscortOtherInfo.GetWarId(objPlayer);
	if not CWarHost:FindWar(dwCurWarId) then
		return;
	end;
	local costGold = _G.RefreshMonster[dwCurMapId][pos].dwGold;
	if not itemSystem:IsGoldEnough(costGold) then
		return;
	end;
	itemSystem:CostGold(costGold, _G.ItemSysOperType.BuyEscort);
	--检测镖车
	local refEscortInfo = CEscortManager:GetEscortInfo();
	if not refEscortInfo then
		return;
	end;
	local dwMonsterId = refEscortInfo[dwCurMapId][pos].dwMonsterId;
	local dwQuality = refEscortInfo[dwCurMapId][pos].dwQuality;
	self.dwEscortID = dwMonsterId;
	self.dwType = pos;
	self.dwQuality = dwQuality;
	self.dwGetType = 2;
	self.dwMapId = dwCurMapId;
	self.objDBQuery:SetRubEscortInfo(objPlayer:GetRoleID(), self.dwEscortID, self.dwType, self.dwQuality, self.dwGetType, self.dwMapId)
	self:NotifyClientEscortInfo();
end;
--开始押镖
function CEscortSystem:BeginRunEscort()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.dwEscortNum >= _G.EscortOtherInfo.RunEscortNum then
		return;
	end;
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local dwCurMapId = mapSystem:GetCurMapID();
	if not dwCurMapId then
		return;
	end;	
	--检测是否有个人押镖战场是否开启
	local dwCurWarId = _G.EscortOtherInfo.GetWarId(objPlayer);
	if not CWarHost:FindWar(dwCurWarId) then
		return;
	end;
	if CEscortManager:GetRunEscort(objPlayer:GetRoleID()) ~= 0 then
		return;
	end;
	local lineInfo = _G.PersonalEscortConfig.Node[dwCurMapId];
	local map = mapSystem:GetCurMap();
	if not map then
		return;
	end;
	local monster = map.objMonMgr:BournRoleMonster(objPlayer:GetRoleID(),objPlayer:GetInfo().szRoleName,self.dwType,self.dwQuality,lineInfo,GetCurTime())
	local monsterEntityId = monster:GetRoleID();
	self.dwEscortNum = self.dwEscortNum + 1;
	CEscortManager:RecordRunEscort(objPlayer:GetRoleID(), monsterEntityId);
	self.dwType = 0;
	self.dwGetType = 0;
	self.dwMapId = 0;
	self.dwQuality = 0;
	self.dwEscortID = 0;
	self.objDBQuery:SetRubEscortInfo(objPlayer:GetRoleID(), 0, 0, 0, 0, 0);
	self.objDBQuery:UpdateEscortNum(objPlayer:GetRoleID(), self.dwEscortNum);
	self:SendEscortState();
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventBeginRunEscort);
end;

--给奖励
function CEscortSystem:GetEscortAward(result, dwStartTime, dwType, dwQuality, dwBornPlayerId, dwRoleId)
	local objPlayer = self:GetPlayer();
	if self:GetShellEscortNum() >= _G.EscortOtherInfo.ShellEscortNum then 
		_info("-----GetEscortAward1--", dwRoleId);
		return;
	end;
	if CEscortManager:GetRunEscort(dwRoleId) == 0 then
		_info("-----GetEscortAward2--", dwRoleId);
		return;
	end;
	CEscortManager:RecordRunEscort(dwRoleId, nil);
	self:SendEscortState();
	if not objPlayer then
		_info("-----GetEscortAward3--", dwRoleId);
		return;
	end;
	if result > 0 then
		objPlayer.SendEscortResMsg{Res = result, DwType = dwType, DwQuality = dwQuality, ShellEscort = self.dwShellEscortNum};
		return;
	end;
	self.dwShellEscortNum = self.dwShellEscortNum + 1;
	self.objDBQuery:UpdateShellEscortNum(objPlayer:GetRoleID(), self.dwShellEscortNum);
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local objElemSystem = objPlayer:GetSystem("CFiveElemSystem");
	if not itemSystem then
		return;
	end;
	if not objElemSystem then
		return;
	end;
	local lifeTime = GetCurTime() - dwStartTime;
	local param = _G.EscortOtherInfo.GetAwardParam(lifeTime);
	local awardList = {};
	if dwBornPlayerId ~= objPlayer:GetRoleID() then
		awardList = _G.PersonalEscortConfig.Car[dwType][dwQuality].Reward;
	else
		awardList = _G.PersonalEscortConfig.Car[dwType][dwQuality].OtherReward;
	end;
	local dwMoney = param * (awardList.dwMoney or 0);
	--增加money
	if dwMoney > 0 then
		itemSystem:AddPacketMoney(dwMoney, _G.ItemSysOperType.EscortAward);
	end;
	local dwExp = param * (awardList.dwExp or 0);
	objPlayer:AddExp(dwExp);
	local dwPneuma = param * (awardList.dwPneuma or 0);
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objElemSystem:GetElemValue()
	if dwPneuma and dwPneuma ~= 0 then
	--奖励真气
		objElemSystem:ChangeAttr("dwMetalValue",dwPneuma);
		objElemSystem:ChangeAttr("dwWoodValue",dwPneuma);
		objElemSystem:ChangeAttr("dwWaterValue",dwPneuma);
		objElemSystem:ChangeAttr("dwFireValue",dwPneuma);
		objElemSystem:ChangeAttr("dwEarthValue",dwPneuma);
		local setData = {
			[1] = {dwCurrent = uItemGold, dwChange = dwPneuma};
			[2] = {dwCurrent = uItemWood, dwChange = dwPneuma};
			[3] = {dwCurrent = uItemWater, dwChange = dwPneuma};
			[4] = {dwCurrent = uItemFire, dwChange = dwPneuma};
			[5] = {dwCurrent = uItemEarth, dwChange = dwPneuma};
		}
		CLogSystemManager:zhenqi(objPlayer, setData, _G.FiveElemSysOperType.EscortAward)
	end;
	local dwBindGold = param * (awardList.dwBindGold or 0);
	if dwBindGold > 0 then
		itemSystem:AddBindGold(dwBindGold, _G.ItemSysOperType.EscortAward);
	end;
	local awardItem = {};
	if awardList.Item then
		for index, info in pairs(awardList.Item) do
			local tItem = {
				dwItemEnum	= info.dwItemId;
				dwItemNumber= param * (info.dwNum or 0);
				dwBindType	= info.dwBind;
			};
			table.insert(awardItem,tItem);
		end;
	end;
	local bFlag = itemSystem:AddEnumItemListToPacket(awardItem or {}, _G.ItemSysOperType.EscortAward);
	if not bFlag then
		self:SendEscortAward(awardItem or {}, objPlayer:GetInfo().szRoleName, objPlayer:GetRoleID())
	end;
	_info("-----GetEscortAward4--", dwRoleId);
	objPlayer.SendEscortResMsg{Res = result, DwType = dwType, DwQuality = dwQuality, ShellEscort = self.dwShellEscortNum};
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventEscortAward);
end;

function CEscortSystem:GetEscortID()
	return self.dwEscortID;
end;

--获得交镖次数
function CEscortSystem:GetShellEscortNum()
	return self.dwShellEscortNum;
end;

function CEscortSystem:SendEscortAward(tabAddList, roleName, roleId)
	local Items = {};	
	for _, info in pairs(tabAddList) do
		local itemEnum = info["dwItemEnum"];
		local num = info["dwItemNumber"];
		local bindType = info["dwBindType"]
		local item = SItemMessage:new();
		item.dwItemEnum = itemEnum;
		item.dwItemNumber = num;
		item.dwLifeTime = -1;
		item.dwBindType = bindType; 
		table.insert( Items, item );
	end;
	
	local mail = CMail:new();
	mail:SetSender(-9999, _G.EscortMailMsg[1]);
	mail:SetReceiver(roleId, roleName);
	mail:SetContent(_G.EscortMailMsg[2], _G.EscortMailMsg[3]);
	mail:SetLifeTime(SMailInfo.life*24*3600*1000);
	mail:SetAccessory(0, 0, 0, Items);
	CMailManager:SendMail(mail);
end;

function CEscortSystem:BroadCastMsg(stringId, tbl)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CEscortSystem:BroadCastMsg");
		return;
	end;
	--玩家姓名
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--玩家RoleID
	local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
	--全服广播
	CGameApp.EscortSys_BroadCastMsg{
        StringId = stringId,
        AttrTbl = tbl,
	}
end;

function CEscortSystem:EscortBroadCastMsg(dwNewQuality)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CEscortSystem:EscortBroadCastMsg");
		return;
	end;
	--玩家姓名
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--玩家RoleID
	local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
	--全服广播
	CGameApp.EscortRefSys_BroadCastMsg{
        PlayerName = s_PlayerName,
        PlayerRoleID = n_PlayerRoleID,
		NewQuality = dwNewQuality
	}
end;