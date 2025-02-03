--打坐和双修系统

_G.CSitSystem = {};
--打坐的标识，0--没有；1--单人；2--双人
CSitSystem.dwSitFlag = 0;
--顿悟标识，0--普通；1--顿悟
CSitSystem.dwSpecialFlag = 0;
--双修的人物ID
CSitSystem.dwPartnerID = 0;
--当前设定的心法ID
CSitSystem.dwCurXinfa = 0;

--打坐的普通每次收益计算
-- local function CountNormalGet(isDouble,isVip,isWife)
	-- local tInfo = 
	-- {
		-- zhenqi = 10,
		-- jingyan = 20,
		-- xinfa = 12,
	-- };
	
	-- return tInfo;
-- end;

-- --打坐的顿悟每次收益计算
-- local function CountSpecialGet(isDouble,isVip,isWife)
	-- local tInfo = 
	-- {
		-- zhenqi = 10,
		-- jingyan = 20,
		-- xinfa = 12,
	-- };
	
	-- return tInfo;
-- end;

function CSitSystem:new()
	local obj = CSystem:new("CSitSystem");
	obj.dwSitFlag = 0;
	obj.dwSpecialFlag = 0;
	obj.dwPartnerID = 0;
	obj.dwCurXinfa = 0;
	--obj.isVip = false;
	
	obj.dwSplPer = 0;			--进入顿悟的概率

	obj.dwNormalGetTime = 0;	--上次获得普通收益的时间
	obj.dwSpecialGetTime = 0;	--上次获得顿悟收益的时间
	
	obj.dwSpecialEnterTime = 0;	--进入顿悟的时间点
	
	---
	for i,v in pairs(CSitSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;

function CSitSystem:Create()
	self.dwSplPer = SitConfig.dwSplPer;
	
	return true;
end;

function CSitSystem:Destroy()
	if self.dwPartnerID ~= 0 then
		local objPart = self:GetPlayer():GetSystem("CMapSystem"):GetRoleByID(self.dwPartnerID);
		if objPart then
			objPart:GetSystem("CSitSystem"):SetSitFlag(1);
			objPart:GetSystem("CSitSystem").dwPartnerID = 0;
		end
		
		self.dwPartnerID = 0;
	end
end;

function CSitSystem:Update()
	-- if self.dwSitFlag == 0 then
		-- return;
	-- end
	
	-- self:TickNormal();
	
	-- if self.dwSpecialFlag ~= 0 then
		-- self:TickSpecial();
	-- end
end;

function CSitSystem:OnEnterScene()
	
end;

---------------------------------------------------------------------------------------------------------------------------------
--
function CSitSystem:SetSitFlag(dwFlag)
	if dwFlag ~= 0 then
		self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventSit,1);
		
		self.dwNormalGetTime = _now();
		--self:GetPlayer():GetSystem("CItemSystem"):OffHorse();
		--如果是坐下，就要改变当前状态
		self:GetPlayer():GetSystem("CStateSystem"):ChangeState(enPlayerState.ePS_Sit);
		
		-- if dwFlag == 2 then
			-- self:GetPlayer().OnDoubleParternMsg{RoleID = self.dwPartnerID};
			
			-- self:GetPlayer():GetSystem("CSkillSystem"):BroadcastSkillMsg(false,"SendPlayerState",
				-- self:GetPlayer():GetRoleID(),enPlayerState.ePS_Sit,2);
		-- else
			-- self:GetPlayer().OnDoubleParternMsg{RoleID = 0};
			
			-- self:GetPlayer():GetSystem("CSkillSystem"):BroadcastSkillMsg(false,"SendPlayerState",
				-- self:GetPlayer():GetRoleID(),enPlayerState.ePS_Sit,1);
		-- end
	else
		-- --取消打坐的处理
		-- if self.dwPartnerID ~= 0 then
			-- local objPart = self:GetPlayer():GetSystem("CMapSystem"):GetRoleByID(self.dwPartnerID);
			-- if objPart then
				-- objPart:GetSystem("CSitSystem"):SetSitFlag(1);
				-- objPart:GetSystem("CSitSystem").dwPartnerID = 0;
			-- end
			
			-- self.dwPartnerID = 0;
		-- end
		
		-- if self.dwSpecialFlag ~= 0 then
			-- self:SetSplFlag(0);
		-- end
		
		-- self:GetPlayer():GetSystem("CSkillSystem"):BroadcastSkillMsg(false,"SendPlayerState",
			-- self:GetPlayer():GetRoleID(),enPlayerState.ePS_Sit,0);
	end
	
	self.dwSitFlag = dwFlag;
	-- print("CSitSystem:SetSitFlag",dwFlag)
	self:GetPlayer().OnChangeSitFlagMsg{Code = dwFlag};
