--套装配置

--套装基础配置
_G.SuitBaseConfig = 
{
	[1] = ---强化12件装备 1级
	{
		dwID = 1;	--套装id
		dwCond = 1;	--条件SuitCheckConfig表
		dwAttr = 1;	--属性SuitAttrConfig
	};
	[2] = ---强化12件装备 2级
	{
		dwID = 2;	--套装id
		dwCond = 2;	--条件SuitCheckConfig表
		dwAttr = 2;	--属性SuitAttrConfig
	};
	[3] =  ---强化12件装备 3级
	{
		dwID = 3;	--套装id
		dwCond = 3;	--条件SuitCheckConfig表
		dwAttr = 3;	--属性SuitAttrConfig
	};
	[4] = ---强化武器 1级
	{
		dwID = 4;	--套装id
		dwCond = 4;	--条件SuitCheckConfig表
		dwAttr = 4;	--属性SuitAttrConfig
	};
	[5] = ---强化武器 2级
	{
		dwID = 5;	--套装id
		dwCond = 5;	--条件SuitCheckConfig表
		dwAttr = 5;	--属性SuitAttrConfig
	};
	[6] = ---强化武器 3级
	{
		dwID = 6;	--套装id
		dwCond = 6;	--条件SuitCheckConfig表
		dwAttr = 6;	--属性SuitAttrConfig
	};
	[7] = ---装备品质 1级
	{
		dwID = 7;	--套装id
		dwCond = 7;	--条件SuitCheckConfig表
		dwAttr = 7;	--属性SuitAttrConfig
	};
	[8] = ---装备品质 2级
	{
		dwID = 8;	--套装id
		dwCond = 8;	--条件SuitCheckConfig表
		dwAttr = 8;	--属性SuitAttrConfig
	};
	[9] = ---装备品质 3级
	{
		dwID = 9;	--套装id
		dwCond = 9;	--条件SuitCheckConfig表
		dwAttr = 9;	--属性SuitAttrConfig
	};	
	[10] = ---宝石套装 1级
	{
		dwID = 10;	--套装id
		dwCond = 10;	--条件SuitCheckConfig表
		dwAttr = 10;	--属性SuitAttrConfig
	};
	[11] = ---宝石套装 2级
	{
		dwID = 11;	--套装id
		dwCond = 11;	--条件SuitCheckConfig表
		dwAttr = 11;	--属性SuitAttrConfig
	};
	[12] = ---宝石套装 3级
	{
		dwID = 12;	--套装id
		dwCond = 12;	--条件SuitCheckConfig表
		dwAttr = 12;	--属性SuitAttrConfig
	};	
	[13] = ---宝石套装 4级
	{
		dwID = 13;	--套装id
		dwCond = 13;	--条件SuitCheckConfig表
		dwAttr = 13;	--属性SuitAttrConfig
	};	
	[14] = ---宝石套装 5级
	{
		dwID = 14;	--套装id
		dwCond = 14;	--条件SuitCheckConfig表
		dwAttr = 14;	--属性SuitAttrConfig
	};
}

