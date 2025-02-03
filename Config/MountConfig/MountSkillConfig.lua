--[[
s_Name:名称:技能名字
s_Explain:技能逻辑说明:技能效果说明：
s_Icon:已学习图标:技能面板中已学会该技能时的图标
s_GrayIcon:未学习图标:技能面板中未学会该技能时的图标
]]
_G.MountSkill = {
--坐骑技能1
[1]={s_Name="其疾如风",s_Icon='Icon_sk_zq_1001_1.png',s_GrayIcon='Icon_sk_zq_1001_0.png'},
--坐骑技能2
[2]={s_Name="其徐如林",s_Icon='Icon_sk_zq_1002_1.png',s_GrayIcon='Icon_sk_zq_1002_0.png'},
--坐骑技能3
[3]={s_Name="侵掠如火",s_Icon='Icon_sk_zq_1003_1.png',s_GrayIcon='Icon_sk_zq_1003_0.png'},
--坐骑技能4
[4]={s_Name="不动如山",s_Icon='Icon_sk_zq_1004_1.png',s_GrayIcon='Icon_sk_zq_1004_0.png'},
--坐骑技能5
[5]={s_Name="金戈铁马",s_Icon='Icon_sk_zq_1005_1.png',s_GrayIcon='Icon_sk_zq_1005_0.png'},
--坐骑技能6
[6]={s_Name="血流成河",s_Icon='Icon_sk_zq_1006_1.png',s_GrayIcon='Icon_sk_zq_1006_0.png'},
--坐骑技能7
[7]={s_Name="马踏飞燕",s_Icon='Icon_sk_zq_1007_1.png',s_GrayIcon='Icon_sk_zq_1007_0.png'},
--坐骑技能8
[8]={s_Name="气吞万里",s_Icon='Icon_sk_zq_1008_1.png',s_GrayIcon='Icon_sk_zq_1008_0.png'},
};

--[[
	t	数据结构，为坐骑主面板
	n_AddSpeedValue
	n_AddShengMing
	n_AddNeiLi
	n_AddGongJi
	n_AddFangYu
	n_AddBaoJi
	n_AddShenFa
]]

local skill = _G.MountSkill[1];
function skill:GetAction(level)
	-- local n_AddValue = math.floor(5+(level-1)*(3+(level-2)*(0.1+level/1000)));
	-- return n_AddValue;
	return 0;
end;
--技能描述
function skill:GetExplain(level)
	if level == 0 then return 1 end;
	if level > 100 then return 2 end;
	local n_AddValue = self:GetAction(level);
	local str = string.format("加持主人身法%d点", n_AddValue);
	return str;
end;
--技能效果
function skill:Action_C(level, t)
	local n_AddValue = self:GetAction(level);
	t.n_AddShenFa = t.n_AddShenFa + n_AddValue;
end;

local skill = _G.MountSkill[2];
function skill:GetAction(level)
	-- local n_AddValue = math.floor(15+(level-1)*(10+(level-2)*(0.2+level/200+level/200)));
	-- return n_AddValue;
	return 0;
end;
--技能描述
function skill:GetExplain(level)
	if level == 0 then return 1 end;
	if level > 100 then return 2 end;
	local n_AddValue = self:GetAction(level);
	local str = string.format("加持主人生命上限%d点", n_AddValue);
	return str;
end;
--技能效果
function skill:Action_C(level, t)
	local n_AddValue = self:GetAction(level);
	t.n_AddShengMing = t.n_AddShengMing	+ n_AddValue;
end;

local skill = _G.MountSkill[3];
function skill:GetAction(level)
	-- local n_AddValue = math.floor(9+(level-1)*(2.5+(level-2)*(0.1+level/500)));
	-- return n_AddValue;
	return 0;
end;
--技能描述
function skill:GetExplain(level)
	if level == 0 then return 1 end;
	if level > 100 then return 2 end;
	local n_AddValue = self:GetAction(level);
	local str = string.format("加持主人攻击力%d点", n_AddValue);
	return str;
end;
--技能效果
function skill:Action_C(level, t)
	local n_AddValue = self:GetAction(level);
	t.n_AddGongJi = t.n_AddGongJi + n_AddValue;
end;

local skill = _G.MountSkill[4];
function skill:GetAction(level)
	-- local n_AddValue = math.floor(7+(level-1)*(1.5+(level-2)*(0.05+level/1000)));
	-- return n_AddValue;
	return 0;
end;
--技能描述
function skill:GetExplain(level)
	if level == 0 then return 1 end;
	if level > 100 then return 2 end;
	local n_AddValue = self:GetAction(level);
	local str = string.format("加持主人防御力%d点", n_AddValue);
	return str;
end;
--技能效果
function skill:Action_C(level, t)
	local n_AddValue = self:GetAction(level);
	t.n_AddFangYu = t.n_AddFangYu + n_AddValue;
end;

local skill = _G.MountSkill[5];
function skill:GetAction(level)
	-- local n_AddValue = math.floor(4+(level-1)*(1+(level-2)*(0.01+level/1000)));
	-- return n_AddValue;
	return 0;
end;
--技能描述
function skill:GetExplain(level)
	if level == 0 then return 1 end;
	if level > 100 then return 2 end;
	local n_AddValue = self:GetAction(level);
	local str = string.format("加持主人内力上限%d点", n_AddValue);
	return str;
end;
--技能效果
function skill:Action_C(level, t)
	local n_AddValue = self:GetAction(level);
	t.n_AddNeiLi = t.n_AddNeiLi + n_AddValue;
