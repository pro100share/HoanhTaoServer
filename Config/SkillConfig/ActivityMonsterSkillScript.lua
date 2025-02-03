--怪物技能脚本
--脚本内容备注：该脚本记录活动类型怪物技能如野外BOSS以及将来扩展活动BOSS都将放置于此
--索引备注：以怪物名称寻找即可
----------------------------------------------------------------------------------------
-----------------------------------活动怪物技能脚本-------------------------------------
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

------------------------------野外BOSS技能----------------------------
--技能[8700]//////////////欧阳锋//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20002006]; 
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
	return 1800;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 30
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 170 ,				--攻击力系数
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
	return 1,142,600;
end;


----------------------何足道技能1

local Skill = SkillConfig[200020110]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {500,800};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1800;
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
	return 1,120,600;
end;

--------------------何足道技能2
local Skill = SkillConfig[200020111]; 
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
	return 1800;
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
	return 1,140,600;
end;
--技能[200020061]//////////////欧阳锋//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[200020061]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {1100};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1800;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 30
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
	return 1,141,600;
end;

--技能[200020060]//////////////欧阳锋//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[200020060]; 
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
			dwAttack_mul = 150,				--攻击力系数
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

--技能[20002005]//////////////一灯普工//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20002005]; 
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




--技能[200020050]//////////////一灯大师//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[200020050]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	--sysMonsterSkill:DoHurt(dwRoleId,dwValue,dwSkillId,dwSkillLevel,bHit,bCrit)
	sysMonsterSkill:SelfBuff(200020050,1);
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

function Skill:SkillMonsterAction()
	return 1,150,600;
end;


--技能[200020052]//////////////一灯大师//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[200020052]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600,900,1200,1500,1800,2000,2200};
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
	return 30
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

--技能[200020051]//////////////一灯大师//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[200020051]; 
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

function Skill:SkillMonsterAction()
	return 3,204,600;
end;


--技能[20002004]//////////////黄药师//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20002004]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {1000,1300,1500,1800,2000,2100,2400,3000};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 30
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 95,				--攻击力系数
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

--技能[200020040]//////////////黄药师//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[200020040]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {1250};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 2100;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 30
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
	return 1,140,600;
end;

--技能[100520060]//////////////黄药师//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[100520060]; 
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
	return 3,201,90;
end;

--技能[20002003]//////////////柯镇恶//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20002003]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {1100};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
	sysMonsterSkill:AddBuff(dwRoleId,93000,70,10);
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
	return 1,141,600;
end;

--技能[200020030]//////////////柯镇恶//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[200020030]; 
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
	return 3,203,200;
end;

-------------------------霍都单体伤害---------------------
local Skill = SkillConfig[200020010]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
	-- sysMonsterSkill:AddBuff(dwRoleId,503020100,1);
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
			dwAttack_mul = 135,				--攻击力系数
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
	return 1,121,600;
end;


--技能[20002001]//////////////霍都//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20002001]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	--sysMonsterSkill:DoHurt(dwRoleId,dwValue,dwSkillId,dwSkillLevel,bHit,bCrit)
	sysMonsterSkill:SelfBuff(9504,1);
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

function Skill:SkillMonsterAction()
	return 1,150,600;
end;



--技能[50312101]//////////////恶人谷-活死人//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50312101]; 
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

--技能[503121010]//////////////恶人谷-活死人//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503121010]; 
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
	return 1,120,600;
end;

--技能[200020063]//////////////恶人谷-鬼面药王//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[200020063]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {2500};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3500;
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
	return 3,208,200;
end;

--技能[90000]//////////////白虎//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[90000]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400,600,700,800};
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
	return 20
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

function Skill:SkillMonsterAction()
	return 1,140,200;
end;


--技能[90001]//////////////青龙//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[90001]; 
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
	return 1200;
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
	return 1,130,200;
end;


--技能[90002]//////////////朱雀//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[90002]; 
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
	return 20
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
	return 1,110,200;
end;


--技能[90003]//////////////玄武//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[90003]; 
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
	return 20
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
	return 1,140,200;
end;

