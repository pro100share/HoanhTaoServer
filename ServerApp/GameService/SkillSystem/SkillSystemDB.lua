_G.CSkillSystemDB ={}
function CSkillSystemDB:new(objDB,objUser)
	local obj = {};
	obj.objDB = objDB;      --对应的数据库 
	obj.objUser = objUser;
	
	for i, v in pairs(CSkillSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

--向数据库中加一条数据
function CSkillSystemDB:AddSkillToDB(sInfo)
	if not self.objDB then
		_info("self.objDB is null by CSkillSystemDB:SaveSkillInfo");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CSkillSystemDB:SaveSkillInfo");
		return false;
	end; 
	
	local SqlCmd = self.objDB:CreateInsertCmd('T_Role_Skill_Info');
	
	SqlCmd.Fields.dwRoleID           =  sInfo.dwRoleID;
	SqlCmd.Fields.dwSkillID			=  sInfo.dwSkillID;		--技能ID
	SqlCmd.Fields.dwSkillLevel		=  sInfo.dwSkillLevel;		--技能等级
	SqlCmd.Fields.dwSkillKnowValue	=  sInfo.dwSkillKnowValue;		--技能熟练度
	SqlCmd.Fields.dwOpenFlag		=  sInfo.dwOpenFlag;		--开启状态
	
	SqlCmd:execute()
	return true;
end;

--向数据库中删除一条数据
function CSkillSystemDB:DelSkillToDB(dwSkillID)
	if not self.objDB then
		_info("self.objDB is null by CSkillSystemDB:SaveSkillInfo");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CSkillSystemDB:SaveSkillInfo");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CSkillSystemDB:SaveSkillInfo");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CSkillSystemDB:SaveSkillInfo");
		return false;
	end;
	
	local SqlCmd = self.objDB:CreateDeleteCmd('T_Role_Skill_Info')
	SqlCmd.Wheres.dwSkillID = dwSkillID;
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd:execute();
	
	return true;
end;

function CSkillSystemDB:SaveSkillInfo(dwSkillID)
	if not self.objDB then
		_info("self.objDB is null by CSkillSystemDB:SaveSkillInfo");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CSkillSystemDB:SaveSkillInfo");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CSkillSystemDB:SaveSkillInfo");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CSkillSystemDB:SaveSkillInfo");
		return false;
	end; 
	local arrRoleSkill = self.objUser:GetAllSkill();
	local szStr = ""
	--如果有ID就保存这个ID
	if dwSkillID then
		local objRoleSkill = arrRoleSkill[dwSkillID];
		
		if not objRoleSkill.isTempSkill then
			local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Skill_Info');
			
			SqlCmd.Wheres.dwRoleID			= objRoleSkill:GetInfo().dwRoleID; 
			SqlCmd.Wheres.dwSkillID			= objRoleSkill:GetInfo().dwSkillID;		--技能ID 
			
			SqlCmd.Fields.dwSkillLevel		=  objRoleSkill:GetInfo().dwSkillLevel;		--技能等级
			SqlCmd.Fields.dwSkillKnowValue	=  objRoleSkill:GetInfo().dwSkillKnowValue;		--技能熟练度
			SqlCmd.Fields.dwOpenFlag		=  objRoleSkill:GetInfo().dwOpenFlag;		--开启状态
			
			SqlCmd:execute()
		end
	else
		for i,Skill in pairs(arrRoleSkill) do
			if (Skill:GetInfo().bIsUpdate) and (not Skill.isTempSkill) then
				local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Skill_Info');
				
				SqlCmd.Wheres.dwRoleID			= Skill:GetInfo().dwRoleID; 
				SqlCmd.Wheres.dwSkillID			= Skill:GetInfo().dwSkillID;		--技能ID 
				
				SqlCmd.Fields.dwSkillLevel		= Skill:GetInfo().dwSkillLevel;		--技能等级
				SqlCmd.Fields.dwSkillKnowValue	= Skill:GetInfo().dwSkillKnowValue;		--技能熟练度
				SqlCmd.Fields.dwOpenFlag		= Skill:GetInfo().dwOpenFlag;		--开启状态
				
				SqlCmd:execute()
			end;
		end;
	end
	
end;

--[[
local sDBInfo =
{
	dwRoleID
	dwCurHP--当前HP
	dwCurMP--当前MP
	dwMuscle--臂力
	dwPhysique--体魄
	dwOrgan--根骨
	dwTechnique --技巧
	dwDander--怒气
	dwPoint--潜力点
}
]]
function CSkillSystemDB:SaveBattleInfo(sDBInfo)
	if not self.objDB then
		_info("self.objDB is null by CSkillSystemDB:SaveBattleInfo");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CSkillSystemDB:SaveBattleInfo");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CSkillSystemDB:SaveBattleInfo");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CSkillSystemDB:SaveBattleInfo");
		return false;
	end;
	if sDBInfo.dwMuscle < 0 or 
		sDBInfo.dwPhysique < 0 or 
		sDBInfo.dwOrgan < 0 or 
		sDBInfo.dwTechnique < 0 then
		sDBInfo.dwMuscle = 0
		sDBInfo.dwPhysique = 0
		sDBInfo.dwOrgan = 0
		sDBInfo.dwTechnique = 0
	end
	local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Battle_Info');
	
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	
	SqlCmd.Fields.dwCurHP = math.floor(sDBInfo.dwHP);
	SqlCmd.Fields.dwCurMP = math.floor(sDBInfo.dwMP);
	SqlCmd.Fields.dwMuscle = sDBInfo.dwMuscle;
	SqlCmd.Fields.dwPhysique = sDBInfo.dwPhysique;
	SqlCmd.Fields.dwOrgan = sDBInfo.dwOrgan;
	SqlCmd.Fields.dwTechnique = sDBInfo.dwTechnique;
	SqlCmd.Fields.dwDander = math.floor(sDBInfo.dwDander);
	SqlCmd.Fields.dwPoint = sDBInfo.dwPoint;
	SqlCmd.Fields.dwCaromCount = sDBInfo.dwCaromCount;
	SqlCmd.Fields.dwOtherPoint = sDBInfo.dwOtherPoint;
	
	SqlCmd:execute()
	return true;
end;

function CSkillSystemDB:AddInitBattleInfo(dwRoleID)
	local SqlCmd = self.objDB:CreateInsertCmd('T_Role_Battle_Info');
	
	local sBaseInfo = self.objUser:InitBattleInfo();
	
	SqlCmd.Fields.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwCurHP = sBaseInfo.dwCurHP;
	SqlCmd.Fields.dwCurMP = sBaseInfo.dwCurMP;
	SqlCmd.Fields.dwMuscle = sBaseInfo.dwMuscle;
	SqlCmd.Fields.dwPhysique = sBaseInfo.dwPhysique;
	SqlCmd.Fields.dwOrgan = sBaseInfo.dwOrgan;
	SqlCmd.Fields.dwTechnique = sBaseInfo.dwTechnique;
	SqlCmd.Fields.dwDander = sBaseInfo.dwDander;
	SqlCmd.Fields.dwPoint = sBaseInfo.dwPoint;
	SqlCmd.Fields.dwCaromCount = sBaseInfo.dwCaromCount;
	SqlCmd.Fields.dwOtherPoint = sDBInfo.dwOtherPoint;
	
	self.objUser:CountBattleInfo(sBaseInfo);
	
	SqlCmd:execute()
	return true;
end;
