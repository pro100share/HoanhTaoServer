_G.CRoleSkill = {}

function CRoleSkill:new(sSkillInfo,objSystem)
	local obj = {};
	obj.sInfo = {};
	obj.sInfo.dwRoleID          =  sSkillInfo.dwRoleID ;
	obj.sInfo.dwSkillID			=  sSkillInfo.dwSkillID ;		--技能ID
	obj.sInfo.dwSkillLevel		=  sSkillInfo.dwSkillLevel ;		--技能等级
	obj.sInfo.dwSkillKnowValue	=  sSkillInfo.dwSkillKnowValue ;		--技能熟练度
	obj.sInfo.dwOpenFlag		=  sSkillInfo.dwOpenFlag;		--开启状态
	
	obj.objSklSystem			=  objSystem;
	
	obj.dwLastExecTime			=  0;	--技能执行时间
	
	obj.dwExecNum				=  0;
	obj.isUsing					=  false;
	
	--------------
	obj.sInfo.dwLastUseTime		=  0;	--上次使用的时间
	obj.sInfo.dwCurCoolTime		=  0;	--CD时间长度
	
	obj.tbExecResult			= {};	--技能执行的结果，在技能完成时用
	
	obj.isTempSkill				= sSkillInfo.isTempSkill;--是否为临时技能
	
	obj.setParamList			= 
	{
		[1] = 0;
		[2] = 0;
		[3] = 0;
	};	--技能动态参数列表
	
	for i ,v in pairs(CRoleSkill) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end
	
	--被动技能的效果
	--self:ExecPassiveSkill();
	
	return obj;
end;

function CRoleSkill:GetID()
	return self.sInfo.dwSkillID;
end;

function CRoleSkill:GetLevel(isBaseLevel)
	local dwRsl = 0;
	
	if isBaseLevel then
		dwRsl = self.sInfo.dwSkillLevel;
	else
		local dwAddLevel = self.objSklSystem:GetSkillAddLevel(self:GetID());
		
		dwRsl = dwAddLevel + self.sInfo.dwSkillLevel;
		
		if dwRsl < 1 then
			dwRsl = 1;
		end
	end
	
	dwRsl = math.floor(dwRsl);
	
	return dwRsl
end;

function CRoleSkill:GetInfo()
	return self.sInfo;
end;

function CRoleSkill:Create()
end;

function CRoleSkill:Update()
end;

function CRoleSkill:Destroy()
end;

--取得Player对象
--dwID：对象ID，0就是获取自身的对象
function CRoleSkill:GetPlayer(dwID)
	local objResult;
	local objPlayer = self.objSklSystem:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CRoleSkill:GetPlayer",dwID)
		return nil;
	end;
	
	if dwID and dwID ~= 0 and dwID ~= self.sInfo.dwRoleID then
		local mapSystem = objPlayer:GetSystem("CMapSystem");
		objResult = mapSystem:GetRoleByID(dwID);
	else
		objResult = objPlayer;
	end
	
	return objResult;
end;

function CRoleSkill:GetPlayerSystem(szSystem,dwID)
	local objPlayer = self:GetPlayer(dwID);
	if objPlayer then
		return objPlayer:GetSystem(szSystem);
	end
end;

--获得当前目标，顺序：type+id
function CRoleSkill:GetNowTarget()
	return self.objSklSystem:GetNowTarget();
end;
------------------
--使用技能
------------------
--主动的时间触发执行
function CRoleSkill:ExecActiveTimeFunc(arrParam,actcount,tbExecList)
	local cfSkill = SkillConfig[self:GetID()];
	if not cfSkill then
		_err("cfSkill is null")
		return;
	end
	
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end;
	
	if cfSkill.dwSkillTarget == 0 then
		self:ExecSkillPlayer(cfSkill,arrParam,objSelf,actcount);
	else
		--技能作用数量
		local dwActiveNum = cfSkill:GetSkillTargetMax(objSelf:GetRoleID(),self:GetLevel());
		
		--遍历，执行技能效果
		local dwExecNum = 1;
		for n,sInfo in pairs(tbExecList) do
			local objTarget = self:GetRoleObj(sInfo[1],sInfo[2]);
			if objTarget then
				self:ExecSkillPlayer(cfSkill,arrParam,objTarget,actcount);
				
				--作用数量判断
				dwExecNum = dwExecNum + 1;
				if dwExecNum > dwActiveNum then
					break;
				end
			end
		end
	end
	
	if actcount >= self.dwMaxActCount then
		self.dwLastExecTime = 0;
	end
end;

--执行主动
function CRoleSkill:ExecActiveSkill(cfSkill,arrParam,tbExecList)
	
end;

