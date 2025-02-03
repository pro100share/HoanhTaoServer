------------------------------------
------------------------------------
--����ϵͳ�ڲ��Ľӿ��ļ�
--author lkj



--��ȡ�������ϵı�ʯ
function CItemSystem:GetAllStone()
	local setStone = {};
	for _, itemInstID in ipairs(self:GetStoneRoom():GetAllItemID()) do
		local itemInst = self:GetItemInst(itemInstID);
		if itemInst then
			table.insert(setStone, itemInst);
		end;
	end;
	
	return setStone;
end;

--��ȡװ��λ���ϵı�ʯ
function CItemSystem:GetWearPosStone(dwWearPos)
    local setStone = {};
    for _, itemInstID in ipairs(self:GetStoneRoom():GetWearPosStoneIDSet(dwWearPos)) do
        local itemInst = self:GetItemInst(itemInstID);
		if itemInst then
			table.insert(setStone, itemInst);
		end;
    end;
    return setStone;
end;



--ָ������λ�õ�װ������
function CItemSystem:StoneAdd(dwWearPos, stoneInst)
	if self.b_Create then return end;
    local addAttr = stoneInst:GetAddAttr()
    self.StoneAttrList[dwWearPos]:AddValue(addAttr);
	local num = self:GetAddStoneFoundryConfigNum(dwWearPos)
	self:SetFoundryTotalAttr(num,addAttr,true)
	local totalattr = self:StoneAddFoundryAttrChange(num,addAttr,dwWearPos) ---��ʯ����
	self:AttrEqual(addAttr,totalattr)
    self.StoneTotalAttr:AddValue(addAttr);
	--��ʯ�ӳ����Ը���
	self:StoneAttrChange();	
	--��װ����
	self:StoneSuitChange(dwWearPos);
	--��ʯ�������Ը���
	self:StoneAddJPAttrChange(dwWearPos);
	self:GetStoneExTotalPower() ---���ͻ��˱�ʯ����ս����
end;

function CItemSystem:StoneDel(dwWearPos, stoneInst)
    local subAttr = stoneInst:GetAddAttr()			
    self.StoneAttrList[dwWearPos]:SubValue(subAttr);
	local num = self:GetDelStoneFoundryConfigNum(dwWearPos)
	self:SetFoundryTotalAttr(num,subAttr,false)
	local totalattr = self:StoneAddFoundryAttrChange(num,subAttr,dwWearPos) ---��ʯ����
	self:AttrEqual(subAttr,totalattr)
    self.StoneTotalAttr:SubValue(subAttr);
    --��ʯ�ӳ����Ը���
	self:StoneAttrChange();
    --��װ����
	self:StoneSuitChange(dwWearPos);
	--��ʯ�������Ը���
	self:StoneAddJPAttrChange(dwWearPos);
	self:GetStoneExTotalPower() ---���ͻ��˱�ʯ����ս����
end;

----���Ը�ֵ����
function CItemSystem:AttrEqual(attr,totalattr)
	attr.dwAttack		= totalattr.dwAttack;		--����
	attr.dwDefense		= totalattr.dwDefense;	--����
	attr.dwFlee			= totalattr.dwFlee;		--��
	attr.dwCrit			= totalattr.dwCrit;		--����
	attr.dwHPMax		= totalattr.dwHPMax;	--����max
	attr.dwMPMax		= totalattr.dwMPMax;--����max
	attr.dwMoveSpeed    = totalattr.dwMoveSpeed;	--�ƶ��ٶ�
	attr.dwAttackSpeed	= totalattr.dwAttackSpeed;--�����ٶ�
	attr.dwRemitAttack	= totalattr.dwRemitAttack;--�˺�����
end

----���Ը�ֵ����
function CItemSystem:AttrReEqual(attr,attr)
	if(attr.dwAttack ~= 0 ) then
		attr.dwAttack = -attr.dwAttack 
	end
	if(attr.dwDefense ~= 0 ) then
		attr.dwDefense = -attr.dwDefense 
	end
	if(attr.dwFlee ~= 0) then
		attr.dwFlee = -attr.dwFlee 
	end
	if(attr.dwCrit ~= 0) then
		attr.dwCrit = -attr.dwCrit
	end
	if(attr.dwHPMax ~= 0) then
		attr.dwHPMax = -attr.dwHPMax 
	end
	if(attr.dwMPMax ~= 0) then
		attr.dwMPMax = -attr.dwMPMax
	end
	if(attr.dwMoveSpeed ~= 0) then
		attr.dwMoveSpeed = -attr.dwMoveSpeed 
	end
	if(attr.dwAttackSpeed ~= 0) then
		attr.dwAttackSpeed = -attr.dwAttackSpeed 
	end
	if(attr.dwRemitAttack ~= 0) then
		attr.dwRemitAttack = -attr.dwRemitAttack 
	end
end

