--宝剑使用的技能专用脚本
local function RoundFloat(number)
	local qian = toint(number);
	local hou = toint(number * 10 - qian*10);
	if hou == 0 then
		return qian;
	else
		return qian.."."..hou;
	end
end;

local function AddRoleObjBuff(objRole,dwBuffID,dwLevel,objUser)
	local dwType = objRole:GetObjType();
	
	if dwType == enEntType.eEntType_Player then
		local buffSystem = objRole:GetSystem("CBuffSystem");
		buffSystem:AddBuff(dwBuffID,dwLevel,objUser)
	elseif dwType == enEntType.eEntType_Monster then
		local sysMonsterBuff = objRole:GetSystem("CMonsterBuffSystem")
		sysMonsterBuff:AddBuff(dwBuffID,dwLevel,objUser)
	end
end;

local function Buff_Increase(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime,objSwordSys)
	local dwDefType = objDefender:GetObjType();
	if dwDefType == enEntType.eEntType_Pet then
		--宠物没有BUFF
		return;
	end
	
	--宝剑等级
	local Level = objSwordSys:GetSwordLevel();
	local cardState = objSwordSys:GetPropertyCardState(); ---特殊属性卡片状态 0 未使用 1 使用未激活 2 已激活
	local dwAmuletLevel = 0;
	local objAmuletSys = objDefender:GetSystem("CAmuletSystem");
	if objAmuletSys then
		dwAmuletLevel = objAmuletSys:GetRank();    --得到对方宝甲等级
		--dwAmuletLevel = objAmuletSys:GetLevel();   拿到阶数
	end
	--宝甲等级公式
	local factor = (dwAmuletLevel * 200)
	
	--减低身法公式
	local Life = 1000+((200 * (Level-8)))
	--减暴击公式
	local Ictus = 1500+((200 * (Level-13)))
	--减移动速度
	local Move = 1000+((200 * (Level-17)))
	--持续降低生命
	local continue = 2000+((200 * (Level-21)))
	--无坚不裂1
	local HeavenHit1 = 1000
	--无坚不裂2
	local HeavenHit2 = 1000
	--一剑封喉（无效）
	local Kill = 1000+((200 * (Level-25)))
	--龙渊剑气（11阶）
	local AddAttack = 1000+ (250 * (Level-40))    --临时数值，每级增加2.5%触发率
	--蚩尤之力（宝甲）
	local AddPoJiaDiKang = 1000 + (250 * (dwAmuletLevel-40))    --临时数值，每级增加2.5%触发率
	
	--宝甲9阶减几率
	if (dwAmuletLevel >= 33) and (dwAmuletLevel <= 36) then
		HeavenHit1 = 900 ;
		HeavenHit2 = 900 ;
	end
	--宝甲10阶减几率
	if ( dwAmuletLevel > 36) then
		HeavenHit1 = 800 ;
		HeavenHit2 = 800 ;	
	end

	
	--减身法
	if (Level >= 9) then
		local dwRand = math.random(10000);
		local probability =  Life - factor
		if (dwRand <= probability) then
			AddRoleObjBuff(objDefender,71000,1,objAttacker);
		end
	end
	
	--减暴击
	if (Level >= 13) then
		local dwRand = math.random(10000);
		local probability =  Ictus - factor
		if (dwRand <= probability) then
			AddRoleObjBuff(objDefender,71003,1,objAttacker);
		end
	end
	
	--减移动速度
	if (Level >= 17) then
		local dwRand = math.random(10000);
		local probability =  Move - factor
		if (dwRand <= probability) then
			AddRoleObjBuff(objDefender,71001,1,objAttacker);
		end
	end
	
	--减生命值
	if (Level >= 21) then
		local dwRand = math.random(10000);
		local probability =  continue - factor
		if (dwRand <= probability) then
			AddRoleObjBuff(objDefender,71002,1,objAttacker);
		end
	end		
	--无坚不裂9阶
	if (Level >= 33 and Level < 37) then
		local dwRand = math.random(10000);
		local probability =  HeavenHit1
		if (dwRand <= probability) then
			AddRoleObjBuff(objDefender,71004,1,objAttacker);
		end
	end	
		
	--无坚不裂10阶
	if (Level >= 37) then
		local dwRand = math.random(10000);
		local probability =  HeavenHit2
		if (dwRand <= probability) then
			AddRoleObjBuff(objDefender,71005,1,objAttacker);
		end
	end	
	--特殊属性卡技能
	--流血效果-每秒掉线1%
	if (cardState == 2 ) then
		local dwRand = math.random(10000);
		local probability =  500
		if (dwRand <= probability) then
			AddRoleObjBuff(objDefender,71006,1,objAttacker);
		end
	end
			
	--龙渊剑气11阶
	if (Level >= 41) then
		local dwRand = math.random(10000);
		local probability =  AddAttack
		if (dwRand <= probability) then
			AddRoleObjBuff(objAttacker,71007,1,objAttacker);   --给自己挂
		end
	end		
	-------------------------宝甲技能 宝甲41级以后技能
	if (Level >= 1 and dwAmuletLevel >= 41) then
		local dwRand = math.random(10000);
		local probability =  AddPoJiaDiKang
		if (dwRand <= probability) then
			AddRoleObjBuff(objDefender,71101,1,objDefender);
		end
	end	
end



local Skill = SkillConfig[70000];

