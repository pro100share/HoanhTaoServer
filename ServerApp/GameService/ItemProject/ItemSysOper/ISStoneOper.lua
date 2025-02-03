------------------------------------
------------------------------------
--道具系统内部的接口文件
--author lkj



--获取所有身上的宝石
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

--获取装备位置上的宝石
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



--指定穿戴位置的装备更改
function CItemSystem:StoneAdd(dwWearPos, stoneInst)
	if self.b_Create then return end;
    local addAttr = stoneInst:GetAddAttr()
    self.StoneAttrList[dwWearPos]:AddValue(addAttr);
	local num = self:GetAddStoneFoundryConfigNum(dwWearPos)
	self:SetFoundryTotalAttr(num,addAttr,true)
	local totalattr = self:StoneAddFoundryAttrChange(num,addAttr,dwWearPos) ---宝石铸造
	self:AttrEqual(addAttr,totalattr)
    self.StoneTotalAttr:AddValue(addAttr);
	--宝石加成属性更改
	self:StoneAttrChange();	
	--套装更改
	self:StoneSuitChange(dwWearPos);
	--宝石精魄属性更改
	self:StoneAddJPAttrChange(dwWearPos);
	self:GetStoneExTotalPower() ---传客户端宝石额外战斗力
end;

function CItemSystem:StoneDel(dwWearPos, stoneInst)
    local subAttr = stoneInst:GetAddAttr()			
    self.StoneAttrList[dwWearPos]:SubValue(subAttr);
	local num = self:GetDelStoneFoundryConfigNum(dwWearPos)
	self:SetFoundryTotalAttr(num,subAttr,false)
	local totalattr = self:StoneAddFoundryAttrChange(num,subAttr,dwWearPos) ---宝石铸造
	self:AttrEqual(subAttr,totalattr)
    self.StoneTotalAttr:SubValue(subAttr);
    --宝石加成属性更改
	self:StoneAttrChange();
    --套装更改
	self:StoneSuitChange(dwWearPos);
	--宝石精魄属性更改
	self:StoneAddJPAttrChange(dwWearPos);
	self:GetStoneExTotalPower() ---传客户端宝石额外战斗力
end;

----属性赋值操作
function CItemSystem:AttrEqual(attr,totalattr)
	attr.dwAttack		= totalattr.dwAttack;		--攻击
	attr.dwDefense		= totalattr.dwDefense;	--防御
	attr.dwFlee			= totalattr.dwFlee;		--身法
	attr.dwCrit			= totalattr.dwCrit;		--暴击
	attr.dwHPMax		= totalattr.dwHPMax;	--生命max
	attr.dwMPMax		= totalattr.dwMPMax;--内力max
	attr.dwMoveSpeed    = totalattr.dwMoveSpeed;	--移动速度
	attr.dwAttackSpeed	= totalattr.dwAttackSpeed;--攻击速度
	attr.dwRemitAttack	= totalattr.dwRemitAttack;--伤害减免
end

----属性赋值操作
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

--装备属性改变
function CItemSystem:StoneAttrChange()
	--同步属性
	local totalAttr = self.StoneTotalAttr:Clone();
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyStoneUpdate(totalAttr, false);
end;


--宝石套装更改
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
	--套装属性加成
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
	--同步属性
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyEquipProperty(addAttrAdv, 2);
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyEquipProperty(addAttrPer, 2, true);
	--同步套装特效
	self:GetPlayer():SetSuitList(self.SuitsInfo.setSuitIDs);
end;



--系统Create时计算所有装备属性
function CItemSystem:CalStoneAttr()
    for dwWearPos=_G.enItemWearPos.eWeapon, _G.enItemWearPos.eMount4 do
		for _, stoneInst in ipairs(self:GetWearPosStone(dwWearPos)) do
            local addAttr = stoneInst:GetAddAttr()
            self.StoneAttrList[dwWearPos]:AddValue(addAttr);
            self.StoneTotalAttr:AddValue(addAttr);
        end;
		self:JingPoAttr(dwWearPos) ---宝石精魄加成
	end;
	self:GetStoneExTotalPower() ---传客户端宝石额外战斗力
    --同步属性
	local totalAttr = self.StoneTotalAttr:Clone();
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyStoneUpdate(totalAttr, false);
end;

