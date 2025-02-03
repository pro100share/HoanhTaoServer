--[[
功能：坐骑配置文件
版本：
	v1.0 2012-04-10 create by lkj
]]
--【坐骑资质配置】
_G.CMountQualityConfig = {
	-- [1] = {Name = "【普通】"; Color = "#dcd9d9"};
	-- [2] = {Name = "【良品】"; Color = "#4fd388"};
	-- [3] = {Name = "【上品】"; Color = "#4daeed"};
	-- [4] = {Name = "【珍品】"; Color = "#e082da"};
	-- [5] = {Name = "【神骑】"; Color = "#fed904"};
    [1] = {Name = ""; Color = "#dcd9d9"};
    [2] = {Name = ""; Color = "#4fd388"};
    [3] = {Name = ""; Color = "#4daeed"};
    [4] = {Name = ""; Color = "#e082da"};
    [5] = {Name = ""; Color = "#fed904"};
};
--【坐骑系统基本配置】
_G.CMountSystemConfig = {
	--上马读条时间
	LoadingTime = 5000;
	--自动寻路上马距离
	AutoRunRideLen = 25;
	--获得坐骑通知图标
	GetNewMountNoticeIcon = nil;
	--坐骑技能可以升级通知图标
	ActiveMountSkillCanLevelUp = nil;
	--上马特效
	RideOnEffectID = 8;
	--下马特效
	RideDownEffectID = 9;
	--坐骑avatar窗口大小配置
	AvatarRect	= {x = 1000, y = 1000};
	--排行榜坐骑avatar窗口大小配置
	ChartAvatarRect	= {x = 1000, y = 1000};
	--初始坐骑栏位
	InitialSlotNum = 1;
	--坐骑不可激活等级差
	CannotActivateLevelDelta = 5;
	--受击下马概率(1-10000)3000就为30%
	OnHurtRideDownRate = 100;
	--坐骑经验算法
	AddExp = function(n_AddValue, n_MonsterLevel, mountInst)
		if n_AddValue <= 0 then
			return 0;
		end

		local MountLevl = mountInst:GetLevel();

		if (MountLevl - n_MonsterLevel) > 0 then
			n_AddValue = n_AddValue * (1-(MountLevl - n_MonsterLevel) / 20);
		end

		if n_AddValue < 1 then
			n_AddValue = 1;
		end
		return math.floor(n_AddValue);
	end;
	--坐骑评分算法
	----获得等阶			mountInst:GetGrade()
	----获得等级			mountInst:GetLevel()
	----获得品质			mountInst:GetQuality()
	----获得攻击资质			mountInst:GetGongJiAptitude()
	----获得防御资质			mountInst:GetFangYuAptitude()
	----获得根骨资质			mountInst:GetGenGuAptitude()
	----获得技巧资质			mountInst:GetJiQiaoAptitude()
	----获得对象对人生命加成	mountInst:GetAddShengMing()
	----获得对象对人内力加成	mountInst:GetAddNeiLi()
	----获得对象对人攻击加成	mountInst:GetAddGongJi()
	----获得对象对人防御加成	mountInst:GetAddFangYu()
	----获得对象对人暴击加成	mountInst:GetAddBaoJi()
	----获得对象对人身法加成	mountInst:GetAddShenFa()

	MountPoint = function(mountInst)
		--生命加成评分
		local n_ShengMingValue 	= _G.EquipGradeConfig.dwHPMax * mountInst:GetAddShengMing();
		--内力加成评分
		local n_NeiLiValue 		= _G.EquipGradeConfig.dwMPMax * mountInst:GetAddNeiLi();
		--攻击加成评分
		local n_GongJiValue		= _G.EquipGradeConfig.dwAttack * mountInst:GetAddGongJi();
		--防御加成评分
		local n_FangYuValue	 	= _G.EquipGradeConfig.dwDefense * mountInst:GetAddFangYu();
		--暴击加成评分
		local n_BaoJiValue 		= _G.EquipGradeConfig.dwCrit * mountInst:GetAddBaoJi();
		--身法加成评分
		local n_ShenFaValue 	= _G.EquipGradeConfig.dwFlee * mountInst:GetAddShenFa();

		local n_Total			= n_ShengMingValue + n_NeiLiValue + n_GongJiValue + n_FangYuValue + n_BaoJiValue + n_ShenFaValue;
		n_Total = n_Total + CMountSystemConfig.ChangeMountPoint(mountInst);
		return math.floor(n_Total);   --(n_Total + (mountInst:GetGrade()-1) * 50 + (mountInst:GetQuality()-1) * 15 + (mountInst:GetLevel()-1) * 2);
	end;
	ChangeMountPoint = function(mountInst)
		local n_Total = 0;
		-- local n_Attr = CMountBasePropConfig.AddChangeRankAttr(mountInst)
		local t_attr =  _G.SSingleAttrChange:new(); 
		local infos = MountChangeRankConfig:GetMountChangeRankAttrInfos(rank);
		t_attr:AddValue(infos);
		for k,v in pairs(_G.EquipGradeConfig) do
			if type(v) == "number" and t_attr[k] then
				n_Total = n_Total + v*(t_attr[k]);
			end;
		end
		return n_Total;
	end
};

