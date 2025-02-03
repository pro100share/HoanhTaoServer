--[[
	功法：铁布衫
	曲莹
]]
_G.CTieBuShanSystem = {}

function CTieBuShanSystem:new()
	local obj = CSystem:new("CTieBuShanSystem");
	obj.objDBQuery = nil;    --对应的数据库操作模
	for i,v in pairs(CTieBuShanSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

function CTieBuShanSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		return false;
	end;
	self.objDBQuery = CTieBuShanSystemDB:new(objDB, self);
	self.dwClothLevel = 1;  --铁布衫等级
	self.dwClothExp = 0;    --铁布衫经验
	self.dwForbidValue = 0;     --霸体值
	self.dwSuitLevel = 0; --套装等级
	self.dwForbidLimitParam = 0;   --套装增加霸体值上限
	self.dwBasicCurtHurtRate = 0;  --基础减伤比例
	self.dwCutHurtRate = 0;        --套装增加减伤比例
	local info = objPlayer:GetLineData("CTieBuShanSystem")[1];
	
	if bIsChangeLine == 2 then 
		info = objPlayer:GetLineData("CTieBuShanSystem")[1];
		--info = objPlayer:GetCrossSvrData("CTieBuShanSystem")[1];
	end
	
	if info then
		self:SetTieBuShanBasicInfo(info[1]);
	end;
	return true;
end;

function CTieBuShanSystem:Update()
end;

function CTieBuShanSystem:Destroy()
end;

--设置铁布衫基本信息
function CTieBuShanSystem:SetTieBuShanBasicInfo(info)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.dwClothLevel = info.dwClothLevel;  --铁布衫等级
	self.dwClothExp = info.dwClothExp;    --铁布衫经验
	self.dwForbidValue = info.dwForbidValue;     --霸体值
	self.dwSuitLevel = info.dwSuitLevel; --套装等级
	if not self:HasAuthority("LronCloth") then
		return;
	end;
	self.dwBasicCurtHurtRate = LronClothConfig:BasicCurtHurtRate(objPlayer, self.dwClothLevel, self.dwClothExp, self.dwForbidValue);  --基础减伤比例
	self:AddPropertyBySuit();
end;
--进入游戏同步消息
function CTieBuShanSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self:HasAuthority("LronCloth") then
		return;
	end;
	objPlayer.SendTieBuShanInfoMsg{TieBuShanLevel = self.dwClothLevel, TieBuShanExp = self.dwClothExp, ForbidValue = self.dwForbidValue, SuitLevel = self.dwSuitLevel};
end;

function CTieBuShanSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local info = {};
	info.dwClothLevel = self.dwClothLevel;  --铁布衫等级
	info.dwClothExp = self.dwClothExp;    --铁布衫经验
	info.dwForbidValue = self.dwForbidValue;     --霸体值
	info.dwSuitLevel = self.dwSuitLevel; --套装等级
	local tbl = {};
	table.insert(tbl, info);
	objPlayer:SetLineData("CTieBuShanSystem",tbl);
end;

function CTieBuShanSystem:OnEnterCrossBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local info = {};
	info.dwClothLevel = self.dwClothLevel;  --铁布衫等级
	info.dwClothExp = self.dwClothExp;    --铁布衫经验
	info.dwForbidValue = self.dwForbidValue;     --霸体值
	info.dwSuitLevel = self.dwSuitLevel; --套装等级
	local tbl = {};
	table.insert(tbl, info);
	objPlayer:SetCrossSvrData("CTieBuShanSystem",tbl);
end;

--获得权限
function CTieBuShanSystem:EventGetAuthority(szAuthName)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if szAuthName == "LronCloth" then
		self.dwBasicCurtHurtRate = LronClothConfig:BasicCurtHurtRate(objPlayer, self.dwClothLevel, self.dwClothExp, self.dwForbidValue);  --基础减伤比例
		self:AddPropertyBySuit();
		objPlayer.SendTieBuShanInfoMsg{TieBuShanLevel = self.dwClothLevel, TieBuShanExp = self.dwClothExp, ForbidValue = self.dwForbidValue, SuitLevel = self.dwSuitLevel};
	end
end;
--批量使用物品增加修炼值
function CTieBuShanSystem:AddProcessByBatch(dwItemId, dwNum)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not dwItemId then
		return;
	end;
	if not dwNum or dwNum <= 0 then
		return;
	end;
	if not self:HasAuthority("LronCloth") then
		return;
	end;
	if _G.LronClothConfig.LronClothExpID ~= dwItemId then
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	if not itemSystem then
		return;
	end;
	local needExp = self:NeedExp();
	local addPerExp = LronClothConfig:GetExpByItemID(dwItemId)
	local num = math.ceil(needExp / addPerExp);
	if num < dwNum then
		dwNum = num;
	end;
	local b_IsEnough_1, n_Minus_1 = itemSystem:CheckDelEnumItemInPacketCond(dwItemId, dwNum);
	if not b_IsEnough_1 then
		return;
	end;
	itemSystem:DelEnumItemInPacket(dwItemId, dwNum, false, _G.ItemSysOperType.TieBuShan);
	local addProgressValue = dwNum * addPerExp;
	--增加修炼值,升级
	self:AddProgressValue(addProgressValue)
end;

function CTieBuShanSystem:NeedExp()
	local curLevel = self.dwClothLevel;
	local curExp = self.dwClothExp;
	local info = _G.LronClothConfig.BasicInfo[curLevel];
	local needExp = info.Exp - curExp;
	local maxLevel = table.maxn(_G.LronClothConfig.BasicInfo);
	if curLevel < maxLevel then
		for i = curLevel + 1,  maxLevel do
			needExp = needExp + _G.LronClothConfig.BasicInfo[i].Exp;
		end;
	end;
	return needExp;
end;

--增加修炼值接口
function CTieBuShanSystem:AddProgressValue(dwValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self:HasAuthority("LronCloth") then
		return;
	end;
	--升级
	local exps = 0;
	local upFlag = false;
	exps = self.dwClothExp + dwValue;
	while(exps > 0) do
		if exps >= _G.LronClothConfig.BasicInfo[self.dwClothLevel].Exp then
			if self.dwClothLevel < table.maxn(_G.LronClothConfig.BasicInfo) then
				exps = exps - _G.LronClothConfig.BasicInfo[self.dwClothLevel].Exp;
				self.dwClothLevel = self.dwClothLevel + 1;	
				upFlag = true;
			else
				exps = _G.LronClothConfig.BasicInfo[self.dwClothLevel].Exp;
				break;
			end;
		else
			break;
		end;
	end;
	self:BroadCastInfo(upFlag);
	self.dwClothExp = exps;
	self.dwBasicCurtHurtRate = LronClothConfig:BasicCurtHurtRate(objPlayer, self.dwClothLevel, self.dwClothExp, self.dwForbidValue);  --基础减伤比例
	self.objDBQuery:UpdateData(objPlayer:GetRoleID(), self.dwClothLevel, self.dwClothExp)
	objPlayer.SendTieBuShanUpMsg{TieBuShanLevel = self.dwClothLevel, TieBuShanExp = self.dwClothExp};
end;

--增加霸体值
function CTieBuShanSystem:AddForbidValue(dwValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self:HasAuthority("LronCloth") then
		return;
	end;
	self.dwForbidValue = self.dwForbidValue + dwValue;
	if self.dwForbidValue > _G.LronClothConfig.BasicInfo[self.dwClothLevel].ForbidLimit + self.dwForbidLimitParam then
		self.dwForbidValue = _G.LronClothConfig.BasicInfo[self.dwClothLevel].ForbidLimit + self.dwForbidLimitParam;
	end;
	self.objDBQuery:UpdateForbidValue(objPlayer:GetRoleID(), self.dwForbidValue)
	objPlayer.SendForbidInfoMsg{ForbidValue = self.dwForbidValue};
	
	objPlayer:BattleChange();
	
	self:BroadcastMyMsg(false,"OnRoleBattleInfoMsg",
	{
		RoleID = objPlayer:GetRoleID(),
		ChangeTable = {[41]=self.dwForbidValue},
	})
end;
--减少霸体值
function CTieBuShanSystem:DecForbidValue(dwValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self:HasAuthority("LronCloth") then
		return;
	end;
	self.dwForbidValue = self.dwForbidValue - dwValue;
	if self.dwForbidValue < 0 then
		self.dwForbidValue = 0;
	end;
	self.objDBQuery:UpdateForbidValue(objPlayer:GetRoleID(), self.dwForbidValue)
	objPlayer.SendForbidInfoMsg{ForbidValue = self.dwForbidValue};
	
	objPlayer:BattleChange();
	
	self:BroadcastMyMsg(false,"OnRoleBattleInfoMsg",
	{
		RoleID = objPlayer:GetRoleID(),
		ChangeTable = {[41]=self.dwForbidValue},
	})
end;
--获得霸体值
function CTieBuShanSystem:GetForbidValue()
	if not self:HasAuthority("LronCloth") then
		return 0;
	end;
	return self.dwForbidValue;
end;
--广播消息
function CTieBuShanSystem:BroadCastInfo(bUpFlag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CTieBuShanSystem:BroadCastInfo");
		return;
	end;
	if not bUpFlag then
		return;
	end;
	if self.dwClothLevel < _G.LronClothConfig.BroadCastLevel.ClothLevel then
		return;
	end;
	--玩家姓名
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--玩家RoleID
	local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
	--全服广播
	CGameApp.TieBuShanSys_BroadCastMsg{
        PlayerName = s_PlayerName,
        PlayerRoleID = n_PlayerRoleID,
		TieBuShanLevel = self.dwClothLevel,
		};
end;
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--套装增加属性
function CTieBuShanSystem:AddPropertyBySuit()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	local propertyInfo = LronClothConfig:GetSuitProperty(objPlayer, self.dwClothLevel, self.dwSuitLevel);
	local t_attr = _G.SSingleAttrChange:new();
	if propertyInfo then
		t_attr.dwHPMax	= propertyInfo["dwHPMax"] or 0;	   --生命max
		t_attr.dwMPMax	= propertyInfo["dwMPMax"] or 0;    --内力max
		t_attr.dwAttack	= propertyInfo["dwAttack"] or 0;   --攻击
		t_attr.dwDefense= propertyInfo["dwDefense"] or 0;  --防御
		t_attr.dwFlee	= propertyInfo["dwFlee"] or 0;	   --身法
		t_attr.dwCrit	= propertyInfo["dwCrit"] or 0;	   --暴击
		t_attr.dwMoveSpeed = propertyInfo["dwMoveSpeed"] or 0;	--移动速度
		t_attr.dwAttackSpeed = propertyInfo["dwAttackSpeed"] or 0;	--攻击速度
		t_attr.dwCritDown = propertyInfo["dwCritDown"] or 0;	--暴击抵抗
		t_attr.dwRemitAttack = propertyInfo["dwRemitAttack"] or 0;	--伤害减免
		skillSystem:NotifyTieBuShanUpdate(t_attr,1);
		--盾牌系统增加霸体值
		local oShield = self:GetPlayer():GetSystem("CShieldSystem");
		if not oShield or not self:HasAuthority("Shield") then
			self.dwForbidLimitParam = propertyInfo["dwForbidLimitParam"];	--霸体值上限
			self.dwCutHurtRate = propertyInfo["dwCutHurtRate"];	--附加减伤比例
		end
		local nLevel = _G.CShieldConfig:GetAllLevelInfo(oShield:GetExp());
		local tLevelInfo = _G.CShieldConfig:GetProInfo(nLevel);
		if tLevelInfo then
			self.dwForbidLimitParam = propertyInfo["dwForbidLimitParam"] + tLevelInfo.dwForbidLimitParam or 0;	--霸体值上限
			self.dwCutHurtRate = propertyInfo["dwCutHurtRate"] + tLevelInfo.dwCutHurtRate or 0;	--附加减伤比例
		end
	end;
end;
--激活套装
function CTieBuShanSystem:ActivationSuit()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CTieBuShanSystem:ActivationSuit");
		return;
	end;
	if not self:HasAuthority("LronCloth") then
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	--套装等级已满
	if self.dwSuitLevel >= _G.LronClothConfig.MaxSuitLevel then
		return;
	end;
	local bCheckFlag = LronClothConfig:CheckActivationSuit(objPlayer, self.dwClothLevel, self.dwSuitLevel)
	if not bCheckFlag then
		objPlayer.SendSuitLevelMsg{Level = self.dwSuitLevel};
		return;
	end;
	local info = LronClothConfig:GetSuitConByLevel(self.dwClothLevel, self.dwSuitLevel + 1)
	local dwItemId = info.ItemID;
	local dwNeedNum = info.ItemNum;
	if not dwItemId then
		return;
	end;
	if dwNeedNum and dwNeedNum < 0 then
		return;
	end;
	local b_IsEnough_1, n_Minus_1 = itemSystem:CheckDelEnumItemInPacketCond(dwItemId, dwNeedNum);
	if not b_IsEnough_1 then
		objPlayer.SendSuitLevelMsg{Level = self.dwSuitLevel};
		return;
	end;
	itemSystem:DelEnumItemInPacket(dwItemId, dwNeedNum, false, _G.ItemSysOperType.UpSuit);
	self.dwSuitLevel = self.dwSuitLevel + 1;
	self:AddPropertyBySuit();
	self.objDBQuery:UpdateSuitLevel(objPlayer:GetRoleID(), self.dwSuitLevel)
	objPlayer.SendSuitLevelMsg{Level = self.dwSuitLevel};
	self:BroadCastSuitInfo();
end;
--获得总的减伤比例
function CTieBuShanSystem:GetCurtHurtValue()
	return self.dwBasicCurtHurtRate + self.dwCutHurtRate;
end;
--铁布衫套装广播
function CTieBuShanSystem:BroadCastSuitInfo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CTieBuShanSystem:BroadCastSuitInfo");
		return;
	end;
	if self.dwSuitLevel < _G.LronClothConfig.BroadCastLevel.SuitLevel then
		return;
	end;
	--玩家姓名
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--玩家RoleID
	local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
	--全服广播
	CGameApp.TieBuShanSuitSys_BroadCastMsg{
        PlayerName = s_PlayerName,
        PlayerRoleID = n_PlayerRoleID,
		SuitLevel = self.dwSuitLevel,
		};
end;
-------------------------------------------------------------------------------------------------
--------------------------------------------查看功能---------------------------------------------
-------------------------------------------------------------------------------------------------
function CTieBuShanSystem:ViewOtherTieBuShan(fromRoleID)
	local objPlayer = self:GetPlayer(); 
	if not objPlayer then
		return;
	end;
	_G.GSRemoteCall(fromRoleID, "CTieBuShanSystem", "BeViewTieBuShan", {objPlayer:GetRoleID()}, nil);
end;

function CTieBuShanSystem:BeViewTieBuShan(dwRoleId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_G.GSRemoteCall(dwRoleId, "CTieBuShanSystem", "ViewResult", {false, {6000410027}}, nil);
		return;
	end;
	if not self:HasAuthority("LronCloth") then
		_G.GSRemoteCall(dwRoleId, "CTieBuShanSystem", "ViewResult", {false, {6000410027}}, nil);
		return;
	end;
	local info = {};
	info["dwLevel"] = self.dwClothLevel;
	info["dwExp"] = self.dwClothExp;
	info["dwForbidValue"] = self.dwForbidValue;
	info["dwSuitLevel"] = self.dwSuitLevel;

	local extendSys = objPlayer:GetSystem("CKungFuExtendSystem");
	local nCount, nMaxCount;
	if extendSys then
		nCount, nMaxCount = extendSys:GetCount(KungFuEnum.TieBuShan);
	end
	info["tCount"] = {nCount, nMaxCount};
	_G.GSRemoteCall(dwRoleId, "CTieBuShanSystem", "ViewResult", {true, info}, nil);
end;

--返回查看结果
function CTieBuShanSystem:ViewResult(isOK, info)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CTieBuShanSystem:ViewResult");
		return;
	end;
	objPlayer.TieBuShanSys_ViewOtherMsg{IsOK = isOK, Info = info};
end;

---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
function CTieBuShanSystem:CheckForbidValueFull()
	return self.dwForbidValue >= (_G.LronClothConfig.BasicInfo[self.dwClothLevel].ForbidLimit + self.dwForbidLimitParam);
end;

function CTieBuShanSystem:GetForbidValueMax()
	return (_G.LronClothConfig.BasicInfo[self.dwClothLevel].ForbidLimit + self.dwForbidLimitParam);
end;

--获得铁布衫等级
function CTieBuShanSystem:GetClothLevel()
	if not self:HasAuthority("LronCloth") then
		return 0;
	end;
	return self.dwClothLevel;
end;

--获得套装等级
function CTieBuShanSystem:GetSuitLevel()
	if not self:HasAuthority("LronCloth") then
		return 0;
	end;
	return self.dwSuitLevel;
end;

function CTieBuShanSystem:BroadcastMyMsg(isNeedSelf,szMsgName, tbParam)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return false;
	end;
	
	if not objSelf:IsLoadEnd() then
		return false;
	end
	
	local objMapSys = objSelf:GetSystem("CMapSystem");
	if objMapSys then
		_mapcallout(szMsgName, tbParam, objMapSys:GetLogicID(), isNeedSelf)
	end
end;