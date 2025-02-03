-- 功法系统

local function ParseStr(str, t)
	local lastIndex = 0;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local m = string.find(str1, ",", 1);
		if not m then
			_err("----------------");
		end;
		local str2 = string.sub(str1, 1, m - 1);
		local str3 = string.sub(str1, m + 1);
		local key = tonumber(str2);
		local value = tonumber(str3);
		if not key or not value then
			_err("!@#!$%%", str2, str3);
		end;
		t[key] = value;
	end;
end;

_G.CKungFuSystem = {};

function CKungFuSystem:new()
	local obj = CSystem:new("CKungFuSystem");
	
	--功法的学习进度
	obj.studyProcess = {};
	for i,v in pairs(CKungFuSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;

function CKungFuSystem:Create(bIsChangeLine)
	--每个系统创建时都会挂接到自己的管理者player身上
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CKungFuSystem Create Cannot get player");
		return false;
	end;
	--需要调用player的基础道具系统
	self.ItemSystem = objPlayer:GetSystem("CItemSystem");
	if not self.ItemSystem then
		_err("CKungFuSystem Create Cannot get ItemSystem");
		return false;
	end;
	--天官赐福系统
	if not CConfig.bIsCrossSvr then
		self.TianGuanCiFuSystem = objPlayer:GetSystem("CTianGuanCiFuSystem");
		if not self.TianGuanCiFuSystem then
			_err("CKungFuSystem Create Cannot get TianGuanCiFuSystem----");
			return false;
		end;
	end;
	
	--技能系统
	self.SkillSystem = objPlayer:GetSystem("CSkillSystem");
	if not self.SkillSystem then
		_err("CKungFuSystem Create Cannot get SkillSystem----");
		return false;
	end;
	
	--初始化DB模块
	if not CConfig.bIsCrossSvr then
		local objDB = objPlayer:GetDBQuery();
		if not objDB then
			_err("CMountSystem Create Cannot get DBQuery");
			return false;
		end;
		self.objDBQuery = CKungFuSystemDB:new(objDB, self);
	end;
	--读取信息
	local Data	= objPlayer:GetLineData("CKungFuSystem")[1];
		
	if bIsChangeLine == 2 then
		Data = objPlayer:GetLineData("CKungFuSystem")[1];
		--Data = objPlayer:GetCrossSvrData("CKungFuSystem")[1];
	end
	
	if not Data then
		_err("CKungFuSystem Create CanNot GetLineData!!!");
		Data = {}
	end;
	
	--功法学习进度
	if Data[1] then
		ParseStr(Data[1], self.studyProcess);
	else
		--print("CKungFuSystem insert DBdata");
		for k, v in pairs(_G.KungFuList) do
			if type(k) == "number" then
				self.studyProcess[k] = 0;
			end
		end;
		
		local db_Info = {};
		
		db_Info.s_StudyProcess = "";
		for kungFuId, process in pairs(self.studyProcess) do
			db_Info.s_StudyProcess = db_Info.s_StudyProcess .. kungFuId .. "," .. process .. ";";
		end;
		if not CConfig.bIsCrossSvr then
			self.objDBQuery:InsertKungFuSysInfo(db_Info);
		end;
	end;
	
	self:AttributeChange();
	self:IntensifySkill();
	
	return true;
end;

function CKungFuSystem:Destroy()
end;

function CKungFuSystem:Update()
	
end;

function CKungFuSystem:OnEnterScene()
	--同步信息
	self:SynStudyProcess();
	self:SynTianGuanCiFu();
end;

--换线开始
function CKungFuSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	local Data = {};
	
	local s_StudyProcess = "";
	for kungFuId, process in pairs(self.studyProcess) do
		s_StudyProcess = s_StudyProcess .. kungFuId .. "," .. process .. ";";
	end;
	
	Data[1] = s_StudyProcess;
	
	objPlayer:SetLineData("CKungFuSystem", Data);
	self:DealBreakPro();
end
--死亡处理
function CKungFuSystem:OnDead(dwEnemyType,dwEnemyID)
	self:DealBreakPro()
end;


function CKungFuSystem:OnEnterCrossBegin()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	local Data = {};
	
	local s_StudyProcess = "";
	for kungFuId, process in pairs(self.studyProcess) do
		s_StudyProcess = s_StudyProcess .. kungFuId .. "," .. process .. ";";
	end;
	
	Data[1] = s_StudyProcess;
	
	--objPlayer:SetLineData("CKungFuSystem", Data);
	objPlayer:SetCrossSvrData("CKungFuSystem", Data);	
end;

--处理打断合成
function CKungFuSystem:DealBreakPro()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.OnDeadBreakKungFuMsg{};
end;
---------------------------------------------------------------------------------------------------------------------------------

function CKungFuSystem:Study(KungFuID,IsUseGold,IsUseUnBindFirst,IsAutoBuy,NeedItem,dwLevel)
	--检测权限
	if not self:HasAuthority("YiJinJing") then
		--print("KungFuSystem has no Authority!")
		return; 
	end;
	
	if not _G.KungFuList[KungFuID] then
		-- print("_G.KungFuList dont have  KungFuID ".. KungFuID)
		return;
	end
	--如果已经完全领悟本功法 则返回
	if self.studyProcess[KungFuID] >= #_G.KungFuList[KungFuID].zhaoshi then return end;

	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CKungFuSystem:Study()");
		return;
	end;
	
	--获取要学习的招式ID
	local studyZhaoshiID = self.studyProcess[KungFuID];
	studyZhaoshiID = studyZhaoshiID + 1;
	
	if not _G.KungFuList[KungFuID].zhaoshi[studyZhaoshiID] then
		-- print("_G.KungFuList dont have  KungFuID ".. KungFuID.."zhaoshiID "..studyZhaoshiID);
		return;
	end;
	
	
	local isSuc = false;
	if NeedItem then
		local zhaoshiCfg = _G.KungFuList[KungFuID].zhaoshi[studyZhaoshiID];
		local upLevelNeedCfg = zhaoshiCfg.upLevelNeed;
		
		--------检测背包中是否有足够的消耗材料
		local b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(upLevelNeedCfg.itemEnumId, upLevelNeedCfg.itemCount);
		
		--------用于自动购买
		local autoBuyInfo = {};
		if not b_IsEnough_1 then
			if IsAutoBuy then
				local t = {};
				t.dwItemEnum 	= upLevelNeedCfg.itemEnumId;
				t.dwItemNumber 	= n_Minus_1;
				table.insert(autoBuyInfo, t);
			else--材料不够而且不是自动购买则返回
				return;
			end;
		end;
		--------如果自动购买列表不为空则执行自动购买逻辑
		if #autoBuyInfo > 0 then
			local mallSystem = objPlayer:GetSystem("CMallSystem");
			if not mallSystem then
				_err("KungFuSystem get mallSystem error!!!");
				return;
			end;
			if IsUseGold then
--			local n_Result, n_Cost = mallSystem:CanBuyItemListGold(autoBuyInfo);
--			if n_Result > 0 then return end;
				for k, v in pairs(autoBuyInfo) do
					local buySuc = mallSystem:BuyItemByIDGold(v.dwItemNumber, v.dwItemEnum)
					if not buySuc then
						_err("auto buy error!!!");
						return
					end;
				end;
			else
--			local n_Result, n_Cost = mallSystem:CanBuyItemListBindGold(autoBuyInfo);
--			if n_Result > 0 then return end;
				for k, v in pairs(autoBuyInfo) do
					local buySuc = mallSystem:BuyItemByIDBindGold(v.dwItemNumber, v.dwItemEnum)
					if not buySuc then
						_err("auto buy error!!!");
						return
					end;
				end;
			end
			--------检测背包中是否有足够神龙果
			b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(upLevelNeedCfg.itemEnumId, upLevelNeedCfg.itemCount);
			if not b_IsEnough_1 then return end;
		end;
		
		----删除各种石头--删除物品通知
		self.ItemSystem:DelEnumItemInPacket(upLevelNeedCfg.itemEnumId, upLevelNeedCfg.itemCount, IsUseUnBindFirst, _G.ItemSysOperType.KungFuStudy);
		--天官赐福
		
		isSuc = self.TianGuanCiFuSystem:IsKungFuStudyMax();
		if not isSuc then
			--成功率
			local n_SuccessRate	= _G.KungFuList.S_SuccessRate(KungFuID, studyZhaoshiID, self.TianGuanCiFuSystem:Get_KungFuStudy());
			if math.random(1, 10000) <= n_SuccessRate then
				isSuc = true;
			end;
		end;
	else
		isSuc = true;
		studyZhaoshiID = dwLevel;
	end
	
	
	
	if isSuc then
		--日志记录
		local dwBegin = self.TianGuanCiFuSystem:Get_KungFuStudy();
		local dwEnd = 0;
		CLogSystemManager:cifu(objPlayer, 6, KungFuID * 100 + studyZhaoshiID, 1, dwBegin, dwEnd);
		self.TianGuanCiFuSystem:Set_KungFuStudy(0, false);
		-----------------
		self.studyProcess[KungFuID] = studyZhaoshiID;
		self:SynStudyProcess();
		
		--存数据库和AttributeChange()
		self:AttributeChange();
		self:IntensifySkill();
		self:AddSkill();
		local db_Info = {};
		db_Info.s_StudyProcess = "";
		for kungFuId, process in pairs(self.studyProcess) do
			db_Info.s_StudyProcess = db_Info.s_StudyProcess .. kungFuId .. "," .. process .. ";";
		end;
		self.objDBQuery:UpdateKungFuSysInfo(db_Info);
		
		local playerRoleID = objPlayer:GetRoleID();
		local playerName = objPlayer:GetName();
		--广播
		--广播类型  1 = 功法升级广播, 2 = 功法满级广播
		if studyZhaoshiID >= _G.KungFuList[KungFuID].beginBroadcastZhaoshiID then
			local castType = 1 
			if studyZhaoshiID >= #_G.KungFuList[KungFuID].zhaoshi then
				castType = 2 
			end
	
			local setNet = {};
			for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
				table.insert(setNet, objPlayer.objNet);
			end;
			_groupcallout(setNet, "CltStudyKungFuSucessCastMsg", {CastType = castType, RoleID = playerRoleID, RoleName = playerName, KungFuID = KungFuID, ZhaoshiID = studyZhaoshiID});
			
			--CGameApp.ServStudyKungFuSuccessCastMsg{CastType = castType, RoleID = playerRoleID,RoleName = playerName,KungFuID = KungFuID, ZhaoshiID = studyZhaoshiID}
		end
		
		--通知事件中心
		objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventStudyKungFu,1, self.studyProcess);
	else
        --增加天官赐福
		self.TianGuanCiFuSystem:Add_KungFuStudy(KungFuID, studyZhaoshiID);
	end;
	objPlayer.KungFuSys_StudyResultMsg{IsSuc = isSuc, StudyKungFuID = KungFuID, StudyZhaoshiID = studyZhaoshiID};
