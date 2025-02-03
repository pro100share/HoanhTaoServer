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
	obj.dwPoJiaDiKang = 0;--伤害抵御（破甲抵抗）
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
local Buff = BuffBasicInfo[10074]
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
	CTitleSystem:DelTitle(10128)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


local Buff = BuffBasicInfo[10075]
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
	CTitleSystem:DelTitle(10129)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


local Buff = BuffBasicInfo[10076]
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
	CTitleSystem:DelTitle(10130)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


local Buff = BuffBasicInfo[10077]
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
	CTitleSystem:DelTitle(10131)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


local Buff = BuffBasicInfo[10078]
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
	CTitleSystem:DelTitle(10132)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


local Buff = BuffBasicInfo[10079]
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
	CTitleSystem:DelTitle(10133)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------------------群侠副本用减少攻击力BUFF----------------------------
--buff[50600012]

local Buff = BuffBasicInfo[50600012]
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
	info.dwAttack = -0.1*buffObj.m_Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------------------群侠副本用减少防御力BUFF----------------------------
--buff[50600013]

local Buff = BuffBasicInfo[50600013]
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
	info.dwDefense = -0.1*buffObj.m_Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------------------群侠副本用减少防御力和攻击力BUFF----------------------------
--buff[50600014]

local Buff = BuffBasicInfo[50600014]
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
	info.dwAttack = -0.1*buffObj.m_Level;
	info.dwDefense = -0.1*buffObj.m_Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------------------群侠副本用减少暴击BUFF----------------------------
--buff[50600015]

local Buff = BuffBasicInfo[50600015]
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
	info.dwCrit = -0.1*buffObj.m_Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



----------------------------------群侠副本用减少防御力和攻击力BUFF----------------------------
--buff[50600016]

local Buff = BuffBasicInfo[50600016]
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
	info.dwDefense = 0.1*buffObj.m_Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


----------------------=============名剑~无坚不裂9阶（伤害加深）===========-------------------
--buff[71004]

local Buff = BuffBasicInfo[71004]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	-- local NowValue = (2000+math.floor(buffLevelel/10)*500)/100
	-- self:SetValue(NowValue,objBuff,buffSystem,objBuff.m_Level);
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
	-- local value = 1 * 5;
	-- objBuff:SetAppendBuffValue(buffSystem, value);
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 8000;
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
	-- local troopNum = 7;
	-- objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local Lv = buffObj.m_Level
	local info = {};
	
	info.dwRemitAttack = -100*60
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------=============名剑~无坚不裂10阶ok（伤害加深）===========-------------------
--buff[71005]

local Buff = BuffBasicInfo[71005]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	-- local NowValue = (2000+math.floor(buffLevelel/10)*500)/100
	-- self:SetValue(NowValue,objBuff,buffSystem,objBuff.m_Level);
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
	-- local value = 1 * 5;
	-- objBuff:SetAppendBuffValue(buffSystem, value);
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 8000;
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
	-- local troopNum = 7;
	-- objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local Lv = buffObj.m_Level
	local info = {};
	
	info.dwRemitAttack = -100*120
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--宝剑系统BUFF （特殊属性卡）剑气·流血 每秒减少敌方10%血量，持续3秒
--buff[71006]
local Buff = BuffBasicInfo[71006]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

	local objPlayer = buffSystem:GetOtherPlayer(objBuff.m_releaseId);
	if not objPlayer then
		return;
	end
	local sOtherInfo = objPlayer:GetSystem("CSkillSystem"):GetInfo();
	-- local HP = sOtherInfo.dwHPMax * 0.03;
	-- buffSystem:ChangeHp(-HP,-1,0);	
	
	local dwAttack = sOtherInfo.dwAttack;
	local dwHPMax = buffSystem:GetBattleInfo().dwHPMax;
	
	local dwHPDown = dwHPMax * 0.03;
	if dwHPDown > dwAttack then
		dwHPDown = dwAttack;
	end
	
	local Z = objBuff.m_releaseType
	local G = objBuff.m_releaseId
	buffSystem:ChangeHp(-dwHPDown,Z,G);
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
	local lifeTime = 3000;
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


--buff[200010]铁布衫血包小

local Buff = BuffBasicInfo[200010]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	
	if buffSystem:IsDead() then	--死掉就不回血了
		return ;
	end;
	local objplayer = buffSystem:GetPlayer();
	if not objplayer then
		return ;
	end
	
	local ctieBuShanSystem = objplayer:GetSystem("CTieBuShanSystem");	
	--霸体值已满
	if ctieBuShanSystem:CheckForbidValueFull() then
		return;
	end;
	
	local NowValue = self:GetValue(objBuff);				--2000
	local Value = 0

	--铁布衫当前等级霸体值上限
	local dwClothLimit = ctieBuShanSystem:GetForbidValueMax();
	--获得当前等级最大霸体值
	local dwClothCurrent = ctieBuShanSystem:GetForbidValue()
	--当前等级剩余霸体值
	local lastValue = dwClothLimit - dwClothCurrent;		--500

	--要增加的固定霸体值
	local dwChgValue = math.floor(dwClothLimit*0.3)+300;	--700
	
	if lastValue <= dwChgValue then
		Value = lastValue;
		if Value > NowValue then
			Value = NowValue;
		end
	else
		Value = dwChgValue;
		if Value > NowValue then
			Value = NowValue;
		end
	end
	
	ctieBuShanSystem:AddForbidValue(Value)
	
	if Value then
		NowValue = NowValue - Value;
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
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 0;
	if (buffLevel == 1) then
		value = 2000;
	end
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



