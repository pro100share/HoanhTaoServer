--[[
角色基础属性项：更新日子（2012.5.24）
obj.dwAttack = 0;--攻击
	obj.dwDefense = 0;--防御
	obj.dwFlee = 0;--身法
	obj.dwCrit = 0;--暴击
	obj.dwHPMax= 0;--生命max
	obj.dwMPMax= 0;--内力max
	obj.dwMoveSpeed= 0;--移动速度
	obj.dwAttackSpeed= 0;--攻击速度
	obj.dwIgnoreDefense= 0;--忽视防御
	obj.dwAppendAttack = 0;--追加伤害
	obj.dwRemitAttack = 0;--伤害减免(万分比)使用ExecAddBuffEffect
	obj.dwBounceAttack= 0;--伤害反弹
	obj.dwAbsorbHP= 0;--生命吸取
	obj.dwAbsorbMP = 0;--内力吸取
	obj.dwHitPercent = 0;--命中
	obj.dwDuck = 0;--闪避率
	obj.dwAppendCrit = 0;--暴击伤害（百分比）
	obj.dwAllSkillUpLv = 0; --武功层数
	obj.dwPKForbid = 0;--PK保护
	
	
	obj.dwSkillForbidFlag = 0;--技能禁止标志，-1表示全部禁止
	obj.dwMoveForbidFlag = 0;--移动禁止标志
	obj.dwUseItemForbidFlag = 0;--物品使用禁止标志
	
	obj.dwDanderUp = 0;--怒气增加
	obj.dwExpUp = 0;--经验增加
	obj.dwMountExpUp = 0;--坐骑经验增加
	obj.dwSitUp = 0;--打坐收益增加
	obj.dwMartialUp = 0;--团练加速值
	obj.dwMartialExpUp = 1； --百分比属性 增加团练获取经验
	obj.dwMartialZhenqiUp =；-百分比属性 增加团练获取真气
	obj.dwSkillKlgUp = 0;--技能熟练度增加
	obj.dwBossAppend = 0；--对BOSS类怪物增加伤害
]]--



------------------5D网Vip特效卡---------------------
--buff[8911]
local Buff = BuffBasicInfo[8911]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, buffLevel);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*7;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);	
end;



------------------5D网贵宾称号卡---------------------
local Buff = BuffBasicInfo[8912]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*7;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10032)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------5D网Vip称号卡---------------------
local Buff = BuffBasicInfo[8913]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*7;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10033)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------洪武尊者特效卡---------------------
--buff[8911]
local Buff = BuffBasicInfo[8914]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, buffLevel);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*7;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);	
end;


------------------凤凰校尉---------------------
local Buff = BuffBasicInfo[8915]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*5;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10034)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------凤凰都尉---------------------
local Buff = BuffBasicInfo[8916]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*10;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10035)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------凤凰将军---------------------
local Buff = BuffBasicInfo[8917]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*15;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10036)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------------------青云蜀道----------------------------
--buff[9506]
local Buff = BuffBasicInfo[9506]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
		local Hp = 100;
		if (buffLevelel == 1) then
			Hp = 250
		elseif (buffLevelel == 2) then
			Hp = 300
		elseif (buffLevelel == 3) then
			Hp = 400
		end
		buffSystem:ChangeHp(Hp,-1,0);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)

end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = 1000*20;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)

end;



----------------------------------每2秒恢复自身血量1%buff----------------------------
--buff[198000]
local Buff = BuffBasicInfo[198000]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local Monster = buffSystem:GetBattleInfo()
	local HP = 0;

	if Monster then
		HP = Monster.dwHPMax/100;
	end
	buffSystem:ChangeHp(HP,-1,0);

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = 2000;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
end;


----------------------------------暴击增加100%BUFF----------------------------
--buff[50600001]

