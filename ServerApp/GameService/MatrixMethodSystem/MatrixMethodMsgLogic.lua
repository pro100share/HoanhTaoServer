
--[[
功能：阵法消息逻辑
作者：魏云
时间：2013-11-04
--]]

----同步客户端消息
function CMatrixMethodSystem:OnSynMatrixMethodSystem(objPlayer)
	local RoleID = objPlayer:GetRoleID();
	local OrdinaryStar = self.OrdinaryStarTotalExpList;
	local HideStar = self.ResData.dwHideStarLevel;
	local CurUsedFreeNum = self.ResData.dwUsedFreeNum;	
	local freeNum = self:GetFinalFreeUsedMaxNum() - CurUsedFreeNum;
	objPlayer.OnSynCMatrixMethodSystemMsg{RoleID = RoleID,OrdinaryStar = OrdinaryStar,HideStar=HideStar};
	objPlayer.OnSynCMatrixMethodCurFreeNumMsg{FreeNum = freeNum}
end
----------------------------------------------消息处理------------------------------------------
----手动拉杆
function CMatrixMethodSystem:SelfOperateRanderStarValue(addExpNum,b_isGold,b_IsAutoBuy,b_IsUseGold,b_IsFirstUseBind)
	if not self:HasAuthority("MatrixMethod") then return end;   --是否有权限
	local b_ok = self:CheckCanNotUsedMatrixMethod()
	if(not b_ok) then
		return;
	end
	local b_Free = false;
	b_Free = self:SelfFreeOperateRanderStarValue(addExpNum)  ----免费拉杆
	if(b_Free) then
		return;
	end
	local b_Conditon = false;
	local consumeInfo = {};
	b_Conditon,consumeInfo = self:CheckOperateRanderStarCondition(addExpNum,b_isGold,b_IsAutoBuy,b_IsUseGold,b_IsFirstUseBind) ---检查拉杆条件
	if(not b_Conditon) then
		return;
	end
	local b_ConsumeInfo= false;
	b_ConsumeInfo = self:TaskOffSelfOperateConsumeInfo(consumeInfo,b_IsFirstUseBind)  ----扣除消耗物品信息
	if(not b_ConsumeInfo) then
		return;
	end
	local b_succ = false;
	b_succ = self:OperateLogic(addExpNum,3,2); -----拉杆逻辑处理
	if(not b_succ) then
		return;
	end
	self:SaveDB();  ----存入数据库
	
end
---免费拉杆
function CMatrixMethodSystem:SelfFreeOperateRanderStarValue(addExpNum)
	if(self.ResData.dwUsedFreeNum >= self:GetFinalFreeUsedMaxNum()) then
		return false;
	else
		local usedNum = self.ResData.dwUsedFreeNum;
	    self.ResData.dwUsedFreeNum = self.ResData.dwUsedFreeNum+self:GetFinalAddExpNum(addExpNum);
		if(self.ResData.dwUsedFreeNum > self:GetFinalFreeUsedMaxNum()) then
			self.ResData.dwUsedFreeNum = usedNum;
			return false;
		end
	end
	local b_succ = false;
	b_succ = self:OperateLogic(addExpNum,3,1); -----拉杆逻辑处理
	if(not b_succ) then
		return false;
	end
	self:SaveDB();  ----存入数据库
	return true;