_G.MountModelToAnimal = {
	[900004] = 10000004;
	[900005] = 10000005;
	[900006] = 10000006;
	[900007] = 10000007;
	[900008] = 10000008;
	[900009] = 10000009;
	[900010] = 10000009;
	[900011] = 10000011;
	[900050] = 10000050;---预留插入的坐骑
};
--【坐骑配置表】
----name		坐骑名字
----needprof	坐骑职业限制 0为所有职业，1镰，2刀，3剑，4枪
----modelID		坐骑模型ID
----grade		坐骑等阶
----quality		坐骑品质
----nextMountID	下一阶坐骑ID
----minLevel	坐骑当前阶数最小等级
----maxLevel	坐骑当前阶数最大等级
----其他参数为坐骑avatar参数
_G.CMountTable = {
	--镰系坐骑
	[10001] = {
		name		= "青象";
		pname		= "LanDao1_01";
		--medicineNum	= 8;		--丹药数量(资质丹)
		--medicineItemId = 2200050;	--丹药id(资质丹)
		needProf	= 1;
		modelID		= 900201;
		pfx			= {
		};
		pfx2		= {
			["tx_001"] = 71020;
		};
		grade		= 1;
		upgradeact = "X_ZuoQi_Xiang_CaoCong_ShengJie.san";
		quality 	= 1;
		lastMountID = 0;
		nextMountID = 10002;
		minLevel 	= 1;
		maxLevel 	= 20;
		sknFile 	= "X_ZuoQi_Xiang_01.skn";
		sklFile		= "X_ZuoQi_Xiang_CaoCong.skl";
		sanFile		= "X_ZuoQi_Xiang_CaoCong_DaiJi.san";
		param_1_x = 0; param_1_y =-14.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 0; param_3_y =-14.5; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};
	[10002] = {
		name 		= "踏山象";
		pname		= "LanDao2_01";
		needProf 	= 1;
		modelID 	= 900202;
		pfx			= {
		};
		pfx2		= {
			["tx_001"] = 71021;
		};
		grade 		= 2;
		upgradeact = "X_ZuoQi_Xiang_CaoCong_ShengJie.san";
		quality 	= 1;
		lastMountID = 10001;
		nextMountID = 10003;
		minLevel 	= 1;
		maxLevel 	= 40;
		sknFile 	= "X_ZuoQi_Xiang_02.skn";
		sklFile		="X_ZuoQi_Xiang_CaoCong.skl";
		sanFile 	="X_ZuoQi_Xiang_CaoCong_DaiJi.san";
		param_1_x = 0; param_1_y =-14.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 0; param_3_y =-14.5; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};
	[10003] = {
		name	 	= "狂涛";
		pname		= "LanDao3_01";
		needProf 	= 1;
		modelID	 	= 900203;
		pfx			= {
		};
		pfx2		= {
			["tx_001"] = 71022;
		};
		grade 		= 3;
		upgradeact = "X_ZuoQi_Xiang_CaoCong_ShengJie.san";
		quality 	= 1;
		lastMountID = 10002;
		nextMountID = 10004;
		minLevel 	= 1;
		maxLevel 	= 60;
		sknFile 	= "X_ZuoQi_Xiang_CaoCong.skn";
		sklFile		= "X_ZuoQi_Xiang_CaoCong.skl";
		sanFile 	= "X_ZuoQi_Xiang_CaoCong_DaiJi.san";
		param_1_x = 0; param_1_y =-14.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 0; param_3_y =-14.5; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};

	[10004] = {
		name	 	= "狂涛";
		pname		= "LanDao3_02";
		needProf 	= 1;
		modelID	 	= 900203;
		pfx			= {
			["gua_01"] = 70020;
			["gua_02"] = 70021;
			["gua_03"] = 70022;
		};
		pfx2		= {
			["tx_001"] = 71023;
		};
		grade 		= 3;
		upgradeact = "X_ZuoQi_Xiang_CaoCong_ShengJie.san";
		quality 	= 2;
		lastMountID = 10003;
		nextMountID = 90401;
		minLevel 	= 1;
		maxLevel 	= 60;
		sknFile 	= "X_ZuoQi_Xiang_CaoCong.skn";
		sklFile		= "X_ZuoQi_Xiang_CaoCong.skl";
		sanFile 	= "X_ZuoQi_Xiang_CaoCong_DaiJi.san";
		param_1_x = 0; param_1_y =-14.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 0; param_3_y =-14.5; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};
	--刀系坐骑
	[20001] = {
		name 		= "银犀";
		pname		= "DaHan1_01";
		needProf	= 2;
		modelID 	= 900301;
		pfx			= {
		};
		pfx2		= {
			["tx_001"] = 71010;
		};
		grade 		= 1;
		upgradeact = "X_ZuoQi_XiNiu_PaoPao_ShengJie.san";
		quality 	= 1;
		lastMountID = 0;
		nextMountID = 20002;
		minLevel 	= 1;
		maxLevel	= 20;
		sknFile 	= "X_ZuoQi_XiNiu_01.skn";
		sklFile		="X_ZuoQi_XiNiu_PaoPao.skl";
		sanFile 	="X_ZuoQi_XiNiu_PaoPao_DaiJi.san";
		param_1_x = 10; param_1_y =-11; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 10; param_3_y =-11; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};
	[20002] = {
		name 		= "巨角犀";
		pname		= "DaHan2_01";
		needProf 	= 2;
		modelID 	= 900302;
		pfx			= {
		};
		pfx2		= {
			["tx_001"] = 71011;
		};
		grade 		= 2;
		upgradeact = "X_ZuoQi_XiNiu_PaoPao_ShengJie.san";
		quality 	= 1;
		lastMountID = 20001;
		nextMountID = 20003;
		minLevel 	= 1;
		maxLevel 	= 40;
		sknFile 	= "X_ZuoQi_XiNiu_02.skn";
		sklFile		= "X_ZuoQi_XiNiu_PaoPao.skl";
		sanFile 	= "X_ZuoQi_XiNiu_PaoPao_DaiJi.san";
		param_1_x = 10; param_1_y =-11; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 10; param_3_y =-11; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};
	[20003] = {
		name 		= "逐日";
		pname		= "DaHan3_01";
		needProf 	= 2;
		modelID 	= 900303;
		pfx			= {
		};
		pfx2		= {
			["tx_001"] = 71012;
		};
		grade 		= 3;
		upgradeact = "X_ZuoQi_XiNiu_PaoPao_ShengJie.san";
		quality 	= 1;
		lastMountID = 20002;
		nextMountID = 20004;
		minLevel 	= 1;
		maxLevel 	= 60;
		sknFile 	= "X_ZuoQi_XiNiu_PaoPao.skn";
		sklFile		= "X_ZuoQi_XiNiu_PaoPao.skl";
		sanFile 	= "X_ZuoQi_XiNiu_PaoPao_DaiJi.san";
		param_1_x = 10; param_1_y =-11; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 10; param_3_y =-11; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};

	[20004] = {
		name 		= "逐日";
		pname		= "DaHan3_02";
		needProf 	= 2;
		modelID 	= 900303;
		pfx			= {
			["gua_01"] = 70010;
			["gua_03"] = 70011;
		};
		pfx2		= {
			["tx_001"] = 71013;
		};
		grade 		= 3;
		upgradeact = "X_ZuoQi_XiNiu_PaoPao_ShengJie.san";
		quality 	= 2;
		lastMountID = 20003;
		nextMountID = 90401;
		minLevel 	= 1;
		maxLevel 	= 60;
		sknFile 	= "X_ZuoQi_XiNiu_PaoPao.skn";
		sklFile		= "X_ZuoQi_XiNiu_PaoPao.skl";
		sanFile 	= "X_ZuoQi_XiNiu_PaoPao_DaiJi.san";
		param_1_x = 10; param_1_y =-11; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 10; param_3_y =-11; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};
	--剑系坐骑
	[30001] = {
		name 		= "大宛马";
		pname		= "JianNan1_01";
		needProf 	= 3;
		modelID 	= 900101;
		pfx			= {
		};
		pfx2		= {
			["tx_001"] = 71000;
		};
		grade 		= 1;
		upgradeact = "X_ZuoQi_Ma_03_ShengJie.san";
		quality 	= 1;
		lastMountID = 0;
		nextMountID = 30002;
		minLevel	= 1;
		maxLevel 	= 20;
		sknFile 	= "X_ZuoQi_Ma_01.skn";
		sklFile		= "X_ZuoQi_Ma_03.skl";
		sanFile 	= "X_ZuoQi_Ma_03_DaiJi.san";
		param_1_x = 12; param_1_y =-10.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 12; param_3_y =-10.5; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};
	[30002] = {
		name 		= "超影";
		pname		= "JianNan2_01";
		needProf 	= 3;
		modelID 	= 900102;
		pfx			= {
		};
		pfx2		= {
			["tx_001"] = 71001;
		};
		grade 		= 2;
		upgradeact = "X_ZuoQi_Ma_03_ShengJie.san";
		quality 	= 1;
		lastMountID = 30001;
		nextMountID = 30003;
		minLevel 	= 1;
		maxLevel 	= 40;
		sknFile 	= "X_ZuoQi_Ma_02.skn";
		sklFile		= "X_ZuoQi_Ma_03.skl";
		sanFile 	= "X_ZuoQi_Ma_03_DaiJi.san";
		param_1_x = 12; param_1_y =-10.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 12; param_3_y =-10.5; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};
	[30003] = {
		name 		= "绝尘";
		pname		= "JianNan3_01";
		needProf 	= 3;
		modelID 	= 900103;
		pfx			= {
		};
		pfx2		= {
			["tx_001"] = 71002;
		};
		grade 		= 3;
		upgradeact = "X_ZuoQi_Ma_03_ShengJie.san";
		quality 	= 1;
		lastMountID = 30002;
		nextMountID = 30004;
		minLevel 	= 1;
		maxLevel 	= 60;
		sknFile 	= "X_ZuoQi_Ma_03.skn";
		sklFile		= "X_ZuoQi_Ma_03.skl";
		sanFile 	= "X_ZuoQi_Ma_03_DaiJi.san";
		param_1_x = 12; param_1_y =-10.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 12; param_3_y =-10.5; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};

	[30004] = {
		name 		= "绝尘";
		pname		= "JianNan3_02";
		needProf 	= 3;
		modelID 	= 900103;
		pfx			= {
			["bip01 l toe0"] = 70000;
			["bip01 r hand"] = 70000;
			["bip01 r toe0"] = 70000;
			["bip01 l hand"] = 70000;
			["bip01 neck1"] = 70001;
		};
		pfx2		= {
			["tx_001"] = 71003;
		};
		grade 		= 3;
		upgradeact = "X_ZuoQi_Ma_03_ShengJie.san";
		quality 	= 2;
		lastMountID = 30003;
		nextMountID = 90401;
		minLevel 	= 1;
		maxLevel 	= 60;
		sknFile 	= "X_ZuoQi_Ma_03.skn";
		sklFile		= "X_ZuoQi_Ma_03.skl";
		sanFile 	= "X_ZuoQi_Ma_03_DaiJi.san";
		param_1_x = 12; param_1_y =-10.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 12; param_3_y =-10.5; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};
	--枪系坐骑
	[40001] = {
		name 		= "玄豹";
		pname		= "NvQiang1_01";
		needProf 	= 4;
		modelID 	= 900401;
		pfx			= {
		};
		pfx2		= {
			["tx_001"] = 71030;
		};
		grade 		= 1;
		upgradeact = "X_ZuoQi_Bao_ShengJie.san";
		quality 	= 1;
		lastMountID = 0;
		nextMountID = 40002;
		minLevel 	= 1;
		maxLevel 	= 20;
		sknFile 	= "X_ZuoQi_Bao_01.skn";
		sklFile		= "X_ZuoQi_Bao.skl";
		sanFile 	= "X_ZuoQi_Bao_DaiJi.san";
		param_1_x = 7; param_1_y =-10; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 7; param_3_y =-10; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};
	[40002] = {
		name 		= "啸月豹";
		pname		= "NvQiang2_01";
		needProf 	= 4;
		modelID 	= 900402;
		pfx			= {
		};
		pfx2		= {
			["tx_001"] = 71031;
		};
		grade 		= 2;
		upgradeact = "X_ZuoQi_Bao_ShengJie.san";
		quality 	= 1;
		lastMountID = 40001;
		nextMountID = 40003;
		minLevel 	= 10;
		maxLevel	= 40;
		sknFile 	= "X_ZuoQi_Bao_02.skn";
		sklFile		= "X_ZuoQi_Bao.skl";
		sanFile 	= "X_ZuoQi_Bao_DaiJi.san";
		param_1_x = 7; param_1_y =-10; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 7; param_3_y =-10; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};
	[40003] = {
		name 		= "飞芒";
		pname		= "NvQiang3_01";
		needProf 	= 4;
		modelID 	= 900403;
		pfx			= {
		};
		pfx2		= {
			["tx_001"] = 71032;
		};
		grade 		= 3;
		upgradeact = "X_ZuoQi_Bao_ShengJie.san";
		quality 	= 1;
		lastMountID = 40002;
		nextMountID = 40004;
		minLevel 	= 20;
		maxLevel 	= 60;
		sknFile 	= "X_ZuoQi_Bao_03.skn";
		sklFile		= "X_ZuoQi_Bao.skl";
		sanFile 	= "X_ZuoQi_Bao_DaiJi.san";
		param_1_x = 7; param_1_y =-10; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 7; param_3_y =-10; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};

	[40004] = {
		name 		= "飞芒";
		pname		= "NvQiang3_02";
		needProf 	= 4;
		modelID 	= 900403;
		pfx			= {
			["dummy01"] = 70030;
			["gua_01"] = 70031;
		};
		pfx2		= {
			["tx_001"] = 71033;
		};
		grade 		= 3;
		upgradeact = "X_ZuoQi_Bao_ShengJie.san";
		quality 	= 2;
		lastMountID = 40003;
		nextMountID = 90401;
		minLevel 	= 20;
		maxLevel 	= 60;
		sknFile 	= "X_ZuoQi_Bao_03.skn";
		sklFile		= "X_ZuoQi_Bao.skl";
		sanFile 	= "X_ZuoQi_Bao_DaiJi.san";
		param_1_x = 7; param_1_y =-10; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 7; param_3_y =-10; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};
	----------
	--通用坐骑 -----ID规则  9+阶数+品质
	[90401] = {
		name 		= "鬼牙";
		pname		= "TongYong1_01";
		needProf 	= 0;
		modelID 	= 900004;
		pfx			= {
		};
		pfx2		= {
			["tx_001"] = 71040;
		};
		grade 		= 4;
		upgradeact = "X_ZuoQi_04_ShengJie.san";
		quality 	= 1;
		lastMountID = {
			[1] = 10004;
			[2] = 20004;
			[3] = 30004;
			[4] = 40004;
		};
		nextMountID = 90402;
		minLevel 	= 20;
		maxLevel 	= 80;
		sknFile 	= "X_ZuoQi_04.skn";
		sklFile		= "X_ZuoQi_04.skl";
		sanFile 	= "X_ZuoQi_04_DaiJi.san";
		param_1_x = 8; param_1_y =-13.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 8; param_3_y =-13.5; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};

	[90402] = {
		name 		= "鬼牙";
		pname		= "TongYong1_02";
		needProf 	= 0;
		modelID 	= 900004;
		pfx			= {
			["gua_01"] = 70040;
			["bone07"] = 70041;
			["bone09"] = 70041;
			["bone02"] = 70042;
			["bone04"] = 70042;
		};
		pfx2		= {
			["tx_001"] = 71041;
		};
		grade 		= 4;
		upgradeact = "X_ZuoQi_04_ShengJie.san";
		quality 	= 2;
		lastMountID = 90401;
		nextMountID = 90501;
		minLevel 	= 20;
		maxLevel 	= 80;
		sknFile 	= "X_ZuoQi_04.skn";
		sklFile		= "X_ZuoQi_04.skl";
		sanFile 	= "X_ZuoQi_04_DaiJi.san";
		param_1_x = 8; param_1_y =-13.5; param_1_z = 2;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 8; param_3_y =-13.5; param_3_z = 2;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};

	-- [90006] = {
		-- name 		= "鬼牙";
		-- needProf 	= 0;
		-- modelID 	= 900004;
		-- grade 		= 6;
		-- quality 	= 3;
		-- nextMountID = 90007;
		-- minLevel 	= 30;
		-- maxLevel 	= 80;
		-- sknFile 	= "X_ZuoQi_04.skn";
		-- sklFile		= "X_ZuoQi_04.skl";
		-- sanFile 	= "X_ZuoQi_04_DaiJi.san";
		-- param_1_x = -3.7; param_1_y =-9; param_1_z = 0;
		-- param_2_x = 0; param_2_y = 0; param_2_z = 0;
		-- param_3_x = -3.7; param_3_y =-9; param_3_z = 0;
		-- param_4_x = 0; param_4_y = 0; param_4_z = 0;
	-- };

	-- [90007] = {
		-- name 		= "鬼牙";
		-- needProf 	= 0;
		-- modelID 	= 900004;
		-- grade 		= 7;
		-- quality 	= 4;
		-- nextMountID = 90008;
		-- minLevel 	= 30;
		-- maxLevel 	= 80;
		-- sknFile 	= "X_ZuoQi_04.skn";
		-- sklFile		= "X_ZuoQi_04.skl";
		-- sanFile 	= "X_ZuoQi_04_DaiJi.san";
		-- param_1_x = -3.7; param_1_y =-9; param_1_z = 0;
		-- param_2_x = 0; param_2_y = 0; param_2_z = 0;
		-- param_3_x = -3.7; param_3_y =-9; param_3_z = 0;
		-- param_4_x = 0; param_4_y = 0; param_4_z = 0;
	-- };
	-- [90008] = {
		-- name 		= "鬼牙";
		-- needProf 	= 0;
		-- modelID 	= 900004;
		-- grade 		= 8;
		-- quality 	= 5;
		-- nextMountID = 90009;
		-- minLevel 	= 30;
		-- maxLevel 	= 80;
		-- sknFile 	= "X_ZuoQi_04.skn";
		-- sklFile		= "X_ZuoQi_04.skl";
		-- sanFile 	= "X_ZuoQi_04_DaiJi.san";
		-- param_1_x = -3.7; param_1_y =-9; param_1_z = 0;
		-- param_2_x = 0; param_2_y = 0; param_2_z = 0;
		-- param_3_x = -3.7; param_3_y =-9; param_3_z = 0;
		-- param_4_x = 0; param_4_y = 0; param_4_z = 0;
	-- };
		[90501] = {
		name 		= "凌苍";
		pname		= "TongYong7_01";
		needProf 	= 0;
		modelID 	= 900050;
		pfx			= {
			-- ["gua_04"] = 70050;
			-- ["gua_01"] = 70051;
			-- ["gua_03"] = 70052;
			-- ["gua_02"] = 70053;
			-- ["gua_05"] = 70054;

		};
		pfx2		= {
			["tx_001"] = 71100;
		};
		grade 		= 5;
		upgradeact = "X_ZuoQi_Lang_ShengJie.san";
		quality 	= 1;
		lastMountID = 90402;
		nextMountID = 90503;
		minLevel 	= 20;
		maxLevel 	= 100;
		sknFile 	= "X_ZuoQi_Lang.skn";
		sklFile		= "X_ZuoQi_Lang.skl";
		sanFile 	= "X_ZuoQi_Lang_DaiJi.san";
		param_1_x = 5.5; param_1_y =-15.5; param_1_z = 4;param_2_x = 0; param_2_y = 0.5; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 5.5; param_3_y =-15.5; param_3_z = 4;param_4_x = 0; param_4_y = 0.5; param_4_z = 0;	----排行榜显示
	};

	[90503] = {
		name 		= "凌苍";
		pname		= "TongYong7_03";
		needProf 	= 0;
		modelID 	= 900050;
		pfx			= {
			["gua_01"] = 70100;
			["gua_02"] = 70101;
			["gua_04"] = 70102;
			["gua_05"] = 70103;
			["gua_06"] = 70104;
			["bone29"] = 70105;
			["gua_03"] = 70106;
			["bone32"] = 70107;
			["bone26"] = 70108;
			["bone35"] = 70109;
		};
		pfx2		= {
			["tx_001"] = 71100;
		};
		grade 		= 5;
		upgradeact = "X_ZuoQi_Lang_ShengJie.san";
		quality 	= 3;
		lastMountID = 90501;
		nextMountID = 90601;
		minLevel 	= 20;
		maxLevel 	= 100;
		sknFile 	= "X_ZuoQi_Lang.skn";
		sklFile		= "X_ZuoQi_Lang.skl";
		sanFile 	= "X_ZuoQi_Lang_DaiJi.san";
		param_1_x = 5.5; param_1_y =-15.5; param_1_z = 4;param_2_x = 0; param_2_y = 0.5; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 5.5; param_3_y =-15.5; param_3_z = 4;param_4_x = 0; param_4_y = 0.5; param_4_z = 0;	----排行榜显示
	};

	[90601] = {
		name 		= "悬魂";
		pname		= "TongYong2_01";
		needProf 	= 0;
		modelID 	= 900005;
		pfx			= {
		};
		pfx2		= {
			["tx_001"] = 71050;
		};
		grade 		= 6;
		upgradeact = "X_ZuoQi_05_ShengJie.san";
		quality 	= 1;
		lastMountID = 90503;
		nextMountID = 90603;
		minLevel 	= 20;
		maxLevel 	= 100;
		sknFile 	= "X_ZuoQi_05.skn";
		sklFile		= "X_ZuoQi_05.skl";
		sanFile 	= "X_ZuoQi_05_DaiJi.san";
		param_1_x = 5.5; param_1_y =-15.5; param_1_z = 4;param_2_x = 0; param_2_y = 0.5; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 5.5; param_3_y =-15.5; param_3_z = 4;param_4_x = 0; param_4_y = 0.5; param_4_z = 0;	----排行榜显示
	};

	-- [90502] = {
		-- name 		= "悬魂";
		-- needProf 	= 0;
		-- modelID 	= 900005;
		-- grade 		= 5;
		-- quality 	= 2;
		-- nextMountID = 90503;
		-- minLevel 	= 20;
		-- maxLevel 	= 100;
		-- sknFile 	= "X_ZuoQi_05.skn";
		-- sklFile		= "X_ZuoQi_05.skl";
		-- sanFile 	= "X_ZuoQi_05_DaiJi.san";
		-- param_1_x = 0; param_1_y =-10; param_1_z = 0;
		-- param_2_x = 0; param_2_y = 0; param_2_z = 0;
		-- param_3_x = 0; param_3_y =-10; param_3_z = 0;
		-- param_4_x = 0; param_4_y = 0; param_4_z = 0;
	-- };

	[90603] = {
		name 		= "悬魂";
		pname		= "TongYong2_03";
		needProf 	= 0;
		modelID 	= 900005;
		pfx			= {
			["gua_04"] = 70050;
			["gua_01"] = 70051;
			["gua_03"] = 70052;
			["gua_02"] = 70053;
			["gua_05"] = 70054;

		};
		pfx2		= {
			["tx_001"] = 71051;
		};
		grade 		= 6;
		upgradeact = "X_ZuoQi_05_ShengJie.san";
		quality 	= 3;
		lastMountID = 90601;
		nextMountID = 90701;
		minLevel 	= 20;
		maxLevel 	= 100;
		sknFile 	= "X_ZuoQi_05.skn";
		sklFile		= "X_ZuoQi_05.skl";
		sanFile 	= "X_ZuoQi_05_DaiJi.san";
		param_1_x = 5.5; param_1_y =-15.5; param_1_z = 4;param_2_x = 0; param_2_y = 0.5; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 5.5; param_3_y =-15.5; param_3_z = 4;param_4_x = 0; param_4_y = 0.5; param_4_z = 0;	----排行榜显示
	};


	-- [90013] = {
		-- name 		= "悬魂";
		-- needProf 	= 0;
		-- modelID 	= 900005;
		-- grade 		= 13;
		-- quality 	= 5;
		-- nextMountID = 90014;
		-- minLevel 	= 40;
		-- maxLevel 	= 50;
		-- sknFile 	= "X_ZuoQi_05.skn";
		-- sklFile		= "X_ZuoQi_05.skl";
		-- sanFile 	= "X_ZuoQi_05_DaiJi.san";
		-- param_1_x = 0; param_1_y =-10; param_1_z = 0;
		-- param_2_x = 0; param_2_y = 0; param_2_z = 0;
		-- param_3_x = 0; param_3_y =-10; param_3_z = 0;
		-- param_4_x = 0; param_4_y = 0; param_4_z = 0;
	-- };

	[90701] = {
		name 		= "噬鳄龟";
		pname		= "TongYong3_04";
		needProf 	= 0;
		modelID 	= 900006;
		pfx			= {
			["gua_01"] = 70060;
			["gua_02"] = 70061;
			["gua_03"] = 70061;
			["gua_04"] = 70061;
			["gua_05"] = 70061;
			["gua_06"] = 70062;
			["bone08"] = 70063;
			["bone07"] = 70064;
			["bone06"] = 70065;
			["bone05"] = 70066;
			["bone04"] = 70067;
			["bone03"] = 70068;
			["bone02"] = 70069;
			["feetpoint"] = 71069;
		};
		pfx2		= {
			["feetpoint"] = 71060;
		};
		grade 		= 7;
		upgradeact = "X_ZuoQi_06_ShengJie.san";
		quality 	= 4;
		lastMountID = 90603;
		nextMountID = 90801;
		minLevel 	= 20;
		maxLevel 	= 120;
		sknFile 	= "X_ZuoQi_06.skn";
		sklFile		= "X_ZuoQi_06.skl";
		sanFile 	= "X_ZuoQi_06_DaiJi.san";
		param_1_x = 8; param_1_y =-15.5; param_1_z = 4;param_2_x = -1; param_2_y = 1; param_2_z = -0.5;	----坐骑主界面、升阶预览
		param_3_x = 8; param_3_y =-15.5; param_3_z = 4;param_4_x = -1; param_4_y = 1; param_4_z = -0.5; 	----排行榜显示
	};
	-- [90602] = {
		-- name 		= "噬鳄龟";
		-- needProf 	= 0;
		-- modelID 	= 900006;
		-- grade 		= 6;
		-- quality 	= 2;
		-- nextMountID = 90603;
		-- minLevel 	= 20;
		-- maxLevel 	= 120;
		-- sknFile 	= "X_ZuoQi_06.skn";
		-- sklFile		= "X_ZuoQi_06.skl";
		-- sanFile 	= "X_ZuoQi_06_DaiJi.san";
		-- param_1_x = 0; param_1_y =-10; param_1_z = 2.5;
		-- param_2_x = 0; param_2_y = 0; param_2_z = -0.5;
		-- param_3_x = 0; param_3_y =-10; param_3_z = 2.5;
		-- param_4_x = 0; param_4_y = 0; param_4_z = -0.5;
	-- };

--	[90603] = {
	--	name 		= "噬鳄龟";
	--	pname		= "TongYong3_03";
	--	needProf 	= 0;
	--	modelID 	= 900006;
	--	pfx			= {
	--		["gua_01"] = 70060;
	--		["gua_02"] = 70061;
	--		["gua_03"] = 70061;
	--		["gua_04"] = 70061;
	--		["gua_05"] = 70061;
	--		["gua_06"] = 70062;
	--		["bone08"] = 70063;
	--	};
	--	pfx2		= {
	--		["feetpoint"] = 71061;
	--	};
	--	grade 		= 6;
	--	upgradeact = "X_ZuoQi_06_ShengJie.san";
	--	quality 	= 3;
	--	lastMountID = 90601;
	--	nextMountID = 90701;
	--	minLevel 	= 20;
	--	maxLevel 	= 110;
	--	sknFile 	= "X_ZuoQi_06.skn";
	--	sklFile		= "X_ZuoQi_06.skl";
	--	sanFile 	= "X_ZuoQi_06_DaiJi.san";
	--	param_1_x = 8; param_1_y =-15.5; param_1_z = 4;param_2_x = -1; param_2_y = 1; param_2_z = -0.5;	----坐骑主界面、升阶预览
	--	param_3_x = 8; param_3_y =-15.5; param_3_z = 4;param_4_x = -1; param_4_y = 1; param_4_z = -0.5; 	----排行榜显示
	--};
	[90801] = {
		name 		= "白虎";
		pname		= "TongYong4_04";
		needProf 	= 0;
		modelID 	= 900007;
		pfx			= {
			["bip01 neck"] = 70070;
			["bone01"] = 70071;
			["bone02"] = 70071;
			["bone03"] = 70071;
			["bone04"] = 70072;
			["bone05"] = 70072;
			["bip01 l forearm"] = 70073;
			["bip01 r forearm"] = 70073;
			["gua_01"] = 70074;
			["gua_02"] = 70074;
			["gua_03"] = 70075;
		};
		pfx2		= {
			["feetpoint"] = 71071;
		};
		pfx3		= {
	    [1] =         { 
			["bip01 neck"] = 7301001;
            ["bone01"] = 7301002;
			["bone02"] = 7301002;
			["bone03"] = 7301002;
			["bone04"] = 7301002;
			["bone05"] = 7301002;
			["bip01 l forearm"] = 7301003;
			["bip01 r forearm"] = 7301003;
			["gua_01"] = 7301004;
			["gua_02"] = 7301004;
			["gua_03"] = 7301005;  
			["yan01"]  = 7301006;
			["yan02"]  = 7301007;
            };
		[2] =         { 
			["bip01 neck"] = 7302001;
            ["bone01"] = 7302002;
			["bone02"] = 7302002;
			["bone03"] = 7302002;
			["bone04"] = 7302002;
			["bone05"] = 7302002;
			["bip01 l forearm"] = 7302003;
			["bip01 r forearm"] = 7302003;
			["gua_01"] = 7302004;
			["gua_02"] = 7302004;
			["gua_03"] = 7302005;  
			["yan01"]  = 7302006;
			["yan02"]  = 7302007;
            };	
		[3] =         { 
			["bip01 neck"] = 7303001;
            ["bone01"] = 7303002;
			["bone02"] = 7303002;
			["bone03"] = 7303002;
			["bone04"] = 7303002;
			["bone05"] = 7303002;
			["bip01 l forearm"] = 7303003;
			["bip01 r forearm"] = 7303003;
			["gua_01"] = 7303004;
			["gua_02"] = 7303004;
			["gua_03"] = 7303005;  
			["yan01"]  = 7303006;
			["yan02"]  = 7303007;
            };	
		};
		
		grade 		= 8;
		upgradeact = "X_ZuoQi_BaiHu_ShengJie.san";
		quality 	= 4;
		lastMountID = 90701;
		nextMountID = 90901;
		minLevel 	= 20;
		maxLevel 	= 130;
		sknFile 	= "X_ZuoQi_BaiHu.skn";
		sklFile		= "X_ZuoQi_BaiHu.skl";
		sanFile 	= "X_ZuoQi_BaiHu_DaiJi.san";
		param_1_x = 14; param_1_y =-11; param_1_z = 4;param_2_x = 0; param_2_y = 0; param_2_z = 0;	----坐骑主界面、升阶预览
		param_3_x = 14; param_3_y =-11; param_3_z = 4;param_4_x = 0; param_4_y = 0; param_4_z = 0;	----排行榜显示
	};
	[90901] = {
		name 		= "朱雀";
		pname		= "TongYong5_05";
		needProf 	= 0;
		modelID 	= 900008;
		pfx			= {
	         ["gua_03"] = 70080;
			 ["gua_04"] = 70081;
			 ["bone55"] = 70082;
			 ["bone51"] = 70083;
			 ["bone44"] = 70084;
			 ["gua_01"] = 70085;
			 ["gua_05"] = 70088;
			 ["gua_06"] = 70086;
			 ["gua_02"] = 70087;
		};
		pfx2		= {
			["feetpoint"] = 71080;
		};
		pfx3		= {
		[1]         = {
		     ["gua_03"] = 7401001;
			 ["gua_04"] = 7401004;
			 ["bone55"] = 7401003;
			 ["bone51"] = 7401005;
			 ["bone44"] = 7401006;
			 ["gua_01"] = 7401002;
			 ["gua_05"] = 7401007;
			 ["gua_06"] = 7401009;
			 ["gua_02"] = 7401008;
			 ["bip01"]  = 7401010;
		    };
		[2]         = {
		     ["gua_03"] = 7402001;
			 ["gua_04"] = 7402004;
			 ["bone55"] = 7402003;
			 ["bone51"] = 7402005;
			 ["bone44"] = 7402006;
			 ["gua_01"] = 7402002;
			 ["gua_05"] = 7402007;
			 ["gua_06"] = 7402009;
			 ["gua_02"] = 7402008;
			 ["bip01"]  = 7402010;
		    };
		[3]         = {
		     ["gua_03"] = 7403001;
			 ["gua_04"] = 7403004;
			 ["bone55"] = 7403003;
			 ["bone51"] = 7403005;
			 ["bone44"] = 7403006;
			 ["gua_01"] = 7403002;
			 ["gua_05"] = 7403007;
			 ["gua_06"] = 7403009;
			 ["gua_02"] = 7403008;
			 ["bip01"]  = 7403010;
		    };		
		};
		grade 		= 9;
		upgradeact = "X_ZuoQi_ZhuQue_ShengJie.san";
		quality 	= 5;
		lastMountID = 90801;
		nextMountID = 100901;
		minLevel 	= 20;
		maxLevel 	= 140;
		sknFile 	= "X_ZuoQi_ZhuQue.skn";
		sklFile		= "X_ZuoQi_ZhuQue.skl";
		sanFile 	= "X_ZuoQi_ZhuQue_DaiJi.san";
		param_1_x = 8; param_1_y =-18; param_1_z = 10;param_2_x = 0; param_2_y = 0; param_2_z = 1;	----坐骑主界面、升阶预览
		param_3_x = 8; param_3_y =-18; param_3_z = 10;param_4_x = 0; param_4_y = 0; param_4_z = 1;	----排行榜显示
	};
	[100901] = {
		name 		= "青龙";
		pname		= "TongYong6_05";
		needProf 	= 0;
		modelID 	= 900009;
		pfx			= {
             ["bone126"] = 70901;
			 ["bone01"] = 70902;
			 ["bone99"] = 70903;
			 ["gua_01"] = 70904;
		     ["gua_02"] = 70905;
			 ["feetpoint"] = 70906;
			 ["bone70"] = 70907;
			 ["bone79"] = 70908;
			 ["bone06"] = 70909;
			 ["bone07"] = 70910;
			 ["bone08"] = 70911;
			 ["bone09"] = 70912;
			 ["bone10"] = 70913;
			 ["bone11"] = 70914;
			 ["bone03"] = 70915;
			 ["bone04"] = 70916;
			 ["bone05"] = 70917;
			 ["bone12"] = 70918;
			 ["bone13"] = 70919;
			 ["bone142"] = 70920;
			 ["bone143"] = 70921;
			 ["bone144"] = 70922;
			 ["bone145"] = 70923;
			 ["bone146"] = 70924;
			 ["bone147"] = 70925;
			 ["bone148"] = 70926;
			 ["bone149"] = 70927;
             ["bone150"] = 70928;
             ["gua_03"] = 70929;
             ["bone32"] = 70930;
             ["bone33"] = 70931;
             ["bone34"] = 70932;
             ["bone35"] = 70933;
             ["bone36"] = 70934;
             ["bone31"] = 70935;
             ["bone30"] = 70936;
             ["bone37"] = 70937;
             ["bone40"] = 70938;
             ["bone41"] = 70939;
             ["bone42"] = 70940;
             ["bone43"] = 70941;
             ["bone44"] = 70942;
             ["bone45"] = 70943;
             ["bone46"] = 70944;
             ["bone47"] = 70945;
		};
		pfx2		= {
			 ["feetpoint"] = 71090;
		};
		
		pfx3		= {
		[1]         = {
		     ["bone126"] = 7501001;
			 ["bone01"] = 7501002;
			 ["bone99"] = 7501001;
			 ["gua_01"] = 7501003;
		     ["gua_02"] = 7501003;
			 --["feetpoint"] = 70906;
			 ["bone70"] = 7501004;
			 ["bone79"] = 7501005;
			 ["bone06"] = 7501006;
			 ["bone07"] = 7501006;
			 ["bone08"] = 7501006;
			 ["bone09"] = 7501006;
			 ["bone10"] = 7501006;
			 ["bone11"] = 7501006;
			 ["bone03"] = 7501006;
			 ["bone04"] = 7501006;
			 ["bone05"] = 7501006;
			 ["bone12"] = 7501006;
			 ["bone13"] = 7501006;
			 ["bone142"] = 7501006;
			 ["bone143"] = 7501006;
			 ["bone144"] = 7501006;
			 ["bone145"] = 7501006;
			 ["bone146"] = 7501006;
			 ["bone147"] = 7501006;
			 ["bone148"] = 7501007;
			 ["bone149"] = 7501007;
             ["bone150"] = 7501007;
             ["gua_03"] = 7501008;
             ["bone32"] = 7501009;
             ["bone33"] = 7501009;
             ["bone34"] = 7501009;
             ["bone35"] = 7501009;
             ["bone36"] = 7501009;
             ["bone31"] = 7501009;
             ["bone30"] = 7501009;
             ["bone37"] = 7501009;
             ["bone40"] = 7501009;
             ["bone41"] = 7501009;
             ["bone42"] = 7501009;
             ["bone43"] = 7501009;
             ["bone44"] = 7501009;
             ["bone45"] = 7501009;
             ["bone46"] = 7501009;
             ["bone47"] = 7501009;
		    };
		[2]         = {
		     ["bone126"] = 7502001;
			 ["bone01"] = 7502002;
			 ["bone99"] = 7502001;
			 ["gua_01"] = 7502003;
		     ["gua_02"] = 7502003;
			 --["feetpoint"] = 70906;
			 ["bone70"] = 7502004;
			 ["bone79"] = 7502005;
			 ["bone06"] = 7502006;
			 ["bone07"] = 7502006;
			 ["bone08"] = 7502006;
			 ["bone09"] = 7502006;
			 ["bone10"] = 7502006;
			 ["bone11"] = 7502006;
			 ["bone03"] = 7502006;
			 ["bone04"] = 7502006;
			 ["bone05"] = 7502006;
			 ["bone12"] = 7502006;
			 ["bone13"] = 7502006;
			 ["bone142"] = 7502006;
			 ["bone143"] = 7502006;
			 ["bone144"] = 7502006;
			 ["bone145"] = 7502006;
			 ["bone146"] = 7502006;
			 ["bone147"] = 7502006;
			 ["bone148"] = 7502007;
			 ["bone149"] = 7502007;
             ["bone150"] = 7502007;
             ["gua_03"] = 7502008;
             ["bone32"] = 7502009;
             ["bone33"] = 7502009;
             ["bone34"] = 7502009;
             ["bone35"] = 7502009;
             ["bone36"] = 7502009;
             ["bone31"] = 7502009;
             ["bone30"] = 7502009;
             ["bone37"] = 7502009;
             ["bone40"] = 7502009;
             ["bone41"] = 7502009;
             ["bone42"] = 7502009;
             ["bone43"] = 7502009;
             ["bone44"] = 7502009;
             ["bone45"] = 7502009;
             ["bone46"] = 7502009;
             ["bone47"] = 7502009;
		    };	
		[3]         = {
		     ["bone126"] = 7503001;
			 ["bone01"] = 7503002;
			 ["bone99"] = 7503001;
			 ["gua_01"] = 7503003;
		     ["gua_02"] = 7503003;
			 --["feetpoint"] = 70906;
			 ["bone70"] = 7503004;
			 ["bone79"] = 7503005;
			 ["bone06"] = 7503006;
			 ["bone07"] = 7503006;
			 ["bone08"] = 7503006;
			 ["bone09"] = 7503006;
			 ["bone10"] = 7503006;
			 ["bone11"] = 7503006;
			 ["bone03"] = 7503006;
			 ["bone04"] = 7503006;
			 ["bone05"] = 7503006;
			 ["bone12"] = 7503006;
			 ["bone13"] = 7503006;
			 ["bone142"] = 7503006;
			 ["bone143"] = 7503006;
			 ["bone144"] = 7503006;
			 ["bone145"] = 7503006;
			 ["bone146"] = 7503006;
			 ["bone147"] = 7503006;
			 ["bone148"] = 7503007;
			 ["bone149"] = 7503007;
             ["bone150"] = 7503007;
             ["gua_03"] = 7503008;
             ["bone32"] = 7503009;
             ["bone33"] = 7503009;
             ["bone34"] = 7503009;
             ["bone35"] = 7503009;
             ["bone36"] = 7503009;
             ["bone31"] = 7503009;
             ["bone30"] = 7503009;
             ["bone37"] = 7503009;
             ["bone40"] = 7503009;
             ["bone41"] = 7503009;
             ["bone42"] = 7503009;
             ["bone43"] = 7503009;
             ["bone44"] = 7503009;
             ["bone45"] = 7503009;
             ["bone46"] = 7503009;
             ["bone47"] = 7503009;
		    };	
		};
		grade 		= 10;
		upgradeact = "X_ZuoQi_QingLong_ShengJie.san";
		quality 	= 5;
		lastMountID = 90901;
		nextMountID = 110901;
		minLevel 	= 20;
		maxLevel 	= 150;
		sknFile 	= "X_ZuoQi_QingLong.skn";
		sklFile		= "X_ZuoQi_QingLong.skl";
		sanFile 	= "X_ZuoQi_QingLong_DaiJi.san";
		param_1_x = 8; param_1_y =-18; param_1_z = 10;param_2_x = 0; param_2_y = 0; param_2_z = 1;	----坐骑主界面、升阶预览
		param_3_x = 8; param_3_y =-18; param_3_z = 10;param_4_x = 0; param_4_y = 0; param_4_z = 1;	----排行榜显示
	};
	[110901] = {
		name 		= "炎龙";
		pname		= "TongYong8_05";
		needProf 	= 0;
		modelID 	= 900010;
		pfx			= {
             ["bone03"] = 70950;
			 ["bone04"] = 70950;
			 ["bone05"] = 70950;
			 ["bone06"] = 70950;
			 ["bone07"] = 70950;
			 ["bone08"] = 70950;
			 ["bone09"] = 70950;
			 ["bone10"] = 70950;
			 ["bone11"] = 70950;
			 ["bone12"] = 70950;
			 ["bone13"] = 70950;
			 ["bone14"] = 70950;
			 
			 ["bone126"] = 70955;--70901
			 ["bone99"] = 70955;--70903
			 
			 ["gua_01"] = 70904;
			 ["gua_02"] = 70905;
			 ["feetpoint"] = 70906;
			 ["bone70"] = 70907;
			 ["bone79"] = 70908;

			 ["bone142"] = 70920;
			 ["bone143"] = 70921;
			 ["bone144"] = 70922;
			 ["bone145"] = 70923;
			 ["bone146"] = 70924;
			 ["bone147"] = 70925;
			 ["bone148"] = 70926;
			 ["bone149"] = 70927;
             ["bone150"] = 70928;
             ["gua_03"] = 70929;
             ["bone32"] = 70930;
             ["bone33"] = 70931;
             ["bone34"] = 70932;
             ["bone35"] = 70933;
             ["bone36"] = 70934;
             ["bone31"] = 70935;
             ["bone30"] = 70936;
             ["bone37"] = 70937;
             ["bone40"] = 70938;
             ["bone41"] = 70939;
             ["bone42"] = 70940;
             ["bone43"] = 70941;
             ["bone44"] = 70942;
             ["bone45"] = 70943;
             ["bone46"] = 70944;
             ["bone47"] = 70945;
		};
		pfx2		= {
			 ["feetpoint"] = 71090;
		};
		pfx3		= {
		[1]         = {
		     ["bone126"] = 7501001;
			 ["bone01"] = 7501002;
			 ["bone99"] = 7501001;
			 ["gua_01"] = 7501003;
		     ["gua_02"] = 7501003;
			 --["feetpoint"] = 70906;
			 ["bone70"] = 7501004;
			 ["bone79"] = 7501005;
			 ["bone06"] = 7501006;
			 ["bone07"] = 7501006;
			 ["bone08"] = 7501006;
			 ["bone09"] = 7501006;
			 ["bone10"] = 7501006;
			 ["bone11"] = 7501006;
			 ["bone03"] = 7501006;
			 ["bone04"] = 7501006;
			 ["bone05"] = 7501006;
			 ["bone12"] = 7501006;
			 ["bone13"] = 7501006;
			 ["bone142"] = 7501006;
			 ["bone143"] = 7501006;
			 ["bone144"] = 7501006;
			 ["bone145"] = 7501006;
			 ["bone146"] = 7501006;
			 ["bone147"] = 7501006;
			 ["bone148"] = 7501007;
			 ["bone149"] = 7501007;
             ["bone150"] = 7501007;
             ["gua_03"] = 7501008;
             ["bone32"] = 7501009;
             ["bone33"] = 7501009;
             ["bone34"] = 7501009;
             ["bone35"] = 7501009;
             ["bone36"] = 7501009;
             ["bone31"] = 7501009;
             ["bone30"] = 7501009;
             ["bone37"] = 7501009;
             ["bone40"] = 7501009;
             ["bone41"] = 7501009;
             ["bone42"] = 7501009;
             ["bone43"] = 7501009;
             ["bone44"] = 7501009;
             ["bone45"] = 7501009;
             ["bone46"] = 7501009;
             ["bone47"] = 7501009;
		    };
		[2]         = {
		     ["bone126"] = 7502001;
			 ["bone01"] = 7502002;
			 ["bone99"] = 7502001;
			 ["gua_01"] = 7502003;
		     ["gua_02"] = 7502003;
			 --["feetpoint"] = 70906;
			 ["bone70"] = 7502004;
			 ["bone79"] = 7502005;
			 ["bone06"] = 7502006;
			 ["bone07"] = 7502006;
			 ["bone08"] = 7502006;
			 ["bone09"] = 7502006;
			 ["bone10"] = 7502006;
			 ["bone11"] = 7502006;
			 ["bone03"] = 7502006;
			 ["bone04"] = 7502006;
			 ["bone05"] = 7502006;
			 ["bone12"] = 7502006;
			 ["bone13"] = 7502006;
			 ["bone142"] = 7502006;
			 ["bone143"] = 7502006;
			 ["bone144"] = 7502006;
			 ["bone145"] = 7502006;
			 ["bone146"] = 7502006;
			 ["bone147"] = 7502006;
			 ["bone148"] = 7502007;
			 ["bone149"] = 7502007;
             ["bone150"] = 7502007;
             ["gua_03"] = 7502008;
             ["bone32"] = 7502009;
             ["bone33"] = 7502009;
             ["bone34"] = 7502009;
             ["bone35"] = 7502009;
             ["bone36"] = 7502009;
             ["bone31"] = 7502009;
             ["bone30"] = 7502009;
             ["bone37"] = 7502009;
             ["bone40"] = 7502009;
             ["bone41"] = 7502009;
             ["bone42"] = 7502009;
             ["bone43"] = 7502009;
             ["bone44"] = 7502009;
             ["bone45"] = 7502009;
             ["bone46"] = 7502009;
             ["bone47"] = 7502009;
		    };	
		[3]         = {
		     ["bone126"] = 7503001;
			 ["bone01"] = 7503002;
			 ["bone99"] = 7503001;
			 ["gua_01"] = 7503003;
		     ["gua_02"] = 7503003;
			 --["feetpoint"] = 70906;
			 ["bone70"] = 7503004;
			 ["bone79"] = 7503005;
			 ["bone06"] = 7503006;
			 ["bone07"] = 7503006;
			 ["bone08"] = 7503006;
			 ["bone09"] = 7503006;
			 ["bone10"] = 7503006;
			 ["bone11"] = 7503006;
			 ["bone03"] = 7503006;
			 ["bone04"] = 7503006;
			 ["bone05"] = 7503006;
			 ["bone12"] = 7503006;
			 ["bone13"] = 7503006;
			 ["bone142"] = 7503006;
			 ["bone143"] = 7503006;
			 ["bone144"] = 7503006;
			 ["bone145"] = 7503006;
			 ["bone146"] = 7503006;
			 ["bone147"] = 7503006;
			 ["bone148"] = 7503007;
			 ["bone149"] = 7503007;
             ["bone150"] = 7503007;
             ["gua_03"] = 7503008;
             ["bone32"] = 7503009;
             ["bone33"] = 7503009;
             ["bone34"] = 7503009;
             ["bone35"] = 7503009;
             ["bone36"] = 7503009;
             ["bone31"] = 7503009;
             ["bone30"] = 7503009;
             ["bone37"] = 7503009;
             ["bone40"] = 7503009;
             ["bone41"] = 7503009;
             ["bone42"] = 7503009;
             ["bone43"] = 7503009;
             ["bone44"] = 7503009;
             ["bone45"] = 7503009;
             ["bone46"] = 7503009;
             ["bone47"] = 7503009;
		    };	
		};
		grade 		= 11;
		upgradeact = "X_ZuoQi_QingLong_ShengJie.san";
		quality 	= 5;
		lastMountID = 100901;
		nextMountID = 120901;
		minLevel 	= 20;
		maxLevel 	= 150;
		sknFile 	= "X_ZuoQi_JinLong.skn";
		sklFile		= "X_ZuoQi_QingLong.skl";
		sanFile 	= "X_ZuoQi_QingLong_DaiJi.san";
		param_1_x = 8; param_1_y =-18; param_1_z = 10;param_2_x = 0; param_2_y = 0; param_2_z = 1;	----坐骑主界面、升阶预览
		param_3_x = 8; param_3_y =-18; param_3_z = 10;param_4_x = 0; param_4_y = 0; param_4_z = 1;	----排行榜显示
	};
	[120901] = {
		name 		= "麒麟";
		pname		= "TongYong9_05";
		needProf 	= 0;
		modelID 	= 900011;
		pfx			= {
             ["bip01 r forearm"] = 72101;
			 ["bip01 l forearm"] = 72101;
			 ["gua_03"] = 72102;
			 ["gua_01"] = 72103;
			 ["gua_02"] = 72104;
			 ["bip01 head"] = 72105;
			 ["bip01 r thigh"] = 72106;
			 ["bip01 l thigh"] = 72107;
			 ["bip01 l foot"] = 72108;
			 ["bip01 r foot"] = 72109;
			 ["bip01 r upperarm"] = 72110;
			 ["bip01 l upperarm"] = 72111;
			 ["bip01 r hand"] = 72112;
			 ["bip01 l hand"] = 72113;
			 ["bone10"] = 72114;
			 ["bone02"] = 72115;
			 ["bone04"] = 72116;
			 ["bone06"] = 72117;
		};
		pfx2		= {
			 ["feetpoint"] = 71090;
		};
		pfx3		= {
		[1]         = {
			 ["bip01 r forearm"] = 7601001;
			 ["bip01 l forearm"] = 7601001;
			 ["gua_03"] =7601002;
			 ["gua_01"] = 7601003;
			 ["gua_02"] = 7601004;
			 ["bip01 head"] = 7601005;
			 ["bip01 r thigh"] = 7601006;
			 ["bip01 l thigh"] = 7601007;
			 ["bip01 l foot"] = 7601008;
			 ["bip01 r foot"] = 7601009;
			 ["bip01 r upperarm"] = 7601010;
			 ["bip01 l upperarm"] = 7601011;
			 ["bip01 r hand"] = 7601012;
			 ["bip01 l hand"] = 7601013;
			 ["bone10"] = 7601014;
			 ["bone02"] = 7601015;
			 ["bone04"] = 7601016;
			 ["bone06"] = 7601017; 
            };	
        [2]         = {
			 ["bip01 r forearm"] = 7602001;
			 ["bip01 l forearm"] = 7602001;
			 ["gua_03"] =7602002;
			 ["gua_01"] = 7602003;
			 ["gua_02"] = 7602004;
			 ["bip01 head"] = 7602005;
			 ["bip01 r thigh"] = 7602006;
			 ["bip01 l thigh"] = 7602007;
			 ["bip01 l foot"] = 7602008;
			 ["bip01 r foot"] = 7602009;
			 ["bip01 r upperarm"] = 7602010;
			 ["bip01 l upperarm"] = 7602011;
			 ["bip01 r hand"] = 7602012;
			 ["bip01 l hand"] = 7602013;
			 ["bone10"] = 7602014;
			 ["bone02"] = 7602015;
			 ["bone04"] = 7602016;
			 ["bone06"] = 7602017; 
            };
		[3]         = {
			 ["bip01 r forearm"] = 7603001;
			 ["bip01 l forearm"] = 7603001;
			 ["gua_03"] =7603002;
			 ["gua_01"] = 7603003;
			 ["gua_02"] = 7603004;
			 ["bip01 head"] = 7603005;
			 ["bip01 r thigh"] = 7603006;
			 ["bip01 l thigh"] = 7603007;
			 ["bip01 l foot"] = 7603008;
			 ["bip01 r foot"] = 7603009;
			 ["bip01 r upperarm"] = 7603010;
			 ["bip01 l upperarm"] = 7603011;
			 ["bip01 r hand"] = 7603012;
			 ["bip01 l hand"] = 7603013;
			 ["bone10"] = 7603014;
			 ["bone02"] = 7603015;
			 ["bone04"] = 7603016;
			 ["bone06"] = 7603017; 
            };	
		};
		grade 		= 12;
		upgradeact = "X_ZuoQi_QiLin_DaiJi.san";
		quality 	= 5;
		lastMountID = 110901;
		nextMountID = 0;
		minLevel 	= 20;
		maxLevel 	= 150;
		sknFile 	= "X_ZuoQi_QiLin.skn";
		sklFile		= "X_ZuoQi_QiLin.skl";
		sanFile 	= "X_ZuoQi_QiLin_DaiJi.san";
		param_1_x = 10; param_1_y =-18; param_1_z = 1;param_2_x = 0; param_2_y = 0; param_2_z = 0.85;	----坐骑主界面、升阶预览
		param_3_x = 10; param_3_y =-18; param_3_z = 1;param_4_x = 0; param_4_y = 0; param_4_z = 0.85;	----排行榜显示
	};
	-- [90018] = {
		-- name 		= "噬鳄龟4";
		-- needProf 	= 0;
		-- modelID 	= 900006;
		-- grade 		= 18;
		-- quality 	= 5;
		-- nextMountID = 0;
		-- minLevel 	= 80;
		-- maxLevel 	= 90;
		-- sknFile 	= "X_ZuoQi_06.skn";
		-- sklFile		= "X_ZuoQi_06.skl";
		-- sanFile 	= "X_ZuoQi_06_DaiJi.san";
		-- param_1_x = 0; param_1_y =-10; param_1_z = 2.5;
		-- param_2_x = 0; param_2_y = 0; param_2_z = -0.5;
		-- param_3_x = 0; param_3_y =-10; param_3_z = 2.5;
		-- param_4_x = 0; param_4_y = 0; param_4_z = -0.5;
	-- };
};
--【坐骑基本属性配置】
_G.CMountBasePropConfig = {
	--【mountInst】
	----获得等阶	mountInst:GetGrade()
	----获得等级	mountInst:GetLevel()
	----获得品质	mountInst:GetQuality()
	----获得攻击资质	mountInst:GetGongJiAptitude()
	----获得防御资质	mountInst:GetFangYuAptitude()
	----获得根骨资质	mountInst:GetGenGuAptitude()
	----获得技巧资质	mountInst:GetJiQiaoAptitude()
	--移动速度增加
	AddSpeed = function(mountInst)
		local speed = mountInst:GetGrade()
		return math.floor(150+(speed-1)*(5+(speed-2)*(2+speed/10)));
	end;

	--坐骑品阶系数
	QualityFactor =
	{
		0,
		6,
		9,
		12,
		15,
	},

	--坐骑等阶系数
	GradeFactor =
	{
		1,
		2,
		3,
		4.5,
		6.3,
		8.3,
		10.6,
		13.6,
		17.1,
		21.6,
		22,
		23,
		23,
	},


	--六项基本属性加成数值
	----加生命
	AddShengMing = function(mountInst,level)
		if(not level) then
			level = mountInst:GetLevel();
		end
		local Grade = mountInst:GetGrade()
		if (Grade >= 11) then
			Grade = 10;
		end
		local xishu = 1 - (Grade-1) * 0.01;
			if xishu <= 0 then
			   xishu = 0.95;
			end

		local baseShengMing = _G.CMountSixBasePropConfig[level].n_ShengMing * xishu * CMountBasePropConfig.GradeFactor[mountInst:GetGrade()];
			  baseShengMing = baseShengMing + _G.CMountSixBasePropConfig_v[mountInst:GetGrade()].n_ShengMing;
			  baseShengMing = baseShengMing/100 * (100 + CMountBasePropConfig.QualityFactor[mountInst:GetQuality()]);
			  baseShengMing = baseShengMing + _G.RefineMedicineAttr[9405040].n_ShengMing * mountInst:GetZZGCount();
		return math.floor(baseShengMing)
	end;
	----加内力
	AddNeiLi = function(mountInst,level)
		if(not level) then
			level = mountInst:GetLevel();
		end
		local Grade = mountInst:GetGrade()
		if (Grade >= 11) then
			Grade = 10;
		end	
		
		local xishu = 1 - (Grade-1) * 0.1;
			if xishu <= 0 then
			   xishu = 0.95;
			end

		local baseNeiLi = _G.CMountSixBasePropConfig[level].n_NeiLi * xishu * CMountBasePropConfig.GradeFactor[mountInst:GetGrade()];
			  baseNeiLi = baseNeiLi + _G.CMountSixBasePropConfig_v[mountInst:GetGrade()].n_NeiLi;
			  baseNeiLi = baseNeiLi/100 * (100 + CMountBasePropConfig.QualityFactor[mountInst:GetQuality()]);
			  baseNeiLi = baseNeiLi + _G.RefineMedicineAttr[9405040].n_NeiLi * mountInst:GetZZGCount();
		return math.floor(baseNeiLi);
	end;
	----加攻击
	AddGongJi = function(mountInst,level)
		if(not level) then
			level = mountInst:GetLevel();
		end
		local Grade = mountInst:GetGrade()
		if (Grade >= 11) then
			Grade = 10;
		end
		
		local xishu = 1 - (Grade-1) * 0.02;
			if xishu <= 0 then
			   xishu = 0.95;
			end

		local baseGongJi = _G.CMountSixBasePropConfig[level].n_GongJi * xishu * CMountBasePropConfig.GradeFactor[mountInst:GetGrade()];
			  baseGongJi = baseGongJi + _G.CMountSixBasePropConfig_v[mountInst:GetGrade()].n_GongJi;
			  baseGongJi = baseGongJi/100 * (100 + CMountBasePropConfig.QualityFactor[mountInst:GetQuality()]);
			  baseGongJi = baseGongJi + _G.RefineMedicineAttr[9405040].n_GongJi * mountInst:GetZZGCount();
		return math.floor(baseGongJi);
	end;
	----加防御
	AddFangYu = function(mountInst,level)
		if(not level) then
			level = mountInst:GetLevel();
		end
		local Grade = mountInst:GetGrade()
		if (Grade >= 11) then
			Grade = 10;
		end	
		
		local xishu = 1 - (Grade-1) * 0.02;
			if xishu <= 0 then
			   xishu = 0.95;
			end

		local baseFangYu = _G.CMountSixBasePropConfig[level].n_FangYu * xishu * CMountBasePropConfig.GradeFactor[mountInst:GetGrade()];
			  baseFangYu = baseFangYu + _G.CMountSixBasePropConfig_v[mountInst:GetGrade()].n_FangYu;
			  baseFangYu = baseFangYu/100 * (100 + CMountBasePropConfig.QualityFactor[mountInst:GetQuality()]);
			  baseFangYu = baseFangYu + _G.RefineMedicineAttr[9405040].n_FangYu * mountInst:GetZZGCount();
		return math.floor(baseFangYu);
	end;
	----加暴击
	AddBaoJi = function(mountInst,level)
		if(not level) then
			level = mountInst:GetLevel();
		end
		local Grade = mountInst:GetGrade()
		if (Grade >= 11) then
			Grade = 10;
		end	
		
		local xishu = 1 - (Grade-1) * 0.1;
			if xishu <= 0 then
			   xishu = 0.95;
			end

		local baseBaoJi = _G.CMountSixBasePropConfig[level].n_BaoJi * xishu * CMountBasePropConfig.GradeFactor[mountInst:GetGrade()];
			  baseBaoJi = baseBaoJi + _G.CMountSixBasePropConfig_v[mountInst:GetGrade()].n_BaoJi;
			  baseBaoJi = baseBaoJi/100 * (100 + CMountBasePropConfig.QualityFactor[mountInst:GetQuality()]);
			  baseBaoJi = baseBaoJi + _G.RefineMedicineAttr[9405040].n_BaoJi * mountInst:GetZZGCount();
		return math.floor(baseBaoJi);
	end;
	----加身法
	AddShenFa = function(mountInst,level)
		if(not level) then
			level = mountInst:GetLevel();
		end
	  	local Grade = mountInst:GetGrade()
			if (Grade >= 11) then
			Grade = 10;
		end	

		local xishu = 1 - (Grade-1) * 0.05;
			if xishu <= 0 then
			   xishu = 0.95;
			end

		local baseShenFa = _G.CMountSixBasePropConfig[level].n_ShenFa * xishu * CMountBasePropConfig.GradeFactor[mountInst:GetGrade()];
			  baseShenFa = baseShenFa + _G.CMountSixBasePropConfig_v[mountInst:GetGrade()].n_ShenFa;
			  baseShenFa = baseShenFa/100 * (100 + CMountBasePropConfig.QualityFactor[mountInst:GetQuality()]);
			  baseShenFa = baseShenFa + _G.RefineMedicineAttr[9405040].n_ShenFa * mountInst:GetZZGCount();
		return math.floor(baseShenFa);
	end;
	----转生加属性
	AddChangeRankAttr = function(mountInst)
		local changeRankAttr = _G.SSingleAttrChange:new();
		for k,v in pairs(mountInst:GetChangeRank()) do
			changeRankAttr.dwHPMax = changeRankAttr.dwHPMax + _G.CMountBasePropConfig.AddShengMing(mountInst,v) - _G.CMountBasePropConfig.AddShengMing(mountInst,mountInst:GetMinLevel());
			changeRankAttr.dwMPMax = changeRankAttr.dwMPMax + _G.CMountBasePropConfig.AddNeiLi(mountInst,v) - _G.CMountBasePropConfig.AddNeiLi(mountInst,mountInst:GetMinLevel());
			changeRankAttr.dwAttack = changeRankAttr.dwAttack + _G.CMountBasePropConfig.AddGongJi(mountInst,v)- _G.CMountBasePropConfig.AddGongJi(mountInst,mountInst:GetMinLevel());
			changeRankAttr.dwDefense = changeRankAttr.dwDefense + _G.CMountBasePropConfig.AddFangYu(mountInst,v)- _G.CMountBasePropConfig.AddFangYu(mountInst,mountInst:GetMinLevel());
			changeRankAttr.dwCrit = changeRankAttr.dwCrit + _G.CMountBasePropConfig.AddBaoJi(mountInst,v)- _G.CMountBasePropConfig.AddBaoJi(mountInst,mountInst:GetMinLevel());
			changeRankAttr.dwFlee = changeRankAttr.dwFlee + _G.CMountBasePropConfig.AddShenFa(mountInst,v)- _G.CMountBasePropConfig.AddShenFa(mountInst,mountInst:GetMinLevel());
		end;
		return changeRankAttr;
	end;
	
	
	--资质上限
	tMaxAptitude =
	{
		240,
		330,
		460,
		660,
		960,
		1410,
		2060,
		2960,
		4360,
		4360,
		4360,
		4360,
		4360,
		4360,
	},

	MaxAptitude = function(mountInst)
		return math.floor(CMountBasePropConfig.tMaxAptitude[mountInst:GetGrade()] * (1+(mountInst:GetQuality()-1)/15) + mountInst:GetLevel() * 2);
	end;
	--【mountInst】
	----获得等阶	mountInst:GetGrade()
	----获得等级	mountInst:GetLevel()
	----获得品质	mountInst:GetQuality()
	----获得攻击资质	mountInst:GetGongJiAptitude()
	----获得防御资质	mountInst:GetFangYuAptitude()
	----获得根骨资质	mountInst:GetGenGuAptitude()
	----获得技巧资质	mountInst:GetJiQiaoAptitude()
	--移动速度增加
	--基本资质
	----n_Grade	坐骑阶数
	BaseAptitude = function(n_Grade)
		return 0;
	end;
	
	--最大可服用资质果上限(客户端显示用 不用作实际的逻辑判断)
	MaxCanEatZZGCountForClient = function(n_Grade)
		local retCount = 0;
		
		if n_Grade <= 3 then
			retCount = 0;
		elseif n_Grade == 4 then
			retCount = 20;
	    elseif n_Grade == 5 then
			retCount = 60;
		elseif n_Grade == 6 then
			retCount = 130;
		elseif n_Grade == 7 then
			retCount = 240;
		elseif n_Grade == 8 then
			retCount = 400;
		elseif n_Grade == 9 then
			retCount = 640;
		elseif n_Grade == 10 then
			retCount = 1000;
		elseif n_Grade == 11 then
			retCount = 1360;
		elseif n_Grade == 12 then
			retCount = 1750;
		end
		
		return retCount;
	end;
	
	--最大可服用资质果上限
	MaxCanEatZZGCount = function(n_Grade)
		local retCount = 0;
		if n_Grade <= 3 then
			retCount = 0;
		elseif n_Grade == 4 then
			retCount = 20;
	    elseif n_Grade == 5 then
			retCount = 60;
		elseif n_Grade == 6 then
			retCount = 130;
		elseif n_Grade == 7 then
			retCount = 240;
		elseif n_Grade == 8 then
			retCount = 400;
		elseif n_Grade == 9 then
			retCount = 640;
		elseif n_Grade == 10 then
			retCount = 1000;
		elseif n_Grade == 11 then
			retCount = 1360;
		elseif n_Grade == 12 then
			retCount = 1750;
		end
	    return retCount;
	end;
	
	--资质果物品配置Id
	ZZGEnumId = 9405040; 
};


