--[[
	[ \brief：护身镜系统
	[ \author：沈祺
	[ \date：2014-06-16
	[ 护身镜系统为暗器系统姊妹篇
	[ 主要是抵抗暗器技能BUFF等
	]]

-- 系统对象
_G.CShieldSystem = {};

--配表文件
local tConfig = _G.CShieldConfig;

--物品类型
_G.CShieldSystem.DEFINE =
{
	ITEMTYPE = 1;	--物品
	GOLDTYPE = 2;	--元宝
	COUNT1 = 1;		--次数索引
	COUNT2 = 2;		--次数索引
	COUNT3 = 3;		--次数索引
	INFINITE = -1;	--无限次数特化数字
};

--[[
	[ \brief 系统构造
	[ \return object 系统对象
	]]
function CShieldSystem:new()
	local obj = CSystem:new("CShieldSystem");
	for i,v in pairs(CShieldSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end
	end
	return obj;
end

--[[
	[ \brief 初始化数据结构
	[ \return bool 是否创建成功
	]]
function CShieldSystem:Create()
	self.tShieldInfo = {};		-- 盾牌数据
	self.tShieldInfo.nExp = 0;	-- 经验

	--消耗物品信息,先取表中数据,在通过数据库改变使用次数
	self.tShieldInfo.tCount = {};
	self.oDBQuery = CShieldDB:new(self:GetPlayer():GetDBQuery(), self);
	local oData = self:GetPlayer():GetLineData("CShieldSystem")[1];	--取数据库
	if not oData.nExp then
		if not self.oDBQuery:InsertShieldInfo() then
			--插入数据库失败
			_err("InsertShieldInfo by CShieldSystem:Create,PlayerID",
				self.GetPlayer():GetRoleID());
		end
		self.tShieldInfo.nExp = 0;
		self.tShieldInfo.tCount[1] = tConfig:GetItemInfo(
										_G.CShieldSystem.DEFINE.COUNT1).Count;
		self.tShieldInfo.tCount[2] = tConfig:GetItemInfo(
										_G.CShieldSystem.DEFINE.COUNT2).Count;
		self.tShieldInfo.tCount[3] = tConfig:GetItemInfo(
										_G.CShieldSystem.DEFINE.COUNT3).Count;
		return;
	end
	self.tShieldInfo.nExp = oData.nExp;
	self.tShieldInfo.tCount[1] = oData.nCount1;
	self.tShieldInfo.tCount[2] = oData.nCount2;
	self.tShieldInfo.tCount[3] = oData.nCount3;
	self:ConfigCheck();	

	if self:HasAuthority("Shield") then
		self:UpdatePro();
	end
	return true;
end

--[[
	[ \brief 获得经验值
	]]
function CShieldSystem:GetExp()
	return self.tShieldInfo.nExp;
end

--[[
	[ \brief 切线
	]]
function CShieldSystem:OnChangeLineBegin()
	self:GetPlayer():SetLineData("CShieldSystem",{
		nRoleID = self:GetPlayer():GetRoleID();
		nExp = self.tShieldInfo.nExp;
		nCount1 = self.tShieldInfo.tCount[1];
		nCount2 = self.tShieldInfo.tCount[2];
		nCount3 = self.tShieldInfo.tCount[3];});
end

--[[
	[ \brief 进入场景
	]]
function CShieldSystem:OnEnterScene()
	if not self:HasAuthority("Shield") then
		return;
	end
	-- 同步客户端
	self:SendShieldInfo(false);
end

--[[
	[ \brief 获得权限
	[ \param string szAuthName 系统名称
	]]
function CShieldSystem:EventGetAuthority(szAuthName)
	if szAuthName == "Shield" then
		self:UpdatePro();
		self:SendShieldInfo(false);
	end
end

--[[
	[\brief 定时将数据库中修炼次数清零
  	]]
function CShieldSystem:ResetPracticeTimes()
	if not self:HasAuthority("Shield") then
		return;
	end
	self.tShieldInfo.tCount[1] = tConfig:GetItemInfo(1).Count;
	self.tShieldInfo.tCount[2] = tConfig:GetItemInfo(2).Count;
	self.tShieldInfo.tCount[3] = tConfig:GetItemInfo(3).Count;
	self:SendShieldInfo(false);
end

--[[
	[ \brief 次数配表检测，防止策划将无限次数物品删除或添加
	[ 防止策划将最大次数下调
	]]
function CShieldSystem:ConfigCheck()
	local bSave = false;
	for i, v in pairs(self.tShieldInfo.tCount) do
		local tItemCount = tConfig:GetItemInfo(i);
		--数据库是无限次数,配表不是
		if v == _G.CShieldSystem.DEFINE.INFINITE and
			tItemCount.Count ~= _G.CShieldSystem.DEFINE.INFINITE then
			self.tShieldInfo.tCount[i] = tItemCount.Count;
			bSave = true;
		--数据库不是无限次数,配表是
		elseif v ~= _G.CShieldSystem.DEFINE.INFINITE and
				tItemCount.Count  == _G.CShieldSystem.DEFINE.INFINITE then
			self.tShieldInfo.tCount[i] = tItemCount.Count;
			bSave = true;
		end
		--最大次数判断
		if v > tItemCount.Count then
			self.tShieldInfo.tCount[i] = tItemCount.Count;
		end
	end
	--不是每次都要更新数据库
	if bSave then
		self.oDBQuery:UpdateDB();
	end
end

--[[
	[ \brief 同步客户端护身镜经验值
	[ \param bool bUseItem 是否使用物品加的经验
	]]
function CShieldSystem:SendShieldInfo(bUseItem)
	self:GetPlayer().ShieldSyncExpMsg{	nExp = self.tShieldInfo.nExp,
										tCount = self.tShieldInfo.tCount,
										bUse = bUseItem};
end

--[[
	[ \brief 更新人物属性
	]]
function CShieldSystem:UpdatePro()
	local tAttr = _G.SSingleAttrChange:new();
	tAttr:AddValue(tConfig:GetProInfo(tConfig:
						GetAllLevelInfo(self.tShieldInfo.nExp)));
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyShieldUpdate(tAttr);
	--更新霸体值
	self:GetPlayer():GetSystem("CTieBuShanSystem"):AddPropertyBySuit();
end

--[[
	[ \brief 权限系统
	[ \param string sEventName 事件
	]]
function CShieldSystem:OnEventCenter(sEventName)
	if sEventName == "EventLevelUp" then
		if not self:HasAuthority("Shield") then
			return;
		end
		self:UpdatePro();
		self:SendShieldInfo(false);
	end
end

--[[
	[ \brief 通过物品获得需要加成的经验值
	[ \param number nItemID 物品ID
	[ \param number nItemNum 物品数量
	[ \return number tInfo {nExp = 需要加的经验,bInfinite = 是否是无限次数}
	]]
function CShieldSystem:GetAddExpByItem(nItemID, nItemNum)
	_assert(nItemNum >= 1,"nItemNum < 1 by UseItemUpLevel");

	local tItemInfo = tConfig:CheckItem(nItemID);
	_assert(tItemInfo.Count == _G.CShieldSystem.DEFINE.INFINITE or
				self.tShieldInfo.tCount[tConfig:GetItemIndex(nItemID)] -
				nItemNum >= 0,"err Count by UseItemUpLevel");

	local oItemSystem = self:GetPlayer():GetSystem("CItemSystem");
	local nGold,nExp = 0;
	if tItemInfo.Type == _G.CShieldSystem.DEFINE.GOLDTYPE then
		nGold = tItemInfo.BaseNum * nItemNum
		nExp = nItemNum * tItemInfo.Exp;
		oItemSystem:CostGold(nGold,_G.ItemSysOperType.Shield);	--扣钱
	elseif tItemInfo.Type == _G.CShieldSystem.DEFINE.ITEMTYPE then
		nExp = nItemNum * tItemInfo.Exp;
		nItemNum = nItemNum * tItemInfo.BaseNum;
		local bIsEnough = oItemSystem:DelEnumItemInPacket(nItemID,nItemNum,
										false,_G.ItemSysOperType.Shield);
		_assert(bIsEnough, "err bIsEnough by UseItemUpLevel");
	else
		_assert(false);
	end

	return {nExp = nExp;
			bInfinite = (tItemInfo.Count == _G.CShieldSystem.DEFINE.INFINITE);
	};
end

--[[
	[ \brief 使用物品升级护身镜
	[ \param number nType	使用物品类型
	[ \param number nItemID 物品ID
	[ \param number nItemNum 物品数量
	]]
function CShieldSystem:UseItemUpLevel(nType, nItemID, nItemNum)
	_assert(self:HasAuthority("Shield"), "no Authority by UseItemUpLevel");

	_assert(tConfig:GetAllLevelInfo(self.tShieldInfo.nExp) < 
			#tConfig.LevelInfo,"level == Max by UseItemUpLevel");

	local tInfo = self:GetAddExpByItem(nItemID, nItemNum);
	if not tInfo.bInfinite then
		self.tShieldInfo.tCount[tConfig:GetItemIndex(nItemID)] = 
			self.tShieldInfo.tCount[tConfig:GetItemIndex(nItemID)] - nItemNum;
	else
		--无限次数不需要修改
	end

	local nNewLadder = tConfig:GetLevelInfo(tConfig:GetAllLevelInfo(
							self.tShieldInfo.nExp + tInfo.nExp)).nLadder;

	if nNewLadder > tConfig.MessageLadder and
			tConfig:GetLevelInfo(
					tConfig:GetAllLevelInfo(self.tShieldInfo.nExp)).nLadder <
					nNewLadder then
		CGameApp.ShieldAllNoticeMsg{playerId = self:GetPlayer():GetRoleID(),
									playerName = self:GetPlayer():GetName(),
									nExp = self.tShieldInfo.nExp + tInfo.nExp,};
	end
	
	if tConfig:GetAllLevelInfo(self.tShieldInfo.nExp + tInfo.nExp) == 
													#tConfig.LevelInfo then
		self.tShieldInfo.nExp = tConfig.LevelInfo[(#tConfig.LevelInfo) - 1].Exp
	else
		self.tShieldInfo.nExp = self.tShieldInfo.nExp + tInfo.nExp;
	end
	self:SendShieldInfo(true);
	self.oDBQuery:UpdateDB();
	self:UpdatePro();
end

--[[
	[\brief 查看其他玩家护身镜系统
	[\param number nRoleID 被查看的玩家ID
	]]
function CShieldSystem:ViewOtherPlayer(nRoleID)
	_G.GSRemoteCall(nRoleID,"CShieldSystem","BeViewShield",
									{self:GetPlayer():GetRoleID()});
end

--[[
	[\brief 查看其他玩家护身镜系统,成功
	[\param number nFromRoleID 查看的玩家ID
	]]
function CShieldSystem:BeViewShield(nFromRoleID)
	local bAuthority = false;
	local nExp = 0;
	local nCount = 0; -- 王凌波添加
	if self:HasAuthority("Shield") then
		bAuthority = true;
		nExp = self.tShieldInfo.nExp;
		-- 王凌波添加
		nCount = self:GetPlayer():GetSystem("CKungFuExtendSystem"):
			GetCount(KungFuEnum.Shield)
	end
	_G.GSRemoteCall(nFromRoleID,"CShieldSystem","UpdateOtherValueMsg",
					{bAuthority, nExp, nCount},nil);
end

--[[
	[\brief 同步给客户端盾牌系统数据
	[\param number bAuthority 是否有权限
	[\param number nExp 盾牌经验
	[\param number nCount 扩展次数(王凌波添加)
	]]
function CShieldSystem:UpdateOtherValueMsg(bAuthority, nExp, nCount)
	self:GetPlayer().ShieldLookSyncExpMsg{ bAuthority = bAuthority,
											nExp = nExp,
											-- 王凌波添加
											nCount = nCount};
end

--[[
	[\brief 获取法宝系统的等级(供外部调用的接口)
	[\return number 法宝系统的等级
	[王凌波添加，法宝扩展需要
	]]
function CShieldSystem:getLevel()
	return tConfig:GetAllLevelInfo(self.tShieldInfo.nExp)
end
