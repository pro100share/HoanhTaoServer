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
--buff[11001]

local Buff = BuffBasicInfo[11001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	buffSystem:ChangeHp(50 + (buffLevelel-1)*8,-1,0);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 1 * 5;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 10000;
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

--buff[11003]

local Buff = BuffBasicInfo[11003]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	-- local value = 1 * 5;
	-- objBuff:SetBuffValue(buffSystem, value)
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
	-- local troopNum = 7;
	-- objBuff:SetTroopNum(troopNum);
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


--buff[11005]

local Buff = BuffBasicInfo[11005]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local NowValue = (2000+math.floor(buffLevelel/10)*500)/100
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
	-- local value = 1 * 5;
	-- objBuff:SetAppendBuffValue(buffSystem, value);
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
	info.dwDefense = math.floor(90+Lv*(10+Lv*0.02)+math.floor(Lv/10)*18*math.floor(Lv/10))
	
	info.dwRemitAttack = 2000+math.floor(Lv/10)*500;

	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--buff[11004]

local Buff = BuffBasicInfo[11004]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  
	local Z = objBuff.m_releaseType
	local G = objBuff.m_releaseId
	buffSystem:ChangeHp(-self:GetValue(objBuff)/5,Z,G);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 1 * 5;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 12000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = 3000;
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
	local objPlayer = buffSystem:GetOtherPlayer(buffObj.m_releaseId);
	if not objPlayer then
		return;
	end
	
	local sInfo = objPlayer:GetSystem("CSkillSystem"):GetInfo();
	local dwNowAttack = sInfo.dwAttack;
	local dwLevel = buffObj.m_Level;
	local dwAttackValue = math.floor(dwNowAttack*(1.5+(dwLevel-1)*0.03));
	
	buffObj:SetBuffValue(buffSystem, dwAttackValue);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)

end;


--buff[11011]

