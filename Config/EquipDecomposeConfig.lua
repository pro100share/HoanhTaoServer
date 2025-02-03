local data = {
	--品质

	--[0] = {[1] = {4100420,1,1001};[2] = {4100420,2,2001};[3] = {4100420,3,3001};[4] = {4100420,4,4001};[5] = {4100420,5,5001};};
	--[1] = {[1] = {4100421,1,1002};[2] = {4100421,2,2002};[3] = {4100421,3,3002};[4] = {4100421,4,4002};[5] = {4100421,5,5002};};
	--[2] = {[1] = {4100422,1,1003};[2] = {4100422,2,2003};[3] = {4100422,3,3003};[4] = {4100422,4,4003};[5] = {4100422,5,5003};};
	[3] = {[1] = {4100420,1,1,0};[2] = {4100420,1,2,0};[3] = {4100420,2,3,0};[4] = {4100420,3,6,0};[5] = {4100420,4,7,0};[6] = {4100420,5,8,0};[7] = {4100420,6,9,0};};
};


_G.EquipDecomposeConfig = {
	Explanation = "1.分解<font color='#e082da'>紫色装备</font>可以获得<font color='#4fd388'>紫钧元</font>。<br/>2.分解已绑定的<font color='#e082da'>紫色装备</font>只能得到<font color='#4fd388'>绑定的紫钧元</font><br/>3.分解高阶<font color='#e082da'>紫色装备</font>可获得更多的<font color='#4fd388'>紫钧元</font>";
	-- 强化等级多少以上(包含)弹窗提示
	CautionStrongLevel = 5;
	-- 可分解品质配置
	QualityList = {
		--_G.enQualityType.eNormal,	--普通
		--_G.enQualityType.eGreen,	--绿色
		--_G.enQualityType.eBlue,		--蓝色
		_G.enQualityType.ePink,		--紫色
		--_G.enQualityType.eGold,		--金色
	};
	-- 可分解装备位置配置
	WearposList = {
		_G.enItemWearPos.eWeapon,		--武器
		_G.enItemWearPos.eCloth,		--衣服
		_G.enItemWearPos.eLeg,			--护腿
		_G.enItemWearPos.eGloves,		--护手
		_G.enItemWearPos.eBelt,			--腰带
		_G.enItemWearPos.eHead,			--头饰
		_G.enItemWearPos.eShoes,		--鞋子
		_G.enItemWearPos.eCloak,		--披风
		_G.enItemWearPos.eNecklace,		--项链
		_G.enItemWearPos.eRing,			--戒指
		_G.enItemWearPos.eBracelet,		--手镯
		_G.enItemWearPos.ePendant,		--腰坠
		_G.enItemWearPos.eMount1,       --坐骑装备鞍具
		_G.enItemWearPos.eMount2,       --坐骑装备缰绳
		_G.enItemWearPos.eMount3,       --坐骑装备蹬具
		_G.enItemWearPos.eMount4,       --坐骑装备蹄铁
	};
	
	IsCanDecompose = function(nQuality, nPos)
		local result1 = false;
		local result2 = false;
		
		for k, v in pairs(_G.EquipDecomposeConfig.QualityList) do 
			if nQuality == v then
				result1 = true;
				break;
			end;
		end;
		for k, v in pairs(_G.EquipDecomposeConfig.WearposList) do 
			if nPos == v then
				result2 = true;
				break;
			end;
		end;
		
		return result1 and result2;
	end;
	-- 获取分解结果
	----nQuality 品质
	----nPos 装备位置
	----nLevel 装备等阶
	----nnStrongLevel 强化等级
	GetResultList = function(nQuality, nPos, nLevel, nStrongLevel)
		local result = {};
		--print("nQuality	=	",nQuality)		
		--print("nPos	=	",nPos)
		--print("nLevel	=	",nLevel)
		--print("nStrongLevel	=	",nStrongLevel)
	    local a = data[nQuality][nLevel]	  
		result.dwItemEnum = a[1];
		local casual = math.random(a[2],a[3]);
		result.dwItemNum = casual;
		result.money = a[4];
		return result;
	end;
	
	GetResultList_C = function(nQuality, nPos, nLevel, nStrongLevel)
		local result = {};
		--print("nQuality	=	",nQuality)		
		--print("nPos	=	",nPos)
		--print("nLevel	=	",nLevel)
		--print("nStrongLevel	=	",nStrongLevel)
	    local a = data[nQuality][nLevel]	  
		result.dwItemEnum = a[1];
		result.dwItemNum = a[3];
		result.money = a[4];
		return result;
	end;
};