--buff[200011]铁布衫血包中

local Buff = BuffBasicInfo[200011]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	
	if buffSystem:IsDead() then	--死掉就不回血了
		return ;
	end;
	local objplayer = buffSystem:GetPlayer();
	if not objplayer then
		return ;
	end
	
	local ctieBuShanSystem = objplayer:GetSystem("CTieBuShanSystem");	
	--霸体值已满
	if ctieBuShanSystem:CheckForbidValueFull() then
		return;
	end;
	
	local NowValue = self:GetValue(objBuff);				--2000
	local Value = 0

	--铁布衫当前等级霸体值上限
	local dwClothLimit = ctieBuShanSystem:GetForbidValueMax();
	--获得当前等级最大霸体值
	local dwClothCurrent = ctieBuShanSystem:GetForbidValue()
	--当前等级剩余霸体值
	local lastValue = dwClothLimit - dwClothCurrent;		--500

	--要增加的固定霸体值
	local dwChgValue = math.floor(dwClothLimit*0.3)+600;	--700
	
	if lastValue <= dwChgValue then
		Value = lastValue;
		if Value > NowValue then
			Value = NowValue;
		end
	else
		Value = dwChgValue;
		if Value > NowValue then
			Value = NowValue;
		end
	end
	
	ctieBuShanSystem:AddForbidValue(Value)
	
	if Value then
		NowValue = NowValue - Value;
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
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 0;
	if (buffLevel == 1) then
		value = 5000;
	end
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


--buff[200012]铁布衫血包大

local Buff = BuffBasicInfo[200012]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	
	if buffSystem:IsDead() then	--死掉就不回血了
		return ;
	end;
	local objplayer = buffSystem:GetPlayer();
	if not objplayer then
		return ;
	end
	
	local ctieBuShanSystem = objplayer:GetSystem("CTieBuShanSystem");	
	--霸体值已满
	if ctieBuShanSystem:CheckForbidValueFull() then
		return;
	end;
	
	local NowValue = self:GetValue(objBuff);				--2000
	local Value = 0

	--铁布衫当前等级霸体值上限
	local dwClothLimit = ctieBuShanSystem:GetForbidValueMax();
	--获得当前等级最大霸体值
	local dwClothCurrent = ctieBuShanSystem:GetForbidValue()
	--当前等级剩余霸体值
	local lastValue = dwClothLimit - dwClothCurrent;		--500

	--要增加的固定霸体值
	local dwChgValue = math.floor(dwClothLimit*0.3)+1500;	--700
	
	if lastValue <= dwChgValue then
		Value = lastValue;
		if Value > NowValue then
			Value = NowValue;
		end
	else
		Value = dwChgValue;
		if Value > NowValue then
			Value = NowValue;
		end
	end
	
	ctieBuShanSystem:AddForbidValue(Value)
	
	if Value then
		NowValue = NowValue - Value;
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
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 0;
	if (buffLevel == 1) then
		value = 10000;
	end
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




--buff[200013]铁布衫血包buff

local Buff = BuffBasicInfo[200013]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	
	if buffSystem:IsDead() then	--死掉就不回血了
		return ;
	end;
	local objplayer = buffSystem:GetPlayer();
	if not objplayer then
		return ;
	end
	
	local ctieBuShanSystem = objplayer:GetSystem("CTieBuShanSystem");	
	--霸体值已满
	if ctieBuShanSystem:CheckForbidValueFull() then
		return;
	end;
	
	local NowValue = self:GetValue(objBuff);				--2000
	local Value = 0

	--铁布衫当前等级霸体值上限
	local dwClothLimit = ctieBuShanSystem:GetForbidValueMax();
	--获得当前等级最大霸体值
	local dwClothCurrent = ctieBuShanSystem:GetForbidValue()
	--当前等级剩余霸体值
	local lastValue = dwClothLimit - dwClothCurrent;		--500

	--要增加的固定霸体值
	local dwChgValue = math.floor(dwClothLimit*0.3)+600;	--700
	
	if lastValue <= dwChgValue then
		Value = lastValue;
		if Value > NowValue then
			Value = NowValue;
		end
	else
		Value = dwChgValue;
		if Value > NowValue then
			Value = NowValue;
		end
	end
	
	ctieBuShanSystem:AddForbidValue(Value)
	
	if Value then
		NowValue = NowValue - Value;
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
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	-- local value = 0;
	-- if (buffLevel == 1) then
		-- value = 20000;
	-- end
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
	local timeDelay = 5000;
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



--击晕（群侠BOSS戈楠专用）
--buff[50600017]
local Buff = BuffBasicInfo[50600017]
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
	local lifeTime =  buffLevel*1000;
	if (lifeTime > 6000) then
		lifeTime = 6000;
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
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwSkillForbidFlag = -1;
	info.dwMoveForbidFlag = 1;
	info.dwUseItemForbidFlag = 1;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

