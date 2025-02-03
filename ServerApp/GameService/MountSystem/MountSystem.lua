--[[
功能：坐骑系统
类型：继承于CSystem类，用来管理玩家坐骑相关功能
版本：
	v1.0	2012-04-10 create by lkj
	v2.0	10/16/2012 modify by lkj 坐骑升阶逻辑更改，取消坐骑品质升级功能。坐骑品质与配置表绑定。
]]

_G.CMountSystem = {};

----------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------外部系统调用接口--------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--是否是骑乘状态
function CMountSystem:GetState()
	return self.b_State;
end;
--返回拥有坐骑的最高阶数，没有坐骑返回0
function CMountSystem:GetMaxMountGrade()
	local nGrade = 0;
	for k, v in pairs(self.t_Mount) do
		if v:GetGrade() > nGrade then
			nGrade = v:GetGrade()
		end;
	end;
	return nGrade;
end;
--获取激活坐骑的ID
function CMountSystem:GetActiveMountID()
	return self.n_ActiveMountID;
end;
--获取激活坐骑的评分 没有返回0
function CMountSystem:GetActiveMountPoint()
	local dwPoint = 0;
	
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local mountInst = self:GetMountInst(self:GetActiveMountID());
	if mountInst then
		dwPoint = dwPoint + mountInst:GetPoint();
		
		local objItemSys = objSelf:GetSystem("CItemSystem");
		if objItemSys then
			for slot, dwItemID in pairs(mountInst.t_Equip) do
				local objItem = objItemSys:GetItemInst(dwItemID);
				if objItem then
					dwPoint = dwPoint + objItem:GetScore();
				end
			end
		end
	end;
	
	return dwPoint;
end;
--获得经验分给坐骑系统
function CMountSystem:AddExp(addValue, monsterLevel)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem AddExp Cannot get player");
		return;
	end;
	local mountInst = self:GetMountInst(self.n_ActiveMountID);
	if mountInst then
		addValue = _G.CMountSystemConfig.AddExp(addValue, monsterLevel, mountInst);
		--经验增加
		local dwExpUp = self.SkillSystem:GetInfo().dwMountExpUp;
		addValue = math.floor(addValue * (1 + dwExpUp));
		objPlayer.MountSys_MountAddExpMsg{Exp = addValue};
		--加经验判断是否升级
		local bLevelUP;
		local playerLevel = objPlayer:GetInfo().dwLevel;
		addValue, bLevelUP= mountInst:AddExp(addValue, playerLevel);
		if addValue > 0 then
			self:InsertDirty(self.n_ActiveMountID);
			if bLevelUP then
				self.b_ImmediatelySave = true;
				--抛事件，通知事件中心
				objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventMountUpLevel, mountInst:GetLevel());
				self:AttributeChange();
			end;
		end;
	end;
end;
-----使用道具加坐骑经验
function CMountSystem:UseItemAddExp(addValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem AddExp Cannot get player");
		return 1;
	end;
	local mountInst = self:GetMountInst(self.n_ActiveMountID);
	if(not mountInst) then
		return 2;
	end
	if mountInst then
		--经验增加
		objPlayer.MountSys_MountAddExpMsg{Exp = addValue};
		--加经验判断是否升级
		local bLevelUP;
		local playerLevel = objPlayer:GetInfo().dwLevel;
		addValue, bLevelUP= mountInst:AddExp(addValue, playerLevel);
		if addValue > 0 then
			self:InsertDirty(self.n_ActiveMountID);
			if bLevelUP then
				self.b_ImmediatelySave = true;
				--抛事件，通知事件中心
				objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventMountUpLevel, mountInst:GetLevel());
				self:AttributeChange();
			end;
			return nil;
		end;
	end;
	return 3;
end
--坐骑服用资质果
function CMountSystem:EatZZG()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem EatZZG Cannot get player");
		return false;
	end;
	local mountInst = self:GetMountInst(self.n_ActiveMountID);
	if mountInst then
		if mountInst:EatZZG() then
			objPlayer.ReturnMountEatZZGMsg{};
			self:AttributeChange();
			self:InsertDirty(mountInst:GetInstID());
			return true;
		end;
	end;
	return false;