--【坐骑不同等阶六项基本属性配置】
_G.CMountSixBasePropConfig_v={
	[1]={n_Level=1,n_ShengMing=100,n_NeiLi=26,n_GongJi=33,n_FangYu=18,n_BaoJi=14,n_ShenFa=16,},
	[2]={n_Level=2,n_ShengMing=200,n_NeiLi=42,n_GongJi=78,n_FangYu=37,n_BaoJi=20,n_ShenFa=23,},
	[3]={n_Level=3,n_ShengMing=420,n_NeiLi=75,n_GongJi=173,n_FangYu=78,n_BaoJi=34,n_ShenFa=39,},
	[4]={n_Level=4,n_ShengMing=770,n_NeiLi=125,n_GongJi=318,n_FangYu=142,n_BaoJi=56,n_ShenFa=65,},
	[5]={n_Level=5,n_ShengMing=1270,n_NeiLi=191,n_GongJi=518,n_FangYu=232,n_BaoJi=88,n_ShenFa=102,},
	[6]={n_Level=6,n_ShengMing=2070,n_NeiLi=291,n_GongJi=825,n_FangYu=374,n_BaoJi=139,n_ShenFa=160,},
	[7]={n_Level=7,n_ShengMing=3070,n_NeiLi=408,n_GongJi=1195,n_FangYu=549,n_BaoJi=202,n_ShenFa=232,},
	[8]={n_Level=8,n_ShengMing=5000,n_NeiLi=622,n_GongJi=1884,n_FangYu=881,n_BaoJi=324,n_ShenFa=371,},
	[9]={n_Level=9,n_ShengMing=7500,n_NeiLi=885,n_GongJi=2746,n_FangYu=1304,n_BaoJi=481,n_ShenFa=550,},
	[10]={n_Level=10,n_ShengMing=11000,n_NeiLi=1245,n_GongJi=3912,n_FangYu=1887,n_BaoJi=699,n_ShenFa=800,},
	[11]={n_Level=11,n_ShengMing=21000,n_NeiLi=2187,n_GongJi=7137,n_FangYu=3526,n_BaoJi=920,n_ShenFa=1050,},
	[12]={n_Level=12,n_ShengMing=58000,n_NeiLi=5550,n_GongJi=18699,n_FangYu=9493,n_BaoJi=1470,n_ShenFa=1570,},
	[13]={n_Level=13,n_ShengMing=58000,n_NeiLi=5550,n_GongJi=18699,n_FangYu=9493,n_BaoJi=1470,n_ShenFa=1570,},
}


 



