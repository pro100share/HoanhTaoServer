--[[
功能：坐骑对象
版本：
	v1.0	2012-04-10 create by lkj
	v2.0	2012-10-15 modify by lkj 坐骑升阶逻辑调整，坐骑技能逻辑调整
]]

_G.CMount = {};
--new出一个新的对象
function CMount:new(mountID)
	local obj = {};
	--坐骑配置ID
	obj.n_EnumID 			= mountID;
	--坐骑实例ID
	obj.n_InstID 			= 0;
	---坐骑转生阶数
	obj.n_Rank              = {};
	obj.n_RankExp           = 0;
	--坐骑配置表引用
	obj.r_Table 			= _G.CMountTable[obj.n_EnumID];
	--坐骑基本属性配置表引用
	obj.r_BaseProp 			= _G.CMountBasePropConfig;
	
	--坐骑经验
	obj.n_Exp 				= 0;
	--坐骑等级
	obj.n_Level 			= obj.r_Table.minLevel;
	--坐骑四项资质
	----攻击资质
	obj.n_GongJiAptitude 	= obj.r_BaseProp.BaseAptitude(obj.r_Table.grade);
	----防御资质
	obj.n_FangYuAptitude 	= obj.r_BaseProp.BaseAptitude(obj.r_Table.grade);
	----根骨资质
	obj.n_GenGuAptitude 	= obj.r_BaseProp.BaseAptitude(obj.r_Table.grade);
	----技巧资质
	obj.n_JiQiaoAptitude 	= obj.r_BaseProp.BaseAptitude(obj.r_Table.grade);
	--坐骑是否绑定
	obj.b_IsBind = false;
	--已经服用的资质果数量
	obj.n_ZZGCount 			= 0;
	
	--坐骑装备
	obj.t_Equip = {};
	for i=1, 4 do
		obj.t_Equip[i] = 0;
	end;
	--坐骑技能
	obj.t_Skill = {};

	for key, value in pairs(CMount) do
		if type(value) == "function" then
			obj[key] = value;
		end;
	end;
	return obj;
end;
--坐骑拷贝
function CMount:Copy()
	local obj = {};
	--坐骑配置ID
	obj.n_EnumID 			= self.n_EnumID;
	--坐骑实例ID
	obj.n_InstID 			= 0;
	
	--坐骑配置表引用
	obj.r_Table 			= self.r_Table;
	--坐骑基本属性配置表引用
	obj.r_BaseProp 			= self.r_BaseProp;

	--坐骑经验
	obj.n_Exp 				= self.n_Exp;
	--坐骑等级
	obj.n_Level 			= self.n_Level;

	--坐骑四项资质
	----攻击资质
	obj.n_GongJiAptitude	= self.n_GongJiAptitude;
	----防御资质
	obj.n_FangYuAptitude	= self.n_FangYuAptitude;
	----根骨资质
	obj.n_GenGuAptitude		= self.n_GenGuAptitude;
	----技巧资质
	obj.n_JiQiaoAptitude	= self.n_JiQiaoAptitude;
	--坐骑是否绑定
	obj.b_IsBind 			= self.b_IsBind;
	--已经服用的资质果数量
	obj.n_ZZGCount			= self.n_ZZGCount;
	obj.n_Rank              = self.n_Rank;
	obj.n_RankExp           = self.n_RankExp;
	--坐骑装备
	obj.t_Equip = {};
	for slot, itemInstID in ipairs(self.t_Equip) do
		obj.t_Equip[slot] = itemInstID;
	end;
	--坐骑技能
	obj.t_Skill = {};
	
	return obj;
end;
---------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------SET----------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
--设置坐骑对象实例ID
function CMount:SetInstID(instID)
	self.n_InstID = instID;
end;
--坐骑绑定
function CMount:Bind()
	self.b_IsBind = true;
end;
---获取坐骑转生阶数 table
function CMount:GetChangeRank()
	return self.n_Rank;
