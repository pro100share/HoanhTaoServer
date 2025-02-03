--角色信息
_G.SRoleInfo = {};
function SRoleInfo:new(o)
	local obj;
	if o  ~= nil then
		obj = o;
	else
		obj = {};
		obj.dwRoleID 		= 0;			--角色ID
		obj.szRoleName 		= "";		--玩家名字
		obj.dwSex 			= 0;			--玩家性别
		obj.dwFace			= 0;			--玩家脸型
		obj.dwHair 			= 0;			--玩家发型
		obj.dwProf			= 0;			--玩家职业
		
		obj.dwDefFace		= 0;
		obj.dwDefHair		= 0;
		obj.dwDefHand		= 0;
		obj.dwDefDress		= 0;
		obj.dwDefShoe		= 0;
		obj.dwDefIncoID     = 0;
		--[[
		obj.szLoverText		= ""			--伴侣信息
		obj.tbTitle			= {}			--称号信息
		obj.szTalk			= ""			--说话信息
		--]]
		obj.dwLevel			= 0;
		obj.dwSuitID 		= 0;			--玩家默认套装ID
		--下面改成ItemEnum
		obj.dwDress			= 0;			--衣服
		obj.dwHand			= 0;			--护手
		obj.dwShoe			= 0;			--鞋子
		obj.dwArms			= 0;			--武器
		
		obj.dwHorseID		= 0;
		
		obj.dwDressLevel	= 0;			--衣服强化等级
		obj.dwHandLevel		= 0;			--护手强化等级
		obj.dwShoeLevel		= 0;			--鞋子强化等级
		obj.dwArmsLevel		= 0;			--武器强化等级
		
		obj.dwExp			= 0;			--角色经验
		
		obj.dwIncoID		= 0;
		
		obj.setActSuitList	= {};			--激活的套装ID
	end;
	return obj;
end;

_G.SRoleInfoForUpdate = {};
function SRoleInfoForUpdate:new()
	local obj = {};
	
	obj.dwHorseID		= 0;
	
	obj.dwLevel			= 0;
	
	obj.dwDress			= 0;			--衣服
	obj.dwHand			= 0;			--护手
	obj.dwShoe			= 0;			--鞋子
	obj.dwArms			= 0;			--武器
	
	obj.dwDressLevel	= 0;			--衣服强化等级
	obj.dwHandLevel		= 0;			--护手强化等级
	obj.dwShoeLevel		= 0;			--鞋子强化等级
	obj.dwArmsLevel		= 0;			--武器强化等级
	
	obj.setActSuitList	= {};			--激活的套装ID
	
	return obj;
end;

function _G.MakeUpdateInfoByRoleInfo(tbEmpty,tnInfo)
	for n,v in pairs(tbEmpty)do
		if tnInfo[n] then
			tbEmpty[n] = tnInfo[n];
		end
	end
end;


--创建角色信息
_G.SCreateInfo = {}
function SCreateInfo:new(o)
	local obj;
	if o ~= nil then
	   obj = o;
	else
		obj = {}	;
		obj.szName 			= "";			--玩家名字
		obj.dwSex 			= 0;			--玩家性别
		obj.dwFace			= 0;			--玩家脸型
		obj.dwHair 			= 0;			--玩家发型
		obj.dwProf		= 0;			--玩家职业
		obj.dwSuitID 		= 0;			--玩家默认套装ID
		obj.dwIncoID		= 0;			--对应玩家的头像ID
	end;
	return obj;
end;
--角色列表信息dfdf
_G.SRoleListShowInfo = {};
function SRoleListShowInfo:new(o)
	local obj;
	if o ~= nil then
		obj = o;
	else
		obj = {};	
		obj.dwRoleID		= 0;
		obj.szRoleName		= "";
		obj.dwSex			= 0;
		obj.dwFace			= 0;
		obj.dwHair			= 0;
		obj.dwProf 			= 0;
		obj.dwIncoID    	= 0;
		
		obj.dwDress			= 0;		--衣服
		obj.dwHand			= 0;		--护手
		obj.dwShoe			= 0;		--鞋子
		obj.dwArms			= 0;		--武器
		obj.dwHorseID 		= 0;		--坐骑模型
		
		obj.dwDefDress			= 0;		--默认衣服
		obj.dwDefHand			= 0;		--默认护手
		obj.dwDefShoe			= 0;		--默认鞋子
		
		obj.dwExp		= 0;			--角色当前总经验  
		obj.dwLevel			= 0;			--角色等级
		obj.dwLevelMaxExp = 0;
		obj.dwLevelCurExp = 0;
		
		obj.dwMoney         = 0;	 --游戏币
		obj.dwBindGold      = 0; --绑定的元宝
		obj.dwGold			= 0; --元宝
		
		obj.tmDownlineTime  = 0;--下线时间
		obj.tmUplineTime =    0;--上线时间
		
		obj.setActSuitList	= {};			--激活的套装ID

	end;
	return obj;
end;