--对单个目标的有效判断
function CRoleSkill:IsCanUseToPlayer(cfSkill,objTarget)
	local dwPKMode = self:GetPlayerSystem("CPKSystem",0).dwPKMode;
	
	if cfSkill.dwSkillTarget == 0 then
		return true;
	end
	
	if cfSkill.dwIsBenefit == 0 then
		local objSelfMapSys = self:GetPlayerSystem("CMapSystem");
		if objSelfMapSys and objSelfMapSys:GetPlayerSafeState() then
			return false;
		end
	end
	
	if (cfSkill.dwSkillTarget%100)/10 == 1 then
		-- if dwPKMode == enPKMode.ePK_Peace then
			-- return true;
		-- elseif dwPKMode == enPKMode.ePK_Team then
			-- --在一个队伍里面允许放
			-- local objTeamSystem = self:GetPlayerSystem("CTeamSystem",0);
			
			-- if objTeamSystem:InSameTeam(objTarget:GetRoleID()) then
				-- return true;
			-- end
		-- elseif dwPKMode == enPKMode.ePK_Group then
			-- --在一个工会里面允许放
		-- elseif dwPKMode == enPKMode.ePK_Judge then
			-- --目标不是罪恶允许放
			-- if objTarget:GetSystem("CPkSystem").dwPKValue == 0 then
				-- return true;
			-- end
		-- elseif dwPKMode == enPKMode.ePK_Kill then
		-- end
		return true;
	end
	
	if (cfSkill.dwSkillTarget%1000)/100 == 1 then
		--伤害技能先排除自己
		if objTarget:GetRoleID() ~= self.sInfo.dwRoleID then
			--死亡角色不受攻击
			if objTarget:GetSystem("CStateSystem").dwCurState == enPlayerState.ePS_Dead then
				return false;
			end
			
			--对方没有PK保护就可以
			if objTarget:GetSystem("CSkillSystem"):GetInfo().dwPKForbid ~= 0 then
				return false;
			end
			
			local objMapSys = objTarget:GetSystem("CMapSystem");
			if objMapSys and objMapSys:GetPlayerSafeState() then
				self:GetPlayer(0).OnServerNoticeMsg{WordID = 10000110005};
				return false;
			end
			
			if dwPKMode == enPKMode.ePK_Peace then
				--
				return false;
			elseif dwPKMode == enPKMode.ePK_Team then
				--不在一个队伍里面允许放
				local objTeamSystem = self:GetPlayerSystem("CTeamSystem",0);
			
				if not objTeamSystem:InSameTeam(objTarget:GetRoleID()) then
					return true;
				end
			elseif dwPKMode == enPKMode.ePK_Group then
				--不在一个工会里面允许放
				local objGuildSystem = self:GetPlayerSystem("CGuildSystem",0);
				if objGuildSystem then
					if objGuildSystem:IsInMyGuild(objTarget:GetRoleID()) then
						return false;
					else
						return true;
					end
				end
			elseif dwPKMode == enPKMode.ePK_Judge then
				--目标不是罪恶允许放
				if objTarget:GetSystem("CPKSystem").dwPKValue ~= 0 then
					return true;
				end
			elseif dwPKMode == enPKMode.ePK_Kill then
				return true;
			end
		end
	end
	
	return false;
end

function CRoleSkill:IsCanUseToPet(cfSkill,objTarget)
	if objTarget:GetObjType() == enEntType.eEntType_Pet then
		local targetPlayer = objTarget:GetOwnerRole();
		return self:IsCanUseToPlayer(cfSkill, targetPlayer)
	end
	return false;
end

function CRoleSkill:IsCanUseToMonster(cfSkill,objMonster)
	if (cfSkill.dwSkillTarget%1000)/100 == 1 then
		if not objMonster:IsDead() then
			--怪物无敌，无法被攻击
			if objMonster.isNotHurt then
				return false;
			end
			
			local objSelf = self:GetPlayer(0);
			if not CConfig.bIsCrossSvr then
				local objGuildSys = self:GetPlayerSystem("CGuildSystem",0);
				if objGuildSys then
					if objMonster:GetGuildID() == objGuildSys:GetGuildID() then
						return false;
					end
				end
			end;
			if objMonster.DataInfo.safeatk == 1 then
				if objMonster:GetSafeState() then
					return false;
				end
			end
			
			--判断怪物的拥有者
			local dwOwnerType = objMonster:GetOwnerType();
			local dwOwnerID = objMonster:GetOwnerID();
			if dwOwnerType == MonsterOwnerType.RoleSingle then
				if objSelf:GetRoleID() == dwOwnerID then
					return false;
				end
			elseif dwOwnerType == MonsterOwnerType.RoleTeam then
				if objSelf:GetRoleID() == dwOwnerID then
					return false;
				end
				
				local objTeamSystem = objSelf:GetSystem("CTeamSystem");
				if objTeamSystem then
					if objTeamSystem:InSameTeam(dwOwnerID) then
						return false;
					end
				end
			end
			
			return true;
		end
	end
	
	return false;
end

--技能的目标筛选
function CRoleSkill:SkillCheckTarget(cfSkill,arrParam,objTarget)
	--自身坐标
	local objSelf = self:GetPlayer(0);
	if not objSelf then
		return nil;
	end
	local objMapSystem = objSelf:GetSystem("CMapSystem");
	if not objMapSystem then
		_info("mapsystem find fail in CRoleSkill:SkillCheckTarget");
		return nil;
	end
	--local posSelf = objMapSystem:GetPlayerPos();
	local posSelf = objMapSystem:GetPlayerPos();
	
	local objPKSystem = objSelf:GetSystem("CPKSystem");
	local dwPKMode = objPKSystem.dwPKMode;
	
	local dwType = objTarget:GetObjType();
	local posTarget = nil;
	if dwType == enEntType.eEntType_Player then
		if not self:IsCanUseToPlayer(cfSkill,objTarget) then
			return nil;
		end
		
		local objMapSys = objTarget:GetSystem("CMapSystem");
		if objMapSys then
			posTarget = objMapSys:GetPlayerPos();
		end
	elseif dwType == enEntType.eEntType_Monster then
		if not self:IsCanUseToMonster(cfSkill,objTarget) then
			return nil;
		end
		
		posTarget = objTarget:GetVectorPos();
	elseif dwType == enEntType.eEntType_Pet then
		if not self:IsCanUseToPet(cfSkill,objTarget) then
			return nil;
		end
		
		posTarget = objTarget:GetPetPos();
	end
	
	if posTarget == nil then
		return nil;
	end
	
	local dwLength = math.sqrt((posSelf.x-posTarget.x)^2 + (posSelf.y-posTarget.y)^2);
	
	if cfSkill.dwRangeType == 0 then
		--单体技能判断距离
		if dwLength > cfSkill.dwDistance then
			--print("====CRoleSkill:SkillCheckTarget====",self:GetID(),dwLength,cfSkill.dwDistance)
			return nil;
		end
	else
		--其他类型通过客户端发来的坐标点判断范围
		local dwRangeType = cfSkill.dwRangeType;
		
		if dwType == enEntType.eEntType_Player then
			--这里需要判断是否可以选取该目标
			-- if dwRangeType == 3 then
				-- if not CBattleSystem:CheckWithRect(posSelf,posTarget,arrParam,cfSkill.fRangeX,cfSkill.fRangeY) then
					-- return nil;
				-- end
			-- elseif dwRangeType == 2 then
				-- local vecTemp = {x=2*arrParam.x-posSelf.x,y=2*arrParam.y-posSelf.y};
				-- if not CBattleSystem:CheckWithSector(arrParam,posTarget,vecTemp,cfSkill.fRangeX,cfSkill.fRangeY) then
					-- return nil;
				-- end
			-- elseif dwRangeType == 1 then
				-- if not CBattleSystem:CheckWithSector(posSelf,posTarget,arrParam,cfSkill.fRangeX,cfSkill.fRangeY) then
					-- return nil;
				-- end
			-- elseif dwRangeType == 4 then
				-- local dwParamLength = math.sqrt((arrParam.x-posSelf.x)^2 + (arrParam.y-posSelf.y)^2);
				-- if not CBattleSystem:CheckWithRect(posSelf,posTarget,arrParam,cfSkill.fRangeX+dwParamLength,cfSkill.fRangeY) then
					-- return nil;
				-- end
			-- end
			--服务器只判断距离
			if dwLength > cfSkill.dwDistance then
				--print("====CRoleSkill:SkillCheckTarget====",self:GetID(),dwLength,cfSkill.dwDistance)
				return nil;
			end
				
		elseif dwType == enEntType.eEntType_Monster then
			--怪物只判断距离，不再做方位判断
			if dwLength > cfSkill.dwDistance then
				--print("====CRoleSkill:SkillCheckTarget====",self:GetID(),dwLength,cfSkill.dwDistance)
				return nil;
			end
		elseif 	dwType == enEntType.eEntType_Pet then
			if dwLength > cfSkill.dwDistance then
				--print("====CRoleSkill:SkillCheckTarget====",self:GetID(),dwLength,cfSkill.dwDistance)
				return nil;
			end
		end
	end
	
	return true;
