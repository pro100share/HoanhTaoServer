--演武系统，玩家部件



_G.CMartialSystem = {};

function CMartialSystem:new()
	local obj = CSystem:new("CMartialSystem");
	
	obj.dwCurMartialID = 0;
	
	---
	for i,v in pairs(CMartialSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CMartialSystem:Create()
	self.dwCurMartialID = 0;
	self.dwCurSkillID = 0;
	self.dwSplFlag = 0;
	
	self.dwNormalGetTime = 0;
	self.dwSpecialGetTime = 0;
	
	self.dwSpecialCheckTime = 0;
	self.dwSpecialTick = 0;
	
	self.dwSpecialEnterTime = 0;
	self.dwSpecialLength = 0;
	
	self.dwSplPerValue = 0;
	
	self.dwBeginTime = 0;
	
	self.dwNorTick = 0;
	self.dwSpecialTick = 0;
	
	local objSelf = self:GetPlayer();
	if not objSelf then
		return false;
	end;
	local objDB = objSelf:GetDBQuery();
	self.objDBQuery = CMartialSystemDB:new(objDB,self);
	if not self.objDBQuery then
		return false;
	end;

	--读取信息
	-- local Data = objSelf:GetLineData("CMartialSystem")[1];
	
	--self.dwCurSkillID = Data[1];
	
	return true;
end;

function CMartialSystem:Update()
	if self.dwCurMartialID == 0 then
		return;
	end
	
	local objStateSys = self:GetPlayer():GetSystem("CStateSystem");
	if not objStateSys then
		return;
	end
	if objStateSys.dwCurState ~= enPlayerState.ePS_Martial then
		self:LeaveCurMartial();
		return;
	end
	
	local dwNowTime = GetCurTime();
	
	self:OnNormalTick(dwNowTime);
	
	self:OnSpecialCheck(dwNowTime);
	
	if self.dwSplFlag == 1 then
		self:OnSpecialTick(dwNowTime);
	end;
	
	return true;
end;

function CMartialSystem:Destroy()
	self:LeaveCurMartial();
end;

function CMartialSystem:OnEnterScene()
	self:SendMartialToMe();
	
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	local objItemSys = objSelf:GetSystem("CItemSystem");
	if not objItemSys then
		return;
	end
	
	objItemSys:RegEvent(self);
end;

function CMartialSystem:OnChangeSceneEnd()
	self:LeaveCurMartial();
	self:SendMartialToMe();
end;

function CMartialSystem:OnChangeLineBegin(dwNewLineID)
	self:LeaveCurMartial();
	
	local objPlayer = self:GetPlayer();
	local Data = {};
	--Data[1] = self.dwCurSkillID;
	objPlayer:SetLineData("CMartialSystem",Data);
end;

---------------------------------------------------------------------------------------------------
function CMartialSystem:GetCurMarID()
	return self.dwCurMartialID;
end;

function CMartialSystem:CreateMartial(fDirValue)
	if self.dwCurMartialID ~= 0 then
		self:LeaveCurMartial();
	end
	
	local objMar = CMartialManager:CreateMartial(self:GetPlayer(),fDirValue);
	
	self:ReadyMartial(objMar.dwSelfID,1);
end;

function CMartialSystem:TryEnterMartial(dwMarID)
	if self.dwCurMartialID ~= 0 then
		self:LeaveCurMartial();
	end
	
	local objMar = CMartialManager:FindMartial(dwMarID);
	
	if objMar then
		if objMar:GetRoleNum() >= CMartialConfig.dwMaxRoleNum then
			return;
		end
		
		local tbPos = objMar:TryJoin();
		
		local objPlayer = self:GetPlayer();
		objPlayer.OnMartialPosMsg
		{
			MartialID = dwMarID;
			FreePosTable = tbPos;
		}
	end
end;

function CMartialSystem:ReadyMartial(dwMarID,dwIndex)
	if self.dwCurMartialID ~= 0 then
		self:LeaveCurMartial();
	end
	
	local objMar = CMartialManager:FindMartial(dwMarID);
	if objMar then
		local objSelf = self:GetPlayer();
		if objMar:IsRoleInPos(dwIndex) then
			self:TryEnterMartial(dwMarID)
			return;
		end
		
		objMar:Enter(dwIndex,self:GetPlayer():GetRoleID());
		
		self.dwCurMartialID = dwMarID;
		--print("====ReadyMartial====",objSelf:GetRoleID(),dwMarID,dwIndex)
		local dwValue = objSelf:GetSystem("CSkillSystem"):GetInfo().dwMartialUp;
		if dwValue > 0 then
			objMar:ChangeSpeedValue(objSelf:GetRoleID(),dwValue);
		end
		
		objSelf.OnSelfMartialMsg
		{
			MartialID = dwMarID;
			SkillID = self.dwCurSkillID;
		};
		
		self.dwBeginTime = GetCurTime();
		
		self.dwNorTick = self:CountNormalTick();
		self.dwSplPerValue = self:CountBasePerValue();
		self.dwNormalGetTime = self.dwBeginTime;
		self.dwSpecialTick = self:CountSpecialTick();
		self.dwSpecialCheckTime = self.dwBeginTime;
		objSelf:GetSystem("CStateSystem"):CheckPlayerAction(enPlayerAction.ePA_EnterMar);
		
		objSelf.OnMartialSplPerMsg{SplPerValue = self.dwSplPerValue};
		objSelf.OnMartialTickMsg{TickValue = self.dwNorTick};
		
		objSelf:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventSit,1);
		
		if self.objDriver then
			CDriverManager:DelDriver(self.objDriver)
		end
		
		self.objDriver = CDriverManager:AddDriver(eInterval._100ms,self,self.Update)
		
		local objEventCenter = objSelf:GetSystem('CPlayerEventCenterSystem');
		if objMar:GetRoleNum() == 1 then
			objEventCenter:DoEvent(enumPlayerEventType.EventMartial);
		else
			objEventCenter:DoEvent(enumPlayerEventType.EventTeamMar);
		end
	end
