
_G.CMonsterBuff = {};

function CMonsterBuff:new(entityId, dwId, roleId, level, buffSystem, releaseType, releaseId, lifeTimeParam)
	local buffObj = {}
	for i, v in pairs(CMonsterBuff) do
		if type(v) == "function" then
			buffObj[i] = v;
		end;
	end;
	local buffInfo = BuffBasicInfo[dwId];
	buffObj.m_BuffSystem = buffSystem;
	buffObj.m_EntityID = entityId;
	buffObj.m_id = dwId;
	buffObj.m_RoleID = roleId;
	buffObj.m_Level = level;
	buffObj.m_classId = buffInfo.dwClassId;
	buffObj.m_icon = buffInfo.szIcon;
	buffObj.m_showId = buffInfo.szShowId
	buffObj.m_saveId = buffInfo.dwSaveId
	buffObj.m_isAlong = buffInfo.bIsAlong
	buffObj.m_changeRule = buffInfo.dwChangeRule
	buffObj.m_troopShow = buffInfo.dwTroopShow;
	buffObj.m_isSave = buffInfo.bIsLogoutSave;
	buffObj.m_isLast = buffInfo.bIsLogoutLast;
	buffObj.m_value = 0;
	buffObj.m_time = 0;
	buffObj.m_frequency = 0;   --buff的执行频率
	buffObj.m_EffectNum = 0;  --buff的影响次数
	buffObj.m_MaxTroopNum = 0;
	--buff释放者type和id
	buffObj.m_releaseType = releaseType;
	buffObj.m_releaseId = releaseId;
	
	buffObj.m_lifeTimeParam = lifeTimeParam or 0;
	
	return buffObj;
end;

--获得buff的id
function CMonsterBuff:GetID()
	return self.m_id;
end;
-------------------------------------------------------------------------------------------------------------
--------------------------------------------添加buff的效果------------------------------------------------
--------------------------------------------------------------------------------------------------------------
--添加buff及buff每次作用
function CMonsterBuff:Use(buffSystem)
	local bufConfig = BuffBasicInfo[self:GetID()];

	bufConfig:GetBuffEffect(self, self.m_BuffSystem, self.m_Level, self.m_EffectNum);
end;
---------------------------------------------------------------------------------------------------------------
-----------------------------------------获得buff的一些属性----------------------------------------------------
---------------------------------------------------------------------------------------------------------------
--获得buff的下次触发时间
function CMonsterBuff:GetTimeDelay()
	local bufConfig = BuffBasicInfo[self:GetID()];
	bufConfig:GetTimeDelay(self, self.m_Level, self.m_EffectNum);
end;
--获得buff的生命 周期
function CMonsterBuff:GetLifeTime()
	local bufConfig = BuffBasicInfo[self:GetID()];
	if not bufConfig.GetBuffLife then
		_err("=======CMonsterBuff:GetLifeTime========",self:GetID())
		return
	end
	--设置lifeTime
	bufConfig:GetBuffLife(self, self.m_Level, self.m_EffectNum);
end;
--获得buff的最大叠加次数
function CMonsterBuff:GetBuffTroopMax()
	local bufConfig = BuffBasicInfo[self:GetID()];
	--获得叠加次数
	bufConfig:GetBuffTroopMax(self, self.m_Level, self.m_EffectNum);
end;
--获得buff的值
function CMonsterBuff:SetBuffValue(buffSystem)
	local bufConfig = BuffBasicInfo[self:GetID()];
	--获得buff的值
	bufConfig:SetValue(self, self.m_BuffSystem, self.m_Level);
end;
--初始化buff的值
function CMonsterBuff:InitBuffValue(buffSystem)
	local bufConfig = BuffBasicInfo[self:GetID()];
	--获得buff的值
	bufConfig:InitBuffValue(self, self.m_BuffSystem, self.m_Level);
end;
----------------------------------------------------------------------------------------------------
-----------------------------------------设置buff的一些属性-------------------------------------
----------------------------------------------------------------------------------------------------

function CMonsterBuff:SetAppendBuffValue(buffSystem, value)
	-- 如果value为nil，不改变buff的value
	if not value then
		return;
	end;
	
	self.m_value = value;
	self.m_BuffSystem:SetBuffValue(self);
end;
--设置buff的值
function CMonsterBuff:SetBuffValue(buffSystem, value)
	-- 如果value为nil，不改变buff的value
	if not value then
		return;
	end;
	self.m_value = value;
	self.m_BuffSystem:SetBuffValue(self);
end;
--设置buff的时间
function CMonsterBuff:SetBuffTime(lifeTime)
	self.m_time = lifeTime;
end;
function CMonsterBuff:SetFixBuffTime(lifeTime)
	self.m_Fixtime = lifeTime;
end;
--设置buff的触发时间
function CMonsterBuff:SetTimeDelay(timeValue)
	self.m_frequency = timeValue;
end;
--设置初始化buff值
function CMonsterBuff:SetInitBuffValue(value)
	self.m_value = value;
end;
--获得buff的效果次数
function CMonsterBuff:SetEffectNum()
	self.m_EffectNum = self.m_EffectNum + 1;
end;
--设置buff叠加后的影响次数
function CMonsterBuff:SetAddEffectNum(num)
	self.m_EffectNum = self.m_EffectNum + num;
end;
--设置最大的叠加次数
function CMonsterBuff:SetTroopNum(layerNum)
	self.m_MaxTroopNum = layerNum;
end;
--删除buff之后效果
function CMonsterBuff:DeleteBuffEffect(buffSystem)
	local bufConfig = BuffBasicInfo[self:GetID()];
	bufConfig:EventPDeletebuff(self, self.m_BuffSystem);
end;
--添加buff之后的效果
function CMonsterBuff:AddBuffEffect(buffSystem)
	local bufConfig = BuffBasicInfo[self:GetID()];
	bufConfig:EventPAddbuff(self, self.m_BuffSystem);
end;