------------------------------------------------------------------
--SkillSystem中使用的角色战斗相关属性
_G.SRoleSkillInfo = {}
function SRoleSkillInfo:new(o)
	local obj = {};
	obj.dwHP = 0;--角色当前生命值
	obj.dwMP = 0;--角色当前内力值
	obj.dwMuscle = 0;--臂力
	obj.dwPhysique = 0;--体魄
	obj.dwOrgan = 0;--根骨
	obj.dwTechnique = 0;--技巧
	obj.dwAttack = 0;--攻击
	obj.dwDefense = 0;--防御
	obj.dwFlee = 0;--身法
	obj.dwHitPercent = 0;--命中
	obj.dwCrit = 0;--暴击
	obj.dwHPMax= 0;--生命max
	obj.dwMPMax= 0;--内力max
	obj.dwMoveSpeed= 0;--移动速度
	obj.dwAttackSpeed= 0;--攻击速度
	obj.dwIgnoreDefense= 0;--忽视防御
	obj.dwAppendAttack = 0;--追加伤害
	obj.dwRemitAttack = 0;--伤害减免
	obj.dwBounceAttack= 0;--伤害反弹
	obj.dwAbsorbHP= 0;--生命吸取
	obj.dwAbsorbMP = 0;--内力吸取
	obj.dwDuck = 0;--闪避率
	obj.dwAppendCrit = 1.5;--暴击伤害（百分比）
	obj.dwAllSkillUpLv = 0; --武功层数
	obj.dwDander = 0;--怒气值
	obj.dwPoint = 0;--潜力点
	obj.dwOtherPoint = 0;	--特殊潜力点通过其他途径增加的潜力点,只作为记录不参与计算
	obj.dwPKForbid = 0;--禁止PK标志：0-可以；1-等级不够；2-杀死保护
	obj.dwCaromCount = 0;--连击次数
	obj.dwCritDown = 0;--暴击抵抗
	obj.dwDefenseValue = 0;--伤害抵御
	
	obj.dwPoJiaValue = 0;--破甲
	obj.dwPoJiaDiKang = 0;--破甲抵抗

	return obj;
end;

local arrStrAdvType = 
{
	"Equip",	--装备
	"Suit",		--套装
	"Skill",	--技能
	"Buff",		--状态
	"Pulse",	--经脉
	"Five",		--五行真气系统
	"Bourn",	--实战
	"Mount",	--坐骑
	"Level",	--聚灵
	"GMCommand",	--GM命令
	"Achievement",	--成就
	"Guild",		--帮会
	"Sword",	--名剑
	"Task",		--任务
	"WeiWang",	--威望
	"Amulet",	--保甲
	"Leader",	--盟主
	"SkillTitle",	--技能称号?
	"RenMai",		--宠物指教
	"Collect",	--收集功能
	"Vip",		--vip
	"Stone",	--宝石
	"StoneSuit",	--宝石套装
	"Title",		--称号?
	"Errant",		--侠客行
	"EquipBuild",	--装备强化
	"YouWuZhi",		--尤物志
	"Soul",			--战魂系统
	"Practice",		--修行系统
	"PetInstruct",	--宠物指教
	"PetStateProperty",	--宠物给人加的属性
	"KungFu",		--易筋经
	"MegaKill",		--血魔功
	"MatrixMethod",		--阵法，北斗七星
	"ErrantHonor",	--侠义勋章,风云腰牌
	"ExpIntegrate",	--炼丹系统
	"TieBuShan",	--功法：铁布衫
	"WuXiaLing",	--威望勋章
	"PractiseSkill",	--童姥功系统功能
	"BournHideAttr",	--实战隐藏属性
	"Medical",		--吃丹
	"Gourd",		--酒葫芦
	"QunXiaLu",		--群侠录
	"Gest",			--武尊全章
	"FashionDress",		--时装
	"QingYunLing",
	"ShengHuoLing",
	"DuGuJiuJian",  --独孤九剑
	"HiddenWeapon",	--暗器系统
	"ZhanQiJue",    --战骑诀
	"Shield",		--盾牌
	"GoldenBody",	-- 修炼金身
	"Banner",       --战旗
	"HeroToken",    --英雄令
    "Curio",        --古董
};

--在跨服战中可以操作影响战斗属性的系统
local crossSvrAddPropSystem =
{
	"Mount",
	"Buff",
};

--属性部分，增量和百分比都用这个
_G.SAttrChangeInfo = {};
function SAttrChangeInfo:new()
	local obj = {};
	
	for i,str in pairs(arrStrAdvType)do
		obj[str] = {};
	end
	
	for i,v in pairs(SAttrChangeInfo) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;

function SAttrChangeInfo:IsEffectCrossSvr(sysName)
	for _, v in pairs(crossSvrAddPropSystem) do 
		if sysName == v then
			return true;
		end
	end
	
	return false;
end

function SAttrChangeInfo:GetInfo()
	local sLastInfo = SSingleAttrChange:new();
	
	for i,str in pairs(arrStrAdvType)do
		for index,attr in pairs(self[str])do
			attr:CountAttrValue(sLastInfo);
		end
	end
	
	return sLastInfo;