--װ�����Ըı�
function CItemSystem:StoneAttrChange()
	--ͬ������
	local totalAttr = self.StoneTotalAttr:Clone();
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyStoneUpdate(totalAttr, false);
end;


--��ʯ��װ����
function CItemSystem:StoneSuitChange(dwPos)
	local dwNum = self:GetStoneRoom():GetWearPosStoneNum(dwPos) or 0;
	
	local tbStoneInfo = self.SuitsInfo.setEquipInfo[dwPos];
	if not tbStoneInfo then
		return;
	end
	
	tbStoneInfo.dwStoneNumber = dwNum;
	
	local dwMinLevel = 99;
	local tbStoneList = self:GetStoneRoom():GetWearPosStoneIDSet(dwPos);
	for _,dwStone in pairs(tbStoneList)do
		local objStone = self:GetItemInst(dwStone);
		if objStone then
			local dwLevel = objStone:GetLevel();
			
			if dwLevel < dwMinLevel then
				dwMinLevel = dwLevel;
			end
		end
	end
	
	if dwNum < 5 then
		dwMinLevel = 0;
	end
	
	tbStoneInfo.dwStoneLevel = dwMinLevel;
	
	self.SuitsInfo.setSuitIDs = SuitCheck(self.SuitsInfo.setEquipInfo);
	local eventCenter = self:GetPlayer():GetSystem("CPlayerEventCenterSystem");
	--��װ���Լӳ�
	local addAttrAdv = SSingleAttrChange:new();
	local addAttrPer = SSingleAttrChange:new();
	for k, v in ipairs(self.SuitsInfo.setSuitIDs) do
		if v.isActive == 1 then
			local objAdv,objPer = GetSuitAttr(k);
			
			addAttrAdv:AddValue(objAdv);
			addAttrPer:AddValue(objPer);
			
			eventCenter:DoEvent(enumPlayerEventType.EventEquipSuit,k);
		end
	end;
	--ͬ������
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyEquipProperty(addAttrAdv, 2);
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyEquipProperty(addAttrPer, 2, true);
	--ͬ����װ��Ч
	self:GetPlayer():SetSuitList(self.SuitsInfo.setSuitIDs);
end;



--ϵͳCreateʱ��������װ������
function CItemSystem:CalStoneAttr()
    for dwWearPos=_G.enItemWearPos.eWeapon, _G.enItemWearPos.eMount4 do
		for _, stoneInst in ipairs(self:GetWearPosStone(dwWearPos)) do
            local addAttr = stoneInst:GetAddAttr()
            self.StoneAttrList[dwWearPos]:AddValue(addAttr);
            self.StoneTotalAttr:AddValue(addAttr);
        end;
		self:JingPoAttr(dwWearPos) ---��ʯ���Ǽӳ�
	end;
	self:GetStoneExTotalPower() ---���ͻ��˱�ʯ����ս����
    --ͬ������
	local totalAttr = self.StoneTotalAttr:Clone();
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyStoneUpdate(totalAttr, false);
end;

---��ʯ���� weiyun �������Լӳ�
function CItemSystem:JingPoAttr(pos)
	local totalStoneLevel = 0
	local curJingPoByLevelAttr = {}
	local stPropertyType = 0
	for _, stoneInst in pairs (self:GetWearPosStone(pos)) do
		totalStoneLevel = totalStoneLevel + stoneInst:GetLevel();---ĳ��װ��λ����Ʒ����
    end;
	curJingPoByLevelAttr = JingPoByQTotalNumAttrConfig:GetAddAttrS(pos,totalStoneLevel); ----��ȡĳ��װ��λ�ľ�������
	self:AttrEqual(self.StoneJPTempAttr[pos],curJingPoByLevelAttr)
	JingPoByQTotalNumAttrConfig:AddValue(self.StoneJPAttr,self.StoneJPTempAttr[pos])
	self.StoneTotalAttr:AddValue(curJingPoByLevelAttr);          ---- �ϲ�����ʯ���������� 
end

--- ��ʯ���� weiyun  ���¼��㵱ǰ�ľ��Ǽӳ�
function CItemSystem:AddCurJingPoAttr(pos)
	local totalStoneLevel = 0
	local curJingPoByLevelAttr = {}
	for _, stoneInst in pairs(self:GetWearPosStone(pos)) do
		totalStoneLevel = totalStoneLevel + stoneInst:GetLevel();---ĳ��װ��λ����Ʒ����
	end
	curJingPoByLevelAttr = JingPoByQTotalNumAttrConfig:GetAddAttrS(pos,totalStoneLevel); ----��ȡĳ��װ��λ�ľ�������
	local player = self:GetPlayer();
	if(not player) then
		return;
	end
	CLogSystemManager:stone_use(player,0,pos,totalStoneLevel,2)  ----����log
	return curJingPoByLevelAttr;
end

