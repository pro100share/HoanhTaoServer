--[[
功能：婚宴object
类型：object
版本：
	v1.0	2012-03-16 create by lkj
]]

_G.CMarriageBanquet = {};
--创建新的婚宴对象
function CMarriageBanquet:new(info, posTable)
	local obj = {};
	obj.instID 		= info.instID;
	obj.holdTime 	= info.holdTime;	--举办时间
	obj.holdLine 	= info.holdLine;	--举办线路
	obj.holdPlace 	= info.holdPlace;	--举办地点
	obj.holdLevel 	= info.holdLevel;	--举办规模 1-3
	obj.husbandRoleID = info.husbandRoleID;	--丈夫roleID
	obj.husbandName = info.husbandName;		--丈夫名字
	obj.wifeRoleID 	= info.wifeRoleID;		--妻子roleID
	obj.wifeName	= info.wifeName;		--妻子名字
	
	obj.posTable	= posTable;			--餐桌摆放坐标集合
	obj.lastTimes	= _G.MarriageBanquetConfig["Npc_Level_" .. obj.holdLevel].Time;			--剩下几批流水
	--餐桌NPC列表
	obj.tableList	= {};
	--婚宴期间小偷怪物列表，用于结束删除释放资源
	obj.monsterList = {};
	--方法复制
	for index, value in pairs(CMarriageBanquet) do
		if type(value) == "function" then
			obj[index] = value;
		end;
	end;
	--注册定时器
	obj.n_AlarmID = _G.CAlarmClock:AddTask({dwMsec = obj.holdTime}, _G.CAlarmTaskCycleType.eMinute, _G.MarriageBanquetConfig.Npc_Life_Time, obj.lastTimes + 1, obj.Hold, {obj});
	if obj.n_AlarmID == 0 then
		_err("RegisterToAlarm err!!!", obj.husbandRoleID, obj.husbandName, obj.wifeRoleID, obj.wifeName);
	end;
	
	return obj;
end;
--时间到开始举办
function CMarriageBanquet:Hold()
	if self.lastTimes == 0 then
		self:Destroy();
		return;
	end;
	--得到NPC管理器
	local map = CMapManager:GetMap(self.holdPlace);
	local npcMgr = map:GetNpcMgr();
	for k, v in pairs(self.tableList) do
		_G.CMarriageBanquetMgr.NpcToBanquet[v] = nil;
		npcMgr:Remove(v);
	end;
	local monsterMgr = map:GetMonsterMgr();
	--婚礼第一桌流水刷新时
	if self.lastTimes == _G.MarriageBanquetConfig["Npc_Level_" .. self.holdLevel].Time then
		----1.释放占用坐标以供第二天预约使用
		_G.CMarriageBanquetMgr:FreeCoordinate(self.posTable);
		----2.从数据库预约表中将自己标注成已举办
		_G.CMarriageBanquetMgr:BanquetHeld(self.instID, false);
	end;
	self.tableList = nil;
	self.tableList = {};
	local title = string.format(_G.MarriageBanquetConfig.TableName, self.husbandName, self.wifeName, _G.MarriageBanquetConfig["Npc_Level_" .. self.holdLevel].Time - self.lastTimes + 1);
	for k, v in pairs(self.posTable) do
		local npcID = npcMgr:Add(_G.MarriageBanquetConfig["Npc_Level_" .. self.holdLevel].ID, _G.MarriageBanquetCoordinate[v].x, _G.MarriageBanquetCoordinate[v].y, _G.MarriageBanquetCoordinate[v].dir, nil, title);
		table.insert(self.tableList, npcID);
		local rate = _G.MarriageBanquetConfig.MonsterRate(self.holdLevel);
		if math.random(1, 10000) <= rate then
			local monsterID = monsterMgr:Add(
				_G.MarriageBanquetConfig.MonsterID, 
				_G.MarriageBanquetConfig.FightID, 
				_G.MarriageBanquetConfig.AIID, 
				_G.MarriageBanquetConfig.DropID,
                _G.MarriageBanquetConfig.LookID, 
				_G.MarriageBanquetCoordinate[v].x,
				_G.MarriageBanquetCoordinate[v].y);
			table.insert(self.monsterList, monsterID);
		end;
		local npcInfo = {
			banquetID = self.instID,
			eatTimes = _G.MarriageBanquetConfig["Npc_Level_" .. self.holdLevel].EatTimes;
		};
		_G.CMarriageBanquetMgr.NpcToBanquet[npcID] = npcInfo;
	end;
	--流水席次数减一
	self.lastTimes = self.lastTimes - 1;
end;
--流水席次数为0，并且最后一席时间已过，撤席
function CMarriageBanquet:Destroy()
	local map = CMapManager:GetMap(self.holdPlace);
	local npcMgr = map:GetNpcMgr();
	for k, v in pairs(self.tableList) do
		_G.CMarriageBanquetMgr.NpcToBanquet[v] = nil;
		npcMgr:Remove(v);
	end;
	local monsterMgr = map:GetMonsterMgr();
	for k, v in pairs(self.monsterList) do
		monsterMgr:Remove(v);
	end;
	self.tableList = nil;
	self.posTable = nil;
	self.monsterList = nil;
	
	_G.CMarriageBanquetMgr.AllBanquetList[self.instID] = nil;
	--通知KS婚宴结束
	CKernelApp.MarBanMgr_BanquetFinishMsg{BanquetID = self.instID};
	--通知好友mgr婚宴结束
	_G.CFriendManager:NotifyHeldBanquet(self.wifeRoleID, self.husbandRoleID, false);
	--通知夫妻双方婚宴结束，领取红包
	_G.GSRemoteCall(self.husbandRoleID, "CMarriageSystem", "BanquetOver");
	_G.GSRemoteCall(self.wifeRoleID, "CMarriageSystem", "BanquetOver");
end;
--婚宴中宾客吃酒席
function CMarriageBanquet:Eat(npcID)
	local npcInfo = _G.CMarriageBanquetMgr.NpcToBanquet[npcID];
	npcInfo.eatTimes = npcInfo.eatTimes - 1;
	--销毁NPC
	if npcInfo.eatTimes == 0 then
		local npcMgr = CMapManager:GetMap(self.holdPlace):GetNpcMgr();
		npcMgr:Remove(npcID);
		for k, v in pairs(self.tableList) do
			if v == npcID then
				table.remove(self.tableList, k);
				break;
			end;
		end;
		_G.CMarriageBanquetMgr.NpcToBanquet[npcID] = nil;
	end;
end;