---------------------------1000攻击、5000生命、500防御、250身法、250暴击
local Buff = BuffBasicInfo[50700016]
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
	--info.dwAttack = 1000;
	--info.dwDefense = 500;
	--info.dwHPMax = 5000;
	--info.dwFlee = 250;
	--info.dwCrit = 250;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------
local Buff = BuffBasicInfo[50700017] ----------------5000生命、500防御、250身法、250暴击
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
	--info.dwDefense = 500;
	--info.dwHPMax = 5000;
	--info.dwFlee = 250;
	--info.dwCrit = 250;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
-----------------------
local Buff = BuffBasicInfo[50700018] ----------------5000生命、500防御
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
	--info.dwDefense = 500;
	--info.dwHPMax = 5000;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
--------------------------------
local Buff = BuffBasicInfo[50700019] ----------------5000生命、500防御
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
	--info.dwHPMax = 5000;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--------------------------------
local Buff = BuffBasicInfo[50700020] ----------------小猪提示buff，没有实际作用
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

end;

--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 39000;
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--------------------------------
local Buff = BuffBasicInfo[50700021] ----------------小猪提示buff，没有实际作用
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--击晕（小猪快跑-推猪、拉猪专用）
--buff[50700022]
local Buff = BuffBasicInfo[50700022]
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
	local lifeTime =  buffLevel*500;
	if (lifeTime > 6000) then
		lifeTime = 6000;
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
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwSkillForbidFlag = -1;
	info.dwMoveForbidFlag = 1;
	info.dwUseItemForbidFlag = 1;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--通脉活络散·小
--buff[2500090]
local Buff = BuffBasicInfo[2500090]
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
	local lifeTime = 30*60*1000;
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



--通脉活络散·中
--buff[2500100]
local Buff = BuffBasicInfo[2500100]
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
	local lifeTime = 30*60*1000;
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


--通脉活络散·大
--buff[2500110]
local Buff = BuffBasicInfo[2500110]
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
	local lifeTime = 30*60*1000;
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
-----------------------------猪被定身

local Buff = BuffBasicInfo[50700023]
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
-------------------------



local Buff = BuffBasicInfo[10080]
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
	CTitleSystem:DelTitle(10138)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


local Buff = BuffBasicInfo[10081]
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
	CTitleSystem:DelTitle(10139)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


local Buff = BuffBasicInfo[10082]
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
	CTitleSystem:DelTitle(10140)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


local Buff = BuffBasicInfo[10083]
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
	CTitleSystem:DelTitle(10141)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

local Buff = BuffBasicInfo[10084]
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
	local lifeTime = 3600000*24*30;
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
	CTitleSystem:DelTitle(10142)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

local Buff = BuffBasicInfo[10085]
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
	local lifeTime = 3600000*24*30;
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
	CTitleSystem:DelTitle(10143)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


local Buff = BuffBasicInfo[10089]
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
	CTitleSystem:DelTitle(10147)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


local Buff = BuffBasicInfo[10090]
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
	CTitleSystem:DelTitle(10148)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
---------------------火锅BUFF

local Buff = BuffBasicInfo[50700024]
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
	local troopNum = 1;
	objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwHPMax = 0.15*buffObj.m_Level;
	info.dwMPMax = 0.15*buffObj.m_Level;
	info.dwAttack = 0.15*buffObj.m_Level;
	info.dwDefense = 0.15*buffObj.m_Level;
	info.dwFlee = 0.15*buffObj.m_Level;
	info.dwCrit = 0.15*buffObj.m_Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

-------------------
local Buff = BuffBasicInfo[50700025]
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
	local lifeTime = 24*60*60*1000;
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
	-- local info = {};
	-- info.dwHPMax = 0.15*buffObj.m_Level;
	-- info.dwMPMax = 0.15*buffObj.m_Level;
	-- info.dwAttack = 0.15*buffObj.m_Level;
	-- info.dwDefense = 0.15*buffObj.m_Level;
	-- info.dwFlee = 0.15*buffObj.m_Level;
	-- info.dwCrit = 0.15*buffObj.m_Level;
	-- buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------吉星高照
local Buff = BuffBasicInfo[10086]
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
	local lifeTime = 15*24*60*60*1000;
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
	-- local info = {};
	-- info.dwExpUp = 50000
	-- buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
--------------------------
local Buff = BuffBasicInfo[10087]
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
	local lifeTime = 15*24*60*60*1000;
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
	-- local info = {};
	-- info.dwExpUp = 500000
	-- buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
----------------------------
local Buff = BuffBasicInfo[10088]
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
	local lifeTime = 15*24*60*60*1000;
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
	-- local info = {};
	-- info.dwExpUp = 10000000
	-- buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
---------------------狂暴
local Buff = BuffBasicInfo[50700026]
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
	info.dwAttack = 0.15*buffObj.m_Level;
	info.dwDefense = 0.15*buffObj.m_Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