--套装属性配置
local SuitAttrConfig = 
{
	[1] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = nil;
		attrAdv.dwAttack = 120
		attrAdv.dwDefense = 60
		attrAdv.dwHPMax = 384 
		attrAdv.dwMPMax = 36

		
		return attrAdv,attrPer;
	end;
	[2] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = nil;
		attrAdv.dwAttack = 155
		attrAdv.dwDefense = 78 
		attrAdv.dwHPMax = 496 
		attrAdv.dwMPMax = 47
		attrAdv.dwFlee = 55

		
		
		return attrAdv,attrPer;
	end;
	[3] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = SSingleAttrChange:new();
		attrAdv.dwAttack = 325
		attrAdv.dwDefense = 162 
		attrAdv.dwHPMax = 1220 
		attrAdv.dwMPMax = 97
		attrAdv.dwFlee = 65
		attrPer.dwAttack =0.05
		attrPer.dwDefense =0.05

		
		
		return attrAdv,attrPer;
	end;
	[4] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = nil;

		
		return attrAdv,attrPer;
	end;
	[5] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = nil;
		
		
		return attrAdv,attrPer;
	end;
	[6] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = nil;
		
		
		return attrAdv,attrPer;
	end;
	[7] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = nil;
		attrAdv.dwAttack = 80
		attrAdv.dwDefense = 40
		attrAdv.dwHPMax = 256
		attrAdv.dwMPMax = 24	
		
		return attrAdv,attrPer;
	end;
	[8] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = nil;
		attrAdv.dwAttack = 100
		attrAdv.dwDefense = 50
		attrAdv.dwHPMax = 320
		attrAdv.dwMPMax = 30
		attrAdv.dwFlee = 36

		
		return attrAdv,attrPer;
	end;
	[9] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = SSingleAttrChange:new();
		attrAdv.dwAttack = 200
		attrAdv.dwDefense = 100
		attrAdv.dwHPMax = 640
		attrAdv.dwMPMax = 60
		attrAdv.dwFlee = 40
		attrPer.dwDuck = 0.05
		attrPer.dwCrit = 0.05

		
		return attrAdv,attrPer;
	end;
	[10] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = nil;
		attrAdv.dwAttack = 100
		attrAdv.dwDefense = 50
		attrAdv.dwHPMax = 320
		attrAdv.dwMPMax = 30

		
		return attrAdv,attrPer;
	end;
	[11] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = nil;
		
		attrAdv.dwAttack = 100
		attrAdv.dwDefense = 50
		attrAdv.dwHPMax = 320
		attrAdv.dwMPMax = 30
		attrAdv.dwFlee = 40

		return attrAdv,attrPer;
	end;
	[12] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = SSingleAttrChange:new();
		
		attrAdv.dwAttack = 220
		attrAdv.dwDefense = 110
		attrAdv.dwHPMax = 704
		attrAdv.dwMPMax = 66
		attrAdv.dwFlee = 44
		attrPer.dwHPMax= 0.05
		attrAdv.dwHitPercent = 500
	

		return attrAdv,attrPer;
	end;
		[13] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = SSingleAttrChange:new();
		
		attrAdv.dwAttack = 780
		attrAdv.dwDefense = 390
		attrAdv.dwHPMax = 3656
		attrAdv.dwMPMax = 174
		attrAdv.dwFlee = 416
		attrPer.dwHPMax= 0.03
		attrAdv.dwHitPercent = 300
	    attrAdv.dwCritDown = 1000
		attrAdv.dwRemitAttack= 1500

		return attrAdv,attrPer;
	end;
		[14] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = SSingleAttrChange:new();
		
		attrAdv.dwAttack = 1100
		attrAdv.dwDefense = 500
		attrAdv.dwHPMax = 6000
		attrAdv.dwMPMax = 200
		attrAdv.dwFlee = 700
		attrPer.dwHPMax= 0.02
		attrAdv.dwHitPercent = 200
	    attrAdv.dwCritDown = 700
		attrAdv.dwRemitAttack= 600

		return attrAdv,attrPer;
	end;
}

--套装的检测装备位范围
local SuitCheckPosTable = 
{
	[1] = 
	{
		[enItemWearPos.eWeapon] = 1,
		[enItemWearPos.eCloth] = 1,
		[enItemWearPos.eLeg] = 1,
		[enItemWearPos.eGloves] = 1,
		[enItemWearPos.eBelt] = 1,
		[enItemWearPos.eHead] = 1,
		[enItemWearPos.eShoes] = 1,
		[enItemWearPos.eCloak] = 1,
		[enItemWearPos.eNecklace] = 1,
		[enItemWearPos.eRing] = 1,
		[enItemWearPos.eBracelet] = 1,
		[enItemWearPos.ePendant] = 1,
	};
	[2] = 
	{
		[enItemWearPos.eMount1] = 1,
		[enItemWearPos.eMount2] = 1,
		[enItemWearPos.eMount3] = 1,
		[enItemWearPos.eMount4] = 1,
	};
	[3] = 
	{
		[enItemWearPos.eWeapon] = 1,
	};
}

