


_G.CPetSkillObj = {}
function CPetSkillObj:new(sSkillInfo,objSystem)
	-- local obj = {};
	-- obj.AttrInfo = {};---宠物技能属性
	-- obj.dwLastUseTime = 0;---上次使用的时间
	-- obj.dwCurCoolTime = 0;---CD时间长度
	-- obj.dwSkillTitle = 0; ---宠物技能描述
	-- obj.dwTargetType = -1; ---战斗目标类型
	-- obj.dwTargetID = -1;   ---战斗目标ID
	-- for i,v in pairs(CPetSkillObj) do
		-- if type(v) == "function" then
			-- obj[i] = v;
		-- end;
	-- end;
	-- return obj;
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	--copy form RoleSkill
	
	local obj = {};
	obj.sInfo = {};
	obj.sInfo.dwRoleID          =  sSkillInfo.dwRoleID ;
	obj.sInfo.dwSkillID			=  sSkillInfo.dwSkillID ;				--技能ID
	obj.sInfo.dwSkillLevel		=  0;			--技能等级
	--obj.sInfo.dwSkillKnowValue	=  sSkillInfo.dwSkillKnowValue ;		--技能熟练度
	
	obj.petObj 					= sSkillInfo.petObj;					--拥有此技能的宠物实例
	--obj.sInfo.dwOpenFlag		=  sSkillInfo.dwOpenFlag;		--开启状态
	
	obj.objSklSystem			=  objSystem;
	
	obj.dwLastExecTime			=  0;	--技能执行时间
	
	obj.dwExecNum				=  0;
	obj.isUsing					=  false;
	
	--------------
	obj.sInfo.dwLastUseTime		=  0;	--上次使用的时间
	obj.sInfo.dwCurCoolTime		=  0;	--CD时间长度
	
	obj.tbExecResult			= {};	--技能执行的结果，在技能完成时用
	
	for i ,v in pairs(CPetSkillObj) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end
	
	--被动技能的效果
	--self:ExecPassiveSkill();
	
	return obj;
	
end

function CPetSkillObj:Create()
	return true
end


function CPetSkillObj:GetID()
	return self.sInfo.dwSkillID;
end;

function CPetSkillObj:GetLevel()
	--print("CPetSkillObj:GetLevel()CPetSkillObj:GetLevel()",self.objSklSystem:GetSkillLevel(self.sInfo.dwSkillID))
	return self.objSklSystem:GetSkillLevel(self.sInfo.dwSkillID);			--技能等级;
end;
function CPetSkillObj:GetInfo()
	self.sInfo.dwSkillLevel	=  self.objSklSystem:GetSkillLevel(self.sInfo.dwSkillID);			--技能等级
	return self.sInfo;
end;

-- function CPetSkillObj:ExecSkill(skillID,targetType,targetID)
	
-- end

--取得Player对象
--dwID：对象ID，0就是获取自身的对象
function CPetSkillObj:GetPlayer(dwID)
	local objResult;
	local objPlayer = self.objSklSystem:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CPetSkillObj:GetPlayer",dwID)
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

function CPetSkillObj:GetRoleObj(dwRoleType,dwRoleID)
	local obj = nil;
	if dwRoleType == enEntType.eEntType_Monster then
		local mapSystem = self:GetPlayerSystem("CMapSystem",0);
		obj = mapSystem:GetCurMap():GetMonsterByObjID(dwRoleID);
	elseif dwRoleType == enEntType.eEntType_Player then
		obj = self:GetPlayer(dwRoleID);
	elseif dwRoleType == enEntType.eEntType_Pet then
		local targetPlayer = self:GetPlayer(dwRoleID);
		obj = targetPlayer:GetSystem("CPetSystem"):GetOutPetObject();
	end
	
	return obj;
end;

function CPetSkillObj:GetPlayerSystem(szSystem,dwID)
	local objPlayer = self:GetPlayer(dwID);
	if objPlayer then
		return objPlayer:GetSystem(szSystem);
	end
end;

