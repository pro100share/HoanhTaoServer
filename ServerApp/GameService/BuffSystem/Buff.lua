--[[
功能：buff系统 单个buff（服务器）
作者：曲莹
时间：2012-2-22
]]

_G.CBuff = {}

--CBuff对象:roleId为被加buff者的id
function CBuff:new(entityId, dwId, roleId, level, buffSystem, releaseType, releaseId, lifeTimeParam)
	local buffObj = {}
	for i, v in pairs(CBuff) do
		if type(v) == "function" then
			buffObj[i] = v;
		end;
	end;
	local buffInfo = BuffBasicInfo[dwId];
	buffObj.m_BuffSystem = buffSystem;
	buffObj.m_EntityID = entityId;
	buffObj.m_id = dwId;
	buffObj.m_RoleID = roleId;
	buffObj.m_Level = level or 1;
	-- buffObj.m_classId = buffInfo.dwClassId;
	-- buffObj.m_icon = buffInfo.szIcon;
	-- buffObj.m_nameId = buffInfo.DwNameId;
	-- buffObj.m_explainIdd = buffInfo.DwExplainId
	-- buffObj.m_showId = buffInfo.szShowId
	-- buffObj.m_saveId = buffInfo.dwSaveId
	-- buffObj.m_isAlong = buffInfo.bIsAlong
	-- buffObj.m_changeRule = buffInfo.dwChangeRule
	-- buffObj.m_troopShow = buffInfo.dwTroopShow;
	-- buffObj.m_isSave = buffInfo.bIsLogoutSave;
	-- buffObj.m_isLast = buffInfo.bIsLogoutLast;
	-- buffObj.m_actionId = buffInfo.dwActionId;
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
function CBuff:GetID()
	return self.m_id;
end;
-------------------------------------------------------------------------------------------------------------
--------------------------------------------添加buff的效果------------------------------------------------
--------------------------------------------------------------------------------------------------------------
--添加buff及buff每次作用
function CBuff:Use(buffSystem)
	local bufConfig = BuffBasicInfo[self:GetID()];
	bufConfig:GetBuffEffect(self, buffSystem, self.m_Level, self.m_EffectNum);
end;
---------------------------------------------------------------------------------------------------------------
-----------------------------------------获得buff的一些属性----------------------------------------------------
---------------------------------------------------------------------------------------------------------------
--获得buff的下次触发时间
function CBuff:GetTimeDelay()
	local bufConfig = BuffBasicInfo[self:GetID()];
	bufConfig:GetTimeDelay(self, self.m_Level, self.m_EffectNum);
end;
--获得buff的生命 周期
function CBuff:GetLifeTime(num)
	if(not num) then
		num = 1;
	end
	local bufConfig = BuffBasicInfo[self:GetID()];
	--设置lifeTime
	bufConfig:GetBuffLife(self, self.m_Level, self.m_EffectNum,num);
end;
--获得buff的最大叠加次数
function CBuff:GetBuffTroopMax()
	local bufConfig = BuffBasicInfo[self:GetID()];
	--获得叠加次数
	bufConfig:GetBuffTroopMax(self, self.m_Level, self.m_EffectNum);
end;
--获得buff的值
function CBuff:SetBuffValue(buffSystem)
	local bufConfig = BuffBasicInfo[self:GetID()];
	--获得buff的值
	bufConfig:SetValue(self, buffSystem, self.m_Level);
end;
--初始化buff的值
function CBuff:InitBuffValue(buffSystem,num)
	if(not num) then
		num = 1;
	end
	local bufConfig = BuffBasicInfo[self:GetID()];
	--获得buff的值
	bufConfig:InitBuffValue(self, buffSystem, self.m_Level,num);
end;
----------------------------------------------------------------------------------------------------
-----------------------------------------设置buff的一些属性-------------------------------------
----------------------------------------------------------------------------------------------------

function CBuff:SetAppendBuffValue(buffSystem, value)
	-- 如果value为nil，不改变buff的value
	if not value then
		return;
	end;
	
	self.m_value = value;
	buffSystem:SetBuffValue(self);
end;
--设置buff的值
function CBuff:SetBuffValue(buffSystem, value)
	-- 如果value为nil，不改变buff的value
	if not value then
		return;
	end;
	if self.m_value ~= value then
		self.m_value = value;
		buffSystem:SetBuffValue(self);
	end;
end;
--设置buff的时间
function CBuff:SetBuffTime(lifeTime)
	self.m_time = lifeTime;
end;
function CBuff:GetBuffTime()
	return self.m_time;
end;
function CBuff:SetFixBuffTime(lifeTime)
	self.m_Fixtime = lifeTime;
end;
--设置buff的触发时间
function CBuff:SetTimeDelay(timeValue)
	self.m_frequency = timeValue;
end;
--设置初始化buff值
function CBuff:SetInitBuffValue(value)
	self.m_value = value;
end;
--获得buff的效果次数
function CBuff:SetEffectNum()
	self.m_EffectNum = self.m_EffectNum + 1;
end;
--设置buff叠加后的影响次数
function CBuff:SetAddEffectNum(num)
	self.m_EffectNum = self.m_EffectNum + num;
end;
--设置最大的叠加次数
function CBuff:SetTroopNum(layerNum)
	self.m_MaxTroopNum = layerNum;
end;
--删除buff之后效果
function CBuff:DeleteBuffEffect(buffSystem)
	local bufConfig = BuffBasicInfo[self:GetID()];
	bufConfig:EventPDeletebuff(self, buffSystem);
end;
--添加buff之后的效果
function CBuff:AddBuffEffect(buffSystem)
	local bufConfig = BuffBasicInfo[self:GetID()];
	bufConfig:EventPAddbuff(self, buffSystem);
end;