---宝石精魄 weiyun 精魄属性加成
function CItemSystem:JingPoAttr(pos)
	local totalStoneLevel = 0
	local curJingPoByLevelAttr = {}
	local stPropertyType = 0
	for _, stoneInst in pairs (self:GetWearPosStone(pos)) do
		totalStoneLevel = totalStoneLevel + stoneInst:GetLevel();---某个装备位的总品阶数
    end;
	curJingPoByLevelAttr = JingPoByQTotalNumAttrConfig:GetAddAttrS(pos,totalStoneLevel); ----获取某个装备位的精魄属性
	self:AttrEqual(self.StoneJPTempAttr[pos],curJingPoByLevelAttr)
	JingPoByQTotalNumAttrConfig:AddValue(self.StoneJPAttr,self.StoneJPTempAttr[pos])
	self.StoneTotalAttr:AddValue(curJingPoByLevelAttr);          ---- 合并到宝石总属性里面 
end

--- 宝石精魄 weiyun  从新计算当前的精魄加成
function CItemSystem:AddCurJingPoAttr(pos)
	local totalStoneLevel = 0
	local curJingPoByLevelAttr = {}
	for _, stoneInst in pairs(self:GetWearPosStone(pos)) do
		totalStoneLevel = totalStoneLevel + stoneInst:GetLevel();---某个装备位的总品阶数
	end
	curJingPoByLevelAttr = JingPoByQTotalNumAttrConfig:GetAddAttrS(pos,totalStoneLevel); ----获取某个装备位的精魄属性
	local player = self:GetPlayer();
	if(not player) then
		return;
	end
	CLogSystemManager:stone_use(player,0,pos,totalStoneLevel,2)  ----精魄log
	return curJingPoByLevelAttr;
end

---宝石精魄 加法计算
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

----属性赋值操作
function JingPoByQTotalNumAttrConfig:AttrEqual(attr,totalattr)
	attr.dwAttack		= totalattr.dwAttack;		--攻击
	attr.dwDefense		= totalattr.dwDefense;	--防御
	attr.dwFlee			= totalattr.dwFlee;		--身法
	attr.dwCrit			= totalattr.dwCrit;		--暴击
	attr.dwHPMax		= totalattr.dwHPMax;	--生命max
	attr.dwMPMax		= totalattr.dwMPMax;--内力max
	attr.dwMoveSpeed    = totalattr.dwMoveSpeed;	--移动速度
	attr.dwAttackSpeed	= totalattr.dwAttackSpeed;--攻击速度
	attr.dwRemitAttack	= totalattr.dwRemitAttack;--伤害减免
end
---获取某个装备位的属性加成
function JingPoByQTotalNumAttrConfig:GetAddAttrS(wearPos,qualityTotalNum) ---pos 为装备位， qualityTotalNum 总品阶数
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
	--计算配置属性
		self:AttrEqual(attrInfo,JingPoByQTotalNumAttrConfig[wearPos][1].addShX)
		self:AddValue(totalAttrInfo,attrInfo);
	end
	if(qualityTotalNum >= JingPoByQTotalNumAttrConfig[wearPos][2].qtotalNum ) then
		--计算配置属性
		self:AttrEqual(attrInfo,JingPoByQTotalNumAttrConfig[wearPos][2].addShX)
		self:AddValue(totalAttrInfo,attrInfo);
	end
	
	return totalAttrInfo;
end;


--获取装备宝石精魄属性的评分
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
---获取总宝石精魄属性加成
function CItemSystem:GetAddJPAttr()
	local attrInfo = SSingleAttrChange:new();
	attrInfo.dwAttack		= self.StoneJPAttr.dwAttack;		--攻击
	attrInfo.dwDefense		= self.StoneJPAttr.dwDefense;	--防御
	attrInfo.dwFlee			= self.StoneJPAttr.dwFlee;		--身法
	attrInfo.dwCrit			= self.StoneJPAttr.dwCrit;		--暴击
	attrInfo.dwHPMax		= self.StoneJPAttr.dwHPMax;		--生命max
	attrInfo.dwMPMax		= self.StoneJPAttr.dwMPMax;		--内力max
	attrInfo.dwMoveSpeed	= self.StoneJPAttr.dwMoveSpeed;	--移动速度
	attrInfo.dwAttackSpeed	= self.StoneJPAttr.dwAttackSpeed;--攻击速度
	attrInfo.dwRemitAttack	= self.StoneJPAttr.dwRemitAttack;--伤害减免
	return attrInfo;
