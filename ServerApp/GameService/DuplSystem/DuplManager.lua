--[[
功能：副本线路管理器，单体
作者：周华杰
时间：2012-03-05
]]
_G.CDuplManager = {}
CSingleManager:AddSingle(CDuplManager);

--创建线路
function CDuplManager:Create()
	
	self.setAllDupl = {};
	self.setAllPlayer = {};
	self.dwLastUpdateTime = GetCurTime();
	
	self:OnStartEvent();
	self:ClearDuplInfo()
	self:GetDuplRecordInfo();
	self:GetZhenLongRecord();
	--获得真龙之王信息
	self:GetZLKingRecord();
	--从ks获得积分
	self:GetJiFenInfo();
	self.allLeaveDupl = {};
end;

--更新线路
function CDuplManager:Update()
	return true;
end;

--释放线路
function CDuplManager:Destroy()
	for i,sDupl in pairs(self.setAllDupl) do
		sDupl:Destroy();
	end;
end;

--添加一个线路
function CDuplManager:AddDupl(objDupl) 
	if self.setAllDupl[objDupl:GetFbEntityId()] then 
		_err("dupl entityId exist!!!");
		return false;
	end;
	self.setAllDupl[objDupl:GetFbEntityId()] = objDupl;
	return true;
end;

function CDuplManager:DelDupl(objDupl) 
	if objDupl then
		for dwRoleId, entityId in pairs(self.allLeaveDupl) do
			if entityId == objDupl:GetFbEntityId() then
				self.allLeaveDupl[dwRoleId] = nil;
				break;
			end;
		end;
		self.setAllDupl[objDupl:GetFbEntityId()] = nil;
	end;
	objDupl:DelAllSystem();
	objDupl = nil;
end;

--得到一个游戏线路
function CDuplManager:GetDupl(dwDuplID)
	return self.setAllDupl[dwDuplID];
end;

--得到所有的线路
function CDuplManager:GetAllDupl()
	return self.setAllDupl;
end;

--玩家进入某条线
function CDuplManager:EnterDupl(objDupl, objPlayer) 
	if not objDupl then
		return false;
	end;
	objDupl:PlayerEnter(objPlayer);
	self.setAllPlayer[objPlayer:GetRoleID()] = objPlayer;
	return true;
end;

--玩家创建副本时，记录可以进入的玩家system
function CDuplManager:RegisterFbSys(objDupl, duplSystem) 
	if not objDupl then
		return false;
	end;
	for _, system in pairs(objDupl.SystemTbl) do
		if system == duplSystem then
			return false;
		end;
	end;
	table.insert(objDupl.SystemTbl, duplSystem);
	return true;
end;

--玩家退出某条线
function CDuplManager:ExitDupl(objPlayer, objDupl) 
	--local objDupl = self.setAllDupl[objPlayer:GetRoleID()];
	if objDupl then
		objDupl:PlayerExit(objPlayer:GetRoleID());
	end;
	self.setAllPlayer[objPlayer:GetRoleID()] = nil;
end;

--获取游戏玩家
function CDuplManager:GetPlayer(dwRoleID)
	if not dwRoleID or dwRoleID == 0 then
		return self.setAllPlayer;
	end;
	return self.setAllPlayer[dwRoleID];
end;

--副本时间到，将玩家提出副本，删除副本
function CDuplManager:KickOutFb(objDupl)
	for dwRoleId, player in pairs(objDupl.setPlayer) do
		if player then
			local teamSystem = player:GetSystem("CTeamSystem");
			if teamSystem then
				--print("--------DuplTest14-------server");
				teamSystem:NoticeClientLeaveFb(true, objDupl.dwCfgID);
			end;
		end;
	end;
	self:DelDupl(objDupl) 
end;