end;

--单个目标的处理
--返回true表示宝剑触发成功，返回false表示不成功
function CRoleSkill:ExecSkillPlayer(cfSkill,arrParam,objTarget,dwActCount)
	--先对目标是否可以攻击做检测
	if not self:SkillCheckTarget(cfSkill,arrParam,objTarget) then
		--print("=======================",self:GetID())
		return;
	end
	
	--命中判断
	local objBattleSystem = self:GetPlayerSystem("CBattleSystem",0);
	
	--使用有害技能攻击范围内有目标，直接进入战斗状态
	local stateSystem = self:GetPlayerSystem("CStateSystem",0);
	if stateSystem and (cfSkill.dwIsBenefit == 0) then
		stateSystem:CheckPlayerAction(enPlayerAction.ePA_Attack);
	end
	local isExecSword = false;
	local dwTargetType = objTarget:GetObjType();
	local dwTargetID = 0;
	if dwTargetType == enEntType.eEntType_Player then
		dwTargetID = objTarget:GetRoleID();
		--有害技能，目标进行受伤动作
		if cfSkill.dwIsBenefit == 0 then
			if not CConfig.bIsCrossSvr then
				self:GetPlayerSystem("CPlayerEventCenterSystem",0):DoEvent(enumPlayerEventType.EventPVP,1);
			end;
			objTarget:GetSystem("CStateSystem"):CheckPlayerAction(enPlayerAction.ePA_Hurt);
			
			if not CConfig.bIsCrossSvr then
				--伤害了Player，犯罪了
				if objTarget:GetSystem("CPKSystem").dwPKValue == 0 then
					self:GetPlayerSystem("CPKSystem",0):AddYellow();
				end
				
				--动手了就失去PK保护BUFF
				self:GetPlayerSystem("CBuffSystem",0):DeleteBuffByID(enPKProtectBuffID);
			end;
			
			
			objTarget.OnHurtMeMsg{RoleType = enEntType.eEntType_Player,RoleID = self.sInfo.dwRoleID};
		end
	elseif dwTargetType == enEntType.eEntType_Monster then
		dwTargetID = objTarget:GetRoleID();
		--攻击有拥有者的怪物，等同于攻击玩家
		if objTarget:GetOwnerID() ~= 0 and cfSkill.dwIsBenefit == 0 then
			if not CConfig.bIsCrossSvr then
				self:GetPlayerSystem("CPKSystem",0):AddYellow();
				self:GetPlayerSystem("CBuffSystem",0):DeleteBuffByID(enPKProtectBuffID);
			end
		end
	elseif dwTargetType == enEntType.eEntType_Pet then	
		if cfSkill.dwIsBenefit == 0 then
		
			if not CConfig.bIsCrossSvr then
				--伤害了Player，犯罪了
				if objTarget:GetOwnerRole():GetSystem("CPKSystem").dwPKValue == 0 then
					self:GetPlayerSystem("CPKSystem",0):AddYellow();
				end
				
				self:GetPlayerSystem("CBuffSystem",0):DeleteBuffByID(enPKProtectBuffID);
			end
			
		end
	end
	
	if cfSkill.dwIsBenefit == 1 then
		--objTarget:ReadySkillEffect(self:GetID(),dwActCount);
		CSkillPlayerManager:Ready(objTarget,self:GetID(),dwActCount);
		cfSkill:SkillActiveEffect(self,objTarget,dwActCount);
		--objTarget:EndSkillEffect(self:GetID(),dwActCount,self.dwLastExecTime,dwActCount >= self.dwMaxActCount);
		CSkillPlayerManager:End(objTarget,self:GetID(),dwActCount,self.dwLastExecTime,dwActCount >= self.dwMaxActCount)
		--有益技能，目标的战斗状态判断
		if dwTargetType == enEntType.eEntType_Player and dwTargetID ~= self:GetInfo().dwRoleID then
			local tarState = objTarget:GetSystem("CStateSystem");
			if tarState and tarState.dwCurState == enPlayerState.ePS_Fight then
				self:GetPlayerSystem("CStateSystem",0):CheckPlayerAction(enPlayerAction.ePA_Attack);
			end
		end
	else
		if objBattleSystem:HitJudge(self,cfSkill,objTarget,dwActCount) then
			--objTarget:ReadySkillEffect(self:GetID(),dwActCount);
			CSkillPlayerManager:Ready(objTarget,self:GetID(),dwActCount);
			cfSkill:SkillActiveEffect(self,objTarget,dwActCount);
			--objTarget:EndSkillEffect(self:GetID(),dwActCount,self.dwLastExecTime,dwActCount >= self.dwMaxActCount);
			
			CSkillPlayerManager:End(objTarget,self:GetID(),dwActCount,self.dwLastExecTime,dwActCount >= self.dwMaxActCount)
		else
			--未命中，MISS提示，广播
			--local dwTargetType = objTarget:GetObjType();
			if dwTargetType == enEntType.eEntType_Player then
				objTarget:GetSystem("CSkillSystem"):BroadcastBattleNotice(enBattleNoticeType.eBNT_MISS,0,enEntType.eEntType_Player,
				self.sInfo.dwRoleID,false,self:GetID(),self.dwLastExecTime,dwActCount);
			elseif dwTargetType == enEntType.eEntType_Monster then
				objTarget:StrikeMiss(enEntType.eEntType_Player,self.sInfo.dwRoleID,self:GetID(),self.dwLastExecTime,dwActCount);
			elseif dwTargetType == enEntType.eEntType_Pet then
				objTarget:GetOwnerRole():GetSystem('CPetSystem'):GetPetSikllSystem():BroadcastBattleNotice(enBattleNoticeType.eBNT_MISS,0,enEntType.eEntType_Player,
				self.sInfo.dwRoleID,false,self:GetID(),self.dwLastExecTime,dwActCount)
			end
		end
	end
	
	return isExecSword;