end

--某一个装备位的精魄属性加成 加到人物身上
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

----获取宝石铸造配置表数
function CItemSystem:GetStoneFoundryConfigNum(num,stonenum) ----stonenum 是第几个孔 num 是铸造数
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


---获取某个装备位的宝石铸造配置表数
function CItemSystem:GetAddStoneFoundryConfigNum(dwWearPos)
	local num = self:GetWearPosFoundryStoneNum(dwWearPos)
	local stonenum = self:GetWearPosStoneNum(dwWearPos)
	
	return self:GetStoneFoundryConfigNum(num,stonenum)
end
---获取某个装备位的宝石铸造配置表数
function CItemSystem:GetDelStoneFoundryConfigNum(dwWearPos)
	local num = self:GetWearPosFoundryStoneNum(dwWearPos)
	local stonenum = self:GetWearPosStoneNum(dwWearPos) + 1
	return self:GetStoneFoundryConfigNum(num,stonenum)
end
--某一个装备位的宝石铸造属性加成 加到人物身上
function CItemSystem:StoneAddFoundryAttrChange(num,wearPosAttr,dwWearPos)
	if(num == 0) then
		return wearPosAttr
	end
	local player = self:GetPlayer();
	if(not player) then
		return;
	end
	if(dwWearPos ~= nil) then
		CLogSystemManager:stone_use(player,0,dwWearPos,num,1)  ----铸造log
	end
	local wearPosfoundryAttr = {}
	if(_G.ItemFoundryConfig.Value[num].dwflag == 1) then
		wearPosfoundryAttr.dwAttack		= math.floor(wearPosAttr.dwAttack*(1+_G.ItemFoundryConfig.Value[num].AddShX));		--攻击
		wearPosfoundryAttr.dwDefense		= math.floor(wearPosAttr.dwDefense*(1+_G.ItemFoundryConfig.Value[num].AddShX));	--防御
		wearPosfoundryAttr.dwFlee			= math.floor(wearPosAttr.dwFlee*(1+_G.ItemFoundryConfig.Value[num].AddShX));		--身法
		wearPosfoundryAttr.dwCrit			= math.floor(wearPosAttr.dwCrit*(1+_G.ItemFoundryConfig.Value[num].AddShX));		--暴击
		wearPosfoundryAttr.dwHPMax		    = math.floor(wearPosAttr.dwHPMax*(1+_G.ItemFoundryConfig.Value[num].AddShX));--生命max
		wearPosfoundryAttr.dwMPMax		    = math.floor(wearPosAttr.dwMPMax*(1+_G.ItemFoundryConfig.Value[num].AddShX));--内力max
		wearPosfoundryAttr.dwMoveSpeed	    = math.floor(wearPosAttr.dwMoveSpeed*(1+_G.ItemFoundryConfig.Value[num].AddShX));	--移动速度
		wearPosfoundryAttr.dwAttackSpeed	= math.floor(wearPosAttr.dwAttackSpeed*(1+_G.ItemFoundryConfig.Value[num].AddShX));--攻击速度
		wearPosfoundryAttr.dwRemitAttack	= math.floor(wearPosAttr.dwRemitAttack*(1+_G.ItemFoundryConfig.Value[num].AddShX));--伤害减免
		return wearPosfoundryAttr
	elseif(_G.ItemFoundryConfig.Value[num].dwflag == 2) then
		wearPosfoundryAttr.dwAttack		= wearPosAttr.dwAttack +_G.ItemFoundryConfig.Value[num].AddShX;		--攻击
		wearPosfoundryAttr.dwDefense		= wearPosAttr.dwDefense +_G.ItemFoundryConfig.Value[num].AddShX;	--防御
		wearPosfoundryAttr.dwFlee			= wearPosAttr.dwFlee +_G.ItemFoundryConfig.Value[num].AddShX;		--身法
		wearPosfoundryAttr.dwCrit			= wearPosAttr.dwCrit +_G.ItemFoundryConfig.Value[num].AddShX;		--暴击
		wearPosfoundryAttr.dwHPMax		    = wearPosAttr.dwHPMax +_G.ItemFoundryConfig.Value[num].AddShX;	--生命max
		wearPosfoundryAttr.dwMPMax		    = wearPosAttr.dwMPMax +_G.ItemFoundryConfig.Value[num].AddShX;--内力max
		wearPosfoundryAttr.dwMoveSpeed	    = wearPosAttr.dwMoveSpeed +_G.ItemFoundryConfig.Value[num].AddShX;	--移动速度
		wearPosfoundryAttr.dwAttackSpeed	= wearPosAttr.dwAttackSpeed +_G.ItemFoundryConfig.Value[num].AddShX;--攻击速度
		wearPosfoundryAttr.dwRemitAttack	= wearPosAttr.dwRemitAttack +_G.ItemFoundryConfig.Value[num].AddShX;--伤害减免
		return wearPosfoundryAttr
	end
	_info("_G.ItemFoundryConfig is error")
	return wearPosAttr
