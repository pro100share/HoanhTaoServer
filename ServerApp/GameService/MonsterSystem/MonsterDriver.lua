--[[
	怪物驱动
--]]

--创建驱动
function CMonsterManager:CreateDriver()
	self.DriverIdelFast = nil
	self.DriverIdelSlow = nil
	self.DriverFightFast = nil
	self.DriverForceSlow = nil
	self.DriverEscortSlow = nil
	self.DriverBornSlow = nil
	self.DriverScriptSlow = nil
	
	self.NodeIdel = setmetatable({},{__mode="v"})
	self.NodeFight = setmetatable({},{__mode="v"})
	self.NodeForce = setmetatable({},{__mode="v"})
	self.NodeEscort = setmetatable({},{__mode="v"})
	self.NodeBorn = setmetatable({},{__mode="v"})
	self.NodeScript = setmetatable({},{__mode="v"})
	
	self.dwNumIdel = 0
	self.dwNumFight = 0
	self.dwNumForce = 0
	self.dwNumEscort = 0
	self.dwNumBorn = 0
	self.dwNumScript = 0
	
	self.dwDriverState = 0
end

function CMonsterManager:InsertIdelNode(dwObjID,Mon)
	if not self.NodeIdel[dwObjID] then
		self.NodeIdel[dwObjID] = Mon
		self.dwNumIdel = self.dwNumIdel + 1
	end
	if self.dwNumIdel > 0 then
		if not self.DriverIdelFast then
			self.DriverIdelFast = CDriverManager:AddDriver(eInterval._100ms_b,self,CMonsterManager.IdelFast)
		end
		if not self.DriverIdelSlow then
			self.DriverIdelSlow = CDriverManager:AddDriver(eInterval._1sec,self,CMonsterManager.IdelSlow)
		end
		self.dwDriverState = 1
	end
end

function CMonsterManager:RemoveIdelNode(dwObjID)
	if self.NodeIdel[dwObjID] then
		self.NodeIdel[dwObjID] = nil
		self.dwNumIdel = self.dwNumIdel - 1
	end
	if self.dwNumIdel < 1 then
		self.dwNumIdel = 0
		if self.DriverIdelFast then
			CDriverManager:DelDriver(self.DriverIdelFast)
			self.DriverIdelFast = nil
		end
		if self.DriverIdelSlow then
			CDriverManager:DelDriver(self.DriverIdelSlow)
			self.DriverIdelSlow = nil
		end
	end
end

function CMonsterManager:InsertFightNode(dwObjID,Mon)
	if not self.NodeFight[dwObjID] then
		self.NodeFight[dwObjID] = Mon
		self.dwNumFight = self.dwNumFight + 1
	end
	if self.dwNumFight > 0 then
		if not self.DriverFightFast then
			self.DriverFightFast = CDriverManager:AddDriver(eInterval._100ms_c,self,CMonsterManager.FightFast)
		end
		self.dwDriverState = 1
	end
end

function CMonsterManager:RemoveFightNode(dwObjID)
	if self.NodeFight[dwObjID] then
		self.NodeFight[dwObjID] = nil
		self.dwNumFight = self.dwNumFight - 1
	end
	if self.dwNumFight < 1 then
		self.dwNumFight = 0
		if self.DriverFightFast then
			CDriverManager:DelDriver(self.DriverFightFast)
			self.DriverFightFast = nil
		end
	end
end

function CMonsterManager:InsertForceNode(dwObjID,Mon)
	if not self.NodeForce[dwObjID] then
		self.NodeForce[dwObjID] = Mon
		self.dwNumForce = self.dwNumForce + 1
	end
	if self.dwNumForce > 0 then
		if not self.DriverForceSlow then
			self.DriverForceSlow = CDriverManager:AddDriver(eInterval._100ms_d,self,CMonsterManager.ForceSlow)
		end
		self.dwDriverState = 1
	end
end