end;


--执行开关
function CRoleSkill:ExecModeSkill(dwOpenFlag,bInit)
	local cfSkill = SkillConfig[self:GetID()];
	if not cfSkill then
		return;
	end
	
	if math.floor((cfSkill.dwSkillType%1000)/100) ~= 1 then
		self.sInfo.dwOpenFlag = 0;
		return;
	end
	
	--print("CRoleSkill:ExecModeSkill",self:GetID(),dwOpenFlag)
	
	local dwNewFlag = 0;
	
	if not dwOpenFlag then
		if self.sInfo.dwOpenFlag and self.sInfo.dwOpenFlag == 1 then
			dwNewFlag = 0;
		else
			dwNewFlag = 1;
		end
	else
		dwNewFlag = dwOpenFlag;
	end
	
	if not bInit then
		if dwNewFlag == self.sInfo.dwOpenFlag then
			return;
		end
	end
	
	if dwNewFlag == 1 then
		if not bInit then
			self.objSklSystem:CloseSkillFlag();
		end
		cfSkill:SkillOpenEffect(self);
	elseif dwNewFlag == 0 then
		cfSkill:SkillCloseEffect(self);
	end
	self.sInfo.bIsUpdate = true;
	self.sInfo.dwOpenFlag = dwNewFlag;
	
	local dwFlg = 0;
	if bInit then
		dwFlg = 1;
	end
	
	self:GetPlayer(0).OnOpenFlagChangeMsg
	{
		SkillID = self:GetID(),
		OpenFlag = dwNewFlag,
		Init = dwFlg;
	}
	
	return true;
end;

--当心法开启状态下升级时调用，再执行一遍函数
function CRoleSkill:ExecModeReset()
	local cfSkill = SkillConfig[self:GetID()];
	if not cfSkill then
		return;
	end
	
	if math.floor((cfSkill.dwSkillType%1000)/100) ~= 1 then
		self.sInfo.dwOpenFlag = 0;
		return;
	end
	
	if self.sInfo.dwOpenFlag == 0 then
		return;
	end
	
	cfSkill:SkillOpenEffect(self);
end;

--执行被动，isNeedDec--是否需要在被动技能增加属性的时候，删除掉上个级别的属性值
function CRoleSkill:ExecPassiveSkill()
	local cfSkill = SkillConfig[self:GetID()];
	if not cfSkill then
		return;
	end
	
	local dwSkillType = cfSkill.dwSkillType;
	
	--判断是否为被动
	if math.floor((dwSkillType%100)/10) == 1 then
		cfSkill:SkillPassiveEffect(self);
	end
end;

function CRoleSkill:GetRoleObj(dwRoleType,dwRoleID)
	local obj = nil;
	if dwRoleType == enEntType.eEntType_Monster then
		local mapSystem = self:GetPlayerSystem("CMapSystem",0);
		obj = mapSystem:GetCurMap():GetMonsterByObjID(dwRoleID);
	elseif dwRoleType == enEntType.eEntType_Player then
		obj = self:GetPlayer(dwRoleID);
	elseif dwRoleType == enEntType.eEntType_Pet then
		-- obj = self:GetPlayer(dwRoleID):GetSystem('CPetSystem'):GetOutPetObject();
		local sysRolePet = self:GetPlayerSystem('CPetSystem',dwRoleID);
		if sysRolePet then
			obj = sysRolePet:GetOutPetObject();
		end
	end
	
	return obj;
end;