--套装检测条件配置
local SuitCheckConfig =
{
	[1] = 
	{
		dwPosCfg = 1;--装备位范围(上边表中的SuitCheckPosTable配置ID)
		dwPosNeed = 12;---一共需要多少个装备位置满足条件
		szCheckName = "dwStrong";----需要检测的变量名字
		dwValue = 7;---需要多少级
	};
	[2] = 
	{
		dwPosCfg = 1;--装备位范围(上边表中的SuitCheckPosTable配置ID)
		dwPosNeed = 12;---一共需要多少个装备位置满足条件
		szCheckName = "dwStrong";----需要检测的变量名字
		dwValue = 10;---需要多少级
	};
	[3] = 
	{
		dwPosCfg = 1;--装备位范围(上边表中的SuitCheckPosTable配置ID)
		dwPosNeed = 12;---一共需要多少个装备位置满足条件
		szCheckName = "dwStrong";----需要检测的变量名字
		dwValue = 15;---需要多少级
	};
	[4] = 
	{
		dwPosCfg = 3;--装备位范围(上边表中的SuitCheckPosTable配置ID)
		dwPosNeed = 1;---一共需要多少个装备位置满足条件
		szCheckName = "dwStrong";----需要检测的变量名字
		dwValue = 7;---需要多少级
	};
	[5] = 
	{
		dwPosCfg = 3;--装备位范围(上边表中的SuitCheckPosTable配置ID)
		dwPosNeed = 1;---一共需要多少个装备位置满足条件
		szCheckName = "dwStrong";----需要检测的变量名字
		dwValue = 10;---需要多少级
	};
	[6] = 
	{
		dwPosCfg = 3;--装备位范围(上边表中的SuitCheckPosTable配置ID)
		dwPosNeed = 1;---一共需要多少个装备位置满足条件
		szCheckName = "dwStrong";----需要检测的变量名字
		dwValue = 15;---需要多少级
	};
	[7] = 
	{
		dwPosCfg = 1;--装备位范围
		dwPosNeed = 4;
		szCheckName = "dwQuality";
		dwValue = 3; ---查看表_G.enQualityType 
	};
	[8] = 
	{
		dwPosCfg = 1;--装备位范围
		dwPosNeed = 8;
		szCheckName = "dwQuality";
		dwValue = 3;
	};
	[9] = 
	{
		dwPosCfg = 1;--装备位范围
		dwPosNeed = 12;
		szCheckName = "dwQuality";
		dwValue = 3;
	};
	[10] = 
	{
		dwPosCfg = 1;--装备位范围
		dwPosNeed = 12;
		szCheckName = "dwStoneLevel";
		dwValue = 3;
	};
	[11] = 
	{
		dwPosCfg = 1;--装备位范围
		dwPosNeed = 12;
		szCheckName = "dwStoneLevel";
		dwValue = 5;
	};
	[12] = 
	{
		dwPosCfg = 1;--装备位范围
		dwPosNeed = 12;
		szCheckName = "dwStoneLevel";
		dwValue = 7;
	};
	[13] = 
	{
		dwPosCfg = 1;--装备位范围
		dwPosNeed = 12;
		szCheckName = "dwStoneLevel";
		dwValue = 9;
	};
	[14] = 
	{
		dwPosCfg = 1;--装备位范围
		dwPosNeed = 12;
		szCheckName = "dwStoneLevel";
		dwValue = 12;
	};
}

local function GetCondition(dwSuitID)
	local tbSuitInfo = SuitBaseConfig[dwSuitID];
	if not tbSuitInfo then
		return nil;
	end
	
	return SuitCheckConfig[tbSuitInfo.dwCond];
end

--是否满足套装条件
local function IsCheckOver(tbCond,dwPosID,tbPosInfo)
	local tbPosCfg = SuitCheckPosTable[tbCond.dwPosCfg];
	if not tbPosCfg then
		return nil;
	end
	
	if not tbPosCfg[dwPosID] then
		return nil;
	end
	
	local dwVal = tbPosInfo[tbCond.szCheckName];
	if not dwVal then
		return nil;
	end
	
	if dwVal < tbCond.dwValue then
		return nil;
	end
	
	return true;
end;

local function NewSuitSingle()
	local obj = {};
	obj.dwActNumber = 0;
	obj.isActive = 0;
	obj.dwPosNeed = 0;
	
	
	return obj;
end;
local function NewPosSingle()
	local obj = {};
	obj.dwQuality = 0;
	obj.dwStrong = 0;
	obj.dwStoneLevel = 99;
	obj.dwStoneNumber = 0;
	obj.dwTianSh = 0;
	
	return obj;
end;

