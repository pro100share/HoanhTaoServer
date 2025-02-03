--[[	
	eAT_Role		= 1,	--角色身上，目标写自己
	eAT_Target	= 2,	--打在地面上的一个点
	eAT_Pursue	= 3,	--追踪一个目标，最终命中目标
	eAT_Move		= 4,	--移动到指定点
--]]
--常规
local function RoundFloat(number)
	local qian = toint(number);
	local hou = toint(number * 10 - qian*10);
	if hou == 0 then
		return qian;
	else
		return qian.."."..hou;
	end
end;

--特殊用的
local function RoundFloatSpecial(number)
	local qian = toint(number);
	local hou = toint(number * 100 - qian*100);
	if hou == 0 then
		return qian;
	else
		return qian.."."..hou;
	end
end;


--String：内容、Number：天聪空格后需要达到的字符数【如果换行可理解为一行最多显示的字符数】
local function TipsFillSpace(String,Number)
	local str = '';
	local StringN =_String.len(String,"ascii")
	local Space = Number - StringN
	if Space>0 then
		for i=1,Space do
			str =str.." "
		end
		
		return String..str;
	else
		return String;
	end
	
end;
--公共CD
local dwPublicCoolTime = 500;

local function CountCurCoolTime(dwSpeed,dwBaseCool)
	local fDec = (dwSpeed-300)/10000;
	
	local fResult = dwBaseCool * (1-fDec);
	
	local zhi = tonumber(RoundFloat(fResult))
	
	return zhi;
end;

local function ReleaseKey(dwKey)
	local ty = dwKey%10;
	local id = math.floor(dwKey/10);
	
	return ty,id;
end;

local function ExecMoveActive(dwLength,objRoleSkill,objAtt,objTarget,dwActCount)
	local posSelf = objAtt:GetSystem("CMapSystem"):GetPlayerPos();
	local posTarget = nil;
	local dwType = objTarget:GetObjType();
	if dwType == enEntType.eEntType_Player then
		posTarget = objTarget:GetSystem("CMapSystem"):GetPlayerPos();
	elseif dwType == enEntType.eEntType_Monster then
		--判断怪物是否可以被击退
		if objTarget.DataInfo.shift == 1 then
			return;
		end
		if objMover.DataInfo.dwNoTurn == 1 then
			return;
		end
		
		local _,_x,_y = objTarget:GetPos();
		posTarget = {};
		posTarget.x = _x;
		posTarget.y = _y;
	end
	
	if not posTarget then
		return;
	end
	
	local vecDistance = Vector2.new(posTarget.x-posSelf.x,posTarget.y-posSelf.y);
	--local fLength = vecDistance:magnitude();
	vecDistance:normalize();
	
	local posLast = 
	{
		x = posTarget.x + vecDistance.x * dwLength,
		y = posTarget.y + vecDistance.y * dwLength,
	};
	local tbPosList = {};
	table.insert(tbPosList,posLast);
	
	if dwType == enEntType.eEntType_Player then
		local objSklSystem = objTarget:GetSystem("CSkillSystem");
		if objSklSystem:GetInfo().dwHP > 0 then
			objSklSystem:BroadcastSkillMsg(true,"OnPlaySkillMoveEffectMsg",
			{
				ActionID = 6,
				StartType = 4,
				StartID = objTarget:GetRoleID(),
				PosList = tbPosList,
				Delay = 200,
				Index = 1,
				ShadowID = 0,
				SkillID = objRoleSkill:GetID(),
				ExecTime = objRoleSkill.dwLastExecTime,
				ActCount = dwActCount,
			})
		end
	elseif dwType == enEntType.eEntType_Monster then
		if not objTarget:IsDead() then
			objTarget:CompelMove(7,200,objAtt:GetRoleID(),tbPosList,
				objRoleSkill:GetID(),objRoleSkill.dwLastExecTime,dwActCount);
		end
	end
end;

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
	if objSklSystem:GetInfo().dwHP > 0 then
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
	end
end;

local function AddRoleObjBuff(objRole,dwBuffID,dwLevel,objUser)
	local dwType = objRole:GetObjType();
	
	if dwType == enEntType.eEntType_Player then
		local buffSystem = objRole:GetSystem("CBuffSystem");
		buffSystem:AddBuff(dwBuffID,dwLevel,objUser)
	elseif dwType == enEntType.eEntType_Monster then
		local sysMonsterBuff = objRole:GetSystem("CMonsterBuffSystem")
		
		if (dwBuffID ~= 31005) then
			sysMonsterBuff:AddBuff(dwBuffID,dwLevel,objUser)
		end
	end
end;

--技能[1]//////////////怪物基础攻击调用技能//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[1]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {100};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
	
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}

	return sInfo;
end;


--技能[2]//////////////玩家受击动作播放技能//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[2]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)

end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
	
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}

	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,enActionType.eAT_Role,1001,objTarget,vPos,0);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit,dwExecTime,dwActCount)
	local dwExecSkillID = dwSkillID;
	
	-- if objSelf:GetSystem("CSkillSystem"):GetCurActionInfo().dwActionID then
		-- objSelf:GetSystem("CSkillSystem"):BroadcastSkillMsg(true,"SendPlayPfx",1000,'BeatPoint',
			-- objSelf:GetRoleID(),dwExecSkillID,dwExecTime,dwActCount);
		-- return;
	-- end
	
	--if objSelf:GetSystem("CMapSystem").bMoving then
	
	
	-- objSelf:GetSystem("CSkillSystem"):BroadcastSkillMsg(true,"SendSkillRoleMsg",2,4,
		-- objSelf:GetRoleID(),1,dwExecSkillID,dwExecTime,dwActCount);
	
	-- objSelf:GetSystem("CSkillSystem"):BroadcastSkillMsg(true,"SendPlayPfx",1000,'BeatPoint',
		-- objSelf:GetRoleID(),dwExecSkillID,dwExecTime,dwActCount);
	
	local tbInfo = CHurtInfoNotice:new();
	tbInfo.dwPfxID = 1000;
	tbInfo.szBindPoint = "BeatPoint";
	if dwSkillID ~= 0 then
		--objSelf.objSklPlayer:Add(dwSkillID,dwActCount,3,tbInfo);
		CSkillPlayerManager:Add(objSelf,dwSkillID,dwActCount,3,tbInfo);
	else
		objSelf:GetSystem("CSkillSystem"):BroadcastSkillMsg(true,"OnBeSkillUsedMsg",
		{
			RoleType = enEntType.eEntType_Player;
			RoleID = objSelf:GetRoleID();
			SkillID = 0;
			ExecTime = 0;
			ActCount = 0;
			SkipInfo = {};
			BattleInfo = {};
			ActionInfo = {tbInfo};
		});
	end
end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue,dwActCount)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue,dwActCount)
	return dwCritValue;
end;


--技能[3]//////////////怪物受击动作播放技能//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[3]; 

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--[[local arrSkillPfx =
{
	51001 = 1002,
}]]--
--被技能命中，播放动作
function Skill:EventMonsterHurtP(dwSkillID,objMonster,objEnemy,dwHurtValue,isCrit)

	local vocation_Skill = 
	{
		--萝莉技能
		[1] = 51002;
		[2] = 51003;
		[3] = 51004;
		[4] = 51005;
		--剑技能
		[5] = 21002;
		[6] = 21003;
		[7] = 21004;
		[8] = 21005;
		--刀技能
		[9] = 31002;
		[10] = 31003;
		[11] = 31004;
		[12] = 31005;
		--枪技能
		[13] = 41002;
		[14] = 41003;
		[15] = 41004;
		[16] = 41005;
		
		[17] = 52000;
		[18] = 52001;
	};
	
	--默认的被击
	local pfxid = 1000
	for k,v in pairs(vocation_Skill) do
		if (dwSkillID == v) then
			if (k >= 13) then
				pfxid = 400000;
			elseif (k >= 9) then
				pfxid = 300000;--300000;
			elseif(k >= 5) then
				pfxid = 210040;
			elseif(k <= 4) then
				pfxid = 500000;
			end
		end
	end
	
	if (dwSkillID == 21001) then
		pfxid = 200000;
	end
	
	-- if (dwSkillID == 31001) then
		-- pfxid = 310010
	-- end
	
	--print("dwSkillID	=	"..pfxid)
	
	return pfxid;
end;

--技能[11001]//////////////春回//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[11001]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = 
	{
		200,
	};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)	
	local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	buffSystem:AddBuff(11001, objRoleSkill:GetLevel());
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = math.floor(22 + dwLevel*3),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] ="尚未学习，暂无效果"
	else	
		sInfo.sCurLevelExp[1] ="每秒生命恢复："..RoundFloat(50+(dwLevel-1)*8);
	end;
	sInfo.sNextLevelExp[1] ="每秒生命恢复："..RoundFloat(50+dwLevel*8);
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	local dwCurAction = CSkillAttack.dwCurSkillAction;
	
	CSkillAttack:ExecSkillAction(self,1,11001,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return 10000;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[11002]//////////////自杀//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[11002]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = 
	{
		200,
	};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)	
	local objPlayer = objRoleSkill:GetPlayer(0);
	local SklSystem = objPlayer:GetSystem("CSkillSystem");
	SklSystem:ChgHP(-999999999,false,-1,0);
end


----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] =SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] =SkillStringConfig[267];
	end;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 30000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end

	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	local dwCurAction = CSkillAttack.dwCurSkillAction;
	
	CSkillAttack:ExecSkillAction(self,1,11002,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return 10000;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[11003]//////////////狮子吼//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[11003]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {600};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {700};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
	--[[
	local dwJudge = 40 + objRoleSkill:GetLevel()*0.4;
	local dwRand = math.random(100);
	
	if dwRand < dwJudge then
		AddRoleObjBuff(objTarget,11003,1,objAtt);
	end
	--]]
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
--命中后追加
function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 11003 then
		return;
	end

	
	-- if () then
	
		-- objDefender
	
	-- end
	
	-- local dwJudge = 20 + objRoleSkill:GetLevel()*0.6;
	-- local dwRand = math.random(100);
	
	-- if dwRand < dwJudge then
		-- AddRoleObjBuff(objDefender,11003,1,objAttacker);
	-- end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 20
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 20000;
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(189+dwLevel*(11+dwLevel*0.03)+math.floor(dwLevel/10)*38*math.floor(dwLevel/10)),			--攻击力
			dwAttack_mul = 110+math.floor(dwLevel/10)*2,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 1300,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,11003,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;

--技能[11004]//////////////蛤蟆功//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[11004]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
	
	--objTarget:AddBuff();
--	AddRoleObjBuff(objTarget,11004, objRoleSkill:GetLevel(),objAtt)
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
--命中后追加BUFF
function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 11004 then
		return;
	end
	AddRoleObjBuff(objDefender,11004,1,objAttacker);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 20
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 20000;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = math.floor(22 + dwLevel*3),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)

	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,							--攻击力
			dwAttack_mul = 120+(dwLevel-1)*0.3,		--攻击力系数
			dwExtraAttack = 0,						--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local dwCurAtt = CSkillSystem:GetInfo().dwAttack;
	--local dwBaseAtt = (dwCurAtt*(0.7 + dwLevel*0.0003));
	local dwBaseAtt = (120 + (dwLevel)*0.5);
	local dwBuffAtt = (50+(dwLevel-1)*(12+(dwLevel-2)*0.1858)+dwCurAtt*math.floor((10+(dwLevel-1)*(0.1+(dwLevel-2)*0.01))/100));
	-- local dwBaseNext = (dwCurAtt*(0.7+(dwLevel+1)*0.0003))
	local dwBaseNext = (120 + (dwLevel+1)*0.5)
	local dwBuffNext = (50+dwLevel*(12+(dwLevel-1)*0.1858)+dwCurAtt*math.floor((10+dwLevel*(0.1+(dwLevel-1)*0.01))/100))
	
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = SkillStringConfig[243]
	local szNext = SkillStringConfig[243]
	
	szNow = string.format(szNow,RoundFloat(dwBaseAtt),RoundFloat(dwBuffAtt))
	szNext = string.format(szNext,RoundFloat(dwBaseNext),RoundFloat(dwBuffNext))
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] =SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] =szNow;
	end;
	sInfo.sNextLevelExp[1] =szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,11004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[11005]//////////////七伤拳//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[11005]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {435};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {535};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 80 + dwLevel*3,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local SklSystem = objSelf:GetSystem("CSkillSystem",0);
	local dwAttackPlus = SklSystem:GetInfo().dwHP*0.25*((100+dwLevel*1.5)/100);
	--print("dwAttackPlus: "..dwAttackPlus);
	local Properties = {		
		--主动使用时附加属性
		Active={
			dwAttack = 0,							--攻击力
			dwAttack_mul = 100 + dwLevel*1.5,		--攻击力系数
			dwExtraAttack = dwAttackPlus,			--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] ="尚未学习，暂无效果"
	else
		sInfo.sCurLevelExp[1] ="攻击力"..RoundFloat(100 + 1.5*dwLevel).."% + "..RoundFloat(CSkillSystem:GetInfo().dwHP*0.25*((100+dwLevel*1.5)/100));
	end;
	sInfo.sNextLevelExp[1] ="攻击力"..RoundFloat(100 + 1.5*(dwLevel+1)).."% + "..RoundFloat(CSkillSystem:GetInfo().dwHP*0.25*((100+(dwLevel+1)*1.5)/100));
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,11005,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[11006]//////////////黯然销魂掌//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[11006]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {1125};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {1225};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = math.floor(22 + dwLevel*3),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local SklSystem = objSelf:GetSystem("CSkillSystem",0);
	local dwAttackPlus = (SklSystem:GetInfo().dwHPMax - SklSystem:GetInfo().dwHP)*(0.3 + 0.007*dwLevel);
--	print("dwAttackPlus: "..dwAttackPlus);
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = dwAttackPlus,			--攻击力
			dwAttack_mul = 100 + dwLevel*1.5,	--攻击力系数
			dwExtraAttack = 0,					--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local dwHPDes = CSkillSystem:GetInfo().dwHPMax - CSkillSystem:GetInfo().dwHP;

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] ="尚未学习，暂无效果"
	else	
		sInfo.sCurLevelExp[1] ="攻击力"..RoundFloat(100 + 1.5*dwLevel).."% + "..RoundFloat(dwHPDes*(0.3+0.007*dwLevel));
	end;
	sInfo.sNextLevelExp[1] ="攻击力"..RoundFloat(100 + 1.5*(dwLevel+1)).."% + "..RoundFloat(dwHPDes*(0.3+0.007*(dwLevel+1)));
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,11006,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[11007]//////////////六脉神剑//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[11007]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {100,300,550};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {200,400,650};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventDamageChange(objRoleSkill,objSelf,objEnemy,dwSkillID,dwSkillLevel,Value,isCrit)
	if dwSkillID ~= 11007 then
		return Value;
	end
	local fAdd = 0;
	local fAddEx = 0;
	if not CConfig.bIsCrossSvr then
		local objPulseSys = objRoleSkill:GetPlayerSystem("CPulseSystem",0);
		fAdd = objPulseSys.dwPulseFullNumOld * 0.02
		if PulseExConfig.StrConfig2.SixSwordHeadflg then
			fAddEx = objPulseSys.dwPulseFullNum * 0.02;
		end
	end;
	local dwResult = Value * (1+fAdd+fAddEx);
	
	return dwResult;
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 20000;
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = math.floor(22 + dwLevel*3),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(139+dwLevel*(11+dwLevel*0.03)+math.floor(dwLevel/10)*33*math.floor(dwLevel/10)),											--攻击力
			dwAttack_mul = 80+math.floor(dwLevel/10)*2,					--攻击力系数
			dwExtraAttack = 0,										--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}	
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 1000,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,3,11007,objTarget,vPos,200,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[11008]//////////////吸星大法//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[11008]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 11008 then
		return;
	end
	
	-- local dwType = objDefender:GetObjType();
	-- if dwType == enEntType.eEntType_Monster then
		-- --判断怪物是否可以被击退
		-- if objDefender.DataInfo.shift == 1 then
			-- return;
		-- end
	-- end
	
	-- local dwCurLevel = objRoleSkill:GetLevel();
	-- local dwJudge = dwCurLevel*0.6 + 20;
	
	-- local dwRand = math.random(100);
	
	-- if dwRand <= dwJudge then
		-- local posSelf = objAttacker:GetSystem("CMapSystem"):GetPlayerPos();
		-- local posLast = 
		-- {
			-- x = posSelf.x,
			-- y = posSelf.y,
		-- };
		-- local tbPosList = {};
		-- table.insert(tbPosList,posLast);
		
		-- if dwType == enEntType.eEntType_Player then 
			-- local objSklSystem = objDefender:GetSystem("CSkillSystem");
			-- if objSklSystem:GetInfo().dwHP > 0 then
				-- objSklSystem:BroadcastSkillMsg(true,"SendSkillMoveMsg",
					-- 6,4,objDefender:GetRoleID(),tbPosList,200,1,nil,
					-- objRoleSkill:GetID(),objRoleSkill.dwLastExecTime,dwActCount);
			-- end
		-- elseif dwType == enEntType.eEntType_Monster then
			-- if not objDefender:IsDead() then
				-- objDefender:CompelMove(7,200,objAttacker:GetRoleID(),tbPosList,
					-- objRoleSkill:GetID(),objRoleSkill.dwLastExecTime,dwActCount);
				-- objDefender:GetSystem("CMonsterMoveSystem"):SetPos(posLast.x,posLast.y);
			-- end
		-- end
	
		-- --objDefender:AddBuff();
		-- AddRoleObjBuff(objDefender,610002,1,objAttacker);
	-- end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 20
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 20000;
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(189+dwLevel*(11+dwLevel*0.03)+math.floor(dwLevel/10)*38*math.floor(dwLevel/10)),			--攻击力
			dwAttack_mul = 110+math.floor(dwLevel/10)*2.5,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,11008,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[11009]//////////////降龙十八掌//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[11009]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 11009 then
		return;
	end
	
	-- local dwCurLevel = objRoleSkill:GetLevel();
	-- local dwJudge = dwCurLevel*0.6 + 20;
	
	-- local dwRand = math.random(100);
	
	-- if dwRand <= dwJudge then
		-- ExecMoveActive(6,objUsedSkill,objAttacker,objDefender,dwActCount);
		-- --objDefender:AddBuff();
		-- AddRoleObjBuff(objDefender,610002,1,objAttacker);
	-- end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 20
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 20000;
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(189+dwLevel*(11+dwLevel*0.03)+math.floor(dwLevel/10)*38*math.floor(dwLevel/10)),			--攻击力
			dwAttack_mul = 115+math.floor(dwLevel/10)*2,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,11009,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;