---��ʯ���� �ӷ�����
function JingPoByQTotalNumAttrConfig:AddValue(value1,value2)
	value1.dwAttack = value1.dwAttack + value2.dwAttack;
	value1.dwDefense = value1.dwDefense + value2.dwDefense;
	value1.dwFlee = value1.dwFlee + value2.dwFlee;
	value1.dwCrit = value1.dwCrit + value2.dwCrit;
	value1.dwHPMax = value1.dwHPMax + value2.dwHPMax;
	value1.dwMPMax = value1.dwMPMax + value2.dwMPMax;
	value1.dwMoveSpeed = value1.dwMoveSpeed + value2.dwMoveSpeed;
	value1.dwAttackSpeed	= value1.dwAttackSpeed + value2.dwMoveSpeed;      
	value1.dwRemitAttack	= value1.dwRemitAttack + value2.dwRemitAttack;
end

----���Ը�ֵ����
function JingPoByQTotalNumAttrConfig:AttrEqual(attr,totalattr)
	attr.dwAttack		= totalattr.dwAttack;		--����
	attr.dwDefense		= totalattr.dwDefense;	--����
	attr.dwFlee			= totalattr.dwFlee;		--��
	attr.dwCrit			= totalattr.dwCrit;		--����
	attr.dwHPMax		= totalattr.dwHPMax;	--����max
	attr.dwMPMax		= totalattr.dwMPMax;--����max
	attr.dwMoveSpeed    = totalattr.dwMoveSpeed;	--�ƶ��ٶ�
	attr.dwAttackSpeed	= totalattr.dwAttackSpeed;--�����ٶ�
	attr.dwRemitAttack	= totalattr.dwRemitAttack;--�˺�����
end
---��ȡĳ��װ��λ�����Լӳ�
function JingPoByQTotalNumAttrConfig:GetAddAttrS(wearPos,qualityTotalNum) ---pos Ϊװ��λ�� qualityTotalNum ��Ʒ����
	local totalAttrInfo = {
		dwAttack = 0,
		dwDefense = 0,
		dwFlee = 0,
		dwCrit = 0,
		dwHPMax = 0,
		dwMPMax = 0,
		dwMoveSpeed = 0,
		dwAttackSpeed = 0,
		dwRemitAttack = 0,
	}
	if( wearPos >= _G.enItemWearPos.eAmulet and wearPos <= _G.enItemWearPos.eSpecial6) then
		return totalAttrInfo
	end
	local attrInfo = SSingleAttrChange:new();
	if (qualityTotalNum >= JingPoByQTotalNumAttrConfig[wearPos][1].qtotalNum) then
	--������������
		self:AttrEqual(attrInfo,JingPoByQTotalNumAttrConfig[wearPos][1].addShX)
		self:AddValue(totalAttrInfo,attrInfo);
	end
	if(qualityTotalNum >= JingPoByQTotalNumAttrConfig[wearPos][2].qtotalNum ) then
		--������������
		self:AttrEqual(attrInfo,JingPoByQTotalNumAttrConfig[wearPos][2].addShX)
		self:AddValue(totalAttrInfo,attrInfo);
	end
	
	return totalAttrInfo;
end;


--��ȡװ����ʯ�������Ե�����
function CItemSystem:GetJPScore()
	local score = 0;
	local sInfo = self:GetAddJPAttr();
	for k, v in pairs(sInfo) do
		if _G.EquipGradeConfig[k] then
			score = score + v * _G.EquipGradeConfig[k];
		end
	end
	return math.floor(score);
end
---��ȡ�ܱ�ʯ�������Լӳ�
function CItemSystem:GetAddJPAttr()
	local attrInfo = SSingleAttrChange:new();
	attrInfo.dwAttack		= self.StoneJPAttr.dwAttack;		--����
	attrInfo.dwDefense		= self.StoneJPAttr.dwDefense;	--����
	attrInfo.dwFlee			= self.StoneJPAttr.dwFlee;		--��
	attrInfo.dwCrit			= self.StoneJPAttr.dwCrit;		--����
	attrInfo.dwHPMax		= self.StoneJPAttr.dwHPMax;		--����max
	attrInfo.dwMPMax		= self.StoneJPAttr.dwMPMax;		--����max
	attrInfo.dwMoveSpeed	= self.StoneJPAttr.dwMoveSpeed;	--�ƶ��ٶ�
	attrInfo.dwAttackSpeed	= self.StoneJPAttr.dwAttackSpeed;--�����ٶ�
	attrInfo.dwRemitAttack	= self.StoneJPAttr.dwRemitAttack;--�˺�����
	return attrInfo;
end

