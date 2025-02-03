--Skill系统中关于属性的部分写在这里

-----------------------------------------------------------------------------------------------------------------------

CSkillSystem.setEquipID = {}		--装备位对应的装备ID

function CSkillSystem:GetInfo()
	local sLastInfo = {};
	
	local sAdvInfo = self.objAdvAttrInfo:GetInfo();
	local sPerInfo = self.objPerAttrInfo:GetInfo();
	
	local fightInfo = self.sBaseInfo;
	
	--如果是跨服战
	-- if CConfig.bIsCrossSvr then
		-- if self.CrossSvrBattleInfo then
			-- fightInfo = self.CrossSvrBattleInfo;
		-- else
			-- _err("CSkillSystem:GetInfo can not get CrossSvrBattleInfo！！！！")
		-- end
	-- end
	
	--只计算基本值
	sLastInfo.dwHP = fightInfo.dwHP;
	sLastInfo.dwMP = fightInfo.dwMP;
	
	sLastInfo.dwMuscle = fightInfo.dwMuscle;
	sLastInfo.dwPhysique = fightInfo.dwPhysique;
	sLastInfo.dwOrgan = fightInfo.dwOrgan;
	sLastInfo.dwTechnique = fightInfo.dwTechnique;
	sLastInfo.dwDander = fightInfo.dwDander;
	sLastInfo.dwPoint = fightInfo.dwPoint;
	sLastInfo.dwOtherPoint = self.sBaseInfo.dwOtherPoint;
	sLastInfo.dwCaromCount = fightInfo.dwCaromCount;
	
	--不计算百分比
	sLastInfo.dwAppendCrit = (fightInfo.dwAppendCrit + sAdvInfo.dwAppendCrit);
	sLastInfo.dwAllSkillUpLv = (fightInfo.dwAllSkillUpLv + sAdvInfo.dwAllSkillUpLv);
	
	--计算增量和百分比
	sLastInfo.dwAttack = (fightInfo.dwAttack + sAdvInfo.dwAttack)*(sPerInfo.dwAttack + 1);
	sLastInfo.dwDefense = (fightInfo.dwDefense + sAdvInfo.dwDefense)*(sPerInfo.dwDefense + 1);
	sLastInfo.dwFlee = (fightInfo.dwFlee + sAdvInfo.dwFlee)*(sPerInfo.dwFlee + 1);
	sLastInfo.dwHitPercent = (fightInfo.dwHitPercent + sAdvInfo.dwHitPercent)*(sPerInfo.dwHitPercent + 1);
	sLastInfo.dwCrit = (fightInfo.dwCrit + sAdvInfo.dwCrit)*(sPerInfo.dwCrit + 1);
	sLastInfo.dwHPMax = (fightInfo.dwHPMax + sAdvInfo.dwHPMax)*(sPerInfo.dwHPMax + 1);
	sLastInfo.dwMPMax = (fightInfo.dwMPMax + sAdvInfo.dwMPMax)*(sPerInfo.dwMPMax + 1);
	
	sLastInfo.dwMoveSpeed = (fightInfo.dwMoveSpeed + sAdvInfo.dwMoveSpeed)*(sPerInfo.dwMoveSpeed + 1);
	sLastInfo.dwAttackSpeed = (fightInfo.dwAttackSpeed + sAdvInfo.dwAttackSpeed)*(sPerInfo.dwAttackSpeed + 1);
	sLastInfo.dwIgnoreDefense = (fightInfo.dwIgnoreDefense + sAdvInfo.dwIgnoreDefense)*(sPerInfo.dwIgnoreDefense + 1);
	sLastInfo.dwAppendAttack = (fightInfo.dwAppendAttack + sAdvInfo.dwAppendAttack)*(sPerInfo.dwAppendAttack + 1);
	sLastInfo.dwRemitAttack = (fightInfo.dwRemitAttack + sAdvInfo.dwRemitAttack)*(sPerInfo.dwRemitAttack + 1);
	sLastInfo.dwBounceAttack = (fightInfo.dwBounceAttack + sAdvInfo.dwBounceAttack)*(sPerInfo.dwBounceAttack + 1);
	sLastInfo.dwAbsorbHP = (fightInfo.dwAbsorbHP + sAdvInfo.dwAbsorbHP)*(sPerInfo.dwAbsorbHP + 1);
	sLastInfo.dwAbsorbMP = (fightInfo.dwAbsorbMP + sAdvInfo.dwAbsorbMP)*(sPerInfo.dwAbsorbMP + 1);
	sLastInfo.dwDuck = (fightInfo.dwDuck + sAdvInfo.dwDuck)*(sPerInfo.dwDuck + 1);
	
	sLastInfo.dwDefenseValue = (fightInfo.dwDefenseValue + sAdvInfo.dwDefenseValue)*(sPerInfo.dwDefenseValue + 1);
	sLastInfo.dwCritDown = (fightInfo.dwCritDown + sAdvInfo.dwCritDown)*(sPerInfo.dwCritDown + 1);
	
	sLastInfo.dwPoJiaValue = (fightInfo.dwPoJiaValue + sAdvInfo.dwPoJiaValue)*(sPerInfo.dwPoJiaValue + 1);
	sLastInfo.dwPoJiaDiKang = (fightInfo.dwPoJiaDiKang + sAdvInfo.dwPoJiaDiKang)*(sPerInfo.dwPoJiaDiKang + 1);
		
	--只有增量值
	sLastInfo.dwPKForbid = sAdvInfo.dwPKForbid;
	sLastInfo.dwSkillForbidFlag = sAdvInfo.dwSkillForbidFlag;
	sLastInfo.dwMoveForbidFlag = sAdvInfo.dwMoveForbidFlag;
	sLastInfo.dwUseItemForbidFlag = sAdvInfo.dwUseItemForbidFlag;
	
	sLastInfo.dwMartialUp = sAdvInfo.dwMartialUp;
	sLastInfo.dwStoryFlag = sAdvInfo.dwStoryFlag;
	
	--只有百分比
	sLastInfo.dwDanderUp = sPerInfo.dwDanderUp;
	sLastInfo.dwExpUp = sPerInfo.dwExpUp;
	sLastInfo.dwMountExpUp = sPerInfo.dwMountExpUp;
	--sLastInfo.dwSitUp = sPerInfo.dwSitUp;
	sLastInfo.dwSkillKlgUp = sPerInfo.dwSkillKlgUp;
	sLastInfo.dwMartialExpUp = sPerInfo.dwMartialExpUp;
	sLastInfo.dwMartialZhenqiUp = sPerInfo.dwMartialZhenqiUp;
	
	sLastInfo.dwMonsterAppend = sPerInfo.dwMonsterAppend;
	sLastInfo.dwBossAppend = sPerInfo.dwBossAppend;
	
	if sLastInfo.dwMoveSpeed < 0 then
		sLastInfo.dwMoveSpeed = 0;
	end
	
	return sLastInfo;
end;

function CSkillSystem:GetSpeedValue()
	local sAdvInfo = self.objAdvAttrInfo:GetInfo();
	local sPerInfo = self.objPerAttrInfo:GetInfo();
	
	local fB = self.sBaseInfo.dwMoveSpeed;
	local fA = sAdvInfo.dwMoveSpeed;
	local fP = sPerInfo.dwMoveSpeed;
	
	return fB,fA,fP;
end;