------------------
--使用技能
------------------


function CPetSkillObj:IsCanUseToPet(cfSkill,objTarget)
	--如果可以攻击其他玩家，就可以攻击他的宠物
	return self:IsCanUseToPlayer(cfSkill,objTarget);
end

--对单个目标的有效判断
function CPetSkillObj:IsCanUseToPlayer(cfSkill,objTarget)
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

function CPetSkillObj:IsCanUseToMonster(cfSkill,objMonster)
	if (cfSkill.dwSkillTarget%1000)/100 == 1 then
		if not objMonster:IsDead() then
			local objSelf = self:GetPlayer(0);
			
			local objGuildSys = self:GetPlayerSystem("CGuildSystem",0);
			if objGuildSys then
				if objMonster:GetGuildID() == objGuildSys:GetGuildID() then
					return false;
				end
			end
			
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
function CPetSkillObj:SkillCheckTarget(cfSkill,arrParam,objTarget)
	--自身坐标
	local objSelf = self:GetPlayer(0);
	if not objSelf then
		return nil;
	end
	local objMapSystem = objSelf:GetSystem("CMapSystem");
	if not objMapSystem then
		_info("mapsystem find fail in CPetSkillObj:SkillCheckTarget");
		return nil;
	end
	--local posSelf = objMapSystem:GetPlayerPos();
	--local posSelf = objMapSystem:GetPlayerPos();
	local posSelf = self.petObj:GetPetPos();
	
	-- local objPKSystem = objSelf:GetSystem("CPKSystem");
	-- local dwPKMode = objPKSystem.dwPKMode;
	
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
		if not self:IsCanUseToPet(cfSkill, objTarget:GetOwnerRole()) then
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
		elseif dwType == enEntType.eEntType_Monster then
			--宠物只判断距离，不再做方位判断
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
function CPetSkillObj:ExecSkillPlayer(cfSkill,arrParam,objTarget,dwActCount)
	--先对目标是否可以攻击做检测
	if not self:SkillCheckTarget(cfSkill,arrParam,objTarget) then
		--print("=======================",self:GetID())
		return;
	end
	
	local dwTargetType = objTarget:GetObjType();
	local dwTargetID = 0;
	if dwTargetType == enEntType.eEntType_Player then
		dwTargetID = objTarget:GetRoleID();
		--有害技能，目标进行受伤动作
		if cfSkill.dwIsBenefit == 0 then
			
			-- 伤害了Player，犯罪了
			if objTarget:GetSystem("CPKSystem").dwPKValue == 0 then
				self:GetPlayerSystem("CPKSystem",0):AddYellow();
			end
			
			--动手了就失去PK保护BUFF
			self:GetPlayerSystem("CBuffSystem",0):DeleteBuffByID(enPKProtectBuffID);
			
			--change Msg
			objTarget.OnHurtMeMsg{RoleType = enEntType.eEntType_Pet,RoleID = self.sInfo.dwRoleID};
			
			--宠物打人进入战斗状态
			local sysState = self:GetPlayerSystem("CStateSystem",0);
			if sysState then
				sysState:ChangeState(enPlayerState.ePS_Fight);
			end
		end
	elseif dwTargetType == enEntType.eEntType_Monster then
		--dwTargetID = objTarget:GetRoleID();
		--攻击有拥有者的怪物，等同于攻击玩家
		if objTarget:GetOwnerID() ~= 0 and cfSkill.dwIsBenefit == 0 then
			self:GetPlayerSystem("CPKSystem",0):AddYellow();
			self:GetPlayerSystem("CBuffSystem",0):DeleteBuffByID(enPKProtectBuffID);
		end
	elseif dwTargetType == enEntType.eEntType_Pet then
		--攻击有拥有者的宠物，等同于攻击玩家
		if cfSkill.dwIsBenefit == 0 then
			--伤害了Player，犯罪了
			if objTarget:GetOwnerRole():GetSystem("CPKSystem").dwPKValue == 0 then
				self:GetPlayerSystem("CPKSystem",0):AddYellow();
			end
			self:GetPlayerSystem("CBuffSystem",0):DeleteBuffByID(enPKProtectBuffID);
		end
		objTarget:GetOwnerRole().OnHurtMyPetMsg{RoleType = enEntType.eEntType_Pet,RoleID = self.sInfo.dwRoleID};
	end
	
	if cfSkill.dwIsBenefit == 1 then
		--objTarget:ReadySkillEffect(self:GetID(),dwActCount);
		CSkillPlayerManager:Ready(objTarget,self:GetID(),dwActCount);
		cfSkill:SkillActiveEffect(self,objTarget,dwActCount);
		--objTarget:EndSkillEffect(self:GetID(),dwActCount,self.dwLastExecTime,dwActCount >= self.dwMaxActCount);
		CSkillPlayerManager:End(objTarget,self:GetID(),dwActCount,self.dwLastExecTime,dwActCount >= self.dwMaxActCount)
		--有益技能，目标的战斗状态判断 宠物应该不会给其他玩家释放有益技能
		-- if dwTargetType == enEntType.eEntType_Player and dwTargetID ~= self.sInfo.dwRoleID then
			-- local tarState = objTarget:GetSystem("CStateSystem");
			-- if tarState and tarState.dwCurState == enPlayerState.ePS_Fight then
				-- self:GetPlayerSystem("CStateSystem",0):CheckPlayerAction(enPlayerAction.ePA_Attack);
			-- end
		-- end
	else
		if self.petObj:HitJudge(self,cfSkill,objTarget,dwActCount) then
			--objTarget:ReadySkillEffect(self:GetID(),dwActCount);
			CSkillPlayerManager:Ready(objTarget,self:GetID(),dwActCount);
			cfSkill:SkillActiveEffect(self,objTarget,dwActCount);
			--objTarget:EndSkillEffect(self:GetID(),dwActCount,self.dwLastExecTime,dwActCount >= self.dwMaxActCount);
			
			CSkillPlayerManager:End(objTarget,self:GetID(),dwActCount,self.dwLastExecTime,dwActCount >= self.dwMaxActCount)
		else
			--未命中，MISS提示，广播
			--local dwTargetType = objTarget:GetObjType();
			if dwTargetType == enEntType.eEntType_Player then
				--change Msg
				objTarget:GetSystem("CSkillSystem"):BroadcastBattleNotice(enBattleNoticeType.eBNT_MISS,0,enEntType.eEntType_Pet,
				self.sInfo.dwRoleID,false,self:GetID(),self.dwLastExecTime,dwActCount);
			elseif dwTargetType == enEntType.eEntType_Monster then
				--change Msg
				objTarget:StrikeMiss(enEntType.eEntType_Pet,self.sInfo.dwRoleID,self:GetID(),self.dwLastExecTime,dwActCount);
			elseif dwTargetType == enEntType.eEntType_Pet then
				objTarget:GetOwnerRole():GetSystem('CPetSystem'):GetPetSikllSystem():BroadcastBattleNotice(enBattleNoticeType.eBNT_MISS,0,enEntType.eEntType_Pet,
				self.sInfo.dwRoleID,false,self:GetID(),self.dwLastExecTime,dwActCount)
			end
		end
	end
	