--ĳһ��װ��λ�ľ������Լӳ� �ӵ���������
function CItemSystem:StoneAddJPAttrChange(dwWearPos)
	local curAttr = self:AddCurJingPoAttr(dwWearPos)
	self:AttrReEqual(self.StoneJPTempAttr[dwWearPos],self.StoneJPTempAttr[dwWearPos])
	
	JingPoByQTotalNumAttrConfig:AddValue(self.StoneJPAttr,self.StoneJPTempAttr[dwWearPos])
	JingPoByQTotalNumAttrConfig:AddValue(self.StoneJPAttr,curAttr)

	JingPoByQTotalNumAttrConfig:AddValue(self.StoneJPTempAttr[dwWearPos],curAttr)
	
	self.StoneTotalAttr:AddValue(self.StoneJPTempAttr[dwWearPos]);
	local totalAttr = self.StoneTotalAttr:Clone();
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyStoneUpdate(totalAttr, false);
	
	self:AttrEqual(self.StoneJPTempAttr[dwWearPos],curAttr)
	
end

----��ȡ��ʯ�������ñ���
function CItemSystem:GetStoneFoundryConfigNum(num,stonenum) ----stonenum �ǵڼ����� num ��������
	if(stonenum > num or stonenum == 0) then
		return 0
	end
	if(stonenum <= num) then
		local tempNum = num;
		num = stonenum + 5*(math.ceil(num/5)-1);
		if(num > tempNum) then
			num = num - 5;
		end
	end
	return num
end


---��ȡĳ��װ��λ�ı�ʯ�������ñ���
function CItemSystem:GetAddStoneFoundryConfigNum(dwWearPos)
	local num = self:GetWearPosFoundryStoneNum(dwWearPos)
	local stonenum = self:GetWearPosStoneNum(dwWearPos)
	
	return self:GetStoneFoundryConfigNum(num,stonenum)
end
---��ȡĳ��װ��λ�ı�ʯ�������ñ���
function CItemSystem:GetDelStoneFoundryConfigNum(dwWearPos)
	local num = self:GetWearPosFoundryStoneNum(dwWearPos)
	local stonenum = self:GetWearPosStoneNum(dwWearPos) + 1
	return self:GetStoneFoundryConfigNum(num,stonenum)
end
--ĳһ��װ��λ�ı�ʯ�������Լӳ� �ӵ���������
function CItemSystem:StoneAddFoundryAttrChange(num,wearPosAttr,dwWearPos)
	if(num == 0) then
		return wearPosAttr
	end
	local player = self:GetPlayer();
	if(not player) then
		return;
	end
	if(dwWearPos ~= nil) then
		CLogSystemManager:stone_use(player,0,dwWearPos,num,1)  ----����log
	end
	local wearPosfoundryAttr = {}
	if(_G.ItemFoundryConfig.Value[num].dwflag == 1) then
		wearPosfoundryAttr.dwAttack		= math.floor(wearPosAttr.dwAttack*(1+_G.ItemFoundryConfig.Value[num].AddShX));		--����
		wearPosfoundryAttr.dwDefense		= math.floor(wearPosAttr.dwDefense*(1+_G.ItemFoundryConfig.Value[num].AddShX));	--����
		wearPosfoundryAttr.dwFlee			= math.floor(wearPosAttr.dwFlee*(1+_G.ItemFoundryConfig.Value[num].AddShX));		--��
		wearPosfoundryAttr.dwCrit			= math.floor(wearPosAttr.dwCrit*(1+_G.ItemFoundryConfig.Value[num].AddShX));		--����
		wearPosfoundryAttr.dwHPMax		    = math.floor(wearPosAttr.dwHPMax*(1+_G.ItemFoundryConfig.Value[num].AddShX));--����max
		wearPosfoundryAttr.dwMPMax		    = math.floor(wearPosAttr.dwMPMax*(1+_G.ItemFoundryConfig.Value[num].AddShX));--����max
		wearPosfoundryAttr.dwMoveSpeed	    = math.floor(wearPosAttr.dwMoveSpeed*(1+_G.ItemFoundryConfig.Value[num].AddShX));	--�ƶ��ٶ�
		wearPosfoundryAttr.dwAttackSpeed	= math.floor(wearPosAttr.dwAttackSpeed*(1+_G.ItemFoundryConfig.Value[num].AddShX));--�����ٶ�
		wearPosfoundryAttr.dwRemitAttack	= math.floor(wearPosAttr.dwRemitAttack*(1+_G.ItemFoundryConfig.Value[num].AddShX));--�˺�����
		return wearPosfoundryAttr
	elseif(_G.ItemFoundryConfig.Value[num].dwflag == 2) then
		wearPosfoundryAttr.dwAttack		= wearPosAttr.dwAttack +_G.ItemFoundryConfig.Value[num].AddShX;		--����
		wearPosfoundryAttr.dwDefense		= wearPosAttr.dwDefense +_G.ItemFoundryConfig.Value[num].AddShX;	--����
		wearPosfoundryAttr.dwFlee			= wearPosAttr.dwFlee +_G.ItemFoundryConfig.Value[num].AddShX;		--��
		wearPosfoundryAttr.dwCrit			= wearPosAttr.dwCrit +_G.ItemFoundryConfig.Value[num].AddShX;		--����
		wearPosfoundryAttr.dwHPMax		    = wearPosAttr.dwHPMax +_G.ItemFoundryConfig.Value[num].AddShX;	--����max
		wearPosfoundryAttr.dwMPMax		    = wearPosAttr.dwMPMax +_G.ItemFoundryConfig.Value[num].AddShX;--����max
		wearPosfoundryAttr.dwMoveSpeed	    = wearPosAttr.dwMoveSpeed +_G.ItemFoundryConfig.Value[num].AddShX;	--�ƶ��ٶ�
		wearPosfoundryAttr.dwAttackSpeed	= wearPosAttr.dwAttackSpeed +_G.ItemFoundryConfig.Value[num].AddShX;--�����ٶ�
		wearPosfoundryAttr.dwRemitAttack	= wearPosAttr.dwRemitAttack +_G.ItemFoundryConfig.Value[num].AddShX;--�˺�����
		return wearPosfoundryAttr
	end
	_info("_G.ItemFoundryConfig is error")
	return wearPosAttr
