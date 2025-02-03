--[[
	[\brief：暗器系统
	[\author：沈祺
	[\date：2014-04-22
	[类似于名剑系统；
	[暗器可以升级可以升阶，消耗道具;
	[使用暗器需要毒标类物品;
	]]

--系统对象
_G.CHiddenWeaponSystem = {};
--脚本
local oScript = _G.HiddenWeaponScript;

--[[
	[\brief 系统构造
	[系统构造
	[\return object 系统对象
	]]
function CHiddenWeaponSystem:new()
	local obj = CSystem:new("CHiddenWeaponSystem");
	for i,v in pairs(CHiddenWeaponSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end
	end;
	return obj;
end

--[[
	[\brief 初始化数据结构
	[初始化数据结构
	[\param bool bIsChangeLine 是否换线
	]]
function CHiddenWeaponSystem:Create(bIsChangeLine)
	local oPlayer = self:GetPlayer();

	local oDB = oPlayer:GetDBQuery();
	if not oDB then
		return;
	end
	self.oDBQuery = CHiddenWeaponDB:New(oDB, self);
	self.oHiddenWeapon = {};

	local oData =  oPlayer:GetLineData("CHiddenWeaponSystem")[1];
	if(#oData == 0) then
		if not self.oDBQuery:InsertHiddenWeaponInfo() then
			_err("err InsertHiddenWeaponInfo by UseItemUpLevel");
		end
		self.oHiddenWeapon.nExp = 0;
		self.oHiddenWeapon.nLevel = 1;
		self.oHiddenWeapon.bIsOpen = false;
		return;
	end
	if(oData[1].dwRoleID ~= 0) then
		self.oHiddenWeapon.nExp = oData[1].dwHiddenWeaponExp;
		self.oHiddenWeapon.nLevel = oData[1].dwHWLevel;
		self.oHiddenWeapon.bIsOpen = oData[1].bIsOpen;
	end

	--初始化人物属性
	self:UpDatePro(self.oHiddenWeapon.nLevel);
end

--[[
	[\brief 进入换线
	[进入换线
	]]
function CHiddenWeaponSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local tInfo ={};
	tInfo.dwRoleID = objPlayer:GetRoleID();
	tInfo.dwHiddenWeaponExp = self.oHiddenWeapon.nExp;
	tInfo.dwHWLevel = self.oHiddenWeapon.nLevel;
	tInfo.bIsOpen = self.oHiddenWeapon.bIsOpen;
	local tbl = {};
	table.insert(tbl, tInfo);
	objPlayer:SetLineData("CHiddenWeaponSystem",tbl);
end

--[[
	[\brief 进入场景同步信息
	[进入场景同步暗器系统相关数据
	]]
function CHiddenWeaponSystem:OnEnterScene()
	--权限
	if not self:HasAuthority("HiddenWeapon") then
		return;
	end

	local oPlayer = self:GetPlayer();
	if self.oHiddenWeapon then
		--同步数据
		self:SendHiddenWeaponData();
		--同步天官赐福值
		self:SynTianGuanCiFu();
	end
end

--[[
	[\brief 获得权限
	[获得权限
	[\param string szAuthName 系统名称
	]]
function CHiddenWeaponSystem:EventGetAuthority(szAuthName)
	if szAuthName == "HiddenWeapon" then
		if self.oHiddenWeapon.nLevel == 0 then
			self.oHiddenWeapon.nLevel = 1;
		end
		self:UpDatePro(self.oHiddenWeapon.nLevel);
		self:SendHiddenWeaponData();
	end
end;

--[[
	[\brief 同步客户端暗器数据
	[同步客户端暗器数据
	]]
function CHiddenWeaponSystem:SendHiddenWeaponData()
	self:GetPlayer().HW_UpdateValueMsg{	value = self.oHiddenWeapon.nExp,
										level = self.oHiddenWeapon.nLevel};
	self:GetPlayer().HW_OpenToCloseMsg{isOpen = self.oHiddenWeapon.bIsOpen};
end


--[[
	[\brief 暗器系统状态改变
	[客户端请求暗器系统状态改变
	[\param bool bIsOpen 是否开启
	]]
function CHiddenWeaponSystem:ChangeOpenFlg()
	--权限
	if not self:HasAuthority("HiddenWeapon") then
		return;
	end

	local oItemSystem = self.objPlayer:GetSystem("CItemSystem");
	if not oItemSystem then
		_info("oItemSystem == nil by CHiddenWeaponSystem:ChangeOpenFlg");
		return;
	end

	if not self.oHiddenWeapon.bIsOpen then
		--判背包里是否有毒标物品
		local tUseItems = oScript.GetUseItem();
		for i,v in pairs(tUseItems) do
			--检测背包是否有毒标
			local bIsEnough = oItemSystem:CheckDelEnumItemInPacketCond(v, 1);
			if not bIsEnough then
				return;
			end
		end
	end

	self.oHiddenWeapon.bIsOpen = not self.oHiddenWeapon.bIsOpen;
	self.oDBQuery:UpdateDB();

	self:GetPlayer().HW_OpenToCloseMsg{ isOpen = self.oHiddenWeapon.bIsOpen };
end

--[[
	[\brief 更新属性
	[根据暗器配表更新对应增加的人物属性
	]]
function CHiddenWeaponSystem:UpDatePro()
	if not self:HasAuthority("HiddenWeapon") then
		return;
	end
	local nLevel = self.oHiddenWeapon.nLevel;
	local tLevelInfo = oScript.GetLevelInfoBylevel(nLevel);
	local tAttr = _G.SSingleAttrChange:new();
	tAttr:AddValue(tLevelInfo);
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyHiddenweaponUpdate(tAttr);
end

--[[
	[\brief 权限系统
	[权限系统未调用
	[\param string sEventName 事件
	]]
function CHiddenWeaponSystem:OnEventCenter(sEventName)
	--是否有暗器权限
	if sEventName == "EventLevelUp" then
		if not self:HasAuthority("HiddenWeapon") then
			return;
		end
		if self.oHiddenWeapon.nLevel == 0 then
			self.oHiddenWeapon.nLevel = 1;
		end
		--升级并开启了暗器权限
		self:UpDatePro(self.oHiddenWeapon.nLevel);
		self:GetPlayer().HW_UpdateValueMsg{	value = self.oHiddenWeapon.nExp,
											level = self.oHiddenWeapon.nLevel};
	end
end

--[[
	[\brief 检查客户端发过来的物品是否合法
	[检查客户端发过来的物品是否合法
	[\param number nItemId 物品ID
	[\param number nItemNum 物品数量
	[\return bool 是否合法的物品
	]]
function CHiddenWeaponSystem:CheckItem(nItemId,nItemNum)
	--判nItemId
	local tItems = oScript.GetAddExpItem();
	local bIsHave = false;
	for i,v in pairs(tItems) do
		if i == nItemId then
			bIsHave = true;
		end
	end
	if not bIsHave then
		_err("nItemId ~= addExpItem by UseItemUpLevel");
		return false;
	end

	--判数量
	if nItemNum <= 0 then
		_err("nItemNum <= 0 by UseItemUpLevel");
		return false;
	end

	--判使用数量合法性
	local nMax = oScript.GetCurClassMaxExpByLevel(self.oHiddenWeapon.nLevel);
	if self.oHiddenWeapon.nExp == nMax then
		return false;
	end
	--差值
	local nNum = (nMax - self.oHiddenWeapon.nExp) / oScript.GetUseItemExp(nItemId);
	if math.ceil(nNum) < nItemNum then
		return false;
	end

	return true;
end

--[[
	[\brief 使用物品升级暗器
	[根据暗器配表使用对应物品升级暗器
	[\param number nItemId 物品ID
	[\param number nItemNum 物品数量
	]]
function CHiddenWeaponSystem:UseItemUpLevel(nItemId, nItemNum)
	--权限
	if not self:HasAuthority("HiddenWeapon") then
		return;
	end

	--判断是否到顶级
	if self.oHiddenWeapon.nLevel == oScript.GetMaxLevelNum() then
		return;
	end

	if not self:CheckItem(nItemId, nItemNum) then
		return;
	end
	local oItemSystem = self.objPlayer:GetSystem("CItemSystem");
	if not oItemSystem then
		_info("oItemSystem == nil by CHiddenWeaponSystem:UseItemUpLevel");
		return;
	end
	--检测背包是否有足够的物品
	local bIsEnough = oItemSystem:CheckDelEnumItemInPacketCond(	nItemId,
																nItemNum);
	if not bIsEnough then
		_err("err nItemNum by UseItemUpLevel");
		return;
	end
	--使用物品
	local nAddExp = nItemNum * oScript.GetUseItemExp(nItemId);
	--先扣物品
	oItemSystem:DelEnumItemInPacket(	nItemId,
										nItemNum,
										false,
										_G.ItemSysOperType.HiddenWeapon);
	self:addExp(nAddExp);
end

--[[
	[\brief 暗器加经验
	[暗器加经验,同步同步客户端，
	[保存数据库
	[\param number nAddExp 经验值
	]]
function CHiddenWeaponSystem:addExp(nAddExp)
	--顶级判断
	if self.oHiddenWeapon.nLevel == oScript.GetMaxLevelNum() then
		return;
	end
	local tLastExp = oScript.GetLevelInfoBylevel(oScript.GetMaxLevelNum() - 1);
	--加经验,需要升阶才能加属性升级
	local nMax = oScript.GetCurClassMaxExpByLevel(self.oHiddenWeapon.nLevel);
	if 	nMax <= (self.oHiddenWeapon.nExp + nAddExp) and
		nMax ~= tLastExp.exerciseValue then
		self.oHiddenWeapon.nExp = nMax;
		--更新等级
		self.oHiddenWeapon.nLevel = 
			oScript.GetLevelIndexByExp(self.oHiddenWeapon.nExp);

		--同步给客户端暗器系统数据
		self:GetPlayer().HW_UpdateValueMsg{	value = self.oHiddenWeapon.nExp,
											level = self.oHiddenWeapon.nLevel};
		--更新数据库
		self.oDBQuery:UpdateDB();
		return;
	end
	--升级
	local newLevel = oScript.GetLevelIndexByExp(self.oHiddenWeapon.nExp + nAddExp);
	local tOldLevel = oScript.GetLevelInfoBylevel(self.oHiddenWeapon.nLevel);
	local newExp = self.oHiddenWeapon.nExp + nAddExp;

	local isUpLevel = false;
	if 	self.oHiddenWeapon.nLevel <= newLevel and
		tOldLevel.exerciseValue <= newExp then
		isUpLevel = true;
	end
	if 	isUpLevel then
		self.oHiddenWeapon.nLevel = self.oHiddenWeapon.nLevel + 1;
		self:UpDatePro(self.oHiddenWeapon.nLevel);
	end
	self.oHiddenWeapon.nExp = newExp;
	--同步给客户端暗器系统数据
	self:GetPlayer().HW_UpdateValueMsg{	value = self.oHiddenWeapon.nExp,
										level = self.oHiddenWeapon.nLevel};
	--更新数据库
	self.oDBQuery:UpdateDB();
end

--[[
	[\brief 使用物品升阶
	[根据暗器配表使用对应物品升阶暗器
	[\param bool bIsAutoBuyItem 是否自动购买
	[\param bool bIsUseGold 是否使用元宝
	[\param bool bIsFirstUseBind 是否使用绑定物品
	]]
function CHiddenWeaponSystem:UpClass(bIsAutoBuyItem, bIsUseGold, bIsFirstUseBind)
	--最大等级
	if oScript.GetMaxLevelNum() == self.oHiddenWeapon.nLevel then
		return;
	end
	local oPlayer = self:GetPlayer();
	--判当前经验是否可以升阶
	local nClassIndex = oScript.GetClassIndexByExp(self.oHiddenWeapon.nExp);
	local nCurClassExpMax = oScript.GetCurClassMaxExpByLevel(self.oHiddenWeapon.nLevel);
	if nCurClassExpMax ~= self.oHiddenWeapon.nExp then
		_err("nCurClassExpMax ~= nExp by UseItemUpLevel");
		return;
	end
	local oSysItem = oPlayer:GetSystem("CItemSystem")
	--判金钱
	local nNeedMoney = oScript.GetMoneyByExp(self.oHiddenWeapon.nExp);
	if not oSysItem:IsPacketMoneyEnough(nNeedMoney) then
		return;
	end

	--自动购买
	local autoBuyItem = {};
	local tItem = oScript.GetItemsByExp(self.oHiddenWeapon.nExp);
	for nItemId,nItemNum in pairs(tItem) do
		local tBuyItem = {};
		local b_IsEnough_1, n_Minus_1 = oSysItem:CheckDelEnumItemInPacketCond(	nItemId,
																				nItemNum);
		if not b_IsEnough_1 and bIsAutoBuyItem then
			tBuyItem.dwItemEnum 	= nItemId;
			tBuyItem.dwItemNumber 	= n_Minus_1;
			table.insert(autoBuyItem, tBuyItem);
		elseif not b_IsEnough_1 then
			return;
		end
	end

	--商城system
	local oMallSystem = oPlayer:GetSystem("CMallSystem");
	if not oMallSystem then
		_err("oMallSystem == nil by CHiddenWeaponSystem:UpClass");
		return;
	end

	if #autoBuyItem > 0 then
		for k, v in pairs(autoBuyItem) do
			local buySuc = false;
			if bIsUseGold then
				buySuc = oMallSystem:BuyItemByIDGold(	v.dwItemNumber,
														v.dwItemEnum)
			else
				buySuc = oMallSystem:BuyItemByIDBindGold(	v.dwItemNumber,
															v.dwItemEnum)
			end
			if not buySuc then
				_err("auto buy error!!!");
				return;
			end
		end;
	end;

	--天官赐福
	local oTianGuanCiFuSystem = oPlayer:GetSystem("CTianGuanCiFuSystem");
	local bIsSuc = false;
	local nTgValue = oTianGuanCiFuSystem:Get_HiddenWeapon();

	local nSuccessRate	= HiddenWeaponConfig.SuccessRate(nClassIndex,nTgValue);
	bIsSuc = oTianGuanCiFuSystem:IsHiddenWeaponMax();
	if not bIsSuc then
		if math.random(1, 10000) <= nSuccessRate then
			bIsSuc = true;
		end
	end

	--扣钱
	oSysItem:CostPacketMoney(	nNeedMoney,
								_G.ItemSysOperType.HiddenWeapon);
	--扣物品
	for nItemId, nItemCount in pairs(tItem) do
		oSysItem:DelEnumItemInPacket(	nItemId,
										nItemCount,
										bIsFirstUseBind,
										_G.ItemSysOperType.HiddenWeapon);
	end
	--升阶成功
	if bIsSuc then
		--组织升级后的数据结构
		self.oHiddenWeapon.nLevel = self.oHiddenWeapon.nLevel + 1;
		--同步客户端
		oPlayer.HW_UpdateValueMsg{	value = self.oHiddenWeapon.nExp,
									level = self.oHiddenWeapon.nLevel};
		--同步数据库
		self.oDBQuery:UpdateDB();
		--更新人物属性
		self:UpDatePro(self.oHiddenWeapon.nLevel);

		--公告
		if oScript.GetMessageClass() <= nClassIndex then
			CGameApp.HW_AllNoticeMsg{
				playerId = oPlayer:GetRoleID();
				playerName = oPlayer:GetName();
				level = self.oHiddenWeapon.nLevel;
			};
		end
		--天官赐福
		local dwBegin = oTianGuanCiFuSystem:Get_HiddenWeapon();
		local dwEnd = 0;
		CLogSystemManager:cifu(	oPlayer, 11,
								self.oHiddenWeapon.nLevel,
								1,
								dwBegin,
								dwEnd);
		oTianGuanCiFuSystem:Set_HiddenWeapon(0);
	else
		oTianGuanCiFuSystem:Add_HiddenWeapon(nClassIndex);
	end
end

--[[
	[\brief 天官赐福同步客户端
	[天官赐福同步客户端
	]]
function CHiddenWeaponSystem:SynTianGuanCiFu()
	local oSystem = self.objPlayer:GetSystem("CTianGuanCiFuSystem");
	local nValue = oSystem:Get_HiddenWeapon();
	self.objPlayer.HW_HiddenWeapon_TGCFMsg{Value = nValue};
end;

--[[
	[\brief 同步给客户端暗器系统数据
	[同步给客户端暗器系统数据
	[\param number nExp 暗器经验
	[\param number nLevel 暗器等级
	[\param number nCount 扩展次数(王凌波添加)
	]]
function CHiddenWeaponSystem:HW_UpdateOtherValueMsg(nExp, nLevel, nCount)
	--同步客户端
	self:GetPlayer().HW_UpdateOtherValueMsg{value = nExp,
											level = nLevel,
											-- 王凌波添加
											nCount = nCount};
end

--[[
	[\brief 查看其他玩家暗器系统
	[同步给客户端暗器系统数据
	[\param number nRoleID 被查看的玩家ID
	]]
function CHiddenWeaponSystem:ViewOtherPlayer(nRoleID)
	_G.GSRemoteCall(nRoleID,
					"CHiddenWeaponSystem",
					"BeViewHiddenWeaponExp",
					{self:GetPlayer():GetRoleID()});
end
--[[
	[\brief 查看其他玩家暗器系统,成功
	[查看其他玩家暗器系统成功
	[\param number nFromRoleID 查看的玩家ID
	]]
function CHiddenWeaponSystem:BeViewHiddenWeaponExp(nFromRoleID)
	if not self:HasAuthority("HiddenWeapon") then
		_G.GSRemoteCall(nFromRoleID,
						"CHiddenWeaponSystem",
						"HW_UpdateOtherValueMsg",
						{	0,
							0,
							-- 王凌波添加，扩展
							0},
						nil);
		return;
	else
		_G.GSRemoteCall(nFromRoleID,
						"CHiddenWeaponSystem",
						"HW_UpdateOtherValueMsg",
						{	self.oHiddenWeapon.nExp,
							self.oHiddenWeapon.nLevel,
							-- 王凌波添加，扩展
							self:GetPlayer():GetSystem("CKungFuExtendSystem"):
								GetCount(KungFuEnum.HiddenWeapon)},
						nil);
	end
end

--[[
	[ \brief 技能触发
	[ 通过配表的概率触发技能
	[ \param bool 是否可以加经验（加经验规则,大于或小于10级的怪不能加经验）
	[ \return number nSKillID 返回当前触发的技能id
	]]
function CHiddenWeaponSystem:SkillEffect(bIsAddExp)
	--暗器未开启
	if not self.oHiddenWeapon.bIsOpen then
		return;
	end
	local oPlayer = self:GetPlayer();

	local nRandomValue = math.random(0, 10000);
	local nConfigRand = oScript.GetSkillRate(self.oHiddenWeapon.nLevel);
	--未触发
	if nRandomValue > nConfigRand then
		return 0;
	end

	--扣物品
	local oSysItem = oPlayer:GetSystem("CItemSystem")
	for k, nItemId in pairs(oScript.GetUseItem()) do
		local isOK, _ = oSysItem:DelEnumItemInPacket(	nItemId,
										1,
										false,
										_G.ItemSysOperType.HiddenWeapon);
		--判物品
		if not isOK then
			return;
		end
	end
	if bIsAddExp then
		--加经验
		self:addExp(oScript.GetUseSkillExp());
	end

	return oScript.GetBaseSkillId();
end

--[[
	[ \brief 获取本系统等级
	[ \return number 本系统等级
	[ 王凌波添加
	]]
function CHiddenWeaponSystem:getLevel()
	return self.oHiddenWeapon.nLevel
end
