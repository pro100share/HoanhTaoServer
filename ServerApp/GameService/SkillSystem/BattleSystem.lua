--[[
功能：角色的攻击，受伤，治疗等数值计算处理
作者：刘炜
时间：2012-2-13
]]

local fDeadEndureDown = 0.03;

_G.CBattleSystem = {};

function CBattleSystem:new()
	local obj = CSystem:new("CBattleSystem");
	
	obj.dwDeadFlag = 0;	--死亡标志，1：死亡；0：活着
	
	---
	for i,v in pairs(CBattleSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;

end;

function CBattleSystem:Create()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	self.objSklPlayer = CSkillPlayer:new(objPlayer);
	
	return true;
end;

function CBattleSystem:OnChangeLineEnd()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	objPlayer.OnPlayerDeadMsg{DeadFlag = 0};
end;

function CBattleSystem:Destroy()
	--死亡下线做回城复活的处理
	if self.dwDeadFlag == 1 then
		local objPlayer = self:GetPlayer();
		local objSkillSystem = objPlayer:GetSystem("CSkillSystem");
		objSkillSystem.sBaseInfo.dwHP = objSkillSystem:GetInfo().dwHPMax/2;
		objSkillSystem.sBaseInfo.dwMP = objSkillSystem:GetInfo().dwMPMax/2;
		local mapSystem = objPlayer:GetSystem("CMapSystem");
		
		local CurMap = mapSystem:GetCurMap();
		if not CurMap then
			_info("CurMap id error");
			return false;
		end;
		
		local vRelivePos = CurMap:GetRelivePoint();
		
		--mapSystem.dwCurMapID = dwReliveMap;
		--mapSystem:UpdatePos(vRelivePos.x,vRelivePos.y)
		mapSystem.fXPos = vRelivePos.fXPos;		--玩家的x位置
		mapSystem.fYPos = vRelivePos.fYPos;		--玩家的Y位置
		
		--objSkillSystem.objDBQuery:SaveBattleInfo(objSkillSystem:MakeBattleInfoForDB());
		--mapSystem.objDBQuery:SaveMapInfo()
		
		--print("dead active !")
	end
end;

--是否可以被怪物攻击
function CBattleSystem:IsCanBeAttackByMonster()
	if self.dwDeadFlag == 1 then
		return false;
	end
	
	local objSelf = self:GetPlayer();
	if not objSelf then
		return false;
	end
	if not objSelf:IsLoadEnd() then
		return false;
	end
	
	local objSklSys = objSelf:GetSystem("CSkillSystem");
	if not objSklSys then
		return false;
	end
	if objSklSys:GetInfo().dwStoryFlag == 1 then
		return false;
	end
	
	return true;
end;

--收到伤害
--isForbidAmulet:禁止宝甲响应本次伤害
function CBattleSystem:Hurt(dwHurtValue,isCrit,objEnemy,dwSkillID,dwSkillLevel,dwExecTime,dwActCount,isForbidAmulet)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return dwHurtValue;
	end
	
	local objSklSystem = objSelf:GetSystem("CSkillSystem");
	
	local dwUsedValue = objSklSystem:ExecSkillEvent("EventReadyHurtP",objSelf,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit);
	if dwUsedValue then
		dwHurtValue = dwUsedValue;
	end
	
	if not isForbidAmulet then
		local dwAmuletValue = objSklSystem:EventAmuletSkillHurtReady(objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit);
		if dwAmuletValue then
			dwHurtValue = dwAmuletValue;
		end
	end
	
	local dwEnemyType = objEnemy:GetObjType();
	local dwEnemyID = objEnemy:GetRoleID();
	
	--计算铁布衫的霸体值对伤害的吸收
	local sysTie = objSelf:GetSystem("CTieBuShanSystem");
	if sysTie then
		local fPer = sysTie:GetCurtHurtValue();
		local dwBtValue = sysTie:GetForbidValue();
		
		if dwBtValue > 0 then
			local dwDown = dwHurtValue * fPer;
			
			--如果霸体值不足，就全扣
			if dwDown > dwBtValue then
				dwDown = dwBtValue;
			end
			
			dwDown = math.floor(dwDown)
			
			dwHurtValue = dwHurtValue - dwDown;
			sysTie:DecForbidValue(dwDown);
		end
	end
	dwHurtValue = objSklSystem:ChgHP(0-dwHurtValue,isCrit,dwEnemyType,dwEnemyID,dwSkillID,dwExecTime,dwActCount);
	
	objSklSystem:BeAttack(objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit,dwExecTime,dwActCount);
	if not isForbidAmulet then
		objSklSystem:EventAmuletSkillHurtEnd(objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit);
	end
	
	return dwHurtValue;
end;

--收到治疗
function CBattleSystem:Treat(dwCureValue,objDoctor,objSkill,dwActCount)
	local objSelf = self:GetPlayer();
	
	local objSklSystem = objSelf:GetSystem("CSkillSystem");
	
	local dwUsedValue = objSklSystem:ExecSkillEvent("EventReadyTreatP",objSelf,objDoctor,objSkill,dwCureValue);
	if dwUsedValue then
		dwCureValue = dwUsedValue;
	end
	
	local dwEnemyType = objDoctor:GetObjType();
	local dwEnemyID = objEnemy:GetRoleID();
	-- if dwEnemyType == enEntType.eEntType_Player then
		-- dwEnemyID = objDoctor:GetRoleID();
	-- elseif dwEnemyType == enEntType.eEntType_Monster then
		-- dwEnemyID = objDoctor.ObjId;
	-- end
	
	objSklSystem:ChgHP(dwCureValue,false,dwEnemyType,dwEnemyID,objSkill:GetID(),objSkill.dwLastExecTime,dwActCount);
	
	objSklSystem:BeTreat(objDoctor,objSkill,dwCureValue,dwActCount);
end;

--命中判断
function CBattleSystem:HitJudge(objRoleSkill,cfSkill,objEnemy,dwActCount)
	local dwHitValue = CBattleCalculator:HitCalculator(self:GetPlayer(),objEnemy);
	if cfSkill["EventHitChange"] then
		dwHitValue = cfSkill:EventHitChange(objRoleSkill,objEnemy,dwHitValue,dwActCount);
	end
	
	local dwRand = math.random(10000);
	
	if dwRand <= dwHitValue then
		return true;
	end
	
	return false;
end;

--暴击判断
function CBattleSystem:CritJudge(objRoleSkill,cfSkill,objEnemy,dwActCount)
	local dwCritValue = CBattleCalculator:CritCalculator(self:GetPlayer(),objEnemy);
	if cfSkill["EventCritChange"] then
		dwCritValue = cfSkill:EventCritChange(objRoleSkill,objEnemy,dwCritValue);
	end

	local dwRand = math.random(10000);
	
	--print("dwCritValue = "..dwCritValue)
	
	if dwRand <= dwCritValue then
		--print("crit execute!")
		return true;
	end
	
	return false;
end;

--伤害最终量计算
function CBattleSystem:DamageCount(objRoleSkill,objSelf,objEnemy,dwActCount)	
	local cfSkill = SkillConfig[objRoleSkill:GetID()];
	--暴击判断
	local isCrit = false;
	if self:CritJudge(objRoleSkill,cfSkill,objEnemy,dwActCount) then
		isCrit = true;
	end
	
	local dwLastValue = CBattleCalculator:DamageCalculator(objRoleSkill:GetID(),objRoleSkill:GetLevel(),objSelf,objEnemy,isCrit);
	
	local dwUsedValue = objRoleSkill.objSklSystem:ExecSkillEvent("EventDamageChange",objSelf,objEnemy,objRoleSkill:GetID(),objRoleSkill:GetLevel(),dwLastValue,isCrit);
	if dwUsedValue then
		dwLastValue = dwUsedValue;
	end
	
	return dwLastValue,isCrit;
end;


--扇形范围判断:
--posCheck——检测基准点；posTarget——作用目标点；posDir——作用方向点；fRadii——半径；fAngle——角度
function CBattleSystem:CheckWithSector(posCheck,posTarget,posDir,fRadii,fAngle)
	--计算指向方向
	local vecDir = _Vector2.new(posDir.x-posCheck.x,posDir.y-posCheck.y);
	vecDir:normalize();
	
	--指向检测点的向量
	local vecCheckDir = Vector2.new(posTarget.x-posCheck.x,posTarget.y-posCheck.y);
	
	--长度检测
	if vecCheckDir:magnitude() > fRadii then
		return false;
	end
	
	--角度检测
	vecCheckDir:normalize();
	vecDir:normalize();
	local cosValue = Vector2.dot(vecDir,vecCheckDir);
	
	local fPosAngle = math.deg(math.acos(cosValue));
	
	if fPosAngle > fAngle/2 then
		return false;
	end
	
	return true;
end;

--矩形范围筛选:
--posCheck——检测基准点；posTarget——作用目标点；posDir——作用方向点；fLength——长度；fWidth——宽度
function CBattleSystem:CheckWithRect(posCheck,posTarget,posDir,fLength,fWidth)
	--计算指向方向
	local vecTarDir = _Vector2.new(posDir.x-posCheck.x,posDir.y-posCheck.y);
	vecTarDir:normalize();
	
	--指向检测点的向量
	local vecCheckDir = _Vector2.new(posTarget.x-posCheck.x,posTarget.y-posCheck.y);
	
	--自身到检测点的距离
	local fCheckLength = vecCheckDir:magnitude();
	
	vecCheckDir:normalize();
	
	--夹角的余弦
	local cosValue = Vector2.dot(vecCheckDir,vecTarDir);
	
	--小于0说明对方在自己的背后
	if cosValue < 0 then
		return false;
	end
	
	--测试点到自身点在方向向量上的映射长度
	local fCheckDis = fCheckLength*cosValue;
	if fCheckDis > fLength then
		return false;
	end
	
	local fCheckWidth = math.sqrt(fCheckLength*fCheckLength - fCheckDis*fCheckDis);
	if fCheckWidth > (fWidth/2) then
		return false;
	end
	
	return true;
end;

function CBattleSystem:GetObjPos(obj)
	local dwObjType = obj:GetObjType();
	
	local posObj;
	if dwObjType == enEntType.eEntType_Player then
		posObj = obj:GetSystem("CMapSystem"):GetPlayerPos();
	elseif dwObjType == enEntType.eEntType_Monster then
		posObj = obj:GetVectorPos();
	elseif dwObjType == enEntType.eEntType_Pet then
		posObj = obj:GetPetPos();
	end
	
	return posObj;
end;

--死亡处理
function CBattleSystem:Dead(dwEnemyType,dwEnemyID)
	local objSelf = self:GetPlayer();
	--广播给客户端
	--self:BroadcastDeadMsg(1);
	if self.dwDeadFlag == 1 then
		local objStateSys = objSelf:GetSystem("CStateSystem");
		if objStateSys then
			objStateSys:ChangeState(enPlayerState.ePS_Dead);
		end
		return;
	end
	
	--其他处理
	self.dwDeadFlag = 1;
	
	--坐骑系统死亡下马 add by lkj 4/19/2012
	--if not CConfig.bIsCrossSvr then
		local mountSystem = objSelf:GetSystem("CMountSystem");
		if mountSystem then
			if mountSystem:GetState() then
				mountSystem:RideDown();
			end;
		end;

	--end;
	objSelf.OnPlayerDeadMsg
	{
		DeadFlag = 1;
		EnemyType = dwEnemyType;
		EnemyID = dwEnemyID;
	};
	
	objSelf:OnDead(dwEnemyType,dwEnemyID);
	
	local objMapSystem = objSelf:GetSystem("CMapSystem");
	if not objMapSystem then
		return;
	end
	
	local dwPKValue = objSelf:GetSystem("CPKSystem").dwPKValue;
	
	local dwOwnerID = 0;
	
	--被人杀死，加PK保护BUFF
	if dwEnemyType == enEntType.eEntType_Player then
		if dwPKValue == 0 then
			if not CConfig.bIsCrossSvr then
				objSelf:GetSystem("CBuffSystem"):AddBuff(enPKProtectBuffID, 1);
			end 
		end
		if not CConfig.bIsCrossSvr then
			objSelf:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventBeKilled,1,dwEnemyID,1);
		end;
		dwOwnerID = dwEnemyID;
		
		local objKiller = objMapSystem:GetRoleByID(dwEnemyID);
		if objKiller then
			if not CConfig.bIsCrossSvr then
				objKiller:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventKillPlayer,1,objSelf:GetRoleID(),0);
				if dwPKValue == 0 then
					objKiller:GetSystem("CPKSystem"):AddGuildValue();
				end
			end;
		end
	elseif dwEnemyType == enEntType.eEntType_Monster then
		local objMonster = nil;
		
		local objMap = objMapSystem:GetCurMap()
		if objMap then
			objMonster = objMap:GetMonsterByObjID(dwEnemyID);
		end
		
		if objMonster then
			if not CConfig.bIsCrossSvr then
				objSelf:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventBeKilled,1,dwEnemyID,2,objMonster:GetID());
			end;
		end
	elseif dwEnemyType == enEntType.eEntType_Pet then
		if dwPKValue == 0 then
			objSelf:GetSystem("CBuffSystem"):AddBuff(enPKProtectBuffID, 1);
		end
		if not CConfig.bIsCrossSvr then
			objSelf:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventBeKilled,1,dwEnemyID,4);
		end;
		dwOwnerID = dwEnemyID;
		
		local objKiller = objMapSystem:GetRoleByID(dwEnemyID);
		if objKiller then
			if not CConfig.bIsCrossSvr then
				objKiller:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventKillPlayer,1,objSelf:GetRoleID(),0);
			end;
			if dwPKValue == 0 then
				objKiller:GetSystem("CPKSystem"):AddGuildValue();
			end
		end
	elseif dwEnemyType == -1 then
		if not CConfig.bIsCrossSvr then
			objSelf:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventBeKilled,1,0,3,0);
		end;
	end
	
	self:DealWithDeadEndure(dwPKValue);
	
	--红名，掉钱
	if dwPKValue > 0 then
		local tbPos = objMapSystem:GetPlayerPos();
		
		local objItemSys = objSelf:GetSystem("CItemSystem");
		local dwMoney = objItemSys:GetAllPacketMoney();
		local dwLostMoney = math.floor(dwMoney * PKConfig.fMoney);
		if dwLostMoney > dwMoney then
			dwLostMoney = dwMoney;
		end
		
		if dwLostMoney > 0 then
			objItemSys:CostPacketMoney(dwLostMoney, ItemSysOperType.RedLost);
			
			objMapSystem:GetCurMap():GetDropMgr():Add(tbPos.x+1,tbPos.y+1,dwOwnerID,
				{dwItemEnum=DropFunctionConfig:GetMoneyId();dwNum=dwLostMoney;dwQuality=0})
		end
	end
	
	objSelf:BattleChange()
