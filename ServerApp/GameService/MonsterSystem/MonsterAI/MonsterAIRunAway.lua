--[[
	怪物系统 AI系统 返回状态
	周长沙
	2012-4-17
--]]
_G.CMonsterAIRunAway = CMonsterAIStateBase:new()
local dwStateId = MonsterState.RunAway
-----------------------------------------------------
--新建
function CMonsterAIRunAway:new()
	local objState = {}
	for k,v in pairs(CMonsterAIRunAway) do
		if type(v)=="function" then
			objState[k] = v
		end
	end
	return objState
end
-----------------------------------------------------
--创建
function CMonsterAIRunAway:Create(objMon,sysMonsterAI)
	self.objMon = objMon
	self.sysMonsterAI = sysMonsterAI
end
--进入
function CMonsterAIRunAway:Enter()
	local objMon = self:GetMon()
	local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
	sysMonsterAI:SetFightPos(objMon:GetVectorPos())
	self:StarRun()
end
--更新
function CMonsterAIRunAway:Update()
	do return end;
	local objMon = self:GetMon()
	local sysMonsterMove = objMon:GetSystem("CMonsterMoveSystem")
	local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
	if not sysMonsterMove:IsMoving() then
		local dwEnemyType,dwRoleId = sysMonsterAI:GetHatredMaxRole()
		--没有仇恨对象
		if dwRoleId==0 then
			sysMonsterAI:ChangeState(MonsterState.RunBack)
		else
			local objTarget = objMon:GetSystem("CMonsterSkillSystem"):GetObjTarget(dwEnemyType,dwRoleId )
			if objTarget then
				local sysBattle = nil;
				local vPlayerPos = nil
				if dwEnemyType == enEntType.eEntType_Player then
					sysBattle = objTarget:GetSystem("CBattleSystem");
					local sysMapSystem = objTarget:GetSystem("CMapSystem");
					vPlayerPos = sysMapSystem:GetPlayerPos();
				elseif dwEnemyType == enEntType.eEntType_Monster then
					sysBattle = nil;
					vPlayerPos = nil;
				elseif dwEnemyType == enEntType.eEntType_Pet then
					sysBattle  = objTarget;
					vPlayerPos = objTarget:GetPetPos();
				end
				
				if sysBattle.dwDeadFlag == 1 then
					--对象如果死亡，则清除仇恨
					sysMonsterAI:DelHatred(dwEnemyType,dwRoleId);
					return;
				end
				local vMonPos = sysMonsterMove:GetVPos()
				
				if math.sqrt((vMonPos.x-vPlayerPos.x)^2+(vMonPos.y-vPlayerPos.y)^2)>sysMonsterAI.fPursueDis then
					sysMonsterAI:DelHatred(dwEnemyType,dwRoleId);
				else
					self:StarRun()
				end
			else
				sysMonsterAI:DelHatred(dwEnemyType,dwRoleId);
			end
		end
	end
end
--离开
function CMonsterAIRunAway:Exit()
end
-----------------------------------------------------
--事件
function CMonsterAIRunAway:OnMoveEnd()
	local objMon = self:GetMon()
	local sysMonsterMove = objMon:GetSystem("CMonsterMoveSystem")
	local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
	--if not sysMonsterMove:IsMoving() then
		local dwEnemyType,dwRoleId = sysMonsterAI:GetHatredMaxRole()
		--没有仇恨对象
		if dwRoleId==0 then
			sysMonsterAI:ChangeState(MonsterState.RunBack)
		else
			local objTarget = objMon:GetSystem("CMonsterSkillSystem"):GetObjTarget(dwEnemyType,dwRoleId )
			if objTarget then
				local sysBattle = nil;
				local vPlayerPos = nil
				if dwEnemyType == enEntType.eEntType_Player then
					sysBattle = objTarget:GetSystem("CBattleSystem");
					local sysMapSystem = objTarget:GetSystem("CMapSystem");
					vPlayerPos = sysMapSystem:GetPlayerPos();
				elseif dwEnemyType == enEntType.eEntType_Monster then
					sysBattle = nil;
					vPlayerPos = nil;
				elseif dwEnemyType == enEntType.eEntType_Pet then
					sysBattle  = objTarget;
					vPlayerPos = objTarget:GetPetPos();
				end
				
				if sysBattle.dwDeadFlag == 1 then
					--对象如果死亡，则清除仇恨
					sysMonsterAI:DelHatred(dwEnemyType,dwRoleId);
					self:OnMoveEnd()
					return;
				end
				local vMonPos = sysMonsterMove:GetVPos()
				if math.sqrt((vMonPos.x-vPlayerPos.x)^2+(vMonPos.y-vPlayerPos.y)^2)>sysMonsterAI.fPursueDis then
					sysMonsterAI:DelHatred(dwEnemyType,dwRoleId);
					self:OnMoveEnd()
				else
					self:StarRun()
					return;
				end
			else
				sysMonsterAI:DelHatred(dwEnemyType,dwRoleId);
				self:OnMoveEnd()
			end
		end
	--end
end
-----------------------------------------------------
--方法
function CMonsterAIRunAway:StarRun()
	local objMon = self:GetMon()
	local Map =objMon:GetMap()
	local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
	local sysMonsterMove = objMon:GetSystem("CMonsterMoveSystem")
	if sysMonsterAI.fRunAwayDis>0 then
		local fx = sysMonsterAI:GetFightPos().x + math.random(-sysMonsterAI.fRunAwayDis,sysMonsterAI.fRunAwayDis)
		local fy = sysMonsterAI:GetFightPos().y + math.random(-sysMonsterAI.fRunAwayDis,sysMonsterAI.fRunAwayDis)
		local path = {{x=0,y=0},{x=fx,y=fy}}--Map:GetPath(sysMonsterAI:GetFightPos(),{x=fx,y=fy})
		if path then 
			sysMonsterMove:StartMove(path[2].x,path[2].y)
		end
	end
end
-----------------------------------------------------
--插入
CMonsterAIManager:InsertState(dwStateId,CMonsterAIRunAway)



