-----------------------------名剑11阶 攻击增加20%--------------------------------obj.dwAttack = 0;--攻击
--buff[71007]
local Buff = BuffBasicInfo[71007]
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
	-- local info = {};
	-- info.dwAttack = 0.2;	
	-- buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
	buffSystem:ExecAddBuffPercent({dwAttack = 0.1}, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

-----------------------------宝甲11阶 伤害抵御150%--------------------------------
local Buff = BuffBasicInfo[71101]
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
	local dwLevel = buffObj.m_Level;	
	buffSystem:ExecAddBuffEffect({dwPoJiaDiKang=5000+(dwLevel-1)*1}, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------称号：CompGamer称号卡
local Buff = BuffBasicInfo[10091]
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
	CTitleSystem:DelTitle(10149)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------称号：Online-Station称号卡
local Buff = BuffBasicInfo[10092]
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
	CTitleSystem:DelTitle(10150)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

---------------------------酒徒BUFF
local Buff = BuffBasicInfo[50700027]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  
	--local NowValue = 1 * buffLevelel;
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
	local lifeTime = 1000*60*2;
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

---------------------------------------------------------酒徒附加BUFF，无实际效果
local Buff = BuffBasicInfo[50700028]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  
	--local NowValue = 1 * buffLevelel;
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
	local lifeTime = 1000*60*5;
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
	-- local info = {};
	-- info.dwAttack = 0.2*buffObj.m_Level;
	-- info.dwDefense = 0.2*buffObj.m_Level;
	-- buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;




------------------跨服战屠龙刀---------------------
local Buff = BuffBasicInfo[50700029]
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
	local info = {};
	info.dwAttack = 20000;
	info.dwDefense = 12000;
	info.dwHPMax = 110000;
	info.dwIgnoreDefense = 1000;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------略有小成称号卡 马来10天版本---------------------
local Buff = BuffBasicInfo[10093]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10151)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10094]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10152)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10095]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10153)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10096]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10154)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10097]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10155)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10098]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10156)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10099]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10157)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10100]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10158)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10101]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10159)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10102]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10160)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10103]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10161)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10104]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10162)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10105]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10163)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10106]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10164)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10107]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10165)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10108]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10166)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10109]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10167)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10110]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10168)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10111]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10169)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10112]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10170)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10113]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10170)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10114]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10171)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10115]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10172)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10116]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10173)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10117]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10174)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10118]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10175)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10119]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10176)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10120]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10177)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10121]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10178)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10122]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10179)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10123]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10180)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------------------
local Buff = BuffBasicInfo[10124]
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
	local lifeTime = 10*60*60*1000;
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
	CTitleSystem:DelTitle(10181)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--buff[50600018]
local Buff = BuffBasicInfo[50600018]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local NowValue = 20+math.floor(buffLevelel/10)*5
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
	local value = 0;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 11000;
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

	local Lv = buffObj.m_Level
	local info = {};
	
	info.dwDefense = 20+math.floor(Lv/10)*5;		--根据怪物等级（人物等级）
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



--buff[50600019]
local Buff = BuffBasicInfo[50600019]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	-- local NowValue = 20+math.floor(buffLevelel/10)*50
	-- self:SetValue(NowValue,objBuff,buffSystem,objBuff.m_Level);
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
	-- local value = 0;
	-- objBuff:SetAppendBuffValue(buffSystem, value);
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 15000;
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

	local Lv = buffObj.m_Level
	local info = {};
	
	info.dwAttack = 0.2
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[50600020]
local Buff = BuffBasicInfo[50600020]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	-- local NowValue = 20+math.floor(buffLevelel/10)*50
	-- self:SetValue(NowValue,objBuff,buffSystem,objBuff.m_Level);
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
	-- local value = 0;
	-- objBuff:SetAppendBuffValue(buffSystem, value);
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000*10;
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

--buff[50600021] 不显示，纯检测使用
local Buff = BuffBasicInfo[50600021]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
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
	local lifeTime = 1000*9.8;
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
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

-----------------降低移动速度85%
local Buff = BuffBasicInfo[50600022]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwMoveSpeed = -0.85;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end

-----------------群侠范围每秒掉血10
local Buff = BuffBasicInfo[50600023]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local HP = buffSystem:GetBattleInfo().dwHPMax*0.20
	HP = HP + 0.01
	local Z = objBuff.m_releaseType
	local G = objBuff.m_releaseId
	buffSystem:ChangeHp(-HP,Z,G);	
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
	local timeDelay = 1000;
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
end


--减防
--buff[21006]

local Buff = BuffBasicInfo[21006]
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
	local value = 0;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;

--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3000;
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
	info.dwDefense = -0.1*buffObj.m_Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--击晕
--buff[31006]
local Buff = BuffBasicInfo[31006]
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
	local lifeTime =  (buffLevel*50) + 3000;
	if (lifeTime > 6000) then
		lifeTime = 6000;
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
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwSkillForbidFlag = -1;
	info.dwMoveForbidFlag = 1;
	info.dwUseItemForbidFlag = 1;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



--buff[51006]

local Buff = BuffBasicInfo[51006]
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
	local value = 0;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;

--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3000;
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
---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwAttack = -0.1*buffObj.m_Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
----------------------------------------------------------------------------------
----------------------“劳动标兵·金”称号-------------------
local Buff = BuffBasicInfo[10125]
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
	local lifeTime = 1000*60*60*24*7;
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
	CTitleSystem:DelTitle(10184)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


---------------------------------------------------------------------
---------------------------------------------------------------------
----------------------“劳动标兵·银”称号-------------------
local Buff = BuffBasicInfo[10126]
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
	local lifeTime = 1000*60*60*24*7;
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
	CTitleSystem:DelTitle(10183)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;





