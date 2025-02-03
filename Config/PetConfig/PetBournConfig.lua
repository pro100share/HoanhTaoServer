-- [[
	-- 宠物境界配置
	-- 时间：2013-12-20
-- ]]
local itemnumber = {1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,};  --物品数量
local shuxing = {
	[50710015] = {[0] = 0,[1] = 60,[2] = 100,[3] = 140,[4] = 180,[5] = 220,[6] = 280,[7] = 340,[8] = 400,[9] = 460,[10] = 520,[11] = 610,[12] = 700,[13] = 790,[14] = 880,[15] = 970,[16] = 1100,[17] = 1230,[18] = 1360,[19] = 1490,[20] = 1620,[21] = 1800,[22] = 1980,[23] = 2160,[24] = 2340,[25] = 2520,[26] = 2770,[27] = 3020,[28] = 3270,[29] = 3520,[30] = 3770,[31] = 4110,[32] = 4450,[33] = 4790,[34] = 5130,[35] = 5470,[36] = 5930,[37] = 6390,[38] = 6850,[39] = 7310,[40] = 7770,[41] = 8380,[42] = 8990,[43] = 9600,[44] = 10210,[45] = 10820,[46] = 11630,[47] = 12440,[48] = 13250,[49] = 14060,[50] = 14870,};
	[10021030] = {[0] = 0,[1] = 72,[2] = 120,[3] = 168,[4] = 216,[5] = 264,[6] = 336,[7] = 408,[8] = 480,[9] = 552,[10] = 624,[11] = 732,[12] = 840,[13] = 948,[14] = 1056,[15] = 1164,[16] = 1320,[17] = 1476,[18] = 1632,[19] = 1788,[20] = 1944,[21] = 2160,[22] = 2376,[23] = 2592,[24] = 2808,[25] = 3024,[26] = 3324,[27] = 3624,[28] = 3924,[29] = 4224,[30] = 4524,[31] = 4932,[32] = 5340,[33] = 5748,[34] = 6156,[35] = 6564,[36] = 7116,[37] = 7668,[38] = 8220,[39] = 8772,[40] = 9324,[41] = 10056,[42] = 10788,[43] = 11520,[44] = 12252,[45] = 12984,[46] = 13956,[47] = 14928,[48] = 15900,[49] = 16872,[50] = 17844,};
	[10021015] = {[0] = 0,[1] = 84,[2] = 140,[3] = 196,[4] = 252,[5] = 308,[6] = 392,[7] = 476,[8] = 560,[9] = 644,[10] = 728,[11] = 854,[12] = 980,[13] = 1106,[14] = 1232,[15] = 1358,[16] = 1540,[17] = 1722,[18] = 1904,[19] = 2086,[20] = 2268,[21] = 2520,[22] = 2772,[23] = 3024,[24] = 3276,[25] = 3528,[26] = 3878,[27] = 4228,[28] = 4578,[29] = 4928,[30] = 5278,[31] = 5754,[32] = 6230,[33] = 6706,[34] = 7182,[35] = 7658,[36] = 8302,[37] = 8946,[38] = 9590,[39] = 10234,[40] = 10878,[41] = 11732,[42] = 12586,[43] = 13440,[44] = 14294,[45] = 15148,[46] = 16282,[47] = 17416,[48] = 18550,[49] = 19684,[50] = 20818,};
	[10051001] = {[0] = 0,[1] = 96,[2] = 160,[3] = 224,[4] = 288,[5] = 352,[6] = 448,[7] = 544,[8] = 640,[9] = 736,[10] = 832,[11] = 976,[12] = 1120,[13] = 1264,[14] = 1408,[15] = 1552,[16] = 1760,[17] = 1968,[18] = 2176,[19] = 2384,[20] = 2592,[21] = 2880,[22] = 3168,[23] = 3456,[24] = 3744,[25] = 4032,[26] = 4432,[27] = 4832,[28] = 5232,[29] = 5632,[30] = 6032,[31] = 6576,[32] = 7120,[33] = 7664,[34] = 8208,[35] = 8752,[36] = 9488,[37] = 10224,[38] = 10960,[39] = 11696,[40] = 12432,[41] = 13408,[42] = 14384,[43] = 15360,[44] = 16336,[45] = 17312,[46] = 18608,[47] = 19904,[48] = 21200,[49] = 22496,[50] = 23792,};
	[10092007] = {[0] = 0,[1] = 108,[2] = 180,[3] = 252,[4] = 324,[5] = 396,[6] = 504,[7] = 612,[8] = 720,[9] = 828,[10] = 936,[11] = 1098,[12] = 1260,[13] = 1422,[14] = 1584,[15] = 1746,[16] = 1980,[17] = 2214,[18] = 2448,[19] = 2682,[20] = 2916,[21] = 3240,[22] = 3564,[23] = 3888,[24] = 4212,[25] = 4536,[26] = 4986,[27] = 5436,[28] = 5886,[29] = 6336,[30] = 6786,[31] = 7398,[32] = 8010,[33] = 8622,[34] = 9234,[35] = 9846,[36] = 10674,[37] = 11502,[38] = 12330,[39] = 13158,[40] = 13986,[41] = 15084,[42] = 16182,[43] = 17280,[44] = 18378,[45] = 19476,[46] = 20934,[47] = 22392,[48] = 23850,[49] = 25308,[50] = 26766,};
	[10051003] = {[0] = 0,[1] = 120,[2] = 200,[3] = 280,[4] = 360,[5] = 440,[6] = 560,[7] = 680,[8] = 800,[9] = 920,[10] = 1040,[11] = 1220,[12] = 1400,[13] = 1580,[14] = 1760,[15] = 1940,[16] = 2200,[17] = 2460,[18] = 2720,[19] = 2980,[20] = 3240,[21] = 3600,[22] = 3960,[23] = 4320,[24] = 4680,[25] = 5040,[26] = 5540,[27] = 6040,[28] = 6540,[29] = 7040,[30] = 7540,[31] = 8220,[32] = 8900,[33] = 9580,[34] = 10260,[35] = 10940,[36] = 11860,[37] = 12780,[38] = 13700,[39] = 14620,[40] = 15540,[41] = 16760,[42] = 17980,[43] = 19200,[44] = 20420,[45] = 21640,[46] = 23260,[47] = 24880,[48] = 26500,[49] = 28120,[50] = 29740,};
	[10082007] = {[0] = 0,[1] = 132,[2] = 220,[3] = 308,[4] = 396,[5] = 484,[6] = 616,[7] = 748,[8] = 880,[9] = 1012,[10] = 1144,[11] = 1342,[12] = 1540,[13] = 1738,[14] = 1936,[15] = 2134,[16] = 2420,[17] = 2706,[18] = 2992,[19] = 3278,[20] = 3564,[21] = 3960,[22] = 4356,[23] = 4752,[24] = 5148,[25] = 5544,[26] = 6094,[27] = 6644,[28] = 7194,[29] = 7744,[30] = 8294,[31] = 9042,[32] = 9790,[33] = 10538,[34] = 11286,[35] = 12034,[36] = 13046,[37] = 14058,[38] = 15070,[39] = 16082,[40] = 17094,[41] = 18436,[42] = 19778,[43] = 21120,[44] = 22462,[45] = 23804,[46] = 25586,[47] = 27368,[48] = 29150,[49] = 30932,[50] = 32714,};
	[10071007] = {[0] = 0,[1] = 144,[2] = 240,[3] = 336,[4] = 432,[5] = 528,[6] = 672,[7] = 816,[8] = 960,[9] = 1104,[10] = 1248,[11] = 1464,[12] = 1680,[13] = 1896,[14] = 2112,[15] = 2328,[16] = 2640,[17] = 2952,[18] = 3264,[19] = 3576,[20] = 3888,[21] = 4320,[22] = 4752,[23] = 5184,[24] = 5616,[25] = 6048,[26] = 6648,[27] = 7248,[28] = 7848,[29] = 8448,[30] = 9048,[31] = 9864,[32] = 10680,[33] = 11496,[34] = 12312,[35] = 13128,[36] = 14232,[37] = 15336,[38] = 16440,[39] = 17544,[40] = 18648,[41] = 20112,[42] = 21576,[43] = 23040,[44] = 24504,[45] = 25968,[46] = 27912,[47] = 29856,[48] = 31800,[49] = 33744,[50] = 35688,};
	[50302063] = {[0] = 0,[1] = 156,[2] = 260,[3] = 364,[4] = 468,[5] = 572,[6] = 728,[7] = 884,[8] = 1040,[9] = 1196,[10] = 1352,[11] = 1586,[12] = 1820,[13] = 2054,[14] = 2288,[15] = 2522,[16] = 2860,[17] = 3198,[18] = 3536,[19] = 3874,[20] = 4212,[21] = 4680,[22] = 5148,[23] = 5616,[24] = 6084,[25] = 6552,[26] = 7202,[27] = 7852,[28] = 8502,[29] = 9152,[30] = 9802,[31] = 10686,[32] = 11570,[33] = 12454,[34] = 13338,[35] = 14222,[36] = 15418,[37] = 16614,[38] = 17810,[39] = 19006,[40] = 20202,[41] = 21788,[42] = 23374,[43] = 24960,[44] = 26546,[45] = 28132,[46] = 30238,[47] = 32344,[48] = 34450,[49] = 36556,[50] = 38662,};
	[10061001] = {[0] = 0,[1] = 168,[2] = 280,[3] = 392,[4] = 504,[5] = 616,[6] = 784,[7] = 952,[8] = 1120,[9] = 1288,[10] = 1456,[11] = 1708,[12] = 1960,[13] = 2212,[14] = 2464,[15] = 2716,[16] = 3080,[17] = 3444,[18] = 3808,[19] = 4172,[20] = 4536,[21] = 5040,[22] = 5544,[23] = 6048,[24] = 6552,[25] = 7056,[26] = 7756,[27] = 8456,[28] = 9156,[29] = 9856,[30] = 10556,[31] = 11508,[32] = 12460,[33] = 13412,[34] = 14364,[35] = 15316,[36] = 16604,[37] = 17892,[38] = 19180,[39] = 20468,[40] = 21756,[41] = 23464,[42] = 25172,[43] = 26880,[44] = 28588,[45] = 30296,[46] = 32564,[47] = 34832,[48] = 37100,[49] = 39368,[50] = 41636,};
};
local objshuxing = {
		dwAttack        = 1,
		dwDefense       = 0.5,
		dwFlee          = 0.2,
		dwCrit          = 0.21,
		dwHPMax         = 0,
		dwMPMax   		= 0.1,
};

