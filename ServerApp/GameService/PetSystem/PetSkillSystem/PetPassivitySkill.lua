--[[
���ܣ����ﱻ������
���ߣ�κ��
ʱ�䣺2013-11-6
--]]


_G.CPetPassivitySkill = {}
function CPetPassivitySkill:new(petSys)
	local obj = {};
	obj.PassivitySkillList = {}; ---���ﱻ�������б�
	obj.petSys = petSys;
	for i,v in pairs(CPetPassivitySkill) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CPetPassivitySkill:SetSkillID(petEnumID,skillID)
	local index = #self.PassivitySkillList[petEnumID]+1;
	self.PassivitySkillList[petEnumID][index] = skillID;
end
function CPetPassivitySkill:GetPetPassivitySkillLevel(petEnumID,skillID)
	local petskillObj = self.petSys:GetPetSkillObj(petEnumID,skillID);
	local skillLevel = petskillObj:GetLevel();
	return skillLevel;
end
----��ȡ������������
function CPetPassivitySkill:GetPetPassivitySkillAttr(petEnumID)
	local petAttri = SSingleAttrChange:new();
	local objPlayer = self.petSys:GetPlayer()
	if(not objPlayer) then
		return petAttri;
	end
	if(not self.PassivitySkillList[petEnumID]) then
		return petAttri;
	end
	local petSys = self.petSys;
	local level = 0;
	for k,v in pairs(self.PassivitySkillList[petEnumID]) do
		for m,n in pairs(_G.PetPassivitySkillAttriConfig) do
			if(m == v) then
				level = self:GetPetPassivitySkillLevel(petEnumID,v)
				petAttri:AddValue(PetPassivitySkillScript:GetSkillToPlayerProperty(v,level))
				break;
			end
		end
	end
	return petAttri;
end

function CPetPassivitySkill:ExecuteAddPetPassivitySkill(petEnumID) ----ִ�г��ﱻ������
	local objPlayer = self.petSys:GetPlayer()
	if(not objPlayer) then
		return;
	end
	if(not self.PassivitySkillList[petEnumID]) then
		return;
	end
	local petSys = self.petSys;
	local petAttri = SSingleAttrChange:new();
	local level = 0;
	for k,v in pairs(self.PassivitySkillList[petEnumID]) do
		for m,n in pairs(_G.PetPassivitySkillAttriConfig) do
			if(m == v) then
				level = self:GetPetPassivitySkillLevel(petEnumID,v)
				petAttri:AddValue(PetPassivitySkillScript:GetSkillToPlayerProperty(v,level))
				break;
			end
		end
	end
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	local petObj = petSys:GetPetObj(petEnumID)
	local tbInfo = {};
	if(petObj) then
		tbInfo = petObj:GetInstructInfo();
		tbInfo:AddValue(petAttri);
		skillSystem:NotifyPetStateProperty(tbInfo,petEnumID);  
	end
end
function CPetPassivitySkill:ExecuteDelPetPassivitySkill(petEnumID)
	local objPlayer = self.petSys:GetPlayer()
	if(not objPlayer) then
		return;
	end
	local petSys = self.petSys;
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	local petObj = petSys:GetPetObj(petEnumID)
	local tbInfo = {};
	if(petObj) then
		tbInfo = petObj:GetInstructInfo();
		skillSystem:NotifyPetStateProperty(tbInfo,petEnumID);  
	end
end
function CPetPassivitySkill:GetPetPassivitySkillAddAttriAdv(petEnumID) ---��ȡ���ﱻ�����ܼӳɣ����˸�����ӵ����ԣ�
	local tabInfo = {
		AddExpPre = 0,
	}
	if(not self.PassivitySkillList[petEnumID]) then
		return tabInfo;
	end
	for k,v in pairs(self.PassivitySkillList[petEnumID]) do
		for m,n in pairs(_G.PetPassivitySkillAttriConfig) do
			if(m == v) then
				tabInfo.AddExpPre = tabInfo.AddExpPre + n.AddExpPre;
			end
		end
	end
	return tabInfo;
end
---�ܵ��Ĺ��� �Լ����˺�
function CPetPassivitySkill:CalPetPassSkiToSelfHurt(petEnumID,dwSelfHurtValue)
	local HurtPre = 0;
	if(not self.PassivitySkillList[petEnumID]) then
		return dwSelfHurtValue;
	end
	for k,v in pairs(self.PassivitySkillList[petEnumID]) do
		for m,n in pairs(_G.PetPassivitySkillAttriConfig) do
			if(m == v) then
				HurtPre = HurtPre+n.HurtPre;
			end
		end
	end
	dwSelfHurtValue = dwSelfHurtValue*(1+HurtPre/100);
	if(dwSelfHurtValue <= 0) then
		dwSelfHurtValue = 0;
	end
	return dwSelfHurtValue;
end
----�ܵ��Ĺ��� �Է����˺��������˺���
function CPetPassivitySkill:CalPetPassSkiToTarHurt(petEnumID)
	local TarAttHurtPoint = 0;
	if(not self.PassivitySkillList[petEnumID]) then
		return TarAttHurtPoint;
	end
	local level = 0;
	for k,v in pairs(self.PassivitySkillList[petEnumID]) do
		for m,n in pairs(_G.PetPassivitySkillAttriConfig) do
			if(m == v) then
				level = self:GetPetPassivitySkillLevel(petEnumID,v)
				TarAttHurtPoint = TarAttHurtPoint+PetPassivitySkillScript:GetSkillToTarHurt(m,level);
			end
		end
	end
	return TarAttHurtPoint;
end