--技能[11010]//////////////大力金刚掌//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[11010]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {150};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {250};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 30000;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	sInfo.sCurLevelExp[1] ="攻击力 * 120%";
	sInfo.sNextLevelExp[1] ="攻击力 * 120%";
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,11010,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[11011]//////////////化骨绵掌//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[11011]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
	
	--objTarget:AddBuff(,1);
--	AddRoleObjBuff(objTarget,11011,1,objAtt);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end


function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 11011 then
		return;
	end
	
	local dwCurLevel = objRoleSkill:GetLevel();
	local dwJudge = dwCurLevel*0.6 + 20;
	
	local dwRand = math.random(100);
	if dwRand <= dwJudge then
		AddRoleObjBuff(objDefender,11011,1,objAttacker);
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 20
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 20000;
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = math.floor(22 + dwLevel*3),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 120+(dwLevel-1)*0.3,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[242],RoundFloat(infonow.Active.dwAttack_mul));
	local szNext = string.format(SkillStringConfig[242],RoundFloat(infonext.Active.dwAttack_mul));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,11011,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;

--技能[11012]//////////////一阳指//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[11012]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {300};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1200;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local fCost = tbRoleInfo.dwMPMax * 0.05;
	
	local Consumption = {
			hp = 0,
			mp = math.floor(20 + (dwLevel-1)*5 + fCost),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,														--攻击力
			dwAttack_mul = 100+(dwLevel-1)*0.3,								--攻击力系数
			dwExtraAttack = 0,													--特殊额外攻击力
		},
		
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[242],RoundFloat(infonow.Active.dwAttack_mul));
	local szNext = string.format(SkillStringConfig[242],RoundFloat(infonext.Active.dwAttack_mul));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 500,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 600,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,3,11012,objTarget,vPos,250,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;

--技能[11013]/////////////平滑//////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[11013]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = nil;
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {0};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)

	local dwCurLevel = objRoleSkill:GetLevel();

	local objSelf = objRoleSkill:GetPlayer();
	if objSelf then
		objSelf:GetSystem("CBuffSystem"):AddBuff(11013,dwCurLevel,objSelf);
	end
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 2500 - (dwLevel * 10);
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(tbRoleInfo.dwMPMax * 0.05),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end
--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,					--攻击力
			dwAttack_mul = 0,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = SkillStringConfig[265]
	local szNext = nil;
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;	
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	--local objRoleSkill = CSkillSystem.setAllSkillInfo[11013];
	local fTime = 200;--objRoleSkill.fActionPlayTime;
	
	-- if not fTime then
		-- fTime = 600;
	-- end
	
	local sInfo = 
	{
		dwRest = 0,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 700,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	local vSelf = objSelf:GetAvatar():GetPos();
	local fAngle = objSelf:GetDirValue();
	
	local vecDir = _Vector3.new(vPos.x - vSelf.x, vPos.y - vSelf.y,0);
	vecDir:normalize();
	
	local mat = _Matrix3D.new();
	mat:identity();
	mat:setRotationZ(fAngle);
	
	local vecB = _Vector3.new(0,-1,0);
	vecB = mat:apply(vecB);
	vecB:normalize();
	
	local fCosValue = _Vector3.dot(vecDir,vecB);
	
	local act = 11014;
	if fCosValue < 0 then
		act = 11015;
	end
	
	-- CSkillAttack:ExecSkillAction(self,4,act,objTarget,vPos,600,true,11013);
	
	CSkillAttack.tbSkillActionInfo = {};
	CSkillAttack.tbSkillActionInfo.ActionType = 4;
	CSkillAttack.tbSkillActionInfo.ActionID = act;
	CSkillAttack.tbSkillActionInfo.Delay = 600;
	CSkillAttack.tbSkillActionInfo.PosList = {vPos};
	CSkillAttack.tbSkillActionInfo.TargetList = {};
	CSkillAttack.tbSkillActionInfo.Index = 0;
	CSkillAttack.tbSkillActionInfo.ShadowID = 11013;
	CSkillAttack.tbSkillActionInfo.XPos = vSelf.x;
	CSkillAttack.tbSkillActionInfo.YPos = vSelf.y;
	CSkillAttack.tbSkillActionInfo.DirValue = fAngle;
	
	if objSelf:GetAvatar().dwLastMoveTime ~= 0 then
		CPlayerControl:MoveStop();
	end
	
	return 1;
end;

--技能[11015]/////////////跳跃//////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[11015]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = nil;
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {0};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objSelf = objRoleSkill:GetPlayer();
	if objSelf then
		objSelf:GetSystem("CBuffSystem"):AddBuff(11013,1,objSelf);
	end
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 2000;
	
	--dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(tbRoleInfo.dwMPMax * 0.1),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end
--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,					--攻击力
			dwAttack_mul = 0,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = SkillStringConfig[266];
	local szNext = nil;
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 2000;
	
	local objRoleSkill = CSkillSystem.setAllSkillInfo[11015];
	local fTime = objRoleSkill.fActionPlayTime;
	
	if not fTime then
		fTime = 600;
	end
	
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = fTime+300,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = fTime+350,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	local objRoleSkill = CSkillSystem.setAllSkillInfo[11015];
	
	local vSelf = objSelf:GetAvatar():GetPos();
	
	local fLength = math.sqrt((vSelf.x - vPos.x)^2 + (vSelf.y - vPos.y)^2);
	
	local fSpeed = CSkillSystem:GetInfo().dwMoveSpeed * 1.0/100;
	
	local fTime = fLength/fSpeed;
	fTime = math.max(fTime,0.6);
	fTime = math.min(fTime,0.9);
	
	fTime = fTime * 1000;
	objRoleSkill.fActionPlayTime = fTime;
	
	CSkillAttack:ExecSkillAction(self,4,11013,objTarget,vPos,fTime,true,11015);
end;




--技能[11013]///////////////////弹指神通//////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[11017]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 15
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 2000;
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;	
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(10+(dwLevel-1)*(0.3+(dwLevel-2)*0.0035)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end
--获取技能附加的属性（表）： dwTargetType: 1 	玩家
function Skill:GetPropertiesAdd(dwLevel,objSel怪物，2f,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(89+dwLevel*(11+dwLevel*0.03)+math.floor(dwLevel/10)*33*math.floor(dwLevel/10)),					--攻击力
			dwAttack_mul = 100+math.floor(dwLevel/10)*1.5,	--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 10000;
	
	dwResult = dwResult + 800 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,3,11017,objTarget,vPos,200,true,11017);
end;




















--技能[12001]//////////////攻击内功//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[12001]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	buffSystem:AddBuff(12001,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	buffSystem:DeleteBuffByID(12001);

end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 500
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local dwCurAtt = 5*dwLevel + (0.049 + 0.001*dwLevel) * CSkillSystem:GetInfo().dwAttack;
	local dwNwxtAtt = 5*(dwLevel+1) + (0.049 + 0.001*(dwLevel+1)) * CSkillSystem:GetInfo().dwAttack;
	
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[251],RoundFloat(dwCurAtt));
	local szNext = string.format(SkillStringConfig[251],RoundFloat(dwNwxtAtt));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,12001,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[12002]//////////////太极神功//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[12002]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	buffSystem:AddBuff(12002,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	buffSystem:DeleteBuffByID(12002);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 500
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local dwNow = 5 + (dwLevel-1)*0.45;
	local dwNext = 5 + dwLevel*0.45;
	
	local szNow = string.format(SkillStringConfig[245],RoundFloat(dwNow))
	local szNext = string.format(SkillStringConfig[245],RoundFloat(dwNext))
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,12002,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;

--技能[12003]//////////////凌波微步//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[12003]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	buffSystem:AddBuff(12003,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	buffSystem:DeleteBuffByID(12003);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 500
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[246],RoundFloat(20+(dwLevel-1)*1))
	local szNext = string.format(SkillStringConfig[246],RoundFloat(20+dwLevel*1))
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,12003,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[12004]//////////////九阴真经//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[12004]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 500
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	
	local szNow = string.format(SkillStringConfig[247],RoundFloat(math.floor(50 +(dwLevel-1)*(1+(dwLevel-2)*0.1908))),RoundFloat(10+(dwLevel-1)*0.4));
	local szNext = string.format(SkillStringConfig[247],RoundFloat(math.floor(50 + dwLevel*(1+(dwLevel-1)*0.1908))),RoundFloat(10+dwLevel*0.4));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[13008]//////////////13008//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13008]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	--[[
	---添加buff
	local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
	--]]
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	-- --删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[255],RoundFloat(dwLevel*1.5));
	local szNext = string.format(SkillStringConfig[255],RoundFloat((dwLevel+1)*1.5));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[13009]//////////////菩提心经//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13009]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[256],RoundFloat(dwLevel*1.5));
	local szNext = string.format(SkillStringConfig[256],RoundFloat((dwLevel+1)*1.5));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[13010]////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13010]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[257],RoundFloat(dwLevel*1.5));
	local szNext = string.format(SkillStringConfig[257],RoundFloat((dwLevel+1)*1.5));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[13010]//////////////九阴真经//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13011]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[258],RoundFloat(dwLevel*1.5));
	local szNext = string.format(SkillStringConfig[258],RoundFloat((dwLevel+1)*1.5));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[13011]//////////////九阴真经//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13012]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[259],RoundFloat(dwLevel*1.5));
	local szNext = string.format(SkillStringConfig[259],RoundFloat((dwLevel+1)*1.5));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;

--技能[13013]////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13013]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[260],RoundFloat(dwLevel*1.5));
	local szNext = string.format(SkillStringConfig[260],RoundFloat((dwLevel+1)*1.5));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[13014]////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13014]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[261],RoundFloat(dwLevel*1.5));
	local szNext = string.format(SkillStringConfig[261],RoundFloat((dwLevel+1)*1.5));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[13015]////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13015]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[262],RoundFloat(dwLevel*1.5));
	local szNext = string.format(SkillStringConfig[262],RoundFloat((dwLevel+1)*1.5));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[13016]////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13016]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[263],RoundFloat(dwLevel*1.5));
	local szNext = string.format(SkillStringConfig[263],RoundFloat((dwLevel+1)*1.5));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[13017]////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13017]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[264],RoundFloat(dwLevel*1.5));
	local szNext = string.format(SkillStringConfig[264],RoundFloat((dwLevel+1)*1.5));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[13018]////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13018]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = SkillStringConfig[286]
	local szNext = nil
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;

--技能[13019]////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13019]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[264],RoundFloat(dwLevel*2));
	local szNext = string.format(SkillStringConfig[264],RoundFloat((dwLevel+1)*2));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[13020]////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13020]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = SkillStringConfig[288]
	local szNext = nil;
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;

--技能[13021]////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13021]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = SkillStringConfig[283]
	local szNext = nil
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;

--技能[13022]////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13022]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = SkillStringConfig[285]
	local szNext = nil
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;

--技能[13023]////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13023]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = SkillStringConfig[281]
	local szNext = nil
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;

--技能[13024]////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13024]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = SkillStringConfig[287]
	local szNext = nil
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;

--技能[13025]////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13025]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = SkillStringConfig[282]
	local szNext = nil
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[13026]////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13026]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = SkillStringConfig[284]
	local szNext = nil
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;

--技能[13026]////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13027]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = SkillStringConfig[289]
	local szNext = nil
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[13026]////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[13028]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:AddBuff(12004,objRoleSkill:GetLevel());
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
	-- buffSystem:DeleteBuffByID(12004);
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = SkillStringConfig[290]
	local szNext = nil
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else	
		sInfo.sCurLevelExp[1] = szNow
		
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,1,12004,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--【【【【【【【【【【【【【【【【【【【【公共技能——心法】】】】】】】】】】】】】】】】】】】】】】】】