local Buff = BuffBasicInfo[50600001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 0;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;

--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 30000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	local troopNum = 1;
	objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwCrit = 1;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------------------对BOSS伤害增加300%BUFF----------------------------
--BOSS伤害
--buff[50600002]
local Buff = BuffBasicInfo[50600002]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 30000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	--local Level = buffObj.m_Level
	local info = {};
	info.dwBossAppend = 3;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

-- ----------------------------------每秒恢复自身血量3%buff----------------------------
--buff[50600003]
local Buff = BuffBasicInfo[50600003]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local HP = buffSystem:GetBattleInfo().dwHPMax*0.1
	local Z = objBuff.m_releaseType
	local G = objBuff.m_releaseId
	buffSystem:ChangeHp(HP,Z,G);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = buffSystem:GetBattleInfo().dwHPMax*0.1
	objBuff:SetAppendBuffValue(buffSystem, value);
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000*30;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = 1000;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	-- local troopNum = 1;
	-- objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	-- local info = {};
	-- --降低移动速度50
	-- info.dwMoveSpeed = -50;
	-- buffSystem:ExecAddBuffEffect(info, buffObj.m_id);

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	--buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------------------防御增加50%BUFF----------------------------
--buff[50600004]

local Buff = BuffBasicInfo[50600004]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 0;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;

--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 30000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	local troopNum = 1;
	objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwDefense = 0.5;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------------------修行顿悟暴击符BUFF----------------------------
--buff[5809295]

local Buff = BuffBasicInfo[5809295]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	-- objBuff:SetBuffValue(buffSystem, value);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	-- local value = 0;
	-- objBuff:SetAppendBuffValue(buffSystem, value);
end;

--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000*60*10;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	-- local troopNum = 1;
	-- objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------------------修行大悟暴击符BUFF----------------------------
--buff[5809296]

local Buff = BuffBasicInfo[5809296]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	-- objBuff:SetBuffValue(buffSystem, value);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	-- local value = 0;
	-- objBuff:SetAppendBuffValue(buffSystem, value);
end;

--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000*60*10;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	-- local troopNum = 1;
	-- objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

-------------------------------------------法身降魔咒-------------------------------------------
--buff[61003]
local Buff = BuffBasicInfo[61003]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, buffLevel);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000
	if (buffLevel == 2) then
		lifeTime = 1000*2
	elseif (buffLevel == 3) then
		lifeTime = 1000*3
	elseif (buffLevel == 4) then
		lifeTime = 1000*4
	elseif (buffLevel == 5) then
		lifeTime = 1000*5
	elseif (buffLevel == 6) then
		lifeTime = 1000*6
	elseif (buffLevel == 7) then
		lifeTime = 1000*7		
	elseif (buffLevel == 8) then
		lifeTime = 1000*8	
	elseif (buffLevel == 9) then
		lifeTime = 1000*10
	end
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);	
end;


----------------------------------桃花迷阵----------------------------
--buff[9563]
local Buff = BuffBasicInfo[9563]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000*60*30;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------------------枪大招眩晕----------------------------
--buff[61004]
local Buff = BuffBasicInfo[61004]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 300;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwUseItemForbidFlag = 1;
	info.dwMoveForbidFlag = 1;
	info.dwSkillForbidFlag = -1;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


---------------无色禅师大招---------------------
--buff[101120162]
local Buff = BuffBasicInfo[101120162]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)

end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000*60;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwCrit = 0.2;
	info.dwFlee = 0.5;
	info.dwAttack = 0.5;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------一代宗师称号卡---------------------
local Buff = BuffBasicInfo[8918]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*15;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10037)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------绝世高手称号卡---------------------
local Buff = BuffBasicInfo[8919]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*15;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10038)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------钻石会员称号特效卡---------------------
--buff[8911]
local Buff = BuffBasicInfo[8920]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, buffLevel);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*15;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);	
end;


------------------YY土豪称号卡---------------------
local Buff = BuffBasicInfo[8921]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*15;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10039)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------------------每2秒恢复自身血量100%buff----------------------------
--buff[199000]
local Buff = BuffBasicInfo[199000]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local Monster = buffSystem:GetBattleInfo()
	local HP = 0;

	if Monster then
		HP = Monster.dwHPMax;
	end
	buffSystem:ChangeHp(HP,-1,0);

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = 2000;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
end;


------------------高端大气上档次称号卡---------------------
local Buff = BuffBasicInfo[8922]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*15;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10040)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------低调奢华有内涵称号卡---------------------
local Buff = BuffBasicInfo[8924]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*15;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10041)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



------------------高端大气上档次特效卡---------------------
--buff[8923]
local Buff = BuffBasicInfo[8923]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, buffLevel);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*15;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);	
end;



------------------低调奢华有内涵特效卡---------------------
--buff[8925]
local Buff = BuffBasicInfo[8925]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, buffLevel);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*15;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);	
end;



