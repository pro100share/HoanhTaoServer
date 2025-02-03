--¿ç·ş¼¼ÄÜÆÁ±ÎÅäÖÃ
_G.CrossSkillConfig = {
	ForbiddenSkill = {60000, 60001, 60002, 60003, 60004, 60005};
};


function CrossSkillConfig:IsSkillNeedBofbidden(dwSkillId)
	for _, v in pairs(self.ForbiddenSkill) do
		if v == dwSkillId then
			return true;
		end
	end	
	return false;
end