end;

--功法进度变化影响人物属性变化
function CKungFuSystem:AttributeChange()
	if self.SkillSystem then
		local t_attr = _G.SSingleAttrChange:new();
		
		for k, v in pairs(self.studyProcess) do
			if v == 0 then break end;
			if _G.KungFuList[k] then 
				if _G.KungFuList[k].zhaoshi[v] then
					local addAttrCfg = _G.KungFuList[k].zhaoshi[v].addAttr;
					t_attr.dwHPMax	= t_attr.dwHPMax + addAttrCfg.n_ShengMing;	--生命max
					t_attr.dwMPMax	= t_attr.dwMPMax + addAttrCfg.n_NeiLi;		--内力max
					t_attr.dwAttack	= t_attr.dwAttack + addAttrCfg.n_GongJi;		--攻击
					t_attr.dwDefense = t_attr.dwDefense + addAttrCfg.n_FangYu;		--防御
					t_attr.dwFlee	= t_attr.dwFlee + addAttrCfg.n_ShenFa;		--身法
					t_attr.dwCrit	= t_attr.dwCrit + addAttrCfg.n_BaoJi;		--暴击
				end
			end
		end
		
		self.SkillSystem:NotifyKungFuUpdate(t_attr);
	end
end;


--功法进度变化会提升被动技能的层数（如果未学习技能 则等到学习技能以后再累加）
function CKungFuSystem:IntensifySkill()
	if self.SkillSystem then
		local skillTab = {};
		for kungfuId, process in pairs(self.studyProcess) do
			if _G.KungFuList[kungfuId] then
				local zhaoshiCfg = _G.KungFuList[kungfuId].zhaoshi
				for i = 1, process do
					for skillEnumId, skillAddValue in pairs(zhaoshiCfg[i].intensifySkill) do
						--print("************skillEnumId is "..skillEnumId.." skillAddValue is "..skillAddValue)
						if not skillTab[skillEnumId] then
							--print("not "..skillAddValue)
							skillTab[skillEnumId] = skillAddValue
						elseif skillAddValue > skillTab[skillEnumId] then
							--print("yes "..skillTab[skillEnumId].." and "..skillAddValue)
							skillTab[skillEnumId] = skillAddValue
						end
					end	
				end
			end
		end
		
		self.SkillSystem:SetSkillLevel(skillTab, "CKungFuSystem")
	end