--技能[13001]:生命值上限增加////////////////////////////////////////////////////////////////////////////////////
local Skill = SkillConfig[13001]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {100};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)

end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)
	local dwNowLevel = objRoleSkill:GetLevel();
	local objSklSystem = objRoleSkill:GetPlayerSystem("CSkillSystem",0);	
	
	objSklSystem:NotifySkillUpdate(13001,{dwHPMax = math.floor((15+(dwNowLevel-1)*(15+(dwNowLevel-2)*0.3093)))});
end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 0
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[248],RoundFloat(math.floor(15+(dwLevel-1)*(15+(dwLevel-2)*0.3093))))
	local szNext = string.format(SkillStringConfig[248],RoundFloat(math.floor(15+dwLevel*(15+((dwLevel-1)*0.3093)))))
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

--技能[13002]：内力值上限增加////////////////////////////////////////////////////////////////////////////////////
local Skill = SkillConfig[13002]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {100};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)

end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)	
	local dwNowLevel = objRoleSkill:GetLevel();
	local objSklSystem = objRoleSkill:GetPlayerSystem("CSkillSystem",0);	
	
	objSklSystem:NotifySkillUpdate(13002,{dwMPMax = math.floor((7+(dwNowLevel-1)*(7+(dwNowLevel-2)*0.031)))});
end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 0
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[249],RoundFloat(math.floor(7+(dwLevel-1)*(7+(dwLevel-2)*0.031))))
	local szNext = string.format(SkillStringConfig[249],RoundFloat(math.floor(7+dwLevel*(7+(dwLevel-1)*0.031))))
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

--技能[13003]：防御力增加////////////////////////////////////////////////////////////////////////////////////
local Skill = SkillConfig[13003]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)

end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)
	local objSklSystem = objRoleSkill:GetPlayerSystem("CSkillSystem",0);	
	local dwNowLevel = objRoleSkill:GetLevel();

	objSklSystem:NotifySkillUpdate(13003,{dwDefense = math.floor((3+(dwNowLevel-1)*(3+(dwNowLevel-2)*0.0825)))});
end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 0
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
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


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[250],RoundFloat(math.floor(3+(dwLevel-1)*(3+(dwLevel-2)*0.0825))))
	local szNext = string.format(SkillStringConfig[250],RoundFloat(math.floor(3+dwLevel*(3+(dwLevel-1)*0.0825))))
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

--技能[13004]：攻击力上限增加////////////////////////////////////////////////////////////////////////////////////
local Skill = SkillConfig[13004]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)

end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)
	local objSklSystem = objRoleSkill:GetPlayerSystem("CSkillSystem",0);
	local dwNowLevel = objRoleSkill:GetLevel();
	
	objSklSystem:NotifySkillUpdate(13004,{dwAttack = math.floor((5+(dwNowLevel-1)*(5+(dwNowLevel-2)*0.0825)))});
	
end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 0
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[251],RoundFloat(math.floor(5+(dwLevel-1)*(5+(dwLevel-2)*0.0825))))
	local szNext = string.format(SkillStringConfig[251],RoundFloat(math.floor(5+dwLevel*(5+(dwLevel-1)*0.0825))))
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

--技能[13005]：身法值增加////////////////////////////////////////////////////////////////////////////////////
local Skill = SkillConfig[13005]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)

end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)
	local dwNowLevel = objRoleSkill:GetLevel();
	local objSklSystem = objRoleSkill:GetPlayerSystem("CSkillSystem",0);	
	
	objSklSystem:NotifySkillUpdate(13005,{dwFlee = math.floor((6+(dwNowLevel-1)*(6+(dwNowLevel-2)*0.1134)))});
end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 0
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[252],RoundFloat(math.floor(6+(dwLevel-1)*(6+(dwLevel-2)*0.1134))))
	local szNext = string.format(SkillStringConfig[252],RoundFloat(math.floor(6+dwLevel*(6+(dwLevel-1)*0.1134))))
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;


--技能[13006]：暴击值增加////////////////////////////////////////////////////////////////////////////////////
local Skill = SkillConfig[13006]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)

end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)
	local dwNowLevel = objRoleSkill:GetLevel();
	local objSklSystem = objRoleSkill:GetPlayerSystem("CSkillSystem",0);	
	
	objSklSystem:NotifySkillUpdate(13006,{dwCrit = math.floor((3+(dwNowLevel-1)*(3+(dwNowLevel-2)*0.0928)))});
end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 0
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[253],RoundFloat(math.floor(3+(dwLevel-1)*(3+(dwLevel-2)*0.0928))))
	local szNext = string.format(SkillStringConfig[253],RoundFloat(math.floor(3+dwLevel*(3+(dwLevel-1)*0.0928))))
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;



--技能[13007]：收到暴击伤害减少////////////////////////////////////////////////////////////////////////////////////
local Skill = SkillConfig[13007]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)

end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventReadyHurtP(objCurSkill,objSelf,objEnemy,dwSkillID,dwSkillLevel,Value,isCrit)
	local dwLevel = objCurSkill:GetLevel();
	local dwValue = Value;
	if isCrit then
		dwValue = dwValue*(1-(5+(dwLevel-1)*0.25)/100);
	end;
	return dwValue;
end;

---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 0
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[254],RoundFloat(5+(dwLevel-1)*0.25))
	local szNext = string.format(SkillStringConfig[254],RoundFloat(5+dwLevel*0.25))
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;


--技能[21000]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[21000]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {140};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {240};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1200;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,						--攻击力
			dwAttack_mul = 100,					--攻击力系数
			dwExtraAttack = 0,					--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = string.format(SkillStringConfig[242],100)
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 400 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,2,21000,objTarget,vPos,0,true);
end;



--技能[21001]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[21001]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {290};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {250};
	return sInfo;
end;

----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1500;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(8+(dwLevel-1)*(0.3+(dwLevel-2)*0.005)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(4+dwLevel*(8+dwLevel*0.03)+math.floor(dwLevel/10)*28*math.floor(dwLevel/10)),--math.floor(5 + (dwLevel-1) * ( 1 + (dwLevel-2)*0.1) ),			--攻击力
			                     
			dwAttack_mul = 100+math.floor(dwLevel/10)*1,	
			
			--攻击力系数
			dwExtraAttack = 0,																--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	-- local szNow = string.format(SkillStringConfig[242],RoundFloat(infonow.Active.dwAttack_mul));
	-- local szNext = string.format(SkillStringConfig[242],RoundFloat(infonext.Active.dwAttack_mul));
	
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 900 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,21001,objSelf,vPos,0,true);
end;




--技能[21002]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[21002]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {250};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {350};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 4500;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
	
	
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(20+(dwLevel-1)*(0.25+(dwLevel-2)*0.003)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack =0, --math.floor(20 + (dwLevel-1)*(2 + (dwLevel-2)*0.14)),		--攻击力
			dwAttack_mul = 135 + (dwLevel-1)*0.5,									--攻击力系数
			dwExtraAttack = 0,													--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 4100;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,21002,objSelf,vPos,0,true);
end;



--技能[21003]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[21003]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {250};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {350};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 4500;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = math.floor(20+(dwLevel-1)*(0.35+(dwLevel-2)*0.005)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(5+dwLevel*(10+dwLevel*0.03)+math.floor(dwLevel/10)*30*math.floor(dwLevel/10)),--math.floor(30 + (dwLevel-1)*(3 + (dwLevel-2)*0.16)),			--攻击力
			dwAttack_mul = 100+math.floor(dwLevel/10)*1.5,
			--攻击力系数
			dwExtraAttack = 0,												--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 500,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,21003,objSelf,vPos,0,true);
end;



--技能[21004]/自身扇形///////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[21004]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {450};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
	
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 2500;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(12+(dwLevel-1)*(0.3+(dwLevel-2)*0.005)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack =math.floor(4+dwLevel*(9+dwLevel*0.03)+math.floor(dwLevel/10)*29*math.floor(dwLevel/10)), --math.floor(10 + (dwLevel-1)*(1.5 + (dwLevel-2)*0.12)),	--攻击力
			dwAttack_mul = 100+math.floor(dwLevel/10)*1.3,								--攻击力系数
			dwExtraAttack = 0,												--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 2000;
	
	dwResult = dwResult + 900 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 35,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 500,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,21004,objSelf,vPos,0,true);
end;




-- --技能[21005]////目标范围//////////////////////////////////////////////////////////////////////////////

-- local Skill = SkillConfig[21005]; 
-- --获取技能的执行时间点
-- function Skill:GetExecTimeArray(objRoleSkill)
	-- local sInfo = {500};
	-- return sInfo;
-- end;

-- function Skill:GetClientTimeArray()
	-- local sInfo = {550};
	-- return sInfo;
-- end;
-- ----------------------------------------------------------------------------------------------
-- ----------【技能的效果】
-- ---------------------------------------------------------------------------------------------- 
-- --技能主动效果
-- function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		-- local objAtt = objRoleSkill:GetPlayer(0);
		-- objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
-- end

-- --技能被动效果
-- function Skill:SkillPassiveEffect(objRoleSkill)

-- end

-- --技能激活效果
-- function Skill:SkillOpenEffect(objRoleSkill)
  
-- end

-- --技能关闭效果
-- function Skill:SkillCloseEffect(objRoleSkill)
    
-- end

-- -----------------------【获取技能属性】
-- --获得技能的目标数量
-- function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	-- return 10
-- end

-- --获取吟唱时间(毫秒)
-- function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	-- return 1000
-- end

-- --获取冷却时间（毫秒）
-- function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	-- local dwResult = 15000;
	
	-- dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	-- if dwResult < dwPublicCoolTime then
		-- dwResult = dwPublicCoolTime;
	-- end
	
	-- return dwResult;
-- end

-- --获取升级所需熟练度
-- function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	-- return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
-- end

-- --获取施放消耗（表）
-- function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	-- local Consumption = {
			-- hp = 0,
			-- mp = math.floor(45+(dwLevel-1)*(0.5+(dwLevel-2)*0.005)),
			-- item = {{id=0,num=0},{id=0,num=0}},
			-- wxd = 0,	--五行仅能点
		-- }
		
	-- return Consumption
-- end
-- --获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
-- function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	-- local Properties = {
		-- --主动使用时附加属性
		-- Active={
			-- dwAttack = math.floor(86+dwLevel*(14+dwLevel*0.03)+math.floor(dwLevel/10)*41*math.floor(dwLevel/10)),--math.floor(100 + (dwLevel-1)*(4 + (dwLevel-2)*0.22)),			--攻击力
			-- dwAttack_mul = 100+math.floor(dwLevel/10)*2,											--攻击力系数
			-- dwExtraAttack = 0,															--特殊额外攻击力
		-- },
		-- --被动附加属性
		-- Passive={
		-- },
		-- szInfo = "说明"
	-- }
	-- return Properties;
-- end


-- function Skill:GetSkillExplain(dwRoleID,dwLevel)
	-- local sInfo = 
	-- {
		-- sCurLevelExp ={},
		-- sNextLevelExp = {};
	-- }
	-- local infonow = self:GetPropertiesAdd(dwLevel);
	-- local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	-- local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	-- local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	-- if dwLevel == 0 then
		-- sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	-- else
		-- sInfo.sCurLevelExp[1] = szNow;
	-- end;
	-- sInfo.sNextLevelExp[1] = szNext;
	-- return sInfo;
-- end;

-- --技能的相关事件
-- function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	-- local dwResult = 3000;
	
	-- dwResult = dwResult + 800 - dwAttackSpeed ;
	-- if dwResult < 600 then
		-- dwResult = 600;
	-- end
	-- local sInfo = 
	-- {
		-- dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		-- dwStone = 1100,	--硬直时间，这段时间内不可以播放其他动作
		-- dwUsed = 1150,	--技能使用时间，有条件播放动作
		-- dwAuto = dwResult,	--自动攻击的再使用时间
	-- }
	
	-- return sInfo;
-- end;

-- ----------------------------------------------------------------------------------------------
-- ----------------------【技能执行事件】
-- ---------------------------------------------------------------------------------------------- 
-- --技能成功释放，播放动作，客户端调用
-- function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,4,21005,objTarget,vPos,800,true,21005);
-- end;







--技能[21005]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[21005]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {650};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {350};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
		local dwRand = math.random(10000);
		if (dwRand < 8000) then
			AddRoleObjBuff(objTarget,21005,1,objAtt);
		end
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 13000;
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = math.floor(45+(dwLevel-1)*(0.5+(dwLevel-2)*0.005)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(86+dwLevel*(14+dwLevel*0.03)+math.floor(dwLevel/10)*41*math.floor(dwLevel/10)),--math.floor(100 + (dwLevel-1)*(4 + (dwLevel-2)*0.22)),			--攻击力
			
			dwAttack_mul = 100+math.floor(dwLevel/10)*2,											--攻击力系数
			dwExtraAttack = 0,															--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 3000;

	
	dwResult = dwResult + 800 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 1100,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 1150,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,2,21005,objSelf,vPos,0,true);
end;



--技能[21006]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[21006]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300,550,650};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400,650,750};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
		-- local skillLv = objRoleSkill:GetLevel();
		local dwRand = math.random(10000);
		if (dwRand < 8000) then
			AddRoleObjBuff(objTarget,21006,3,objAtt);
		end
		
		-- local buffSystem = objRoleSkill:GetPlayerSystem("CBuffSystem", 0)
		-- buffSystem:AddBuff(11001, objRoleSkill:GetLevel());
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 20
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 15000;
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))*5
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = math.floor(50+(dwLevel-1)*(1+(dwLevel-2)*0.05)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(1000+dwLevel*(50+dwLevel*0.05)+math.floor(dwLevel/10)*100*math.floor(dwLevel/10)),--math.floor(100 + (dwLevel-1)*(4 + (dwLevel-2)*0.22)),			--攻击力
			
			dwAttack_mul = 125+math.floor(dwLevel/10)*2,											--攻击力系数
			dwExtraAttack = 0,															--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

-- local Jilv = {
	-- [1] = 1,[2] = 2,[3] = 3,[4] = 4,[5] = 5,
	-- [6] = 6,[7] = 7,[8] = 8,[9] = 9,[10] = 10,
	-- [11] = 11,[12] = 12,[13] = 13,[14] = 14,[15] = 15,
	-- [16] = 16,[17] = 17,[18] = 18,[19] = 19,[20] = 20,
	-- [21] = 21,[22] = 22,[23] = 23,[24] = 24,[25] = 25,
	-- [26] = 26,[27] = 27,[28] = 28,[29] = 29,[30] = 30,
	-- [31] = 31,[32] = 32,[33] = 33,[34] = 34,[35] = 35,
	-- [36] = 36,[37] = 37,[38] = 38,[39] = 39,[40] = 40,
	-- [41] = 41,[42] = 42,[43] = 43,[44] = 44,[45] = 45,
	-- [46] = 46,[47] = 47,[48] = 48,[49] = 49,[50] = 50,
	-- [51] = 51,[52] = 52,[53] = 53,[54] = 54,[55] = 55,
	-- [56] = 56,[57] = 57,[58] = 58,[59] = 59,[60] = 60,
-- };

-- local function GetJilv(dwLevel)
	-- local value =  math.floor(Jilv[dwLevel]);
	-- local s = "%"
	-- local FinalValue = value .. s;
	-- return FinalValue
-- end

function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);

	-- local CurLvJilv = GetJilv(dwLevel);
	-- local NexLvJilv = GetJilv(dwLevel+1);
	
	-- local szNow = string.format(SkillStringConfig[308],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack),CurLvJilv);
	-- local szNext = string.format(SkillStringConfig[308],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack),NexLvJilv);

	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 3000;

	
	dwResult = dwResult + 800 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 1100,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 1150,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,21006,objSelf,vPos,0,true);
