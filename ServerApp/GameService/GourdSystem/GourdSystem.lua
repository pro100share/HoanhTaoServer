--[[
	ʱ�䣺2014-1-2
	���ܣ��ƺ�«ϵͳ��
	���ߣ�κ��
--]]

_G.CGourdSystem = {};

function CGourdSystem:new()
	local obj = CSystem:new("CGourdSystem");
	obj.Resdata = {
		RoleID = 0,         -----���ID
		MendLevel = 0,      -----�����ȼ� �ɼ��������
		CurSkillValue = 0,  -----��ǰ������
		CurItemInfos = {},  -----��ǰ�ύ��Ʒ������Ϣ
		AdornState = 0,     ------���״̬   0 δ���� 1 ����δ��� >1 ���
		AddTimesItemIndex = 0,       ------��������ֵ
	};
	obj.objDBQuery = nil;   ------���ݿ��������
	obj.skillSystem = nil;
	for k,v in pairs(CGourdSystem) do
		if(type(v) == 'function') then
			obj[k] = v;
		end
	end
	return obj;
end

function CGourdSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	local objDB = objPlayer:GetDBQuery()
	if(not objDB) then
		return;
	end
	----�������ݿ����
	self.objDBQuery = CGourdSystemDB:new(objDB,self);
	if(not self.objDBQuery) then
		return;
	end
	self.skillSystem = objPlayer:GetSystem("CSkillSystem");
	if(not self.skillSystem) then
		return;
	end
	-----��ʼ��������Ϣ
	self:InitData()
	--����ǿ��ս
	if bIsChangeLine == 2 then
		local Data = objPlayer:GetLineData("CGourdSystem") or {};
		--local Data = objPlayer:GetCrossSvrData("CGourdSystem") or {};
		if(#Data == 0) then
			return;
		end
		-----���ñ�����Ϣ
		if(#Data[1] > 0) then
			self.Resdata.RoleID = Data[1][1].dwRoleID;
			self.Resdata.MendLevel = Data[1][1].dwMendLevel;
			self.Resdata.AdornState = Data[1][1].dwAdornState;
		end
	else
		-----��ȡ���ݿ���Ϣ
		local Data = objPlayer:GetLineData("CGourdSystem") or {};
		if(#Data == 0) then
			return;
		end
		-----���ñ�����Ϣ
		if(#Data[1] > 0) then
			self.Resdata.RoleID = Data[1][1].dwRoleID;
			self.Resdata.MendLevel = Data[1][1].dwMendLevel;
			self.Resdata.CurSkillValue = Data[1][1].dwCurSkillValue;
			self.Resdata.CurItemInfos = self:LoadStr(Data[1][1].dwCurItemInfos);
			self.Resdata.AdornState = Data[1][1].dwAdornState;
			self.Resdata.AddTimesItemIndex = Data[1][1].dwAddTimesItemIndex;
		end
	end
	-----�����������
	if self:HasAuthority("Gourd") then 
		self:UpdateGourdProperty(self.Resdata.MendLevel);
		if(self.Resdata.AdornState > 1) then
			objPlayer:AddViewModel(self.Resdata.AdornState);
		end
	end;   --�Ƿ���Ȩ�� 
	
end

function CGourdSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	local Data = {};
	Data[1] = {};
	Data[1].dwRoleID = self.Resdata.RoleID;
	Data[1].dwMendLevel = self.Resdata.MendLevel;
	Data[1].dwCurSkillValue = self.Resdata.CurSkillValue;
	Data[1].dwCurItemInfos = self:UpdateStr(self.Resdata.CurItemInfos);
	Data[1].dwAdornState = self.Resdata.AdornState;
	Data[1].dwAddTimesItemIndex = self.Resdata.AddTimesItemIndex;
	--�������ύ����������
	objPlayer:SetLineData("CGourdSystem",Data);
end

-----�����ս��
function CGourdSystem:OnEnterCrossBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end
	local tb = {};
	tb[1] = {};
	tb[1].dwRoleID = self.Resdata.RoleID;
	tb[1].dwMendLevel = self.Resdata.MendLevel;
	tb[1].dwAdornState = self.Resdata.AdornState;
	objPlayer:SetCrossSvrData("CGourdSystem",tb);
end;


function CGourdSystem:Update(dwInterval)
	return true;
end
function CGourdSystem:OnEnterScene()
	if(self.Resdata.AddTimesItemIndex == 0 ) then
		self:RandAddTimes();
		self:SaveDB();
	end
	self:SynchronizeToClient();
end
function CGourdSystem:SynchronizeToClient()
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	---ͬ���ͻ���
	objPlayer.OnSynGourdViewItemInfoMsg{Infos = self:GetFinalViewItemConfig()};
	objPlayer.GourdSynchronizeToClientMsg{Infos = self.Resdata};
end

----��ʼ��������Ϣ
function CGourdSystem:InitData()
	self.Resdata = {
		RoleID = 0,         -----���ID
		MendLevel = 1,      -----�����ȼ� �ɼ��������
		CurSkillValue = 0,  -----��ǰ������
		CurItemInfos = {},  -----��ǰ�ύ��Ʒ������Ϣ
		AdornState = 0,     ------���״̬   0 δ���� 1 ����δ��� >1 ���
		AddTimesItemIndex = 0, ------��������ֵ
	};
	for i = 1,#GourdConfig:GetGourdItemInfo() do
		self.Resdata.CurItemInfos[i] = 0;
	end
end
---�������ݿ���Ϣ
function CGourdSystem:SaveDB()
	if(self.Resdata.RoleID <= 0) then
		self.objDBQuery:InsertGourdInfo();
		self.Resdata.RoleID = self:GetPlayer():GetRoleID();
	else
		self.objDBQuery:UpdateGourdInfo();
	end
end

---�����ַ��� ת��Ϊ table
function CGourdSystem:LoadStr(str)
	if(str == nil) then
		return false;
	end
	local b = {};
	local lastIndex = 0;
	local index = 1;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local value = tonumber(str1);
		b[index] = value;
		index = index + 1;
	end;
	return b;
end

---�����ַ���
function CGourdSystem:UpdateStr(str)
	local strResult = ""
	for i = 1,#str do
		 strResult =  strResult..str[i]..";"
	end
	return strResult
end
----��ȡ������ʾ��Ʒ��Ϣ
function CGourdSystem:GetFinalViewItemConfig()
	if(_G.UpdateGourdConfig and _G.UpdateGourdConfig.bOpen) then
		return _G.UpdateGourdConfig.Info;
	else
		return _G.GourdConfig:GetGourdItemInfo();
	end
end
-----
function CGourdSystem:GetUpLevelBySkillValue(mendValue)
	for i = self.Resdata.MendLevel,#_G.GourdConfig.LevelConfig do
		if(mendValue >= _G.GourdConfig.LevelConfig[i].Exp) then
			mendValue = mendValue - _G.GourdConfig.LevelConfig[i].Exp;
		else
			if(i == #_G.GourdConfig.LevelConfig) then
				mendValue = 0;
			end
			return i,mendValue;
		end
	end
	return #_G.GourdConfig.LevelConfig,0;
end


----�����������
function CGourdSystem:UpdateGourdProperty(level,temp)
	local t_attr = _G.SSingleAttrChange:new();
	local tempInfo = {};
	local tempattr = _G.GourdConfig.LevelConfig[level] or {};
	for k,v in pairs (tempattr) do
		if(t_attr[k]) then
			t_attr[k] = tempattr[k];
		end
	end
	self.skillSystem:NotifyGourd(t_attr); ----���Լӳ�
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	local RoleID = objPlayer:GetRoleID();
	local RoleName = objPlayer:GetName();
	if(temp) then
		CGameApp.GourdBroadCastAddLevelMsg{RoleID = RoleID,RoleName = RoleName,Level = self.Resdata.MendLevel};
	end
	return t_attr;
end
----ÿ�������������
function CGourdSystem:RandAddTimes()
	local dwMax = 0;
	for location,dwProp in pairs(_G.GourdConfig.RandTimeIndexConfig) do
		dwMax = dwMax + dwProp.weightValue
	end
	local dwRes = math.random(1,dwMax)
	local dwCur = 0;
	for location,dwProp in pairs(_G.GourdConfig.RandTimeIndexConfig) do
		dwCur = dwCur + dwProp.weightValue
		if dwRes <= dwCur then
			self.Resdata.AddTimesItemIndex = location;
			break;
		end
	end
end

----��ȡ������
function CGourdSystem:GetAddTimesNum(Index)
	if(_G.GourdConfig.RandTimeIndexConfig[self.Resdata.AddTimesItemIndex].Index == Index) then
		return _G.GourdConfig.RandTimeIndexConfig[self.Resdata.AddTimesItemIndex].Num;
	end
	return 1;
end

----��ȡ��ǰ������
function CGourdSystem:GetCurSkillValue()
	return self.Resdata.CurSkillValue;
end

----��ȡ��ǰ�ȼ�
function CGourdSystem:GetCurMendLevel()
	return self.Resdata.MendLevel;
end
----���Ȩ��
function CGourdSystem:EventGetAuthority(szAuthName)
	if szAuthName == "Gourd" then
		self:UpdateGourdProperty(self.Resdata.MendLevel);
	end
end

