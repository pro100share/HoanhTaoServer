--怪物技能脚本
--脚本内容备注：该脚本记录怪物基础技能以及通用技能
--索引备注：以怪物名称查找即可，通用技能查找“通用”关键字即可
----------------------------------------------------------------------------------------
------------------------------------怪物基础技能脚本---------------------------------------
-------------------------------------怪物基础技能---------------------------------------

--怪物的攻击频率变速公式
--dwBaseValue：从GetMonsterSkillHold中取到的基本速度值
--dwAttackSpeed：怪物属性中的攻击加速值，包括属性中值
--dwLevel：技能等级
_G.Acceleration = function(dwBaseValue,dwAttackSpeed,dwLevel)
	local Ratio = 1-((dwAttackSpeed - 10)/10)
	--怪物硬直
	local FanHui = dwBaseValue*Ratio
	return FanHui
end


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

local Skill = SkillConfig[1]; 

--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {150};
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

---------------------------------------------------------------------------------
local Skill = SkillConfig[50]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)

	local dwSkillId = nil;
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,dwSkillId,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 2000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end--获取技能附加的属性（表）
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
---------------------------------------------------------------------------------------------------
local Skill = SkillConfig[51]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)

	local dwSkillId = nil;
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,dwSkillId,dwSkillLevel,bHit,bCrit)
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


---------------------------------------------------------------------------------------------------
local Skill = SkillConfig[52]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {800};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)

	local dwSkillId = nil;
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,dwSkillId,dwSkillLevel,bHit,bCrit)
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


---------------------------------------------------------------------------------------------------
local Skill = SkillConfig[53]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {1000};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)

	local dwSkillId = nil;
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,dwSkillId,dwSkillLevel,bHit,bCrit)
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


---------------------------------------------------------------------------------------------------
----========================================怪物技能==========================================

--技能[10012001]//////////////野狼普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10012001]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)

	local dwSkillId = nil;
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,dwSkillId,dwSkillLevel,bHit,bCrit)
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


--技能[10012002]//////////////村头地痞普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10012002]; 
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
	return 2000;
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

--技能[10012003]//////////////异乡人//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10012003]; 
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
	return 2000;
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

--技能[10012004]//////////////异乡头领//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10012004]; 
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



--技能[10012005]//////////////金军高手//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10012005]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {516};
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


--技能[10032001]//////////////金军先锋//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10032001]; 
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

--技能[10032002]//////////////金军步兵//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10032002]; 
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

--技能[10032003]//////////////金军骑兵//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10032003]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end

-- function Skill:SkillMonsterAction()
	-- return 3,9,600;
-- end;
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


--技能[10032004]//////////////金军百夫长//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10032004]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {355};
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

--技能[10032005]//////////////蒙古游骑//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10032005]; 
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


--技能[10032006]//////////////金军将领//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10032006]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {900};
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

--技能[10032007]//////////////营寨护卫//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10032007]; 
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
--技能[10032008]//////////////营寨护卫//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10032008]; 
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
--技能[10042001]//////////////桃林灵猴//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10042001]; 
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


--技能[10042002]//////////////不诡哑仆//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10042002]; 
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

--技能[10042003]//////////////凶恶哑仆//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10042003]; 
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
--技能[10042004]//////////////毒蝎//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10042004]; 
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

--技能[10042005]//////////////玉蟾(任务)//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10042005]; 
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



--技能[10042006]//////////////柯镇恶//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10042006]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {298};
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
--技能[10052001]//////////////地牢看守//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10052001]; 
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
--技能[10052002]//////////////巡视弟子//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10052002]; 
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

--技能[10052003]//////////////野猴//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10052003]; 
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

--技能[10052005]//////////////巨鳄(任务)//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10052005]; 
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


--技能[10052004]//////////////鳄鱼//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10052004]; 
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
--技能[10052006]//////////////黄药师//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10052006]; 
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
--技能[10062001]//////////////发狂疫民//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10062001]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600,900};
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
--技能[10062002]//////////////五毒教探子//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10062002]; 
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
--技能[10062003]//////////////穿山甲//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10062003]; 
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
--技能[10062004]//////////////赤狐//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10062004]; 
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
--技能[10062005]//////////////神秘人（任务）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10062005]; 
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
--技能[10062006]//////////////九宿（任务）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10062006]; 
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
	return 2300;
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