------------------至尊王者称号卡---------------------
local Buff = BuffBasicInfo[8926]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10042)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------高级会员称号卡---------------------
local Buff = BuffBasicInfo[8927]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*15;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10043)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------钻石会员称号卡---------------------
local Buff = BuffBasicInfo[8928]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*15;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10044)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------至尊会员称号卡---------------------
local Buff = BuffBasicInfo[8929]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*15;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10045)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------一统江湖称号卡---------------------
local Buff = BuffBasicInfo[8930]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*15;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10046)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------略有小成称号卡---------------------
local Buff = BuffBasicInfo[8931]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 60*60*1000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10047)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------初窥门径称号卡---------------------
local Buff = BuffBasicInfo[8932]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 60*60*1000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10048)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------融会贯通称号卡---------------------
local Buff = BuffBasicInfo[8933]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 60*60*1000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10049)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------风尘隐侠称号卡---------------------
local Buff = BuffBasicInfo[8934]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 60*60*1000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10050)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------罕有敌手称号卡---------------------
local Buff = BuffBasicInfo[8935]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 60*60*1000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10051)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------旷世奇才称号卡---------------------
local Buff = BuffBasicInfo[8936]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 60*60*1000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10052)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------========================-------------------
local Buff = BuffBasicInfo[8937]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10053)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8938]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10054)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8939]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10055)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------========================-------------------
local Buff = BuffBasicInfo[8940]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10056)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8941]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10057)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8942]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10058)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------========================-------------------
local Buff = BuffBasicInfo[8943]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10059)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8944]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10060)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8945]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10061)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8946]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10062)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8947]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10063)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8948]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10064)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8949]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10065)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------========================-------------------
local Buff = BuffBasicInfo[8950]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10066)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8951]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10067)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8952]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10068)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8953]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10069)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8954]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10070)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8955]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10071)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------========================-------------------
local Buff = BuffBasicInfo[8956]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10072)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8957]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10073)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8958]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10074)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8959]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10075)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8960]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10076)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------========================-------------------
local Buff = BuffBasicInfo[8961]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10077)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8962]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10078)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8963]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10079)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8964]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10080)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8965]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10081)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8966]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10082)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8967]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10083)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8968]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10084)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8969]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10085)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8970]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10086)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8971]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10087)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8972]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10088)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8973]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10089)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8974]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10090)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8975]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10091)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8976]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10092)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8977]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10093)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------



----------------------========================-------------------
local Buff = BuffBasicInfo[8978]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 60*60*1000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8979]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 60*60*1000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8980]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 60*60*1000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8981]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 60*60*1000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8982]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 60*60*1000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8983]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 60*60*1000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8984]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8985]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8986]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8987]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8988]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8989]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8990]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8991]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------========================-------------------
local Buff = BuffBasicInfo[8992]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------========================-------------------
local Buff = BuffBasicInfo[8993]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8994]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8995]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8996]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8997]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8998]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[8999]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10000]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10002]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10003]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10004]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10005]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------========================-------------------
local Buff = BuffBasicInfo[10006]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10007]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10008]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10009]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10010]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10011]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10012]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10013]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10014]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10015]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10016]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10017]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10018]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10019]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10020]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10021]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10022]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10023]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------========================-------------------
local Buff = BuffBasicInfo[10024]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------=========老玩家回归===============-------------------
local Buff = BuffBasicInfo[10025]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*7;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10094)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------=========52PK专属回归===============-------------------
local Buff = BuffBasicInfo[10026]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*7;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10095)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------=========温柔善良小萝莉1天===============-------------------
local Buff = BuffBasicInfo[10027]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*1;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10096)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------=========温柔善良小萝莉3天===============-------------------
local Buff = BuffBasicInfo[10028]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10097)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------=========温柔善良小萝莉7天===============-------------------
local Buff = BuffBasicInfo[10029]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*7;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10098)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------=========美丽大方御姐范称号卡1天===============-------------------
local Buff = BuffBasicInfo[10030]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*1;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10099)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------=========美丽大方御姐范称号卡3天===============-------------------
local Buff = BuffBasicInfo[10031]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10100)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------=========美丽大方御姐范称号卡7天===============-------------------
local Buff = BuffBasicInfo[10032]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*7;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10101)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------=========粗犷威猛的大叔1天===============-------------------
local Buff = BuffBasicInfo[10033]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10102)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------=========粗犷威猛的大叔3天===============-------------------
local Buff = BuffBasicInfo[10034]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10103)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------=========粗犷威猛的大叔7天===============-------------------
local Buff = BuffBasicInfo[10035]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*7;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10104)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------=========风流倜傥帅小伙1天===============-------------------
local Buff = BuffBasicInfo[10036]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10105)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------=========风流倜傥帅小伙3天===============-------------------
local Buff = BuffBasicInfo[10037]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10106)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------=========风流倜傥帅小伙7天===============-------------------
local Buff = BuffBasicInfo[10038]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*7;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10107)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------=========传说中的勇者1天===============-------------------
local Buff = BuffBasicInfo[10039]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*1;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10100)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------=========传说中的勇者3天===============-------------------
local Buff = BuffBasicInfo[10040]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*3;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10105)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------=========传说中的勇者7天===============-------------------
local Buff = BuffBasicInfo[10041]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*24*7;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10110)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------=========天下第一杀手1小时===============-------------------
local Buff = BuffBasicInfo[10042]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*1;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10111)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------=========BUG般的存在1小时===============-------------------
local Buff = BuffBasicInfo[10043]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000*1;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10112)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;