--套装检测函数
--参数：pos--{强化等级，品质，宝石最低品阶}
--返回：suitid--{满足数量，是否激活}
function _G.SuitCheck(tbPosInfo)
	local tbSuitInfo = {};
	
	for n,v in pairs(SuitBaseConfig)do
		tbSuitInfo[n] = NewSuitSingle();
	end
	
	for pos,tb in pairs(tbPosInfo)do
		for id,tbInfo in pairs(tbSuitInfo)do
			local tbCond = GetCondition(id);
			if tbCond then
				if IsCheckOver(tbCond,pos,tb) then
					tbInfo.dwActNumber = tbInfo.dwActNumber + 1;
					tbInfo.dwPosNeed = tbCond.dwPosNeed;
					if tbInfo.isActive == 0 then
						if tbInfo.dwActNumber >= tbCond.dwPosNeed then
							tbInfo.isActive = 1;
						end
					end
				end
			end
		end
	end
	
	return tbSuitInfo;
end;

--把装备和宝石数据转化成装备位数据
function _G.WearPosInfoMaker(tbEquipList,tbStoneList)
	local tbPosInfo = {};
	
	for n,v in pairs(enItemWearPos)do
		tbPosInfo[v] = NewPosSingle();
	end
	
	for _,objEquip in pairs(tbEquipList)do
		local dwPos = objEquip:GetWearPos();
		
		tbPosInfo[dwPos].dwStrong = objEquip:GetStrongLevel();
		tbPosInfo[dwPos].dwQuality = objEquip:GetQuality();
	end
	for _,objStone in pairs(tbStoneList)do
		local dwH,dwPosF = objStone:GetPosInfo();
		
		local dwPos = math.floor(dwPosF / 10) + 1;
		
		local dwLevel = objStone:GetLevel();
		if dwLevel < tbPosInfo[dwPos].dwStoneLevel then
			tbPosInfo[dwPos].dwStoneLevel = dwLevel;
		end
		
		tbPosInfo[dwPos].dwStoneNumber = tbPosInfo[dwPos].dwStoneNumber + 1;
	end
	
	--宝石不足5个就算0
	for n,info in pairs(tbPosInfo)do
		if info.dwStoneNumber < 5 then
			info.dwStoneLevel = 0;
		end
	end
	
	return tbPosInfo;
end;

function _G.GetSuitAttr(dwSuitID)
	local tbSuitInfo = SuitBaseConfig[dwSuitID];
	if not tbSuitInfo then
		return nil;
	end
	
	local funcAttr = SuitAttrConfig[tbSuitInfo.dwAttr];
	
	if not funcAttr then
		return;
	end
	
	return funcAttr();
end;

--强化特效列表，需要单独开辟出来；角色的ID信息：镰1、刀2、剑3、枪4
_G.EquipStrongSuitInfo = 
{	--角色枚举ID==特效组ID
	--[1] = { [1] = 1, [2] = 2, [3] = 3, [4] = 4 };
	[2] = { [1] = 5, [2] = 6, [3] = 7, [4] = 8 };
	[3] = { [1] = 9, [2] = 10, [3] = 11, [4] = 12 };
};
--套装特效列表，在 EquipStrongSuitInfo 表中的索引
_G.EquipStrongSuitPfxInfo = 
{	---每一组特效的信息：point为特效的绑点，id为特效的ID；每一组有三个绑点；可以在三个地方播放不同的特效
	--[1] = { { point = "leftforearmpoint", id = 0 }, { point = "leftfootpoint", id = 0 }, { point = "awc", id = 80103 } };
	--[2] = { { point = "leftforearmpoint", id = 0 }, { point = "leftfootpoint", id = 0 }, { point = "awc", id = 80203 } };
	--[3] = { { point = "leftforearmpoint", id = 0 }, { point = "leftfootpoint", id = 0 }, { point = "awc", id = 80203 } };
	--[4] = { { point = "leftforearmpoint", id = 0 }, { point = "leftfootpoint", id = 0 }, { point = "awc", id = 80403 } };
	[5] = { { point = "leftforearmpoint", id = 0 }, { point = "leftfootpoint", id = 0 }, { point = "awc", id = 80113 } };
	[6] = { { point = "leftforearmpoint", id = 0 }, { point = "leftfootpoint", id = 0 }, { point = "awc", id = 80213 } };
	[7] = { { point = "leftforearmpoint", id = 0 }, { point = "leftfootpoint", id = 0 }, { point = "awc", id = 80213 } };
	[8] = { { point = "leftforearmpoint", id = 0 }, { point = "leftfootpoint", id = 0 }, { point = "awc", id = 80413 } };
	[9] = { { point = "leftforearmpoint", id = 80221 },{ point = "rightforearmpoint", id = 80221 }, { point = "leftfootpoint", id = 80221 }, { point = "rightfootpoint", id = 80221 }, { point = "awc", id = 80223 } };
	[10] = { { point = "leftforearmpoint", id = 80221 },{ point = "rightforearmpoint", id = 80221 }, { point = "leftfootpoint", id = 80221 }, { point = "rightfootpoint", id = 80221 }, { point = "awc", id = 80223 } };
	[11] = { { point = "leftforearmpoint", id = 80221 },{ point = "rightforearmpoint", id = 80221 }, { point = "leftfootpoint", id = 80221 }, { point = "rightfootpoint", id = 80221 }, { point = "awc", id = 80223 } };
	[12] = { { point = "leftforearmpoint", id = 80221 },{ point = "rightforearmpoint", id = 80221 }, { point = "leftfootpoint", id = 80221 }, { point = "rightfootpoint", id = 80221 }, { point = "awc", id = 80223 } };
	[13] = { { point = "leftforearmpoint", id = 80221 },{ point = "rightforearmpoint", id = 80221 }, { point = "leftfootpoint", id = 80221 }, { point = "rightfootpoint", id = 80221 }, { point = "awc", id = 80223 } };
};

