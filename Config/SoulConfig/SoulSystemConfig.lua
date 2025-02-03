--战魂系统配置

--战魂品质
_G.SoulQuality = 
{
	Gray = 1; --灰色，只能用来卖
	Food = 2;--只能被吃经验
	Food2 = 3;--只能被吃经验
	Food3 = 4;--只能被吃经验
	Food4 = 5;
	Food5 = 6;
	Food6 = 7;
	Food7 = 8;
	Food8 = 9;--只能被吃经验
	
	White = 10;--白
	Green = 11;--绿
	Blue = 12;--蓝
	Purple = 13;--紫
	Gold = 14;--金
}

--战魂容器类型
_G.SoulHolderType = 
{
	Hunt = 1;
	Packet = 2;
	Equip = 3;
}

--战魂分解条件
_G.SoulBreakCondition = 
{
	[SoulQuality.Purple] = 5;
}

--上线之后送的战魂
_G.SoulInitList = 
{
	1,
}

--战魂系统配置
_G.SoulSystem = 
{
	MaxPacketNumber = 48;--背包最大数量
	HuntNumber = 20;--猎取容器大小
	EquipNumber = 100;--战魂装备容器数量
	
	InitPacketNumber = 10;--背包初始大小
	
	MaxHuntIndex = 5;--狩猎的最大索引
	
	MountRankMax = 10;--坐骑一共的阶数
}

--战魂初始经验
_G.SoulInitExp = 
{
	[SoulQuality.Food] = 5;
	[SoulQuality.Food2] = 500;
	[SoulQuality.Food3] = 1500;
	[SoulQuality.Food4] = 5000;
	[SoulQuality.Food5] = 50000;
	[SoulQuality.Food6] = 100000;
	[SoulQuality.Food7] = 500000;
	[SoulQuality.Food8] = 1000000;
	[SoulQuality.White] = 15;
	[SoulQuality.Green] = 45;
	[SoulQuality.Blue] = 180;
	[SoulQuality.Purple] = 720;
	[SoulQuality.Gold] = 2880;
}

--不能吃别的战魂的类型
_G.SoulEatForbidType = 
{
	[SoulQuality.Food] = 1;
}

--不能放到装备的战魂
_G.SoulEquipForbidType = 
{
	[SoulQuality.Food] = 1;
	[SoulQuality.Gray] = 1;
}

--战魂对象的网络结构
_G.SoulObjectNetInfo = {};
function SoulObjectNetInfo:new()
	local obj = {};
	obj.dwEnumID = 0;
	obj.dwInstID = 0;
	obj.dwHolderType = 0;
	obj.dwPosID = 0;
	obj.dwExp = 0;
	
	return obj;
end;

local arrSoulNetName2Index = 
{
	dwEnumID = 1;
	dwInstID = 2;
	dwHolderType = 3;
	dwPosID = 4;
	dwExp = 5;
}
local arrSoulNetIndex2Name = {}
for k,v in pairs(arrSoulNetName2Index)do
	arrSoulNetIndex2Name[v] = k;
end

function _G.GetSoulName2Index(szName)
	return arrSoulNetName2Index[szName];
end
function _G.GetSoulIndex2Name(dwIndex)
	return arrSoulNetIndex2Name[dwIndex];
end;

--战魂加的属性类型
_G.SoulPropertyType = 
{
	--数值增加
	Attack = 1;--攻击
	Defense = 2;--防御
	Flee = 3;--身法
	HitPercent = 4;--命中
	Crit = 5;--暴击
	HPMax = 6;--生命上限
	MPMax = 7;--内力上限
	AttackSpeed = 8;--攻速
	MoveSpeed = 9;--移动速度
	IgnoreDefense = 10; --破甲
	DefenseValue = 11;--伤害抵御
	CritDown = 12;--暴击抵抗
	PoJiaValue = 13;
	PoJiaDiKang = 14;
	
	--下面的属性是百分比增加
	Attack_P = 101;
	Defense_P = 102;
	Flee_P = 103;
	HitPercent_P = 104;
	Crit_P = 105;
	HPMax_P = 106;
	MPMax_P = 107;
	AttackSpeed_P = 108;
	MoveSpeed_P = 109;
	IgnoreDefense_P = 110; --破甲
	DefenseValue_P = 111;--伤害抵御
	CritDown_P = 112;
	PoJiaValue_P = 113;
	PoJiaDiKang_P = 114;
}