----------------------========================-------------------
local Buff = BuffBasicInfo[10044]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10113)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10045]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10114)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------========================-------------------
local Buff = BuffBasicInfo[10046]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10115)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10047]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10116)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10048]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10117)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10049]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10118)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10050]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10119)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10051]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10120)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------========================-------------------
local Buff = BuffBasicInfo[10052]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10121)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10053]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10122)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10054]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10123)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10055]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10124)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10056]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10125)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------========================-------------------
local Buff = BuffBasicInfo[10057]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10126)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10058]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer()
	if not objPlayer then
		return
	end
	
	local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
	if not CTitleSystem then
		return
	end
	CTitleSystem:DelTitle(10127)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10059]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10060]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------========================-------------------
local Buff = BuffBasicInfo[10061]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------========================-------------------
local Buff = BuffBasicInfo[10062]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10063]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------========================-------------------
local Buff = BuffBasicInfo[10064]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------========================-------------------
local Buff = BuffBasicInfo[10065]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------========================-------------------
local Buff = BuffBasicInfo[10066]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------========================-------------------
local Buff = BuffBasicInfo[10067]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10068]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------========================-------------------
local Buff = BuffBasicInfo[10069]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------========================-------------------
local Buff = BuffBasicInfo[10070]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------========================-------------------
local Buff = BuffBasicInfo[10071]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------========================-------------------
local Buff = BuffBasicInfo[10072]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------========================-------------------
local Buff = BuffBasicInfo[10073]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;





--buff[200000]宠物血包

local Buff = BuffBasicInfo[200000]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	
	if buffSystem:IsDead() then	--死掉就不回血了
		return ;
	end;
	
	local NowValue = self:GetValue(objBuff);
	--print("NowValue================================= ",NowValue)
	
	local tbNowInfo = buffSystem:GetPetBattleInfo();
	if not tbNowInfo then
		return ;
	end
	--print("tbNowInfo================================= ",tbNowInfo)
	
	local dwChgValue = math.min(tbNowInfo.dwHPMax*0.20,NowValue);
	--print("dwChgValue================================= ",dwChgValue)
	
	local ChgValue = buffSystem:ChangePetHp(dwChgValue,-1,0);
	--print("ChgValue================================= ",ChgValue)
	if ChgValue then
		NowValue = NowValue - ChgValue;
	end
	self:SetValue(NowValue,objBuff,buffSystem,objBuff.m_Level);
	
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel,num)
	local value = 0;
	if (buffLevel == 1) then
		value = 1000*num;
	elseif(buffLevel == 2) then
		value = 2000*num;
	elseif (buffLevel == 3) then
		value = 3000*num;
	elseif (buffLevel == 5) then
		value = 5000*num;
	end
	--print( "value=====================",value )
	objBuff:SetAppendBuffValue(buffSystem, value);
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = 6000;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	local troopNum = 20;
	objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)

end;





------------------------攻击增加10%

local Buff = BuffBasicInfo[50700001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 0;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;

--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 5000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	local troopNum = 1;
	objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	buffSystem:ExecAddBuffPercent({dwAttack = 0.1}, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------------------防御增加10%
local Buff = BuffBasicInfo[50700002]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)

end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 5000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwDefense = 1.1;	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--------------------------------提升500速度
local Buff = BuffBasicInfo[50700003]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)

end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 10000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwMoveSpeed = 500;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

-----------------降低400移动速度

local Buff = BuffBasicInfo[50700004]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)

end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 5000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwMoveSpeed = -400;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end

-----------------------沉默5秒
--沉默
local Buff = BuffBasicInfo[50700005]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 5000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwSkillForbidFlag = -1;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
--------------------------定身