-- --技能执行的起点
-- function CRoleSkill:ExecRequest(arrParam,dwExecTime,tbExecList)
	-- local cfSkill = SkillConfig[self:GetID()];
	-- if not cfSkill then
		-- _err("cfSkill is null")
		-- return;
	-- end
	
	-- local dwSkillKinds = cfSkill.dwSkillKinds;
	
	-- local dwTargetType,dwTargetID = self:GetNowTarget();
	-- if dwTargetType == enEntType.eEntType_NPC then
		-- _info("NPC can not target");
		-- return false;
	-- end

	-- local objSelf = self:GetPlayer(0);
	-- if not objSelf then
		-- _info("get objSelf fail in CRoleSkill:ExecRequest");
		-- return false;
	-- end
	
	-- --判断条件
	-- if not self:CheckSkillCondition(cfSkill) then
		-- --print("Condition Check fail")
		-- return false;
	-- end
	
	-- --CD判断
	-- local dwNowTime = GetCurTime();
	-- --print("Use Skill",self:GetID(),dwNowTime,self.sInfo.dwLastUseTime,self.sInfo.dwCurCoolTime)
	-- if dwNowTime - self.sInfo.dwLastUseTime < self.sInfo.dwCurCoolTime then
		-- --print("CD Check fail")
		-- return false;
	-- end
	
	-- -- --距离判断
	-- -- if math.floor(dwSkillType%10) == 1 and cfSkill.dwRangeType ~= 1 and cfSkill.dwRangeType ~= 3 then
		-- -- local vecSelfPos = objSelf:GetSystem("CMapSystem"):GetPlayerPos();
		-- -- local dwLength = math.sqrt((vecSelfPos.x - arrParam.x)^2 + (vecSelfPos.y - arrParam.y)^2);
		-- -- if dwLength > cfSkill.dwDistance then
			-- -- return false;
		-- -- end
	-- -- end
	
	-- --禁止使用技能的判断，0表示没有禁止
	-- --dwSkillForbidFlag -1 全部禁止
	-- -- local sBattleInfo = self.objSklSystem:GetInfo();
	-- -- if sBattleInfo.dwSkillForbidFlag == -1 then
		-- -- return false
	-- -- else
		-- -- if cfSkill.dwForbidGroup ~= 0 then
			-- -- local dwMode = 10^cfSkill.dwForbidGroup;
			-- -- --取位
			-- -- local dwFlag = (sBattleInfo.dwSkillForbidFlag % dwMode)/(dwMode/10);
			-- -- dwFlag = math.floor(dwFlag);
			-- -- --位上值为1则禁止，0则允许
			-- -- if dwFlag == 1 then
				-- -- return false;
			-- -- end
		-- -- end
	-- -- end
	
	-- if not CheckSkillCanUseByForbidFlag(sBattleInfo.dwSkillForbidFlag,cfSkill.dwForbidGroup) then
		-- return false;
	-- end
	
	-- if cfSkill.CheckSpecialCondition then
		-- if not cfSkill:CheckSpecialCondition(objSelf) then
			-- return false;
		-- end
	-- end
	
	-- --状态判断
	-- self:GetPlayerSystem("CStateSystem"):CheckPlayerAction(enPlayerAction.ePA_SkillExe);
	
	-- --释放成功
	-- self.objSklSystem:SendSkillExecCode(self:GetID(),enSkillResult.eSRType_Succ);
	-- self.objSklSystem:SendSkillUserAction();
	
	-- self.objSklSystem:ExecSkillEvent("EventReadyExecSkillP",objSelf,self);
	
	-- objSelf:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventUseSkill,self:GetID());
	
	-- --技能消耗
	-- self:ExpendSkill(cfSkill);
	
	-- --判断是否为主动
	-- if dwSkillKinds == 1 then
		-- self.dwLastExecTime = dwExecTime;
		-- self:ExecActiveSkill(cfSkill,arrParam,tbExecList);
	-- end
	-- --开关
	-- if dwSkillKinds == 2 then
		-- self:ExecModeSkill(arrParam);
	-- end
	
	-- self.objSklSystem:ExecSkillEvent("EventCompExecSkillP",objSelf,self);
	
	-- --CD时间添加
	-- self:AddCDTime();
	
	-- return true;
-- end;

function CRoleSkill:AddSkillKnowValue(dwValue)
	local objMe =self:GetPlayer(0);
	if not objMe then
		return;
	end;
	
	local cfSkill = SkillConfig[self:GetID()];
	if not cfSkill then
		_err("cfSkill is null");
		return
	end
	
	local sConditionInfo = cfSkill:GetSkillStudyCondition(self:GetLevel(true));
	if not sConditionInfo then
		return
	end
	if not sConditionInfo.dwCanUp then
		return
	end
	
	local dwMax = cfSkill:GetSkilledUp(0,self:GetLevel(true));
	--满了就不加
	if self.sInfo.dwSkillKnowValue >= dwMax then
		return;
	end
	
	if self.sInfo.dwSkillKnowValue + dwValue > dwMax then
		dwValue = dwMax - self.sInfo.dwSkillKnowValue;
	end
	
	self.sInfo.dwSkillKnowValue = self.sInfo.dwSkillKnowValue + dwValue;

	objMe.OnChgSkillKnowledgeMsg
	{
		SkillID = self:GetID();
		Value = self.sInfo.dwSkillKnowValue;
	}
	self.sInfo.bIsUpdate = true;
	
	return dwValue;
end;

function CRoleSkill:AddCDTime()
	local cfSkill = SkillConfig[self:GetID()];
	if not cfSkill then
		_err("cfSkill is null");
		return
	end
	
	local dwCDTime = cfSkill:GetCoolDelay(self.objSklSystem:GetInfo().dwAttackSpeed,self:GetLevel());
	
	--服务器对CD做一个容差
	local dwUsedCDTime = dwCDTime - 200;
	if dwUsedCDTime < 0 then
		dwUsedCDTime = 0;
	end
	
	local dwNow = GetCurTime();
	
	--服务器不记录公共CD
	for id,objRoleSkill in pairs(self.objSklSystem.setAllSkill) do
		local cfgSkill = SkillConfig[id];
		
		if cfgSkill and cfgSkill.dwSkillKinds ~= 3 then
			local dwCoolTime = dwUsedCDTime;
			local isNeedRecordCD = nil;
			
			if cfSkill.dwCDGroup == 0 then
				if id == self:GetID() then 
					isNeedRecordCD = true;
				end
			else
				if cfgSkill.dwCDGroup == cfSkill.dwCDGroup then 
					isNeedRecordCD = true;
				end
			end
			
			if isNeedRecordCD then
				if objRoleSkill.sInfo.dwLastUseTime == 0 then
					objRoleSkill.sInfo.dwCurCoolTime = dwCoolTime;
					objRoleSkill.sInfo.dwLastUseTime = dwNow;
				else
					local dwLostCDTime = objRoleSkill.sInfo.dwCurCoolTime + objRoleSkill.sInfo.dwLastUseTime - dwNow;
					
					if dwLostCDTime < 0 then
						dwLostCDTime = 0;
					end
					
					if dwLostCDTime < dwCoolTime then
						objRoleSkill.sInfo.dwCurCoolTime = dwCoolTime;
						objRoleSkill.sInfo.dwLastUseTime = dwNow;
					end
				end
			end
		end
	end
