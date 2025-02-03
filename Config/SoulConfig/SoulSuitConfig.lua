--战魂套装配置

--套装基础配置
_G.SoulSuitBaseConfig = 
{
	[1] = 
	{
		dwID = 1;	--套装id
		dwCond = {1};	--条件SuitConditionConfig表
		dwAttr = 1;	--属性SuitAttrConfig
		dwActiveCost = 30;
	};
	
	[2] = 
	{
		dwID = 2;	--套装id
		dwCond = {2};	--条件SuitConditionConfig表
		dwAttr = 2;	--属性SuitAttrConfig
		dwActiveCost = 60;
	};
	
	[3] = 
	{
		dwID = 3;	--套装id
		dwCond = {3};	--条件SuitConditionConfig表
		dwAttr = 3;	--属性SuitAttrConfig
		dwActiveCost = 120;
	};
	
	[4] = 
	{
		dwID = 4;	--套装id
		dwCond = {4};	--条件SuitConditionConfig表
		dwAttr = 4;	--属性SuitAttrConfig
		dwActiveCost = 240;
	};
	
	[5] = 
	{
		dwID = 5;	--套装id
		dwCond = {9,5};	--条件SuitConditionConfig表
		dwAttr = 5;	--属性SuitAttrConfig
		dwActiveCost = 30;
	};
	
	[6] = 
	{
		dwID = 6;	--套装id
		dwCond = {9,6};	--条件SuitConditionConfig表
		dwAttr = 6;	--属性SuitAttrConfig
		dwActiveCost = 80;
	};
	
	[7] = 
	{
		dwID = 7;	--套装id
		dwCond = {9,7};	--条件SuitConditionConfig表
		dwAttr = 7;	--属性SuitAttrConfig
		dwActiveCost = 180;
	};
	
	[8] = 
	{
		dwID = 8;	--套装id
		dwCond = {9,8};	--条件SuitConditionConfig表
		dwAttr = 8;	--属性SuitAttrConfig
		dwActiveCost = 380;
	};
}

--套装的检测条件
local SuitConditionConfig = 
{
	[1] = 
	{
		dwPosNeed = 6;---一共需要多少个装备位置满足条件
		szCheckName = "dwQuality";----需要检测的变量名字 dwQuality dwLevel
		dwValue = 13;---需要多少级
		dwCheckMode = 0;--检测模式，0或者没有：大于等于；1，等于
	};
	[2] = 
	{
		dwPosNeed = 8;---一共需要多少个装备位置满足条件
		szCheckName = "dwQuality";----需要检测的变量名字 dwQuality dwLevel
		dwValue = 13;---需要多少级
		dwCheckMode = 0;--检测模式，0或者没有：大于等于；1，等于
	};
	[3] = 
	{
		dwPosNeed = 6;---一共需要多少个装备位置满足条件
		szCheckName = "dwQuality";----需要检测的变量名字 dwQuality dwLevel
		dwValue = 14;---需要多少级
		dwCheckMode = 0;--检测模式，0或者没有：大于等于；1，等于
	};
	[4] = 
	{
		dwPosNeed = 8;---一共需要多少个装备位置满足条件
		szCheckName = "dwQuality";----需要检测的变量名字 dwQuality dwLevel
		dwValue = 14;---需要多少级
		dwCheckMode = 0;--检测模式，0或者没有：大于等于；1，等于
	};
	[5] = 
	{
		dwPosNeed = 6;---一共需要多少个装备位置满足条件
		szCheckName = "dwLevel";----需要检测的变量名字 dwQuality dwLevel
		dwValue = 3;---需要多少级
	};
	[6] = 
	{
		dwPosNeed = 6;---一共需要多少个装备位置满足条件
		szCheckName = "dwLevel";----需要检测的变量名字 dwQuality dwLevel
		dwValue = 6;---需要多少级
	};
	[7] = 
	{
		dwPosNeed = 6;---一共需要多少个装备位置满足条件
		szCheckName = "dwLevel";----需要检测的变量名字 dwQuality dwLevel
		dwValue = 8;---需要多少级
	};
	[8] = 
	{
		dwPosNeed = 6;---一共需要多少个装备位置满足条件
		szCheckName = "dwLevel";----需要检测的变量名字 dwQuality dwLevel
		dwValue = 10;---需要多少级
	};
	[9] = 
	{
		dwPosNeed = 6;---一共需要多少个装备位置满足条件
		szCheckName = "dwQuality";----需要检测的变量名字 dwQuality dwLevel
		dwValue = 13;---需要多少级
	};
}