end;

--广播死亡相关的消息
function CBattleSystem:BroadcastDeadMsg(dwDeadFlag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	--发给视野中的人
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	-- local objMap = objMapSystem:GetCurMap();
	-- local setViewPlayer = objPlayer:GetOtherPlayer(0,1);
	
	-- if not setViewPlayer then
		-- return;
	-- end
	-- --print("send ply dead info")
	-- local tbNet = {}
	-- for n,v in pairs(setViewPlayer) do
		-- -- v.PlayerStateMsg
		-- -- {
			-- -- RoleID = objPlayer:GetRoleID();
			-- -- ActionID = enPlayerState.ePS_Dead;
			-- -- Param = dwDeadFlag;
		-- -- }
		-- table.insert(tbNet,v.objNet);
	-- end
	-- _groupcallout(tbNet, "PlayerStateMsg", 
	-- {
		-- RoleID = objPlayer:GetRoleID(),
		-- ActionID = enPlayerState.ePS_Dead,
		-- Param = dwDeadFlag,
	-- });
	
	_mapcallout("PlayerStateMsg", 
	{
		RoleID = objPlayer:GetRoleID(),
		ActionID = enPlayerState.ePS_Dead,
		Param = dwDeadFlag,
	}, 
	objMapSystem:GetLogicID(), false)
end

function CBattleSystem:BeginRelive()
	self.tmReliveBegin = GetCurTime();
end;

function CBattleSystem:Relive(dwMode)
	if self.dwDeadFlag == 0 then
		_info("It's wrong! I am alive");
		self.tmReliveBegin = nil;
		return;
	end
	
	local objSelf = self:GetPlayer();
	
	--如果在群侠副本中死亡 则返回（此时死亡规则在群侠挑战系统里处理）
	if not CConfig.bIsCrossSvr then
		local duplSystem = objSelf:GetSystem("CDuplSystem")
		if not duplSystem then
			-- print("CBattleSystem:Relive cant find duplSystem")
		end
	
		if duplSystem.objCurDupl then
			local duplId = duplSystem.objCurDupl.dwCfgID
			if duplSystem:IsInDupl() and _G.ChallengeQunXiaConfig.IsQunXiaFB(duplId) then
				return;
			end
			
			--如果再卧虎藏龙副本  超时之后只能回城复活
			-- print("duplSystem.UpdateFlag,duplSystem.dwUpdateTime,dwMode",duplSystem.UpdateFlag,duplSystem.dwUpdateTime,dwMode)
			if duplSystem.UpdateFlag and dwMode == enReliveType.eRT_Now then
				duplSystem:ShowMsgInfo(SysStringConfigInfo[9000661104], true);
				return
			end
			
			if duplSystem.objCurDupl.forbiddenReliveNow and dwMode == enReliveType.eRT_Now then
				duplSystem:ShowMsgInfo(SysStringConfigInfo[9000661104], true);
				return
			end
		end
	end
	
	local objSkillSystem = objSelf:GetSystem("CSkillSystem");
	local itemSystem = objSelf:GetSystem("CItemSystem");
	local dwNum, dwBindNum, dwUnBindNum = itemSystem:GetEnumItemNumInPacket(enItemForRelive);

	local dwChgHP = 0;
	local dwChgMP = 0;
	if dwMode == enReliveType.eRT_Now then
		--原地复活，判断时间
		if not self.tmReliveBegin then
			-- print("===Relive===no get begin")
			self.tmReliveBegin = nil;
			return;
		else
			if GetCurTime() - self.tmReliveBegin < enDeadRelivePosTime then
				-- print("===Relive==time little",GetCurTime() - self.tmReliveBegin)
				self.tmReliveBegin = nil;
				return;
			end
		end
		
		if objSelf:GetLevel() > enFreeReliveLevel then
			if dwNum > 0 then
				dwChgHP = objSkillSystem:GetInfo().dwHPMax;
				dwChgMP = objSkillSystem:GetInfo().dwMPMax;
			else
				dwMode = enReliveType.eRT_Pos;
			end
		else
			dwChgHP = objSkillSystem:GetInfo().dwHPMax;
			dwChgMP = objSkillSystem:GetInfo().dwMPMax;
		end
	end
	
	if dwMode == enReliveType.eRT_Pos then
		dwChgHP = objSkillSystem:GetInfo().dwHPMax/2;
		dwChgMP = objSkillSystem:GetInfo().dwMPMax/2;
	end
	
	self.dwDeadFlag = 0;
	
	--广播给客户端
	--self:BroadcastDeadMsg(0);
	local stateSystem = objSelf:GetSystem("CStateSystem");
	if stateSystem then
		stateSystem:ChangeState(enPlayerState.ePS_Normal);
	end
	
	objSelf.OnPlayerDeadMsg{DeadFlag = 0;};
	
	objSkillSystem:ChangeHPAndMP(dwChgHP,dwChgMP);
	
	if dwMode == enReliveType.eRT_Pos then
		local mapSystem = objSelf:GetSystem("CMapSystem");		
		if mapSystem then
			mapSystem:ReliveTransport();
		end
		if not CConfig.bIsCrossSvr then
			local duplSystem = objSelf:GetSystem("CDuplSystem")
			if duplSystem then
				if duplSystem.objCurDupl then
					local duplId = duplSystem.objCurDupl.dwCfgID
					if DuplConfig[duplId].bInShow == 0 then 
						duplSystem:ExecExitDuplByDead();
					end
				end
			end;
		end;
	elseif dwMode == enReliveType.eRT_Now then
		if objSelf:GetLevel() > enFreeReliveLevel then
			itemSystem:DelEnumItemInPacket(enItemForRelive, 1, false, _G.ItemSysOperType.Used);
		end
	end
	
	self.tmReliveBegin = nil;
end;

--死亡后掉耐久
function CBattleSystem:DealWithDeadEndure(dwPKValue)
	self:GetPlayer():GetSystem("CItemSystem"):DeadDownEquipEndure(dwPKValue);
end;


function CBattleSystem:DealQunXiaRelive()
	if self.dwDeadFlag == 0 then
		_info("It's wrong! I am alive");
		return;
	end
	
	local objSelf = self:GetPlayer();
	
	local objSkillSystem = objSelf:GetSystem("CSkillSystem");

	local dwChgHP = 0;
	local dwChgMP = 0;
	
	--直接按回城复活的逻辑处理
	dwChgHP = objSkillSystem:GetInfo().dwHPMax/2;
	dwChgMP = objSkillSystem:GetInfo().dwMPMax/2;
	
	self.dwDeadFlag = 0;
	
	--广播给客户端
	--self:BroadcastDeadMsg(0);
	local stateSystem = objSelf:GetSystem("CStateSystem");
	if stateSystem then
		stateSystem:ChangeState(enPlayerState.ePS_Normal);
	end
	
	objSelf.OnPlayerDeadMsg{DeadFlag = 0;};
	
	objSkillSystem:ChangeHPAndMP(dwChgHP,dwChgMP);
end