--【坐骑不同等级六项基本属性配置】
----key 	坐骑等级
----value
--------n_ShengMing	生命
--------n_NeiLi		内力
--------n_GongJi		攻击
--------n_FangYu		防御
--------n_BaoJi		暴击
--------n_ShenFa		身法
_G.CMountSixBasePropConfig = {
	[1]={n_Level=1,n_ShengMing=1,n_NeiLi=1,n_GongJi=1,n_FangYu=1,n_BaoJi=1,n_ShenFa=1,},
	[2]={n_Level=2,n_ShengMing=11,n_NeiLi=2,n_GongJi=2,n_FangYu=2,n_BaoJi=2,n_ShenFa=2,},
	[3]={n_Level=3,n_ShengMing=21,n_NeiLi=4,n_GongJi=4,n_FangYu=3,n_BaoJi=3,n_ShenFa=4,},
	[4]={n_Level=4,n_ShengMing=31,n_NeiLi=5,n_GongJi=5,n_FangYu=4,n_BaoJi=4,n_ShenFa=5,},
	[5]={n_Level=5,n_ShengMing=41,n_NeiLi=7,n_GongJi=7,n_FangYu=5,n_BaoJi=5,n_ShenFa=7,},
	[6]={n_Level=6,n_ShengMing=51,n_NeiLi=8,n_GongJi=8,n_FangYu=6,n_BaoJi=6,n_ShenFa=8,},
	[7]={n_Level=7,n_ShengMing=61,n_NeiLi=10,n_GongJi=10,n_FangYu=7,n_BaoJi=7,n_ShenFa=10,},
	[8]={n_Level=8,n_ShengMing=71,n_NeiLi=11,n_GongJi=12,n_FangYu=8,n_BaoJi=8,n_ShenFa=11,},
	[9]={n_Level=9,n_ShengMing=82,n_NeiLi=13,n_GongJi=13,n_FangYu=10,n_BaoJi=9,n_ShenFa=13,},
	[10]={n_Level=10,n_ShengMing=92,n_NeiLi=15,n_GongJi=15,n_FangYu=11,n_BaoJi=10,n_ShenFa=14,},
	[11]={n_Level=11,n_ShengMing=102,n_NeiLi=16,n_GongJi=17,n_FangYu=12,n_BaoJi=11,n_ShenFa=16,},
	[12]={n_Level=12,n_ShengMing=113,n_NeiLi=18,n_GongJi=19,n_FangYu=13,n_BaoJi=12,n_ShenFa=18,},
	[13]={n_Level=13,n_ShengMing=123,n_NeiLi=20,n_GongJi=20,n_FangYu=14,n_BaoJi=13,n_ShenFa=19,},
	[14]={n_Level=14,n_ShengMing=134,n_NeiLi=22,n_GongJi=22,n_FangYu=16,n_BaoJi=14,n_ShenFa=21,},
	[15]={n_Level=15,n_ShengMing=144,n_NeiLi=23,n_GongJi=24,n_FangYu=17,n_BaoJi=15,n_ShenFa=22,},
	[16]={n_Level=16,n_ShengMing=155,n_NeiLi=25,n_GongJi=26,n_FangYu=18,n_BaoJi=17,n_ShenFa=24,},
	[17]={n_Level=17,n_ShengMing=165,n_NeiLi=27,n_GongJi=28,n_FangYu=19,n_BaoJi=18,n_ShenFa=26,},
	[18]={n_Level=18,n_ShengMing=176,n_NeiLi=29,n_GongJi=30,n_FangYu=21,n_BaoJi=19,n_ShenFa=27,},
	[19]={n_Level=19,n_ShengMing=187,n_NeiLi=31,n_GongJi=32,n_FangYu=22,n_BaoJi=20,n_ShenFa=29,},
	[20]={n_Level=20,n_ShengMing=197,n_NeiLi=32,n_GongJi=34,n_FangYu=23,n_BaoJi=21,n_ShenFa=31,},
	[21]={n_Level=21,n_ShengMing=208,n_NeiLi=34,n_GongJi=36,n_FangYu=24,n_BaoJi=22,n_ShenFa=32,},
	[22]={n_Level=22,n_ShengMing=219,n_NeiLi=36,n_GongJi=38,n_FangYu=26,n_BaoJi=24,n_ShenFa=34,},
	[23]={n_Level=23,n_ShengMing=230,n_NeiLi=38,n_GongJi=40,n_FangYu=27,n_BaoJi=25,n_ShenFa=36,},
	[24]={n_Level=24,n_ShengMing=241,n_NeiLi=40,n_GongJi=43,n_FangYu=28,n_BaoJi=26,n_ShenFa=38,},
	[25]={n_Level=25,n_ShengMing=252,n_NeiLi=42,n_GongJi=45,n_FangYu=30,n_BaoJi=27,n_ShenFa=39,},
	[26]={n_Level=26,n_ShengMing=263,n_NeiLi=44,n_GongJi=47,n_FangYu=31,n_BaoJi=29,n_ShenFa=41,},
	[27]={n_Level=27,n_ShengMing=274,n_NeiLi=46,n_GongJi=49,n_FangYu=32,n_BaoJi=30,n_ShenFa=43,},
	[28]={n_Level=28,n_ShengMing=285,n_NeiLi=48,n_GongJi=52,n_FangYu=34,n_BaoJi=31,n_ShenFa=45,},
	[29]={n_Level=29,n_ShengMing=296,n_NeiLi=50,n_GongJi=54,n_FangYu=35,n_BaoJi=32,n_ShenFa=46,},
	[30]={n_Level=30,n_ShengMing=307,n_NeiLi=52,n_GongJi=56,n_FangYu=36,n_BaoJi=34,n_ShenFa=48,},
	[31]={n_Level=31,n_ShengMing=318,n_NeiLi=54,n_GongJi=59,n_FangYu=38,n_BaoJi=35,n_ShenFa=50,},
	[32]={n_Level=32,n_ShengMing=329,n_NeiLi=56,n_GongJi=61,n_FangYu=39,n_BaoJi=36,n_ShenFa=52,},
	[33]={n_Level=33,n_ShengMing=340,n_NeiLi=58,n_GongJi=63,n_FangYu=41,n_BaoJi=37,n_ShenFa=53,},
	[34]={n_Level=34,n_ShengMing=352,n_NeiLi=61,n_GongJi=66,n_FangYu=42,n_BaoJi=39,n_ShenFa=55,},
	[35]={n_Level=35,n_ShengMing=363,n_NeiLi=63,n_GongJi=68,n_FangYu=44,n_BaoJi=40,n_ShenFa=57,},
	[36]={n_Level=36,n_ShengMing=374,n_NeiLi=65,n_GongJi=71,n_FangYu=45,n_BaoJi=41,n_ShenFa=59,},
	[37]={n_Level=37,n_ShengMing=386,n_NeiLi=67,n_GongJi=73,n_FangYu=46,n_BaoJi=43,n_ShenFa=61,},
	[38]={n_Level=38,n_ShengMing=397,n_NeiLi=69,n_GongJi=76,n_FangYu=48,n_BaoJi=44,n_ShenFa=63,},
	[39]={n_Level=39,n_ShengMing=409,n_NeiLi=72,n_GongJi=79,n_FangYu=49,n_BaoJi=46,n_ShenFa=65,},
	[40]={n_Level=40,n_ShengMing=420,n_NeiLi=74,n_GongJi=81,n_FangYu=51,n_BaoJi=47,n_ShenFa=66,},
	[41]={n_Level=41,n_ShengMing=432,n_NeiLi=76,n_GongJi=84,n_FangYu=52,n_BaoJi=48,n_ShenFa=68,},
	[42]={n_Level=42,n_ShengMing=443,n_NeiLi=78,n_GongJi=87,n_FangYu=54,n_BaoJi=50,n_ShenFa=70,},
	[43]={n_Level=43,n_ShengMing=455,n_NeiLi=81,n_GongJi=89,n_FangYu=55,n_BaoJi=51,n_ShenFa=72,},
	[44]={n_Level=44,n_ShengMing=467,n_NeiLi=83,n_GongJi=92,n_FangYu=57,n_BaoJi=53,n_ShenFa=74,},
	[45]={n_Level=45,n_ShengMing=478,n_NeiLi=85,n_GongJi=95,n_FangYu=58,n_BaoJi=54,n_ShenFa=76,},
	[46]={n_Level=46,n_ShengMing=490,n_NeiLi=88,n_GongJi=98,n_FangYu=60,n_BaoJi=55,n_ShenFa=78,},
	[47]={n_Level=47,n_ShengMing=502,n_NeiLi=90,n_GongJi=101,n_FangYu=61,n_BaoJi=57,n_ShenFa=80,},
	[48]={n_Level=48,n_ShengMing=514,n_NeiLi=93,n_GongJi=103,n_FangYu=63,n_BaoJi=58,n_ShenFa=82,},
	[49]={n_Level=49,n_ShengMing=526,n_NeiLi=95,n_GongJi=106,n_FangYu=65,n_BaoJi=60,n_ShenFa=84,},
	[50]={n_Level=50,n_ShengMing=538,n_NeiLi=98,n_GongJi=109,n_FangYu=66,n_BaoJi=61,n_ShenFa=86,},
	[51]={n_Level=51,n_ShengMing=550,n_NeiLi=100,n_GongJi=112,n_FangYu=68,n_BaoJi=63,n_ShenFa=88,},
	[52]={n_Level=52,n_ShengMing=562,n_NeiLi=103,n_GongJi=115,n_FangYu=69,n_BaoJi=64,n_ShenFa=90,},
	[53]={n_Level=53,n_ShengMing=574,n_NeiLi=105,n_GongJi=118,n_FangYu=71,n_BaoJi=66,n_ShenFa=92,},
	[54]={n_Level=54,n_ShengMing=586,n_NeiLi=108,n_GongJi=121,n_FangYu=73,n_BaoJi=67,n_ShenFa=94,},
	[55]={n_Level=55,n_ShengMing=598,n_NeiLi=110,n_GongJi=124,n_FangYu=74,n_BaoJi=69,n_ShenFa=96,},
	[56]={n_Level=56,n_ShengMing=610,n_NeiLi=113,n_GongJi=128,n_FangYu=76,n_BaoJi=70,n_ShenFa=98,},
	[57]={n_Level=57,n_ShengMing=622,n_NeiLi=115,n_GongJi=131,n_FangYu=78,n_BaoJi=72,n_ShenFa=100,},
	[58]={n_Level=58,n_ShengMing=634,n_NeiLi=118,n_GongJi=134,n_FangYu=79,n_BaoJi=73,n_ShenFa=102,},
	[59]={n_Level=59,n_ShengMing=647,n_NeiLi=121,n_GongJi=137,n_FangYu=81,n_BaoJi=75,n_ShenFa=104,},
	[60]={n_Level=60,n_ShengMing=659,n_NeiLi=123,n_GongJi=140,n_FangYu=83,n_BaoJi=77,n_ShenFa=106,},
	[61]={n_Level=61,n_ShengMing=671,n_NeiLi=126,n_GongJi=144,n_FangYu=84,n_BaoJi=78,n_ShenFa=108,},
	[62]={n_Level=62,n_ShengMing=684,n_NeiLi=129,n_GongJi=147,n_FangYu=86,n_BaoJi=80,n_ShenFa=110,},
	[63]={n_Level=63,n_ShengMing=696,n_NeiLi=131,n_GongJi=150,n_FangYu=88,n_BaoJi=81,n_ShenFa=112,},
	[64]={n_Level=64,n_ShengMing=709,n_NeiLi=134,n_GongJi=154,n_FangYu=89,n_BaoJi=83,n_ShenFa=115,},
	[65]={n_Level=65,n_ShengMing=721,n_NeiLi=137,n_GongJi=157,n_FangYu=91,n_BaoJi=85,n_ShenFa=117,},
	[66]={n_Level=66,n_ShengMing=734,n_NeiLi=140,n_GongJi=160,n_FangYu=93,n_BaoJi=86,n_ShenFa=119,},
	[67]={n_Level=67,n_ShengMing=746,n_NeiLi=142,n_GongJi=164,n_FangYu=95,n_BaoJi=88,n_ShenFa=121,},
	[68]={n_Level=68,n_ShengMing=759,n_NeiLi=145,n_GongJi=167,n_FangYu=96,n_BaoJi=90,n_ShenFa=123,},
	[69]={n_Level=69,n_ShengMing=772,n_NeiLi=148,n_GongJi=171,n_FangYu=98,n_BaoJi=91,n_ShenFa=125,},
	[70]={n_Level=70,n_ShengMing=784,n_NeiLi=151,n_GongJi=174,n_FangYu=100,n_BaoJi=93,n_ShenFa=127,},
	[71]={n_Level=71,n_ShengMing=797,n_NeiLi=154,n_GongJi=178,n_FangYu=102,n_BaoJi=95,n_ShenFa=130,},
	[72]={n_Level=72,n_ShengMing=810,n_NeiLi=157,n_GongJi=182,n_FangYu=103,n_BaoJi=96,n_ShenFa=132,},
	[73]={n_Level=73,n_ShengMing=823,n_NeiLi=160,n_GongJi=185,n_FangYu=105,n_BaoJi=98,n_ShenFa=134,},
	[74]={n_Level=74,n_ShengMing=836,n_NeiLi=163,n_GongJi=189,n_FangYu=107,n_BaoJi=100,n_ShenFa=136,},
	[75]={n_Level=75,n_ShengMing=849,n_NeiLi=166,n_GongJi=193,n_FangYu=109,n_BaoJi=102,n_ShenFa=139,},
	[76]={n_Level=76,n_ShengMing=862,n_NeiLi=169,n_GongJi=196,n_FangYu=111,n_BaoJi=103,n_ShenFa=141,},
	[77]={n_Level=77,n_ShengMing=875,n_NeiLi=172,n_GongJi=200,n_FangYu=113,n_BaoJi=105,n_ShenFa=143,},
	[78]={n_Level=78,n_ShengMing=888,n_NeiLi=175,n_GongJi=204,n_FangYu=114,n_BaoJi=107,n_ShenFa=145,},
	[79]={n_Level=79,n_ShengMing=901,n_NeiLi=178,n_GongJi=208,n_FangYu=116,n_BaoJi=109,n_ShenFa=148,},
	[80]={n_Level=80,n_ShengMing=914,n_NeiLi=181,n_GongJi=211,n_FangYu=118,n_BaoJi=110,n_ShenFa=150,},
	[81]={n_Level=81,n_ShengMing=927,n_NeiLi=184,n_GongJi=215,n_FangYu=120,n_BaoJi=112,n_ShenFa=152,},
	[82]={n_Level=82,n_ShengMing=940,n_NeiLi=187,n_GongJi=219,n_FangYu=122,n_BaoJi=114,n_ShenFa=154,},
	[83]={n_Level=83,n_ShengMing=953,n_NeiLi=190,n_GongJi=223,n_FangYu=124,n_BaoJi=116,n_ShenFa=157,},
	[84]={n_Level=84,n_ShengMing=967,n_NeiLi=193,n_GongJi=227,n_FangYu=126,n_BaoJi=118,n_ShenFa=159,},
	[85]={n_Level=85,n_ShengMing=980,n_NeiLi=196,n_GongJi=231,n_FangYu=128,n_BaoJi=119,n_ShenFa=161,},
	[86]={n_Level=86,n_ShengMing=993,n_NeiLi=199,n_GongJi=235,n_FangYu=130,n_BaoJi=121,n_ShenFa=164,},
	[87]={n_Level=87,n_ShengMing=1007,n_NeiLi=203,n_GongJi=239,n_FangYu=132,n_BaoJi=123,n_ShenFa=166,},
	[88]={n_Level=88,n_ShengMing=1020,n_NeiLi=206,n_GongJi=243,n_FangYu=134,n_BaoJi=125,n_ShenFa=168,},
	[89]={n_Level=89,n_ShengMing=1034,n_NeiLi=209,n_GongJi=247,n_FangYu=136,n_BaoJi=127,n_ShenFa=171,},
	[90]={n_Level=90,n_ShengMing=1047,n_NeiLi=212,n_GongJi=251,n_FangYu=138,n_BaoJi=129,n_ShenFa=173,},
	[91]={n_Level=91,n_ShengMing=1061,n_NeiLi=216,n_GongJi=256,n_FangYu=140,n_BaoJi=131,n_ShenFa=176,},
	[92]={n_Level=92,n_ShengMing=1074,n_NeiLi=219,n_GongJi=260,n_FangYu=142,n_BaoJi=132,n_ShenFa=178,},
	[93]={n_Level=93,n_ShengMing=1088,n_NeiLi=222,n_GongJi=264,n_FangYu=144,n_BaoJi=134,n_ShenFa=180,},
	[94]={n_Level=94,n_ShengMing=1102,n_NeiLi=226,n_GongJi=268,n_FangYu=146,n_BaoJi=136,n_ShenFa=183,},
	[95]={n_Level=95,n_ShengMing=1115,n_NeiLi=229,n_GongJi=273,n_FangYu=148,n_BaoJi=138,n_ShenFa=185,},
	[96]={n_Level=96,n_ShengMing=1129,n_NeiLi=232,n_GongJi=277,n_FangYu=150,n_BaoJi=140,n_ShenFa=188,},
	[97]={n_Level=97,n_ShengMing=1143,n_NeiLi=236,n_GongJi=281,n_FangYu=152,n_BaoJi=142,n_ShenFa=190,},
	[98]={n_Level=98,n_ShengMing=1157,n_NeiLi=239,n_GongJi=286,n_FangYu=154,n_BaoJi=144,n_ShenFa=193,},
	[99]={n_Level=99,n_ShengMing=1171,n_NeiLi=243,n_GongJi=290,n_FangYu=156,n_BaoJi=146,n_ShenFa=195,},
	[100]={n_Level=100,n_ShengMing=1185,n_NeiLi=246,n_GongJi=295,n_FangYu=158,n_BaoJi=148,n_ShenFa=198,},
	[101]={n_Level=101,n_ShengMing=1199,n_NeiLi=250,n_GongJi=299,n_FangYu=160,n_BaoJi=150,n_ShenFa=200,},
	[102]={n_Level=102,n_ShengMing=1213,n_NeiLi=253,n_GongJi=304,n_FangYu=162,n_BaoJi=152,n_ShenFa=203,},
	[103]={n_Level=103,n_ShengMing=1227,n_NeiLi=257,n_GongJi=308,n_FangYu=164,n_BaoJi=154,n_ShenFa=205,},
	[104]={n_Level=104,n_ShengMing=1241,n_NeiLi=260,n_GongJi=313,n_FangYu=166,n_BaoJi=156,n_ShenFa=208,},
	[105]={n_Level=105,n_ShengMing=1255,n_NeiLi=264,n_GongJi=317,n_FangYu=168,n_BaoJi=158,n_ShenFa=210,},
	[106]={n_Level=106,n_ShengMing=1269,n_NeiLi=267,n_GongJi=322,n_FangYu=171,n_BaoJi=160,n_ShenFa=213,},
	[107]={n_Level=107,n_ShengMing=1283,n_NeiLi=271,n_GongJi=326,n_FangYu=173,n_BaoJi=162,n_ShenFa=215,},
	[108]={n_Level=108,n_ShengMing=1297,n_NeiLi=274,n_GongJi=331,n_FangYu=175,n_BaoJi=164,n_ShenFa=218,},
	[109]={n_Level=109,n_ShengMing=1312,n_NeiLi=278,n_GongJi=336,n_FangYu=177,n_BaoJi=166,n_ShenFa=220,},
	[110]={n_Level=110,n_ShengMing=1326,n_NeiLi=282,n_GongJi=341,n_FangYu=179,n_BaoJi=168,n_ShenFa=223,},
	[111]={n_Level=111,n_ShengMing=1340,n_NeiLi=285,n_GongJi=345,n_FangYu=181,n_BaoJi=170,n_ShenFa=225,},
	[112]={n_Level=112,n_ShengMing=1355,n_NeiLi=289,n_GongJi=350,n_FangYu=184,n_BaoJi=173,n_ShenFa=228,},
	[113]={n_Level=113,n_ShengMing=1369,n_NeiLi=293,n_GongJi=355,n_FangYu=186,n_BaoJi=175,n_ShenFa=231,},
	[114]={n_Level=114,n_ShengMing=1384,n_NeiLi=297,n_GongJi=360,n_FangYu=188,n_BaoJi=177,n_ShenFa=233,},
	[115]={n_Level=115,n_ShengMing=1398,n_NeiLi=300,n_GongJi=365,n_FangYu=190,n_BaoJi=179,n_ShenFa=236,},
	[116]={n_Level=116,n_ShengMing=1413,n_NeiLi=304,n_GongJi=370,n_FangYu=193,n_BaoJi=181,n_ShenFa=239,},
	[117]={n_Level=117,n_ShengMing=1427,n_NeiLi=308,n_GongJi=375,n_FangYu=195,n_BaoJi=183,n_ShenFa=241,},
	[118]={n_Level=118,n_ShengMing=1442,n_NeiLi=312,n_GongJi=380,n_FangYu=197,n_BaoJi=185,n_ShenFa=244,},
	[119]={n_Level=119,n_ShengMing=1457,n_NeiLi=316,n_GongJi=385,n_FangYu=199,n_BaoJi=188,n_ShenFa=247,},
	[120]={n_Level=120,n_ShengMing=1471,n_NeiLi=319,n_GongJi=390,n_FangYu=202,n_BaoJi=190,n_ShenFa=249,},
};
--【坐骑升级经验】
_G.MountUpLevelNeedExp = {
	[1]=18;
	[2]=34;
	[3]=77;
	[4]=125;
	[5]=196;
	[6]=320;
	[7]=504;
	[8]=760;
	[9]=1056;
	[10]=1392;
	[11]=1768;
	[12]=2184;
	[13]=2684;
	[14]=3234;
	[15]=3834;
	[16]=4484;
	[17]=5184;
	[18]=6072;
	[19]=7030;
	[20]=8058;
	[21]=9156;
	[22]=10324;
	[23]=12375;
	[24]=14606;
	[25]=17017;
	[26]=19608;
	[27]=22379;
	[28]=25628;
	[29]=29097;
	[30]=32786;
	[31]=36695;
	[32]=40824;
	[33]=46920;
	[34]=53436;
	[35]=60372;
	[36]=67728;
	[37]=75504;
	[38]=84816;
	[39]=94668;
	[40]=105060;
	[41]=115992;
	[42]=127464;
	[43]=144872;
	[44]=163380;
	[45]=182988;
	[46]=203696;
	[47]=225504;
	[48]=250368;
	[49]=276532;
	[50]=303996;
	[51]=332760;
	[52]=362824;
	[53]=410198;
	[54]=460362;
	[55]=513316;
	[56]=569060;
	[57]=627594;
	[58]=694072;
	[59]=763880;
	[60]=837018;
	[61]=913486;
	[62]=993284;
	[63]=1122876;
	[64]=1259778;
	[65]=1403990;
	[66]=1555512;
	[67]=1714344;
	[68]=1889780;
	[69]=2073546;
	[70]=2265642;
	[71]=2466068;
	[72]=2674824;
	[73]=3023488;
	[74]=3390632;
	[75]=3776256;
	[76]=4180360;
	[77]=4602944;
	[78]=5067040;
	[79]=5552256;
	[80]=6058592;
	[81]=6586048;
	[82]=7134624;
	[83]=8026272;
	[84]=8961840;
	[85]=9941328;
	[86]=10964736;
	[87]=12032064;
	[88]=13186264;
	[89]=14389264;
	[90]=15641064;
	[91]=16941664;
	[92]=18291064;
	[93]=20324310;
	[94]=22447446;
	[95]=24660472;
	[96]=26963388;
	[97]=29356194;
	[98]=31935080;
	[99]=34613956;
	[100]=37392822;
	[101]=40271678;
	[102]=43250524;
	[103]=47598300;
	[104]=50677425;
	[105]=53756550;
	[106]=56835675;
	[107]=59914800;
	[108]=62993925;
	[109]=66073050;
	[110]=69152175;
	[111]=72231300;
	[112]=75310425;
	[113]=79919550;
	[114]=84528675;
	[115]=89137800;
	[116]=93746925;
	[117]=98356050;
	[118]=102965175;
	[119]=107574300;
	[120]=112183425;
};

