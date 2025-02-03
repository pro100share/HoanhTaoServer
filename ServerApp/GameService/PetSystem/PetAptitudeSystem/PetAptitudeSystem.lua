--[[
���ܣ���������
���ߣ���Ө
ʱ�䣺2014-01-6
]]
_G.CPetAptitudeSystem = {};
function CPetAptitudeSystem:new(petSystem)
	local obj = {};	
	--���г��������
	obj.petAptitude = {};
	--���г���������������
	obj.petAptitudeUpLimit = {};
	obj.petSys = petSystem
	obj.objDBQuery = nil;    --��Ӧ�����ݿ����ģ
	for i,v in pairs(CPetAptitudeSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
	
end;

function CPetAptitudeSystem:Create(petInfo)
	local objPlayer = self.petSys:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		return false;
	end;
	self.UpLimit = 0;
	self.objDBQuery = CPetAptitudeSystemDB:new(objDB);
	
	--��ȡ����������Ϣ
	local Data = objPlayer:GetLineData("CPetAptitudeSystem")[1]
	if not Data[1] then
		--����ʼ�����������Ϊ0��
		for k,tbInfo in pairs(petInfo)do
			self:InitPetAptitude(tbInfo.dwPetId)
		end
	end;
	
	if Data[1] then
		self.petAptitude = Data[1];
	end;
	return true;
end;

local typeTbl = {
	[1] = "dwMp",
	[2] = "dwAttack",
	[3] = "dwDefense",
	[4] = "dwCrit",
	[5] = "dwFlee",
}

--�����������
function CPetAptitudeSystem:GetExtraUpLimit(dwPetId)
	local objPlayer = self.petSys:GetPlayer();
	if not objPlayer then
		return;
	end
	local petBourn = self.petSys.petBourn;
	local petBournLevel = petBourn:GetLevel(dwPetId);
	if not self.petAptitudeUpLimit[dwPetId] then
		self.petAptitudeUpLimit[dwPetId] = {};
	end;
	for i = 1, 5 do
		local dwAddUpLimit = _G.PetAptitudeConfig.Function.GetAptitudeUpLimit(i, petBournLevel, dwPetId);
		self.petAptitudeUpLimit[dwPetId][typeTbl[i]] = dwAddUpLimit;
		
	end;
end;
----����
function CPetAptitudeSystem:OnChangeLineBegin()
	local objPlayer = self.petSys:GetPlayer();
	if not objPlayer then
		return;
	end
	local Data = {};
	Data[1] = self.petAptitude;
	objPlayer:SetLineData("CPetAptitudeSystem",Data);
end

function CPetAptitudeSystem:OnChangeLineEnd()
	--��������ֵ
	for dwPetId, info in pairs(self.petAptitude) do
		local objData = _G.PetSingleAttr:new(false);
		if info then
			objData.dwMPMax = info["dwMp"] or 0;	   --����max
			objData.dwCrit	= info["dwCrit"] or 0;    --����
			objData.dwAttack	= info["dwAttack"] or 0;   --����
			objData.dwDefense= info["dwDefense"] or 0;  --����
			objData.dwFlee	= info["dwFlee"] or 0;	   --��
			self.petSys:ChangeAdvAttr(dwPetId, "PetAptitude", objData);
		end;
		self:GetExtraUpLimit(dwPetId);
	end;
end;

function CPetAptitudeSystem:OnEnterScene()
	--��������ֵ
	for dwPetId, info in pairs(self.petAptitude) do
		local objData = _G.PetSingleAttr:new(false);
		if info then
			objData.dwMPMax = info["dwMp"] or 0;	   --����max
			objData.dwCrit	= info["dwCrit"] or 0;    --����
			objData.dwAttack	= info["dwAttack"] or 0;   --����
			objData.dwDefense= info["dwDefense"] or 0;  --����
			objData.dwFlee	= info["dwFlee"] or 0;	   --��
			self.petSys:ChangeAdvAttr(dwPetId, "PetAptitude", objData);
		end;
		self:GetExtraUpLimit(dwPetId);
	end;
	self:SendPetAptitudeInfo();
end;

--�ύ������������ʼ���羭��
function CPetAptitudeSystem:InitPetAptitude(dwPetID)
	local objPlayer = self.petSys:GetPlayer();
	if not objPlayer then
		return;
	end
	if not self.petAptitude[dwPetID] then
		self.petAptitude[dwPetID] = {};
		self.petAptitude[dwPetID].dwMp = 0;  --����
		self.petAptitude[dwPetID].dwAttack = 0;--����
		self.petAptitude[dwPetID].dwDefense = 0;--����
		self.petAptitude[dwPetID].dwCrit = 0;--����
		self.petAptitude[dwPetID].dwFlee = 0;--��
	end;
	--����Ϣ
	self:SendPetAptitudeInfo();
	--�������ݿ�
	self.objDBQuery:InsertPetAptitudeInfo(objPlayer:GetRoleID(), dwPetID)
	self:GetExtraUpLimit(dwPetID);
end

--ͬ������������Ϣ
function CPetAptitudeSystem:SendPetAptitudeInfo()
	local objPlayer = self.petSys:GetPlayer();
	if not objPlayer then
		return;
	end
	objPlayer.SendPetAptitudeInfoMsg{PetAptitudeInfo = self.petAptitude};  --ͬ�����������
end

--�ͻ�������ʹ�õ���
function CPetAptitudeSystem:AddPetAptitudeValue(dwType, dwPetId)
	local objPlayer = self.petSys:GetPlayer();
	if not objPlayer then
		return;
	end
	if type(dwType) ~= 'number' then
		return;
	end;
	if dwType < 1 or dwType > 5 then
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local dwPetLevel = self.petSys:GetPetLevel(dwPetId);
	--����ȼ�����
	if dwPetLevel < (_G.PetLevelConfig[dwPetId] or 0) then
		return;
	end;
	if not self.petAptitude[dwPetId] then
		return;
	end;
	local petBourn = self.petSys.petBourn;
	local petBournLevel = petBourn:GetLevel(dwPetId);
	local dwCurValue = self.petAptitude[dwPetId][typeTbl[dwType]]
	--���������������ĵ��ߺ͸���
	local dwEnumId, dwNum = _G.PetAptitudeConfig.Function.GetEnumInfo(dwType, dwCurValue, dwPetId, petBournLevel);
	local b_IsEnough_1, n_Minus_1 = itemSystem:CheckDelEnumItemInPacketCond(dwEnumId, dwNum);
	if not b_IsEnough_1 then
		return;
	end;
	--����Ƿ����
	if not self:CheckAptitudeEnough(dwType, dwPetId) then
		return;
	end;
	--ɾ����Ʒ֪ͨ
	itemSystem:DelEnumItemInPacket(dwEnumId, dwNum, false, _G.ItemSysOperType.PetAptitude);
	self:AddAptitudeValue(dwType, dwPetId, dwAddValue);
end;

function CPetAptitudeSystem:CheckAptitudeEnough(dwType, dwPetId)
	local objPlayer = self.petSys:GetPlayer();
	if not objPlayer then
		return;
	end
	if not self.petAptitudeUpLimit[dwPetId] then
		return;
	end;
	if not self.petAptitude[dwPetId] then
		return;
	end;
	local dwCurValue = self.petAptitude[dwPetId][typeTbl[dwType]] or 0;
	local dwAllValue = (self.petAptitudeUpLimit[dwPetId][typeTbl[dwType]] or 0) + _G.PetAptitudeConfig.BasicInfo[dwType].UpValue;
	return dwCurValue < dwAllValue;
end;

--�Ե���������ֵ
function CPetAptitudeSystem:AddAptitudeValue(dwType, dwPetId, dwAddValue)
	local objPlayer = self.petSys:GetPlayer();
	if not objPlayer then
		return;
	end
	local dwCurValue = self.petAptitude[dwPetId][typeTbl[dwType]]
	local dwCritType = 1;
	if not dwAddValue then
		dwAddValue, dwCritType = _G.PetAptitudeConfig.Function.AddAptitudeValue(dwType, dwCurValue, dwPetId);
	end;
	local dwAllValue = (self.petAptitudeUpLimit[dwPetId][typeTbl[dwType]] or 0) + _G.PetAptitudeConfig.BasicInfo[dwType].UpValue
	if dwAddValue + dwCurValue >= dwAllValue then
		self.petAptitude[dwPetId][typeTbl[dwType]] = dwAllValue;
	else
		self.petAptitude[dwPetId][typeTbl[dwType]] = dwCurValue + dwAddValue;
	end;
	self.objDBQuery:UpdatePetAptitudeInfo(objPlayer:GetRoleID(), dwPetId, typeTbl[dwType], self.petAptitude[dwPetId][typeTbl[dwType]]);
	--��������ֵ
	local objData = _G.PetSingleAttr:new(false);
	local info = self.petAptitude[dwPetId];
	if info then	
		objData.dwMPMax = info["dwMp"] or 0;	   --����max
		objData.dwCrit	= info["dwCrit"] or 0;    --����
		objData.dwAttack	= info["dwAttack"] or 0;   --����
		objData.dwDefense= info["dwDefense"] or 0;  --����
		objData.dwFlee	= info["dwFlee"] or 0;	   --��
		self.petSys:ChangeAdvAttr(dwPetId, "PetAptitude", objData);
	end;
	objPlayer.SendAddAptitudeInfoMsg{DwType = dwType, AddAptitudeValue = dwAddValue, CritType = dwCritType};
end;

--��ó��ﵱǰ����ֵ
function CPetAptitudeSystem:GetPetAptitudeValue(dwPetId)
	if not self.petAptitude[dwPetId] then
		return;
	end;
	return self.petAptitude[dwPetId];
end;