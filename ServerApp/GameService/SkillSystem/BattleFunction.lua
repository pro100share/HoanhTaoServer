--[[
功能：战斗相关的计算公式
作者：刘炜
时间：2012-2-11
]]

_G.CBattleCalculator = {};

--基础命中参数
_G.CBattleCalculator.dwHitPara = 10000;
--命中等级参数
_G.CBattleCalculator.dwHitLevelPara = 50;
--暴击系数
_G.CBattleCalculator.dwCritPara = 25;

--计算命中，返回objSelf攻击objEnemy的命中数值
--目前只针对Player，以后考虑添加Monster
function CBattleCalculator:HitCalculator(objSelf,objEnemy)
	if not objSelf then
		return 0;
	end
	if not objEnemy then
		return 0;
	end
	
	--己方身法
	local selfFlee = 0;
	--己方命中率
	local selfHitPercent = 0;
	--己方等级
	local selfLevel = objSelf:GetLevel();
	
	local dwSelfType = objSelf:GetObjType();
	if dwSelfType == enEntType.eEntType_Player then
		local sInfo = objSelf:GetSystem("CSkillSystem"):GetInfo();
		selfFlee = sInfo.dwFlee;
		selfHitPercent = sInfo.dwHitPercent;
	elseif dwSelfType == enEntType.eEntType_Monster then
		local sInfo = objSelf:GetSystem("CMonsterSkillSystem"):GetInfo();
		selfFlee = sInfo.dwFlee;
		selfHitPercent = sInfo.dwHitPercent;
	elseif dwSelfType == enEntType.eEntType_Pet then
		local sInfo = objSelf:GetBattleInfo();
		selfFlee = sInfo.dwFlee or 0;
		selfHitPercent = sInfo.dwHitPercent or 0;
	end
	
	--敌方身法
	local enemyFlee = 0;
	--敌方等级
	local enemyLevel = objEnemy:GetLevel();
	--敌方闪避率
	local enemyDuck = 0;
	
	local dwEnemyType = objEnemy:GetObjType();
	if dwEnemyType == enEntType.eEntType_Player then
		local sInfo = objEnemy:GetSystem("CSkillSystem"):GetInfo();
		enemyFlee = sInfo.dwFlee;
		enemyDuck = sInfo.dwDuck;
	elseif dwEnemyType == enEntType.eEntType_Monster then
		local sInfo = objEnemy:GetSystem("CMonsterSkillSystem"):GetInfo();
		enemyFlee = sInfo.dwFlee;
		enemyDuck = sInfo.dwDuck;
	elseif dwEnemyType == enEntType.eEntType_Pet then
		local sInfo = objEnemy:GetBattleInfo();
		enemyFlee = sInfo.dwFlee or 0;
		enemyDuck = sInfo.dwDuck or 0;
	end
	
	--print("self flee = "..selfFlee)
	
	--local dwHitNum = 10000*(0.95+ (selfFlee-enemyFlee)/(selfFlee+self.dwHitPara+enemyLevel*(self.dwHitLevelPara+(selfLevel-1)*2.5)))
	
	local dwHitNum = 10000 * ( 0.95 + selfFlee / (selfFlee + 10000 + selfLevel * 100))
			
		  dwHitNum = dwHitNum - 10000 * (  enemyFlee / (enemyFlee + 10000 + enemyLevel * 100))
			
		  dwHitNum = dwHitNum + selfHitPercent - enemyDuck;
	
	dwHitNum = math.min(9500,dwHitNum);
	dwHitNum = math.max(4500,dwHitNum);
	
	
	--为了配合宠物不能闪避攻击
	if dwEnemyType == enEntType.eEntType_Pet then
		dwHitNum = 10000;
	end
	
	return dwHitNum;
end;