end;

-- function CSitSystem:SetVip(isVip)
	-- self.isVip = isVip;
-- end;

function CSitSystem:SetSplFlag(dwFlag)
	-- self.dwSpecialFlag = dwFlag;
	
	-- local objSelf = self:GetPlayer();
	
	-- if dwFlag == 1 then
		-- self.dwSpecialEnterTime = _now();
		
		-- objSelf:GetSystem("CSkillSystem"):BroadcastSkillMsg(true,"SendPlayPfx",90011,"FeetPoint",objSelf:GetRoleID(),0,0,0);
	-- else
		-- objSelf:GetSystem("CSkillSystem"):BroadcastSkillMsg(true,"SendStopPfx",90011,objSelf:GetRoleID());
	-- end
	
	-- objSelf.OnChangeSpecialFlagMsg{Code = dwFlag};
end;

function CSitSystem:TickNormal()
	local dwNowTime = _now();
	
	local dwDis = dwNowTime - self.dwNormalGetTime;
	if self.dwSitFlag == 1 then
		if dwDis < SitConfig.dwNorTick then
			return;
		end
	elseif self.dwSitFlag == 2 then
		if dwDis < SitConfig.dwDoubleTick then
			return;
		end
	else
		return;
	end
	self:NormalGet();
	
	--顿悟的随机
	local dwRandom = math.random(10000);
	if self.dwSpecialFlag == 0 then
		if dwRandom > self.dwSplPer then
			self.dwSplPer = self.dwSplPer + 100;
		else
			self:SetSplFlag(1);
			self.dwSplPer = SitConfig.dwSplPer;
		end
	end
	
	--print("CSitSystem:TickNormal",self.dwSpecialFlag,dwRandom,self.dwSplPer)
	
	self.dwNormalGetTime = dwNowTime;
end;

function CSitSystem:TickSpecial()
	local dwNowTime = _now();
	
	if dwNowTime - self.dwSpecialEnterTime > SitConfig.dwSplLength then
		self:SetSplFlag(0);
		return;
	end;
	
	if dwNowTime - self.dwSpecialGetTime < SitConfig.dwSplTick then
		return;
	end
	self:SpecialGet();
	
	self.dwSpecialGetTime = dwNowTime;
end;