--套装的属性
local SuitAttrConfig = 
{
	[1] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = nil;
		attrAdv.dwAttack = 500;
		attrAdv.dwDefense = 250;
		attrAdv.dwHPMax = 2500; 
		attrAdv.dwPoJiaValue = 50;
		attrAdv.dwPoJiaDiKang = 60;
		attrAdv.strSuitName = "传世套装·显名";
		attrAdv.strNeedDesc = "传世战魂或神威战魂";
		return attrAdv,attrPer;
	end;
	[2] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = nil;
		attrAdv.dwAttack = 700;
		attrAdv.dwDefense = 350;
		attrAdv.dwHPMax = 3500;
		attrAdv.dwPoJiaValue = 70;
		attrAdv.dwPoJiaDiKang = 84;
		attrAdv.strSuitName = "传世套装·煊赫";
		attrAdv.strNeedDesc = "传世战魂或神威战魂";
		return attrAdv,attrPer;
	end;
	[3] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = nil;
		attrAdv.dwAttack = 1000;
		attrAdv.dwDefense = 500;
		attrAdv.dwHPMax = 5000;
		attrAdv.dwPoJiaValue = 100;
		attrAdv.dwPoJiaDiKang = 120;
		attrAdv.strSuitName = "神威套装·玄魄";
		attrAdv.strNeedDesc = "神威战魂";
		return attrAdv,attrPer;
	end;
	[4] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = nil;
		attrAdv.dwAttack = 1400;
		attrAdv.dwDefense = 700;
		attrAdv.dwHPMax = 7000;
		attrAdv.dwPoJiaValue = 140;
		attrAdv.dwPoJiaDiKang = 168;
		attrAdv.strSuitName = "神威套装·天冲";
		attrAdv.strNeedDesc = "神威战魂";
		return attrAdv,attrPer;
	end;
	[5] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = nil;
		attrAdv.dwAttack = 600;
		attrAdv.dwDefense = 300;
		attrAdv.dwHPMax = 3000;
		attrAdv.dwPoJiaValue = 60;
		attrAdv.dwPoJiaDiKang = 72;
		attrAdv.strSuitName = "魂阶套装·承灵";
		attrAdv.strNeedDesc = "装备传世或神威战魂等级达到Lv.3";
		return attrAdv,attrPer;
	end;
	[6] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = nil;
		attrAdv.dwAttack = 900;
		attrAdv.dwDefense = 450;
		attrAdv.dwHPMax = 4500; 
		attrAdv.dwPoJiaValue = 90;
		attrAdv.dwPoJiaDiKang = 108;
		attrAdv.strSuitName = "魂阶套装·魁星";
		attrAdv.strNeedDesc = "装备传世或神威战魂等级达到Lv.6";
		return attrAdv,attrPer;
	end;
	[7] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = nil;
		attrAdv.dwAttack = 1400;
		attrAdv.dwDefense = 700;
		attrAdv.dwHPMax = 7000; 
		attrAdv.dwPoJiaValue = 140;
		attrAdv.dwPoJiaDiKang = 168;
		attrAdv.strSuitName = "魂阶套装·本神";
		attrAdv.strNeedDesc = "装备传世或神威战魂等级达到Lv.8";
		return attrAdv,attrPer;
	end;
	[8] = function()
		local attrAdv = SSingleAttrChange:new();
		local attrPer = nil;
		attrAdv.dwAttack = 2200;
		attrAdv.dwDefense = 1100;
		attrAdv.dwHPMax = 11000;
		attrAdv.dwPoJiaValue = 220;
		attrAdv.dwPoJiaDiKang = 264;
		attrAdv.strSuitName = "魂阶套装·太渊";
		attrAdv.strNeedDesc = "装备传世或神威战魂等级达到Lv.10";
		return attrAdv,attrPer;
	end;

}

--单个套装的结构
local function NewSuitSingle()
	local obj = {};
	obj.dwActNumber = 0;
	obj.isActive = 0;
	obj.dwPosNeed = 0;
	
	
	return obj;
end;

