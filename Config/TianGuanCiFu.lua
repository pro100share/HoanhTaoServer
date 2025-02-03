--天官赐福系统配置文件
_G.TianGuanCiFuConfig = {
	RefreshTime = "06:00";
	
	--定义各系统等级上限，清江道具脚本使用，用来判断祝福值道具使用判断
	MAXlv = {
		
		[1] = 10;--坐骑
		[2] = 10;--名剑
		[3] = 10;--宝甲
		[4] = 9;--实战
		--[5] = 13;--修行
		--[6] = 13;--易筋经
		
	};

	--各个系统天官赐福值MAX
	MaxEquipUpGradeValue	= 10000;
	--装备升阶天官赐福上限
	MaxEquipUpGradeValuedata={
	[1]	=	10000	,
	[2]	=	10000	,
	[3]	=	10000	,
	[4]	=	10000   ,
	[5]	=	10000	,
	[6]	=	10000   ,
	[7]	=	10000	,
	[8]	=	10000	,
	[9]	=	10000	,
	[10] =	10000	,
	};
    
    --天官赐福值MAX
	MaxJingJieUpValue 		= 10000;
	--实战境界天官赐福上限
	MaxJingJieUpValuedata	= {

		[1]=	80,
		[2]=	324,
		[3]=	673,
		[4]=	1202,
		[5]=	2600,
		[6]=	4375,
		[7]=	4871,
		[8]=	8152,
		[9]=	8152,
		[10]=	10000,
		[11]=	10000,
	};
	
    --天官赐福值MAX
	MaxMountUpGradeValue 	= 15000;
	--坐骑升阶天官赐福上限
	MaxMountUpGradeValuedata ={
		[1] 	=70;
		[2] 	=133;
		[3] 	=250;
		[30001] =250;
		[4] 	=545;
		[40001] =545;
		[5] 	=1238;
		[50001] =1238;
		[6] 	=1961;
		[60001] =1961;
		[7]     =4133;
		[70001] =4133;
		[8]  	=7143;		
	    [80001]	=7143;
		[9]	    =10100;
		[90001]	=10100;
		[10]	    =8100;
		[100001]	=8100;
		[11]	    =14700;
		[110001]	=14700;

	};
	
    --天官赐福值MAX
	MaxAmuletUpGradeValue 	= 20000;
	--宝甲升阶天官赐福上限
	MaxAmuletUpGradeValuedata={
		[1]	=66  ,
		[2]	=222  ,
		[3]	=364 ,
		[4]	=625 ,
		[5]	=1365 ,
		[6]	=3607 ,
		[7]	=7812 ,
		---开阶9,10
		[8]	=13462,
		[9]	=15098,
		[10] =15200,--开11阶
		[11] =16000,		
	};
    
    --天官赐福值MAX
	MaxSwordUpGradeValue 	= 25000;
	--宝剑升阶天官赐福上限
	MaxSwordUpGradeValuedata={
	[1]	=	66	,
	[2]	=	350	,
	[3]	=	500	,
	[4]	=	777 ,
	[5]	=	1615,
	[6]	=	4266,
	[7]	=	9444,
	[8]	=	12200,
	[9]	=	14000,-----宝剑9、10阶
	[10] =	19200,-----宝剑11阶
	[11] =  23000
	};
	
    --天官赐福值MAX
    MaxEquipStrongValue     = 10000;

	--各个系统什么时候开始显示天官赐福值
	EquipUpGradeShowLevel	= 10;
	JingJieUpShowLevel		= 10;
	MountUpGradeShowLevel	= 1;
	AmuletUpGradeShowLevel	= 3;
	SwordUpGradeShowLevel	= 1;

	--装备升阶赐福值
	n_AddValue_EquipUp = {
		[1 ]={2,4},
		[2 ]={3,6},
		[3 ]={4,8},
		[4 ]={5,10},
		[5 ]={6,12},
		[6 ]={8,16},
	};
	EquipUpGradeAddValue = function(itemInst)
        local bBaoJi = false;
		local n_AddValue = 1;
		local canshu = itemInst:GetLevel();
		local ZF_Value_Floor = TianGuanCiFuConfig.n_AddValue_EquipUp[canshu][1]
		local ZF_Value_up = TianGuanCiFuConfig.n_AddValue_EquipUp[canshu][2]
		
		if TianGuanCiFuConfig.n_AddValue_Mount[canshu]~=nil then
			n_AddValue = math.floor((math.random(ZF_Value_Floor,ZF_Value_up) + math.random(ZF_Value_Floor,ZF_Value_up))/2)
		end
		
		return n_AddValue, bBaoJi;
	end;
    
	--境界升级赐福值
	n_AddValue_JingJie = {
		[1 ]={1,3},
		[2 ]={2,4},
		[3 ]={3,6},
		[4 ]={4,8},
		[5 ]={5,10},
		[6 ]={6,12},
		[7 ]={7,14},
		[8 ]={8,16},
		[9 ]={9,18},
	};

		
	JingJieUpAddValue = function(level)
        local bBaoJi = false;
		local n_AddValue = 10000;
		local canshu = level
		local ZF_Value_Floor = TianGuanCiFuConfig.n_AddValue_JingJie[canshu][1]
		local ZF_Value_up = TianGuanCiFuConfig.n_AddValue_JingJie[canshu][2]
		
		if TianGuanCiFuConfig.n_AddValue_JingJie[canshu]~=nil then

			n_AddValue = math.floor((math.random(ZF_Value_Floor,ZF_Value_up) + math.random(ZF_Value_Floor,ZF_Value_up))/2)
		end

		return n_AddValue, bBaoJi;
	end;

	--坐骑升阶赐福值


	n_AddValue_Mount = {
		[1]		={1,3},
		[2]		={2,4},
		[3]		={2,4},
		[30001]	={3,6},	
		[4]		={3,6},
		[40001]	={4,8},	
		[5]		={4,8},
		[50001]	={5,10},	
		[6]		={5,10},
		[60001]	={6,12},
		[7]	    ={6,12},		
		[70001]	={6,12},
		[8]	    ={6,12},		
		[80001]	={6,12},
		[9]	    ={8,16},		
		[90001]	={8,16},
		[10]	    ={5,10},		
		[100001]	={5,10},
		[11]	    ={4,6},		
		[110001]	={4,6},
		
	};
	MountUpGradeAddValue = function(mountInst)
        local bBaoJi = false;
		local n_AddValue = 10000;
		local canshu = mountInst:GetGrade()
		local pinzhi = mountInst:GetQuality()
		if pinzhi~= 1 then
			canshu= canshu*10000+1
		end
		local ZF_Value_Floor = TianGuanCiFuConfig.n_AddValue_Mount[canshu][1]
		local ZF_Value_up = TianGuanCiFuConfig.n_AddValue_Mount[canshu][2]
		
		if TianGuanCiFuConfig.n_AddValue_Mount[canshu]~=nil then
			--n_AddValue = math.random(math.floor(TianGuanCiFuConfig.n_AddValue_Mount[canshu][1]/2),math.floor(TianGuanCiFuConfig.n_AddValue_Mount[canshu][2]/2))+math.random(math.ceil(TianGuanCiFuConfig.n_AddValue_Mount[canshu][1]/2),math.ceil(TianGuanCiFuConfig.n_AddValue_Mount[canshu][2]/2))
			n_AddValue = math.floor((math.random(ZF_Value_Floor,ZF_Value_up) + math.random(ZF_Value_Floor,ZF_Value_up))/2)
		end
		
		return n_AddValue, bBaoJi;
	end;
    
	--护身宝甲升阶赐福值
	n_AddValue_Amulet = {
		[1]={1,3},
		[2]={2,4},
		[3]={3,6},
		[4]={4,8},
		[5]={5,10},
		[6]={6,12},
		[7]={8,16},
		[8]={8,9},
		[9]={8,9},
		[10]={10,12},		--开11
		[11]={14,16},
	};
	AmuletUpGradeAddValue = function(amuletLevel)
        local bBaoJi = false;
		local n_AddValue = 10000;
		local canshu = amuletLevel

		local ZF_Value_Floor = TianGuanCiFuConfig.n_AddValue_Amulet[canshu][1]
		local ZF_Value_up = TianGuanCiFuConfig.n_AddValue_Amulet[canshu][2]
		
		if TianGuanCiFuConfig.n_AddValue_Amulet[canshu]~=nil then
		
			n_AddValue = math.floor((math.random(ZF_Value_Floor,ZF_Value_up) + math.random(ZF_Value_Floor,ZF_Value_up))/2)
		end
		
		return n_AddValue, bBaoJi;
	end;
	
	
	
	--宝剑升阶赐福值
	n_AddValue_Sword = {
		[1 ]={1,3},
		[2 ]={2,4},
		[3 ]={3,6},
		[4 ]={4,8},
		[5 ]={5,10},
		[6 ]={6,12},
		[7 ]={8,16},
		[8 ]={8,16},  ----9阶名剑赐福1
		[9 ]={8,16},  ----10阶名剑赐福2
		[10 ]={14,16},  ----11阶名剑赐福
		[11]={16,18}, --12阶名剑赐福
	};
	SwordUpGradeAddValue = function(nSwordGrade)
        local bBaoJi = false;
		local n_AddValue = 10000;
		local canshu = nSwordGrade
		local ZF_Value_Floor = TianGuanCiFuConfig.n_AddValue_Sword[canshu][1]
		local ZF_Value_up = TianGuanCiFuConfig.n_AddValue_Sword[canshu][2]
		
		if TianGuanCiFuConfig.n_AddValue_Sword[canshu]~=nil then

			n_AddValue = math.floor((math.random(ZF_Value_Floor,ZF_Value_up) + math.random(ZF_Value_Floor,ZF_Value_up))/2)
		end

		return n_AddValue, bBaoJi;
	end;
    
    
    --装备强化赐福值
    
    EquipStrongAddValue = function(dwQHStoneNum)
        local bBaoJi = false;
        return dwQHStoneNum, bBaoJi;
    end;
	
	--天官赐福值MAX
	MaxKungFuStudyValue 	= 15000;
	--功法领悟赐福值上限
	MaxYiJinJingUpValuedata	= {
		[1]=	100,
		[2]=	250,
		[3]=	684,
		[4]=	1520,
		[5]=	2222,
		[6]=	3571,
		[7]=	5306,
		[8]=	5175,
		[9]=	6716,
		[10]=	8117,
		[11]=	8977,
		[12]=	10303
	};
	--功法领悟赐福值
	n_AddValue_KungFu = {
		[1]		={[1] = {1,3}, [2] = {2,4}, [3] = {2,4},[4] = {3,6},[5] = {3,6},[6] = {4,8},[7] = {4,8},[8] = {5,10},[9] = {5,10},[10] = {6,12},[11] = {8,16},[12] = {10,20},},
		[2]		={[1] = {1,3},},
		[3]		={[1] = {1,3},},
	};
	KungFuStudyAddValue = function(kungFuId, zhaoshiId)
        local bBaoJi = false;
		local n_AddValue = 10000;

		local ZF_Value_Floor = TianGuanCiFuConfig.n_AddValue_KungFu[kungFuId][zhaoshiId][1]
		local ZF_Value_up = TianGuanCiFuConfig.n_AddValue_KungFu[kungFuId][zhaoshiId][2]
		
		if TianGuanCiFuConfig.n_AddValue_KungFu[kungFuId][zhaoshiId]~=nil then
			n_AddValue = math.floor((math.random(ZF_Value_Floor,ZF_Value_up) + math.random(ZF_Value_Floor,ZF_Value_up))/2)
		end
		
		return n_AddValue, bBaoJi;
	end;
	
	
			--血魔攻赐福值上限
	MaxMegaKillUpGradeValuedata ={
		[1]=	44,
		[2]=	206,
		[3]=	479,
		[4]=	722,
		[5]=	1673,
		[6]=	2750,
		[7]=	3803,
		[8]=	5488,
		[9]=	7895,
		[10]=	10000,
	};
	
	
    --血魔功
    MaxMegaKillValue		= 10000;
	--血魔攻赐福值
	n_AddValue_MaxMegaKill ={
		[1 ]={1,3},
		[2 ]={2,4},
		[3 ]={2,4},
		[4 ]={3,6},
		[5 ]={3,6},
		[6 ]={4,8},
		[7 ]={4,8},
		[8 ]={5,10},
		[9 ]={5,10},
		[10 ]={5,10},
	};
	----dwLevel 杀人境界
	MegaKillAddValue = function(dwLevel)
        local bBaoJi = false;
		local n_AddValue = 10000;
		local canshu = dwLevel
		local ZF_Value_Floor = TianGuanCiFuConfig.n_AddValue_MaxMegaKill[canshu][1]
		local ZF_Value_up = TianGuanCiFuConfig.n_AddValue_MaxMegaKill[canshu][2]
		
		if TianGuanCiFuConfig.n_AddValue_MaxMegaKill[canshu]~=nil then

			n_AddValue = math.floor((math.random(ZF_Value_Floor,ZF_Value_up) + math.random(ZF_Value_Floor,ZF_Value_up))/2)
		end

	--	print("1111111111111111111",n_AddValue)
			--	print("2222222222222222",bBaoJi)
		return n_AddValue, bBaoJi;
	end;	
	
	--暗器升阶天官赐福上限
	HiddenWeaponValueMax 	= 25000;
	--暗器系统各阶天官赐福上限
	MaxHiddenWeaponUpGradeValuedata={
		[1]	=	50,
		[2]	=	280,
		[3]	=	430,
		[4]	=	550,
		[5]	=	1650,		
		[6]	=	4650,		
		[7]	=	9600,		
		[8]	=	14500,
		[9]	=	23400,
	};
	--暗器祝福值
	n_AddValue_HiddenWeapon ={
		[1 ]={1,3},
		[2 ]={3,6},
		[3 ]={3,6},
		[4 ]={4,8},
		[5 ]={5,10},
		[6 ]={6,12},
		[7 ]={8,14},
		[8 ]={8,14},
		[9 ]={10,16},
	};
	--参数：暗器阶数
	HiddenWeaponAddValue = function(classIndex)
        local bBaoJi = false;
		local n_AddValue = 10000;
		local ZF_Value_Floor = TianGuanCiFuConfig.n_AddValue_HiddenWeapon[classIndex][1]
		local ZF_Value_up = TianGuanCiFuConfig.n_AddValue_HiddenWeapon[classIndex][2]
		
		if TianGuanCiFuConfig.n_AddValue_HiddenWeapon[classIndex]~=nil then
			n_AddValue = math.floor((math.random(ZF_Value_Floor,ZF_Value_up) + math.random(ZF_Value_Floor,ZF_Value_up))/2)
		end
		
		return n_AddValue, bBaoJi;
	end;

	--战骑诀天官赐福值MAX
	MaxZhanQiJueValue 	= 35000;
	-- 战骑诀赐福值上限
	MaxZhanQiJueUpValuedata	= {
		[1]=	100,
		[2]=	250,
		[3]=	684,
		[4]=	1520,
		[5]=	2222,
		[6]=	8000,
		[7]=	15000,
		[8]=	28000,
		[9]=	30000,
		[10]=	35000,  -- 注：最后一阶事实上不用赐福了
	};
	--战骑诀赐福值
	n_AddValue_ZhanQiJue ={
		[1]={2,4},
		[2]={2,5},
		[3]={3,6},
		[4]={4,8},
		[5]={4,8},
		[6]={6,10},
		[7]={11,13},
		[8]={12,16},
		[9]={18,25},
		[10] ={12,26}, -- 注：最后一阶事实上不用赐福了
	};
	ZhanQiJueAddValue = function(nPhase)
        local bBaoJi = false;
		local n_AddValue = 0;

		local tValues = TianGuanCiFuConfig.n_AddValue_ZhanQiJue[nPhase];
		local nFloor = tValues[1];
		local nCeil = tValues[2];
		
		if tValues then
			n_AddValue = math.floor((math.random(nFloor,nCeil) + math.random(nFloor,nCeil))/2)
		end
		
		return n_AddValue, bBaoJi;
	end;
	
	-- 修炼金身
	--天官赐福值MAX
	MaxGoldenBodyValue 	= 35000;
	
	-- 金身突破赐福值上限
	MaxGoldenBodyUpValuedata	= {
		[1]=	160,
		[2]=	420,
		[3]=	1000,
		[4]=	2500,
		[5]=	5800,
		[6]=	8800,
		[7]=	15000,
		[8]=	22000,
		[9]=	28000,
		[10]=	35000,  -- 注：最后一阶事实上不用赐福了
	};
	
	--金身突破赐福值
	n_AddValue_GoldenBody = {
		[1]={2,4},
		[2]={3,6},
		[3]={4,8},
		[4]={5,12},
		[5]={7,18},
		[6]={10,25},
		[7]={15,32},
		[8]={20,33},
		[9]={25,40},
		[10] ={12,26}, -- 注：最后一阶事实上不用赐福了
	};
	GoldenBodyAddValue = function(nGrade)
        local bBaoJi = false;
		local n_AddValue = 10000;

		local ZF_Value_Floor = TianGuanCiFuConfig.n_AddValue_GoldenBody[nGrade][1]
		local ZF_Value_up = TianGuanCiFuConfig.n_AddValue_GoldenBody[nGrade][2]
	
		n_AddValue = math.floor((math.random(ZF_Value_Floor,ZF_Value_up) + math.random(ZF_Value_Floor,ZF_Value_up))/2)

		return n_AddValue, bBaoJi;
	end;

	--战旗天官赐福值MAX
	MaxBannerValue 	= 35000;
	--战旗赐福值上限
	MaxBannerUpValuedata	= {
		[1] =   30,
		[2] =   113,
		[3] =   503,
		[4] =   1800,
		[5] =   5250,
		[6] =   10200,
		[7] =   15750,
		[8] =   30000,
  -- 注：最后一阶事实上不用赐福了
	};
	--战旗赐福值
	n_AddValue_Banner ={
		[1] = {2,4},
		[2] = {2,5},
		[3] = {3,6},
		[4] = {4,8},
		[5] = {8,12},
		[6] = {10,15},
		[7] = {13,17},
		[8] = {15,19},
  -- 注：最后一阶事实上不用赐福了
	};
	BannerAddValue = function(nPhase)
        local bBaoJi = false;
		local n_AddValue = 0;

		local tValues = TianGuanCiFuConfig.n_AddValue_Banner[nPhase];
		local nFloor = tValues[1];
		local nCeil = tValues[2];
		
		if tValues then
			n_AddValue = math.floor((math.random(nFloor,nCeil) + math.random(nFloor,nCeil))/2)
		end
		
		return n_AddValue, bBaoJi;
	end;
}