--吃战魂时的属性排序
--吃战魂时，上面的属性会吃掉下面的属性
local arrProTypeSort = 
{
	SoulPropertyType.Attack_P,
	SoulPropertyType.Defense_P,
	SoulPropertyType.Flee_P,
	SoulPropertyType.Crit_P,
	SoulPropertyType.HPMax_P,
	SoulPropertyType.MPMax_P,
	SoulPropertyType.AttackSpeed_P,
	SoulPropertyType.MoveSpeed_P,
	SoulPropertyType.HitPercent_P,
	SoulPropertyType.IgnoreDefense_P,
	SoulPropertyType.DefenseValue_P,
	SoulPropertyType.CritDown_P,
	SoulPropertyType.PoJiaValue_P,
	SoulPropertyType.PoJiaDiKang_P,
	
	SoulPropertyType.Attack,
	SoulPropertyType.Defense,
	SoulPropertyType.Flee,
	SoulPropertyType.Crit,
	SoulPropertyType.HPMax,
	SoulPropertyType.MPMax,
	SoulPropertyType.AttackSpeed,
	SoulPropertyType.MoveSpeed,
	SoulPropertyType.HitPercent,
	SoulPropertyType.IgnoreDefense,
	SoulPropertyType.DefenseValue,
	SoulPropertyType.CritDown,
	SoulPropertyType.PoJiaValue,
	SoulPropertyType.PoJiaDiKang,
}

_G.SoulEatProTypeSort = {};
for k,v in pairs(arrProTypeSort)do
	SoulEatProTypeSort[v] = k;
end