end;

--主动的时间触发执行
function CPetSkillObj:ExecActiveTimeFunc(arrParam,actcount,tbExecList)
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
		self:ExecSkillPlayer(cfSkill,arrParam,self.petObj,actcount);
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

--条件判断
function CPetSkillObj:CheckSkillCondition(cfSkill)
	local objSelf = self:GetPlayer(0);
	if not objSelf then
		return false;
	end;
	if cfSkill.dwLimitItem == 1 then
		if not self:GetPlayerSystem("CItemSystem", 0):IsWornWeapon() then
			--print("No Weapon")
			return false;
		end
	end
	
	local costInfo = cfSkill:GetConsumptionTable(self:GetLevel(),self.petObj:GetBattleInfo());
	local sPetInfo = self.petObj:GetPetBaseInfo();
	
	if sPetInfo.dwHP <= costInfo.hp then
		return false;
	end
	
	-- if sRoleInfo.dwMP < costInfo.mp then
		-- return false;
	-- end
	
	--物品
	
	-- --五行技能点
	-- if sRoleInfo.dwDander < costInfo.wxd*10000 then
		-- return false;
	-- end
	
	return true;
end;

--技能消耗 暂时空着
function CPetSkillObj:ExpendSkill(skillCfg)
	
end


function CPetSkillObj:AddCDTime()
	--print("CPetSkillObj:AddCDTime()CPetSkillObj:AddCDTime()")
	local cfSkill = SkillConfig[self:GetID()];
	if not cfSkill then
		_err("cfSkill is null");
		return
	end
	
	local dwCDTime = cfSkill:GetCoolDelay(self.petObj:GetBattleInfo().dwAttackSpeed,self:GetLevel());
	
	--服务器对CD做一个容差
	local dwUsedCDTime = dwCDTime - 200;
	if dwUsedCDTime < 0 then
		dwUsedCDTime = 0;
	end
	
	local dwNow = GetCurTime();
	
	local outPetAllSikll = self.objSklSystem:GetPetSkillObj(self.petObj:GetEnumID());
	--print("outPetAllSiklloutPetAllSikll",outPetAllSikll)
	--服务器不记录公共CD
	for id,objPetSkill in pairs(outPetAllSikll) do
		local cfgSkill = SkillConfig[objPetSkill.skillId];
		--print("cfgSkillcfgSkillcfgSkillcfgSkill",cfgSkill)
		if cfgSkill and cfgSkill.dwSkillKinds ~= 3 then
			local dwCoolTime = dwUsedCDTime;
			local isNeedRecordCD = nil;
			
			if cfSkill.dwCDGroup == 0 then
				if objPetSkill.skillId == self:GetID() then 
					isNeedRecordCD = true;
				end
			else
				if cfgSkill.dwCDGroup == cfSkill.dwCDGroup then 
					isNeedRecordCD = true;
				end
			end
			
			if isNeedRecordCD then
				if objPetSkill.skillObj.sInfo.dwLastUseTime == 0 then
					objPetSkill.skillObj.sInfo.dwCurCoolTime = dwCoolTime;
					objPetSkill.skillObj.sInfo.dwLastUseTime = dwNow;
				else
					local dwLostCDTime = objPetSkill.skillObj.sInfo.dwCurCoolTime + objPetSkill.skillObj.sInfo.dwLastUseTime - dwNow;
					
					if dwLostCDTime < 0 then
						dwLostCDTime = 0;
					end
					--print("dwLostCDTimedwLostCDTime",dwLostCDTime,dwCoolTime)
					if dwLostCDTime < dwCoolTime then
						objPetSkill.skillObj.sInfo.dwCurCoolTime = dwCoolTime;
						objPetSkill.skillObj.sInfo.dwLastUseTime = dwNow;
					end
				end
			end
		end
	end