end;

function CMartialSystem:LeaveCurMartial(isStateIn)
	if self.dwCurMartialID == 0 then
		return;
	end
	--local objSelf = self:GetPlayer();
	--print("-----------leave------------",objSelf:GetRoleID(),self.dwCurMartialID)
	local objMar = CMartialManager:FindMartial(self.dwCurMartialID);
	if objMar then
		objMar:Exit(self:GetPlayer():GetRoleID());
	end
	self.dwCurMartialID = 0;
	if self.dwSplFlag ~= 0 then
		self:SetSplFlag(0);
	end
	
	if not isStateIn then
		self:GetPlayer():GetSystem("CStateSystem"):CheckPlayerAction(enPlayerAction.ePA_EixtMar);
	end
	
	self.objDBQuery:SaveMartialInfo();
	
	
	if self.objDriver then
		CDriverManager:DelDriver(self.objDriver)
	end
end;

function CMartialSystem:SetMartialSkill(dwSkillID)
	--self.dwCurSkillID = dwSkillID;
end;

function CMartialSystem:SetSplFlag(dwCode)
	-- if self.dwSplFlag == dwCode then
		-- return;
	-- end
	
	self.dwSplFlag = dwCode;
	
	local objSelf = self:GetPlayer();
	
	if dwCode == 1 then
		self.dwSpecialEnterTime = GetCurTime();
		
		self.dwSpecialLength = self:CountSpecialLength();
		
		objSelf:GetSystem("CSkillSystem"):BroadcastSkillMsg(true,"OnPlayPfxMsg",
		{
			ActionID = 90011,
			BindPos = "FeetPoint",
			RoleID = objSelf:GetRoleID(),
			SkillID = 0,
			ExecTime = 0,
			ActCount = 0,
		})
	else
		objSelf:GetSystem("CSkillSystem"):BroadcastSkillMsg(true,"OnStopPfxMsg",
		{
			ActionID = 90011,
			RoleID = objSelf:GetRoleID(),
		})
	end
	
	objSelf.OnSpecialFlagChgMsg{Flag = dwCode,Length = self.dwSpecialLength};
end;