end;

function SAttrChangeInfo:GetCrossSvrInfo()
	local sLastInfo = SSingleAttrChange:new();

	for i,str in pairs(arrStrAdvType)do
		if str ~= "Buff" then
			for index,attr in pairs(self[str])do
				attr:CountAttrValue(sLastInfo);
			end
		end
	end
	
	return sLastInfo;
end

function SAttrChangeInfo:PrintInfo(szName)
	for i,str in pairs(arrStrAdvType)do
		for index,attr in pairs(self[str])do
			print("===SAttrChangeInfo:PrintInfo===",str,szName,attr[szName])
		end
	end
end;


--五行结构属性
_G.CFiveElemSystem = {}
function CFiveElemSystem:new()
	local obj = CSystem:new("CFiveElemSystem");
	obj.dwMetalLv = 0;   --五行等级
	obj.dwWoodLv = 0;
	obj.dwWaterLv = 0;
	obj.dwFireLv = 0;
	obj.dwEarthLv = 0;
	obj.dwDantianLv = 0;
	obj.dwMetalValue = 100; --五行真气值
	obj.dwWoodValue = 100;
	obj.dwWaterValue = 100;
	obj.dwFireValue = 100;
	obj.dwEarthValue = 100;

	obj.dwCountTime = GetCurTime(); --上次结算时间
	
	obj.dwMetalTime = 100; --五行真气急蓄时间
	obj.dwWoodTime = 100;
	obj.dwWaterTime = 100;
	obj.dwFireTime = 100;
	obj.dwEarthTime = 100;
	obj.setTime = 
	{
		'dwMetalTime',
		'dwWoodTime',
		'dwWaterTime',
		'dwFireTime',
		'dwEarthTime',
	}
	obj.dwTimeStamp = 0;
	obj.AttributeList = 
	{
		dwAttack 	= 0,--攻击
		dwDefense 	= 0;--防御
		dwFlee	 	= 0;--身法
		dwCrit		= 0;--暴击
		dwHPMax 		= 0;--角色当前生命值
		dwMPMax		= 0;--角色当前内力值
	}
	obj.ComboAttributeList = {};
	
	obj.szFillParam = '00000'
	---
	for i,v in pairs(CFiveElemSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

--境界结构属性
_G.CBournSystem = {}
function CBournSystem:new()
	local obj = CSystem:new("CBournSystem");
	
	obj.dwBournExp = 0;	--境界当前实战经验
	obj.dwBournPVPExp = 0;	--境界当前实战PVP经验
	obj.dwBournLv = 1;		--境界等级
	
	obj.AttributeList = 
	{
		dwHPMax				= 0,		--生命
		dwMPMax				= 0,		--内力
		dwAttack 			= 0,		--攻击
		dwDefense 			= 0,		--防御
		dwMoveSpeed			= 0,		--移动速度
		dwAttackSpeed		= 0,		--攻击速度
		dwDuck 				= 0,		--闪避率
		dwAppendCrit 		= 0,		--暴击伤害（百分比）
		dwAllSkillUpLv 		= 0, 		--武功层数
	}
	
	obj.dwUpdataLine = 0;
	---
	for i,v in pairs(CBournSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
--经脉系统结构
_G.CPulseSystem = {};
function CPulseSystem:new(dwPlayerID)
	local obj = CSystem:new("CPulseSystem");
	obj.objPlayer = dwPlayerID
	
	obj.dwPulse1 = 0;	--八条经脉进度
	obj.dwPulse2 = 0;
	obj.dwPulse3 = 0;
	obj.dwPulse4 = 0;
	obj.dwPulse5 = 0;
	obj.dwPulse6 = 0;
	obj.dwPulse7 = 0;
	obj.dwPulse8 = 0;
	obj.dwPulseFullNum = 0; --冲通的经脉条数	
	obj.dwPulseFullNumOld = 0; --冲通的经脉条数
	
	obj.dwTotalExp = 0;		--当前通过他人冲脉获得的经验
	obj.dwLastTimes = 0;
	obj.dwWuValue = 0;  	--悟值
	obj.dwWuType = 0;  		--悟类型
	--今日剩余分享冲脉经验次数
	
	obj.PulseWaitList = {}; -- 存放倒数状态的经脉序号
	obj.AttributeList = 
	{
		dwAttack = 0,
		dwDefense = 0,
		dwCrit = 0,
		dwFlee = 0,
		dwHPMax	= 0;--生命max
		dwMPMax	= 0;--内力max
		dwDuck	= 0;--闪避率
	}
	--add 2012-09-25 系统新加属性
	obj.dwPulseEx1 = 0;
	obj.dwPulseEx2 = 0;
	obj.dwPulseEx3 = 0;
	obj.dwPulseEx4 = 0;
	obj.dwCountTime = _now();
	
	obj.dwPulseDragon = 0;
	---
	for i,v in pairs(CPulseSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
