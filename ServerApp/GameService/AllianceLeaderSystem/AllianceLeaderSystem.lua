--[[
	盟主系统 GS
	周长沙
--]]
--------------------------------------------------------------
_G.CAllianceLeaderSystem = {}
--------------------------------------------------------------
function CAllianceLeaderSystem:new()
	local obj = CSystem:new("CAllianceLeaderSystem");
	obj.dwType = 0
	for i,v in pairs(CAllianceLeaderSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
function CAllianceLeaderSystem:Create(IsChangeLine)
	local Info = CAllianceLeaderManager:GetAllianceLeaderInfo()
	local objPlayer = self:GetPlayer()
	for k,v in pairs(Info) do
		if v.avatarInfoMsg.szRoleName==objPlayer:GetInfo().szRoleName then
			self:AddValue(k)
		end
	end
end
function CAllianceLeaderSystem:Update(dwInterval)
end
function CAllianceLeaderSystem:Destroy()
end
--客户端进入游戏登入所有场景之后
function CAllianceLeaderSystem:OnEnterScene()
	local objPlayer = self:GetPlayer()
	--CAllianceLeaderManager:OnRecvWarEnd(objPlayer:GetRoleID(),10010)
	if self.dwType == 0 then return end; 
	self:SendEnterMap()
	
	if self.dwType ~= 1 then return end; 
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	sysScript:AddBuff(9638)
	
	CKernelApp.OnGSAllianceLeaderEnterGameMsg{}
	local f = function()
		local objPlayer = objPlayer
		if not objPlayer then return end;
		local sysPlayerShowText = objPlayer:GetSystem("PlayerShowTextSystem");
		if not sysPlayerShowText then return end;
		local Info = {}
		Info.szLoverText 	= sysPlayerShowText.szLoverText
		Info.tbTitle 		= sysPlayerShowText.tbTitle
		Info.tbSp 			= sysPlayerShowText.tbSp
		CKernelApp.GSSendLeaderShowTextMsg{RoleID=objPlayer:GetRoleID();Type=1;Info=Info};
	end
	CDelayerManager:Delay(eDelay._100ms,f)
end;

--切换场景完毕
function CAllianceLeaderSystem:OnChangeSceneEnd()

	if self.dwType == 0 then return end; 
	self:SendEnterMap()
end;
----------------------------------------------------------------
--职位加属性
function CAllianceLeaderSystem:AddValue(dwType)
	self.dwType = dwType
	local SingleAttrChange = SSingleAttrChange:new()
	local PSingleAttrChange = SSingleAttrChange:new()
	local cfg = AllianceLeaderConfig.Attr[dwType]
	local pcfg = AllianceLeaderConfig.PAttr[dwType]
	
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local sysSkill = objPlayer:GetSystem("CSkillSystem")
	
	if not cfg then
		sysSkill:NotifyLeaderUpdate(SingleAttrChange)
		return
	end
	if not pcfg then
		sysSkill:NotifyLeaderUpdate(PSingleAttrChange,true)
		return
	end
	
	for k,v in pairs(cfg) do
		SingleAttrChange[k] = SingleAttrChange[k] + v
	end
	for k,v in pairs(pcfg) do
		PSingleAttrChange[k] = PSingleAttrChange[k] + v
	end
	
	sysSkill:NotifyLeaderUpdate(SingleAttrChange)
	sysSkill:NotifyLeaderUpdate(PSingleAttrChange,true)
	
	local sys = objPlayer:GetSystem("PlayerShowTextSystem")
	sys:SetTitle(szText,AllianceLeaderConfig.Pic[dwType],15)
	
	if dwType == 1 then
		local sysScript = objPlayer:GetSystem("CScriptSystem")
		sysScript:AddBuff(9638)
	end
end
--职位减属性
function CAllianceLeaderSystem:ReduceValue()
	self.dwType = 0
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local sysSkill = objPlayer:GetSystem("CSkillSystem")
	sysSkill:NotifyLeaderUpdate(nil)
	sysSkill:NotifyLeaderUpdate(nil,true)
	local sys = objPlayer:GetSystem("PlayerShowTextSystem")
	sys:DelTitle(15)
	sysScript:DelBuff(9638)
end
----------------------------------------------------------------
--收到Clt请求盟主信息
function CAllianceLeaderSystem:OnAskForAllianceLeader()
	local Info = CAllianceLeaderManager:GetAllianceLeaderInfo()
	self:SendLeaderInfo(Info or {})
end
--收到Clt修改职位消息
function CAllianceLeaderSystem:OnRecvCltSetLeader(dwType,szRoleName)
	if self.dwType ~= 1 then
		return 1
	end
	local objPlayer = self:GetPlayer()
	CKernelApp.OnGSAskForSetAllianceInfoMsg{_aid=objPlayer:GetAccountID(),Type=dwType,RoleName=szRoleName};
	return 0
end
--收到KS修改职位结果
function CAllianceLeaderSystem:OnRecvLeaderSetRes(dwRes)
	self:SendLeaderSetRes(dwRes)
end
--收到KS修改职位消息
function CAllianceLeaderSystem:OnRecvLeaderSet(szName,dwType)
	local dwBefore = self.dwType
	if dwType==0 then
		self:ReduceValue()
	else
		self:AddValue(dwType)
	end
	self:SendLeaderSet(szName,dwType,dwBefore)
	if dwType~=0 then
		self:SendTitleInfo(dwType)
	end
	if dwType==1 then
		local objPlayer = self:GetPlayer()
		local sysScript = objPlayer:GetSystem("CScriptSystem")
		sysScript:AddBuff(9638)
	end
end

function CAllianceLeaderSystem:SendTitleInfo(dwType)
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local sysPlayerShowText = objPlayer:GetSystem("PlayerShowTextSystem");
	if not sysPlayerShowText then return end;
	local Info = {}
	Info.szLoverText 	= sysPlayerShowText.szLoverText
	Info.tbTitle 		= sysPlayerShowText.tbTitle
	Info.tbSp 			= sysPlayerShowText.tbSp
	CKernelApp.GSSendLeaderShowTextMsg{RoleID=objPlayer:GetRoleID();Type=dwType;Info=Info};
end
------------------------------------------------------------------
--发送职位信息
function CAllianceLeaderSystem:SendLeaderInfo(Info)
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	objPlayer.OnRecvLeaderInfoMsg{Info=Info}
end
--发送职位修改结果
function CAllianceLeaderSystem:SendLeaderSetRes(dwRes)
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	objPlayer.OnRecvLeaderSetResMsg{Res=dwRes}
end
--发送职位修改消息
function CAllianceLeaderSystem:SendLeaderSet(szName,dwType,dwBefore)
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	objPlayer.OnRecvLeaderSetMsg{
		Name = szName;
		Type = dwType;
		Before = dwBefore;
	}
end

--发送换地图消息
function CAllianceLeaderSystem:SendEnterMap()
	local objPlayer = self:GetPlayer();
	local szName = objPlayer:GetName()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local map = sysMap:GetCurMap();
	map.AllianceLeaderEnterMap = map.AllianceLeaderEnterMap or {}
	if GetCurTime() - (map.AllianceLeaderEnterMap[szName] or 0) > AllianceLeaderConfig.Delay.ChangeMap then
		map.AllianceLeaderEnterMap[szName] = GetCurTime()
		for k,v in pairs(map:GetAllPlayer()) do
			v.OnAllianceLeaderEnterMapMsg{Name=szName,Type=self.dwType}
		end
	end
end





