_G.PetBournConfig = {

	--宠物境界系统开放等级 （此为宠物等级）
	OpenLevel = 1;
	
	--升级增加经验
	AddExp = {
		[0] = {maxExp = 0, baseExp = 100},
		[1] = {maxExp = 100, baseExp = 100},
		[2] = {maxExp = 300, baseExp = 100},
		[3] = {maxExp = 600, baseExp = 100},
		[4] = {maxExp = 1000, baseExp = 100},
		[5] = {maxExp = 1500, baseExp = 100},
		[6] = {maxExp = 2200, baseExp = 100},
		[7] = {maxExp = 3100, baseExp = 100},
		[8] = {maxExp = 4200, baseExp = 100},
		[9] = {maxExp = 5500, baseExp = 100},
		[10] = {maxExp = 7000, baseExp = 100},
		[11] = {maxExp = 8800, baseExp = 100},
		[12] = {maxExp = 10900, baseExp = 100},
		[13] = {maxExp = 13300, baseExp = 100},
		[14] = {maxExp = 16000, baseExp = 100},
		[15] = {maxExp = 19000, baseExp = 100},
		[16] = {maxExp = 22500, baseExp = 100},
		[17] = {maxExp = 26500, baseExp = 100},
		[18] = {maxExp = 31000, baseExp = 100},
		[19] = {maxExp = 36000, baseExp = 100},
		[20] = {maxExp = 41500, baseExp = 100},
		[21] = {maxExp = 47700, baseExp = 100},
		[22] = {maxExp = 54600, baseExp = 100},
		[23] = {maxExp = 62200, baseExp = 100},
		[24] = {maxExp = 70500, baseExp = 100},
		[25] = {maxExp = 79500, baseExp = 100},
		[26] = {maxExp = 89500, baseExp = 100},
		[27] = {maxExp = 100500, baseExp = 100},
		[28] = {maxExp = 112500, baseExp = 100},
		[29] = {maxExp = 125500, baseExp = 100},
		[30] = {maxExp = 139500, baseExp = 100},
		[31] = {maxExp = 154800, baseExp = 100},
		[32] = {maxExp = 171400, baseExp = 100},
		[33] = {maxExp = 189300, baseExp = 100},
		[34] = {maxExp = 208500, baseExp = 100},
		[35] = {maxExp = 229000, baseExp = 100},
		[36] = {maxExp = 251200, baseExp = 100},
		[37] = {maxExp = 275100, baseExp = 100},
		[38] = {maxExp = 300700, baseExp = 100},
		[39] = {maxExp = 328000, baseExp = 100},
		[40] = {maxExp = 357000, baseExp = 100},
		[41] = {maxExp = 388200, baseExp = 100},
		[42] = {maxExp = 421600, baseExp = 100},
		[43] = {maxExp = 457200, baseExp = 100},
		[44] = {maxExp = 495000, baseExp = 100},
		[45] = {maxExp = 535000, baseExp = 100},
		[46] = {maxExp = 578000, baseExp = 100},
		[47] = {maxExp = 624000, baseExp = 100},
		[48] = {maxExp = 673000, baseExp = 100},
		[49] = {maxExp = 725000, baseExp = 100},
		[50] = {maxExp = 780000, baseExp = 100},
	};
	
	--增加经验倍数及权重
	ExpMul = {
		[2] = 5000,
		[4] = 3000,
		[6] = 1000,
		[8] = 500,
		[10] = 500,
	};
	
	Data = {
		UpLevelStar = 5; --提升一级境界星级
		Num = 10; --境界层数
		Bourn = {--{[境界等级索引] = {id,境界背景图片，宠物头顶图片,名字图片,名字灰图片,名字字符串,}}
			[1]={id=1,picBg = "gn_chuangong_bj.png",picOnHead = 'top_chongwu_1.png',name='gn_chongwu_1_1.png',nameGray='gn_chongwu_1_0.png',nametext='初学乍练',},
			[2]={id=2,picBg = "gn_chuangong_bj.png",picOnHead = 'top_chongwu_2.png',name='gn_chongwu_2_1.png',nameGray='gn_chongwu_2_0.png',nametext='略有小成',},
			[3]={id=3,picBg = "gn_chuangong_bj.png",picOnHead = 'top_chongwu_3.png',name='gn_chongwu_3_1.png',nameGray='gn_chongwu_3_0.png',nametext='心领神会',},
			[4]={id=4,picBg = "gn_chuangong_bj.png",picOnHead = 'top_chongwu_4.png',name='gn_chongwu_4_1.png',nameGray='gn_chongwu_4_0.png',nametext='炉火纯青',},
			[5]={id=5,picBg = "gn_chuangong_bj.png",picOnHead = 'top_chongwu_5.png',name='gn_chongwu_5_1.png',nameGray='gn_chongwu_5_0.png',nametext='出类拔萃',},
			[6]={id=6,picBg = "gn_chuangong_bj.png",picOnHead = 'top_chongwu_6.png',name='gn_chongwu_6_1.png',nameGray='gn_chongwu_6_0.png',nametext='技压群雄',},
			[7]={id=7,picBg = "gn_chuangong_bj.png",picOnHead = 'top_chongwu_7.png',name='gn_chongwu_7_1.png',nameGray='gn_chongwu_7_0.png',nametext='深不可测',},
			[8]={id=8,picBg = "gn_chuangong_bj.png",picOnHead = 'top_chongwu_8.png',name='gn_chongwu_8_1.png',nameGray='gn_chongwu_8_0.png',nametext='登峰造极',},
			[9]={id=9,picBg = "gn_chuangong_bj.png",picOnHead = 'top_chongwu_9.png',name='gn_chongwu_9_1.png',nameGray='gn_chongwu_9_0.png',nametext='返璞归真',},
			[10]={id=10,picBg = "gn_chuangong_bj.png",picOnHead = 'top_chongwu_10.png',name='gn_chongwu_10_1.png',nameGray='gn_chongwu_10_0.png',nametext='超凡入圣',},
		};
		--宠物头顶星星icon
		picOnHeadStar = {
			[1] = "petBourndstar1.png";
			[2] = "petBourndstar2.png";
			[3] = "petBourndstar3.png";
			[4] = "petBourndstar4.png";
			[5] = "petBourndstar5.png";
		};
		DevelopBournIcon = "999_0.png"; -->成长界面图标
		PropertyText = {
			dwAttack        = {1,"攻    击"},
			dwDefense       = {2,"防    御"},
			dwFlee          = {3,"身    法"},
			dwCrit          = {4,"暴    击"},
			dwHPMax         = {5,"生命上限"},
			dwMPMax   		= {6,"内    力"},
		};
	};
	
	--升级所需物品和银两
	--petId:宠物Id,dwLevel:境界等级（1~50）
	NeedItem = function(petId, dwLevel)
		--local level,star = _G.PetBournConfig.GetBournLvAndStar(dwLevel); -->获取当前宠物境界的等级和星级
		local retTab = {[4100170] = itemnumber[dwLevel], silver = 0};
		return retTab;
	end;
	
	--每级对应的属性
	--petId:宠物Id,dwLevel:境界等级（1~50）
	BournProp = function(petId, dwLevel)
		local objData = _G.PetSingleAttr:new(false);
		-- print("dwLevel===================================",dwLevel);
		for k,v in pairs(objData) do
			if type(v) ~= "function" and objshuxing[k] then
				objData[k] = math.floor(shuxing[petId][dwLevel] * objshuxing[k]) ;
			end
		end
		return objData;
	end;
	
	--宠物境界的最大等级
	dwMaxLevel = 50;
	
	--更加当前宠物等级判断是否开发
	--dwPetLevel:宠物等级
	IsOpenBourn = function(dwPetLevel)
		if not dwPetLevel then return; end
		local flag = false;
		if _G.PetBournConfig.OpenLevel <= dwPetLevel then
			flag = true;
		end
		return flag;
	end;
	
	--获取当前境界数据信息
	--dwIndex:等级索引
	GetBournData = function(dwIndex)
		if dwIndex then
			return _G.PetBournConfig.Data.Bourn[dwIndex];
		end
	end;
	
	--获取宠物对应境界等阶和星级(dwSum:0~50)
	--return:境界等级，境界星级
	GetBournLvAndStar = function(dwSum)
		local dwLevel = 0;
		local dwStar = 0;
		local base = _G.PetBournConfig.Data.UpLevelStar;
		if dwSum and dwSum ~= 0 then
			local Sum = dwSum - 1;
			dwLevel = math.floor(Sum/base);
			dwStar = Sum%base;
			return dwLevel+1,dwStar + 1;
		end
		return dwLevel+1,dwStar+1;
	end;
	
	--获取宠物对应境界的一维值
	--return:境界等级（0~50）
	GetBournSum = function(dwBournLevel,dwBournStar)
		local dwSum = 0;
		local base = _G.PetBournConfig.Data.UpLevelStar;
		if dwBournLevel and dwBournStar then
			if dwBournLevel == 0 then
				dwSum = dwBournStar;
			else
				dwSum = (dwBournLevel-1)*base + dwBournStar;
			end
		end
		return dwSum;
	end;
	
	--属性tips显示格式
	szTitleTips = [[<font>%s</font><br />]];
	szAttrTips = [[<font>%s: %d</font><br />]];
	--成长界面提示
	szNotActive = "<p>初学乍练</p><p>提升境界提高侠客属性</p>"; -->境界星星提示
	szOpenBournUI = "您的宠物还未到达开启境界等级";
	--
};


