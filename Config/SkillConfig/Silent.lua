--角色沉默相关
_G.CheckSkillCanUseByForbidFlag = function(dwForbidValue,dwForbideGroup)

	if dwForbidValue == -1 then
		return false
	else
		if dwForbideGroup ~= 0 then
			local dwMode = 10^dwForbideGroup;
			--取位
			local dwFlag = (dwForbidValue % dwMode)/(dwMode/10);
			dwFlag = math.floor(dwFlag);
			--位上值为1则禁止，0则允许
			if dwFlag == 1 then
				return false;
			end
		end
	end
	
	return true;
end;

--怪物沉默相关
_G.MonsterSilent = function(Monster)

	local objMonsterInfo = Monster:GetSystem("CMonsterSkillSystem"):GetInfo();
	
	if objMonsterInfo.dwSkillForbidFlag ~= 0 then
		return false
	end
	return true
end