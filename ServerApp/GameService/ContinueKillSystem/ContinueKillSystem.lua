--2012.3.23
--作者：段磊磊
--连斩系统
_G.CContinueKillSystem = {}
function CContinueKillSystem:new()
	local obj = CSystem:new("CContinueKillSystem");
	--连斩剩余时间
	obj.dwTimeLast = 0;
	--当前连斩次数
	obj.dwContinueKillNum = 0;
	--时间戳
	obj.dwTimeStamp = 0;
	for i,v in pairs(CContinueKillSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
function CContinueKillSystem:Create()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;

	return true;
end

function CContinueKillSystem:Update(dwInterval)
	-- if self.dwTimeLast == 0 then
		-- return
	-- end
	-- local timeNow = GetCurTime();
	-- local timeInterval = timeNow - self.dwTimeStamp;
	-- if timeInterval <= 1000 then
		-- return;
	-- end;
	-- self.dwTimeStamp = timeNow;
	local tempTime  = self.dwTimeLast
	tempTime = tempTime - dwInterval;
	if tempTime <= 0 then
		self.dwTimeLast = 0
		self.dwContinueKillNum = 0
	else
		self.dwTimeLast = tempTime
	end
	
	return true
end

function CContinueKillSystem:Destroy()

end;

function CContinueKillSystem:OnEnterScene()

end;
function CContinueKillSystem:ChangeAnger()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objSkillSys = objPlayer:GetSystem('CSkillSystem')
	local tempNum = self.dwContinueKillNum
	if tempNum == 0 then
		tempNum = 1
	end
	local tempAnger = ERFGetAnger(objSkillSys:GetInfo().dwDander,tempNum)
	local fPer = objPlayer:GetAddicted();
	tempAnger = tempAnger * fPer;
	objSkillSys:ChgNuqi(tempAnger)
end
function CContinueKillSystem:OnDead(dwEnemyType,dwEnemyID)
	self.dwTimeLast = 0
	self.dwContinueKillNum = 0
end
function CContinueKillSystem:EventKillMonster(dwValue,dwMonsterID,dwType,dwLevel)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objSkillSys = objPlayer:GetSystem('CSkillSystem')
	local playerLv = objPlayer:GetInfo().dwLevel
	local monsterLv = dwLevel or 1
	if playerLv - monsterLv > ContinueKillConfig.LevelValue then
		self:ChangeAnger()
		return
	end
	self.dwContinueKillNum = self.dwContinueKillNum + 1
	if math.mod(self.dwContinueKillNum,ContinueKillConfig.BuffNumUni) == 0 then
		local dwEnum = -1
		local dwUsedBuffID = -1
		local buffSys = objPlayer:GetSystem('CBuffSystem')
		for k,v in ipairs (ContinueKillConfig.BuffConifg) do	
		--	buffSys:DeleteBuffByID(v.dwBuffID)
			if self.dwContinueKillNum >= v.dwNum then
				dwEnum = k
				dwUsedBuffID = v.dwBuffID
			end
		end
		
		if dwEnum ~= -1 then
			for i = 1,dwEnum  do
				buffSys:DeleteBuffByID(ContinueKillConfig.BuffConifg[i].dwBuffID)
			end
			local bInit = false
			for k,v in ipairs (ContinueKillConfig.BuffConifg) do
				if buffSys:GetBuffObj(v.dwBuffID) then
					bInit = true
					break
				end	
			end	
			if bInit == false then
				buffSys:AddBuff(dwUsedBuffID,1,nil)
			end
		end
	end
	self.dwTimeLast =  ERFCountContinueKillTime(self.dwContinueKillNum)
	self:ChangeAnger()
	---
	objPlayer:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventContinueKill,1,self.dwContinueKillNum);
	objPlayer.CltUpdateContinueKillMsg{ContinueKillNum = self.dwContinueKillNum,ContinueKillTime = self.dwTimeLast}
	if self.dwContinueKillNum > objSkillSys:GetInfo().dwCaromCount then
		objSkillSys:ChangeAttr('dwCaromCount',1)
	--	objPlayer:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventContinueKill,1,self.dwContinueKillNum);
	end
	self.dwTimeStamp = GetCurTime()
	-------------------
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