function PetBournConfig:GetMaxExp()
	return self.AddExp[self.dwMaxLevel].maxExp;
end;

function PetBournConfig:ExpToLevel(dwExp)
	-- print("================ExpToLevel============",dwExp);
	for i = self.dwMaxLevel,1,-1 do
		if dwExp and self.AddExp[i] and dwExp >= self.AddExp[i].maxExp then
			local remainExp = dwExp - self.AddExp[i].maxExp;
			local count = i+1;
			if count > self.dwMaxLevel then
				return self.dwMaxLevel,self.AddExp[i].maxExp - self.AddExp[i-1].maxExp;
			end
			return i+1, remainExp
		end;
	end
	return 1, dwExp;
end;

--计算随机经验倍数
function PetBournConfig:CalExpMul()
	local totalWeight = 0;
	for k, v in pairs(self.ExpMul) do
		totalWeight = totalWeight + v;
	end
	
	local randomWeight = math.random(1, totalWeight);
	local curWeight = 0;
	
	local dwMul = 1;
	for k, v in pairs(self.ExpMul) do
		curWeight = curWeight + v;
		if randomWeight <= curWeight then
			dwMul = k; 
			break;
		end
	end
	
	return dwMul;
end

--计算随机经验
-- function PetBournConfig:CalRandomExp(dwLevel)
	-- local baseExp = self.AddExp[dwLevel].baseExp;

	-- return baseExp * dwMul;