--技能[20002007]//////////////丘处机//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20002007]; 
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


--技能[200020070]//////////////丘处机//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[200020070]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {500};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	
	local dwRand = math.random(10000);
	
	if (dwRand <= 6000) then
		ExecMoveActiveForMonster(sysMonsterSkill,3,dwRoleId,10012004,dwActCount);
	end
	
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
	return 30
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
	return 1,140,200;
end;


--技能[200020071]//////////////丘处机//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[200020071]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {200,400,600,800,1000,1200,1400};
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
	return 30
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
	return 1,130,200;
end;

--技能[200020072]//////////////丘处机//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[200020072]; 
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
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 200,				--攻击力系数
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
	return 1,131,200;
end;



--技能[20002008]//////////////洪七公//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20002008]; 
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
			dwAttack_mul = 100,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[200020080]//////////////洪七公//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[200020080]; 
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
	return 2300;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 30
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
	return 1,120,200;
end;

--技能[200020081]//////////////洪七公//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[200020081]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {200,400,600,800,1000,1200,1400};
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
	return 30
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 90,				--攻击力系数
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
	return 1,140,200;
end;

--技能[200020082]//////////////洪七公//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[200020082]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400,600,800};
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
			dwAttack_mul = 95,				--攻击力系数
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
	return 1,141,200;
end;


--技能[200020083]//////////////洪七公//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[200020083]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {500,900};
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
	return 30
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100,				--攻击力系数
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
	return 1,142,200;
end;

--技能[101020170]//////////////风清扬//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[101020170]; 
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
	return 30
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 120,				--攻击力系数
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


--技能[101020171]//////////////风清扬//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[101020171]; 
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
	return 30
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 200,				--攻击力系数
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


--技能[101020172]//////////////风清扬//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[101020172]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300,500,700,900};
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
	return 30
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100,				--攻击力系数
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


--技能[101120160]//////////////无色禅师技能1//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[101120160]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {500,600,1400};
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
			dwAttack_mul = 95,				--攻击力系数
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


--技能[101120161]//////////////无色禅师技能2//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[101120161]; 
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
	return 2200;
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
			dwAttack_mul = 130,				--攻击力系数
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

--技能[101120162]//////////////无色禅师技能3//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[101120162]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
	sysMonsterSkill:SelfBuff(101120162,1);
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
	return 30
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



--技能[600110010]//////////////肉铺老板技能1//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[600110010]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400,900,1600};
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
			dwAttack_mul = 120,				--攻击力系数
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


--技能[600110011]//////////////肉铺老板技能2//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[600110011]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {700,800};
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
			dwAttack_mul = 130,				--攻击力系数
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


--技能[600110020]//////////////小薇技能1（暂时没有动作和特效）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[600110020]; 
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
	return 1,120,600;
end;



--技能[600110021]//////////////小薇技能2//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[600110021]; 
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
	return 10
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


--技能[600110030]//////////////刘雨技能1//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[600110030]; 
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
	return 1,130,600;
end;



--技能[600110031]//////////////刘雨技能2（暂时没有动作和特效）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[600110031]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400,500,600};
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
			dwAttack_mul = 120,				--攻击力系数
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



--技能[600110040]//////////////南筱芸技能1//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[600110040]; 
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



--技能[600110041]//////////////南筱芸技能2（没有动作和特效）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[600110041]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {1400};
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
	return 1,110,600;
end;



--技能[600110050]//////////////戈楠技能1//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[600110050]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {500,600};
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
			dwAttack_mul = 130,				--攻击力系数
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



--技能[600110051]//////////////戈楠技能2//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[600110051]; 
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

------------------杨锋技能1
local Skill = SkillConfig[600110060]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {500,700};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1800;
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

-----------------杨锋技能2
local Skill = SkillConfig[600110061]; 
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
	return 1800;
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

-----------------章博技能1

local Skill = SkillConfig[600110070]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {150,800};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1800;
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
	return 1,140,600;
end;

-----------------章博技能1

local Skill = SkillConfig[600110071]; 
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
	return 1800;
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
	return 1,141,600;