end
----玩家上限 初始化宝石铸造属性加成
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
			addAttr.dwAttack		= totalattr.dwAttack - addAttr.dwAttack ;		--攻击
			addAttr.dwDefense		= totalattr.dwDefense - addAttr.dwDefense;	--防御
			addAttr.dwFlee			= totalattr.dwFlee - addAttr.dwFlee ;		--身法
			addAttr.dwCrit			= totalattr.dwCrit - addAttr.dwCrit;		--暴击
			addAttr.dwHPMax		    = totalattr.dwHPMax - addAttr.dwHPMax;	--生命max
			addAttr.dwMPMax		    = totalattr.dwMPMax - addAttr.dwMPMax;--内力max
			addAttr.dwMoveSpeed	    = totalattr.dwMoveSpeed - addAttr.dwMoveSpeed;	--移动速度
			addAttr.dwAttackSpeed	= totalattr.dwAttackSpeed - addAttr.dwAttackSpeed;--攻击速度
			addAttr.dwRemitAttack	= totalattr.dwRemitAttack - addAttr.dwRemitAttack;--伤害减免
			
			self.StoneTotalAttr:AddValue(addAttr);
		end
		index = index + 1
	end
	local totalAttr = self.StoneTotalAttr:Clone();
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyStoneUpdate(totalAttr, false);
end


--获取装备宝石铸造属性的评分
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
--获取装备宝石铸造属性加成
function CItemSystem:GetAddFoundryAttr()
	local attrInfo = SSingleAttrChange:new();
	attrInfo.dwAttack		= self.StoneFoundryAttr.dwAttack;		--攻击
	attrInfo.dwDefense		= self.StoneFoundryAttr.dwDefense;	--防御
	attrInfo.dwFlee			= self.StoneFoundryAttr.dwFlee;		--身法
	attrInfo.dwCrit			= self.StoneFoundryAttr.dwCrit;		--暴击
	attrInfo.dwHPMax		= self.StoneFoundryAttr.dwHPMax;		--生命max
	attrInfo.dwMPMax		= self.StoneFoundryAttr.dwMPMax;		--内力max
	attrInfo.dwMoveSpeed	= self.StoneFoundryAttr.dwMoveSpeed;	--移动速度
	attrInfo.dwAttackSpeed	= self.StoneFoundryAttr.dwAttackSpeed;--攻击速度
	attrInfo.dwRemitAttack	= self.StoneFoundryAttr.dwRemitAttack;--伤害减免
	return attrInfo;