--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventSwordExecute(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime)
	--宝剑的技能效果
	local dwActionID = 11012;
	--效果的飞行时间
	local dwFlyTime = 0;
	--被击中的特效
	local dwBeAttPfx = 10001;	
		--计算伤害
		--伤害值
		local dwAttValue = 0;
		local dwDefType = objDefender:GetObjType();
		local objAttSklSys = objAttacker:GetSystem("CSkillSystem");
		if objAttSklSys then
			dwAttValue = objAttSklSys:GetInfo().dwAttack;
		end
		local objSwordSys = objAttacker:GetSystem("CSwordSystem");
		if objSwordSys then
			dwAttValue = SwordDataConfig.AttackValue(dwAttValue,objSwordSys);
		end
		local dwAmuletLevel = 0;
		if dwDefType == enEntType.eEntType_Player then
			local objDefBattle = objDefender:GetSystem("CBattleSystem");
			if not objDefBattle then
				_info("get objDefBattle fail in CRoleSkill:ExecuHarmCount");
				return;
			end

			--需要知道被击角色身上的宝甲等级，修正伤害值
			
			local objAmuletSys = objDefender:GetSystem("CAmuletSystem");
			if objAmuletSys then
				dwAmuletLevel = objAmuletSys:GetRank(); 
				--dwAmuletLevel = objAmuletSys:GetLevel();   拿到阶数
			end
			dwAttValue = CBattleCalculator:RevampSwordAttackValue(dwAttValue,dwAmuletLevel);
			--dwAttValue = dwAttValue*(1-(0.2+(dwAmuletLevel*0.02)))
			objDefBattle:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwSkillLevel,dwExecTime,0-dwActCount,false);
		elseif dwDefType == enEntType.eEntType_Monster then
			objDefender:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwExecTime,0-dwActCount,false);
		end
		
		
		Buff_Increase(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime,objSwordSys)
	
	
	
	--播放特效
	-- if objAttSklSys then
		-- local tbTargetList = {};
		-- tbTargetList[1] = {};
		-- tbTargetList[1][1] = dwDefType;
		-- tbTargetList[1][2] = objDefender:GetRoleID();
		
		-- objAttSklSys:BroadcastSkillMsg(true,"SendSkillPursueMsg",dwActionID,4,objAttacker:GetRoleID(),
			-- tbTargetList,dwFlyTime,1,0,0,0,0);
	-- end
	--被击中者播放特效
	if dwDefType == enEntType.eEntType_Player then
		local objDefSklSys = objDefender:GetSystem("CSkillSystem");
		if objDefSklSys then
			objDefSklSys:BroadcastSkillMsg(true,"OnPlayPfxMsg",
			{
				ActionID = dwBeAttPfx,
				BindPos = "feetpoint",
				RoleID = objDefender:GetRoleID(),
				SkillID = dwAttSkill,
				ExecTime = dwExecTime,
				ActCount = dwActCount,
			})
		end
	elseif dwDefType == enEntType.eEntType_Monster then
		objDefender:Play("",enEntType.eEntType_Player,objAttacker:GetRoleID(),dwBeAttPfx,nil,nil,nil,dwAttSkill,dwExecTime,dwActCount);
	end
	
	--被击中者头上的跳字
	-- local dwAtterType = objAttacker:GetObjType();
	-- local dwAtterID = objAttacker:GetRoleID();
	-- if dwDefType == enEntType.eEntType_Player then
		-- local objDefSklSys = objDefender:GetSystem("CSkillSystem");
		-- if objDefSklSys then
			-- objDefSklSys:BroadcastBattleNotice(enBattleNoticeType.eBNT_SWORD,dwAttValue,dwAtterType,dwAtterID,false);
		-- end
	-- elseif dwDefType == enEntType.eEntType_Monster then
		-- local objDefSklSys = objDefender:GetSystem("CMonsterSkillSystem");
		-- if objDefSklSys then
			-- objDefSklSys:BroadcastBattleNotice(enBattleNoticeType.eBNT_SWORD,dwAttValue,dwAtterType,dwAtterID,false);
		-- end
	-- end
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[7000020];
	sInfo.sNextLevelExp[1] = SkillStringConfig[7000030];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	
	-- dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	-- if dwResult < dwPublicCoolTime then
		-- dwResult = dwPublicCoolTime;
	-- end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end




local Skill = SkillConfig[70001];

--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventSwordExecute(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime)
	--宝剑的技能效果
	local dwActionID = 11012;
	--效果的飞行时间
	local dwFlyTime = 200;
	--被击中的特效
	local dwBeAttPfx = 10001;
			--计算伤害
		--伤害值
		local dwAttValue = 0;
		local dwDefType = objDefender:GetObjType();
		local objAttSklSys = objAttacker:GetSystem("CSkillSystem");
		if objAttSklSys then
			dwAttValue = objAttSklSys:GetInfo().dwAttack;
		end
		local objSwordSys = objAttacker:GetSystem("CSwordSystem");
		if objSwordSys then
			dwAttValue = SwordDataConfig.AttackValue(dwAttValue,objSwordSys);
		end
		local dwAmuletLevel = 0;
		if dwDefType == enEntType.eEntType_Player then
			local objDefBattle = objDefender:GetSystem("CBattleSystem");
			if not objDefBattle then
				_info("get objDefBattle fail in CRoleSkill:ExecuHarmCount");
				return;
			end
			
			--需要知道被击角色身上的宝甲等级，修正伤害值
			
			local objAmuletSys = objDefender:GetSystem("CAmuletSystem");
			if objAmuletSys then
				dwAmuletLevel = objAmuletSys:GetRank();
			end
			dwAttValue = CBattleCalculator:RevampSwordAttackValue(dwAttValue,dwAmuletLevel);
			-- dwAttValue = dwAttValue*(1-(0.2+(dwAmuletLevel*0.02)))
			objDefBattle:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwSkillLevel,dwExecTime,dwActCount);
		elseif dwDefType == enEntType.eEntType_Monster then
			objDefender:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwExecTime,dwActCount);
		end
		
		--执行附加BUFF
		Buff_Increase(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime,objSwordSys)

	
	--被击中者播放特效
	if dwDefType == enEntType.eEntType_Player then
		local objDefSklSys = objDefender:GetSystem("CSkillSystem");
		if objDefSklSys then
			objDefSklSys:BroadcastSkillMsg(true,"OnPlayPfxMsg",
			{
				ActionID = dwBeAttPfx,
				BindPos = "feetpoint",
				RoleID = objDefender:GetRoleID(),
				SkillID = dwAttSkill,
				ExecTime = dwExecTime,
				ActCount = dwActCount,
			})
		end
	elseif dwDefType == enEntType.eEntType_Monster then
		objDefender:Play("",enEntType.eEntType_Player,objAttacker:GetRoleID(),dwBeAttPfx,nil,nil,nil,dwAttSkill,dwExecTime,dwActCount);
	end
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[7000120];
	sInfo.sNextLevelExp[1] = SkillStringConfig[7000130];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end




local Skill = SkillConfig[70002];