end;


--条件判断
function CRoleSkill:CheckSkillCondition(cfSkill)
	local objSelf = self:GetPlayer(0);
	if not objSelf then
		return false;
	end;
	if cfSkill.dwLimitItem == 1 then
		if not CConfig.bIsCrossSvr then
			if not self:GetPlayerSystem("CItemSystem", 0):IsWornWeapon() then
				-- print("No Weapon")
				return false;
			end
		end
	end
	
	local costInfo = cfSkill:GetConsumptionTable(self:GetLevel(true),self.objSklSystem:GetInfo());
	local sRoleInfo = self.objSklSystem:GetInfo();
	
	if sRoleInfo.dwHP <= costInfo.hp then
		return false;
	end
	
	if sRoleInfo.dwMP < costInfo.mp then
		return false;
	end
	
	--物品
	
	--五行技能点
	if sRoleInfo.dwDander < costInfo.wxd*10000 then
		return false;
	end
	
	return true;
end;

--技能消耗
function CRoleSkill:ExpendSkill(cfSkill)
	local objSelf = self:GetPlayer(0);
	if not objSelf then
		return;
	end;
	local costInfo = cfSkill:GetConsumptionTable(self:GetLevel(true),self.objSklSystem:GetInfo());
	
	if costInfo.hp ~= 0 then
		self.objSklSystem:ChgHP(0-costInfo.hp,false,0,0,0,0,0);
	end
	
	if costInfo.mp ~= 0 then
		self.objSklSystem:ChgMP(0-costInfo.mp,false,0,0,0,0,0);
	end
	
	if costInfo.wxd ~= 0 then
		self.objSklSystem:ChangeAttr("dwDander",0-(costInfo.wxd*10000));
	end
	
	for id,num in pairs(costInfo.item) do
		
	end
end;

--内功和心法当前是否有效的判断
function CRoleSkill:IsActive()
	local cfSkill = SkillConfig[self:GetID()];
	if not cfSkill then
		_err("cfSkill is null");
		return
	end
	
	--如果是内功
	if math.floor((cfSkill.dwSkillType%100)/10) == 1 then
		return true;
	end
	
	--如果是心法
	if math.floor((cfSkill.dwSkillType%1000)/100) == 1 then
		if self.sInfo.dwOpenFlag == 1 then
			return true;
		end
	end
	
	return false;
end;

local function MakeKey(dwType,dwRoleID)
	return dwRoleID*10 + dwType;
end;
local function ReleaseKey(dwKey)
	local ty = dwKey%10;
	local id = math.floor(dwKey/10);
	
	return ty,id;
end;

function CRoleSkill:AddSkillResult(dwType,dwRoleID,dwVal)
	local key = MakeKey(dwType,dwRoleID);
	
	if not self.tbExecResult[key] then
		self.tbExecResult[key] = 0;
	end
	
	self.tbExecResult[key] = self.tbExecResult[key] + (dwVal or 0);
end;

---------------------------------------
----效果接口

--攻击处理
function CRoleSkill:ExecuHarmCount(objAttacker,objDefender,dwActCount)
	
	local objAttBattle = objAttacker:GetSystem("CBattleSystem");
	if not objAttBattle then
		_info("get objAttBattle fail in CRoleSkill:ExecuHarmCount");
		return;
	end
	
	local dwDefType = objDefender:GetObjType();
	
	local dwDamageValue,isCrit = objAttBattle:DamageCount(self,objAttacker,objDefender,dwActCount);
	
	if dwDefType == enEntType.eEntType_Player then
		local objDefBattle = objDefender:GetSystem("CBattleSystem");
		if not objDefBattle then
			_info("get objDefBattle fail in CRoleSkill:ExecuHarmCount");
			return;
		end
		dwDamageValue = objDefBattle:Hurt(dwDamageValue,isCrit,objAttacker,self:GetID(),self:GetLevel(),self.dwLastExecTime,dwActCount);
	elseif dwDefType == enEntType.eEntType_Monster then
		dwDamageValue = objDefender:Hurt(dwDamageValue,isCrit,objAttacker,self:GetID(),self.dwLastExecTime,dwActCount);
	elseif dwDefType == enEntType.eEntType_Pet then
		-- print("player hurt pet dwDamageValue", dwDamageValue)
		dwDamageValue = objDefender:Hurt(dwDamageValue,isCrit,objAttacker,self:GetID(),self:GetLevel(),self.dwLastExecTime,dwActCount);
	end
	
	self.objSklSystem:ExecSkillEvent("EventHurtA",objAttacker,objDefender,self,dwDamageValue,isCrit,dwActCount);
	
	self:AddSkillResult(dwDefType,objDefender:GetRoleID(),dwDamageValue);
	
	
	--技能命中后的事件逻辑
	local cfSkill = SkillConfig[self:GetID()];
	if not cfSkill then
		-- print("error: no skill config",self:GetID())
		return;
	end
	
	--没有追加事件
	if cfSkill.dwEventID == 0 then
		return;
	end
	
	local dwHitValue = SkillEventFunc.GetSkillEventHitValue(objAttacker,self:GetID(),self:GetLevel());
	local dwResistValue = SkillEventFunc.GetSkillEventResistValue(objDefender,cfSkill.dwEventID);
	
	if not SkillEventFunc.IsSkillEventHit(dwHitValue,dwResistValue) then
		return;
	end
	
	SkillEventFunc.ExecSkillEvent(objAttacker,objDefender,cfSkill.dwEventID,cfSkill.dwEventBuffID,cfSkill.dwEventLevel,
		cfSkill.dwperiod,{self:GetID(),self.dwLastExecTime,dwActCount});
