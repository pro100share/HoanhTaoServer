--时装系统

local function ParseEquipStr(str, t)
	local lastIndex = 0;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local index, index1 = string.find(str1, ",");
		local index2 = string.find(str1, ",", index1 + 1);
		
		local str2 = string.sub(str1, 1, index -1);
		local str3 = string.sub(str1, index1 + 1, index2 - 1);
		local str4 = string.sub(str1, index2 + 1)
		
		local key = tonumber(str2);
		local value1 = tonumber(str3);
		local value2 = tonumber(str4);
		t[key] = {dressId = value1, bShow = value2};	
	end;
	return t;
end


local function FormatEquipStr(t)
	local str = "";
	
	for k, v in pairs(t) do
		str = str..k..","..v.dressId..","..v.bShow..";";
	end
	
	return str;
end

_G.CFashionDressSystem = {};

--[[
	时装表结构
	self.setFashionDress = {
		[时装ID] = {deleteTime删除时间: 0是永远;   bRenew是否可以续时: 1可续, 0不可续};
		[DressId] = {deleteTime = , bRenew = };
		[...]
		
	}
--]]

--[[
	穿戴表结构
	self.setEquipDress = {
		[装备位] = {dressId = , bShow =  1:显示 0隐藏
		...
	}
	
--]]

function CFashionDressSystem:new()
	local obj = CSystem:new("CFashionDressSystem");
	-- 是否可以开始更新
	obj.bIsCanUpdate = false;
	--时装表
	obj.setFashionDress = {};
	--穿戴时装
	obj.setEquipDress = {};
	--化身丹经验
	obj.dwCurExp = 0;
	obj.dwCurLevel = 1;
    obj.nBoxNum = FashionDressConfig.InitBoxNum
	for i,v in pairs(CFashionDressSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;

function CFashionDressSystem:Create(bIsChangeLine)
	--每个系统创建时都会挂接到自己的管理者player身上
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CFashionDressSystem Create Cannot get player");
		return false;
	end;
	--需要调用player的基础道具系统
	self.ItemSystem = objPlayer:GetSystem("CItemSystem");
	if not self.ItemSystem then
		_err("CFashionDressSystem Create Cannot get ItemSystem");
		return false;
	end;

	
	--技能系统
	self.SkillSystem = objPlayer:GetSystem("CSkillSystem");
	if not self.SkillSystem then
		_err("CFashionDressSystem Create Cannot get SkillSystem----");
		return false;
	end;
	
	--初始化DB模块
	if not CConfig.bIsCrossSvr then
		local objDB = objPlayer:GetDBQuery();
		if not objDB then
			_err("CMountSystem Create Cannot get DBQuery");
			return false;
		end;
		self.objDBQuery = CFashionDressSystemDB:new(objDB, self);
	end;
	--读取信息
	local Data	= objPlayer:GetLineData("CFashionDressSystem")[1];
		
	if bIsChangeLine == 2 then
		--Data = objPlayer:GetLineData("CFashionDressSystem")[1];
	end
	
	if not Data then
		_err("CFashionDressSystem Create CanNot GetLineData!!!");
		Data = {}
	end

	if Data[2] then
		self.setFashionDress = Data[1] or {};
		self.dwCurExp = Data[2];
		self.dwCurLevel = HuaShenDanConfig:ExpToLevel(self.dwCurExp);
		self.nBoxNum = Data[4] or FashionDressConfig.InitBoxNum
		ParseEquipStr(Data[3], self.setEquipDress)
	else
		--插入数据库
		local db_Info = {};
		db_Info.dwExp = 0;
		db_Info.szEquip = "";
		db_Info.nBoxNum = FashionDressConfig.InitBoxNum;
		if not CConfig.bIsCrossSvr then
			self.objDBQuery:InsertHuaShenDanInfo(db_Info);
		end;
	end;
	
	return true;
end;

function CFashionDressSystem:Destroy()
end;

function CFashionDressSystem:Update(dwInterval)
	-- 不可更新就返回 （客户端还没初始化完成）
	if not self.bIsCanUpdate then return end
	
	local curTime = GetCurTime();
	
	local setDeleteDress = {};
	--检查删除所有过时的装备
	for dressId, dressInfo in pairs(self.setFashionDress) do
		--永久时装不删
		if dressInfo.deleteTime ~= 0 then
			if dressInfo.deleteTime < curTime then
				table.insert(setDeleteDress, dressId)
			end
		end
		
	end	
	
	self:DeleteFashionDress(setDeleteDress);
end;

function CFashionDressSystem:OnEnterScene()
	--同步信息
	self:SyncAll();
	--更新角色外观
	self:UpdateViewModel();
	--更新属性
	self:AttributeChange();
	-- 进入游戏后 可以更新
	self.bIsCanUpdate = true;
    
    -- 检查过时时装
    self:CheckDelete();
end;

--换线开始
function CFashionDressSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	local Data = {};
	Data[1] = self.setFashionDress;
	Data[2] = self.dwCurExp;
	Data[3] = FormatEquipStr(self.setEquipDress);
	Data[4] = self.nBoxNum;
	

	objPlayer:SetLineData("CFashionDressSystem", Data);
	self:DealBreakPro();
end

--换线结束
function CFashionDressSystem:OnChangeLineEnd()
	--同步信息
	self:SyncAll();
	--更新角色外观
	self:UpdateViewModel();
	--更新属性
	self:AttributeChange();
end

--死亡处理
function CFashionDressSystem:OnDead(dwEnemyType,dwEnemyID)
	self:DealBreakPro()
end;


function CFashionDressSystem:OnEnterCrossBegin()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	local Data = {};
	
	Data[1] = FormatEquipStr(self.setEquipDress);
	
	--objPlayer:SetLineData("CFashionDressSystem", Data);
	objPlayer:SetCrossSvrData("CFashionDressSystem", Data);	
end;

--处理打断合成
function CFashionDressSystem:DealBreakPro()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	--objPlayer.OnDeadBreakFashionDressMsg{};
end;


function CFashionDressSystem:SyncAll()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	objPlayer.FashionDressBoxNumMsg{nBoxNum = self.nBoxNum}
	objPlayer.FashionDressSyncAllMsg{SetDress = self.setFashionDress, SetEquip = self.setEquipDress , CurExp = self.dwCurExp};
	--同步衣柜信息
	self:SendBoxList()
end

--同步所有装备的时装
function CFashionDressSystem:SyncEquip()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	objPlayer.FashionDressSyncEquipMsg{SetEquip = self.setEquipDress};
end


--删除时装
function CFashionDressSystem:DeleteFashionDress(setDeleteDress)
	if #setDeleteDress <= 0 then
		return
	end
	
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	local db_Info = {};
	
	for _, dressId in pairs(setDeleteDress) do
		-- print("CFashionDressSystem:DeleteFashionDress", dressId)
		for k, v in pairs(self.setEquipDress) do
			if v.dressId == dressId then
				--self.setEquipDress[k] = nil;
				self:EquipOperator(v.dressId, FashionDressConfig.OperMsgType.TakeOff, true)
			end
		end
		
		db_Info.dressID = dressId;
		self.objDBQuery:DeleteFashionDressInfo(db_Info);
		self.setFashionDress[dressId] = nil;
	end
	self:SendBoxList();
	self:AttributeChange();
	objPlayer.FashionDressOperRetMsg{OperType = FashionDressConfig.OperRetMsgType.DELTE, Dress = setDeleteDress};
	--数据库
	-- db_Info = {dwExp = self.dwCurExp ,szEquip = FormatEquipStr(self.setEquipDress),}
	-- self.objDBQuery:UpdateHuaShenDanInfo(db_Info);
end

--根据时装改变人物外观
function CFashionDressSystem:UpdateViewModel()
	for _, dwWearPos in pairs(FashionDressConfig.WearPosList) do
		self:UpdateSingleViewModel(dwWearPos);
	end
end

--改变单个装备位的外观
function CFashionDressSystem:UpdateSingleViewModel(dwWearPos)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;

	local dressInfo = self.setEquipDress[dwWearPos];
		
	if not dressInfo then
		--显示装备系统的模型
		self:GetPlayer():GetSystem("CItemSystem"):EquipChangeModel(dwWearPos);
	else
		if dressInfo.bShow == 0 then
			--显示装备系统的模型
			self:GetPlayer():GetSystem("CItemSystem"):
                EquipChangeModel(dwWearPos);
		elseif dressInfo.bShow == 1 then
			--显示时装系统的模型
			local dressCfg = FashionDressConfig.DressList[objPlayer:GetProf()][dressInfo.dressId];
			if not dressCfg then
				_err("CFashionDressSystem:UpdateViewModel cant find dressCfg!!")
				return;
			end
			
			local nDressLevel = 0;
			if dwWearPos == enItemWearPos.eCloth then
				nDressLevel = objPlayer:GetInfo().dwDressLevel;
			elseif dwWearPos == enItemWearPos.eWeapon then
				nDressLevel = objPlayer:GetInfo().dwArmsLevel;
			end
			
			objPlayer:SetEquip(dwWearPos, dressCfg.dwItemID, dressCfg.dwMshID, nDressLevel)
			-- print("CFashionDressSystem:UpdateSingleViewModel==== dressInfo.dressId, dwWearPos, dressCfg.dwItemID, dressCfg.dwMshID", dressInfo.dressId, dwWearPos, dressCfg.dwItemID, dressCfg.dwMshID, nDressLevel)
		end
	end
end

---------------------------------------------------------------------------------------------------------------------------------
--购买时装 续时
function CFashionDressSystem:Buy(dressID, dwType)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	--权限检测
	if not self:HasAuthority('huashendan') then return end

	local szFuncName = "InsertFashionDressInfo";
	
	local dressInfo = self.setFashionDress[dressID];
	if dressInfo then
		szFuncName = "UpdateFashionDressInfo";
		--不可续时
		if dressInfo.bRenew == 0 then
			return
		end
		
		--已经是永久拥有
		if dressInfo.deleteTime == 0 then
			return
		end
	end
	
	--购买的时装 暂定都可以续时
	local bRenew = 1;
	
	local dwProf = objPlayer:GetProf();
	-- print("CFashionDressSystem:Buy================dwProf, dressID", dwProf, dressID)
	local dressCfg = FashionDressConfig.DressList[dwProf][dressID];
	if not dressCfg then
		-- print("CFashionDressSystem:Buy cant find dressCfg!!!")
		return;
	end
	
    local dressLifeCfg = nil
    if dressCfg.TabMoney then
        dressLifeCfg = dressCfg.TabMoney[dwType];
        if not self.ItemSystem:IsGoldEnough(dressLifeCfg.dwNum) then return end
        --扣除元宝
        self.ItemSystem:CostGold(dressLifeCfg.dwNum,
            _G.ItemSysOperType.CSHonorShop);
    else
        dressLifeCfg = dressCfg.LifeInfo[dwType];
        -- 设置为不可续费
        bRenew = 0;
    end
	
    --计算删除时间戳
    local deleteTime = GetCurTime();
    if dressInfo then
        deleteTime = dressInfo.deleteTime;
    end
    
    if dressLifeCfg.dwDay == 0 then
        deleteTime = 0;
    else
        deleteTime = deleteTime + ONE_DAY_MSEC * dressLifeCfg.dwDay;
    end
	local bInBox = false;
	if dressInfo then
		bInBox =  dressInfo.bInBox
	end
    self.setFashionDress[dressID] = {deleteTime = deleteTime, bRenew = bRenew,bInBox = bInBox};
    --同步衣柜信息
    self:SendBoxList()
    objPlayer.FashionDressOperRetMsg{OperType = FashionDressConfig.OperRetMsgType.ADD, Dress = {dressID, deleteTime, bRenew}};
    
    --改变属性
    --self:AttributeChange();
    
    --数据库
    local db_Info = {dressID = dressID,deleteTime = deleteTime, bRenew = bRenew,bInBox = false}
    self.objDBQuery[szFuncName](self.objDBQuery, db_Info);
    
    --广播
    if dressCfg.boardcast then
        --全服广播
        local dwRoleID = objPlayer:GetRoleID();
        local szRoleName = objPlayer:GetName();
        CGameApp.FashionDressBuyBoardcastMsg{RoleId = dwRoleID, RoleName = szRoleName, DressId = dressID};
    end
end

--时装 (穿戴 脱下)
function CFashionDressSystem:EquipOperator(dressId, dwType, dwCode, bCheck)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	--权限检测
	if not self:HasAuthority('huashendan') then return end
	
	if bCheck and not self.setFashionDress[dressId] then
		-- print("ERROR CFashionDressSystem:EquipOperator not have this dress", dressId);
		return;
	end
	
	local dwProf = objPlayer:GetProf();
	local dressCfg = FashionDressConfig.DressList[dwProf][dressId];
	if not dressCfg then
		_err("CFashionDressSystem:Operator========= cant find dressCfg!!!")
		return;
	end
	
	if dwType == FashionDressConfig.OperMsgType.Wear then
		self.setEquipDress[dressCfg.dwWearPos] = {dressId = dressId, bShow = 1};
	elseif dwType == FashionDressConfig.OperMsgType.TakeOff then
		self.setEquipDress[dressCfg.dwWearPos] = nil;
	elseif dwType == FashionDressConfig.OperMsgType.Show then
		if self.setEquipDress[dressCfg.dwWearPos] and self.setEquipDress[dressCfg.dwWearPos].bShow == 0 then
			self.setEquipDress[dressCfg.dwWearPos].bShow = 1;
		end
	elseif dwType == FashionDressConfig.OperMsgType.Hide then
		if self.setEquipDress[dressCfg.dwWearPos] and self.setEquipDress[dressCfg.dwWearPos].bShow == 1 then
			self.setEquipDress[dressCfg.dwWearPos].bShow = 0;
		end
	end
	self:SyncEquip();
	self:AttributeChange();
	
	--更新外观
	self:UpdateSingleViewModel(dressCfg.dwWearPos);
	
	--数据库
	local db_Info = {dwExp = self.dwCurExp ,szEquip = FormatEquipStr(self.setEquipDress),}
	self.objDBQuery:UpdateHuaShenDanInfo(db_Info);
end


--化身丹升级
function CFashionDressSystem:UpLevel(dwCount)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	--权限检测
	if not self:HasAuthority('huashendan') then return end
	
	--如果是满级就返回
	if self.dwCurLevel >= HuaShenDanConfig.LevelInfo.dwMaxLevel then
		return;
	end
	
	--如果银币不够返回
	local levelCfg = HuaShenDanConfig.LevelInfo[self.dwCurLevel];
	if not self.ItemSystem:IsPacketMoneyEnough(levelCfg.dwMoney * dwCount) then
		return
	end
	
	--如果物品不够就返回
	local isEnough, _ = self.ItemSystem:CheckDelEnumItemInPacketCond(levelCfg.dwItemID, levelCfg.dwNum * dwCount);
	if not isEnough then
		return;
	end

	--扣除银币 物品 给经验
	self.ItemSystem:CostPacketMoney(levelCfg.dwMoney * dwCount, _G.ItemSysOperType.FashionDress);
	self.ItemSystem:DelEnumItemInPacket(levelCfg.dwItemID, levelCfg.dwNum * dwCount, false, _G.ItemSysOperType.FashionDress);
	local dwBaseExp, dwMul = HuaShenDanConfig:RandomUpLevel();
	self.dwCurExp = self.dwCurExp + dwBaseExp * dwMul * dwCount;
	
	local dwMaxExp = HuaShenDanConfig.LevelInfo[HuaShenDanConfig.LevelInfo.dwMaxLevel].dwExp;
	
	if self.dwCurExp > dwMaxExp then
		self.dwCurExp = dwMaxExp;
	end
	
	local dwLastLevel = self.dwCurLevel;
	self.dwCurLevel = HuaShenDanConfig:ExpToLevel(self.dwCurExp);
	
	--同步化身丹经验
	objPlayer.FashionDressSyncExpMsg{CurExp = self.dwCurExp, BaseExp = dwBaseExp, Mul = dwMul, Count = dwCount};
	
	self:AttributeChange();
	
	--数据库
	local db_Info = {dwExp = self.dwCurExp, szEquip = FormatEquipStr(self.setEquipDress)}
	self.objDBQuery:UpdateHuaShenDanInfo(db_Info);
	
	--全服广播
	if dwLastLevel ~= self.dwCurLevel and self.dwCurLevel >= HuaShenDanConfig.BoardcastLevel then
		local dwRoleID = objPlayer:GetRoleID();
		local szRoleName = objPlayer:GetName();
		CGameApp.FashionDressHuaShenDanBoardcastMsg{RoleId = dwRoleID, RoleName = szRoleName, Level = self.dwCurLevel};
	end	
end



--人物属性变化
function CFashionDressSystem:AttributeChange()
	if self.SkillSystem then
		local objPlayer = self:GetPlayer();
		if not objPlayer then
			return;
		end;
	
		--化身丹增加属性
		local attrCfg = HuaShenDanConfig.AttrInfo[self.dwCurLevel];
		local t_attr = _G.SSingleAttrChange:new();
		for k, v in pairs(attrCfg) do
			if t_attr[k] then
				t_attr[k] = t_attr[k] + v;
			end
		end
		
		--时装增加属性
		local dwProf = objPlayer:GetProf();
		local dressAttr = {};
		
		for nDressID, dressInfo in pairs(self.setFashionDress) do
			if dressInfo and dressInfo.bInBox  then
				dressAttr = FashionDressConfig:GetDressAttr(self.dwCurLevel, dwProf, nDressID)
				dressAttr:CountAttrValue(t_attr);
			end
		end
		
		--套装增加属性
		local suitAttr = FashionDressConfig:GetAllSuitAttr(dwProf, self.setEquipDress);
		suitAttr:CountAttrValue(t_attr);
		
		self.SkillSystem:NotifyFashionDressUpdate(t_attr);
	end
end;

-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------策划需要的接口------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------查看其他玩家时装信息------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
--查看其他玩家信息
function CFashionDressSystem:ViewOtherProcess(RoleID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CFashionDressSystem:ViewOtherMountList");
		return;
	end;
	local cbk = function(_, result, _)
		if result == -1 then
			self:ViewResult(false);
		end;
	end;
	_G.GSRemoteCall(RoleID, "CFashionDressSystem", "BeViewProcess", {objPlayer:GetRoleID()}, cbk);
end;
--返回查看结果成功
function CFashionDressSystem:ViewResult(isOK, setEquipDress, dwCurExp, dwProf)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CFashionDressSystem:ViewResult");
		return;
	end;
	objPlayer.FashionDressSys_ViewOtherResultMsg{IsOK = isOK, setEquipDress = setEquipDress, dwCurExp = dwCurExp, dwProf = dwProf};
end;
--被别人查看，返回功法进度
function CFashionDressSystem:BeViewProcess(fromRoleID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CFashionDressSystem:BeViewKungFuProcess");
		return;
	end;
	
	-- if not self:HasAuthority("YiJinJing") then 
		-- _G.GSRemoteCall(fromRoleID, "CFashionDressSystem", "ViewFailResult", {false}, nil);
		-- return 
	-- end;
	
	local dwProf = objPlayer:GetProf();
	local setEquipDress = {}
	for k, v in pairs(self.setEquipDress) do
		--查找装备的删除时间
		local deleteTime = 0;
		local bRenew = 0;
		for dressID, dressInfo in pairs(self.setFashionDress) do
			if dressID == v.dressId then
				deleteTime = dressInfo.deleteTime;
				bRenew = dressInfo.bRenew;
			end
		end
		setEquipDress[k] = {dressId = v.dressId, bShow = v.bShow, deleteTime = deleteTime, bRenew = bRenew};
	end
	
	
	_G.GSRemoteCall(fromRoleID, "CFashionDressSystem", "ViewResult", {true, setEquipDress, self.dwCurExp, dwProf}, nil);
end;

--返回查看结果失败
function CFashionDressSystem:ViewFailResult(isOK)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CFashionDressSystem:ViewFailResult");
		return;
	end;
	objPlayer.FashionDressSys_ViewOtherResultMsg{IsOK = isOK};
end;

--是否在衣柜里
--nDressID 操作时装ID
function CFashionDressSystem:OnReqChangeBoxList(nDressID,bFlg)
	local nNow = 0;
	for k,v in pairs(self.setFashionDress)do
		if v.bInBox then
			nNow = nNow + 1; 
		end
	end
	
	if bFlg and nNow >= self.nBoxNum then
		_err("Box Number is not enough");
		return
	end
	self:ChangeBoxList(nDressID,bFlg)
end;
--衣柜操作
--nDressID 操作时装ID
function CFashionDressSystem:ChangeBoxList(nDressID,bFlg)
	local tInfo = self.setFashionDress[nDressID];
	if not self.setFashionDress[nDressID] then 
		_err("not have this Dress");
		return 
	end
	self.setFashionDress[nDressID].bInBox = bFlg;
	self.objDBQuery:UpdateFashionDressBox(nDressID,
										self.setFashionDress[nDressID].bInBox);
	self:AttributeChange();
	--同步衣柜信息
	self:SendBoxList()
end;

--同步衣柜信息
function CFashionDressSystem:SendBoxList()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CFashionDressSystem:ViewFailResult");
		return;
	end;
	local tInBox = {};
	for k,v in pairs(self.setFashionDress)do
		if v.bInBox then
			table.insert(tInBox,k);
		end
	end
	objPlayer.FashionDressInBoxListMsg{tInBox = tInBox};
end

--是否在衣柜里
--nDressID 操作时装ID
function CFashionDressSystem:AddBoxNum()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CFashionDressSystem:ViewFailResult");
		return;
	end;
	if self.nBoxNum >= #FashionDressConfig.ClothBox then
		_err("BoxNum is full");
		return
	end
	local tInfo = FashionDressConfig.ClothBox[self.nBoxNum+1]
	local isEnough, _ = self.ItemSystem:CheckDelEnumItemInPacketCond(tInfo.nItemID, tInfo.nNum);
	if not isEnough then
		return;
	end
	--扣除物品
	self.ItemSystem:DelEnumItemInPacket(tInfo.nItemID, tInfo.nNum, false, _G.ItemSysOperType.FashionDress);
	self.nBoxNum = self.nBoxNum + 1;
	self.objDBQuery:UpdateFashionBoxNum(self.nBoxNum)
	objPlayer.FashionDressBoxNumMsg{nBoxNum = self.nBoxNum}
end;

-- 检查删除穿在身上的时装
function CFashionDressSystem:CheckDelete()
    for k, v in pairs(self.setEquipDress) do
        if not self.setFashionDress[v.dressId] then
            -- 如果时装已经过时删除 则必须脱掉
            self:EquipOperator(v.dressId, FashionDressConfig.OperMsgType.TakeOff, false);
        end
    end
end