-------------------------------------------------------------------------------
--战魂的函数
_G.SoulFunction = {};
--属性列表
local data  = {
	[1] = {
		[1] = {[10] = 20,[11] = 40,[12] = 60,[13] = 120,[14] = 240};
		[2] = {[10] = 40,[11] = 80,[12] = 120,[13] = 240,[14] = 480};
		[3] = {[10] = 60,[11] = 120,[12] = 180,[13] = 360,[14] = 720};
		[4] = {[10] = 80,[11] = 160,[12] = 240,[13] = 480,[14] = 960};
		[5] = {[10] = 100,[11] = 200,[12] = 300,[13] = 600,[14] = 1200};
		[6] = {[10] = 120,[11] = 240,[12] = 360,[13] = 720,[14] = 1440};
		[7] = {[10] = 140,[11] = 280,[12] = 420,[13] = 840,[14] = 1680};
		[8] = {[10] = 160,[11] = 320,[12] = 480,[13] = 960,[14] = 1920};
		[9] = {[10] = 180,[11] = 360,[12] = 540,[13] = 1080,[14] = 2160};
		[10] = {[10] = 200,[11] = 400,[12] = 660,[13] = 1200,[14] = 2400};
	};--攻击
	[2] = {
		[1] = {[10] = 10,[11] = 20,[12] = 30,[13] = 60,[14] = 120};
		[2] = {[10] = 20,[11] = 40,[12] = 60,[13] = 120,[14] = 240};
		[3] = {[10] = 30,[11] = 60,[12] = 90,[13] = 180,[14] = 360};
		[4] = {[10] = 40,[11] = 80,[12] = 120,[13] = 240,[14] = 480};
		[5] = {[10] = 50,[11] = 100,[12] = 150,[13] = 300,[14] = 600};
		[6] = {[10] = 60,[11] = 120,[12] = 180,[13] = 360,[14] = 720};
		[7] = {[10] = 70,[11] = 140,[12] = 210,[13] = 420,[14] = 840};
		[8] = {[10] = 80,[11] = 160,[12] = 240,[13] = 480,[14] = 960};
		[9] = {[10] = 90,[11] = 180,[12] = 270,[13] = 540,[14] = 1080};
		[10] = {[10] = 100,[11] = 200,[12] = 300,[13] = 600,[14] = 1200};
	};--防御
	[3] = {
		[1] = {[10] = 100,[11] = 200,[12] = 300,[13] = 600,[14] = 1200};
		[2] = {[10] = 200,[11] = 400,[12] = 600,[13] = 1200,[14] = 2400};
		[3] = {[10] = 300,[11] = 600,[12] = 900,[13] = 1800,[14] = 3600};
		[4] = {[10] = 400,[11] = 800,[12] = 1200,[13] = 2400,[14] = 4800};
		[5] = {[10] = 500,[11] = 1000,[12] = 1500,[13] = 3000,[14] = 6000};
		[6] = {[10] = 600,[11] = 1200,[12] = 1800,[13] = 3600,[14] = 7200};
		[7] = {[10] = 700,[11] = 1400,[12] = 2100,[13] = 4200,[14] = 8400};
		[8] = {[10] = 800,[11] = 1600,[12] = 2400,[13] = 4800,[14] = 9600};
		[9] = {[10] = 900,[11] = 1800,[12] = 2700,[13] = 5400,[14] = 10800};
		[10] = {[10] = 1000,[11] = 2000,[12] = 3000,[13] = 6000,[14] = 12000};
	};--生命
	[4] = {
		[1] = {[10] = 5,[11] = 10,[12] = 15,[13] = 25,[14] = 50};
		[2] = {[10] = 10,[11] = 20,[12] = 30,[13] = 50,[14] = 100};
		[3] = {[10] = 15,[11] = 30,[12] = 45,[13] = 75,[14] = 150};
		[4] = {[10] = 20,[11] = 40,[12] = 60,[13] = 100,[14] = 200};
		[5] = {[10] = 25,[11] = 50,[12] = 75,[13] = 125,[14] = 250};
		[6] = {[10] = 30,[11] = 60,[12] = 90,[13] = 150,[14] = 300};
		[7] = {[10] = 35,[11] = 70,[12] = 105,[13] = 175,[14] = 350};
		[8] = {[10] = 40,[11] = 80,[12] = 120,[13] = 200,[14] = 400};
		[9] = {[10] = 45,[11] = 90,[12] = 135,[13] = 225,[14] = 450};
		[10] = {[10] = 50,[11] = 100,[12] = 150,[13] = 250,[14] = 500};
	};--身法
	[5] = {
		[1] = {[10] = 5,[11] = 10,[12] = 15,[13] = 25,[14] = 50};
		[2] = {[10] = 10,[11] = 20,[12] = 30,[13] = 50,[14] = 100};
		[3] = {[10] = 15,[11] = 30,[12] = 45,[13] = 75,[14] = 150};
		[4] = {[10] = 20,[11] = 40,[12] = 60,[13] = 100,[14] = 200};
		[5] = {[10] = 25,[11] = 50,[12] = 75,[13] = 125,[14] = 250};
		[6] = {[10] = 30,[11] = 60,[12] = 90,[13] = 150,[14] = 300};
		[7] = {[10] = 35,[11] = 70,[12] = 105,[13] = 175,[14] = 350};
		[8] = {[10] = 40,[11] = 80,[12] = 120,[13] = 200,[14] = 400};
		[9] = {[10] = 45,[11] = 90,[12] = 135,[13] = 225,[14] = 450};
		[10] = {[10] = 50,[11] = 100,[12] = 150,[13] = 250,[14] = 500};
	};--暴击抵抗
	[6] = {
		[1] = {[10] = 5,[11] = 10,[12] = 15,[13] = 25,[14] = 50};
		[2] = {[10] = 10,[11] = 20,[12] = 30,[13] = 50,[14] = 100};
		[3] = {[10] = 15,[11] = 30,[12] = 45,[13] = 75,[14] = 150};
		[4] = {[10] = 20,[11] = 40,[12] = 60,[13] = 100,[14] = 200};
		[5] = {[10] = 25,[11] = 50,[12] = 75,[13] = 125,[14] = 250};
		[6] = {[10] = 30,[11] = 60,[12] = 90,[13] = 150,[14] = 300};
		[7] = {[10] = 35,[11] = 70,[12] = 105,[13] = 175,[14] = 350};
		[8] = {[10] = 40,[11] = 80,[12] = 120,[13] = 200,[14] = 400};
		[9] = {[10] = 45,[11] = 90,[12] = 135,[13] = 225,[14] = 450};
		[10] = {[10] = 50,[11] = 100,[12] = 150,[13] = 250,[14] = 500};
	};--暴击
	[7] = {
		[1] = {[10] = 15,[11] = 30,[12] = 45,[13] = 90,[14] = 180};
		[2] = {[10] = 30,[11] = 60,[12] = 90,[13] = 180,[14] = 360};
		[3] = {[10] = 45,[11] = 90,[12] = 135,[13] = 270,[14] = 540};
		[4] = {[10] = 60,[11] = 120,[12] = 180,[13] = 360,[14] = 720};
		[5] = {[10] = 75,[11] = 150,[12] = 225,[13] = 450,[14] = 900};
		[6] = {[10] = 90,[11] = 180,[12] = 270,[13] = 540,[14] = 1080};
		[7] = {[10] = 105,[11] = 210,[12] = 315,[13] = 630,[14] = 1260};
		[8] = {[10] = 120,[11] = 240,[12] = 360,[13] = 720,[14] = 1440};
		[9] = {[10] = 135,[11] = 270,[12] = 405,[13] = 810,[14] = 1620};
		[10] = {[10] = 150,[11] = 300,[12] = 450,[13] = 900,[14] = 1800};
	};--破甲伤害
	[8] = {
		[1] = {[10] = 8,[11] = 16,[12] = 24,[13] = 48,[14] = 96};
		[2] = {[10] = 23,[11] = 32,[12] = 48,[13] = 96,[14] = 192};
		[3] = {[10] = 38,[11] = 48,[12] = 72,[13] = 144,[14] = 288};
		[4] = {[10] = 53,[11] = 64,[12] = 96,[13] = 192,[14] = 384};
		[5] = {[10] = 68,[11] = 80,[12] = 120,[13] = 240,[14] = 480};
		[6] = {[10] = 83,[11] = 96,[12] = 144,[13] = 288,[14] = 576};
		[7] = {[10] = 98,[11] = 112,[12] = 168,[13] = 336,[14] = 672};
		[8] = {[10] = 113,[11] = 128,[12] = 192,[13] = 384,[14] = 768};
		[9] = {[10] = 128,[11] = 144,[12] = 216,[13] = 432,[14] = 864};
		[10] = {[10] = 136,[11] = 160,[12] = 240,[13] = 480,[14] = 960};
	};--伤害抵御
};