--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventSwordExecute(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime)
	--宝剑的技能效果
	local dwActionID = 11012;
	--效果的飞行时间
	local dwFlyTime = 200;
	--被击中的特效
	local dwBeAttPfx = 10001;
		--计算伤害
		--伤害值
		local dwAttValue = 0;
		local dwDefType = objDefender:GetObjType();
		local objAttSklSys = objAttacker:GetSystem("CSkillSystem");
		if objAttSklSys then
			dwAttValue = objAttSklSys:GetInfo().dwAttack;
		end
		local objSwordSys = objAttacker:GetSystem("CSwordSystem");
		
		if objSwordSys then
			dwAttValue = SwordDataConfig.AttackValue(dwAttValue,objSwordSys);
		end
		local dwAmuletLevel = 0;
		if dwDefType == enEntType.eEntType_Player then
			local objDefBattle = objDefender:GetSystem("CBattleSystem");
			if not objDefBattle then
				_info("get objDefBattle fail in CRoleSkill:ExecuHarmCount");
				return;
			end
			
			--需要知道被击角色身上的宝甲等级，修正伤害值
			
			local objAmuletSys = objDefender:GetSystem("CAmuletSystem");
			if objAmuletSys then
				dwAmuletLevel = objAmuletSys:GetRank();
			end
			dwAttValue = CBattleCalculator:RevampSwordAttackValue(dwAttValue,dwAmuletLevel);
			-- dwAttValue = dwAttValue*(1-(0.2+(dwAmuletLevel*0.02)))
			objDefBattle:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwSkillLevel,dwExecTime,dwActCount);
		elseif dwDefType == enEntType.eEntType_Monster then
			objDefender:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwExecTime,dwActCount);
		end
		
		--执行附加BUFF
		Buff_Increase(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime,objSwordSys)

		-- local dwRand = math.random(10000);
		-- local probability = (dwAmuletLevel*200)-800;
		-- if (dwRand <= probability) then
			-- AddRoleObjBuff(objDefender,71000,1,objAttacker);
		-- end
	--被击中者播放特效
	if dwDefType == enEntType.eEntType_Player then
		local objDefSklSys = objDefender:GetSystem("CSkillSystem");
		if objDefSklSys then
			objDefSklSys:BroadcastSkillMsg(true,"OnPlayPfxMsg",
			{
				ActionID = dwBeAttPfx,
				BindPos = "feetpoint",
				RoleID = objDefender:GetRoleID(),
				SkillID = dwAttSkill,
				ExecTime = dwExecTime,
				ActCount = dwActCount,
			})
		end
	elseif dwDefType == enEntType.eEntType_Monster then
		objDefender:Play("",enEntType.eEntType_Player,objAttacker:GetRoleID(),dwBeAttPfx,nil,nil,nil,dwAttSkill,dwExecTime,dwActCount);
	end

		
		--local Level = objSwordSys:GetSwordLevel()
		
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[7000220];
	sInfo.sNextLevelExp[1] = SkillStringConfig[7000230];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end

local Skill = SkillConfig[70003];

--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventSwordExecute(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime)
	--宝剑的技能效果
	local dwActionID = 11012;
	--效果的飞行时间
	local dwFlyTime = 200;
	--被击中的特效
	local dwBeAttPfx = 10001;
		--计算伤害
		--伤害值
		local dwAttValue = 0;
		local dwDefType = objDefender:GetObjType();
		local objAttSklSys = objAttacker:GetSystem("CSkillSystem");
		if objAttSklSys then
			dwAttValue = objAttSklSys:GetInfo().dwAttack;
		end
		local objSwordSys = objAttacker:GetSystem("CSwordSystem");
		if objSwordSys then
			dwAttValue = SwordDataConfig.AttackValue(dwAttValue,objSwordSys);
		end
		local dwAmuletLevel = 0;
		if dwDefType == enEntType.eEntType_Player then
			local objDefBattle = objDefender:GetSystem("CBattleSystem");
			if not objDefBattle then
				_info("get objDefBattle fail in CRoleSkill:ExecuHarmCount");
				return;
			end
			
			--需要知道被击角色身上的宝甲等级，修正伤害值
			
			local objAmuletSys = objDefender:GetSystem("CAmuletSystem");
			if objAmuletSys then
				dwAmuletLevel = objAmuletSys:GetRank();
			end
			dwAttValue = CBattleCalculator:RevampSwordAttackValue(dwAttValue,dwAmuletLevel);
			-- dwAttValue = dwAttValue*(1-(0.2+(dwAmuletLevel*0.02)))
			objDefBattle:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwSkillLevel,dwExecTime,dwActCount);
		elseif dwDefType == enEntType.eEntType_Monster then
			objDefender:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwExecTime,dwActCount);
		end
		
		
		--执行附加BUFF
		Buff_Increase(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime,objSwordSys)

		-- local dwRand = math.random(10000);
		-- local probability = (dwAmuletLevel*200)-800;
		-- if (dwRand <= probability) then
			-- AddRoleObjBuff(objDefender,71000,1,objAttacker);
		-- end

		-- local dwRand = math.random(10000);
		-- local probability = 1500+((200 * dwAmuletLevel-13))
		-- if (dwRand <= probability) then
			-- AddRoleObjBuff(objDefender,71003,1,objAttacker);
		-- end
		
	--被击中者播放特效
	if dwDefType == enEntType.eEntType_Player then
		local objDefSklSys = objDefender:GetSystem("CSkillSystem");
		if objDefSklSys then
			objDefSklSys:BroadcastSkillMsg(true,"OnPlayPfxMsg",
			{
				ActionID = dwBeAttPfx,
				BindPos = "feetpoint",
				RoleID = objDefender:GetRoleID(),
				SkillID = dwAttSkill,
				ExecTime = dwExecTime,
				ActCount = dwActCount,
			})
		end
	elseif dwDefType == enEntType.eEntType_Monster then
		objDefender:Play("",enEntType.eEntType_Player,objAttacker:GetRoleID(),dwBeAttPfx,nil,nil,nil,dwAttSkill,dwExecTime,dwActCount);
	end
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[7000320];
	sInfo.sNextLevelExp[1] = SkillStringConfig[7000330];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end

local Skill = SkillConfig[70004];

--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventSwordExecute(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime)
	--宝剑的技能效果
	local dwActionID = 11012;
	--效果的飞行时间
	local dwFlyTime = 200;
	--被击中的特效
	local dwBeAttPfx = 10001;
		--计算伤害
		--伤害值
		local dwAttValue = 0;
		local dwDefType = objDefender:GetObjType();
		local objAttSklSys = objAttacker:GetSystem("CSkillSystem");
		if objAttSklSys then
			dwAttValue = objAttSklSys:GetInfo().dwAttack;
		end
		local objSwordSys = objAttacker:GetSystem("CSwordSystem");
		if objSwordSys then
			dwAttValue = SwordDataConfig.AttackValue(dwAttValue,objSwordSys);
		end
		local dwAmuletLevel = 0;
		if dwDefType == enEntType.eEntType_Player then
			local objDefBattle = objDefender:GetSystem("CBattleSystem");
			if not objDefBattle then
				_info("get objDefBattle fail in CRoleSkill:ExecuHarmCount");
				return;
			end
			
			--需要知道被击角色身上的宝甲等级，修正伤害值
			
			local objAmuletSys = objDefender:GetSystem("CAmuletSystem");
			if objAmuletSys then
				dwAmuletLevel = objAmuletSys:GetRank();
			end
			dwAttValue = CBattleCalculator:RevampSwordAttackValue(dwAttValue,dwAmuletLevel);
			-- dwAttValue = dwAttValue*(1-(0.2+(dwAmuletLevel*0.02)))
			objDefBattle:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwSkillLevel,dwExecTime,dwActCount);
		elseif dwDefType == enEntType.eEntType_Monster then
			objDefender:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwExecTime,dwActCount);
		end
		--执行附加BUFF
		Buff_Increase(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime,objSwordSys)

		-- local dwRand = math.random(10000);
		-- local probability = (dwAmuletLevel*200)-800;
		-- if (dwRand <= probability) then
			-- AddRoleObjBuff(objDefender,71000,1,objAttacker);
		-- end

		-- local dwRand = math.random(10000);
		-- local probability = 1500+((200 * dwAmuletLevel-13))
		-- if (dwRand <= probability) then
			-- AddRoleObjBuff(objDefender,71003,1,objAttacker);
		-- end
		
		-- local dwRand = math.random(10000);
		-- local probability = 1000+((200 * dwAmuletLevel-17))
		-- if (dwRand <= probability) then
			-- AddRoleObjBuff(objDefender,71001,1,objAttacker);
		-- end
		
	--被击中者播放特效
	if dwDefType == enEntType.eEntType_Player then
		local objDefSklSys = objDefender:GetSystem("CSkillSystem");
		if objDefSklSys then
			objDefSklSys:BroadcastSkillMsg(true,"OnPlayPfxMsg",
			{
				ActionID = dwBeAttPfx,
				BindPos = "feetpoint",
				RoleID = objDefender:GetRoleID(),
				SkillID = dwAttSkill,
				ExecTime = dwExecTime,
				ActCount = dwActCount,
			})
		end
	elseif dwDefType == enEntType.eEntType_Monster then
		objDefender:Play("",enEntType.eEntType_Player,objAttacker:GetRoleID(),dwBeAttPfx,nil,nil,nil,dwAttSkill,dwExecTime,dwActCount);
	end
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[7000420];
	sInfo.sNextLevelExp[1] = SkillStringConfig[7000430];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	return sResInfo;
