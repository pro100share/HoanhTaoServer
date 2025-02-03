--[[
	怪物系统 AI系统 战斗状态
	周长沙
	2012-4-16
--]]

_G.CMonsterAIFight = CMonsterAIStateBase:new()
local dwStateId = MonsterState.FightIng
------------------------------------------------
--新建
function CMonsterAIFight:new()
	local objState = {}
	for k,v in pairs(CMonsterAIFight) do
		if type(v)=="function" then
			objState[k] = v
		end
	end
	return objState
end
------------------------------------------------
-------------------------------------------基础
--创建
function CMonsterAIFight:Create(objMon,sysMonsterAI)
	self.objMon = objMon							--怪物对象
	self.sysMonsterAI = sysMonsterAI				--AI系统
	self.dwLastStartFightTime = 0					--上次进入战斗状态的时间
	self.dwLastUseSkillTime = 0						--上次使用技能的时间
	self.dwTargetRoleId = 0							--目标的roleid
	self.dwSkillId = sysMonsterAI.dwSkillId			--当前要使用的技能
	self.dwSkillDis = sysMonsterAI.dwSkillDis		--技能的攻击距离
	self.dwSkillDelay = sysMonsterAI.dwSkillDelay	--技能CD
	
	self.Node = nil
end
--进入
function CMonsterAIFight:Enter()
	self.dwLastStartFightTime = GetCurTime()
	local objMon = self:GetMon()
	--恢复默认速度
	local sysMonsterMove = objMon:GetSystem("CMonsterMoveSystem");
	-- local tbPos = sysMonsterMove:GetVPos();
	-- _info("===AI Fight Begin===",objMon:GetRoleID(),tbPos.x,tbPos.y,sysMonsterMove.vPos.x,sysMonsterMove.vPos.y)
	local sysMonsterSkill = objMon:GetSystem("CMonsterSkillSystem");
	sysMonsterSkill:SetDefSpeed()
	-- local tbPos = sysMonsterMove:GetVPos();
	-- _info("===AI Fight After Def Speed===",objMon:GetRoleID(),tbPos.x,tbPos.y,sysMonsterMove.vPos.x,sysMonsterMove.vPos.y)
	--停止移动
	sysMonsterMove:StopMove()
	-- local tbPos = sysMonsterMove:GetVPos();
	-- _info("===AI Fight After stop===",objMon:GetRoleID(),tbPos.x,tbPos.y,sysMonsterMove.vPos.x,sysMonsterMove.vPos.y)
	self.Node = CDriverManager:AddDriver(eInterval._1sec,objMon,CMonster.SayOnFightIng)
	objMon:GetMgr():InsertFightNode(objMon:GetRoleID(),objMon)
end
--更新
function CMonsterAIFight:FastUpdate()
	local objMon = self:GetMon()
	local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
	local sysMonsterMove = objMon:GetSystem("CMonsterMoveSystem")
	local sysMonsterSkill = objMon:GetSystem("CMonsterSkillSystem")
	local Map =objMon:GetMap()
	local dwEnemyType, dwRoleId = sysMonsterAI:GetHatredMaxRole()
	--没有仇恨对象
	if dwRoleId==0 then
		if sysMonsterAI.fAlertDis < 1 then 
			sysMonsterAI:ChangeState(MonsterState.RunBack)
			return;
		end;
		local nodeAIIdel = sysMonsterAI:GetStateNode(MonsterState.Idel)
		local dwRoleId,Player = nodeAIIdel:OnIdelSearchEnemy()
		if dwRoleId then
			sysMonsterAI:AddHatred(enEntType.eEntType_Player,dwRoleId,1)
		else
			sysMonsterAI:ChangeState(MonsterState.RunBack)
		end
		return
	end
	local objTarget = objMon:GetSystem("CMonsterSkillSystem"):GetObjTarget(dwEnemyType, dwRoleId);
	
	--local objTarget = Map:GetPlayerByRoleID(dwRoleId)
	if objTarget then
		local sysBattle = nil;
		if dwEnemyType == enEntType.eEntType_Player then
			sysBattle = objTarget:GetSystem("CBattleSystem");
		elseif dwEnemyType == enEntType.eEntType_Monster then
			sysBattle = nil;
		elseif dwEnemyType == enEntType.eEntType_Pet then
			sysBattle  = objTarget;
		end
		
		if sysBattle and (not sysBattle:IsCanBeAttackByMonster()) then
			--对象如果死亡，则清除仇恨
			sysMonsterAI:DelHatred(dwEnemyType, dwRoleId);
			return;
		end
		--战斗说话
		--objMon:SayOnFightIng()
		--更新攻击距离
		self.dwSkillDis = sysMonsterAI.dwSkillDis
		--更新攻击硬直
		self.dwSkillDelay = sysMonsterAI.dwSkillDelay
		--记录当前目标
		sysMonsterAI:SetTargetRoleId(dwEnemyType, dwRoleId)
		--进入使用技能逻辑
		sysMonsterSkill:UseSkill(dwEnemyType, dwRoleId)
	else
		--找不到玩家
		sysMonsterAI:DelHatred(dwEnemyType, dwRoleId);
	end
end
--离开
function CMonsterAIFight:Exit()
	local objMon = self:GetMon()
	if self.Node then
		CDriverManager:DelDriver(self.Node)
	end
	self.Node = nil
	objMon:GetMgr():RemoveFightNode(objMon:GetRoleID())
end
---------------------------------------------------------------
--事件
---------------------------------------------------------------
--方法
---------------------------------------------------------------
--插入
CMonsterAIManager:InsertState(dwStateId,CMonsterAIFight)



