local function GetCondition(dwSuitID)
	local tbSuitInfo = SoulSuitBaseConfig[dwSuitID];
	if not tbSuitInfo then
		return nil;
	end
	
	local tbCondList = {};
	for k,v in pairs(tbSuitInfo.dwCond)do
		table.insert(tbCondList,SuitConditionConfig[v]);
	end
	
	return tbCondList;
end

--是否满足套装条件
local function IsCheckOver(tbCond,dwPosID,tbPosInfo)
	local dwVal = tbPosInfo[tbCond.szCheckName];
	if not dwVal then
		return nil;
	end
	
	local dwMode = tbCond.dwCheckMode;
	if not dwMode then
		dwMode = 0;
	end
	
	if dwMode == 0 then
		if dwVal < tbCond.dwValue then
			return nil;
		else
			return true;
		end
	elseif dwMode == 1 then
		if dwVal == tbCond.dwValue then
			return true;
		else
			return nil;
		end
	end
	
	return true;
end;


--把已装备战魂数据转化成装备位数据
function _G.FunSoulEquipPosInfoMaker(tbSoulList)
	local tbPosInfo = {};
	
	for i = SoulConfig.dwMountBaseLevel,SoulConfig.dwMountUpLevel do
		tbPosInfo[i] = {};
		for k = 1,10 do 
			tbPosInfo[i][k] = {};
		end
	end
	
	for n,objSoul in pairs(tbSoulList)do
		local dwHolderType,dwPos = objSoul:GetPosInfo();
		
		if dwHolderType == SoulHolderType.Equip then
			local dwRank,dwWearPos = SoulFunction.FunGetEquipHolderPosRank(dwPos);
			
			if tbPosInfo[dwRank] then
				local tbSoulInfo = {};
				tbSoulInfo.dwQuality = objSoul:GetQuality();
				tbSoulInfo.dwLevel = objSoul:GetLevel();
				
				tbPosInfo[dwRank][dwWearPos] = tbSoulInfo;
			end
		end
	end
	
	return tbPosInfo;
end;

local function CheckSingleRand(tbPosInfo)
	local tbSuitInfo = {};
	for n,v in pairs(SoulSuitBaseConfig)do
		tbSuitInfo[n] = NewSuitSingle();
	end
	
	for pos,tb in pairs(tbPosInfo)do
		for id,tbInfo in pairs(tbSuitInfo)do
			local tbCondList = GetCondition(id);
			if tbCondList then
				local isCheckOK = true;
				for n,tbCond in ipairs(tbCondList) do
					tbInfo.dwPosNeed = tbCond.dwPosNeed;
					if not IsCheckOver(tbCond,pos,tb) then
						isCheckOK = false;
					end
				end
				
				if isCheckOK then
					tbInfo.dwActNumber = tbInfo.dwActNumber + 1;
					if tbInfo.isActive == 0 then
						if tbInfo.dwActNumber >= tbInfo.dwPosNeed then
							tbInfo.isActive = 1;
						end
					end
				end
			end
		end
	end
	
	return tbSuitInfo;
end;

--套装检测函数
--参数：pos--{坐骑阶数 = {强化等级，品质，宝石最低品阶}}
--返回：suitid--{坐骑阶数 = {NewSuitSingle}}
function _G.FunSoulSuitCheck(tbPosInfo)
	local tbSuitInfo = {};
	
	for i = SoulConfig.dwMountBaseLevel,SoulConfig.dwMountUpLevel do
		tbSuitInfo[i] = {};
	end
	
	for dwRank,tbSoulList in pairs(tbPosInfo)do
		tbSuitInfo[dwRank] = CheckSingleRand(tbSoulList);
	end
	
	return tbSuitInfo;
end;

--获取战魂套装的属性
function _G.FunGetSoulSuitAttr(dwSuitID)
	local tbSuitInfo = SoulSuitBaseConfig[dwSuitID];
	if not tbSuitInfo then
		return nil;
	end
	
	local funcAttr = SuitAttrConfig[tbSuitInfo.dwAttr];
	
	if not funcAttr then
		return;
	end
	
	return funcAttr();
end;


--品质按钮中的套装
_G.SoulSuitInQualityBtn = 
{
	1,2,3,4
}

--等级按钮中的套装
_G.SoulSuitInStrongBtn = 
{
	5,6,7,8
}