end
----������� ��ʼ����ʯ�������Լӳ�
function CItemSystem:initFoundryAttr(dwWearPos)
	local num = self:GetWearPosFoundryStoneNum(dwWearPos)
	if(num == 0 or num == nil) then
		return
	end
	local index = 1
	local stoneindex = 1
	for _, stoneInst in ipairs(self:GetWearPosStone(dwWearPos)) do
		local addAttr = stoneInst:GetAddAttr()
		stoneindex = self:GetStoneFoundryConfigNum(num,index)
		if(stoneindex <= num) then
			local totalattr = self:StoneAddFoundryAttrChange(stoneindex,addAttr)
			self:SetFoundryTotalAttr(stoneindex,addAttr,true)
			addAttr.dwAttack		= totalattr.dwAttack - addAttr.dwAttack ;		--����
			addAttr.dwDefense		= totalattr.dwDefense - addAttr.dwDefense;	--����
			addAttr.dwFlee			= totalattr.dwFlee - addAttr.dwFlee ;		--��
			addAttr.dwCrit			= totalattr.dwCrit - addAttr.dwCrit;		--����
			addAttr.dwHPMax		    = totalattr.dwHPMax - addAttr.dwHPMax;	--����max
			addAttr.dwMPMax		    = totalattr.dwMPMax - addAttr.dwMPMax;--����max
			addAttr.dwMoveSpeed	    = totalattr.dwMoveSpeed - addAttr.dwMoveSpeed;	--�ƶ��ٶ�
			addAttr.dwAttackSpeed	= totalattr.dwAttackSpeed - addAttr.dwAttackSpeed;--�����ٶ�
			addAttr.dwRemitAttack	= totalattr.dwRemitAttack - addAttr.dwRemitAttack;--�˺�����
			
			self.StoneTotalAttr:AddValue(addAttr);
		end
		index = index + 1
	end
	local totalAttr = self.StoneTotalAttr:Clone();
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyStoneUpdate(totalAttr, false);
end


--��ȡװ����ʯ�������Ե�����
function CItemSystem:GetFoundryScore()
	local score = 0;
	local sInfo = self:GetAddFoundryAttr();
	for k, v in pairs(sInfo) do
		if _G.EquipGradeConfig[k] then
			score = score + v * _G.EquipGradeConfig[k];
		end
	end
	return math.floor(score);
end
--��ȡװ����ʯ�������Լӳ�
function CItemSystem:GetAddFoundryAttr()
	local attrInfo = SSingleAttrChange:new();
	attrInfo.dwAttack		= self.StoneFoundryAttr.dwAttack;		--����
	attrInfo.dwDefense		= self.StoneFoundryAttr.dwDefense;	--����
	attrInfo.dwFlee			= self.StoneFoundryAttr.dwFlee;		--��
	attrInfo.dwCrit			= self.StoneFoundryAttr.dwCrit;		--����
	attrInfo.dwHPMax		= self.StoneFoundryAttr.dwHPMax;		--����max
	attrInfo.dwMPMax		= self.StoneFoundryAttr.dwMPMax;		--����max
	attrInfo.dwMoveSpeed	= self.StoneFoundryAttr.dwMoveSpeed;	--�ƶ��ٶ�
	attrInfo.dwAttackSpeed	= self.StoneFoundryAttr.dwAttackSpeed;--�����ٶ�
	attrInfo.dwRemitAttack	= self.StoneFoundryAttr.dwRemitAttack;--�˺�����
	return attrInfo;