end;
---设置坐骑转生阶数 table
function CMount:SetChangeRank(preLevel)
	self.n_Rank[#self.n_Rank+1] = preLevel;
end
---获取坐骑转生经验
function CMount:GetChangeRankExp()
	return self.n_RankExp
end
----设置坐骑转生经验
function CMount:SetChangeRankExp(rankexp)
	self.n_RankExp = rankexp;
end
--坐骑加经验
function CMount:AddExp(addValue, playerLevel)
	local nRealAddValue = 0;
	local bLevelUP = false;
	if self.n_Level >= self:GetMaxLevel() or self.n_Level >= playerLevel then
		return nRealAddValue, bLevelUP;
	end;
	
	nRealAddValue = addValue;
	self.n_Exp = self.n_Exp + addValue;
	--判断升级条件
	while self.n_Exp >= self:GetUpLevelNeedExp() do
		self.n_Exp = self.n_Exp - self:GetUpLevelNeedExp();
		self.n_Level = self.n_Level + 1;
		bLevelUP = true;
		if self.n_Level >= self:GetMaxLevel() or self.n_Level >= playerLevel then --不能再加了
			nRealAddValue = nRealAddValue - self.n_Exp;
			self.n_Exp = 0;
			break;
		end;
	end;
	
	return nRealAddValue, bLevelUP;
end;
--坐骑升阶
function CMount:UpGrade()
	if self.r_Table.nextMountID > 0 then
		--坐骑配置ID
		self.n_EnumID 	= self.r_Table.nextMountID;
		--坐骑配置表引用
		self.r_Table 	= _G.CMountTable[self.n_EnumID];
		--坐骑等级
		if self:GetLevel() < self.r_Table.minLevel then
			self.n_Level = self.r_Table.minLevel;
		end;
	end;
end;
--设置坐骑配置ID
function CMount:SetEnumID(enumID)
	--坐骑配置ID
	self.n_EnumID = enumID;
	--坐骑配置表引用
	self.r_Table = _G.CMountTable[self.n_EnumID];
	--坐骑等级
	if self:GetLevel() < self.r_Table.minLevel then
		self.n_Level = self.r_Table.minLevel;
	end;
end;
--坐骑学习技能
function CMount:LearnSkill(id)
end;
--坐骑升级技能
function CMount:UpSkill(id)
end;
--设置坐骑等级
function CMount:SetLevel(n_Level)
	self.n_Level = n_Level;
	self.n_Exp = 0;
end;
-----转生后增加吃资质丹上限
function CMount:GetFianlyMaxZZGCount()
	if(#self.n_Rank > 0) then
		local maxnum = MountChangeRankConfig:GetMountChangeRankMedItemLimit(#self.n_Rank);
		if(not maxnum) then
			return _G.CMountBasePropConfig.MaxCanEatZZGCount(self.r_Table.grade);
		end
		maxnum = maxnum + _G.CMountBasePropConfig.MaxCanEatZZGCount(self.r_Table.grade);
		return maxnum;
	end
	return _G.CMountBasePropConfig.MaxCanEatZZGCount(self.r_Table.grade);
end
--坐骑服用资质果(每次服用一颗)
function CMount:EatZZG()
	if self.n_ZZGCount + 1 <= self:GetFianlyMaxZZGCount() then
		self.n_ZZGCount = self.n_ZZGCount + 1;
		return true;
	end
	return false;
end;
--增加四种属性
function CMount:AddGongJiAptitude(value)
	local n_MaxValue = self:GetMaxAptitude();
	local n_Value = self.n_GongJiAptitude + value;
	n_Value = n_Value > n_MaxValue and n_MaxValue or n_Value;
	self.n_GongJiAptitude = n_Value;
end;
function CMount:AddFangYuAptitude(value)
	local n_MaxValue = self:GetMaxAptitude();
	local n_Value = self.n_FangYuAptitude + value;
	n_Value = n_Value > n_MaxValue and n_MaxValue or n_Value;
	self.n_FangYuAptitude = n_Value;
end;
function CMount:AddGenGuAptitude(value)
	local n_MaxValue = self:GetMaxAptitude();
	local n_Value = self.n_GenGuAptitude + value;
	n_Value = n_Value > n_MaxValue and n_MaxValue or n_Value;
	self.n_GenGuAptitude = n_Value;
end;
function CMount:AddJiQiaoAptitude(value)
	local n_MaxValue = self:GetMaxAptitude();
	local n_Value = self.n_JiQiaoAptitude + value;
	n_Value = n_Value > n_MaxValue and n_MaxValue or n_Value;
	self.n_JiQiaoAptitude = n_Value;
end;
---------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------GET----------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
--获得坐骑对象配置ID
function CMount:GetEnumID(nShift, nProf)
	if nShift then
		local r_Table = self.r_Table;
		local n_EnumID = self.n_EnumID;
		for i=1, nShift do
			if r_Table.lastMountID then
				local lastMountID = r_Table.lastMountID;
				if type(lastMountID) == "table" then
					lastMountID = lastMountID[nProf];
				end;
				if lastMountID == 0 then
					break;
				end
				r_Table = _G.CMountTable[lastMountID];
				n_EnumID = lastMountID;
			end;
		end;
		return n_EnumID;
	else
		return self.n_EnumID;
	end;
end;
--获得坐骑对象实例ID
function CMount:GetInstID()
	return self.n_InstID;
end;
--获得坐骑名称
function CMount:GetName()
	return self.r_Table.name;
end;
--坐骑是否能够升阶
function CMount:IsCanUpGrade()
	if self.r_Table.nextMountID > 0 then
		return true;
	else
		return false;
	end;
end;
--坐骑能否提升资质
function CMount:IsCanUpAptitude(index)
	if index == 1 then
		return self:GetMaxAptitude() > self:GetGongJiAptitude();
	elseif index == 2 then
		return self:GetMaxAptitude() > self:GetFangYuAptitude();
	elseif index == 3 then
		return self:GetMaxAptitude() > self:GetGenGuAptitude();
	elseif index == 4 then
		return self:GetMaxAptitude() > self:GetJiQiaoAptitude();
	end;
end;
--获取坐骑对象等阶
function CMount:GetGrade()
	return self.r_Table.grade;
end;
--获取坐骑对象的品质
function CMount:GetQuality()
	return self.r_Table.quality;
end;
--得到职业限制
function CMount:GetNeedProp()
	return self.r_Table.needProf;
end;
--获得坐骑对象是否绑定
function CMount:IsBind()
	return self.b_IsBind;
end;
--获得坐骑已经服用的资质果数量
function CMount:GetZZGCount()
	return self.n_ZZGCount;
end;
--获得坐骑实例对象经验值
function CMount:GetExp()
	return self.n_Exp;
end;
--得到等级
function CMount:GetLevel()
	return self.n_Level;
end;
---获取最终等级
function CMount:GetFianlyLevel()
	if(#self.n_Rank > 0) then
		return self:GetMaxLevel()
	end
	return self.n_Level;
end;
--得到当前等阶最大可升到的等级
function CMount:GetMaxLevel()
	return self.r_Table.maxLevel;
end;
---得到当前等价最小等级
function CMount:GetMinLevel()
	return self.r_Table.minLevel;
end;
--获得坐骑对象升级所需经验
function CMount:GetUpLevelNeedExp()
	return _G.MountUpLevelNeedExp[self.n_Level];
end;
--获取坐骑对象模型ID
function CMount:GetModelID()
	return self.r_Table.modelID;
end;
--获得坐骑评分
function CMount:GetPoint()
	return _G.CMountSystemConfig.MountPoint(self);
end;
--得到移动速度加成数值
function CMount:GetAddSpeedValue()
	return self.r_BaseProp.AddSpeed(self);
end;
--获得对象对人生命加成
function CMount:GetAddShengMing()
	return self.r_BaseProp.AddShengMing(self);
end;
--获得对象对人内力加成
function CMount:GetAddNeiLi()
	return self.r_BaseProp.AddNeiLi(self);
end;
--获得对象对人攻击加成
function CMount:GetAddGongJi()
	return self.r_BaseProp.AddGongJi(self);
end;
--获得对象对人防御加成
function CMount:GetAddFangYu()
	return self.r_BaseProp.AddFangYu(self);
end;
--获得对象对人暴击加成
function CMount:GetAddBaoJi()
	return self.r_BaseProp.AddBaoJi(self);
end;
--获得对象对人身法加成
function CMount:GetAddShenFa()
	return self.r_BaseProp.AddShenFa(self);
end;
--获得最大资质上限
function CMount:GetMaxAptitude()
	return self.r_BaseProp.MaxAptitude(self);
end;
--获得攻击资质
function CMount:GetGongJiAptitude()
	return self.n_GongJiAptitude;
end;
--获得防御资质
function CMount:GetFangYuAptitude()
	return self.n_FangYuAptitude;
end;
--获得根骨资质
function CMount:GetGenGuAptitude()
	return self.n_GenGuAptitude;
end;
--获得技巧资质
function CMount:GetJiQiaoAptitude()
	return self.n_JiQiaoAptitude;
end;
--得到网络信息结构
function CMount:GetNetData()
	local netData = {};
	--坐骑配置ID
	netData[1] 	= self.n_EnumID;
	--坐骑实例ID
	netData[2] 	= self.n_InstID;
	--坐骑经验
	netData[3]	= self.n_Exp;
	--坐骑等级
	netData[4] 	= self.n_Level;
	--坐骑四项资质
	----攻击资质
	netData[5] 	= self.n_GongJiAptitude;
	----防御资质
	netData[6] 	= self.n_FangYuAptitude;
	----根骨资质
	netData[7] 	= self.n_GenGuAptitude;
	----技巧资质
	netData[8] 	= self.n_JiQiaoAptitude;
	--坐骑是否绑定
	netData[9] = self.b_IsBind;
	--坐骑装备
	netData[10]	= self.t_Equip;
	--坐骑技能
	netData[11]	= self.t_Skill;
	--坐骑资质果数量
	netData[13] = self.n_ZZGCount;
	netData[14] = self.n_Rank;
	netData[15] = self.n_RankExp;
	return netData;
end;
---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------数据库相关-------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
local function ParseStr(str, t)
	local lastIndex = 0;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local m = string.find(str1, ",", 1);
		if not m then
			_err("----------------");
		end;
		local str2 = string.sub(str1, 1, m - 1);
		local str3 = string.sub(str1, m + 1);
		local key = tonumber(str2);
		local value = tonumber(str3);
		if not key or not value then
			_err("!@#!$%%", str2, str3);
		end;
		if key < 9 then
			t[key] = value;
		end;
	end;
end;
--解析坐骑装备和技能
function CMount:Parse(db_Info)
	--坐骑实例ID
	self.n_InstID 	= db_Info.n_InstID;
	--坐骑经验
	self.n_Exp 		= db_Info.n_Exp or 0;
	--坐骑等级
	self.n_Level 	= db_Info.n_Level;
	---坐骑转生阶数
	self.n_Rank     = self:LoadStr(db_Info.n_Rank) or {};
	----坐骑转生所需经验
	self.n_RankExp  = db_Info.n_RankExp or 0;
	--坐骑四项资质
	----攻击资质
	self.n_GongJiAptitude 	= db_Info.n_GongJiAptitude or 0;
	----防御资质
	self.n_FangYuAptitude 	= db_Info.n_FangYuAptitude or 0;
	----根骨资质
	self.n_GenGuAptitude 	= db_Info.n_GenGuAptitude or 0;
	----技巧资质
	self.n_JiQiaoAptitude 	= db_Info.n_JiQiaoAptitude or 0;
	--坐骑是否绑定
	self.b_IsBind = db_Info.b_IsBind or false;
	--坐骑已经服用的资质果数量
	self.n_ZZGCount = db_Info.n_Quality or 0;
	--坐骑装备
	ParseStr(db_Info.s_Equip, self.t_Equip);
	--坐骑技能
	ParseStr(db_Info.s_Skill, self.t_Skill);
end;
--序列化坐骑装备和技能信息
function CMount:Serialize()
	local db_Info = {};
	--坐骑实例ID
	db_Info.n_InstID 	= self.n_InstID;
	--坐骑配置ID
	db_Info.n_EnumID	= self.n_EnumID;
	--坐骑经验
	db_Info.n_Exp		= self.n_Exp;
	--坐骑等级
	db_Info.n_Level 	= self.n_Level;
	--坐骑四项资质
	----攻击资质
	db_Info.n_GongJiAptitude 	= self.n_GongJiAptitude;
	----防御资质
	db_Info.n_FangYuAptitude 	= self.n_FangYuAptitude;
	----根骨资质
	db_Info.n_GenGuAptitude 	= self.n_GenGuAptitude;
	----技巧资质
	db_Info.n_JiQiaoAptitude 	= self.n_JiQiaoAptitude;
	--坐骑是否绑定
	db_Info.b_IsBind 			= self.b_IsBind;
	--坐骑已经服用的资质果数量
	db_Info.n_Quality 			= self.n_ZZGCount;
		---坐骑转生阶数
	db_Info.n_Rank      = self:UpdateStr(self.n_Rank);
	----坐骑转生所需经验
	db_Info.n_RankExp   = self.n_RankExp;
	--坐骑装备
	db_Info.s_Equip = "";
	for slot, equipInstID in pairs(self.t_Equip) do
		db_Info.s_Equip = db_Info.s_Equip .. slot .. "," .. equipInstID .. ";";
	end;
	--坐骑技能
	db_Info.s_Skill = "";
	for skillID, skillLevel in pairs(self.t_Skill) do
		db_Info.s_Skill = db_Info.s_Skill .. skillID .. "," .. skillLevel .. ";";
	end;
	
	--坐骑评分
	db_Info.n_Point		= self:GetPoint();
	
	return db_Info;
end;
----跨服战
function CMount:CrossSerialize()
	local db_Info = {};
	--坐骑实例ID
	db_Info.n_InstID 	= self.n_InstID;
	--坐骑配置ID
	db_Info.n_EnumID	= self.n_EnumID;
	--坐骑等级
	db_Info.n_Level 	= self.n_Level;
	---坐骑转生阶数
	db_Info.n_Rank      = self:UpdateStr(self.n_Rank);
	--坐骑装备
	db_Info.s_Equip = "";
	for slot, equipInstID in pairs(self.t_Equip) do
		db_Info.s_Equip = db_Info.s_Equip .. slot .. "," .. equipInstID .. ";";
	end;
	--坐骑技能
	db_Info.s_Skill = "";
	for skillID, skillLevel in pairs(self.t_Skill) do
		db_Info.s_Skill = db_Info.s_Skill .. skillID .. "," .. skillLevel .. ";";
	end;
	--坐骑评分
	db_Info.n_Point		= self:GetPoint();
	return db_Info;
end

---加载字符串 转换为 table
function CMount:LoadStr(str)
	if(str == nil) then
		return false;
	end
	local b = {};
	local lastIndex = 0;
	local index = 1;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local value = tonumber(str1);
		b[index] = value;
		index = index + 1;
	end;
	return b;
end

---更新字符串
function CMount:UpdateStr(str)
	local strResult = ""
	for i = 1,#str do
		 strResult =  strResult..str[i]..";"
	end
	return strResult
end

