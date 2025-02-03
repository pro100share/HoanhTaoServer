--����ս���߼�
-------------------------------------------------------------------------------


--[[
���ܣ�����Ĺ��������ˣ����Ƶ���ֵ���㴦��
]]

--local fDeadEndureDown = 0.03;


-- function CPetObject:OnChangeLineEnd()
	-- local objPlayer = self:GetPlayer();
	-- if not objPlayer then
		-- return false;
	-- end;
	
	-- objPlayer.OnPlayerDeadMsg{DeadFlag = 0};
-- end;

function CPetObject:IsDead()
	return self:GetBattleInfo().dwHP <= 0 or self.dwDeadFlag == 1;
end;

function CPetObject:Destroy()
	--�����������سǸ���Ĵ���
	-- if self.dwDeadFlag == 1 then
		-- local objPlayer = self:GetPlayer();
		-- local objSkillSystem = objPlayer:GetSystem("CSkillSystem");
		-- objSkillSystem.sBaseInfo.dwHP = objSkillSystem:GetInfo().dwHPMax/2;
		-- objSkillSystem.sBaseInfo.dwMP = objSkillSystem:GetInfo().dwMPMax/2;
		-- local mapSystem = objPlayer:GetSystem("CMapSystem");
		
		-- local CurMap = mapSystem:GetCurMap();
		-- if not CurMap then
			-- _info("CurMap id error");
			-- return false;
		-- end;
		
		-- local vRelivePos = CurMap:GetRelivePoint();
		
		-- --mapSystem.dwCurMapID = dwReliveMap;
		-- --mapSystem:UpdatePos(vRelivePos.x,vRelivePos.y)
		-- mapSystem.fXPos = vRelivePos.fXPos;		--��ҵ�xλ��
		-- mapSystem.fYPos = vRelivePos.fYPos;		--��ҵ�Yλ��
		
		-- --objSkillSystem.objDBQuery:SaveBattleInfo(objSkillSystem:MakeBattleInfoForDB());
		-- --mapSystem.objDBQuery:SaveMapInfo()
		
		-- --print("dead active !")
	-- end
end;

function CPetObject:IsCanBeAttackByMonster()
	if self:IsDead() then
		return false;
	end

	--����û�г�ս 
	if self.dwState == 1 then
		return false;
	end
	
	local objSelf = self:GetOwnerRole();
	if not objSelf then
		return false;
	end
	if not objSelf:IsLoadEnd() then
		return false;
	end
	
	local objPlayerSkill = objSelf:GetSystem("CSkillSystem")
	if not objPlayerSkill then
		return false;
	end
	
	local objPetSys = objSelf:GetSystem("CPetSystem")
	if not objPetSys then
		return false;
	end
	
	local objPetSklSys = objPetSys:GetPetSikllSystem();
	if not objPetSklSys then
		return false;
	end
	if objPlayerSkill:GetInfo().dwStoryFlag == 1 then
		return false;
	end
	
	return true;
end

