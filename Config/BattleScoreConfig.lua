--战斗力计算的相关配置

_G.CBattleScoreInfo = {};
function CBattleScoreInfo:new()
	local obj = {};
	obj.dwLevelScore = 0;--角色分
	obj.dwPulseScore = 0;--经脉分
	obj.dwBournScore = 0;--境界分
	obj.dwSkillScore = 0;--技能分
	obj.dwMountScore = 0;--坐骑分
	obj.dwEquipScore = 0;--装备分
	obj.dwSwordScore = 0;--宝剑分
	obj.dwAmuletScore = 0;--宝甲分
	obj.dwGuildScore = 0;--世家分
	obj.dwStoneScore = 0;--宝石分
	obj.dwCollectScore = 0;--收集分
	
	obj.dwAllScore = 0;--总分
	
	return obj;
end;

function CBattleScoreInfo.GetAllScore(tbInfo,tbPropertyInfo,dwExAll)
	local dwRsl = 0;
	local midScore = {};
	----玩家中间属性值
	midScore.dwAttack = tbPropertyInfo.dwAttack - BaseBattleScore.dwAttack;
	midScore.dwDefense = tbPropertyInfo.dwDefense - BaseBattleScore.dwDefense;
	midScore.dwCrit = tbPropertyInfo.dwCrit - BaseBattleScore.dwCrit;
	midScore.dwFlee = tbPropertyInfo.dwFlee - BaseBattleScore.dwFlee;
	midScore.dwAttackSpeed = tbPropertyInfo.dwAttackSpeed - BaseBattleScore.dwAttackSpeed;
	midScore.dwMoveSpeed = tbPropertyInfo.dwMoveSpeed - BaseBattleScore.dwMoveSpeed;
	midScore.dwHPMax = tbPropertyInfo.dwHPMax - BaseBattleScore.dwHPMax;
	midScore.dwMPMax = tbPropertyInfo.dwMPMax - BaseBattleScore.dwMPMax;
	midScore.dwRemitAttack = tbPropertyInfo.dwRemitAttack - BaseBattleScore.dwRemitAttack;
	midScore.dwHitPercent = tbPropertyInfo.dwHitPercent - BaseBattleScore.dwHitPercent;
	midScore.dwIgnoreDefense = tbPropertyInfo.dwIgnoreDefense - BaseBattleScore.dwIgnoreDefense;
	midScore.dwAppendAttack = tbPropertyInfo.dwAppendAttack - BaseBattleScore.dwAppendAttack;
	midScore.dwBounceAttack = tbPropertyInfo.dwBounceAttack - BaseBattleScore.dwBounceAttack;
	midScore.dwAbsorbHP = tbPropertyInfo.dwAbsorbHP - BaseBattleScore.dwAbsorbHP;
	midScore.dwAbsorbMP = tbPropertyInfo.dwAbsorbMP - BaseBattleScore.dwAbsorbMP;
	midScore.dwDuck = tbPropertyInfo.dwDuck - BaseBattleScore.dwDuck;
	midScore.dwAppendCrit = tbPropertyInfo.dwAppendCrit - BaseBattleScore.dwAppendCrit;
	midScore.dwPoJiaValue = tbPropertyInfo.dwPoJiaValue - BaseBattleScore.dwPoJiaValue;
	midScore.dwPoJiaDiKang = tbPropertyInfo.dwPoJiaDiKang - BaseBattleScore.dwPoJiaDiKang;
	midScore.dwCritDown = tbPropertyInfo.dwCritDown - BaseBattleScore.dwCritDown;
	
	for a,b in pairs(midScore)do
		if EquipGradeConfig[a] then
			dwRsl = dwRsl + EquipGradeConfig[a] * b;
		end
	end
	
	dwRsl = dwExAll + dwRsl;
	
	tbInfo.dwAllScore = dwRsl;
	
	return dwRsl;
end;

--经脉分计算
function CBattleScoreInfo.GetPulseScore(tbInfo,dwValue)
	
	tbInfo.dwPulseScore = math.floor(dwValue);
end;

--境界分计算
function CBattleScoreInfo.GetBournScore(tbInfo,dwValue)
	
	tbInfo.dwBournScore = math.floor(dwValue);
end;

--技能分计算
--dwValue等于技能层数
function CBattleScoreInfo.GetSkillScore(tbInfo,dwValue,dwExVaslue)

	tbInfo.dwSkillScore = dwExVaslue;
end;

--坐骑分计算
function CBattleScoreInfo.GetMountScore(tbInfo,dwValue)
	
	tbInfo.dwMountScore = math.floor(dwValue);
end;

--装备分计算
function CBattleScoreInfo.GetEquipScore(tbInfo,dwValue)
	
	tbInfo.dwEquipScore = math.floor(dwValue);
