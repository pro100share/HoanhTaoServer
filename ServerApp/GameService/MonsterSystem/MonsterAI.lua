---------------------------------------------------------
--[[
--本地函数
math.randomseed(_now())
---------------------------------------------------------
--怪物AI主逻辑
function CMonster:AILogic(dwDelayTime,NowTime)
	local dwState = self.AI.dwNowState
	--移动更新
	if self.AI.bIsMoving then
		self:OnMove(dwDelayTime,NowTime)
	end
	
	--是否要加入死亡判断？？？
	
	--空闲状态
	if dwState == MonsterState.Idel then
		self:OnIdel(dwDelayTime,NowTime)
		return
	end

	--战斗状态
	if dwState == MonsterState.FightIng then
		self:OnFightIng(dwDelayTime,NowTime)
		return 
	end
	
	--追击状态
	if dwState == MonsterState.Pursue then
		self:OnPursueIng(dwDelayTime,NowTime)
		return 
	end
	
	--返回状态
	if dwState == MonsterState.RunBack then
		self:OnRunBackIng(dwDelayTime,NowTime)
		return
	end
	
	--逃跑状态
	if dwState == MonsterState.RunAway then
		self:OnRunAwayIng(dwDelayTime,NowTime)
		return 
	end
	
	--死亡状态
	if dwState == MonsterState.Dead then
		self:OnDead(dwDelayTime,NowTime)
		return
	end
	
end
----------------------------------------------------------------
--空闲中
function CMonster:OnIdel(dwDelayTime)
	
	if self.Data.blShow then
		------------
		if self.tbFun.CBMonsterOnIdel then
			local dwResult = self.tbFun.CBMonsterOnIdel(self)
			if dwResult == 1 then
				return;
			end
		end 
		------------
		--有仇恨则进入战斗
		if self:GetHatredMaxRole()>0 then
			self:OnFightStart(dwDelayTime)
			return
		end 
		--否则进入移动和索敌判断
		local dwNowTime = _now()
		local dwLastWalkStopTime = self.AI.dwLastWalkStopTime
		local dwRand = math.random(dwNowTime-50000,dwNowTime-5000)
		if (not self.AI.bIsMoving) then
		--	print(dwRand,dwLastWalkStopTime)
		end
		--空闲索敌判断
		if self.AI.dwLastSearchEnemyTime + 500 < dwNowTime then
			local dwRoleId,Player = self:OnIdelSearchEnemy()
			if dwRoleId then
				self:AddHatred(dwRoleId,1)
				self:OnFightStart(dwDelayTime)
				return 
			end
		end
		--空闲移动判断
		if (not self.AI.bIsMoving) and dwRand>dwLastWalkStopTime then
			self:OnIdelMoveStart()
			return
		end
	end
end

--战斗中
function CMonster:OnFightIng(dwDelayTime)
	------------
	if self.tbFun.CBMonsterOnFight then
		local dwResult = self.tbFun.CBMonsterOnFight(self)
		if dwResult == 1 then
			return;
		end
	end
	------------
	local dwNowTime = _now()
	if not self.AI.dwLastUseSkillTime then
		self.AI.dwLastUseSkillTime = 0
	end
	------------
	--太久没攻击，则降低仇恨
	if dwNowTime-self.AI.dwLastStartFightTime>5000 and dwNowTime-self.AI.dwLastReduceHatredTime>3000 and dwNowTime-self.AI.dwLastUseSkillTime > 5000 then
		self:ReduceHatred(self.Fight.dwHPMax/10)
	end
	------------
	--获得本地图Map对象
	if not self.AI.Map then
		return;
	end
	local Map = self.AI.Map
	local dwRoleId = self:GetHatredMaxRole()
	--找不到仇恨对象，则进入返回状态
	if dwRoleId==0 then
		self:OnRunBackStart()
		return
	end
	local Player = Map:GetPlayerByRoleID(dwRoleId)
	if Player then
		-----------------------------------------------------------
		--self.AI.dwAtkRange = 5 ------------------------------------通过技能脚本获取技能施放距离
		-----------------------------------------------------------
		local sysMapSystem = Player:GetSystem("CMapSystem");
		--对象与我不在同一张地图
		if sysMapSystem.sDuplInfo then 
			if sysMapSystem.sDuplInfo.dwMapID~=self.Data.dwCurMapID then
				self:DelHatred(dwRoleId)
				return;
			end
		elseif sysMapSystem.dwCurMapID~= self.Data.dwCurMapID then
			self:DelHatred(dwRoleId)
			return;
		end
		
		local sysBattle = Player:GetSystem("CBattleSystem");
		if sysBattle.dwDeadFlag == 1 then
			--对象如果死亡，则清除仇恨
			self:DelHatred(dwRoleId);
			return;
		end
		
		local tbPlayerPos = sysMapSystem:GetPlayerPos()
		--local tbMyPos = {x=self.Data.dwNowX;y=self.Data.dwNowY}
		self.tbMyPos.x = self.Data.dwNowX
		self.tbMyPos.y = self.Data.dwNowY
		--如果距离太远则进入追击状态
		if (tbPlayerPos.x-self.tbMyPos.x)^2+(tbPlayerPos.y-self.tbMyPos.y)^2 > self.AI.dwAtkRange^2 then
			if not self:OnPursueStart(Player) then
				--无法追击，则清除对此玩家的仇恨
				self:DelHatred(dwRoleId);
				return;
			end
		--否则进入技能施放逻辑
		else
			-------
			-----------------------------------------------施放技能逻辑（待写）
			if dwNowTime - self.AI.dwLastUseSkillTime > 2300 then
				self:UseSkill(dwRoleId)
				return
			end
			--------------------------------------------------------------------
		end
	else
		--掉线Player则清除仇恨
		self:DelHatred(dwRoleId);
		return
	end
end

--追击中
function CMonster:OnPursueIng(dwDelayTime)
	------------
	if self.tbFun.CBMonsterOnPursue then
		local dwResult = self.tbFun.CBMonsterOnPursue(self)
		if dwResult == 1 then
			return;
		end
	end
	------------
	--判断当前位置是否超出追击距离
	local fFightPosX,fFightPosY = self.AI.FightPos.x,self.AI.FightPos.y
	local tbNowPos = {x=self.Data.dwNowX; y=self.Data.dwNowY}
	--追击距离
	local fPursueDis = self.AI.fPursueDis
	if (fFightPosX-tbNowPos.x)^2 + (fFightPosY-tbNowPos.y)^2>fPursueDis^2 then
		self:ClsHatred()
		self:OnRunBackStart()
	end
	local dwNowTime = _now()
	if (dwNowTime-self.AI.dwLastPursueTime>1000) then
		if not self.AI.Map then
			return;
		end
		local Map = self.AI.Map
		local Player = Map:GetPlayerByRoleID(self.AI.dwSkillTargetID)
		if Player then
			local sysMapSystem = Player:GetSystem("CMapSystem");
			local tbPlayerPos = sysMapSystem:GetPlayerPos()
			--判断怪物与目标的距离是否在施法距离外
			if (tbPlayerPos.x-tbNowPos.x)^2+(tbPlayerPos.y-tbNowPos.y)^2 > self.AI.dwAtkRange^2 then
				self:OnPursueStart(Player)
			else
				--返回战斗状态
				self:OnPursueEnd()
			end
		else
			--返回战斗状态
			self:OnPursueEnd()
		end
	end
end

--返回中
function CMonster:OnRunBackIng(dwDelayTime)
	------------
	if self.tbFun.CBMonsterOnRunBack then
		local dwResult = self.tbFun.CBMonsterOnRunBack(self)
		if dwResult == 1 then
			return;
		end
	end
	------------
	if not self.AI.bIsMoving then
		self:OnRunBackEnd()
	end
end

--逃跑中
function CMonster:OnRunAwayIng(dwDelayTime)
	------------
	if self.tbFun.CBMonsterOnRunAway then
		local dwResult = self.tbFun.CBMonsterOnRunAway(self)
		if dwResult == 1 then
			return;
		end
	end
	------------
end

--死亡中
function CMonster:OnDead(dwDelayTime)
	local dwNowTime = _now()
	if dwNowTime - self.AI.dwLastDeadTime > 5000 then
		self:OnDeadEnd()
	end
end
------------------------------------------------------------------------------------------------------
--*************************AI 过程方法
------------------------------------------------------------------------------------------------------

-----------------------------
----------空闲中
-----------------------------
--进入空闲状态
function CMonster:OnIdelStart()
	------------
	if self.tbFun.CBMonsterOnIdelStart then
		local dwResult = self.tbFun.CBMonsterOnIdelStart(self)
	end
	------------
	self.AI.dwNowState = MonsterState.Idel
	self.AI.FightPos = {}
end
--空闲移动开始
function CMonster:OnIdelMoveStart()
	--print(self.ObjId,"-------------------OnIdelMoveStart-----------------------")
	self.tbMyPos.x = self.Data.dwNowX;
	self.tbMyPos.y = self.Data.dwNowY;
	
	self.tbMovePos.x = self.Data.fBornX+math.random(-self.AI.fWorlkDis,self.AI.fWorlkDis)
	self.tbMovePos.y = self.Data.fBornY+math.random(-self.AI.fWorlkDis,self.AI.fWorlkDis)  
	local tbPath = self.AI.Map:GetPath(self.tbMyPos,self.tbMovePos)
	if tbPath then
		self.AI.MovePath = tbPath
		table.remove(tbPath,1)
		self:Move(tbPath[1],self.AI.dwDefaultSpeed) 
	end
end

--空闲索敌
function CMonster:OnIdelSearchEnemy()
	self.AI.dwLastSearchEnemyTime = _now()
	local fSearchDis = self.AI.fAlertDis
	local Map = self.AI.Map
	local Players = Map:GetAllPlayer()
	for dwRoleID,Player in pairs(Players) do
		--只攻击已经完成加载的Player对象
		if Player:IsLoadEnd() == true then
			local sysMapSystem = Player:GetSystem("CMapSystem");
			if not sysMapSystem then return end;
			local fPlayerX = sysMapSystem.fXPos
			local fPlayerY = sysMapSystem.fYPos
			if (fPlayerX-self.Data.dwNowX)^2 + (fPlayerY-self.Data.dwNowY)^2 < fSearchDis^2 then
				local dwRoleID = Player:GetRoleID()
				return dwRoleID,Player
			end
		end
	end
end
------------------------------
----战斗中
------------------------------
--进入战斗
function CMonster:OnFightStart(dwDelayTime)
	------------
	if self.tbFun.CBMonsterOnFightStart then
		local dwResult = self.tbFun.CBMonsterOnFightStart(self)
	end
	------------
	self.AI.dwNowState = MonsterState.FightIng
	if not self.AI.FightPos.x then
		self.AI.FightPos = {x=self.Data.dwNowX;y=self.Data.dwNowY;}
	end
	self.AI.dwLastStartFightTime = _now()
end

-------------------------------
--追击中
-------------------------------
--开始追击
function CMonster:OnPursueStart(Player)
	------------
	if self.tbFun.CBMonsterOnPursueStart then
		local dwResult = self.tbFun.CBMonsterOnPursueStart(self)
	end
	------------
	if Player then
		self.AI.dwLastPursueTime = _now()
		self.AI.dwNowState = MonsterState.Pursue
		self.AI.dwSkillTargetID = Player:GetRoleID()
		local sysMapSystem = Player:GetSystem("CMapSystem");
		local tbPlayerPos = sysMapSystem:GetPlayerPos()
		--local tbMyPos = {x=self.Data.dwNowX;y=self.Data.dwNowY}
		self.tbMyPos.x = self.Data.dwNowX
		self.tbMyPos.y = self.Data.dwNowY
		
		local fSkillDis = self.AI.dwAtkRange-0.5
		local fDir = math.random(0,math.pi*10000)/10000--math.atan2((tbPlayerPos.y-tbMyPos.y),(tbPlayerPos.x-tbMyPos.x))
		local dwXSign = math.random(0,10000) 
		if dwXSign > 5000 then
			dwXSign = 1
		else
			dwXSign = -1
		end
		local dwYSign = math.random(0,10000)
		if dwYSign > 5000 then
			dwYSign = 1
		else
			dwYSign = -1
		end
		--local tbMovePos = {x=(tbPlayerPos.x+dwXSign*fSkillDis*math.cos(fDir));y=(tbPlayerPos.y+dwYSign*fSkillDis*math.sin(fDir));}
		self.tbMovePos.x = (tbPlayerPos.x+dwXSign*fSkillDis*math.cos(fDir))
		self.tbMovePos.y = (tbPlayerPos.y+dwYSign*fSkillDis*math.sin(fDir))
		local tbPath = self.AI.Map:GetPath(self.tbMyPos,self.tbMovePos)
		if tbPath then
			self.AI.MovePath = {tbPath[2]}
			self:Move(self.AI.MovePath[1],self.AI.dwDefaultSpeed)
			return true
		end
	end
	return false
end
--结束追击
function CMonster:OnPursueEnd()
	self:OnFightStart(dwDelayTime)
end
----------------------------------
--返回中
----------------------------------
--开始返回触发战斗点
function CMonster:OnRunBackStart()
	------------
	if self.tbFun.CBMonsterOnRunBackStart then
		local dwResult = self.tbFun.CBMonsterOnRunBackStart(self)
	end
	------------
	self.AI.dwNowState = MonsterState.RunBack
	--local tbMyPos = {x=self.Data.dwNowX;y=self.Data.dwNowY;}
	self.tbMyPos.x = self.Data.dwNowX
	self.tbMyPos.y = self.Data.dwNowY
	--local tbMovePos = {x=self.AI.FightPos.x;y=self.AI.FightPos.y}
	self.tbMovePos.x = self.AI.FightPos.x
	self.tbMovePos.y = self.AI.FightPos.y
	local tbPath = self.AI.Map:GetPath(self.tbMyPos,self.tbMovePos)
	if tbPath then
		self.AI.MovePath = tbPath
		table.remove(tbPath,1)
		self:Move(tbPath[1],self.AI.dwDefaultSpeed)
	end
end
--返回结束
function CMonster:OnRunBackEnd()
	--self:Revert(self.Fight.dwHPMax-self.Fight.dwHP)
	self:OnIdelStart()
end
----------------------------------
--逃跑中
----------------------------------
--开始逃跑
function CMonster:OnRunAwayStart(fPosX,fPosY)
	------------
	if self.tbFun.CBMonsterOnRunAwayStart then
		local dwResult = self.tbFun.CBMonsterOnRunAwayStart(self)
	end
	------------
	self.AI.dwNowState = MonsterState.RunAway
	--local tbMyPos = {x=self.Data.dwNowX;y=self.Data.dwNowY;}
	self.tbMyPos.x = self.Data.dwNowX
	self.tbMyPos.y = self.Data.dwNowY
	--local tbMovePos = {x=fPosX;y=fPosY}
	self.tbMovePos.x = fPosX
	self.tbMovePos.y = fPosY
	local tbPath = self.AI.Map:GetPath(self.tbMyPos,self.tbMovePos)
	if tbPath then
		self.AI.MovePath = tbPath
		table.remove(tbPath,1)
		self:Move(tbPath[1],self.AI.dwDefaultSpeed)
	end
end
--逃跑结束
function CMonster:OnRunAwayEnd()
	self:OnFightStart(dwDelayTime)
end
----------------------------------
--死亡中
----------------------------------
--开始死亡(倒下，掉落)
function CMonster:OnDeadStart(objEnemy)
	self.AI.dwNowState = MonsterState.Dead
	self:Dead()
	self.AI.dwLastDeadTime = _now()

	local sysTask = objEnemy:GetSystem("CTaskSystem");
	sysTask:RcvKillMonster(self.Data.dwMonsterId)
	if objEnemy.AddExp then
		local sysDrop = objEnemy:GetSystem("CDropSystem");
		sysDrop:DropExp(self.DataInfo.exp,self.Fight.dwLevel)
		--objEnemy:AddExp(self.DataInfo.exp)
	end
	
	local mgrDrop = self.AI.Map:GetDropMgr()
	mgrDrop:DoDrop(self,objEnemy)
	CBossInfoManager:BossDead(self:GetID(),objEnemy:GetRoleID())
	--------------------------------------------------------------段磊磊 add 2012-3-21,境界需要写到中心系统中去
	local sysCBourn = objEnemy:GetSystem("CBournSystem");
	sysCBourn:KillMonster(self.Data.dwMonsterId);
	objEnemy:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventKillMonster,1,self:GetData().dwMonsterId);
	---------------------------------------------------------------add end
	print("OnDeadStart")
end
--死亡结束(消失)
function CMonster:OnDeadEnd()
	self:Hide()
	self.AI.dwNowState = MonsterState.Idel
	print("OnDeadEnd")
end


-------------------------------------------------------------------------
--移动
-------------------------------------------------------------------------
--移动更新
function CMonster:OnMove(dwDelayTime)
	local dwNowTime = _now()
	if self.AI.dwLastWalkUpdateTime == 0 then
		self.AI.dwLastWalkUpdateTime = self.AI.dwLastWalkStartTime
	end
	local dwDelayTime = dwNowTime - self.AI.dwLastWalkUpdateTime
	self.AI.dwLastWalkUpdateTime = dwNowTime
	--获取间隔时间
	dwDelayTime = dwDelayTime/1000
	--获取移动方向
	local dwDir = self.AI.dwMoveDir
	--获取移动速度
	local dwSpeed = self.AI.dwMoveSpeed
	--获取移动目的地
	local tbPos = self.AI.MovePath[1]
	if not tbPos then return end;
	--获取当前地点
	local tbNowPos = {x=self.Data.dwNowX+dwSpeed*dwDelayTime*math.cos(dwDir); y=self.Data.dwNowY+dwSpeed*dwDelayTime*math.sin(dwDir)}
	local dwLastDis = self.AI.dwMoveDis 
	local dwNowDis = math.sqrt((tbNowPos.y-tbPos.y)^2 + (tbNowPos.x-tbPos.x)^2)

	if dwNowDis>=dwLastDis then
		self.Data.dwNowX = self.AI.MovePath[1].x
		self.Data.dwNowY = self.AI.MovePath[1].y
		table.remove(self.AI.MovePath,1)
		if #self.AI.MovePath > 0 then
			self:Move(self.AI.MovePath[1],dwSpeed)
		else
			self:OnMoveEnd()
		end
	else
		self.Data.dwNowX = tbNowPos.x
		self.Data.dwNowY = tbNowPos.y
		self.AI.dwMoveDis = dwNowDis
	end
	--print(self.AI.dwNowState,tbNowPos.x,tbNowPos.y,":",tbPos.x,tbPos.y)
end
--移动结束
function CMonster:OnMoveEnd()
	self.AI.MovePath = {}
	self.AI.dwLastWalkStopTime = _now()
	self:StopMove() 
end
--]]



