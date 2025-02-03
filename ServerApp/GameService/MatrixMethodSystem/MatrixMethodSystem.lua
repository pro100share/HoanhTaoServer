--[[
功能：阵法系统类
作者：魏云
时间：2013-10-29
--]]

_G.CMatrixMethodSystem = {};
----系统类
function CMatrixMethodSystem:new()
	local obj = CSystem:new("CMatrixMethodSystem");
	obj.objDBQuery = nil;    --对应的数据库操作模块
	for i,v in pairs(CMatrixMethodSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end
	end
	return obj;
end

---系统创建
function CMatrixMethodSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		return;
	end;
	self.objDBQuery = CMatrixMethodSystemDB:new(objDB, self);
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	if not skillSystem then
		return;
	end
	self.skillSystem = skillSystem;
	if not CConfig.bIsCrossSvr then
		local objVipSys = objPlayer:GetSystem('CVipSystem')
		objVipSys:AddSys(self)
	end;
	self.ResData ={};-----数据库信息
	self:InitResData();
	--如果是跨服战
	if bIsChangeLine == 2 then
		local Data = objPlayer:GetLineData("CMatrixMethodSystem") or {};
		--local Data = objPlayer:GetCrossSvrData("CMatrixMethodSystem") or {};
		if(#Data == 0) then
			return;
		end
		if(Data[1].dwRoleID ~= nil) then
			self.ResData.dwRoleID = Data[1].dwRoleID;
			self.ResData.dwHideStarLevel = Data[1].dwHideStarLevel;
			self.ResData.dwSuitStarLevel = Data[1].dwSuitStarLevel;
			self.OrdinaryStarTotalExpList = self:LoadStr(self.ResData.dwOrdinaryStarTotalExp);
			self.OrdinaryStarLevelList = self:GetOrdinaryStarLevelList(self.OrdinaryStarTotalExpList);
			self:InitAttribute();
		end
	else
		local Data =  objPlayer:GetLineData("CMatrixMethodSystem") or {};
		if(#Data == 0) then
			return;
		end
		if(Data[1].dwRoleID ~= nil) then
			self.ResData.dwRoleID = Data[1].dwRoleID;
			self.ResData.dwOrdinaryStarTotalExp = Data[1].dwOrdinaryStarTotalExp;
			self.ResData.dwSuitStarLevel = Data[1].dwSuitStarLevel;
			self.ResData.dwHideStarLevel = Data[1].dwHideStarLevel;
			self.ResData.dwUsedFreeNum = Data[1].dwUsedFreeNum;
			self.OrdinaryStarTotalExpList = self:LoadStr(self.ResData.dwOrdinaryStarTotalExp);
			self.OrdinaryStarLevelList = self:GetOrdinaryStarLevelList(self.OrdinaryStarTotalExpList);
			self:InitAttribute();
		end
	end
	self:MatrixMethodHotUpdate()
	if(self.ResData.dwSuitStarLevel > 0) then
		self:AddSuitStarEffect(self.ResData.dwSuitStarLevel)
	end
end
function CMatrixMethodSystem:InitResData()
	self.ResData.dwRoleID = 0;
	self.ResData.dwOrdinaryStarTotalExp = "";
	self.ResData.dwSuitStarLevel = 0;
	self.ResData.dwHideStarLevel = 0;
	self.HideStarCurLevel = 0;
	self.ResData.dwUsedFreeNum = 0;
	self.OrdinaryStarTotalExpList = {0,0,0,0,0,0,0}; -----初始化七颗星各个总经验数
	self.OrdinaryStarLevelList = {0,0,0,0,0,0,0};
end

----初始化属性加成
function CMatrixMethodSystem:InitAttribute()
	self:AddStarAttr()
end
function CMatrixMethodSystem:Destroy()
end
----进入换线
function CMatrixMethodSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end
	self.ResData.dwOrdinaryStarTotalExp = self:UpdateStr(self.OrdinaryStarTotalExpList);
	objPlayer:SetLineData("CMatrixMethodSystem",self.ResData);
end
-----换跨服战场
function CMatrixMethodSystem:OnEnterCrossBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end
	local tb = {};
	tb.dwRoleID = self.ResData.dwRoleID;
	tb.dwHideStarLevel = self.ResData.dwHideStarLevel;
	tb.dwSuitStarLevel = self.ResData.dwSuitStarLevel
	objPlayer:SetCrossSvrData("CMatrixMethodSystem",tb);
end;

--进入场景同步信息
function CMatrixMethodSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end
	self:OnSynMatrixMethodSystem(objPlayer);
	objPlayer.OnSynCMatrixMethodSuitStarSystemMsg{RoleID = objPlayer:GetRoleID(),SuitStar = self.ResData.dwSuitStarLevel};
end
---检查摘星换斗条件
function CMatrixMethodSystem:CheckMoveStarButRanderStarCondition()
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return false,{};
	end
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return false,{};
	end
	local moveConInfo = MatrixMethodScript:GetMoveConInfo()
	if(moveConInfo.ItemID <= 0 or moveConInfo.ItemNum <= 0) then
		return false ,{}
	end
	local packNum = objItemSystem:GetEnumItemNumInPacket(moveConInfo.ItemID)
	if(packNum < moveConInfo.ItemNum) then  ----背包中的消耗物品数量不够
		return false,{};
	end
	return true,moveConInfo;
end
---检查拉杆条件
function CMatrixMethodSystem:CheckOperateRanderStarCondition(addExpNum,b_isGold,b_IsAutoBuy,b_IsUseGold,b_IsFirstUseBind)
	local b_Over = false;
	b_Over = self:CheckAddExpNumIsOver(addExpNum);  
	if(b_Over) then
		return false,{};
	end
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return false,{};
	end
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return false,{};
	end
	addExpNum = _G.MatrixMethodExpMultiplyConfig[addExpNum]
	local consumeInfo = MatrixMethodScript:GetConInfo()  --ItemID ,ItemNum,GoldNum
	if(b_isGold) then ----元宝拉杆
		if(consumeInfo.GoldNum <= 0) then
			return false,{};
		end
		if(addExpNum > 0) then
			consumeInfo.GoldNum = consumeInfo.GoldNum*addExpNum;
		end
		consumeInfo.GoldNum = consumeInfo.GoldNum*self:GetConGoldNum();
		if(not objItemSystem:IsGoldEnough(consumeInfo.GoldNum)) then
			return false,{};
		end
		local tempConsumeInfo = {GoldNum = consumeInfo.GoldNum,ItemID = 0,ItemNum = 0}
		return true,tempConsumeInfo 
	end
	---物品拉杆
	if(consumeInfo.ItemID <= 0 or consumeInfo.ItemNum <= 0) then
		return false ,{}
	end
	if(addExpNum > 0) then
		consumeInfo.ItemNum = consumeInfo.ItemNum*addExpNum;
	end
	consumeInfo.ItemNum = consumeInfo.ItemNum*self:GetConItemNum()
	local b_IsEnough_1, n_Minus_1 = objItemSystem:CheckDelEnumItemInPacketCond(consumeInfo.ItemID, consumeInfo.ItemNum);
	local autoBuyInfo = {};
	if(not b_IsEnough_1) then  ----背包中的消耗物品数量不够
		if(not b_IsAutoBuy) then
			return false,{};
		else------自动购买物品
			local t = {};
			t.dwItemEnum 	= consumeInfo.ItemID;
			t.dwItemNumber 	= n_Minus_1;
			table.insert(autoBuyInfo, t);
		end
	end
	-----自动购买物品处理逻辑
	--------如果自动购买列表不为空则执行自动购买逻辑
	if #autoBuyInfo > 0 then
		local mallSystem = objPlayer:GetSystem("CMallSystem");
		if not mallSystem then
			return false,{};
		end;
		if b_IsUseGold then
			for k, v in pairs(autoBuyInfo) do
				local buySuc = mallSystem:BuyItemByIDGold(v.dwItemNumber, v.dwItemEnum)
				if not buySuc then
					return false,{};
				end;
			end;
		else
			for k, v in pairs(autoBuyInfo) do
				local buySuc = mallSystem:BuyItemByIDBindGold(v.dwItemNumber, v.dwItemEnum)
				if not buySuc then
					return false,{};
				end;
			end;
		end
		--------检测背包中是否有足够物品
		local packNum = objItemSystem:GetEnumItemNumInPacket(consumeInfo.ItemID)
		if(packNum < consumeInfo.ItemNum) then  ----背包中的消耗物品数量不够
			return false,{};
		end
	end
	local tempConsumeInfo = {GoldNum = 0,ItemID = consumeInfo.ItemID,ItemNum = consumeInfo.ItemNum};
	return true,tempConsumeInfo
end
----扣除摘星换斗物品
function CMatrixMethodSystem:TaskOffMoveStarButConsumeInfo(moveConInfo)
	if(moveConInfo.ItemID == nil or moveConInfo.ItemNum == nil) then
		return false;
	end
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return false;
	end
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return false;
	end
	--删除物品消耗
	local isSucc = objItemSystem:DelEnumItemInPacket(moveConInfo.ItemID,moveConInfo.ItemNum,b_IsFirstUseBind, _G.ItemSysOperType.MatrixMethod) 
	if not isSucc then
		return false;
	end
	return true;
end
---扣除消耗物品信息
function CMatrixMethodSystem:TaskOffSelfOperateConsumeInfo(consumeInfo,b_IsFirstUseBind)
	if(consumeInfo.GoldNum == nil or consumeInfo.ItemID == nil or consumeInfo.ItemNum == nil) then
		return false;
	end
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return false;
	end
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return false;
	end
	if(consumeInfo.GoldNum > 0 and consumeInfo.ItemID <= 0 and consumeInfo.ItemNum <= 0) then ---使用元宝拉杆
		if(not objItemSystem:CostGold(consumeInfo.GoldNum,_G.ItemSysOperType.MatrixMethod)) then ---扣相应元宝数
			return false;
		end
		return true;
	end
	if(consumeInfo.GoldNum <= 0 and  consumeInfo.ItemID > 0 and consumeInfo.ItemNum > 0) then ---使用物品拉杆
		--删除物品消耗
		local isSucc = objItemSystem:DelEnumItemInPacket(consumeInfo.ItemID,consumeInfo.ItemNum,b_IsFirstUseBind, _G.ItemSysOperType.MatrixMethod) 
		if not isSucc then
			return false;
		end
		return true;
	end
	_info("error consumeInfo is error",consumeInfo.GoldNum,consumeInfo.ItemID,consumeInfo.ItemNum)
	return false;
end
---获取当前星星的最终经验
function CMatrixMethodSystem:GetCurStarFinalExp(addexp,starIndex)
	local starMaxExp = self:GetCurStarMaxExp(starIndex);
	if(addexp > starMaxExp) then
		addexp = starMaxExp;
	end
	return addexp;
end
---获取相同星星信息
function CMatrixMethodSystem:GetSameStarInfo(mulNum)
	local weightValueList ={};
	for i,j in pairs(_G.MatrixMethodWeightValueConfig) do
		weightValueList[i] = {};
		weightValueList[i][1] = j[1];
		weightValueList[i][2] = j[2];
		weightValueList[i][3] = j[3];
	end
	for k,v in pairs(_G.MatrixMethodStarConfig) do
		if(self.OrdinaryStarTotalExpList[k] >= self:GetCurStarMaxExp(k)) then
			for m,n in pairs(weightValueList) do
				if(m == k) then
					n[1]=nil
					break;
				end
			end
		end
	end
	local tempWeightValueList = {};
	for k,v in pairs(weightValueList) do
		if(v[1]) then
			tempWeightValueList[k] = v;
		end
	end
	local randerStarInfo = MatrixMethodScript:GetMatrixMethodStarValue(mulNum,tempWeightValueList); ---随机出三颗星星
	if(type(randerStarInfo) ~= 'table' or #randerStarInfo == 0 or #randerStarInfo < mulNum) then
		_info("error MatrixMethodScript:GetMatrixMethodStarValue is error",randerStarInfo)
		return false,0,0,0;
	end
	local starIndex1 = 0
	local starIndex2 = 0
	local starIndex3 = 0
	local starSameNum = 1
	local tempInfo = {}
	for i = 1,#randerStarInfo do
		for j = #randerStarInfo-1,i,-1 do
			if(randerStarInfo[j+1] >= randerStarInfo[j] ) then
				tempInfo = randerStarInfo[j+1];
				randerStarInfo[j+1] = randerStarInfo[j];
				randerStarInfo[j] = tempInfo;
			end
		end
	end
	if(#randerStarInfo == 3) then
		if(randerStarInfo[1] == randerStarInfo[2]) then
			starSameNum = starSameNum + 1
			starIndex1 = randerStarInfo[1];
			if(randerStarInfo[1] == randerStarInfo[3]) then
				starSameNum = starSameNum + 1
			else
			    starIndex2 = randerStarInfo[3];
			end
		elseif(randerStarInfo[2] == randerStarInfo[3]) then
			starSameNum = starSameNum + 1
			starIndex1 = randerStarInfo[2];
			starIndex2 = randerStarInfo[1];
	    else
		    starIndex1 = randerStarInfo[1];
			starIndex2 = randerStarInfo[2];
			starIndex3 = randerStarInfo[3];
		end
	elseif(#randerStarInfo == 1) then
		starSameNum = 3;
		starIndex1 = randerStarInfo[1];
		starIndex2 = 0;
		starIndex3 = 0;
	end
	return starSameNum,starIndex1,starIndex2,starIndex3
end
---获取隐元星星的最大等级
function CMatrixMethodSystem:GetHideStarMaxLevel()
	return #MatrixMethodHideStarInfoConfig;
end
function CMatrixMethodSystem:GetSuitStarMaxLevel()
	return #MatrixMethodBasicStarSuitAttrConfig
end
---获取当前星星最大经验
function CMatrixMethodSystem:GetCurStarMaxExp(curStarIndex)
	local tempInfo = MatrixMethodScript:GetStarAllLevelExp();
	return tempInfo[_G.MatrixMethodMaxLevel];
	
end
---获取当前星星等级
function CMatrixMethodSystem:GetCurStarCurLevel(curStarIndex,curTotalExp)
	return MatrixMethodScript:GetCurStarCurLevel(curTotalExp)
end
---获取当前普通星星的等级列表
function CMatrixMethodSystem:GetOrdinaryStarLevelList(totalExp)
	local starLevelList = {};
	for i = 1,#totalExp do
		starLevelList[i] = self:GetCurStarCurLevel(i,totalExp[i])
	end
	return starLevelList;
end
---当前星星经验加成百分比
function CMatrixMethodSystem:GetHideAddExpPre(hideLevel)
	for k,v in pairs(_G.MatrixMethodHideStarInfoConfig) do
		if(k == hideLevel) then
			return v/100
		end
	end
	return 0;
end
---检查翻倍索引正确与否
function CMatrixMethodSystem:CheckAddExpNumIsOver(addExpNum)
	local b_ok = true;
	for k,v in pairs(_G.MatrixMethodExpMultiplyConfig) do
		if(addExpNum == k) then
			b_ok = false;
			break;
		end
	end
	return b_ok;
end
---加载字符串 转换为 table
function CMatrixMethodSystem:LoadStr(str)
	if(str == nil) then
		return false;
	end
	local b = {};
	local lastIndex = 0;
	local index = 1;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local value = tonumber(str1);
		b[index] = value;
		index = index + 1;
	end;
	return b;
end

---更新字符串
function CMatrixMethodSystem:UpdateStr(str)
	local strResult = ""
	for i = 1,#str do
		 strResult =  strResult..str[i]..";"
	end
	return strResult
end;

----获取热更新数据
function CMatrixMethodSystem:GetHotUpdateValueInfo()
	if(_G.MatrixMethodConfig and _G.MatrixMethodConfig.bOpen) then
		return _G.MatrixMethodConfig;
	end
	return nil;
end

----获取最终的经验加倍数
function CMatrixMethodSystem:GetFinalAddExpNum(addExpNum)
	if(self:GetHotUpdateValueInfo()) then
		return _G.MatrixMethodConfig.starAddExpNum[addExpNum];
	else
		return _G.MatrixMethodExpMultiplyConfig[addExpNum];
	end
	return nil;
end
---获取拉杆消耗物品的百分比
function CMatrixMethodSystem:GetConItemNum()
	if(self:GetHotUpdateValueInfo()) then
		return _G.MatrixMethodConfig.conItemNumPre/100;
	end
	return 1;
end
---获取拉杆消耗元宝的百分比
function CMatrixMethodSystem:GetConGoldNum()
	if(self:GetHotUpdateValueInfo()) then
		return _G.MatrixMethodConfig.conGoldNum/100;
	end
	return 1;
end
----获取最终免费拉杆最大数
function CMatrixMethodSystem:GetFinalFreeUsedMaxNum()
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return nil;
	end
	if CConfig.bIsCrossSvr then
		return 0;
	end;
	local freeMaxNum = 0;
	local isVip = objPlayer:GetSystem("CVipSystem"):isVip();
	
	if(self:GetHotUpdateValueInfo()) then
		if(isVip) then
			freeMaxNum = _G.MatrixMethodConfig.freeMaxNum+ _G.MatrixMethodVipFreeUsedNumConfig + _G.MatrixMethodFreeUsedMaxNumConfig;
		else
			freeMaxNum = _G.MatrixMethodConfig.freeMaxNum + _G.MatrixMethodFreeUsedMaxNumConfig;
		end
		
	else
		if(isVip) then
			freeMaxNum = _G.MatrixMethodFreeUsedMaxNumConfig+ _G.MatrixMethodVipFreeUsedNumConfig;
		else
			freeMaxNum = _G.MatrixMethodFreeUsedMaxNumConfig;
		end
	end
	return freeMaxNum;
	
end
---普通星升级广播
function CMatrixMethodSystem:MatrixMethodStarAddLevel(starIndex,starLevel,preLevel)
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	if(MatrixMethodScript:GetISBroadByLevel(starIndex,starLevel,nil,nil,preLevel)) then
		CGameApp.BroadCastStarAddLevelMsg{RoleID = objPlayer:GetRoleID(),RoleName = objPlayer:GetName(),StarIndex = starIndex,StarLevel =starLevel}
	end
end

----隐元星升级广播
function CMatrixMethodSystem:MatrixMethodHideStarAddLevel(starLevel)
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	if(MatrixMethodScript:GetISBroadByLevel(nil,nil,nil,starLevel)) then
		CGameApp.BroadCastHideStarAddLevelMsg{RoleID = objPlayer:GetRoleID(),RoleName = objPlayer:GetName(),HideLevel = starLevel}
	end
end
function CMatrixMethodSystem:CheckCanNotUsedMatrixMethod()
	local b_ok = false
	for k,v in pairs(_G.MatrixMethodStarConfig) do
		if(self.OrdinaryStarTotalExpList[k] < self:GetCurStarMaxExp(k)) then
			b_ok =true;
			break;
		end
	end
	return b_ok;
end

function CMatrixMethodSystem:OnVipChange(bState)
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	local freeNum = 0
	freeNum = self:GetFinalFreeUsedMaxNum() - self.ResData.dwUsedFreeNum;
	objPlayer.OnSynCMatrixMethodCurFreeNumMsg{FreeNum = freeNum}
end