end;

--治疗处理
function CRoleSkill:ExecuTreatCount(objDoctor,objPatient,dwValue)
	local dwPatType = objPatient:GetObjType();
	if dwPatType == enEntType.eEntType_Monster then
		return;
	end
	
	local dwUsedValue = self.objSklSystem:ExecSkillEvent("EventTreatChange",objDoctor,objPatient,self,dwValue);
	if dwUsedValue then
		dwValue = dwUsedValue
	end
	
	local objPatBattle = objPatient:GetSystem("CBattleSystem");
	
	objPatBattle:Treat(dwValue,objDoctor,self);
	
	self.objSklSystem:ExecSkillEvent("EventTreatA",objDoctor,objPatient,self,dwValue);
end;



-------------------------
--执行相关函数
function CRoleSkill:ExecBegin(dwExecTime,tbExecPoint,tbParamList)
	--print("=---------CRoleSkill:ExecBegin--------");
	local cfSkill = SkillConfig[self:GetID()];
	if not cfSkill then
		_err("cfSkill is null",self:GetID())
		return;
	end

	local objSelf = self:GetPlayer(0);
	if not objSelf then
		_info("get objSelf fail in CRoleSkill:ExecRequest");
		return false;
	end
	--print("=---------CRoleSkill:ExecBegin1--------");
	if objSelf:IsDead() then
		return false;
	end
		--print("=---------CRoleSkill:ExecBegin2--------");
	--判断条件
	if not self:CheckSkillCondition(cfSkill) then
		--print("Condition Check fail")
		return false;
	end
		--print("=---------CRoleSkill:ExecBegin3--------");
	--CD判断
	local dwNowTime = GetCurTime();
	--print("Use Skill",self:GetID(),dwNowTime,self.sInfo.dwLastUseTime,self.sInfo.dwCurCoolTime)
	if dwNowTime - self.sInfo.dwLastUseTime < self.sInfo.dwCurCoolTime then
		--print("CD Check fail")
		return false;
	end
		--print("=---------CRoleSkill:ExecBegin4--------");
	--禁止使用技能的判断，0表示没有禁止
	--dwSkillForbidFlag -1 全部禁止
	local sBattleInfo = self.objSklSystem:GetInfo();
	if sBattleInfo.dwSkillForbidFlag == -1 then
			--print("=---------CRoleSkill:ExecBegin5--------");
		return false
	else
		if cfSkill.dwForbidGroup ~= 0 then
			local dwMode = 10^cfSkill.dwForbidGroup;
			--取位
			local dwFlag = (sBattleInfo.dwSkillForbidFlag % dwMode)/(dwMode/10);
			dwFlag = math.floor(dwFlag);
			--位上值为1则禁止，0则允许
			if dwFlag == 1 then
					--print("=---------CRoleSkill:ExecBegin6--------");
				return false;
			end
		end
	end
		--print("=---------CRoleSkill:ExecBegin7--------");
	if cfSkill.CheckSpecialCondition then
		if not cfSkill:CheckSpecialCondition(objSelf) then
			return false;
		end
	end
	--print("=---------CRoleSkill:ExecBegin8--------");
	--状态判断
	self:GetPlayerSystem("CStateSystem"):CheckPlayerAction(enPlayerAction.ePA_SkillExe);
	
	--释放成功
	self.objSklSystem:SendSkillExecCode(self:GetID(),enSkillResult.eSRType_Succ);
	--print("=---------CRoleSkill:ExecBegin10--------");
	if not CConfig.bIsCrossSvr then
		local objEventCenter = objSelf:GetSystem("CPlayerEventCenterSystem");
		if objEventCenter then
			objEventCenter:DoEvent(enumPlayerEventType.EventUseSkill,self:GetID());
			if self:GetID() == 61001 then
				objEventCenter:DoEvent(enumPlayerEventType.EventWuShuang);
			end
		end
	end;
	--print("=---------CRoleSkill:ExecBegin11--------");
	--技能消耗
	self:ExpendSkill(cfSkill);
	--print("=---------CRoleSkill:ExecBegin12--------");
	self.isUsing = true;
	
	self.tbPoint = tbExecPoint;
	local arrTime = cfSkill:GetExecTimeArray();
	if arrTime then
		self.dwMaxActCount = #arrTime;
	else
		self.dwMaxActCount = 1;
	end
	--print("=---------CRoleSkill:ExecBegin13--------");
	self.objSklSystem:BroadcastSkillMsg(true,"OnRoleSkillBeginMsg",
	{
		RoleID = objSelf:GetRoleID();
		SkillID = self:GetID();
		ParamList = tbParamList;
	})
	--print("=---------CRoleSkill:ExecBegin14--------");
	--如果是移动型的动作
	if tbParamList[1] == 4 then
		self.objSklSystem:BeginMoveAction(tbParamList[6],tbParamList[5][1]);
	end
	--print("=---------CRoleSkill:ExecBegin15--------");
	self.dwLastExecTime = dwExecTime;
	--CD时间添加
	self:AddCDTime();
	--print("=---------CRoleSkill:ExecBegin16--------");
	self.objSklSystem:ExecSkillEvent("EventReadyExecSkillP",objSelf,self);
	--print("=---------CRoleSkill:ExecBegin17--------");
	if cfSkill.dwSkillKinds == 1 then
		self:AddSkillKnowValue(1);
	end
	--print("=---------CRoleSkill:ExecBegin18--------");
	return true;
end;

