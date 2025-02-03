--State对象
_G.CPlayerState = {};
CPlayerState.objSystem = nil;--System对象
CPlayerState.dwState = 0;--状态ID

function CPlayerState:new(dwState)
	local obj = {};
	for i ,v in pairs(CPlayerState)do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	
	obj.objSystem = nil;
	obj.dwState = dwState;
	return obj;
end;

function CPlayerState:CheckAction(dwActionType,Param)
	return true;
end;

function CPlayerState:ChangeStateTo(dwNewState)
	if self.objSystem then
		self.objSystem:ChangeState(dwNewState);
	else
		_info("ERROR:CPlayerState.objSystem is null!")
	end
end;

function CPlayerState:OnEnter()
end;

function CPlayerState:OnExit()
end;

----------------------------------------------------------------------------------------------------------------------
--休息状态
_G.CNormalState = {};
function CNormalState:new(objSystem)
	local obj = CPlayerState:new(enPlayerState.ePS_Normal);
	obj.objSystem = objSystem;
	
	for i ,v in pairs(CNormalState)do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CNormalState:CheckAction(dwActionType,Param)
	if dwActionType == enPlayerAction.ePA_Attack then
		self:ChangeStateTo(enPlayerState.ePS_Fight);
		return true;
	end
	
	if dwActionType == enPlayerAction.ePA_Hurt then
		local objPlayer = self.objSystem:GetPlayer();
		if objPlayer then
			local mountSystem = objPlayer:GetSystem("CMountSystem");
			if mountSystem then
				mountSystem:BeHurt();
			end;
		end;
		self:ChangeStateTo(enPlayerState.ePS_Fight);
		return true;
	end
	
	-- if dwActionType == enPlayerAction.ePA_Sit then
		-- self:ChangeStateTo(enPlayerState.ePS_Sit);
		-- return true;
	-- end
	
	if dwActionType == enPlayerAction.ePA_EnterMar then
		if not CConfig.bIsCrossSvr then
			local objDuplSys = self.objSystem:GetPlayer():GetSystem("CDuplSystem");
			if objDuplSys then
				if objDuplSys:IsInFb() then
					return false;
				end
			end
		end
		
		local objMapSys = self.objSystem:GetPlayer():GetSystem("CMapSystem");
		if objMapSys then
			local dwMapMode = math.floor(objMapSys.dwCurMapID/1000);
			if dwMapMode == 1 then
				self:ChangeStateTo(enPlayerState.ePS_Martial);
				return true;
			end
		end
	end
	
	return true;
end;

function CNormalState:OnEnter()
	local objSelf = self.objSystem:GetPlayer();
	-- local tbPlayer = objSelf:GetOtherPlayer(0,1);
	
	-- local tbNet = {};
	-- for n,objPlayer in pairs(tbPlayer)do
		-- table.insert(tbNet,objPlayer.objNet);
	-- end
	-- _groupcallout(tbNet, "PlayerStateMsg", 
	-- {
		-- RoleID = objSelf:GetRoleID(),
		-- ActionID = enPlayerState.ePS_Normal,
		-- Param = 0,
	-- });
	
	local objMapSystem = objSelf:GetSystem("CMapSystem");
	if objMapSystem then
		_mapcallout("PlayerStateMsg", 
		{
			RoleID = objSelf:GetRoleID(),
			ActionID = enPlayerState.ePS_Normal,
			Param = 0,
		}, 
		objMapSystem:GetLogicID(), false)
	end
	
	--objSelf:ViewChange()
end;

function CNormalState:OnExit()
end;
--------------------------
--战斗状态
_G.CFightState = {};
function CFightState:new(objSystem)
	local obj = CPlayerState:new(enPlayerState.ePS_Fight);
	obj.objSystem = objSystem;
	
	for i ,v in pairs(CFightState)do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CFightState:CheckAction(dwActionType,Param)
	if dwActionType == enPlayerAction.ePA_Attack then
		self.objSystem.dwLastFightTime = GetCurTime();
		return true;
	end
	
	if dwActionType == enPlayerAction.ePA_Hurt then
		local objPlayer = self.objSystem:GetPlayer();
		if objPlayer then
			
			local mountSystem = objPlayer:GetSystem("CMountSystem");
			if mountSystem then
				mountSystem:BeHurt();
			end;
		end;
		self.objSystem.dwLastFightTime = GetCurTime();
		return true;
	end
	
	if dwActionType == enPlayerAction.ePA_EnterMar then
		return false
	end
	
	if dwActionType == enPlayerAction.ePA_OffLine then
		return false
	end
	
	if dwActionType == enPlayerAction.ePA_ChgLine then
		return false
	end
	
	if dwActionType == enPlayerAction.ePA_UseItem then
		--某些道具在战斗状态下不能使用
		if ItemFightForbid[Param] then
			return false;
		else
			return true;
		end
	end
	
	return true;