local Buff = BuffBasicInfo[50700006]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 5000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwMoveForbidFlag = 1;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------眩晕
local Buff = BuffBasicInfo[50700007]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 5000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwUseItemForbidFlag = 1;
	info.dwMoveForbidFlag = 1;
	info.dwSkillForbidFlag = -1;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

-------------------------vip
local Buff = BuffBasicInfo[50700008]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 300000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------------经验书

local Buff = BuffBasicInfo[50700009]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local NowValue = 1 * buffLevelel;
	self:SetValue(NowValue,objBuff,buffSystem,objBuff.m_Level);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return ;
	end
	
	local MaxLv = RoleUpLevelConfig.dwMaxLevel
	
	local dwCurLevel = objPlayer:GetLevel();
	local dwNextLevel = dwCurLevel+1
	
	local expValue = RoleUpLevelConfig[dwNextLevel].dwExp - RoleUpLevelConfig[dwCurLevel].dwExp;

	local info = {};
	if dwNextLevel > MaxLv then
		return ;
	end
	
	objPlayer:AddExp(expValue);
end
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

-----------------------------演武双倍
local Buff = BuffBasicInfo[50700010]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local NowValue = buffLevelel;
	self:SetValue(NowValue,objBuff,buffSystem,objBuff.m_Level);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 300000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local Level = buffObj.m_Level
	local info = {};
	info.dwMartialZhenqiUp = 1*Level;
	info.dwMartialExpUp = 1*Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

-------------------------十倍经验
local Buff = BuffBasicInfo[50700011]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local NowValue = buffLevelel;
	self:SetValue(NowValue,objBuff,buffSystem,objBuff.m_Level);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 180000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local Level = buffObj.m_Level
	local info = {};
	info.dwExpUp = 10*Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------扣除10%血量
local Buff = BuffBasicInfo[50700012]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local HP = buffSystem:GetBattleInfo().dwHPMax*0.1
	HP = HP + 0.01
	local Z = objBuff.m_releaseType
	local G = objBuff.m_releaseId
	buffSystem:ChangeHp(-HP,Z,G);
	
	-- local objPlayer = buffSystem:GetOtherPlayer(objBuff.m_releaseId);
	-- print( "objPlayer========================",objPlayer )
	-- if objPlayer then
		-- local sOtherInfo = objPlayer:GetSystem("CSkillSystem"):GetInfo();
		-- print( "sOtherInfo========================",sOtherInfo )
		-- HP = sOtherInfo.dwHPMax*0.1;
		-- print( "HP========================",HP )
	-- end

	-- local Z = objBuff.m_releaseType
	-- local G = objBuff.m_releaseId
	-- buffSystem:ChangeHp(-HP,Z,G);	
	
	
	-- local player = buffSystem:GetPlayer();
	-- local objTargetPlayer = player:GetOtherPlayer(objBuff.m_releaseId);
	
	-- local objplayer = buffSystem:GetPlayer();
	-- print( "objplayer========================",objplayer )
	-- local scriptSystem = objplayer:GetSystem('CScriptSystem');
	-- print( "scriptSystem========================",scriptSystem )
	-- if not scriptSystem then
		-- return ;
	-- end	
	-- local bPlayer,dwTargetID = scriptSystem:IsLockPlayer()
	-- print( "dwTargetID========================",dwTargetID )
	-- if not dwTargetID then
		-- return ;
	-- end

	-- --local objTargetPlayer = buffSystem:GetOtherPlayer(dwTargetID);
	-- local objTargetPlayer = objplayer:GetOtherPlayer(dwTargetID);
	-- print( "objTargetPlayer========================",objTargetPlayer )
	-- if not objTargetPlayer then
		-- return;
	-- end
	-- -- local sInfo = objTargetPlayer:GetSystem("CSkillSystem"):GetInfo();
	-- -- local HP = sInfo.dwHPMax*0.1;
	-- -- print( "HP========================",HP )
	
	-- local buffSystem = objTargetPlayer:GetSystem("CBuffSystem")
	-- local HP = buffSystem:GetBattleInfo().dwHPMax*0.1
	-- buffSystem:ChangeHp(-HP,-1,0);
	

	-- local Z = objBuff.m_releaseType
	-- local G = objBuff.m_releaseId
	-- buffSystem:ChangeHp(-HP,Z,G);	
	
	
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = buffSystem:GetBattleInfo().dwHPMax*0.1
	objBuff:SetAppendBuffValue(buffSystem, value);
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 5000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = 1000;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	local classId = objBuff.m_classId;  --该buff所在的buff组
	local troopNum = 6;
	objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)