_G.SuitByQuality = 
{
	7,8,9, ---SuitBaseConfig中的套装ID 要按顺序 低到高
}

_G.SuitByStrong = 
{
	1,2,3,
}

_G.SuitByStoneLevel = 
{
	10,11,12,13,14
}

_G.SuitByWeapon = 
{
	4,5,6,
}

----装备修炼的套装TIPS
_G.EquipBuildSuitTips = 
{
	Title = "【装备修炼·百炼神兵】<br/>";
	Condition = [[<p align="left"><font  face='黑体,宋体' size='14' color="%s">%s</font></p>]];--激活条件
}

--装备修炼的套装TIPS
_G.EquipBuildSuitTipsCondition = 
{
	[1]=
	{
		szName = "<img src = 'img://Xtb_weapon.png'>装备修炼(1级)",
		szCondition = "激活条件:(%d/12)件装备修炼达到%d级,点击使用%sX%d个【未激活】",
		szEffort = "加成效果：",
	};
	[2]=
	{
		szName = "<img src = 'img://Xtb_weapon.png'>装备修炼(%d级)",
		szCondition = "激活条件:(%d/12)件装备修炼达到%d级,点击使用%sX%d个【已激活】",
		szEffort = "加成效果：",
	};
	[3]=
	{
		szName = "<img src = 'img://Xtb_weapon.png'>装备修炼(%d级)",
		szCondition = "激活条件:(%d/12)件装备修炼达到%d级,点击使用%sX%d个【未激活】",
		szEffort = "加成效果：",
	};
}

--强化套装的检测条件
_G.SuitLevelCondition = 
{
	[1] = 
	{
		dwPosNumber = 12;		--满足的装备位数量
		szName = "<img src = 'img://Xtb_weapon.png'>龙骧神甲(1级)";			--套装名
		szCondition = "激活条件：全身12件装备均强化+7以上";		--条件
		szEffort = "加成效果：<img src = 'img://zb_xfk_shuxing_biaoshi.png'>攻击 + 120<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>防御 + 60<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>生命 + 384<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>内力 + 36";			--效果
	};
	[2] = 
	{
		dwPosNumber = 12;		--满足的装备位数量
		szName = "<br/><img src = 'img://Xtb_weapon.png'>龙骧神甲(2级)";			--套装名
		szCondition = "激活条件：全身12件装备均强化+10以上";		--条件
		szEffort = "加成效果：<img src = 'img://zb_xfk_shuxing_biaoshi.png'>攻击 + 275<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>防御 + 138<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>生命 + 880<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>内力 + 83<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>身法 + 55";			--效果
	};
	[3] = 
	{
		dwPosNumber = 12;	--满足的装备位数量
		szName = "<br/><img src = 'img://Xtb_weapon.png'>龙骧神甲(3级)";			--套装名
		szCondition = "激活条件：全身12件装备均强化+15";		--条件
		szEffort = "加成效果：<img src = 'img://zb_xfk_shuxing_biaoshi.png'>攻击 + 600<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>防御 + 300<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>生命 + 2100<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>内力 + 180<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>身法 + 120<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>攻击 + 5%<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>防御 + 5%";		--效果
	};
}