end
function CMatrixMethodSystem:ClickMoveStarButRandStarValue(addExpNum,b_isGold,b_IsAutoBuy,b_IsUseGold,b_IsFirstUseBind)
	if not self:HasAuthority("MatrixMethod") then return end;   --是否有权限
	local b_ok = self:CheckCanNotUsedMatrixMethod()
	if(not b_ok) then
		return;
	end
	local b_Conditon = false;
	local consumeInfo = {};
	if(self.ResData.dwUsedFreeNum >= self:GetFinalFreeUsedMaxNum()) then
		b_Conditon,consumeInfo = self:CheckOperateRanderStarCondition(addExpNum,b_isGold,b_IsAutoBuy,b_IsUseGold,b_IsFirstUseBind) ---检查拉杆条件
		if(not b_Conditon) then
			return;
		end
	else
		local usedFreeNum = self.ResData.dwUsedFreeNum+self:GetFinalAddExpNum(addExpNum); 
		if(usedFreeNum > self:GetFinalFreeUsedMaxNum()) then
			return;
		end
	end
	local b_moveCondition = false;
	local moveConInfo = {};
	b_moveCondition,moveConInfo = self:CheckMoveStarButRanderStarCondition()
	if(not b_moveCondition) then
		return;
	end
	local b_moveConInfo = false;
	b_moveConInfo = self:TaskOffMoveStarButConsumeInfo(moveConInfo);
	if(not b_moveConInfo) then
		return;
	end
	if(b_Conditon) then
		local b_ConsumeInfo= false;
		b_ConsumeInfo = self:TaskOffSelfOperateConsumeInfo(consumeInfo,b_IsFirstUseBind)  ----扣除消耗物品信息
		if(not b_ConsumeInfo) then
			return;
		end
	end
	if(self.ResData.dwUsedFreeNum < self:GetFinalFreeUsedMaxNum()) then
		self.ResData.dwUsedFreeNum = self.ResData.dwUsedFreeNum+self:GetFinalAddExpNum(addExpNum);
	end
	local b_succ = false;
	b_succ = self:OperateLogic(addExpNum,1,3); -----拉杆逻辑处理
	if(not b_succ) then
		return;
	end
	self:SaveDB();  ----存入数据库
end

----套装星升级
function CMatrixMethodSystem:SuitStarCollectItem()
	if not self:HasAuthority("MatrixMethod") then return end;   --是否有权限
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	if(self.ResData.dwSuitStarLevel >= self:GetSuitStarMaxLevel()) then
		return;
	end
	local level = MatrixMethodScript:GetCurStarSuitLevel(self.OrdinaryStarLevelList)
	if(self.ResData.dwSuitStarLevel >= level) then
		return;
	end
	local curSuitStarLevel = self.ResData.dwSuitStarLevel
	local consumeInfo = MatrixMethodScript:GetStarConInfoByLevel(curSuitStarLevel+1)
	----搜索包裹
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return;
	end
	local packNum = objItemSystem:GetEnumItemNumInPacket(consumeInfo.ItemID)
	if(packNum < consumeInfo.ItemNum) then
		return; 
	end
	local isSucc = objItemSystem:DelEnumItemInPacket(consumeInfo.ItemID,consumeInfo.ItemNum,b_IsFirstUseBind, _G.ItemSysOperType.MatrixMethod) 
	if not isSucc then
		return;
	end
	if(self.ResData.dwSuitStarLevel > 0) then
		self:DelSuitStarEffect(self.ResData.dwSuitStarLevel)
	end
	self.ResData.dwSuitStarLevel = curSuitStarLevel + 1;
	
	if(MatrixMethodScript:GetISBroadByLevel(nil,nil,self.ResData.dwSuitStarLevel,nil)) then
		CGameApp.BroadCastSuitStarAddLevelMsg{RoleID = objPlayer:GetRoleID(),RoleName = objPlayer:GetName(),SuitLevel = self.ResData.dwSuitStarLevel};
	end
	self:AddStarAttr()
	self:AddSuitStarEffect(self.ResData.dwSuitStarLevel);
	objPlayer.OnSynCMatrixMethodSuitStarSystemMsg{RoleID = objPlayer:GetRoleID(),SuitStar = self.ResData.dwSuitStarLevel};
	self:SaveDB();
	CLogSystemManager:matrix_method(objPlayer,9,self.ResData.dwSuitStarLevel,0,5)
end

--查看对方阵法信息
function CMatrixMethodSystem:ViewOtherMatrixMethod(fromRoleID)

	local objPlayer = self:GetPlayer(); 
	if not objPlayer then
		return;
	end;
	_G.GSRemoteCall(fromRoleID, "CMatrixMethodSystem", "ViewOtherMatrixMethodInfo", {objPlayer:GetRoleID(),fromRoleID}, nil);

end