--发送自己可以看见的演武对象给自己，初始化用
function CMartialSystem:SendMartialToMe()
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local objMap = objSelf:GetSystem("CMapSystem"):GetCurMap();
	if not objMap then
		return;
	end
	
	local setViewMartial = CMartialManager:GetCanSeeMartialList(objMap:GetRealID());
	if not setViewMartial then
		return;
	end
	
	for n,obj in pairs(setViewMartial)do
		local tbInfo = obj:GetInfo();
		self:SendMartialCreate(tbInfo);
	end
end;

function CMartialSystem:OnChangeMapChecker(tbOldID,tbNewID)
	
end;

---------------------------------------------------------------------------------------------------
--普通收益
function CMartialSystem:OnNormalTick(dwNowTime)
	local dwDis = dwNowTime - self.dwNormalGetTime;
	
	if dwDis < self.dwNorTick then
		return;
	end
	
	self:OnNormalGet();
	
	self.dwNormalGetTime = dwNowTime;
end;

function CMartialSystem:OnSpecialCheck(dwNowTime)
	local dwDis = dwNowTime - self.dwSpecialCheckTime;
	
	if dwDis < self.dwSpecialTick then
		return;
	end
	
	--顿悟的随机
	if self.dwSplFlag == 0 then
		local dwRandom = math.random(10000);
		if dwRandom > self.dwSplPerValue then
			self.dwSplPerValue = self.dwSplPerValue + self:CountAddPerValue();
		else
			self:SetSplFlag(1);
			self.dwSplPerValue = self:CountBasePerValue();
		end
	end
	
	self:GetPlayer().OnMartialSplPerMsg{SplPerValue = self.dwSplPerValue};
	
	self.dwSpecialCheckTime = dwNowTime;
end;

function CMartialSystem:OnNormalGet()
	local tbHarvest = self:CountNormalGet();
	self:AddHarvest(tbHarvest);
	
	--重新计算收益间隔
	self.dwNorTick = self:CountNormalTick();
	
	self:GetPlayer().OnMartialTickMsg{TickValue = self.dwNorTick};
end;

--顿悟收益
function CMartialSystem:OnSpecialTick(dwNowTime)
	if dwNowTime - self.dwSpecialEnterTime > self.dwSpecialLength then
		self:SetSplFlag(0);
		return;
	end;
	
	if dwNowTime - self.dwSpecialGetTime < CMartialConfig.dwSplTick then
		return;
	end
	
	self:OnSpecialGet();
	
	self.dwSpecialGetTime = dwNowTime;
end;

function CMartialSystem:OnSpecialGet()
	local tbHarvest = self:CountSpecialGet();
	self:AddHarvest(tbHarvest);
end;