end;



















--【【【【【【【【【【【【【【【【【【【【刀技能】】】】】】】】】】】】】】】】】】】】】】】】

--技能[31000]【刀普通攻击】////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[31000]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {250};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {360};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1200;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = string.format(SkillStringConfig[242],100)
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 400 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,31000,objSelf,vPos,0,true);
end;



--技能[31001]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[31001]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {270};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {370};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1500;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(8+(dwLevel-1)*(0.3+(dwLevel-2)*0.005)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(4+dwLevel*(8+dwLevel*0.03)+math.floor(dwLevel/10)*28*math.floor(dwLevel/10)),--攻击力
			dwAttack_mul = 100+math.floor(dwLevel/10)*1,									--攻击力系数
			dwExtraAttack = 0,															--特殊额外攻击力
		},
		
		
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	--local szNow = string.format(SkillStringConfig[242],RoundFloat(infonow.Active.dwAttack_mul));
	--local szNext = string.format(SkillStringConfig[242],RoundFloat(infonext.Active.dwAttack_mul));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 900 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,31001,objSelf,vPos,200,true);
end;




--技能[31002]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[31002]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {335};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {435};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 4500;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(20+(dwLevel-1)*(0.25+(dwLevel-2)*0.003)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack =0, --math.floor(20 + (dwLevel-1)*(2 + (dwLevel-2)*0.14)),		--攻击力
			dwAttack_mul = 125 + (dwLevel-1)*0.5,									--攻击力系数
			dwExtraAttack = 0,													--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	-- local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	-- local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	local szNow = string.format(SkillStringConfig[242],RoundFloat(infonow.Active.dwAttack_mul));
	local szNext = string.format(SkillStringConfig[242],RoundFloat(infonext.Active.dwAttack_mul));
	
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,31002,objSelf,vPos,200,true);
end;




--技能[31003]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[31003]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {510};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {610};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objAtt = objRoleSkill:GetPlayer(0);
	
	objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 4500;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = math.floor(20+(dwLevel-1)*(0.35+(dwLevel-2)*0.005)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(5+dwLevel*(10+dwLevel*0.03)+math.floor(dwLevel/10)*30*math.floor(dwLevel/10)),--math.floor(30 + (dwLevel-1)*(3 + (dwLevel-2)*0.16)),			--攻击力
			dwAttack_mul = 100+math.floor(dwLevel/10)*1.5,										--攻击力系数
			dwExtraAttack = 0,														--特殊额外攻击力
		},
		
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	-- local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	-- local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 550,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,31003,objSelf,vPos,200,true);
end;




--技能[31004]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[31004]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {225};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {325};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 2500;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(12+(dwLevel-1)*(0.3+(dwLevel-2)*0.005)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
				dwAttack =math.floor(4+dwLevel*(9+dwLevel*0.03)+math.floor(dwLevel/10)*29*math.floor(dwLevel/10)), --math.floor(10 + (dwLevel-1)*(1.5 + (dwLevel-2)*0.12)),	--攻击力
			dwAttack_mul = 100+math.floor(dwLevel/10)*1.3,								--攻击力系数
			dwExtraAttack = 0,													--特殊额外攻击力
		},
		
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 2000;
	
	dwResult = dwResult + 900 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,31004,objSelf,vPos,0,true);
end;





--技能[31005]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[31005]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {400};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {550};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
		
		local dwRand = math.random(10000);
		if (dwRand < 5000) then
			AddRoleObjBuff(objTarget,31005,1,objAtt);
		end
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 13000;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(45+(dwLevel-1)*(0.5+(dwLevel-2)*0.005)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(86+dwLevel*(14+dwLevel*0.03)+math.floor(dwLevel/10)*41*math.floor(dwLevel/10)),--math.floor(100 + (dwLevel-1)*(4 + (dwLevel-2)*0.22)),			--攻击力
			dwAttack_mul = 100+math.floor(dwLevel/10)*2,											--攻击力系数
			dwExtraAttack = 0,															--特殊额外攻击力
		},
		
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 3000;
	
	dwResult = dwResult + 900 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 1200,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 950,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	-- CSkillAttack:ExecSkillAction(self,4,31005,objTarget,vPos,600,true);
	
	CSkillAttack.tbSkillActionInfo = {};
	CSkillAttack.tbSkillActionInfo.ActionType = 4;
	CSkillAttack.tbSkillActionInfo.ActionID = 31005;
	CSkillAttack.tbSkillActionInfo.Delay = 600;
	CSkillAttack.tbSkillActionInfo.PosList = {vPos};
	CSkillAttack.tbSkillActionInfo.TargetList = {};
	CSkillAttack.tbSkillActionInfo.Index = 0;
	CSkillAttack.tbSkillActionInfo.ShadowID = 0;
	CSkillAttack.tbSkillActionInfo.XPos = objSelf:GetPos().x;
	CSkillAttack.tbSkillActionInfo.YPos = objSelf:GetPos().y;
	CSkillAttack.tbSkillActionInfo.DirValue = objSelf:GetDirValue();
	
	if objSelf:GetAvatar().dwLastMoveTime ~= 0 then
		CPlayerControl:MoveStop();
	end
	
	return 1;
end;




--技能[31006]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[31006]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {700};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {800};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
		
		local dwRand = math.random(10000);
		if (dwRand < 8000) then
			AddRoleObjBuff(objTarget,31006,1,objAtt);
		end	
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 20
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 15000;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))*5
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(50+(dwLevel-1)*(1+(dwLevel-2)*0.05)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor((1000+dwLevel*(50+dwLevel*0.05)+math.floor(dwLevel/10)*100*math.floor(dwLevel/10))*1.1),--math.floor(100 + (dwLevel-1)*(4 + (dwLevel-2)*0.22)),			--攻击力
			dwAttack_mul = 125+math.floor(dwLevel/10)*2,								--攻击力系数
			dwExtraAttack = 0,													--特殊额外攻击力
		},
		
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 2000;
	
	dwResult = dwResult + 900 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 1400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,31006,objSelf,vPos,0,true);
end;






--【【【【【【【【【【【【【【【【【【【【枪技能】】】】】】】】】】】】】】】】】】】】】】】】

--技能[41000]【枪普通攻击】////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[41000]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {155};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {255};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1200;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,					--攻击力
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


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	sInfo.sCurLevelExp[1] = string.format(SkillStringConfig[242],100)
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 400 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,41000,objSelf,vPos,0,true);
end;




--技能[41001]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[41001]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {300};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1500;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(8+(dwLevel-1)*(0.3+(dwLevel-2)*0.005)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(4+dwLevel*(8+dwLevel*0.03)+math.floor(dwLevel/10)*28*math.floor(dwLevel/10)),--math.floor(5 + (dwLevel-1) * ( 1 + (dwLevel-2)*0.1) ),			--攻击力
			dwAttack_mul = 100+math.floor(dwLevel/10)*1,									--攻击力系数
			dwExtraAttack = 0,																--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	-- local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	-- local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 900 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,41001,objSelf,vPos,200,true);
end;



--技能[41002]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[41002]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {280};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {380};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 4500;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(20+(dwLevel-1)*(0.25+(dwLevel-2)*0.003)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,--math.floor(20 + (dwLevel-1)*(2 + (dwLevel-2)*0.14)),		--攻击力
			dwAttack_mul = 135 + (dwLevel-1)*0.5,									--攻击力系数
			dwExtraAttack = 0,													--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,41002,objSelf,vPos,200,true);
end;




--技能[41003]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[41003]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {400};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {510};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 4500;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = math.floor(20+(dwLevel-1)*(0.35+(dwLevel-2)*0.005)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(5+dwLevel*(10+dwLevel*0.03)+math.floor(dwLevel/10)*30*math.floor(dwLevel/10)),--math.floor(30 + (dwLevel-1)*(3 + (dwLevel-2)*0.16)),			--攻击力
			dwAttack_mul = 100+math.floor(dwLevel/10)*1.5,										--攻击力系数
			dwExtraAttack = 0,															--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	-- local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	-- local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,41003,objSelf,vPos,200,true);
end;



--技能[41004]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[41004]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {450};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 2500;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(12+(dwLevel-1)*(0.3+(dwLevel-2)*0.005)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack =math.floor(4+dwLevel*(9+dwLevel*0.03)+math.floor(dwLevel/10)*29*math.floor(dwLevel/10)), --math.floor(10 + (dwLevel-1)*(1.5 + (dwLevel-2)*0.12)),	--攻击力
			dwAttack_mul = 100+math.floor(dwLevel/10)*1.3,								--攻击力系数
			dwExtraAttack = 0,													--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 2000;
	
	dwResult = dwResult + 900 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 550,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,41004,objSelf,vPos,0,true);
end;





--技能[41005]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[41005]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	--1500
	local sInfo = {700,1200,1800,2400};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	--1600
	local sInfo = {800,1300,1900,2500};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventReadyExecSkillP(objRoleSkill,objSelf,objUsedSkill)
	-- if objUsedSkill:GetID() ~= 41005 then
		-- return;
	-- end
	-- local dwCurLevel = objRoleSkill:GetLevel();
	-- objSelf:GetSystem("CBuffSystem"):AddBuff(41005,dwCurLevel,objSelf);
end

--命中后追加
function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 41005 then
		return;
	end
	if (dwActCount == 4) then
		AddRoleObjBuff(objDefender,61004,1,objAttacker);
	end
end


-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 13000;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(45+(dwLevel-1)*(0.5+(dwLevel-2)*0.005)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(86+dwLevel*(14+dwLevel*0.03)+math.floor(dwLevel/10)*41*math.floor(dwLevel/10)),--math.floor(100 + (dwLevel-1)*(4 + (dwLevel-2)*0.22)),			--攻击力
			dwAttack_mul = 80+math.floor(dwLevel/10)*2,											--攻击力系数
			dwExtraAttack = 0,																--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 3000;
	
	dwResult = dwResult + 900 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 2400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 2000,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,41005,objTarget,vPos,600,true);
end;




--技能[41006]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[41006]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	--1500
	local sInfo = {500,700,1200};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	--1600
	local sInfo = {600,800,1300};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);	
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventReadyExecSkillP(objRoleSkill,objSelf,objUsedSkill)
	-- if objUsedSkill:GetID() ~= 41005 then
		-- return;
	-- end
	-- local dwCurLevel = objRoleSkill:GetLevel();
	-- objSelf:GetSystem("CBuffSystem"):AddBuff(41005,dwCurLevel,objSelf);
end

--命中后追加
function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 41006 then
		return;
	end
	
	SkillEventFunc.ExecSkillEvent(objAttacker,objDefender,5,1,2,0,{52000,0,1});
end


-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 15000;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))*5
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(50+(dwLevel-1)*(1+(dwLevel-2)*0.05)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(1000+dwLevel*(50+dwLevel*0.05)+math.floor(dwLevel/10)*100*math.floor(dwLevel/10)),--math.floor(100 + (dwLevel-1)*(4 + (dwLevel-2)*0.22)),			--攻击力
			dwAttack_mul = 125+math.floor(dwLevel/10)*2,											--攻击力系数
			dwExtraAttack = 0,																--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 3000;
	
	dwResult = dwResult + 900 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 2400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 2000,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,41006,objTarget,vPos,600,true);
end;





--【【【【【【【【【【【【【【【【【【【【镰技能】】】】】】】】】】】】】】】】】】】】】】】】

--技能[51000]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[51000]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {115};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {215};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1200;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = dwLevel * 10,			--攻击力
			dwAttack_mul = 100 + dwLevel * 4,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	sInfo.sCurLevelExp[1] = string.format(SkillStringConfig[242],100)
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 400 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,51000,objSelf,vPos,0,true);
end;





--技能[51001]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[51001]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {270};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {215};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1500;
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(8+(dwLevel-1)*(0.3+(dwLevel-2)*0.005)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end
--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(4+dwLevel*(8+dwLevel*0.03)+math.floor(dwLevel/10)*28*math.floor(dwLevel/10)),--math.floor(5 + (dwLevel-1) * ( 1 + (dwLevel-2)*0.1) ),			--攻击力
			dwAttack_mul = 100+math.floor(dwLevel/10)*1,									--攻击力系数
			dwExtraAttack = 0,																--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 900 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 500,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,51001,objSelf,vPos,250,true);
end;




--技能[51002]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[51002]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {205};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {305};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 4500;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(20+(dwLevel-1)*(0.25+(dwLevel-2)*0.003)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,--math.floor(20 + (dwLevel-1)*(2 + (dwLevel-2)*0.14)),		--攻击力
			dwAttack_mul = 135 + (dwLevel-1)*0.5,									--攻击力系数
			dwExtraAttack = 0,													--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,51002,objSelf,vPos,200,true);

	--CSkillAttack:ExecSkillAction(self,enActionType.eAT_Pursue,51002,objTarget,vPos,200);
end;



--技能[51003]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[51003]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {410};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {510};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 4500;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = math.floor(20+(dwLevel-1)*(0.35+(dwLevel-2)*0.005)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(5+dwLevel*(10+dwLevel*0.03)+math.floor(dwLevel/10)*30*math.floor(dwLevel/10)),--math.floor(30 + (dwLevel-1)*(3 + (dwLevel-2)*0.16)),			--攻击力
			dwAttack_mul = 100+math.floor(dwLevel/10)*1.5,										--攻击力系数
			dwExtraAttack = 0,														--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,51003,objSelf,vPos,200,true);
end;



--技能[51004]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[51004]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {275};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {375};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 2500;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(12+(dwLevel-1)*(0.3+(dwLevel-2)*0.005)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack =math.floor(4+dwLevel*(9+dwLevel*0.03)+math.floor(dwLevel/10)*29*math.floor(dwLevel/10)), --math.floor(10 + (dwLevel-1)*(1.5 + (dwLevel-2)*0.12)),	--攻击力
			dwAttack_mul = 100+math.floor(dwLevel/10)*1.3,								--攻击力系数
			dwExtraAttack = 0,													--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 2000;
	
	dwResult = dwResult + 900 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,51004,objSelf,vPos,0,true);
end;




