


function CBournSystem:Create()
    -- 创建数据库对象
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	self.objDBQuery = CBournDBOper:new(objDB,self);
	if not self.objDBQuery then
		return false;
	end;
	local tabDataList = {}
	tabDataList = objPlayer:GetLineData("CBournSystem")
	if tabDataList[1][1] then
		self.dwBournExp = tabDataList[1][1]
		self.dwBournPVPExp = tabDataList[1][2]
		self.dwBournLv = tabDataList[1][3]
	end
	self.dwUpdataLine = 0
	if not BournConfig.Bourn[self.dwBournLv] then
		local sklSystem = objPlayer:GetSystem("CSkillSystem");
		local tLv = self.dwBournLv
		for k,v in pairs (self.AttributeList) do
			for i = 1,tLv - 1 do
				self.AttributeList[k] = self.AttributeList[k] + BournConfig.Bourn[i][k]
			end
		end
		local fightInfo = SSingleAttrChange:new()
		for k,v in pairs (self.AttributeList) do
			fightInfo[k] = self.AttributeList[k]
		end
		sklSystem:NotifyBournUpdate(fightInfo,false)

		local dwSkillLevel = math.floor(fightInfo.dwAllSkillUpLv);
		if dwSkillLevel ~= 0 then
			local tbChg = {};
			for k,v in pairs(BournAddSkillLevel)do
				tbChg[v] = dwSkillLevel;
			end
			sklSystem:SetSkillLevel(tbChg,"CBournSystem");
		end

		-- if fightInfo.dwAllSkillUpLv ~= 0 then
			-- local tbChg = {};
			-- for k,v in pairs(BournAddSkillLevel)do
				-- tbChg[v] = fightInfo.dwAllSkillUpLv;
			-- end
			-- sklSystem:SetSkillLevel(tbChg,"CBournSystem");
		-- end

		return true
	end
	local tempExp = 0
	for i = 1,self.dwBournLv - 1 do
		tempExp = tempExp + BournConfig.Bourn[i].needactionex
	end
	local unitExp = (BournConfig.Bourn[self.dwBournLv].needactionex)/(BournConfig.Bourn[self.dwBournLv].kedu)
	self.dwUpdataLine = (self.dwBournExp - tempExp)/unitExp
	-- 计算境界附加的属性
	self:CountAttribute()
	
	return true;
end
function CBournSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local t = {}
	t[1] = self.dwBournExp;
	t[2] = self.dwBournPVPExp;
	t[3] = self.dwBournLv;
	objPlayer:SetLineData("CBournSystem",t);
end

function CBournSystem:Destroy()
	-- if self.objDBQuery then
		-- self.objDBQuery:SaveInfo()
	-- end;
end;

function CBournSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local CiFuSys = objPlayer:GetSystem('CTianGuanCiFuSystem')
	local dwCiFuValue = CiFuSys:Get_JingJieUp()
	self:UpdateInfoToClient(objPlayer)
	self:SendCiFuValue(dwCiFuValue)
	self:DrawPic(self.dwBournLv)
end;

function CBournSystem:EnterGame()
	
end
--得到实战战斗力
function CBournSystem:GetFightValue()
	local value = 0
	for k,v in pairs (self.AttributeList) do
		if EquipGradeConfig[k] then
			value = value + EquipGradeConfig[k]*v
		end
	end
	local dwBournHideAttrLevel = self:GetPlayer():GetSystem("CBournHideAttrSystem").dwLevel;
	if dwBournHideAttrLevel ~= 0 then
		local tabAttr = BournHideAttrScript:GetProperty(dwBournHideAttrLevel);
		for k,v in pairs (tabAttr) do
			if EquipGradeConfig[k] then
				value = value + EquipGradeConfig[k]*v
			end
		end
	end
	--武尊全章增加战斗力
	if self:GetBournLv() > _G.GestAuthorityLevel then
		local gestLevel = self:GetPlayer():GetSystem("CGestSystem"):GetGestLevel();
		if gestLevel ~= 0 then
			local dwValue = _G.GestDataConfig.AddFigthValue(self:GetPlayer():GetInfo().dwLevel, gestLevel);
			value = value + dwValue;
		end
	end
	return value