end;

function CKungFuSystem:AddSkill()
	if self.SkillSystem then
		local roleSkillTab = self.SkillSystem:GetAllSkill()
		local skillTab = {}
		for kungfuId, process in pairs(self.studyProcess) do
			if _G.KungFuList[kungfuId] then
				local zhaoshiCfg = _G.KungFuList[kungfuId].zhaoshi[process]
				if zhaoshiCfg then
					for skillEnumId, skillAddValue in pairs(zhaoshiCfg.addSkill) do
						if skillAddValue ~= 0 then
							--如果未学习次技能就开始学习
							if not roleSkillTab[skillEnumId] then
								self.SkillSystem:DoAddSkill(skillEnumId)
							end
							self.SkillSystem:ChangeSkill(skillEnumId, skillAddValue)
						end
					end
				end
			end
		end
	end
end;

--同步天官赐福值
function CKungFuSystem:SynTianGuanCiFu()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CKungFuSystem Cannot get player SynTianGuanCiFu");
		return;
	end;
	if not CConfig.bIsCrossSvr then
		--装备升阶天官赐福
		local n_Value = self.TianGuanCiFuSystem:Get_KungFuStudy();
		local restTime = self:GetRestTime();
		objPlayer.KungFuSys_SynTianGuanCiFuMsg{KungFuStudy = n_Value, RestTime = restTime};
	end;