end;

--宝剑分计算
function CBattleScoreInfo.GetSwordScore(tbInfo,dwValue)
	tbInfo.dwSwordScore = math.floor(dwValue);
end;

--宝甲分计算
function CBattleScoreInfo.GetAmuletScore(tbInfo,dwValue)
	tbInfo.dwAmuletScore = math.floor(dwValue);
end;

--世家分计算
function CBattleScoreInfo.GetGuildScore(tbInfo,dwValue)
	tbInfo.dwGuildScore = math.floor(dwValue);
end;

function CBattleScoreInfo.GetStoneScore(tbInfo,dwValue)
	tbInfo.dwStoneScore = math.floor(dwValue);
end;

function CBattleScoreInfo.GetCollectScore(tbInfo,dwValue)
	tbInfo.dwCollectScore = math.floor(dwValue);
end;

function CBattleScoreInfo.TableFormat(tbInfo)
	tbInfo.dwLevelScore = tbInfo.dwAllScore - tbInfo.dwPulseScore - tbInfo.dwCollectScore
		- tbInfo.dwBournScore - tbInfo.dwSkillScore - tbInfo.dwMountScore 
		- tbInfo.dwEquipScore - tbInfo.dwSwordScore - tbInfo.dwAmuletScore
		- tbInfo.dwGuildScore - tbInfo.dwStoneScore
end


--设置人物基础属性
_G.BaseBattleScore = 
{
    dwAttack = 40;
	dwDefense = 35;
	dwCrit = 30;
	dwFlee = 35;
	dwAttackSpeed = 300;
	dwMoveSpeed = 450;
	dwHPMax = 200;
	dwMPMax = 100;
	dwRemitAttack = 0;
	dwHitPercent = 0;
	dwIgnoreDefense = 0;
	dwAppendAttack = 0;
	dwBounceAttack = 0;
	dwAbsorbHP = 0;
	dwAbsorbMP = 0;
	dwDuck = 0;
	dwAppendCrit = 5000;
	dwPoJiaValue = 0;--破甲
	dwPoJiaDiKang = 0;--破甲抵抗
	dwCritDown = 0;
	-- dwHP = 0;--角色当前生命值
	-- dwMP = 0;--角色当前内力值
	-- dwMuscle = 0;--臂力
	-- dwPhysique = 0;--体魄
	-- dwOrgan = 0;--根骨
	-- dwTechnique = 0;--技巧
	-- dwAllSkillUpLv = 0; --武功层数
	-- dwDander = 0;--怒气值
	-- dwPoint = 0;--潜力点
	-- dwPKForbid = 0;--禁止PK标志：0-可以；1-等级不够；2-杀死保护
	-- dwCaromCount = 0;--连击次数
}  

--战斗力在界面显示的名字
_G.ScoreKeyShowString =
{
	dwLevelScore = "角色";     --等级换成角色
	dwPulseScore = "经脉";
	dwBournScore = "实战";
	dwSkillScore = "技能";
	dwMountScore = "坐骑";
	dwEquipScore = "装备";
	dwSwordScore = "名剑";
	dwAmuletScore = "宝甲";
	dwGuildScore = "世家";
	dwStoneScore = "宝石";
	dwCollectScore = "风物志";
}

_G.SwordLevelStringList =
{
	[1] = "<font color = '#dcd9d9'>普通</font>",
	[2] = "<font color = '#4fd388'>良好</font>",
	[3] = "<font color = '#4daeed'>优秀</font>",
	[4] = "<font color = '#e082da'>卓越</font>",
	[5] = "<font color = '#fed904'>完美</font>",
}


--修正值设定，//策划
function _G.G_GetPulseCorValue(dwValue)  --筋脉修正值
    local pulseCorValue = 0;
	-- if dwValue <= 2 then
	-- pulseCorValue = 50
	-- elseif dwValue <= 4 then
	-- pulseCorValue = 100
	-- elseif dwValue <= 6 then
	-- pulseCorValue = 150
	-- else 
	-- pulseCorValue = 200
	-- end
	return pulseCorValue;
end;
function _G.G_GetMountCorValue(dwValue)  --坐骑修正值
    local mountCorValue = 0;
	-- -- if dwValue <= 2 then
	-- -- mountCorValue = 50
	-- -- elseif dwValue <= 4 then
	-- -- mountCorValue = 100
	-- -- elseif dwValue <= 6 then
	-- -- mountCorValue = 150
	-- -- elseif dwValue <= 8 then
	-- -- mountCorValue = 200
	-- -- else
	-- -- mountCorvalue = 300
	-- end
	return mountCorValue;