end;

local skill = _G.MountSkill[6];
function skill:GetAction(level)
	-- local n_AddValue = math.floor(3+(level-1)*(1+(level-2)*(0.01+level/1500)));
	-- return n_AddValue;
	return 0;
end;
--技能描述
function skill:GetExplain(level)
	if level == 0 then return 1 end;
	if level > 100 then return 2 end;
	local n_AddValue = self:GetAction(level);
	local str = string.format("加持主人暴击%d点", n_AddValue);
	return str;
end;
--技能效果
function skill:Action_C(level, t)
	local n_AddValue = self:GetAction(level);
	t.n_AddBaoJi = t.n_AddBaoJi + n_AddValue;
end;

local skill = _G.MountSkill[7];
function skill:GetAction(level)
	-- local n_AddValue = level;
	-- return n_AddValue;
	return 0;
end;
--技能描述
function skill:GetExplain(level)
	if level == 0 then return 1 end;
	if level > 100 then return 2 end;
	local n_AddValue = self:GetAction(level);
	local str = string.format("加持主人移动速度%d点", n_AddValue);
	return str;
end;
--技能效果
function skill:Action_C(level, t)
	local n_AddValue = self:GetAction(level);
	t.n_AddSpeedValue = t.n_AddSpeedValue + n_AddValue;
end;

local skill = _G.MountSkill[8];
function skill:GetAction(level)
	-- local n_AddValue = math.floor(2+(level-1)*(1.4+(level-2)*(level/2000)));;
	-- return n_AddValue;
	return 0;
end;
--技能描述
function skill:GetExplain(level)
	if level == 0 then return 1 end;
	if level > 100 then return 2 end;
	local n_AddValue = self:GetAction(level);
	local str = string.format("加持主人攻击速度%d点", n_AddValue);
	return str;
end;
--技能效果
function skill:Action_C(level, t)
	local n_AddValue = self:GetAction(level);
end;

--[[
	singleAttrChange 为 _G.SSingleAttrChange引用，需对对应值赋值。
	dwAttack = 0;--攻击
	dwDefense = 0;--防御
	dwFlee = 0;--身法
	dwCrit = 0;--暴击
	dwHPMax= 0;--生命max
	dwMPMax= 0;--内力max
	dwMoveSpeed= 0;--移动速度
	dwAttackSpeed= 0;--攻击速度
	dwIgnoreDefense= 0;--忽视防御
	dwAppendAttack = 0;--追加伤害
	dwRemitAttack = 0;--伤害减免
	dwBounceAttack= 0;--伤害反弹
	dwAbsorbHP= 0;--生命吸取
	dwAbsorbMP = 0;--内力吸取
	dwHitPercent = 0;--命中
	dwDuck = 0;--闪避率
	dwAppendCrit = 0;--暴击伤害（百分比）
	dwAllSkillUpLv = 0; --武功层数
	dwPKForbid = 0;--PK保护
	
	dwSkillForbidFlag = 0;--技能禁止标志
	dwMoveForbidFlag = 0;--移动禁止标志
	dwUseItemForbidFlag = 0;--物品使用禁止标志
	
	dwDanderUp = 0;--怒气增加
	dwExpUp = 0;--经验增加
	dwMountExpUp = 0;--坐骑经验增加
	dwSitUp = 0;--打坐收益增加
	dwSkillKlgUp = 0;--技能熟练度增加
	]]
	
local skill = _G.MountSkill[1];
--技能效果 身法
function skill:Action_S(level, singleAttrChange)
	local n_AddValue = self:GetAction(level);
	singleAttrChange.dwFlee = singleAttrChange.dwFlee + n_AddValue;
end;
local skill = _G.MountSkill[2];
--技能效果
function skill:Action_S(level, singleAttrChange)
	local n_AddValue = self:GetAction(level);
	singleAttrChange.dwHPMax = singleAttrChange.dwHPMax	+ n_AddValue;
end;
local skill = _G.MountSkill[3];
--技能效果
function skill:Action_S(level, singleAttrChange)
	local n_AddValue = self:GetAction(level);
	singleAttrChange.dwAttack = singleAttrChange.dwAttack + n_AddValue;
end;
local skill = _G.MountSkill[4];
--技能效果 内力
function skill:Action_S(level, singleAttrChange)
	local n_AddValue = self:GetAction(level);
	singleAttrChange.dwDefense = singleAttrChange.dwDefense + n_AddValue;
end;
local skill = _G.MountSkill[5];
--技能效果
function skill:Action_S(level, singleAttrChange)
	local n_AddValue = self:GetAction(level);
	singleAttrChange.dwMPMax = singleAttrChange.dwMPMax + n_AddValue;
end;
local skill = _G.MountSkill[6];
--技能效果
function skill:Action_S(level, singleAttrChange)
	local n_AddValue = self:GetAction(level);
	singleAttrChange.dwCrit = singleAttrChange.dwCrit + n_AddValue;
end;
local skill = _G.MountSkill[7];
--技能效果
function skill:Action_S(level, singleAttrChange)
	local n_AddValue = self:GetAction(level);
	singleAttrChange.dwMoveSpeed = singleAttrChange.dwMoveSpeed + n_AddValue;
end;
local skill = _G.MountSkill[8];
--技能效果
function skill:Action_S(level, singleAttrChange)
	local n_AddValue = self:GetAction(level);
	singleAttrChange.dwAttackSpeed = singleAttrChange.dwAttackSpeed + n_AddValue;
end;