--计算暴击，返回objSelf攻击objEnemy的暴击数值
function CBattleCalculator:CritCalculator(objSelf,objEnemy)
	local selfCrit = 0;				--暴击值
	local dwCritNum = 0				--暴击概率计算值
	
	
	local dwSelfType = objSelf:GetObjType();
	if dwSelfType == enEntType.eEntType_Player then
		local sOtherInfo = objSelf:GetSystem("CSkillSystem"):GetInfo()
		--常规的暴击
		selfCrit = sOtherInfo.dwCrit
	elseif dwSelfType == enEntType.eEntType_Monster then
		selfCrit = objSelf:GetSystem("CMonsterSkillSystem"):GetInfo().dwCrit;		
	elseif dwSelfType == enEntType.eEntType_Pet then
		selfCrit = objSelf:GetBattleInfo().dwCrit or 0;
	end
	
	--获取攻击方和被攻击方等级
	local enemyLevel = objEnemy:GetLevel();
	local selfLevel =  objSelf:GetLevel();

	--被击方为玩家
	local SelfType = objEnemy:GetObjType();
	
	if (SelfType == enEntType.eEntType_Player) then
		--带入抵抗的暴击
		local sOtherInfo = objEnemy:GetSystem("CSkillSystem"):GetInfo()	
		local enemyCritDown = sOtherInfo.dwCritDown
		--获取被攻击玩家的暴击抵抗值
		dwCritNum = (selfCrit/(selfCrit+10000+selfLevel*50))*10000;	
		dwCritNum =  dwCritNum - (enemyCritDown/(enemyCritDown + 10000 * enemyLevel*50)) * 10000
	else
		dwCritNum = (selfCrit/(selfCrit+10000+selfLevel*50))*10000;	
	end
	
	

	dwCritNum = math.min(7500,dwCritNum);
	dwCritNum = math.max(500,dwCritNum);
	
	return dwCritNum;
end;

