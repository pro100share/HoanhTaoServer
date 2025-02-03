--[[
	����ѫ��
���ߣ���Ө
ʱ�䣺2013-07-30
]]
_G.CErrantHonorSystem = {};
function CErrantHonorSystem:new()
	local obj = CSystem:new("CErrantHonorSystem");
	obj.objDBQuery = nil;    --��Ӧ�����ݿ����ģ
	for i,v in pairs(CErrantHonorSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

function CErrantHonorSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		return false;
	end;
	self.objDBQuery = CErrantHonorSystemDB:new(objDB, self);
	self.dwErrantLevel = 0; 
	self.dwErrantStar = 0;
	self.dwErrantValue = 0;
	local info = objPlayer:GetLineData("CErrantHonorSystem")[1];
	if info then	
		self:SetErrantHonorInfo(info[1]);
	end;
	return true;
end;

--�������н׶�
function CErrantHonorSystem:SetErrantHonorInfo(info)	
	self.dwErrantLevel = info.dwErrantLevel; 
	self.dwErrantStar = info.dwErrantStar; 
	self.dwErrantValue = info.dwErrantValue; 
	if not self:HasAuthority("XiaYiXunZhang") then
		return;
	end;
	self:AppendBasicProperty();
end;
--������Ϸͬ����Ϣ
function CErrantHonorSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self:HasAuthority("XiaYiXunZhang") then
		return;
	end;
	local Info = {};
	Info[1] = self.dwErrantLevel;
	Info[2] = self.dwErrantStar;
	objPlayer.OnLoadErrantHonorAllMsg{Info = Info, ErrantNum = self.dwErrantValue, BFlag = true};
end;

function CErrantHonorSystem:EventGetAuthority(szAuthName)
	if szAuthName == "XiaYiXunZhang" then
		local objPlayer = self:GetPlayer();
		if not objPlayer then
			return;
		end;
		self:AppendBasicProperty();
		local Info = {};
		Info[1] = self.dwErrantLevel;
		Info[2] = self.dwErrantStar;
		objPlayer.OnLoadErrantHonorAllMsg{Info = Info, ErrantNum = self.dwErrantValue, BFlag = true};
	end
end;

function CErrantHonorSystem:Destroy()
	
end;

function CErrantHonorSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local info = {};
	info.dwErrantLevel = self.dwErrantLevel;
	info.dwErrantStar = self.dwErrantStar;
	info.dwErrantValue = self.dwErrantValue;
	local tbl = {};
	table.insert(tbl, info);
	objPlayer:SetLineData("CErrantHonorSystem",tbl);
end;
--���ӻ�������
function CErrantHonorSystem:AppendBasicProperty()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local Info = {}
	Info[1] = self.dwErrantLevel;
	Info[2] = self.dwErrantStar;
	local basicProperty = ErrantHonorConfig:GetAttrByLevel(Info);
	local appendProperty = ErrantHonorConfig:GetAppendAttr(Info)
	local ErrantProperty = {
		dwHPMax = 0,  --Ѫ��max
		dwMPMax = 0,	--����max
		dwAttack = 0,	--����
		dwDefense = 0, --����
		dwFlee = 0,	--��
		dwCrit = 0,	--����
		dwMoveSpeed = 0,   --�ƶ��ٶ�
		dwAttackSpeed = 0,   --�����ٶ�
		dwCritDown = 0,
	}
	local skillSystem = objPlayer:GetSystem("CSkillSystem");

	for index, value in pairs(basicProperty) do
		if ErrantProperty[index] then
			ErrantProperty[index] = ErrantProperty[index] + value;
		end;
	end;
	for index, value in pairs(appendProperty) do
		if ErrantProperty[index] then
			ErrantProperty[index] = ErrantProperty[index] + value;
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
		t_attr.dwCritDown = ErrantProperty["dwCritDown"] or 0;	--�����ֿ�
		skillSystem:NotifyErrantHonorProperty(t_attr);
	end;
end;
--��������ѫ�µȼ�
function CErrantHonorSystem:SetErrantLevel(dwLevel)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not _G.ErrantHonorConfig.Honor[dwLevel] then
		return;
	end;
	self.dwErrantLevel = dwLevel;
	self.dwErrantStar = 1;
	if self.dwErrantLevel >= _G.ErrantHonorLevel then
		self:BroadCastErrantHonor();
	end;	
	self:AppendBasicProperty();
	local info = {};
	info[1] = self.dwErrantLevel;
	info[2] = self.dwErrantStar;
	self.objDBQuery:UpdateErrantHonorInfo(objPlayer:GetRoleID(), self.dwErrantLevel, self.dwErrantStar);
	objPlayer.OnLoadErrantHonorAllMsg{Info = info, ErrantNum = self.dwErrantValue, BFlag = false};
end;

--��������ѫ��
function CErrantHonorSystem:UpErrantHonor()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local info = {};
	info[1] = self.dwErrantLevel;
	info[2] = self.dwErrantStar;
	--����Ƿ�Ϊ��ߵȼ�,�Ǽ�
	if not _G.ErrantHonorConfig.Honor[self.dwErrantLevel + 1] then
		if self.dwErrantStar >= _G.ErrantHonorConfig.Honor[self.dwErrantLevel].StarNum then
			objPlayer.OnLoadErrantHonorAllMsg{Info = info, ErrantNum = self.dwErrantValue, BFlag = false};
			return;
		end;
	end;
	--�������ֵ�Ƿ�����
	if self.dwErrantValue < ErrantHonorConfig:GetConByLevel(info) then
		objPlayer.OnLoadErrantHonorAllMsg{Info = info, ErrantNum = self.dwErrantValue, BFlag = false};
		return;
	end;
	self:DecErrantHonorValue(ErrantHonorConfig:GetConByLevel(info));
	--���Ǽ��ɹ�
	if ErrantHonorConfig:UpErrantRate(info) == 1 then
		--�Ǽ���������
		if self.dwErrantStar < _G.ErrantHonorConfig.Honor[self.dwErrantLevel].StarNum then
			self.dwErrantStar = self.dwErrantStar + 1;
		elseif self.dwErrantStar >= _G.ErrantHonorConfig.Honor[self.dwErrantLevel].StarNum then 
			if _G.ErrantHonorConfig.Honor[self.dwErrantLevel + 1] then
				self.dwErrantLevel = self.dwErrantLevel + 1;
				self.dwErrantStar = 1;
				if self.dwErrantLevel >= _G.ErrantHonorLevel then
					self:BroadCastErrantHonor();
				end;			
			end;
		end;
		self:AppendBasicProperty();
		info[1] = self.dwErrantLevel;
		info[2] = self.dwErrantStar;
		self.objDBQuery:UpdateErrantHonorInfo(objPlayer:GetRoleID(), self.dwErrantLevel, self.dwErrantStar);
		objPlayer.OnLoadErrantHonorAllMsg{Info = info, ErrantNum = self.dwErrantValue, BFlag = false};
		return;
	end;
	objPlayer.OnLoadErrantHonorAllMsg{Info = info, ErrantNum = self.dwErrantValue, BFlag = false};
end;
--�㲥��Ϣ
function CErrantHonorSystem:BroadCastErrantHonor()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CErrantHonorSystem:BroadCastErrantHonor");
		return;
	end;
	--�������
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--���RoleID
	local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
	local info = {};
	info[1] = self.dwErrantLevel;
	info[2] = self.dwErrantStar;
	--ȫ���㲥
	CGameApp.ErrantHonorSys_BroadCastMsg{
        PlayerName = s_PlayerName,
        PlayerRoleID = n_PlayerRoleID,
		Info = info,
		};
end;

function CErrantHonorSystem:GetErrantHonorValue()
	return self.dwErrantValue;
end;
--��������ֵ
function CErrantHonorSystem:AddErrantHonorValue(dwValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self:HasAuthority("XiaYiXunZhang") then
		return;
	end;
	self.dwErrantValue = self.dwErrantValue + dwValue;
	self.objDBQuery:SetErrantValue(objPlayer:GetRoleID(), self.dwErrantValue);
	objPlayer.SendErrantHonorValueMsg{ErrantNum = self.dwErrantValue}
end;
--������ֵ
function CErrantHonorSystem:DecErrantHonorValue(dwValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self:HasAuthority("XiaYiXunZhang") then
		return;
	end;
	self.dwErrantValue = self.dwErrantValue - dwValue;
	if self.dwErrantValue < 0 then
		self.dwErrantValue = 0;
	end;
	self.objDBQuery:SetErrantValue(objPlayer:GetRoleID(), self.dwErrantValue);
	objPlayer.SendErrantHonorValueMsg{ErrantNum = self.dwErrantValue}
end;

--�鿴�Է�������ѫ��
function CErrantHonorSystem:ViewOtherErrantHonor(fromRoleID)
	local objPlayer = self:GetPlayer(); 
	if not objPlayer then
		return;
	end;
	_G.GSRemoteCall(fromRoleID, "CErrantHonorSystem", "BeViewErrantHonorInfo", {objPlayer:GetRoleID()}, nil);
end;

function CErrantHonorSystem:BeViewErrantHonorInfo(dwRoleId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_G.GSRemoteCall(dwRoleId, "CErrantHonorSystem", "ViewErrantHonorResult", {false, 0, 0, 0}, nil);
		return;
	end;
	if not self:HasAuthority("XiaYiXunZhang") then
		_G.GSRemoteCall(dwRoleId, "CErrantHonorSystem", "ViewErrantHonorResult", {false, 0, 0, 0}, nil);
		return;
	end;
	_G.GSRemoteCall(dwRoleId, 
		"CErrantHonorSystem", 
		"ViewErrantHonorResult", 
		{true, 
			self.dwErrantLevel, 
			self.dwErrantStar,
			-- ���貨���
			self:GetPlayer():GetSystem("CKungFuExtendSystem"):
				GetCount(KungFuEnum.ErrantHonor)}, 
		nil);
end;

--���ز鿴���
function CErrantHonorSystem:ViewErrantHonorResult(isOK, dwLevel, dwStar, nCount)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CErrantHonorSystem:ViewErrantHonorResult");
		return;
	end;
	objPlayer.ReturnErrantHonorResMsg{IsOK = isOK, 
		CurActiveLevel = dwLevel, 
		CurStar = dwStar,
		-- ���貨���
		nCount = nCount};
end;
--��ý���
function CErrantHonorSystem:GetErrantLevel()
	return (self.dwErrantLevel - 1 )* 9 + self.dwErrantStar
end;