end;
--------------周静恒普通攻击
local Skill = SkillConfig[60011008]; 
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
	return 1800;
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
--------------周静恒技能1

local Skill = SkillConfig[600110080]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {500,1000};
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
	return 1,140,600;
end;

--------------周静恒技能2

local Skill = SkillConfig[600110081]; 
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
	return 1,141,600;
end;

--------------欧雅琪普通攻击
local Skill = SkillConfig[60011009]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {2000};
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
--------------欧雅琪技能1

local Skill = SkillConfig[600110090]; 
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
	return 1,140,600;
end;

--------------欧雅琪技能2

local Skill = SkillConfig[600110091]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {700,1500,2500};
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
	return 1,141,600;
end;

---------------------金钱BOSS
local Skill = SkillConfig[50760004]; 
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
--------------------------技能1
local Skill = SkillConfig[507600040]; 
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
	return 1800;
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
	return 1,110,600;
end;

---------------技能2
local Skill = SkillConfig[507600041]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {200,350,500};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1800;
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
	return 1,140,600;
end;

---------------------经验BOSS
local Skill = SkillConfig[50760005]; 
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

--------------------------技能1
local Skill = SkillConfig[507600050]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {1800};
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
	return 1,140,600;
end;

---------------技能2
local Skill = SkillConfig[507600051]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {500,1400};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1800;
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
	return 1,141,600;
end;

---------------------金钱BOSS
local Skill = SkillConfig[50760006]; 
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
--------------------------技能1
local Skill = SkillConfig[507600060]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {500,900};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1800;
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
	return 1,110,600;
end;

---------------技能2
local Skill = SkillConfig[507600061]; 
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
	return 1,135,600;
end;
---------------技能3
local Skill = SkillConfig[507600062]; 
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
	return 1800;
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
	return 1,133,600;
end;


---------------------石破天
local Skill = SkillConfig[50760020]; 
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
--------------------------技能1
local Skill = SkillConfig[507600200]; 
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
	return 1800;
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
	return 1,135,600;
end;

---------------技能2
local Skill = SkillConfig[507600201]; 
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
	return 1,141,600;
end;

---------------技能3
local Skill = SkillConfig[507600202]; 
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
	return 1,136,600;
end;

---------------技能4
local Skill = SkillConfig[507600203]; 
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
	return 1,144,600;
end;


----------///////////////////////////////////广平禅师////////////////////////////////////
---------------技能1
local Skill = SkillConfig[600110100]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)

	-- local dwPlayerLevel = dwRoleId:GetLevel();
	-- print("cccccccccccc",dwRoleId:GetLevel())
	
	local objMon = sysMonsterSkill:GetMon();
	local dwMonsterLevel = objMon:GetLevel();   --怪物等级
	if not dwMonsterLevel then
		return ;
	end
	sysMonsterSkill:SelfBuff(50600018,dwMonsterLevel);
	
	-- sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)

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

function Skill:SkillMonsterAction()
	return 1,110,600;
end;


---------------技能2
local Skill = SkillConfig[600110101]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400,800,1200,1600,2000};
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

function Skill:SkillMonsterAction()
	return 1,140,600;
end;




----------///////////////////////////////////催命////////////////////////////////////
---------------技能1
local Skill = SkillConfig[600110110]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400,500,1600};
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

function Skill:SkillMonsterAction()
	return 1,110,600;
end;


---------------技能2
local Skill = SkillConfig[600110111]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:SelfBuff(50600019,dwMonsterLevel);
	-- sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
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
	return 1,140,600;
end;

----------///////////////////////////////////任烈山////////////////////////////////////
---------------技能1
local Skill = SkillConfig[600110120]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {500,1000,1800};
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

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

---------------技能2
local Skill = SkillConfig[600110121]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {1700};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 5000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 5
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
	return 1,140,600;
end;

----------///////////////////////////////////宫北烨////////////////////////////////////
---------------技能1 范围buff
local Skill = SkillConfig[600110130]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {500};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:SelfBuff(50600020, 1);
	
	if dwRoleId:GetObjType() == enEntType.eEntType_Pet then
		dwRoleId = dwRoleId:GetOwnerRole();
	end
	
	sysMonsterSkill:AddBuff(dwRoleId,50600021,1,10);
		
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 15000;
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