end
--得到境界exp
function CBournSystem:GetBournExp()
	return self.dwBournExp
end
--得到境界等级
function CBournSystem:GetBournLv()
	return self.dwBournLv;
end
--得到境界附加战斗属性
function CBournSystem:GetSkillValue()
	return self.AttributeList;
end
function CBournSystem:EventKillMonster(dwValue,dwMonsterID,dwType,dwLevel)
	if self.dwBournLv == 10 or not self:HasAuthority( 'Bourn',false ) then
		return
	end
	--彭立(彭立) 2013-03-11 13:35:49
	--杀怪获得实战经验这个屏蔽掉吧
	--lw：应该是遗漏了
	-- local objPlayer = self:GetPlayer();
	-- if not objPlayer then
		-- return false;
	-- end;
	-- if dwLevel >= BournConfig.Bourn[self.dwBournLv].killmonsterlvleast then
		-- self:AddBournExp(math.floor(BournFormulaExp(dwLevel) * objPlayer:GetAddicted()))
	-- end
end
--
function CBournSystem:CheckCanAddExp(nType)
	return self.dwBournLv == nType
end
--判断境界实战经验是否满
function CBournSystem:CanAddBournExp()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
--	if not self:HasAuthority( 'Bourn',false ) then return false end
	local tLv = self.dwBournLv
	if tLv == BournConfig.Num + 1 then
		--满了，不能加了
		return false
	end
	local tempExp = 0
	for i = 1,tLv - 1 do
		tempExp = tempExp + BournConfig.Bourn[i].needactionex
	end
	if self.dwBournExp == tempExp + BournConfig.Bourn[tLv].needactionex then
		return false
	else
		return true
	end
end
-- 增加境界实战经验
function CBournSystem:AddBournExp(dwValue)

	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local tLv = self.dwBournLv
	if tLv == BournConfig.Num + 1 then
		--满了，不能加了
		return
	end

	self.dwBournExp = self.dwBournExp + dwValue; 
	local tempExp = 0
	for i = 1,tLv - 1 do
		tempExp = tempExp + BournConfig.Bourn[i].needactionex
	end
	local tempInfo = {}
	
	tempInfo[2] = ''
	if self.dwBournExp>=tempExp + BournConfig.Bourn[tLv].needactionex then
		tempInfo[1] = 0
		self.dwBournExp = tempExp + BournConfig.Bourn[tLv].needactionex
		objPlayer.CltFlushBournMsg{Type = enumBournMsg.ExpFull,Info = tempInfo}
	else
		tempInfo[1] = dwValue
		objPlayer.CltFlushBournMsg{Type = enumBournMsg.AddExp,Info = tempInfo}
	end
	local unitExp = (BournConfig.Bourn[self.dwBournLv].needactionex)/(BournConfig.Bourn[self.dwBournLv].kedu)
	local curExp = self.dwBournExp - tempExp
	local thisLine = curExp/unitExp
	if thisLine > self.dwUpdataLine then
		self:AddAttribute(thisLine - self.dwUpdataLine)
		self.dwUpdataLine = thisLine
		self:UpdateInfoToClient(objPlayer)	
	end
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventBournExp);
	return
