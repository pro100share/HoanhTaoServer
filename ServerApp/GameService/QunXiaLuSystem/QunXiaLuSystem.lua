--[[ 	
	群侠录系统
	author lizc
	2014.1.2
--]]

local function ParseHotelCardStr(str, t)
	local lastIndex = 0;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local index, index1 = string.find(str1, ",");
		local str2 = string.sub(str1, 1, index -1);
		local str3 = string.sub(str1, index1 + 1);
		local key = tonumber(str2);
		local value = tonumber(str3);
		t[key] = value;	
	end;
	return t;
end;

local function ParseGroupSlotStr(str, t)
	local lastIndex = 0;
	while true do
		--找到;前面的字符串
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
			
		--找到=前面的字符串
		local equalIndex = string.find(str1, "=");
		if not equalIndex then 
			_err("QunXiaLuSystem.lua ParseGroupSlotStr dont find equal sign!!")
			return
		end
		local groupIndex = string.sub(str1, 1, equalIndex - 1);
		t[tonumber(groupIndex)] = {}
		
		
		--找到=后面的字符串
		local slotStateStr = string.sub(str1, equalIndex + 1);
		
		
		local lastSlotIndex = 0;
		while true do
			local nextSlotIndex = lastSlotIndex + 1;
			lastSlotIndex = string.find(slotStateStr, ",", nextSlotIndex);
			if not lastSlotIndex then break end;
			local state = string.sub(slotStateStr, nextSlotIndex, lastSlotIndex - 1);
			table.insert(t[tonumber(groupIndex)], tonumber(state))
		end
		
	end;

	return t;
end;



local function FormatHotelCardStr(t)
	local retStr = "";
	for k, v in pairs(t) do
		retStr = retStr..k..","..v..";"
	end
	
	return retStr;
end


--[[
字符串结构
	1=0,1,0,1,1,0,0,;2=1,1,1,0,0,1,;...
--]]
local function FormatGroupSlotStr(t)
	local retStr = "";
	for k , v in pairs(t) do
		retStr = retStr..k.."=";
		for _, state in pairs(v) do 
			retStr = retStr..state..","
		end
		retStr = retStr..";"
	end
	
	return retStr;
end


_G.CQunXiaLuSystem = {};