end
--����װ����ʯ�������Լӳ�
function CItemSystem:SetFoundryTotalAttr(num,wearPosAttr,flag)
	if(num == 0) then
		return
	end
	if(flag) then
		if(_G.ItemFoundryConfig.Value[num].dwflag == 1) then
		
			self.StoneFoundryAttr.dwAttack = self.StoneFoundryAttr.dwAttack+ math.floor(wearPosAttr.dwAttack*(_G.ItemFoundryConfig.Value[num].AddShX));	--����
			self.StoneFoundryAttr.dwDefense = self.StoneFoundryAttr.dwDefense+ math.floor(wearPosAttr.dwDefense*(_G.ItemFoundryConfig.Value[num].AddShX));	--����
			self.StoneFoundryAttr.dwFlee = self.StoneFoundryAttr.dwFlee+  math.floor(wearPosAttr.dwFlee*(_G.ItemFoundryConfig.Value[num].AddShX));		--��
			self.StoneFoundryAttr.dwCrit = self.StoneFoundryAttr.dwCrit+  math.floor(wearPosAttr.dwCrit*(_G.ItemFoundryConfig.Value[num].AddShX));		--����
			self.StoneFoundryAttr.dwHPMax = self.StoneFoundryAttr.dwHPMax+  math.floor(wearPosAttr.dwHPMax*(_G.ItemFoundryConfig.Value[num].AddShX));	--����max
			self.StoneFoundryAttr.dwMPMax = self.StoneFoundryAttr.dwMPMax+  math.floor(wearPosAttr.dwMPMax*(_G.ItemFoundryConfig.Value[num].AddShX));	--����max
			self.StoneFoundryAttr.dwMoveSpeed = self.StoneFoundryAttr.dwMoveSpeed+  math.floor(wearPosAttr.dwMoveSpeed*(_G.ItemFoundryConfig.Value[num].AddShX));	--�ƶ��ٶ�
			self.StoneFoundryAttr.dwAttackSpeed = self.StoneFoundryAttr.dwAttackSpeed+  math.floor(wearPosAttr.dwAttackSpeed*(_G.ItemFoundryConfig.Value[num].AddShX));--�����ٶ�
			self.StoneFoundryAttr.dwRemitAttack = self.StoneFoundryAttr.dwRemitAttack+  math.floor(wearPosAttr.dwRemitAttack*(_G.ItemFoundryConfig.Value[num].AddShX));--�˺�����
		elseif(_G.ItemFoundryConfig.Value[num].dwflag == 2) then
		
			self.StoneFoundryAttr.dwAttack = self.StoneFoundryAttr.dwAttack+_G.ItemFoundryConfig.Value[num].AddShX;	--����
			self.StoneFoundryAttr.dwDefense = self.StoneFoundryAttr.dwDefense+ _G.ItemFoundryConfig.Value[num].AddShX;	--����
			self.StoneFoundryAttr.dwFlee = self.StoneFoundryAttr.dwFlee+ _G.ItemFoundryConfig.Value[num].AddShX;		--��
			self.StoneFoundryAttr.dwCrit = self.StoneFoundryAttr.dwCrit+ _G.ItemFoundryConfig.Value[num].AddShX;		--����
			self.StoneFoundryAttr.dwHPMax = self.StoneFoundryAttr.dwHPMax+ _G.ItemFoundryConfig.Value[num].AddShX;	--����max
			self.StoneFoundryAttr.dwMPMax = self.StoneFoundryAttr.dwMPMax+ _G.ItemFoundryConfig.Value[num].AddShX;	--����max
			self.StoneFoundryAttr.dwMoveSpeed = self.StoneFoundryAttr.dwMoveSpeed+ _G.ItemFoundryConfig.Value[num].AddShX;	--�ƶ��ٶ�
			self.StoneFoundryAttr.dwAttackSpeed = self.StoneFoundryAttr.dwAttackSpeed+ _G.ItemFoundryConfig.Value[num].AddShX;--�����ٶ�
			self.StoneFoundryAttr.dwRemitAttack = self.StoneFoundryAttr.dwRemitAttack+ _G.ItemFoundryConfig.Value[num].AddShX;--�˺�����
		end
	else
		if(_G.ItemFoundryConfig.Value[num].dwflag == 1) then
		
			self.StoneFoundryAttr.dwAttack = self.StoneFoundryAttr.dwAttack-  math.floor(wearPosAttr.dwAttack*(_G.ItemFoundryConfig.Value[num].AddShX));	--����
			self.StoneFoundryAttr.dwDefense = self.StoneFoundryAttr.dwDefense-  math.floor(wearPosAttr.dwDefense*(_G.ItemFoundryConfig.Value[num].AddShX));	--����
			self.StoneFoundryAttr.dwFlee = self.StoneFoundryAttr.dwFlee-  math.floor(wearPosAttr.dwFlee*(_G.ItemFoundryConfig.Value[num].AddShX));		--��
			self.StoneFoundryAttr.dwCrit = self.StoneFoundryAttr.dwCrit-  math.floor(wearPosAttr.dwCrit*(_G.ItemFoundryConfig.Value[num].AddShX));		--����
			self.StoneFoundryAttr.dwHPMax = self.StoneFoundryAttr.dwHPMax-  math.floor(wearPosAttr.dwHPMax*(_G.ItemFoundryConfig.Value[num].AddShX));	--����max
			self.StoneFoundryAttr.dwMPMax = self.StoneFoundryAttr.dwMPMax-  math.floor(wearPosAttr.dwMPMax*(_G.ItemFoundryConfig.Value[num].AddShX));	--����max
			self.StoneFoundryAttr.dwMoveSpeed = self.StoneFoundryAttr.dwMoveSpeed-  math.floor(wearPosAttr.dwMoveSpeed*(_G.ItemFoundryConfig.Value[num].AddShX));	--�ƶ��ٶ�
			self.StoneFoundryAttr.dwAttackSpeed = self.StoneFoundryAttr.dwAttackSpeed-  math.floor(wearPosAttr.dwAttackSpeed*(_G.ItemFoundryConfig.Value[num].AddShX));--�����ٶ�
			self.StoneFoundryAttr.dwRemitAttack = self.StoneFoundryAttr.dwRemitAttack-  math.floor(wearPosAttr.dwRemitAttack*(_G.ItemFoundryConfig.Value[num].AddShX));--�˺�����
		elseif(_G.ItemFoundryConfig.Value[num].dwflag == 2) then
		
			self.StoneFoundryAttr.dwAttack = self.StoneFoundryAttr.dwAttack-_G.ItemFoundryConfig.Value[num].AddShX;	--����
			self.StoneFoundryAttr.dwDefense = self.StoneFoundryAttr.dwDefense- _G.ItemFoundryConfig.Value[num].AddShX;	--����
			self.StoneFoundryAttr.dwFlee = self.StoneFoundryAttr.dwFlee-_G.ItemFoundryConfig.Value[num].AddShX;		--��
			self.StoneFoundryAttr.dwCrit = self.StoneFoundryAttr.dwCrit- _G.ItemFoundryConfig.Value[num].AddShX;		--����
			self.StoneFoundryAttr.dwHPMax = self.StoneFoundryAttr.dwHPMax- _G.ItemFoundryConfig.Value[num].AddShX;	--����max
			self.StoneFoundryAttr.dwMPMax = self.StoneFoundryAttr.dwMPMax-_G.ItemFoundryConfig.Value[num].AddShX;	--����max
			self.StoneFoundryAttr.dwMoveSpeed = self.StoneFoundryAttr.dwMoveSpeed- _G.ItemFoundryConfig.Value[num].AddShX;	--�ƶ��ٶ�
			self.StoneFoundryAttr.dwAttackSpeed = self.StoneFoundryAttr.dwAttackSpeed- _G.ItemFoundryConfig.Value[num].AddShX;--�����ٶ�
			self.StoneFoundryAttr.dwRemitAttack = self.StoneFoundryAttr.dwRemitAttack- _G.ItemFoundryConfig.Value[num].AddShX;--�˺�����
		end
	end
	return
