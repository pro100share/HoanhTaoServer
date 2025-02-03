

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local setAllSkill = {};
	local dbres1 = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_Skill_Info" where "dwRoleID" = $1', dwRoleID);
    if #(dbres1) > 0 then
		for i, row in pairs(dbres1) do
            local sInfo = {};
            sInfo.dwRoleID          =  row.dwRoleID;
            sInfo.dwSkillID			=  row.dwSkillID;		--技能ID
            sInfo.dwSkillLevel		=  row.dwSkillLevel;	--技能等级
            sInfo.dwSkillKnowValue	=  row.dwSkillKnowValue;--技能熟练度
            sInfo.dwOpenFlag		=  row.dwOpenFlag;		--开启状态
            sInfo.bIsUpdate         =  false;
            setAllSkill[sInfo.dwSkillID] = sInfo;
        end;
    else--if isNewRole then
        local tInitList = InitConfig:InitRoleSkill(dwProf);
        for i, dwSkillID in pairs(tInitList) do
            if SkillConfig[dwSkillID] then
                local sInfo = {};
                sInfo.dwRoleID          =  dwRoleID;
                sInfo.dwSkillID			=  dwSkillID;		--技能ID
                sInfo.dwSkillLevel		=  1;		        --技能等级
                sInfo.dwSkillKnowValue	=  0;		        --技能熟练度
                sInfo.dwOpenFlag		=  0;
                sInfo.bIsUpdate         = false;
                setAllSkill[sInfo.dwSkillID] = sInfo;
                
                local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd("T_Role_Skill_Info");
                SqlCmd.Fields.dwRoleID       	= sInfo.dwRoleID;
                SqlCmd.Fields.dwSkillID	        = sInfo.dwSkillID;
                SqlCmd.Fields.dwSkillLevel	    = sInfo.dwSkillLevel;
                SqlCmd.Fields.dwSkillKnowValue  = sInfo.dwSkillKnowValue;
                SqlCmd.Fields.dwOpenFlag        = sInfo.dwOpenFlag;
                SqlCmd:execute();
            end;
        end;
    end;
	
    local sBaseInfo = {};
	local dbres2 = tbInfoList[2]--objPlayer:GetDBQuery():execute('select * from "T_Role_Battle_Info" where "dwRoleID" = $1 LIMIT 1',dwRoleID);
	if #(dbres2) > 0 then
		local Row = dbres2[1];
		sBaseInfo.dwHP          = Row.dwCurHP;
		sBaseInfo.dwMP          = Row.dwCurMP;
		sBaseInfo.dwMuscle      = Row.dwMuscle;
		sBaseInfo.dwPhysique    = Row.dwPhysique;
		sBaseInfo.dwOrgan       = Row.dwOrgan;
		sBaseInfo.dwTechnique   = Row.dwTechnique;
		sBaseInfo.dwDander      = Row.dwDander;
		sBaseInfo.dwPoint       = Row.dwPoint;
		sBaseInfo.dwOtherPoint  = Row.dwOtherPoint;
		sBaseInfo.dwCaromCount  = Row.dwCaromCount;
    else--if isNewRole then
        sBaseInfo.dwHP          = InitConfig.dwHP;
        sBaseInfo.dwMP          = InitConfig.dwMP;
        sBaseInfo.dwMuscle      = InitConfig.dwMuscle;
        sBaseInfo.dwPhysique    = InitConfig.dwPhysique;
        sBaseInfo.dwOrgan       = InitConfig.dwOrgan;
        sBaseInfo.dwTechnique   = InitConfig.dwTechnique;
        sBaseInfo.dwDander      = 0;
        sBaseInfo.dwPoint       = 0;
		sBaseInfo.dwOtherPoint  = 0;
        sBaseInfo.dwCaromCount  = 0;
        
        local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd("T_Role_Battle_Info");
        SqlCmd.Fields.dwRoleID      = dwRoleID;
        SqlCmd.Fields.dwCurHP	    = sBaseInfo.dwHP;
        SqlCmd.Fields.dwCurMP	    = sBaseInfo.dwMP;
        SqlCmd.Fields.dwMuscle      = sBaseInfo.dwMuscle;
        SqlCmd.Fields.dwPhysique    = sBaseInfo.dwPhysique;
        SqlCmd.Fields.dwOrgan       = sBaseInfo.dwOrgan;
        SqlCmd.Fields.dwTechnique	= sBaseInfo.dwTechnique;
        SqlCmd.Fields.dwDander	    = sBaseInfo.dwDander;
        SqlCmd.Fields.dwPoint       = sBaseInfo.dwPoint;
		SqlCmd.Fields.dwOtherPoint  = sBaseInfo.dwOtherPoint;
        SqlCmd.Fields.dwCaromCount  = sBaseInfo.dwCaromCount;
        SqlCmd:execute();
    end;
	
	local Data = {};
	Data[1] = setAllSkill;
	Data[2] = sBaseInfo;
	CTransitManager:RecvData(dwAccountID,"CSkillSystem", Data);
    return true;
end;


CLoginCall:AddCall("CSkillSystem", func);