end;


--------------------扣除20%内力
local Buff = BuffBasicInfo[50700013]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local MP = buffSystem:GetBattleInfo().dwMPMax*0.2
	buffSystem:ChangeMp(-MP,-1,0);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = buffSystem:GetBattleInfo().dwHPMax*0.1
	objBuff:SetAppendBuffValue(buffSystem, value);
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 5000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = 1000;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	local classId = objBuff.m_classId;  --该buff所在的buff组
	local troopNum = 6;
	objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)

end;



----------------------------------每20秒恢复自身血量200----------------------------
--buff[50700014]
local Buff = BuffBasicInfo[50700014]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	-- local Monster = buffSystem:GetBattleInfo()
	-- local HP = 0;

	-- if Monster then
		-- HP = Monster.dwHPMax/100;
	-- end
	--print( "***********77777777**********888888888888************" )
	buffSystem:ChangeHp(200,-1,0);

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = 20000;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
end;

--------------------------------------特效
local Buff = BuffBasicInfo[50700015]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	-- local Monster = buffSystem:GetBattleInfo()
	-- local HP = 0;

	-- if Monster then
		-- HP = Monster.dwHPMax/100;
	-- end
	--print( "***********77777777**********888888888888************" )
	--buffSystem:ChangeHp(200,-1,0);

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
end;




----------------------------------群侠副本用暴击增加BUFF----------------------------
--buff[50600005]

local Buff = BuffBasicInfo[50600005]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  
	local NowValue = 1 * buffLevelel;
	self:SetValue(NowValue,objBuff,buffSystem,objBuff.m_Level);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 0;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;

--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000*60*30;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	local troopNum = 1;
	objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwCrit = 0.1*buffObj.m_Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------------------群侠副本用防御力增加BUFF----------------------------
--buff[50600005]

local Buff = BuffBasicInfo[50600006]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  
	local NowValue = 1 * buffLevelel;
	self:SetValue(NowValue,objBuff,buffSystem,objBuff.m_Level);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 0;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;

--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000*60*30;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	local troopNum = 1;
	objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwDefense = 0.1*buffObj.m_Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------------------群侠副本用攻击力增加BUFF----------------------------
--buff[50600007]

local Buff = BuffBasicInfo[50600007]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  
	local NowValue = 1 * buffLevelel;
	self:SetValue(NowValue,objBuff,buffSystem,objBuff.m_Level);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 0;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;

--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000*60*30;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	local troopNum = 1;
	objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwAttack = 0.1*buffObj.m_Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------------------群侠副本用血量增加BUFF----------------------------
--buff[50600008]

local Buff = BuffBasicInfo[50600008]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  
	local NowValue = 1 * buffLevelel;
	self:SetValue(NowValue,objBuff,buffSystem,objBuff.m_Level);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 0;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;

--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000*60*30;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	local troopNum = 1;
	objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwHPMax = 0.1*buffObj.m_Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------------------群侠副本用身法增加BUFF----------------------------
--buff[50600009]

local Buff = BuffBasicInfo[50600009]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  
	local NowValue = 1 * buffLevelel;
	self:SetValue(NowValue,objBuff,buffSystem,objBuff.m_Level);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 0;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;

--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000*60*30;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	local troopNum = 1;
	objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwFlee = 0.1*buffObj.m_Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------------------群侠副本用闪避增加BUFF----------------------------
--buff[50600010]

local Buff = BuffBasicInfo[50600010]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  
	local NowValue = 1 * buffLevelel;
	self:SetValue(NowValue,objBuff,buffSystem,objBuff.m_Level);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 0;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;

--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000*60*30;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	local troopNum = 1;
	objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwDuck = 0.1*buffObj.m_Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------------------群侠副本用怪物狂暴buff---------------------------攻击+20%，防御+20%

local Buff = BuffBasicInfo[50600011]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  
	-- local NowValue = 1 * buffLevelel;
	-- self:SetValue(NowValue,objBuff,buffSystem,objBuff.m_Level);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value);
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	-- local value = 0;
	-- objBuff:SetAppendBuffValue(buffSystem, value);
end;

--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = nil;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	local troopNum = 1;
	objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwAttack = 0.2*buffObj.m_Level;
	info.dwDefense = 0.2*buffObj.m_Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