--添加收益数值
local arrHarvestIndex = 
{
	zhenqi_G = 1;
	zhenqi_M = 2;
	zhenqi_S = 3;
	zhenqi_H = 4;
	zhenqi_T = 5;
	jingyan = 6;
	xinfa = 7;
	dwCurSkill = 8;
}
function CMartialSystem:AddHarvest(tbHarvest)
	local objSelf = self:GetPlayer();
	local fPer = objSelf:GetAddicted();
	
	--local dwSitUp = 0;
	
	-- local objSklSystem = objSelf:GetSystem("CSkillSystem");
	local five = objSelf:GetSystem("CFiveElemSystem");
	
	-- local tb = objSklSystem:GetInfo();
	local dwExpUp = 0--tb.dwMartialExpUp;
	local dwZhenqiUp = 0--tb.dwMartialZhenqiUp;
	
	tbHarvest.zhenqi_G = tbHarvest.zhenqi_G;
	tbHarvest.zhenqi_G = tbHarvest.zhenqi_G + CMovementSystemMgr:GetMovementExp(tbHarvest.zhenqi_G);
	tbHarvest.zhenqi_G = math.floor(tbHarvest.zhenqi_G * fPer);
	
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = five:GetElemValue()	
	if not five:ChangeAttr('dwMetalValue',tbHarvest.zhenqi_G) then
		tbHarvest.zhenqi_G = 0;
	end
	
	tbHarvest.zhenqi_M = tbHarvest.zhenqi_M;
	tbHarvest.zhenqi_M = tbHarvest.zhenqi_M + CMovementSystemMgr:GetMovementExp(tbHarvest.zhenqi_M);
	tbHarvest.zhenqi_M = math.floor(tbHarvest.zhenqi_M * fPer);
	if not five:ChangeAttr('dwWoodValue',tbHarvest.zhenqi_M) then
		tbHarvest.zhenqi_M = 0;
	end
	
	tbHarvest.zhenqi_S = tbHarvest.zhenqi_S;
	tbHarvest.zhenqi_S = tbHarvest.zhenqi_S + CMovementSystemMgr:GetMovementExp(tbHarvest.zhenqi_S);
	tbHarvest.zhenqi_S = math.floor(tbHarvest.zhenqi_S * fPer);
	if not five:ChangeAttr('dwWaterValue',tbHarvest.zhenqi_S) then
		tbHarvest.zhenqi_S = 0;
	end
	
	tbHarvest.zhenqi_H = tbHarvest.zhenqi_H;
	tbHarvest.zhenqi_H = tbHarvest.zhenqi_H + CMovementSystemMgr:GetMovementExp(tbHarvest.zhenqi_H);
	tbHarvest.zhenqi_H = math.floor(tbHarvest.zhenqi_H * fPer);
	if not five:ChangeAttr('dwFireValue',tbHarvest.zhenqi_H) then
		tbHarvest.zhenqi_H = 0;
	end
	
	tbHarvest.zhenqi_T = tbHarvest.zhenqi_T;
	tbHarvest.zhenqi_T = tbHarvest.zhenqi_T + CMovementSystemMgr:GetMovementExp(tbHarvest.zhenqi_T);
	tbHarvest.zhenqi_T = math.floor(tbHarvest.zhenqi_T * fPer);
	if not five:ChangeAttr('dwEarthValue',tbHarvest.zhenqi_T) then
		tbHarvest.zhenqi_T = 0;
	end
	
	local setData = {
		[1] = {dwCurrent = uItemGold, dwChange = tbHarvest.zhenqi_G};
		[2] = {dwCurrent = uItemWood, dwChange = tbHarvest.zhenqi_M};
		[3] = {dwCurrent = uItemWater, dwChange = tbHarvest.zhenqi_S};
		[4] = {dwCurrent = uItemFire, dwChange = tbHarvest.zhenqi_H};
		[5] = {dwCurrent = uItemEarth, dwChange = tbHarvest.zhenqi_T};
	}
	CLogSystemManager:zhenqi(objSelf, setData, _G.FiveElemSysOperType.MartialSystem)	
	
	tbHarvest.jingyan = tbHarvest.jingyan;
	tbHarvest.jingyan = tbHarvest.jingyan + CMovementSystemMgr:GetMovementExp(tbHarvest.jingyan);
	tbHarvest.jingyan = math.floor(tbHarvest.jingyan * fPer);
	--添加活动加成
	objSelf:AddExp(tbHarvest.jingyan);
	
	--print("=========================",self.dwCurSkillID)
	-- local sRoleSkill = objSklSystem.setAllSkill[self.dwCurSkillID];
	
	-- if sRoleSkill then
		-- --tbHarvest.xinfa = tbHarvest.xinfa * (1 + dwSitUp);
		-- --tbHarvest.xinfa = sRoleSkill:AddSkillKnowValue(tbHarvest.xinfa);
		-- --tbHarvest.dwCurSkill = self.dwCurSkillID;
	-- end
	
	local tbSend = {};
	for n,v in pairs(tbHarvest)do
		local key = arrHarvestIndex[n];
		if key then
			tbSend[key] = v;
		end
	end
	objSelf.OnMartialHarvestMsg{HarvestInfo = tbSend};
end;

function CMartialSystem:ChangeProValue(dwRoleID,dwNewValue)
	local objMar = CMartialManager:FindMartial(self.dwCurMartialID);
	if not objMar then
		return;
	end
	
	objMar:ChangeSpeedValue(dwRoleID,dwNewValue);
