

--商业化活动
_G.CCommercialAct = {};
function CCommercialAct:New(nGlobalID, nStartTime, nEndTime, nDays)
	local obj = {};
	obj.nGlobalID = nGlobalID;
	obj.nStartTime = nStartTime;
	obj.nEndTime = nEndTime;
	_info("****CCommercialAct****", nGlobalID);
	setmetatable(obj, {__index = CCommercialAct});
	return obj;
end;

function CCommercialAct:GetCfg()
	return _G.CommercialActConfig[self.nGlobalID];
end;

function CCommercialAct:GetType()
	return self:GetCfg().nType;
end;

function CCommercialAct:GetReward()
	return self:GetCfg().tReward;
end;

function CCommercialAct:GetCountDown()
	return math.floor((self.nEndTime - GetCurTime()) / 1000);
end;

function CCommercialAct:GetDays()
	local days = 1;
	if self:GetType() == _G.CommercialActType.OneDayOneHourCharge then
		days = math.floor((GetCurTime() - self.nStartTime)/ (3600000 * 24)) + 1;
	end;
	return days;
end;

function CCommercialAct:CheckGetReward(objPlayer, index)
	if self:GetType() == _G.CommercialActType.OneDayOneHourCharge then
		local scriptSystem = objPlayer:GetSystem("CScriptSystem");
		local reward = self:GetReward()[index];
		if scriptSystem and reward then
			if reward[_G.CommercialActRewardType.Condition] then
				--print("----------------", scriptSystem:GetTodayOneHourChargeNum(), reward[_G.CommercialActRewardType.Condition]);
				if scriptSystem:GetTodayOneHourChargeNum() >= reward[_G.CommercialActRewardType.Condition] then
					if reward[_G.CommercialActRewardType.Item] then
						local itemSystem = objPlayer:GetSystem("CItemSystem");
						if itemSystem and itemSystem:IsPacketSlotEnoughFor(#reward[_G.CommercialActRewardType.Item]) then
							return true;
						else
							--print("not enough slots for reward");
							return false;
						end;
					else
						return true;
					end;
				end;
			else
				return true;
			end;
		end;
	end;
	return false;
end;

function CCommercialAct:GetPlayerStage(objPlayer)
	local scriptSystem = objPlayer:GetSystem("CScriptSystem");
	if scriptSystem then
		if self:GetType() == _G.CommercialActType.OneDayOneHourCharge then
			return scriptSystem:GetTodayOneHourChargeNum();
		end;
	end;
	return 0;
end;

function CCommercialAct:GetPlayerRewardInfo(objPlayer)
	local rewardInfo = {};
	local scriptSystem = objPlayer:GetSystem("CScriptSystem");
	local commercialActSystem = objPlayer:GetSystem("CCommercialActSystem");
	local days = self:GetDays();
	if scriptSystem and commercialActSystem then
		if self:GetType() == _G.CommercialActType.OneDayOneHourCharge then
			local reward = self:GetReward();
			for index, info in pairs(reward) do
				if commercialActSystem:GetRewardRecord(self.nGlobalID, days, index) == 0 then
					if info[_G.CommercialActRewardType.Condition] then
						if scriptSystem:GetTodayOneHourChargeNum() >= info[_G.CommercialActRewardType.Condition] then
							rewardInfo[index] = rewardInfo[index] or {};
							rewardInfo[index][1] = 1;
						end;
					else
						rewardInfo[index] = rewardInfo[index] or {};
						rewardInfo[index][1] = 1;
					end;
				else
					rewardInfo[index] = rewardInfo[index] or {};
					rewardInfo[index][2] = commercialActSystem:GetRewardRecord(self.nGlobalID, days, index);
				end;
			end;
		end;
	end;
	return rewardInfo;
end;

function CCommercialAct:GiveReward(objPlayer, index)
	local reward = self:GetReward()[index];
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local objElemSystem = objPlayer:GetSystem("CFiveElemSystem");
	local commercialActSystem = objPlayer:GetSystem("CCommercialActSystem");
	local addtype = _G.ItemSysOperType.CommercialAct;
	
	local money = reward[_G.CommercialActRewardType.Money];
	local bindgold = reward[_G.CommercialActRewardType.BindGold];
	local gold = reward[_G.CommercialActRewardType.Gold];
	local elem = reward[_G.CommercialActRewardType.Elem];
	local nexp = reward[_G.CommercialActRewardType.Exp];
	local items = reward[_G.CommercialActRewardType.Item];
	
	if money and money > 0 then
		itemSystem:AddPacketMoney(money, addtype);
	end;
	if bindgold and bindgold > 0 then
		itemSystem:AddBindGold(bindgold, addtype);
	end;
	if gold and gold > 0 then
		itemSystem:AddGold(gold, addtype);
	end;
	
	if elem and elem > 0 and objElemSystem then
		local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objElemSystem:GetElemValue()
		objElemSystem:ChangeAttr("dwMetalValue", elem);
		objElemSystem:ChangeAttr("dwWoodValue", elem);
		objElemSystem:ChangeAttr("dwWaterValue", elem);
		objElemSystem:ChangeAttr("dwFireValue", elem);
		objElemSystem:ChangeAttr("dwEarthValue", elem);
		local setData = {
			[1] = {dwCurrent = uItemGold, dwChange = elem};
			[2] = {dwCurrent = uItemWood, dwChange = elem};
			[3] = {dwCurrent = uItemWater, dwChange = elem};
			[4] = {dwCurrent = uItemFire, dwChange = elem};
			[5] = {dwCurrent = uItemEarth, dwChange = elem};
		}
		CLogSystemManager:zhenqi(objPlayer, setData, _G.FiveElemSysOperType.CommercialAct)
	end;
	if nexp and nexp > 0 then
		objPlayer:AddExp(nexp);
	end;
	if items and #items > 0 then
		local setAddList = {};
		for _, info in ipairs(items) do
			local item = {
				dwItemEnum	= info[1];
				dwItemNumber= info[2];
				dwBindType	= info[3];
				dwLifeTime	= info[4] and (info[4] * 3600000 * 24) or nil;
				dwBornTime	= info[5] and (CTimeFormat:GetThisTimeMsec(
					math.floor(info[5]/10000),
					math.floor(math.mod(info[5], 10000)/100),
					math.mod(info[5], 100),
					0, 0, 0)) or nil;
			}
			table.insert(setAddList, item);
		end;
		itemSystem:AddEnumItemListToPacket(setAddList, addtype);
	end;
	
	commercialActSystem:RecordDB(self.nGlobalID, self:GetDays(), index);
end;

function CCommercialAct:GetClientShowInfo()
	local info = {};
	info[1] = self:GetType();
	info[2] = self:GetCountDown();
	info[3] = self:GetReward();
	-- local realreward = {};
	-- local reward = self:GetReward();
	-- for index, value in pairs(reward) do
		-- realreward[index] = {};
		-- local money = value[_G.CommercialActRewardType.Money];
		-- local bindgold = value[_G.CommercialActRewardType.BindGold];
		-- local gold = value[_G.CommercialActRewardType.Gold];
		-- local elem = value[_G.CommercialActRewardType.Elem];
		-- local nexp = value[_G.CommercialActRewardType.Exp];
		-- if money and money > 0 then
			-- realreward[index][_G.CommercialActRewardType.Money] = money;
		-- end;
		-- if bindgold and bindgold > 0 then
			-- realreward[index][_G.CommercialActRewardType.BindGold] = bindgold;
		-- end;
		-- if gold and gold > 0 then
			-- realreward[index][_G.CommercialActRewardType.Gold] = gold;
		-- end;
		-- if elem and elem > 0 then
			-- realreward[index][_G.CommercialActRewardType.Elem] = elem;
		-- end;
		-- if nexp and nexp > 0 then
			-- realreward[index][_G.CommercialActRewardType.Exp] = nexp;
		-- end;
		
		-- local items = reward[_G.CommercialActRewardType.Item];
		-- if items and #items > 0 then
			-- realreward[index][_G.CommercialActRewardType.Item] = items;
		-- end;
	-- end;
	-- info[3] = realreward;
	return info;
end;


-------------------------------------------------------------------------------



--商业化活动管理器
_G.CCommercialActManager = CSingle:new();
CSingleManager:AddSingle(CCommercialActManager);

function CCommercialActManager:Create()
	CAlarmClock:AddTask({dwTime = "00:00"}, CAlarmTaskCycleType.eDay, 1, 0,
		function() self:InitCommercialAct() end, {}
	)
	return true;
end;

function CCommercialActManager:CheckConfigAvailable(cfg)
	if (not cfg.nGlobalID) or type(cfg.nGlobalID) ~= "number" then return false end;
	if (not cfg.nType) or type(cfg.nType) ~= "number" then return false end;
	if (not cfg.nTimeType) or type(cfg.nTimeType) ~= "number" then return false end;
	if (not cfg.nStartTime) or type(cfg.nStartTime) ~= "number" then return false end;
	if (not cfg.nEndTime) or type(cfg.nEndTime) ~= "number" then return false end;
	if (not cfg.tReward) or type(cfg.tReward) ~= "table" then return false end;
	return true;
end;

function CCommercialActManager:InitCommercialAct()
	dofile '../Data/CommercialAct/Config.lua'
	local serverStartTimeMsec = CTimeRewardManager:GetServerStartTime();
	local nowTime = _now();
	self.tCommercialActList = {};
	self.tIDList = {};
	for _, cfg in pairs(_G.CommercialActConfig) do
		if self:CheckConfigAvailable(cfg) then
			local startTime = 0;
			local endTime = 0;
			if cfg.nTimeType == _G.CommercialActTimeType.Absolutely then
				startTime = CTimeFormat:GetThisTimeMsec(
					math.floor(cfg.nStartTime/10000),
					math.floor(math.mod(cfg.nStartTime, 10000)/100),
					math.mod(cfg.nStartTime, 100),
					0, 0, 0);
				endTime = CTimeFormat:GetThisTimeMsec(
					math.floor(cfg.nEndTime/10000),
					math.floor(math.mod(cfg.nEndTime, 10000)/100),
					math.mod(cfg.nEndTime, 100),
					24, 0, 0);
				if cfg.nAvoidDay and type(cfg.nAvoidDay) == "number" then
					local startTime1 = serverStartTimeMsec + cfg.nAvoidDay * 3600000 * 24;
					if startTime1 > startTime then
						startTime = startTime1;
					end;
				end;
			elseif cfg.nTimeType == _G.CommercialActTimeType.Relatively then
				startTime = serverStartTimeMsec + (cfg.nStartTime - 1) * 3600000 * 24;
				endTime = serverStartTimeMsec + cfg.nEndTime * 3600000 * 24;
			end;
			if startTime < endTime then
				if nowTime >= startTime and nowTime < endTime then
					self.tCommercialActList[cfg.nGlobalID] = CCommercialAct:New(cfg.nGlobalID, startTime, endTime);
					table.insert(self.tIDList, cfg.nGlobalID);
				end;
			end;
		end;
	end;
	
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		local scriptSystem = objPlayer:GetSystem("CScriptSystem");
		if scriptSystem then
			scriptSystem:Update();
		end;
        table.insert(setNet, objPlayer.objNet);
	end; 
    _groupcallout(setNet, "InitCommercialActListMsg", {List = self:GetCommercialActIDList()});
end;

function CCommercialActManager:GetCommercialActIDList()
	return self.tIDList;
end;

function CCommercialActManager:PlayerGetActInfo(nActID, objPlayer)
	local commercialAct = self.tCommercialActList[nActID];
	if objPlayer and commercialAct then
		objPlayer.CommercialActInfoMsg{
			ActID 	= nActID;
			Info	= commercialAct:GetClientShowInfo();
		}
	end;
end;

function CCommercialActManager:CalculateAct(objPlayer)
	if not objPlayer then return end;
	local stageInfo = {};
	local rewardInfo = {};
	for id, commercialAct in pairs(self.tCommercialActList) do
		stageInfo[id] = commercialAct:GetPlayerStage(objPlayer);
		rewardInfo[id] = commercialAct:GetPlayerRewardInfo(objPlayer);
	end;
	objPlayer.CommercialActRewardInfoMsg{StageInfo = stageInfo, RewardInfo = rewardInfo};
end;

function CCommercialActManager:PlayerGetReward(nActID, nIndex, objPlayer)
	local commercialAct = self.tCommercialActList[nActID];
	if objPlayer and commercialAct then
		local commercialActSystem = objPlayer:GetSystem("CCommercialActSystem");
		if commercialActSystem then
			local days = commercialAct:GetDays();
			if commercialActSystem:GetRewardRecord(nActID, days, nIndex) == 0 then
				if commercialAct:CheckGetReward(objPlayer, nIndex) then
					commercialAct:GiveReward(objPlayer, nIndex);
					self:CalculateAct(objPlayer)
				end;
			end;
		end;
	end;
end;