--伤害计算公式
function CBattleCalculator:DamageCalculator(dwSkillID,dwSkillLevel,objAttacker,objEnemy,isCrit)
	local cfSkill = SkillConfig[dwSkillID];
	if not cfSkill then
		_err("cfSkill is null skill id(" .. dwSkillID .. ")");
		return 0;
	end
	
	local cfSkillAttInfo = cfSkill:GetPropertiesAdd(dwSkillLevel,objAttacker,objEnemy);
	local cfSkillActive = cfSkillAttInfo["Active"];
	
	local dwAttackerType = objAttacker:GetObjType();
	local dwDefenserType = objEnemy:GetObjType();
	
	--己方暴击伤害系数
	local dwAppendCrit = 0;
	--己方攻击力
	local dwAttackValue = 0;
	--己方的追加伤害
	local dwAppend = 0;
	--攻击方的无视防御能力
	local dwIgnore = 0;
	--攻击方针对怪物的额外伤害
	local dwMonsterApp = 0;
	--攻击方针对BOSS的额外伤害
	local dwBossApp = 0;
	--破甲攻击
	local dwPoJia = 0;

	
	
	--己方的等级
	local dwMyLevel = objAttacker:GetLevel();
	
	--盟主伤害倍数
	local Beishu = 1;
	
	if dwAttackerType == enEntType.eEntType_Player then
		local skillSystem = objAttacker:GetSystem("CSkillSystem");
		local sInfo = skillSystem:GetInfo();
		dwAppendCrit = sInfo.dwAppendCrit;
		dwAttackValue = sInfo.dwAttack;
		dwAppend = sInfo.dwAppendAttack;
		dwIgnore = sInfo.dwIgnoreDefense;
		dwMonsterApp = sInfo.dwMonsterAppend;
		dwBossApp = sInfo.dwBossAppend;
		dwPoJia = sInfo.dwPoJiaValue;
		if not CConfig.bIsCrossSvr then
			local sys = objAttacker:GetSystem("CAllianceLeaderSystem")
			
			if (sys) then
				if sys.dwType == 1 then
					local dwRand = math.random(10000);
					if (dwRand <= 500) then
						Beishu = 3;
					end
				end
			end
			
			local sysBuff = objAttacker:GetSystem("CBuffSystem");
			if sysBuff then
				local crossSvrCfg = CrossSvrConfig[10001];
				if sysBuff:GetBuffObj(crossSvrCfg.BuffId) then
					local dwRand = math.random(10000);
					if (dwRand <= crossSvrCfg.DamageRate) then
						Beishu = Beishu + crossSvrCfg.DamageCount;
					end
				end
			end
		end;
	elseif dwAttackerType == enEntType.eEntType_Monster then
		dwAppendCrit = objAttacker:GetSystem("CMonsterSkillSystem"):GetInfo().dwAppendCrit;
		dwAttackValue = objAttacker:GetSystem("CMonsterSkillSystem"):GetInfo().dwAttack;
		dwAppend = objAttacker:GetSystem("CMonsterSkillSystem"):GetInfo().dwAppendAttack;
		dwIgnore = objAttacker:GetSystem("CMonsterSkillSystem"):GetInfo().dwIgnoreDefense;
	elseif dwAttackerType == enEntType.eEntType_Pet then
		local sInfo = objAttacker:GetBattleInfo();
		dwAppendCrit = sInfo.dwAppendCrit or 0;
		dwAttackValue = sInfo.dwAttack or 0;
		dwAppend = sInfo.dwAppendAttack or 0;
		dwIgnore = sInfo.dwIgnoreDefense or 0;
	end
	
	--敌方等级
	--local dwEnemyLevel = objEnemy:GetLevel();
	--敌方的伤害减免
	local dwEnemyRemit = 0;
	--敌方的防御力
	local dwEnemyDefen = 0;
	--抵御破甲
	local dwDiyuPoJia = 0;
	-- 宠物被击的伤害值 宠物专用（宠物被击和被暴击都用这个值）
	local dwPetBeHurtMax = 0;
	
	if dwDefenserType == enEntType.eEntType_Player then
		local sklEmySystem = objEnemy:GetSystem("CSkillSystem");
		dwEnemyRemit = sklEmySystem:GetInfo().dwRemitAttack;
		dwEnemyDefen = sklEmySystem:GetInfo().dwDefense;
		dwDiyuPoJia = sklEmySystem:GetInfo().dwPoJiaDiKang
	elseif dwDefenserType == enEntType.eEntType_Monster then
		dwEnemyRemit = objEnemy:GetSystem("CMonsterSkillSystem"):GetInfo().dwRemitAttack;
		dwEnemyDefen = objEnemy:GetSystem("CMonsterSkillSystem"):GetInfo().dwDefense;
	elseif dwDefenserType == enEntType.eEntType_Pet then
		local sInfo = objEnemy:GetBattleInfo();
		dwEnemyRemit = sInfo.dwRemitAttack or 0;
		dwEnemyDefen = sInfo.dwDefense or 0;
		dwPetBeHurtMax = sInfo.dwHurtMax or 0;
	end
	
	--开始计算
	--cfSkillActive:技能伤害
	local dwDamageBase = cfSkillActive["dwAttack"] + cfSkillActive["dwExtraAttack"] + cfSkillActive["dwAttack_mul"] * dwAttackValue/100;
	local dwDefensebase = dwEnemyDefen*(1-dwIgnore/10000);

--	local dwLastValue = (dwDamageBase*math.random(90,115)*0.01 * (1-dwEnemyRemit/10000) - dwDefensebase)+dwAppend;
--	修改新的战斗计算公式
	
	--攻击- 防御之后 值如果小于0，则设定为1
	local dwHurtValue = dwDamageBase  - dwDefensebase
		if	dwHurtValue <= 0 then
			dwHurtValue = 1
		end

	--伤害减免效果 有最高值  最高减免伤害95%
	local dwRemitValue = 1-dwEnemyRemit/10000
		if	dwRemitValue <= 0.05 then
			dwRemitValue = 0.05
		end