--正常收益
function CSitSystem:NormalGet()
	-- local objSelf = self:GetPlayer();
	-- local fPer = objSelf:GetAddicted();
	
	-- local objSklSystem = objSelf:GetSystem("CSkillSystem");
	-- local dwSitUp = objSklSystem:GetInfo().dwSitUp;
	-- local dwMarriageID = -1;
	-- if self.dwSitFlag==2 then
		-- dwMarriageID = objSelf:GetSystem("CMarriageSystem"):GetMateRoleID();
	-- end
	
	-- local isVip = objSelf:GetSystem("CVipSystem"):isVip();
	-- local tInfo = SitConfig:CountNormalGet(objSelf,self.dwCurXinfa,self.dwSitFlag==2,isVip,dwMarriageID==self.dwPartnerID);
	
	-- local five = objSelf:GetSystem("CFiveElemSystem");
	
	-- tInfo.zhenqi_G = tInfo.zhenqi_G * (1 + dwSitUp);
	-- tInfo.zhenqi_G = math.floor(tInfo.zhenqi_G * fPer);
	-- if not five:ChangeAttr('dwMetalValue',tInfo.zhenqi_G) then
		-- tInfo.zhenqi_G = 0;
	-- end
	
	-- tInfo.zhenqi_M = tInfo.zhenqi_M * (1 + dwSitUp);
	-- tInfo.zhenqi_M = math.floor(tInfo.zhenqi_M * fPer);
	-- if not five:ChangeAttr('dwWoodValue',tInfo.zhenqi_M) then
		-- tInfo.zhenqi_M = 0;
	-- end
	
	-- tInfo.zhenqi_S = tInfo.zhenqi_S * (1 + dwSitUp);
	-- tInfo.zhenqi_S = math.floor(tInfo.zhenqi_S * fPer);
	-- if not five:ChangeAttr('dwWaterValue',tInfo.zhenqi_S) then
		-- tInfo.zhenqi_S = 0;
	-- end
	
	-- tInfo.zhenqi_H = tInfo.zhenqi_H * (1 + dwSitUp);
	-- tInfo.zhenqi_H = math.floor(tInfo.zhenqi_H * fPer);
	-- if not five:ChangeAttr('dwFireValue',tInfo.zhenqi_H) then
		-- tInfo.zhenqi_H = 0;
	-- end
	
	-- tInfo.zhenqi_T = tInfo.zhenqi_T * (1 + dwSitUp);
	-- tInfo.zhenqi_T = math.floor(tInfo.zhenqi_T * fPer);
	-- if not five:ChangeAttr('dwEarthValue',tInfo.zhenqi_T) then
		-- tInfo.zhenqi_T = 0;
	-- end
	
	-- --self:GetPlayer().ElemChangeNoticeMsg{Value = tInfo.zhenqi};
	-- tInfo.jingyan = tInfo.jingyan * (1 + dwSitUp);
	-- tInfo.jingyan = math.floor(tInfo.jingyan * fPer);
	-- self:GetPlayer():AddExp(tInfo.jingyan);
	
	-- local sRoleSkill = objSklSystem.setAllSkill[self.dwCurXinfa];
	
	-- if sRoleSkill then
		-- tInfo.xinfa = tInfo.xinfa * (1 + dwSitUp);
		-- tInfo.xinfa = sRoleSkill:AddSkillKnowValue(tInfo.xinfa);
		-- tInfo.dwCurSkill = self.dwCurXinfa;
	-- end
	
	-- objSelf.OnSitHarvestMsg{Rsl = tInfo};
end;

