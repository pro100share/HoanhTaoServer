--怪物技能脚本
----脚本内容备注：该脚本记录各日常副本相关怪物技能，以及教学副本怪物技能
--索引备注：以怪物所在副本查找  任务怪物无法准确查询 特放置在该脚本最后
----------------------------------------------------------------------------------------
-----------------------------------副本怪物技能脚本-------------------------------------
-------------------------------------怪物基础技能---------------------------------------
--人被怪物击退
local function ExecMoveActiveForMonster(sysMonsterSkill,dwBackLength,dwRoleId,dwSkillID,dwActCount)
	local objPlayer = sysMonsterSkill:GetMon():GetMap():GetPlayerByRoleID(dwRoleId);
	if not objPlayer then
		return;
	end
	
	local _,sx,sy = sysMonsterSkill:GetMon():GetPos();
	local _,px,py = objPlayer:GetSystem("CMapSystem"):GetPlayerMapPos();
	
	local vecDis = Vector2.new(px-sx,py-sy);
	vecDis:normalize();
	
	local vecPosLast = 
	{
		x = px + vecDis.x*dwBackLength,
		y = py + vecDis.y*dwBackLength,
	};
	
	local vecList = {};
	table.insert(vecList,vecPosLast);
	local objSklSystem = objPlayer:GetSystem("CSkillSystem");
	objSklSystem:BroadcastSkillMsg(true,"OnPlaySkillMoveEffectMsg",
			{
				ActionID = 6,
				StartType = 4,
				StartID = objPlayer:GetRoleID(),
				PosList = vecList,
				Delay = 200,
				Index = 1,
				ShadowID = 0,
				SkillID = dwSkillID,
				ExecTime = _now(),
				ActCount = dwActCount,
			})
end;

--添加buff
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

--怪物像目标冲锋
local function MonsterAssault(sysMonsterSkill,dwActID,dwDelay,dwRoleID)
	local objMon = sysMonsterSkill:GetMon();
	
	local objPlayer = objMon:GetMap():GetPlayerByRoleID(dwRoleId);
	if not objPlayer then
		return;
	end
	
	local _,px,py = objPlayer:GetSystem("CMapSystem"):GetPlayerMapPos();
	
	local vecPosLast = 
	{
		x = px,
		y = py,
	};
	
	local vecList = {};
	table.insert(vecList,vecPosLast);
	
	objMon:CompelMove(dwActID,dwDelay,dwRoleID,vecList,0,0,0);
end;
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
--------------------------五行道场副本-------------------
--技能[7011]/////////////////金//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50502006]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end


--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


--技能[50502007]/////////////////木//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50502007]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)


	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
	
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end


--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[50502009]/////////////////火//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50502009]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)

end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end


--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[50502010]/////////////////土//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50502010]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end


--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[50502008]/////////////////水//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50502008]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {450};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end


--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[505020060]/////////////////五行道场BOSS金//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[505020060]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {800};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)

	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 2000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end


--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 130 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end
function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[505020070]/////////////////五行道场BOSS木//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[505020070]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {1000};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)

	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 2000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end


--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 130 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end
function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[505020080]/////////////////五行道场BOSS水//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[505020080]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {120};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 2000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end


--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 130 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end
function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[505020090]/////////////////五行道场BOSS火//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[505020090]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {320};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)

	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 2000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end


--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 130 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end
function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[505020100]/////////////////五行道场BOSS土//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[505020100]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)

	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 2000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end
--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 130 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end
function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[50502011]/////////////////五行圣兽//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50502011]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 2300;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end
--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 150 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end
function Skill:SkillMonsterAction()
	return 1,130,600;
end;


--技能[505020110]/////////////////五行圣兽//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[505020110]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 2300;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 120 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end
function Skill:SkillMonsterAction()
	return 1,131,600;
end;

--技能[505020111]//////////////五行圣兽//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[505020111]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1700;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

----------------------------------任务教学副本------------------------------------------

--技能[50012001]//////////////路雯/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50012001]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {452};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)

	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,2000,600;
end;


--技能[50710012]//////////////忠翊郎/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50710012]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {452};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1350;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 125 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;


--技能[507100120]//////////////忠翊郎/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[507100120]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {150};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
	local dwRand = math.random(10000);
	
	if (dwRand <= 1000) then
		ExecMoveActiveForMonster(sysMonsterSkill,3,dwRoleId,10012004,dwActCount);
	end
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1100;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 150 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end



--技能[50022001]//////////////无双教学//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50022001]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)

	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 400;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end