end;


local function MakeKey(dwType,dwRoleID)
	return dwRoleID*10 + dwType;
end;
local function ReleaseKey(dwKey)
	local ty = dwKey%10;
	local id = math.floor(dwKey/10);
	
	return ty,id;
end;

function CPetSkillObj:AddSkillResult(dwType,dwRoleID,dwVal)
	local key = MakeKey(dwType,dwRoleID);
	
	if not self.tbExecResult[key] then
		self.tbExecResult[key] = 0;
	end
	
	self.tbExecResult[key] = self.tbExecResult[key] + dwVal;
end;

---------------------------------------
----效果接口

--攻击处理
--暂定把被动技能也加在这里处理
function CPetSkillObj:ExecuHarmCount(objDefender,dwActCount)
	local dwDefType = objDefender:GetObjType();
	local objAttacker = self.objSklSystem.petSys:GetOutPetObject();
	
	local dwDamageValue,isCrit = objAttacker:DamageCount(self,objDefender,dwActCount);
	--可在此处计算被动技能的影响
	
	--print("dwDamageValue==========>>",dwDamageValue)
	if dwDefType == enEntType.eEntType_Player then
		local objDefBattle = objDefender:GetSystem("CBattleSystem");
		if not objDefBattle then
			_info("get objDefBattle fail in CPetSkillObj:ExecuHarmCount");
			return;
		end
		dwDamageValue = objDefBattle:Hurt(dwDamageValue,isCrit,objAttacker,self:GetID(),self:GetLevel(),self.dwLastExecTime,dwActCount);
	elseif dwDefType == enEntType.eEntType_Monster then
		dwDamageValue = objDefender:Hurt(dwDamageValue,isCrit,objAttacker,self:GetID(),self.dwLastExecTime,dwActCount);
		--print("dwDamageValue===========1111>>",dwDamageValue)
	elseif dwDefType == enEntType.eEntType_Pet then
		dwDamageValue = objDefender:Hurt(dwDamageValue,isCrit,objAttacker,self:GetID(),self:GetLevel(),self.dwLastExecTime,dwActCount);
	end
	--print("dwDamageValuedwDamageValuedwDamageValue",dwDamageValue)
	self.objSklSystem:ExecSkillEvent("EventHurtA",objAttacker,objDefender,self,dwDamageValue,isCrit,dwActCount);
	
	self:AddSkillResult(dwDefType,objDefender:GetRoleID(),dwDamageValue);
	
	
	--技能命中后的事件逻辑
	local cfSkill = SkillConfig[self:GetID()];
	if not cfSkill then
		--print("error: no skill config",self:GetID())
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


