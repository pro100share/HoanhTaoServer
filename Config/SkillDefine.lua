--[[
功能：公共头文件
作者：刘炜
时间：2012-2-20
]]

--对象类型
_G.enEntType =
{
	eEntType_Item = 1,		--物品
	eEntType_Monster = 2,	--怪物
	eEntType_Npc = 3,		--NPC
	eEntType_Player = 4,	--玩家
	eEntType_Pet = 5,		--宠物
}

--技能尝试释放的结果
_G.enSkillResult =
{
	eSRType_Succ = 1,		--成功释放
	eSRType_Fail = 2,		--失败
}

--PK模式
_G.enPKMode = 
{
	ePK_Peace	= 1,	--和平
	ePK_Team	= 2,	--组队
	ePK_Group	= 3,	--帮会
	ePK_Judge	= 4,	--善恶
	ePK_Kill	= 5,	--屠杀
}

--角色身上跳字的类型
_G.enBattleNoticeType = 
{
	eBNT_HP_ADD 		= 1,--加HP
	eBNT_HP_DOWN		= 2,--减HP
	eBNT_MP_ADD 		= 3,--加MP
	eBNT_MP_DOWN		= 4,--减MP
	eBNT_MISS			= 5,--躲闪
	eBNT_SWORD			= 6,--宝剑伤害
	eBNT_XueMo			= 7,--血魔功
}

--技能特效的类型
_G.enActionType = 
{
	eAT_Role	= 1,	--角色身上
	eAT_Target	= 2,	--地面
	eAT_Pursue	= 3,	--追踪
	eAT_Move	= 4,	--移动
}

--复活的类型
_G.enReliveType = 
{
	eRT_Now		= 1,	--原地
	eRT_Pos		= 2,	--地图点
}
--复活使用的道具
_G.enItemForRelive = 4100010;

--免费原地复活等级
_G.enFreeReliveLevel = 15;

--原地复活的字的参数
_G.AutoReliveNotice = 
{
	pos = _Vector3.new(0,0,2.1);
	width = 0.10;
	height = 0.14;
}

--死亡的声音消失时间
_G.enDeadSoundMiss = 3000;

--复活时声音恢复的时间
_G.enReliveSoundAct = 3000;

--PK值清空的时间
_G.enPKValueClearTime = 60000;

--退出战斗状态的时间，单位：ms
_G.enCancleFightTime = 10000;

--免费洗点的等级限制
_G.enFreeResetLevel = 24;
--洗点道具
_G.enItemForReset = 2500090;
--洗点时间限制
_G.enTimeForReset = 2*60*1000;
--血比例少于这个的时候播放全屏红色特效
_G.enShowHPEffectPercent = 0.15;
--小于等级这个级别自动加点
_G.enAutoAddPointLevel = 20;

--死亡复活的时间
_G.enDeadReliveTime = 30000;
_G.enDeadRelivePosTime = 3000;

--技能的公共CD
_G.SkillPublicCool = 500;

--洗点符消耗的数量
_G.funcResetItemCost = function(dwUsedPoint)
	return math.floor((dwUsedPoint/10) + 1);
end;

--角色的状态
_G.enPlayerState = 
{
	ePS_Normal = 1,--休息状态
	ePS_Fight = 2,--战斗
	ePS_Sit = 3,--打坐
	ePS_Dead = 4,--死亡
	ePS_Martial = 5,--演武
}

--角色的行为
_G.enPlayerAction = 
{
	ePA_Move = 1,--移动
	ePA_Attack = 2,--伤害别人
	ePA_Hurt = 3,--受到攻击
	ePA_Sit = 4,--打坐
	ePA_Stand = 5,--站起来
	ePA_UseItem = 6,--使用道具，带参数，ItemEnum
	ePA_OffLine = 7,--下线
	ePA_Trade = 8,--交易
	ePA_ChgLine = 9,--换线
	ePA_Pulse = 10,--冲脉
	ePA_SkillExe = 11,--使用技能
	ePA_ChgMap = 12,--换地图
	ePA_EnterMar = 13,--进入演武
	ePA_EixtMar = 14,--退出演武
	ePA_LearnSkill = 15,--学习特殊技能
}

_G.enSkillEffectType = 
{
	eSET_Action1 = 1,--一般，怪物和人都通用
	eSET_Action2 = 6,--地面指向
	eSET_Action3 = 7,--追踪
	eSET_Action4 = 8,--强制移动
	eSET_Action5 = 9,--怪物的特殊技能
	eSET_PlyHurt = 2,
	eSET_MonHurt = 3,
	eSET_Skip = 4,
	eSET_PfxPlay = 5,
}