function CDuplManager:OnStartEvent()
	for duplId, info in pairs(DuplConfig) do
		local startTime = info.dwFbStartTime;
		local Time = {dwTime = startTime};   --测试用
		local CycleType
			= _G.CAlarmTaskCycleType.eDay ;
		local CycleTime = 1;
		local RunTimes = 0;
		local Param = {CDuplManager,duplId};
		local index = CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, CDuplManager.AddFbStartEvent, Param);
	end;
end;

function CDuplManager:AddFbStartEvent(duplId)
	local playerTbl = CPlayerManager.setAllPlayer;
	for _, player in pairs(playerTbl) do
		if player then
			local sys = player:GetSystem("CDuplSystem");
			sys:RegisterPlayerEvent(duplId);
		end;
	end;
end;

function CDuplManager:IsInFb(dwRoleID)
	if self.setAllPlayer then
		if self.setAllPlayer[dwRoleID] then
			return true;
		else 
			return false;
		end;
	else
		return false;
	end;
end;

function CDuplManager:ClearDuplInfo()
	local Time = {dwTime = "23:58"};
	local CycleType
		= _G.CAlarmTaskCycleType.eDay;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {CDuplManager};
	local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, CDuplManager.DeleteFbInfo, Param)
end;

--删除副本相关的数据信息
function CDuplManager:DeleteFbInfo()
	--判断是否为可删除副本
	local tbl = {};
	for _, info in pairs(_G.DuplConfig) do
		if info.types == "day" then
			table.insert(tbl ,info.dwID);
		end;
	end;
	local onlinePlayerTbl = CPlayerManager.setAllPlayer;
	for id, player in pairs(onlinePlayerTbl) do
		local duplSystem = player:GetSystem("CDuplSystem");
		duplSystem:SynDelEnterTimes(tbl);
	end;
end;


--------------------------------------------发放奖励-------------------------------------------------
function CDuplManager:SendAward(duplId, roleId, roleName, lifeTime, personNum, itemTbl)
	local duplName = DuplConfig[duplId].fbname;
	local Items = {};
	if not itemTbl then
		return;
	end;
	local tbl = {};
	for _, info in pairs(itemTbl) do
		local itemEnum = info["dwItemEnum"];
		local num = info["dwItemNumber"];
		local bindType = info["dwBindType"]
		local item = SItemMessage:new();
		item.dwItemEnum = itemEnum;
		item.dwItemNumber = num;
		item.dwLifeTime = -1;
		item.dwBindType = bindType; 
		table.insert( Items, item );
		table.insert(tbl, {["dwItemEnum"] = itemEnum, ["number"] = num});
	end;
	local mail = CMail:new();
	mail:SetSender(-9999, _G.DuplMailMsg[1]);
	mail:SetReceiver(roleId, roleName);
	local msg = string.format( _G.DuplMailMsg[3], duplName);
	mail:SetContent(_G.DuplMailMsg[2], msg);
	mail:SetLifeTime(SMailInfo.life*24*3600*1000);
	mail:SetAccessory(0, 0, 0, Items);
	CMailManager:SendMail(mail);
end;

function CDuplManager:SendFailAward(duplId, roleId, roleName, lifeTime, personNum)
	local itemTbl = DuplConfig[duplId].failItemTbl;
	local duplName = DuplConfig[duplId].fbname;
	local Items = {};
	local tbl = {};
	if not itemTbl then
		return;
	end;
	for _, info in pairs(itemTbl) do
		local itemEnum = info["dwItemEnum"];
		local num = info["dwItemNumber"];
		local bindType = info["dwBindType"]
		local item = SItemMessage:new();
		item.dwItemEnum = itemEnum;
		item.dwItemNumber = num;
		item.dwLifeTime = -1;
		item.dwBindType = bindType; 
		table.insert( Items, item );
		table.insert(tbl, {["dwItemEnum"] = itemEnum, ["number"] = num});
	end;
	
	local mail = CMail:new();
	mail:SetSender(-9999, _G.DuplMailMsg[1]);
	mail:SetReceiver(roleId, roleName);
	local msg = string.format( _G.DuplMailMsg[4], duplName);
	mail:SetContent(_G.DuplMailMsg[2], msg);
	mail:SetLifeTime(SMailInfo.life*24*3600*1000);
	mail:SetAccessory(0, 0, 0, Items);
	CMailManager:SendMail(mail);