--技能[10062008]//////////////五仙教信使//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10062008]; 
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
--技能[10072001]//////////////沙蜥//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10072001]; 
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
--技能[10072002]//////////////沙匪//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10072002]; 
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
--技能[10072003]//////////////沙匪头领(任务)//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10072003]; 
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
--技能[10072004]//////////////黑衣神秘人//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10072004]; 
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
--技能[10072005]//////////////白驼弟子//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10072005]; 
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
--技能[10072006]//////////////欧阳锋(任务)//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10072006]; 
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
--技能[10082001]//////////////丐帮弟子(//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10082001]; 
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
--技能[10082002]//////////////神秘刀客/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10082002]; 
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
--技能[10082003]//////////////护卫番僧/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10082003]; 
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
--技能[10082004]//////////////五毒教众/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10082004]; 
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
--技能[10082005]//////////////金轮法王/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10082005]; 
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
--技能[10092001]//////////////布阵弟子/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10092001]; 
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
--技能[10092002]//////////////蒙军武士/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10092002]; 
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
--技能[10092003]//////////////玉蜂/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10092003]; 
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
--技能[10092004]//////////////暗棋潜入者/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10092004]; 
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

--技能[10092005]//////////////金轮法王/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10092005]; 
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


--技能[10092006]//////////////霍都/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10092006]; 
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


--技能[10102001]//////////////五毒教蛊师/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10102001]; 
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
--技能[10102002]//////////////暗棋剑士/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10102002]; 
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
--技能[10102003]//////////////蒙军伏兵/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10102003]; 
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
--技能[10102004]//////////////五毒教尸傀/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10102004]; 
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
--技能[10102005]//////////////天蛛/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10102005]; 
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
--技能[10102006]//////////////潇湘子/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10102006]; 
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
--技能[10112001]//////////////蒙军精锐/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10112001]; 
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
--技能[10112002]//////////////暗棋刺客/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10112002]; 
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
--技能[10112003]//////////////五毒叛教众/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10112003]; 
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
--技能[10112004]//////////////少林武僧/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10112004]; 
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
--技能[10112005]//////////////德瓦西/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10112005]; 
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
--技能[10112006]//////////////天元/////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10112006]; 
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





----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
------------------------------------通用技能--------------------------------------------

--技能[6999]//////////////大众怪物普工（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[6999]; 
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


--技能[7000]//////////////大众怪物普工（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[7000]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {350};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1300;
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
-------------------------------------------------------------------------------------------
--技能[7001]//////////////大众怪物双伤（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[7001]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600,580};
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

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[7002]//////////////大众怪物击退（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[7002]; 
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
	return 1,120,600;
end;
--技能[7003]//////////////大众怪物击晕（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[7003]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {750};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1300;
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
	return 1,110,600;
end;
--技能[7004]//////////////大众怪物降低移动速度（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[7004]; 
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

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[7005]//////////////大众怪物降低攻击速度（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[7005]; 
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

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[7006]//////////////大众怪物降低攻击力（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[7006]; 
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

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[7007]//////////////大众怪物降低暴击率（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[7007]; 
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

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[7008]//////////////大众怪物降低身法（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[7008]; 
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

function Skill:SkillMonsterAction()
	return 1,110,600;
end;


--技能[50602001]//////////////大众怪扇形附带降低攻击BUFF（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50602001]; 
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
	return 1,120,600;
end;

--技能[50602002]//////////////大众怪线性附带降低身法BUFF（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50602002]; 
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
	return 1,120,600;
end;

--技能[50602003]//////////////大众怪线性附带降低移动BUFF（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50602003]; 
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
end


--技能[50602004]//////////////大众怪线性附带降低攻击速度（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50602004]; 
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
	return 1,120,600;
end;




--技能[50602005]//////////////大众怪线性附带降低防御（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50602005]; 
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

--技能[50602006]//////////////大众怪线性附带眩晕（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50602006]; 
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
	return 1,120,600;
end;

--技能[50602007]//////////////大众怪线性附带击退（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50602007]; 
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
	return 1,120,600;
end;

--技能[50602008]//////////////大众怪线性附带清空蓝（通用）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50602008]; 
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

--技能[50710013]//////////////铁匠//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50710013]; 
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