-- end 


function PetBournConfig:CalBournProp(petId, dwExp)
	local curLevel, remainExp = self:ExpToLevel(dwExp);
	curLevel  = curLevel - 1;
	local curProp = self.BournProp(petId, curLevel);
	local nextProp = self.BournProp(petId, curLevel + 1)
	
	if self.AddExp[curLevel + 1] and self.AddExp[curLevel] then
		local uplevelNeedExp = self.AddExp[curLevel + 1].maxExp - self.AddExp[curLevel].maxExp;
		nextProp:SubValue(curProp);
		nextProp:MulParamFloor((remainExp / uplevelNeedExp))
		curProp:AddValue(nextProp)
	end
	
	local retProp = {};
	for k, v in pairs(curProp) do
		if type(v) ~= "function" then
			retProp[k] = v;
		end
	end
	return retProp;
end

--境界属性加成相关配置
_G.PetBournAddAtrrConfig = {
	szNotActiveTips = "大侠您还未突破%境界";
	szCostItemNum = [[<font color='%s'>%d/%d</font>]]; -->消耗物品数量
	szCostSliver = [[<font color='%s'>%d</font>]]; -->消耗银两
	szNotActiveBorun = [[<font color='#31cf32'>大侠还未突破<u><a href="asfunction:hrefevent,">%s</a></u>境界</font>]];
	szAttrPercent = [[<font color='#FFFFFF'>%d/%d</font>]];
	--
	color = {
		--属性区消耗材料
		Gray = "#FFFFFF"; -->灰色
		Red = "#FF0000"; -->红色
	};
	
	--经验框停顿时候
	delayTime = 0;
	
	--是否显示快速购买
	IsShowQuickPurchase = function(dwPetId)
		return false;
	end;
	
	--获取当前选中境界勋章提示内容
	--宠物Id，宠物等级
	GetBournIconTips = function(dwPetId,dwPetLevel)
		local str = "大侠11";
		
		return str;
	end;
	
	--获取当前选中境界星级提示内容
	--宠物Id，宠物等级
	GetBournStarTips = function(dwPetId,dwPetLevel)
		local str = "大侠22";
		
		return str;
	end;
	
	--境界抽奖索引
	bournIndex = {
		[2] = 1;
		[4] = 2;
		[6] = 3;
		[8] = 4;
		[10] = 5;
	};
	
	--获取当前升级加成经验抽奖界面旋转信息
	--经验基数，经验倍数
	GetAddExpScorll = function(dwBase,dwMul)
		local scorll = {}; --2到8循环一圈
		scorll.starPos = 1;
		scorll.endPos = _G.PetBournAddAtrrConfig.bournIndex[dwMul];
		scorll.rollNum = 6; 
		
		
		return scorll;
	end;
	
	--连续点击提示境界时候间隔
	timeGap = 1000;
	
	--获取“提升境界”按钮提示内容
	szUpLevelBournBtTips = "消耗悟道残卷提升侠客境界";
	--消息材料不足提示
	szNotEnoughtMat = "数量不足，请检查您的背包";
	--消耗银两不足提示
	szNotEnoughtSliver = "银两不足";
	--满级提示
	szFullLevel = "侠客境界已超凡入圣";
	--已激活提示
	szHadActive = "大侠已突破此境界";
	--飘字特效
	szPlayWords = "<font color='#FFBA00' size = '20'>本次升级经验增长%d</font>";
	--提示按钮
	szTiShengBt = {
		[1] = "提升境界";
		[2] = "跳过动画";
	};
};

--快速购买相关配置
_G.PetBournPurchaseConfig = {
	--获得材料描述，（dwPetId：宠物Id）
	szMaterialDescribe = function(dwPetId)
		local str = "您可以通过花费元宝购买";
		
		return str;
	end;
	
	--根据宠物是否隐藏礼金,（dwPetId：宠物Id）
	GetMoneyState = function(dwPetId)
		return true;
	end;
	
	--到达境界上限
	szMaxLevel = "您当前已到达境界上限";
};