--强化套装用到的额外文本信息
_G.SuitLevelExtraText = 
{
	Title = "【强化套装·龙骧神甲】<br/>";
	Activation = {
		[0] = "【已激活】";
		[1] = "【未激活%d/%d】";
		[2] = "【极致套装】";
	};
	Prompt = "<font color='#cdc6c4'><br/>温馨提示：<br/>可以通过装备炼制系统对您的装备进行强化<br/>装备强化→获得满强化装备</p></font>";
	Color = {--颜色
		Name = "#dd02dc";--套装名字（1级xxx套装）
		Activation = {--激活状态
			[0] = "#4ae833";--已激活
			[1] = "#278cf1";--未激活
			[2] = "#FF9933";--极致激活
		};
		Condition = {--套装条件
			[0] = "#4ae833";--已激活
			[1] = "#278cf1";--未激活
		};
		Effort = {--加成效果
			[0] = "#039846";--已激活
			[1] = "#9d8e7c";--未激活
		};
	};
	Format = {--格式化配置
		Title = [[<p align="center"><font face='黑体,宋体' size='18' color='#FDF445'>%s</font></p>]];--标题
		Name = [[<p align="left"><font  face='黑体,宋体' size='16' color="%s">%s</font></p>]];--套装名
		Condition = [[<p align="left"><font  face='黑体,宋体' size='14' color="%s">%s	%s</font></p>]];--激活条件
		Effort = [[<p align="left"><font  face='黑体,宋体' size='14' color="%s">%s</font></p>]];--激活效果
		Prompt = [[<p align="left"><font  face='黑体,宋体' size='14'>%s</font></p>]];--温馨提示
		Activation = [[<font face='黑体,宋体' size='14' color="%s">%s</font>]];--激活状态（已激活，未激活）
	};
}

--品质套装的检测条件
_G.SuitQualityCondition = 
{
	[1] = 
	{
		dwPosNumber = 4;		--满足的装备位数量
		szName = "<img src = 'img://Xtb_weapon.png'>绝世奇珍(1级)";			--套装名
		szCondition = "激活条件：全身4件紫色装备";		--条件
		szEffort = "加成效果：<img src = 'img://zb_xfk_shuxing_biaoshi.png'>攻击 + 80<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>防御 + 40<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>生命 + 256<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>内力 + 24";			--效果
	};
	[2] = 
	{
		dwPosNumber = 8;		--满足的装备位数量
		szName = "<br/><img src = 'img://Xtb_weapon.png'>绝世奇珍(2级)";			--套装名
		szCondition = "激活条件：全身8件紫色装备";		--条件
		szEffort = "加成效果：<img src = 'img://zb_xfk_shuxing_biaoshi.png'>攻击 + 180<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>防御 + 90<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>生命 + 576<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>内力 + 54<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>身法 + 36";			--效果
	};
	[3] = 
	{
		dwPosNumber = 12;	--满足的装备位数量
		szName = "<br/><img src = 'img://Xtb_weapon.png'>绝世奇珍(3级)";			--套装名
		szCondition = "激活条件：全身12件紫色装备";		--条件
		szEffort = "加成效果：<img src = 'img://zb_xfk_shuxing_biaoshi.png'>攻击 + 380<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>防御 + 190<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>生命 + 1216<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>内力 + 114<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>身法 + 76<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>闪避率 + 5%<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>暴击率 + 5%";		--效果
	};
}