function Skill:SkillMonsterAction()
	return 1,140,600;
end;

---------------技能2 冲击波
local Skill = SkillConfig[600110131]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300,1300};
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
	return 1,130,600;
end;

----------///////////////////////////////////唐三妹////////////////////////////////////
---------------技能1
local Skill = SkillConfig[600110140]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600,800,1500};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 4000;
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

---------------技能2
local Skill = SkillConfig[600110141]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300,500,800};
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

----------///////////////////////////////////傻姑////////////////////////////////////
---------------技能1
local Skill = SkillConfig[600110150]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {200,400,500};
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

function Skill:SkillMonsterAction()
	return 1,140,600;
end;

---------------技能2
local Skill = SkillConfig[600110151]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {1200};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 4000;
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
	return 1,141,600;
end;

----------///////////////////////////////////双头怪蟒////////////////////////////////////
---------------技能1
local Skill = SkillConfig[200020120]; 
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

--------------秦江普通攻击
local Skill = SkillConfig[50770009]; 
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
--------------秦江技能1

local Skill = SkillConfig[507700090]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {500,1000};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 3100;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 5;
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

--------------秦江技能2

local Skill = SkillConfig[507700091]; 
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
	return 1;
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
	return 1,110,600;
end;

--/////////////////////////////////珍珑棋局 51~100 begin////////////////////////////
--技能[50302051]//////////////朱子柳//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302051]; 
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

--技能[503020510]//////////////朱子柳技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020510]; 
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

--技能[50302052]//////////////张雄//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302052]; 
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

--技能[503020520]//////////////张雄技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020520]; 
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

--技能[50302053]//////////////欧阳锋//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302053]; 
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

--技能[503020530]//////////////欧阳锋技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020530]; 
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

--技能[50302054]//////////////天元//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302054]; 
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

--技能[503020540]//////////////天元技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020540]; 
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

--技能[50302055]//////////////卫天望//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302055]; 
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

--技能[503020550]//////////////卫天望技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020550]; 
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

--技能[50302056]//////////////殷天正//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302056]; 
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

--技能[503020560]//////////////殷天正技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020560]; 
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

--技能[50302057]//////////////方天劳//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302057]; 
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

--技能[503020570]//////////////方天劳技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020570]; 
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

--技能[50302058]//////////////潘天耕//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302058]; 
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

--技能[503020580]//////////////潘天耕技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020580]; 
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

--技能[50302059]//////////////古丽娅//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302059]; 
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

--技能[503020590]//////////////古丽娅技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020590]; 
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

--技能[50302060]//////////////阿古奇//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302060]; 
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

--技能[503020600]//////////////阿古奇技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020600]; 
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

--技能[50302061]//////////////黄蓉//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302061]; 
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

--技能[503020610]//////////////黄蓉技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020610]; 
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

--技能[50302062]//////////////鲁有脚//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302062]; 
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

--技能[503020620]//////////////鲁有脚技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020620]; 
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

--技能[50302063]//////////////金轮法王//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302063]; 
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

--技能[503020630]//////////////金轮法王技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020630]; 
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

--技能[50302064]//////////////曲灵儿//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302064]; 
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

--技能[503020640]//////////////曲灵儿技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020640]; 
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

--技能[50302065]//////////////曲正心//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302065]; 
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

--技能[503020650]//////////////曲正心技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020650]; 
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

--技能[50302066]//////////////谢逊//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302066]; 
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

--技能[503020660]//////////////谢逊技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020660]; 
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

--技能[50302067]//////////////何师我//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302067]; 
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

--技能[503020670]//////////////何师我技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020670]; 
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

--技能[50302068]//////////////潇湘子//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302068]; 
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

--技能[503020680]//////////////潇湘子技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020680]; 
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

--技能[50302069]//////////////尹克西//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302069]; 
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

--技能[503020690]//////////////尹克西技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020690]; 
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

--技能[50302070]//////////////达尔巴//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302070]; 
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