local function CopyTable(to,from)
	for n,v in pairs(from)do
		to[n] = v;
	end
end;

local arrStrPlayerBattleInfo = 
{
	"dwHPMax",
	"dwMPMax",
	"dwPKForbid",
	"dwHP",
	"dwMP",
}

local function MakeDifferentTable(oldInfo,newInfo)
	local tbDif = {};
	
	if oldInfo == nil then
		if newInfo == nil then
			return tbDif;
		else
			for key,value in pairs(newInfo)do
				if type(value) ~= 'function' then
					tbDif[key] = value;
				end
			end
		end
	else
		if newInfo == nil then
			for key,value in pairs(oldInfo)do
				if type(value) ~= 'function' then
					tbDif[key] = 0-value;
				end
			end
		else
			for key,value in pairs(newInfo)do
				if type(value) ~= 'function' then
					if oldInfo[key] ~= newInfo[key] then
						tbDif[key] = newInfo[key]-oldInfo[key];
					end
				end
			end
		end
	end
	
	return tbDif;
end;

local function CheckBaseInfoName(szName)
	local arrStrPlayerBaseInfo = 
	{
		"dwHP",
		"dwMP",
		"dwPoint",
		"dwDander",
		"dwCaromCount",
		"dwOtherPoint",
	}
	
	for i,str in pairs(arrStrPlayerBaseInfo)do
		if str == szName then
			return true;
		end
	end
	
	return false;
end;

function CSkillSystem:CheckNeedSendAttr(oldInfo,newInfo)
	local tbNotice = {};
	local bNeedNotice = false;
	
	for n,str in pairs(arrStrPlayerBattleInfo)do
		if oldInfo[str] ~= newInfo[str] then
			tbNotice[str] = newInfo[str];
			bNeedNotice = true;
		end
	end
	
	if bNeedNotice then
		local tbSendInfo = {};
		for key,value in pairs(tbNotice)do
			local dwIndex = GetAttrNameToIndex(key);
			if dwIndex then
				tbSendInfo[dwIndex] = value;
			end
		end
			
		self:BroadcastSkillMsg(false,"OnRoleBattleInfoMsg",
		{
			RoleID = self:GetPlayer():GetRoleID(),
			ChangeTable = tbSendInfo,
		})
	end
end;

--改变增量值
function CSkillSystem:ChangeAttrAdv(szSystemName,userIndex,objInfo)
	if CConfig.bIsCrossSvr then
		--如果该系统不能影响跨服战 
		if not SAttrChangeInfo:IsEffectCrossSvr(szSystemName) then
			-- _info("CSkillSystem:ChangeAttrAdv=========== szSystemName", szSystemName)
			-- table.print(objInfo)
			return 
		end;
		
	end

	if not self.objAdvAttrInfo[szSystemName] then
		-- print("ERROR___CSkillSystem:ChangeAttrAdv",szSystemName)
		return false;
	end
	
	local oldInfo = {};
	CopyTable(oldInfo,self:GetInfo());
	local objOldAttr = nil;
	if self.objAdvAttrInfo[szSystemName][userIndex] then
		objOldAttr = self.objAdvAttrInfo[szSystemName][userIndex]:Clone();
	end
	
	self.objAdvAttrInfo[szSystemName][userIndex] = objInfo;
	
	self:CheckHPAndMP();
	
	local newInfo = {};
	CopyTable(newInfo,self:GetInfo());
	
	if newInfo.dwMoveSpeed ~= oldInfo.dwMoveSpeed then
		self:GetPlayer():GetSystem("CMapSystem"):SetMoveSpeed(newInfo.dwMoveSpeed);
	end
	
	--同步给客户端
	self:SendAttrChangeMsg(2,MakeDifferentTable(objOldAttr,objInfo));
	local tempTab = MakeDifferentTable(objOldAttr,objInfo);

	--检查HP，MP等数据需要广播
	self:CheckNeedSendAttr(oldInfo,newInfo);
	
	local objSelf = self:GetPlayer();
	
	if oldInfo.dwAllSkillUpLv ~= newInfo.dwAllSkillUpLv then
		if objSelf:IsLoadEnd() then
			self:CheckSkillTitle();
		end
	end
	
--quying chg 2012-04-28
	if objSelf then
		if oldInfo.dwMartialUp ~= newInfo.dwMartialUp then
			objSelf:GetSystem("CMartialSystem"):ChangeProValue(objSelf:GetRoleID(),newInfo.dwMartialUp);
		end
		
		if not CConfig.bIsCrossSvr then
			if objSelf:GetSystem("CTeamSystem") then
				if objSelf:GetSystem("CTeamSystem").m_teamId and objSelf:GetSystem("CTeamSystem").m_teamId ~= 0 then
					if oldInfo["dwHPMax"] ~= newInfo["dwHPMax"] then
						objSelf:GetSystem("CTeamSystem"):SynPlayerBlood(self.sBaseInfo.dwHP, newInfo["dwHPMax"] );
					end;
					if oldInfo["dwMPMax"] ~= newInfo["dwMPMax"] then
						objSelf:GetSystem("CTeamSystem"):SynPlayerMp(self.sBaseInfo.dwMP, newInfo["dwMPMax"]);
					end;
				end;
			end;
		end;
	end;

	-- 通知防御发生了改变，added by 王凌波
	if objInfo and objInfo.dwDefense ~= 0 then 
		self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):
			DoEvent("EventDefenseChange");
	end

	return true;
end;

--改变百分比值
function CSkillSystem:ChangeAttrPercent(szSystemName,userIndex,objInfo)
	if CConfig.bIsCrossSvr then
		--如果该系统不能影响跨服战 
		if not SAttrChangeInfo:IsEffectCrossSvr(szSystemName) then
			return 
		end;
		
	end
	
	if not self.objPerAttrInfo[szSystemName] then
		-- print("ERROR___CSkillSystem:ChangeAttrPercent",szSystemName)
		return false;
	end
	
	local oldInfo = {};
	CopyTable(oldInfo,self:GetInfo());
	
	local objOldAttr = nil;
	if self.objPerAttrInfo[szSystemName][userIndex] then
		objOldAttr = self.objPerAttrInfo[szSystemName][userIndex]:Clone();
	end
	self.objPerAttrInfo[szSystemName][userIndex] = objInfo;
	
	self:CheckHPAndMP();
	
	local newInfo = {};
	CopyTable(newInfo,self:GetInfo());
	
	if newInfo.dwMoveSpeed ~= oldInfo.dwMoveSpeed then
		self:GetPlayer():GetSystem("CMapSystem"):SetMoveSpeed(newInfo.dwMoveSpeed);
	end
	
	--同步给客户端
	self:SendAttrChangeMsg(3,MakeDifferentTable(objOldAttr,objInfo));
	
	--检查HP，MP等数据需要广播
	self:CheckNeedSendAttr(oldInfo,newInfo);
	--quying chg 2012-04-28
	local objSelf = self:GetPlayer();
	if objSelf then
		if not CConfig.bIsCrossSvr then
			if objSelf:GetSystem("CTeamSystem") then
				if objSelf:GetSystem("CTeamSystem").m_teamId and objSelf:GetSystem("CTeamSystem").m_teamId ~= 0 then
					if oldInfo["dwHPMax"] ~= newInfo["dwHPMax"] then
						objSelf:GetSystem("CTeamSystem"):SynPlayerBlood(self.sBaseInfo.dwHP, newInfo["dwHPMax"]);
					end;
					if oldInfo["dwMPMax"] ~= newInfo["dwMPMax"] then
						objSelf:GetSystem("CTeamSystem"):SynPlayerMp(self.sBaseInfo.dwMP, newInfo["dwMPMax"]);
					end;
				end;
			end;
		end;
	end;

	-- 通知防御发生了改变，added by 王凌波
	if objInfo and objInfo.dwDefense ~= 0 then 
		self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):
			DoEvent("EventDefenseChange");
	end
	
	return true;
