--[[	--功能：童姥功系统功能	--作者：魏云	--时间：2013-12-20--]]_G.CPractiseSkillSystem = {};function CPractiseSkillSystem:new()	local obj = CSystem:new("CPractiseSkillSystem");	obj.objDBQuery = nil;--数据库查询对象	obj.RoleID = 0;	obj.PractiseLevel = 0; ----修炼等级	obj.MendValue =0;      ----当前修为值	obj.StarLevel = 0;     ----套装星星等级	obj.HeadState = 0;     -----头像状态 0 未开启 1 开启未使用 2 已使用	for i,v in pairs(CPractiseSkillSystem) do		if type(v) == "function" then			obj[i] = v;		end;	end;	return obj;endfunction CPractiseSkillSystem:Create(bIsChangeLine)	local objPlayer = self:GetPlayer();	if not objPlayer then		return false;	end;	local objDB = objPlayer:GetDBQuery();	if(not objDB ) then		_info("objDB is null by CPractiseSkillSystem:Create")		return false;	end	-- 创建数据库对象	self.objDBQuery = CPractiseSkillSystemDB:new(objDB,self);	self.skillSystem = objPlayer:GetSystem("CSkillSystem");	--如果是跨服战	if bIsChangeLine == 2 then		local Data = objPlayer:GetLineData("CPractiseSkillSystem") or {};		--local Data = objPlayer:GetCrossSvrData("CPractiseSkillSystem") or {}		if(#Data == 0) then			return;		end		if(#Data[1] > 0) then			self.RoleID = Data[1][1].dwRoleID;			self.PractiseLevel = 0;			self.MendValue = 0;			self.StarLevel = Data[1][1].dwStarLevel;			self.HeadState = 0;		end	else		---从数据库中读取数据		local Data = objPlayer:GetLineData("CPractiseSkillSystem") or {};		if(#Data <= 0) then			return;		end		if(#Data[1] > 0) then			self.RoleID = Data[1][1].dwRoleID;			self.PractiseLevel = Data[1][1].dwPractiseLevel;			self.MendValue = Data[1][1].dwMendValue;			self.StarLevel = Data[1][1].dwStarLevel;			self.HeadState = Data[1][1].dwHeadState;		end	end	self:PractiseSkillAddAttr(2);	self:AddSuitStarEffect(self.StarLevel);	return trueendfunction CPractiseSkillSystem:OnChangeLineBegin(dwNewLineID)	local objPlayer = self:GetPlayer();	if not objPlayer then		return;	end;	local Data = {}	Data[1] = {};	Data[1].dwRoleID = self.RoleID;	Data[1].dwPractiseLevel = self.PractiseLevel;	Data[1].dwMendValue = self.MendValue;	Data[1].dwStarLevel = self.StarLevel;	Data[1].dwHeadState = self.HeadState;	--将数据提交到换线中心	objPlayer:SetLineData("CPractiseSkillSystem",Data);end-----换跨服战场function CPractiseSkillSystem:OnEnterCrossBegin()	local objPlayer = self:GetPlayer()	if not objPlayer then		return;	end	local tb = {};	tb[1] = {};	tb[1].dwRoleID = self.RoleID;	tb[1].dwStarLevel = self.StarLevel;	objPlayer:SetCrossSvrData("CPractiseSkillSystem",tb);end;function CPractiseSkillSystem:OnEnterScene()	local objPlayer = self:GetPlayer();	if(not objPlayer) then		return;	end	self:SynchronizeToClient();endfunction CPractiseSkillSystem:SynchronizeToClient()	local objPlayer = self:GetPlayer();	if(not objPlayer) then		return;	end	---同步客户端	objPlayer.PractiseSkillSynMsg{PractiseLevel = self.PractiseLevel,MendValue = self.MendValue,StarLevel = self.StarLevel,HeadState = self.HeadState};end----保存数据库function CPractiseSkillSystem:SaveDB()	if(self.RoleID <= 0) then		self.objDBQuery:InsertPractiseSkillInfo();		self.RoleID = self:GetPlayer():GetRoleID();	else		self.objDBQuery:UpdatePractiseSkillInfo();	endend----兑换修为值function CPractiseSkillSystem:ExchangeMendValue(ExchangeExp)	-- print("=============ExchangeMendValue=====================",ExchangeExp)	local objPlayer = self:GetPlayer();	if(not objPlayer) then		return;	end	if(ExchangeExp <= 0) then		return;	end	if(self.PractiseLevel >= #_G.PractiseSkillConfig.LevelConfig) then		return;	end	local currExp = objPlayer.sRoleInfo.dwExp;	local curLevel = objPlayer.sRoleInfo.dwLevel;	currExp = currExp - RoleUpLevelConfig[curLevel].dwExp	if(currExp < ExchangeExp) then 		return;	end	local mendValue = PractiseSkillConfig:GetPractiseSkilExp(self.PractiseLevel+1, self.MendValue,ExchangeExp);	if(mendValue <= 0) then		return;	end	mendValue = self:GetFinalMendValue(mendValue);	self.MendValue = self.MendValue + mendValue;	local upLevel,upMendValue = self:GetUpLevelByMendValue(self.MendValue);	self.MendValue = upMendValue;	if(upLevel > self.PractiseLevel) then		local temp = 2;		if(math.floor(upLevel/10) > math.floor(self.PractiseLevel/10)) then			temp = 1;		end		self.PractiseLevel = upLevel;		self:PractiseSkillAddAttr(temp);	end	objPlayer:AddExp(-ExchangeExp);	self:SaveDB();	objPlayer.UpdatePractiseLevelMsg{PractiseLevel = self.PractiseLevel,MendValue = self.MendValue,ChangeMendValue = mendValue,UseItem = 0};end----使用六和八荒获取修为值function CPractiseSkillSystem:ButtonExchangeMendValue()	local objPlayer = self:GetPlayer()	if(not objPlayer) then		return;	end	if(self.PractiseLevel >= #_G.PractiseSkillConfig.LevelConfig) then		return;	end	local objItemSystem = objPlayer:GetSystem("CItemSystem");	if(not objItemSystem) then		return;	end	local packNum = objItemSystem:GetEnumItemNumInPacket(_G.PractiseSkillConfig.ItemConfig.ItemID)	if(packNum < _G.PractiseSkillConfig.ItemConfig.Num) then  ----背包中的消耗物品数量不够		return;	end	local isSucc = objItemSystem:DelEnumItemInPacket(_G.PractiseSkillConfig.ItemConfig.ItemID,_G.PractiseSkillConfig.ItemConfig.Num,true, _G.ItemSysOperType.PractiseSkill)  ---待会再改	if not isSucc then		return;	end	local mendValue = _G.PractiseSkillConfig.ItemConfig.Exp;	self.MendValue = self.MendValue + mendValue;	local upLevel,upMendValue = self:GetUpLevelByMendValue(self.MendValue);	self.MendValue = upMendValue;	if(upLevel > self.PractiseLevel) then		local temp = 2;		if(math.floor(upLevel/10) > math.floor(self.PractiseLevel/10)) then			temp = 1;		end		self.PractiseLevel = upLevel;		self:PractiseSkillAddAttr(temp);	end	self:SaveDB();	objPlayer.UpdatePractiseLevelMsg{PractiseLevel = self.PractiseLevel,MendValue = self.MendValue,ChangeMendValue = mendValue,UseItem = 1};end----开启套装星星function CPractiseSkillSystem:OpenSuitStar(StarLevel)	if(StarLevel <= 0 or StarLevel == self.StarLevel) then		return;	end	local objPlayer = self:GetPlayer()	if(not objPlayer) then		return;	end	local curStarLevel = math.floor(self.PractiseLevel/10);	if(curStarLevel < StarLevel) then		return;	end	if(StarLevel - self.StarLevel > 1 ) then		return;	end	local objItemSystem = objPlayer:GetSystem("CItemSystem");	if(not objItemSystem) then		return;	end	local packNum = objItemSystem:GetEnumItemNumInPacket(_G.PractiseSkillConfig.SuitConfig[StarLevel].ItemID)	if(packNum < _G.PractiseSkillConfig.SuitConfig[StarLevel].Num) then  ----背包中的消耗物品数量不够		return;	end	local isSucc = objItemSystem:DelEnumItemInPacket(_G.PractiseSkillConfig.SuitConfig[StarLevel].ItemID,_G.PractiseSkillConfig.SuitConfig[StarLevel].Num,true, _G.ItemSysOperType.PractiseSkill)  ---待会再改	if not isSucc then		return;	end	if(self.StarLevel > 0) then		self:DelSuitStarEffect(self.StarLevel);	end	self.StarLevel = StarLevel;	self:AddSuitStarEffect(self.StarLevel);	self:PractiseSkillAddAttr(0);	objPlayer.UpdateSuitStarLevelMsg{StarLevel = self.StarLevel};	if( self.StarLevel == #_G.PractiseSkillConfig.SuitAttr) then		self.HeadState = 1;		objPlayer.ChangeSpecialPortraitMsg{HeadState = self.HeadState};	end	self:SaveDB();end---使用特殊头像function CPractiseSkillSystem:UseSpecialPortrait()	local objPlayer = self:GetPlayer()	if(not objPlayer) then		return;	end	if(self.StarLevel < #_G.PractiseSkillConfig.SuitAttr) then		return;	end	if(self.HeadState == 1 or self.HeadState == 0) then		self.HeadState = 2;		objPlayer.sRoleInfo.dwDefIncoID = self:GetChangeIconID();		-- print("======objPlayer.sRoleInfo.dwIncoIDobjPlayer.sRoleInfo.dwDefIncoID=============",objPlayer.sRoleInfo.dwDefIncoID)		objPlayer.sRoleInfo.dwFace = _G.ResRoleModelConfig.Icons[objPlayer.sRoleInfo.dwDefIncoID].FaceModelID;		objPlayer.sRoleInfo.dwHair = _G.ResRoleModelConfig.Icons[objPlayer.sRoleInfo.dwDefIncoID].HairModelID;	elseif(self.HeadState == 2) then		objPlayer.sRoleInfo.dwDefIncoID = 0;		objPlayer.sRoleInfo.dwFace = 0;		objPlayer.sRoleInfo.dwHair = 0;		self.HeadState = 1;	end	objPlayer:ViewChange();	self:SaveDB();	local objMapSys = objPlayer:GetSystem("CMapSystem");	if objMapSys then	_mapcallout("OnChangeIncoIDMsg", 			{				RoleID = objPlayer:GetRoleID(),				Info = {dwIncoID = objPlayer.sRoleInfo.dwDefIncoID,dwFace = objPlayer.sRoleInfo.dwFace,dwHair = objPlayer.sRoleInfo.dwHair}			},objMapSys:GetLogicID(),true);	end	objPlayer.ChangeSpecialPortraitMsg{HeadState = self.HeadState};	local teamSys = objPlayer:GetSystem("CTeamSystem");	if(not teamSys) then		return;	end	if teamSys:GetTeamId() then		local Team = teamSys:GetTeamLeaguer();		for k,v in pairs(Team) do			local roleobj = CMapManager:GetPlayer(v);			if(roleobj) then 				local Info = {dwDefIncoID = objPlayer.sRoleInfo.dwIncoID,dwIncoID = objPlayer.sRoleInfo.dwDefIncoID,dwFace = objPlayer.sRoleInfo.dwFace,dwHair = objPlayer.sRoleInfo.dwHair};				roleobj.OnChangeTeamIncoIDMsg{RoleID = objPlayer:GetRoleID(),Info = Info};			end		end	endend--查看对方童姥功信息function CPractiseSkillSystem:ViewOtherPractiseSkill(OtherRoleID)	local objPlayer = self:GetPlayer(); 	if not objPlayer then		return;	end;	_G.GSRemoteCall(OtherRoleID, "CPractiseSkillSystem", "ViewOtherPractiseSkillInfo", {objPlayer:GetRoleID(),OtherRoleID}, nil);endfunction CPractiseSkillSystem:ViewOtherPractiseSkillInfo(dwRoleId,OtherRoleID)	local objPlayer = self:GetPlayer();	if not objPlayer then		_G.GSRemoteCall(dwRoleId, "CPractiseSkillSystem", "ViewResult", {false, {6000410027},2}, nil);		return;	end;	if not self:HasAuthority("PractiseSkill") then 		_G.GSRemoteCall(dwRoleId, "CPractiseSkillSystem", "ViewResult", {true, {6000410027},1}, nil);		return;	end;   --是否有权限 	local tempInfo = {};	tempInfo.RoleID = OtherRoleID;	tempInfo.PractiseLevel = self.PractiseLevel;	tempInfo.MendValue = self.MendValue;	tempInfo.StarLevel = self.StarLevel;	tempInfo.HeadState = self.HeadState;		local extendSys = objPlayer:GetSystem("CKungFuExtendSystem");	local nCount, nMaxCount;	if extendSys then		nCount, nMaxCount = extendSys:GetCount(KungFuEnum.TongLaoGong);	end	tempInfo.tCount = {nCount, nMaxCount};	_G.GSRemoteCall(dwRoleId, "CPractiseSkillSystem", "ViewResult", {true, tempInfo,0}, nil);end;--返回查看结果function CPractiseSkillSystem:ViewResult(isOK, info,Param)	local objPlayer = self:GetPlayer();	if not objPlayer then		_err("Cannot get player by CPractiseSkillSystem:ViewResult");		return;	end;	if(not isOK) then		objPlayer.OnSynPractiseSkillSysHasAutMsg{Param = Param} --- 不在线		return	end	if(Param == 1) then		objPlayer.OnSynPractiseSkillSysHasAutMsg{Param = Param} --- 没有权限		return	end	local RoleID = info.RoleID;	local PractiseLevel = info.PractiseLevel;	local MendValue = info.MendValue;	local StarLevel = info.StarLevel;	local HeadState = info.HeadState;	objPlayer.PractiseSkillOtherSynMsg{RoleID = RoleID,PractiseLevel = PractiseLevel,MendValue = MendValue,StarLevel = StarLevel,HeadState = HeadState, tCount = info.tCount};	objPlayer.OnSynPractiseSkillSysHasAutMsg{Param = Param}end-----商业道具功能---使用道具增加修为值function CPractiseSkillSystem:UseItemAddMendValue(mendValue)	local objPlayer = self:GetPlayer()	if(not objPlayer) then		return 1;	end	if(self.PractiseLevel >= #_G.PractiseSkillConfig.LevelConfig) then		return 2;	end	self.MendValue = self.MendValue + mendValue;	local upLevel,upMendValue = self:GetUpLevelByMendValue(self.MendValue);	self.MendValue = upMendValue;	if(upLevel > self.PractiseLevel) then		local temp = 2;		if(math.floor(upLevel/10) > math.floor(self.PractiseLevel/10)) then			temp = 1;		end		self.PractiseLevel = upLevel;		self:PractiseSkillAddAttr(temp);	end	self:SaveDB();	objPlayer.UpdatePractiseLevelMsg{PractiseLevel = self.PractiseLevel,MendValue = self.MendValue,ChangeMendValue = mendValue,UseItem = 1};	return nil;end----获取需要升等级的修为值function CPractiseSkillSystem:GetUpLevelByMendValue(mendValue)	for i = self.PractiseLevel+1,#_G.PractiseSkillConfig.LevelConfig do		if(mendValue >= _G.PractiseSkillConfig.LevelConfig[i].Exp) then			mendValue = mendValue - _G.PractiseSkillConfig.LevelConfig[i].Exp;		else			return i-1,mendValue;		end	end	return #_G.PractiseSkillConfig.LevelConfig,0;end---获取修炼等级属性function CPractiseSkillSystem:GetUpLevelAttr(level)	local t_attr = _G.SSingleAttrChange:new();	local tempInfo = {};	local tempattr = _G.PractiseSkillConfig.LevelConfig[level] or {};	for k,v in pairs (tempattr) do		if(t_attr[k]) then			t_attr[k] = tempattr[k];		end	end	return t_attr;end---获取修炼套装属性function CPractiseSkillSystem:GetSuitLevelAttr()	local suit_attr = _G.SSingleAttrChange:new();	--for i = 1,self.StarLevel do	local t_attr = _G.SSingleAttrChange:new();	local tempattr = _G.PractiseSkillConfig.SuitAttr[self.StarLevel] or {};	for k,v in pairs (tempattr) do		t_attr[k] = tempattr[k];	end	suit_attr:AddValue(t_attr);	--end	return suit_attr;end---修炼升级 更新属性function CPractiseSkillSystem:PractiseSkillAddAttr(temp)	local suitPropertyInfo = {}; ---套装属性	local t_attr = _G.SSingleAttrChange:new();	t_attr = self:GetUpLevelAttr(self.PractiseLevel); ----等级属性	suitPropertyInfo = self:GetSuitLevelAttr();	t_attr:AddValue(suitPropertyInfo);	self.skillSystem:NotifyPractiseSkill(t_attr); ----属性加成	local objPlayer = self:GetPlayer();	if(not objPlayer) then		return;	end	local RoleID = objPlayer:GetRoleID();	local RoleName = objPlayer:GetName();	if(temp == 1) then		CGameApp.BroadCastAddLevelMsg{RoleID = RoleID,RoleName = RoleName,Level = self.PractiseLevel};	elseif(temp == 0) then		CGameApp.BroadCastSuitStarOpenMsg{RoleID = RoleID,RoleName = RoleName,Level = self.StarLevel};	endend----获取最终修为值function CPractiseSkillSystem:GetFinalMendValue(mendValue)	local objPlayer = self:GetPlayer()	if(not objPlayer) then		return;	end	local buffsys = objPlayer:GetSystem("CBuffSystem");	if(not buffsys)then		return;	end	local buffId = 0;	local tempValue = 0;	local buffobj = {};	for k,v in pairs(_G.PractiseSkillConfig.BuffConfig) do		if(buffsys:GetBuffObj(k) and v > tempValue) then			buffId = k;			tempValue = v;		end	end	local preValue = _G.PractiseSkillConfig.BuffConfig[buffId];	buffobj = buffsys:GetBuffObj(buffId)	if(not buffobj) then		return mendValue;	else	    return math.floor(mendValue*(1+preValue/100));	endend----获取头像状态function CPractiseSkillSystem:GetHeadState()	return self.HeadState;end ----加套装星星特效function CPractiseSkillSystem:AddSuitStarEffect(curSuitStarLevel)	local objPlayer = self:GetPlayer();	if(not objPlayer) then		return;	end	local dwPfxCfg = 0;	dwPfxCfg = _G.PractiseSkillConfig.SuitStarPfxConfig[curSuitStarLevel];		if(dwPfxCfg == 0 or not dwPfxCfg) then		return;	end	objPlayer:AddViewPfx(dwPfxCfg);end---减上个套装星星特效function CPractiseSkillSystem:DelSuitStarEffect(curSuitStarLevel)	local objPlayer = self:GetPlayer();	if(not objPlayer) then		return;	end	local dwPfxCfg = 0;	dwPfxCfg = _G.PractiseSkillConfig.SuitStarPfxConfig[curSuitStarLevel];	if(dwPfxCfg == 0 or not dwPfxCfg) then		return;	end	objPlayer:RmvViewPfx(dwPfxCfg)end----获取特殊头像IDfunction CPractiseSkillSystem:GetChangeIconID()	local objPlayer = self:GetPlayer()	if(not objPlayer) then		return;	end	local roleProf = objPlayer.sRoleInfo.dwProf;	return _G.PractiseSkillConfig.RoleModelConfig[roleProf].IconID;end ---获取童姥功当前等级function CPractiseSkillSystem:GetCurPractiseLevel()	return self.PractiseLevel;end-- 获取童姥功当前套装等级function CPractiseSkillSystem:GetCurStarLevel()	return math.floor(self.PractiseLevel / 10);end----获取当前修为值function CPractiseSkillSystem:GetCurMendValue()	return self.MendValue;end