--技能[503020700]//////////////达尔巴技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020700]; 
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

--技能[50302071]//////////////霍都//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302071]; 
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

--技能[503020710]//////////////霍都技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020710]; 
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

--技能[50302072]//////////////李莫愁//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302072]; 
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

--技能[503020720]//////////////李莫愁技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020720]; 
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

--技能[50302073]//////////////尹志平//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302073]; 
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

--技能[503020730]//////////////尹志平技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020730]; 
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

--技能[50302074]//////////////鹿清笃//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302074]; 
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

--技能[503020740]//////////////鹿清笃技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020740]; 
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

--技能[50302075]//////////////李清流//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302075]; 
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

--技能[503020750]//////////////李清流技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020750]; 
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

--技能[50302076]//////////////丘处机//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302076]; 
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

--技能[503020760]//////////////丘处机技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020760]; 
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

--技能[50302077]//////////////武修文//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302077]; 
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

--技能[503020770]//////////////武修文技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020770]; 
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

--技能[50302078]//////////////武敦儒//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302078]; 
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

--技能[503020780]//////////////武敦儒技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020780]; 
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

--技能[50302079]//////////////赵志敬//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302079]; 
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

--技能[503020790]//////////////赵志敬技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020790]; 
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

--技能[50302080]//////////////临尘师太//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302080]; 
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

--技能[503020800]//////////////临尘师太技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020800]; 
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

--技能[50302081]//////////////慧心//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302081]; 
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

--技能[503020810]//////////////慧心技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020810]; 
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

--技能[50302082]//////////////任天阑//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302082]; 
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

--技能[503020820]//////////////任天阑技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020820]; 
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

--技能[50302083]//////////////觉远//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302083]; 
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

--技能[503020830]//////////////觉远技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020830]; 
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

--技能[50302084]//////////////张君宝//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302084]; 
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

--技能[503020840]//////////////张君宝技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020840]; 
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

--技能[50302085]//////////////郭襄//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302085]; 
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

--技能[503020850]//////////////郭襄技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020850]; 
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

--技能[50302086]//////////////风清扬//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302086]; 
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

--技能[503020860]//////////////风清扬技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020860]; 
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

--技能[50302087]//////////////白猿//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302087]; 
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

--技能[503020870]//////////////白猿技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020870]; 
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

--技能[50302088]//////////////何足道//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302088]; 
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

--技能[503020880]//////////////何足道技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020880]; 
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

--技能[50302089]//////////////韦一笑//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302089]; 
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

--技能[503020890]//////////////韦一笑技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020890]; 
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

--技能[50302090]//////////////杨逍//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302090]; 
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

--技能[503020900]//////////////杨逍技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020900]; 
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

--技能[50302091]//////////////杨不悔//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302091]; 
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

--技能[503020910]//////////////杨不悔技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020910]; 
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

--技能[50302092]//////////////霍青桐//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302092]; 
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

--技能[503020920]//////////////霍青桐技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020920]; 
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

--技能[50302093]//////////////龙岛主//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302093]; 
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

--技能[503020930]//////////////龙岛主技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020930]; 
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

--技能[50302094]//////////////张三//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302094]; 
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

--技能[503020940]//////////////张三技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020940]; 
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

--技能[50302095]//////////////李四//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302095]; 
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

--技能[503020950]//////////////李四技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020950]; 
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

--技能[50302096]//////////////阿青//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302096]; 
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

--技能[503020960]//////////////阿青技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020960]; 
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

--技能[50302097]//////////////妙谛大师//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302097]; 
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

--技能[503020970]//////////////妙谛大师技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020970]; 
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

--技能[50302098]//////////////愚茶道长//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302098]; 
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

--技能[503020980]//////////////愚茶道长技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020980]; 
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

--技能[50302099]//////////////石破天//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302099]; 
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

--技能[503020990]//////////////石破天技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503020990]; 
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

--技能[50302100]//////////////木岛主//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[50302100]; 
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

--技能[503021000]//////////////木岛主技能一//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[503021000]; 
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
--/////////////////////////////////珍珑棋局 51~100 end////////////////////////////
