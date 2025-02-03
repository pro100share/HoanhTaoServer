--[[
功能：侠客行系统类
作者：曲莹
时间：2013-07-09
]]
_G.CErrantSystem = {};
function CErrantSystem:new()
	local obj = CSystem:new("CErrantSystem");
	obj.objDBQuery = nil;    --对应的数据库操作模
	for i,v in pairs(CErrantSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

function CErrantSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		return false;
	end;
	self.objDBQuery = CErrantSystemDB:new(objDB, self);
	self.ErrantInfo = {};
	self.szErrantAward = "";
	self.GetAwardTbl = {};
	local info = objPlayer:GetLineData("CErrantSystem")[1];
	if info then
		self:SetErrantInfo(info[1]);
		self:GetErrantAwardInfo(info[2]);
	end;
	return true;
end;
function CErrantSystem:SendErrantInfo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self:HasAuthority("XiaKeXing") then
		return;
	end;
	local num = 0;
	for dwMapId, info in pairs(_G.ErrantMonsterConfig) do
		num = num + 1;
	end;
	local curNum = 1;
	for dwMapId ,info in pairs(self.ErrantInfo) do
		objPlayer.InitErrantMonsterMsg{MonsterInfo = info, MapId = dwMapId, EndFlag = (curNum == num)};
		curNum = curNum + 1;
	end;
	objPlayer.GetErrantAwardMsg{ErrantAwardStr = self.szErrantAward};
end;
function CErrantSystem:OnEnterScene()
	self:SendErrantInfo();
end;

function CErrantSystem:EventGetAuthority(szAuthName)
	if szAuthName == "XiaKeXing" then
		self:SendErrantInfo();
	end
end;
--检测死亡
function CErrantSystem:OnDead()
	
end;

function CErrantSystem:Update()

end;
function CErrantSystem:Destroy()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
end;

local function ParseTblToStr(tbl)
	local str = "";
	if tbl then
		for monsterId, value in pairs(tbl) do
			str = str..monsterId..","..value..";";
		end;
	end;
	return str;
end;
local function GetMonsterStar(info)
	local num = 0;
	if not info then
		return num;
	end;
	for dwMapId, monsterInfo in pairs(info) do
		for dwMonsterId, stars in pairs(monsterInfo) do
			num = num + stars;
		end;
	end;
	return num;
end;
--开始换线记录数据
function CErrantSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local Info = {};
	
	for dwMapId, tblInfo in pairs(self.ErrantInfo) do
		local info = {};
		info["dwMapId"] = dwMapId;
		info["szKillMonster"] = ParseTblToStr(tblInfo)
		table.insert(Info, info);
	end;
	local tbl = {};
	table.insert(tbl, Info);
	table.insert(tbl, self.szErrantAward);
	objPlayer:SetLineData("CErrantSystem",tbl);
end;

--单独解析分号
local function ParseSem(str)
	local lastIndex = 0;
	local t = {};
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local key = tonumber(str1);
		t[key] = true;	
	end;
	return t;
end;
function CErrantSystem:GetErrantAwardInfo(szErrantAward)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.szErrantAward = szErrantAward;
	self.GetAwardTbl = ParseSem(self.szErrantAward);
end;
function CErrantSystem:SetErrantInfo(errantInfo)
	self:ParseKillMonster(errantInfo);
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
		local index, index1 = string.find(str1, ",");
		local str2 = string.sub(str1, 0, index -1);
		local str3 = string.sub(str1, index1 + 1, index1 + 2);
		local key = tonumber(str2);
		local value = tonumber(str3);
		t[key] = value;	
	end;
	return t;
end;

local function GetOneMapStar(info)
	local num = 0;
	if not info then
		return num;
	end;
	for dwMonsterId, value in pairs(info) do
		num = num + value;
	end;
	return num;
end;
--同步各地图杀怪信息
function CErrantSystem:ParseKillMonster(errantInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	for _, info in pairs(errantInfo) do
		local dwMapId = info.dwMapId;
		local szKillMonster = info.szKillMonster;
		local tblInfo = ParseStr(szKillMonster);
		if not self.ErrantInfo[dwMapId] then
			self.ErrantInfo[dwMapId] = {};
		end;
		if tblInfo then
			for monsterId, value in pairs(tblInfo) do	
				self.ErrantInfo[dwMapId][monsterId] = value;
			end;
		end;
	end;
	--local totalNum = GetMonsterStar(self.ErrantInfo);
	self:AddProperByStar(self.ErrantInfo);
end;
--更新杀怪信息
function CErrantSystem:UpdateKillMonster(monsterId, value)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self:HasAuthority("XiaKeXing") then
		return;
	end;
	if MonsterDataConfig[monsterId]._type == 2 then
		value = 5;
	end;
	local dwRoleID = objPlayer:GetRoleID();
	local szRoleName = objPlayer:GetInfo().szRoleName;
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	local dwMapId = mapSystem:GetCurMapID();
	if _G.MonsterMapInfo[monsterId] then
		dwMapId = _G.MonsterMapInfo[monsterId];
	end;
	if not self.ErrantInfo[dwMapId] then
		return;
	end
	if not self.ErrantInfo[dwMapId][monsterId] then
		return;
	end;
	if MonsterDataConfig[monsterId]._type ~= 2 and value >= _G.ErrantAwardConfig.MaxMonsterStar then
		self:BroadCastErrant(1, dwMapId, monsterId);
	end;
	if value > self.ErrantInfo[dwMapId][monsterId] then
		self.ErrantInfo[dwMapId][monsterId] = value;
		if self:CompleteOneMap(dwMapId) then
			self:BroadCastErrant(2, dwMapId, monsterId);
		end;
		if self:CompleteKill() then
			self:BroadCastErrant(3, dwMapId, monsterId);
		end;
		local str = ParseTblToStr(self.ErrantInfo[dwMapId]);
		self.objDBQuery:SetErrantInfo(dwRoleID, dwMapId, str);
		--local num = GetMonsterStar(self.ErrantInfo);
		self:AddProperByStar(self.ErrantInfo);
		objPlayer.SendMonsterInfoChgMsg{MapId = dwMapId, MonsterId = monsterId, Value = value};
	end;
end;
--一张地图的侠客行
function CErrantSystem:CompleteOneMap(dwMapId)
	local completeFlag = false;
	local info = _G.ErrantMonsterConfig[dwMapId];
	local totalNum = 0;
	if info then
		for _, num in pairs(info) do
			totalNum = totalNum + num;
		end;
	end;
	local perMapNum = GetOneMapStar(self.ErrantInfo[dwMapId])
	if perMapNum >= totalNum then
		if totalNum ~= 0 then
			completeFlag = true;
		end;
	end;
	return completeFlag;
end;
--完成所有的击杀
function CErrantSystem:CompleteKill()
	local completeFlag = false;
	local totalNum = 0;
	for dwMapId, info in pairs(_G.ErrantMonsterConfig) do
		for dwMonsterId, value in pairs(info) do
			totalNum = totalNum + value;
		end;
	end;
	local allStar = GetMonsterStar(self.ErrantInfo);
	if allStar >= totalNum then
		if totalNum ~= 0 then
			completeFlag = true;
		end;
	end;
	return completeFlag;
end;

--根据玩家杀怪星数增加玩家属性
function CErrantSystem:AddProperByStar(info)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	if not skillSystem then
		return;
	end;
	local ErrantProperty = {
		dwHPMax = 0,  --血量max
		dwMPMax = 0,	--内力max
		dwAttack = 0,	--攻击
		dwDefense = 0, --防御
		dwFlee = 0,	--身法
		dwCrit = 0,	--暴击
		dwMoveSpeed = 0,   --移动速度
		dwAttackSpeed = 0,   --攻击速度
	}
	for dwMapId, monsterInfo in pairs(info) do
		for dwMonsterId, star in pairs(monsterInfo) do
			if _G.ErrantShowConfig[dwMapId] and _G.ErrantShowConfig[dwMapId][dwMonsterId] and _G.ErrantShowConfig[dwMapId][dwMonsterId][star] then
				for dwIndex, value in pairs(_G.ErrantShowConfig[dwMapId][dwMonsterId][star]) do
					ErrantProperty[dwIndex] = ErrantProperty[dwIndex] + value;
				end;
			end;
		end;
	end;
	local t_attr = _G.SSingleAttrChange:new();
	if ErrantProperty then
		t_attr.dwHPMax	= ErrantProperty["dwHPMax"] or 0;	   --生命max
		t_attr.dwMPMax	= ErrantProperty["dwMPMax"] or 0;    --内力max
		t_attr.dwAttack	= ErrantProperty["dwAttack"] or 0;   --攻击
		t_attr.dwDefense= ErrantProperty["dwDefense"] or 0;  --防御
		t_attr.dwFlee	= ErrantProperty["dwFlee"] or 0;	   --身法
		t_attr.dwCrit	= ErrantProperty["dwCrit"] or 0;	   --暴击
		t_attr.dwMoveSpeed = ErrantProperty["dwMoveSpeed"] or 0;	--移动速度
		t_attr.dwAttackSpeed = ErrantProperty["dwAttackSpeed"] or 0;	--移动速度
		skillSystem:NotifyErrantUpdate(t_attr);   --更新属性(侠客行)
	end;
end;
--获得物品奖励
function CErrantSystem:GetErrantAward(pos)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self:HasAuthority("XiaKeXing") then
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	if not itemSystem then
		return;
	end;
	local num = GetMonsterStar(self.ErrantInfo);
	local phase = _G.ErrantAwardConfig.ErrantPhase(num);
	if not phase then
		return;
	end;
	if pos > phase then
		return;
	end;
	if not _G.ErrantAwardConfig.EncourageItem[pos] then
		return;
	end;
	if self.GetAwardTbl[pos] then
		return;
	end;
	local itemTbl = _G.ErrantAwardConfig.EncourageItem[pos];
	local addItemList = {};
	local bFlag = false;
	local getFlag = false;
	if itemTbl then
		for _, info in pairs(itemTbl) do
			local tempTable1 = {};		
			tempTable1.dwItemEnum	= info["dwItemEnum"];
			tempTable1.dwItemNumber= info["dwItemNumber"];
			tempTable1.dwBindType	= info["dwBindType"];	
			table.insert(addItemList, tempTable1);
		end;
		
		bFlag = itemSystem:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.Errant);
		if bFlag then
			self.szErrantAward = self.szErrantAward..pos..";";
			self.objDBQuery:UpdateErrantAward(objPlayer:GetRoleID(), self.szErrantAward);
			self.GetAwardTbl[pos] = true;
			getFlag = true;
		end;
		objPlayer.SendErrantAwardMsg{BFlag = getFlag, Phase = pos};
	end;
end;
--广播消息
function CErrantSystem:BroadCastErrant(types, dwMapId, monsterId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CStoneSystem:BroadCastMsg");
		return;
	end;
	--玩家姓名
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--玩家RoleID
	local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
	--全服广播
	CGameApp.ErrantSys_BroadCastMsg{
        PlayerName = s_PlayerName,
        PlayerRoleID = n_PlayerRoleID,
        Type = types,
        MapId = dwMapId,
		MonsterId = monsterId
		};
end;