end
--设置装备宝石铸造属性加成
function CItemSystem:SetFoundryTotalAttr(num,wearPosAttr,flag)
	if(num == 0) then
		return
	end
	if(flag) then
		if(_G.ItemFoundryConfig.Value[num].dwflag == 1) then
		
			self.StoneFoundryAttr.dwAttack = self.StoneFoundryAttr.dwAttack+ math.floor(wearPosAttr.dwAttack*(_G.ItemFoundryConfig.Value[num].AddShX));	--攻击
			self.StoneFoundryAttr.dwDefense = self.StoneFoundryAttr.dwDefense+ math.floor(wearPosAttr.dwDefense*(_G.ItemFoundryConfig.Value[num].AddShX));	--防御
			self.StoneFoundryAttr.dwFlee = self.StoneFoundryAttr.dwFlee+  math.floor(wearPosAttr.dwFlee*(_G.ItemFoundryConfig.Value[num].AddShX));		--身法
			self.StoneFoundryAttr.dwCrit = self.StoneFoundryAttr.dwCrit+  math.floor(wearPosAttr.dwCrit*(_G.ItemFoundryConfig.Value[num].AddShX));		--暴击
			self.StoneFoundryAttr.dwHPMax = self.StoneFoundryAttr.dwHPMax+  math.floor(wearPosAttr.dwHPMax*(_G.ItemFoundryConfig.Value[num].AddShX));	--生命max
			self.StoneFoundryAttr.dwMPMax = self.StoneFoundryAttr.dwMPMax+  math.floor(wearPosAttr.dwMPMax*(_G.ItemFoundryConfig.Value[num].AddShX));	--内力max
			self.StoneFoundryAttr.dwMoveSpeed = self.StoneFoundryAttr.dwMoveSpeed+  math.floor(wearPosAttr.dwMoveSpeed*(_G.ItemFoundryConfig.Value[num].AddShX));	--移动速度
			self.StoneFoundryAttr.dwAttackSpeed = self.StoneFoundryAttr.dwAttackSpeed+  math.floor(wearPosAttr.dwAttackSpeed*(_G.ItemFoundryConfig.Value[num].AddShX));--攻击速度
			self.StoneFoundryAttr.dwRemitAttack = self.StoneFoundryAttr.dwRemitAttack+  math.floor(wearPosAttr.dwRemitAttack*(_G.ItemFoundryConfig.Value[num].AddShX));--伤害减免
		elseif(_G.ItemFoundryConfig.Value[num].dwflag == 2) then
		
			self.StoneFoundryAttr.dwAttack = self.StoneFoundryAttr.dwAttack+_G.ItemFoundryConfig.Value[num].AddShX;	--攻击
			self.StoneFoundryAttr.dwDefense = self.StoneFoundryAttr.dwDefense+ _G.ItemFoundryConfig.Value[num].AddShX;	--防御
			self.StoneFoundryAttr.dwFlee = self.StoneFoundryAttr.dwFlee+ _G.ItemFoundryConfig.Value[num].AddShX;		--身法
			self.StoneFoundryAttr.dwCrit = self.StoneFoundryAttr.dwCrit+ _G.ItemFoundryConfig.Value[num].AddShX;		--暴击
			self.StoneFoundryAttr.dwHPMax = self.StoneFoundryAttr.dwHPMax+ _G.ItemFoundryConfig.Value[num].AddShX;	--生命max
			self.StoneFoundryAttr.dwMPMax = self.StoneFoundryAttr.dwMPMax+ _G.ItemFoundryConfig.Value[num].AddShX;	--内力max
			self.StoneFoundryAttr.dwMoveSpeed = self.StoneFoundryAttr.dwMoveSpeed+ _G.ItemFoundryConfig.Value[num].AddShX;	--移动速度
			self.StoneFoundryAttr.dwAttackSpeed = self.StoneFoundryAttr.dwAttackSpeed+ _G.ItemFoundryConfig.Value[num].AddShX;--攻击速度
			self.StoneFoundryAttr.dwRemitAttack = self.StoneFoundryAttr.dwRemitAttack+ _G.ItemFoundryConfig.Value[num].AddShX;--伤害减免
		end
	else
		if(_G.ItemFoundryConfig.Value[num].dwflag == 1) then
		
			self.StoneFoundryAttr.dwAttack = self.StoneFoundryAttr.dwAttack-  math.floor(wearPosAttr.dwAttack*(_G.ItemFoundryConfig.Value[num].AddShX));	--攻击
			self.StoneFoundryAttr.dwDefense = self.StoneFoundryAttr.dwDefense-  math.floor(wearPosAttr.dwDefense*(_G.ItemFoundryConfig.Value[num].AddShX));	--防御
			self.StoneFoundryAttr.dwFlee = self.StoneFoundryAttr.dwFlee-  math.floor(wearPosAttr.dwFlee*(_G.ItemFoundryConfig.Value[num].AddShX));		--身法
			self.StoneFoundryAttr.dwCrit = self.StoneFoundryAttr.dwCrit-  math.floor(wearPosAttr.dwCrit*(_G.ItemFoundryConfig.Value[num].AddShX));		--暴击
			self.StoneFoundryAttr.dwHPMax = self.StoneFoundryAttr.dwHPMax-  math.floor(wearPosAttr.dwHPMax*(_G.ItemFoundryConfig.Value[num].AddShX));	--生命max
			self.StoneFoundryAttr.dwMPMax = self.StoneFoundryAttr.dwMPMax-  math.floor(wearPosAttr.dwMPMax*(_G.ItemFoundryConfig.Value[num].AddShX));	--内力max
			self.StoneFoundryAttr.dwMoveSpeed = self.StoneFoundryAttr.dwMoveSpeed-  math.floor(wearPosAttr.dwMoveSpeed*(_G.ItemFoundryConfig.Value[num].AddShX));	--移动速度
			self.StoneFoundryAttr.dwAttackSpeed = self.StoneFoundryAttr.dwAttackSpeed-  math.floor(wearPosAttr.dwAttackSpeed*(_G.ItemFoundryConfig.Value[num].AddShX));--攻击速度
			self.StoneFoundryAttr.dwRemitAttack = self.StoneFoundryAttr.dwRemitAttack-  math.floor(wearPosAttr.dwRemitAttack*(_G.ItemFoundryConfig.Value[num].AddShX));--伤害减免
		elseif(_G.ItemFoundryConfig.Value[num].dwflag == 2) then
		
			self.StoneFoundryAttr.dwAttack = self.StoneFoundryAttr.dwAttack-_G.ItemFoundryConfig.Value[num].AddShX;	--攻击
			self.StoneFoundryAttr.dwDefense = self.StoneFoundryAttr.dwDefense- _G.ItemFoundryConfig.Value[num].AddShX;	--防御
			self.StoneFoundryAttr.dwFlee = self.StoneFoundryAttr.dwFlee-_G.ItemFoundryConfig.Value[num].AddShX;		--身法
			self.StoneFoundryAttr.dwCrit = self.StoneFoundryAttr.dwCrit- _G.ItemFoundryConfig.Value[num].AddShX;		--暴击
			self.StoneFoundryAttr.dwHPMax = self.StoneFoundryAttr.dwHPMax- _G.ItemFoundryConfig.Value[num].AddShX;	--生命max
			self.StoneFoundryAttr.dwMPMax = self.StoneFoundryAttr.dwMPMax-_G.ItemFoundryConfig.Value[num].AddShX;	--内力max
			self.StoneFoundryAttr.dwMoveSpeed = self.StoneFoundryAttr.dwMoveSpeed- _G.ItemFoundryConfig.Value[num].AddShX;	--移动速度
			self.StoneFoundryAttr.dwAttackSpeed = self.StoneFoundryAttr.dwAttackSpeed- _G.ItemFoundryConfig.Value[num].AddShX;--攻击速度
			self.StoneFoundryAttr.dwRemitAttack = self.StoneFoundryAttr.dwRemitAttack- _G.ItemFoundryConfig.Value[num].AddShX;--伤害减免
		end
	end
	return