end;

function CFightState:OnEnter()
	self.objSystem.dwLastFightTime = GetCurTime();
	
	local objSelf = self.objSystem:GetPlayer();
	-- local tbPlayer = objSelf:GetOtherPlayer(0,1)
	
	-- local tbNet = {};
	-- for n,objPlayer in pairs(tbPlayer)do
		-- table.insert(tbNet,objPlayer.objNet);
	-- end
	-- _groupcallout(tbNet, "PlayerStateMsg", 
	-- {
		-- RoleID = objSelf:GetRoleID(),
		-- ActionID = enPlayerState.ePS_Fight,
		-- Param = 1,
	-- });
	
	local objMapSystem = objSelf:GetSystem("CMapSystem");
	if objMapSystem then
		_mapcallout("PlayerStateMsg", 
		{
			RoleID = objSelf:GetRoleID(),
			ActionID = enPlayerState.ePS_Fight,
			Param = 1,
		}, 
		objMapSystem:GetLogicID(), false)
	end
	
	self.objSystem:AddUpdateFunc();
	
	--objSelf:ViewChange()
end;

function CFightState:OnExit()
	-- local objSelf = self.objSystem:GetPlayer();
	-- local objSkillSystem = objSelf:GetSystem("CSkillSystem");
	
	--objSkillSystem:BroadcastSkillMsg(false,"SendPlayerState",objSelf:GetRoleID(),enPlayerState.ePS_Fight,0);

	self.objSystem:DelUpdateFunc();
end;
-------------------------
--死亡状态
_G.CDeadState = {};
function CDeadState:new(objSystem)
	local obj = CPlayerState:new(enPlayerState.ePS_Dead);
	obj.objSystem = objSystem;
	
	for i ,v in pairs(CDeadState)do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CDeadState:CheckAction(dwActionType,Param)
	return false;
end;

function CDeadState:OnEnter()
	local objSelf = self.objSystem:GetPlayer();
	local objBtlSystem = objSelf:GetSystem("CBattleSystem");
	
	objBtlSystem:BroadcastDeadMsg(1);
end;

function CDeadState:OnExit()
	local objSelf = self.objSystem:GetPlayer();
	local objBtlSystem = objSelf:GetSystem("CBattleSystem");
	
	objBtlSystem:BroadcastDeadMsg(0);
end;

---------------------
--打坐状态
_G.CSitState = {};
function CSitState:new(objSystem)
	local obj = CPlayerState:new(enPlayerState.ePS_Sit);
	obj.objSystem = objSystem;
	
	for i ,v in pairs(CSitState)do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CSitState:CheckAction(dwActionType,Param)
	-- print('dwActionType =',dwActionType)
	-- if dwActionType == enPlayerAction.ePA_Stand then
		-- self:ChangeStateTo(enPlayerState.ePS_Normal);
		-- return true;
	-- end
	
	-- if dwActionType == enPlayerAction.ePA_Move then
		-- self:ChangeStateTo(enPlayerState.ePS_Normal);
		-- return true;
	-- end
	
	-- if dwActionType == enPlayerAction.ePA_Hurt then
		-- self:ChangeStateTo(enPlayerState.ePS_Fight);
		-- return true;
	-- end
	-- if dwActionType == enPlayerAction.ePA_SkillExe then
		-- self:ChangeStateTo(enPlayerState.ePS_Normal);
		-- return true;
	-- end
	-- if dwActionType == enPlayerAction.ePA_Trade then
		-- return true;
	-- end
	-- if dwActionType == enPlayerAction.ePA_ChgMap then
		-- return true;
	-- end
	
	return false;
end;
--修改打坐标志
function CSitState:OnEnter()
	-- local objSelf = self.objSystem:GetPlayer();
	-- local objSkillSystem = objSelf:GetSystem("CSkillSystem");
	
	-- objSelf:GetSystem("CSitSystem"):SetSitFlag(1);
	
	--objSkillSystem:BroadcastSkillMsg(false,"SendPlayerState",objSelf:GetRoleID(),enBroadStateAction.eBSA_Sit,1);
end;

function CSitState:OnExit()
	-- local objSelf = self.objSystem:GetPlayer();
	-- local objSkillSystem = objSelf:GetSystem("CSkillSystem");
	-- objSelf:GetSystem("CSitSystem"):SetSitFlag(0);
	
	--objSkillSystem:BroadcastSkillMsg(false,"SendPlayerState",objSelf:GetRoleID(),enBroadStateAction.eBSA_Sit,0);