--技能[51005]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[51005]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {390};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {275};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
		--objTarget:AddBuff(,1);
		local dwRand = math.random(10000);
		if (dwRand < 7000) then
			AddRoleObjBuff(objTarget,51005,1,objAtt);
		end
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 13000;
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(45+(dwLevel-1)*(0.5+(dwLevel-2)*0.005)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(86+dwLevel*(14+dwLevel*0.03)+math.floor(dwLevel/10)*41*math.floor(dwLevel/10)),--math.floor(100 + (dwLevel-1)*(4 + (dwLevel-2)*0.22)),			--攻击力
			dwAttack_mul = 100+math.floor(dwLevel/10)*2,											--攻击力系数
			dwExtraAttack = 0,															--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 3000;
	
	dwResult = dwResult + 900 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 950,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 750,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,2,51005,objTarget,vPos,0,true);
end;

--技能的UI特效
-- function Skill:GetUIEffectInfo()
	-- local sInfo = {};
	-- sInfo.dwTime = 1000;
	
	-- return sInfo;
-- end;




--技能[51006]////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[51006]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {1100};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {1200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
		--objTarget:AddBuff(,1);
		local dwRand = math.random(10000);
		if (dwRand < 8000) then
			AddRoleObjBuff(objTarget,51006,3,objAtt);
		end
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 15000;
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))*5
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = math.floor(50+(dwLevel-1)*(1+(dwLevel-2)*0.05)),
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = math.floor((1000+dwLevel*(50+dwLevel*0.05)+math.floor(dwLevel/10)*100*math.floor(dwLevel/10))*1.1),--math.floor(100 + (dwLevel-1)*(4 + (dwLevel-2)*0.22)),			--攻击力
			dwAttack_mul = 125+math.floor(dwLevel/10)*2,										--攻击力系数
			dwExtraAttack = 0,															--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 3000;
	
	dwResult = dwResult + 900 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 1466,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 750,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,2,51006,objTarget,vPos,0,true);
end;







--技能[12006]//////////////剑职业内功//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[12006]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	

end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)

end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if not objRoleSkill:IsActive() then
		return;
	end
	local dwNowTime = _now();

	local dwCurLevel = objRoleSkill:GetLevel();
	
	local dwHitValue = SkillEventFunc.GetSkillEventHitValue(objAttacker,objRoleSkill:GetID(),dwCurLevel)

	local dwEventType = Skill.dwEventID;

	local dwResistValue = SkillEventFunc.GetSkillEventResistValue(objDefender,dwEventType)
	
	if SkillEventFunc.IsSkillEventHit(dwHitValue,dwResistValue) then
		SkillEventFunc.ExecSkillEvent(objAttacker,objDefender,Skill.dwEventID,Skill.dwEventBuffID,dwCurLevel,
		Skill.dwperiod,{dwSkillID,dwNowTime,1});
		local Ran = 0.3;
		objRoleSkill:AddSkillKnowValue(Ran)
	end

end;


----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 500
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};     
	}
	local szNow = SkillStringConfig[268]
	local szNext = nil


	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,12001,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;




--技能[12007]//////////////刀职业内功//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[12007]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	
	---添加buff

end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
	--删除buff
	
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if not objRoleSkill:IsActive() then
		return;
	end
	local dwNowTime = _now();

	local dwCurLevel = objRoleSkill:GetLevel();
	
	local dwHitValue = SkillEventFunc.GetSkillEventHitValue(objAttacker,objRoleSkill:GetID(),dwCurLevel)
	
	local dwEventType = Skill.dwEventID;

	local dwResistValue = SkillEventFunc.GetSkillEventResistValue(objDefender,dwEventType)
	
	if SkillEventFunc.IsSkillEventHit(dwHitValue,dwResistValue) then
		SkillEventFunc.ExecSkillEvent(objAttacker,objDefender,Skill.dwEventID,Skill.dwEventBuffID,dwCurLevel,
		Skill.dwperiod,{dwSkillID,dwNowTime,1});
		local Ran = 0.3;
		objRoleSkill:AddSkillKnowValue(Ran)
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 500
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = SkillStringConfig[269]
	local szNext = nil


	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,12005,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[12008]//////////////枪职业内功//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[12008]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	

end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)

end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if not objRoleSkill:IsActive() then
		return;
	end
	local dwNowTime = _now();

	local dwCurLevel = objRoleSkill:GetLevel();
	
	local dwHitValue = SkillEventFunc.GetSkillEventHitValue(objAttacker,objRoleSkill:GetID(),dwCurLevel)

	local dwEventType = Skill.dwEventID;

	local dwResistValue = SkillEventFunc.GetSkillEventResistValue(objDefender,dwEventType)
	
	if SkillEventFunc.IsSkillEventHit(dwHitValue,dwResistValue) then
		SkillEventFunc.ExecSkillEvent(objAttacker,objDefender,Skill.dwEventID,Skill.dwEventBuffID,dwCurLevel,
		Skill.dwperiod,{dwSkillID,dwNowTime,1});
		local Ran = 0.3;
		objRoleSkill:AddSkillKnowValue(Ran)
	end
end;

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 500
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = SkillStringConfig[270]
	local szNext = nil


	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,12006,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[12009]//////////////镰刀职业内功//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[12009]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	

end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)

end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if not objRoleSkill:IsActive() then
		return;
	end
	local dwNowTime = _now();

	local dwCurLevel = objRoleSkill:GetLevel();
	
	local dwHitValue = SkillEventFunc.GetSkillEventHitValue(objAttacker,objRoleSkill:GetID(),dwCurLevel)

	local dwEventType = Skill.dwEventID;

	local dwResistValue = SkillEventFunc.GetSkillEventResistValue(objDefender,dwEventType)
	
	if SkillEventFunc.IsSkillEventHit(dwHitValue,dwResistValue) then
		SkillEventFunc.ExecSkillEvent(objAttacker,objDefender,Skill.dwEventID,Skill.dwEventBuffID,dwCurLevel,
		Skill.dwperiod,{dwSkillID,dwNowTime,1});
		local Ran = 0.3;
		objRoleSkill:AddSkillKnowValue(Ran)
	end
end;

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 500
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = SkillStringConfig[271];
	local szNext = nil;

	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,12007,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[12010]//////////////通用内功//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[12010]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	

end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)

end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if not objRoleSkill:IsActive() then
		return;
	end

	local dwCurLevel = objRoleSkill:GetLevel();
	local dwJudge = 20 + (dwCurLevel*1.5);
	
	local dwDefLevel = 0;
	if objDefender:GetObjType() == enEntType.eEntType_Player then
		local objDefSkill = objDefender:GetSystem("CSkillSystem").setAllSkill[13008];
		if objDefSkill then
			dwDefLevel = objDefSkill:GetLevel();
		end
	end
	
	dwJudge = dwJudge - (dwDefLevel*1.5);
	dwJudge = math.min(dwJudge,100);
	dwJudge = math.max(dwJudge,1);
	
	local dwRand = math.random(100);
	
	if dwRand <= dwJudge then
		AddRoleObjBuff(objDefender,9601,dwCurLevel,objAttacker);
	end

end;

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 500
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = SkillStringConfig[272]
	end;
	sInfo.sNextLevelExp[1] = SkillStringConfig[272]
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,12008,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;

--技能[12011]//////////////通用内功//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[12011]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	

end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)

end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if not objRoleSkill:IsActive() then
		return;
	end
	local dwNowTime = _now();

	local dwCurLevel = objRoleSkill:GetLevel();
	
	local dwHitValue = SkillEventFunc.GetSkillEventHitValue(objAttacker,objRoleSkill:GetID(),dwCurLevel)

	local dwEventType = Skill.dwEventID;

	local dwResistValue = SkillEventFunc.GetSkillEventResistValue(objDefender,dwEventType)
	
	if SkillEventFunc.IsSkillEventHit(dwHitValue,dwResistValue) then
		SkillEventFunc.ExecSkillEvent(objAttacker,objDefender,Skill.dwEventID,Skill.dwEventBuffID,dwCurLevel,
		Skill.dwperiod,{dwSkillID,dwNowTime,1});
		local Ran = 0.3;
		objRoleSkill:AddSkillKnowValue(Ran)
	end
end;

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 500
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = SkillStringConfig[280]
	local szNext = nil

	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,12009,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[12012]//////////////通用内功//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[12012]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	

end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)

end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if not objRoleSkill:IsActive() then
		return;
	end

	local dwCurLevel = objRoleSkill:GetLevel();
	local dwJudge = 10 + (dwCurLevel*1.5);
	
	local dwDefLevel = 0;
	if objDefender:GetObjType() == enEntType.eEntType_Player then
		local objDefSkill = objDefender:GetSystem("CSkillSystem").setAllSkill[13010];
		if objDefSkill then
			dwDefLevel = objDefSkill:GetLevel();
		end
	end
	
	dwJudge = dwJudge - (dwDefLevel*1.5);
	dwJudge = math.min(dwJudge,100);
	dwJudge = math.max(dwJudge,1);
	
	local dwRand = math.random(100);
	
	if dwRand <= dwJudge then
		AddRoleObjBuff(objDefender,9603,dwCurLevel,objAttacker);
	end

	
end;

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 500
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = SkillStringConfig[274]
	end;
	sInfo.sNextLevelExp[1] = SkillStringConfig[274]
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,12010,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[12013]//////////////通用内功//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[12013]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	

end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)

end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if not objRoleSkill:IsActive() then
		return;
	end

	local dwCurLevel = objRoleSkill:GetLevel();
	local dwJudge = 20 + (dwCurLevel*1.5);
	
	local dwDefLevel = 0;
	if objDefender:GetObjType() == enEntType.eEntType_Player then
		local objDefSkill = objDefender:GetSystem("CSkillSystem").setAllSkill[13011];
		if objDefSkill then
			dwDefLevel = objDefSkill:GetLevel();
		end
	end
	
	dwJudge = dwJudge - (dwDefLevel*1.5);
	dwJudge = math.min(dwJudge,100);
	dwJudge = math.max(dwJudge,1);
	
	local dwRand = math.random(100);
	
	if dwRand <= dwJudge then
		AddRoleObjBuff(objDefender,9606,dwCurLevel,objAttacker);
	end

	
end;

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 500
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = SkillStringConfig[275]
	end;
	sInfo.sNextLevelExp[1] = SkillStringConfig[275]
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,12011,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[12014]//////////////通用内功//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[12014]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	

end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)

end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if not objRoleSkill:IsActive() then
		return;
	end

	local dwCurLevel = objRoleSkill:GetLevel();
	local dwJudge = 20 + (dwCurLevel*1.5);
	
	local dwDefLevel = 0;
	if objDefender:GetObjType() == enEntType.eEntType_Player then
		local objDefSkill = objDefender:GetSystem("CSkillSystem").setAllSkill[13012];
		if objDefSkill then
			dwDefLevel = objDefSkill:GetLevel();
		end
	end
	
	dwJudge = dwJudge - (dwDefLevel*1.5);
	dwJudge = math.min(dwJudge,100);
	dwJudge = math.max(dwJudge,1);
	
	local dwRand = math.random(100);
	
	if dwRand <= dwJudge then
		AddRoleObjBuff(objDefender,9608,dwCurLevel,objAttacker);
	end


end;

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 500
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = SkillStringConfig[276]
	end;
	sInfo.sNextLevelExp[1] = SkillStringConfig[276]
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,12012,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;

--技能[12015]//////////////通用内功//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[12015]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	

end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)

end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if not objRoleSkill:IsActive() then
		return;
	end

	local dwCurLevel = objRoleSkill:GetLevel();
	local dwJudge = 20 + (dwCurLevel*1.5);
	
	local dwDefLevel = 0;
	if objDefender:GetObjType() == enEntType.eEntType_Player then
		local objDefSkill = objDefender:GetSystem("CSkillSystem").setAllSkill[13013];
		if objDefSkill then
			dwDefLevel = objDefSkill:GetLevel();
		end
	end
	
	dwJudge = dwJudge - (dwDefLevel*1.5);
	dwJudge = math.min(dwJudge,100);
	dwJudge = math.max(dwJudge,1);
	
	local dwRand = math.random(100);
	
	if dwRand <= dwJudge then
		AddRoleObjBuff(objDefender,9609,dwCurLevel,objAttacker);
	end


end;

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 500
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = SkillStringConfig[277]
	end;
	sInfo.sNextLevelExp[1] = SkillStringConfig[277]
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,12013,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[12016]//////////////通用内功//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[12016]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	

end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)

end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
--[[
	if not objRoleSkill:IsActive() then
		return;
	end

	local dwCurLevel = objRoleSkill:GetLevel();
		
	-- local fPercent = 0.05 +(0.02 * dwCurLevel);
	
	-- local dwValue = dwDamageValue * fPercent;

	-- local objPlayer = objRoleSkill:GetPlayer(0);
	-- local sOtherInfo = objPlayer:GetSystem("CSkillSystem"):GetInfo();

	-- local dwAttack = sOtherInfo.dwAttack;
	-- local dwValue = dwAttack*(0.05 + (0.002*dwCurLevel))
	-- if (dwDamageValue > (0-dwValue)) then
		-- dwValue = dwDamageValue
	-- end

	-- if dwValue < 0 then
		-- dwValue = 0-dwValue;
	-- end
	
	local dwValue = 10+(5*dwCurLevel)
	
	--概率触发
	local dwJudge = 15 + (dwCurLevel*0.1);
	dwJudge = math.min(dwJudge,100);
	dwJudge = math.max(dwJudge,1);
	local dwRand = math.random(100);
	
	if dwRand <= dwJudge then
		local objSklSys = objAttacker:GetSystem("CSkillSystem");
		if objSklSys then
			--print("=======EventHurtA=======",dwValue)
			objSklSys:ChgHP(dwValue,false,-1,0);
		end
	end
	--]]
end;
--命中后统计
function Skill:EventCompExecSkillP(objRoleSkill,objSelf,tbResult)
	if not objRoleSkill:IsActive() then
		return;
	end

	local dwCurLevel = objRoleSkill:GetLevel();
	--计算加血量
	local dwValue = self:GetSkillParam(dwCurLevel,objRoleSkill);

	local record = 0;
	for n,val in pairs(tbResult)do
		record = record + dwValue
	end

	if (record >0) then
		local objSklSys = objSelf:GetSystem("CSkillSystem");
		if objSklSys then
			objSklSys:ChgHP(record,false,-1,0);
			local Ran = 0.3;
			objRoleSkill:AddSkillKnowValue(Ran)
		end
	end
end;

function Skill:GetSkillParam(dwLevel,objRoleSkill)
	local dwValue = 10+(5*dwLevel);
	local fParam = objRoleSkill:GetParam(1);
	dwValue = dwValue * (1 + fParam);
	return dwValue;
end;

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 500
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	
	local szNow = SkillStringConfig[278]
	local szNext = nil
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,12005,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;

--技能[12017]//////////////通用内功//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[12017]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
		
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	

end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)

end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if not objRoleSkill:IsActive() then
		return;
	end
	local dwNowTime = _now();

	local dwCurLevel = objRoleSkill:GetLevel();
	
	local dwHitValue = SkillEventFunc.GetSkillEventHitValue(objAttacker,objRoleSkill:GetID(),dwCurLevel)

	local dwEventType = Skill.dwEventID;

	local dwResistValue = SkillEventFunc.GetSkillEventResistValue(objDefender,dwEventType)
	
	
	if SkillEventFunc.IsSkillEventHit(dwHitValue,dwResistValue) then
		SkillEventFunc.ExecSkillEvent(objAttacker,objDefender,Skill.dwEventID,Skill.dwEventBuffID,dwCurLevel,
		Skill.dwperiod,{dwSkillID,dwNowTime,1});
		local Ran = 0.3;
		objRoleSkill:AddSkillKnowValue(Ran)
	end