--终南山剧情使用
local Skill = SkillConfig[10092008]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {150};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
	
	local objPlayer = sysMonsterSkill:GetMon():GetMap():GetPlayerByRoleID(dwRoleId);
	if not objPlayer then
		return;
	end
	-- local sysTask = objPlayer:GetSystem("CTaskSystem")	
	-- local Task = sysTask:GetTask(7036)
	-- if not Task then
		-- return;
	-- end
	-- --符合人物条件执行
	-- if Task:GetTaskState()==TaskStateConfig.Accept then
		local objBufSys = objPlayer:GetSystem("CBuffSystem");
		if not objBufSys then
			return;
		end
		
		if objBufSys:GetBuffObj(100920130) == nil then
			if objBufSys:GetBuffObj(10092013) ~= nil then
				objBufSys:DeleteBuffByID(10092013);
				local objScriptSys = objPlayer:GetSystem("CScriptSystem");
				if not objScriptSys then
					return;
				end
					--获取玩家	X Y坐标
					local objMapSystem = objPlayer:GetSystem("CMapSystem");
					if not objMapSystem then
						return false;
					end
					local vPos = objMapSystem:GetPlayerPos()
					CScriptManager:AddMonToMap(1008,10092013,1005,10092013,-1,11110,vPos.x,vPos.y,objPlayer)
					objScriptSys:Notice(string.format(SysStringConfigInfo[9000110023],vPos.x,vPos.y),7);
			end
		end
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


--技能[50710011]//////////////承信郎//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50710011]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {250,600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1200;
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

--技能[10022001]//////////////神奇的猪//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10022001]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {150};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
	sysMonsterSkill:AddBuff(dwRoleId,93000,70,3);
	--ExecMoveActiveForMonster(sysMonsterSkill,2,dwRoleId,10012004,dwActCount);
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1200;
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

--技能[81]//////////////地刺//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[81]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {150};
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

--技能[200020063]//////////////恶人谷-普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[200020064]; 
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


--技能[10102017]//////////////风清扬普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10102017]; 
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
	return 2000;
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

--技能[900000]//////////////白虎的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[900000]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {350};
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


--技能[900010]//////////////青龙的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[900010]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {250};
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


--技能[900020]//////////////朱雀的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[900020]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {250};
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


--技能[900030]//////////////玄武的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[900030]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {150};
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


--技能[50600008]//////////////十面埋伏小怪8的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50600008]; 
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


--技能[50600010]//////////////十面埋伏小怪10的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50600010]; 
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


--技能[50600013]//////////////十面埋伏小怪13的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50600013]; 
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


--技能[50600014]//////////////十面埋伏小怪14的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50600014]; 
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


--技能[50600015]//////////////十面埋伏小怪15的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50600015]; 
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


--技能[50600006]//////////////十面埋伏小怪6的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50600006]; 
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


--技能[50600009]//////////////十面埋伏小怪9的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50600009]; 
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


--技能[10112016]//////////////无色禅师的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10112016]; 
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
	return 1200;
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



--技能[60011001]//////////////肉铺老板卢鹭的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[60011001]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {700};
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



--技能[60011002]//////////////小薇的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[60011002]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300,1200};
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
			dwAttack_mul = 90 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end



--技能[60011003]//////////////刘雨的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[60011003]; 
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
	return 2000;
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



--技能[60011004]//////////////南筱芸的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[60011004]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {700};
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



--技能[60011005]//////////////戈楠的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[60011005]; 
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
	return 2000;
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



--技能[20002011]//////////////昆仑山世界BOSS普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20002011]; 
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



--技能[507400003]//////////////小猪快跑暴走老母猪普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[507400003]; 
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
	return 2000;
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
------------------------------------群侠
local Skill = SkillConfig[60011006]; 
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
-----------------------------
local Skill = SkillConfig[60011007]; 
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

--------------------------年兽BOSS普通攻击
--技能[20002011]//////////////昆仑山世界BOSS普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50750001]; 
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
----------------------年兽BOSS群晕
local Skill = SkillConfig[507500010]; 
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
	return 20
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 140,				--攻击力系数
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

--技能[60011010]//////////////广平禅师的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[60011010]; 
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
	return 2000;
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


--技能[60011011]//////////////崔命的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[60011011]; 
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
	return 2000;
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

--技能[60011012]//////////////任烈山的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[60011012]; 
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
	return 2000;
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

--技能[60011013]//////////////宫北烨的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[60011013]; 
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
	return 2000;
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

--技能[60011014]//////////////唐三妹的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[60011014]; 
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
	return 2000;
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

--技能[60011015]//////////////傻姑的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[60011015]; 
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
	return 2000;
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


--技能[20002012]//////////////双头怪蟒的普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20002012]; 
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
	return 2000;
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