end;
---------------------------------------------------------------------------------------------------------
--演武状态
_G.CMartialState = {};
function CMartialState:new(objSystem)
	local obj = CPlayerState:new(enPlayerState.ePS_Martial);
	obj.objSystem = objSystem;
	
	for i ,v in pairs(CMartialState)do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CMartialState:CheckAction(dwActionType,Param)
	
	if dwActionType == enPlayerAction.ePA_EixtMar then
		self:ChangeStateTo(enPlayerState.ePS_Normal);
		return true;
	end
	
	if dwActionType == enPlayerAction.ePA_Move then
		self:ChangeStateTo(enPlayerState.ePS_Normal);
		return true;
	end
	
	if dwActionType == enPlayerAction.ePA_Hurt then
		self:ChangeStateTo(enPlayerState.ePS_Fight);
		return true;
	end
	if dwActionType == enPlayerAction.ePA_SkillExe then
		self:ChangeStateTo(enPlayerState.ePS_Normal);
		return true;
	end
	-- if dwActionType == enPlayerAction.ePA_Trade then
		-- return true;
	-- end
	-- if dwActionType == enPlayerAction.ePA_ChgMap then
		-- return true;
	-- end
	if dwActionType == enPlayerAction.ePA_ChgLine then
		return false;
	end
	
	return true;
end;
--
function CMartialState:OnEnter()
	
end;

function CMartialState:OnExit()
	local objSelf = self.objSystem:GetPlayer();
	objSelf:GetSystem("CMartialSystem"):LeaveCurMartial(true);
end;

---------------------------------------------------------------------------------------------------------

--Player对State的管理
_G.CStateSystem = {};
CStateSystem.dwCurState = 0;
CStateSystem.setStateObj = {};
CStateSystem.dwLastFightTime = 0;

function CStateSystem:new()
	local obj = CSystem:new("CStateSystem");
	obj.setStateObj = {};
	obj.dwCurState = enPlayerState.ePS_Normal;
	obj.dwLastFightTime = 0;
	---
	for i,v in pairs(CStateSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;

function CStateSystem:GetState()
	return self.dwCurState;
end;

function CStateSystem:Create()
	self.dwCurState = enPlayerState.ePS_Normal;
	
	self.setStateObj[enPlayerState.ePS_Normal] = CNormalState:new(self);
	self.setStateObj[enPlayerState.ePS_Fight] = CFightState:new(self);
	self.setStateObj[enPlayerState.ePS_Sit] = CSitState:new(self);
	self.setStateObj[enPlayerState.ePS_Dead] = CDeadState:new(self);
	self.setStateObj[enPlayerState.ePS_Martial] = CMartialState:new(self);
end;

function CStateSystem:Update()
	--战斗状态下，10s未进行攻击行为就脱战
	if self.dwCurState == enPlayerState.ePS_Fight then
		local dwCurTime = GetCurTime();
		if dwCurTime - self.dwLastFightTime > enCancleFightTime then
			--print("CStateSystem:Update Succ!!")
			self:ChangeState(enPlayerState.ePS_Normal);
		end
	end
end;

function CStateSystem:Destroy()
	self:DelUpdateFunc();
end

function CStateSystem:OnDead(dwEnemyType,dwEnemyID)
	self:ChangeState(enPlayerState.ePS_Dead);
end;

function CStateSystem:OnChangeLineEnd()
	self:GetPlayer().ChangeStateMsg{ StateID = self.dwCurState };
end;

function CStateSystem:OnEnterScene()
	--完成之后就把身边人的状态同步给客户端
end;

--zhj add 
function CStateSystem:OnChangeSceneEnd()
	--self:OnEnterScene();
end;
--zhj add end
function CStateSystem:CheckPlayerAction(dwActionType,Param)
	return self.setStateObj[self.dwCurState]:CheckAction(dwActionType,Param);
end;

function CStateSystem:ChangeState(dwNewState)
	if dwNewState == self.dwCurState then
		return;
	end
	
	self.setStateObj[self.dwCurState]:OnExit();
	
	self.dwCurState = dwNewState;
	
	self.setStateObj[self.dwCurState]:OnEnter();
	--print(debug.traceback("",2))
	--notice client
	self:GetPlayer().ChangeStateMsg{ StateID = dwNewState };
end;

function CStateSystem:AddUpdateFunc()
	self:DelUpdateFunc();
	
	self.objDriver = CDriverManager:AddDriver(eInterval._1sec,self,self.Update)
end;

function CStateSystem:DelUpdateFunc()
	if self.objDriver then
		CDriverManager:DelDriver(self.objDriver)
		self.objDriver = nil;
	end
end;