end

local Skill = SkillConfig[70005];

--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventSwordExecute(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime)
	--宝剑的技能效果
	local dwActionID = 11012;
	--效果的飞行时间
	local dwFlyTime = 200;
	--被击中的特效
	local dwBeAttPfx = 10001;
		--计算伤害
		--伤害值
		local dwAttValue = 0;
		local dwDefType = objDefender:GetObjType();
		local objAttSklSys = objAttacker:GetSystem("CSkillSystem");
		if objAttSklSys then
			dwAttValue = objAttSklSys:GetInfo().dwAttack;
		end
		local objSwordSys = objAttacker:GetSystem("CSwordSystem");
		if objSwordSys then
			dwAttValue = SwordDataConfig.AttackValue(dwAttValue,objSwordSys);
		end
		local dwAmuletLevel = 0;
		
		if dwDefType == enEntType.eEntType_Player then
			local objDefBattle = objDefender:GetSystem("CBattleSystem");
			if not objDefBattle then
				_info("get objDefBattle fail in CRoleSkill:ExecuHarmCount");
				return;
			end
			
			--需要知道被击角色身上的宝甲等级，修正伤害值
			
			local objAmuletSys = objDefender:GetSystem("CAmuletSystem");
			if objAmuletSys then
				dwAmuletLevel = objAmuletSys:GetRank();
			end
			dwAttValue = CBattleCalculator:RevampSwordAttackValue(dwAttValue,dwAmuletLevel);
			-- dwAttValue = dwAttValue*(1-(0.2+(dwAmuletLevel*0.02)))
			objDefBattle:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwSkillLevel,dwExecTime,dwActCount);
		elseif dwDefType == enEntType.eEntType_Monster then
			objDefender:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwExecTime,dwActCount);
		end	
		--执行附加BUFF
		Buff_Increase(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime,objSwordSys)

		-- local dwRand = math.random(10000);
		-- local probability = (dwAmuletLevel*200)-800;
		-- if (dwRand <= probability) then
			-- AddRoleObjBuff(objDefender,71000,1,objAttacker);
		-- end

		-- local dwRand = math.random(10000);
		-- local probability = 1500+((200 * dwAmuletLevel-13))
		-- if (dwRand <= probability) then
			-- AddRoleObjBuff(objDefender,71003,1,objAttacker);
		-- end
		
		-- local dwRand = math.random(10000);
		-- local probability = 1000+((200 * dwAmuletLevel-17))
		-- if (dwRand <= probability) then
			-- AddRoleObjBuff(objDefender,71001,1,objAttacker);
		-- end
		
		-- local dwRand = math.random(10000);
		-- local probability = 2000+((200 * dwAmuletLevel-21))
		-- if (dwRand <= probability) then
			-- AddRoleObjBuff(objDefender,71002,1,objAttacker);
		-- end
	--被击中者播放特效
	if dwDefType == enEntType.eEntType_Player then
		local objDefSklSys = objDefender:GetSystem("CSkillSystem");
		if objDefSklSys then
			objDefSklSys:BroadcastSkillMsg(true,"OnPlayPfxMsg",
			{
				ActionID = dwBeAttPfx,
				BindPos = "feetpoint",
				RoleID = objDefender:GetRoleID(),
				SkillID = dwAttSkill,
				ExecTime = dwExecTime,
				ActCount = dwActCount,
			})
		end
	elseif dwDefType == enEntType.eEntType_Monster then
		objDefender:Play("",enEntType.eEntType_Player,objAttacker:GetRoleID(),dwBeAttPfx,nil,nil,nil,dwAttSkill,dwExecTime,dwActCount);
	end
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[7000520];
	sInfo.sNextLevelExp[1] = SkillStringConfig[7000530];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end

local Skill = SkillConfig[70006];

--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventSwordExecute(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime)
	--宝剑的技能效果
	local dwActionID = 11012;
	--效果的飞行时间
	local dwFlyTime = 200;
	--被击中的特效
	local dwBeAttPfx = 10001;
	--计算伤害
		--伤害值
		local dwAttValue = 0;
		local dwDefType = objDefender:GetObjType();
		local objAttSklSys = objAttacker:GetSystem("CSkillSystem");
		if objAttSklSys then
			dwAttValue = objAttSklSys:GetInfo().dwAttack;
		end
		local objSwordSys = objAttacker:GetSystem("CSwordSystem");
		local dwAmuletLevel = 0;
		--需要知道被击角色身上的宝甲等级，修正伤害值
		if dwDefType == enEntType.eEntType_Player then
			local objAmuletSys = objDefender:GetSystem("CAmuletSystem");
			if objAmuletSys then
				dwAmuletLevel = objAmuletSys:GetRank();
			end
		end
		if objSwordSys then
			dwAttValue = SwordDataConfig.AttackValue(dwAttValue,objSwordSys);
			
			local Level = objSwordSys:GetSwordLevel();
			local result = 1
			
			
			local GaiLv = 500;
			local BeiLv = 5;
			--如果宝甲等级大于20级降低一剑封喉概率
			if (dwAmuletLevel >=20) then
				BeiLv = 2.5
			end

			if (result >= 1) then
				local dwRand = math.random(10000);
				if (dwRand <= GaiLv) then
					dwAttValue = dwAttValue*BeiLv
				end
			end
		end		
		if dwDefType == enEntType.eEntType_Player then
			local objDefBattle = objDefender:GetSystem("CBattleSystem");
			if not objDefBattle then
				_info("get objDefBattle fail in CRoleSkill:ExecuHarmCount");
				return;
			end
			dwAttValue = CBattleCalculator:RevampSwordAttackValue(dwAttValue,dwAmuletLevel);
			-- dwAttValue = dwAttValue*(1-(0.2+(dwAmuletLevel*0.02)))
			objDefBattle:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwSkillLevel,dwExecTime,dwActCount);
		elseif dwDefType == enEntType.eEntType_Monster then
			objDefender:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwExecTime,dwActCount);
		end
		--执行附加BUFF
		Buff_Increase(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime,objSwordSys)

		
	--被击中者播放特效
	if dwDefType == enEntType.eEntType_Player then
		local objDefSklSys = objDefender:GetSystem("CSkillSystem");
		if objDefSklSys then
			objDefSklSys:BroadcastSkillMsg(true,"OnPlayPfxMsg",
			{
				ActionID = dwBeAttPfx,
				BindPos = "feetpoint",
				RoleID = objDefender:GetRoleID(),
				SkillID = dwAttSkill,
				ExecTime = dwExecTime,
				ActCount = dwActCount,
			})
		end
	elseif dwDefType == enEntType.eEntType_Monster then
		objDefender:Play("",enEntType.eEntType_Player,objAttacker:GetRoleID(),dwBeAttPfx,nil,nil,nil,dwAttSkill,dwExecTime,dwActCount);
	end
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[7000620];
	sInfo.sNextLevelExp[1] = SkillStringConfig[7000630];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end