end;
function CDuplManager:SendFbAward(tabAddList, roleName, roleId, dwMoney)
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
	mail:SetSender(-9999, _G.DuplMailMsg[1]);
	mail:SetReceiver(roleId, roleName);
	mail:SetContent(_G.DuplMailMsg[2], _G.DuplMailMsg[5]);
	mail:SetLifeTime(SMailInfo.life*24*3600*1000);
	mail:SetAccessory(0, 0, dwMoney or 0, Items);
	CMailManager:SendMail(mail);
end;

--获得副本最短记录
function CDuplManager:GetDuplRecordInfo()
	local lineId = CKernelApp.dwLineID;
	CKernelApp.GetRecordFromKsMsg{ Line = CKernelApp.dwLineID }
end;
--获得珍珑棋局最快记录
function CDuplManager:GetZhenLongRecord()
	local lineId = CKernelApp.dwLineID;
	CKernelApp.GetZhenLongFromKsMsg{ Line = CKernelApp.dwLineID }
end;
--获得珍珑之王记录
function CDuplManager:GetZLKingRecord()
	local lineId = CKernelApp.dwLineID;
	CKernelApp.GetZLKingFromKsMsg{ Line = CKernelApp.dwLineID }
end;

--获得副本积分记录
function CDuplManager:GetJiFenInfo()
	local lineId = CKernelApp.dwLineID;
	CKernelApp.GetJiFenFromKsMsg{ Line = CKernelApp.dwLineID }
end;
--副本最快记录
function CDuplManager:SetDuplRecord(recordInfo)
	self.RecordInfo = recordInfo;
end;
--珍珑最快记录
function CDuplManager:SetZLDuplRecord(recordInfo)
	self.ZLRecordInfo = recordInfo;
end;
--珍珑之王
function CDuplManager:SetZLKingRecord(recordInfo)
	self.ZLKingInfo = recordInfo;
end;
--副本积分
function CDuplManager:SetJiFenRecord(recordInfo)
	self.JiFenInfo = recordInfo;
end;
--请求更新Record记录
function CDuplManager:UpdateRecordInfo(duplId, roleId, dwLifeTime, roleName, iconId)
	
	if self.RecordInfo[duplId] then
		--local roleId = self.RecordInfo[duplId][1];
		local lifeTime = self.RecordInfo[duplId][2];
		if (lifeTime == 0) or (lifeTime ~= 0 and dwLifeTime < lifeTime) then
			CKernelApp.SendRecordToKsMsg{Line = CKernelApp.dwLineID,  DuplId = duplId, RoleId = roleId, LifeTime = dwLifeTime, RoleName = roleName, IconId = iconId}
		end;
	else
		_err("RecordInfo is wrong~", duplId);
	end;
end;
--请求更新珍珑棋局
function CDuplManager:UpdateZLRecordInfo(waveId, roleId, roleName, liveTime, iconId)
	if self.ZLRecordInfo[waveId] then
		local dwLiveTime = self.ZLRecordInfo[waveId][3];
		if (dwLiveTime == 0) or (dwLiveTime ~= 0 and liveTime < dwLiveTime) then
			CKernelApp.SendZLRecordToKsMsg{Line = CKernelApp.dwLineID,  WaveId = waveId, RoleId = roleId, RoleName = roleName, LiveTime = liveTime, IconId = iconId};
		end;
	else
		_err("ZLRecordInfo is wrong~", waveId);
	end;