end;
--GM命令给激活坐骑增加经验
function CMountSystem:AddExp_GM(addValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem AddExp Cannot get player");
		return;
	end;
	local mountInst = self:GetMountInst(self.n_ActiveMountID);
	if mountInst then
		--加经验判断是否升级
		objPlayer.MountSys_MountAddExpMsg{Exp = addValue};
		local bLevelUP;
		local playerLevel = objPlayer:GetInfo().dwLevel;
		addValue, bLevelUP = mountInst:AddExp(addValue, playerLevel);
		if addValue > 0 then
			self:InsertDirty(self.n_ActiveMountID);
			if bLevelUP then
				self.b_ImmediatelySave = true;
				--抛事件，通知事件中心
				objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventMountUpLevel, mountInst:GetLevel());
				self:AttributeChange();
			end;
		end;
	end;
end;

--设置坐骑配置ID
--设置成功 返回true
--设置失败 返回false
function CMountSystem:SetMountEnumID(enumID)
	local mountInst = self:GetMountInst(self:GetActiveMountID());
	if not mountInst then return false end;
	if not _G.CMountTable[enumID] then return false end;
	
	local objPlayer = self:GetPlayer();
	
	local beforeName = mountInst:GetName();
	local beforeQuality = mountInst:GetQuality();
	mountInst:SetEnumID(enumID);
	local afterName = mountInst:GetName();
	local afterQuality = mountInst:GetQuality();
	
	if self:GetState() then
		self.nShift = 0;
		objPlayer:SetMount(mountInst:GetEnumID(self.nShift, objPlayer:GetInfo().dwProf));
		self:AddMountEffect(#mountInst:GetChangeRank());
	end;
	self:AttributeChange();
	
	self:InsertDirty(mountInst:GetInstID());
	self.b_ImmediatelySave = true;
	
	--通知事件中心
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventMountUpGrade, 1, mountInst:GetGrade());
	
	objPlayer.MountSys_SetEnumIDMsg{MountInstID = self:GetActiveMountID(), EnumID = enumID};
	
	local playerRoleID = objPlayer:GetRoleID();
	local playerName = objPlayer:GetInfo().szRoleName;
	if mountInst:GetGrade() > _G.UpGradeConfig.BroadCastGrade then
		CGameApp.MountSys_BroadCastUpGradeMsg{
			PlayerRoleID = playerRoleID,
			PlayerName = playerName,
			MountInstID = mountInst:GetInstID(),
			BeforeName = beforeName,
			BeforeQuality = beforeQuality,
			AfterName = afterName,
			AfterQuality = afterQuality
		};
	end;
	
	return true;
end;

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

--new()
function CMountSystem:new()
	local obj = CSystem:new("CMountSystem");
	--方法复制
	for index, value in pairs(CMountSystem) do
		if type(value) == "function" then
			obj[index] = value;
		end;
	end;
	return obj;
end;