--计算战魂加的属性值
--参数 dwEnumID--战魂类型;dwLevel--战魂等级
--返回 战魂每个属性对应的数值组成的表
SoulFunction.FunCountSoulProValue = function(dwEnumID,dwLevel)
	-- print("dwEnumID	=	",dwEnumID)
	-- -- --获取该位置的属性类型
	-- local ProListID = SoulObject[dwEnumID].ProListID
	-- --获取该位置的品质
	-- local dwQuality = SoulObject[dwEnumID].dwQuality

	-- local a = {};
	
	-- local tbRsl = data[ProListID][dwQuality]
	
	-- print("ProListID	=	",ProListID)
	-- print("dwQuality	=	",dwQuality)
	-- print("tbRsl	=	",tbRsl)
	-- return tbRsl;
	local cfg = SoulObject[dwEnumID];
	local tbProTypeList = SoulProperty[cfg.ProListID];
	local tbRsl = {};
	if cfg.dwQuality ~= 2 then
		for k,v in pairs(tbProTypeList)do
			tbRsl[v] = data[cfg.ProListID][dwLevel][cfg.dwQuality];
		end
	end
	return tbRsl;
end;

--战魂属性公式
--返回两个table
local arrIndex2Name = 
{
	[SoulPropertyType.Attack] = "dwAttack";
	[SoulPropertyType.Defense] = "dwDefense";
	[SoulPropertyType.Flee] = "dwFlee";
	[SoulPropertyType.HitPercent] = "dwHitPercent";
	[SoulPropertyType.Crit] = "dwCrit";
	[SoulPropertyType.HPMax] = "dwHPMax";
	[SoulPropertyType.MPMax] = "dwMPMax";--内力上限
	[SoulPropertyType.AttackSpeed] = "dwAttackSpeed";--攻速
	[SoulPropertyType.MoveSpeed] = "dwMoveSpeed";--移动速度
	[SoulPropertyType.IgnoreDefense] = "dwIgnoreDefense";
	[SoulPropertyType.DefenseValue] = "dwDefenseValue";
	[SoulPropertyType.CritDown] = "dwCritDown";
	[SoulPropertyType.PoJiaValue] = "dwPoJiaValue";
	[SoulPropertyType.PoJiaDiKang] = "dwPoJiaDiKang";
	
	
	[SoulPropertyType.Attack_P] = "dwAttack";
	[SoulPropertyType.Defense_P] = "dwDefense";
	[SoulPropertyType.Flee_P] = "dwFlee";
	[SoulPropertyType.HitPercent_P] = "dwHitPercent";
	[SoulPropertyType.Crit_P] = "dwCrit";
	[SoulPropertyType.HPMax_P] = "dwHPMax";
	[SoulPropertyType.MPMax_P] = "dwMPMax";
	[SoulPropertyType.AttackSpeed_P] = "dwAttackSpeed";
	[SoulPropertyType.MoveSpeed_P] = "dwMoveSpeed";
	[SoulPropertyType.IgnoreDefense_P] = "dwIgnoreDefense";
	[SoulPropertyType.DefenseValue_P] = "dwDefenseValue";
	[SoulPropertyType.CritDown_P] = "dwCritDown";
	[SoulPropertyType.PoJiaValue_P] = "dwPoJiaValue";
	[SoulPropertyType.PoJiaDiKang_P] = "dwPoJiaDiKang";
}
SoulFunction.FunProTypeValue = function(tbProperty)
	local tbAdv = {};
	local tbPer = {};
	
	for k,v in pairs(tbProperty)do
		local szName = arrIndex2Name[k];
		if szName then
			if k >= SoulPropertyType.Attack_P then
				tbPer[szName] = v;
			else
				tbAdv[szName] = v;
			end
		end
	end
	
	return tbAdv,tbPer;
end;


--狩猎战魂
--参数 狩猎索引
--返回 战魂的配置ID，是否晋级
local zhpz = {
	-- 战魂种类产出几率
	-- 从左到右绿 蓝 紫 金 红 经验战魂
	[1] = {3300,700,0,0,0,6000};
	[2] = {4500,1400,100,0,0,4000};
	[3] = {4000,2775,200,25,0,3000};
	[4] = {3850,4300,300,50,0,1500};
	[5] = {4400,5000,500,100,0,0};	
};

