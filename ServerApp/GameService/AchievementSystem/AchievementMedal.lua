--�ɾ�ѫ��

--����ѫ��
function CAchievementSystem:ActiveMedal(dwMedalID)
	local objSelf = self:GetPlayer();
	--�ж�
	local cfg = AchievementMedalConfig[dwMedalID];
	if not cfg then
		return;
	end
	local dwAllPint = self:ParseGeneralPoint();
	dwAllPint = dwAllPint + self.dwAchievePointPlus;
	if dwAllPint < cfg.dwCostAchieveNumber then
		return;
	end
	
	for k,v in pairs(self.setActiveMedal) do
		if v == dwMedalID then
			return;
		end
	end
	--����
	table.insert(self.setActiveMedal, dwMedalID);
	--self.setActiveMedal[dwMedalID] = 1;
	self.objDBQuery:SaveAchievementMedal(self.setActiveMedal);
	
	self:CountMedalAttr()
	-- print("===ActiveMedal===",dwMedalID)
	objSelf.OnActiveMedalMsg{ChgList = {dwMedalID}};
	
	--���һ���еĳɾ����˾͹㲥
	local dwMyIndex = cfg.dwButtonType;
	local cfgBtn = AchieveButtonConfig[dwMyIndex];
	if not cfgBtn then
		return;
	end
	
	local isAllAct = true;
	for k,v in pairs(cfgBtn.setMedalList)do
		-- if not self.setActiveMedal[v] then
			-- isAllAct = false;
			-- break;
		-- end
		
		local bIsFind = false
		for _, medalID in pairs(self.setActiveMedal) do
			if medalID == v then
				bIsFind = true;
				break
			end
		end
		
		if not bIsFind then
			isAllAct = false;
			break;
		end
		
	end
	
	if isAllAct then
		CKernelApp.KSMedalNoticeMsg
		{
			RoleID = objSelf:GetRoleID();
			RoleName = objSelf:GetName();
			ButtonIndex = dwMyIndex;
		}
	end
end;

--���Ӷ���ɾ͵�
function CAchievementSystem:AddPlusPoint(dwValue)
	local objSelf = self:GetPlayer();
	
	self.dwAchievePointPlus = self.dwAchievePointPlus + dwValue;
	
	self.objDBQuery:SavePlusPoint(self.dwAchievePointPlus);
	
	objSelf.OnPlusPointChangeMsg{PlusPoint = self.dwAchievePointPlus};
end;

--����ѫ������
function CAchievementSystem:CountMedalAttr()
	local objSelf = self:GetPlayer();
	local sysSkill = objSelf:GetSystem("CSkillSystem");
	
	local attrAdv = SSingleAttrChange:new();
	for _,dwID in pairs(self.setActiveMedal)do
	--for dwID,_ in pairs(self.setActiveMedal)do
		if tonumber(dwID) then
			local cfg = AchievementMedalConfig[tonumber(dwID)];
			if cfg then
				local tmp = cfg.FunAttrCount();
				attrAdv:AddValue(tmp);
			end		
		end;
	end
	
	sysSkill:NotifyAchievement("medal",attrAdv)
end;


function CAchievementSystem:GetInitMedalInfo()
	local objSelf = self:GetPlayer();
	
	objSelf.OnInitMedalInfoMsg
	{
		List = self.setActiveMedal;
		PlusPoint = self.dwAchievePointPlus;
	}
end;

function CAchievementSystem:SendMedalNotice(dwRoleID,szRoleName,dwIndex)
	local objSelf = self:GetPlayer();
	
	objSelf.OnRoleCompleteButtonMsg
	{
		RoleID = dwRoleID;
		RoleName = szRoleName;
		ButtonIndex = dwIndex;
	}
end;