--create()
function CMountSystem:Create(bIsChangeLine)
	--每个系统创建时都会挂接到自己的管理者player身上
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem Create Cannot get player");
		return false;
	end;
	--需要调用player的基础道具系统
	self.ItemSystem = objPlayer:GetSystem("CItemSystem");
	if not self.ItemSystem then
		_err("CMountSystem Create Cannot get ItemSystem");
		return false;
	end;
	--需要调用player的基础技能系统
	self.SkillSystem = objPlayer:GetSystem("CSkillSystem");
	if not self.SkillSystem then
		_err("CMountSystem Create Cannot get SkillSystem");
		return false;
	end;
	--天官赐福系统
	if not CConfig.bIsCrossSvr then
		self.TianGuanCiFuSystem = objPlayer:GetSystem("CTianGuanCiFuSystem");
		if not self.TianGuanCiFuSystem then
			_err("CMountSystem Create Cannot get TianGuanCiFuSystem----");
			return false;
		end;
		--初始化DB模块
		local objDB = objPlayer:GetDBQuery();
		if not objDB then
			_err("CMountSystem Create Cannot get DBQuery");
			return false;
		end;
		self.objDBQuery = CMountSystemDB:new(objDB, self);
	end;
	--有重大事件立即存盘
	self.b_ImmediatelySave = false;
	--需要存盘的坐骑表
	self.t_Dirty = {};
	
	--------------------
	local Data = {};
	--如果是跨服战

	--读取信息
	local Data	= objPlayer:GetLineData("CMountSystem")[1];
	if not Data then
		_err("MountSystem Create CanNot GetLineData!!!");
		Data = {}
	end;
	if Data[1] then--坐骑栏位
		self.n_MountSlotNum = Data[1];
	else
		_err("MountSystem Create CanNot GetLineData[1]!!!");
		self.n_MountSlotNum = _G.CMountSystemConfig.InitialSlotNum;
	end;
	if Data[2] then--默认激活坐骑ID
		self.n_ActiveMountID = Data[2];
	else
		_err("MountSystem Create CanNot GetLineData[2]!!!");
		self.n_ActiveMountID = 0;
	end;
	if Data[3] then--下一个坐骑ID
		self.NextMountID = Data[3];
	else
		_err("MountSystem Create CanNot GetLineData[3]!!!");
		self.NextMountID = 1;
	end;
	if Data[4] then--骑乘状态
		self.b_State = Data[4];
	else
		self.b_State = false;
	end;
	--坐骑表
	self.t_Mount = {};
	--拥有坐骑个数
	self.n_MountNum = 0;
	--table.print(Data[5]);
	if Data[5] then
		for k, v in pairs(Data[5]) do
			local mountInst = _G.CMount:new(v.n_EnumID);
			mountInst:Parse(v);
			self.t_Mount[mountInst:GetInstID()] = mountInst;
			self.n_MountNum = self.n_MountNum + 1;
		end;
	end;
	--print("self.n_MountNumself.n_MountNumself.n_MountNum",self.n_MountNum)
	--容错
	if self.n_MountNum > 0 and self.n_ActiveMountID == 0 then
		_err("ERROR mount activeID!!!", bIsChangeLine);
		for k, v in pairs(self.t_Mount) do
			self.n_ActiveMountID = k;
			break;
		end;
	end;
	
	self.nShift = Data[6] or 0;
	--------------------
	--坐骑排行榜数据
	self.t_MountChart = {};
	local nPlayerRoleID = objPlayer:GetRoleID();
	if not CConfig.bIsCrossSvr then
		for k, v in pairs(self.t_Mount) do
			self.t_MountChart[k] = CChartManager:GetChartNumber(enChartType.eMount,'dwRoleID',nPlayerRoleID) 
		end;
	end;
	--加成属性
	self:AttributeChange();
	---转生属性加成
	-- local mountInst = self:GetMountInst(self.n_ActiveMountID);
	-- if mountInst then
		-- self:AddProChangeRankAttr(#mountInst:GetChangeRank());
	-- end
	--设置坐骑模型ID
	if self.b_State then
		local mountInst = self:GetMountInst(self.n_ActiveMountID);
		if mountInst then
			objPlayer:SetMount(mountInst:GetEnumID(self.nShift, objPlayer:GetInfo().dwProf),true);
			self:AddMountEffect(#mountInst:GetChangeRank());
		end;
	end;
	
	--折扣
	self.nDiscount_UpGrade = 1;--升阶折扣
	
	return true;
end;
--Update()
function CMountSystem:Update(dwInterval)
	if self.b_ImmediatelySave then
		--触发存盘
		self:Save();
		self.b_ImmediatelySave = false;
	end;
	return true;
end;
--destroy
function CMountSystem:Destroy()
	--下线存盘
	if not CConfig.bIsCrossSvr then
		self:Save();
	end
end;
--OnEnterScene向客户端同步数据
function CMountSystem:OnEnterScene()
	--同步客户端信息
	self:SynchronizeAll();
	self:SynchronizeMountChart();
	self:SynTianGuanCiFu();
end;
--系统换线开始
function CMountSystem:OnChangeLineBegin(dwLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	local Data = {};
	Data[1] = self.n_MountSlotNum;		--坐骑栏位
	Data[2] = self.n_ActiveMountID;		--激活坐骑ID 
	Data[3] = self.NextMountID;			--下一个坐骑ID
	Data[4] = self.b_State;				--骑乘状态
	for k, v in pairs(self.t_Mount) do
		if not Data[5] then
			Data[5] = {};
		end;
		local mountDBInfo = v:Serialize();
		table.insert(Data[5], mountDBInfo);
	end;
	Data[6] = self.nShift;
	objPlayer:SetLineData("CMountSystem", Data);
end;

-----换跨服战场
function CMountSystem:OnEnterCrossBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end
	local Data = {};
	Data[1] = self.n_MountSlotNum;		--坐骑栏位
	Data[2] = self.n_ActiveMountID;		--激活坐骑ID
	Data[3] = self.NextMountID;			--下一个坐骑ID	
	Data[4] = self.b_State;				--骑乘状态
	for k, v in pairs(self.t_Mount) do
		if not Data[5] then
			Data[5] = {};
		end;
		local mountDBInfo = v:CrossSerialize();
		table.insert(Data[5], mountDBInfo);
	end;
	--print("=======OnEnterCrossBegin==========",#Data[5])
	--table.print(Data[5]);
	objPlayer:SetCrossSvrData("CMountSystem",Data);
end;

--系统换线结束
-- function CMountSystem:OnChangeLineEnd(dwLine)
	-- local objPlayer = self:GetPlayer();
	-- if not objPlayer then
		-- _err("error");
		-- return
	-- end;
	-- self:AttributeChange();
-- end;
--事件中心
function CMountSystem:OnEventCenter(szEventName, Param1, Param2)
	--排行榜刷新事件
	if szEventName == 'EventChartRefresh' and Param1 == _G.enChartType.eMount then
		local objPlayer = self:GetPlayer();
		if not objPlayer then
			_err("cannot get objPlayer");
			return;
		end;
		--坐骑排行榜数据
		self.t_MountChart = {};
		local nPlayerRoleID = objPlayer:GetRoleID();
		for k, v in pairs(self.t_Mount) do
			self.t_MountChart[k] = CChartManager:GetChartNumber(enChartType.eMount,'dwRoleID',nPlayerRoleID)
		end;
		self:SynchronizeMountChart();
	end
end
--同步天官赐福值
function CMountSystem:SynTianGuanCiFu()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem Cannot get player SynTianGuanCiFu");
		return;
	end;
	--装备升阶天官赐福
	if not CConfig.bIsCrossSvr then
		local n_Value = self.TianGuanCiFuSystem:Get_MountUpGrade();
		local restTime = self:GetRestTime();
		objPlayer.MountSys_SynTianGuanCiFuMsg{MountUpGrade = n_Value, RestTime = restTime};
	end;
end;

function CMountSystem:GetRestTime()
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
------------------------------------------------------------------------------------------------------------------------------------------
--死亡
function CMountSystem:OnDead(dwEnemyType,dwEnemyID)
	self:OnClose();
end;
--换线回调
function CMountSystem:OnChangeGameLine()
	self:OnClose();
end;
function CMountSystem:OnClose()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem Cannot get player OnClose");
		return;
	end;
	objPlayer.MountSys_OnCloseMsg{};
end;
-------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------自身属性相关----------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------
--上线向客户端同步所有信息
function CMountSystem:SynchronizeAll()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem:SynchronizeAll() get player err!!!");
		return;
	end;
	local info = {};
	--坐骑栏位
	info[1] = self.n_MountSlotNum;
	--坐骑个数
	info[2]	= self.n_MountNum;
	--默认激活坐骑ID
	info[3] = self.n_ActiveMountID;
	--骑乘状态
	info[4]	= self:GetState();
	--坐骑信息
	info[5] = {};
	for k, v in pairs(self.t_Mount) do
		local netData = v:GetNetData();
		info[5][k] = netData;
	end;
	
	objPlayer.MountSys_SynchronizeAllMsg{Info = info};
end;
--向客户端同步坐骑排行信息
function CMountSystem:SynchronizeMountChart()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem:SynchronizeAll() get player err!!!");
		return;
	end;
	objPlayer.MountSys_SynchronizeChartMsg{Info = self.t_MountChart};
end;
--向客户端同步坐骑信息
function CMountSystem:SynchronizeMountInst(mountInst)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem:SynchronizeMountInst() get player err!!!");
		return;
	end;
	local netData = mountInst:GetNetData();
	objPlayer.MountSys_SynchronizeMountInstMsg{NetData = netData};
end;
--向客户端同步删除坐骑信息
-- function CMountSystem:SynchronizeDeleteMount(n_MountInstID)
	-- local objPlayer = self:GetPlayer();
	-- if not objPlayer then
		-- _err("CMountSystem:SynchronizeDeleteMount() get player err!!!");
		-- return;
	-- end;
	-- objPlayer.MountSys_SynchronizeDeleteMountMsg{MountInstID = n_MountInstID};
-- end;
--向客户端同步固定属性信息
-- function CMountSystem:SynchronizeByParam(...)
	-- local objPlayer = self:GetPlayer();
	-- if not objPlayer then
		-- _err("CMountSystem:SynchronizeByParam() get player err!!!");
		-- return;
	-- end;
	-- local arg = {...};
	-- local info = {};
	-- if arg[1] then
		-- info.arg = arg;
		-- info.value = self;
		-- for k, v in ipairs(arg) do
			-- info.value = info.value[v];
		-- end;
		-- objPlayer.MountSys_SynchronizeByParamMsg{Info = info};
	-- end;
-- end;
--------------------------------------------------------
--通过配置ID增加坐骑
function CMountSystem:AddMountByID(mountEnumID)

	local mountInst = _G.CMount:new(mountEnumID);

	return self:AddMountByObj(mountInst);
end;
--通过对象增加坐骑
function CMountSystem:AddMountByObj(mountObj)
	--如果没地方了则返回false
	if self.n_MountNum >= self.n_MountSlotNum then return false end;
	--设置坐骑ID
	mountObj:SetInstID(self.NextMountID);
	--增加坐骑
	self.t_Mount[self.NextMountID] = mountObj;
	self.n_MountNum = self.n_MountNum + 1;
	--插入存盘坐骑表
	self:InsertDirty(self.NextMountID, true);
	--增加坐骑为需要立即存盘行为
	self.b_ImmediatelySave = true;
	
	self.NextMountID = self.NextMountID + 1;
	self:SynchronizeMountInst(mountObj);
	
	--获得第一个坐骑直接激活
	if self.n_MountNum == 1 then
		self:Activate(mountObj:GetInstID());
	end;
	
	--抛事件，通知事件中心
	local objPlayer = self:GetPlayer();
	if objPlayer then
		objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventGetNewMount, self.n_MountNum);
	end;
	
	return true, mountObj:GetInstID();
end;
-------------------------------------------------------
--删除坐骑
--[[
function CMountSystem:DeleteMountInst(n_MountInstID)
	local mountInst = self:GetMountInst(n_MountInstID);
	if not mountInst then return end;
	for slot, n_EquipInstID in pairs(mountInst.t_Equip) do
		if n_EquipInstID > 0 then return end;
	end;
	--如果删除的坐骑为已激活的坐骑
	if n_MountInstID == self.n_ActiveMountID then
		--反激活坐骑
		self:InActivate();
	end;
	--从DB中删除
	self.objDBQuery:DeleteMountInst(n_MountInstID);
	--从dirty表中移除
	self:RemoveDirty(n_MountInstID);
	--从坐骑表中移出
	self.t_Mount[n_MountInstID] = nil;
	self.n_MountNum = self.n_MountNum - 1;
	--同步客户端
	self:SynchronizeDeleteMount(n_MountInstID);
end;
]]
------------------------------------------------------
--获得坐骑实例
function CMountSystem:GetMountInst(mountInstID)
	return self.t_Mount and self.t_Mount[mountInstID];
end;
------------------------------------------------------
--插入坐骑存盘表
function CMountSystem:InsertDirty(mountInstID, bIsNew)
	for k, v in ipairs(self.t_Dirty) do
		if v[1] == mountInstID then
			return;
		end;
	end;
	table.insert(self.t_Dirty, {mountInstID, bIsNew});
end;
--从dirty表中移除
function CMountSystem:RemoveDirty(n_MountInstID)
	local pos = 0;
	for k, v in ipairs(self.t_Dirty) do
		if v[1] == n_MountInstID then
			pos = k;
			break;
		end;
	end;
	if pos > 0 then
		table.remove(self.t_Dirty, pos);
	end;
end;
---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------数据库相关-------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
--触发存盘
function CMountSystem:Save()
	if not CConfig.bIsCrossSvr then
		--存盘坐骑系统属性
		local info = {
			n_MountSlotNum = self.n_MountSlotNum;
			n_ActiveMountID = self.n_ActiveMountID;
			n_NextInstID	= self.NextMountID;
		};
		self.objDBQuery:UpdateMountSysInfo(info);
		--存盘坐骑
		for k, v in ipairs(self.t_Dirty) do
			local mountInst = self:GetMountInst(v[1]);
			if mountInst then
				local mountInfo = mountInst:Serialize();
				if not self.objDBQuery:SaveMountInfo(mountInfo, v[2]) then
					_err("CMountSystem:Save() error!!!");
				end;
			end;
		end;
		self.t_Dirty = {};
	end;
end;
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------查看其他玩家坐骑列表信息------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
--查看其他玩家信息
function CMountSystem:ViewOtherMountList(RoleID, MountInstID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CMountSystem:ViewOtherMountList");
		return;
	end;
	local cbk = function(_, result, _)
		if result == -1 then
			self:ViewResult(false);
		end;
	end;
	_G.GSRemoteCall(RoleID, "CMountSystem", "BeViewMountList", {MountInstID, objPlayer:GetRoleID()}, cbk);
end;
--返回查看结果
function CMountSystem:ViewResult(isOK, mountList, nProf)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CMountSystem:ViewResult");
		return;
	end;
	objPlayer.MountSys_ViewOtherResultMsg{IsOK = isOK, MountList = mountList, Prof = nProf};
end;
--被别人查看，返回坐骑列表拷贝
function CMountSystem:BeViewMountList(n_MountInstID, fromRoleID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CMountSystem:BeViewMountList");
		return;
	end;
	local mountInst = self:GetMountInst(n_MountInstID);
	if not self:HasAuthority("Mount") then 
		_G.GSRemoteCall(fromRoleID, "CMountSystem", "ViewFailResult", {false}, nil);
		return 
	end;
	
	if not mountInst then 
		_G.GSRemoteCall(fromRoleID, "CMountSystem", "ViewFailResult", {false}, nil);
		return
	end;
	local mountList = {};
	local mountNetData = mountInst:GetNetData();
	mountNetData[12] = self.t_MountChart[n_MountInstID];
	--坐骑装备
	mountNetData[10] 	= {};
	for slot, n_EquipInstID in pairs(mountInst.t_Equip) do
		--装备网络信息
		local itemInst = self.ItemSystem:GetItem(n_EquipInstID);
		if itemInst then
			-- local itemNetData = SItemMessage:new();
			-- itemInst:FillItemMessage(itemNetData);
			
			local itemNetData = itemInst:GetNetData();
			mountNetData[10][slot] = itemNetData;
		end;
	end;
	table.insert(mountList, mountNetData);
	for k, v in pairs(self.t_Mount) do
		if k ~= n_MountInstID then
			mountNetData = v:GetNetData();
			mountNetData[12] = self.t_MountChart[k];
			--坐骑装备
			mountNetData[10] 	= {};
			for slot, n_EquipInstID in pairs(v.t_Equip) do
				--装备网络信息
				local itemInst = self.ItemSystem:GetItem(n_EquipInstID);
				if itemInst then
					-- local itemNetData = SItemMessage:new();
					-- itemInst:FillItemMessage(itemNetData);
					
					local itemNetData = itemInst:GetNetData();
					mountNetData[10][slot] = itemNetData;
				end;
			end;
			table.insert(mountList, mountNetData);
		end;
	end;
	_G.GSRemoteCall(fromRoleID, "CMountSystem", "ViewResult", {true, mountList, objPlayer:GetInfo().dwProf}, nil);
end;

--返回查看结果
function CMountSystem:ViewFailResult(isOK)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CMountSystem:ViewResult");
		return;
	end;
	objPlayer.MountSys_ViewOtherFailMsg{IsOK = isOK};
end;
--获得坐骑等级
function CMountSystem:GetMountLevel()
	local level = 0;
	if self.n_ActiveMountID then
		local mountInst = self:GetMountInst(self.n_ActiveMountID);
		if mountInst then
			level = mountInst:GetLevel();
		end;
	end;
	return level;
end;

--获取坐骑等阶
function CMountSystem:GetMountGrade()
	local grade = 0;
	if self.n_ActiveMountID then
		local mountInst = self:GetMountInst(self.n_ActiveMountID);
		if mountInst then
			grade = mountInst:GetGrade();
		end;
	end;
	return grade;
end;