end;

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 500
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = SkillStringConfig[273]
	local szNext = nil


	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,12011,objSelf,vPos,0,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--结婚技能传送[60000]////////////////////////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[60000]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {250};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
function Skill:CheckSpecialCondition(objPlayer)
	local CMrSystem = objPlayer:GetSystem("CMarriageSystem");
	local MapSystem = objPlayer:GetSystem("CMapSystem");
	local duplpSystem = objPlayer:GetSystem("CDuplSystem");
	local objStateSys = objPlayer:GetSystem("CStateSystem");
	if objStateSys then
		if objStateSys.dwCurState == enPlayerState.ePS_Fight then
			objPlayer.OnServerNoticeMsg{WordID =9000610021};
			return false;
		end
	end
	
	local dwMapMode = math.floor(MapSystem.dwCurMapID/1000);
	if dwMapMode ~= 1 then
		objPlayer.OnServerNoticeMsg{WordID =5000210015};
		return false;
	end
	
	if (not duplpSystem) or duplpSystem:IsInDupl() then
		objPlayer.OnServerNoticeMsg{WordID =5000210015};
		return false;
	end
	
	if not CMrSystem.MateIsOnline then
		objPlayer.OnServerNoticeMsg{WordID =5000210012};
		return false;
	end;
	
	local matePlayer = objPlayer:GetOtherPlayer(CMrSystem.MateRoleID, 3);
	if not matePlayer then
		objPlayer.OnServerNoticeMsg{WordID =5000210013};
		return false;
	end;
	
	local objMateMapSys = matePlayer:GetSystem("CMapSystem");
	local objMateDulpSys = matePlayer:GetSystem("CDuplSystem");
	if not objMateMapSys then
		objPlayer.OnServerNoticeMsg{WordID =5000210014};
		return false;
	end
	
	local dwMapMode = math.floor(objMateMapSys.dwCurMapID/1000);
	if dwMapMode ~= 1 then
		objPlayer.OnServerNoticeMsg{WordID =5000210014};
		return false;
	end
	
	if (not objMateDulpSys) or objMateDulpSys:IsInDupl() then
		objPlayer.OnServerNoticeMsg{WordID =5000210014};
		return false;
	end
	local cfgMap = MapInfoConfig[objMateMapSys.dwCurMapID];
	if not cfgMap then
		return false;
	end
	
	if cfgMap.dwLevel then
		if objPlayer:GetLevel() < cfgMap.dwLevel then
		objPlayer.OnServerNoticeMsg{WordID =5000210014};
		return false;
		end
	end
	
	return true;
end;
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objPlayer = objRoleSkill:GetPlayer(0);
	local CMrSystem = objPlayer:GetSystem("CMarriageSystem");
	local MapSystem = objPlayer:GetSystem("CMapSystem");
	
	local mateCMapSystem = objPlayer:GetOtherPlayer(CMrSystem.MateRoleID, 3):GetSystem("CMapSystem");
	local mateCurMap,mateCurPosX,mateCurPosY = mateCMapSystem:GetPlayerMapPos();
	local cfgMap = MapInfoConfig[mateCurMap];
	if not cfgMap then
		return false;
	end
	if cfgMap.dwLevel then
		if objPlayer:GetLevel() < cfgMap.dwLevel then
			objPlayer.OnServerNoticeMsg{WordID =5000210014};
			return false;
		end
	end
	MapSystem:ExecTransforMapXY(mateCurMap,mateCurPosX,mateCurPosY);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 60000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = RoundFloat(((1000*20) - (1000*dwLevel)));
	-- dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	-- if dwResult < dwPublicCoolTime then
		-- dwResult = dwPublicCoolTime;
	-- end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	sInfo.sCurLevelExp[1] =SysStringConfigInfo[5000240030];

	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,2,60000,objTarget,vPos,200,true);
end;

--结婚技能1[60005]，加攻击力////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[60005]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {250};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
function Skill:CheckSpecialCondition(objPlayer)
	local CMrSystem = objPlayer:GetSystem("CMarriageSystem");
	local MapSystem = objPlayer:GetSystem("CMapSystem");
	
	
	if not objPlayer then
		return false;
	end;
	
	
	if not CMrSystem.MateIsOnline then
		objPlayer.OnServerNoticeMsg{WordID =5000210012};
		return false;
	end;
	
	local matePlayer = objPlayer:GetOtherPlayer(CMrSystem.MateRoleID, 2);
	if not matePlayer then
		objPlayer.OnServerNoticeMsg{WordID =5000210016};
		return false;
	end;

	-- local matePlayer = objPlayer:GetOtherPlayer(CMrSystem:GetMateRoleID(), 3);
	-- local mateCMapSystem = matePlayer:GetSystem("CMapSystem");
	-- local mateCurMap,mateCurPosX,mateCurPosY = mateCMapSystem:GetPlayerMapPos();
	-- if mateCMapSystem:GetCurLine() ~= MapSystem:GetCurLine() then
		-- --objPlayer.OnServerNoticeMsg{WordID =5000210013};
		-- return false;
	-- end;
	return true;
end;

--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objSelf = objRoleSkill:GetPlayer(0);
	if CConfig.bIsCrossSvr then
		return;
	end;
	local objMarrSys = objRoleSkill:GetPlayerSystem("CMarriageSystem",0);
	
	local objMarri = objSelf:GetOtherPlayer(objMarrSys:GetMateRoleID(),2);
	
	if objMarri then
		local objSklSystem = objMarri:GetSystem("CSkillSystem");
		if objSklSystem then
			objSklSystem:BroadcastSkillMsg(true,"OnPlayPfxMsg",
			{
				ActionID = 60002,
				BindPos = "feetpoint",
				RoleID = objMarri:GetRoleID(),
				SkillID = 60001,
				ExecTime = objRoleSkill.dwLastExecTime,
				ActCount = dwActCount,
			})
		end
		
		objMarri:GetSystem("CBuffSystem"):AddBuff(60001,1,objSelf);
	end
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = math.floor((1000*60)*5);
	
	-- dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	-- if dwResult < dwPublicCoolTime then
		-- dwResult = dwPublicCoolTime;
	-- end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return 10000;
end;

function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	sInfo.sCurLevelExp[1] =SysStringConfigInfo[5000240031];

	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,2,60001,objTarget,vPos,200,true);
end;


--技能[60003]：结婚被动，加经验////////////////////////////////////////////////////////////////////////////////////
local Skill = SkillConfig[60003]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)

end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)
	local objSelf = objRoleSkill:GetPlayer();
	if CConfig.bIsCrossSvr then
		return;
	end;
	local objMarSys = objRoleSkill:GetPlayerSystem("CMarriageSystem");
	local objMapSys = objRoleSkill:GetPlayerSystem("CMapSystem");
	local dwSelfMap = objMapSys.dwCurMapID;
	local dwMyLine =  objMapSys.dwCurLine;

	if not objMarSys:IsMarried() then
		objSelf:GetSystem("CBuffSystem"):DeleteBuffByID(60002);
		return;
	end
	
	local objMarr = objSelf:GetOtherPlayer(objMarSys:GetMateRoleID(),3);
	if not objMarr then
		objSelf:GetSystem("CBuffSystem"):DeleteBuffByID(60002);
		return;
	end
	local dwMarrMap = objMarr:GetSystem("CMapSystem").dwCurMapID;
	local dwMarrLine =  objMarr:GetSystem("CMapSystem").dwCurLine;
	
	if dwSelfMap == dwMarrMap and dwMyLine == dwMarrLine then
		objSelf:GetSystem("CBuffSystem"):AddBuff(60002,1);
		objMarr:GetSystem("CBuffSystem"):AddBuff(60002,1);
	else
		objSelf:GetSystem("CBuffSystem"):DeleteBuffByID(60002);
		objMarr:GetSystem("CBuffSystem"):DeleteBuffByID(60002);
	end
end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
 
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

--技能删除效果
function Skill:EventSkillDelete(objRoleSkill)
	local objSelf = objRoleSkill:GetPlayer();
	
	objSelf:GetSystem("CBuffSystem"):DeleteBuffByID(60002);
end;

function Skill:EventSceneChange(objRoleSkill)
	local objSelf = objRoleSkill:GetPlayer();
	if CConfig.bIsCrossSvr then
		return;
	end;
	local objMarSys = objRoleSkill:GetPlayerSystem("CMarriageSystem");
	local objMapSys = objRoleSkill:GetPlayerSystem("CMapSystem");
	local objSelfMap = objMapSys:GetCurMap();
	local dwSelfMap = objSelfMap:GetRealID();
	--local dwMyLine =  objMapSys.dwCurLine;
	
	if not objMarSys:IsMarried() then
		objSelf:GetSystem("CBuffSystem"):DeleteBuffByID(60002);
		return;
	end
	
	local objMarr = objSelf:GetOtherPlayer(objMarSys:GetMateRoleID(),3);
	if not objMarr then
		objSelf:GetSystem("CBuffSystem"):DeleteBuffByID(60002);
		return;
	end
	
	local objMarrMap = objMarr:GetSystem("CMapSystem"):GetCurMap();
	local dwMarrMap = objMarrMap:GetRealID();
	--local dwMarrLine =  objMarr:GetSystem("CMapSystem").dwCurLine;
	
	if dwSelfMap == dwMarrMap then
		objSelf:GetSystem("CBuffSystem"):AddBuff(60002,1);
		objMarr:GetSystem("CBuffSystem"):AddBuff(60002,1);
	else
		objSelf:GetSystem("CBuffSystem"):DeleteBuffByID(60002);
		objMarr:GetSystem("CBuffSystem"):DeleteBuffByID(60002);
	end
end;

function Skill:EventChangeLine(objRoleSkill)
	local objSelf = objRoleSkill:GetPlayer();
	if CConfig.bIsCrossSvr then
		return;
	end;
	local objMarSys = objRoleSkill:GetPlayerSystem("CMarriageSystem");
	local objMapSys = objRoleSkill:GetPlayerSystem("CMapSystem");
	local objSelfMap = objMapSys:GetCurMap();
	if not objSelfMap then
		local objBuffSys = objSelf:GetSystem("CBuffSystem");
		if objBuffSys then
			objBuffSys:DeleteBuffByID(60002);
		end
		return;
	end
	local dwSelfMap = objSelfMap:GetRealID();
	--local dwMyLine =  objMapSys.dwCurLine;
	
	if not objMarSys:IsMarried() then
		objSelf:GetSystem("CBuffSystem"):DeleteBuffByID(60002);
		return;
	end
	
	local objMarr = objSelf:GetOtherPlayer(objMarSys:GetMateRoleID(),3);
	if not objMarr then
		objSelf:GetSystem("CBuffSystem"):DeleteBuffByID(60002);
		return;
	end
	
	--local dwMarrLine =  objMarr:GetSystem("CMapSystem").dwCurLine;
	
	objSelf:GetSystem("CBuffSystem"):DeleteBuffByID(60002);
	objMarr:GetSystem("CBuffSystem"):DeleteBuffByID(60002);
end;

function Skill:EventMarriOffline(objRoleSkill)
	local objSelf = objRoleSkill:GetPlayer();
	objSelf:GetSystem("CBuffSystem"):DeleteBuffByID(60002);
end;

---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 0
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	sInfo.sCurLevelExp[1] =SysStringConfigInfo[5000240032];
	-- if dwLevel == 0 then
		-- sInfo.sCurLevelExp[1] ="尚未学习，暂无效果"
		-- sInfo.sCurLevelExp[2] ="";
	-- else
		-- sInfo.sCurLevelExp[1] ="";
		-- sInfo.sCurLevelExp[2] ="";
	-- end;
	-- sInfo.sNextLevelExp[1] ="";
	-- sInfo.sNextLevelExp[2] ="";
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;


--技能[60001]：结婚被动，吃药////////////////////////////////////////////////////////////////////////////////////
local Skill = SkillConfig[60001]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)

end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

--吃药
--dwType：1，红药；2，蓝药
function Skill:EventMedicine(objRoleSkill,dwType,dwValue)
	local objSelf = objRoleSkill:GetPlayer(0);
	if CConfig.bIsCrossSvr then
		return;
	end;
	local objMarrSys = objRoleSkill:GetPlayerSystem("CMarriageSystem",0);
	
	if objMarrSys.MateRoleID == 0 then
		return;
	end
	
	local objMarri = objSelf:GetOtherPlayer(objMarrSys.MateRoleID, 2);
	if not objMarri then
		return;
	end
	local objMarSklSys = objMarri:GetSystem("CSkillSystem");
	
	local dwLevel = objRoleSkill:GetLevel();
	local fUsedValue = (dwLevel*0.1)*dwValue;
	
	if dwType == 1 then
		objMarSklSys:ChgHP(fUsedValue,false,4,objSelf:GetRoleID());
	elseif dwType == 2 then
		objMarSklSys:ChgMP(fUsedValue,false,4,objSelf:GetRoleID());
	end
end

---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 0
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
		local percentage = 10*dwLevel;
		
		sInfo.sCurLevelExp[1] = string.format(SysStringConfigInfo[5000240033],percentage);
	-- if dwLevel == 0 then
		-- sInfo.sCurLevelExp[1] ="尚未学习，暂无效果"
		-- sInfo.sCurLevelExp[2] ="";
	-- else
		-- sInfo.sCurLevelExp[1] ="";
		-- sInfo.sCurLevelExp[2] ="";
	-- end;
	-- sInfo.sNextLevelExp[1] ="";
	-- sInfo.sNextLevelExp[2] ="";
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;


--结婚技能1[60004]给予减伤buff////////////////////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[60004]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = nil;--{250};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
function Skill:CheckSpecialCondition(objPlayer)


	local CMrSystem = objPlayer:GetSystem("CMarriageSystem");
	local MapSystem = objPlayer:GetSystem("CMapSystem");
	
	
	if not objPlayer then
		return false;
	end;
	
	
	if not CMrSystem.MateIsOnline then
		objPlayer.OnServerNoticeMsg{WordID =5000210012};
		return false;
	end;
	
	local matePlayer = objPlayer:GetOtherPlayer(CMrSystem.MateRoleID, 2);
	if not matePlayer then
		objPlayer.OnServerNoticeMsg{WordID =5000210016};
		return false;
	end;

	-- local matePlayer = objPlayer:GetOtherPlayer(CMrSystem:GetMateRoleID(), 3);
	-- local mateCMapSystem = matePlayer:GetSystem("CMapSystem");
	-- local mateCurMap,mateCurPosX,mateCurPosY = mateCMapSystem:GetPlayerMapPos();
	-- if mateCMapSystem:GetCurLine() ~= MapSystem:GetCurLine() then
		-- --objPlayer.OnServerNoticeMsg{WordID =5000210013};
		-- return false;
	-- end;
	return true;
end;