function CMonsterManager:RemoveForceNode(dwObjID)
	if self.NodeForce[dwObjID] then
		self.NodeForce[dwObjID] = nil
		self.dwNumForce = self.dwNumForce - 1
	end
	if self.dwNumForce < 1 then
		self.dwNumForce = 0
		if self.DriverForceSlow then
			CDriverManager:DelDriver(self.DriverForceSlow)
			self.DriverForceSlow = nil
		end
	end
end

function CMonsterManager:InsertEscortNode(dwObjID,Mon)
	if not self.NodeEscort[dwObjID] then
		self.NodeEscort[dwObjID] = Mon
		self.dwNumEscort = self.dwNumEscort + 1
	end
	if self.dwNumEscort > 0 then
		if not self.DriverEscortSlow then
			self.DriverEscortSlow = CDriverManager:AddDriver(eInterval._1sec,self,CMonsterManager.EscortSlow)
		end
		self.dwDriverState = 1
	end
end

function CMonsterManager:RemoveEscortNode(dwObjID)
	if self.NodeEscort[dwObjID] then
		self.NodeEscort[dwObjID] = nil
		self.dwNumEscort = self.dwNumEscort - 1
	end
	if self.dwNumEscort < 1 then
		self.dwNumEscort = 0
		if self.DriverEscortSlow then
			CDriverManager:DelDriver(self.DriverEscortSlow)
			self.DriverEscortSlow = nil
		end
	end
end

function CMonsterManager:InsertBornNode(dwObjID,Mon)
	if not self.NodeBorn[dwObjID] then
		self.NodeBorn[dwObjID] = Mon
		self.dwNumBorn = self.dwNumBorn + 1
	end
	if self.dwNumBorn > 0 then
		if not self.DriverBornSlow then
			self.DriverBornSlow = CDriverManager:AddDriver(eInterval._1sec,self,CMonsterManager.BornSlow,1)
		end
		self.dwDriverState = 1
	end
end

function CMonsterManager:RemoveBornNode(dwObjID,Mon)
	if self.NodeBorn[dwObjID] then
		self.NodeBorn[dwObjID] = nil
		self.dwNumBorn = self.dwNumBorn - 1
	end
	if self.dwNumBorn < 1 then
		self.dwNumBorn = 0
		if self.DriverBornSlow then
			CDriverManager:DelDriver(self.DriverBornSlow)
			self.DriverBornSlow = nil
		end
	end
end

function CMonsterManager:InsertScriptNode(dwObjID,Mon)
	if not self.NodeScript[dwObjID] then
		self.NodeScript[dwObjID] = Mon
		self.dwNumScript = self.dwNumScript + 1
	end
	if self.dwNumScript > 0 then
		if not self.DriverScriptSlow then
			self.DriverScriptSlow = CDriverManager:AddDriver(eInterval._1sec,self,CMonsterManager.ScriptSlow,1)
		end
		self.dwDriverState = 1
	end
end

function CMonsterManager:RemoveScriptNode(dwObjID)
	if self.NodeScript[dwObjID] then
		self.NodeScript[dwObjID] = nil
		self.dwNumScript = self.dwNumScript - 1
	end
	if self.dwNumScript < 1 then
		self.dwNumScript = 0
		if self.DriverScriptSlow then
			CDriverManager:DelDriver(self.DriverScriptSlow)
			self.DriverScriptSlow = nil
		end
	end
end

function CMonsterManager:IdelFast()
	for dwObjID,Mon in pairs(self.NodeIdel) do
		if Mon.Data.blShow then
			Mon.SYS.CMonsterAISystem.State[1]:FastUpdate()
		end
	end
end

function CMonsterManager:IdelSlow()
	for dwObjID,Mon in pairs(self.NodeIdel) do
		if Mon.Data.blShow then
			Mon.SYS.CMonsterAISystem.State[1]:SlowUpdate()
		end
	end
end

function CMonsterManager:FightFast()
	for dwObjID,Mon in pairs(self.NodeFight) do
		if Mon.Data.blShow then
			Mon.SYS.CMonsterAISystem.State[2]:FastUpdate()
		end
	end