local zh = {
	-- 战魂ID
	---1 对应表：SoulBaseConfig.SoulObject    ID 9 是经验战魂
		[1] = {1,2,3,4,5};
		[2] = {6,7,8,9,10};
		[3] = {11,12,13,14,15};
		[4] = {16,17,18,19,20};
		[5] = {21,22,23,24,25};
		[6] = {26,27,28,29,30};
		[7] = {31,32,33,34,35};
		[8] = {36,37,38,39,40};
		[9] = {41,42,43};
};
local UPr = {
	-- 升级几率ID
		[1] = 4000;
		[2] = 4000;
		[3] = 3500;
		[4] = 3000;
		[5] = 0;

};
-----废弃
local pz = {
	[1] = {2,1,9};
};




local function QuanZhong(dwIndex)
	--获取列表和
	local Max = 0;
	for v , k in pairs(zhpz[dwIndex]) do
		Max = Max + k;
	end
	--获取随机值
	local dwRes = math.random(1,Max)
	--获取产出
	local dwCur = 0;
	for z , s in pairs(zhpz[dwIndex]) do
		dwCur = dwCur + s;
		if dwRes <= dwCur then
			return z;
		end
	end
end


SoulFunction.FunHuntSoul = function(dwIndex)
	--获取品质
	if dwIndex == 0 then
		local dwRsl = 0;
		local dwNewIndex = 1;
		dwRsl = 1;
		return dwRsl,dwNewIndex;
	else
		local Zhi = QuanZhong(dwIndex);
		local dwNewIndex = 1;
		local dwRsl = {};
		local uprnd = math.random(10000);
		if (Zhi == 6) then
			dwRsl = 41;
		else
			local dwRes = math.random(1,8);
			dwRsl =  zh[dwRes][Zhi];
		end


		if uprnd > 0 and uprnd <= UPr[dwIndex] then
			dwNewIndex = dwIndex + 1;
		else
			dwNewIndex = 1;
		end
		return dwRsl,dwNewIndex;
	end
			-- end
			-- break;
		-- end
	-- end

end

--分解战魂
--参数 dwEnumID--战魂类型；dwLevel--等级
--返回 分解出的碎片数量
SoulFunction.FunBreakSoul = function(dwEnumID,dwLevel)
	return 1;
end;

--扩展背包消耗的元宝
--参数 dwNow--现在的格子数,dwAdd--增加的格子数
--返回 消耗的元宝数
local jg = {10,20,30,40,50,60,70,80,90,100,120,150,190,240,300,370,450,540,640,750};
SoulFunction.FunExtendCost = function(dwNow,dwAdd)
	-- local dwNewIndex = dwNow - 19;
	
	-- local dwCost = 0;
	-- for i = 1, dwAdd do
		-- local dwjq = jq[dwNewIndex+i-1]
		-- dwCost = dwCost + dwjq;
	-- end
	local maxs = 0
	for i=1, dwAdd do
		maxs = maxs+jg[i+((dwNow+1)-11)]
	end
	
	return maxs;
end;

--战魂提供的经验值
--参数 dwEnumID--战魂类型；dwExp--经验
--返回 这个战魂能提供的经验
SoulFunction.FunCountSoulExp = function(dwEnumID,dwExp)
	return dwExp;
end;

--获取装备容器中坐标对应的装备阶数和装备位
--参数 dwPosID--容器内的位置
--返回 对应的坐骑阶数，装备位
SoulFunction.FunGetEquipHolderPosRank = function(dwPosID)
	local dwRank = math.floor((dwPosID-1)/10)+1;
	local dwEquipID = math.floor(dwPosID%10);
	if dwEquipID == 0 then
		dwEquipID = 10;
	end
	
	return dwRank,dwEquipID;
end;

--计算出对应的装备容器的位置
--参数 dwRank--坐骑阶数,dwEquipID--装备位
--返回 容器的位置ID
SoulFunction.FunCountEquipHolderPos = function(dwRank,dwEquipID)
	local dwPosID = (dwRank-1)*10 + dwEquipID;
	
	return dwPosID;
end;

--判断装备位是否已经开放
--参数 dwRank--坐骑阶数,dwLevel--坐骑等级,dwEquipID--装备位
--返回 是否可以使用这个装备位
local levelgo = {
	[4] = {20,30,40,50,60,70,80,90,120,120};
	[5] = {21,31,41,51,61,71,81,91,120,120};
	[6] = {22,32,42,52,62,72,82,92,120,120};
	[7] = {23,33,43,53,63,73,83,93,120,120};
	[8] = {24,34,44,54,64,74,84,94,120,120};
	[9] = {25,35,45,55,65,75,85,95,120,120};
	[10] = {26,36,46,56,66,76,86,96,120,120};

};