--顿悟收益
function CSitSystem:SpecialGet()
	local objSelf = self:GetPlayer();
	local fPer = objSelf:GetAddicted();
	
	local isVip = objSelf:GetSystem("CVipSystem"):isVip();
	local tInfo = SitConfig:CountSpecialGet(objSelf,self.dwCurXinfa,self.dwSitFlag==2,isVipisVip,false);
	
	local sysSkill = objSelf:GetSystem("CSkillSystem");
	local dwSitUp = sysSkill:GetInfo().dwSitUp;
	local five = objSelf:GetSystem("CFiveElemSystem");
	
	tInfo.zhenqi_G = tInfo.zhenqi_G * (1 + dwSitUp);
	tInfo.zhenqi_G = math.floor(tInfo.zhenqi_G * fPer);
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = five:GetElemValue()	

	if not five:ChangeAttr('dwMetalValue',tInfo.zhenqi_G) then
		tInfo.zhenqi_G = 0;
	end
	
	tInfo.zhenqi_M = tInfo.zhenqi_M * (1 + dwSitUp);
	tInfo.zhenqi_M = math.floor(tInfo.zhenqi_M * fPer);
	if not five:ChangeAttr('dwWoodValue',tInfo.zhenqi_M) then
		tInfo.zhenqi_M = 0;
	end
	
	tInfo.zhenqi_S = tInfo.zhenqi_S * (1 + dwSitUp);
	tInfo.zhenqi_S = math.floor(tInfo.zhenqi_S * fPer);
	if not five:ChangeAttr('dwWaterValue',tInfo.zhenqi_S) then
		tInfo.zhenqi_S = 0;
	end
	
	tInfo.zhenqi_H = tInfo.zhenqi_H * (1 + dwSitUp);
	tInfo.zhenqi_H = math.floor(tInfo.zhenqi_H * fPer);
	if not five:ChangeAttr('dwFireValue',tInfo.zhenqi_H) then
		tInfo.zhenqi_H = 0;
	end
	
	tInfo.zhenqi_T = tInfo.zhenqi_T * (1 + dwSitUp);
	tInfo.zhenqi_T = math.floor(tInfo.zhenqi_T * fPer);
	if not five:ChangeAttr('dwEarthValue',tInfo.zhenqi_T) then
		tInfo.zhenqi_T = 0;
	end
	local setData = {
		[1] = {dwCurrent = uItemGold, dwChange = tInfo.zhenqi_G};
		[2] = {dwCurrent = uItemWood, dwChange = tInfo.zhenqi_M};
		[3] = {dwCurrent = uItemWater, dwChange = tInfo.zhenqi_S};
		[4] = {dwCurrent = uItemFire, dwChange = tInfo.zhenqi_H};
		[5] = {dwCurrent = uItemEarth, dwChange = tInfo.zhenqi_T};
	}
	CLogSystemManager:zhenqi(objSelf, setData, _G.FiveElemSysOperType.SitSystem)	
	
	tInfo.jingyan = tInfo.jingyan * (1 + dwSitUp);
	tInfo.jingyan = math.floor(tInfo.jingyan * fPer);
	self:GetPlayer():AddExp(tInfo.jingyan);
	
	local sRoleSkill = nil;
	if sysSkill and type(sysSkill.setAllSkill)=="table"then
		sRoleSkill = sysSkill.setAllSkill[self.dwCurXinfa];
	end
	
	if sRoleSkill then
		tInfo.xinfa = tInfo.xinfa * (1 + dwSitUp);
		sRoleSkill:AddSkillKnowValue(tInfo.xinfa);
	end
	
	objSelf.OnSitHarvestMsg{Rsl = tInfo};
end;

--开始双修
function CSitSystem:StartDouble(objRole)
	local objRoleSit = objRole:GetSystem("CSitSystem");
	
	if objRoleSit.dwSitFlag ~= 1 then
		self:GetPlayer().OnServerNoticeMsg{WordID = 3000410001};
		return;
	end
	
	self.dwPartnerID = objRole:GetRoleID();
	objRoleSit.dwPartnerID = self:GetPlayer():GetRoleID();
	
	self:SetSitFlag(2);
	objRoleSit:SetSitFlag(2);
	
	objRole:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventDoubleMonk,1);
	self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventDoubleMonk,1);
	
	--判断对方和自己的关系，不同的关系有加成
	
	--广播双修
	-- local objSkillSystem = self:GetPlayer():GetSystem("CSkillSystem");
	-- objSkillSystem:BroadcastSkillMsg(false,"SendPlayerState",self:GetPlayer():GetRoleID(),enPlayerState.ePS_Sit,2);
end;

---------------------------------------------------------------------------------------------------------------------------------
--寻找身边打坐的人
function CSitSystem:OnSearchPlayer()
	local objSelf = self:GetPlayer();
	local tList = objSelf:GetSystem("CMapSystem"):GetPlayerByRange(20);
	
	local tRsl = {};
	for id,obj in pairs(tList)do
		if id ~= objSelf:GetRoleID() then
			local dwState = obj:GetSystem("CSitSystem").dwSitFlag;
			
			if dwState == 1 then
				local objInfo = {};
				objInfo.dwRoleID = id;
				objInfo.szRoleName = obj.sRoleInfo.szRoleName;
				objInfo.dwLevel = obj:GetLevel();
				objInfo.dwProf = obj.sRoleInfo.dwProf;
				
				table.insert(tRsl,objInfo);
			end
		end
	end
	--print("CSitSystem:OnSearchPlayer")
	objSelf.OnPlayerSitListMsg{PlayerList = tRsl};