local Skill = SkillConfig[70007];

--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventSwordExecute(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime)
	--宝剑的技能效果
	local dwActionID = 11012;
	--效果的飞行时间
	local dwFlyTime = 200;
	--被击中的特效
	local dwBeAttPfx = 10001;
	
	--计算伤害
		--伤害值
		local dwAttValue = 0;
		local dwDefType = objDefender:GetObjType();
		local objAttSklSys = objAttacker:GetSystem("CSkillSystem");
		if objAttSklSys then
			dwAttValue = objAttSklSys:GetInfo().dwAttack;
		end
		local objSwordSys = objAttacker:GetSystem("CSwordSystem");
		
		local dwAmuletLevel = 0;
		--需要知道被击角色身上的宝甲等级，修正伤害值
		if dwDefType == enEntType.eEntType_Player then
			local objAmuletSys = objDefender:GetSystem("CAmuletSystem");
			if objAmuletSys then
				dwAmuletLevel = objAmuletSys:GetRank();
			end
		end
		
		if objSwordSys then
			dwAttValue = SwordDataConfig.AttackValue(dwAttValue,objSwordSys);
			local GaiLv = 500;
			local BeiLv = 10;
			--如果宝甲等级大于20级降低一剑封喉概率
			if (dwAmuletLevel >=24) then
				BeiLv = 2.5;
			end

			local dwRand = math.random(10000);
			if (dwRand <= GaiLv) then
				dwAttValue = dwAttValue*BeiLv;
			end
		end
		
		if dwDefType == enEntType.eEntType_Player then
			local objDefBattle = objDefender:GetSystem("CBattleSystem");
			if not objDefBattle then
				_info("get objDefBattle fail in CRoleSkill:ExecuHarmCount");
				return;
			end
			

			dwAttValue = CBattleCalculator:RevampSwordAttackValue(dwAttValue,dwAmuletLevel);
			-- dwAttValue = dwAttValue*(1-(0.2+(dwAmuletLevel*0.02)))
			objDefBattle:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwSkillLevel,dwExecTime,dwActCount);
		elseif dwDefType == enEntType.eEntType_Monster then
			objDefender:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwExecTime,dwActCount);
		end
		
		--执行附加BUFF
		Buff_Increase(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime,objSwordSys)

		-- local dwRand = math.random(10000);
		-- local probability = (dwAmuletLevel*200)-800;
		-- if (dwRand <= probability) then
			-- AddRoleObjBuff(objDefender,71000,1,objAttacker);
		-- end

		-- local dwRand = math.random(10000);
		-- local probability = 1500+((200 * dwAmuletLevel-13))
		-- if (dwRand <= probability) then
			-- AddRoleObjBuff(objDefender,71003,1,objAttacker);
		-- end
		
		-- local dwRand = math.random(10000);
		-- local probability = 1000+((200 * dwAmuletLevel-17))
		-- if (dwRand <= probability) then
			-- AddRoleObjBuff(objDefender,71001,1,objAttacker);
		-- end
		
		-- local dwRand = math.random(10000);
		-- local probability = 2000+((200 * dwAmuletLevel-21))
		-- if (dwRand <= probability) then
			-- AddRoleObjBuff(objDefender,71002,1,objAttacker);
		-- end
		
	--被击中者播放特效
	if dwDefType == enEntType.eEntType_Player then
		local objDefSklSys = objDefender:GetSystem("CSkillSystem");
		if objDefSklSys then
			objDefSklSys:BroadcastSkillMsg(true,"OnPlayPfxMsg",
			{
				ActionID = dwBeAttPfx,
				BindPos = "feetpoint",
				RoleID = objDefender:GetRoleID(),
				SkillID = dwAttSkill,
				ExecTime = dwExecTime,
				ActCount = dwActCount,
			})
		end
	elseif dwDefType == enEntType.eEntType_Monster then
		objDefender:Play("",enEntType.eEntType_Player,objAttacker:GetRoleID(),dwBeAttPfx,nil,nil,nil,dwAttSkill,dwExecTime,dwActCount);
	end
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[7000720];
	sInfo.sNextLevelExp[1] = SkillStringConfig[7000730];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end


local Skill = SkillConfig[70008];

