--暗器系统，读表相关API

_G.HiddenWeaponScript = {};

--[[
	[\brief 获得暗器加经验物品ID表
	[获得暗器加经验物品ID表
	[\return table AddExp 加经验物品表
	]]
function HiddenWeaponScript.GetAddExpItem()

	return HiddenWeaponConfig.AddExp;
end

--[[
	[\brief 获得暗器扔标需要的物品id
	[获得暗器扔标需要的物品id
	[\return table useItem 暗器消耗品ID表
	]]
function HiddenWeaponScript.GetUseItem()

	return HiddenWeaponConfig.useItem;
end

--[[
	[\brief 获得使用1个物品获得的修炼值
	[获得使用1个物品获得的修炼值
	[\param number nItemId 物品ID
	[\return number AddExp[nItemId] 物品经验值
	]]
function HiddenWeaponScript.GetUseItemExp(nItemId)
	return HiddenWeaponConfig.AddExp[nItemId];
end

--[[
	[\brief 获得使用1次技能获得的修炼值
	[获得使用1次技能获得的修炼值
	[\return number useSkillExp 使用技能加的经验
	]]
function HiddenWeaponScript.GetUseSkillExp()

	return HiddenWeaponConfig.useSkillExp;
end

--[[
	[\brief 获得总阶数
	[获得总阶数
	[\return number len 总阶数
	]]
function HiddenWeaponScript.GetMaxClassNum()
	local classInfo = HiddenWeaponConfig.classInfo;
	if not classInfo then
		_err("classInfo == not by HiddenWeaponScript.GetClassInfoByIndex");
		return;
	end

	local len = #classInfo;
	return len;
end

--[[
	[\brief 通过索引获得对应classinfo
	[通过阶数索引获得相应结构
	[\param number index 阶数索引
	[\return table classInfo[index] 当前阶数相应结构
	]]
function HiddenWeaponScript.GetClassInfoByIndex(index)
	local len = HiddenWeaponScript.GetMaxClassNum();

	if index <= 0 or index >len then
		_err("index <= 0 or index >len by HiddenWeaponScript.GetClassInfoByIndex");
		return;
	end

	if not HiddenWeaponConfig.classInfo[index] then
		_err("classInfo[index] == nil by HiddenWeaponScript.GetClassInfoByIndex");
		return;
	end

	return HiddenWeaponConfig.classInfo[index];
end

--
--[[
	[\brief 总等级数量
	[总等级数量
	[\return number 配表中等级最大长度
	]]
function HiddenWeaponScript.GetMaxLevelNum()
	if #HiddenWeaponConfig.levelInfo < 0 then
		_err("len <= 0  by HiddenWeaponScript.GetMaxLevelNum");
		return;
	end

	return #HiddenWeaponConfig.levelInfo;
end

--[[
	[\brief 通过levelIndex获得对应等级的levelInfo
	[通过levelIndex获得对应等级的levelInfo
	[\param number levelIndex 等级索引
	[\return table tab[levelIndex] 当前等级相应结构
	]]
function HiddenWeaponScript.GetLevelInfoBylevel(levelIndex)
	local tab = HiddenWeaponConfig.levelInfo;

	if not tab then
		_err("tab == nil by HiddenWeaponScript.GetLevelInfoBylevel");
		return;
	end

	local len = HiddenWeaponScript.GetMaxLevelNum();

	if len <= 0 then
		_err("len <= 0 by HiddenWeaponScript.GetLevelInfoBylevel");
		return;
	end

	if levelIndex < 0 or levelIndex > len then
		_err("levelIndex < 0 or levelIndex > len by HiddenWeaponScript.GetLevelInfoBylevel");
		return;
	end

	return tab[levelIndex];
end

--[[
	[\brief 通过exp获得当前等级info
	[通过exp获得当前等级info
	[\param number exp 当前经验值
	[\return table 当前等级相应结构
	]]
function HiddenWeaponScript.GetLevelInfoByExp(exp)
	local num = HiddenWeaponScript.GetMaxLevelNum();

	for i=1,num do
		local tab = HiddenWeaponScript.GetLevelInfoBylevel(i);
		if tab.exerciseValue < 0 then
			_err("tab.exerciseValue <= 0 by HiddenWeaponScript.GetLevelInfoByExp");
			return;
		end

		if exp <= tab.exerciseValue then
			return HiddenWeaponScript.GetLevelInfoBylevel(i);
		end
	end

	_err("err exp by HiddenWeaponScript.GetLevelInfoByExp");
end

--[[
	[\brief 通过exp获得当前等级index
	[通过exp获得当前等级index
	[\param number exp 当前经验值
	[\return number i 当前等级相应索引
	]]
function HiddenWeaponScript.GetLevelIndexByExp(exp)
	local num = HiddenWeaponScript.GetMaxLevelNum();

	for i=1,num do
		local tab = HiddenWeaponScript.GetLevelInfoBylevel(i);
		if tab.exerciseValue < 0 then
			_err("tab.exerciseValue <= 0 by HiddenWeaponScript.GetLevelIndexByExp");
			return;
		end

		if exp <= tab.exerciseValue then
			return i;
		end
	end

	--最高顶级
	return self:GetMaxLevelNum();
end

--[[
	[\brief 通过exp获得当前哪一阶的Index
	[通过exp获得当前哪一阶的Index
	[\param number exp 当前经验值
	[\return number i 当前阶级相应索引
	]]
function HiddenWeaponScript.GetClassIndexByExp(exp)
	local num = HiddenWeaponScript.GetMaxClassNum();

	local classNum = 0;
	local levelIndex = HiddenWeaponScript.GetLevelIndexByExp(exp);
	for i=1,num do
		local tab = HiddenWeaponScript.GetClassInfoByIndex(i);
		classNum = classNum + tab.levelNum;
		if classNum >= levelIndex then
			return i;
		end
	end

	_err("err exp by HiddenWeaponScript.GetClassIndexByExp");
end

--[[
	[\brief 通过exp获得当前哪一阶的Index
	[通过exp获得当前哪一阶的Index
	[\param number exp 当前经验值
	[\return number i 当前阶级相应索引
	]]
function HiddenWeaponScript.GetClassIndexByLevel(level)
	local num = HiddenWeaponScript.GetMaxClassNum();

	local classNum = 0;
	for i=1,num do
		local tab = HiddenWeaponScript.GetClassInfoByIndex(i);
		classNum = classNum + tab.levelNum;
		if classNum >= level then
			return i;
		end
	end

	_err("err exp by HiddenWeaponScript.GetClassIndexByExp");
end

--[[
	[\brief 通过exp获得当前哪一阶info
	[通过exp获得当前哪一阶info
	[\param number exp 当前经验值
	[\return table 当前经验对应的阶级info
	]]
function HiddenWeaponScript.GetClassInfoByExp(exp)
	local num = HiddenWeaponScript.GetMaxClassNum();

	local classTab = HiddenWeaponConfig.classInfo;
	local classNum = 0;
	local levelIndex = HiddenWeaponScript.GetLevelIndexByExp(exp);
	for i=1,num do
		local tab = HiddenWeaponScript.GetClassInfoByIndex(i);
		classNum = classNum + tab.levelNum;
		if classNum >= levelIndex then
			return HiddenWeaponScript.GetClassInfoByIndex(i);
		end
	end

	_err("err exp by HiddenWeaponScript.GetClassInfoByExp");
end

--[[
	[\brief 通过exp获得阶数对应的升阶物品
	[通过exp获得阶数对应的升阶物品
	[\param number exp 当前经验值
	[\return table needItems 升阶物品
	]]
function HiddenWeaponScript.GetItemsByExp(exp)
	local tab = HiddenWeaponScript.GetClassInfoByExp(exp);

	return tab.needItems;
end

--[[
	[\brief 通过exp获得对应阶数对应的消耗的金钱
	[通过exp获得对应阶数对应的消耗的金钱
	[\param number exp 当前经验值
	[\return table needMoney 消耗的金钱
	]]
function HiddenWeaponScript.GetMoneyByExp(exp)
	local tab = HiddenWeaponScript.GetClassInfoByExp(exp);

	if tab.nMoney <= 0 then
		_err("tab.nMoney <= 0 by HiddenWeaponScript.GetMoneyByExp");
		return;
	end

	return tab.nMoney;
end

--[[
	[\brief 获得公告阶级
	[获得公告阶级
	[\return number messageClass 获得公告阶数
	]]
function HiddenWeaponScript.GetMessageClass()
	if HiddenWeaponConfig.messageClass <= 0 then
		_err("messageClass <= 0  by HiddenWeaponScript.GetMessageClass");
		return;
	end

	return HiddenWeaponConfig.messageClass;
end

--[[
	[\brief 获得加成属性索引
	[获得加成属性索引
	[\return table Shunxu 属性索引
	]]
function HiddenWeaponScript.GetProName()

	return HiddenWeaponConfig.Shunxu;
end

--[[
	[\brief 通过当前经验获得当前阶数的总经验
	[通过当前经验获得当前阶数的总经验
	[\param number exp 当前经验值
	[\return number curClassMaxExp 当前阶的总经验
	]]
function HiddenWeaponScript.GetCurClassMaxExpByLevel(level)
	local classIndex = HiddenWeaponScript.GetClassIndexByLevel(level);
	local curClassLevelNum = 0;	--当前阶数对应的等级数量
	for i=1,classIndex do
		local classInfo = HiddenWeaponScript.GetClassInfoByIndex(i);
		curClassLevelNum = curClassLevelNum + classInfo.levelNum;
	end

	if curClassLevelNum == HiddenWeaponScript.GetMaxLevelNum() then
		curClassLevelNum = curClassLevelNum - 1;
	end

	--当前阶数的总经验
	local curClassMaxExp = HiddenWeaponScript.GetLevelInfoBylevel(curClassLevelNum).exerciseValue;

	if curClassMaxExp == 0 then
		_err("curClassMaxExp == 0 by HiddenWeaponScript.GetCurClassMaxExpByClassIndex");
		return;
	end

	return curClassMaxExp;
end

--[[
	[\brief 通过阶数索引获得对应技能使用概率
	[通过阶数索引获得对应技能使用概率
	[\param number nClassIndex 当前阶数索引
	[\return number 基础技能概率
	]]
function HiddenWeaponScript.GetSkillRate(nClassIndex)
	local tSkill = HiddenWeaponConfig.skillRateData;
	if not tSkill[nClassIndex] then
		_err("tSkill[nClassIndex] == nil by HiddenWeaponScript.GetSkillRate");
	end

	return tSkill[nClassIndex] * 10000;
end

--[[
	[\brief 通过阶数索引获得对应BUFF使用概率
	[通过阶数索引获得对应BUFF使用概率
	[\param number nBuffId 状态ID
	[\param number nLevel 当前等级
	[\return number BUFF的概率
	]]
function HiddenWeaponScript.GetBuffRate(nBuffId, nLevel)
	local tBuff = HiddenWeaponConfig.buffRateData;
	if not tBuff[nBuffId] then
		_err("tBuff[nBuffId] == nil by HiddenWeaponScript.GetBuffRate");
	end

	if not tBuff[nBuffId][nLevel] then
		_err("tBuff[nBuffId][nLevel] == nil by HiddenWeaponScript.GetBuffRate");
	end

	return tBuff[nBuffId][nLevel] * 10000;
end

--[[
	[\brief 通过阶数索引获得对应技能tab
	[通过阶数索引获得对应技能tab
	[\param number nClassIndex 当前阶数索引
	[\return table skillTbl[nClassIndex] 获得对应技能Tab
	]]
function HiddenWeaponScript.GetBuffTabByClassIndex(nClassIndex)
	if not HiddenWeaponConfig.skillTbl[nClassIndex] then
		_err("skillTbl[nClassIndex] == nil by HiddenWeaponScript.GetBuffTabByClassIndex");
		return;
	end

	return HiddenWeaponConfig.skillTbl[nClassIndex];
end

--[[
	[\brief 获得基础技能ID
	[获得基础技能ID
	[\return number baseSkill 基础技能ID
	]]
function HiddenWeaponScript.GetBaseSkillId()
	if HiddenWeaponConfig.baseSkill <= 0 then
		_err("baseSkill <= 0 by HiddenWeaponScript.GetBaseSkillId");
	end
	return HiddenWeaponConfig.baseSkill;
end

--//添加buff函数
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

--//检测暗器buff施放几率
local function Buff_HiddenWeapon(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime,objHiddenWeaponSys)
	local dwDefType = objDefender:GetObjType();
	if dwDefType == enEntType.eEntType_Pet then
		--宠物没有BUFF
		return;
	end
	
	--获得暗器等级
	local Level = HiddenWeaponScript.GetLevelIndexByExp(objHiddenWeaponSys.oHiddenWeapon.nExp);
	
	local ResHit = 0;
	local ResLostHP = 0;
	local ResMove = 0;
	local ResForbid = 0;
	
	if dwDefType == enEntType.eEntType_Player then
		local objShield = objDefender:GetSystem("CShieldSystem");
		--获得法宝经验
		local ShieldExp = objShield:GetExp();
		--获得法宝等级
		local ShieldLv = _G.CShieldConfig:GetAllLevelInfo(ShieldExp)
		--法宝抵抗公式
		ResHit = _G.CShieldConfig.BuffRateData[110002][ShieldLv]
		ResLostHP = _G.CShieldConfig.BuffRateData[110003][ShieldLv]
		ResMove = _G.CShieldConfig.BuffRateData[110004][ShieldLv]
		ResForbid = _G.CShieldConfig.BuffRateData[110005][ShieldLv]
	end

	--减命中公式
	local HitPercent = HiddenWeaponConfig.buffRateData[110001][Level] * 10000
	--持续掉血
	local LostHP = HiddenWeaponConfig.buffRateData[110002][Level] * 10000
	--减移动速度
	local Move = HiddenWeaponConfig.buffRateData[110003][Level] * 10000
	--沉默
	local Forbid = HiddenWeaponConfig.buffRateData[110004][Level] * 10000
	
	--减速
	if (Level > 10) then
		local dwRand = math.random(10000);
		local probability = HitPercent - ResHit;
		if (dwRand <= probability) then
			AddRoleObjBuff(objDefender,100002,Level,objAttacker);
		end
	end
	
	--沉默
	if (Level > 15) then
		local dwRand = math.random(10000);
		local probability = LostHP - ResLostHP;
		if (dwRand <= probability) then
			AddRoleObjBuff(objDefender,100003,Level,objAttacker);
		end
	end
	
	--减命中
	if (Level > 20) then
		local dwRand = math.random(10000);
		local probability = Move - ResMove;
		if (dwRand <= probability) then
			AddRoleObjBuff(objDefender,100000,Level,objAttacker);
		end
	end
	
	--持续掉血
	if (Level > 25) then
		local dwRand = math.random(10000);
		local probability = Forbid - ResForbid;
		if (dwRand <= probability) then
			AddRoleObjBuff(objDefender,100001,Level,objAttacker);
		end
	end
end


--//暗器基础伤害技能
local Skill = SkillConfig[100000];

--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventHiddenWeaponExecute(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime)
	--效果的飞行时间
	local dwFlyTime = 0;
	--被击中的特效
	local dwBeAttPfx = 110013;	
		--计算伤害
		--伤害值
		local dwAttValue = 0;
		local dwDefType = objDefender:GetObjType();
		local objAttSklSys = objAttacker:GetSystem("CSkillSystem");
		if objAttSklSys then
			dwAttValue = objAttSklSys:GetInfo().dwAttack;
		end
		local objHiddenWeaponSys = objAttacker:GetSystem("CHiddenWeaponSystem");
		if objHiddenWeaponSys then
			local level = HiddenWeaponScript.GetLevelIndexByExp(objHiddenWeaponSys.oHiddenWeapon.nExp);
			dwAttValue = HiddenWeaponConfig.AttackValue(dwAttValue,level);
			local Base = 2;
			--暗器10阶伤害4倍
			if (level > 35) then
				Base = 4;
			end

			if (level > 30) then
				local dwRand = math.random(10000);
				local AtkRate = HiddenWeaponConfig.buffRateData[110005][level] * 10000;
				if (dwRand <= AtkRate) then
					dwAttValue = dwAttValue*Base
				end
			end
		end
		if dwDefType == enEntType.eEntType_Player then
			local objDefBattle = objDefender:GetSystem("CBattleSystem");
			if not objDefBattle then
				_info("get objDefBattle fail in CRoleSkill:ExecuHarmCount");
				return;
			end
			
			local objShield = objDefender:GetSystem("CShieldSystem");
			--获得法宝经验
			local ShieldExp = objShield:GetExp();
			--获得法宝等级
			local ShieldLv = _G.CShieldConfig:GetAllLevelInfo(ShieldExp);
			--抵抗伤害数值
			local ResHitValue = _G.CShieldConfig.HarmFree[ShieldLv];
			local ResHitPer = _G.CShieldConfig.BuffRateData[110001][ShieldLv] * 10000;
			local dwRand = math.random(10000)
			
			if dwRand <= ResHitPer then
				dwAttValue = dwAttValue * (1 - ResHitValue);
			end
			
			objDefBattle:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwSkillLevel,dwExecTime,0-dwActCount,false);
		elseif dwDefType == enEntType.eEntType_Monster then
			objDefender:Hurt(dwAttValue,false,objAttacker,dwAttSkill,dwExecTime,0-dwActCount,false);
		end
		Buff_HiddenWeapon(objAttacker,objDefender,dwAttSkill,dwSkillLevel,dwActCount,dwExecTime,objHiddenWeaponSys)
	--被击中者播放特效
	if dwDefType == enEntType.eEntType_Player then
		local objDefSklSys = objDefender:GetSystem("CSkillSystem");
		if objDefSklSys then
			objDefSklSys:BroadcastSkillMsg(true,"OnPlayPfxMsg",
			{
				ActionID = dwBeAttPfx,
				BindPos = "feetpoint",
				RoleID = objDefender:GetRoleID(),
				SkillID = dwAttSkill,
				ExecTime = dwExecTime,
				ActCount = dwActCount,
			})
		end
	elseif dwDefType == enEntType.eEntType_Monster then
		objDefender:Play("",enEntType.eEntType_Player,objAttacker:GetRoleID(),dwBeAttPfx,nil,nil,nil,dwAttSkill,dwExecTime,dwActCount);
	end

end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	-- local sInfo = 
	-- {
		-- sCurLevelExp ={},
		-- sNextLevelExp = {};
	-- }
	
	-- sInfo.sCurLevelExp[1] = SkillStringConfig[7000020];
	-- sInfo.sNextLevelExp[1] = SkillStringConfig[7000030];
	
	-- return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;

	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end


--法宝
local Skill = SkillConfig[120000];
--参数
--objAttacker：攻击者，全部是玩家
--objDefender：被击者，可能是玩家，也可能是怪物
function Skill:EventShieldHurtEnd(objSelf,objEnemy,dwSkillID,dwSkillLevel,dwHurtValue,isCrit)
	local dwType = objEnemy:GetObjType();
	local objShield = objSelf:GetSystem("CShieldSystem");
	if objShield then
		--获得法宝经验
		local ShieldExp = objShield:GetExp();
		--获得法宝等级
		local ShieldLv = _G.CShieldConfig:GetAllLevelInfo(ShieldExp);
	end
	
	local Level = (ShieldLv*1.5)/10
end;

--技能界面说明
function Skill:GetSkillExplain(dwRoleID,dwLevel)
	local sInfo = 
	{
		sCurLevelExp ={},
		sNextLevelExp = {};
	}
	
	sInfo.sCurLevelExp[1] = SkillStringConfig[8000020];
	sInfo.sNextLevelExp[1] = SkillStringConfig[8000030];
	
	return sInfo;
end;

--获取施放消耗（表）
function Skill:GetConsumptionTable(dwLevel,tbRoleInfo)
	local Consumption = {
			hp = 0,
			mp = 0,
			item = {},
			wxd = 0,	--五行仅能点
		}
	return Consumption
end

--获取冷却时间（毫秒）
function Skill:GetCoolDelay(dwAttackSpeed,dwLevel)
	local dwResult = 0;

	return dwResult;
end

--获取升级所需熟练度
function Skill:GetSkilledUp(dwRoleID,dwCurLevel)
	return 100
end

function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end
