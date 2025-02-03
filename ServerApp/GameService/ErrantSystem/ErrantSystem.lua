--[[
���ܣ�������ϵͳ��
���ߣ���Ө
ʱ�䣺2013-07-09
]]
_G.CErrantSystem = {};
function CErrantSystem:new()
	local obj = CSystem:new("CErrantSystem");
	obj.objDBQuery = nil;    --��Ӧ�����ݿ����ģ
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
--�������
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
--��ʼ���߼�¼����
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

--���������ֺ�
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

--����ɱ����Ϣ
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
--ͬ������ͼɱ����Ϣ
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
--����ɱ����Ϣ
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
--һ�ŵ�ͼ��������
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
--������еĻ�ɱ
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

--�������ɱ�����������������
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
		dwHPMax = 0,  --Ѫ��max
		dwMPMax = 0,	--����max
		dwAttack = 0,	--����
		dwDefense = 0, --����
		dwFlee = 0,	--��
		dwCrit = 0,	--����
		dwMoveSpeed = 0,   --�ƶ��ٶ�
		dwAttackSpeed = 0,   --�����ٶ�
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
		t_attr.dwHPMax	= ErrantProperty["dwHPMax"] or 0;	   --����max
		t_attr.dwMPMax	= ErrantProperty["dwMPMax"] or 0;    --����max
		t_attr.dwAttack	= ErrantProperty["dwAttack"] or 0;   --����
		t_attr.dwDefense= ErrantProperty["dwDefense"] or 0;  --����
		t_attr.dwFlee	= ErrantProperty["dwFlee"] or 0;	   --��
		t_attr.dwCrit	= ErrantProperty["dwCrit"] or 0;	   --����
		t_attr.dwMoveSpeed = ErrantProperty["dwMoveSpeed"] or 0;	--�ƶ��ٶ�
		t_attr.dwAttackSpeed = ErrantProperty["dwAttackSpeed"] or 0;	--�ƶ��ٶ�
		skillSystem:NotifyErrantUpdate(t_attr);   --��������(������)
	end;
end;
--�����Ʒ����
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
--�㲥��Ϣ
function CErrantSystem:BroadCastErrant(types, dwMapId, monsterId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CStoneSystem:BroadCastMsg");
		return;
	end;
	--�������
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--���RoleID
	local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
	--ȫ���㲥
	CGameApp.ErrantSys_BroadCastMsg{
        PlayerName = s_PlayerName,
        PlayerRoleID = n_PlayerRoleID,
        Type = types,
        MapId = dwMapId,
		MonsterId = monsterId
		};
end;