-----------------------------------卧虎藏龙---------------------------

-----------------降低400移动速度
local Buff = BuffBasicInfo[50770000]
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
	local lifeTime = 3000;
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

-----------------------沉默3秒
local Buff = BuffBasicInfo[50770001]
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
	local lifeTime = 3000;
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
	info.dwSkillForbidFlag = -1;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;

--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--------------------------定身
local Buff = BuffBasicInfo[50770002]
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
	local lifeTime = 3000;
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
	info.dwMoveForbidFlag = 1;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;

--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------眩晕
local Buff = BuffBasicInfo[50770003]
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
	local lifeTime = 3000;
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

------------------扣除10%血量
local Buff = BuffBasicInfo[50770004]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local HP = buffSystem:GetBattleInfo().dwHPMax*0.1
	HP = HP + 0.01
	local Z = objBuff.m_releaseType
	local G = objBuff.m_releaseId
	buffSystem:ChangeHp(-HP,Z,G);	
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
	local lifeTime = 3000;
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
local Buff = BuffBasicInfo[50770005]
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
	local lifeTime = 3000;
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

----------------------------------每秒恢复自身血量5000----------------------------
--buff[50770006]
local Buff = BuffBasicInfo[50770006]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	buffSystem:ChangeHp(5000,-1,0);

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
	local timeDelay = 1000;
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

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--------------------独孤九剑  begin -------------------------------------------

--攻击
local Buff = BuffBasicInfo[110000]
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
	local lifeTime = 10*1000;
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
	local level = buffObj.m_Level
	info.dwAttack = _G.DuGuConfig.buff[level].Att / 100
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--暴击
local Buff = BuffBasicInfo[110001]
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
	local lifeTime = 10*1000;
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
	local level = buffObj.m_Level
	info.dwCrit = _G.DuGuConfig.buff[level].Crit / 100
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--防御
local Buff = BuffBasicInfo[110002]
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
	local lifeTime = 10*1000;
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
	local level = buffObj.m_Level
	info.dwDefense = _G.DuGuConfig.buff[level].Def / 100
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--破甲
local Buff = BuffBasicInfo[110003]
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
	local lifeTime = 10*1000;
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
	local level = buffObj.m_Level
	info.dwPoJiaValue = _G.DuGuConfig.buff[level].PoJia / 100
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--血量
local Buff = BuffBasicInfo[110004]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)
	local dwHPMax = buffSystem:GetBattleInfo().dwHPMax;
	local base = _G.DuGuConfig.buff[buffLevelel].Hp / 100;
	
	local dwAddHP = dwHPMax * base;
	
	local Z = objBuff.m_releaseType
	local G = objBuff.m_releaseId
	buffSystem:ChangeHp(dwAddHP,Z,G);
	
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

-------------------------------独孤九剑   end--------------------------------------

------------------------------------------------------------------------------------

--buff[50770007]铁布衫归元散道具


local Buff = BuffBasicInfo[50770007]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	
	if buffSystem:IsDead() then	--死掉就不回血了
		return ;
	end;
	local objplayer = buffSystem:GetPlayer();
	if not objplayer then
		return ;
	end
	
	local ctieBuShanSystem = objplayer:GetSystem("CTieBuShanSystem");	
	--霸体值已满
	if ctieBuShanSystem:CheckForbidValueFull() then
		return;
	end;
	
	local NowValue = self:GetValue(objBuff);				--2000
	local Value = 0

	--铁布衫当前等级霸体值上限
	local dwClothLimit = ctieBuShanSystem:GetForbidValueMax();
	--获得当前等级最大霸体值
	local dwClothCurrent = ctieBuShanSystem:GetForbidValue()
	--当前等级剩余霸体值
	local lastValue = dwClothLimit - dwClothCurrent;		--500

	--要增加的固定霸体值
	local dwChgValue = math.floor(dwClothLimit*0.15)+500;	--700
	self:SetValue(dwChgValue,objBuff,buffSystem,objBuff.m_Level);
	if lastValue < dwChgValue then 
		dwChgValue = lastValue
	end
	ctieBuShanSystem:AddForbidValue(dwChgValue)
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
	if buffSystem:IsDead() then	--死掉就不回血了
		return ;
	end;
	local objplayer = buffSystem:GetPlayer();
	if not objplayer then
		return ;
	end
	
	local ctieBuShanSystem = objplayer:GetSystem("CTieBuShanSystem");	
	--铁布衫当前等级霸体值上限
	local dwClothLimit = ctieBuShanSystem:GetForbidValueMax();
	--要增加的固定霸体值
	local dwChgValue = math.floor(dwClothLimit*0.15)+500;	--700
	objBuff:SetAppendBuffValue(buffSystem, dwChgValue);
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber,num)
	local Time = 2000;
	local lifeTime = 1000*60*5*num;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(Time);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = 2000;
	objBuff:SetTimeDelay(timeDelay,true);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	local troopNum = 12;
	objBuff:SetTroopNum(troopNum);
end;
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)

end;


--buff[4902020]
local Buff = BuffBasicInfo[4902020]
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
	local value = 0;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;