--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objSelf = objRoleSkill:GetPlayer(0);
	if CConfig.bIsCrossSvr then
		return;
	end;
	local objMarrSys = objRoleSkill:GetPlayerSystem("CMarriageSystem",0);
	
	local objMarri = objSelf:GetOtherPlayer(objMarrSys:GetMateRoleID(),2);
	
	if objMarri then
		local objSklSystem = objMarri:GetSystem("CSkillSystem");
		if objSklSystem then
			objSklSystem:BroadcastSkillMsg(true,"OnPlayPfxMsg",
			{
				ActionID = 60004,
				BindPos = "feetpoint",
				RoleID = objMarri:GetRoleID(),
				SkillID = 60004,
				ExecTime = objRoleSkill.dwLastExecTime,
				ActCount = dwActCount,
			})
		end
		
		objMarri:GetSystem("CBuffSystem"):AddBuff(60004,1,objSelf);
	end
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = math.floor(1000*60*5)
	
	-- dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	-- if dwResult < dwPublicCoolTime then
		-- dwResult = dwPublicCoolTime;
	-- end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return 10000;
end;

function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	sInfo.sCurLevelExp[1] =SysStringConfigInfo[5000240034];

	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,2,60004,objTarget,vPos,200,true);
end;


--技能[60002]：结婚被动////////////////////////////////////////////////////////////////////////////////////
local Skill = SkillConfig[60002]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)

end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 0
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	sInfo.sCurLevelExp[1] =SysStringConfigInfo[5000240035];
	-- if dwLevel == 0 then
		-- sInfo.sCurLevelExp[1] ="尚未学习，暂无效果"
		-- sInfo.sCurLevelExp[2] ="";
	-- else
		-- sInfo.sCurLevelExp[1] ="";
		-- sInfo.sCurLevelExp[2] ="";
	-- end;
	-- sInfo.sNextLevelExp[1] ="";
	-- sInfo.sNextLevelExp[2] ="";
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = 1000,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;


--技能[61000]//////////////XP测试//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[61000]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {100};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	if objTarget:GetObjType() == enEntType.eEntType_Monster then
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
		end;
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	

end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)

end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 20
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 1,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 1000,			--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] =SysStringConfigInfo[5000240036];
	else
		sInfo.sCurLevelExp[1] =SysStringConfigInfo[5000240037];
	end;
	sInfo.sNextLevelExp[1] =SysStringConfigInfo[5000240038];
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,2,61000,objSelf,vPos,200,true);
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[61001]//////////////无双测试//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[61001];
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {400};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {410};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--成功释放技能
function Skill:EventReadyExecSkillP(objRoleSkill,objSelf,objUsedSkill)
	if (objUsedSkill:GetID() ~= 61001) then
		return
	end
	local dwProf = objSelf:GetInfo().dwProf;
	local objAtt = objRoleSkill:GetPlayer(0);
	local dwCurLevel = objRoleSkill:GetLevel();
	
	if (dwProf == 1) then
		if objSelf then
			objSelf:GetSystem("CBuffSystem"):AddBuff(61002,dwCurLevel,objSelf);
		end
	else
		--local objSelf = objRoleSkill:GetPlayer();
		if objSelf then
			objSelf:GetSystem("CBuffSystem"):AddBuff(61001,dwCurLevel,objSelf);
		end
	end
end

--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)	
	local objAtt = objRoleSkill:GetPlayer(0);

	objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 61001 then
		return;
	end
	--ExecMoveActive(3,objUsedSkill,objAttacker,objDefender,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	

end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)

end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 25000;
	-- dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	-- if dwResult < dwPublicCoolTime then
		-- dwResult = dwPublicCoolTime;
	-- end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	local Level = 0;
	if (dwCurLevel == 1) then
		Level = 15;
	elseif (dwCurLevel == 2) then
		Level = 40;
	elseif (dwCurLevel == 3) then
		Level = 60;
	elseif (dwCurLevel == 4) then
		Level = 80;
	elseif (dwCurLevel == 5) then
		Level = 100;	
	end
	local price = math.floor(50+(Level-1)*(15+(Level-2)*(0.2+Level/50)))
	return price;
	--return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 1,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100,			--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = string.format(SkillStringConfig[244],1+(1*dwLevel),1+(1*dwLevel),1+(1*dwLevel),2+(2*dwLevel),2+(2*dwLevel),5+(5*dwLevel))
	end;
	if dwLevel == 0 then
		sInfo.sNextLevelExp[1] = string.format(SkillStringConfig[244],1+(1*(dwLevel+1)),1+(1*(dwLevel+1)),1+(1*(dwLevel+1)),2+(2*(dwLevel+1)),2+(2*(dwLevel+1)),5+(5*(dwLevel+1)))
	else
		sInfo.sNextLevelExp[1] =nil;
	end;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 10000;
	
	-- dwResult = dwResult + 500 - dwAttackSpeed ;
	-- if dwResult < 600 then
		-- dwResult = 600;
	-- end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 1500,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,61001,objSelf,vPos,200,true);
end;

--UI特效
function Skill:GetUIEffectInfo()
	local info = {};
	info.dwTime = 20000;
	return info;
end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return 10000;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;







--技能[11016]//////////////金钟罩//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[11016]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	-- local sInfo = {100};
	-- return sInfo;
end;

function Skill:GetClientTimeArray()
	-- local sInfo = {200};
	-- return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)

	local objAtt = objRoleSkill:GetPlayer(0);
	
	local dwCurLevel = objRoleSkill:GetLevel();
	
	--objAtt:AddBuff(,);
	AddRoleObjBuff(objAtt,11005,dwCurLevel,objAtt);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	

end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)

end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 20
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 20000;
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0,			--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	
	local szNow = string.format(SkillStringConfig[279],RoundFloat((2000+math.floor(dwLevel/10)*500)/100),RoundFloat(math.floor(90+dwLevel*(10+dwLevel*0.02)+math.floor(dwLevel/10)*18*math.floor(dwLevel/10))))
	local szNext = string.format(SkillStringConfig[279],RoundFloat((2000+math.floor((dwLevel+1)/10)*500)/100),RoundFloat(math.floor(90+(dwLevel+1)*(10+(dwLevel+1)*0.02)+math.floor((dwLevel+1)/10)*18*math.floor((dwLevel+1)/10))))
	
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 10000;
	
	-- dwResult = dwResult + 500 - dwAttackSpeed ;
	-- if dwResult < 600 then
		-- dwResult = 600;
	-- end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,11016,objSelf,vPos,200,true);
end;




--技能[61002]//////////////法身降魔咒//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[61003]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	-- local sInfo = {100};
	-- return sInfo;
end;

function Skill:GetClientTimeArray()
	-- local sInfo = {200};
	-- return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	
	local objPlayer = objRoleSkill:GetPlayer(0);
	--判断buff
	local objBufSys = objPlayer:GetSystem("CBuffSystem");
	
	local objAtt = objRoleSkill:GetPlayer(0);
		
	local dwCurLevel = objRoleSkill:GetLevel();
	if (dwCurLevel > 0) then
		if (objBufSys) then
			if objBufSys:GetBuffObj(9602) ~= nil then
				objBufSys:DeleteBuffByID(9602);
			end
		end
		AddRoleObjBuff(objAtt,61003,dwCurLevel,objAtt);
	end
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)	

end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)

end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 60000;
	if (dwLevel == 5) then
		dwResult = 57000
	elseif (dwLevel	== 6) then
		dwResult = 54000
	elseif (dwLevel	== 7) then
		dwResult = 51000
	elseif (dwLevel	== 8) then
		dwResult = 48000
	elseif (dwLevel	== 9) then
		dwResult = 44000	
	elseif (dwLevel	== 10) then
		dwResult = 40000
	elseif (dwLevel	== 11) then
		dwResult = 35000
	elseif (dwLevel	== 12) then
		dwResult = 30000		
	end
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0,			--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	
	local szNow = string.format(SkillStringConfig[291],RoundFloat((2000+math.floor(dwLevel/10)*500)/100),RoundFloat(math.floor(90+dwLevel*(10+dwLevel*0.02)+math.floor(dwLevel/10)*18*math.floor(dwLevel/10))))
	local szNext = string.format(SkillStringConfig[291],RoundFloat((2000+math.floor((dwLevel+1)/10)*500)/100),RoundFloat(math.floor(90+(dwLevel+1)*(10+(dwLevel+1)*0.02)+math.floor((dwLevel+1)/10)*18*math.floor((dwLevel+1)/10))))
	
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 10000;
	
	-- dwResult = dwResult + 500 - dwAttackSpeed ;
	-- if dwResult < 600 then
		-- dwResult = 600;
	-- end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,11018,objSelf,vPos,200,true);
end;





--技能[61004]血魔功////////////////////////////////////////////////////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[61004]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {100};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)

end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)
end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 0
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	local szNow = string.format(SkillStringConfig[248],RoundFloat(math.floor(15+(dwLevel-1)*(15+(dwLevel-2)*0.3093))))
	local szNext = string.format(SkillStringConfig[248],RoundFloat(math.floor(15+dwLevel*(15+((dwLevel-1)*0.3093)))))
	
	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241]
	else
		sInfo.sCurLevelExp[1] = szNow
	end;
	sInfo.sNextLevelExp[1] = szNext
	
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

--命中后统计
function Skill:EventCompExecSkillP(objRoleSkill,objSelf,tbResult)
	if CConfig.bIsCrossSvr then return end

	if not objRoleSkill:IsActive() then
		return;
	end

	local dwCurLevel = objRoleSkill:GetLevel();

	local record = 0;

	for n,val in pairs(tbResult)do
		--攻击方血魔功等级
		local MegaKillSystem = objSelf:GetSystem("CMegaKillSystem");
		local Ve = MegaKillSystem:GetLevelVal()
		local Data = _G.MegaKillConfig.XueMoGongSkill(Ve)
		
		if (Data[3] > 0) then
			--血魔功附加伤害调用
			local dwRand = math.random(10000);
			if (dwRand >= Data[2] and dwRand <= Data[3]) then
				self:XueMoGong(objSelf,n,Data[1])
			end
		end
	end
end;

function Skill:XueMoGong(objSelf,n,lue)
		local dwType = math.floor(n%10);
		local dwID = math.floor(n/10);
		
		--玩家自身攻击
		local objBuffSys = objSelf:GetSystem("CBuffSystem");
		local Attack = math.floor(objBuffSys:GetBattleInfo().dwAttack*1)

		local objSklSystem = nil;
		
		local objDefBattle = nil;
		
		local value = nil;
		
		if dwType == enEntType.eEntType_Player then
			local objPlayer = CMapManager:GetPlayer(dwID)
			objDefBattle = objPlayer:GetSystem("CBattleSystem");
			--获取伤害
			local objBuffSys = objPlayer:GetSystem("CBuffSystem");
			value = math.floor(objBuffSys:GetBattleInfo().dwHPMax*lue)
			objSklSystem = objPlayer:GetSystem("CSkillSystem");
		elseif dwType == enEntType.eEntType_Monster then
			local sysMap = objSelf:GetSystem("CMapSystem")	----地图系统
			local Map = sysMap:GetCurMap()				----获取玩家所在地图
			objDefBattle = Map:GetMonsterByObjID(dwID);
			--伤害数值计算
			if objDefBattle then
				local dwMonID = objDefBattle:GetID()		--获得怪物ID
				--判断当前怪物是否是固定掉血
				local fixed_value = MonsterDataConfig[dwMonID].fixed_value
				if fixed_value == 0 then
					value = math.floor(objDefBattle:GetMaxHP()*lue)
					objSklSystem = objDefBattle:GetSystem("CMonsterSkillSystem")
				else
					value = fixed_value 
				end
			end
		else
			return;
		end
		
		if not objSklSystem then
			return;
		end
		if not value then
			return;
		end
		
		-- 伤害上限
		if (value > Attack) then
			value = Attack
		end
		
		--伤害触发
		objDefBattle:Hurt(value,false,objSelf,0,0,0,0,true);

		objSklSystem:BroadcastBattleNotice(
			enBattleNoticeType.eBNT_XueMo,
			value,
			enEntType.eEntType_Player,
			objSelf:GetRoleID(),
			false
		)
end


--[[//////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////宠物技能///////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
]]--

--技能[20000001]//////////////康兴哥专属//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000001]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200,300,400,500,700};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {300,400,500,600,800};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000001 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*10;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.06*dwLevel^2+12*dwLevel+48),			--攻击力
			dwAttack_mul = 85,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[2000000140],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[2000000140],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000001,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000002]//////////////许竹青专属//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000002]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000002 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 20
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*10;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.06*dwLevel^2+11*dwLevel+44),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000002,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[20000003]//////////////周伯通专属//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000003]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	local dwRand = math.random(10000);
	if dwRand >= 6000 then
		AddRoleObjBuff(objTarget,20000003,30,objAtt);
	end
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000003 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*10;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.06*dwLevel^2+11*dwLevel+44),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000003,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[20000004]//////////////李莫愁专属//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000004]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200,300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {300,400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000004 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*10;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.06*dwLevel^2+13*dwLevel+52),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000004,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[20000005]//////////////黄药师专属//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000005]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	local dwRand = math.random(10000);
	if dwRand >= 6000 then
		AddRoleObjBuff(objTarget,20000005,30,objAtt);
	end
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000005 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*10;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.06*dwLevel^2+14*dwLevel+56),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000005,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000006]//////////////洪七公专属//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000006]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	local dwRand = math.random(10000);
	if dwRand >= 6000 then
		AddRoleObjBuff(objTarget,20000006,30,objAtt);
	end
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000006 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*10;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.06*dwLevel^2+14*dwLevel+56),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000006,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000007]//////////////欧阳锋专属//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000007]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000007 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*10;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.06*dwLevel^2+17*dwLevel+68),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000007,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000008]//////////////小龙女转专属//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000008]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200,300,400,500,600};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {300,400,500,600,700};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000008 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*10;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.06*dwLevel^2+15*dwLevel+60),			--攻击力
			dwAttack_mul = 85,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000008,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000009]//////////////一灯大师//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000009]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	local dwRand = math.random(10000);
	if dwRand >= 6000 then
		AddRoleObjBuff(objTarget,96000,1,objAtt);
	end
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000009 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*10;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.06*dwLevel^2+14*dwLevel+56),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000009,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000010]//////////////铁匠专属//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000010]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000010 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*10;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.06*dwLevel^2+16*dwLevel+64),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000010,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[20000011]//////////////宠物技能---高级散魂//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000011]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200,300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {300,400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	local dwRand = math.random(10000);
	if dwRand >= 6000 then
		AddRoleObjBuff(objTarget,20000011,1,objAtt);
	end
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000011 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*15;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.12*dwLevel^2+30*dwLevel+120),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000011,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000012]//////////////宠物技能---高级飞火//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000012]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000012 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*15;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.12*dwLevel^2+34*dwLevel+136),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000012,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000013]//////////////宠物技能---高级突击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000013]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	local dwRand = math.random(10000);
	if dwRand >= 6000 then
		AddRoleObjBuff(objTarget,20000013,1,objAtt);
	end
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000013 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*15;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.12*dwLevel^2+30*dwLevel+120),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000013,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000014]//////////////宠物技能---高级地刺//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000014]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	local dwRand = math.random(10000);
	if dwRand >= 6000 then
		AddRoleObjBuff(objTarget,20000014,1,objAtt);
	end
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000014 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*15;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.12*dwLevel^2+30*dwLevel+120),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000014,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000015]//////////////宠物技能---高级暗杀//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000015]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	local dwRand = math.random(10000);
	if dwRand >= 6000 then
		AddRoleObjBuff(objTarget,20000015,30,objAtt);
	end
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000015 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*15;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.12*dwLevel^2+30*dwLevel+120),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000015,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000016]//////////////宠物技能---高级长拳//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000016]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000016 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 20
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*20;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.12*dwLevel^2+32*dwLevel+128),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000016,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;