--坐骑不同阶级能否吃丹配置
--[10001]:坐骑id,grade:等级，isEat：是否能吃（true:能吃，false:不能吃）
_G.MountEatMedicineConfig = {
	[10001] = {grade = 1,isEat = true,},
	[10002] = {grade = 2,isEat = true,},
	[10003] = {grade = 3,isEat = true,},
	[10004] = {grade = 3,isEat = true,},
	--刀系坐骑
	[20001] = {grade = 1,isEat = true,},
	[20002] = {grade = 2,isEat = true,},
	[20003] = {grade = 3,isEat = true,},
	[20004] = {grade = 3,isEat = true,},
	--剑系坐骑
	[30001] = {grade = 1,isEat = true,},
	[30002] = {grade = 2,isEat = true,},
	[30003] = {grade = 3,isEat = true,},
	[30004] = {grade = 3,isEat = true,},
	--枪系坐骑
	[40001] = {grade = 1,isEat = true,};
	[40002] = {grade = 2,isEat = true,},
	[40003] = {grade = 3,isEat = true,},
	[40004] = {grade = 3,isEat = true,},
	----------
	--通用坐骑 -----ID规则  9+阶数+品质
	[90401] = {grade = 4,isEat = true,},
	[90402] = {grade = 4,isEat = true,},
	[90501] = {grade = 5,isEat = true,},
	[90503] = {grade = 5,isEat = true,},
	[90601] = {grade = 6,isEat = true,},
	[90603] = {grade = 6,isEat = true,},
	[90701] = {grade = 7,isEat = true,},
	[90801] = {grade = 8,isEat = true,},
	[90901] = {grade = 9,isEat = true,},
	[100901] = {grade = 10,isEat = true,},
	[110901] = {grade = 11,isEat = true,},
}