end;

---------------------------------------------------------------------------------------------------
--网络消息，发送部分
--演武创建
local arrMartialIndex =
{
	dwID = 1;
	dwDirValue = 2;
	fXPos = 3;
	fYPos = 4;
	dwCurMapID = 5;
	dwSpeedUp = 6;
	setPlayerList = 7;
}
function CMartialSystem:SendMartialCreate(tbInfo)
	local objPlayer = self:GetPlayer();
	if (not objPlayer) then
		return;
	end
	
	local tbSendInfo = {};
	for n,v in pairs(tbInfo)do
		local key = arrMartialIndex[n];
		if key then
			tbSendInfo[key] = v;
		end
	end
	
	objPlayer.OnCreateMartialMsg
	{
		CreateInfo = tbSendInfo;
	}
end;

--删除
function CMartialSystem:SendMartialDelete(dwMarID)
	local objPlayer = self:GetPlayer();
	if (not objPlayer) then
		return;
	end
	
	objPlayer.OnDeleteMartialMsg
	{
		MartialID = dwMarID;
	}
end;

--加入
function CMartialSystem:SendMartialEnter(dwMarID,dwIndex,dwRoleID)
	local objPlayer = self:GetPlayer();
	if (not objPlayer) then
		return;
	end
	
	objPlayer.OnRoleJoinMartialMsg
	{
		RoleID = dwRoleID;
		MartialID = dwMarID;
		Index = dwIndex;
	}
end;

--退出
function CMartialSystem:SendMartialExit(dwMarID,dwIndex,dwRoleID)
	local objPlayer = self:GetPlayer();
	if (not objPlayer) then
		return;
	end
	
	objPlayer.OnRoleExitMartialMsg
	{
		RoleID = dwRoleID;
		MartialID = dwMarID;
		Index = dwIndex;
	}
end;

--演武属性修改
function CMartialSystem:SendMartialChange(dwMarID,tbInfo)
	local objPlayer = self:GetPlayer();
	if (not objPlayer) then
		return;
	end
	
	objPlayer.OnChangeMartialInfoMsg
	{
		MartialID = dwMarID;
		Info = tbInfo;
	}
end;

---------------------------------------------------------------------------------------------------
--计算演武的收益间隔
function CMartialSystem:CountNormalTick()
	--获取团队的权重
	local objMar = CMartialManager:FindMartial(self.dwCurMartialID);
	if not objMar then
		return CMartialConfig.dwNorTick;
	end
	
	local dwMarValue = CMartialConfig.funcMartialTickWeight(objMar:GetTickCountInfo());
	
	--计算自己的权重
	local objSelf = self:GetPlayer();
	local objSklSys = objSelf:GetSystem("CSkillSystem");
	local objVipSys = objSelf:GetSystem("CVipSystem");
	local objMrySys = objSelf:GetSystem("CMarriageSystem");
	
	local isVip = objVipSys:isVip();
	local isWife = objMar:IsHaveRole(objMrySys:GetMateRoleID());
	
	local dwSelfValue = CMartialConfig.funcSelfTickWeight(objSklSys:GetInfo(),isVip,isWife);
	
	--得出最终值
	return CMartialConfig.funcLastTick(dwSelfValue,dwMarValue);
end;

--计算顿悟的长度
function CMartialSystem:CountSpecialLength()
	local objSelf = self:GetPlayer();
	
	return CMartialConfig.funcSplLength(objSelf:GetSystem("CSkillSystem"):GetInfo());
end;

--普通收益计算
function CMartialSystem:CountNormalGet()
	--获取团队的权重
	local objMar = CMartialManager:FindMartial(self.dwCurMartialID);
	if not objMar then
		return nil;
	end
	
	local tbMarInfo = CMartialConfig.funcMartialNormalWeight(objMar:GetTickCountInfo());
	
	--计算自己的权重
	local objSelf = self:GetPlayer();
	-- local objSklSys = objSelf:GetSystem("CSkillSystem");
	local objVipSys = objSelf:GetSystem("CVipSystem");
	local objMrySys = objSelf:GetSystem("CMarriageSystem");
	
	local isVip = objVipSys:isVip();
	local isWife = objMar:IsHaveRole(objMrySys:GetMateRoleID());
	
	local tbSelfInfo = CMartialConfig.funcSelfNormalWeight(objSelf,self.dwCurSkillID,isVip,isWife);
	
	--最终值
	return CMartialConfig.funcNormalGet(tbSelfInfo,tbMarInfo,isVip,isWife,objMar:GetTickCountInfo());
