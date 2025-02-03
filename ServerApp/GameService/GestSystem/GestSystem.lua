--[[
	武尊全章系统
	曲莹
	2014-03-12
]]
_G.CGestSystem = {};
function CGestSystem:new()
	local obj = CSystem:new("CGestSystem");
	obj.objDBQuery = nil;    --对应的数据库操作模块
	for i,v in pairs(CGestSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

--系统创建
function CGestSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		return;
	end;
	self.objDBQuery = CGestSystemDB:new(objDB, self);
	self.UpdateFlag = false;
	self.dwRealizeLevel = 0;
	--如果不是跨服战
	if bIsChangeLine ~= 2 then
		self.ResData = objPlayer:GetLineData("CGestSystem")[1];
		if self.ResData then	
			local bFlag = false;
			for _, info in pairs(self.ResData) do
				bFlag = true;
			end;
			if bFlag then
				local dwLevel = self.ResData["dwGestLevel"];
				local dwGestProgress = self.ResData["dwGestProgress"];
				local dwChooseMode = self.ResData["dwChooseMode"];
				local dwRealizeLevel = self.ResData["dwRealizeLevel"];
				self.UpdateFlag = true;
				self:SetGestId(1);  
				self:CreateGestObj();
				self:SetGestLevel(dwLevel);
				self:SetGestProgress(dwGestProgress);
				self:SetGestMode(dwChooseMode);
				self.dwRealizeLevel = dwRealizeLevel;
				self:AppendGestProperty();
			else
				self:SetGestId(1);  
				self:CreateGestObj();
				self:SetGestLevel(1);
				self:SetGestProgress(0);
				self:SetGestMode(0);
				self.dwRealizeLevel = 0;
				self.objDBQuery:InsertData();
			end
		end;
	end
	return true;
end;
--进入场景
function CGestSystem:OnEnterScene()
	if not CConfig.bIsCrossSvr then
		local objPlayer = self:GetPlayer();
		if not objPlayer then
			return;
		end;
		if not self.GestObj then
			self:AddGestObj();
		else
			if self:GetGestMode() ~= 0 then 
				self:ShowGestHead(self:GetGestMode(),true);
			end
			objPlayer.SendGestInfoMsg{GestLevel = self:GetGestLevel(), GestProgress = self:GetGestProgress(), GestMode = self:GetGestMode(), RealizeLevel = self.dwRealizeLevel};
		end;	
		
	end;
end;

function CGestSystem:AddGestObj()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self.UpdateFlag then
		local bournSystem = objPlayer:GetSystem("CBournSystem");
		if bournSystem:GetBournLv() >= _G.GestAuthorityLevel then
			self:SetGestId(1);  
			self:CreateGestObj();
			self:SetGestLevel(1);
			self:SetGestProgress(0);
			self:SetGestMode(0);
			self:AppendGestProperty();	
			self.UpdateFlag = true;
			objPlayer.SendGestInfoMsg{GestLevel = self:GetGestLevel(), GestProgress = self:GetGestProgress(), GestMode = self:GetGestMode(), RealizeLevel = self.dwRealizeLevel};
		end;
	end;
end;
--destroy
function CGestSystem:Destroy()
	
end;
--换线前
function CGestSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local tbl = {};
	if not self.GestObj then
		tbl = {};
		objPlayer:SetLineData("CGestSystem",tbl);
		return;
	end;
	tbl["dwGestLevel"] = self:GetGestLevel();
	tbl["dwGestProgress"] = self:GetGestProgress();
	tbl["dwChooseMode"] = self:GetGestMode();
	tbl["dwRealizeLevel"] = self.dwRealizeLevel;
	objPlayer:SetLineData("CGestSystem",tbl);
end;

--增加全章属性
function CGestSystem:AppendGestProperty()	
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local dwRealizelevel = self.dwRealizeLevel;
	--只有最后等级领悟后self.bKnow 为true
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	-- local addProperty = {};
	-- if _G.GestBasicConfig[dwRealizelevel] then
		-- addProperty = _G.GestDataConfig.AddProperty(dwRealizelevel)
	-- end;
	local tAddPor,_,tAddMax = _G.GestDataConfig.GetPropertyProgress(self:GetGestLevel(),self:GetGestProgress())
	local t_attr = _G.SSingleAttrChange:new();
	if tAddMax and dwRealizelevel == self:GetGestLevel() then
		for k,v in pairs(tAddMax) do
			tAddPor[k] = (v or 0) + tAddPor[k]
		end
	end
	if tAddPor then
		for k,v in pairs(tAddPor) do
			if k ~= "dwAddSkillLevel" then
				t_attr[k] = (v or 0)
			end
		end
		skillSystem:NotifyGestUpdate(t_attr, 1);
		local dwLevel = tAddPor["dwAddSkillLevel"] or 0 ;
		local tbSkillList = {};
		tbSkillList[61001] = dwLevel;
		skillSystem:SetSkillLevel(tbSkillList,"CGestSystem")
	end;
end;
--修复武尊全章
function CGestSystem:RebuildGest()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self.GestObj then
		_info("There is no gestObj by RebuildGest!!!");
		return;
	end;
	local dwGestLevel = self:GetGestLevel();
	local dwGestProgress = self:GetGestProgress();
	if not _G.GestBasicConfig[dwGestLevel] then
		return;
	end;
	--修复已满，返回
	if dwGestProgress >= _G.GestBasicConfig[dwGestLevel].BuildValue then
		return;
	end;
	local dwCheckBournLevel = _G.GestBasicConfig[dwGestLevel].BournLevel;
	local bournSystem = objPlayer:GetSystem("CBournSystem");
	--检测实战等级
	if bournSystem:GetBournLv() < dwCheckBournLevel then
		return;
	end;
	--检测道具
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local needItemTbl = _G.GestBasicConfig[dwGestLevel].ReBuildMaterial;
	for _, needItemInfo in pairs(needItemTbl) do
		local itemEnumId = needItemInfo.dwEnumId;
		local itemNum = needItemInfo.dwNum;
		local b_IsEnough_1, n_Minus_1 = itemSystem:CheckDelEnumItemInPacketCond(itemEnumId, itemNum);
		if not b_IsEnough_1 then
			return;
		end;
	end;
	for _, needItemInfo in pairs(needItemTbl) do
		local itemEnumId = needItemInfo.dwEnumId;
		local itemNum = needItemInfo.dwNum;
		--删除各种石头--删除物品通知
		itemSystem:DelEnumItemInPacket(itemEnumId, itemNum, false, _G.ItemSysOperType.Gest);
	end;
	local dwAddProgress = _G.GestDataConfig.AddProgress(dwGestLevel, dwGestProgress);
	if dwGestProgress + dwAddProgress >= _G.GestBasicConfig[dwGestLevel].BuildValue then
		dwGestProgress = _G.GestBasicConfig[dwGestLevel].BuildValue;
	else
		dwGestProgress = dwGestProgress + dwAddProgress;
	end;
	self:SetGestProgress(dwGestProgress);
	self:AppendGestProperty()	
	self.objDBQuery:UpdateLevel(dwGestLevel, dwGestProgress);
	objPlayer.SendRebuildValueMsg{GestProgress = dwGestProgress};
end;
--领悟武尊全章
function CGestSystem:RealizeGest()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self.GestObj then
		_info("There is no gestObj by RealizeGest!!!");
		return;
	end;
	local dwGestLevel = self:GetGestLevel();
	if not _G.GestBasicConfig[dwGestLevel] then
		return;
	end;
	local nextLevel = _G.GestBasicConfig[dwGestLevel].nextLevel
	--已经满级领悟
	if nextLevel == 0 and (self.dwRealizeLevel == dwGestLevel) then
		return;
	end;
	if self:GetGestProgress() < GestBasicConfig[dwGestLevel].BuildValue then
		return 
	end
	local tNeed = _G.GestBasicConfig[dwGestLevel].RealizeNeed;
	local objElemSystem = objPlayer:GetSystem("CFiveElemSystem");
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objElemSystem:GetElemValue()
	--检测五行真气
	local nZhenqi = tNeed.nZhenqi
	if (uItemGold < nZhenqi) or (uItemWood < nZhenqi) or (uItemWater < nZhenqi) or (uItemFire < nZhenqi) or (uItemEarth < nZhenqi) then
		return;	
	end;
	--检测道具
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	if tNeed.dwEnumId ~= 0 then 
		local itemEnumId = tNeed.dwEnumId;
		local itemNum = tNeed.dwNum;
		local b_IsEnough_1, n_Minus_1 = itemSystem:CheckDelEnumItemInPacketCond(itemEnumId, itemNum);
		if not b_IsEnough_1 then
			return;
		end;	--删除各种石头--删除物品通知
		itemSystem:DelEnumItemInPacket(itemEnumId, itemNum, false, _G.ItemSysOperType.Gest);
	end
	self:SpendZQ(nZhenqi)
	local successNum = _G.GestBasicConfig[dwGestLevel].SuccessRate;
	local RandomPro = math.random(1, 10000);
	if RandomPro <= successNum then
		--成功
		if nextLevel ~= 0 then
			self:SetGestLevel(self:GetGestLevel() + 1);
			self.dwRealizeLevel = self:GetGestLevel() - 1;
		else
			self.dwRealizeLevel = self:GetGestLevel();		
		end;
		self:AppendGestProperty();
		self.objDBQuery:UpdateRealize(self:GetGestLevel(), self.dwRealizeLevel)
		objPlayer.SendRealizeGestResultMsg{Result = true, RealizeLevel = self.dwRealizeLevel};
	else	
		objPlayer.SendRealizeGestResultMsg{Result = false, RealizeLevel = self.dwRealizeLevel};
	end;
end;
--选择武尊全章显示头像
function CGestSystem:ShowGestHead(dwPos,bFlag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self.GestObj then
		_info("There is no gestObj by RealizeGest!!!");
		return;
	end;
	if dwPos > self.dwRealizeLevel then
		return;
	end;
	local dwMode = self:GetGestMode()
	if bFlag then
		self:SetGestMode(dwPos);
	elseif dwMode ~= dwPos then 
		self:SetGestMode(dwPos);
	else
		self:SetGestMode(0);
	end
	local bflg = self:GetGestMode() ~= 0
	self.objDBQuery:UpdateMode(self:GetGestMode())
	local objPlayerShowTextSystem = objPlayer:GetSystem("PlayerShowTextSystem");
	local bournHideAttrSystem = objPlayer:GetSystem("CBournHideAttrSystem");
	if bflg then
		objPlayerShowTextSystem:DelSp(self:GetPlayer():GetSystem("CBournSystem").dwBournLv + 1); 
		local setOldTitleInfo = BournHideAttrScript:GetShowInfo(self:GetPlayer():GetSystem("CBournHideAttrSystem").dwLevel);
		if setOldTitleInfo.bResult then
			objPlayerShowTextSystem:DelSp(setOldTitleInfo.dwType);
		end		
		if _G.GestBasicConfig[dwMode] then 
			objPlayerShowTextSystem:DelSp(_G.GestBasicConfig[dwMode].ShowText)
		end
		objPlayerShowTextSystem:SetSp(_G.GestBasicConfig[dwPos].ShowText);
	else
		if _G.GestBasicConfig[dwPos] then
			objPlayerShowTextSystem:DelSp(_G.GestBasicConfig[dwPos].ShowText);
		end
		objPlayerShowTextSystem:SetSp(self:GetPlayer():GetSystem("CBournSystem").dwBournLv + 1); 
		bournHideAttrSystem:ShowPlayerIcon();
	end;
	objPlayer.SendGestModeMsg{GestMode = self:GetGestMode()};
end;

function CGestSystem:SpendZQ(needElement)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objElemSystem = objPlayer:GetSystem("CFiveElemSystem");
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objElemSystem:GetElemValue()
	--消耗真气
	objElemSystem:ChangeAttr("dwMetalValue",-needElement)
	objElemSystem:ChangeAttr("dwWoodValue",-needElement)
	objElemSystem:ChangeAttr("dwWaterValue",-needElement)
	objElemSystem:ChangeAttr("dwFireValue",-needElement)
	objElemSystem:ChangeAttr("dwEarthValue",-needElement)
	local setData = {
		[1] = {dwCurrent = uItemGold, dwChange = -needElement};
		[2] = {dwCurrent = uItemWood, dwChange = -needElement};
		[3] = {dwCurrent = uItemWater, dwChange = -needElement};
		[4] = {dwCurrent = uItemFire, dwChange = -needElement};
		[5] = {dwCurrent = uItemEarth, dwChange = -needElement};
	}
	CLogSystemManager:zhenqi(objPlayer, setData, _G.FiveElemSysOperType.Gest)
end;

--设置全章id
function CGestSystem:SetGestId(dwId)
	self.dwGestId = dwId;
end;

function CGestSystem:GetGestId()
	return self.dwGestId;
end;
--创建全章对象
function CGestSystem:CreateGestObj()
	local gestObj = CGestObj:new();
	self.GestObj = gestObj;
	-- print("=========CGestSystem:AddGestObj==444============")
	if not self.UpdateFlag then
		self.UpdateFlag = true;
	end;
end;

--设置全章等级
function CGestSystem:SetGestLevel(dwLevel)
	if self.GestObj then
		self.GestObj:SetGestLevel(dwLevel)
	end;
end;

function CGestSystem:GetGestLevel()
	if self.GestObj then
		return self.GestObj:GetGestLevel()
	end;
	return 0;
end;
--设置全章修复进度
function CGestSystem:SetGestProgress(dwProgress)
	if self.GestObj then
		self.GestObj:SetGestProgress(dwProgress)
	end;
end;
function CGestSystem:GetGestProgress()
	if self.GestObj then
		return self.GestObj:GetGestProgress()
	end;
	return 0;
end;
--设置全章模式
function CGestSystem:SetGestMode(dwMode)
	if self.GestObj then
		self.GestObj:SetGestMode(dwMode)
	end;
end;
function CGestSystem:GetGestMode()
	if self.GestObj then
		return self.GestObj:GetGestMode()
	end;
	return 0;
end;

-----------------------------------------------------------------------------------------
----------------------------------------查看武尊全章-------------------------------------
-----------------------------------------------------------------------------------------
function CGestSystem:ViewOtherGest(fromRoleID)
	local objPlayer = self:GetPlayer(); 
	if not objPlayer then
		return;
	end;
	_G.GSRemoteCall(fromRoleID, "CGestSystem", "BeViewGestInfo", {objPlayer:GetRoleID()}, nil);
end;

function CGestSystem:BeViewGestInfo(dwRoleId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_G.GSRemoteCall(dwRoleId, "CGestSystem", "ViewResult", {false, 6000410027}, nil);
		return;
	end;
	local gestObj = self.GestObj;
	if not gestObj then
		_G.GSRemoteCall(dwRoleId, "CGestSystem", "ViewResult", {false, 4001310009}, nil);
		return;
	end;
	local tInfo = {}
	tInfo[1] = self:GetGestLevel();
	tInfo[2] = self:GetGestProgress();
	tInfo[3] = self.dwRealizeLevel;
	_G.GSRemoteCall(dwRoleId, "CGestSystem", "ViewResult", {true, tInfo}, nil);
end;

--返回查看结果
function CGestSystem:ViewResult(isOK, tInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CGestSystem:ViewResult");
		return;
	end;

	objPlayer.GestSys_ViewOtherResultMsg{IsOK = isOK, tInfo = tInfo};
end;