function CRoleSkill:ExecProcess(tbTargetList,dwActNumber)
	--print("=---------CRoleSkill:ExecProcess--------");
	local cfSkill = SkillConfig[self:GetID()];
	if not cfSkill then
		_err("cfSkill is null",self:GetID())
		return;
	end
	--print("=---------CRoleSkill:ExecProcess2--------");
	--如果技能不在执行过程中，则抛弃
	if not self.isUsing then
		--print("===skill is over!===",self:GetID())
		return;
	end
	--print("=---------CRoleSkill:ExecProcess3--------");
	local objSelf = self:GetPlayer(0);
	if not objSelf then
		_info("get objSelf fail in CRoleSkill:ExecProcess");
		return false;
	end
	--print("=---------CRoleSkill:ExecProcess4--------");
	if objSelf:IsDead() then
		return false;
	end
	--print("=---------CRoleSkill:ExecProcess5--------");
	dwActNumber = dwActNumber or 1
	self.dwMaxActCount = self.dwMaxActCount or 1
	
	if dwActNumber > self.dwMaxActCount then
		return;
	end
	--print("=---------CRoleSkill:ExecProcess6--------");
	--判断执行时间
	local dwNow = GetCurTime();
	if dwNow - self.sInfo.dwLastUseTime > cfSkill.dwWhole then
		--超过技能的执行时间，技能已经超时
		--print("===skill over time===",self:GetID(),dwNow - self.sInfo.dwLastUseTime,cfSkill.dwWhole)
		self:ExecEnd();
		return
	end
	--print("=---------CRoleSkill:7--------");
	--记录执行次数
	self.dwExecNum = self.dwExecNum + 1;
	if self.dwExecNum > cfSkill.dwFrequency then
		--超过技能的执行次数，技能已经结束
		--print("===skill over number===",self:GetID(),self.dwExecNum,cfSkill.dwFrequency)
		self:ExecEnd();
		return;
	end
	--print("=---------CRoleSkill:ExecProcess8--------");
	--判断是否为主动
	if cfSkill.dwSkillKinds == 1 then
		self:ExecActiveTimeFunc(self.tbPoint,self.dwExecNum,tbTargetList);
	end
	--开关
	if cfSkill.dwSkillKinds == 2 then
		self:ExecModeSkill();
		
		self.objSklSystem:CheckNGSkillOpen();
	end
	
	if self.dwExecNum >= self.dwMaxActCount then
		self:ExecEnd();
	end
	--print("=---------CRoleSkill:ExecProcess99--------");
end;

function CRoleSkill:ExecEnd()
	local objSelf = self:GetPlayer(0);
	if not objSelf then
		return;
	end
	
	self.dwExecNum = 0;
	
	self.isUsing = false;
	
	--宝剑触发数量
	local dwSwordExecNum = 1;
	local objSwordSys = objSelf:GetSystem("CSwordSystem");
	if not objSwordSys then
		return;
	end
	local dwSwordMax = objSwordSys:GetSwordAttackNum();
	
	local oHiddenWeaponSys = objSelf:GetSystem("CHiddenWeaponSystem");
	if not oHiddenWeaponSys then
		return;
	end
	
	for key,val in pairs(self.tbExecResult)do
		local dwType,dwID = ReleaseKey(key);
		local objTarget = self:GetRoleObj(dwType,dwID);
		if objTarget then
			--命中目标，宝剑触发
			local dwExecSkill = objSwordSys:SwordEffect();
			if dwExecSkill ~= 0 then
				local cfgSwordSkill = SkillConfig[dwExecSkill];
				if cfgSwordSkill then
					CSkillPlayerManager:Ready(objTarget,self:GetID(),self.dwMaxActCount);
					cfgSwordSkill:EventSwordExecute(objSelf,objTarget,self:GetID(),self:GetLevel(),self.dwMaxActCount,self.dwLastExecTime);
					CSkillPlayerManager:End(objTarget,self:GetID(),self.dwMaxActCount,self.dwLastExecTime,true)
				end
				
				dwSwordExecNum = dwSwordExecNum + 1;
				
				if dwSwordExecNum > dwSwordMax then
					break;
				end
			end

			-- 独孤九剑
			local oSkill = SkillConfig[110000];
			oSkill:SkillActiveEffect(self, objTarget);
			--命中目标，暗器触发
			local upLevel = self:GetPlayer():GetLevel() + HiddenWeaponConfig.expLevelDiff;
			local downLevel = self:GetPlayer():GetLevel() - HiddenWeaponConfig.expLevelDiff;
			--跨等级练技能者死。。。
			local bIsAddExp = true;
			if objTarget:GetLevel() > upLevel or objTarget:GetLevel() < downLevel then
				bIsAddExp = false;
			end
			local nHWSkillId = oHiddenWeaponSys:SkillEffect(bIsAddExp);
			
			if nHWSkillId ~= 0 then
				local oHWSkill = SkillConfig[nHWSkillId];
				if oHWSkill then
					CSkillPlayerManager:Ready(objTarget,self:GetID(),self.dwMaxActCount);
					oHWSkill:EventHiddenWeaponExecute(objSelf,objTarget,self:GetID(),self:GetLevel(),self.dwMaxActCount,self.dwLastExecTime);
					CSkillPlayerManager:End(objTarget,self:GetID(),self.dwMaxActCount,self.dwLastExecTime,true);
				end
			end
		end
	end

	
	self.objSklSystem:ExecSkillEvent("EventCompExecSkillP",objSelf,self.tbExecResult);
	
	self.tbExecResult = {};
end;


-------------------------------------------------------------------------------
function CRoleSkill:ChangeParam(dwIndex,fValue)
	if not self.setParamList[dwIndex] then
		return;
	end
	
	self.setParamList[dwIndex] = self.setParamList[dwIndex] + fValue;
end;

function CRoleSkill:GetParam(dwIndex)
	dwIndex = dwIndex or 1;
	
	return self.setParamList[dwIndex];
end;