end;


--[[
	[ \brief 增加额外的人物属性点
	[ dwOtherPoint字段只做记录不参与实际计算
	[ dwPoint,dwOtherPoint都需要增加
	[ \param number nValue 增加的点数
	]]
function CSkillSystem:AddOtherPoint(nValue)
	self:ChangeAttr("dwOtherPoint",nValue);
	self:ChangeAttr("dwPoint",nValue);
	self.objDBQuery:SaveBattleInfo(self:MakeBattleInfoForDB());
end

--改变基础值，目前只有HP,MP,怒气,连斩,潜力点
function CSkillSystem:ChangeAttr(szAttrName,fValue)
	--print("CSkillSystem:ChangeAttr",szAttrName,fValue)
	if not CheckBaseInfoName(szAttrName) then
		_err("CSkillSystem:ChangeAttrBase_name_error",szAttrName)
		return false;
	end
	
	if szAttrName == "dwHP" then
		return self:ChgHP(fValue,false,-1,0);
	elseif szAttrName == "dwMP" then
		return self:ChgMP(fValue,false,-1,0);
	else
		if szAttrName == "dwDander" then
			--怒气增加的改变
			-- local dwDanderUp = self:GetInfo().dwDanderUp;
			-- if fValue > 0 then
				-- fValue = fValue * (1 + dwDanderUp);
			-- end
			
			local isVip = false;
			if not CConfig.bIsCrossSvr then
				local objVipSys = self:GetPlayer():GetSystem("CVipSystem");
				if objVipSys then
					isVip = objVipSys:isVip();
				end
			end
			
			local dwDanderMax = ContinueKillConfig.AngerCeil;
			if isVip then
				dwDanderMax = ContinueKillConfig.VipAngerCeil;
			end
			
			if self.sBaseInfo.dwDander + fValue > dwDanderMax then
				fValue = dwDanderMax - self.sBaseInfo.dwDander;
			end
		end
		self.sBaseInfo[szAttrName] = self.sBaseInfo[szAttrName] + fValue;
		
		self:SendAttrChangeMsg(1,{[szAttrName]=fValue});
	end
	
	--player是否已经初始化了
	if self.bIsPlayerInit then
		--更新人物基础属性战斗力提升
		self:GetPlayer():GetSystem("CBattleScoreUpSystem"):AddPlayerScore(self:GetPlayer());
	end
	
	return true;
end;

function CSkillSystem:ChgNuqi(fValue)
	local dwDanderUp = self:GetInfo().dwDanderUp;
	if fValue > 0 then
		fValue = fValue * (1 + dwDanderUp);
	end
	
	self:ChangeAttr("dwDander",fValue)
end;

function CSkillSystem:IsNuqiFull()
	local isVip = false;
	if not CConfig.bIsCrossSvr then
		local objVipSys = self:GetPlayer():GetSystem("CVipSystem");
		if objVipSys then
			isVip = objVipSys:isVip();
		end
	end
	
	local dwDanderMax = ContinueKillConfig.AngerCeil;
	if isVip then
		dwDanderMax = ContinueKillConfig.VipAngerCeil;
	end
	
	return self.sBaseInfo.dwDander >= dwDanderMax;
end;

--HP改变
function CSkillSystem:ChgHP(dwValue,isCrit,dwEnemyType,dwEnemyID,dwSkillID,dwExecTime,dwActCount)
	local objSelf = self:GetPlayer();
	-- local objBtlSystem = objSelf:GetSystem("CBattleSystem");
	-- if objBtlSystem then
		-- if objBtlSystem.dwDeadFlag == 1 then
			-- return;
		-- end
	-- end

	--_info(objSelf:GetRoleID(), "hurt ,dwEnemyType dwEnemyID dwValue dwSkillID is ", dwEnemyType, dwEnemyID, dwValue, dwSkillID);
	
	if objSelf:IsDead() then
		return;
	end
	
	if not dwSkillID then
		dwSkillID = 0;
	end
	if not dwExecTime then
		dwExecTime = 0;
	end
	if not dwActCount then
		dwActCount = 0;
	end
	
	local dwOldValue = dwValue;
	
	if dwValue > 0 then
		if self.sBaseInfo.dwHP >= self:GetInfo().dwHPMax then
			--print("HP MAX");
			return nil;
		end
		
		if dwValue > self:GetInfo().dwHPMax-self.sBaseInfo.dwHP then
			dwValue = self:GetInfo().dwHPMax-self.sBaseInfo.dwHP;
			dwOldValue = dwValue;
		end
		
		self.sBaseInfo.dwHP = self.sBaseInfo.dwHP + dwValue;
		if dwSkillID ~= 0 then
			local tbSkipInfo = CSkipInfoNotice:new();
			tbSkipInfo.dwType = enBattleNoticeType.eBNT_HP_ADD;
			tbSkipInfo.dwValue = dwOldValue;
			tbSkipInfo.dwAttType = dwEnemyType;
			tbSkipInfo.dwAttID = dwEnemyID;
			tbSkipInfo.isCrit = isCrit;
			--objSelf.objSklPlayer:Add(dwSkillID,dwActCount,1,tbSkipInfo);
			CSkillPlayerManager:Add(objSelf,dwSkillID,dwActCount,1,tbSkipInfo);
		else
			self:BroadcastBattleNotice(enBattleNoticeType.eBNT_HP_ADD,dwOldValue,dwEnemyType,dwEnemyID,isCrit,dwSkillID,dwExecTime,dwActCount);
		end
	else
		if self.sBaseInfo.dwHP + dwValue < 0 then
			dwValue = 0 - self.sBaseInfo.dwHP;
		end
		
		self.sBaseInfo.dwHP = self.sBaseInfo.dwHP + dwValue;
		objSelf:GetSystem("CZhenlongChessSystem"):AddDamageHP(dwValue);
		if dwSkillID ~= 0 then
			local tbSkipInfo = CSkipInfoNotice:new();
			tbSkipInfo.dwType = enBattleNoticeType.eBNT_HP_DOWN;
			tbSkipInfo.dwValue = dwOldValue;
			tbSkipInfo.dwAttType = dwEnemyType;
			tbSkipInfo.dwAttID = dwEnemyID;
			tbSkipInfo.isCrit = isCrit;
			--objSelf.objSklPlayer:Add(dwSkillID,dwActCount,1,tbSkipInfo);
			CSkillPlayerManager:Add(objSelf,dwSkillID,dwActCount,1,tbSkipInfo);
		else
			self:BroadcastBattleNotice(enBattleNoticeType.eBNT_HP_DOWN,dwOldValue,dwEnemyType,dwEnemyID,isCrit,dwSkillID,dwExecTime,dwActCount);
		end
	end
	
	if dwSkillID ~= 0 then
		--objSelf.objSklPlayer:Add(dwSkillID,dwActCount,2,{dwHP=self.sBaseInfo.dwHP});
		CSkillPlayerManager:Add(objSelf,dwSkillID,dwActCount,2,{dwHP=self.sBaseInfo.dwHP});
	else
		self:BroadcastSkillMsg(false,"OnRoleBattleInfoMsg",
		{
			RoleID = objSelf:GetRoleID(),
			ChangeTable = {[1]=self.sBaseInfo.dwHP},
		})
	end
	
	self:SendAttrChangeMsg(1,{dwHP=dwValue});
	
	if self.sBaseInfo.dwHP <= 0 then
		local objBtlSystem = objSelf:GetSystem("CBattleSystem");
		if objBtlSystem then
			_info(objSelf:GetRoleID(), "dead ,dwEnemyType dwEnemyID dwValue dwSkillID is ", dwEnemyType, dwEnemyID, dwValue, dwSkillID);
			objBtlSystem:Dead(dwEnemyType,dwEnemyID);
		end
	end
	if not CConfig.bIsCrossSvr then
		local objTeamSys = objSelf:GetSystem("CTeamSystem");
		if objTeamSys then
			if objTeamSys.m_teamId and objTeamSys.m_teamId ~= 0 then
				objTeamSys:SynPlayerBlood(self.sBaseInfo.dwHP, self:GetInfo().dwHPMax);
			end;
		end;
	end;
	objSelf:BattleChange()
	
	return dwValue;
end;

--MP改变
function CSkillSystem:ChgMP(dwValue,isCrit,dwEnemyType,dwEnemyID,dwSkillID,dwExecTime,dwActCount)
	local objSelf = self:GetPlayer();
	if objSelf:IsDead() then
		return;
	end
	
	if not dwSkillID then
		dwSkillID = 0;
	end
	if not dwExecTime then
		dwExecTime = 0;
	end
	if not dwActCount then
		dwActCount = 0;
	end
	
	if dwValue > 0 then
		local dwNowMax = self:GetInfo().dwMPMax;
		if self.sBaseInfo.dwMP >= dwNowMax then
			--_info("MP MAX");
			return nil;
		end
		
		if dwValue > dwNowMax-self.sBaseInfo.dwMP then
			dwValue = dwNowMax-self.sBaseInfo.dwMP;
		end
		
		self.sBaseInfo.dwMP = self.sBaseInfo.dwMP + dwValue;
		
		--self:BroadcastBattleNotice(enBattleNoticeType.eBNT_MP_ADD,dwValue,dwEnemyType,dwEnemyID,isCrit);
		if dwSkillID ~= 0 then
			local tbSkipInfo = CSkipInfoNotice:new();
			tbSkipInfo.dwType = enBattleNoticeType.eBNT_MP_ADD;
			tbSkipInfo.dwValue = dwValue;
			tbSkipInfo.dwAttType = dwEnemyType;
			tbSkipInfo.dwAttID = dwEnemyID;
			tbSkipInfo.isCrit = isCrit;
			--objSelf.objSklPlayer:Add(dwSkillID,dwActCount,1,tbSkipInfo);
			CSkillPlayerManager:Add(objSelf,dwSkillID,dwActCount,1,tbSkipInfo);
		else
			self:BroadcastBattleNotice(enBattleNoticeType.eBNT_MP_ADD,dwValue,dwEnemyType,dwEnemyID,isCrit,dwSkillID,dwExecTime,dwActCount);
		end
	else
		if self.sBaseInfo.dwMP + dwValue < 0 then
			dwValue = 0 - self.sBaseInfo.dwMP;
		end
		
		self.sBaseInfo.dwMP = self.sBaseInfo.dwMP + dwValue;
		
		if dwSkillID ~= 0 then
			local tbSkipInfo = CSkipInfoNotice:new();
			tbSkipInfo.dwType = enBattleNoticeType.eBNT_MP_DOWN;
			tbSkipInfo.dwValue = dwValue;
			tbSkipInfo.dwAttType = dwEnemyType;
			tbSkipInfo.dwAttID = dwEnemyID;
			tbSkipInfo.isCrit = isCrit;
			--objSelf.objSklPlayer:Add(dwSkillID,dwActCount,1,tbSkipInfo);
			CSkillPlayerManager:Add(objSelf,dwSkillID,dwActCount,1,tbSkipInfo);
		else
			--self:BroadcastBattleNotice(enBattleNoticeType.eBNT_MP_DOWN,dwValue,dwEnemyType,dwEnemyID,isCrit,dwSkillID,dwExecTime,dwActCount);
		end
	end
	
	if dwSkillID ~= 0 then
		--objSelf.objSklPlayer:Add(dwSkillID,dwActCount,2,{dwMP=self.sBaseInfo.dwMP});
		CSkillPlayerManager:Add(objSelf,dwSkillID,dwActCount,2,{dwMP=self.sBaseInfo.dwMP});
	else
		self:BroadcastSkillMsg(false,"OnRoleBattleInfoMsg",
		{
			RoleID = objSelf:GetRoleID(),
			ChangeTable = {[2]=self.sBaseInfo.dwMP},
		})
	end
	
	self:SendAttrChangeMsg(1,{dwMP=dwValue});
	
	if not CConfig.bIsCrossSvr then
		local objTeamSys = objSelf:GetSystem("CTeamSystem");
		if objTeamSys then
			if objTeamSys.m_teamId and objTeamSys.m_teamId ~= 0 then
				objTeamSys:SynPlayerMp(self.sBaseInfo.dwMP, self:GetInfo().dwMPMax)
			end;
		end;
	end
	
	objSelf:BattleChange()
	
	return dwValue;
end;

--同时修改血和蓝，目前只提供给复活用
function CSkillSystem:ChangeHPAndMP(dwHPChg,dwMPChg)
	local objSelf = self:GetPlayer();
	local sInfo = self:GetInfo();
	
	if self.sBaseInfo.dwHP < sInfo.dwHPMax then
		if dwHPChg > sInfo.dwHPMax-self.sBaseInfo.dwHP then
			dwHPChg = sInfo.dwHPMax-self.sBaseInfo.dwHP;
		end
		
		self.sBaseInfo.dwHP = self.sBaseInfo.dwHP + dwHPChg;
	else
		dwHPChg = 0;
	end
	
	if self.sBaseInfo.dwMP < sInfo.dwMPMax then
		if dwMPChg > sInfo.dwMPMax-self.sBaseInfo.dwMP then
			dwMPChg = sInfo.dwMPMax-self.sBaseInfo.dwMP;
		end
		
		self.sBaseInfo.dwMP = self.sBaseInfo.dwMP + dwMPChg;
	else
		dwMPChg = 0;
	end
	
	self:SendAttrChangeMsg(1,{dwHP=dwHPChg,dwMP=dwMPChg});
	
	self:BroadcastSkillMsg(false,"OnRoleBattleInfoMsg",
		{
			RoleID = objSelf:GetRoleID(),
			ChangeTable = {[1]=self.sBaseInfo.dwHP,[2]=self.sBaseInfo.dwMP},
		})

	self:BroadcastBattleNotice(enBattleNoticeType.eBNT_HP_ADD,dwHPChg,-1,0,false,0,0,0);
	
	if not CConfig.bIsCrossSvr then
		local objTeamSys = objSelf:GetSystem("CTeamSystem");
		if objTeamSys then
			if objTeamSys.m_teamId and objTeamSys.m_teamId ~= 0 then
				objTeamSys:SynPlayerMp(self.sBaseInfo.dwMP, self:GetInfo().dwMPMax)
				objTeamSys:SynPlayerBlood(self.sBaseInfo.dwHP, self:GetInfo().dwHPMax);
			end;
		end;
	end;
end;

--考虑到改变HPMP最大值后可能出现的最大值小于当前值的问题
function CSkillSystem:CheckHPAndMP(b_NoNeedLoadEnd)
	if not self:GetPlayer() then
		return;
	end
	if not self:GetPlayer():IsLoadEnd() and not b_NoNeedLoadEnd then
		return;
	end
	
	local isChanged = false;
	
	local tbChg = {};
	
	local nowInfo = self:GetInfo();
	
	if self.sBaseInfo.dwMP > nowInfo.dwMPMax then
		tbChg.dwMP = nowInfo.dwMPMax - self.sBaseInfo.dwMP;
		self.sBaseInfo.dwMP = nowInfo.dwMPMax;
		isChanged = true;
	end
	
	if self.sBaseInfo.dwHP > nowInfo.dwHPMax then
	
		tbChg.dwHP = nowInfo.dwHPMax - self.sBaseInfo.dwHP;
		self.sBaseInfo.dwHP = nowInfo.dwHPMax;
		isChanged = true;
	end
	
	if isChanged then
		
		local tbNotice = {};
		tbNotice.dwMP = self.sBaseInfo.dwMP;
		tbNotice.dwHP = self.sBaseInfo.dwHP;
		self:SendAttrChangeMsg(1,tbChg);
		
		local tbSendInfo = {};
		for key,value in pairs(tbNotice)do
			local dwIndex = GetAttrNameToIndex(key);
			if dwIndex then
				tbSendInfo[dwIndex] = value;
			end
		end
		
		self:BroadcastSkillMsg(false,"OnRoleBattleInfoMsg",
		{
			RoleID = self:GetPlayer():GetRoleID(),
			ChangeTable = tbSendInfo,
		})
	end
end;

--血蓝全满
function CSkillSystem:FullHPAndMP()
	local sInfo = self:GetInfo();
	
	self.sBaseInfo.dwHP = sInfo.dwHPMax;
	self.sBaseInfo.dwMP = sInfo.dwMPMax;
end;


-----------------------------------------------------------------------------------------------------------------------
--装备等相关

--装备的属性响应，包括套装
function CSkillSystem:NotifyEquipProperty(attrInfo,dwID,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	self[szFuncName](self,"Equip",dwID,attrInfo);
end;

function CSkillSystem:NotifyStoneUpdate(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	self[szFuncName](self,"Stone",1,attrInfo);
end;

function CSkillSystem:NotifyStoneSuit(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	self[szFuncName](self,"StoneSuit",1,attrInfo);
end;

--五行，筋脉等
function CSkillSystem:NotifyPulseUpdate(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	self[szFuncName](self,"Pulse",1,attrInfo);
end;

function CSkillSystem:NotifyFiveUpdate(attrInfo,dwIndex,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	self[szFuncName](self,"Five",dwIndex,attrInfo);
end;

function CSkillSystem:NotifyBournUpdate(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	self[szFuncName](self,"Bourn",1,attrInfo);
end;

--坐骑
function CSkillSystem:NotifyMountUpdate(attrInfo,dwIndex,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	self[szFuncName](self,"Mount",dwIndex,attrInfo);
end;

--跨服战返回后同步速度
function CSkillSystem:NotifyCSMountUpdate(objInfo)
	local sysName = "Mount";
	
	if not self.objAdvAttrInfo[sysName] then
		-- print("ERROR___CSkillSystem:NotifyCSMountUpdate",sysName)
		return false;
	end
	
	local oldInfo = {};
	CopyTable(oldInfo,self:GetInfo());
	
	self.objAdvAttrInfo[sysName][1] = objInfo;
	
	local newInfo = {};
	CopyTable(newInfo,self:GetInfo());
	
	if newInfo.dwMoveSpeed ~= oldInfo.dwMoveSpeed then
		self:GetPlayer():GetSystem("CMapSystem"):SetMoveSpeed(newInfo.dwMoveSpeed);
	end
end

--技能
function CSkillSystem:NotifySkillUpdate(dwSkillID,attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"Skill",dwSkillID,usedInfo);
end;

--Buff
function CSkillSystem:NotifyBuffUpdate(dwBuffID,attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	self[szFuncName](self,"Buff",dwBuffID,attrInfo);
end;

--GM命令
function CSkillSystem:NotifyGMCommand(szCommand,attrInfo,bPerInfo)
	local szName = "objAdvAttrInfo";
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szName = "objPerAttrInfo";
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	local oldValue = self[szName]["GMCommand"][szCommand];
	
	usedInfo:AddValue(oldValue);
	
	self[szFuncName](self,"GMCommand",szCommand,usedInfo);
end;

--成就
function CSkillSystem:NotifyAchievement(dwAchID,attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	-- local usedInfo = SSingleAttrChange:new();
	-- usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"Achievement",dwAchID,attrInfo);
end;

--世家
function CSkillSystem:NotifyGuildUpdate(attrInfo,dwIndex,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"Guild",dwIndex,usedInfo);
end;

--宝剑
function CSkillSystem:NotifySwordUpdate(attrInfo,dwIndex,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	if not dwIndex then
		dwIndex = 1;
	end
	
	self[szFuncName](self,"Sword",dwIndex,attrInfo);
end;

--武尊全章
function CSkillSystem:NotifyGestUpdate(attrInfo,dwIndex,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	if not dwIndex then
		dwIndex = 1;
	end
	
	self[szFuncName](self,"Gest",dwIndex,attrInfo);
end;

--铁布衫套装属性
function CSkillSystem:NotifyTieBuShanUpdate(attrInfo,dwIndex,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	if not dwIndex then
		dwIndex = 1;
	end
	
	self[szFuncName](self,"TieBuShan",dwIndex,attrInfo);
end;

--任务
function CSkillSystem:NotifyTaskUpdate(attrInfo,bPercent)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	self[szFuncName](self,"Task",1,attrInfo);
end;

--
function CSkillSystem:NotifyWeiWangUpdate(attrInfo,bPercent)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	self[szFuncName](self,"WeiWang",1,attrInfo);
end;

--宝甲
function CSkillSystem:NotifyAmuletUpdate(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	self[szFuncName](self,"Amulet",1,attrInfo);
end;

function CSkillSystem:NotifyLeaderUpdate(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	self[szFuncName](self,"Leader",1,attrInfo);
end;

function CSkillSystem:NotifySkillTitle(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	self[szFuncName](self,"SkillTitle",1,attrInfo);
end;

function CSkillSystem:NotifyRenMai(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	self[szFuncName](self,"RenMai",1,attrInfo);
end;

function CSkillSystem:NotifyCollect(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	self[szFuncName](self,"Collect",1,attrInfo);
end;

function CSkillSystem:NotifyVipUpdate(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	self[szFuncName](self,"Vip",1,attrInfo);
end;

function CSkillSystem:NotifyTitleUpdate(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"Title",1,usedInfo);
end;

function CSkillSystem:NotifyErrantUpdate(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"Errant",1,usedInfo);
end;

function CSkillSystem:NotifyEquipBuild(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"EquipBuild",1,usedInfo);
end;

function CSkillSystem:NotifySoulInfo(attrInfo,dwIndex,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"Soul",dwIndex,usedInfo);
end;

function CSkillSystem:NotifyPetInstruct(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"PetInstruct",1,usedInfo);
end;

function CSkillSystem:NotifyPetStateProperty(attrInfo,dwID,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	--print("=========NotifyPetStateProperty==0===========")
	--table.print(attrInfo)
	self[szFuncName](self,"PetStateProperty",dwID,usedInfo);
end;

function CSkillSystem:NotifyPracticeProperty(attrInfo,dwIndex ,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"Practice",dwIndex,usedInfo);
end;
function CSkillSystem:NotifyQingYunLingProperty(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"QingYunLing",1,usedInfo);
end;

function CSkillSystem:NotifyErrantHonorProperty(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"ErrantHonor",1,usedInfo);
end;

function CSkillSystem:NotifyKungFuUpdate(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end

	self[szFuncName](self,"KungFu",1,attrInfo);
end;

function CSkillSystem:NotifyMegaKill(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"MegaKill",1,usedInfo);
end;

----阵法系统
function CSkillSystem:NotifyMatrixMethod(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"MatrixMethod",1,usedInfo);
end
---童姥功系统
function CSkillSystem:NotifyPractiseSkill(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"PractiseSkill",1,usedInfo);
end
----酒葫芦系统
function CSkillSystem:NotifyGourd(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"Gourd",1,usedInfo);
end
--经验整合系统
function CSkillSystem:NotifyExpIntegrateUpdate(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	self[szFuncName](self,"ExpIntegrate",1,attrInfo);
end;

function CSkillSystem:NotifyYouWuZhi(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"YouWuZhi",1,usedInfo);
end;

--武侠令
function CSkillSystem:NotifyWuXiaLing(attrInfo, bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"WuXiaLing",1,usedInfo);
end;

--实战隐藏属性
function CSkillSystem:NotifyBournHideAttr(attrInfo, bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"BournHideAttr",1,usedInfo);
end

function CSkillSystem:NotifyMedicalAttr(attrInfo, bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(attrInfo);
	
	self[szFuncName](self,"Medical",1,usedInfo);
end

--群侠录系统 卡片收集
function CSkillSystem:NotifyQunXiaLuUpdate(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end

	self[szFuncName](self,"QunXiaLu",1,attrInfo);
end;

--时装系统
function CSkillSystem:NotifyFashionDressUpdate(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end

	self[szFuncName](self,"FashionDress",1,attrInfo);
end;

--圣火令系统
function CSkillSystem:NotifyShengHuoLingUpdate(attrInfo, bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end

	self[szFuncName](self,"ShengHuoLing",1,attrInfo);
end

--独孤九剑系统
function CSkillSystem:NotifyDuGuUpdate(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end

	self[szFuncName](self,"DuGuJiuJian",1,attrInfo);
end;

--暗器系统
function CSkillSystem:NotifyHiddenweaponUpdate(attrInfo, bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
							
	self[szFuncName](self,"HiddenWeapon",1,attrInfo);
end

--功法扩展系统
function CSkillSystem:NotifyKungFuExtendUpdate(attrInfo, nSysEnum, bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end

	local sAttrSys = _G.KungFuExtendConfig[nSysEnum].attrName;
	if nSysEnum == 9 then
		self[szFuncName](self,sAttrSys,3,attrInfo);
	else
		self[szFuncName](self,sAttrSys,2,attrInfo);
	end
end

--战骑诀系统
function CSkillSystem:NotifyZhanQiJueUpdate(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end

	self[szFuncName](self,"ZhanQiJue",1,attrInfo);
end

--盾牌系统
function CSkillSystem:NotifyShieldUpdate(attrInfo, bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end
							
	self[szFuncName](self,"Shield",1,attrInfo);
end

-- 修炼金身
function CSkillSystem:NotifyGoldenBodyUpdate(attrInfo, bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end

	self[szFuncName](self,"GoldenBody",1,attrInfo);
end

--英雄令系统
function CSkillSystem:NotifyHeroTokenUpdate(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end

	self[szFuncName](self,"HeroToken",1,attrInfo);
end

-- 古董系统
function CSkillSystem:NotifyCurioUpdate(attrInfo, bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end

	self[szFuncName](self,"Curio",1,attrInfo);
end

--战旗系统
function CSkillSystem:NotifyBannerUpdate(attrInfo,bPerInfo)
	local szFuncName = "ChangeAttrAdv";
	if bPerInfo then
		szFuncName = "ChangeAttrPercent";
	end

	self[szFuncName](self,"Banner",1,attrInfo);
end
-----------------------------------------------------------------------------------------------------------------------
--DB裸值相关
--人物基本属性加点
function CSkillSystem:SetPoint(sInfo)
	local dwMuscleChg = sInfo.dwMuscle or 0;
	local dwPhysiqueleChg = sInfo.dwPhysique or 0;
	local dwOrganChg = sInfo.dwOrgan or 0;
	local dwTechniqueChg = sInfo.dwTechnique or 0;

	if dwMuscleChg < 0 or 
		dwPhysiqueleChg < 0 or 
		dwOrganChg < 0 or 
		dwTechniqueChg < 0 then
		_info("ERROR:dis show",dwMusDis,dwPhyDis,dwOrgDis,dwTechDis,dwNewPoint);
		return
	end
	
	local dwMusDis = self.sBaseInfo.dwMuscle - dwMuscleChg;
	local dwPhyDis = self.sBaseInfo.dwPhysique - dwPhysiqueleChg;
	local dwOrgDis = self.sBaseInfo.dwOrgan - dwOrganChg;
	local dwTechDis = self.sBaseInfo.dwTechnique - dwTechniqueChg;
	--local dwPointDis = self.sBaseInfo.dwPoint - sInfo.dwPoint;
	local dwNewPoint = self.sBaseInfo.dwPoint + dwMusDis+dwPhyDis+dwOrgDis+dwTechDis
	
	if dwNewPoint < 0 then
		_info("ERROR:dis show",dwMusDis,dwPhyDis,dwOrgDis,dwTechDis,dwNewPoint);
		return;
	end
	
	local objOldInfo = {};
	CopyTable(objOldInfo,self:GetInfo());
	
	local sDBInfo = self:MakeBattleInfoForDB();
	sDBInfo.dwMuscle = sInfo.dwMuscle;
	sDBInfo.dwPhysique = sInfo.dwPhysique;
	sDBInfo.dwOrgan = sInfo.dwOrgan;
	sDBInfo.dwTechnique = sInfo.dwTechnique;
	sDBInfo.dwPoint = dwNewPoint;
	
	self:CountBattleInfo(sDBInfo);
	
	self:CheckHPAndMP();
	
	self:SendPlayerInfoLoad(1,self.sBaseInfo);
	
	local newInfo = self:GetInfo();
	self:CheckNeedSendAttr(objOldInfo,newInfo);
	
	self.objDBQuery:SaveBattleInfo(sDBInfo);
--quying chg 2012-04-28
	local objSelf = self:GetPlayer();
	local objTeamSys = objSelf:GetSystem("CTeamSystem")
	if objTeamSys then
		if objTeamSys.m_teamId and objTeamSys.m_teamId ~= 0 then
			objTeamSys:SynPlayerBlood(self.sBaseInfo.dwHP, newInfo.dwHPMax);
			objTeamSys:SynPlayerMp(self.sBaseInfo.dwMP, newInfo.dwMPMax)
		end;
	end;
	
	local eventSys = objSelf:GetSystem('CPlayerEventCenterSystem')
	eventSys:DoEvent(enumPlayerEventType.EventSetPoint,1);
	
	--player是否已经初始化了
	if self.bIsPlayerInit then
		--更新人物基础属性战斗力提升
		self:GetPlayer():GetSystem("CBattleScoreUpSystem"):AddPlayerScore(self:GetPlayer());
	end
end;

--重置属性点
function CSkillSystem:ResetPoint()
	local objSelf = self:GetPlayer();
	local dwLevel = objSelf:GetLevel();
	
	local dwCost = funcResetItemCost(self:GetUsedPointAll());
	
	local objItemSys = objSelf:GetSystem("CItemSystem");
	if dwLevel > enFreeResetLevel then
		local dwNum, _, _ = objItemSys:GetEnumItemNumInPacket(enItemForReset);
		if dwNum < dwCost then
			return;
		end
	end
	
	local objOldInfo = {};
	CopyTable(objOldInfo,self:GetInfo());
	
	local dwUsedPoint = self.sBaseInfo.dwMuscle + self.sBaseInfo.dwPhysique + self.sBaseInfo.dwOrgan + self.sBaseInfo.dwTechnique;
	
	self.sBaseInfo.dwMuscle = 0;
	self.sBaseInfo.dwPhysique = 0;
	self.sBaseInfo.dwOrgan = 0
	self.sBaseInfo.dwTechnique = 0;
	
	self.sBaseInfo.dwPoint = self.sBaseInfo.dwPoint + dwUsedPoint;
	
	self:CountBattleInfo(self:MakeBattleInfoForDB());
	
	self:CheckHPAndMP();
	
	self:SendPlayerInfoLoad(1,self.sBaseInfo);
	
	local newInfo = self:GetInfo();
	self:CheckNeedSendAttr(objOldInfo,newInfo);
	
	self.objDBQuery:SaveBattleInfo(self:MakeBattleInfoForDB());
--quying chg 2012-04-28
	local objSelf = self:GetPlayer();
	local objTeamSys = objSelf:GetSystem("CTeamSystem")
	if objTeamSys then
		if objTeamSys.m_teamId and objTeamSys.m_teamId ~= 0 then
			objTeamSys:SynPlayerBlood(self.sBaseInfo.dwHP, newInfo.dwHPMax);
			objTeamSys:SynPlayerMp(self.sBaseInfo.dwMP, newInfo.dwMPMax)
		end;
	end;
	
	local eventSys = objSelf:GetSystem('CPlayerEventCenterSystem')
	eventSys:DoEvent(enumPlayerEventType.EventResetPoint,1);
	
	if dwLevel > enFreeResetLevel then
		objItemSys:DelEnumItemInPacket(enItemForReset, dwCost, false, _G.ItemSysOperType.Used);
	end
end;

--从基本属性计算其他属性值
--[[
local sDBInfo =
{
	dwRoleID
	dwCurHP--当前HP
	dwCurMP--当前MP
	dwMuscle--臂力
	dwPhysique--体魄
	dwOrgan--根骨
	dwTechnique --技巧
	dwDander--怒气
	dwCaromCount--连击次数
}
]]
function CSkillSystem:CountBattleInfo(sDBInfo)
	CBattleCalculator:BattleInfoCounter(sDBInfo,self:GetPlayer():GetLevel(),self.sBaseInfo);
end;

--返回角色的最初属性值
--[[
local sInitInfo =
{
	dwCurHP--当前HP
	dwCurMP--当前MP
	dwMuscle--臂力
	dwPhysique--体魄
	dwOrgan--根骨
	dwTechnique --技巧
	dwDander = 0--怒气
}
]]
function CSkillSystem:InitBattleInfo()
	local sInfo = {};
	sInfo.dwCurHP = InitConfig.dwHP;
	sInfo.dwCurMP = InitConfig.dwMP;
	sInfo.dwMuscle = InitConfig.dwMuscle;
	sInfo.dwPhysique = InitConfig.dwPhysique;
	sInfo.dwOrgan = InitConfig.dwOrgan;
	sInfo.dwTechnique = InitConfig.dwTechnique;
	sInfo.dwDander = 0;
	sInfo.dwPoint = 0;
	sInfo.dwOtherPoint = 0;
	sInfo.dwCaromCount = 0;
	
	return sInfo;
end;

function CSkillSystem:MakeBattleInfoForDB()
	local sDBInfo = {};
	sDBInfo.dwHP = self.sBaseInfo.dwHP;
	sDBInfo.dwMP = self.sBaseInfo.dwMP;
	sDBInfo.dwMuscle = self.sBaseInfo.dwMuscle;
	sDBInfo.dwPhysique = self.sBaseInfo.dwPhysique;
	sDBInfo.dwOrgan = self.sBaseInfo.dwOrgan;
	sDBInfo.dwTechnique = self.sBaseInfo.dwTechnique;
	sDBInfo.dwDander = self.sBaseInfo.dwDander;
	sDBInfo.dwPoint = self.sBaseInfo.dwPoint;
	sDBInfo.dwCaromCount = self.sBaseInfo.dwCaromCount;
	sDBInfo.dwOtherPoint = self.sBaseInfo.dwOtherPoint;
	
	return sDBInfo;
end;

function CSkillSystem:CheckBattleInfo(tbInfo)
	local dwLevel = self:GetPlayer():GetLevel();
	
	local dwNeedPoint = 0;
	for i = 1,dwLevel do
		if not RoleUpLevelConfig[i] then
			return;
		end
		dwNeedPoint = dwNeedPoint + RoleUpLevelConfig[i].dwPointGet;
	end
	
	tbInfo.dwMuscle = tbInfo.dwMuscle or 0;
	tbInfo.dwPhysique = tbInfo.dwPhysique or 0;
	tbInfo.dwOrgan = tbInfo.dwOrgan or 0;
	tbInfo.dwTechnique = tbInfo.dwTechnique or 0;
	tbInfo.dwPoint = tbInfo.dwPoint or 0;
	tbInfo.dwOtherPoint = tbInfo.dwOtherPoint or 0;	--特殊途径增加的人物属性点,不参与计算制作记录使用
	
	if tbInfo.dwMuscle < 0 or 
		tbInfo.dwPhysique < 0 or 
		tbInfo.dwOrgan < 0 or 
		tbInfo.dwTechnique < 0 then
		tbInfo.dwMuscle = 0
		tbInfo.dwPhysique = 0
		tbInfo.dwOrgan = 0
		tbInfo.dwTechnique = 0
	end

	local dwMyPoint = tbInfo.dwMuscle + tbInfo.dwPhysique + tbInfo.dwOrgan
										+ tbInfo.dwTechnique + tbInfo.dwPoint;

	if dwMyPoint ~= dwNeedPoint + tbInfo.dwOtherPoint then
		_info("role info little",self:GetPlayer():GetRoleID(),dwLevel,tbInfo.dwMuscle,tbInfo.dwPhysique,tbInfo.dwOrgan,tbInfo.dwTechnique,tbInfo.dwPoint)
		-- （等级总点+额外）
		tbInfo.dwPoint = dwNeedPoint + tbInfo.dwOtherPoint;
		tbInfo.dwMuscle = 0;
		tbInfo.dwPhysique = 0;
		tbInfo.dwOrgan = 0;
		tbInfo.dwTechnique = 0;
	end
end;

--返回已经分配的属性点总值
function CSkillSystem:GetUsedPointAll()
	local tbNowInfo = self:GetInfo();
	
	return tbNowInfo.dwMuscle + tbNowInfo.dwPhysique + tbNowInfo.dwOrgan + tbNowInfo.dwTechnique;
end;


--此函数同上面的CSkillSystem:GetInfo()  剔除了buff增加的属性
function CSkillSystem:GetCrossSvrInfo()
	local sLastInfo = {};
	
	local sAdvInfo = self.objAdvAttrInfo:GetCrossSvrInfo();
	local sPerInfo = self.objPerAttrInfo:GetCrossSvrInfo();
	
	--只计算基本值
	sLastInfo.dwHP = self.sBaseInfo.dwHP;
	sLastInfo.dwMP = self.sBaseInfo.dwMP;
	
	sLastInfo.dwMuscle = self.sBaseInfo.dwMuscle;
	sLastInfo.dwPhysique = self.sBaseInfo.dwPhysique;
	sLastInfo.dwOrgan = self.sBaseInfo.dwOrgan;
	sLastInfo.dwTechnique = self.sBaseInfo.dwTechnique;
	sLastInfo.dwDander = self.sBaseInfo.dwDander;
	sLastInfo.dwPoint = self.sBaseInfo.dwPoint;
	sLastInfo.dwOtherPoint = self.sBaseInfo.dwOtherPoint;
	sLastInfo.dwCaromCount = self.sBaseInfo.dwCaromCount;
	
	--不计算百分比
	sLastInfo.dwAppendCrit = (self.sBaseInfo.dwAppendCrit + sAdvInfo.dwAppendCrit);
	sLastInfo.dwAllSkillUpLv = (self.sBaseInfo.dwAllSkillUpLv + sAdvInfo.dwAllSkillUpLv);
	
	--计算增量和百分比
	sLastInfo.dwAttack = (self.sBaseInfo.dwAttack + sAdvInfo.dwAttack)*(sPerInfo.dwAttack + 1);
	sLastInfo.dwDefense = (self.sBaseInfo.dwDefense + sAdvInfo.dwDefense)*(sPerInfo.dwDefense + 1);
	sLastInfo.dwFlee = (self.sBaseInfo.dwFlee + sAdvInfo.dwFlee)*(sPerInfo.dwFlee + 1);
	sLastInfo.dwHitPercent = (self.sBaseInfo.dwHitPercent + sAdvInfo.dwHitPercent)*(sPerInfo.dwHitPercent + 1);
	sLastInfo.dwCrit = (self.sBaseInfo.dwCrit + sAdvInfo.dwCrit)*(sPerInfo.dwCrit + 1);
	sLastInfo.dwHPMax = (self.sBaseInfo.dwHPMax + sAdvInfo.dwHPMax)*(sPerInfo.dwHPMax + 1);
	sLastInfo.dwMPMax = (self.sBaseInfo.dwMPMax + sAdvInfo.dwMPMax)*(sPerInfo.dwMPMax + 1);
	
	sLastInfo.dwMoveSpeed = (self.sBaseInfo.dwMoveSpeed + sAdvInfo.dwMoveSpeed)*(sPerInfo.dwMoveSpeed + 1);
	sLastInfo.dwAttackSpeed = (self.sBaseInfo.dwAttackSpeed + sAdvInfo.dwAttackSpeed)*(sPerInfo.dwAttackSpeed + 1);
	sLastInfo.dwIgnoreDefense = (self.sBaseInfo.dwIgnoreDefense + sAdvInfo.dwIgnoreDefense)*(sPerInfo.dwIgnoreDefense + 1);
	sLastInfo.dwAppendAttack = (self.sBaseInfo.dwAppendAttack + sAdvInfo.dwAppendAttack)*(sPerInfo.dwAppendAttack + 1);
	sLastInfo.dwRemitAttack = (self.sBaseInfo.dwRemitAttack + sAdvInfo.dwRemitAttack)*(sPerInfo.dwRemitAttack + 1);
	sLastInfo.dwBounceAttack = (self.sBaseInfo.dwBounceAttack + sAdvInfo.dwBounceAttack)*(sPerInfo.dwBounceAttack + 1);
	sLastInfo.dwAbsorbHP = (self.sBaseInfo.dwAbsorbHP + sAdvInfo.dwAbsorbHP)*(sPerInfo.dwAbsorbHP + 1);
	sLastInfo.dwAbsorbMP = (self.sBaseInfo.dwAbsorbMP + sAdvInfo.dwAbsorbMP)*(sPerInfo.dwAbsorbMP + 1);
	sLastInfo.dwDuck = (self.sBaseInfo.dwDuck + sAdvInfo.dwDuck)*(sPerInfo.dwDuck + 1);
	
	sLastInfo.dwDefenseValue = (self.sBaseInfo.dwDefenseValue + sAdvInfo.dwDefenseValue)*(sPerInfo.dwDefenseValue + 1);
	sLastInfo.dwCritDown = (self.sBaseInfo.dwCritDown + sAdvInfo.dwCritDown)*(sPerInfo.dwCritDown + 1);
	
	sLastInfo.dwPoJiaValue = (self.sBaseInfo.dwPoJiaValue + sAdvInfo.dwPoJiaValue)*(sPerInfo.dwPoJiaValue + 1);
	sLastInfo.dwPoJiaDiKang = (self.sBaseInfo.dwPoJiaDiKang + sAdvInfo.dwPoJiaDiKang)*(sPerInfo.dwPoJiaDiKang + 1);
		
	--只有增量值
	sLastInfo.dwPKForbid = sAdvInfo.dwPKForbid;
	sLastInfo.dwSkillForbidFlag = sAdvInfo.dwSkillForbidFlag;
	sLastInfo.dwMoveForbidFlag = sAdvInfo.dwMoveForbidFlag;
	sLastInfo.dwUseItemForbidFlag = sAdvInfo.dwUseItemForbidFlag;
	
	sLastInfo.dwMartialUp = sAdvInfo.dwMartialUp;
	sLastInfo.dwStoryFlag = sAdvInfo.dwStoryFlag;
	
	--只有百分比
	sLastInfo.dwDanderUp = sPerInfo.dwDanderUp;
	sLastInfo.dwExpUp = sPerInfo.dwExpUp;
	sLastInfo.dwMountExpUp = sPerInfo.dwMountExpUp;
	--sLastInfo.dwSitUp = sPerInfo.dwSitUp;
	sLastInfo.dwSkillKlgUp = sPerInfo.dwSkillKlgUp;
	sLastInfo.dwMartialExpUp = sPerInfo.dwMartialExpUp;
	sLastInfo.dwMartialZhenqiUp = sPerInfo.dwMartialZhenqiUp;
	
	sLastInfo.dwMonsterAppend = sPerInfo.dwMonsterAppend;
	sLastInfo.dwBossAppend = sPerInfo.dwBossAppend;
	
	if sLastInfo.dwMoveSpeed < 0 then
		sLastInfo.dwMoveSpeed = 0;
	end
	
	return sLastInfo;
end;