end;
function _G.G_GetPetCorValue(dwValue)  --宠物修正值
    local PetCorValue = 0;
	-- -- if dwValue <= 2 then
	-- -- mountCorValue = 50
	-- -- elseif dwValue <= 4 then
	-- -- mountCorValue = 100
	-- -- elseif dwValue <= 6 then
	-- -- mountCorValue = 150
	-- -- elseif dwValue <= 8 then
	-- -- mountCorValue = 200
	-- -- else
	-- -- mountCorvalue = 300
	-- end
	return PetCorValue;
end;
function _G.G_GetSwordCorValue(dwValue)  --名剑修正值
    local swordCorValue = 0;
	-- if dwValue <= 2 then
	-- swordCorValue = 50
	-- elseif dwValue <= 4 then
	-- swordCorValue = 100
	-- elseif dwValue <= 6 then
	-- swordCorValue = 150
	-- elseif dwValue <= 8 then
	-- swordCorValue = 200
	-- else
	-- swordCorValue = 300
	-- end
	return swordCorValue;
end;
function _G.G_GetAmuletCorValue(dwValue)  --宝甲修正值
    local amuletCorValue = 0;
	-- if dwValue <= 2 then
	-- amuletCorValue = 50
	-- elseif dwValue <= 4 then
	-- amuletCorValue = 100
	-- elseif dwValue <= 6 then
	-- amuletCorValue = 150
	-- else 
	-- amuletCorValue = 200
	-- end
	return amuletCorValue;
end;
function _G.G_GetSkillCorVawlue(dwValue)
	local dwCorValue = math.floor(dwValue * (4+dwValue/500));
	return dwCorValue;
end;

--各个分量数值需要显示的等级
_G.ScoreLevelShowString =
{
    --角色
	dwLevelScore = function(val)
		if val < 2500 then
			return _G.SwordLevelStringList[1]
		elseif val < 6000 then
			return _G.SwordLevelStringList[2]
		elseif val < 12500 then
			return _G.SwordLevelStringList[3]
		elseif val < 28000 then
			return _G.SwordLevelStringList[4]
		else
			return _G.SwordLevelStringList[5]
		end
	end;
	--经脉
	dwPulseScore = function(val)
		if val<= 1000 then
			return _G.SwordLevelStringList[1]
		elseif val<= 2500 then
			return _G.SwordLevelStringList[2]
		elseif val<= 5000 then
			return _G.SwordLevelStringList[3]
		elseif val<= 8000 then
			return _G.SwordLevelStringList[4]
		else
			return _G.SwordLevelStringList[5]
		end
	end;
	--境界
	dwBournScore = function(val)
		if val<= 2500 then
			return _G.SwordLevelStringList[1]
		elseif val<= 6000 then
			return _G.SwordLevelStringList[2]
		elseif val<= 10000 then
			return _G.SwordLevelStringList[3]
		elseif val<= 15000 then
			return _G.SwordLevelStringList[4]
		else
			return _G.SwordLevelStringList[5]
		end
	end;
	--技能
	dwSkillScore = function(val)
		if val<= 800 then
			return _G.SwordLevelStringList[1]
		elseif val<= 2000 then
			return _G.SwordLevelStringList[2]
		elseif val<= 4500 then
			return _G.SwordLevelStringList[3]
		elseif val<= 10000 then
			return _G.SwordLevelStringList[4]
		else
			return _G.SwordLevelStringList[5]
		end
	end;
	--坐骑
	dwMountScore = function(val)
		if val<= 2500 then
			return _G.SwordLevelStringList[1]
		elseif val<= 6000 then
			return _G.SwordLevelStringList[2]
		elseif val<= 10000 then
			return _G.SwordLevelStringList[3]
		elseif val<= 15000 then
			return _G.SwordLevelStringList[4]
		else
			return _G.SwordLevelStringList[5]
		end
	end;
	
	--装备
	dwEquipScore = function(val)
		if val<= 2500 then
			return _G.SwordLevelStringList[1]
		elseif val<= 6000 then
			return _G.SwordLevelStringList[2]
		elseif val<= 10000 then
			return _G.SwordLevelStringList[3]
		elseif val<= 15000 then
			return _G.SwordLevelStringList[4]
		else
			return _G.SwordLevelStringList[5]
		end
	end;
	
	--名剑
	dwSwordScore = function(val)
		if val<= 2500 then
			return _G.SwordLevelStringList[1]
		elseif val<= 6000 then
			return _G.SwordLevelStringList[2]
		elseif val<= 10000 then
			return _G.SwordLevelStringList[3]
		elseif val<= 15000 then
			return _G.SwordLevelStringList[4]
		else
			return _G.SwordLevelStringList[5]
		end
	end;
	
	--宝甲
	dwAmuletScore = function(val)
		if val<= 2500 then
			return _G.SwordLevelStringList[1]
		elseif val<= 6000 then
			return _G.SwordLevelStringList[2]
		elseif val<= 10000 then
			return _G.SwordLevelStringList[3]
		elseif val<= 15000 then
			return _G.SwordLevelStringList[4]
		else
			return _G.SwordLevelStringList[5]
		end
	end;
	--世家
	dwGuildScore = function(val)
		if val<= 2500 then
			return _G.SwordLevelStringList[1]
		elseif val<= 6000 then
			return _G.SwordLevelStringList[2]
		elseif val<= 10000 then
			return _G.SwordLevelStringList[3]
		elseif val<= 15000 then
			return _G.SwordLevelStringList[4]
		else
			return _G.SwordLevelStringList[5]
		end
	end;
	
	--宝石
	dwStoneScore = function(val)
		if val<= 2500 then
			return _G.SwordLevelStringList[1]
		elseif val<= 6000 then
			return _G.SwordLevelStringList[2]
		elseif val<= 10000 then
			return _G.SwordLevelStringList[3]
		elseif val<= 15000 then
			return _G.SwordLevelStringList[4]
		else
			return _G.SwordLevelStringList[5]
		end
	end;
	--风物志
	dwCollectScore = function(val)
		if val<= 2500 then
			return _G.SwordLevelStringList[1]
		elseif val<= 6000 then
			return _G.SwordLevelStringList[2]
		elseif val<= 10000 then
			return _G.SwordLevelStringList[3]
		elseif val<= 15000 then
			return _G.SwordLevelStringList[4]
		else
			return _G.SwordLevelStringList[5]
		end
	end;
	dwAllScore = function() end;
}