end

function CMonsterManager:ForceSlow()
	for dwObjID,Mon in pairs(self.NodeForce) do
		if Mon.Data.blShow then
			Mon.SYS.CMonsterAISystem.State[7]:SlowUpdate()
		end
	end
end

function CMonsterManager:EscortSlow()
	for dwObjID,Mon in pairs(self.NodeEscort) do
		if Mon.Data.blShow then
			local objAISystem = Mon.SYS.CMonsterAISystem;
			objAISystem.State[objAISystem.dwNowState]:SlowUpdate()
		end
	end
end

function CMonsterManager:BornSlow()
	for dwObjID,Mon in pairs(self.NodeBorn) do
		Mon:BornLogic(nil,GetCurTime())
	end
end

function CMonsterManager:ScriptSlow()
	for dwObjID,Mon in pairs(self.NodeScript) do
		if not Mon:IsDead() then
			Mon:ScriptUpdate()
		end
	end
end

function CMonsterManager:StartDriver()
	if self.dwDriverState == 1 then return end;
	self.dwDriverState = 1
	if self.dwNumIdel > 0 then
		if not self.DriverIdelFast then
			self.DriverIdelFast = CDriverManager:AddDriver(eInterval._100ms_e,self,CMonsterManager.IdelFast)
		end
		if not self.DriverIdelSlow then
			self.DriverIdelSlow = CDriverManager:AddDriver(eInterval._1sec,self,CMonsterManager.IdelSlow)
		end
	end
	if self.dwNumFight > 0 then
		if not self.DriverFightFast then
			self.DriverFightFast = CDriverManager:AddDriver(eInterval._100ms_f,self,CMonsterManager.FightFast)
		end
	end
	if self.dwNumForce > 0 then
		if not self.DriverForceSlow then
			self.DriverForceSlow = CDriverManager:AddDriver(eInterval._100ms_g,self,CMonsterManager.ForceSlow)
		end
	end
	if self.dwNumEscort > 0 then
		if not self.DriverEscortSlow then
			self.DriverEscortSlow = CDriverManager:AddDriver(eInterval._1sec,self,CMonsterManager.EscortSlow)
		end
	end
	if self.dwNumBorn > 0 then
		if not self.DriverBornSlow then
			self.DriverBornSlow = CDriverManager:AddDriver(eInterval._1sec,self,CMonsterManager.BornSlow)
		end
	end
	if self.dwNumScript > 0 then
		if not self.DriverScriptSlow then
			self.DriverScriptSlow = CDriverManager:AddDriver(eInterval._1sec,self,CMonsterManager.ScriptSlow)
		end
	end
end

function CMonsterManager:StopDriver()
	if self.dwDriverState == 0 then return end;
	self.dwDriverState = 0
	if self.DriverIdelFast then
		CDriverManager:DelDriver(self.DriverIdelFast)
		self.DriverIdelFast = nil
	end
	if self.DriverIdelSlow then
		CDriverManager:DelDriver(self.DriverIdelSlow)
		self.DriverIdelSlow = nil
	end
	if self.DriverFightFast then
		CDriverManager:DelDriver(self.DriverFightFast)
		self.DriverFightFast = nil
	end
	if self.DriverForceSlow then
		CDriverManager:DelDriver(self.DriverForceSlow)
		self.DriverForceSlow = nil
	end
	if self.DriverEscortSlow then
		CDriverManager:DelDriver(self.DriverEscortSlow)
		self.DriverEscortSlow = nil
	end
	if self.DriverBornSlow then
		CDriverManager:DelDriver(self.DriverBornSlow)
		self.DriverBornSlow = nil
	end
	if self.DriverScriptSlow then
		CDriverManager:DelDriver(self.DriverScriptSlow)
		self.DriverScriptSlow = nil
	end
end

function CMonsterManager:RemoveOnDead(dwObjID)
	self:RemoveIdelNode(dwObjID)
	self:RemoveFightNode(dwObjID)
	self:RemoveForceNode(dwObjID)
end