-------------------------------------------------------------------------------
--激活属性的配置

_G.SoulSuitActiveItemEnum = 2500321;
_G.SoulSuitActiveItemName = "<font color='#b400cf'>天灵启神丹</font>";

_G.SoulSuitConfigC = 
{
	strSuitActiveTips = "<font color='#ffffff'>激活需要消耗道具 %s %d个，是否激活套装属性？</font>";
	strNoSuitActivied = "战魂不满足套装条件，无法激活";
	strNotEnoughItem = "激活道具不足";
	strAlreadyActivied = "已经激活了";
	strSuitEffectSoul = "lz_nq_hq01";
	strSuitEffectLevel= "lz_nq_hq03";
	
	CreateSuitObject = function(objSuit,suitid,dwMountGrade)
		local objSuitAddrCfg = SuitAttrConfig[SoulSuitBaseConfig[suitid].dwAttr]();
		objSuit.suitid = suitid;
		objSuit.dwAttack = objSuitAddrCfg.dwAttack;
		objSuit.dwDefense = objSuitAddrCfg.dwDefense;
		objSuit.dwHPMax = objSuitAddrCfg.dwHPMax;
		objSuit.dwPoJiaValue = objSuitAddrCfg.dwPoJiaValue;
		objSuit.dwPoJiaDiKang = objSuitAddrCfg.dwPoJiaDiKang;
		objSuit.strSuitName = objSuitAddrCfg.strSuitName;
		objSuit.strNeedDesc = objSuitAddrCfg.strNeedDesc;
		if dwMountGrade then
			objSuit.bAttrActive = CUISoulMount:IsSuitActiveByMount(objSuit.suitid,dwMountGrade);
		else
			objSuit.bAttrActive = CUISoulMount:IsSuitActive(objSuit.suitid);
		end
		objSuit.dwActiveCost = SoulSuitBaseConfig[suitid].dwActiveCost;
		
		return objSuit;
	end;

	GetSuitSoulTips = function(bSouls)
		-- objSuit.dwActNumber = 0;
		-- objSuit.isActive = 0;
		-- objSuit.dwPosNeed = 0;
		
		local tbSuits=CUISoulMount:GetCurrentSuits(bSouls);
		
		local tbNotActive = {tbSuits[2],tbSuits[3],tbSuits[4]};
		local objSuit = tbSuits[1];
		for i=1, #tbSuits do
			local obj = tbSuits[i]
			if obj.isActive == 1 then
				objSuit= obj;
				tbNotActive = {};
				for index=1,#tbSuits do
					if index ~= i then
						table.insert(tbNotActive,tbSuits[index]);
					end
				end
			end
		end

		
		-- local strTitle = string.format("<p align='center'><font color='#fffc00' size = '22' >【%s】</font></p>",objSuit.strSuitName);
		local strTitle = "";
		local strGrade = "";
		if bSouls then
			--如果是按战魂品质
			strTitle = "<p align='center'><font color='#fffc00' size = '22' >【战魂品质套装】</font></p>"
			-- strGrade = string.format("<p><font color='#9c00b8'>套装类型:</font><font color='#ffffff'>品质套装</font></p>");
		else
			--按战魂等级
			strTitle = "<p align='center'><font color='#fffc00' size = '22' >【战魂等级套装】</font></p>"
			-- strGrade = string.format("<p><font color='#9c00b8'>套装类型:</font><font color='#ffffff'>等级套装</font></p>");
		end
		local tempid = objSuit.suitid;
		local dwCurCount = objSuit.dwActNumber;
		local dwMaxCount = objSuit.dwPosNeed;
		if objSuit.isActive == 1 then
			dwCurCount = dwMaxCount;
		end
		
		-- local strCondition = "<p><font color='#9c00b8'>激活条件</font></p>";
		-- local strNeedCount = "";
		-- if objSuit.isActive == 0 then
			-- strNeedCount = string.format("<p><img src = 'img://zb_xfk_shuxing_biaoshi.png' /><font color='#5a5a5a'>%s(%d/%d)</font></p>",objSuit.strNeedDesc,dwCurCount,dwMaxCount);
		-- elseif objSuit.isActive == 1 then
			-- strNeedCount = string.format("<p><img src = 'img://zb_xfk_shuxing_biaoshi.png' /><font color='#ffffff'>%s(%d/%d)</font></p>",objSuit.strNeedDesc,dwCurCount,dwMaxCount);
		-- end
		local line="<p><img src = 'img://PartingLine.png'> </p>";  --
		local strNotActive = "";
		local strAttack = "";
		local strDefence = "";
		local strShenfa = "";
		local strBaoji = "";
		local strBaoji2 = "";
		
		local tab = 
		{
			dwAttack = 0;
			dwDefense = 0;
			dwHPMax = 0;
			dwPoJiaValue = 0;
			dwPoJiaDiKang = 0;
		}
		for i, objSuit in pairs(tbSuits) do
			if objSuit.isActive == 1 then
				if objSuit.bAttrActive == 1 then
					tab.dwAttack = tab.dwAttack + objSuit.dwAttack;
					tab.dwDefense = tab.dwDefense + objSuit.dwDefense;
					tab.dwHPMax = tab.dwHPMax + objSuit.dwHPMax;
					tab.dwPoJiaValue = tab.dwPoJiaValue + objSuit.dwPoJiaValue;
					tab.dwPoJiaDiKang = tab.dwPoJiaDiKang + objSuit.dwPoJiaDiKang;
				end
			end
		end;
		strNotActive="<p><font color='#007eff' size = '16' >当前为您总加成属性</font></p>";
		if objSuit.isActive == 0 then
				strNotActive = strNotActive .. "<p><font color='#ff0000' size = '16' >(没有满足条件的套装)</font></p>";
		elseif objSuit.isActive == 1 then
			if objSuit.bAttrActive == 0 then
				strNotActive = strNotActive .. "<p><font color='#ff0000' size = '16' >(点击解封套装提升属性)</font></p>";
			end
		end
		strAttack = string.format("<p>攻击 + %d</p>",tab.dwAttack);
		strDefence = string.format("<p>防御 + %d</p>",tab.dwDefense);
		strShenfa = string.format("<p>生命 + %d</p>",tab.dwHPMax);
		strBaoji = string.format("<p>破甲伤害 + %d</p>",tab.dwPoJiaValue );
		strBaoji2 = string.format("<p>伤害抵御 + %d</p>",tab.dwPoJiaDiKang );
		-- if objSuit.isActive == 0 then   -- 套装未激活
			-- if objSuit.bAttrActive == 0 then 
				-- strNotActive="<p><font color='#5a5a5a' size = '16' >增加属性(封印)</font></p><p><font color='#ff0000'>(套装条件满足才可解封套装属性)</font></p>";
				-- strAttack = string.format("<p><font color='#5a5a5a'>攻击 + %d</font></p>",tab.dwAttack);
				-- strDefence = string.format("<p><font color='#5a5a5a'>防御 + %d</font></p>",tab.dwDefense);
				-- strShenfa = string.format("<p><font color='#5a5a5a'>生命 + %d</font></p>",tab.dwHPMax);
				-- strBaoji = string.format("<p><font color='#5a5a5a'>破甲伤害 + %d</font></p>",tab.dwPoJiaValue );
				-- strBaoji2 = string.format("<p><font color='#5a5a5a'>伤害抵御 + %d</font></p>",tab.dwPoJiaDiKang );
			-- elseif objSuit.bAttrActive == 1 then
				-- strNotActive="<p><font color='#5a5a5a' size = '16' >增加属性</font></p>";
				-- strAttack = string.format("<p><font color='#5a5a5a'>攻击 + %d</font></p>",tab.dwAttack);
				-- strDefence = string.format("<p><font color='#5a5a5a'>防御 + %d</font></p>",tab.dwDefense);
				-- strShenfa = string.format("<p><font color='#5a5a5a'>生命 + %d</font></p>",tab.dwHPMax);
				-- strBaoji = string.format("<p><font color='#5a5a5a'>破甲伤害 + %d</font></p>",tab.dwPoJiaValue);
				-- strBaoji2 = string.format("<p><font color='#5a5a5a'>伤害抵御 + %d</font></p>",tab.dwPoJiaDiKang);
			-- end
		-- elseif objSuit.isActive ==1 then -- 套装已激活
			-- if objSuit.bAttrActive == 0 then
				-- strNotActive="<p><font color='#ff0000' size = '16' >增加属性(封印)</font></p><p>(点击解封套装属性)</p>";
				-- strAttack = string.format("<p><font color='#5a5a5a'>攻击 + %d</font></p>",tab.dwAttack);
				-- strDefence = string.format("<p><font color='#5a5a5a'>防御 + %d</font></p>",tab.dwDefense);
				-- strShenfa = string.format("<p><font color='#5a5a5a'>生命 + %d</font></p>",tab.dwHPMax);
				-- strBaoji = string.format("<p><font color='#5a5a5a'>破甲伤害 + %d</font></p>",tab.dwPoJiaValue);
				-- strBaoji2 = string.format("<p><font color='#5a5a5a'>伤害抵御 + %d</font></p>",tab.dwPoJiaDiKang);
			-- elseif objSuit.bAttrActive == 1 then
				-- strNotActive="<p><font color='#007eff' size = '16' >增加属性</font></p>";
				-- strAttack = string.format("<p>攻击 + %d</p>",tab.dwAttack);
				-- strDefence = string.format("<p>防御 + %d</p>",tab.dwDefense);
				-- strShenfa = string.format("<p>生命 + %d</p>",tab.dwHPMax);
				-- strBaoji = string.format("<p>破甲伤害 + %d</p>",tab.dwPoJiaValue);
				-- strBaoji2 = string.format("<p>伤害抵御 + %d</p>",tab.dwPoJiaDiKang);
			-- end
		-- end

		local strGaoJie = "<p><font color='#007eff' size = '16' >您已激活以下套装</font></p><p><font color='#9c00b8'>激活条件</font></p>";
		local tishi = "<p><font color='#fffc00' >小提示：</font><font color='#ffffff' >激活高级套装属性后将自动激活低阶套装</font></p>";
		
		local strNotActiveNames = "";
		for i, objSuit in pairs(tbSuits) do
			if objSuit.isActive == 0 then
				if objSuit.bAttrActive == 0 then
					strNotActiveNames=strNotActiveNames..string.format("<p><font color='#5a5a5a'>【%s】</font></p><p><img src = 'img://zb_xfk_shuxing_biaoshi.png' /><font color='#5a5a5a'>%s(%d/%d)</font><font color='#ff0000'>【封印】</font></p>",objSuit.strSuitName,objSuit.strNeedDesc,objSuit.dwActNumber,objSuit.dwPosNeed);
					-- strNotActiveNames = strNotActiveNames..string.format("<p><font color='#5a5a5a'>攻击 + %d</font></p>",objSuit.dwAttack);
					-- strNotActiveNames = strNotActiveNames..string.format("<p><font color='#5a5a5a'>防御 + %d</font></p>",objSuit.dwDefense);
					-- strNotActiveNames = strNotActiveNames..string.format("<p><font color='#5a5a5a'>生命 + %d</font></p>",objSuit.dwHPMax);
					-- strNotActiveNames = strNotActiveNames..string.format("<p><font color='#5a5a5a'>破甲伤害 + %d</font></p>",objSuit.dwPoJiaValue);
					-- strNotActiveNames = strNotActiveNames..string.format("<p><font color='#5a5a5a'>伤害抵御 + %d</font></p>",objSuit.dwPoJiaDiKang);
				elseif objSuit.bAttrActive == 1 then
					strNotActiveNames=strNotActiveNames..string.format("<p><font color='#5a5a5a'>【%s】</font></p><p><img src = 'img://zb_xfk_shuxing_biaoshi.png' /><font color='#5a5a5a'>%s(%d/%d)</font><font color='#ff0000'>【未激活】</font></p>",objSuit.strSuitName,objSuit.strNeedDesc,objSuit.dwActNumber,objSuit.dwPosNeed);
					-- strNotActiveNames = strNotActiveNames..string.format("<p><font color='#5a5a5a'>攻击 + %d</font></p>",objSuit.dwAttack);
					-- strNotActiveNames = strNotActiveNames..string.format("<p><font color='#5a5a5a'>防御 + %d</font></p>",objSuit.dwDefense);
					-- strNotActiveNames = strNotActiveNames..string.format("<p><font color='#5a5a5a'>生命 + %d</font></p>",objSuit.dwHPMax);
					-- strNotActiveNames = strNotActiveNames..string.format("<p><font color='#5a5a5a'>破甲伤害 + %d</font></p>",objSuit.dwPoJiaValue);
					-- strNotActiveNames = strNotActiveNames..string.format("<p><font color='#5a5a5a'>伤害抵御 + %d</font></p>",objSuit.dwPoJiaDiKang);
				end
			elseif objSuit.isActive == 1 then
				if objSuit.bAttrActive == 0 then
					strNotActiveNames=strNotActiveNames..string.format("<p><font color='#fffc00'>【%s】</font></p><p><img src = 'img://zb_xfk_shuxing_biaoshi.png' /><font color='#0078ff'>%s(%d/%d)</font><font color='#ff0000'>【封印】</font></p>",objSuit.strSuitName,objSuit.strNeedDesc,objSuit.dwPosNeed,objSuit.dwPosNeed);
					-- strNotActiveNames = strNotActiveNames..string.format("<p><font color='#5a5a5a'>攻击 + %d</font></p>",objSuit.dwAttack);
					-- strNotActiveNames = strNotActiveNames..string.format("<p><font color='#5a5a5a'>防御 + %d</font></p>",objSuit.dwDefense);
					-- strNotActiveNames = strNotActiveNames..string.format("<p><font color='#5a5a5a'>生命 + %d</font></p>",objSuit.dwHPMax);
					-- strNotActiveNames = strNotActiveNames..string.format("<p><font color='#5a5a5a'>破甲伤害 + %d</font></p>",objSuit.dwPoJiaValue);
					-- strNotActiveNames = strNotActiveNames..string.format("<p><font color='#5a5a5a'>伤害抵御 + %d</font></p>",objSuit.dwPoJiaDiKang);
				elseif objSuit.bAttrActive == 1 then
					strNotActiveNames=strNotActiveNames..string.format("<p><font color='#fffc00'>【%s】</font></p><p><img src = 'img://zb_xfk_shuxing_biaoshi.png' /><font color='#0078ff'>%s(%d/%d)</font><font color='#00ff00'>【已加成】</font></p>",objSuit.strSuitName,objSuit.strNeedDesc,objSuit.dwPosNeed,objSuit.dwPosNeed);
					strNotActiveNames = strNotActiveNames..string.format("<p><font color='#0dc92c'>攻击 + %d</font></p>",objSuit.dwAttack);
					strNotActiveNames = strNotActiveNames..string.format("<p><font color='#0dc92c'>防御 + %d</font></p>",objSuit.dwDefense);
					strNotActiveNames = strNotActiveNames..string.format("<p><font color='#0dc92c'>生命 + %d</font></p>",objSuit.dwHPMax);
					strNotActiveNames = strNotActiveNames..string.format("<p><font color='#0dc92c'>破甲伤害 + %d</font></p>",objSuit.dwPoJiaValue);
					strNotActiveNames = strNotActiveNames..string.format("<p><font color='#0dc92c'>伤害抵御 + %d</font></p>",objSuit.dwPoJiaDiKang);
				end			
			end
			
				
			
			
			-- if objSuit.isActive == 1 then
				-- strNotActiveNames=strNotActiveNames..string.format("<p><font color='#ffffff'>【%s】</font></p><p><img src = 'img://zb_xfk_shuxing_biaoshi.png' /><font color='#ffffff'>%s(%d/%d)</font></p>",objSuit.strSuitName,objSuit.strNeedDesc,objSuit.dwPosNeed,objSuit.dwPosNeed);
			-- elseif objSuit.isActive == 0 then
				-- strNotActiveNames=strNotActiveNames..string.format("<p><font color='#5a5a5a'>【%s】</font></p><p><img src = 'img://zb_xfk_shuxing_biaoshi.png' /><font color='#5a5a5a'>%s(%d/%d)</font></p>",objSuit.strSuitName,objSuit.strNeedDesc,objSuit.dwActNumber,objSuit.dwPosNeed);
			-- end
		end
		-- strCondition..strNeedCount..
		return strTitle..line..strNotActive..strAttack..strDefence..strShenfa..strBaoji..strBaoji2..line..strGaoJie..strNotActiveNames..line..tishi;
		-- return strTitle..strGrade..line..strNotActive..strAttack..strDefence..strShenfa..strBaoji..strBaoji2..line..strGaoJie..strNotActiveNames..line..tishi;
	end;
	
}