--品质套装用到的额外文本信息
_G.SuitQualityExtraText = 
{
	Title = "【高品质套装·绝世奇珍】<br/>";
	Activation = {
		[0] = "【已激活】";
		[1] = "【未激活%d/%d】";
		[2] = "【极致套装】";
	};
	Prompt = "<font color='#cdc6c4'><br/>温馨提示：<br/>您可以通过击杀BOSS，副本等途径获得高品质装备</font>";--<font color='#cdc6c4'><br/>温馨提示：<br/>可以通过装备炼制系统对您的装备进行洗炼<br/>洗炼品质→获得高品质装备</font>
	Color = {--颜色
		Name = "#dd02dc";--套装名字（1级xxx套装）
		Activation = {--激活状态
			[0] = "#4ae833";--已激活
			[1] = "#278cf1";--未激活
			[2] = "#FF9933";--极致激活
		};
		Condition = {--套装条件
			[0] = "#4ae833";--已激活
			[1] = "#278cf1";--未激活
		};
		Effort = {--加成效果
			[0] = "#039846";--已激活
			[1] = "#9d8e7c";--未激活
		};
	};
	Format = {--格式化配置
		Title = [[<p align="center"><font face='黑体,宋体' size='18' color='#FDF445'>%s</font></p>]];--标题
		Name = [[<p align="left"><font  face='黑体,宋体' size='16' color="%s">%s</font></p>]];--套装名
		Condition = [[<p align="left"><font  face='黑体,宋体' size='14' color="%s">%s	%s</font></p>]];--激活条件
		Effort = [[<p align="left"><font  face='黑体,宋体' size='14' color="%s">%s</font></p>]];--激活效果
		Prompt = [[<p align="left"><font  face='黑体,宋体' size='14'>%s</font></p>]];--温馨提示
		Activation = [[<font face='黑体,宋体' size='14' color="%s">%s</font>]];--激活状态（已激活，未激活）
	};
}

--宝石套装的检测条件
_G.SuitStoneCondition = 
{
	[1] = 
	{
		dwPosNumber = 12;		--满足的装备位数量
		szName = "<img src = 'img://Xtb_weapon.png'>辉曜宝器(1级)";			--套装名
		szCondition = "12件人物装备满镶嵌3品宝石";		--条件
		szEffort = "加成效果：<img src = 'img://zb_xfk_shuxing_biaoshi.png'>攻击 + 100<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>防御 + 50<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>生命 + 320<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>内力 + 30";			--效果
	};
	[2] = 
	{
		dwPosNumber = 12;		--满足的装备位数量
		szName = "<br/><img src = 'img://Xtb_weapon.png'>辉曜宝器(2级)";			--套装名
		szCondition = "12件人物装备满镶嵌5品宝石";		--条件
		szEffort = "加成效果：<img src = 'img://zb_xfk_shuxing_biaoshi.png'>攻击 + 200<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>防御 + 100<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>生命 + 640<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>内力 + 60<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>身法 + 40";			--效果
	};
	[3] = 
	{
		dwPosNumber = 12;	--满足的装备位数量
		szName = "<br/><img src = 'img://Xtb_weapon.png'>辉曜宝器(3级)";			--套装名
		szCondition = "12件人物装备满镶嵌7品宝石";		--条件
		szEffort = "加成效果：<img src = 'img://zb_xfk_shuxing_biaoshi.png'>攻击 + 420<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>防御 + 210<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>生命 + 1344<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>内力 + 126<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>身法 + 84<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>命中率 + 5%<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>生命 + 5%";		--效果
	};
	[4] = 
	{
		dwPosNumber = 12;	--满足的装备位数量
		szName = "<br/><img src = 'img://Xtb_weapon.png'>辉曜宝器(4级)";			--套装名
		szCondition = "12件人物装备满镶嵌9品宝石";		--条件
		szEffort = "加成效果：<img src = 'img://zb_xfk_shuxing_biaoshi.png'>攻击 + 1200<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>防御 + 600<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>生命 + 5000<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>内力 + 300<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>身法 + 500<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>命中率 + 8%<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>生命 + 8%<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>暴击抵抗 + 1000<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>伤害减免 + 1500";		--效果 
	};
	[5] = 
	{
		dwPosNumber = 12;	--满足的装备位数量
		szName = "<br/><img src = 'img://Xtb_weapon.png'>辉曜宝器(5级)";			--套装名
		szCondition = "12件人物装备满镶嵌12品宝石";		--条件
		szEffort = "加成效果：<img src = 'img://zb_xfk_shuxing_biaoshi.png'>攻击 + 2300<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>防御 + 1100<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>生命 + 11000<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>内力 + 500<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>身法 + 1200<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>命中率 + 10%<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>生命 + 10%<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>暴击抵抗 + 1700<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>伤害减免 + 2100";		--效果 
	};
}
--宝石套装用到的额外文本信息
_G.SuitStoneExtraText = {
	Title = "【宝石套装·辉曜宝器】<br/>";
	Activation = {
		[0] = "【已激活】";
		[1] = "【未激活%d/%d】";
		[2] = "【极致套装】";
	};
	Prompt = "<br/><font color='#cdc6c4'>温馨提示：<br/>合成后的宝石可免费镶嵌到装备中或者从装备中取出<br/>镶嵌宝石品级越高，加成属性越高<font/>";
	Color = {--颜色
		Name = "#dd02dc";--套装名字（1级xxx套装）
		Activation = {--激活状态
			[0] = "#4ae833";--已激活
			[1] = "#278cf1";--未激活
			[2] = "#FF9933";--极致激活
		};
		Condition = {--套装条件
			[0] = "#4ae833";--已激活
			[1] = "#278cf1";--未激活
		};
		Effort = {--加成效果
			[0] = "#039846";--已激活
			[1] = "#9d8e7c";--未激活
		};
	};
	Format = {--格式化配置
		Title = [[<p align="center"><font face='黑体,宋体' size='18' color='#FDF445'>%s</font></p>]];--标题
		Name = [[<p align="left"><font  face='黑体,宋体' size='16' color="%s">%s</font></p>]];--套装名
		Condition = [[<p align="left"><font  face='黑体,宋体' size='14' color="%s">%s	%s</font></p>]];--激活条件
		Effort = [[<p align="left"><font  face='黑体,宋体' size='14' color="%s">%s</font></p>]];--激活效果
		Prompt = [[<p align="left"><font  face='黑体,宋体' size='14'>%s</font></p>]];--温馨提示
		Activation = [[<font face='黑体,宋体' size='14' color="%s">%s</font>]];--激活状态（已激活，未激活）
	};
}


