--[[
	怪物系统 AI系统
	周长沙
	2012-4-16
--]]

local function MakeKey(dwType,dwRoleID)
	return dwRoleID*10 + dwType;
end;
local function ReleaseKey(dwKey)
	local ty = dwKey%10;
	local id = math.floor(dwKey/10);
	
	return ty,id;
end;

_G.CMonsterAISystem = {}
-------------------------------------------
function CMonsterAISystem:new(objMon)
	local obj = {}
	for k,v in pairs(CMonsterAISystem) do
		if type(v)=="function" then
			obj[k]=v
		end
	end
	obj:Create(objMon)
	return obj
end
-------------------------------------------
--创建
function CMonsterAISystem:Create(objMon)
	self.objMon = objMon							--怪物对象
	self.dwNowState = MonsterState.NONE				--当前状态
	self.Hatred = {}								--仇恨表
	local CFG = objMon.DataInfo						--怪物的配置
	self.State = CMonsterAIManager:GetAllState()	--状态节点
	self.vFightPos = {}								--进入战斗的位置
	--空闲
	self.dwSearchEnemyDelay = 500					--索敌延迟
	self.fAlertDis = CFG.fAlertDis					--警戒距离
	self.fWorlkDis = CFG.fWorlkDis					--散步距离
	--战斗
	self.dwTargetType = 0							--当前目标类型
	self.dwTargetRoleId = 0							--当前目标id
	self.dwSkillId = 0								--技能id
	self.dwSkillDis = CFG.dwAtkRange				--技能的攻击距离
	self.dwSkillDelay = 2300						--技能CD
	--追击
	self.fPursueDis = CFG.fPursueDis				--追击距离
	--逃跑
	self.RunAwayOnly = CFG.RunAwayOnly				--只逃跑不反击
	self.fRunAwayDis = CFG.fRunAwayDis				--逃跑距离
	--死亡
	--返回
	
	for k,v in pairs(self.State) do					--创建各个状态
		v:Create(objMon,self)
	end
end
--更新
function CMonsterAISystem:Update()
	if self.State[self.dwNowState] then
		self.State[self.dwNowState]:Update()
	else
		self:ChangeState(MonsterState.NONE)
	end
end
--销毁
function CMonsterAISystem:Destroy()
	for k,v in pairs(self.State) do
		if v.Node then
			CDriverManager:DelDriver(v.Node)
		end
		v.Node = nil
	end
end
--------------------------------------------
--状态切换
function CMonsterAISystem:ChangeState(dwState,...)
	-- print('CMonsterAISystem:ChangeState',dwState)
	self.State[self.dwNowState]:Exit(...)
	self.dwNowState = dwState
	self.State[self.dwNowState]:Enter(...)
end
--接收事件
function CMonsterAISystem:RecvEvent(szEvent,...)
	local funEvent = self.State[self.dwNowState][szEvent]
	if funEvent then
		funEvent(self.State[self.dwNowState],...)
	end
end
--怪物死亡
function CMonsterAISystem:OnDead()
	self:ClsHatred()
	self:GetStateNode(MonsterState.ForceRun):Stop()
end
--------------------------------------------
--接口
--怪物对象
function CMonsterAISystem:GetMon()
	return self.objMon
end
--当前状态
function CMonsterAISystem:GetState()
	return self.dwNowState
end
--获得某个状态
function CMonsterAISystem:GetStateNode(dwState)
	return self.State[dwState]
end
--仇恨最高的玩家ID
function CMonsterAISystem:GetHatredMaxRole()
	local dwLastEnemyType = 0;
	local dwLastRoleId = 0;
	local dwLastHatredValue = 0;
	if self.Hatred then
		for key,dwHatredValue in pairs(self.Hatred) do
			if dwHatredValue > dwLastHatredValue then
				dwLastHatredValue = dwHatredValue;
				dwLastEnemyType, dwLastRoleId = ReleaseKey(key);
			end
		end
	end
	return dwLastEnemyType,dwLastRoleId;
end

--增加Monster对目标仇恨
function CMonsterAISystem:AddHatred(dwEnemyType,dwRoleId,dwValue)
	if self.objMon:IsScript() then return end;
	if not self.Hatred then
		self.Hatred = {}
	end
	
	local key = MakeKey(dwEnemyType,dwRoleId);
	
	if not self.Hatred[key] then
		self.Hatred[key] = 0
	end
	self.Hatred[key] = self.Hatred[key] + dwValue
end

--清除Monster对目标仇恨
function CMonsterAISystem:DelHatred(dwEnemyType,dwRoleId)
	if self.Hatred then
		local key = MakeKey(dwEnemyType,dwRoleId);
		self.Hatred[key] = nil
	end
end

--降低怪物对所有目标的仇恨
function CMonsterAISystem:ReduceHatred(dwValue)
	if not self.Hatred then
		self.Hatred = {}
	end
	for k,v in pairs(self.Hatred) do
		self.Hatred[k] = v-dwValue
		if self.Hatred[k]<0 then
			self.Hatred[k] = 0
		end
	end
end

--清空仇恨
function CMonsterAISystem:ClsHatred()
	self.Hatred = {}
end
--设置战斗地点
function CMonsterAISystem:SetFightPos(vPos)
	self.vFightPos.x = vPos.x
	self.vFightPos.y = vPos.y
end
--返回战斗坐标
function CMonsterAISystem:GetFightPos()
	return self.vFightPos
end
--设置当前目标
function CMonsterAISystem:SetTargetRoleId(dwTargetType,dwTargetRoleId)
	self.dwTargetType = dwTargetType or 0
	self.dwTargetRoleId = dwTargetRoleId or 0
end
--返回当前目标
function CMonsterAISystem:GetTargetRoleId()
	return self.dwTargetType,self.dwTargetRoleId
end
--设置当前技能
function CMonsterAISystem:SetSkill(dwSkillId)
	self.dwSkillId = dwSkillId or 0
end
--返回当前技能
function CMonsterAISystem:GetSkill()
	return self.dwSkillId
end
--设置当前攻击距离
function CMonsterAISystem:SetSkillDis(dwDis)
	self.dwSkillDis = dwDis or 3
end
--返回当前攻击距离
function CMonsterAISystem:GetSkillDis()
	return self.dwSkillDis
end
--设置警戒距离
function CMonsterAISystem:SetAlertDis(dwValue)
	local state = self:GetStateNode(MonsterState.Idel)
	state.fAlertDis = dwValue
end
--还原警戒距离
function CMonsterAISystem:ReSetAlertDis()
	local state = self:GetStateNode(MonsterState.Idel)
	state.fAlertDis = self.fAlertDis
end

--取得镖车信息
function CMonsterAISystem:GetEscornInfo()
	local state = self:GetStateNode(MonsterState.RoleEscort);
	
	return state:GetEscortInfo();
end;



