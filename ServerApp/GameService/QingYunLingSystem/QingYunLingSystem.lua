--[[
	青云令
作者：赵飞
时间：2013-07-30
青云令牌服务器逻辑处理类
]]
_G.CQingYunLingSystem = {};
local cfg = CloudMedalConfig
function CQingYunLingSystem:new()
	local obj = CSystem:new("CQingYunLingSystem");
	obj.objDBQuery = nil;    --对应的数据库操作模
	for i,v in pairs(CQingYunLingSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

function CQingYunLingSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		return false;
	end;
	self.objDBQuery = CQingYunLingSystemDB:new(objDB, self);
	self.tAll = {};	
	self.tLotteryID = {};
	self.nNum = 0;
	self.nCount = 1;
	local info = objPlayer:GetLineData("CQingYunLingSystem")[1][1];

	if info then	
		self:SetMedalInfo(info);
	else
		for k,v in pairs(cfg.YinZhangSX) do
			self.tAll[k] = 0
		end
		self.objDBQuery:InsertData(self:UpdateStr(self:GetAllInfo()))
	end;
	return true;
end;
 --[[
   [ \brief 设置所有的勋章信息
   [ \param table tInfo 更改信息
   ]]
function CQingYunLingSystem:SetAllInfo(tInfo)
	local tList = cfg.YinZhangSX;
	local nLadder = math.min(cfg:GetLadder(tInfo),cfg.OpenLadder) 
	for k,v in pairs(tInfo) do
		local dwMax = tList[k][cfg.LadderInfo[nLadder].nLevel].dwExp
		if v >= dwMax then
			tInfo[k] = dwMax;
		end
	end
	local nLadder = cfg:GetLadder(tInfo)
	if cfg:GetLadder(self.tAll) < nLadder and nLadder <= cfg.OpenLadder then
		self:BroadCast(nLadder)
	end
	self.tAll = tInfo
	self:AppendBasicProperty();
end 
--[[
   [ \brief 获取所有的勋章信息
   [ \return table 所有勋章经验
   ]]
function CQingYunLingSystem:GetAllInfo()
	return self.tAll
end 
--[[
   [ \brief 设置当前摇奖ID列表
   [ \param table tInfo 更改信息
   ]]
function CQingYunLingSystem:SetLotteryID(tInfo)
	for k ,v in pairs(tInfo) do
		self.tLotteryID[k] = v
	end
end 
--[[
   [ \brief 获取当前摇奖ID列表
   [ \return table 当前摇奖ID列表
   ]]
function CQingYunLingSystem:GetLotteryID()
	return self.tLotteryID
end
--[[
   [ \brief 设置当前摇奖次数
   [ \param number nNum 更改次数
   ]]
function CQingYunLingSystem:SetnNum(nNum)
	self.nNum = nNum
end 
--[[
   [ \brief 获取当前摇奖次数
   [ \return table 当前摇奖次数
   ]]
function CQingYunLingSystem:GetnNum()
	return self.nNum
end
--[[
   [ \brief 设置当前摇奖倍数
   [ \param number nNum 更改摇奖倍数
   ]]
function CQingYunLingSystem:SetnCount(nCount)
	self.nCount = nCount
end 
--[[
   [ \brief 获取当前摇奖倍数
   [ \return table 当前摇奖倍数
   ]]
function CQingYunLingSystem:GetnCount()
	return self.nCount
end

--解析修行阶段
function CQingYunLingSystem:SetMedalInfo(info)		
	-- if not self:HasAuthority("XiaYiXunZhang") then
		-- return;
	-- end;
	local tLotteryID = self:LoadStr(info["dwLotteryID"]);
	if tLotteryID then
		self:SetLotteryID(tLotteryID);
	end	
	local tAll = self:LoadStr(info["dwTotalExp"]);
	if tAll then
		self:SetAllInfo(tAll);
	end
	self:SetnNum(info["dwNum"] or 0);
	self:SetnCount(info["dwCount"] or 1);
end;
 --[[
   [ \brief 数据库字符串转换为table
   [ \param stfing str 数据库字符串
   [ \return table  t    目的信息表
   ]]
function CQingYunLingSystem:LoadStr(str)
	if(str == nil) then
		return false;
	end
	local t = {};
	local lastIndex = 0;
	local index = 1;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local value = tonumber(str1);
		t[index] = value;
		index = index + 1;
	end;
	return t;
end
 --[[
   [ \brief 将当前信息表转换为字符串
   [ \param table tInfo 需转换表
   [ \return string  str   目的字符串
   ]]
function CQingYunLingSystem:UpdateStr(tInfo)
	local strResult = ""
	for k , v in pairs(tInfo) do
		strResult =  strResult ..v ..";"
	end
	return strResult
end;
--进入游戏同步消息
function CQingYunLingSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self:HasAuthority("qingyunxunzhang") then
		return;
	end;
	objPlayer.QingYunLingInitMsg{Times = self:GetnNum();
								tAll = self:GetAllInfo();
								tLotteryID = self:GetLotteryID();
								nCount = self:GetnCount();
								tShow = {};
								};
end;
--权限变化
function CQingYunLingSystem:EventGetAuthority(szAuthName)
	if szAuthName == "qingyunxunzhang" then
		local objPlayer = self:GetPlayer();
		if not objPlayer then
			return;
		end;
		self:AppendBasicProperty();
		objPlayer.QingYunLingInitMsg{Times = self.nNum;tAll = self.tAll;tLotteryID = self.tLotteryID;nCount = self:GetnCount();tShow = {};};
	end
end;

function CQingYunLingSystem:Destroy()
	
end;

function CQingYunLingSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local info = {};
	info.dwLotteryID = self:UpdateStr(self:GetLotteryID());
	info.dwTotalExp  = self:UpdateStr(self:GetAllInfo());
	info.dwNum 		 = self:GetnNum();
	info.dwCount	 = self:GetnCount();
	local tbl = {};
	table.insert(tbl, info);
	objPlayer:SetLineData("CQingYunLingSystem",tbl);
end;
--增加基本属性
function CQingYunLingSystem:AppendBasicProperty()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local _, tAttr = cfg:GetLevelInfo(self:GetAllInfo())
	local t_attr = _G.SSingleAttrChange:new();
	if tAttr then
		for k,v in pairs(tAttr) do
			t_attr[k] = v
		end
		local skillSystem = objPlayer:GetSystem("CSkillSystem");
		skillSystem:NotifyQingYunLingProperty(t_attr);
	end;
end;
 --[[
   [ \brief 摇奖处理函数
   [ \param number 摇奖序号  -- 为 0 代表全部刷新
   ]]
function CQingYunLingSystem:OnLottery(nIndex,nCount)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if cfg:IsFull(self:GetAllInfo()) then
		return;
	end
	local itemSystem = objPlayer:GetSystem("CItemSystem")
	local nNum = self:GetnNum()
	if nIndex ~= 0 then
		local nGold = cfg:GetFlushItemInfo(self:GetAllInfo())
		if not itemSystem:IsGoldEnough(nGold) then
			return;
		end
		itemSystem:CostGold(nGold,_G.ItemSysOperType.QungYunLing)
	else
		local tCon = cfg:GetConItemInfo(self:GetAllInfo(),nCount) 
		local b_IsEnough_1, n_Minus_1 = itemSystem:CheckDelEnumItemInPacketCond(tCon.nItemID, tCon.nNum);
		if not b_IsEnough_1 then
			return;
		end;
		itemSystem:DelEnumItemInPacket(tCon.nItemID, tCon.nNum, false, _G.ItemSysOperType.QungYunLing);
	end
	local t = cfg:MakePrize(self:GetAllInfo(),nIndex)
	if not t then
		return 
	end
	self:SetnNum(nNum+1)
	self:SetnCount(nCount)
	self:SetLotteryID(t);
	self.objDBQuery:UpdateLotteryID(self:UpdateStr(self:GetLotteryID()))
	self.objDBQuery:UpdateLotteryNum(self:GetnNum())
	self.objDBQuery:UpdateLotteryCount(self:GetnCount())
	objPlayer.QingYunLingLottoryResultMsg{tPrize = t,nCount = self:GetnCount()};
end;
--使用物品获得经验
-- 返回值 1 没有权限 2 已经满级 3成功添加经验
function CQingYunLingSystem:OnUseItemGetExp(nAdd)
	if not self:HasAuthority("qingyunxunzhang") then
		return 1;
	end;
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if cfg:IsFull(self:GetAllInfo()) then
		return 2;
	end
	local tAll = {};
	for k, v in pairs(self:GetAllInfo()) do
		tAll[k] = v 
	end	
	local t = cfg:MakePrize(self:GetAllInfo(),1)
	for k,v in pairs(t) do
		tAll[v] = tAll[v] + nAdd
		break;
	end	

	self:SetAllInfo(tAll);
	self.objDBQuery:UpdateTotalExp(self:UpdateStr(self:GetAllInfo()))
	objPlayer.QingYunLingInitMsg{Times = self.nNum;tAll = self.tAll;tLotteryID = self.tLotteryID;nCount = self:GetnCount();tShow = {t[1],nAdd};};
	return 3;
end
--[[
   [ \brief 摇奖处理函数
   [ \param number 摇奖序号  -- 为 0 代表全部刷新
   ]]
function CQingYunLingSystem:OnGetPrize()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if CloudMedalConfig:IsFull(self:GetAllInfo()) then
		objPlayer.QingYunLingGetPrizeMsg{bIsGet = false};
		return
	end
	local tAll = {};
	for k, v in pairs(self:GetAllInfo()) do
		tAll[k] = v 
	end
	local tAdd = cfg:GetExpInfo(self:GetLotteryID(),self:GetnCount(),tAll)
	for k,v in pairs (tAdd) do
		tAll[k] = tAll[k] + v
	end
	self:SetAllInfo(tAll)
	self.tLotteryID = {}
	self.objDBQuery:UpdateLotteryID(self:UpdateStr(self:GetLotteryID()))
	self.objDBQuery:UpdateTotalExp(self:UpdateStr(self:GetAllInfo()))
	self.objDBQuery:UpdateLotteryCount(self:GetnCount())
	objPlayer.QingYunLingGetPrizeMsg{bIsGet = true,nCount = self:GetnCount()};
end;

--查看对方的侠义勋章
function CQingYunLingSystem:ViewOtherErrantHonor(fromRoleID)
	local objPlayer = self:GetPlayer(); 
	if not objPlayer then
		return;
	end;
	_G.GSRemoteCall(fromRoleID, "CQingYunLingSystem", "BeViewQingYunLingInfo", {objPlayer:GetRoleID()}, nil);
end;

function CQingYunLingSystem:BeViewQingYunLingInfo(dwRoleId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_G.GSRemoteCall(dwRoleId, "CQingYunLingSystem", "ViewQingYunLingResult", {false, {}}, nil);
		return;
	end;
	if not self:HasAuthority("qingyunxunzhang") then
		_G.GSRemoteCall(dwRoleId, "CQingYunLingSystem", "ViewQingYunLingResult", {false,{}}, nil);
		return;
	end;
	
	_G.GSRemoteCall(dwRoleId, "CQingYunLingSystem", "ViewQingYunLingResult", {true, self.tAll}, nil);
end;

--返回查看结果
function CQingYunLingSystem:ViewQingYunLingResult(isOK, tAll)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CQingYunLingSystem:ViewQingYunLingResult");
		return;
	end;
	objPlayer.QingYunLingIsSawByOthersMsg{tAll = tAll;bIsCan = isOK};
end;
--广播消息
function CQingYunLingSystem:BroadCast(nLadder)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CErrantHonorSystem:BroadCastErrantHonor");
		return;
	end;
	-- print("==========nLadder========",nLadder)
	--玩家姓名
	local sName = objPlayer:GetInfo().szRoleName;
	--玩家RoleID
	local nRoleID = objPlayer:GetInfo().dwRoleID;
	--全服广播
	CGameApp.QingYunLingSys_BroadCastMsg{
        sName = sName,
        nRoleID = nRoleID,
		nLadder = nLadder,
		};
end;