-------------------------顶替自身BUFF------------------------
local Skill = SkillConfig[500220010]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)

	sysMonsterSkill:SelfBuff(50022001,1);
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,150,600;
end;
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
------------------------------------大破连营副本----------------------------------------

--技能[50702021]/////////////////拒敌弩车//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50702021]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)


	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)

	local dwRand = math.random(10000);
	
	if (dwRand <= 4000) then
		ExecMoveActiveForMonster(sysMonsterSkill,3,dwRoleId,10012004,dwActCount);
	end
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end


--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end
function Skill:SkillMonsterAction()
	return 3,200,600;
end;


--技能[50702025]/////////////////投石车//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50702025]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {1200};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)

	--怪物心法
	-- local Monster = sysMonsterSkill:GetMon()
	-- local HP,opportunity = MonsterDecision:life(Monster)
	-- if (HP <= opportunity) then
		-- MonsterDecision:Heart(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	-- end


	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
	local dwRand = math.random(10000);
	
	if (dwRand <= 1000) then
		sysMonsterSkill:AddBuff(dwRoleId,96000,1,1);
	end
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end


--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end
function Skill:SkillMonsterAction()
	return 3,205,500;
end;



--技能[80002001]/////////////////隐藏怪物使用//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[80002001]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {200};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end


--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end
-- function Skill:SkillMonsterAction()
	-- return 3,205,500;
-- end;

--技能[80002002]/////////////////隐藏怪物使用1//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[80002002]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {200};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end
-- function Skill:SkillMonsterAction()
	-- return 3,205,500;
-- end;


--技能[507100110]//////////////承信郎//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[507100110]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {550};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 2000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 130 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------困兽之斗副本-----------------------------------------
--技能[506030010]//////////////鬼面（哑仆头领）/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[506030010]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 130 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;


--技能[506030020]//////////////万恶护法/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[506030020]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {500};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 140 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

-- function Skill:SkillMonsterAction()
	-- return 1,110,600;
-- end;


--技能[506030021]//////////////万恶护法/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[506030021]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 140 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;


--技能[506030030]//////////////柳如英(梁梦儿)/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[506030030]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 130 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,130,600;
end;


--技能[506040010]//////////////完颜霸(完颜赛和)/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[506040010]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1700;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 160 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;


--技能[506000080]//////////////十面埋伏小怪8降低攻击技能/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[506000080]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


--技能[506000130]//////////////十面埋伏小怪13沉默技能/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[506000130]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {200};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


--技能[506000140]//////////////十面埋伏小怪14沉默技能/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[506000140]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


--技能[506000150]//////////////十面埋伏小怪15降低防御技能/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[506000150]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {200};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end



--技能[506000060]//////////////十面埋伏小怪6降低暴击技能/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[506000060]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


--技能[506000090]//////////////十面埋伏小怪9的降低身法//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[506000090]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)

	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


--技能[506000100]//////////////十面埋伏小怪10的减速攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[506000100]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)

	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end



--技能[507400001]/////////////////猪拱人（击退）/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[507400001]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {200};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 2500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end


--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end



--技能[507400002]/////////////////隐藏怪物使用,附带减速效果//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[507400002]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--/////////////////////////////////珍珑棋局 1~50 begin////////////////////////////
--技能[50302001]//////////////平一指//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302001]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020010]//////////////平一指技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020010]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302002]//////////////七藜//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302002]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020020]//////////////七藜技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020020]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302003]//////////////梁梦儿//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302003]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020030]//////////////梁梦儿技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020030]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,130,600;
end;

--技能[50302004]//////////////石渊//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302004]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020040]//////////////石渊技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020040]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,120,600;
end;

--技能[50302005]//////////////苏清岚//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302005]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020050]//////////////苏清岚技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020050]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,130,600;
end;

--技能[50302006]//////////////尤晃晃//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302006]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020060]//////////////尤晃晃技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020060]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,141,600;
end;

--技能[50302007]//////////////沙通天//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302007]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020070]//////////////沙通天技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020070]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,120,600;
end;

--技能[50302008]//////////////侯通海//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302008]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020080]//////////////侯通海技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020080]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[50302009]//////////////陆冠英//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302009]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020090]//////////////陆冠英技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020090]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[50302010]//////////////巴特尔//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302010]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020100]//////////////巴特尔技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020100]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302011]//////////////洛观云//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302011]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020110]//////////////洛观云技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020110]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[50302012]//////////////广平禅师//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302012]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020120]//////////////广平禅师技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020120]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[50302013]//////////////黛绮丝//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302013]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020130]//////////////黛绮丝技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020130]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[50302014]//////////////阿鸾//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302014]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020140]//////////////阿鸾技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020140]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302015]//////////////哲里勒//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302015]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020150]//////////////哲里勒技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020150]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302016]//////////////巴赫拉姆//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302016]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020160]//////////////巴赫拉姆技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020160]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302017]//////////////何居奇//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302017]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020170]//////////////何居奇技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020170]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302018]//////////////王嫣然//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302018]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020180]//////////////王嫣然技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020180]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,130,600;
end;

--技能[50302019]//////////////程遥迦//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302019]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020190]//////////////程遥迦技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020190]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[50302020]//////////////陆乘风//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302020]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020200]//////////////陆乘风技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020200]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302021]//////////////赵潇守//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302021]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020210]//////////////赵潇守技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020210]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302022]//////////////纪无双//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302022]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020220]//////////////纪无双技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020220]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302023]//////////////兀颜//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302023]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020230]//////////////兀颜技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020230]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302024]//////////////蒲古里//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302024]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020240]//////////////蒲古里技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020240]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302025]//////////////金三度//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302025]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020250]//////////////金三度技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020250]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,130,600;
end;

--技能[50302026]//////////////刘慕鸥//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302026]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020260]//////////////刘慕鸥技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020260]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302027]//////////////何山涛//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302027]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020270]//////////////何山涛技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020270]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302028]//////////////韩兴邦//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302028]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020280]//////////////韩兴邦技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020280]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302029]//////////////完颜赛合//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302029]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020290]//////////////完颜赛合技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020290]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,141,600;
end;

--技能[50302030]//////////////彭连虎//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302030]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020300]//////////////彭连虎技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020300]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302031]//////////////托勒木//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302031]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020310]//////////////托勒木技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020310]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302032]//////////////和扎古//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302032]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020320]//////////////和扎古技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020320]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302033]//////////////术虎//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302033]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020330]//////////////术虎技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020330]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302034]//////////////柯镇恶//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302034]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020340]//////////////柯镇恶技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020340]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,141,600;
end;

--技能[50302035]//////////////郭靖//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302035]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020350]//////////////郭靖技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020350]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302036]//////////////郭芙//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302036]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020360]//////////////郭芙技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020360]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302037]//////////////周伯通//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302037]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020370]//////////////周伯通技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020370]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,120,600;
end;

--技能[50302038]//////////////裘千尺//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302038]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020380]//////////////裘千尺技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020380]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,130,600;
end;

--技能[50302039]//////////////黄药师//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302039]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020390]//////////////黄药师技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020390]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302040]//////////////杨过//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302040]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020400]//////////////杨过技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020400]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302041]//////////////公孙绿萼//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302041]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020410]//////////////公孙绿萼技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020410]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302042]//////////////樊一翁//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302042]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020420]//////////////樊一翁技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020420]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302043]//////////////公孙止//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302043]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020430]//////////////公孙止技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020430]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302044]//////////////小龙女//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302044]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020440]//////////////小龙女技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020440]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302045]//////////////一灯大师//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302045]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020450]//////////////一灯大师技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020450]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[50302046]//////////////阿弥勒//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302046]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020460]//////////////阿弥勒技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020460]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302047]//////////////慈恩//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302047]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020470]//////////////慈恩技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020470]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302048]//////////////慈真//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302048]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020480]//////////////慈真技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020480]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[50302049]//////////////瑛姑//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302049]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020490]//////////////瑛姑技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020490]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,130,600;
end;

--技能[50302050]//////////////蚩萝伊//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302050]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[503020500]//////////////蚩萝伊技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020500]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--/////////////////////////////////珍珑棋局 1~50 end////////////////////////////

--技能[51000003]//////////////通天塔boss1//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[51000003]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[51000006]//////////////通天塔boss2///////////////////////////////
--技能使用效果
local Skill = SkillConfig[51000006]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,141,600;
end;

--技能[51000009]//////////////通天塔boss3///////////////////////////////
--技能使用效果
local Skill = SkillConfig[51000009]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[51000012]//////////////通天塔boss4///////////////////////////////
--技能使用效果
local Skill = SkillConfig[51000012]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[51000015]//////////////通天塔boss5//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[51000015]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[51000018]//////////////通天塔boss6//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[51000018]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,120,600;
end;

--技能[51000027]//////////////通天塔boss7//////////////////////////////////////
---------------技能1
local Skill = SkillConfig[51000021]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 2500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[51000024]//////////////通天塔boss8//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[51000024]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[51000027]//////////////通天塔boss9//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[51000027]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,130,600;
end;