--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventSwordExecute(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime)
	--宝剑的技能效果
	local dwActionID = 11012;
	--效果的飞行时间
	local dwFlyTime = 200;
	--被击中的特效
	local dwBeAttPfx = 10001;
	
	--计算伤害
		--伤害值
		local dwAttValue = 0;
		local dwDefType = objDefender:GetObjType();
		local objAttSklSys = objAttacker:GetSystem("CSkillSystem");
		if objAttSklSys then
			dwAttValue = objAttSklSys:GetInfo().dwAttack;
		end
		local objSwordSys = objAttacker:GetSystem("CSwordSystem");
		
		local dwAmuletLevel = 0;
		--需要知道被击角色身上的宝甲等级，修正伤害值
		if dwDefType == enEntType.eEntType_Player then
			local objAmuletSys = objDefender:GetSystem("CAmuletSystem");
			if objAmuletSys then
				dwAmuletLevel = objAmuletSys:GetRank();
			end
		end
		
		if objSwordSys then
			dwAttValue = SwordDataConfig.AttackValue(dwAttValue,objSwordSys);
			local GaiLv = 500;
			local BeiLv = 10;
			--如果宝甲等级大于20级降低一剑封喉概率
			if (dwAmuletLevel >=24) then
				BeiLv = 2.5;
			end

			local dwRand = math.random(10000);
			if (dwRand <= GaiLv) then
				dwAttValue = dwAttValue*BeiLv;
			end
		end
		
		if dwDefType == enEntType.eEntType_Player then
			local objDefBattle = objDefender:GetSystem("CBattleSystem");
			if not objDefBattle then
				_info("get objDefBattle fail in CRoleSkill:ExecuHarmCount");
				return;
			end
			

			dwAttValue = CBattleCalculator:RevampSwordAttackValue(dwAttValue,dwAmuletLevel);
			-- dwAttValue = dwAttValue*(1-(0.2+(dwAmuletLevel*0.02)))
			objDefBattle:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwSkillLevel,dwExecTime,dwActCount);
		elseif dwDefType == enEntType.eEntType_Monster then
			objDefender:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwExecTime,dwActCount);
		end
		
		
		--执行附加BUFF
		Buff_Increase(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime,objSwordSys)

	--被击中者播放特效
	if dwDefType == enEntType.eEntType_Player then
		local objDefSklSys = objDefender:GetSystem("CSkillSystem");
		if objDefSklSys then
			objDefSklSys:BroadcastSkillMsg(true,"OnPlayPfxMsg",
			{
				ActionID = dwBeAttPfx,
				BindPos = "feetpoint",
				RoleID = objDefender:GetRoleID(),
				SkillID = dwAttSkill,
				ExecTime = dwExecTime,
				ActCount = dwActCount,
			})
		end
	elseif dwDefType == enEntType.eEntType_Monster then
		objDefender:Play("",enEntType.eEntType_Player,objAttacker:GetRoleID(),dwBeAttPfx,nil,nil,nil,dwAttSkill,dwExecTime,dwActCount);
	end
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[7000820];
	sInfo.sNextLevelExp[1] = SkillStringConfig[7000830];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end


----------------------------------------十阶名剑-无坚不裂
local Skill = SkillConfig[70009];

--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventSwordExecute(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime)
	--宝剑的技能效果
	local dwActionID = 11012;
	--效果的飞行时间
	local dwFlyTime = 200;
	--被击中的特效
	local dwBeAttPfx = 10001;
	
	--计算伤害
		--伤害值
		local dwAttValue = 0;
		local dwDefType = objDefender:GetObjType();
		local objAttSklSys = objAttacker:GetSystem("CSkillSystem");
		if objAttSklSys then
			dwAttValue = objAttSklSys:GetInfo().dwAttack;
		end
		local objSwordSys = objAttacker:GetSystem("CSwordSystem");
		
		local dwAmuletLevel = 0;
		--需要知道被击角色身上的宝甲等级，修正伤害值
		if dwDefType == enEntType.eEntType_Player then
			local objAmuletSys = objDefender:GetSystem("CAmuletSystem");
			if objAmuletSys then
				dwAmuletLevel = objAmuletSys:GetRank();
			end
		end
		if objSwordSys then
			dwAttValue = SwordDataConfig.AttackValue(dwAttValue,objSwordSys);
			local GaiLv = 500;
			local BeiLv = 10;
			--如果宝甲等级大于20级降低一剑封喉概率
			if (dwAmuletLevel >=24) then
				BeiLv = 2.5;
			end

			local dwRand = math.random(10000);
			if (dwRand <= GaiLv) then
				dwAttValue = dwAttValue*BeiLv;
			end
		end
		if dwDefType == enEntType.eEntType_Player then
			local objDefBattle = objDefender:GetSystem("CBattleSystem");
			if not objDefBattle then
				_info("get objDefBattle fail in CRoleSkill:ExecuHarmCount");
				return;
			end
			

			dwAttValue = CBattleCalculator:RevampSwordAttackValue(dwAttValue,dwAmuletLevel);
			-- dwAttValue = dwAttValue*(1-(0.2+(dwAmuletLevel*0.02)))
			objDefBattle:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwSkillLevel,dwExecTime,dwActCount);
		elseif dwDefType == enEntType.eEntType_Monster then
			objDefender:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwExecTime,dwActCount);
		end	
		--执行附加BUFF
		Buff_Increase(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime,objSwordSys)
	--被击中者播放特效
	if dwDefType == enEntType.eEntType_Player then
		local objDefSklSys = objDefender:GetSystem("CSkillSystem");
		if objDefSklSys then
			objDefSklSys:BroadcastSkillMsg(true,"OnPlayPfxMsg",
			{
				ActionID = dwBeAttPfx,
				BindPos = "feetpoint",
				RoleID = objDefender:GetRoleID(),
				SkillID = dwAttSkill,
				ExecTime = dwExecTime,
				ActCount = dwActCount,
			})
		end
	elseif dwDefType == enEntType.eEntType_Monster then
		objDefender:Play("",enEntType.eEntType_Player,objAttacker:GetRoleID(),dwBeAttPfx,nil,nil,nil,dwAttSkill,dwExecTime,dwActCount);
	end
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[7000920];
	sInfo.sNextLevelExp[1] = SkillStringConfig[7000930];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end
-----------------------名剑11阶 
local Skill = SkillConfig[70010];

--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventSwordExecute(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime)
	--宝剑的技能效果
	local dwActionID = 11012;
	--效果的飞行时间
	local dwFlyTime = 200;
	--被击中的特效
	local dwBeAttPfx = 10001;
	
	--计算伤害
		--伤害值
		local dwAttValue = 0;
		local dwDefType = objDefender:GetObjType();
		local objAttSklSys = objAttacker:GetSystem("CSkillSystem");
		if objAttSklSys then
			dwAttValue = objAttSklSys:GetInfo().dwAttack;
		end
		local objSwordSys = objAttacker:GetSystem("CSwordSystem");
		
		local dwAmuletLevel = 0;
		--需要知道被击角色身上的宝甲等级，修正伤害值
		if dwDefType == enEntType.eEntType_Player then
			local objAmuletSys = objDefender:GetSystem("CAmuletSystem");
			if objAmuletSys then
				dwAmuletLevel = objAmuletSys:GetRank();
			end
		end
		if objSwordSys then
			dwAttValue = SwordDataConfig.AttackValue(dwAttValue,objSwordSys);
			local GaiLv = 500;
			local BeiLv = 10;
			--如果宝甲等级大于20级降低一剑封喉概率
			if (dwAmuletLevel >=24) then
				BeiLv = 2.5;
			end

			local dwRand = math.random(10000);
			if (dwRand <= GaiLv) then
				dwAttValue = dwAttValue*BeiLv;
			end
		end
		if dwDefType == enEntType.eEntType_Player then
			local objDefBattle = objDefender:GetSystem("CBattleSystem");
			if not objDefBattle then
				_info("get objDefBattle fail in CRoleSkill:ExecuHarmCount");
				return;
			end
			

			dwAttValue = CBattleCalculator:RevampSwordAttackValue(dwAttValue,dwAmuletLevel);
			-- dwAttValue = dwAttValue*(1-(0.2+(dwAmuletLevel*0.02)))
			objDefBattle:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwSkillLevel,dwExecTime,dwActCount);
		elseif dwDefType == enEntType.eEntType_Monster then
			objDefender:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwExecTime,dwActCount);
		end
		
		--执行附加BUFF
		Buff_Increase(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime,objSwordSys)

	--被击中者播放特效
	if dwDefType == enEntType.eEntType_Player then
		local objDefSklSys = objDefender:GetSystem("CSkillSystem");
		if objDefSklSys then
			objDefSklSys:BroadcastSkillMsg(true,"OnPlayPfxMsg",
			{
				ActionID = dwBeAttPfx,
				BindPos = "feetpoint",
				RoleID = objDefender:GetRoleID(),
				SkillID = dwAttSkill,
				ExecTime = dwExecTime,
				ActCount = dwActCount,
			})
		end
	elseif dwDefType == enEntType.eEntType_Monster then
		objDefender:Play("",enEntType.eEntType_Player,objAttacker:GetRoleID(),dwBeAttPfx,nil,nil,nil,dwAttSkill,dwExecTime,dwActCount);
	end
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[7001020];
	sInfo.sNextLevelExp[1] = SkillStringConfig[7001030];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end