end

function CItemSystem:setWearPosFoundryStoneAttr(dwWearPos)
	local num = self:GetWearPosFoundryStoneNum(dwWearPos)
	local stonenum = self:GetWearPosStoneNum(dwWearPos)
	if(stonenum == 0 or stonenum < num%5 ) then ---num%5 �ڼ����գ�
		return;
	end 
	if(num%5 == 0) then
		if(stonenum < 5) then
			return;
		end
	end
	local stoneindex = num   -----�ɶ���ӳɵ�������
	if(stonenum >= num) then
		stoneindex = num
	else
		if(stonenum >= num%5) then
			if(num/5 >= 1) then
				stoneindex = num
			else
			    stoneindex = num%5
			end
		end
	end
	
	local indexnum = 0 ------������ǵڼ�����
	if(stoneindex%5 == 0) then
		indexnum = 5
	else
	    indexnum = stoneindex%5
	end
	local index = 1
	local addAttr = {}	
	for _, stoneInst in ipairs(self:GetWearPosStone(dwWearPos)) do
		if(index == indexnum) then
		   addAttr = stoneInst:GetAddAttr()
		   break
		end
		index = index +1
    end
	self:SetFoundryTotalAttr(stoneindex,addAttr,true)
	local prenum = 0
	if( stoneindex > 5) then
		prenum = stoneindex - 5
	end
	local preattr = {}
	local curattr = self:GetStoneFoundryAttr(stoneindex,addAttr)
	if(prenum > 0) then
		preattr = self:GetStoneFoundryAttr(prenum,addAttr)
		self:SetFoundryTotalAttr(prenum,addAttr,false)
		addAttr.dwAttack		= curattr.dwAttack - preattr.dwAttack ;		--����
		addAttr.dwDefense		= curattr.dwDefense - preattr.dwDefense;	--����
		addAttr.dwFlee			= curattr.dwFlee - preattr.dwFlee ;		--��
		addAttr.dwCrit			= curattr.dwCrit - preattr.dwCrit;		--����
		addAttr.dwHPMax		    = curattr.dwHPMax - preattr.dwHPMax;	--����max
		addAttr.dwMPMax		    = curattr.dwMPMax - preattr.dwMPMax;--����max
		addAttr.dwMoveSpeed	    = curattr.dwMoveSpeed - preattr.dwMoveSpeed;	--�ƶ��ٶ�
		addAttr.dwAttackSpeed	= curattr.dwAttackSpeed - preattr.dwAttackSpeed;--�����ٶ�
		addAttr.dwRemitAttack	= curattr.dwRemitAttack - preattr.dwRemitAttack;--�˺�����
	else
		addAttr.dwAttack		= curattr.dwAttack  ;		--����
		addAttr.dwDefense		= curattr.dwDefense ;	--����
		addAttr.dwFlee			= curattr.dwFlee  ;		--��
		addAttr.dwCrit			= curattr.dwCrit;		--����
		addAttr.dwHPMax		    = curattr.dwHPMax ;	--����max
		addAttr.dwMPMax		    = curattr.dwMPMax;--����max
		addAttr.dwMoveSpeed	    = curattr.dwMoveSpeed ;	--�ƶ��ٶ�
		addAttr.dwAttackSpeed	= curattr.dwAttackSpeed ;--�����ٶ�
		addAttr.dwRemitAttack	= curattr.dwRemitAttack ;--�˺�����
	end
    self.StoneTotalAttr:AddValue(addAttr);
	--��ʯ�ӳ����Ը���
	self:StoneAttrChange();	
	self:GetStoneExTotalPower() ---���ͻ��˱�ʯ����ս����
	local player = self:GetPlayer();
	if(not player) then
		return;
	end
	CLogSystemManager:stone_use(player,0,dwWearPos,num,1)  ----����log