--技能[20000017]//////////////宠物技能----囚仙曲//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000017]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	local dwRand = math.random(10000);
	if dwRand >= 6000 then
		AddRoleObjBuff(objTarget,20000017,1,objAtt);
	end
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000017 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*15;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.12*dwLevel^2+30*dwLevel+120),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000017,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[20000018]//////////////宠物技能----缓歌行//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000018]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000018 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*15;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.24*dwLevel^2+28*dwLevel+72),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000018,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000019]//////////////宠物技能----绕指柔//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000019]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300,400,500};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400,500,600};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000019 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*20;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.12*dwLevel^2+26*dwLevel+104),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000019,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[20000020]//////////////宠物技能----失魂引//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000020]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000020 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*15;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.12*dwLevel^2+26*dwLevel+104),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000020,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000021]//////////////宠物技能----寂夜无音//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000021]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300,400};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400,500};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000021 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*20;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.12*dwLevel^2+28*dwLevel+112),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000021,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000022]//////////////宠物技能----沧海月眩//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000022]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000022 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*20;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.12*dwLevel^2+28*dwLevel+112),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000022,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000023]//////////////宠物技能----抑身经//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000023]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000023 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 20
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*20;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.12*dwLevel^2+24*dwLevel+96),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000023,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000024]//////////////宠物技能----凝水决//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000024]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	local dwRand = math.random(10000);
	if dwRand >= 6000 then
		AddRoleObjBuff(objTarget,96000,1,objAtt);
	end
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);

end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000024 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*20;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.12*dwLevel^2+28*dwLevel+112),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000024,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000025]//////////////宠物技能----燕双归//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000025]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000025 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 20
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*20;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.12*dwLevel^2+22*dwLevel+88),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000025,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[20000026]//////////////宠物技能----彩蝶舞//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000026]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000026 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 20
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*20;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.12*dwLevel^2+20*dwLevel+80),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000026,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[20000027]//////////////宠物技能----相思引//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000027]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	print( "/////////////////***************------------------------" )
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000027 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 20
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 1000*12;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 100+(dwLevel-1)*5,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = math.floor(0.12*dwLevel^2+20*dwLevel+80),			--攻击力
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,3,20000027,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[20000028]//////////////宠物技能----高级神佑//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000028]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	--CPetSkillExec:ExecSkillAction(self,1,20000027,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[20000029]//////////////宠物技能----高级蛮力//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000029]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	--CPetSkillExec:ExecSkillAction(self,1,20000027,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000030]//////////////宠物技能----高级铜皮//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000030]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	--CPetSkillExec:ExecSkillAction(self,1,20000027,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000031]//////////////宠物技能----高级暴击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000031]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	--CPetSkillExec:ExecSkillAction(self,1,20000027,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000032]//////////////宠物技能----高级强身//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000032]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	--CPetSkillExec:ExecSkillAction(self,1,20000027,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000033]//////////////宠物技能----高级固元//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000033]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	--CPetSkillExec:ExecSkillAction(self,1,20000027,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000034]//////////////宠物技能----高级反弹//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000034]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	--CPetSkillExec:ExecSkillAction(self,1,20000027,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--技能[20000035]//////////////宠物技能----配合高级反弹技能（无实际效果）//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000035]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {200};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	--CPetSkillExec:ExecSkillAction(self,1,20000027,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;



--技能[20000036]//////////////宠物普通攻击//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[20000036]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {300};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {400};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	-- local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end

function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 20000036 then
		return;
	end
end

----------------------------------------------------------------------------------------------
---------------【获取技能属性】
---------------------------------------------------------------------------------------------- 
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end


--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 800;
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end


--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
	return Consumption
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

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	local infonow = self:GetPropertiesAdd(dwLevel);
	local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));

	if dwLevel == 0 then
		sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	else
		sInfo.sCurLevelExp[1] = szNow;
	end;
	sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 600,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 800,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,tbTargetList,vPos)
	CPetSkillExec:ExecSkillAction(self,1,20000036,tbTargetList,vPos,200)
end;

--被技能命中，播放动作
function Skill:EventHurtP(objCurSkill,objSelf,objEnemy,dwSkillID)

end;

--技能命中修正函数，返回命中值
function Skill:EventHitChange(objRoleSkill,objEnemy,dwHitValue)
	return dwHitValue;
end;

--技能暴击修正函数，返回暴击值
function Skill:EventCritChange(objRoleSkill,objEnemy,dwCritValue)
	return dwCritValue;
end;


--小猪快跑副本技能[52000]/////////////人推猪///////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[52000]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {265};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {275};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
----------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local dwType = objTarget:GetObjType();
	if dwType ~= enEntType.eEntType_Monster then
		return
	end
	-- print( "******************************************************22222222" )
		local objAtt = objRoleSkill:GetPlayer(0);
		objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
		-- print( "******************************************************22222222" )
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	if objUsedSkill:GetID() ~= 52000 then
		return;
	end
	
	local dwType = objDefender:GetObjType();
	if dwType ~= enEntType.eEntType_Monster then
		return
	end
	
	SkillEventFunc.ExecSkillEvent(objAttacker,objDefender,5,1,3,0,{52000,0,1});			--执行击退
	
	local buffSystem = objAttacker:GetSystem("CBuffSystem");
	if not buffSystem then
		return;
	end
	buffSystem:AddBuff(50700022,1)
	
end
-----------------------【获取技能属性】
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 1000
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 2000;
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0,		--攻击力系数
			dwExtraAttack = 0,		--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		-- sCurLevelExp ={},
		-- sNextLevelExp = {};
	}
	-- local infonow = self:GetPropertiesAdd(dwLevel);
	-- local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	-- local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	-- local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	-- if dwLevel == 0 then
		-- sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	-- else
		-- sInfo.sCurLevelExp[1] = szNow;
	-- end;
	-- sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 3000;
	
	dwResult = dwResult + 900 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 950,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 750,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,52000,objTarget,vPos,200,true);
end;




--小猪快跑副本技能[52001]/////////////人拉猪///////////////////////////////////////////////////////////////////////

local Skill = SkillConfig[52001]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {270};
	return sInfo;
end;

function Skill:GetClientTimeArray()
	local sInfo = {370};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local dwType = objTarget:GetObjType();
	if dwType ~= enEntType.eEntType_Monster then
		return
	end
	
	local objAtt = objRoleSkill:GetPlayer(0);
	objRoleSkill:ExecuHarmCount(objAtt,objTarget,dwActCount);
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)

end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
function Skill:EventHurtA(objRoleSkill,objAttacker,objDefender,objUsedSkill,dwDamageValue,isCrit,dwActCount)
	
	if objUsedSkill:GetID() ~= 52001 then
		return;
	end
	
	local dwType = objDefender:GetObjType();
	if dwType ~= enEntType.eEntType_Monster then
		return
	end
	
	SkillEventFunc.ExecSkillEvent(objAttacker,objDefender,8,1,6,0,{52001,0,1});			--执行拉近

	local buffSystem = objAttacker:GetSystem("CBuffSystem");
	if not buffSystem then
		return;
	end
	buffSystem:AddBuff(50700022,1)	
end
---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 5000;
	
	dwResult = CountCurCoolTime(dwAttackSpeed,dwResult) ;
	if dwResult < dwPublicCoolTime then
		dwResult = dwPublicCoolTime;
	end
	
	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return math.floor(50+(dwCurLevel-1)*(20+(dwCurLevel-2)*(0.5+dwCurLevel/50)))
end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)

	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,		--攻击力
			dwAttack_mul = 0,	--攻击力系数
			dwExtraAttack = 0,		--特殊额外攻击力
		},
		
		
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		-- sCurLevelExp ={},
		-- sNextLevelExp = {};
	}
	-- local infonow = self:GetPropertiesAdd(dwLevel);
	-- local infonext = self:GetPropertiesAdd(dwLevel+1);
	
	-- local szNow = string.format(SkillStringConfig[240],RoundFloat(infonow.Active.dwAttack_mul),RoundFloat(infonow.Active.dwAttack));
	-- local szNext = string.format(SkillStringConfig[240],RoundFloat(infonext.Active.dwAttack_mul),RoundFloat(infonext.Active.dwAttack));
	
	-- local szNow = string.format(SkillStringConfig[242],RoundFloat(infonow.Active.dwAttack_mul));
	-- local szNext = string.format(SkillStringConfig[242],RoundFloat(infonext.Active.dwAttack_mul));
	
	-- if dwLevel == 0 then
		-- sInfo.sCurLevelExp[1] = SkillStringConfig[241];
	-- else
		-- sInfo.sCurLevelExp[1] = szNow;
	-- end;
	-- sInfo.sNextLevelExp[1] = szNext;
	return sInfo;
end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 900 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 400,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;

----------------------------------------------------------------------------------------------
----------------------【技能执行事件】
---------------------------------------------------------------------------------------------- 
--技能成功释放，播放动作，客户端调用
function Skill:EventPlayUseAction(objSelf,objTarget,vPos)
	CSkillAttack:ExecSkillAction(self,1,52001,objSelf,vPos,200,true);
end;

-------------------------end--------------------------------------------------------------------------------


--技能[110000]：独孤九剑////////////////////////////////////////////////////////////////////////////////////
local Skill = SkillConfig[110000]; 
--获取技能的执行时间点
function Skill:GetExecTimeArray(objRoleSkill)
	local sInfo = {};
	return sInfo;
end;
----------------------------------------------------------------------------------------------
---------------【技能的效果】
---------------------------------------------------------------------------------------------- 
--技能主动效果
function Skill:SkillActiveEffect(objRoleSkill,objTarget,dwActCount)
	local objPlayer = objRoleSkill:GetPlayer(0);
	local DuGusys = objPlayer:GetSystem("CDuGuSystem");
	local SwordExp = DuGusys:GetEXP();
	local SwordPhase,nShowLevel = DuGuFunctions.PhaseCal(SwordExp);
	local SwordLevel = DuGuFunctions.LevelCal(SwordExp);

	local SwLv = _G.DuGuConfig.SkillList.nActivateLevel;
	local Rand = math.random(10000);
	local value = DuGuFunctions.ChanceCal(SwordExp) * 100
	if (SwordLevel >= SwLv) and (Rand <= value) then
		local SwordId = DuGusys:GetActSwordId();
		local Buffsys = objPlayer:GetSystem("CBuffSystem");
		local BuffPer = _G.DuGuConfig.buff[SwordLevel].BuffPer * 100;
		
		--攻击
		local dwRand = math.random(10000);
		if (dwRand <= BuffPer) then
			Buffsys:AddBuff(110000,SwordLevel);
		end
		
		--暴击
		if (SwordId >= 6) then
			local dwRand = math.random(10000);
			if (dwRand <= BuffPer) then
				Buffsys:AddBuff(110001,SwordLevel);
			end
		end
		
		--防御
		if (SwordId >= 7) then
			local dwRand = math.random(10000);
			if (dwRand <= BuffPer) then
				Buffsys:AddBuff(110002,SwordLevel);
			end
		end
		
		--破甲
		if (SwordId >= 8) then
			local dwRand = math.random(10000);
			if (dwRand <= BuffPer) then
				Buffsys:AddBuff(110003,SwordLevel);
			end
		end
		
		--hp
		if (SwordId >= 9) then
			local dwRand = math.random(10000);
			if (dwRand <= 1000) then
				Buffsys:AddBuff(110004,SwordLevel);
			end
		end
	end
end

--技能被动效果
function Skill:SkillPassiveEffect(objRoleSkill)
	
end

--技能激活效果
function Skill:SkillOpenEffect(objRoleSkill)
  
end

--技能关闭效果
function Skill:SkillCloseEffect(objRoleSkill)
    
end
---------------------------------------------------------------------------------------------------------------------------
-------------------【获取技能属性】
---------------------------------------------------------------------------------------------------------------------------
--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取吟唱时间(毫秒)
function Skill:GetSingTime(dwRoleID,dwLevel,dwTargetType,dwTargetID)
	return 0
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	return 0
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)

end

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {{id=0,num=0},{id=0,num=0}},
			wxd = 0,	--五行仅能点
		}
		
	return Consumption
end

--获取技能附加的属性（表）： dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 0,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


function Skill:GetSkillExplain(dwRoleID,dwLevel)

end;

--技能的相关事件
function Skill:GetSkillTime(dwLevel,dwAttackSpeed)
	local dwResult = 1000;
	
	dwResult = dwResult + 500 - dwAttackSpeed ;
	if dwResult < 600 then
		dwResult = 600;
	end
	local sInfo = 
	{
		dwRest = 75,	--延迟时间，技能释放完成后，过这段时间才进入硬直
		dwStone = 450,	--硬直时间，这段时间内不可以播放其他动作
		dwUsed = 500,	--技能使用时间，有条件播放动作
		dwAuto = dwResult,	--自动攻击的再使用时间
	}
	
	return sInfo;
end;



--[[
objRoleSkill是下面的第一个参数，所以这里就省略了

成功使用技能后
EventReadyExecSkillP——objSelf
--命中后统计
EventCompExecSkillP——objSelf,tbSkillResult
--例子
function Skill:EventCompExecSkillP(objRoleSkill,objSelf,tbResult)
	for n,val in pairs(tbResult)do
		--dwType 类型  目标ID
		local dwType,dwID = ReleaseKey(n);
		--目标objTarget
		local objTarget = objRoleSkill:GetRoleObj(dwType,dwID)
		if objTarget then
			
		end
	end
end;

对目标造成伤害前
EventDamageChange——objSelf,objEnemy,dwSkillID,dwSkillLevel,Value,isCrit，需要返回修正后的伤害值

对目标造成伤害后
EcentHurtA——objSelf,objEnemy,dwSkillID,dwSkillLevel,Value,isCrit

受到伤害前
EventReadyHurtP——和EventHurtP一样，需要返回修正后的伤害值

受到伤害后
EventHurtP——objSelf,objEnemy,dwSkillID,dwSkillLevel,Value,isCrit,dwExecTime,dwActCount

受到治疗前
EventReadyTreatP——和EventTreatP一样，需要返回修正后的治疗值

受到治疗后
EventTreatP——objSelf,objDoctor,dwSkillID,dwSkillLevel,Value

对目标治疗前
EventTreatChange——objSelf,objPatient,dwSkillID,dwSkillLevel,Value，需要返回修正后的治疗值

对目标治疗后
EventTreatA——objSelf,objPatient, dwSkillID,dwSkillLevel,Value

吃药之后，血包不算
EventMedicine——dwType,dwValue
dwType:1，红药；2蓝药
dwValue:吃下去的量

]]--