end
function CBournSystem:GetPlayerViewMsg()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local t = {};
	t[1] = self.dwBournExp
	t[2] = self.dwBournPVPExp
	t[3] = self.dwBournLv
	local sklSys = objPlayer:GetSystem('CSkillSystem')
	t[4] = sklSys:CountBattleScoreInfo().dwBournScore
	local AttributeList = {};
	AttributeList.dwHPMax				= self.AttributeList.dwHPMax
	AttributeList.dwMPMax				= self.AttributeList.dwMPMax
	AttributeList.dwAttack 			= self.AttributeList.dwAttack 
	AttributeList.dwDefense 			= self.AttributeList.dwDefense
	AttributeList.dwMoveSpeed			= self.AttributeList.dwMoveSpeed	
	AttributeList.dwAttackSpeed		= self.AttributeList.dwAttackSpeed
	AttributeList.dwDuck 				= self.AttributeList.dwDuck
	AttributeList.dwAppendCrit 		= self.AttributeList.dwAppendCrit
	AttributeList.dwAllSkillUpLv 		= self.AttributeList.dwAllSkillUpLv 
	
	local tbSend = {};
	for key,value in pairs(AttributeList)do
		local dwIndex = GetAttrNameToIndex(key);
		if dwIndex then
			tbSend[dwIndex] = value;
		end
	end
	t[5] = tbSend;
	
	return t;
end
function CBournSystem:AddAttribute(dwLineNum)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local tLv = self.dwBournLv
	local curModulus = dwLineNum/BournConfig.Bourn[tLv].kedu
	local sklSystem = objPlayer:GetSystem("CSkillSystem");
	for k,v in pairs (self.AttributeList) do
		local temp = curModulus*BournConfig.Bourn[tLv][k]
		self.AttributeList[k] = self.AttributeList[k] + temp;
	end
	local fightInfo = SSingleAttrChange:new()
	for k,v in pairs (self.AttributeList) do
		fightInfo[k] = self.AttributeList[k]
	end
	sklSystem:NotifyBournUpdate(fightInfo,false)

	local dwSkillLevel = math.floor(fightInfo.dwAllSkillUpLv);
	if dwSkillLevel ~= 0 then
		local tbChg = {};
		for k,v in pairs(BournAddSkillLevel)do
			tbChg[v] = dwSkillLevel;
		end
		sklSystem:SetSkillLevel(tbChg,"CBournSystem");
	end

	-- if fightInfo.dwAllSkillUpLv ~= 0 then
		-- local tbChg = {};
		-- for k,v in pairs(BournAddSkillLevel)do
			-- tbChg[v] = fightInfo.dwAllSkillUpLv;
		-- end
		-- sklSystem:SetSkillLevel(tbChg,"CBournSystem");
	-- end

end

function CBournSystem:CountAttribute()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local sklSystem = objPlayer:GetSystem("CSkillSystem");
	local tLv = self.dwBournLv
	if tLv == 0 then
		return
	end	
	
	self.AttributeList = 
	{
		dwHPMax				= 0,		--生命
		dwMPMax				= 0,		--内力
		dwAttack 			= 0,		--攻击
		dwDefense 			= 0,		--防御
		dwMoveSpeed			= 0,		--移动速度
		dwAttackSpeed		= 0,		--攻击速度
		dwDuck 				= 0,		--闪避率
		dwAppendCrit 		= 0,		--暴击伤害（百分比）
		dwAllSkillUpLv 		= 0, 		--武功层数
	}
	
	for k,v in pairs (self.AttributeList) do
		for i = 1,tLv - 1 do
			self.AttributeList[k] = self.AttributeList[k] + BournConfig.Bourn[i][k]
		end
	end
	local fightInfo = SSingleAttrChange:new()
	for k,v in pairs (self.AttributeList) do
		fightInfo[k] = self.AttributeList[k]
	end
	sklSystem:NotifyBournUpdate(fightInfo,false)

	local dwSkillLevel = math.floor(fightInfo.dwAllSkillUpLv);
	if dwSkillLevel ~= 0 then
		local tbChg = {};
		for k,v in pairs(BournAddSkillLevel)do
			tbChg[v] = dwSkillLevel;
		end
		sklSystem:SetSkillLevel(tbChg,"CBournSystem");
	end
	
	if not BournConfig.Bourn[self.dwBournLv] then
		return
	end
	local tempExp = 0
	for i = 1,tLv - 1 do
		tempExp = tempExp + BournConfig.Bourn[i].needactionex
	end
	local unitExp = (BournConfig.Bourn[self.dwBournLv].needactionex)/(BournConfig.Bourn[self.dwBournLv].kedu)
	local curExp = self.dwBournExp - tempExp
	local thisLine = curExp/unitExp
	self:AddAttribute(thisLine)
