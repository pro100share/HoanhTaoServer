_G.SSkillGroupInfo = {};

SSkillGroupInfo.dwPublicCD = 500;



--从表中随机取一个val
local function GetRandValue(tb)
	local dwMax = 0;
	local tbRnd = {};
	for n,v in pairs(tb)do
		dwMax = dwMax + 100;
		tbRnd[v] = dwMax;
	end
	
	local dwRnd = math.random(dwMax);
	
	for n,v in pairs(tbRnd)do
		if dwRnd <= v then
			return n;
		end
	end
end;

-------------------------------------------------------
--技能系统
_G.CSkillSystem = {};
CSkillSystem.bIsPlayerInit = false;	--玩家是否已经初始化SkillSystem

function CSkillSystem:new()
	local obj = CSystem:new("CSkillSystem");
	--角色当前的HP和MP都存放在BaseInfo中
	obj.sBaseInfo = SRoleSkillInfo:new();		--通过DB中存储的属性值加出来的人物裸属性点
	obj.setAllSkill = {};
	obj.setEquipID = {};
	obj.setCurAction = {};
	obj.objAdvAttrInfo = SAttrChangeInfo:new();
	obj.objPerAttrInfo = SAttrChangeInfo:new();
	obj.dwSkillTitle = 0;
	obj.dwTargetType = -1;		--这个初始值表示没有目标，-1
	obj.dwTargetID = -1;		--
	
	obj.setSkillLevel = {};--技能临时等级
	
	---
	for i,v in pairs(CSkillSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CSkillSystem:Create(bIsChangeLine)
	--从数据库读取信息 
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	self.objDBQuery = CSkillSystemDB:new(objDB,self);
	if not self.objDBQuery then
		return false;
	end;
	
	self.CrossSvrBattleInfo = nil;
	self.CrossSvrBattleScore = nil;
	
	--如果是跨服
	if bIsChangeLine == 2 then
		--读取信息
		--local Data	= objPlayer:GetCrossSvrData("CSkillSystem")[1];
		local Data	= objPlayer:GetLineData("CSkillSystem")[1];
		
		for i, row in pairs(Data[1]) do
			local sInfo = {};
			sInfo.dwRoleID          =  row[1];
			sInfo.dwSkillID			=  row[2];		--技能ID
			sInfo.dwSkillLevel		=  row[3];		--技能等级
			sInfo.dwSkillKnowValue	=  row[4];		--技能熟练度
			sInfo.dwOpenFlag		=  row[5];		--开启状态
			sInfo.bIsUpdate = false;
			local objRoleSkill = CRoleSkill:new(sInfo,self);
			self:AddSkill(objRoleSkill)
		end;
		
		self:CheckBattleInfo(Data[3]);
		self.sBaseInfo = Data[3];
		
		--self:CountBattleInfo(Data[2]);
		--self.CrossSvrBattleInfo = Data[3];
		self.CrossSvrBattleScore = Data[4];
	else
		--读取信息
		local Data	= objPlayer:GetLineData("CSkillSystem")[1];
		
		for i, row in pairs(Data[1]) do
			local sInfo = {};
			sInfo.dwRoleID          =  row.dwRoleID;
			sInfo.dwSkillID			=  row.dwSkillID;		--技能ID
			sInfo.dwSkillLevel		=  row.dwSkillLevel;		--技能等级
			sInfo.dwSkillKnowValue	=  row.dwSkillKnowValue;		--技能熟练度
			sInfo.dwOpenFlag		=  row.dwOpenFlag;		--开启状态
			sInfo.bIsUpdate = false;
			local objRoleSkill = CRoleSkill:new(sInfo,self);
			self:AddSkill(objRoleSkill)
		end;
		
		self:CheckBattleInfo(Data[2]);
		self:CountBattleInfo(Data[2]);
	end
	
	self:CheckInitSkill();
	
	--发现存在HP为0的假死现象，所以这里加一个容错
	if self.sBaseInfo.dwHP <= 0 then
		self.sBaseInfo.dwHP = 1;
	end
	
	
	for dwID,objSkill in pairs(self.setAllSkill) do
		objSkill:ExecPassiveSkill();
	end
	
	return true;
end;

function CSkillSystem:OnCreateOver(bIsChangeLine)
	self:CheckSkillTitle(true);
	
	--各个系统create完毕后，记录战斗力LOG
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local tbInfo = self:CountBattleScoreInfo();
	CLogSystemManager:battle(objPlayer, tbInfo);
	self.bIsPlayerInit = true;	--player初始化完成
end;

function CSkillSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	local Data = {};
	Data[1] = {};
	for n,obj in pairs(self.setAllSkill)do
		local info = {};
		info = obj:GetInfo();
		table.insert(Data[1],info);
	end
	Data[2] = self.sBaseInfo;
	objPlayer:SetLineData("CSkillSystem",Data);
	
	self:ExecSkillEvent("EventChangeLine");
end;

function CSkillSystem:OnEnterCrossBegin()
	local objPlayer = self:GetPlayer();
	local Data = {};
	Data[1] = {};
	for n,obj in pairs(self.setAllSkill)do
		local info = {};
		info = obj:GetInfo();
		--如果不需要屏蔽此技能 就传入跨服战
		if not CrossSkillConfig:IsSkillNeedBofbidden(info.dwSkillID) then
			local tempInfo = {};
			tempInfo[1] = info.dwRoleID;
			tempInfo[2] = info.dwSkillID;
			tempInfo[3] = info.dwSkillLevel;
			tempInfo[4] = info.dwSkillKnowValue;
			tempInfo[5] = info.dwOpenFlag;
			
			table.insert(Data[1],tempInfo);
		end
	end
	
	--此fightInfo 剔除了buff加成属性
	local fightInfo = self:GetCrossSvrInfo();
	Data[2] = self.sBaseInfo;
	Data[3] = fightInfo;
	Data[4] = self:CountBattleScoreInfo();
	
	objPlayer:SetCrossSvrData("CSkillSystem",Data);
	
	self:ExecSkillEvent("EventChangeLine");
end;

function CSkillSystem:Destroy()
	if self.objDBQuery then
		self.objDBQuery:SaveSkillInfo();
		self.objDBQuery:SaveBattleInfo(self:MakeBattleInfoForDB());
		self.objDBQuery = nil;
	end;
	
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	--如果锁定怪物的话，取消Buff关注
	if self.dwTargetType and self.dwTargetType == enEntType.eEntType_Monster then
		if self.dwTargetID then
			local objMap = objPlayer:GetSystem("CMapSystem"):GetCurMap();
			if not objMap then return end;
			local objMonster = objMap:GetMonsterByObjID(self.dwTargetID);
			if objMonster then
				objMonster:GetSystem("CMonsterBuffSystem"):UnRegisterSystem(objPlayer:GetRoleID());
			end
		end;
	end
	
	local tbInfo = self:CountBattleScoreInfo();
	CLogSystemManager:battle(objPlayer, tbInfo);
end;

function CSkillSystem:OnEnterScene()
	local objSelf = self:GetPlayer();
	
	--如果是跨服战 
	if CConfig.bIsCrossSvr then
		--此处要清理掉各个系统Create的时候增加的战斗属性
		self.objAdvAttrInfo = SAttrChangeInfo:new();
		self.objPerAttrInfo = SAttrChangeInfo:new();
		
		--检查HP和MP上限
		self:CheckHPAndMP(true);
		
		
		--判断如果是骑着坐骑进入跨服战
		local sysMount = objSelf:GetSystem("CMountSystem")
		if sysMount then
			if sysMount.n_ActiveMountID > 0 and sysMount:GetState() then
				local mountInst = sysMount:GetMountInst(sysMount.n_ActiveMountID);
				local mountAddSpeed = mountInst:GetAddSpeedValue();
				self.sBaseInfo.dwMoveSpeed = self.sBaseInfo.dwMoveSpeed - mountAddSpeed;
				
				--坐骑只有增量值 没有百分比
				self.objAdvAttrInfo["Mount"][1] = _G.SSingleAttrChange:new();
				self.objAdvAttrInfo["Mount"][1].dwMoveSpeed = mountAddSpeed;
				-- print("CSkillSystem:OnEnterScene=================", self.sBaseInfo.dwMoveSpeed, self:GetInfo().dwMoveSpeed,mountAddSpeed)
			end
		end
	end
	
	if self:GetInfo().dwHP == 0 then
		objSelf:GetSystem("CBattleSystem"):Relive(enReliveType.eRT_Pos);
	end
	
	--添加PK保护
	if objSelf:GetLevel() < enPKForbidLevel then
		local objInfo = SSingleAttrChange:new();
		objInfo.dwPKForbid = 1;
		self:ChangeAttrAdv("Level",1,objInfo);
	end
	
	--检查HP和MP上限
	self:CheckHPAndMP();
	
	--发送初始化消息
	local tbSendBaseInfo = {};
	
	local setBaseInfo = self.sBaseInfo;
	-- if CConfig.bIsCrossSvr then
		-- setBaseInfo = self.CrossSvrBattleInfo;
	-- end
	
	for key,value in pairs(setBaseInfo)do
		local dwIndex = GetAttrNameToIndex(key);
		if dwIndex then
			tbSendBaseInfo[dwIndex] = value;
		end
	end
	objSelf.OnLoadAttrInfoMsg
	{
		StrType = 1,
		InfoTable = tbSendBaseInfo,
		IsInit = true,
	}
	
	local tbSendAdvInfo = {};
	for key,value in pairs(self.objAdvAttrInfo:GetInfo())do
		local dwIndex = GetAttrNameToIndex(key);
		if dwIndex then
			tbSendAdvInfo[dwIndex] = value;
		end
	end
	objSelf.OnLoadAttrInfoMsg
	{
		StrType = 2,
		InfoTable = tbSendAdvInfo,
		IsInit = true,
	}
	
	local tbSendPerInfo = {};
	for key,value in pairs(self.objPerAttrInfo:GetInfo())do
		local dwIndex = GetAttrNameToIndex(key);
		if dwIndex then
			tbSendPerInfo[dwIndex] = value;
		end
	end
	objSelf.OnLoadAttrInfoMsg
	{
		StrType = 3,
		InfoTable = tbSendPerInfo,
		IsInit = true,
	}
	
	-- objSelf.OnSkillTitleChangeMsg
	-- {
		-- Title = self.dwSkillTitle;
		-- Isinit = 1;
	-- }
	local tbSendSkill = {};
	for dwSkillID,tbList in pairs(self.setSkillLevel)do
		local dwRsl = 0;
		for sz,num in pairs(tbList)do
			dwRsl = dwRsl + num;
		end
		
		if dwRsl > 0 then
			tbSendSkill[dwSkillID] = dwRsl;
		end
	end
	
	objSelf.OnSkillAddInitMsg{List = tbSendSkill};
	-- if CConfig.bIsCrossSvr then
		-- objSelf.OnSkillCSBattleScoreMsg = {BattleScoreInfo = self.CrossSvrBattleScore};
	-- end
	
	self:ExecSkillEvent("EventSceneChange");
end;

function CSkillSystem:OnChangeSceneEnd()
	self:ExecSkillEvent("EventSceneChange");
end;

function CSkillSystem:OnEnterGameOver()
	--内功效果执行
	for dwID,objSkill in pairs(self.setAllSkill) do
		if objSkill.sInfo.dwOpenFlag == 1 then
			objSkill:ExecModeSkill(1,true);
		end
	end
end;

function CSkillSystem:OnChangeLineEnd()
	--发送初始化消息
	--在换线结束后，再同步一次角色的属性，目前发现GM命令添加属性，换线会导致CS双方数据不一致
	--发送的位置不会，这个地方取消
	-- local objSelf = self:GetPlayer();
	
	-- local tbSendBaseInfo = {};
	-- for key,value in pairs(self.sBaseInfo)do
		-- local dwIndex = GetAttrNameToIndex(key);
		-- if dwIndex then
			-- tbSendBaseInfo[dwIndex] = value;
		-- end
	-- end
	-- objSelf.OnLoadAttrInfoMsg
	-- {
		-- StrType = 1,
		-- InfoTable = tbSendBaseInfo,
		-- IsInit = true,
	-- }
	
	-- local tbSendAdvInfo = {};
	-- for key,value in pairs(self.objAdvAttrInfo:GetInfo())do
		-- local dwIndex = GetAttrNameToIndex(key);
		-- if dwIndex then
			-- tbSendAdvInfo[dwIndex] = value;
		-- end
	-- end
	-- objSelf.OnLoadAttrInfoMsg
	-- {
		-- StrType = 2,
		-- InfoTable = tbSendAdvInfo,
		-- IsInit = true,
	-- }
	
	-- local tbSendPerInfo = {};
	-- for key,value in pairs(self.objPerAttrInfo:GetInfo())do
		-- local dwIndex = GetAttrNameToIndex(key);
		-- if dwIndex then
			-- tbSendPerInfo[dwIndex] = value;
		-- end
	-- end
	-- objSelf.OnLoadAttrInfoMsg
	-- {
		-- StrType = 3,
		-- InfoTable = tbSendPerInfo,
		-- IsInit = true,
	-- }
end;


function CSkillSystem:OnDead(dwEnemyType,dwEnemyID)
	self:ChgMP(0-self:GetInfo().dwMPMax,false,-1,-1);
end;

local function CopyTable(to,from)
	for n,v in pairs(from)do
		to[n] = v;
	end
end;

function CSkillSystem:OnLevelUp(dwCurLevel,dwNextLevel)
	self:BroadcastSkillMsg(false,"OnRoleLevelUpMsg",
	{
		RoleID = self:GetPlayer():GetRoleID(),
		NewLevel = dwNextLevel,
	});
	
	--加潜力点
	local dwPointUp = 0;
	for i = dwCurLevel+1,dwNextLevel do
		dwPointUp = dwPointUp + RoleUpLevelConfig[i].dwPointGet;
	end
	--print("===OnLevelUp====",dwPointUp)
	self:ChangeAttr("dwPoint",dwPointUp);
	
	local oldInfo = {};
	CopyTable(oldInfo,self:GetInfo());
	
	--升级后血和蓝上限需要改变
	self:CountBattleInfo(self:MakeBattleInfoForDB());
	--升级后HP和MP满
	self:FullHPAndMP();
	
	self:SendPlayerInfoLoad(1,self.sBaseInfo);
	
	
	local newInfo = self:GetInfo();
	self:CheckNeedSendAttr(oldInfo,newInfo);
	
	--等级足够就取消PK保护
	if dwNextLevel >= enPKForbidLevel then
		if newInfo.dwPKForbid == 1 then
			local objInfo = SSingleAttrChange:new();
			self:ChangeAttrAdv("Level",1,objInfo);
		end
	end
	
	local objTeamSys = self:GetPlayer():GetSystem("CTeamSystem");
	if objTeamSys then
		if objTeamSys.m_teamId and objTeamSys.m_teamId ~= 0 then
			objTeamSys:SynPlayerBlood(self.sBaseInfo.dwHP, newInfo.dwHPMax);
		end;
	end;
	
	self.objDBQuery:SaveBattleInfo(self:MakeBattleInfoForDB());
end;

--因为只能开一个内功，所以这里就尝试把其他开的内功关掉
function CSkillSystem:CloseSkillFlag()
	local tbAllNG = {};
	
	for id,objSkill in pairs(self.setAllSkill)do
		if objSkill.sInfo.dwOpenFlag and objSkill.sInfo.dwOpenFlag > 0 then
			tbAllNG[id] = objSkill;
		end
	end
	
	for n,objRoleSkill in pairs(tbAllNG)do
		objRoleSkill:ExecModeSkill(0);
	end
end;

function CSkillSystem:CheckNGSkillOpen()
	local tbAllNG = {};
	
	for id,objSkill in pairs(self.setAllSkill)do
		if objSkill.sInfo.dwOpenFlag and objSkill.sInfo.dwOpenFlag > 0 then
			tbAllNG[id] = objSkill;
		end
	end
	
	local dwNum = 0;
	for n,objRoleSkill in pairs(tbAllNG)do
		dwNum = dwNum + 1;
	end
	
	if dwNum > 1 then
		local objSelf = self:GetPlayer();
		_info("Player have NG Over Number",objSelf:GetRoleID(),objSelf:GetName());
		for n,v in pairs(tbAllNG)do
			_info("NG Skill",n);
		end
	end
end;

function CSkillSystem:GetAllSkill()
	return self.setAllSkill;
end;

--添加一个技能
function CSkillSystem:AddSkill(objInfo) 
	self.setAllSkill[objInfo:GetID()] = objInfo;
end;

--初始化玩家的技能
function CSkillSystem:InitSkillData()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	local tInitList = InitConfig:InitRoleSkill(objPlayer:GetInfo().dwProf);
	
	for i, dwSkillID in pairs(tInitList) do
		if SkillConfig[dwSkillID] then
			local sInfo = {};
			sInfo.dwRoleID =  objPlayer:GetRoleID();
			sInfo.dwSkillID			=  dwSkillID;		--技能ID
			sInfo.dwSkillLevel		=  1;		--技能等级
			sInfo.dwSkillKnowValue	=  0;		--技能熟练度
			sInfo.dwOpenFlag		=  0;
			sInfo.bIsUpdate = false;
			local objRoleSkill = CRoleSkill:new(sInfo,self);
			
			if self.objDBQuery:AddSkillToDB(objRoleSkill:GetInfo()) then
				self:AddSkill(objRoleSkill);
			end;
		end;
	end;
	return true;
end;

--上线检查初始化技能，如果有没有学习的就学习
function CSkillSystem:CheckInitSkill()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	local tInitList = InitConfig:InitRoleSkill(objPlayer:GetInfo().dwProf);
	
	for i, dwSkillID in pairs(tInitList) do
		if (not self.setAllSkill[dwSkillID]) and SkillConfig[dwSkillID] then
			local sInfo = {};
			sInfo.dwRoleID =  objPlayer:GetRoleID();
			sInfo.dwSkillID			=  dwSkillID;		--技能ID
			sInfo.dwSkillLevel		=  1;		--技能等级
			sInfo.dwSkillKnowValue	=  0;		--技能熟练度
			sInfo.dwOpenFlag		=  0;
			sInfo.bIsUpdate = false;
			local objRoleSkill = CRoleSkill:new(sInfo,self);
			
			if self.objDBQuery:AddSkillToDB(objRoleSkill:GetInfo()) then
				self:AddSkill(objRoleSkill);
			end;
		end;
	end;
end;

function CSkillSystem:GetNowTarget()
	return self.dwTargetType,self.dwTargetID;
end;

------------------------------------
--处理网络消息
------------------------------------
--[[dwSkillID 				= 0;--技能ID
dwSkillKnowValue		= 0;--技能熟练度
dwSkillLevel			= 0;--技能等级（未计算）
dwSkillExLevel			= 0;--额外等级]]
local arrSkillInfoIndex = 
{
	dwRoleID = 1;
	dwSkillID = 2;
	dwSkillKnowValue = 3;
	dwSkillLevel = 4;
}
--玩家请求自己的技能信息
function CSkillSystem:ReadSkllInfoRequest(dwSkillID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local sSkillInfo = {};
	if not dwSkillID or dwSkillID == 0 then
		for dwID,Skill in pairs(self.setAllSkill) do
			sSkillInfo[dwID] = {};
			local tbSend = {};
			tbSend.dwRoleID = Skill:GetInfo().dwRoleID;
			tbSend.dwSkillID = Skill:GetInfo().dwSkillID; 
			tbSend.dwSkillKnowValue = Skill:GetInfo().dwSkillKnowValue; 
			tbSend.dwSkillLevel = Skill:GetInfo().dwSkillLevel; 
			
			for n,v in pairs(tbSend)do
				local keyy = arrSkillInfoIndex[n];
				if keyy then
					sSkillInfo[dwID][keyy] = v;
				end
			end
		end;
	end;
	
	objPlayer.OnReadSkillResultMsg{	ResultCode = 0,SkillInfoSet = sSkillInfo};
end;

--玩家请求学习某个技能
function CSkillSystem:StudySkillRequest(dwSkillID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local sRoleSkill = self.setAllSkill[dwSkillID]; --玩家技能信息
	local cfSkill = SkillConfig[dwSkillID]; --技能配置信息
	if not cfSkill then
		return;
	end
	
	--技能学习条件检测
	if not self:CheckSkillStudyCondition(dwSkillID) then
		_info("condition check fail");
		return;
	end
	
	--print("id = "..dwSkillID)
	if sRoleSkill then  --学习
		return;
	end
	
	--学习技能的随机成功
	local isSucc = true;
	local isBroadSkill = nil;
	local tb = SkillLearnConfig.tbSkillLearnTime[dwSkillID];
	if tb and tb[1] then
		local dwRnd = math.random(10000);
		if dwRnd > tb[1] then
			isSucc = false;
		else
			if tb[2] > 0 then
				isBroadSkill = true;
			end
		end
	end
	
	if not isSucc then
		self:SendStudySkillResult(dwSkillID,-1,0);
		
		local dwWordID = GetRandValue(SkillLearnConfig.tbFailWord);
		local szSelfName = objPlayer:GetName();
		
		if tb and tb[2] > 0 then
			self:BroadcastSkillMsg(true,"OnWarNoticeMsg",
			{
				NoticeType = 1;
				StringID = dwWordID;
				Param = {szSelfName};
			})
		end
		return;
	end
	
	local sInfo = {};
	sInfo.dwRoleID			=  objPlayer:GetRoleID();
	sInfo.dwSkillID			=  dwSkillID;		--技能ID
	sInfo.dwSkillLevel		=  1;		--技能等级
	sInfo.dwSkillKnowValue	=  0;		--技能熟练度
	sInfo.dwOpenFlag 		=  0;
	sInfo.bIsUpdate = true;
	
	sRoleSkill = CRoleSkill:new(sInfo,self);
	
	if self.objDBQuery:AddSkillToDB(sRoleSkill:GetInfo()) then
		self:AddSkill(sRoleSkill);
		self:CostSkillStudy(dwSkillID);
		sRoleSkill:ExecPassiveSkill();
	end;
	
	self:CheckSkillTitle();
	
	--发送技能信息
	self:SendSkillInfoToClient(sRoleSkill);
	self:SendStudySkillResult(dwSkillID,0,0);
	local eventSys = objPlayer:GetSystem('CPlayerEventCenterSystem');
	local objLearnSkill = self.setAllSkill[dwSkillID];
	local dwLevel = 1;
	if objLearnSkill then
		dwLevel = objLearnSkill:GetLevel();
	end
	eventSys:DoEvent(enumPlayerEventType.EventSkillUp,1,self:CountAllSkillLevel(),dwSkillID,dwLevel);
	
	if cfSkill.dwSkillKinds == 2 then
		eventSys:DoEvent(enumPlayerEventType.EventLearnXinfa,1,dwSkillID);
	end
	
	if isBroadSkill then
		local dwWordID = GetRandValue(SkillLearnConfig.tbSuccWord);
		local szSelfName = objPlayer:GetName();
		local dwSkillName = SkillConfig[dwSkillID].dwNameID;
		local szSkillName = SkillStringConfig[dwSkillName];
		
		--self:BroadcastSkillMsg(true,"SendSkillLearnWord",dwWordID,{szSelfName,szSkillName});
		--CWarHost:BroadcastWarNotice(5,dwWordID,{szSelfName,szSkillName});
		CKernelApp.OnKSWarNoticeMsg
		{
			NoticeType = 5;
			StringID = dwWordID;
			Param = {szSelfName,szSkillName};
		}
	end
end;

--玩家升级技能
function CSkillSystem:LevelUpSkillRequest(dwSkillID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local sRoleSkill = self.setAllSkill[dwSkillID]; --玩家技能信息
	local cfSkill = SkillConfig[dwSkillID]; --技能配置信息
	if not cfSkill then
		return;
	end
	
	--技能学习条件检测
	if not self:CheckSkillStudyCondition(dwSkillID) then
		_info("condition check fail");
		return;
	end
	
	if not sRoleSkill then
		return;
	end
	
	sRoleSkill:GetInfo().dwSkillLevel = sRoleSkill:GetInfo().dwSkillLevel +1;
	sRoleSkill:GetInfo().bIsUpdate = true;
	--技能学习扣除
	self:CostSkillUp(dwSkillID);
	sRoleSkill:ExecPassiveSkill();
	
	--技能升级后，内功属性要增加
	if math.floor((cfSkill.dwSkillType%1000)/100) == 1 and sRoleSkill.sInfo.dwOpenFlag == 1 then
		sRoleSkill:ExecModeReset();
	end
	
	self.objDBQuery:SaveSkillInfo(dwSkillID);
	
	self:SendSkillInfoToClient(sRoleSkill);
	self:SendStudySkillResult(dwSkillID,0,1);
	local eventSys = objPlayer:GetSystem('CPlayerEventCenterSystem');
	local dwLevel = sRoleSkill:GetLevel();
	eventSys:DoEvent(enumPlayerEventType.EventSkillUp,1,self:CountAllSkillLevel(),dwSkillID,dwLevel);
	
	self:CheckSkillTitle();
	
	--log
	CLogSystemManager:skill(objPlayer, dwSkillID, dwLevel)
end;

function CSkillSystem:CostSkillStudy(dwSkillID)
	local cfSkill = SkillConfig[dwSkillID];
	if not cfSkill then
		return;
	end
	local sRoleSkill = self.setAllSkill[dwSkillID];
	if not sRoleSkill then
		return;
	end
	
	local dwSkillLevel = sRoleSkill.sInfo.dwSkillLevel;
	
	local sConditionInfo = cfSkill:GetSkillStudyCondition(dwSkillLevel-1);
	
	local objSelf = self:GetPlayer();
	local itemSystem = objSelf:GetSystem("CItemSystem");
	
	if sConditionInfo.dwBookId ~= 0 then
		-- local dwCounts, dwBindNum, dwUnBindNum = itemSystem:GetEnumItemNumInPacket(sConditionInfo.dwBookId);
		itemSystem:DelEnumItemInPacket(sConditionInfo.dwBookId ,1, false, _G.ItemSysOperType.SkillUp);
	end
end;

function CSkillSystem:CostSkillUp(dwSkillID)
	local cfSkill = SkillConfig[dwSkillID];
	if not cfSkill then
		return;
	end
	local sRoleSkill = self.setAllSkill[dwSkillID];
	if not sRoleSkill then
		return;
	end
	
	local dwSkillLevel = sRoleSkill.sInfo.dwSkillLevel;
	
	local sConditionInfo = cfSkill:GetSkillStudyCondition(dwSkillLevel-1);
	
	local objSelf = self:GetPlayer();
	local itemSystem = objSelf:GetSystem("CItemSystem");
	local fiveSystem = objSelf:GetSystem("CFiveElemSystem");
	
	--钱
	if sConditionInfo.dwMoney > 0 then
		itemSystem:CostPacketMoney(sConditionInfo.dwMoney, _G.ItemSysOperType.SkillUp);
	end
	
	--真气
	local dwMax = cfSkill:GetSkilledUp(objSelf:GetRoleID(),dwSkillLevel-1)
	local fKnowPer = 1 - sRoleSkill.sInfo.dwSkillKnowValue/dwMax;
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = fiveSystem:GetElemValue()	
	--local fiveSystem = objSelf:GetSystem("CFiveElemSystem");
	--print("CSkillSystem:CostSkillUp",sRoleSkill.sInfo.dwSkillKnowValue,dwMax)
	fiveSystem:ChangeAttr("dwMetalValue",0-math.ceil(sConditionInfo.dwGold*fKnowPer));
	fiveSystem:ChangeAttr("dwWoodValue",0-math.ceil(sConditionInfo.dwWood*fKnowPer));
	fiveSystem:ChangeAttr("dwWaterValue",0-math.ceil(sConditionInfo.dwWater*fKnowPer));
	fiveSystem:ChangeAttr("dwFireValue",0-math.ceil(sConditionInfo.dwFire*fKnowPer));
	fiveSystem:ChangeAttr("dwEarthValue",0-math.ceil(sConditionInfo.dwSoil*fKnowPer));
	local setData = {
		[1] = {dwCurrent = uItemGold, dwChange = 0-math.ceil(sConditionInfo.dwGold*fKnowPer)};
		[2] = {dwCurrent = uItemWood, dwChange = 0-math.ceil(sConditionInfo.dwWood*fKnowPer)};
		[3] = {dwCurrent = uItemWater, dwChange = 0-math.ceil(sConditionInfo.dwWater*fKnowPer)};
		[4] = {dwCurrent = uItemFire, dwChange = 0-math.ceil(sConditionInfo.dwFire*fKnowPer)};
		[5] = {dwCurrent = uItemEarth, dwChange = 0-math.ceil(sConditionInfo.dwSoil*fKnowPer)};
	}
	CLogSystemManager:zhenqi(objSelf, setData, _G.FiveElemSysOperType.CostSkillUp)	
	--熟练度
	sRoleSkill.sInfo.dwSkillKnowValue = 0;
	sRoleSkill.sInfo.bIsUpdate = sConditionInfo.dwCanUp;
	
end;

--锁定目标消息
function CSkillSystem:LockTargetRequest(dwType,dwID)
	local objSelf = self:GetPlayer();
	local buffSystem = objSelf:GetSystem("CBuffSystem");
	local objMap = objSelf:GetSystem("CMapSystem"):GetCurMap();
	
	--原来锁定怪物的话，取消Buff关注
	if self.dwTargetType == enEntType.eEntType_Monster then
		local objOldMonster = objMap:GetMonsterByObjID(self.dwTargetID);
		if objOldMonster then
			objOldMonster:GetSystem("CMonsterBuffSystem"):UnRegisterSystem(objSelf:GetRoleID());
		end
	end
	
	if dwType == enEntType.eEntType_Player then
		buffSystem:RegisterSystem(dwID)
		
		--发送目标的战斗力信息
		-- local objTarget = objMap:GetPlayerByRoleID(dwID);
		-- if objTarget then
			-- local objSklSys = objTarget:GetSystem("CSkillSystem");
			-- if objSklSys then
				-- local tbBattleScoreInfo = objSklSys:CountBattleScoreInfo();
				-- local tbSend = {};
				-- for n,v in pairs(tbBattleScoreInfo)do
					-- local dw = BattleScoreName2Index(n);
					-- if dw then
						-- tbSend[dw] = v;
					-- end
				-- end
				-- objSelf.OnOtherBattleScoreInfoMsg
				-- {
					-- RoleID = dwID;
					-- FromType = 1;
					-- ScoreInfo = tbSend;
				-- }
			-- end
		-- end
	elseif dwType == enEntType.eEntType_Monster then
		buffSystem:UnRegisterSystem();
		
		--关注新怪物的Buff
		local objMonster = objMap:GetMonsterByObjID(dwID);
		if objMonster then
			objMonster:GetSystem("CMonsterBuffSystem"):RegisterSystem(objSelf:GetRoleID());
		end
	end
	
	self.dwTargetType = dwType;
	self.dwTargetID = dwID;
end;

--玩家执行了某个技能
function CSkillSystem:ExecSkillRequest(dwSkillID,arrParam,dwExecTime,tbExecList)
	-- local sRoleSkill = self.setAllSkill[dwSkillID]; 
	
	-- if not sRoleSkill then
		-- self:SendSkillExecCode(dwSkillID,enSkillResult.eSRType_Fail);
		-- return;
	-- end;
	-- --执行技能
	-- if not sRoleSkill:ExecRequest(arrParam,dwExecTime,tbExecList) then
		-- self:SendSkillExecCode(dwSkillID,enSkillResult.eSRType_Fail);
		-- return;
	-- end;
	
	-- --技能执行成功，掉耐久
	-- self:DealWithSkillEndure(1);
end;

function CSkillSystem:ExecSkillBegin(dwSkillID,dwExecTime,tbExecPoint,tbParamList)
	local sRoleSkill = self.setAllSkill[dwSkillID]; 
	
	if not sRoleSkill then
		self:SendSkillExecCode(dwSkillID,enSkillResult.eSRType_Fail);
		return;
	end;
	
	local cfSkill = SkillConfig[dwSkillID];
	if not cfSkill then
		self:SendSkillExecCode(dwSkillID,enSkillResult.eSRType_Fail);
		return;
	end;
	
	--检测上一次技能执行时间
	local dwNow = GetCurTime();
	if self.tmExecSkill and (cfSkill.dwCDGroup >= 0) then
		if dwNow - self.tmExecSkill < _G.SkillPublicCool then
			self:SendSkillExecCode(dwSkillID,enSkillResult.eSRType_Fail);
			return;
		end
	end
	
	if not sRoleSkill:ExecBegin(dwExecTime,tbExecPoint,tbParamList) then
		self:SendSkillExecCode(dwSkillID,enSkillResult.eSRType_Fail);
	end
	
	if cfSkill.dwCDGroup >= 0 then
		self.tmExecSkill = dwNow;
	end
end;

function CSkillSystem:ExecSkillProc(dwSkillID,tbTargetList,dwActNumber)
	local sRoleSkill = self.setAllSkill[dwSkillID];
	if sRoleSkill then
		sRoleSkill:ExecProcess(tbTargetList,dwActNumber);
	end
end;

--------------------------------------------------------
--逻辑接口
--

--添加一个技能，比如结婚系统需要添加结婚技能
function CSkillSystem:DoAddSkill(dwSkillID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local sRoleSkill = self.setAllSkill[dwSkillID]; --玩家技能信息
	local cfSkill = SkillConfig[dwSkillID]; --技能配置信息
	
	if not cfSkill then
		return;
	end
	
	if sRoleSkill then
		return;
	end
	
	local sInfo = {};
	sInfo.dwRoleID			=  objPlayer:GetRoleID();
	sInfo.dwSkillID			=  dwSkillID;		--技能ID
	sInfo.dwSkillLevel		=  1;		--技能等级
	sInfo.dwSkillKnowValue	=  0;		--技能熟练度
	sInfo.dwOpenFlag 		=  0;
	sInfo.bIsUpdate			=  true;
	
	sRoleSkill = CRoleSkill:new(sInfo,self);
	
	if self.objDBQuery:AddSkillToDB(sRoleSkill:GetInfo()) then
		self:AddSkill(sRoleSkill);
		sRoleSkill:ExecPassiveSkill();
		self:SendSkillInfoToClient(sRoleSkill);
	end;
	
end;

--添加一个临时技能，不存档
function CSkillSystem:DoAddTempSkill(dwSkillID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local sRoleSkill = self.setAllSkill[dwSkillID]; --玩家技能信息
	local cfSkill = SkillConfig[dwSkillID]; --技能配置信息
	
	if not cfSkill then
		return;
	end
	
	if sRoleSkill then
		return;
	end
	
	local sInfo = {};
	sInfo.dwRoleID			=  objPlayer:GetRoleID();
	sInfo.dwSkillID			=  dwSkillID;		--技能ID
	sInfo.dwSkillLevel		=  1;		--技能等级
	sInfo.dwSkillKnowValue	=  0;		--技能熟练度
	sInfo.dwOpenFlag 		=  0;
	sInfo.bIsUpdate			=  nil;
	sInfo.isTempSkill		=  true;
	
	sRoleSkill = CRoleSkill:new(sInfo,self);
	
	self:AddSkill(sRoleSkill);
	sRoleSkill:ExecPassiveSkill();
	self:SendSkillInfoToClient(sRoleSkill);
end;

--改变一个技能的信息,其他系统需要调用
--dwSkillLevel
--dwSkillKnowValue
function CSkillSystem:ChangeSkill(dwSkillID,dwSkillLevel,dwSkillKnowValue)
	local sRoleSkill = self.setAllSkill[dwSkillID]; --玩家技能信息
	
	if not sRoleSkill then
		return false;
	end
	
	if dwSkillLevel then
		if dwSkillLevel ~= sRoleSkill.sInfo.dwSkillLevel then
			sRoleSkill.sInfo.dwSkillLevel = dwSkillLevel;
		end
	end
	
	if dwSkillKnowValue then
		local cfSkill = SkillConfig[self:GetID()];
		if not cfSkill then
			return;
		end
		local dwMax = cfSkill:GetSkilledUp(0,self.sInfo.dwSkillLevel);
		
		if dwSkillKnowValue > dwMax then
			dwSkillKnowValue = dwMax
		end
		
		sRoleSkill.sInfo.dwSkillKnowValue = dwSkillKnowValue;
	end
	
	self:SendSkillInfoToClient(sRoleSkill);
	sRoleSkill.sInfo.bIsUpdate = true;
	
	return true;
end;

function CSkillSystem:DoDelSkill(dwSkillID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	local sRoleSkill = self.setAllSkill[dwSkillID]; --玩家技能信息
	if not sRoleSkill then
		return false;
	end
	
	if self.objDBQuery:DelSkillToDB(dwSkillID) then
		local cfSkill = SkillConfig[sRoleSkill:GetID()];
		if cfSkill then
			if cfSkill.EventSkillDelete then
				cfSkill:EventSkillDelete(sRoleSkill);
			end
		end
		
		
		self.setAllSkill[dwSkillID] = nil;
		
		objPlayer.OnDelSkillInfoMsg{SkillID = dwSkillID};
	end;
	return true;
end;

--被攻击
function CSkillSystem:BeAttack(objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit,dwExecTime,dwActCount)
	self:ExecSkillEvent("EventHurtP",self:GetPlayer(),objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit,dwExecTime,dwActCount);
	
	--被攻击掉耐久
	self:DealWithSkillEndure(2);
end;

--被治疗
function CSkillSystem:BeTreat(objDoctor,objExecSkill,dwCureValue,dwActCount)
	self:ExecSkillEvent("EventTreatP",self:GetPlayer(),objDoctor,objSkill,dwCureValue);
	
	--被治疗后，自己的战斗状态要传染
	if objDoctor:GetObjType() == enEntType.eEntType_Player then
		if self:GetPlayer():GetSystem("CStateSystem").dwCurState == enPlayerState.ePS_Fight then
			objDoctor:GetSystem("CStateSystem"):ChangeState(enPlayerState.ePS_Fight);
		end
	end
end;

function CSkillSystem:ExecSkillEvent(szFuncName,...)
	local args = {...};
	
	local dwRsl = nil;
	for dwID,objSkill in pairs(self.setAllSkill) do
		local cfSkill = SkillConfig[dwID];
		if cfSkill then
			local eventFunc = cfSkill[szFuncName];
			if eventFunc then
				dwRsl = dwRsl or eventFunc(cfSkill,objSkill,unpack(args));
			end
		end
	end
	
	return dwRsl;
end;

--技能学习条件的限制
function CSkillSystem:CheckSkillStudyCondition(dwSkillID)
	local cfSkill = SkillConfig[dwSkillID];
	if not cfSkill then
		return;
	end
	local sRoleSkill = self.setAllSkill[dwSkillID];
	
	local dwSkillLevel = 0;
	local dwSkillValue = 0;
	if sRoleSkill then
		dwSkillLevel = sRoleSkill.sInfo.dwSkillLevel;
		dwSkillValue = sRoleSkill.sInfo.dwSkillKnowValue;
	end
	
	local sConditionInfo = cfSkill:GetSkillStudyCondition(dwSkillLevel);
	
	if not sConditionInfo.dwCanUp then
		--print("level show diffrent")
		return false;
	end
	
	--职业
	if sConditionInfo.dwProfession ~= 0 and sConditionInfo.dwProfession ~= objSelf:GetInfo().dwProf then
		return false;
	end
	
	local objSelf = self:GetPlayer();
	local itemSystem = objSelf:GetSystem("CItemSystem");
	
	--等级
	if sConditionInfo.dwLevel > objSelf:GetLevel() then
		--print("level show diffrent",sConditionInfo.dwLevel,objSelf:GetLevel())
		return false;
	end
	
	--书籍
	if dwSkillLevel == 0 then
		if sConditionInfo.dwBookId ~= 0 then
			local dwCounts, dwBindNum, dwUnBindNum = itemSystem:GetEnumItemNumInPacket(sConditionInfo.dwBookId);
			if dwCounts <= 0 then
				return false;
			end
		end
	end
	
	--钱
	if dwSkillLevel > 0 then
		if not itemSystem:IsPacketMoneyEnough(sConditionInfo.dwMoney) then
			--print("money not enough")
			return false
		end
	end
	
	--真气，五个
	if dwSkillLevel > 0 then
		local dwMax = cfSkill:GetSkilledUp(objSelf:GetRoleID(),dwSkillLevel)
		local fKnowPer = 1 - dwSkillValue/dwMax;
		if dwMax == 0 then
			fKnowPer = 1
		end
		local fiveSystem = objSelf:GetSystem("CFiveElemSystem");
		local dwGold,dwWood,dwWater,dwFire,dwSoil = fiveSystem:GetElemValue();
		
		if math.ceil(sConditionInfo.dwGold*fKnowPer) > dwGold then
			return false;
		end
		
		if math.ceil(sConditionInfo.dwWood*fKnowPer) > dwWood then
			return false;
		end
		
		if math.ceil(sConditionInfo.dwWater*fKnowPer) > dwWater then
			return false;
		end
		
		if math.ceil(sConditionInfo.dwFire*fKnowPer) > dwFire then
			return false;
		end
		
		if math.ceil(sConditionInfo.dwSoil*fKnowPer) > dwSoil then
			return false;
		end
	end
	
	return true;
end;

function CSkillSystem:BeginMoveAction(dwTime,vecPos)
	local objMapSys = self:GetPlayer():GetSystem("CMapSystem");
	
	objMapSys:BeginMoveAction(dwTime,vecPos);
end;

function CSkillSystem:StopMoveAction()
	local objMapSys = self:GetPlayer():GetSystem("CMapSystem");
	objMapSys:EndMoveAction();
end;

--装备掉耐久
--dwMode:1--攻击；2--防御
function CSkillSystem:DealWithSkillEndure(dwMode)
	self:GetPlayer():GetSystem("CItemSystem"):DealWithSkillEndure(dwMode);
end;

function CSkillSystem:CountAllSkillLevel(isBaseLevel)
	local dwResult = 0;
	
	local tbCanLearnEX = self:GetMyAllCanLearnSkill();
	local tbCanLearn = {}
	for n,v in pairs(tbCanLearnEX)do
		tbCanLearn[v] = 1;
	end
	
	for n,v in pairs(self.setAllSkill)do
	
		if tbCanLearn[n] then
			local dwSkillLevel = v:GetLevel(isBaseLevel);
			
			dwResult = dwResult + dwSkillLevel;
		end
	
	end
	
	return dwResult;
end;

function CSkillSystem:GetSkillLevel(dwSkillID,isBaseLevel)
	local objRoleSkill = self.setAllSkill[dwSkillID];
	if not objRoleSkill then
		return 0;
	end
	
	return objRoleSkill:GetLevel(isBaseLevel);
end;

--计算战斗力信息
function CSkillSystem:CountBattleScoreInfo()
	--如果是跨服战直接返回
	if CConfig.bIsCrossSvr and self.CrossSvrBattleScore then
		return self.CrossSvrBattleScore;
	end
	
	local tbMyInfo = CBattleScoreInfo:new();
	
	local objSelf = self:GetPlayer();
	if not objSelf then
		return tbMyInfo;
	end
	
	--修正值计算
	local dwPulseEx = 0;
	local dwMountEx = 0;
	local dwSwordEx = 0;
	local dwAmultEx = 0;
	local dwSkillEx = G_GetSkillCorVawlue(self:CountAllSkillLevel());
	
	local objPulse = objSelf:GetSystem("CPulseSystem");
	local dwPulseValue = 0;
	if objPulse then
		dwPulseValue = objPulse:GetFightValue();
		dwPulseEx = G_GetPulseCorValue(objPulse:GetPulseNum());
	end
   
	local objBourn = objSelf:GetSystem("CBournSystem");
	local dwBournValue = 0;
	if objBourn then
	    dwBournValue = objBourn:GetFightValue();
	end
	
	local objMount = objSelf:GetSystem("CMountSystem");
	local dwMountValue = 0;
	if objMount then
		dwMountValue = objMount:GetActiveMountPoint();
		dwMountEx = G_GetMountCorValue(objMount:GetMountGrade());
	end
	
	local objItemSys = objSelf:GetSystem("CItemSystem");
	local dwAllEquipValue = 0;
	local dwAllStoneValue = 0;
	if objItemSys then
		dwAllEquipValue = objItemSys:GetAllEquipScore();
		dwAllStoneValue = objItemSys:GetAllStoneScore();
	end
	
	local objSword = objSelf:GetSystem("CSwordSystem");
	local objSwordFoundry = objSelf:GetSystem("CSwordFoundrySystem");
	local dwSwordValue = 0;
	if objSword then
		dwSwordValue = objSword:GetMarkValueStr() + objSwordFoundry:GetMarkValueStr();
		dwSwordEx = G_GetSwordCorValue(objSword:GetSwordLadder());
	end
	
	local objAmulet = objSelf:GetSystem("CAmuletSystem");
	local dwAmuletValue = 0;
	if objAmulet then
		dwAmuletValue = objAmulet:GetScore();
		dwAmultEx = G_GetAmuletCorValue(objAmulet:GetLevel());
	end
	
	local objGuild = objSelf:GetSystem("CGuildSystem");
	local dwGuildValue = 0;
	if objGuild then
	    dwGuildValue = 0;
	end
	
	local objCollect = objSelf:GetSystem("CCollectSystem");
	local dwCollectValue = 0;
	if objCollect then
	    dwCollectValue = objCollect:GetRewardScore();
	end
	
	
	local dwExValue = dwPulseEx + dwMountEx + dwSwordEx + dwAmultEx + dwSkillEx;
	CBattleScoreInfo.GetAllScore(tbMyInfo,self:GetInfo(),dwExValue);
------------------------------------------------------------------------------
	CBattleScoreInfo.GetPulseScore(tbMyInfo,dwPulseValue);	
	CBattleScoreInfo.GetBournScore(tbMyInfo,dwBournValue);
	CBattleScoreInfo.GetSkillScore(tbMyInfo,self:CountAllSkillLevel(),dwSkillEx);
	CBattleScoreInfo.GetMountScore(tbMyInfo,dwMountValue);
	CBattleScoreInfo.GetEquipScore(tbMyInfo,dwAllEquipValue);
	CBattleScoreInfo.GetStoneScore(tbMyInfo,dwAllStoneValue);
	CBattleScoreInfo.GetSwordScore(tbMyInfo,dwSwordValue);
	CBattleScoreInfo.GetAmuletScore(tbMyInfo,dwAmuletValue);
	CBattleScoreInfo.GetGuildScore(tbMyInfo,dwGuildValue);
	CBattleScoreInfo.GetCollectScore(tbMyInfo,dwCollectValue);
	
	CBattleScoreInfo.TableFormat(tbMyInfo)
	
	return tbMyInfo;
end;


function CSkillSystem:SkillKnowledgeMax()
	for id,objSkill in pairs(self.setAllSkill)do
		objSkill:AddSkillKnowValue(500);
	end
end

--得出技能界面中我可以学习的所有技能
function CSkillSystem:GetMyAllCanLearnSkill()
	local tbResult = {};
	local dwProf = self:GetPlayer():GetInfo().dwProf;
	local tbSelf = SkillUIConfig[dwProf];
	local tbJueXue = SkillUIConfig[99][dwProf];
	
	for _,tb in pairs(tbSelf)do
		for n,v in pairs(tb)do
			table.insert(tbResult,v);
		end
	end
	
	for _,tb in pairs(tbJueXue)do
		for n,v in pairs(tb)do
			table.insert(tbResult,v);
		end
	end
	
	return tbResult;
end;
-----------------------------------修正值计算---------------------------
function CSkillSystem:CountPulseNum()
    local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	local objPulse = objSelf:GetSystem("CPulseSystem");
    local num = 0;
    for i =1,8 do
		local index = 'dwPulse'..i
	    if objPulse[index] == 24 then
		   num = num + 1
		end
	end
	return num;
end
function CSkillSystem:CountCorPulseValue()  --计算筋脉修正值
    local num = self:CountPulseNum();
    local pulseValue = G_GetPulseCorValue(self:CountPulseNum());
	return pulseValue;
end
function CSkillSystem:CountCorMountValue()  --计算坐骑修正值
    local mountValue = 0;
    local objSelf = self:GetPlayer();
	if not objSelf then
	    return;
	end 
	local objMount = objSelf:GetSystem("CMountSystem");
    mountValue = G_GetMountCorValue(objMount:GetMaxMountGrade());
	return mountValue;
end
function CSkillSystem:CountCorSwordValue()  --计算名剑修正值
    local swordValue = 0;
    local objSelf = self:GetPlayer();
	if not objSelf then
	    return;
	end 
	local objSword = objSelf:GetSystem("CSwordSystem")
    swordValue = G_GetSwordCorValue(objSword:GetSwordLadder());
	return swordValue;
end
function CSkillSystem:CountCorAmuletValue()  --计算宝甲修正值
    local amuletValue = 0;
    local objSelf = self:GetPlayer()
	if not objSelf then
	    return;
	end
	local objAmulet = objSelf:GetSystem("CAmuletSystem")
    amuletValue = G_GetAmuletCorValue(objAmulet:GetLevel());
	return amuletValue;
end
-- function CSkillSystem:CountCorLevelValue()
    -- local levelValue = G_GetLevelCorValue(CPlayerSystem:GetLevel())
	-- return levelValue;
-- end 
------------------------------------------------------------------------


--宝甲技能的触发
function CSkillSystem:EventAmuletSkillHurtReady(objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return ;
	end
	
	local objAmuletSys = objSelf:GetSystem("CAmuletSystem");
	if not objAmuletSys then
		return;
	end
	
	local dwSkill = objAmuletSys:GetSkillID();
	if not dwSkill or (dwSkill == 0) then
		return;
	end
	
	local cfgAmuletSkill = SkillConfig[dwSkill];
	if cfgAmuletSkill and cfgAmuletSkill.EventAmuletHurtReady then
		cfgAmuletSkill:EventAmuletHurtReady(objSelf,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit);
	end
end;

function CSkillSystem:EventAmuletSkillHurtEnd(objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return ;
	end
	
	local objAmuletSys = objSelf:GetSystem("CAmuletSystem");
	if not objAmuletSys then
		return;
	end
	
	local dwSkill = objAmuletSys:GetSkillID();
	if not dwSkill or (dwSkill == 0) then
		return;
	end
	
	local cfgAmuletSkill = SkillConfig[dwSkill];
	if cfgAmuletSkill and cfgAmuletSkill.EventAmuletHurtEnd then
		cfgAmuletSkill:EventAmuletHurtEnd(objSelf,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit);
	end
end;


-------------------------------------------------------------------------------
--技能增加临时等级
--tbSkillList = {[技能ID] = 技能层数}
function CSkillSystem:SetSkillLevel(tbSkillList,szSystemName)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return ;
	end
	
	local isChged = false;
	local tbChgList = {};
	for dwSkillID,dwAddLevel in pairs(tbSkillList)do
		-- print("===CSkillSystem:SetSkillLevel 1.0===",dwSkillID,dwAddLevel)
		if self:SetSkillLevelSingle(dwSkillID,dwAddLevel,szSystemName,tbChgList) then
			isChged = true;
		end
	end
	
	if isChged then
		--同步客户端
		if objSelf:IsLoadEnd() then
			objSelf.OnSkillAddChangeMsg
			{
				SkillList = tbChgList;
			}
		end
	end
end;


function CSkillSystem:SetSkillLevelSingle(dwSkillID,dwAddLevel,szSystemName,tbChgList)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return false;
	end
	
	--判断这个技能是否是职业专属技能
	if SkillOwnerProf[dwSkillID] then
		if SkillOwnerProf[dwSkillID] ~= objSelf:GetProf() then
			return false;
		end
	end
	
	if not self.setSkillLevel[dwSkillID] then
		self.setSkillLevel[dwSkillID] = {};
	end
	
	local tbList = self.setSkillLevel[dwSkillID];
	
	local dwOldLevel = tbList[szSystemName] or 0;
	tbList[szSystemName] = dwAddLevel;
	
	if dwOldLevel ~= dwAddLevel then
		--重新计算技能效果
		local objSkill = self.setAllSkill[dwSkillID];
		if objSkill then
			if objSkill:IsActive() then
				objSkill:ExecPassiveSkill();
				objSkill:ExecModeReset();
			end
		end
		
		tbChgList[dwSkillID] = self:GetSkillAddLevel(dwSkillID);
		
		return true;
	end
	
	return false;
end;

function CSkillSystem:ClearSkillAddLevel(szSystemName)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return ;
	end
	
	local tbChgList = {};
	local isChged = false;
	
	for dwSkillID,tbList in pairs(self.setSkillLevel)do
		if tbList[szSystemName] then
			tbList[szSystemName] = nil;
			
			isChged = true;
			--重新计算技能效果
			local objSkill = self.setAllSkill[dwSkillID];
			if objSkill then
				if objSkill:IsActive() then
					objSkill:ExecPassiveSkill();
					objSkill:ExecModeReset();
				end
			end
				
			tbChgList[dwSkillID] = self:GetSkillAddLevel(dwSkillID);
		end
	end
	
	if isChged then
		--同步客户端
		if objSelf:IsLoadEnd() then
			objSelf.OnSkillAddChangeMsg
			{
				SkillList = tbChgList;
			}
		end
	end
end;

function CSkillSystem:GetSkillAddLevel(dwSkillID)
	local tbList = self.setSkillLevel[dwSkillID];
	
	if not tbList then
		return 0;
	end
	
	local dwRsl = 0;
	for k,v in pairs(tbList)do
		dwRsl = dwRsl + v;
	end
	
	return dwRsl;
end;

-------------------------------------------------------------------------------
--设置技能参数
function CSkillSystem:SetSkillParam(dwSkillID,dwIndex,fValue)
	local objSkill = self.setAllSkill[dwSkillID];
	if not objSkill then
		return;
	end
	
	objSkill:ChangeParam(dwIndex,fValue);
end;
