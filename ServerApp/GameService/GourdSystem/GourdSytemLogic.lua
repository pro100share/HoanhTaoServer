
--[[
	时间：2014-1-2
	功能：酒葫芦消息逻辑
	作者：魏云
--]]


----提交物品获取熟练度
function CGourdSystem:HandInItem(Index)
	if (not self:HasAuthority("Gourd")) then 
		return;
	end
	local info = self:GetFinalViewItemConfig();
	if(Index > #info) then
		-- print("1")
		return;
	end
	if(info[Index].Limit ~= -1) then
		if(self.Resdata.CurItemInfos[Index] >= info[Index].Limit) then
			return;
		end
	end
	if(self.Resdata.MendLevel >= #_G.GourdConfig.LevelConfig) then
		return;
	end
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if(not objItemSystem) then
		return;
	end
	local packNum = objItemSystem:GetEnumItemNumInPacket(info[Index].ItemID);
	if(packNum < 1) then
		return;
	end
	local isSucc = objItemSystem:DelEnumItemInPacket(info[Index].ItemID,1,true, _G.ItemSysOperType.Gourd) 
	if not isSucc then
		return;
	end
	local num = self:GetAddTimesNum(Index);
	local addexp = info[Index].AddExp*(num);
	self.Resdata.CurSkillValue = self.Resdata.CurSkillValue + addexp;
	local curLevel,curSkillValue = self:GetUpLevelBySkillValue(self.Resdata.CurSkillValue);
	if(curLevel > self.Resdata.MendLevel) then
		local temp = false;
		temp = self:GetIsBroadCastByLevel(self.Resdata.MendLevel,curLevel)
		self.Resdata.MendLevel = curLevel;
		self:UpdateGourdProperty(curLevel,temp);
	end
	self.Resdata.CurSkillValue = curSkillValue;
	self.Resdata.CurItemInfos[Index] = self.Resdata.CurItemInfos[Index] +1;
	if(self.Resdata.AdornState == 0) then
		if(math.floor(self.Resdata.MendLevel/5) > 0) then
			self.Resdata.AdornState = 1;
		end
	end
	self:AutoAdornGourd();
	self:SaveDB();
	local Type = 0;
	local ChangeValue = 0;
	if(info[Index].Limit == -1) then
		Type = 1;  -----可无限提交
	elseif(_G.GourdConfig.RandTimeIndexConfig[self.Resdata.AddTimesItemIndex].Index == Index) then
		Type = 2;  ----随机翻倍
	else
		Type = 3;  ----普通提交
	end
	ChangeValue = addexp;
	objPlayer.GourdHandInItemInfoMsg{Infos = self.Resdata,Type = Type,ChangeValue = ChangeValue};
end

----热更新
function CGourdSystem:GourdHotUpdate()
	if (not self:HasAuthority("Gourd")) then 
		return;
	end
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	if(_G.UpdateGourdConfig and _G.UpdateGourdConfig.bOpen) then
		self.Resdata.CurItemInfos = {0,0,0,0};
		objPlayer.OnSynGourdViewItemInfoMsg{Infos = self:GetFinalViewItemConfig()};
		objPlayer.GourdSynchronizeToClientMsg{Infos = self.Resdata};
	end
end
----查看对方酒葫芦信息
function CGourdSystem:ViewOtherGourd(OtherRoleID)
	local objPlayer = self:GetPlayer(); 
	if not objPlayer then
		return;
	end;
	_G.GSRemoteCall(OtherRoleID, "CGourdSystem", "ViewOtherGourdInfo", {objPlayer:GetRoleID(),OtherRoleID}, nil);
end

function CGourdSystem:ViewOtherGourdInfo(dwRoleId,OtherRoleID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_G.GSRemoteCall(dwRoleId, "CGourdSystem", "ViewResult", {false, {6000410027},2}, nil);
		return;
	end;
	if not self:HasAuthority("Gourd") then 
		_G.GSRemoteCall(dwRoleId, "CGourdSystem", "ViewResult", {true, {6000410027},1}, nil);
		return;
	end;   --是否有权限 
	local tempInfo = {};
	tempInfo.RoleID = OtherRoleID;
	tempInfo.MendLevel = self.Resdata.MendLevel;
	tempInfo.nCount = self:GetPlayer():GetSystem("CKungFuExtendSystem"):GetCount(KungFuEnum.Gourd)
	_G.GSRemoteCall(dwRoleId, "CGourdSystem", "ViewResult", {true, tempInfo,0}, nil);
end

function CGourdSystem:ViewResult(isOK, info,Param)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CGourdSystem:ViewResult");
		return;
	end;
	if(not isOK) then
		objPlayer.OnSynGourdSysHasAutMsg{Param = Param} --- 2表示不在线
		return
	end
	if(Param == 1) then
		objPlayer.OnSynGourdSysHasAutMsg{Param = Param} --- 1没有权限
		return
	end
	local RoleID = info.RoleID;
	local MendLevel = info.MendLevel;
	objPlayer.OnSynGourdSystemOtherViewMsg{RoleID = RoleID,MendLevel = MendLevel,nCount = info.nCount};
	objPlayer.OnSynGourdSysHasAutMsg{Param = Param} --- 0表示在线
end

-----佩戴葫芦
function CGourdSystem:AdornGourd(Level)
	if (not self:HasAuthority("Gourd")) then 
		return;
	end
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	if(self.Resdata.MendLevel < Level) then
		return;
	end
	if(self.Resdata.AdornState == 0) then
		return;
	end
	if(Level > #_G.GourdConfig.LevelConfig) then
		return;
	end
	
	local modelID = 0;
	modelID = self:GetModeID(Level);
	if(modelID == 0) then
		-- print("4")
		if(self.Resdata.AdornState > 1) then
			objPlayer:RmvViewModel(self.Resdata.AdornState);
			self.Resdata.AdornState = 1;
			self:SaveDB();
		else
			local sysScript = objPlayer:GetSystem("CScriptSystem")
			if(not sysScript) then
				return;
			end
			sysScript:Notice(_G.GourdConfig.Text.IsNoCan4);----此模型不可佩戴，请选择可佩带的模型
		end
		objPlayer.ChangeSpecialGourdMsg{AdornState = self.Resdata.AdornState};
		return;
	end
	if(self.Resdata.AdornState == 1) then
		self.Resdata.AdornState = modelID;
		objPlayer:AddViewModel(modelID);
	elseif(self.Resdata.AdornState > 1) then
		objPlayer:RmvViewModel(self.Resdata.AdornState);
		self.Resdata.AdornState = 1;
	end
	self:SaveDB();
	objPlayer.ChangeSpecialGourdMsg{AdornState = self.Resdata.AdornState};
end
----获取模型ID
function CGourdSystem:GetModeID(Level)
	local modelID = 0;
	local index = 0;
	for k,v in pairs(_G.GourdConfig.AdornModelIDConfig) do
		if(Level == k) then
			modelID = v;
			break
		elseif(Level > k and index < k) then
			modelID = v;
			index = k
		end
	end
	return modelID;
end

----自动佩戴葫芦
function CGourdSystem:AutoAdornGourd()
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	local modelID = 0;
	if(self.Resdata.AdornState ~= 0) then
		modelID = self:GetModeID(self.Resdata.MendLevel);
		if(modelID ~= 0 and modelID ~= self.Resdata.AdornState) then
			if(self.Resdata.AdornState ~= 1) then
				objPlayer:RmvViewModel(self.Resdata.AdornState);
			end
			objPlayer:AddViewModel(modelID);
			self.Resdata.AdornState = modelID;
			objPlayer.ChangeSpecialGourdMsg{AdornState = self.Resdata.AdornState};
		end
	end
end

----获取葫芦该等级是否广播
function CGourdSystem:GetIsBroadCastByLevel(PreLevel,Level)
	if(Level - PreLevel >= 5) then
		return true;
	else
		for k,v in ipairs(_G.GourdConfig.GourdBroadCastConfig) do
			if(v == Level) then
				return true;
			end
		end
	end
	return false;
end

----使用道具增加熟练度
function CGourdSystem:UseItemAddSkillValue(skillValue)
	if(self.Resdata.MendLevel >= #_G.GourdConfig.LevelConfig) then
		return 1;
	end
	if (not self:HasAuthority("Gourd")) then 
		return 2;
	end
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return 3;
	end
	self.Resdata.CurSkillValue = self.Resdata.CurSkillValue + skillValue;
	local curLevel,curSkillValue = self:GetUpLevelBySkillValue(self.Resdata.CurSkillValue);
	if(curLevel > self.Resdata.MendLevel) then
		local temp = false;
		temp = self:GetIsBroadCastByLevel(self.Resdata.MendLevel,curLevel)
		self.Resdata.MendLevel = curLevel;
		self:UpdateGourdProperty(curLevel,temp);
	end
	self.Resdata.CurSkillValue = curSkillValue;
	if(self.Resdata.AdornState == 0) then
		if(math.floor(self.Resdata.MendLevel/5) > 0) then
			self.Resdata.AdornState = 1;
		end
	end
	self:AutoAdornGourd();
	self:SaveDB();
	objPlayer.GourdHandInItemInfoMsg{Infos = self.Resdata,Type = 1,ChangeValue = skillValue};
	return nil;
end
----清随机倍数
function CGourdSystem:ClearAddTimesInfo()
	self:RandAddTimes();
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	self.Resdata.CurItemInfos = {0,0,0,0};
	self:SaveDB();
	objPlayer.GourdSynchronizeToClientMsg{Infos = self.Resdata};
end