--坐骑吃一颗丹药增加属性
--[9405040]:丹药id/资质果id,{}:丹药对应属性
_G.RefineMedicineAttr = {
	[9405040] = {n_ShengMing=20,n_NeiLi=2,n_GongJi=5,n_FangYu=2,n_BaoJi=1,n_ShenFa=1,n_SuDu=0,},
}

--属性提示配置
_G.eatTipsConfig = {
	szAttrText = "<font color='#fed904' size='14'>总属性 +%d</font><br /><font color='#cdc6c4' size='14'>基础属性 +%d</font><br /><font color='#278cf1' size='14'>坐骑资质丹 +%d</font><br />",
	szProgressText = "<font color='#278cf1' size='14'>当前已服用 %d/%d颗</font><br /><font color='#31cf32' size='14'>鬼牙坐骑可服用20颗坐骑资质丹</font><br /><font color='#f15d27' size='14'>凌苍坐骑可服用40颗坐骑资质丹</font><br /><font color='#ca9754' size='14'>悬魂坐骑可服用70颗坐骑资质丹</font><br /><font color='#8436cd' size='14'>噬鳄龟坐骑可服用110颗坐骑资质丹</font><br /><font color='#cdc6c4' size='14'>白虎坐骑可服用160颗坐骑资质丹</font><br /><font color='#fed904' size='14'>朱雀坐骑可服用240颗坐骑资质丹</font><br /><font color='#07e6c9' size='14'>青龙坐骑可服用360颗坐骑资质丹</font><br /><font color='#e37700' size='14'>炎龙坐骑可服用360颗坐骑资质丹</font><br /><font color='#FFFF00' size='14'>麒麟坐骑可服用390颗坐骑资质丹</font><br />",
	szBtText = "<font color='#278cf1' size='14'>点击为坐骑服用丹药</font><br /><font color='#278cf1' size='14'>每点击一次可服用1颗</font><br />",
	szNotEatText = "<font color='#FF0000' size='14'>您坐骑当前阶级服用丹药数量已满</font><br />",
	szNotEatText1 = "<font color='#FF0000' size='14'>您坐骑当前阶级不能服用丹药,4阶级才可服用丹药</font><br />",
}

--打开坐骑界面丹药列表
_G.OpenUIItemList = {
	9405011,
};