--宝甲一阶  伤害吸收
local Skill = SkillConfig[80000];
--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventAmuletHurtEnd(objSelf,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit)
	--宝甲的等级
	local dwAmuletLevel = 1;
	local objAmuSys = objSelf:GetSystem("CAmuletSystem");
	if objAmuSys then
		dwAmuletLevel = objAmuSys:GetRank();
	end
	
	local Level = (dwAmuletLevel*1.5)/10
	
	--拿到伤害类型
	local dwType = objEnemy:GetObjType();	

end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[8000020];
	sInfo.sNextLevelExp[1] = SkillStringConfig[8000030];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	
	-- dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	-- if dwResult < dwPublicCoolTime then
		-- dwResult = dwPublicCoolTime;
	-- end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end


--宝甲二阶 
local Skill = SkillConfig[80001];
--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventAmuletHurtReady(objSelf,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit)

	local dwType = objEnemy:GetObjType();	
	--宝甲的等级
	local dwAmuletLevel = 1;
	local objAmuSys = objSelf:GetSystem("CAmuletSystem");
	if objAmuSys then
		dwAmuletLevel = objAmuSys:GetRank();
	end
	
	local Level = (dwAmuletLevel*1.5)/10

end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[8000120];
	sInfo.sNextLevelExp[1] = SkillStringConfig[8000130];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	
	-- dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	-- if dwResult < dwPublicCoolTime then
		-- dwResult = dwPublicCoolTime;
	-- end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end

--宝甲伤害吸收
local Skill = SkillConfig[80002];
--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventAmuletHurtReady(objSelf,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit)

	local dwType = objEnemy:GetObjType();	
	--宝甲的等级
	local dwAmuletLevel = 1;
	local objAmuSys = objSelf:GetSystem("CAmuletSystem");
	if objAmuSys then
		dwAmuletLevel = objAmuSys:GetRank();
	end
	
	local Level = (dwAmuletLevel*1.5)/10

end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[8000220];
	sInfo.sNextLevelExp[1] = SkillStringConfig[8002030];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	
	-- dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	-- if dwResult < dwPublicCoolTime then
		-- dwResult = dwPublicCoolTime;
	-- end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end


--宝甲伤害吸收
local Skill = SkillConfig[80003];
--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventAmuletHurtReady(objSelf,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit)

	local dwType = objEnemy:GetObjType();	
	--宝甲的等级
	local dwAmuletLevel = 1;
	local objAmuSys = objSelf:GetSystem("CAmuletSystem");
	if objAmuSys then
		dwAmuletLevel = objAmuSys:GetRank();
	end
	
	local Level = (dwAmuletLevel*1.5)/10

end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[8000320];
	sInfo.sNextLevelExp[1] = SkillStringConfig[8000330];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	
	-- dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	-- if dwResult < dwPublicCoolTime then
		-- dwResult = dwPublicCoolTime;
	-- end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end



--宝甲伤害吸收
local Skill = SkillConfig[80004];
--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventAmuletHurtReady(objSelf,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit)

	local dwType = objEnemy:GetObjType();	
	--宝甲的等级
	local dwAmuletLevel = 1;
	local objAmuSys = objSelf:GetSystem("CAmuletSystem");
	if objAmuSys then
		dwAmuletLevel = objAmuSys:GetRank();
	end
	
	local Level = (dwAmuletLevel*1.5)/10
	--[[
	if dwType == enEntType.eEntType_Player then
		local objDefBattle = objEnemy:GetSystem("CBattleSystem");
		--伤害反弹		
		local Value = dwHurtValue*Level;
		objDefBattle:Hurt(Value,false,objSelf,0,0,0,0,true);
		--伤害吸收
		local objDefBattle = objSelf:GetSystem("CBattleSystem");
		local ValueY = 0-(dwHurtValue*Level);
		objDefBattle:Hurt(ValueY,false,objEnemy,0,0,0,0,true);
		--DeBuff
		AddRoleObjBuff(objEnemy,7006,dwAmuletLevel,objSelf);

	elseif dwType == enEntType.eEntType_Monster then
		--伤害反弹
		local Value = (dwHurtValue*Level);
		objEnemy:Hurt(Value,false,objSelf,0,0,0,0,true);
		--伤害吸收
		local objDefBattle = objSelf:GetSystem("CBattleSystem");
		local ValueY = 0-(dwHurtValue*Level);
		objDefBattle:Hurt(ValueY,false,objEnemy,0,0,0,0,true);
		--DeBuff
		AddRoleObjBuff(objEnemy,7006,dwAmuletLevel,objSelf);
	end
	--]]
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[8000420];
	sInfo.sNextLevelExp[1] = SkillStringConfig[8000430];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	
	-- dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	-- if dwResult < dwPublicCoolTime then
		-- dwResult = dwPublicCoolTime;
	-- end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end



--宝甲伤害吸收
local Skill = SkillConfig[80005];
--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventAmuletHurtReady(objSelf,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit)

	local dwType = objEnemy:GetObjType();	
	--宝甲的等级
	local dwAmuletLevel = 1;
	local objAmuSys = objSelf:GetSystem("CAmuletSystem");
	if objAmuSys then
		dwAmuletLevel = objAmuSys:GetRank();
	end
	
	local Level = (dwAmuletLevel*1.5)/10
	--[[
	if dwType == enEntType.eEntType_Player then
		local objDefBattle = objEnemy:GetSystem("CBattleSystem");
		--伤害反弹		
		local Value = dwHurtValue*Level;
		objDefBattle:Hurt(Value,false,objSelf,0,0,0,0,true);
		--伤害吸收
		local objDefBattle = objSelf:GetSystem("CBattleSystem");
		local ValueY = 0-(dwHurtValue*Level);
		objDefBattle:Hurt(ValueY,false,objEnemy,0,0,0,0,true);
		--DeBuff
		AddRoleObjBuff(objEnemy,7006,dwAmuletLevel,objSelf);

	elseif dwType == enEntType.eEntType_Monster then
		--伤害反弹
		local Value = (dwHurtValue*Level);
		objEnemy:Hurt(Value,false,objSelf,0,0,0,0,true);
		--伤害吸收
		local objDefBattle = objSelf:GetSystem("CBattleSystem");
		local ValueY = 0-(dwHurtValue*Level);
		objDefBattle:Hurt(ValueY,false,objEnemy,0,0,0,0,true);
		--DeBuff
		AddRoleObjBuff(objEnemy,7006,dwAmuletLevel,objSelf);
	end
	--]]
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[8000520];
	sInfo.sNextLevelExp[1] = SkillStringConfig[8000530];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	
	-- dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	-- if dwResult < dwPublicCoolTime then
		-- dwResult = dwPublicCoolTime;
	-- end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end