--武器套装的检测条件
_G.SuitWeaponCondition = 
{
	[1] = 
	{
		dwPosNumber = 1;		--满足的装备位数量
		szName = "<img src = 'img://Xtb_weapon.png'>乾戎天兵(1级)";			--套装名
		szCondition = "激活条件：装备武器强化+7以上";		--条件
		szEffort = "加成效果：微星开刃，流光森然";			--效果
	};
	[2] = 
	{
		dwPosNumber = 1;		--满足的装备位数量
		szName = "<br/><img src = 'img://Xtb_weapon.png'>乾戎天兵(2级)";			--套装名
		szCondition = "激活条件：装备武器强化+10以上";		--条件
		szEffort = "加成效果：引雷拂电，壮气惊云";			--效果
	};
	[3] = 
	{
		dwPosNumber = 1;	--满足的装备位数量
		szName = "<br/><img src = 'img://Xtb_weapon.png'>乾戎天兵(3级)";			--套装名
		szCondition = "激活条件：装备武器强化+15";		--条件
		szEffort = "加成效果：灼辉凌日，百神临观";		--效果
	};
}
--武器套装用到的额外文本信息
_G.SuitWeaponExtraText = {
	Title = "【武器强化·乾戎天兵】<br/>";
	Activation = {
		[0] = "【已激活】";
		[1] = "【未激活%d/%d】";
		[2] = "【极致套装】";
	};
	Prompt = "<font color='#cdc6c4'><br/>温馨提示：<br/>可以通过装备炼制系统对您的武器进行强化<br/>装备强化→获得满强化武器</p></font>";
	Color = {--颜色
		Name = "#dd02dc";--套装名字（1级xxx套装）
		Activation = {--激活状态
			[0] = "#4ae833";--已激活
			[1] = "#278cf1";--未激活
			[2] = "#FF9933";--极致激活
		};
		Condition = {--套装条件
			[0] = "#4ae833";--已激活
			[1] = "#278cf1";--未激活
		};
		Effort = {--加成效果
			[0] = "#039846";--已激活
			[1] = "#9d8e7c";--未激活
		};
	};
	Format = {--格式化配置
		Title = [[<p align="center"><font face='黑体,宋体' size='18' color='#FDF445'>%s</font></p>]];--标题
		Name = [[<p align="left"><font  face='黑体,宋体' size='16' color="%s">%s</font></p>]];--套装名
		Condition = [[<p align="left"><font  face='黑体,宋体' size='14' color="%s">%s	%s</font></p>]];--激活条件
		Effort = [[<p align="left"><font  face='黑体,宋体' size='14' color="%s">%s</font></p>]];--激活效果
		Prompt = [[<p align="left"><font  face='黑体,宋体' size='14'>%s</font></p>]];--温馨提示
		Activation = [[<font face='黑体,宋体' size='14' color="%s">%s</font>]];--激活状态（已激活，未激活）
	};
}