end;

--顿悟收益计算
function CMartialSystem:CountSpecialGet()
	--获取团队的权重
	local objMar = CMartialManager:FindMartial(self.dwCurMartialID);
	if not objMar then
		return nil;
	end
	
	local tbMarInfo = CMartialConfig.funcMartialSpecialWeight(objMar:GetTickCountInfo());
	
	--计算自己的权重
	local objSelf = self:GetPlayer();
	local objSklSys = objSelf:GetSystem("CSkillSystem");
	local objVipSys = objSelf:GetSystem("CVipSystem");
	local objMrySys = objSelf:GetSystem("CMarriageSystem");
	
	local isVip = objVipSys:isVip();
	local isWife = objMar:IsHaveRole(objMrySys:GetMateRoleID());
	
	local tbSelfInfo = CMartialConfig.funcSelfSpecialWeight(objSelf,self.dwCurSkillID,isVip,isWife);
	
	--最终值
	return CMartialConfig.funcSpecialGet(tbSelfInfo,tbMarInfo);
end;

--顿悟概率检测的时间间隔
function CMartialSystem:CountSpecialTick()
	return CMartialConfig.dwSplCheckTicl;
end;

--初始顿悟概率值
function CMartialSystem:CountBasePerValue()
	return CMartialConfig.dwSplPer;
end;

--每次增加的概率值
function CMartialSystem:CountAddPerValue()
	return CMartialConfig.dwSplPerAdd;
end;

-------------------------------------------------------------------------------
--
function CMartialSystem:AutoRadyNotice(dwFlag)
	local objMar = CMartialManager:FindMartial(self.dwCurMartialID);
	if not objMar then
		return;
	end
	
	objMar:NoticeAutoReady(self:GetPlayer():GetRoleID(),dwFlag);
end;

function CMartialSystem:NotifyItemAdded(dwItemEnum,dwNumber)
	if self:GetCurMarID() == 0 then
		return;
	end
	
	local isMartialItem = false;
	for n,v in pairs(CMartialConfig.setTeamUpItem)do
		if v == dwItemEnum then
			isMartialItem = true;
			break;
		end
	end
	
	if not isMartialItem then
		return;
	end
	
	local objMar = CMartialManager:FindMartial(self:GetCurMarID());
	if objMar then
		objMar:CountMaxValue();
	end
end;

---------------------------------------------------------------------------------------------------
--演武的数据存储
_G.CMartialSystemDB = {};

function CMartialSystemDB:new(objDB,objUser)
	local obj = {};
	local obj = {};
	obj.objDB = objDB;      --对应的数据库 
	obj.objUser = objUser;
	
	for i, v in pairs(CMartialSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CMartialSystemDB:SaveMartialInfo()
	if not self.objDB then
		_info("self.objDB is null by CMartialSystemDB:SaveMartialInfo");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CMartialSystemDB:SaveMartialInfo");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CMartialSystemDB:SaveMartialInfo");
		return false;
	end;
	local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CMartialSystemDB:SaveMartialInfo");
		return false;
	end;
	
	local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Martial_Info');
	
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwSkillID = self.objUser.dwCurSkillID;
	
	SqlCmd:execute();
	return true;
end;

function CMartialSystemDB:AddMartialInfo()
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CMartialSystemDB:AddMartialInfo");
		return false;
	end;
	local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CMartialSystemDB:AddMartialInfo");
		return false;
	end;
	
	local SqlCmd = self.objDB:CreateInsertCmd('T_Role_Martial_Info');
	
	SqlCmd.Fields.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwSkillID = 0;
	
	SqlCmd:execute()
	return true;
end;
