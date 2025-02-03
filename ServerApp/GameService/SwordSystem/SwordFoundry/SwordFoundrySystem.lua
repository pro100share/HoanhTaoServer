--[[
	����ע��ϵͳ
	κ��
	2013-10-17
]]
_G.CSwordFoundrySystem = {};
----ϵͳ��
function CSwordFoundrySystem:new()
	local obj = CSystem:new("CSwordFoundrySystem");
	obj.objDBQuery = nil;    --��Ӧ�����ݿ����ģ��
	for i,v in pairs(CSwordFoundrySystem) do
		if type(v) == "function" then
			obj[i] = v;
		end
	end
	return obj;
end
---ϵͳ����
function CSwordFoundrySystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		return;
	end;
	self.objDBQuery = CSwordFoundrySystemDB:new(objDB, self);
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	if not skillSystem then
		return;
	end
	self.skillSystem = skillSystem;
	self.ResData ={};-----���ݿ���Ϣ
	self:InitSwordFoundryInfo();
	local Data =  objPlayer:GetLineData("CSwordFoundrySystem") or {};
	if(#Data == 0) then
		return;
	end
	if(Data[1].dwRoleID ~= nil) then
		self.ResData.dwRoleID = Data[1].dwRoleID;
		self.ResData.dwSwordEumeID = Data[1].dwSwordEumeID;
		self.ResData.dwStartNum = Data[1].dwStartNum;
		self.ResData.dwSkilledValue = Data[1].dwSkilledValue;
	end
	if(self.ResData.dwStartNum > 0) then
		self:AddSwordFoundryAttriValue(self.ResData.dwStartNum);
	end
end

function CSwordFoundrySystem:Update()
end

function CSwordFoundrySystem:Destroy()
end
----���뻻��
function CSwordFoundrySystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end
	objPlayer:SetLineData("CSwordFoundrySystem",self.ResData);
end

--���볡��ͬ����Ϣ
function CSwordFoundrySystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.ResData then	
		objPlayer.SendSwordFoundryInfoMsg{Info = self.ResData};
	end
end
----��ʼ������ע����Ϣ
function CSwordFoundrySystem:InitSwordFoundryInfo()
	self.ResData.dwRoleID = 0;
	self.ResData.dwSwordEumeID = 1;
	self.ResData.dwStartNum = 0;
	self.ResData.dwSkilledValue = 0;
end
----����ע��
function CSwordFoundrySystem:SetSwordFoundry(swordEnumID,isAddStone)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		_info("error:CSwordFoundrySystem:SetSwordFoundry sysScript is error",sysScript);
		return;
	end
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return ;
	end
	if(self.ResData.dwSwordEumeID ~= swordEnumID) then
		return;
	end
	if(not self:CheckIsSwordFoundryByEnumID(swordEnumID)) then
		_info("error:CheckIsSwordFoundryByEnumID is not swordEnumID",swordEnumID);
		return;
	end
	local curStartNum = self.ResData.dwStartNum; ---��ǰ������
	local startNum = self:GetSwordFoundryWordNumIsOpen();
	if(startNum == nil) then
		return;
	end	
	if(curStartNum >= startNum) then
		return;
	end
	local maxStartNum = _G.GetSwordFoundryMaxStartNum(swordEnumID); -----ĳһ�������������
	if(curStartNum >= maxStartNum) then
		return;
	end
	local curSkilledValue = self.ResData.dwSkilledValue; ---��ǰ��������
	local maxSkilledValue = _G.GetSwordFoundrySkilledMaxValue(curStartNum+1) ---��Ҫ���ǵ������������
	local consumeInfo = _G.GetSwordFoundryConsumeInfo(curStartNum+1);-----������Ϣ
	
	if(consumeInfo.dwMetalValue < 0 or consumeInfo.dwWoodValue < 0 or consumeInfo.dwWaterValue < 0 or  consumeInfo.dwFireValue < 0 or consumeInfo.dwEarthValue < 0) then
		_info("_G.GetSwordFoundryConsumeInfo is err",swordEnumID);
		return;
	end
	if(isAddStone) then
		local packNum = objItemSystem:GetEnumItemNumInPacket(consumeInfo.dwSwordStoneID)
		if(packNum < consumeInfo.dwSwordStoneValue) then  ----�����е�������Ʒ��������
			return;
		end
		if(objItemSystem:CheckPacketItemIsNotTime(consumeInfo.dwSwordStoneID,true,consumeInfo.dwSwordStoneValue)) then  ----��ʱreturn
			return;
		end
		if(consumeInfo.dwSwordStoneValue < 0) then
			_info("_G.GetSwordFoundryConsumeInfo is err",swordEnumID);
			return;
		end
	end
	if(isAddStone) then ----��ʯͷʱ�Ķ���ӳ�
		consumeInfo.dwMetalValue = consumeInfo.dwMetalValue - consumeInfo.dwMetalValue*_G.GetSwordFoundryValuePre(curStartNum+1)/100;
		consumeInfo.dwWoodValue = consumeInfo.dwWoodValue - consumeInfo.dwWoodValue*_G.GetSwordFoundryValuePre(curStartNum+1)/100;
		consumeInfo.dwWaterValue = consumeInfo.dwWaterValue - consumeInfo.dwWaterValue*_G.GetSwordFoundryValuePre(curStartNum+1)/100;
		consumeInfo.dwFireValue = consumeInfo.dwFireValue - consumeInfo.dwFireValue*_G.GetSwordFoundryValuePre(curStartNum+1)/100;
		consumeInfo.dwEarthValue = consumeInfo.dwEarthValue - consumeInfo.dwEarthValue*_G.GetSwordFoundryValuePre(curStartNum+1)/100;
	end
	if(consumeInfo.dwMetalValue <0 )then
		consumeInfo.dwMetalValue = 0;
	end
		if(consumeInfo.dwWoodValue <0 )then
		consumeInfo.dwWoodValue = 0;
	end
	if(consumeInfo.dwEarthValue <0 )then
		consumeInfo.dwEarthValue = 0;
	end
		if(consumeInfo.dwWaterValue <0 )then
		consumeInfo.dwWaterValue = 0;
	end
		if(consumeInfo.dwFireValue <0 )then
		consumeInfo.dwFireValue = 0;
	end
	local FiveElemSys = objPlayer:GetSystem('CFiveElemSystem');
	if(not FiveElemSys) then
		return ;
	end
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = FiveElemSys:GetElemValue()
	if(uItemGold< consumeInfo.dwMetalValue or uItemWood < consumeInfo.dwWoodValue or uItemWater < consumeInfo.dwWaterValue or uItemFire < consumeInfo.dwFireValue or uItemEarth < consumeInfo.dwEarthValue) then
		return ;
	end
	if(isAddStone) then
		--ɾ����Ʒ����
		local isSucc = objItemSystem:DelEnumItemInPacket(consumeInfo.dwSwordStoneID,consumeInfo.dwSwordStoneValue,true, _G.ItemSysOperType.SwordFoundry) 
		if not isSucc then
			return ;
		end
	end
	-----������ҵ�����ֵ
	FiveElemSys:ChangeAttr( 'dwMetalValue', -consumeInfo.dwMetalValue )
	FiveElemSys:ChangeAttr( 'dwWoodValue', -consumeInfo.dwWoodValue )
	FiveElemSys:ChangeAttr( 'dwWaterValue', -consumeInfo.dwWaterValue )
	FiveElemSys:ChangeAttr( 'dwFireValue', -consumeInfo.dwFireValue )
	FiveElemSys:ChangeAttr( 'dwEarthValue', -consumeInfo.dwEarthValue )
	FiveElemSys:UpdateInfoToClient(objPlayer,2)
	
	local randSkilledValue = self:GetRanderCanNotRepeatSkillInfo(curStartNum);
	if((curSkilledValue + randSkilledValue) >= maxSkilledValue) then
		
		self.ResData.dwSkilledValue = 0;
		self.ResData.dwStartNum = curStartNum + 1;
		----�����������
		self:AddSwordFoundryAttriValue(self.ResData.dwStartNum);
		if(self.ResData.dwRoleID == objPlayer:GetRoleID()) then
			self.objDBQuery:UpdateDBSwordFoundry();  ----��������
		else
			self.ResData.dwRoleID = objPlayer:GetRoleID();
			self.objDBQuery:InsertDBSwordFoundry(); ----��������
		end
		objPlayer.SetSwordFoundryValueSuccMsg{Info = self.ResData};
		----����ע��㲥
		local isBroadCast = _G.GetSwordFoundryIsBroadCast(self.ResData.dwStartNum)
		if(isBroadCast) then
			CGameApp.SwordFoundryBroadCastMsg{PlayerID = objPlayer:GetRoleID(),PlayerName = objPlayer:GetName(),StartNum =self.ResData.dwStartNum}
		end
	else
		self.ResData.dwSkilledValue = curSkilledValue + randSkilledValue;
		if(self.ResData.dwRoleID == objPlayer:GetRoleID()) then
			self.objDBQuery:UpdateDBSwordFoundry();  ----��������
		else
			self.ResData.dwRoleID = objPlayer:GetRoleID();
			self.objDBQuery:InsertDBSwordFoundry(); ----��������
		end
		objPlayer.SetSwordFoundryValueSuccMsg{Info = self.ResData};
	end
end
---���ݵ��������Ǽ�
function CSwordFoundrySystem:SetSwordFoundryLevelByItem(dwItemEnumID,dwLevelNum)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return 1 ;
	end
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		_info("error:CSwordFoundrySystem:SetSwordFoundry sysScript is error",sysScript);
		return 1;
	end
	local curStartNum = self.ResData.dwStartNum; ---��ǰ������
	local startNum0 = self:GetSwordFoundryWordNumIsOpen();
	if(startNum0 == nil) then
		return 2 ;
	end	
	if(curStartNum >= startNum0) then
		sysScript:Notice(4001360005);
		return 3 ;
	end
	local maxStartNum = _G.GetSwordFoundryMaxStartNum(); -----ĳһ�������������
	if(curStartNum >= maxStartNum) then
		sysScript:Notice(4001360005)
		return 4;
	end
	self.ResData.dwStartNum = self.ResData.dwStartNum+dwLevelNum;
	self.ResData.dwSkilledValue = 0;
	self:AddSwordFoundryAttriValue(self.ResData.dwStartNum);
	if(self.ResData.dwRoleID == objPlayer:GetRoleID()) then
		self.objDBQuery:UpdateDBSwordFoundry();  ----��������
	else
		self.ResData.dwRoleID = objPlayer:GetRoleID();
		self.objDBQuery:InsertDBSwordFoundry(); ----��������
	end
	objPlayer.SetSwordFoundryValueSuccMsg{Info = self.ResData};
	----����ע��㲥
	local isBroadCast = _G.GetSwordFoundryIsBroadCast(self.ResData.dwStartNum)
	if(isBroadCast) then
		CGameApp.SwordFoundryBroadCastMsg{PlayerID = objPlayer:GetRoleID(),PlayerName = objPlayer:GetName(),StartNum =self.ResData.dwStartNum}
	end
	return nil;
end
----ʹ�õ�������������
function CSwordFoundrySystem:SetSwordFoundryByItem(dwItemEnumID)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return 1 ;
	end
	local curStartNum = self.ResData.dwStartNum; ---��ǰ������
	local startNum0 = self:GetSwordFoundryWordNumIsOpen();
	if(startNum0 == nil) then
		return 2 ;
	end	
	if(curStartNum >= startNum0) then
		return 3 ;
	end
	local maxStartNum = _G.GetSwordFoundryMaxStartNum(); -----ĳһ�������������
	if(curStartNum >= maxStartNum) then
		return 4;
	end
	local curSkilledValue = self.ResData.dwSkilledValue; ---��ǰ��������
	local maxSkilledValue = _G.GetSwordFoundrySkilledMaxValue(curStartNum+1) ---��Ҫ���ǵ������������
	
	local addSkilledValue = self:GetSwordFoundrySkilledValue(dwItemEnumID);
	if(addSkilledValue == nil) then
		return 5;
	end
	local startNum ,curSkilledValue = _G.GetSwordFoundryAddStartNum(curStartNum,self.ResData.dwSwordEumeID,addSkilledValue,curSkilledValue)
	
	if(startNum >= curStartNum) then
		self.ResData.dwSkilledValue = curSkilledValue;
		self.ResData.dwStartNum = startNum;
		self:AddSwordFoundryAttriValue(self.ResData.dwStartNum);
		if(self.ResData.dwRoleID == objPlayer:GetRoleID()) then
			self.objDBQuery:UpdateDBSwordFoundry();  ----��������
		else
			self.ResData.dwRoleID = objPlayer:GetRoleID();
			self.objDBQuery:InsertDBSwordFoundry(); ----��������
		end
		objPlayer.SetSwordFoundryValueSuccMsg{Info = self.ResData};
		----����ע��㲥
		local isBroadCast = _G.GetSwordFoundryIsBroadCast(self.ResData.dwStartNum)
		if(isBroadCast) then
			CGameApp.SwordFoundryBroadCastMsg{PlayerID = objPlayer:GetRoleID(),PlayerName = objPlayer:GetName(),StartNum =self.ResData.dwStartNum}
		end
	else
		self.ResData.dwSkilledValue = curSkilledValue;
		if(self.ResData.dwRoleID == objPlayer:GetRoleID()) then
			self.objDBQuery:UpdateDBSwordFoundry();  ----��������
		else
			self.ResData.dwRoleID = objPlayer:GetRoleID();
			self.objDBQuery:InsertDBSwordFoundry(); ----��������
		end
		objPlayer.SetSwordFoundryValueSuccMsg{Info = self.ResData};
	end
	return nil;
end
function CSwordFoundrySystem:GetCurAllSwordFoundryAttriValue(curStartNum)
	if(curStartNum ==0) then
		return {};
	end
	local propertyInfo = {
		dwHPMax  = 0,	   --����max
		dwMPMax = 0,    --����max
		dwAttack= 0,   --����
		dwDefense= 0,  --����
		dwFlee= 0,	   --��
		dwCrit  = 0,	
		dwMoveSpeed = 0,
	
	}
	if(curStartNum == 1) then
		propertyInfo = _G.GetSwordFoundryAttributeList(1);
		return propertyInfo;
	end
	local tempInfo = {};
	for i = 1,curStartNum do
		tempInfo = _G.GetSwordFoundryAttributeList(i);
		propertyInfo.dwHPMax  = propertyInfo.dwHPMax+ tempInfo.dwHPMax;	   --����max
		propertyInfo.dwMPMax = propertyInfo.dwMPMax+ tempInfo.dwMPMax;    --����max
		propertyInfo.dwAttack= propertyInfo.dwAttack+ tempInfo.dwAttack;   --����
		propertyInfo.dwDefense= propertyInfo.dwDefense+tempInfo.dwDefense;  --����
		propertyInfo.dwFlee= propertyInfo.dwFlee+ tempInfo.dwFlee;	   --��
		propertyInfo.dwCrit  = propertyInfo.dwCrit+tempInfo.dwCrit;	
		propertyInfo.dwMoveSpeed = propertyInfo.dwMoveSpeed+ tempInfo.dwMoveSpeed;
	end
	return propertyInfo;
end
function CSwordFoundrySystem:AddSwordFoundryAttriValue(curStartNum)
	if(curStartNum == 0) then
		return;
	end
	local t_attr = _G.SSingleAttrChange:new();
	----�����������
	local propertyInfo = self:GetCurAllSwordFoundryAttriValue(curStartNum);
	-- local swordsys = self:GetPlayer():GetSystem('CSwordSystem');
	-- if not swordsys.SwordObj then
		-- return;
	-- end;
	if propertyInfo then
		self:GetMarkValue();
		t_attr.dwHPMax	= propertyInfo.dwHPMax;	   --����max
		t_attr.dwMPMax	= propertyInfo.dwMPMax ;    --����max
		t_attr.dwAttack	= propertyInfo.dwAttack ;   --����
		t_attr.dwDefense= propertyInfo.dwDefense ;  --����
		t_attr.dwFlee	= propertyInfo.dwFlee ;	   --��
		t_attr.dwCrit	= propertyInfo.dwCrit ;	   --����
		t_attr.dwMoveSpeed = propertyInfo.dwMoveSpeed;	--�ƶ��ٶ�
		self.skillSystem:NotifySwordUpdate(t_attr,2);
	end
	-- local propertyInfo1 = swordsys.SwordObj:GetPropertyValue();
	-- if propertyInfo then
		-- self:GetMarkValue();
		-- t_attr.dwHPMax	= propertyInfo.dwHPMax + (propertyInfo1["dwHPMax"]  or 0);	   --����max
		-- t_attr.dwMPMax	= propertyInfo.dwMPMax + (propertyInfo1["dwMPMax"] or  0);    --����max
		-- t_attr.dwAttack	= propertyInfo.dwAttack + (propertyInfo1["dwAttack"]  or 0);   --����
		-- t_attr.dwDefense= propertyInfo.dwDefense + (propertyInfo1["dwDefense"] or 0);  --����
		-- t_attr.dwFlee	= propertyInfo.dwFlee + (propertyInfo1["dwFlee"] or 0);	   --��
		-- t_attr.dwCrit	= propertyInfo.dwCrit + (propertyInfo1["dwCrit"] or 0);	   --����
		-- t_attr.dwMoveSpeed = propertyInfo.dwMoveSpeed + (propertyInfo1["dwMoveSpeed"] or 0);	--�ƶ��ٶ�
		-- self.skillSystem:NotifySwordUpdate(t_attr);
	-- end
end
----��ȡ����
function CSwordFoundrySystem:GetMarkValueStr()
	local curStartNum = self.ResData.dwStartNum; ---��ǰ������
	local propertyInfo = self:GetCurAllSwordFoundryAttriValue(curStartNum);
	local dwRsl = 0;
	dwRsl=dwRsl+(propertyInfo.dwAttack or 0)*EquipGradeConfig.dwAttack
	dwRsl=dwRsl+(propertyInfo.dwDefense or 0)*EquipGradeConfig.dwDefense
	dwRsl=dwRsl+(propertyInfo.dwCrit or 0)*EquipGradeConfig.dwCrit
	dwRsl=dwRsl+(propertyInfo.dwFlee or 0)*EquipGradeConfig.dwFlee
	dwRsl=dwRsl+(propertyInfo.dwHPMax or 0)*EquipGradeConfig.dwHPMax
	dwRsl=dwRsl+(propertyInfo.dwMPMax or 0)*EquipGradeConfig.dwMPMax
	dwRsl=dwRsl+(propertyInfo.dwMoveSpeed or 0)*EquipGradeConfig.dwMoveSpeed
	return dwRsl;
end

function CSwordFoundrySystem:GetMarkValue()
	local markValue = self:GetMarkValueStr();
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	objPlayer.SendSwordFoundryMarkValueMsg{Value = markValue};
end
function CSwordFoundrySystem:GetSwordFoundrySkilledValue(dwItemEnumID)
	for k,v in pairs(_G.GetSwordFoundrySkilledValueByItemConfig) do
		if(k == dwItemEnumID) then
			return v;
		end
	end
	return nil;
end
---����Ƿ��ǿ�ע�鱦��
function CSwordFoundrySystem:CheckIsSwordFoundryByEnumID(swordEnumID)
	for k,v in pairs(_G.SwordFoundrySysOperType) do
		if(v == swordEnumID) then
			return true;
		end
	end
	return false;
end
----����Ƿ������ַ�����
function CSwordFoundrySystem:GetSwordFoundryWordNumIsOpen()
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	local swordSys = objPlayer:GetSystem("CSwordSystem");
	if(not swordSys) then
		return nil;
	end
	local curswordLadder = swordSys:GetSwordLadder();----��ǰ����Ʒ����
	local canOpenWordNum = 0;
	local index = 0;
	for k,v in pairs(_G.GetSwordFoundryOpenStartConfig) do
		if(curswordLadder == k) then
			canOpenWordNum = v;
			break
		end
	end
	if(canOpenWordNum == 0) then
		return nil;
	end
	return canOpenWordNum;
end
---  �������������Ȩ�أ�
function CSwordFoundrySystem:GetRanderCanNotRepeatSkillInfo(curStartNum)
	local skilledInfoList = {}; -----����������Ϣ�б�
	local allWeightValue = 0;
	local skilledWeightList = _G.GetSwordFoundrySkilledWeightList(curStartNum+1)
	for i = 1,#skilledWeightList do
		skilledInfoList[i] = {}
		skilledInfoList[i].skilledValue = skilledWeightList[i].skilledValue;
		skilledInfoList[i].weightValue = skilledWeightList[i].weightValue;
		allWeightValue = allWeightValue + skilledWeightList[i].weightValue;
	end
	local getindex = 0;
	local index = 0;
	getindex = math.random(1,allWeightValue)
	for j = 1,#skilledInfoList do
		if(skilledInfoList[j].weightValue >= getindex) then
			index = j
			break
		else
			getindex = getindex - skilledInfoList[j].weightValue 
		end
	end
	return skilledInfoList[index].skilledValue;
end