--	local dwLastValue = (math.random(75,100) + math.random(5,30)) * 0.01 * ((dwDamageBase  - dwDefensebase)* (1-dwEnemyRemit/10000)) + dwAppend;

	local dwLastValue = (math.random(75,100) + math.random(5,30)) * 0.01 * (dwHurtValue* dwRemitValue) + dwAppend;
	
	if isCrit then
		dwLastValue = dwLastValue * (1 + dwAppendCrit/10000);
	end
	
	--针对怪物进行伤害增加
	if dwDefenserType == enEntType.eEntType_Monster then
		dwLastValue = dwLastValue * (1+dwMonsterApp);
		if objEnemy:IsBoss() then
			dwLastValue = dwLastValue * (1+dwBossApp);
		end
	end
	if (dwLastValue < 0 ) then
		dwLastValue = 0;
	end	
	--破甲伤害
	dwLastValue = dwLastValue + (dwPoJia-dwDiyuPoJia)

	
	--最低伤害判断
	if dwLastValue < dwMyLevel then
		dwLastValue = math.floor((math.random(65,110) + math.random(5,30)) * dwMyLevel / 100)+1;
	end
	
	--宠物被击
	if dwDefenserType == enEntType.eEntType_Pet then
		--dwLastValue = (math.random(75,100) + math.random(5,30)) * 0.01 * (dwPetBeHurtMax * (1-dwEnemyRemit/10000));
		return dwPetBeHurtMax;
	end
	
	return dwLastValue*Beishu;
end;