function CQunXiaLuSystem:new()
	local obj = CSystem:new("CQunXiaLuSystem");
	
	for i,v in pairs(CQunXiaLuSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;

function CQunXiaLuSystem:Create()
	--每个系统创建时都会挂接到自己的管理者player身上
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CQunXiaLuSystem Create Cannot get player");
		return false;
	end;
	
	--需要调用player的基础道具系统
	self.ItemSystem = objPlayer:GetSystem("CItemSystem");
	if not self.ItemSystem then
		_err("CQunXiaLuSystem Create Cannot get ItemSystem");
		return false;
	end;
	
	--侠义勋章系统
	self.ErrantHonorSystem = objPlayer:GetSystem("CErrantHonorSystem");
	if not self.ErrantHonorSystem then
		_err("CQunXiaLuSystem Create Cannot get ErrantHonorSystem");
		return false;
	end
	
	
	--技能系统
	self.SkillSystem = objPlayer:GetSystem("CSkillSystem");
	if not self.SkillSystem then
		_err("CQunXiaLuSystem:Create Cannot get SkillSystem----");
		return false;
	end;
	
	--初始化DB模块
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		_err("CQunXiaLuSystem Create Cannot get DBQuery");
		return false;
	end;
	self.objDBQuery = CQunXiaLuSystemDB:new(objDB, self);

	--风云客栈上次刷新时间
	self.dwHotelLastTime = 0;
	
	--今日风云客栈声望刷新次数 
	self.dwHotelPrestigeCount = 0;
	
	--今日风云客栈金币刷新次数
	self.dwHotelGoldCount = 0;
	
	--风云客栈卡片和卡片状态
	self.setHotelCard = {};
	
	--群侠组合的槽位状态 0为未镶嵌 1 为已经镶嵌
	self.setGroupSlot = {};
	
	--群侠 大侠录的槽位状态
	self.setDaXiaSlot = {}
	
		
	--读取信息
	local Data	= objPlayer:GetLineData("CQunXiaLuSystem")[1];
	if not Data then
		_err("CQunXiaLuSystem Create CanNot GetLineData!!!");
		Data = {}
	end;
		
	if Data[1] then
		self.dwHotelLastTime = Data[1].dwHotelLastTime;
		self.dwHotelPrestigeCount = Data[1].dwHotelPrestigeCount;
		self.dwHotelGoldCount = Data[1].dwHotelGoldCount;
		ParseHotelCardStr(Data[1].szHotelCard, self.setHotelCard);
		ParseGroupSlotStr(Data[1].szGroupSlot, self.setGroupSlot);
		ParseGroupSlotStr(Data[1].szDaXiaSlot, self.setDaXiaSlot);
		
		
		--检查是否需要刷新卡片
		if self:HotelCheckRefresh() then
			self:RefreshHotelCard(true)
			
			--记录卡片刷新时间
			self.dwHotelLastTime = _now();

			--更新数据库
			local db_Info = {};
			db_Info.dwHotelLastTime= self.dwHotelLastTime
			self.objDBQuery:UpdateHotelLastTime(db_Info);
		end
		
		--上线统计属性给人物加上
		self:InitAttr()
		
	else
		--初始化 (刷新风云客栈卡片)
		self:RefreshHotelCard(true, true);
		--风云客栈上次刷新时间
		self.dwHotelLastTime = _now();
		
		--初始化群侠组合
		self:GroupInit();
		
		--初始化大侠录
		self:DaXiaInit();
		
		local db_Info = {};
		db_Info.dwHotelLastTime = self.dwHotelLastTime;
		db_Info.dwHotelPrestigeCount = self.dwHotelPrestigeCount;
		db_Info.dwHotelGoldCount = self.dwHotelGoldCount;
		db_Info.szHotelCard = FormatHotelCardStr(self.setHotelCard);
		db_Info.szGroupSlot = FormatGroupSlotStr(self.setGroupSlot);
		
		--和setGroupSlot结构一样
		db_Info.szDaXiaSlot = FormatGroupSlotStr(self.setDaXiaSlot);
		
		self.objDBQuery:InsertQunXiaLuSysInfo(db_Info);
	end;
	
	return true;
end;

function CQunXiaLuSystem:Destroy()
end;

function CQunXiaLuSystem:Update()
	
end;

function CQunXiaLuSystem:OnEnterScene()
	--风云客栈同步卡片信息
	self:SynHotelCard();
	--风云客栈同步今日刷新次数信息
	self:SynHotelCount();
	--风云客栈同步上次刷新时间
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	local curTime = _now();
	objPlayer.SynHotelLastTimeMsg{LastTime = curTime};
	
	--群侠组合同步槽位状态
	self:SynGroupSlot();
	
	--大侠录同步槽位状态
	self:SynDaXiaSlot();
end;

--换线开始
function CQunXiaLuSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
		
	local Data = {};
	Data[1] = {};
	Data[1].dwHotelLastTime = self.dwHotelLastTime;
	Data[1].dwHotelPrestigeCount = self.dwHotelPrestigeCount;
	Data[1].dwHotelGoldCount = self.dwHotelGoldCount;
	Data[1].szHotelCard = FormatHotelCardStr(self.setHotelCard)
	Data[1].szGroupSlot = FormatGroupSlotStr(self.setGroupSlot);
	Data[1].szDaXiaSlot = FormatGroupSlotStr(self.setDaXiaSlot);

	objPlayer:SetLineData("CQunXiaLuSystem", Data);
end


--内部调用
-------------------------------------------------------------------------------------------------------------------------------
--获取群侠录系统给人物加的所有属性
function CQunXiaLuSystem:GetAllAttr()
	local tempAttrInfo = SSingleAttrChange:new();
	
	--统计群侠组合增加的属性
	
	for groupIndex, setState in pairs(self.setGroupSlot) do
		local bIsGroupCompelete = true;
		for slotIndex, state in pairs(setState) do
			if state == 1 then
				local slotId = QunXiaLuCombination[groupIndex].setSlot[slotIndex]
				local setConfig = QunXiaZuHeSlotConfig[slotId].addAttr;
				for attrType, attrValue in pairs(setConfig) do
					tempAttrInfo[attrType] = tempAttrInfo[attrType] + attrValue;
				end 
			else
				bIsGroupCompelete = false
			end
		end
		
		--如果此组群侠卡收集完成
		if bIsGroupCompelete then
			local groupAttrCfg = QunXiaLuCombination[groupIndex].completeAttr;
			for attrType, attrValue in pairs(groupAttrCfg) do
				tempAttrInfo[attrType] = tempAttrInfo[attrType] + attrValue;
			end  
		end
		
	end
	
	
	
	--统计大侠录增加的属性
	for groupIndex, setState in pairs(self.setDaXiaSlot) do
		for slotIndex, state in pairs(setState) do
			if state == 1 then
				local slotId = QunXiaLuDaXia[groupIndex].setSlot[slotIndex]
				local setConfig = QunXiaDaXiaSlotConfig[slotId].addAttr;
				for attrType, attrValue in pairs(setConfig) do
					tempAttrInfo[attrType] = tempAttrInfo[attrType] + attrValue;
				end 
			end
		end
	end
	
	return tempAttrInfo;
	
end

--上线给人物加上群侠录的属性
function CQunXiaLuSystem:InitAttr()
	self.SkillSystem:NotifyQunXiaLuUpdate(self:GetAllAttr());
end

--风云客栈上线时检查是否需要刷新卡片
function CQunXiaLuSystem:HotelCheckRefresh()
	--检测是否拥有权限
	if not self:HasAuthority('QunXiaLuFengYun') then
		return false;
	end
	
	if not self.dwHotelLastTime or self.dwHotelLastTime == 0 then
		return false;
	end
	
	local curTime = GetCurTime();
	for k, v in pairs(_G.QunXiaLodgeConfig.setRefreshTime) do
		if type(v) ~= "string" then
			break;
		end
		
		local dwIndex = string.find(v, ":");
		local hour = string.sub(v, 1, dwIndex - 1);
		local minute = string.sub(v, dwIndex + 1)
		local cfgMsec = CTimeFormat:GetTodayThisTimeMsec(tonumber(hour), tonumber(minute))
		
		if cfgMsec > self.dwHotelLastTime and cfgMsec < curTime then
			return true;
		end
		
	end
	
	return false;
end

--随机出一个卡片配置id
function CQunXiaLuSystem:RandomCardId()
	
	local totalWeight = 0;
	for k, v in pairs(_G.QunXiaCardQualityConfig) do
		totalWeight = totalWeight + v.weight;
	end
	
	local randomQuality = 0;
	local cardId = 0;
	
	local randomNum = math.random(1, totalWeight)
	
	local tempWeight = 0;
	for k, v in pairs(_G.QunXiaCardQualityConfig) do
		tempWeight = tempWeight + v.weight;
		if randomNum <= tempWeight then
			randomQuality = k;
			break;
		end
	end
	local cardCount = #_G.QunXiaCardQualityConfig[randomQuality].setCard;
	local setCardIndex = math.random(1, cardCount)
	cardId = _G.QunXiaCardQualityConfig[randomQuality].setCard[setCardIndex];

	return cardId;	
end


--风云客栈刷新卡片
function CQunXiaLuSystem:RefreshHotelCard(bDontneedMsg, bDontNeedDB, bNeedBoardcast)
	-- --检测是否拥有权限
	-- if not self:HasAuthority('QunXiaLuFengYun') then
		-- return;
	-- end
	
	self.setHotelCard = {}; 
	
	local cardCount = 0;
	while cardCount < _G.QunXiaLodgeConfig.refreshCardCount do 
		local randomCardId = self:RandomCardId();
		
		local isExist = false;
		for k, v in pairs(self.setHotelCard) do
			if k == randomCardId then
				isExist = true;
				break;
			end
		end
		
		if not isExist then
			--卡片的id为key， 状态设置为0 未购买, 1 已经购买
			self.setHotelCard[randomCardId] = 0;
			cardCount = cardCount + 1;
			
			if bNeedBoardcast then
				if QunXiaCardConfig[randomCardId].dwQuality >= QunXiaLodgeConfig.boradcastQuality then
					local objPlayer = self:GetPlayer();
					if not objPlayer then
						_err("error");
						return
					end;
					
					local dwRoleID = objPlayer:GetRoleID();
					local szRoleName = objPlayer:GetName();
					
					--全服广播
					CGameApp.QunXiaLuHotelRefleshCardMsg{RoleId = dwRoleID, RoleName = szRoleName, CardId = randomCardId};
				end
			end
		end
	end
	
	--发送消息
	if not bDontneedMsg then
		self:SynHotelCard();
	end
	
	
	--更新数据库
	if not bDontNeedDB then
		local db_Info = {};
		db_Info.szHotelCard = FormatHotelCardStr(self.setHotelCard)
		self.objDBQuery:UpdateHotelCardInfo(db_Info);
	end
end

--风云客栈同步卡片
function CQunXiaLuSystem:SynHotelCard()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	objPlayer.SynQunXiaLuHotelCardMsg{SetCard = self.setHotelCard};
end


--风云客栈同步刷新次数
function CQunXiaLuSystem:SynHotelCount()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	objPlayer.SynQunXiaLuHotelCountMsg{PrestigeCount = self.dwHotelPrestigeCount, GoldCount = self.dwHotelGoldCount}
end


--风云客栈同步上次刷新时间
function CQunXiaLuSystem:SynHotelLastTime()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	objPlayer.SynHotelLastTimeMsg{LastTime = self.dwHotelLastTime};
end


--外部接口
---------------------------------------------------------------------------------------------------------------------------------

--风云客栈 购买卡片
function CQunXiaLuSystem:BuyHotelCard(dwCardId)
	--检测是否拥有权限
	if not self:HasAuthority('QunXiaLuFengYun') then
		return;
	end
	
	if not _G.QunXiaCardConfig[dwCardId] then
		_info("CQunXiaLuSystem:BuyHotelCard _G.QunXiaCardConfig dont have the cardId", dwCardId);
		return
	end
	
	if not self.setHotelCard then
		_err("CQunXiaLuSystem:BuyHotelCard setHotelCard is nil") 
		return;
	end
	
	if not self.setHotelCard[dwCardId] then
		_info("CQunXiaLuSystem:BuyHotelCard card dont exist!!")
		return;
	end
	
	if self.setHotelCard[dwCardId] == 1 then
		_info("CQunXiaLuSystem:BuyHotelCard card already sell", dwCardId);
		return;
	end
	
	--检查背包空间是否足够
	local setAddList = {};
	local tempTabel = {
			dwItemEnum	= _G.QunXiaCardConfig[dwCardId].dwItemEnum;
			dwItemNumber = 1;
			dwBindType = _G.enItemBindType.eYes;
		};
	table.insert(setAddList, tempTabel);
	
	if not self.ItemSystem:IsEnumItemListCanAddToPacket(setAddList) then
		return
	end
	
	--检查风云声望是否足够
	local needErrantHonor = _G.QunXiaCardConfig[dwCardId].dwErrantHonor;
	if needErrantHonor > self.ErrantHonorSystem:GetErrantHonorValue() then
		return;
	end
	
	--扣除风云声望
	self.ErrantHonorSystem:DecErrantHonorValue(needErrantHonor);
	
	--给群侠卡片	
	self.ItemSystem:AddEnumItemListToPacket(setAddList, _G.ItemSysOperType.QunXiaLu);
	
	
	--设置卡片状态
	self.setHotelCard[dwCardId] = 1;
	
	--更新数据库
	local db_Info = {};
	db_Info.szHotelCard = FormatHotelCardStr(self.setHotelCard)
	self.objDBQuery:UpdateHotelCardInfo(db_Info);
	
	self:SynHotelCard();
end


--风云客栈刷新卡片
--[[
	dwCode 1声望刷新 2 金币刷新  3系统自动刷新
--]]
function CQunXiaLuSystem:RefreshHotelCardEx(dwCode, szTime)
	--检测是否拥有权限
	if not self:HasAuthority('QunXiaLuFengYun') then
		return;
	end
	
	
	if not dwCode then
		return 
	end

	if dwCode == 1 then
		--声望刷新
		local cfgNeedHonor = _G.QunXiaLodgeConfig:GetHonorCost(self.dwHotelPrestigeCount)
		if cfgNeedHonor > self.ErrantHonorSystem:GetErrantHonorValue() then
			return
		end
		
		--扣除风云声望
		self.ErrantHonorSystem:DecErrantHonorValue(cfgNeedHonor);
		
		
		self.dwHotelPrestigeCount = self.dwHotelPrestigeCount + 1;
		--更新数据库
		local db_Info = {};
		db_Info.dwHotelPrestigeCount= self.dwHotelPrestigeCount
		self.objDBQuery:UpdateHotelPrestigeCount(db_Info);
		
		self:SynHotelCount();
	elseif dwCode == 2 then
		--元宝刷新
		local cfgNeedGold = _G.QunXiaLodgeConfig:GetGoldCost(self.dwHotelGoldCount)
		if not self.ItemSystem:IsGoldEnough(cfgNeedGold) then
			return
		end
		
		--扣除元宝
		self.ItemSystem:CostGold(cfgNeedGold, _G.ItemSysOperType.QunXiaLu);
	
		self.dwHotelGoldCount = self.dwHotelGoldCount + 1;
		--更新数据库
		local db_Info = {};
		db_Info.dwHotelGoldCount= self.dwHotelGoldCount
		self.objDBQuery:UpdateHotelGoldCount(db_Info);
		
		self:SynHotelCount();
	elseif dwCode == 3 then
		--系统自动刷新
		if not szTime then
			return
		end;
		
		--记录卡片刷新时间
		self.dwHotelLastTime = _now();

		--更新数据库
		local db_Info = {};
		db_Info.dwHotelLastTime= self.dwHotelLastTime
		self.objDBQuery:UpdateHotelLastTime(db_Info);
		
		self:SynHotelLastTime()
	end
	
	--刷新卡片
	if dwCode == 3 then
		self:RefreshHotelCard();
	else
		self:RefreshHotelCard(false, false, true);
	end
end


--风雨客栈每日刷新
function CQunXiaLuSystem:HotelResetCount()
	--检测是否拥有权限
	if not self:HasAuthority('QunXiaLuFengYun') then
		return;
	end
	
	--今日风云客栈声望刷新次数 
	self.dwHotelPrestigeCount = 0;
	
	--今日风云客栈金币刷新次数
	self.dwHotelGoldCount = 0;
		
	--同步信息
	self:SynHotelCount();
end;