end;

--A申请和B双修
function CSitSystem:OnRequestDouble(dwRoleID)
	local objSelf = self:GetPlayer();
	local mapSystem = objSelf:GetSystem("CMapSystem");
	
	local objRole = objSelf:GetOtherPlayer(dwRoleID,3);
	
	local dwCode = 5;
	if objRole then
		--检查B当前的打坐状态
		local dwRoleFlag = objRole:GetSystem("CSitSystem").dwSitFlag;
		
		if dwRoleFlag == 1 then
			--self:GetPlayer().OnDoubleSitResutlMsg{RoleID = dwRoleID,Code = 1};
			local objOtherMapSys = objRole:GetSystem("CMapSystem");
			if objOtherMapSys.dwCurMapID == mapSystem.dwCurMapID then
				local vecOtherPos = objOtherMapSys:GetPlayerPos();
				local vecSelfPos = mapSystem:GetPlayerPos();
				
				local dwLength = math.sqrt((vecOtherPos.x-vecSelfPos.x)^2 + (vecOtherPos.y-vecSelfPos.y)^2);
				
				if dwLength > 10 then
					dwCode = 4;
				else
					dwCode = 1;
				end
			else
				dwCode = 7;
			end
		elseif dwRoleFlag == 2 then
			--self:GetPlayer().OnDoubleSitResutlMsg{RoleID = dwRoleID,Code = 3};
			dwCode = 2;
		elseif dwRoleFlag == 0 then
			--objRole.DoubleSitInvite{RoleID = self:GetPlayer():GetRoleID()};
			dwCode = 2;
		end
	else
		dwCode = 6;
	end
	self:GetPlayer().OnDoubleSitResutlMsg{RoleID = dwRoleID,Code = dwCode};
end;

--B对A的双修请求的答复
function CSitSystem:OnResultDouble(dwRoleID,dwResultCode)
	local mapSystem = self:GetPlayer():GetSystem("CMapSystem");
	
	local objRole = mapSystem:GetRoleByID(dwRoleID);
	
	if dwResultCode == 0 then
		objRole.OnDoubleSitResutlMsg{RoleID = self:GetPlayer():GetRoleID(),Code = 2};
	elseif dwResultCode == 1 then
		objRole.OnDoubleSitResutlMsg{RoleID = self:GetPlayer():GetRoleID(),Code = 1};
		--self:StartDouble(objRole);
	end
end;

--设置心法
function CSitSystem:OnSetXinfa(dwSkillID)
	self.dwCurXinfa = dwSkillID;
end;

--申请打坐/站起
function CSitSystem:OnChangeSit(dwSitCode)
	--如果判断到当前是骑乘状态，禁止玩家打坐---周兴团 -3-28
	-- local itemSys = self:GetPlayer():GetSystem("CItemSystem");
	-- if itemSys:IsOnHorse() then
		-- --itemSys:OnError();--骑乘状态无法进入打坐
		-- return;
	-- end
	local stateSystem = self:GetPlayer():GetSystem("CStateSystem");
	
	if dwSitCode == 1 then
		stateSystem:CheckPlayerAction(enPlayerAction.ePA_Sit);
	else
		stateSystem:CheckPlayerAction(enPlayerAction.ePA_Stand);
	end
end;

function CSitSystem:OnDoubleReady(dwRoleID)
	local mapSystem = self:GetPlayer():GetSystem("CMapSystem");
	local objRole = mapSystem:GetRoleByID(dwRoleID);
	
	local objMountSys = self:GetPlayer():GetSystem("CMountSystem");
	if objMountSys:GetState() then
		return;
	end
	
	local objRoleMountSys = objRole:GetSystem("CMountSystem");
	if objRoleMountSys:GetState() then
		return;
	end
	
	self:StartDouble(objRole);
end;