--�յ��˺�
function CPetObject:Hurt(dwHurtValue,isCrit,objEnemy,dwSkillID,dwSkillLevel,dwExecTime,dwActCount)
	-- local objSklSystem = self:GetOwnerRole():GetSystem("CPetSystem"):GetPetSikllSystem();
	
	-- local dwUsedValue = objSklSystem:ExecSkillEvent("EventReadyHurtP",self,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit);
	-- if dwUsedValue then
		-- dwHurtValue = dwUsedValue;
	-- end
	
	
	local dwEnemyType = objEnemy:GetObjType();
	local dwEnemyID = objEnemy:GetRoleID();
	
	--��������
	local objPassivitySkill = self:GetOwnerRole():GetSystem("CPetSystem"):GetPetSikllSystem().PassivitySkill;
	
	--�����˺����⣨���ﱻ�����ܣ�
	dwHurtValue = objPassivitySkill:CalPetPassSkiToSelfHurt(self:GetEnumID(), dwHurtValue);
	--��һ���˺���Сֵ����
	if dwHurtValue <= 0 then dwHurtValue = 1 end;
	
	dwHurtValue = self.sysAttr:ChgHP(0-dwHurtValue,isCrit,dwEnemyType,dwEnemyID);
	-- objSklSystem:ExecSkillEvent("EventHurtP",self,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit,dwExecTime,dwActCount);
	
	--�����˺�
	local reboundHurtValue = objPassivitySkill:CalPetPassSkiToTarHurt(self:GetEnumID());
	local petid = self:GetEnumID();
	local petlevel = self:GetLevel();
	--����ID 20000035 ��һ�����ﷴ��ר�õļ���id
	if reboundHurtValue > 0 and dwSkillID ~= 20000035 then
		CSkillPlayerManager:Ready(objEnemy,20000035,1);
	
		if dwEnemyType == enEntType.eEntType_Player then
			local objDefBattle = objEnemy:GetSystem("CBattleSystem");
			if not objDefBattle then
				_info("get objDefBattle fail in CPetObject:Hurt");
				return dwHurtValue;
			end
			reboundHurtValue = objDefBattle:Hurt(reboundHurtValue,isCrit,self,20000035,1,dwExecTime,1);
		elseif dwEnemyType == enEntType.eEntType_Monster then
			reboundHurtValue = objEnemy:Hurt(reboundHurtValue,isCrit,self,20000035,dwExecTime,1);
			--print("reboundHurtValue===========1111>>",reboundHurtValue)
		elseif dwEnemyType == enEntType.eEntType_Pet then
			if(reboundHurtValue > _G.PetBaseInfo[petid](petlevel).dwHurtMax) then  ------�������̶��˺�����
				reboundHurtValue = _G.PetBaseInfo[petid](petlevel).dwHurtMax;
			end
			reboundHurtValue = objEnemy:Hurt(reboundHurtValue,isCrit,self,20000035,1,dwExecTime,1);
		end
		
		CSkillPlayerManager:End(objEnemy,20000035,1,dwExecTime,true)
	end
	
	--�������ˣ���ɫǿ�Ʊ�Ϊս��״̬
	local objSelf = self:GetOwnerRole();
	if objSelf then
		local sysState = objSelf:GetSystem("CStateSystem");
		if sysState then
			sysState:ChangeState(enPlayerState.ePS_Fight);
		end
	end
	
	return dwHurtValue;
end;

--�յ�����
function CPetObject:Treat(dwCureValue,objDoctor,objSkill,dwActCount)
	-- local objSelf = self:GetPlayer();
	
	-- local objSklSystem = objSelf:GetSystem("CSkillSystem");
	
	-- local dwUsedValue = objSklSystem:ExecSkillEvent("EventReadyTreatP",objSelf,objDoctor,objSkill,dwCureValue);
	-- if dwUsedValue then
		-- dwCureValue = dwUsedValue;
	-- end
	
	-- local dwEnemyType = objDoctor:GetObjType();
	-- local dwEnemyID = objEnemy:GetRoleID();
	-- -- if dwEnemyType == enEntType.eEntType_Player then
		-- -- dwEnemyID = objDoctor:GetRoleID();
	-- -- elseif dwEnemyType == enEntType.eEntType_Monster then
		-- -- dwEnemyID = objDoctor.ObjId;
	-- -- end
	
	-- objSklSystem:ChgHP(dwCureValue,false,dwEnemyType,dwEnemyID,objSkill:GetID(),objSkill.dwLastExecTime,dwActCount);
	
	-- objSklSystem:BeTreat(objDoctor,objSkill,dwCureValue,dwActCount);
end;

--�����ж�
function CPetObject:HitJudge(objPetSkill,cfSkill,objEnemy,dwActCount)
	local dwHitValue = CBattleCalculator:HitCalculator(self,objEnemy);
	-- if cfSkill["EventHitChange"] then
		-- dwHitValue = cfSkill:EventHitChange(objPetSkill,objEnemy,dwHitValue,dwActCount);
	-- end
	
	local dwRand = math.random(10000);
	
	if dwRand <= dwHitValue then
		return true;
	end
	
	return false;
end;