local arrScoreInfoName2Index = 
{
	dwLevelScore = 1;
	dwPulseScore = 2;
	dwBournScore = 3;
	dwSkillScore = 4;
	dwMountScore = 5;
	dwEquipScore = 6;
	dwSwordScore = 7;
	dwAmuletScore = 8;
	dwGuildScore = 9;
	dwStoneScore = 10;
	dwCollectScore = 11;
}

local arrScoreInfoIndex2Name = {}
local function MakeScireIndexTable()
	for n,v in pairs(arrScoreInfoName2Index)do
		arrScoreInfoIndex2Name[v] = n;
	end
end;
MakeScireIndexTable();

function _G.BattleScoreName2Index(szName)
	return arrScoreInfoName2Index[szName];
end;

function _G.BattleScoreIndex2Name(dwIndex)
	return arrScoreInfoIndex2Name[dwIndex];
end;

--计算战斗力总和
function _G.G_GetScoreInfoAll(tbInfo)
	if tbInfo.dwAllScore then
		return math.floor(tbInfo.dwAllScore);
	else
		local dwRsl = 0;
		for n,v in pairs(tbInfo)do
			dwRsl = dwRsl + v;
		end
		return math.floor(dwRsl);
	end
end;

--计算战斗力星的数量
function _G.G_CountBattleStar(tbInfo)
	local dwAll = G_GetScoreInfoAll(tbInfo);
		if dwAll<= 1000 then
			if dwAll<= 200 then
				return 1;
			elseif dwAll<= 400 then
				return 2;
			elseif dwAll<= 600 then
				return 3;
			elseif dwAll<= 800 then
				return 4;
			else
				return 5;
			end
		elseif dwAll<= 10000 then
			if dwAll<= 2000 then
				return 6;
			elseif dwAll<= 4000 then
				return 7;
			elseif dwAll<= 6000 then
				return 8;
			elseif dwAll<= 8000 then
				return 9;
			else
				return 10;
			end
		elseif dwAll<= 100000 then
			if dwAll<= 20000 then
				return 11;
			elseif dwAll<= 40000 then
				return 12;
			elseif dwAll<= 60000 then
				return 13;
			elseif dwAll<= 80000 then
				return 14;
			else
				return 15;
			end
		else 
			if dwAll<= 200000 then
				return 16;
			elseif dwAll<= 400000 then
				return 17;
			elseif dwAll<= 600000 then
				return 18;
			elseif dwAll<= 800000 then
				return 19;
			else
				return 20;
			end
		end
	
	return 3;
end;

--战斗力的描述
function _G.G_BattleScoreDes(tbInfo)
	local dwAll = G_CountBattleStar(tbInfo);
	
	return dwAll;
end;

_G.BattleUIConfig = 
{
	[enProfType.eProfType_Sword] = "zhandouli_nanjian.png";
	[enProfType.eProfType_Knife] = "zhandouli_dahan.png";
	[enProfType.eProfType_Spear] = "zhandouli_nvqiang.png";
	[enProfType.eProfType_Sickle] = "zhandouli_luoli.png";
}