end
--同步赐福值
function CBournSystem:SendCiFuValue(dwCiFuValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local tempInfo = {}
	tempInfo[1] = dwCiFuValue
	tempInfo[2] = ''
	objPlayer.CltFlushBournMsg{Type = enumBournMsg.CiFu,Info = tempInfo};
end

--add by lkj 2013-07-25
--检测境界是否能升级
function CBournSystem:CheckCanUpLevel()
	return self.dwBournExp >= BournConfig.Bourn[self.dwBournLv].needactionex;
end;
--add end

--境界突破
function CBournSystem:UpBournLv(dwBournLv,Info)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSystem = objPlayer:GetSystem('CItemSystem')
	if self.dwBournLv == dwBournLv then
		local dwItemEnum = BournConfig.Bourn[dwBournLv].itemid;
		local hasItemNum, _, _ = objItemSystem:GetEnumItemNumInPacket(dwItemEnum);
		local dwNeedItemNum  = BournConfig.Bourn[dwBournLv].itemnumber
		if dwNeedItemNum > hasItemNum then
			if Info[1] == false then
			--	_info('bourn no drug')
				return
			else
				local BuyNumber = dwNeedItemNum - hasItemNum
				local MallSystem = objPlayer:GetSystem("CMallSystem")
				local BuySuccess
				if Info[2] == 1 then
					BuySuccess = MallSystem:BuyItemByIDGold(BuyNumber,BournConfig.Bourn[dwBournLv].itemid)
				else
					BuySuccess = MallSystem:BuyItemByIDBindGold(BuyNumber,BournConfig.Bourn[dwBournLv].itemid)
				end
				if not BuySuccess then return false end
			end
		end
		--判断突破条件
		if self.dwBournExp >= BournConfig.Bourn[dwBournLv].needactionex then
			-- 删除药品
			objItemSystem:DelEnumItemInPacket(dwItemEnum, BournConfig.Bourn[dwBournLv].itemnumber, false, _G.ItemSysOperType.Bourn)
			local CiFuSys = objPlayer:GetSystem('CTianGuanCiFuSystem')
			local dwCiFuValue = CiFuSys:Get_JingJieUp()
			local tempInfo = {}
			tempInfo[1] = dwBournLv
			tempInfo[2] = ''
			local bFlag;
			if dwCiFuValue >= BournConfig.jingjie_addvalue_data[dwBournLv][2] then 
				-----------------
				--日志记录
				local dwBegin = CiFuSys:Get_JingJieUp();
				local dwEnd = 0;
				CLogSystemManager:cifu(objPlayer, 2, dwBournLv, 1, dwBegin, dwEnd);
				-----------------
				objPlayer.CltFlushBournMsg{Type = enumBournMsg.Success,Info = tempInfo};
				CiFuSys:Set_JingJieUp(0)
				
				bFlag = true;
			elseif dwCiFuValue <=BournConfig.jingjie_addvalue_data[dwBournLv][1] then
					objPlayer.CltFlushBournMsg{Type = enumBournMsg.Failed,Info = tempInfo};
					CiFuSys:Add_JingJieUp(dwBournLv)
					bFlag = false;
			else
				local dwRandow = math.random(1,10000)
				if BournFormulaCountPercent(BournConfig.Bourn[dwBournLv].dwWinPro,dwCiFuValue,dwBournLv)  >= dwRandow then
					-----------------
					--日志记录
					local dwBegin = CiFuSys:Get_JingJieUp();
					local dwEnd = 0;
					CLogSystemManager:cifu(objPlayer, 2, dwBournLv, 1, dwBegin, dwEnd);
					-----------------
					objPlayer.CltFlushBournMsg{Type = enumBournMsg.Success,Info = tempInfo};
					CiFuSys:Set_JingJieUp(0)
					bFlag = true;
				else
					objPlayer.CltFlushBournMsg{Type = enumBournMsg.Failed,Info = tempInfo};
					CiFuSys:Add_JingJieUp(dwBournLv)
					bFlag = false;
				end
			end
			if bFlag then
				--升级
				self.dwBournLv = self.dwBournLv + 1;
				self:DrawPic(self.dwBournLv)
				self.dwUpdataLine = 0;
				local eventSys = objPlayer:GetSystem('CPlayerEventCenterSystem')
				eventSys:DoEvent(enumPlayerEventType.EventBournUp,1,self.dwBournLv);
				local gestSystem = objPlayer:GetSystem("CGestSystem");
				gestSystem:AddGestObj()
				--重新计算境界附加属性
				--判断是否全部突破
				CGameApp.ServBournUniCastMsg{BournLv = self.dwBournLv,RoleID = objPlayer:GetRoleID(),RoleName = objPlayer:GetInfo().szRoleName};
				self:UpdateInfoToClient(objPlayer,2);			
			else
				--失败
				local objPlayer = self:GetPlayer();
				local addExpNum = self:GetPlayer():GetSystem("CRefreshSystem"):GetData(0105);
				if addExpNum and addExpNum > 0 then
					local dwAddExp = BournConfig.fGetFailureAddExp(self.dwBournLv,objPlayer:GetLevel());
					objPlayer:AddExp(dwAddExp);
					self:GetPlayer():GetSystem("CRefreshSystem"):SetData(0105,addExpNum - 1);
				end
			end
		
			return true
		else
			_info('You can`t Up Bourn');
			return false;
		end
	end
end
--绘制VIP图案
function CBournSystem:DrawPic(dwBournLv)
	if not self:HasAuthority( 'Bourn',false ) then
		return
	end
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	if objPlayer:GetSystem('CBournHideAttrSystem'):IsUsed() then
		return;
	end	
	local objCGestSystem =self:GetPlayer():GetSystem("CGestSystem");
	if objCGestSystem:GetGestMode() ~= 0 then return end
	
	local playerShowTextSys = objPlayer:GetSystem('PlayerShowTextSystem')
	if dwBournLv == 10 then dwBournLv = 9 end
	playerShowTextSys:SetSp(dwBournLv+1)
	if dwBournLv ~= 1 then
		playerShowTextSys:DelSp(dwBournLv)
	end
end
function CBournSystem:UniCast(dwBournLv,dwRoleID,szRoleName)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local tempInfo = {}
	tempInfo[1] = dwBournLv
	tempInfo[2] = dwRoleID
	tempInfo[3] = szRoleName
	objPlayer.CltFlushBournMsg{Type = enumBournMsg.One,Info = tempInfo};
	if dwBournLv == BournConfig.Num + 1 then
		objPlayer.CltFlushBournMsg{Type = enumBournMsg.Full,Info = tempInfo};
	end
end
function CBournSystem:EventCompleteTask(_,dwTaskID)
	if dwTaskID == BournConfig.dwStartTaskID then
		self:DrawPic(self.dwBournLv)
	end
end
--更新信息到客户端
function CBournSystem:UpdateInfoToClient(objPlayer,nFlag)
	local sInfo = {};
	sInfo.dwBournExp = self.dwBournExp;
	sInfo.dwBournPVPExp = self.dwBournPVPExp;
	sInfo.dwBournLv = self.dwBournLv;
	sInfo.AttributeList = {};

	sInfo.AttributeList.dwHPMax				= tostring(self.AttributeList.dwHPMax)		--生命
	sInfo.AttributeList.dwMPMax				= tostring(self.AttributeList.dwMPMax)	--内力
	sInfo.AttributeList.dwAttack 			= tostring(self.AttributeList.dwAttack)		--攻击
	sInfo.AttributeList.dwDefense 			= tostring(self.AttributeList.dwDefense	)--防御
	sInfo.AttributeList.dwMoveSpeed			= tostring(self.AttributeList.dwMoveSpeed)		--移动速度
	sInfo.AttributeList.dwAttackSpeed		= tostring(self.AttributeList.dwAttackSpeed	)	--攻击速度
	sInfo.AttributeList.dwDuck 				= tostring(self.AttributeList.dwDuck	)	--闪避率
	sInfo.AttributeList.dwAppendCrit 		= tostring(self.AttributeList.dwAppendCrit)		--暴击伤害（百分比）
	sInfo.AttributeList.dwAllSkillUpLv 		= tostring(self.AttributeList.dwAllSkillUpLv)		--武功层数

	if nFlag == 2 then
		objPlayer.CltUpBournMsg{BournLv = self.dwBournLv};
	end
	objPlayer.CltInitBournInfoMsg{ SInfo = sInfo }
	self.objDBQuery:SaveInfo()
end;
--打开权限事件处理
function CBournSystem:OnEventCenter(szEventName,Param1)
	if szEventName == enumPlayerEventType.EventGetAuthority and Param1 == 'Bourn' then
		self:CountAttribute();
		self:DrawPic(self.dwBournLv);
	end
end

--直接提升实战到固定阶数
function CBournSystem:UpBournLevel(dwBournLevel)
	if not self:HasAuthority('Bourn') then
		return false;
	end
	
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	--判断是否已经满级
	if self.dwBournLv >= #BournConfig.Bourn then
		return;
	end
	
	if self.dwBournLv >= dwBournLevel then
		return;
	end
	
	local eventSys = objSelf:GetSystem('CPlayerEventCenterSystem')
	
	local dwMinExp = 0
	for i = 1,dwBournLevel - 1 do
		dwMinExp = dwMinExp + BournConfig.Bourn[i].needactionex;
	end
	
	if self.dwBournExp < dwMinExp then
		self.dwBournExp = dwMinExp;
		eventSys:DoEvent(enumPlayerEventType.EventBournExp);
	end
	
	--升级
	self.dwBournLv = dwBournLevel;
	self:DrawPic(self.dwBournLv)
	self.dwUpdataLine = 0;
	eventSys:DoEvent(enumPlayerEventType.EventBournUp,1,self.dwBournLv);
	
	self:CountAttribute();
	--重新计算境界附加属性
	--判断是否全部突破
	CGameApp.ServBournUniCastMsg{BournLv = self.dwBournLv,RoleID = objSelf:GetRoleID(),RoleName = objSelf:GetInfo().szRoleName};
	self:UpdateInfoToClient(objSelf,2);
	
	return true;
end;

--境界数据库类
_G.CBournDBOper = {};
function CBournDBOper:new(objDB,objUser)
    local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	for i, v in pairs(CBournDBOper) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CBournDBOper:SaveInfo()

	local option,dwRoleID = self:CheckDBAlive()
	if option == false then
		_info("Role_Bourn Not Alive by CBournDBQuery:SaveInfo");
	end
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_Bourn');

	SqlCmd.Fields.dwBournExp = self.objUser.dwBournExp;
	SqlCmd.Fields.dwBournPVPExp = self.objUser.dwBournPVPExp;
	SqlCmd.Fields.dwBournLv = self.objUser.dwBournLv;
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	
	SqlCmd:execute();
	return true;
end
function CBournDBOper:AddInfo(dwRoleID)

	local SqlCmd = self.objDBQuery:CreateInsertCmd('T_Role_Bourn');

	SqlCmd.Fields.dwRoleID				= dwRoleID;
	SqlCmd.Fields.dwBournExp			= 0;
	SqlCmd.Fields.dwBournPVPExp			= 0;
	SqlCmd.Fields.dwBournLv				= 1;
	
	SqlCmd:execute()
	return true;
end
function CBournDBOper:CheckDBAlive()
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CBournDBQuery");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CBournDBQuery");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CBournDBQuery");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CBournDBQuery");
		return false;
	end;
	
	return true,dwRoleID
end

----------------------------------------------------------