end

function CItemSystem:setWearPosFoundryStoneAttr(dwWearPos)
	local num = self:GetWearPosFoundryStoneNum(dwWearPos)
	local stonenum = self:GetWearPosStoneNum(dwWearPos)
	if(stonenum == 0 or stonenum < num%5 ) then ---num%5 第几个空，
		return;
	end 
	if(num%5 == 0) then
		if(stonenum < 5) then
			return;
		end
	end
	local stoneindex = num   -----可额外加成的铸造数
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
	
	local indexnum = 0 ------铸造的是第几个孔
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
		addAttr.dwAttack		= curattr.dwAttack - preattr.dwAttack ;		--攻击
		addAttr.dwDefense		= curattr.dwDefense - preattr.dwDefense;	--防御
		addAttr.dwFlee			= curattr.dwFlee - preattr.dwFlee ;		--身法
		addAttr.dwCrit			= curattr.dwCrit - preattr.dwCrit;		--暴击
		addAttr.dwHPMax		    = curattr.dwHPMax - preattr.dwHPMax;	--生命max
		addAttr.dwMPMax		    = curattr.dwMPMax - preattr.dwMPMax;--内力max
		addAttr.dwMoveSpeed	    = curattr.dwMoveSpeed - preattr.dwMoveSpeed;	--移动速度
		addAttr.dwAttackSpeed	= curattr.dwAttackSpeed - preattr.dwAttackSpeed;--攻击速度
		addAttr.dwRemitAttack	= curattr.dwRemitAttack - preattr.dwRemitAttack;--伤害减免
	else
		addAttr.dwAttack		= curattr.dwAttack  ;		--攻击
		addAttr.dwDefense		= curattr.dwDefense ;	--防御
		addAttr.dwFlee			= curattr.dwFlee  ;		--身法
		addAttr.dwCrit			= curattr.dwCrit;		--暴击
		addAttr.dwHPMax		    = curattr.dwHPMax ;	--生命max
		addAttr.dwMPMax		    = curattr.dwMPMax;--内力max
		addAttr.dwMoveSpeed	    = curattr.dwMoveSpeed ;	--移动速度
		addAttr.dwAttackSpeed	= curattr.dwAttackSpeed ;--攻击速度
		addAttr.dwRemitAttack	= curattr.dwRemitAttack ;--伤害减免
	end
    self.StoneTotalAttr:AddValue(addAttr);
	--宝石加成属性更改
	self:StoneAttrChange();	
	self:GetStoneExTotalPower() ---传客户端宝石额外战斗力
	local player = self:GetPlayer();
	if(not player) then
		return;
	end
	CLogSystemManager:stone_use(player,0,dwWearPos,num,1)  ----铸造log