--所有的人物战斗属性，对应的索引数值
local tbAttrName2Index = 
{
	dwHP = 1;--角色当前生命值
	dwMP = 2;--角色当前内力值
	dwMuscle = 3;--臂力
	dwPhysique = 4;--体魄
	dwOrgan = 5;--根骨
	dwTechnique = 6;--技巧
	dwAttack = 7;--攻击
	dwDefense = 8;--防御
	dwFlee = 9;--身法
	dwHitPercent = 10;--命中
	dwCrit = 11;--暴击
	dwHPMax= 12;--生命max
	dwMPMax= 13;--内力max
	dwMoveSpeed= 14;--移动速度
	dwAttackSpeed= 15;--攻击速度
	dwIgnoreDefense= 16;--忽视防御
	dwAppendAttack = 17;--追加伤害
	dwRemitAttack = 18;--伤害减免
	dwBounceAttack= 19;--伤害反弹
	dwAbsorbHP= 20;--生命吸取
	dwAbsorbMP = 21;--内力吸取
	dwDuck = 22;--闪避率
	dwAppendCrit = 23;--暴击伤害（百分比）
	dwAllSkillUpLv = 24; --武功层数
	dwDander = 25;--怒气值
	dwPoint = 26;--潜力点
	dwPKForbid = 27;--禁止PK标志：0-可以；1-等级不够；2-杀死保护
	dwCaromCount = 28;--连击次数
	dwSkillForbidFlag = 29;--技能禁止标志
	dwMoveForbidFlag = 30;--移动禁止标志
	dwUseItemForbidFlag = 31;--物品使用禁止标志
	dwDanderUp = 32;--怒气增加
	dwExpUp = 33;--经验增加
	dwMountExpUp = 34;--坐骑经验增加
	dwSitUp = 35;--打坐收益增加
	dwSkillKlgUp = 36;--技能熟练度增加
	dwMonsterAppend = 37;--怪物再伤害系数
	dwPoJiaValue = 38;--破甲
	dwPoJiaDiKang = 39;--破甲抵抗
	dwCritDown = 40; --暴击抵抗
	dwForbidValue = 41;--霸体值
	dwForbidValueMax = 42;--霸体值上限
	
	--下面是角色的外形属性
	dwRoleID = 100;			--角色ID
	szRoleName = 101;		--玩家名字
	dwSex = 102;			--玩家性别
	dwFace = 103;			--玩家脸型
	dwHair = 104;			--玩家发型
	dwProf = 105;			--玩家职业
	dwSuitID = 106;			--玩家默认套装ID
	dwDress = 107;			--衣服
	dwHand = 108;			--护手
	dwShoe = 109;			--鞋子
	dwArms = 110;			--武器
	dwDressLevel = 111;			--衣服强化等级
	dwHandLevel = 112;			--护手强化等级
	dwShoeLevel = 113;			--鞋子强化等级
	dwArmsLevel = 114;			--武器强化等级
	dwExp = 115;			--角色经验
	dwHorseID = 116;
	dwIncoID = 117;
	dwLevel = 118;
	dwLevelMaxExp = 119;
	dwLevelCurExp = 120;
	dwMoney = 121;
	dwBindGold = 122;
	dwGold = 123;
	dwDefFace = 124;
	dwDefHair = 125;
	dwDefHand = 126;
	dwDefDress = 127;
	dwDefShoe = 128;
	dwMapId = 129;
	dwDelRoleFlag = 130;
	dwTimeRes = 131;
	tmDownlineTime = 132;
	tmUplineTime = 133;
	tmCreateRoleTime = 134;
	setActSuitList = 135;
	dwLockTime = 136;
	dwLockStart = 137;
	szLockReason = 138;
	dwDefIncoID = 139;
	dwModelList = 140;-----模型ID列表
}

local tbIndex2AttrName = {};

local function MakeI2ATable()
	for name,index in pairs(tbAttrName2Index)do
		tbIndex2AttrName[index] = name;
	end
end;
MakeI2ATable();

function _G.GetAttrNameToIndex(szName)
	return tbAttrName2Index[szName];
end;

function _G.GetAttrIndexToName(dwIndex)
	return tbIndex2AttrName[dwIndex];
end;

--技能学习相关的配置
--1为播放公告  0为不播放公告
_G.SkillLearnConfig = 
{
	--需要读条学习的技能和相应的成功率(100% = 10000)
	tbSkillLearnTime = 
	{
		--绝学
		[11003] = {7000,1};
		[11007] = {7000,1};
		[11008] = {7000,1};
		[11009] = {7000,1};
		[11011] = {7000,1};
		[11012] = {7000,1};
		[11014] = {7000,1};
		[11016] = {7000,1};
		[11017] = {7000,1};
		--普通招式
		-- [21001] = {10000,0};
		-- [21003] = {10000,0};
		-- [21004] = {10000,0};
		[21005] = {10000,0};
		
		-- [31001] = {10000,0};
		-- [31003] = {10000,0};
		-- [31004] = {10000,0};
		[31005] = {10000,0};
	
		-- [41001] = {10000,0};
		-- [41003] = {10000,0};
		-- [41004] = {10000,0};
		[41005] = {10000,0};
		
		-- [51001] = {10000,0};
		-- [51003] = {10000,0};
		-- [51004] = {10000,0};
		[51005] = {10000,0};
		--大挪移
		[11013] = {10000,0};
		--无双
		--[61001] = {10000,0};
		
		[12006] = {10000,0};
		[12008] = {10000,0};
		[12009] = {10000,0};
		[12017] = {10000,0};
		[12011] = {10000,0};
		[12016] = {10000,0};
		
		[13023] = {10000,0};
		[13027] = {10000,0};
		[13025] = {10000,0};
		[13021] = {10000,0};
		[13028] = {10000,0};

		[13026] = {10000,0};
		[13022] = {10000,0};
		[13018] = {10000,0};
		[13024] = {10000,0};
		[13020] = {10000,0};

		
	};
	--失败的公告
	tbFailWord = 
	{
		5000240011;
	};
	--成功的公告
	tbSuccWord = 
	{
		5000240005;
	};
	--技能学习时读条的时间长度
	dwSkillLearnTimeLength = 7500;
	--学习时播放的动作
	dwSkillLearnAction = 11;
	--成功的动作
	dwSkillSuccAction = 12;
	--失败的动作
	dwSkillFailAction = 13;
	
	--学习的特效
	dwEffectConfigID = 100;
}




