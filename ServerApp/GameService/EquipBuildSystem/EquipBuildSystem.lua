--[[
功能：装备修炼系统类
作者：曲莹
时间：2013-07-09
]]
_G.CEquipBuildSystem = {};
function CEquipBuildSystem:new()
	local obj = CSystem:new("CEquipBuildSystem");
	obj.objDBQuery = nil;    --对应的数据库操作模
	for i,v in pairs(CEquipBuildSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

function CEquipBuildSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		return false;
	end;
	self.objDBQuery = CEquipBuildSystemDB:new(objDB, self);
	self.EquipInfo = {};
	self.szEquipInfo = "";
	self.dwSuitLevel = 0;
	self.dwBlessValue = 0;
	self.dwEquipBuildNum = 0;
	local info = objPlayer:GetLineData("CEquipBuildSystem")[1];
	if info then
		self:SetEquipBuildInfo(info[1]);
		self:SetEquipBlessInfo(info[2]);
	end;
	return true;
end;
--解析杀怪信息
local function ParseStr(str)
	local lastIndex = 0;
	local t = {};
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local len = string.len(str1);
		local index = string.find(str1, ",");
		local slotPos = string.sub(str1, 0, index -1);
		local str2 = string.sub(str1, index + 1, len);
		local index2 = string.find(str2, ",");
		local level = string.sub(str2, 0, index2 - 1);
		local exps = string.sub(str2, index2 + 1, len);
		if tonumber(slotPos) then
			t[tonumber(slotPos)] = {tonumber(level), tonumber(exps)};
		end;
	end;
	return t;
end;

local function ParseTblToStr(tbl)
	local str = "";
	if tbl then
		for slotPos, info in pairs(tbl) do
			str = str..slotPos..","..info[1]..","..info[2]..";";
		end;
	end;
	return str;
end;

local function GetMinLevel(tbl)
	local tempMinLevel;
	local tempMaxLevel;
	local num = 0;
	local perLevel = 0;
	local totalLevel = 0;
	for _, info in pairs(tbl) do
		local level = info[1];
		totalLevel = totalLevel + level;
		num = num + 1;
		if not tempMinLevel then
			tempMinLevel = level;
		end;
		if not tempMaxLevel then
			tempMaxLevel = level;
		end;
		if level < tempMaxLevel then
			tempMinLevel = level;
		end;
		if level > tempMaxLevel then
			tempMaxLevel = level;
		end;
	end;
	perLevel = totalLevel / num;
	return tempMinLevel, tempMaxLevel, perLevel;
end;

-- local b;
local function GetLastMinValue(tbl, minLevel)
	local tempMinLevel;
	for value, _ in pairs(tbl) do
		if value < minLevel then
			if not tempMinLevel then
				tempMinLevel = value;
			else
				if value > tempMinLevel then
					tempMinLevel = value;
				end;
			end;
		end;
	end;
	return tempMinLevel;
end;

--同步装备修炼信息
function CEquipBuildSystem:SetEquipBuildInfo(info)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.szEquipInfo = info.szBuildInfo;
	self.dwSuitLevel = info.dwSuitLevel;
	
	local tbl = ParseStr(self.szEquipInfo);
	for index, _ in pairs(_G.EquipBuildRootConfig) do
		if not tbl[index] then
			self.EquipInfo[index] = {0, 0};
		else
			self.EquipInfo[index] = tbl[index];
		end;
	end;
	for slotPos, info in pairs(self.EquipInfo) do
		local level = info[1];
		local exps = info[2];
		self:AddPropertyByEquipBuild();
	end;
end;
--同步修炼祝福值和用元宝修炼的次数
function CEquipBuildSystem:SetEquipBlessInfo(info)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.dwBlessValue = info.dwCritBless;
	self.dwEquipBuildNum = info.dwBuildNum;
end;
function CEquipBuildSystem:OnEnterScene()
	self:SendEquipBuildInfo();
end;

function CEquipBuildSystem:SendEquipBuildInfo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self:HasAuthority("ZhuangBeiXiuLian") then
		return;
	end;
	objPlayer.SendEquipInfoMsg{EquipInfo = self.EquipInfo, BlessValue = self.dwBlessValue, EquipBuildNum = self.dwEquipBuildNum, SuitLevel = self.dwSuitLevel};
end;

function CEquipBuildSystem:EventGetAuthority(szAuthName)
	if szAuthName == "ZhuangBeiXiuLian" then
		self:SendEquipBuildInfo();
	end
end;

function CEquipBuildSystem:Destroy()
	
end;


--开始换线记录数据
function CEquipBuildSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local blessInfo = {};
	blessInfo.dwCritBless = self.dwBlessValue;
	blessInfo.dwBuildNum = self.dwEquipBuildNum;	
	local equipInfo = {};
	equipInfo.szBuildInfo = self.szEquipInfo;
	equipInfo.dwSuitLevel = self.dwSuitLevel;
	
	local tbl = {};
	table.insert(tbl, equipInfo);
	table.insert(tbl, blessInfo);
	objPlayer:SetLineData("CEquipBuildSystem",tbl);
end;

function CEquipBuildSystem:ReqEquipBuild(slotPos, types)
	if types == 1 then
		self:EquipBuildWasteZQ(slotPos, types)
	else
		self:EquipBuildWasteGold(slotPos, types)
	end;
end;

function CEquipBuildSystem:EquipBuildWasteZQ(slotPos, types)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if not _G.EquipBuildRootConfig[slotPos] then
		return;
	end;
	if not self.EquipInfo[slotPos] then
		return;
	end;
	local objElemSystem = objPlayer:GetSystem("CFiveElemSystem")
	local needGold, needWood, needWater, needFire, needEarth = _G.EquipBuildUseConfig.NeedZQ(slotPos, self.EquipInfo[slotPos][1]);
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objElemSystem:GetElemValue();
	if (needGold < 0) or (needWood < 0) or (needWater < 0) or (needFire < 0) or (needEarth < 0) then
		return;
	end;
	if needGold and uItemGold < needGold then
		return;
	end;
	if needWood and uItemWood < needWood then
		return;
	end;
	if needWater and uItemWater < needWater then
		return;
	end;
	if needFire and uItemFire < needFire then
		return;
	end;
	if needEarth and uItemEarth < needEarth then
		return;
	end;
	local level = self.EquipInfo[slotPos][1];
	local exps = self.EquipInfo[slotPos][2];
	
	--消耗真气
	objElemSystem:ChangeAttr("dwMetalValue",-needGold)
	objElemSystem:ChangeAttr("dwWoodValue",-needWood)
	objElemSystem:ChangeAttr("dwWaterValue",-needWater)
	objElemSystem:ChangeAttr("dwFireValue",-needFire)
	objElemSystem:ChangeAttr("dwEarthValue",-needEarth)
	
	local setData = {
		[1] = {dwCurrent = uItemGold, dwChange = -needGold};
		[2] = {dwCurrent = uItemWood, dwChange = -needWood};
		[3] = {dwCurrent = uItemWater, dwChange = -needWater};
		[4] = {dwCurrent = uItemFire, dwChange = -needFire};
		[5] = {dwCurrent = uItemEarth, dwChange = -needEarth};
	}
	CLogSystemManager:zhenqi(objPlayer, setData, _G.FiveElemSysOperType.EquipBuild)	
	
	--增加经验
	local addExp, critType = _G.EquipBuildUseConfig.AddExpValue(slotPos, types, level, self.dwBlessValue, self.dwBlessValue >= _G.EquipBuildUseConfig.TotalBlessValue, objPlayer);
	if self.dwBlessValue >= _G.EquipBuildUseConfig.TotalBlessValue then
		self.dwBlessValue = 0;
	else
		local blessValue = _G.EquipBuildUseConfig.AddBlessValue(slotPos, types, level)
		self.dwBlessValue = self.dwBlessValue + blessValue;
	end;
	local upFlag = false;
	exps = exps + addExp;
	while(exps > 0) do
		if exps >= _G.EquipBuildRootConfig[slotPos][level] then
			if level < table.maxn(_G.EquipBuildRootConfig[slotPos]) then
				exps = exps - _G.EquipBuildRootConfig[slotPos][level];
				level = level + 1;	
				upFlag = true;
			else
				exps = _G.EquipBuildRootConfig[slotPos][level];
				break;
			end;
		else
			break;
		end;
	end;
	
	self.EquipInfo[slotPos] = {level, exps};
	local minLevel, maxLevel, perLevel = GetMinLevel(self.EquipInfo);
	if _G.EquipBuildBroadConfig[slotPos] and _G.EquipBuildBroadConfig[slotPos][level] then
		self:BroadEquipBuild(slotPos, level, upFlag)
	end;
	if _G.EquipBuildBroadConfig[99] and _G.EquipBuildBroadConfig[99][minLevel] then
		self:BroadEquipBuild(99, minLevel, upFlag)
	end;
	--存数据库
	local str = ParseTblToStr(self.EquipInfo);
	self.szEquipInfo = str;
	self.objDBQuery:SetEquipBuildInfo(objPlayer:GetRoleID(), str);
	self.objDBQuery:UpdateBlessInfo(objPlayer:GetRoleID(), self.dwBlessValue, self.dwEquipBuildNum)
	
	CLogSystemManager:equip_build(objPlayer, slotPos, level, exps, needGold, 2)
	
	objPlayer.SendAddExpByZQMsg{SlotPos = slotPos, AddExp = addExp, CritType = critType, BlessValue = self.dwBlessValue, Num = self.dwEquipBuildNum};
	--add属性
	self:AddPropertyByEquipBuild();
end;

--对应的装备栏加属性
function CEquipBuildSystem:AddPropertyByEquipBuild()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local EquipBuildProperty = {
		dwHPMax = 0,  --血量max
		dwMPMax = 0,	--内力max
		dwAttack = 0,	--攻击
		dwDefense = 0, --防御
		dwFlee = 0,	--身法
		dwCrit = 0,	--暴击
		dwMoveSpeed = 0,   --移动速度
		dwAttackSpeed = 0,   --攻击速度
	}
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	--每个槽位增加的属性
	for i, _ in pairs(_G.EquipBuildRootConfig) do
		local propertyTbl = _G.EquipBuildUseConfig.AddProperty(i, self.EquipInfo[i][1]);
		for dwIndex, value in pairs(propertyTbl) do
			EquipBuildProperty[dwIndex] = EquipBuildProperty[dwIndex] + value;
		end;
	end;
	--套装增加属性
	local info = _G.EquipBuildUseConfig.SuitInfo[self.dwSuitLevel];
	if info then
		local suitProperty = info.property;
		for dwIndex, value in pairs(suitProperty) do
			EquipBuildProperty[dwIndex] = EquipBuildProperty[dwIndex] + value;
		end;
	end;

	local t_attr = _G.SSingleAttrChange:new();
	if EquipBuildProperty then
		t_attr.dwHPMax	= EquipBuildProperty["dwHPMax"] or 0;	   --生命max
		t_attr.dwMPMax	= EquipBuildProperty["dwMPMax"] or 0;    --内力max
		t_attr.dwAttack	= EquipBuildProperty["dwAttack"] or 0;   --攻击
		t_attr.dwDefense= EquipBuildProperty["dwDefense"] or 0;  --防御
		t_attr.dwFlee	= EquipBuildProperty["dwFlee"] or 0;	   --身法
		t_attr.dwCrit	= EquipBuildProperty["dwCrit"] or 0;	   --暴击
		t_attr.dwMoveSpeed = EquipBuildProperty["dwMoveSpeed"] or 0;	--移动速度
		t_attr.dwAttackSpeed = EquipBuildProperty["dwAttackSpeed"] or 0;	--移动速度
		skillSystem:NotifyEquipBuild(t_attr);   --更新属性(侠客行)
	end;
end;

--激活及升级套装
function CEquipBuildSystem:ActivateSuit()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	if not itemSystem then
		return;
	end;
	local dwNextSuitLevel = self.dwSuitLevel + 1;
	local info = _G.EquipBuildUseConfig.SuitInfo[dwNextSuitLevel];
	if not info then
		return;
	end;
	local dwMinLevel = info.dwMinLevel;
	local property = info.property;
	local dwEnumId = info.dwEnumId;
	local dwNum = info.dwNum;
	local minLevel = GetMinLevel(self.EquipInfo);
	if minLevel < dwMinLevel then
		return;
	end;
	local b_IsEnough_1, n_Minus_1 = itemSystem:CheckDelEnumItemInPacketCond(dwEnumId, dwNum);
	if not b_IsEnough_1 then
		return;
	end;
	--删除物品通知
	itemSystem:DelEnumItemInPacket(dwEnumId, dwNum, false, _G.ItemSysOperType.EquipBuild);
	self.dwSuitLevel = dwNextSuitLevel;
	self.objDBQuery:SetEquipSuitInfo(objPlayer:GetRoleID(), self.dwSuitLevel)
	self:AddPropertyByEquipBuild();
	objPlayer.SendEquipSuitChgMsg{EquipSuitLevel = self.dwSuitLevel};
end;

function CEquipBuildSystem:EquipBuildWasteGold(slotPos, types)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if not _G.EquipBuildRootConfig[slotPos] then
		return;
	end;
	if not self.EquipInfo[slotPos] then
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local minLevel, maxLevel, perLevel = GetMinLevel(self.EquipInfo);
	local level = self.EquipInfo[slotPos][1];
	local exps = self.EquipInfo[slotPos][2];
	local needGold = 0;
	if self.dwEquipBuildNum >= _G.EquipBuildUseConfig.FreeNum then
		local gold = _G.EquipBuildUseConfig.NeedGold(pos, level, self.dwEquipBuildNum + 1, maxLevel, minLevel, perLevel);
		local haveGold  = itemSystem:GetGold();
		needGold = gold;
		if haveGold < gold then
			return;
		end;
		if not itemSystem:CostGold(gold, _G.ItemSysOperType.EquipBuild) then
			return;
		end;
	end;
	-- print("-----------test1--------",self.dwEquipBuildNum);
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventEquipBuild);
	--增加经验
	local addExp, critType = _G.EquipBuildUseConfig.AddExpValue(slotPos, types, level, self.dwBlessValue, self.dwBlessValue >= _G.EquipBuildUseConfig.TotalBlessValue, objPlayer);
	self.dwEquipBuildNum = self.dwEquipBuildNum + 1;
	if self.dwBlessValue >= _G.EquipBuildUseConfig.TotalBlessValue then
		self.dwBlessValue = 0;
	else
		local blessValue = _G.EquipBuildUseConfig.AddBlessValue(slotPos, types, level)
		self.dwBlessValue = self.dwBlessValue + blessValue;
	end;
	exps = exps + addExp;
	local upFlag = false;
	while(exps > 0) do
		if exps >= _G.EquipBuildRootConfig[slotPos][level] then
			if level < table.maxn(_G.EquipBuildRootConfig[slotPos]) then
				exps = exps - _G.EquipBuildRootConfig[slotPos][level];
				level = level + 1;	
				upFlag = true;
			else
				exps = _G.EquipBuildRootConfig[slotPos][level];
				break;
			end;
		else
			break;
		end;
	end;
	self.EquipInfo[slotPos] = {level, exps};	
	local minLevel, maxLevel, perLevel = GetMinLevel(self.EquipInfo);
	if _G.EquipBuildBroadConfig[slotPos] and _G.EquipBuildBroadConfig[slotPos][level] then
		self:BroadEquipBuild(slotPos, level, upFlag)
	end;
	if _G.EquipBuildBroadConfig[99] and _G.EquipBuildBroadConfig[99][minLevel] then
		self:BroadEquipBuild(99, minLevel, upFlag)
	end;
	CLogSystemManager:equip_build(objPlayer, slotPos, level, exps, needGold, 1);
	--存数据库
	local str = ParseTblToStr(self.EquipInfo);
	self.szEquipInfo = str;
	self.objDBQuery:SetEquipBuildInfo(objPlayer:GetRoleID(), str);
	self.objDBQuery:UpdateBlessInfo(objPlayer:GetRoleID(), self.dwBlessValue, self.dwEquipBuildNum)
	objPlayer.SendAddExpByZQMsg{SlotPos = slotPos, AddExp = addExp, CritType = critType, BlessValue = self.dwBlessValue, Num = self.dwEquipBuildNum};
	--add属性
	self:AddPropertyByEquipBuild();