end;
--请求更新积分
function CDuplManager:UpdateJiFenInfo(duplId, score, dwRoleID, szRoleName)
	local inList = false;
	local jiFenLen = #(self.JiFenInfo[duplId]);
	if jiFenLen < 10 then
		local flag = false;
		for _, info in pairs(self.JiFenInfo[duplId]) do
			if info[1] and dwRoleID == info[1] then
				if score > info[2] then
					inList = true;
					flag = true;
					break;
				end;
			end;
		end;
		if not flag then
			inList = true;
		end;
	else
		for _, info in pairs(self.JiFenInfo[duplId]) do
			if info[1] and dwRoleID == info[1] then
				if score > info[2] then
					inList = true;
					break;
				end;
			end;
		end;
		if not inList then
			local len = #(self.JiFenInfo[duplId]);
			if score > self.JiFenInfo[duplId][len][2] then
				inList = true;
			end;
		end;
	end;
	if inList then
		CKernelApp.SendJiFenToKsMsg{Line = CKernelApp.dwLineID, DuplId = duplId, RoleId = dwRoleID, Score = score, RoleName = szRoleName};
	end;
end;
--更新最新记录
function CDuplManager:ChgDuplRecordRep(duplId, roleId, lifeTime, roleName, iconId)
	self.RecordInfo[duplId] = {roleId, lifeTime, roleName, iconId};

	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		if objPlayer and objPlayer:GetSystem("CDuplSystem") then
			local haveDuplId = objPlayer:GetSystem("CDuplSystem"):GetDuplId()
			if haveDuplId and haveDuplId == duplId then
				table.insert(setNet, objPlayer.objNet);
			end;
		end;
	end;
	_groupcallout(setNet, "SendDuplRecordChgMsg", {DuplId = duplId, RoleId = roleId, LifeTime = lifeTime, RoleName = roleName, IconId = iconId});	
end;
--更新积分信息
function CDuplManager:ChgJiFenInfoReq(jiFenTbl, duplId)
	self.JiFenInfo = jiFenTbl;
	local setNet = {}; 
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		if objPlayer and objPlayer:GetSystem("CDuplSystem") then
			local haveDuplId = objPlayer:GetSystem("CDuplSystem"):GetDuplId()
			if haveDuplId and haveDuplId == duplId then
				table.insert(setNet, objPlayer.objNet);
			end;
		end;
	end;
	local num = 0;
	for dwDuplId, info in pairs(self.JiFenInfo) do
		num = num + 1;
	end;
	local curNum = 1;
	for dwDuplId, info in pairs(self.JiFenInfo) do
		_groupcallout(setNet, "SendJiFenChgMsg", {JiFenInfo = info, DwDuplId = dwDuplId, EndFlag = (curNum == num)});	
		curNum = curNum + 1;
	end;
end;
--获得副本最短记录
function CDuplManager:GetDuplRecord()
	return self.RecordInfo;
end;
--获得珍珑副本最短记录
function CDuplManager:GetZLDuplRecord()
	return self.ZLRecordInfo;
end;
--获得珍珑之王记录
function CDuplManager:GetZLKingInfo()
	return self.ZLKingInfo;
end;
--获得积分信息
function CDuplManager:GetJiFenRecord()
	return self.JiFenInfo;
end;
--记录下线的单人副本
function CDuplManager:AddDesDupl(roleId, entityId)
	self.allLeaveDupl[roleId] = entityId;
end;

--获得下线离开的副本
function CDuplManager:GetLeaveDupl(roleId)
	return self.allLeaveDupl[roleId] or 0;
end;

function CDuplManager:UpdateZLBossPlan()
	local onlinePlayerTbl = CPlayerManager.setAllPlayer;
	local setNet = {}; 
	for id, player in pairs(onlinePlayerTbl) do
		if player and player:GetSystem("CDuplSystem") then
			player:GetSystem("CDuplSystem"):SetHitedBossInfo("");
			player:GetSystem("CDuplSystem"):SetMapData();
			local haveDuplId = player:GetSystem("CDuplSystem"):GetDuplId()
			if haveDuplId and haveDuplId == 1004 then
				table.insert(setNet, player.objNet);
			end;
		end;
	end;
	_groupcallout(setNet, "SendZLBossPlanMsg", {});	
end;