end;

function CKungFuSystem:GetRestTime()
	local endTime = CTimeFormat:GetTodayThisTimeMsec(6, 0);
	local restTime = 0;
	
	if GetCurTime() < endTime then
		restTime = endTime - GetCurTime();
	end;	
	if GetCurTime() > endTime then
		restTime = 24 * 60 * 60 * 1000 - (GetCurTime() - endTime);
	end;
	return restTime;
end;

--同步领悟进度
function CKungFuSystem:SynStudyProcess()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CKungFuSystem Cannot get player SynStudyProcess");
		return;
	end;
	
	objPlayer.KungFuSys_SynStudyProcessMsg{StudyProcess = self.studyProcess};
end;

--返回增加的技能等级
function CKungFuSystem:GetAddSikllLevel(dwKungFuId)
	local retLevel = KungFuList.GetAddSkillLevel(dwKungFuId, self.studyProcess[dwKungFuId]);
	if not retLevel then
		retLevel = 0
	end
	return retLevel
end

-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------策划需要的接口------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
--得到功法层数
function CKungFuSystem:GetKungfuLevel(dwKungFuID)
	local retLevel = 0
	if not _G.KungFuList[dwKungFuID] then
		-- print("_G.KungFuList dont have  KungFuID ".. dwKungFuID)
		return retLevel;
	end
	--如果已经完全领悟本功法 则返回
	if self.studyProcess[dwKungFuID] then
		retLevel = self.studyProcess[dwKungFuID]
	end
	return retLevel
end

--增加功法的天官赐福值
function CKungFuSystem:AddTianGuanCiFu(dwValue)
	local tianGuanCiFu = self.TianGuanCiFuSystem:Get_KungFuStudy();
	self.TianGuanCiFuSystem:Set_KungFuStudy(tianGuanCiFu + dwValue, false)
end

--返回功法当前祝福值
function CKungFuSystem:GetTianGuanCiFu()
	return self.TianGuanCiFuSystem:Get_KungFuStudy()
end


--提升易筋经阶数接口
function CKungFuSystem:SetLevel(dwLevel)
	self:Study(1,true,false,false,false,dwLevel)
end

-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------查看其他玩家功法信息------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
--查看其他玩家信息
function CKungFuSystem:ViewOtherKungFuProcess(RoleID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CKungFuSystem:ViewOtherMountList");
		return;
	end;
	local cbk = function(_, result, _)
		if result == -1 then
			self:ViewResult(false);
		end;
	end;
	_G.GSRemoteCall(RoleID, "CKungFuSystem", "BeViewKungFuProcess", {objPlayer:GetRoleID()}, cbk);
end;
--返回查看结果成功
function CKungFuSystem:ViewResult(isOK, stduyProcess, tCount)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CKungFuSystem:ViewResult");
		return;
	end;
	
	objPlayer.KungFuSys_ViewOtherResultMsg{IsOK = isOK, StudyProcess =
		stduyProcess, tCount= tCount};
end;
--被别人查看，返回功法进度
function CKungFuSystem:BeViewKungFuProcess(fromRoleID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CKungFuSystem:BeViewKungFuProcess");
		return;
	end;
	
	if not self:HasAuthority("YiJinJing") then 
		_G.GSRemoteCall(fromRoleID, "CKungFuSystem", "ViewFailResult", {false}, nil);
		return 
	end;
	
	local studyProcess = self.studyProcess;
	local extendSys = objPlayer:GetSystem("CKungFuExtendSystem");
	local nCount, nMaxCount;
	if extendSys then
		nCount, nMaxCount = extendSys:GetCount(KungFuEnum.YiJingJing);
	end
	_G.GSRemoteCall(fromRoleID, "CKungFuSystem", "ViewResult", {true,
		studyProcess,{nCount, nMaxCount}}, nil);
end;

--返回查看结果失败
function CKungFuSystem:ViewFailResult(isOK)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CKungFuSystem:ViewResult");
		return;
	end;
	objPlayer.KungFuSys_ViewOtherResultMsg{IsOK = isOK};
end;