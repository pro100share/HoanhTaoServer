--[[
功能：宝剑
作者：曲莹
时间：2012-09-20
]]
_G.CSword = {}
function CSword:new()
	local obj = {}
	obj.dwSwordLadder = 1;   --阶数
	obj.dwSwordLevel = 1;    --等级
	obj.dwSwordGas = 0;      --剑气
	obj.r_BaseProp = _G.SwordBasicConfig;  --基本属性
	obj.r_DataProp = _G.SwordDataConfig;   --数值属性
	obj.r_DesConfig = _G.DesConfig;        --描述
	obj.r_LevelProp = _G.SwordLevelLimit;   --等级信息
	for i,v in pairs(CSword) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;  
	return obj;
end; 

function CSword:Create()
	return true;
end;

function CSword:Update(dwInterval)

end;

function CSword:Destroy()

end;
--设置宝剑阶数
function CSword:SetSwordLadder(ladder)
	self.dwSwordLadder = ladder;
end;
--设置宝剑等级
function CSword:SetSwordLevel(level)
	self.dwSwordLevel = level;
end;
--设置宝剑真气值
function CSword:SetSwordGas(gasValue)
	self.dwSwordGas = gasValue;
end;
--获得宝剑阶数
function CSword:GetSwordLadder()
	return self.dwSwordLadder;
end;
--获得宝剑等级
function CSword:GetSwordLevel()
	return self.dwSwordLevel;
end;
--获得宝剑真气
function CSword:GetSwordGas()
	return self.dwSwordGas;
end;
--获得剑气评分
function CSword:GetMarkValue()
	return self.r_DataProp.MarkValue(self);
end;
---获得特殊属性卡片评分
function CSword:GetCardMarkValue()
	return self.r_DataProp.CardMarkValue();
end
--获得攻击值
function CSword:GetAttackValue(attackValue)
	return self.r_DataProp.AttackValue(attackValue, self);
end;
--获得触发几率
function CSword:GetHappenRate()
	return self.r_DataProp.HappenRate(self);
end;
--获得每阶的等级
function CSword:GetLevelByLadder(ladder)
	local maxLevel = self.r_BaseProp[ladder].level;
	return maxLevel;
end;
--获得显示几率
function CSword:GetShowRate()
	return self.r_DataProp.ShowRate(self);
end;
--获得升级所需的银两
function CSword:GetNeedGold()
	return self.r_DataProp.NeedGold(self);
end;
--获得升级所需的剑魂石
function CSword:GetNeedStone()
	return self.r_DataProp.NeedStone(self);
end;
--获得所需石头id
function CSword:GetNeedStoneId()
	return self.r_DataProp.StoneId(self);
end;
--获得升级的成功率
function CSword:GetSuccessRate(tgValue)
	return self.r_DataProp.SuccessRate(self, tgValue);
end;

----获取特殊属性卡ID
function CSword:GetPropertyCardItemID()
	return self.r_DataProp.PropertyCardItemID();
end
----获取特殊属性卡片技能激活消耗信息
function CSword:GetActProCardConInfo()
	return self.r_DataProp.ActProCardConInfo();
end
---获取特殊属性卡片技能激活属性加成
function CSword:GetAddProCardAttr()
	return self.r_DataProp.AddProCardAttr();
end
--获得基本属性加成
function CSword:GetPropertyValue()
	return self.r_DataProp.PropertyType(self);
end;
--获得宝剑的基本属性
function CSword:GetSwordBaseInfo()
	local ladder = self:GetSwordLadder();
	return self.r_BaseProp[ladder];
end;
--获得模型
function CSword:GetSwordModel()
	local ladder = self:GetSwordLadder();
	local model = self.r_BaseProp[ladder].model;
	return model;
end;
--获得宝剑的技能id
function CSword:GetSwordSkillId()
	local ladder = self:GetSwordLadder();
	return self.r_BaseProp[ladder].skillId;
end;
--获得宝剑最大攻击个数
function CSword:GetSwordAttackNum()
	local level = self:GetSwordLevel();
	return self.r_LevelProp[level].dwAttackNum;
end;
--获得技能
function CSword:GetSkillTbl()
	local ladder = self:GetSwordLadder();
	return self.r_BaseProp[ladder].skillTbl;
end;
--获得每次的剑气值
function CSword:GetPerSwordGas()
	return self.r_DataProp.AddSwordGas(self);
end;
--获得每阶每级的剑气总值
function CSword:GetTotalSwordGas()
	local level = self:GetSwordLevel();
	return self.r_LevelProp[level].dwGas;
end;
--获得当前阶数的最高等级
function CSword:GetMaxLevel()
	local ladder = self:GetSwordLadder();
	local maxLevel = table.maxn(self.r_BaseProp[ladder]);
	return maxLevel;
end;
--获得最大等级
function CSword:GetMaxLadder()
	return table.maxn(self.r_BaseProp);
end;
--获得下个等级
function CSword:GetNextLevel()
	local info = self:GetSwordBaseInfo();
	return info.level;
end;
--获得下阶
function CSword:GetNextLadder()
	local ladder = self:GetSwordLadder();
	return self.r_BaseProp[ladder].nextLadder;
end;

--获得宝剑武学类型
function CSword:GetSwordType()
	local ladder = self:GetSwordLadder();
	return self.r_BaseProp[ladder].skillType;
end;

function CSword:GetNetData()
	local netData = {};
	--名剑等阶
	netData[1] 	= self.dwSwordLadder;
	--名剑等级
	netData[2] 	= self.dwSwordLevel;
	--名剑剑气
	netData[3]	= self.dwSwordGas;
	return netData
end;

