--[[
	侠义勋章
作者：曲莹
时间：2013-07-30
]]
_G.CErrantHonorSystem = {};
function CErrantHonorSystem:new()
	local obj = CSystem:new("CErrantHonorSystem");
	obj.objDBQuery = nil;    --对应的数据库操作模
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

--解析修行阶段
function CErrantHonorSystem:SetErrantHonorInfo(info)	
	self.dwErrantLevel = info.dwErrantLevel; 
	self.dwErrantStar = info.dwErrantStar; 
	self.dwErrantValue = info.dwErrantValue; 
	if not self:HasAuthority("XiaYiXunZhang") then
		return;
	end;
	self:AppendBasicProperty();
end;
--进入游戏同步消息
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
--增加基本属性
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
		dwHPMax = 0,  --血量max
		dwMPMax = 0,	--内力max
		dwAttack = 0,	--攻击
		dwDefense = 0, --防御
		dwFlee = 0,	--身法
		dwCrit = 0,	--暴击
		dwMoveSpeed = 0,   --移动速度
		dwAttackSpeed = 0,   --攻击速度
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
		t_attr.dwHPMax	= ErrantProperty["dwHPMax"] or 0;	   --生命max
		t_attr.dwMPMax	= ErrantProperty["dwMPMax"] or 0;    --内力max
		t_attr.dwAttack	= ErrantProperty["dwAttack"] or 0;   --攻击
		t_attr.dwDefense= ErrantProperty["dwDefense"] or 0;  --防御
		t_attr.dwFlee	= ErrantProperty["dwFlee"] or 0;	   --身法
		t_attr.dwCrit	= ErrantProperty["dwCrit"] or 0;	   --暴击
		t_attr.dwMoveSpeed = ErrantProperty["dwMoveSpeed"] or 0;	--移动速度
		t_attr.dwAttackSpeed = ErrantProperty["dwAttackSpeed"] or 0;	--移动速度
		t_attr.dwCritDown = ErrantProperty["dwCritDown"] or 0;	--暴击抵抗
		skillSystem:NotifyErrantHonorProperty(t_attr);
	end;
end;
--设置侠义勋章等级
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

--升级侠义勋章
function CErrantHonorSystem:UpErrantHonor()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local info = {};
	info[1] = self.dwErrantLevel;
	info[2] = self.dwErrantStar;
	--检测是否为最高等级,星级
	if not _G.ErrantHonorConfig.Honor[self.dwErrantLevel + 1] then
		if self.dwErrantStar >= _G.ErrantHonorConfig.Honor[self.dwErrantLevel].StarNum then
			objPlayer.OnLoadErrantHonorAllMsg{Info = info, ErrantNum = self.dwErrantValue, BFlag = false};
			return;
		end;
	end;
	--检测侠义值是否满足
	if self.dwErrantValue < ErrantHonorConfig:GetConByLevel(info) then
		objPlayer.OnLoadErrantHonorAllMsg{Info = info, ErrantNum = self.dwErrantValue, BFlag = false};
		return;
	end;
	self:DecErrantHonorValue(ErrantHonorConfig:GetConByLevel(info));
	--升星级成功
	if ErrantHonorConfig:UpErrantRate(info) == 1 then
		--星级不满加星
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
--广播消息
function CErrantHonorSystem:BroadCastErrantHonor()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CErrantHonorSystem:BroadCastErrantHonor");
		return;
	end;
	--玩家姓名
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--玩家RoleID
	local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
	local info = {};
	info[1] = self.dwErrantLevel;
	info[2] = self.dwErrantStar;
	--全服广播
	CGameApp.ErrantHonorSys_BroadCastMsg{
        PlayerName = s_PlayerName,
        PlayerRoleID = n_PlayerRoleID,
		Info = info,
		};
end;

function CErrantHonorSystem:GetErrantHonorValue()
	return self.dwErrantValue;
end;
--增加侠义值
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
--减侠义值
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

--查看对方的侠义勋章
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
			-- 王凌波添加
			self:GetPlayer():GetSystem("CKungFuExtendSystem"):
				GetCount(KungFuEnum.ErrantHonor)}, 
		nil);
end;

--返回查看结果
function CErrantHonorSystem:ViewErrantHonorResult(isOK, dwLevel, dwStar, nCount)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CErrantHonorSystem:ViewErrantHonorResult");
		return;
	end;
	objPlayer.ReturnErrantHonorResMsg{IsOK = isOK, 
		CurActiveLevel = dwLevel, 
		CurStar = dwStar,
		-- 王凌波添加
		nCount = nCount};
end;
--获得阶数
function CErrantHonorSystem:GetErrantLevel()
	return (self.dwErrantLevel - 1 )* 9 + self.dwErrantStar
end;