SoulFunction.FunIsEquipCanUse = function(dwRank,dwLevel,dwEquipID)
	if dwRank <= 3 then
		return false, '*_* 4级宠物才开放';
	elseif dwRank >= 4 then
		local b = "<font color='#ffffff'>坐骑 " .. levelgo[dwRank][dwEquipID] .. " 级后开放</font>";
		if  dwLevel >= levelgo[dwRank][dwEquipID] then
			return true;
		else
			if dwEquipID >= 9 then
				return false,'暂未开放';
			else
				return false,b;
			end
		end
	end
	
	-- if dwLevel < 10 and dwEquipID == 8 then
		-- return false, '该战魂槽在坐骑10级后开启.'
	-- end
	
	-- return true,'';
		-- local b = '坐骑' .. levelgo[dwRank][dwEquipID] .. '后开放';
		-- if dwRank >= 4 and dwLevel >= levelgo[dwRank][dwEquipID] then
		-- return true;
		-- else
			-- if dwEquipID >= 9 then
				-- return false,'暂未开放';
			-- else
				-- return false,b;
			-- end
		-- end
	-- return true;
end

--战魂排序函数
function _G.FunSoulSort(objA,objB)
	--品质顺序
	local dwQuaA = objA:GetQuality();
	local dwQuaB = objB:GetQuality();
	if dwQuaA ~= dwQuaB then
		return dwQuaA > dwQuaB;
	end
	
	--经验顺序
	local dwLevelA = objA:GetExp();
	local dwLevelB = objB:GetExp();
	if dwLevelA ~= dwLevelB then
		return dwLevelA > dwLevelB;
	end
	
	--属性数量
	local tbProListA = objA:GetProList();
	local tbProListB = objB:GetProList();
	
	local dwNumA = #tbProListA;
	local dwNumB = #tbProListB;
	
	if dwNumA ~= dwNumB then
		return dwNumA > dwNumB;
	end
	
	if dwNumA == 0 then
		return objA:GetInstID() > objB:GetInstID();
	end
	
	--属性类型
	return SoulEatProTypeSort[tbProListA[1]] < SoulEatProTypeSort[tbProListB[1]];
end;

-------------------------------------------------------------------------------
_G.AttrVarName2String = function(strVarName)
	if strVarName == "dwAttack" then
		return "<font size='2' ></font><br><font color='#ff7e00'>增加攻击"
	elseif strVarName == "dwDefense" then
		return "<font size='2' ></font><br><font color='#ff7e00'>增加防御"
	elseif strVarName == "dwFlee" then
		return "<font size='2' ></font><br><font color='#ff7e00'>增加身法"
	elseif strVarName == "dwHPMax" then
		return "<font size='2' ></font><br><font color='#ff7e00'>增加生命上限"
	elseif strVarName == "dwCrit" then
		return "<font size='2' ></font><br><font color='#ff7e00'>增加暴击"
	elseif strVarName == "dwCritDown" then
		return "<font size='2' ></font><br><font color='#ff7e00'>增加暴击抵抗"
	elseif strVarName == "dwPoJiaValue" then
		return "<font size='2' ></font><br><font color='#ff7e00'>增加破甲攻击"
	elseif strVarName == "dwPoJiaDiKang" then
		return "<font size='2' ></font><br><font color='#ff7e00'>增加伤害抵御"
	else
		return "<font size='2' ></font><br><font color='#ff7e00'>未知属性";
	end
end