end;

--广播消息
function CEquipBuildSystem:BroadEquipBuild(slotPos, level, upFlag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CEquipBuildSystem:BroadCastMsg");
		return;
	end;
	if not upFlag then
		return;
	end;
	--玩家姓名
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--玩家RoleID
	local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
	--全服广播
	CGameApp.EquipBuildSys_BroadCastMsg{
        PlayerName = s_PlayerName,
        PlayerRoleID = n_PlayerRoleID,
        SlotPos = slotPos,
        Level = level,
		};
end;

function CEquipBuildSystem:SetEquipBuildNum()
	self.dwEquipBuildNum = 0;
end;

--检测某装备槽是否已满级
function CEquipBuildSystem:CheckSlotLevel(pos)
	local flag = true;
	local level = 0;
	if self.EquipInfo[pos] then
		level = self.EquipInfo[pos][1];
	end;	
	local maxLevel = table.maxn(_G.EquipBuildRootConfig[pos]);
	if level < maxLevel then
		flag = false;
	end;
	return flag;
end;
--指定位置增加经验值
function CEquipBuildSystem:AddExpToSlot(types, pos, addExp)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local level = 0;
	local exps = 0;
	if self.EquipInfo[pos] then
		level = self.EquipInfo[pos][1];
	end;	
	if addExp then
		exps = self.EquipInfo[pos][2] + addExp;
	else
		exps = _G.EquipBuildRootConfig[pos][level];
		addExp = exps - self.EquipInfo[pos][2];
	end;
	
	local upFlag = false;
	while(exps > 0) do
		if exps >= _G.EquipBuildRootConfig[pos][level] then
			if level < table.maxn(_G.EquipBuildRootConfig[pos]) then
				exps = exps - _G.EquipBuildRootConfig[pos][level];
				level = level + 1;	
				upFlag = true;
			else
				exps = _G.EquipBuildRootConfig[pos][level];
				break;
			end;
		else
			break;
		end;
	end;
	self.EquipInfo[pos] = {level, exps};	
	local minLevel, maxLevel, perLevel = GetMinLevel(self.EquipInfo);
	if _G.EquipBuildBroadConfig[pos] and _G.EquipBuildBroadConfig[pos][level] then
		self:BroadEquipBuild(pos, level, upFlag)
	end;
	if _G.EquipBuildBroadConfig[99] and _G.EquipBuildBroadConfig[99][minLevel] then
		self:BroadEquipBuild(99, minLevel, upFlag)
	end;
	--存数据库
	local str = ParseTblToStr(self.EquipInfo);
	self.szEquipInfo = str;
	self.objDBQuery:SetEquipBuildInfo(objPlayer:GetRoleID(), str);
	self.objDBQuery:UpdateBlessInfo(objPlayer:GetRoleID(), self.dwBlessValue, self.dwEquipBuildNum)
	objPlayer.SendAddExpByItemMsg{SlotPos = pos, AddExp = addExp, Type = types};
	--add属性
	self:AddPropertyByEquipBuild();
end;

function CEquipBuildSystem:ViewOtherEquipBuild(fromRoleID)
	local objPlayer = self:GetPlayer(); 
	if not objPlayer then
		return;
	end;
	_G.GSRemoteCall(fromRoleID, "CEquipBuildSystem", "BeViewEquipBuildInfo", {objPlayer:GetRoleID()}, nil);
end;

function CEquipBuildSystem:BeViewEquipBuildInfo(dwRoleId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_G.GSRemoteCall(dwRoleId, "CEquipBuildSystem", "ViewResult", {false, {6000410027}}, nil);
		return;
	end;
	_G.GSRemoteCall(dwRoleId, "CEquipBuildSystem", "ViewResult", {true, self.EquipInfo}, nil);
end;

--返回查看结果
function CEquipBuildSystem:ViewResult(isOK, info)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CEquipBuildSystem:ViewResult");
		return;
	end;
	objPlayer.EquipBuildSys_ViewOtherResultMsg{IsOK = isOK, EquipBuildInfo = info};
end;