local Buff = BuffBasicInfo[11011]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	local value = 1 * 5;
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 1 * 5;
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
	local troopNum = 7;
	objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	
	buffSystem:ExecAddBuffPercent({dwAttack = -0.5}, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--buff[12001]

local Buff = BuffBasicInfo[12001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  
	--local propertytype = "dwAttack";
	--local value = 20000;
	--buffSystem:ExecAddBuffEffect(propertytype, value);
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
	--获得等级
	local dwLevel = buffObj.m_Level;
	local dwNowAttack = buffSystem:GetBattleInfo().dwAttack;
	
	local value = 5*dwLevel + (0.049 + 0.001*dwLevel)*dwNowAttack;
	buffSystem:ExecAddBuffEffect({dwAttack=value}, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[12002]

local Buff = BuffBasicInfo[12002]
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
	local dwLevel = buffObj.m_Level;
	buffSystem:ExecAddBuffEffect({dwDuck = 5+(dwLevel-1)*0.45/100}, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[12003]

local Buff = BuffBasicInfo[12003]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  
	--local propertytype = "dwAttack";
	--local value = 20000;
	--buffSystem:ExecAddBuffEffect(propertytype, value);
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
------************************** ***************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local dwLevel = buffObj.m_Level;
	
	buffSystem:ExecAddBuffEffect({dwMoveSpeed=20+(dwLevel-1)*1}, buffObj.m_id);
--	local player = buffSystem:GetPlayer();
--	local dwMoveSpeed = player:GetSystem("CSkillSystem"):GetInfo().dwMoveSpeed;
--	print("dwMoveSpeed : "..dwMoveSpeed);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[12004]

local Buff = BuffBasicInfo[12004]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  
	--local propertytype = "dwAttack";
	--local value = 20000;
	--buffSystem:ExecAddBuffEffect(propertytype, value);
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
	local dwLevel = buffObj.m_Level;

	buffSystem:ExecAddBuffEffect({dwCrit = math.floor(50+(dwLevel-1)*(1+(dwLevel-2)*0.1908))}, buffObj.m_id);
--	propertytype = "dwAppendCrit";
--	buffSystem:ExecAddBuffEffect(propertytype,(10+(dwLevel-1)*0.4), buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--buff[2400000]

local Buff = BuffBasicInfo[2400000]
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
	local Time = 300000;
	local lifeTime = 300000*num;
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
	local info = {};
	info.dwHPMax = 0.15;
	info.dwMPMax = 0.15;
	info.dwDefense = 0.15;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[2400010]

local Buff = BuffBasicInfo[2400010]
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
	local Time = 300000;
	local lifeTime = 300000*num;
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
	local info = {};
	info.dwCrit = 0.15;
	info.dwFlee = 0.15;
	info.dwMoveSpeed = 0.15;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--buff[2400020]

local Buff = BuffBasicInfo[2400020]
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
	local Time = 300000;
	local lifeTime = 300000*num;
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
	buffSystem:ExecAddBuffPercent({dwAttack = 0.15}, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[2400030]

local Buff = BuffBasicInfo[2400030]
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
	local Time = 300000;
	local lifeTime = 300000*num;
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
	buffSystem:ExecAddBuffPercent({dwDefense = 0.15}, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[2400040]

local Buff = BuffBasicInfo[2400040]
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
	local Time = 300000;
	local lifeTime = 300000*num;
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
	local info = {};
	info.dwCrit = 0.15;
	info.dwFlee = 0.15;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[2400050]

local Buff = BuffBasicInfo[2400050]
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
	local Time = 300000;
	local lifeTime = 300000*num;
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
	local info = {};
	info.dwMoveSpeed = 0.15;
	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[2400060]

local Buff = BuffBasicInfo[2400060]
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
	local Time = 300000;
	local lifeTime = 300000*num;
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
	buffSystem:ExecAddBuffPercent({dwFlee = 0.15}, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



--buff[2400100]
local Buff = BuffBasicInfo[2400100]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)

end;
--设置Buff的值（自动回蓝/血的药水）
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
	local Time = 3600000;
	local lifeTime =  3600000*num;
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
	buffSystem:ExecAddBuffPercent({dwExpUp = 0.5}, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[2400110]
local Buff = BuffBasicInfo[2400110]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)

end;
--设置Buff的值（自动回蓝/血的药水）
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
	local Time = 3600000;
	local lifeTime =  3600000*num;
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
	buffSystem:ExecAddBuffPercent({dwExpUp = 1}, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[2400120]
local Buff = BuffBasicInfo[2400120]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)

end;
--设置Buff的值（自动回蓝/血的药水）
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
	local Time = 3600000;
	local lifeTime = 3600000*num;
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
	buffSystem:ExecAddBuffPercent({dwExpUp = 2}, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[2400130]
local Buff = BuffBasicInfo[2400130]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)

end;
--设置Buff的值（自动回蓝/血的药水）
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
	local Time = 3600000;
	local lifeTime = 3600000*num;
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


--buff[2400140]
local Buff = BuffBasicInfo[2400140]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)

end;
--设置Buff的值（自动回蓝/血的药水）
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
	local Time = 3600000;
	local lifeTime = 3600000*num;
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
	buffSystem:ExecAddBuffPercent({dwExpUp = 9}, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--buff[2400210]
local Buff = BuffBasicInfo[2400210]
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
	local Time = 3600000;
	local lifeTime = 3600000*num;
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
	buffSystem:ExecAddBuffPercent({dwMountExpUp = 1}, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

-- --buff[2400260]

-- local Buff = BuffBasicInfo[2400260]
-- --获得buff的效果
-- --objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
-- function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)  

-- end;
-- --设置Buff的值（自动回蓝/血的药水）
-- function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	-- objBuff:SetBuffValue(buffSystem, value);
-- end;
-- --返回buff值
-- function Buff:GetValue(objBuff)
	-- return objBuff.m_value;
-- end;
-- --初始化buff值
-- function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	-- local value = 0;
	-- objBuff:SetAppendBuffValue(buffSystem, value);
-- end;

-- --buff的持续时间（0--生命周期结束,nil --为永久buff）
-- function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	-- local lifeTime = 3600000;
	-- objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
-- end;
-- --从触发之后到下一次效果触发的时间差
-- function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	-- local timeDelay = nil;
	-- objBuff:SetTimeDelay(timeDelay);
-- end;
-- --buff的Troop队列的叠加上限
-- function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)
	-- local troopNum = 1;
	-- objBuff:SetTroopNum(troopNum);
-- end;
-- ----------------------------------------------------------------------------------
-- -----------------------------------事件------------------------------------------
-- ------*****************************************************--------
-- --该buff被成功附加时运行该事件(具体与策划核对)
-- function Buff:EventPAddbuff(buffObj, buffSystem)
	-- buffSystem:ExecAddBuffPercent({dwSitUp = 1}, buffObj.m_id);
-- end;
-- --该buff消失时执行该事件
-- function Buff:EventPDeletebuff(buffObj,buffSystem)
	-- buffSystem:ExecDelBuffEffect(buffObj.m_id);
-- end;

--buff[2400310]

local Buff = BuffBasicInfo[2400310]
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
	local lifeTime = 3600000;  
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
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
	buffSystem:ExecAddBuffPercent({dwSkillKlgUp = 1}, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[2400260]

local Buff = BuffBasicInfo[2400260]
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
	local lifeTime = 3600000;  
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
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
	local tbInfo = {};
	tbInfo.dwMartialUp = 1;
	
	buffSystem:ExecAddBuffEffect(tbInfo,buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

local Buff = BuffBasicInfo[2400270]
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
	local lifeTime = 3600000;  
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
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
	local tbInfo = {};
	tbInfo.dwMartialUp = 2;--------------------
	
	buffSystem:ExecAddBuffEffect(tbInfo,buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

local Buff = BuffBasicInfo[2400280]
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
	local lifeTime = 3600000;  
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
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
	local tbInfo = {};
	tbInfo.dwMartialUp = 3;--------------------
	
	buffSystem:ExecAddBuffEffect(tbInfo,buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

local Buff = BuffBasicInfo[2400290]
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
	local lifeTime = 3600000;  
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
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
	local tbInfo = {};
	tbInfo.dwMartialUp = 4;--------------------
	
	buffSystem:ExecAddBuffEffect(tbInfo,buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

local Buff = BuffBasicInfo[2400300]
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
	local lifeTime = 3600000;  
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
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
	local tbInfo = {};
	tbInfo.dwMartialUp = 5;--------------------
	
	buffSystem:ExecAddBuffEffect(tbInfo,buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[310000]血包

local Buff = BuffBasicInfo[2500070]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	if buffSystem:IsDead() then	--死掉就不回血了
		return ;
	end;
	
	local NowValue = self:GetValue(objBuff);
	
	local tbNowInfo = buffSystem:GetBattleInfo();
	
	local dwChgValue = math.min(tbNowInfo.dwHPMax*0.35,NowValue);
	
	local ChgValue = buffSystem:ChangeHp(dwChgValue,-1,0);
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
		value = 20000*num;
	elseif(buffLevel == 2) then
		value = 50000*num;
	elseif (buffLevel == 3) then
		value = 100000*num;
	elseif (buffLevel == 5) then
		value = 1000000*num;
	elseif (buffLevel == 6) then
		value = 5000000*num;
	elseif (buffLevel == 6) then
		value = 5000000;
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
--buff[310001]蓝包

local Buff = BuffBasicInfo[2500080]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

	if buffSystem:IsDead() then	--死掉就不回血了
		return ;
	end;
	
	local NowValue = self:GetValue(objBuff);
	
	local tbNowInfo = buffSystem:GetBattleInfo();
	
	local dwChgValue = math.min(NowValue,tbNowInfo.dwMPMax*0.35);
	
	local ChgValue = buffSystem:ChangeMp(dwChgValue,-1,0);
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
		value = 10000*num;
	elseif(buffLevel == 2) then
		value = 30000*num;
	elseif (buffLevel == 3) then
		value = 100000*num;
	elseif (buffLevel == 5) then
		value = 600000*num;
	elseif (buffLevel == 6) then
		value = 5000000*num;	
	elseif (buffLevel == 6) then
		value = 5000000;	
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


--buff[510000]蓝包

local Buff = BuffBasicInfo[510000]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 


end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 10;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1800000;
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
	buffSystem:ExecAddBuffEffect({dwPKForbid=2}, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--buff[510001]

local Buff = BuffBasicInfo[510001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	local value = 1 * 5;
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 1 * 5;
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
	local troopNum = 7;
	objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwMoveForbidFlag  = 1;
	info.dwSkillForbidFlag = -1;
	info.dwStoryFlag = 1;
	
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--buff[61001]

local Buff = BuffBasicInfo[61001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	-- local value = 1 * 5;
	-- objBuff:SetBuffValue(buffSystem, value)
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
	local lifeTime = 20000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
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
	if (Lv > 5) then
		Lv = 5;
	end
	local info = {};
	--攻击
	info.dwAttack = 0.01 + (0.01*Lv);
	--防御
	info.dwDefense = 0.01 + (0.01*Lv);
	--暴击
	info.dwCrit = 0.01 + (0.01*Lv);
	--移动速度
	info.dwMoveSpeed = 0.02 + (0.02*Lv);
	--攻击速度
	info.dwAttackSpeed= 0.02 + (0.02*Lv);
	--对怪物伤害增加
	info.dwMonsterAppend = 0.05 + (0.05 * Lv);
	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[61002]

local Buff = BuffBasicInfo[61002]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	-- local value = 1 * 5;
	-- objBuff:SetBuffValue(buffSystem, value)
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
	local lifeTime = 20000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
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
	
	if (Lv > 5) then
		Lv = 5;
	end
	local info = {};
	--攻击
	info.dwAttack = 0.01 + (0.01*Lv);
	--防御
	info.dwDefense = 0.01 + (0.01*Lv);
	--暴击
	info.dwCrit = 0.01 + (0.01*Lv);
	--移动速度
	info.dwMoveSpeed = 0.02 + (0.02*Lv);
	--攻击速度
	info.dwAttackSpeed= 0.02 + (0.02*Lv);
	--对怪物伤害增加
	info.dwMonsterAppend = 0.05 + (0.05 * Lv);
	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--buff[610002]

local Buff = BuffBasicInfo[610002]
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


--buff[22000]
local Buff = BuffBasicInfo[22000]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	-- local value = 1 * 5;
	-- objBuff:SetBuffValue(buffSystem, value)
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
	-- local troopNum = 7;
	-- objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwMoveSpeed = -0.3;
	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[42000]

local Buff = BuffBasicInfo[42000]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	-- local value = 1 * 5;
	-- objBuff:SetBuffValue(buffSystem, value)
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
	-- local troopNum = 7;
	-- objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwDefense= -0.1;
	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--buff[52000]

local Buff = BuffBasicInfo[52000]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	-- local value = 1 * 5;
	-- objBuff:SetBuffValue(buffSystem, value)
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
	-- local troopNum = 7;
	-- objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwAttack = -0.1;
	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[610003]

local Buff = BuffBasicInfo[610003]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	-- local value = 1 * 5;
	-- objBuff:SetBuffValue(buffSystem, value)
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
	-- local troopNum = 7;
	-- objBuff:SetTroopNum(troopNum);
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


--buff[60001]
local Buff = BuffBasicInfo[60001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	-- local value = 1 * 5;
	-- objBuff:SetBuffValue(buffSystem, value)
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
	-- local troopNum = 7;
	-- objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local objPlayer = buffSystem:GetOtherPlayer(buffObj.m_releaseId);
	if not objPlayer then
		return;
	end
	
	local sOtherInfo = objPlayer:GetSystem("CSkillSystem"):GetInfo();
	
	local info = {};
	info.dwAttack = sOtherInfo.dwAttack * 0.20;
	
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[60002]
local Buff = BuffBasicInfo[60002]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	-- local value = 1 * 5;
	-- objBuff:SetBuffValue(buffSystem, value)
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
	-- local troopNum = 7;
	-- objBuff:SetTroopNum(troopNum);
end;
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwExpUp = 0.2;
	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--buff[60004]
local Buff = BuffBasicInfo[60004]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	-- local value = 1 * 5;
	-- objBuff:SetBuffValue(buffSystem, value)
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
	local lifeTime = 20000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
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
	local info = {};
	info.dwRemitAttack = 3000;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



--buff[21005]
local Buff = BuffBasicInfo[21005]
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
	info.dwSkillForbidFlag = 1;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[31005]
local Buff = BuffBasicInfo[31005]
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
	local lifeTime = 4500;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	--降低移动速度30%
	info.dwMoveSpeed = -0.5;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--buff[41005]
local Buff = BuffBasicInfo[41005]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	-- local value = 1 * 5;
	-- objBuff:SetBuffValue(buffSystem, value)
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
	local lifeTime = 1500;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
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
	info.dwFlee = 0.2 + (Lv*0.01);
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[51005]
local Buff = BuffBasicInfo[51005]
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
	local lifeTime = 2000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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




--buff[11013]
local Buff = BuffBasicInfo[11013]
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
	local rank = buffObj.m_Level;
	local price = 4000 + (50*rank);
	local info = {};
	--闪避率增加40%
	info.dwDuck = price;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[100420050]
local Buff = BuffBasicInfo[100420050]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local Z = objBuff.m_releaseType
	local G = objBuff.m_releaseId
	buffSystem:ChangeHp(-30,Z,G);
	buffSystem:ChangeMp(-10,Z,G);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 1 * 5;
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

end;

--buff[100520050]
local Buff = BuffBasicInfo[100520050]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local Z = objBuff.m_releaseType
	local G = objBuff.m_releaseId
	buffSystem:ChangeHp(-50,Z,G);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 1 * 5;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 10000;
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
	local troopNum = 1;
	objBuff:SetTroopNum(troopNum);
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

------------------------------------珍珑棋局BUFF-----------------------------------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)

end;


------------------------------连斩系统buff--------------------------------------
--buff[9000]
local Buff = BuffBasicInfo[9000]
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
	local lifeTime = 1800000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwExpUp = 0.05;	
	info.dwDanderUp = 0.2;
	info.dwBossAppend = 0.5;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[9001]
local Buff = BuffBasicInfo[9001]
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
	local lifeTime = 1800000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwExpUp = 0.1;		
	info.dwDanderUp = 0.4;
	info.dwBossAppend = 1;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[9002]
local Buff = BuffBasicInfo[9002]
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
	local lifeTime = 1800000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwExpUp = 0.15;	
	info.dwDanderUp = 0.6;	
	info.dwBossAppend = 1.5
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[9003]
local Buff = BuffBasicInfo[9003]
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
	local lifeTime = 1800000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwExpUp = 0.2;	
	info.dwDanderUp = 0.8;	
	info.dwBossAppend = 2;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[9004]
local Buff = BuffBasicInfo[9004]
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
	local lifeTime = 1800000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwExpUp = 0.25;		
	info.dwDanderUp = 1;
	info.dwBossAppend = 2.5;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[9005]
local Buff = BuffBasicInfo[9005]
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
	local lifeTime = 1800000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwExpUp = 0.3;		
	info.dwDanderUp = 1.2;
	info.dwBossAppend = 3;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[9006]
local Buff = BuffBasicInfo[9006]
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
	local lifeTime = 1800000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwExpUp = 0.35;		
	info.dwDanderUp = 1.4;
	info.dwBossAppend = 3.5;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[9007]
local Buff = BuffBasicInfo[9007]
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
	local lifeTime = 1800000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwExpUp = 0.4;		
	info.dwDanderUp = 1.6;
	info.dwBossAppend = 4;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[9008]
local Buff = BuffBasicInfo[9008]
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
	local lifeTime = 1800000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwExpUp = 0.45;		
	info.dwDanderUp = 1.8;
	info.dwBossAppend = 4.5;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--buff[9009]
local Buff = BuffBasicInfo[9009]
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
	local lifeTime = 1800000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwExpUp = 0.5;		
	info.dwDanderUp = 2;
	info.dwBossAppend = 5;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

---------------通用加血状态---------------------
--buff[9500]
local Buff = BuffBasicInfo[9500]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
		buffSystem:ChangeHp(2000,-1,0);
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
	local timeDelay = 2000;
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

---------------通用狂暴状态---------------------
--buff[9501]
local Buff = BuffBasicInfo[9501]
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
	info.dwAttack = 0.2;
	info.dwCrit = 0.1
	--info.dwAttackSpeed = 0.3;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


---------------欧阳锋大招配套BUFF---------------------
--buff[20002006]
local Buff = BuffBasicInfo[20002006]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	buffSystem:ChangeMp(-100000,-1,0);
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
	--禁止物品使用
	info.dwUseItemForbidFlag = 1;
	--info.dwMoveForbidFlag = 1;
	--info.dwSkillForbidFlag = -1;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



---------------一灯和尚---------------------
--buff[200020050]
local Buff = BuffBasicInfo[200020050]
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
	info.dwDefense = 2;
	info.dwAttack = 0.5;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


---------------角色特殊技能附带定身buff---------------------
--buff[9600]
local Buff = BuffBasicInfo[9600]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	--禁止物品使用
	info.dwUseItemForbidFlag = 1;
	info.dwMoveForbidFlag = 1;
	info.dwSkillForbidFlag = -1;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

---------------角色特殊技能附带血毒buff---------------------
--buff[9601]
local Buff = BuffBasicInfo[9601]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	--第一次不生效
	if effectNumber == 1 then
		return
	end
	local objPlayer = buffSystem:GetOtherPlayer(objBuff.m_releaseId);
	if not objPlayer then
		return;
	end
	
	local sOtherInfo = objPlayer:GetSystem("CSkillSystem"):GetInfo();
	
	local dwAttack = sOtherInfo.dwAttack/20*3;
	
	local Z = objBuff.m_releaseType
	local G = objBuff.m_releaseId
	buffSystem:ChangeHp(-dwAttack,Z,G);
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
	local lifeTime =  (buffLevel*150) + 3000;
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

---------------角色特殊技能附带沉默buff---------------------
--buff[9602]
local Buff = BuffBasicInfo[9602]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

	local info = {};
	--禁止物品使用
	--info.dwUseItemForbidFlag = 1;
	--info.dwMoveForbidFlag = 1;
	info.dwSkillForbidFlag = 1;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

---------------角色特殊技能附带不能移动buff---------------------
--buff[9603]
local Buff = BuffBasicInfo[9603]
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
	local lifeTime =  (buffLevel*20) + 1500;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	--禁止物品使用
	--info.dwUseItemForbidFlag = 1;
	info.dwMoveForbidFlag = 1;
	--info.dwSkillForbidFlag = -1;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


---------------角色特殊技能附带破甲buff---------------------
--buff[9604]
local Buff = BuffBasicInfo[9604]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwDefense = -0.2;	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

---------------角色特殊技能附带减功buff---------------------
--buff[9605]
local Buff = BuffBasicInfo[9605]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwAttack = -0.2;	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

---------------角色特殊技能附带减暴击buff---------------------
--buff[9606]
local Buff = BuffBasicInfo[9606]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwCrit = -0.5;	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

---------------角色特殊技能附带减速度buff---------------------
--buff[9607]
local Buff = BuffBasicInfo[9607]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwMoveSpeed = -0.3;	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

---------------角色特殊技能附带减攻击速度buff---------------------
--buff[9608]
local Buff = BuffBasicInfo[9608]
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
	local lifeTime =  (buffLevel*50) + 5000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwAttackSpeed = -0.3;	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


---------------角色特殊技能附带降低身法buff---------------------
--buff[9609]
local Buff = BuffBasicInfo[9609]
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
----------------------------------------------------------------------------------
-----------------------------------事件------------------------------------------
------*****************************************************--------
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)
	local info = {};
	info.dwFlee = -0.5;	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


---------------角色特殊技能附带禁止大挪移---------------------
--buff[9610]

local Buff = BuffBasicInfo[9610]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	-- local value = 1 * 5;
	-- objBuff:SetBuffValue(buffSystem, value)
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
	-- local troopNum = 7;
	-- objBuff:SetTroopNum(troopNum);
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




---------------怪物狂暴技能---------------------
--buff[9502]
local Buff = BuffBasicInfo[9502]
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
	local lifeTime = 1000*30;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwCrit = 0.1
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

----------------------------------龙鼎恢复----------------------------
--buff[9503]
local Buff = BuffBasicInfo[9503]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
		local Hp = 100;
		if (buffLevelel == 3) then
			Hp = 100
		elseif (buffLevelel == 2) then
			Hp = 100
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
	local timeDelay = 60000;
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

-----------------------------防御增加150%--------------------------------
--buff[9504]
local Buff = BuffBasicInfo[9504]
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
	info.dwDefense = 1.5;	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

-----------------------------怪物想不开了，要自杀--------------------------------
--buff[9505]
local Buff = BuffBasicInfo[9505]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
		if (effectNumber ~= 1) then
			buffSystem:ChangeHp(-99999999,-1,0);
		end
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
	local lifeTime = 970;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = 970;
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






------------------野外怪物BUFF---------------------
--buff提升防御[9550]
local Buff = BuffBasicInfo[9550]
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
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------野外怪物BUFF---------------------
--buff提升攻击[9551]
local Buff = BuffBasicInfo[9551]
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
	info.dwAttack = 3;	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------野外怪物BUFF---------------------
--buff提升闪避[9552]
local Buff = BuffBasicInfo[9552]
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
	info.dwDuck = 3;	
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------野外怪物BUFF---------------------
--buff提升无双[9553]
local Buff = BuffBasicInfo[9553]
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
	info.dwAttack = 0.4;
	info.dwDefense = 0.2;
	info.dwCrit = 0.3;
	info.dwMoveSpeed = 0.5;
	info.dwAttackSpeed= 0.5;
	info.dwMonsterAppend = 1;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



------------------野外怪物增加攻击力---------------------
--buff提升无双[9554]
local Buff = BuffBasicInfo[9554]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local NowValue = buffLevelel * 10
	
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------珍珑增加生命---------------------
--buff提升无双[9555]
local Buff = BuffBasicInfo[9555]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local NowValue = buffLevelel * 10
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------野外变异怪物一星说明---------------------
--buff提升无双[9556]
local Buff = BuffBasicInfo[9556]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------野外变异怪物二星说明---------------------
--buff提升无双[9557]
local Buff = BuffBasicInfo[9557]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------野外变异怪物三星说明---------------------
--buff提升无双[9558]
local Buff = BuffBasicInfo[9558]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------野外变异怪物四星说明---------------------
--buff提升无双[9559]
local Buff = BuffBasicInfo[9559]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------野外变异怪物四星说明---------------------
--buff提升无双[9560]
local Buff = BuffBasicInfo[9560]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;




--------------------------------------无双教学---------------------------------
local Buff = BuffBasicInfo[50022001]
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
	info.dwMoveSpeed = 0.3;
	info.dwAttackSpeed= 0.55;
	--info.dwMonsterAppend = 1;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--buff[100120041]
local Buff = BuffBasicInfo[100120041]
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
	local lifeTime = 36010;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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


--宝剑系统BUFF 减身法
--buff[71000]
local Buff = BuffBasicInfo[71000]
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
	info.dwFlee = -0.5;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--宝剑系统BUFF 减移动速度
--buff[71001]
local Buff = BuffBasicInfo[71001]
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
	info.dwMoveSpeed = -0.5;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--宝剑系统BUFF 减生命值
--buff[71002]
local Buff = BuffBasicInfo[71002]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local DengJi = buffLevelel;
--	local total = 1 * DengJi;
	local objPlayer = buffSystem:GetOtherPlayer(objBuff.m_releaseId);
	if not objPlayer then
		return;
	end
	local sOtherInfo = objPlayer:GetSystem("CSkillSystem"):GetInfo();

	local result = 0.2
	local dwAttack = sOtherInfo.dwAttack * result;
	local Z = objBuff.m_releaseType
	local G = objBuff.m_releaseId
	buffSystem:ChangeHp(-dwAttack,Z,G);
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
	local value = 1 * 5;
	objBuff:SetAppendBuffValue(buffSystem, value);
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 6000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = 3000;
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
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



--宝剑系统BUFF 减暴击
--buff[71003]
local Buff = BuffBasicInfo[71003]
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
	info.dwCrit = -0.5;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;




--增加移动速度
--buff[9630]
local Buff = BuffBasicInfo[9630]
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
	local lifeTime = 600000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwMoveSpeed = 0.2;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--攻击增加
--buff[9631]
local Buff = BuffBasicInfo[9631]
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
	local lifeTime = 600000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwAttack = 0.1;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--防御增加
--buff[9632]
local Buff = BuffBasicInfo[9632]
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
	local lifeTime = 600000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwDefense = 0.1;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--身法增加
--buff[9633]
local Buff = BuffBasicInfo[9633]
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
	local lifeTime = 600000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwFlee = 0.3;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--收益增加
--buff[9631]
local Buff = BuffBasicInfo[9635]
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

--收益增加2
--buff[9636]
local Buff = BuffBasicInfo[9636]
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

--收益增加3
--buff[9637]
local Buff = BuffBasicInfo[9637]
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

------------------怪物抗性说明---------------------
--buff怪物抗性说明[72001]
local Buff = BuffBasicInfo[72001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------怪物抗性说明---------------------
--buff怪物抗性说明[72002]
local Buff = BuffBasicInfo[72002]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------怪物抗性说明---------------------
--buff怪物抗性说明[72003]
local Buff = BuffBasicInfo[72003]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------怪物抗性说明---------------------
--buff怪物抗性说明[72004]
local Buff = BuffBasicInfo[72004]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------怪物抗性说明---------------------
--buff怪物抗性说明[72005]
local Buff = BuffBasicInfo[72005]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------怪物抗性说明---------------------
--buff怪物抗性说明[72006]
local Buff = BuffBasicInfo[72006]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------怪物抗性说明---------------------
--buff怪物抗性说明[72007]
local Buff = BuffBasicInfo[72007]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------怪物抗性说明---------------------
--buff怪物抗性说明[72008]
local Buff = BuffBasicInfo[72008]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------怪物抗性说明---------------------
--buff怪物抗性说明[72009]
local Buff = BuffBasicInfo[72009]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;












--通用减益Buff模板

--降低身法百分比
--buff[89000]
local Buff = BuffBasicInfo[89000]
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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


--降低身法固定值
--buff[89001]
local Buff = BuffBasicInfo[89001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local NowValue = 10 * buffLevelel;
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwFlee = -10*Level;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--降低暴击百分比
--buff[90000]
local Buff = BuffBasicInfo[90000]
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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


--降低暴击固定值
--buff[90001]
local Buff = BuffBasicInfo[90001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local NowValue = 10 * buffLevelel;
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwCrit = -10*Level;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--降低敌方攻击百分比
--buff[91000]
local Buff = BuffBasicInfo[91000]
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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


--降低敌方攻击固定值
--buff[91001]
local Buff = BuffBasicInfo[91001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local NowValue = 10 * buffLevelel;
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwAttack = -10*Level;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--降低生命百分比
--buff[92000]
local Buff = BuffBasicInfo[92000]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local Monster = buffSystem:GetBattleInfo()
	local HP = 0;

	if Monster then
		HP = Monster.dwHPMax/100*buffLevelel;
	end

	local objPlayer = buffSystem:GetOtherPlayer(objBuff.m_releaseId);
	if objPlayer then
		local sOtherInfo = objPlayer:GetSystem("CSkillSystem"):GetInfo();
		HP = sOtherInfo.dwHPMax/100*buffLevelel;
	end

	local Z = objBuff.m_releaseType
	local G = objBuff.m_releaseId
	buffSystem:ChangeHp(-HP,Z,G);

	local NowValue = HP
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
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

--降低生命固定值
--buff[92001]
local Buff = BuffBasicInfo[92001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local HP = 10 * buffLevelel;
	local Z = objBuff.m_releaseType;
	local G = objBuff.m_releaseId;
	buffSystem:ChangeHp(-HP,Z,G);

	local NowValue = HP
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
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

--降低内力百分比
--buff[92100]
local Buff = BuffBasicInfo[92100]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local Monster = buffSystem:GetBattleInfo()
	local MP = 0;

	if Monster then
		MP = Monster.dwMPMax/100*buffLevelel;
	end

	local objPlayer = buffSystem:GetOtherPlayer(objBuff.m_releaseId);
	if objPlayer then
		local sOtherInfo = objPlayer:GetSystem("CSkillSystem"):GetInfo();
		MP = sOtherInfo.dwMPMax/100*buffLevelel;
	end

	local Z = objBuff.m_releaseType
	local G = objBuff.m_releaseId
	buffSystem:ChangeMp(-MP,Z,G);

	local NowValue = MP
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
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

--降低内力固定值
--buff[92101]
local Buff = BuffBasicInfo[92101]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local MP = 10 * buffLevelel;
	local Z = objBuff.m_releaseType;
	local G = objBuff.m_releaseId;
	buffSystem:ChangeMp(-MP,Z,G);

	local NowValue = MP
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
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


--降低全部百分比
--buff[92200]
local Buff = BuffBasicInfo[92200]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local HP = 0;
	local MP = 0;
	
	local Monster = buffSystem:GetBattleInfo()
	if Monster then
		HP = Monster.dwHPMax/100*buffLevelel;
		MP = Monster.dwMPMax/100*buffLevelel;
	end

	local objPlayer = buffSystem:GetOtherPlayer(objBuff.m_releaseId);
	if objPlayer then
		local sOtherInfo = objPlayer:GetSystem("CSkillSystem"):GetInfo();
		HP = sOtherInfo.dwHPMax/100*buffLevelel;
		MP = sOtherInfo.dwHPMax/100*buffLevelel;
	end

	local Z = objBuff.m_releaseType
	local G = objBuff.m_releaseId
	buffSystem:ChangeHp(-HP,Z,G);
	buffSystem:ChangeMp(-MP,Z,G);

	local NowValue = 1*buffLevelel
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
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


--降低全部固定值
--buff[92201]
local Buff = BuffBasicInfo[92201]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	
	local HP = 10 * buffLevelel;
	local MP = 10 * buffLevelel;

	local Z = objBuff.m_releaseType
	local G = objBuff.m_releaseId
	buffSystem:ChangeHp(-HP,Z,G);
	buffSystem:ChangeMp(-MP,Z,G);

	local NowValue = 10*buffLevelel
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
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


--降低移动速度百分比
--buff[93000]
local Buff = BuffBasicInfo[93000]
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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


--降低移动速度固定值
--buff[93001]
local Buff = BuffBasicInfo[93001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local NowValue = 10 * buffLevelel;
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwMoveSpeed = -10*Level;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--降低防御百分比
--buff[94000]
local Buff = BuffBasicInfo[94000]
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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


--降低防御固定值
--buff[94001]
local Buff = BuffBasicInfo[94001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local NowValue = 10 * buffLevelel;
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwDefense = -10*Level;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--击晕
--buff[96000]
local Buff = BuffBasicInfo[96000]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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


--定身
--buff[97000]
local Buff = BuffBasicInfo[97000]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
--buff[99000]
local Buff = BuffBasicInfo[99000]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)
end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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








--通用模板增益BUFF
--移动速度
--buff[190001]
local Buff = BuffBasicInfo[190001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	local NowValue = 10 * buffLevelel;
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwMoveSpeed = 10*Level;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--身法
--buff[191000]
local Buff = BuffBasicInfo[191000]
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwFlee = 0.01*Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--暴击
--buff[192000]
local Buff = BuffBasicInfo[192000]
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwCrit = 0.01*Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--经验
--buff[193000]
local Buff = BuffBasicInfo[193000]
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwExpUp = 0.01*Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--BOSS伤害
--buff[194000]
local Buff = BuffBasicInfo[194000]
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwBossAppend = 0.01*Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--技能等级
--buff[195000]
local Buff = BuffBasicInfo[195000]
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwAllSkillUpLv = 1*Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--演武真气加成
--buff[196000]
local Buff = BuffBasicInfo[196000]
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwMartialZhenqiUp = 0.01*Level;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


--伤害减免
--buff[197000]
local Buff = BuffBasicInfo[197000]
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
	local lifeTime = 1000 * objBuff.m_lifeTimeParam;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwRemitAttack = 100*Level;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

---------------副本BUFF

------------------五行道场 金---------------------
local Buff = BuffBasicInfo[50500001]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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




------------------五行道场 木---------------------
local Buff = BuffBasicInfo[50500002]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

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


------------------五行道场 水---------------------
local Buff = BuffBasicInfo[50500003]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

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



------------------五行道场 火---------------------
local Buff = BuffBasicInfo[50500004]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
end;
--从触发之后到下一次效果触发的时间差
function Buff:GetTimeDelay(objBuff,buffLevel,EffectNumber)
	local timeDelay = nil;
	objBuff:SetTimeDelay(timeDelay);
end;
--buff的Troop队列的叠加上限
function Buff:GetBuffTroopMax(objBuff, buffLevel, effectNumber)

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

------------------五行道场 土---------------------
local Buff = BuffBasicInfo[50500005]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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


------------------宝甲特效使用---------------------
local Buff = BuffBasicInfo[71100]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 2000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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



------------------vip---------------------
local Buff = BuffBasicInfo[8888]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

------------------页游网---------------------
local Buff = BuffBasicInfo[8880]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	CTitleSystem:DelTitle(10022)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------07073---------------------
local Buff = BuffBasicInfo[8881]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	CTitleSystem:DelTitle(10020)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------265G---------------------
local Buff = BuffBasicInfo[8882]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	CTitleSystem:DelTitle(10021)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------多玩---------------------
local Buff = BuffBasicInfo[8883]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	CTitleSystem:DelTitle(10019)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------腾讯---------------------
local Buff = BuffBasicInfo[8884]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	CTitleSystem:DelTitle(10018)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------新浪---------------------
local Buff = BuffBasicInfo[8885]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	CTitleSystem:DelTitle(10016)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------Cwan---------------------
local Buff = BuffBasicInfo[8886]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	CTitleSystem:DelTitle(10017)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------17173称号---------------------
local Buff = BuffBasicInfo[8887]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	CTitleSystem:DelTitle(10015)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------17173特效---------------------
local Buff = BuffBasicInfo[8889]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



------------------金玉满堂特效---------------------
local Buff = BuffBasicInfo[8900]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------360凤凰至尊称号卡---------------------
local Buff = BuffBasicInfo[8901]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	CTitleSystem:DelTitle(10023)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------360凤凰霸主称号卡---------------------
local Buff = BuffBasicInfo[8902]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	CTitleSystem:DelTitle(10024)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------360凤凰盟主称号卡---------------------
local Buff = BuffBasicInfo[8903]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	CTitleSystem:DelTitle(10025)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------天罡北斗阵---------------------
local Buff = BuffBasicInfo[50500006]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

------------------天罡北斗阵---------------------
local Buff = BuffBasicInfo[50500007]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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


------------------天罡北斗阵---------------------
local Buff = BuffBasicInfo[50500008]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

--终南山剧情怪物使用
local Buff = BuffBasicInfo[10092013]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

--终南山剧情怪物使用不掉落旗子
local Buff = BuffBasicInfo[100920130]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

--盟主战群体BUFF
local Buff = BuffBasicInfo[9634]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	info.dwExpUp = 0.2;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------夜战襄阳---------------------
local Buff = BuffBasicInfo[50500009]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------天罡北斗阵---------------------
local Buff = BuffBasicInfo[50500010]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------天罡北斗阵---------------------
local Buff = BuffBasicInfo[50500011]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------天罡北斗阵---------------------
local Buff = BuffBasicInfo[50500012]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------天罡北斗阵---------------------
local Buff = BuffBasicInfo[50500013]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
--该buff被成功附加时运行该事件(具体与策划核对)
function Buff:EventPAddbuff(buffObj, buffSystem)

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
------------------天罡北斗阵---------------------
local Buff = BuffBasicInfo[50500014]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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

------------------天罡北斗阵---------------------
local Buff = BuffBasicInfo[50500015]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 3600000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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

--伤害减免
--buff[10092014]
local Buff = BuffBasicInfo[10092014]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	info.dwRemitAttack = 9500;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


---------------定身BUFF---------------------
--buff[999999]

local Buff = BuffBasicInfo[999999]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	-- local value = 1 * 5;
	-- objBuff:SetBuffValue(buffSystem, value)
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
	local lifeTime =  500;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
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
	local info = {};
	info.dwMoveForbidFlag = 1;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;



---------------剧情移动加速---------------------
--buff[999998]

local Buff = BuffBasicInfo[999998]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	-- local value = 1 * 5;
	-- objBuff:SetBuffValue(buffSystem, value)
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
	local lifeTime =  1000*30;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
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
	local info = {};
	info.dwMoveSpeed = 500;
	buffSystem:ExecAddBuffEffect(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------武林盟主---------------------
local Buff = BuffBasicInfo[9638]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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

-----------------------------------------名剑祝福符buff-------------------------------------------CSwordSystem
--buff[73000]
local Buff = BuffBasicInfo[73000]
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
	local buffId = buffObj.m_id;
	local classId = _G.BuffBasicInfo[buffObj.m_id].dwClassId;
	local level = buffObj.m_Level;
	local modulus = _G.CommercialBuff[classId][level];
	if not modulus then
		return;
	end;
	local value = modulus;
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CSwordSystem");
	--equipSystem:SetDiscount_Intersify(value)
	
	--buff作用类型  
	equipSystem:SetDiscount_SwordMoney(value);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CSwordSystem");
	equipSystem:SetDiscount_SwordMoney(1)
end;

----------------------------------------宝甲祝福符buff-------------------------------------------CAmuletSystem
--buff[73001]
local Buff = BuffBasicInfo[73001]
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
	local buffId = buffObj.m_id;
	local classId = _G.BuffBasicInfo[buffObj.m_id].dwClassId;
	local level = buffObj.m_Level;
	local modulus = _G.CommercialBuff[classId][level];
	if not modulus then
		return;
	end;
	local value = modulus;
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CAmuletSystem");
	--equipSystem:SetDiscount_Intersify(value)
	
	--buff作用类型
	equipSystem:SetDiscount_UpGrade(value);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CAmuletSystem");
	equipSystem:SetDiscount_UpGrade(1)
end;

-----------------------------------------升阶祝福符buff-------------------------------------------CEquipIntensifySystem
--buff[73002]
local Buff = BuffBasicInfo[73002]
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
	local buffId = buffObj.m_id;
	local classId = _G.BuffBasicInfo[buffObj.m_id].dwClassId;
	local level = buffObj.m_Level;
	local modulus = _G.CommercialBuff[classId][level];
	if not modulus then
		return;
	end;
	local value = modulus;
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CEquipIntensifySystem");
	--equipSystem:SetDiscount_Intersify(value)
	
	--buff作用类型
	equipSystem:SetDiscount_LevelUp(value);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CEquipIntensifySystem");
	equipSystem:SetDiscount_LevelUp(1)
end;

---------------------------------------宝石祝福符buff-------------------------------------------CStoneSystem
--buff[73003]
local Buff = BuffBasicInfo[73003]
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
	local buffId = buffObj.m_id;
	local classId = _G.BuffBasicInfo[buffObj.m_id].dwClassId;
	local level = buffObj.m_Level;
	local modulus = _G.CommercialBuff[classId][level];
	if not modulus then
		return;
	end;
	local value = modulus;
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CStoneSystem");
	--equipSystem:SetDiscount_Intersify(value)
	
	--buff作用类型
	equipSystem:SetDiscount_StoneZQ(value);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CStoneSystem");
	equipSystem:SetDiscount_StoneZQ(1)
end;

---------------------------------------剑气倍数buff-------------------------------------------
--buff[73004]
local Buff = BuffBasicInfo[73004]
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
	local buffId = buffObj.m_id;
	local classId = _G.BuffBasicInfo[buffObj.m_id].dwClassId;
	local level = buffObj.m_Level;
	local modulus = _G.CommercialBuff[classId][level];
	if not modulus then
		return;
	end;
	local value = modulus;
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CSwordSystem");
	--equipSystem:SetDiscount_Intersify(value)
	
	--buff作用类型
	equipSystem:SetSwordGasParam(value);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CSwordSystem");
	equipSystem:SetSwordGasParam(1)
end;

---------------------------------------熔炼倍数buff-------------------------------------------
--buff[73005]
local Buff = BuffBasicInfo[73005]
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
	local buffId = buffObj.m_id;
	local classId = _G.BuffBasicInfo[buffObj.m_id].dwClassId;
	local level = buffObj.m_Level;
	local modulus = _G.CommercialBuff[classId][level];
	if not modulus then
		return;
	end;
	local value = modulus;
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CAmuletSystem");
	--equipSystem:SetDiscount_Intersify(value)
	
	--buff作用类型
	equipSystem:SetMultiple_Intensify(value);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CAmuletSystem");
	equipSystem:SetMultiple_Intensify(1)
end;

--------------------------------------强化倍数buff-------------------------------------------
--buff[73006]
local Buff = BuffBasicInfo[73006]
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
	local buffId = buffObj.m_id;
	local classId = _G.BuffBasicInfo[buffObj.m_id].dwClassId;
	local level = buffObj.m_Level;
	local modulus = _G.CommercialBuff[classId][level];
	if not modulus then
		return;
	end;
	local value = modulus;
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CEquipIntensifySystem");
	--equipSystem:SetDiscount_Intersify(value)
	
	--buff作用类型
	equipSystem:SetDiscount_Intersify(value);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CEquipIntensifySystem");
	equipSystem:SetDiscount_Intersify(1)
end;

---------------------------------------重置附加属性折扣 buff-------------------------------------------
--buff[73007]
local Buff = BuffBasicInfo[73007]
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
	local buffId = buffObj.m_id;
	local classId = _G.BuffBasicInfo[buffObj.m_id].dwClassId;
	local level = buffObj.m_Level;
	local modulus = _G.CommercialBuff[classId][level];
	if not modulus then
		return;
	end;
	local value = modulus;
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CEquipIntensifySystem");
	--equipSystem:SetDiscount_Intersify(value)
	
	--buff作用类型
	equipSystem:SetDiscount_Append(value);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CEquipIntensifySystem");
	equipSystem:SetDiscount_Append(1)
	
end;

------------------------------------------重置属性类型折扣 buff-------------------------------------------
--buff[73008]
local Buff = BuffBasicInfo[73008]
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
	local buffId = buffObj.m_id;
	local classId = _G.BuffBasicInfo[buffObj.m_id].dwClassId;
	local level = buffObj.m_Level;
	local modulus = _G.CommercialBuff[classId][level];
	if not modulus then
		return;
	end;
	local value = modulus;
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CEquipIntensifySystem");
	--equipSystem:SetDiscount_Intersify(value)
	
	--buff作用类型
	equipSystem:SetDiscount_ResetType(value);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CEquipIntensifySystem");
	equipSystem:SetDiscount_ResetType(1)
	
end;

-------------------------------------------增加属性数值折扣 buff-------------------------------------------
--buff[73009]
local Buff = BuffBasicInfo[73009]
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
	local buffId = buffObj.m_id;
	local classId = _G.BuffBasicInfo[buffObj.m_id].dwClassId;
	local level = buffObj.m_Level;
	local modulus = _G.CommercialBuff[classId][level];
	if not modulus then
		return;
	end;
	local value = modulus;
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CEquipIntensifySystem");
	--equipSystem:SetDiscount_Intersify(value)
	
	--buff作用类型
	equipSystem:SetDiscount_AddValue(value);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CEquipIntensifySystem");
	equipSystem:SetDiscount_AddValue(1)
	
end;

-------------------------------------------设置坐骑升阶折扣 buff-------------------------------------------
--buff[73010]
local Buff = BuffBasicInfo[73010]
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
	local buffId = buffObj.m_id;
	local classId = _G.BuffBasicInfo[buffObj.m_id].dwClassId;
	local level = buffObj.m_Level;
	local modulus = _G.CommercialBuff[classId][level];
	if not modulus then
		return;
	end;
	local value = modulus;
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CMountSystem");
	
	--buff作用类型
	equipSystem:SetDisCount_UpGrade(value);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	local objPlayer = buffSystem:GetPlayer();
	if not objPlayer then
		return;
	end;
	local equipSystem = objPlayer:GetSystem("CMountSystem");
	equipSystem:SetDisCount_UpGrade(1)
	
end;

------------------洪武尊者称号---------------------
local Buff = BuffBasicInfo[8904]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	CTitleSystem:DelTitle(10026)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------年少有为---------------------
local Buff = BuffBasicInfo[8907]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	CTitleSystem:DelTitle(10028)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------阿兰家族---------------------
local Buff = BuffBasicInfo[8908]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	CTitleSystem:DelTitle(10029)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;

------------------卫士荣耀特效buff---------------------
local Buff = BuffBasicInfo[8905]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	print( "=====================================!!!!!!!!!!!!!!!!!!!!!===!!!!!!!!!!!!!!!!!!!!!" )
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------360凤凰奇侠称号---------------------
local Buff = BuffBasicInfo[8906]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	CTitleSystem:DelTitle(10027)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


-------------------------------------------专精暴击符 buff-------------------------------------------
--buff[2600000]
local Buff = BuffBasicInfo[2600000]
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);	
end;
------------------PK状态---------------------
local Buff = BuffBasicInfo[510002]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000*60*1;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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

------------------红名---------------------
local Buff = BuffBasicInfo[510003]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber)

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
--返回buff值
function Buff:GetValue(objBuff)
	return objBuff.m_value;
end;
--初始化buff值
function Buff:InitBuffValue(objBuff, buffSystem, buffLevel)

end;
--buff的持续时间（0--生命周期结束,nil --为永久buff）
function Buff:GetBuffLife(objBuff, buffLevel, effectNumber)
	local lifeTime = 1000*60*1;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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

------------------3独一无二称号---------------------
local Buff = BuffBasicInfo[8909]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	CTitleSystem:DelTitle(10030)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;


------------------生日---------------------
local Buff = BuffBasicInfo[8910]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 

end;
--设置Buff的值（自动回蓝/血的药水）
function Buff:SetValue(value,objBuff, buffSystem, buffLevel)
	objBuff:SetBuffValue(buffSystem, value)
end;
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
	CTitleSystem:DelTitle(10031)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);
end;
-------------------------------------------困兽之斗防御buff-------------------------------------------
--buff[50500020]
local Buff = BuffBasicInfo[50500020]
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
	local lifeTime = 30*1000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
	info.dwDefense = 0.5;
	buffSystem:ExecAddBuffPercent(info, buffObj.m_id);
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);	
end;


-------------------------------------------困兽之斗攻击buff-------------------------------------------
--buff[50500021]
local Buff = BuffBasicInfo[50500021]
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
	local lifeTime = 30*1000;
	objBuff:SetBuffTime(lifeTime);   --设置buff的生命周期
	objBuff:SetFixBuffTime(lifeTime);
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
end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);	
end;


-------------------------------------------困兽之斗回血buff-------------------------------------------
--buff[50500022]
local Buff = BuffBasicInfo[50500022]
--获得buff的效果
--objBuff:buff对象,buffSystem:buff系统,buffLevelel:buff等级,effectNumber:效果次数
function Buff:GetBuffEffect(objBuff, buffSystem, buffLevelel, effectNumber) 
	buffSystem:ChangeHp(3000);	
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
	buffSystem:ExecDelBuffEffect(buffObj.m_id);	
end;


-------------------------------------------困兽之斗怪物buff-------------------------------------------
--buff[50500023]
local Buff = BuffBasicInfo[50500023]
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

end;
--该buff消失时执行该事件
function Buff:EventPDeletebuff(buffObj,buffSystem)
	buffSystem:ExecDelBuffEffect(buffObj.m_id);	
end;