--宝甲伤害吸收
local Skill = SkillConfig[80006];
--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventAmuletHurtReady(objSelf,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit)

	local dwType = objEnemy:GetObjType();	
	--宝甲的等级
	local dwAmuletLevel = 1;
	local objAmuSys = objSelf:GetSystem("CAmuletSystem");
	if objAmuSys then
		dwAmuletLevel = objAmuSys:GetRank();
	end
	
	local Level = (dwAmuletLevel*1.5)/10
	--[[
	if dwType == enEntType.eEntType_Player then
		local objDefBattle = objEnemy:GetSystem("CBattleSystem");
		--伤害反弹		
		local Value = dwHurtValue*Level;
		objDefBattle:Hurt(Value,false,objSelf,0,0,0,0,true);
		--伤害吸收
		local objDefBattle = objSelf:GetSystem("CBattleSystem");
		local ValueY = 0-(dwHurtValue*Level);
		objDefBattle:Hurt(ValueY,false,objEnemy,0,0,0,0,true);
		--DeBuff
		AddRoleObjBuff(objEnemy,7006,dwAmuletLevel,objSelf);

	elseif dwType == enEntType.eEntType_Monster then
		--伤害反弹
		local Value = (dwHurtValue*Level);
		objEnemy:Hurt(Value,false,objSelf,0,0,0,0,true);
		--伤害吸收
		local objDefBattle = objSelf:GetSystem("CBattleSystem");
		local ValueY = 0-(dwHurtValue*Level);
		objDefBattle:Hurt(ValueY,false,objEnemy,0,0,0,0,true);
		--DeBuff
		AddRoleObjBuff(objEnemy,7006,dwAmuletLevel,objSelf);
	end
	--]]
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[8000620];
	sInfo.sNextLevelExp[1] = SkillStringConfig[8000630];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	
	-- dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	-- if dwResult < dwPublicCoolTime then
		-- dwResult = dwPublicCoolTime;
	-- end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end



--宝甲伤害吸收
local Skill = SkillConfig[80007];
--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventAmuletHurtReady(objSelf,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit)

	local dwType = objEnemy:GetObjType();	
	--宝甲的等级
	local dwAmuletLevel = 1;
	local objAmuSys = objSelf:GetSystem("CAmuletSystem");
	if objAmuSys then
		dwAmuletLevel = objAmuSys:GetRank();
	end
	
	local Level = (dwAmuletLevel*1.5)/10
	--[[
	if dwType == enEntType.eEntType_Player then
		local objDefBattle = objEnemy:GetSystem("CBattleSystem");
		--伤害反弹		
		local Value = dwHurtValue*Level;
		objDefBattle:Hurt(Value,false,objSelf,0,0,0,0,true);
		--伤害吸收
		local objDefBattle = objSelf:GetSystem("CBattleSystem");
		local ValueY = 0-(dwHurtValue*Level);
		objDefBattle:Hurt(ValueY,false,objEnemy,0,0,0,0,true);
		--DeBuff
		AddRoleObjBuff(objEnemy,7006,dwAmuletLevel,objSelf);

	elseif dwType == enEntType.eEntType_Monster then
		--伤害反弹
		local Value = (dwHurtValue*Level);
		objEnemy:Hurt(Value,false,objSelf,0,0,0,0,true);
		--伤害吸收
		local objDefBattle = objSelf:GetSystem("CBattleSystem");
		local ValueY = 0-(dwHurtValue*Level);
		objDefBattle:Hurt(ValueY,false,objEnemy,0,0,0,0,true);
		--DeBuff
		AddRoleObjBuff(objEnemy,7006,dwAmuletLevel,objSelf);
	end
	--]]
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[8000720];
	sInfo.sNextLevelExp[1] = SkillStringConfig[8000730];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	
	-- dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	-- if dwResult < dwPublicCoolTime then
		-- dwResult = dwPublicCoolTime;
	-- end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end

	-- elseif (dwRand <= 5000) then
		-- AddRoleObjBuff(objDefender,71000,7,objAttacker);
	-- elseif (dwRand <= 7500) then
		-- AddRoleObjBuff(objDefender,71001,7,objAttacker);
	-- else
		-- AddRoleObjBuff(objDefender,71002,7,objAttacker);
	-- end
--宝甲伤害吸收
local Skill = SkillConfig[80008];
--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventAmuletHurtReady(objSelf,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit)

	local dwType = objEnemy:GetObjType();	
	--宝甲的等级
	local dwAmuletLevel = 1;
	local objAmuSys = objSelf:GetSystem("CAmuletSystem");
	if objAmuSys then
		dwAmuletLevel = objAmuSys:GetRank();
	end
	
	local Level = (dwAmuletLevel*1.5)/10
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[8000820];
	sInfo.sNextLevelExp[1] = SkillStringConfig[8000830];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end



--宝甲伤害吸收
local Skill = SkillConfig[80009];
--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventAmuletHurtReady(objSelf,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit)

	local dwType = objEnemy:GetObjType();	
	--宝甲的等级
	local dwAmuletLevel = 1;
	local objAmuSys = objSelf:GetSystem("CAmuletSystem");
	if objAmuSys then
		dwAmuletLevel = objAmuSys:GetRank();
	end
	
	local Level = (dwAmuletLevel*1.5)/10
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[8000920];
	sInfo.sNextLevelExp[1] = SkillStringConfig[8000930];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end
--宝甲伤害吸收11阶 技能
local Skill = SkillConfig[80010];
--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventAmuletHurtReady(objSelf,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit)

	local dwType = objEnemy:GetObjType();	
	--宝甲的等级
	local dwAmuletLevel = 1;
	local objAmuSys = objSelf:GetSystem("CAmuletSystem");
	if objAmuSys then
		dwAmuletLevel = objAmuSys:GetRank();
	end
	
	local Level = (dwAmuletLevel*1.5)/10
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[8001020];
	sInfo.sNextLevelExp[1] = SkillStringConfig[8001030];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end