--[[
	怪物系统 AI系统 死亡状态
	周长沙
	2012-4-17
--]]
_G.CMonsterAIDead = CMonsterAIStateBase:new()
local dwStateId = MonsterState.Dead

local t_nid = {--常规活动用的
	[20000001] = 1;
	[20000002] = 1;
	[20000003] = 1;
};

local t_fid = {-- 流星雨用的
	[20000010] = 1;
	[20000011] = 1;
};



----------------------------------------------------
--新建
function CMonsterAIDead:new()
	local objState = {}
	for k,v in pairs(CMonsterAIDead) do
		if type(v)=="function" then
			objState[k] = v
		end
	end
	return objState
end
----------------------------------------------------
--创建
function CMonsterAIDead:Create(objMon,sysMonsterAI)
	self.objMon = objMon
	self.sysMonsterAI = sysMonsterAI
	self.objEnemy = nil
	self.dwLastDeadTime = 0
	self.Node = nil
end
--进入
function CMonsterAIDead:Enter(objEnemy,dwPetID)
	local objMon = self:GetMon()
	local objEnemy = objEnemy
	local dwEnemyID = 0;
	if objMon.dwPlayerRoleID then
		local objPlayer = objMon.Map:GetAllPlayer(objMon.dwPlayerRoleID)
		objEnemy = objPlayer or objEnemy
	end
	self.dwLastDeadTime = GetCurTime()

	if not objEnemy then 
		objMon:Dead(dwEnemyID)
		return 
	end;
	dwEnemyID = objEnemy:GetRoleID();
	-- --暂时这样处理 宠物杀怪和玩家杀怪都 用玩家杀死怪物的逻辑处理
	
	-- objEnemy = objMon.Map:GetAllPlayer(dwEnemyID)
	-- if not objEnemy then 
		-- objMon:Dead(dwEnemyID)
		-- return 
	-- end;
    
    --掉落
	local mgrDrop = objMon:GetMap():GetDropMgr()
	mgrDrop:DoDrop(objMon,objEnemy)
	
	local dwMonsterId = objMon:GetID();
	if MonsterDataConfig[dwMonsterId].Summon and MonsterDataConfig[dwMonsterId].Summon == 1 then
		dwMonsterId = _G.MonsterTbl.Monster(dwMonsterId);
	end;
    
	if not CConfig.bIsCrossSvr then
		local sysDupl = objEnemy:GetSystem("CDuplSystem")
		if sysDupl:IsInFb() then
			sysDupl:SetKillNum(objMon:GetMonsterType(), 1,objMon:GetID())
		end
	
		--任务杀怪
		local sysTask = objEnemy:GetSystem("CTaskSystem");
		
		local Hate = objMon:GetSystem("CMonsterAISystem").Hatred or {}
		sysTask:RcvKillMonster(objMon:GetID(),Hate)
		
		--增加经验
		if objEnemy.AddExp then
			local sysDrop = objEnemy:GetSystem("CDropSystem");
			local dropExp = objMon:GetExp()
			sysDrop:DropExp(dropExp,objMon:GetLevel(),sysDupl:IsInFb())
			local dwAddClothExp = LronClothConfig:AddExp(objEnemy, objMon)
			sysDrop:AddClothExp(dwAddClothExp)
			local dwAddClothForbidValue = LronClothConfig:AddForbidValue(objEnemy, objMon:GetLevel())
			sysDrop:AddClothForbidValue(dwAddClothForbidValue);
			if(dwPetID ~= 0) then
				----宠物加经验
				--print("dwPetIDdwPetIDdwPetIDdwPetID",dwPetID)
				local sysPet = objEnemy:GetSystem("CPetSystem");
				local monLevel = objMon:GetLevel();
				local petObj = sysPet:GetPetObj(dwPetID);
				local petLevel = 0;
				if(petObj) then
					petLevel = petObj:GetLevel();
					local monExp = DropFunctionConfig:GetPetExp(petLevel,dropExp,monLevel)
					--print("CMonsterAIDeadCMonsterAIDeadCMonsterAIDead",petLevel,dropExp,monLevel)
					petObj:AddExp(monExp);
				end
			end
		end
		
		
		local objWarSystem = objEnemy:GetSystem("CWarSystem");
		if objWarSystem then
			objWarSystem:EventMonsterKill(objMon);
		end
		
		
		local sysErrant = objEnemy:GetSystem("CErrantSystem");
		sysErrant:UpdateKillMonster(dwMonsterId, objMon:GetGrade())
	end;
	
	objMon:Dead(dwEnemyID)
	
	--通知其他系统
	CBossInfoManager:BossDead(objMon:GetID(),objEnemy:GetRoleID(),objEnemy)
	--------------------------------------------------------------段磊磊 add 2012-3-21,境界需要写到中心系统中去
	--	local sysCBourn = objEnemy:GetSystem("CBournSystem");
	--	sysCBourn:KillMonster(objMon:GetID());
	
	objEnemy:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventKillMonster,1,objMon:GetID(),objMon:GetMonsterType(),objMon:GetLevel());
	if objMon:IsBoss() then
		objEnemy:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventKillBossMonster,1,objMon:GetID(),objMon:GetMonsterType(),objMon:GetLevel(),objMon:GetMap().MapID);
		CLogSystemManager:boss_kill(objEnemy, objMon:GetID())
	end
	if objMon:IsVariation() then
		objEnemy:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventKillVariationMonster,1,objMon:GetID(),objMon:GetMonsterType(),objMon:GetLevel());
	end
	if t_nid[dwMonsterId] then
		objEnemy:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventKillStoneMonster,1,objMon:GetID(),objMon:GetMonsterType(),objMon:GetLevel());
		objEnemy:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventKillNStoneMonster,1,objMon:GetID(),objMon:GetMonsterType(),objMon:GetLevel());
	end
	
	if t_fid[dwMonsterId] then
		objEnemy:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventKillStoneMonster,1,objMon:GetID(),objMon:GetMonsterType(),objMon:GetLevel());
		objEnemy:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventKillFStoneMonster,1,objMon:GetID(),objMon:GetMonsterType(),objMon:GetLevel());
	end
	
	
	---------------------------------------------------------------add end
	local sysMonster = objEnemy:GetSystem("CMonsterSystem")
	sysMonster:SendMonsterDeadEnd(objMon:GetRoleID(),objMon:GetID())
	--if objMon.tbFun and objMon.tbFun.CBMonsterOnDead then
		objMon.tbFun:CBMonsterOnDead(objMon,objEnemy,objEnemy:GetSystem('CScriptSystem'))
	--end
	self.Node = CDriverManager:AddDriver(eInterval._1sec,self,CMonsterAIDead.OnDriver)
	
end
--更新
function CMonsterAIDead:Update()
	local dwNowTime = GetCurTime()
	if dwNowTime - self.dwLastDeadTime > 3500 then
		local objMon = self:GetMon()
		local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
		sysMonsterAI:ChangeState(MonsterState.Idel,MonsterState.Dead)
	end
end
--离开
function CMonsterAIDead:Exit()
	local objMon = self:GetMon()
	self.objEnemy = nil
	objMon.objPlayer = nil
	if self.Node then
		CDriverManager:DelDriver(self.Node,1)
		self.Node = nil
	end
	objMon:Hide()
end
----------------------------------------
--事件
function CMonsterAIDead:OnDriver()
	self.Count = (self.Count or 0) + 1
	if self.Count > 3 then
		self.Count = nil
		local objMon = self:GetMon()
		local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
		sysMonsterAI:ChangeState(MonsterState.Idel,MonsterState.Dead)
	end
end
----------------------------------------
--方法
----------------------------------------
--插入
CMonsterAIManager:InsertState(dwStateId,CMonsterAIDead)