end

function CItemSystem:GetStoneFoundryAttr(num,addAttr)
	local attr =  SSingleAttrChange:new();
	if(_G.ItemFoundryConfig.Value[num].dwflag == 1) then
		attr.dwAttack		=  math.floor(addAttr.dwAttack*_G.ItemFoundryConfig.Value[num].AddShX );		--����
		attr.dwDefense		=  math.floor(addAttr.dwDefense*_G.ItemFoundryConfig.Value[num].AddShX);	--����
		attr.dwFlee			=  math.floor(addAttr.dwFlee*_G.ItemFoundryConfig.Value[num].AddShX );		--��
		attr.dwCrit			=  math.floor(addAttr.dwCrit*_G.ItemFoundryConfig.Value[num].AddShX);		--����
		attr.dwHPMax		=  math.floor(addAttr.dwHPMax*_G.ItemFoundryConfig.Value[num].AddShX);	--����max
		attr.dwMPMax		=  math.floor(addAttr.dwMPMax*_G.ItemFoundryConfig.Value[num].AddShX);--����max
		attr.dwMoveSpeed	=  math.floor(addAttr.dwMoveSpeed*_G.ItemFoundryConfig.Value[num].AddShX);	--�ƶ��ٶ�
		attr.dwAttackSpeed	=  math.floor(addAttr.dwAttackSpeed*_G.ItemFoundryConfig.Value[num].AddShX);--�����ٶ�
		attr.dwRemitAttack	=  math.floor(addAttr.dwRemitAttack*_G.ItemFoundryConfig.Value[num].AddShX);--�˺�����
	elseif(_G.ItemFoundryConfig.Value[num].dwflag == 2) then
		attr.dwAttack		= addAttr.dwAttack+_G.ItemFoundryConfig.Value[num].AddShX ;		--����
		attr.dwDefense		= addAttr.dwDefense+_G.ItemFoundryConfig.Value[num].AddShX;	--����
		attr.dwFlee			= addAttr.dwFlee+_G.ItemFoundryConfig.Value[num].AddShX ;		--��
		attr.dwCrit			= addAttr.dwCrit+_G.ItemFoundryConfig.Value[num].AddShX;		--����
		attr.dwHPMax		= addAttr.dwHPMax+_G.ItemFoundryConfig.Value[num].AddShX;	--����max
		attr.dwMPMax		= addAttr.dwMPMax+_G.ItemFoundryConfig.Value[num].AddShX;--����max
		attr.dwMoveSpeed	= addAttr.dwMoveSpeed+_G.ItemFoundryConfig.Value[num].AddShX;	--�ƶ��ٶ�
		attr.dwAttackSpeed	= addAttr.dwAttackSpeed+_G.ItemFoundryConfig.Value[num].AddShX;--�����ٶ�
		attr.dwRemitAttack	= addAttr.dwRemitAttack+_G.ItemFoundryConfig.Value[num].AddShX;--�˺�����
	end
	return attr;
end



---���ͻ��˱�ʯ����ս����
function CItemSystem:GetStoneExTotalPower()
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	local dwTotalValue = self:GetJPScore() + self:GetFoundryScore();
	objPlayer.StoneSys_SendStoneExTotalPowerMsg{dwTotalValue = dwTotalValue}
end


