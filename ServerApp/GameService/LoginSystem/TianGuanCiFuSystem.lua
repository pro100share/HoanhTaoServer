

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local Data = {};
	Data[1] = 0;	--装备升阶
	Data[2] = 0;	--坐骑升阶
	Data[3] = 0;	--护身宝甲进阶
	Data[4] = 0;	--境界升级
	Data[5] = 0;	--宝剑升阶
    Data[6] = 0;    --装备强化
	Data[7] = 0;	--功法领悟
	Data[8] = 0;	--杀人如麻
	Data[9] = 0;	--暗器升阶
    Data[10] = 0;   --战骑诀
	Data[11] = 0;	--修炼金身
    Data[12] = 0;   --战旗
	--从数据库中读取天官赐福信息
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_TianGuanCiFu" where "n_RoleID" = $1', dwRoleID);
    if #(dbres) > 0 then
        ----装备升阶
		Data[1] = dbres[1].n_EquipUpGrade;
		if Data[1] > _G.TianGuanCiFuConfig.MaxEquipUpGradeValue then
			Data[1] = _G.TianGuanCiFuConfig.MaxEquipUpGradeValue;
		end;
		----坐骑升阶
		Data[2] = dbres[1].n_MountUpGrade;
		if Data[2] > _G.TianGuanCiFuConfig.MaxMountUpGradeValue then
			Data[2] = _G.TianGuanCiFuConfig.MaxMountUpGradeValue;
		end;
		----坐骑技能升级
		Data[3] = dbres[1].n_AmuletUpGrade;
		if Data[3] > _G.TianGuanCiFuConfig.MaxAmuletUpGradeValue then
			Data[3] = _G.TianGuanCiFuConfig.MaxAmuletUpGradeValue;
		end;
		----境界升级
		Data[4]	= dbres[1].n_JingJieUp;
		if Data[4] > _G.TianGuanCiFuConfig.MaxJingJieUpValue then
			Data[4] = _G.TianGuanCiFuConfig.MaxJingJieUpValue;
		end;
		----宝剑升阶
		Data[5] = dbres[1].n_SwordUpGrade;
		if Data[5] > _G.TianGuanCiFuConfig.MaxSwordUpGradeValue then
			Data[5] = _G.TianGuanCiFuConfig.MaxSwordUpGradeValue;
		end; 
        ----装备强化
        Data[6] = dbres[1].n_EquipStrong;
        if Data[6] > _G.TianGuanCiFuConfig.MaxEquipStrongValue then
            Data[6] = _G.TianGuanCiFuConfig.MaxEquipStrongValue;
        end;
		----功法领悟
		Data[7] = dbres[1].n_KungFuStudy;
		if Data[7] > _G.TianGuanCiFuConfig.MaxKungFuStudyValue then
            Data[7] = _G.TianGuanCiFuConfig.MaxKungFuStudyValue;
        end;
		----杀人如麻
		Data[8] = dbres[1].n_MegaKill;
        if Data[8] > _G.TianGuanCiFuConfig.MaxMegaKillValue then
            Data[8] = _G.TianGuanCiFuConfig.MaxMegaKillValue;
        end;
		----暗器升阶
		Data[9] = dbres[1].n_HiddenWeapon;
		if Data[9] > _G.TianGuanCiFuConfig.HiddenWeaponValueMax then
			Data[9] = _G.TianGuanCiFuConfig.HiddenWeaponValueMax;
		end
        -- 战骑诀
        Data[10] = dbres[1].n_ZhanQiJue;
        if Data[10] > _G.TianGuanCiFuConfig.MaxZhanQiJueValue then
            Data[10] = _G.TianGuanCiFuConfig.MaxZhanQiJueValue;
        end
		-- 修炼金身
		Data[11] = dbres[1].n_GoldenBody;
        if Data[11] > _G.TianGuanCiFuConfig.MaxGoldenBodyValue then
            Data[11] = _G.TianGuanCiFuConfig.MaxGoldenBodyValue;
        end
        -- 战旗
        Data[12] = dbres[1].n_Banner;
        if Data[12] > _G.TianGuanCiFuConfig.MaxBannerValue then
            Data[12] = _G.TianGuanCiFuConfig.MaxBannerValue;
        end
    else--if isNewRole then
        local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd("T_Role_TianGuanCiFu");
        SqlCmd.Fields.n_RoleID       	= dwRoleID;
        SqlCmd.Fields.n_EquipUpGrade	= 0;		--装备升阶
        SqlCmd.Fields.n_MountUpGrade	= 0;		--坐骑升阶
        SqlCmd.Fields.n_AmuletUpGrade	= 0;		--护身宝甲升阶
        SqlCmd.Fields.n_JingJieUp		= 0;		--境界升级
        SqlCmd.Fields.n_SwordUpGrade	= 0;		--宝剑升阶
        SqlCmd.Fields.n_EquipStrong     = 0;        --装备强化
		SqlCmd.Fields.n_KungFuStudy     = 0;        --功法学习
		SqlCmd.Fields.n_MegaKill		= 0;		--杀人如麻
		SqlCmd.Fields.n_HiddenWeapon	= 0;		--暗器升阶
        SqlCmd.Fields.n_ZhanQiJue       = 0;        --战骑诀
		SqlCmd.Fields.n_GoldenBody      = 0;        --修炼金身
        SqlCmd.Fields.n_Banner          = 0;        --战旗
        SqlCmd:execute();
    end;
	
	CTransitManager:RecvData(dwAccountID,"CTianGuanCiFuSystem", Data);
	return true;
end;


CLoginCall:AddCall("CTianGuanCiFuSystem", func);