--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber,num)
	local Time = 3600000*2;
	local lifeTime = 3600000*2*num;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(Time);
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
	buffSystem:ExecAddBuffPercent({dwExpUp = 4}, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--/////////////////////暗器系统buff////////////////////////
--暗器系统BUFF 减命中
--buff[100000]
local Buff = BuffBasicInfo[100000]
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
	local lifeTime = _G.HiddenWeaponConfig.levelInfo[buffLevel].LastTime1 * 1000;
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
	info.dwHitPercent = -99999;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--暗器系统BUFF 持续掉血
--buff[100001]
local Buff = BuffBasicInfo[100001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

	local objPlayer = buffSystem:GetOtherPlayer(objBuff.m_releaseId);
	if not objPlayer then
		return;
	end
	local sOtherInfo = objPlayer:GetSystem("CSkillSystem"):GetInfo();

	local dwAttack = sOtherInfo.dwAttack;
	local dwHPMax = buffSystem:GetBattleInfo().dwHPMax;
	local dwLostPer = _G.HiddenWeaponConfig.levelInfo[buffLevelel].HPLostPer / 100;
	
	local dwHPDown = dwHPMax * dwLostPer;
	if dwHPDown > dwAttack then
		dwHPDown = dwAttack;
	end
	
	local Z = objBuff.m_releaseType
	local G = objBuff.m_releaseId
	buffSystem:ChangeHp(-dwHPDown,Z,G);
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
	-- local lifeTime = 10*1000*buffLevelel;
	local lifeTime = _G.HiddenWeaponConfig.levelInfo[buffLevel].LastTime2 * 1000;
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


--暗器系统BUFF 减速
--buff[100002]
local Buff = BuffBasicInfo[100002]
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
	local lifeTime = _G.HiddenWeaponConfig.levelInfo[buffLevel].LastTime3 * 1000;
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
	local buffLevel = buffObj.m_Level;
	info.dwMoveSpeed = -(_G.HiddenWeaponConfig.levelInfo[buffLevel].SpeedLostPer / 100);	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--暗器系统BUFF 沉默
--buff[100003]
local Buff = BuffBasicInfo[100003]
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
	local lifeTime = _G.HiddenWeaponConfig.levelInfo[buffLevel].LastTime4 * 1000;
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
	info.dwSkillForbidFlag = -1;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--//新珍珑棋局buff
----------------------------------防御增加1%
local Buff = BuffBasicInfo[50302001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local NowValue = buffLevelel * 1
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local Level = buffObj.m_Level
	local info = {};
	info.dwDefense = 0.01*Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------------------攻击增加1%
local Buff = BuffBasicInfo[50302002]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local Level = buffObj.m_Level
	local info = {};
	info.dwAttack = 0.01*Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------==========横扫天下第一人==============-------------------
local Buff = BuffBasicInfo[10138]
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
	CTitleSystem:DelTitle(10185)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------==========天下无敌==============-------------------
local Buff = BuffBasicInfo[10139]
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
	CTitleSystem:DelTitle(10186)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------==========亘古烁今==============-------------------
local Buff = BuffBasicInfo[10127]
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
	CTitleSystem:DelTitle(10187)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------==========君临天下==============-------------------
local Buff = BuffBasicInfo[10128]
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
	CTitleSystem:DelTitle(10188)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------==========唯我独尊==============-------------------
local Buff = BuffBasicInfo[10129]
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
	CTitleSystem:DelTitle(10189)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------==========乾坤无极==============-------------------
local Buff = BuffBasicInfo[10130]
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
	CTitleSystem:DelTitle(10190)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------==========霸者无双==============-------------------
local Buff = BuffBasicInfo[10131]
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
	CTitleSystem:DelTitle(10191)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------==========气吞山河==============-------------------
local Buff = BuffBasicInfo[10132]
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
	CTitleSystem:DelTitle(10192)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

-----------------------------------通天塔---------------------------

-----------------一字长蛇阵
local Buff = BuffBasicInfo[50710000]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwDefense = 3;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
	local info1 = {};
	info1.dwAppendAttack = 30000;
	buffSystem:ExecAddBuffEffect(info1, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end

-----------------二龙出水阵
local Buff = BuffBasicInfo[50710001]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwAttack = 0.5;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
	local info1 = {};
	info1.dwIgnoreDefense = 2000;
	info1.dwAppendAttack = 30000;
	buffSystem:ExecAddBuffEffect(info1, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end

-----------------天地三才阵
local Buff = BuffBasicInfo[50710002]
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
	local timeDelay = 5000;
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
	local info1 = {};
	info1.dwIgnoreDefense = 2500;
	info1.dwAppendAttack = 50000;
	buffSystem:ExecAddBuffEffect(info1, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end

-----------------四门兜底阵
local Buff = BuffBasicInfo[50710003]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwFlee = 0.5;
	info.dwDefense = 6;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
	local info1 = {};
	info1.dwIgnoreDefense = 2500;
	info1.dwAppendAttack = 70000;
	buffSystem:ExecAddBuffEffect(info1, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end

-----------------五虎群羊阵
local Buff = BuffBasicInfo[50710004]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwAttack = 1;
	info.dwCrit = 0.6;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
	local info1 = {};
	info1.dwIgnoreDefense = 3000;
	info1.dwAppendAttack = 80000;
	info.dwRemitAttack = 3000;
	buffSystem:ExecAddBuffEffect(info1, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end

-----------------六丁六甲阵
local Buff = BuffBasicInfo[50710005]
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
	local timeDelay = 5000;
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
	info.dwDefense = 6;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
	local info1 = {};
	info1.dwIgnoreDefense = 3500;
	info1.dwAppendAttack = 100000;
	info.dwRemitAttack = 4000;
	buffSystem:ExecAddBuffEffect(info1, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end

-----------------七星北斗阵
local Buff = BuffBasicInfo[50710006]
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
	local timeDelay = 5000;
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
	info.dwAttack = 1;
	info.dwFlee = 0.8;
	info.dwDefense = 7;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
	local info1 = {};
	info1.dwIgnoreDefense = 4000;
	info1.dwAppendAttack = 100000;
	info.dwRemitAttack = 4000;
	buffSystem:ExecAddBuffEffect(info1, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end

-----------------八门金锁阵
local Buff = BuffBasicInfo[50710007]
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
	local timeDelay = 5000;
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
	info.dwDefense = 8;
	info.dwDuck = 0.5;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
	local info1 = {};
	info1.dwIgnoreDefense = 4000;
	info1.dwAppendAttack = 100000;
	info.dwRemitAttack = 3500;
	buffSystem:ExecAddBuffEffect(info1, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end

-----------------九子连环阵
local Buff = BuffBasicInfo[50710008]
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
	local timeDelay = 5000;
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
	info.dwDefense = 10;
	info.dwAttack = 1;
	info.dwFlee = 0.9;
	info.dwCrit = 0.9;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
	local info1 = {};
	info1.dwIgnoreDefense = 4000;
	info1.dwAppendAttack = 100000;
	info.dwRemitAttack = 4000;
	buffSystem:ExecAddBuffEffect(info1, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end

-----------------玩家回复
local Buff = BuffBasicInfo[50720000]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	if buffSystem:IsDead() then	--死掉就不回血了
		return ;
	end;

	local dwChgValue = buffSystem:GetBattleInfo().dwHPMax*0.05;

	local ChgValue = buffSystem:ChangeHp(dwChgValue,-1,0);
	
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
	local value = 999999999;
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
	local timeDelay = 1000*10;
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

----------------------==========通天塔==============-------------------
local Buff = BuffBasicInfo[10140]
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
	local lifeTime = 1000*60*60*24*7;
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
	CTitleSystem:DelTitle(10198)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------扣除1%血量
local Buff = BuffBasicInfo[20000014]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local HP = buffSystem:GetBattleInfo().dwHPMax*0.01
	HP = HP + 0.01
	local Z = objBuff.m_releaseType
	local G = objBuff.m_releaseId
	buffSystem:ChangeHp(-HP,Z,G);	
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
	local lifeTime = 3000;
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

--降低敌方攻击百分比
--buff[20000003]
local Buff = BuffBasicInfo[20000003]
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
	local lifeTime = 3000;
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
	info.dwAttack = -0.01*Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--降低暴击百分比
--buff[20000005]
local Buff = BuffBasicInfo[20000005]
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
	local lifeTime = 3000;
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
	info.dwCrit = -0.01*Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--降低防御百分比
--buff[20000006]
local Buff = BuffBasicInfo[20000006]
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
	local lifeTime = 3000;
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
	info.dwDefense = -0.01*Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--定身
--buff[20000011]
local Buff = BuffBasicInfo[20000011]
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
	local lifeTime = 3000;
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

--沉默
--buff[20000013]
local Buff = BuffBasicInfo[20000013]
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
	local lifeTime = 3000;
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

--降低移动速度百分比
--buff[20000015]
local Buff = BuffBasicInfo[20000015]
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
	local lifeTime = 3000;
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
	info.dwMoveSpeed = -0.01*Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--降低身法百分比
--buff[20000017]
local Buff = BuffBasicInfo[20000017]
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
	local lifeTime = 3000;
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
	info.dwFlee = -0.01*Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

---------------------------------------7天---------------------
--横扫天下第一人
--buff[10141]
local Buff = BuffBasicInfo[10141]
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
	local lifeTime = 1000*60*60*24*7;
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

--天下无敌
--buff[10142]
local Buff = BuffBasicInfo[10142]
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
	local lifeTime = 1000*60*60*24*7;
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

--亘古烁今
--buff[10143]
local Buff = BuffBasicInfo[10143]
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
	local lifeTime = 1000*60*60*24*7;
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

--君临天下
--buff[10144]
local Buff = BuffBasicInfo[10144]
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
	local lifeTime = 1000*60*60*24*7;
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

--唯我独尊
--buff[10145]
local Buff = BuffBasicInfo[10145]
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
	local lifeTime = 1000*60*60*24*7;
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

-------------------------15天-------------------------
--横扫天下第一人
--buff[10146]
local Buff = BuffBasicInfo[10146]
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
	local lifeTime = 1000*60*60*24*15;
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

--天下无敌
--buff[10147]
local Buff = BuffBasicInfo[10147]
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
	local lifeTime = 1000*60*60*24*15;
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

--亘古烁今
--buff[10148]
local Buff = BuffBasicInfo[10148]
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
	local lifeTime = 1000*60*60*24*15;
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

--君临天下
--buff[10149]
local Buff = BuffBasicInfo[10149]
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
	local lifeTime = 1000*60*60*24*15;
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

--唯我独尊
--buff[10150]
local Buff = BuffBasicInfo[10150]
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
	local lifeTime = 1000*60*60*24*15;
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

--buff[2400070]

local Buff = BuffBasicInfo[2400070]
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
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber,num)
	local lifeTime = 1000*60*5*num;
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
	info.dwAttack = 0.15;
	info.dwAttackSpeed = 0.15;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--buff[2400080]

local Buff = BuffBasicInfo[2400080]
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
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber,num)
	local lifeTime = 1000*60*5*num;
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
	info.dwCrit = 0.15;
	info.dwFlee = 0.15;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[2400090]

local Buff = BuffBasicInfo[2400090]
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
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber,num)
	local lifeTime = 1000*60*5*num;
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
	info.dwHPMax = 0.15;
	info.dwDefense = 0.15;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------==========先发制人==============-------------------
local Buff = BuffBasicInfo[10133]
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
	local lifeTime = 1000*60*60*24;
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
	CTitleSystem:DelTitle(10193)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------==========禁打大人==============-------------------
local Buff = BuffBasicInfo[10134]
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
	local lifeTime = 1000*60*60*24;
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
	CTitleSystem:DelTitle(10194)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------==========长岁大人==============-------------------
local Buff = BuffBasicInfo[10135]
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
	local lifeTime = 1000*60*60*24;
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
	CTitleSystem:DelTitle(10195)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------==========横扫道王==============-------------------
local Buff = BuffBasicInfo[10136]
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
	local lifeTime = 1000*60*60*24;
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
	CTitleSystem:DelTitle(10196)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------==========横扫道皇==============-------------------
local Buff = BuffBasicInfo[10137]
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
	CTitleSystem:DelTitle(10197)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--------------------战旗  begin -------------------------------------------

--战旗1buff
local Buff = BuffBasicInfo[120000]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local tConfig = _G.BannerConfig.BuffEffect;
	local info = {};
	info.dwExpUp = tConfig[buffObj.m_Level].dwAddEXP / 100;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--战旗2buff
local Buff = BuffBasicInfo[120001]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local tConfig = _G.BannerConfig.BuffEffect;
	local info = {};
	info.dwExpUp = tConfig[buffObj.m_Level].dwAddEXP / 100;
	info.dwDefense = tConfig[buffObj.m_Level].dwDefense / 100;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--战旗3buff
local Buff = BuffBasicInfo[120002]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local tConfig = _G.BannerConfig.BuffEffect;
	local info = {};
	info.dwExpUp = tConfig[buffObj.m_Level].dwAddEXP / 100;
	info.dwDefense = tConfig[buffObj.m_Level].dwDefense / 100;
	info.dwCrit = tConfig[buffObj.m_Level].dwCrit / 100;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--战旗4buff
local Buff = BuffBasicInfo[120003]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local tConfig = _G.BannerConfig.BuffEffect;
	local info = {};
	info.dwExpUp = tConfig[buffObj.m_Level].dwAddEXP / 100;
	info.dwDefense = tConfig[buffObj.m_Level].dwDefense / 100;
	info.dwCrit = tConfig[buffObj.m_Level].dwCrit / 100;
	info.dwPoJiaDiKang = tConfig[buffObj.m_Level].dwPoJiaDiKang / 100;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--战旗5buff
local Buff = BuffBasicInfo[120004]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local tConfig = _G.BannerConfig.BuffEffect;
	local info = {};
	info.dwExpUp = tConfig[buffObj.m_Level].dwAddEXP / 100;
	info.dwDefense = tConfig[buffObj.m_Level].dwDefense / 100;
	info.dwCrit = tConfig[buffObj.m_Level].dwCrit / 100;
	info.dwPoJiaDiKang = tConfig[buffObj.m_Level].dwPoJiaDiKang / 100;
	info.dwAttack = tConfig[buffObj.m_Level].dwAttack / 100;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

-------------------------------战旗   end--------------------------------------

-------------------------------老玩家buff--------------------------------------
--老玩家buff1
local Buff = BuffBasicInfo[130000]
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
	local lifeTime = 1000*60*60*24*7;
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
	info.dwExpUp = 2;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--老玩家buff2
local Buff = BuffBasicInfo[130001]
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
	local lifeTime = 1000*60*60*24*7;
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
	info.dwExpUp = 4;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--老玩家buff3
local Buff = BuffBasicInfo[130002]
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
	local lifeTime = 1000*60*60*24*7;
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
	info.dwExpUp = 9;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

-------------------------------老玩家buff--------------------------------------

-------------------------------月饼  begin--------------------------------------

--豆沙月饼
local Buff = BuffBasicInfo[4900190]
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
	local lifeTime = 30*60*1000;
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
	info.dwDefense = 0.25;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--枣泥月饼
local Buff = BuffBasicInfo[4900191]
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
	local lifeTime = 30*60*1000;
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
	info.dwAttack = 0.2;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--蛋黄月饼
local Buff = BuffBasicInfo[4900192]
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
	local lifeTime = 15*60*1000;
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
	info.dwExpUp = 9;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

-------------------------------月饼  end--------------------------------------

----------------------==========绝顶至尊==============-------------------
local Buff = BuffBasicInfo[10151]
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
	CTitleSystem:DelTitle(10199)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