end

function CItemSystem:GetStoneFoundryAttr(num,addAttr)
	local attr =  SSingleAttrChange:new();
	if(_G.ItemFoundryConfig.Value[num].dwflag == 1) then
		attr.dwAttack		=  math.floor(addAttr.dwAttack*_G.ItemFoundryConfig.Value[num].AddShX );		--攻击
		attr.dwDefense		=  math.floor(addAttr.dwDefense*_G.ItemFoundryConfig.Value[num].AddShX);	--防御
		attr.dwFlee			=  math.floor(addAttr.dwFlee*_G.ItemFoundryConfig.Value[num].AddShX );		--身法
		attr.dwCrit			=  math.floor(addAttr.dwCrit*_G.ItemFoundryConfig.Value[num].AddShX);		--暴击
		attr.dwHPMax		=  math.floor(addAttr.dwHPMax*_G.ItemFoundryConfig.Value[num].AddShX);	--生命max
		attr.dwMPMax		=  math.floor(addAttr.dwMPMax*_G.ItemFoundryConfig.Value[num].AddShX);--内力max
		attr.dwMoveSpeed	=  math.floor(addAttr.dwMoveSpeed*_G.ItemFoundryConfig.Value[num].AddShX);	--移动速度
		attr.dwAttackSpeed	=  math.floor(addAttr.dwAttackSpeed*_G.ItemFoundryConfig.Value[num].AddShX);--攻击速度
		attr.dwRemitAttack	=  math.floor(addAttr.dwRemitAttack*_G.ItemFoundryConfig.Value[num].AddShX);--伤害减免
	elseif(_G.ItemFoundryConfig.Value[num].dwflag == 2) then
		attr.dwAttack		= addAttr.dwAttack+_G.ItemFoundryConfig.Value[num].AddShX ;		--攻击
		attr.dwDefense		= addAttr.dwDefense+_G.ItemFoundryConfig.Value[num].AddShX;	--防御
		attr.dwFlee			= addAttr.dwFlee+_G.ItemFoundryConfig.Value[num].AddShX ;		--身法
		attr.dwCrit			= addAttr.dwCrit+_G.ItemFoundryConfig.Value[num].AddShX;		--暴击
		attr.dwHPMax		= addAttr.dwHPMax+_G.ItemFoundryConfig.Value[num].AddShX;	--生命max
		attr.dwMPMax		= addAttr.dwMPMax+_G.ItemFoundryConfig.Value[num].AddShX;--内力max
		attr.dwMoveSpeed	= addAttr.dwMoveSpeed+_G.ItemFoundryConfig.Value[num].AddShX;	--移动速度
		attr.dwAttackSpeed	= addAttr.dwAttackSpeed+_G.ItemFoundryConfig.Value[num].AddShX;--攻击速度
		attr.dwRemitAttack	= addAttr.dwRemitAttack+_G.ItemFoundryConfig.Value[num].AddShX;--伤害减免
	end
	return attr;
end



---传客户端宝石额外战斗力
function CItemSystem:GetStoneExTotalPower()
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	local dwTotalValue = self:GetJPScore() + self:GetFoundryScore();
	objPlayer.StoneSys_SendStoneExTotalPowerMsg{dwTotalValue = dwTotalValue}
end