-------------------------
--执行相关函数
function CPetSkillObj:ExecBegin(dwExecTime,tbExecPoint,tbParamList,fDirValue)
	--print(" CPetSkillObj:ExecBegin CPetSkillObj:ExecBegin")
	local cfSkill = SkillConfig[self:GetID()];
	if not cfSkill then
		_err("cfSkill is null",self:GetID())
		return;
	end

	local objSelf = self:GetPlayer(0);
	if not objSelf or objSelf:IsDead() then
		_info("get objSelf fail in CPetSkillObj:ExecRequest");
		return false;
	end
	
	if self.petObj:IsDead() or self.petObj.dwState ~= 2 then
		--print("===pet dead===")
		return false;
	end
	
	--判断条件
	if not self:CheckSkillCondition(cfSkill) then
		--print("----Condition Check fail")
		return false;
	end
	
	--CD判断
	local dwNowTime = GetCurTime();
	--print("Use Skill",self:GetID(),dwNowTime,self.sInfo.dwLastUseTime,self.sInfo.dwCurCoolTime)
	if dwNowTime - self.sInfo.dwLastUseTime < self.sInfo.dwCurCoolTime then
		--print("CD Check fail")
		return false;
	end
	
	--禁止使用技能的判断，0表示没有禁止
	--dwSkillForbidFlag -1 全部禁止
	-- local sBattleInfo = self.objSklSystem:GetInfo();
	-- if sBattleInfo.dwSkillForbidFlag == -1 then
		-- return false
	-- else
		-- if cfSkill.dwForbidGroup ~= 0 then
			-- local dwMode = 10^cfSkill.dwForbidGroup;
			-- --取位
			-- local dwFlag = (sBattleInfo.dwSkillForbidFlag % dwMode)/(dwMode/10);
			-- dwFlag = math.floor(dwFlag);
			-- --位上值为1则禁止，0则允许
			-- if dwFlag == 1 then
				-- return false;
			-- end
		-- end
	-- end
	
	-- if cfSkill.CheckSpecialCondition then
		-- if not cfSkill:CheckSpecialCondition(self.petObj) then
			-- return false;
		-- end
	-- end
	
	--状态判断
	--self:GetPlayerSystem("CStateSystem"):CheckPlayerAction(enPlayerAction.ePA_SkillExe);
	
	--释放成功
	self.objSklSystem:SendSkillExecCode(self:GetID(),enSkillResult.eSRType_Succ);
	
	local objEventCenter = objSelf:GetSystem("CPlayerEventCenterSystem");
	if objEventCenter then
		objEventCenter:DoEvent(enumPlayerEventType.EventPetUseSkill,self:GetID());
	end
	
	--技能消耗
	self:ExpendSkill(cfSkill);
	
	self.isUsing = true;
	
	self.tbPoint = tbExecPoint;
	local arrTime = cfSkill:GetExecTimeArray();
	if arrTime then
		self.dwMaxActCount = #arrTime;
	else
		self.dwMaxActCount = 1;
	end
	
	self.objSklSystem:BroadcastSkillMsg(true,"OnPetSkillBeginMsg",
	{
		RoleID = objSelf:GetRoleID();
		--PetID = petObj:GetLogicID(), 
		SkillID = self:GetID();
		ParamList = tbParamList;
		DirValue = fDirValue;
	})
	
	--如果是移动型的动作
	-- if tbParamList[1] == 4 then
		-- self.objSklSystem:BeginMoveAction(tbParamList[6],tbParamList[5][1]);
	-- end
	
	self.dwLastExecTime = dwExecTime;
	--CD时间添加
	self:AddCDTime();
	
	self.objSklSystem:ExecSkillEvent("EventReadyExecSkillP",objSelf,self);
	
	-- if cfSkill.dwSkillKinds == 1 then
		-- self:AddSkillKnowValue(1);
	-- end
	
	return true;
