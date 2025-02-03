--提供给技能脚本使用的接口，写在这个文件中

--取得玩家的技能等级
function CMonsterSkillSystem:GetPlayerSkillLevel(dwRoleID,dwSkillID)
	local objMon = self:GetMon();
	local objPlayer = objMon:GetMap():GetPlayerByRoleID(dwRoleID);
	
	if not objPlayer then
		return 0;
	end
	
	local objSklSystem = objPlayer:GetSystem("CSkillSystem");
	if not objSklSystem then
		return 0;
	end
	
	local objRoleSkill = objSklSystem.setAllSkill[dwSkillID];
	if not objRoleSkill then
		return 0;
	end
	
	return objRoleSkill:GetLevel();
end;

--取得玩家的战斗属性
function CMonsterSkillSystem:GetPlayerBattleInfo(dwRoleID)
	local objMon = self:GetMon();
	local objPlayer = objMon:GetMap():GetPlayerByRoleID(dwRoleID);
	
	if not objPlayer then
		return nil;
	end
	
	local objSklSystem = objPlayer:GetSystem("CSkillSystem");
	if not objSklSystem then
		return nil;
	end
	
	return objSklSystem:GetInfo();
end;