function CMatrixMethodSystem:ViewOtherMatrixMethodInfo(dwRoleId,fromRoleID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_G.GSRemoteCall(dwRoleId, "CMatrixMethodSystem", "ViewResult", {false, {6000410027},2}, nil);
		return;
	end;
	if not self:HasAuthority("MatrixMethod") then 
		_G.GSRemoteCall(dwRoleId, "CMatrixMethodSystem", "ViewResult", {true, {6000410027},1}, nil);
		return;
	end;   --是否有权限 
	local tempInfo = {};
	tempInfo.RoleID = fromRoleID;
	tempInfo.OrdinaryStar = self.OrdinaryStarTotalExpList;
	tempInfo.SuitStar = self.ResData.dwSuitStarLevel;
	tempInfo.HideStar = self.ResData.dwHideStarLevel;
	local extendSys = objPlayer:GetSystem("CKungFuExtendSystem");
	local nCount, nMaxCount;
	if extendSys then
		nCount, nMaxCount = extendSys:GetCount(KungFuEnum.MatrixMethod);
	end
	tempInfo.tCount = {nCount, nMaxCount};
	_G.GSRemoteCall(dwRoleId, "CMatrixMethodSystem", "ViewResult", {true, tempInfo,0}, nil);
end;

--返回查看结果
function CMatrixMethodSystem:ViewResult(isOK, info,Param)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CMatrixMethodSystem:ViewResult");
		return;
	end;
	if(not isOK) then
		objPlayer.OnSynMatrixMethodSysHasAutMsg{Param = Param} --- 2表示不在线
		return
	end
	if(Param == 1) then
		objPlayer.OnSynMatrixMethodSysHasAutMsg{Param = Param} --- 2表示不在线
		return
	end
	local RoleID = info.RoleID;
	local OrdinaryStar = info.OrdinaryStar;
	local SuitStar = info.SuitStar;
	local HideStar = info.HideStar;
	objPlayer.OnSynCMatrixMethodSystemMsg{RoleID = RoleID,OrdinaryStar = OrdinaryStar,HideStar=HideStar};
	objPlayer.OnSynCMatrixMethodSuitStarSystemMsg{RoleID = RoleID,SuitStar = SuitStar, tCount = info.tCount};
	objPlayer.OnSynMatrixMethodSysHasAutMsg{Param = Param} --- 0表示在线
end
----------------------------------------------消息处理------------------------------------------

----使用物品对某颗星星加经验
function CMatrixMethodSystem:UseItemOneStarAddExp(starIndex,starExp,effectIndex)
	if not self:HasAuthority("MatrixMethod") then 
		return 1 ;
	end;   --是否有权限
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return 2;
	end
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		return 4;
	end
	local tempInfo = MatrixMethodScript:GetStarAllLevelExp();
	if(self.OrdinaryStarTotalExpList[starIndex] >=tempInfo[_G.MatrixMethodMaxLevel] ) then
		sysScript:Notice(13008000004)
		return 3;
	end
	
	local maxexp = 0;
	local starMaxExp = 0;
	maxexp = self.OrdinaryStarTotalExpList[starIndex] + starExp;
	maxexp = self:GetCurStarFinalExp(maxexp,starIndex)
	self.OrdinaryStarTotalExpList[starIndex] = maxexp;
	local preLevel1 = self.OrdinaryStarLevelList[starIndex]
	local curLevel1 = self:GetCurStarCurLevel(starIndex,maxexp);
	if(curLevel1 > preLevel1) then
		self.OrdinaryStarLevelList[starIndex] = curLevel1;
		self:AddStarAttr()
		self:MatrixMethodStarAddLevel(starIndex,curLevel1,preLevel1)
		CLogSystemManager:matrix_method(objPlayer,starIndex,curLevel1,maxexp,8)
	end
	self:SaveDB();
	self:HideStarOperate()
	local RoleID = objPlayer:GetRoleID();
	local OrdinaryStar = self.OrdinaryStarTotalExpList;
	local HideStar = self.ResData.dwHideStarLevel;	
	
	objPlayer.OnSynCMatrixMethodSystemMsg{RoleID = RoleID,OrdinaryStar = OrdinaryStar,HideStar=HideStar};
	objPlayer.OnSynMatrixMethodUsedItemMsg{StarIndex = starIndex,StarTotalExp = {starExp},EffectIndex = effectIndex};
	return nil;
end
---使用物品直接升7颗星星1等级 保留当前经验
function CMatrixMethodSystem:UseItemAllStarAddLevel(starLevelNum,effectIndex)
	if not self:HasAuthority("MatrixMethod") then 
		return 1 ;
	end;   --是否有权限
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return 2;
	end
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		return 4;
	end
	local b_true = false;
	for k,v in pairs(self.OrdinaryStarLevelList) do
		if(v < _G.MatrixMethodMaxLevel) then
			b_true = true;
			break;
		end
	end
	if(not b_true) then
		sysScript:Notice(13008000005)
		return 3;
	end
	local curOrdinaryStarExp = {};
	local tempInfo = MatrixMethodScript:GetStarAllLevelExp();
	for k,v in pairs(self.OrdinaryStarLevelList) do
		if(v > 0) then
			curOrdinaryStarExp[k] = self.OrdinaryStarTotalExpList[k]  - tempInfo[v] 
		else
		    curOrdinaryStarExp[k] = self.OrdinaryStarTotalExpList[k]
		end
	end
	for k,v in pairs(self.OrdinaryStarLevelList) do
		if(self.OrdinaryStarLevelList[k] < _G.MatrixMethodMaxLevel) then
			self.OrdinaryStarLevelList[k] = self.OrdinaryStarLevelList[k]+starLevelNum;
			self:AddStarAttr()
			self:MatrixMethodStarAddLevel(k,self.OrdinaryStarLevelList[k])
		end
	end
	for k,v in pairs(self.OrdinaryStarTotalExpList) do
		if(self.OrdinaryStarLevelList[k] >= _G.MatrixMethodMaxLevel ) then
			self.OrdinaryStarTotalExpList[k] = tempInfo[self.OrdinaryStarLevelList[k]];
		else
			self.OrdinaryStarTotalExpList[k] = tempInfo[self.OrdinaryStarLevelList[k]] + curOrdinaryStarExp[k];
		end
	end
	self:HideStarOperate()
	local RoleID = objPlayer:GetRoleID();
	local OrdinaryStar = self.OrdinaryStarTotalExpList;
	local HideStar = self.ResData.dwHideStarLevel;	
	objPlayer.OnSynCMatrixMethodSystemMsg{RoleID = RoleID,OrdinaryStar = OrdinaryStar,HideStar=HideStar};
	objPlayer.OnSynMatrixMethodUsedItemMsg{StarIndex = 0,StarTotalExp = self.OrdinaryStarTotalExpList,EffectIndex = effectIndex};
	self:SaveDB();
	CLogSystemManager:matrix_method(objPlayer,1,self.OrdinaryStarLevelList[1],self.OrdinaryStarTotalExpList[1],6)
	CLogSystemManager:matrix_method(objPlayer,2,self.OrdinaryStarLevelList[2],self.OrdinaryStarTotalExpList[2],6)
	CLogSystemManager:matrix_method(objPlayer,3,self.OrdinaryStarLevelList[3],self.OrdinaryStarTotalExpList[3],6)
	CLogSystemManager:matrix_method(objPlayer,4,self.OrdinaryStarLevelList[4],self.OrdinaryStarTotalExpList[4],6)
	CLogSystemManager:matrix_method(objPlayer,5,self.OrdinaryStarLevelList[5],self.OrdinaryStarTotalExpList[5],6)
	CLogSystemManager:matrix_method(objPlayer,6,self.OrdinaryStarLevelList[6],self.OrdinaryStarTotalExpList[6],6)
	CLogSystemManager:matrix_method(objPlayer,7,self.OrdinaryStarLevelList[7],self.OrdinaryStarTotalExpList[7],6)
	return nil;
end

----使用物品直接升某颗星星1等级 保留当前经验
function CMatrixMethodSystem:UseItemOneStarAddLevel(starIndex,starLevelNum,effectIndex)
	if not self:HasAuthority("MatrixMethod") then 
		return 1 ;
	end;   --是否有权限
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return 2;
	end
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		return 4;
	end
	local curOrdinaryStarLevel = self.OrdinaryStarLevelList[starIndex];
	if(curOrdinaryStarLevel >= _G.MatrixMethodMaxLevel) then
		sysScript:Notice(13008000004)
		return 3;
	end
	local curOrdinaryStarExp = 0;
	
	local tempInfo = MatrixMethodScript:GetStarAllLevelExp();
	if(curOrdinaryStarLevel > 0) then
		curOrdinaryStarExp = self.OrdinaryStarTotalExpList[starIndex]  - tempInfo[curOrdinaryStarLevel] 
	else
	    curOrdinaryStarExp = self.OrdinaryStarTotalExpList[starIndex]
	end
	
	self.OrdinaryStarLevelList[starIndex] = self.OrdinaryStarLevelList[starIndex]+starLevelNum;
	self:AddStarAttr()
	self:MatrixMethodStarAddLevel(starIndex,self.OrdinaryStarLevelList[starIndex])
	if(self.OrdinaryStarLevelList[starIndex] >= _G.MatrixMethodMaxLevel) then
		self.OrdinaryStarTotalExpList[starIndex] = tempInfo[self.OrdinaryStarLevelList[starIndex]];
	else
	    self.OrdinaryStarTotalExpList[starIndex] = tempInfo[self.OrdinaryStarLevelList[starIndex]] + curOrdinaryStarExp;
	end
	self:HideStarOperate()
	local RoleID = objPlayer:GetRoleID();
	local OrdinaryStar = self.OrdinaryStarTotalExpList;
	local HideStar = self.ResData.dwHideStarLevel;	
	objPlayer.OnSynCMatrixMethodSystemMsg{RoleID = RoleID,OrdinaryStar = OrdinaryStar,HideStar=HideStar}; ---修改
	objPlayer.OnSynMatrixMethodUsedItemMsg{StarIndex = starIndex,StarTotalExp = {self.OrdinaryStarTotalExpList[starIndex]},EffectIndex = effectIndex};
	self:SaveDB();
	CLogSystemManager:matrix_method(objPlayer,starIndex,self.OrdinaryStarLevelList[starIndex], self.OrdinaryStarTotalExpList[starIndex],7)
	return nil;
end
----提升套装星星等级
function CMatrixMethodSystem:UseItemSuitStarAddLevel(starLevelNum)
	if not self:HasAuthority("MatrixMethod") then return end;   --是否有权限
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return 1;
	end
	if(self.ResData.dwSuitStarLevel >= self:GetSuitStarMaxLevel()) then
		return 2;
	end
	local curSuitStarLevel = self.ResData.dwSuitStarLevel + starLevelNum;
	if(curSuitStarLevel > self:GetSuitStarMaxLevel()) then
		curSuitStarLevel = self:GetSuitStarMaxLevel();
	end
	if(self.ResData.dwSuitStarLevel > 0) then
		self:DelSuitStarEffect(self.ResData.dwSuitStarLevel)
	end
	self.ResData.dwSuitStarLevel = curSuitStarLevel;
	
	if(MatrixMethodScript:GetISBroadByLevel(nil,nil,self.ResData.dwSuitStarLevel,nil)) then
		CGameApp.BroadCastSuitStarAddLevelMsg{RoleID = objPlayer:GetRoleID(),RoleName = objPlayer:GetName(),SuitLevel = self.ResData.dwSuitStarLevel};
	end
	self:AddStarAttr()
	self:AddSuitStarEffect(self.ResData.dwSuitStarLevel);
	objPlayer.OnSynCMatrixMethodSuitStarSystemMsg{RoleID = objPlayer:GetRoleID(),SuitStar = self.ResData.dwSuitStarLevel};
	self:SaveDB();
	CLogSystemManager:matrix_method(objPlayer,9,self.ResData.dwSuitStarLevel,0,9)
	return nil;
end
---拉杆逻辑处理
function CMatrixMethodSystem:OperateLogic(addExpNum,mulNum,Type)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	if(addExpNum ~= nil) then
		addExpNum = self:GetFinalAddExpNum(addExpNum);
		if(_G.MatrixMethodHideStarAddType.addExp) then
			addExpNum = addExpNum*(1 + self:GetHideAddExpPre(self.ResData.dwHideStarLevel));
		end
	else
		addExpNum = 1
	end
	local starIndex1 = 0
	local starIndex2 = 0
	local starIndex3 = 0
	local starSameNum = 0
	starSameNum,starIndex1,starIndex2,starIndex3 = self:GetSameStarInfo(mulNum)
	if(starSameNum == false) then
		return false;
	end
	local addexpInfo = MatrixMethodScript:GetMatrixMethodRanderAddExp(starSameNum,starIndex1,starIndex2,starIndex3)
	if(#addexpInfo == 0 or addexpInfo == nil) then
		_info("error MatrixMethodScript:GetMatrixMethodRanderAddExp is error",addexpInfo)
		return false;
	end
	local addexp = {};
	local maxexp = {};
	local starMaxExp = 0;
	local IsAllSame = false;----同步客户端的数据
	local SelectStar = {}; ----同步客户端的数据
	local b_addattr = false;
	if(#addexpInfo == 1) then
		IsAllSame = true;
		SelectStar[1] = {}
		SelectStar[1][1] = addexpInfo[1][1]
		SelectStar[1][2] = math.floor(addexpInfo[1][2]/3*addExpNum);
		SelectStar[2] = {}
		SelectStar[2][1] = addexpInfo[1][1]
		SelectStar[2][2] = math.floor(addexpInfo[1][2]/3*addExpNum);
		SelectStar[3] = {}
		SelectStar[3][1] = addexpInfo[1][1]
		SelectStar[3][2] = math.floor(addexpInfo[1][2]/3*addExpNum);
		maxexp[1] = self.OrdinaryStarTotalExpList[addexpInfo[1][1]] + math.floor(addexpInfo[1][2]*addExpNum);
		maxexp[1] = self:GetCurStarFinalExp(maxexp[1],addexpInfo[1][1])
		self.OrdinaryStarTotalExpList[addexpInfo[1][1]] = maxexp[1];
		local preLevel = self.OrdinaryStarLevelList[addexpInfo[1][1]]
		local curLevel = self:GetCurStarCurLevel(addexpInfo[1][1],maxexp[1]);
		if(curLevel > preLevel) then
			self.OrdinaryStarLevelList[addexpInfo[1][1]] = curLevel;
			self:MatrixMethodStarAddLevel(addexpInfo[1][1],curLevel,preLevel)
			b_addattr = true;
			CLogSystemManager:matrix_method(objPlayer,addexpInfo[1][1],curLevel,maxexp[1],Type)
		end
	elseif(#addexpInfo == 2) then
		SelectStar[1] = {}
		SelectStar[1][1] = addexpInfo[1][1]
		SelectStar[1][2] = math.floor(addexpInfo[1][2]/2*addExpNum);
		SelectStar[2] = {}
		SelectStar[2][1] = addexpInfo[1][1]
		SelectStar[2][2] = math.floor(addexpInfo[1][2]/2*addExpNum);
		SelectStar[3] = {}
		SelectStar[3][1] = addexpInfo[2][1]
		SelectStar[3][2] = math.floor(addexpInfo[2][2]*addExpNum);
		maxexp[1] = self.OrdinaryStarTotalExpList[addexpInfo[1][1]] + math.floor(addexpInfo[1][2]*addExpNum);
		maxexp[1] = self:GetCurStarFinalExp(maxexp[1],addexpInfo[1][1])
		self.OrdinaryStarTotalExpList[addexpInfo[1][1]] = maxexp[1];
		local preLevel1 = self.OrdinaryStarLevelList[addexpInfo[1][1]]
		local curLevel1 = self:GetCurStarCurLevel(addexpInfo[1][1],maxexp[1]);
		if(curLevel1 > preLevel1) then
			self.OrdinaryStarLevelList[addexpInfo[1][1]] = curLevel1;
			self:MatrixMethodStarAddLevel(addexpInfo[1][1],curLevel1,preLevel1)
			b_addattr = true;
			CLogSystemManager:matrix_method(objPlayer,addexpInfo[1][1],curLevel1,maxexp[1],Type)
		end
		maxexp[2] = self.OrdinaryStarTotalExpList[addexpInfo[2][1]] + math.floor(addexpInfo[2][2]*addExpNum);
		maxexp[2] = self:GetCurStarFinalExp(maxexp[2],addexpInfo[2][1])
		self.OrdinaryStarTotalExpList[addexpInfo[2][1]] = maxexp[2];
		local preLevel2 = self.OrdinaryStarLevelList[addexpInfo[2][1]]
		local curLevel2 = self:GetCurStarCurLevel(addexpInfo[2][1],maxexp[2]);
		if(curLevel2 > preLevel2) then
			self.OrdinaryStarLevelList[addexpInfo[2][1]] = curLevel2;
			self:MatrixMethodStarAddLevel(addexpInfo[2][1],curLevel2,preLevel2)
			b_addattr = true;
			CLogSystemManager:matrix_method(objPlayer,addexpInfo[2][1],curLevel2,maxexp[2],Type)
		end
	elseif(#addexpInfo == 3) then
		SelectStar[1] = {}
		SelectStar[1][1] = addexpInfo[1][1]
		SelectStar[1][2] = math.floor(addexpInfo[1][2]*addExpNum);
		SelectStar[2] = {}
		SelectStar[2][1] = addexpInfo[2][1]
		SelectStar[2][2] = math.floor(addexpInfo[2][2]*addExpNum);
		SelectStar[3] = {}
		SelectStar[3][1] = addexpInfo[3][1]
		SelectStar[3][2] = math.floor(addexpInfo[3][2]*addExpNum);
	    maxexp[1] = self.OrdinaryStarTotalExpList[addexpInfo[1][1]] + math.floor(addexpInfo[1][2]*addExpNum);
		maxexp[1] = self:GetCurStarFinalExp(maxexp[1],addexpInfo[1][1])
		self.OrdinaryStarTotalExpList[addexpInfo[1][1]] = maxexp[1];
		local preLevel1 = self.OrdinaryStarLevelList[addexpInfo[1][1]]
		local curLevel1 = self:GetCurStarCurLevel(addexpInfo[1][1],maxexp[1]);
		if(curLevel1 > preLevel1) then
			self.OrdinaryStarLevelList[addexpInfo[1][1]] = curLevel1;
			self:MatrixMethodStarAddLevel(addexpInfo[1][1],curLevel1,preLevel1)
			b_addattr = true;
			CLogSystemManager:matrix_method(objPlayer,addexpInfo[1][1],curLevel1,maxexp[1],Type)
		end
		maxexp[2] = self.OrdinaryStarTotalExpList[addexpInfo[2][1]] + math.floor(addexpInfo[2][2]*addExpNum);
		maxexp[2] = self:GetCurStarFinalExp(maxexp[2],addexpInfo[2][1])
		self.OrdinaryStarTotalExpList[addexpInfo[2][1]] = maxexp[2];
		local preLevel2 = self.OrdinaryStarLevelList[addexpInfo[2][1]]
		local curLevel2 = self:GetCurStarCurLevel(addexpInfo[2][1],maxexp[2]);
		if(curLevel2 > preLevel2) then
			self.OrdinaryStarLevelList[addexpInfo[2][1]] = curLevel2;
			self:MatrixMethodStarAddLevel(addexpInfo[2][1],curLevel2,preLevel2)
			b_addattr = true;
			CLogSystemManager:matrix_method(objPlayer,addexpInfo[2][1],curLevel2,maxexp[2],Type)
		end
		
		maxexp[3] = self.OrdinaryStarTotalExpList[addexpInfo[3][1]] + math.floor(addexpInfo[3][2]*addExpNum);
		maxexp[3] = self:GetCurStarFinalExp(maxexp[3],addexpInfo[3][1])
		self.OrdinaryStarTotalExpList[addexpInfo[3][1]] = maxexp[3];
		local preLevel3 = self.OrdinaryStarLevelList[addexpInfo[3][1]]
		local curLevel3 = self:GetCurStarCurLevel(addexpInfo[3][1],maxexp[3]);
		if(curLevel3 > preLevel3) then
			self.OrdinaryStarLevelList[addexpInfo[3][1]] = curLevel3;
			self:MatrixMethodStarAddLevel(addexpInfo[3][1],curLevel3,preLevel3)
			b_addattr = true;
			CLogSystemManager:matrix_method(objPlayer,addexpInfo[3][1],curLevel3,maxexp[3],Type)
		end	
	end
	if(b_addattr) then
		self:AddStarAttr()
	end
	self.ResData.dwOrdinaryStarTotalExp = self:UpdateStr(self.OrdinaryStarTotalExpList);
	self:HideStarOperate()
	self:OnSynMatrixMethodSystem(objPlayer);
	objPlayer.OnSynCMatrixMethodSystemSelectedMsg{SelectStar = SelectStar,IsAllSame = IsAllSame}
	return true;
end

----存入数据库
function CMatrixMethodSystem:SaveDB()
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	self.ResData.dwOrdinaryStarTotalExp = self:UpdateStr(self.OrdinaryStarTotalExpList);
	if(self.ResData.dwRoleID == objPlayer:GetRoleID()) then
		self.objDBQuery:UpdateDBMatrixMethod()
	else
	    self.ResData.dwRoleID = objPlayer:GetRoleID()
		self.objDBQuery:InsertDBMatrixMethod()
	end
end 
----星属性加成
function CMatrixMethodSystem:AddStarAttr()
	local suitPropertyInfo = {};
	local t_attr = _G.SSingleAttrChange:new();
	local curSuitStarLevel = self.ResData.dwSuitStarLevel;
	if(curSuitStarLevel > 0) then
		suitPropertyInfo = MatrixMethodScript:GetSuitAddAttr(curSuitStarLevel);
		for k,v in pairs (suitPropertyInfo) do
			t_attr[k] = suitPropertyInfo[k]
		end
	end
	local propertyInfo = SSingleAttrChange:new();
	local tempInfo = {}
	for i = 1,#self.OrdinaryStarLevelList do
		tempInfo = MatrixMethodScript:GetAttrByLevel(i,self.OrdinaryStarLevelList[i]);
		local fightInfo = SSingleAttrChange:new()
		for k,v in pairs (tempInfo) do
			fightInfo[k] = tempInfo[k]
		end
		propertyInfo:AddValue(fightInfo)
	end
	propertyInfo:AddValue(t_attr)
	self.skillSystem:NotifyMatrixMethod(propertyInfo); ----属性加成
end

----同步热更新
function CMatrixMethodSystem:MatrixMethodHotUpdate()
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	if(_G.MatrixMethodConfig and _G.MatrixMethodConfig.bOpen) then
		local FreeNum = self:GetFinalFreeUsedMaxNum() - self.ResData.dwUsedFreeNum
		local StarAddExpNum = _G.MatrixMethodConfig.starAddExpNum
		local ConItemNum =  _G.MatrixMethodConfig.conItemNum
		local ConGoldNum = _G.MatrixMethodConfig.conGoldNum
		objPlayer.OnSynCMatrixMethodDataMsg{FreeNum = FreeNum,StarAddExpNum = StarAddExpNum,ConItemNum = ConItemNum,ConGoldNum = ConGoldNum}
	end
end

----每日清空免费拉杆次数
function CMatrixMethodSystem:MatrixMethodClearFreeNum()
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	self.ResData.dwUsedFreeNum = 0;
	local FreeNum = self:GetFinalFreeUsedMaxNum() - self.ResData.dwUsedFreeNum
	self:SaveDB();  ----存入数据库
	objPlayer.OnSynCMatrixMethodCurFreeNumMsg{FreeNum = FreeNum}
end

----加套装星星特效
function CMatrixMethodSystem:AddSuitStarEffect(curSuitStarLevel)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	local dwPfxCfg = 0;
	dwPfxCfg = MatrixMethodScript:GetSuitEffectIDByLevel(curSuitStarLevel)
	objPlayer:AddViewPfx(dwPfxCfg);
end
---减上个套装星星特效
function CMatrixMethodSystem:DelSuitStarEffect(curSuitStarLevel)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	local dwPfxCfg = 0;
	dwPfxCfg = MatrixMethodScript:GetSuitEffectIDByLevel(curSuitStarLevel)
	objPlayer:RmvViewPfx(dwPfxCfg)
end
----隐元星升级处理
function CMatrixMethodSystem:HideStarOperate()
	local preHideStarLevel = self.ResData.dwHideStarLevel;
	local curHideStarLevel = MatrixMethodScript:GetCurHideSuitLevel(self.OrdinaryStarLevelList)
	if(curHideStarLevel > preHideStarLevel ) then
		self.ResData.dwHideStarLevel = curHideStarLevel;
		self:MatrixMethodHideStarAddLevel(curHideStarLevel);
		local objPlayer = self:GetPlayer();
		if(not objPlayer) then
			return;
		end
		CLogSystemManager:matrix_method(objPlayer,8,curHideStarLevel,0,4)
	end
end

----获取所有星斗平均等级
function CMatrixMethodSystem:GetAllStarAveragegLevel()
	local allLevel = 0;
	for i = 1,#self.OrdinaryStarLevelList do
		allLevel = allLevel + self.OrdinaryStarLevelList[i];
	end
	allLevel = allLevel + self.ResData.dwSuitStarLevel;
	allLevel = allLevel + self.ResData.dwHideStarLevel;
	local averageLevel = math.floor(allLevel/9);
	return averageLevel;
end