end;

function CPetSkillObj:ExecProcess(tbTargetList,dwActNumber)
	local cfSkill = SkillConfig[self:GetID()];
	if not cfSkill then
		_err("cfSkill is null",self:GetID())
		return;
	end
	
	--如果技能不在执行过程中，则抛弃
	if not self.isUsing then
		--print("===skill is over!===",self:GetID())
		return;
	end
	
	local objSelf = self:GetPlayer(0);
	if not objSelf then
		_info("get objSelf fail in CPetSkillObj:ExecProcess");
		return false;
	end
		
	if self.petObj:IsDead() then
		return false;
	end
	
	dwActNumber = dwActNumber or 1
	self.dwMaxActCount = self.dwMaxActCount or 1
	
	if dwActNumber > self.dwMaxActCount then
		return;
	end
	
	--判断执行时间
	local dwNow = GetCurTime();
	if dwNow - self.sInfo.dwLastUseTime > cfSkill.dwWhole then
		--超过技能的执行时间，技能已经超时
		--print("===skill over time===",self:GetID(),dwNow - self.sInfo.dwLastUseTime,cfSkill.dwWhole,self.sInfo.dwLastUseTime)
		self:ExecEnd();
		return
	end
	
	--记录执行次数
	self.dwExecNum = self.dwExecNum + 1;
	if self.dwExecNum > cfSkill.dwFrequency then
		--超过技能的执行次数，技能已经结束
		--print("===skill over number===",self:GetID(),self.dwExecNum,cfSkill.dwFrequency)
		self:ExecEnd();
		return;
	end
	
	--判断是否为主动
	if cfSkill.dwSkillKinds == 1 then
		self:ExecActiveTimeFunc(self.tbPoint,self.dwExecNum,tbTargetList);
	end
	--开关
	if cfSkill.dwSkillKinds == 2 then
		--宠物没有内功
		--self:ExecModeSkill();
		
		--self.objSklSystem:CheckNGSkillOpen();
	end
	
	if self.dwExecNum >= self.dwMaxActCount then
		self:ExecEnd();
	end
end;

function CPetSkillObj:ExecEnd()
	local objSelf = self:GetPlayer(0);
	if not objSelf then
		return;
	end
	
	
	self.dwExecNum = 0;
	self.isUsing = false;
	self.objSklSystem:ExecSkillEvent("EventCompExecSkillP",objSelf,self.tbExecResult);
	self.tbExecResult = {};
end;