--�˺�����
function CPetObject:DamageCount(objPetSkill,objEnemy,dwActCount)
	local cfSkill = SkillConfig[objPetSkill:GetID()];
	--�����ж�
	local isCrit = false;
	if self:CritJudge(objPetSkill,cfSkill,objEnemy,dwActCount) then
		isCrit = true;
	end
	
	local dwLastValue = CBattleCalculator:DamageCalculator(objPetSkill:GetID(),objPetSkill:GetLevel(),self,objEnemy,isCrit);
	
	-- local dwUsedValue = objPetSkill.objSklSystem:ExecSkillEvent("EventDamageChange",self,objEnemy,objPetSkill:GetID(),objPetSkill:GetLevel(),dwLastValue,isCrit);
	-- if dwUsedValue then
		-- dwLastValue = dwUsedValue;
	-- end
	
	return dwLastValue,isCrit;
end;

--�����ж�
function CPetObject:CritJudge(objPetSkill,cfSkill,objEnemy,dwActCount)
	local dwCritValue = CBattleCalculator:CritCalculator(self,objEnemy);
	-- if cfSkill["EventCritChange"] then
		-- dwCritValue = cfSkill:EventCritChange(objPetSkill,objEnemy,dwCritValue);
	-- end

	local dwRand = math.random(10000);
	
	--print("dwCritValue = "..dwCritValue)
	
	if dwRand <= dwCritValue then
		--print("crit execute!")
		return true;
	end
	
	return false;
end;

--��������
function CPetObject:Dead(dwEnemyType,dwEnemyID)
	local objSelf = self:GetOwnerRole();
	--�㲥���ͻ���
	self:BroadcastDeadMsg(dwEnemyType, dwEnemyID);
	
	
	--��������
	self.dwDeadFlag = 1;
	self.dwLastDieTime = GetCurTime();
	
	--�ջس���
	self:GetOwnerRole():GetSystem("CPetSystem"):OnPetStateChg(self.dwEnumID,1)
	
	--��������ʱִ�г��︴���߼�
	
	local func = _G.PetBaseInfo[self.dwEnumID];
	if func then
		local tbBase = func(self:GetOwnerLevel());
		
		local petSys = self:GetOwnerRole():GetSystem("CPetSystem");
		
		self.dwTimeID = CTimer:AddTimer(tbBase.deadDelayTime + 10 ,false,
		function() 
		self:JudgePetDeadState(petSys)
		end);
	end
	
	
	-- local objMapSystem = objSelf:GetSystem("CMapSystem");
	-- if not objMapSystem then
		-- return;
	-- end
	
	-- local dwPKValue = objSelf:GetSystem("CPKSystem").dwPKValue;
	
	-- local dwOwnerID = 0;
	
	-- --����ɱ������PK����BUFF
	-- if dwEnemyType == enEntType.eEntType_Player then
		-- dwOwnerID = dwEnemyID;
		
	-- elseif dwEnemyType == enEntType.eEntType_Monster then
		-- local objMonster = nil;
		
		-- local objMap = objMapSystem:GetCurMap()
		-- if objMap then
			-- objMonster = objMap:GetMonsterByObjID(dwEnemyID);
		-- end
		-- if objMonster then
			-- objSelf:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventBeKilled,1,dwEnemyID,2,objMonster:GetID());
		-- end
	-- elseif dwEnemyType == enEntType.eEntType_Pet then
		-- dwOwnerID = dwEnemyID;
	-- --���ﲻ����ɱ
	-- elseif dwEnemyType == -1 then
		-- objSelf:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventBeKilled,1,0,3,0);
	-- end
	
	--objSelf:BattleChange()
end;

--�㲥������ص���Ϣ
function CPetObject:BroadcastDeadMsg(dwEnemyType,dwEnemyID)
	local objPlayer = self:GetOwnerRole();
	if not objPlayer then
		return false;
	end;
	
	--������Ұ�е���
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	
	_mapcallout("PetDeadMsg", 
	{
		RoleID = self.dwRoleID,
		PetID = self.dwEnumID,
		EnemyType = dwEnemyType;
		EnemyID = dwEnemyID;
	}, 
	objMapSystem:GetLogicID(), true)
end

function CPetObject:Relive(sysPet)
	self.dwDeadFlag = 0;	--������־��1��������0������
	--��Ѫ
	self.sysAttr:FillHP();
	self.dwLastDieTime = 0;
	sysPet:DBPetHpChg(self:GetEnumID(), self:GetBattleInfo().dwHP, self:GetLastDieTime());
end;