--单个属性的改变值，增量个百分比都用这个
_G.SSingleAttrChange = {};
function SSingleAttrChange:new()
	local obj = {};
	obj.dwAttack = 0;--攻击
	obj.dwDefense = 0;--防御
	obj.dwFlee = 0;--身法
	obj.dwCrit = 0;--暴击
	obj.dwCritDown = 0;--暴击抵抗
	obj.dwHPMax= 0;--生命max
	obj.dwMPMax= 0;--内力max
	obj.dwMoveSpeed= 0;--移动速度
	obj.dwAttackSpeed= 0;--攻击速度
	obj.dwIgnoreDefense= 0;--破甲伤害
	obj.dwAppendAttack = 0;--追加伤害
	obj.dwRemitAttack = 0;--伤害减免
	obj.dwBounceAttack = 0;--伤害反弹
	obj.dwDefenseValue = 0;--伤害抵御
	obj.dwAbsorbHP= 0;--生命吸取
	obj.dwAbsorbMP = 0;--内力吸取
	obj.dwHitPercent = 0;--命中
	obj.dwDuck = 0;--闪避率
	obj.dwAppendCrit = 0;--暴击伤害（百分比）
	obj.dwAllSkillUpLv = 0; --武功层数：已废弃
	obj.dwPKForbid = 0;--PK保护
	
	obj.dwPoJiaValue = 0;--破甲
	obj.dwPoJiaDiKang = 0;--破甲抵抗
	
	obj.dwSkillForbidFlag = 0;--技能禁止标志
	obj.dwMoveForbidFlag = 0;--移动禁止标志
	obj.dwUseItemForbidFlag = 0;--物品使用禁止标志
	
	obj.dwDanderUp = 0;--怒气增加
	obj.dwExpUp = 0;--经验增加
	obj.dwMountExpUp = 0;--坐骑经验增加
	--obj.dwSitUp = 0;--打坐收益增加
	obj.dwSkillKlgUp = 0;--技能熟练度增加
	obj.dwMartialExpUp = 0;--团练经验增加
	obj.dwMartialZhenqiUp = 0;--团练真气增加
	
	obj.dwMonsterAppend = 0;--怪物再伤害系数
	
	obj.dwMartialUp = 0;--团练加速值
	obj.dwStoryFlag = 0;--剧情中标志，AI中用
	obj.dwBossAppend = 0;--对BOSS伤害加成
	
	for i,v in pairs(SSingleAttrChange) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;

	return obj;
end;

function SSingleAttrChange:Clone()
	local tbClone = {};
	
	for i,v in pairs(self) do
		tbClone[i] = v;
	end;
	
	return tbClone;
end;

function SSingleAttrChange:ValueClone()
	local tbClone = {};
	
	for i,v in pairs(self) do
		if type(v) ~= 'function' then
			tbClone[i] = v;
		end
	end;
	
	return tbClone;
end;

function SSingleAttrChange:Copy(tbValue)
	if not tbValue or type(tbValue) ~= "table" then
		return;
	end
	
	for key,value in pairs(tbValue)do
		if self[key] then
			self[key] = value;
		end
	end
end;

function SSingleAttrChange:CountAttrValue(sOutInfo)
	for n,v in pairs(sOutInfo)do
		if type(v) ~= 'function' then
			sOutInfo[n] = v + self[n];
		end
	end
end;

function SSingleAttrChange:AddValue(objSingle)
	if not objSingle then
		return;
	end
	
	for n,v in pairs(objSingle)do
		if type(v) ~= 'function' and self[n] then
			self[n] = self[n] + v;
		end
	end
end;

function SSingleAttrChange:SubValue(objSingle)
	if not objSingle then
		return;
	end
	
	for n, v in pairs(objSingle)do
		if type(v) ~= 'function' and self[n] then
			self[n] = self[n] - v;
		end
	end
end;

function SSingleAttrChange:Multiply(dwPercent)
	for k, v in pairs(self)do
		if type(v) ~= 'function' then
			self[k] = math.ceil(v * dwPercent);
		end
	end
end;