_G.SoulMonsterTips = function(dwMonster)
	if dwMonster == 1 then
		return "<font size='18' color='#ffc000'>玄武<br></font>" .. "<font size='14' color='#ffffff'>圣兽玄武，镇守北方之神。<br>有几率猎取</font>"  .. "<font size='14' color='#bdbdbd'>普通命魂，</font>" .. "<font size='14' color='#00ff00'>绿色战魂，</font>" .. "<font size='14' color='#00aeff'>蓝色战魂。</font>";
	elseif dwMonster == 2 then
		return "<font size='18' color='#ffc000'>白虎<br></font>" .. "<font size='14' color='#ffffff'>圣兽白虎，镇守西方之神。<br>有几率猎取</font>"  .. "<font size='14' color='#bdbdbd'>普通命魂，</font>" .. "<font size='14' color='#00ff00'>绿色战魂，</font>" .. "<font size='14' color='#00aeff'>蓝色战魂，</font>" .. "<font size='14' color='#f000ff'><br>紫色战魂。</font>";
	elseif dwMonster == 3 then
		return "<font size='18' color='#ffc000'>朱雀<br></font>" .. "<font size='14' color='#ffffff'>圣兽朱雀，镇守南方之神。<br>有几率猎取</font>"  .. "<font size='14' color='#bdbdbd'>普通命魂，</font>" .. "<font size='14' color='#00ff00'>绿色战魂，</font>" .. "<font size='14' color='#00aeff'>蓝色战魂，</font>" .. "<font size='14' color='#f000ff'><br>紫色战魂，</font>" .. "<font size='14' color='#fffc00'>金色战魂。</font>";
	elseif dwMonster == 4 then
		return "<font size='18' color='#ffc000'>青龙<br></font>" .. "<font size='14' color='#ffffff'>圣兽青龙，镇守东方之神。<br>有几率猎取</font>"  .. "<font size='14' color='#bdbdbd'>普通命魂，</font>" .. "<font size='14' color='#00ff00'>绿色战魂，</font>" .. "<font size='14' color='#00aeff'>蓝色战魂，</font>" .. "<font size='14' color='#f000ff'><br>紫色战魂，</font>" .. "<font size='14' color='#fffc00'>金色战魂。</font>";
	elseif dwMonster == 5 then
		return "<font size='18' color='#ffc000'>麒麟<br></font>" .. "<font size='14' color='#ffffff'>圣兽麒麟，祥瑞之圣兽。<br>有几率猎取</font>"  ..  "<font size='14' color='#00ff00'>绿色战魂，</font>" .. "<font size='14' color='#00aeff'>蓝色战魂，</font>" .. "<font size='14' color='#f000ff'><br>紫色战魂，</font>" .. "<font size='14' color='#fffc00'>金色战魂。</font>";
	end
	return "出什么战魂";
end