--战斗属性计算
--sDBInfo：
--dwLevel：人物等级
--sRoleBattleInfo：
function CBattleCalculator:BattleInfoCounter(sDBInfo,dwLevel,sRoleBattleInfo)
	
	local dwAttackBorn		=	BaseBattleScore.dwAttack;		--新建角色初始攻击力
	local dwDefenseBorn		=	BaseBattleScore.dwDefense;		--新建角色初始防御值
	local dwFleeBorn		=	BaseBattleScore.dwFlee;		--新建角色初始身法值
	local dwCritBorn		=	BaseBattleScore.dwCrit;		--新建角色初始暴击值
	local dwHPMaxBorn		=	BaseBattleScore.dwHPMax;	--新建角色初始最大生命值
	local dwMPMaxBorn		=	BaseBattleScore.dwMPMax;	--新建角色初始最大内力值
	
	local dwAttackgrade		=	2;		--等级系数：攻击
	local dwDefensegrade	=	1;		--等级系数：防御
	local dwFleegrade		=	2;		--等级系数：身法
	local dwCritgrade		=	1;		--等级系数：暴击
	local dwHPMaxgrade		=	28;		--等级系数：最大生命值
	local dwMPMaxgrade		=	8;		--等级系数：最大内力值
	
	
	
	sRoleBattleInfo.dwHP = sDBInfo.dwHP;
	sRoleBattleInfo.dwMP = sDBInfo.dwMP;
	
	sRoleBattleInfo.dwMuscle = sDBInfo.dwMuscle;--臂力
	sRoleBattleInfo.dwPhysique = sDBInfo.dwPhysique;--体魄
	sRoleBattleInfo.dwOrgan = sDBInfo.dwOrgan;--根骨
	sRoleBattleInfo.dwTechnique = sDBInfo.dwTechnique;--技巧
	sRoleBattleInfo.dwDander = sDBInfo.dwDander;
	sRoleBattleInfo.dwPoint = sDBInfo.dwPoint;
	sRoleBattleInfo.dwOtherPoint = sDBInfo.dwOtherPoint;
	sRoleBattleInfo.dwCaromCount = sDBInfo.dwCaromCount;
	
	sRoleBattleInfo.dwAttack = dwAttackBorn + dwLevel * dwAttackgrade + sDBInfo.dwMuscle * 1.5;--攻击
	sRoleBattleInfo.dwDefense = dwDefenseBorn + dwLevel * dwDefensegrade + sDBInfo.dwPhysique * 1;--防御
	sRoleBattleInfo.dwFlee = dwFleeBorn + dwLevel * dwFleegrade + sDBInfo.dwTechnique * 2;--身法
	sRoleBattleInfo.dwHitPercent = BaseBattleScore.dwHitPercent;--命中
	sRoleBattleInfo.dwCrit = dwCritBorn + dwLevel * dwCritgrade + sDBInfo.dwTechnique * 2;--暴击
	sRoleBattleInfo.dwHPMax= dwHPMaxBorn + dwLevel * dwHPMaxgrade + sDBInfo.dwOrgan * 12;--生命max
	sRoleBattleInfo.dwMPMax= dwMPMaxBorn + dwLevel * dwMPMaxgrade + sDBInfo.dwOrgan * 5.5;--内力max
	
	sRoleBattleInfo.dwMoveSpeed		= BaseBattleScore.dwMoveSpeed;--移动速度
	sRoleBattleInfo.dwAttackSpeed	= BaseBattleScore.dwAttackSpeed;--攻击速度
	sRoleBattleInfo.dwIgnoreDefense	= BaseBattleScore.dwIgnoreDefense;--忽视防御
	sRoleBattleInfo.dwAppendAttack 	= BaseBattleScore.dwAppendAttack;--追加伤害
	sRoleBattleInfo.dwRemitAttack 	= BaseBattleScore.dwRemitAttack;--伤害减免
	sRoleBattleInfo.dwBounceAttack	= BaseBattleScore.dwBounceAttack;--伤害反弹
	sRoleBattleInfo.dwAbsorbHP		= BaseBattleScore.dwAbsorbHP;--生命吸取
	sRoleBattleInfo.dwAbsorbMP 		= BaseBattleScore.dwAbsorbMP;--内力吸取
	sRoleBattleInfo.dwDuck			= BaseBattleScore.dwDuck;--闪避率
	sRoleBattleInfo.dwAppendCrit 	= BaseBattleScore.dwAppendCrit;--暴击伤害（百分比）
	sRoleBattleInfo.dwAllSkillUpLv 	= 0; --武功层数
	
	-- if sRoleBattleInfo.dwHP > sRoleBattleInfo.dwHPMax then
		-- sRoleBattleInfo.dwHP = sRoleBattleInfo.dwHPMax;
	-- end
	
	-- if sRoleBattleInfo.dwMP > sRoleBattleInfo.dwMPMax then
		-- sRoleBattleInfo.dwMP = sRoleBattleInfo.dwMPMax;
	-- end
end;

--攻击速度计算CD时间
--参数：player对象；CD时间
function CBattleCalculator:CountSkillCDTime(objPlayer,dwCDTime)
	local dwResult = dwCDTime;					--技能的CD时间
	local dwAttackSpeed = 0;					--角色攻击速度
	local sklSystem = objPlayer:GetSystem("CSkillSystem");
	if sklSystem then
		dwAttackSpeed = sklSystem.sInfo["dwAttackSpeed"];
	end
	
	return dwResult;
end;

--宝剑的伤害计算公式，根据宝甲的阶数进行修正
--dwBaseValue：宝剑伤害；dwAmuletLevel：宝甲阶数
function CBattleCalculator:RevampSwordAttackValue(dwBaseValue,dwAmuletLevel)
	dwAmuletLevel = dwAmuletLevel or 0;
	
	local fPer = dwAmuletLevel * 0.02+0.2;
	
	if fPer>=0.95 then
		fPer = 0.95
	end	
	
	local dwLast = dwBaseValue * (1-fPer);
	
	if dwLast < 1 then
		dwLast = 1;
	end
	
	return dwLast;
end;