_G.SoulConfig=
{
--------坐骑模型坐标
	tbMontPos = {
		[1] = {
			AvatarRect	= {x = 700, y = 700};
			CamaraPos = {x = 1,y = -10, z = 2};
			LookPos = {x = 0,y = 0, z = 0};
		};
		
		[2] = {
			AvatarRect	= {x = 700, y = 700};
			CamaraPos = {x = 1,y = -10, z = 2};
			LookPos = {x = 0,y = 0, z = 0};
		};
		
		[3] = {
			AvatarRect	= {x = 700, y = 700};
			CamaraPos = {x = 1,y = -10, z = 2};
			LookPos = {x = 0,y = 0, z = 0};
		};
		
		[4] = {
			AvatarRect	= {x = 700, y = 700};
			CamaraPos = {x = 1,y = -10, z = 2};
			LookPos = {x = 0,y = 0, z = 0};
		};
		
		[5] = {
			AvatarRect	= {x = 700, y = 700};
			CamaraPos = {x = 1,y = -10, z = 2};
			LookPos = {x = 0,y = 0, z = 0};
		};
		
		[6] = {
			AvatarRect	= {x = 700, y = 700};
			CamaraPos = {x = 1,y = -10, z = 2};
			LookPos = {x = 0,y = 0, z = 0};
		};
		
		[7] = {
			AvatarRect	= {x = 700, y = 700};
			CamaraPos = {x = 1,y = -10, z = 2};
			LookPos = {x = 0,y = 0, z = 0};
		};
		
		[8] = {
			AvatarRect	= {x = 700, y = 700};
			CamaraPos = {x = 1,y = -10, z = 2};
			LookPos = {x = 0,y = 0, z = 0};
		};
		
		[9] = {
			AvatarRect	= {x = 700, y = 700};
			CamaraPos = {x = 1,y = -20, z = 2};
			LookPos = {x = 0,y = 0, z = 1};
		};
		
		[10] = {
			AvatarRect	= {x = 500, y = 500};
			CamaraPos = {x = 1,y = -10, z = 2};
			LookPos = {x = 2,y = 0, z = 3};
		};
		
		[11] = {
			AvatarRect	= {x = 700, y = 700};
			CamaraPos = {x = 1,y = -10, z = 2};
			LookPos = {x = 0,y = 0, z = 0};
		};
		
		[12] = {
			AvatarRect	= {x = 700, y = 700};
			CamaraPos = {x = 1,y = -10, z = 2};
			LookPos = {x = 0,y = 0, z = 0};
		};
		
		[13] = {
			AvatarRect	= {x = 700, y = 700};
			CamaraPos = {x = 1,y = -10, z = 2};
			LookPos = {x = 0,y = 0, z = 0};
		};
	};
	
	strItemInfo = "%s";
	strPick = "拾取";
	strSale = "卖出";
	strWaitServerReply = "大侠您的网络不稳定，请稍后再试";
	strNotEnoughMoney = "银两不足，不能继续.";
	strSummonMonsterTips = "直接召唤麒麟,需要消耗2个元宝";
	strSummonMonster = "此操作消耗2个元宝,是否继续";
	strBuySoul = "兑换需要消耗%d个战魂碎片是否兑换?";
	strBeSureDecomposeSoul = "是否确定分解:%s 您将获得:%d个战魂碎片";
	strEatTip = "战魂%sLv.%d将吸收%sLv.%d，吸收后合成的战魂将增加%d的经验。";
	strPackageFull = "战魂背包已满";
	strNotEnoughGold = "元宝不足";
	strCanNotMergeExpSuol = "命魂不能装备";
	strAddPackageGridInfo="打开%d个格子，需要消耗%d个元宝确认继续?";
	strHuntGridFull = "猎魂空间已满，无法猎取战魂，自动停止";
	strNotEnoughSoulChips = "战魂碎片不足，无法兑换该战魂";
	strBeSureMergeSoul = "是否自动合成战魂，注意该操作，高级品质的战魂会吞并低级品质的战魂.";
	strNotEnoughPackageGrid = "您的战魂背包内空间不足，无法拾取";
	strAlreadyHasSouls = "已经有该属性的战魂了，不能装备具备相同属性的战魂。";
	strDropToMatchSlot = "请放到对应的装备槽位中去";
	strSystemNotOpen = "坐骑未达到四阶，战魂系统未开放.";
	strExpSoulMergeTip = "命魂之间不能互相吸收.";
	strNotHaveEmptyEquipSlot = "没有可用的装备位.";
	strHuntResultInfo = "<font size='14' >获得战魂%s</font>";
	strSaleInfo	= "%s";
	strBuyInfo = "%s";
	strSoulTipAddName = "<p><font size='20' color='#00ff00'>【战魂加成】</font></p>";
	strSoulTrade = "兑换";
	strSoulDecompose = "分解";
	strSoulTradeDesc = "<font color='#ffc000'>小提示：</font><font color='#ffffff'>兑换战魂需要消耗战魂碎片才可兑换，战魂碎片点击左边分解按钮，进入分解页面内分解金色战魂获得</font>";
	strSoulDecomposeDesc = "<font color='#ffc000'>小提示：</font><font color='#ffffff'>只有金色战魂可以被分解，当战魂背包内存在金色战魂时，可以在此页面点击显示的战魂下方分解按钮获得战魂碎片</font>";
	strLevelText = "Lv.%d";
	strCanNotEatOnExpSoul = "命魂之间不能互相吸收";
	strSoulTipName = "<p><font size='18' color='#ffffff'>%s Lv.%d</font></p>";
	strSoulTipInfo = "<p><font size='2' ></font><br><font color='#ffffff'>战魂经验:%d/%d</font></p>";
	strSoulTipInfoAttr = "<p>%s + %d</p>";
	strExpTipName = "<p>%s</p>";
	strExpSoulInfo = "<p>无用的战魂只能被其他战魂吸收</p>";
	strExpSoulInfoExp = "<p><font color='#ffc000'>增加经验%d点</font></p>";
	strSoulNotExist = "请检查战魂背包内该战魂是否存在.";
	strLevelText = "<font color='#ffffff'>Lv.%d</font>";
	strTipsCanNotEatMax = "战魂等级已达到满级,无法吸收其他战魂"; 
	dwAutoHuntInterval = 300; --自动猎魂的时间间隔，毫秒
	dwChangeIndexCostGold = 2;--修改狩猎索引花费的元宝
	dwFreeChangeCountForNormal = 0;--普通角色免费修改索引次数
	dwFreeChangeCountForVip = 3;--VIP角色免费修改索引次数
	dwMountBaseLevel = 4;	--从第几阶开始可以装备战魂
	dwMountUpLevel=7;		--最高到第几阶可以有战魂
	dwFlyTime = 0.5;
	--战魂Tips
	
	strSoulName = "<p><font color='#00ff00'>%s</font></p>"; --size='24' align='center'
	strLevel = "<br><p><font color='#ffffff'>等级：%d</p>";
	strExperience = "<p><font color='#ffffff'>经验：%d</p>";
	
	strAttack="增加攻击 ";
	strDefence = "增加防御 ";
	strHP = "增加生命 ";
	strMP = "增加内力 ";
	strFlee = "增加身法 ";
	strCrit = "增加暴击 ";
	strCritDown = "增加暴击抵抗 ";
	strAttackSpeed = "增加攻击速度 ";
	strMoveSpeed = "增加移动速度 ";
	strIgnoreDeffence = "增加破甲攻击 ";
	strDefenseValue = "增加伤害抵御 ";
	strCantEquipInfo="已经有该属性的战魂了，不能装备具备相同属性的战魂。";
	strAddProperty = "<p><img src = 'img://zb_xfk_shuxing_biaoshi.png' /><font color='#f79b0a' size='14'>%s+%d</font></p>";
	tbMonster=
	{
		[1] = { name="玄武"; money=50000; };
		[2] = { name="白虎"; money=100000; };
		[3] = { name="朱雀"; money=200000; };
		[4] = { name="青龙"; money=300000; };
		[5] = { name="麒麟"; money=600000; };
	};
}
