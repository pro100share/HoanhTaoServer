----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------婚宴相关----------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
--举办婚宴
function CMarriageSystem:HoldBanquet(level)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error can not get player by CMarriageSystem:HoldBanquet");
		return;
	end;
	--如果未婚，出错，返回
	if not self.Married then return end;
	--如果钱不够，出错，返回
	if not self.ItemSystem:IsPacketMoneyEnough(_G.MarriageBanquetConfig.HoldBanquetMoney[level]) then return end;
	if not _G.MarriageBanquetConfig.HoldBanquetLove[level] then
		return;
	end;
	if self.dwLove < _G.MarriageBanquetConfig.HoldBanquetLove[level] then return end;
	--记入婚宴列表
	local playerInfo = objPlayer:GetInfo();
	----得到角色性别
	local IsMale = _G.MarriageSex[playerInfo.dwProf];
	local husbandRoleID;
	if IsMale then
		husbandRoleID	= playerInfo.dwRoleID;	--丈夫roleID
	else
		husbandRoleID	= self.MateRoleID;	--丈夫roleID
	end;
	self.OrderBanquetLevel = level;
	CKernelApp.MarBanMgr_OrderBanquetMsg{_aid = objPlayer.dwAccountID, HusbandRoleID = husbandRoleID};
end;
--KS对预约婚宴的应答
function CMarriageSystem:RespondOrderBanquet(isOK, orderID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error can not get player by CMarriageSystem:HoldBanquet");
		return;
	end;
	if isOK then
		--得到角色性别
		local playerInfo = objPlayer:GetInfo();
		local IsMale = _G.MarriageSex[playerInfo.dwProf];
		--婚宴信息
		local info = {};
		info.instID = orderID;
		if IsMale then
			info.husbandRoleID	= playerInfo.dwRoleID;	--丈夫roleID
			info.husbandName	= playerInfo.szRoleName;
			info.wifeRoleID		= self.MateRoleID;
			info.wifeName		= self.MateName;
		else
			info.husbandRoleID	= self.MateRoleID;	--丈夫roleID
			info.husbandName	= self.MateName;
			info.wifeRoleID 	= playerInfo.dwRoleID;
			info.wifeName		= playerInfo.szRoleName;
		end;
		if not self.ItemSystem:IsPacketMoneyEnough(_G.MarriageBanquetConfig.HoldBanquetMoney[self.OrderBanquetLevel]) then
			CKernelApp.MarBanMgr_CancelOrderBanquetMsg{_aid = objPlayer.dwAccountID, HusbandRoleID = info.husbandRoleID};
			return;
		end;
		local holdTime = _G.CTimeFormat:GetTodayThisTimeMsec(_G.MarriageBanquetConfig.BanquetHoldTime.Hour, _G.MarriageBanquetConfig.BanquetHoldTime.Minute);
		--如果已经过了今天举办的时间，则明天举办
		if holdTime < GetCurTime() then
			holdTime = holdTime + ONE_DAY_MSEC;
		end;
		info.holdTime 	= holdTime;						--举办时间
		info.holdLine 	= CKernelApp.dwLineID;			--举办线路
		info.holdPlace 	= _G.MarriageBanquetConfig.BanquetHoldPlace;	--举办地点
		info.holdLevel 	= self.OrderBanquetLevel;		--举办规模 1-3
		
		local isSuc, reason = _G.CMarriageBanquetMgr:AddNewBanquet(info);
		--扣钱
		if isSuc then
			self.ItemSystem:CostPacketMoney(_G.MarriageBanquetConfig.HoldBanquetMoney[self.OrderBanquetLevel], _G.ItemSysOperType.Banquet);		
			--通知事件中心
			objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventMarryDinner, 1);
			--通知好友mgr婚宴开始
			_G.CFriendManager:NotifyHeldBanquet(info.wifeRoleID, info.husbandRoleID, true);
		else
			CKernelApp.MarBanMgr_CancelOrderBanquetMsg{_aid = objPlayer.dwAccountID, HusbandRoleID = info.husbandRoleID};
		end;
		--给客户端反馈
		objPlayer.MarSys_HoldMarryBanquetAnswerMsg{Reason = reason};
	else--已经预约了--给客户端反馈
		objPlayer.MarSys_HoldMarryBanquetAnswerMsg{Reason = _G.MarriageError.eIsHaveBanquetInList};
	end;
	self.OrderBanquetLevel = nil;
end;

--通知客户端婚宴结束可以领取红包
function CMarriageSystem:BanquetOver()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("can not get player by CMarriageSystem:BanquetOver");
		return;
	end;
	objPlayer.MarSys_MarryBanquetOverMsg{};
end;

--客户端查询婚宴列表
function CMarriageSystem:RequestBanquetList()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error can not get player by CMarriageSystem:RequestBanquetList");
		return;
	end;
	CKernelApp.MarBanMgr_RequestBanquetListMsg{_aid = objPlayer.dwAccountID};
end;

--看看是否已经给过这场婚宴贺礼
function CMarriageSystem:IsAlreadyGiveMoney(banquetID)
	return self.GiveMoneyList[banquetID];
end;

--看看是否已经吃过这桌
function CMarriageSystem:IsAlreadyEatThis(objNpcID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error can not get player by CMarriageSystem:IsAlreadyEatThis");
		return true;
	end;
	local curLine = CKernelApp.dwLineID;
	if not self.EatBanquetList[curLine] then
		self.EatBanquetList[curLine] = {};
	end;
	return self.EatBanquetList[curLine][objNpcID];
end;

--点击餐桌，弹出吃酒席面板
function CMarriageSystem:OpenEatPanel(objNpcID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error can not get player by CMarriageSystem:OpenEatPanel");
		return;
	end;
	--通过NpcID找到婚宴ID
	local banquetID = _G.CMarriageBanquetMgr.NpcToBanquet[objNpcID].banquetID;
	--当前选择NpcID
	self.SelectNpcID = objNpcID;
	--是否已经是第二天吃宴席
	if not _G.CTimeFormat:isToday(self.LastEatTime) then
		self.EatBanquetList = nil;
		self.EatBanquetList = {};
		self.EatTimes = 0;
	end;
	--找到婚宴对象
	local banquet = _G.CMarriageBanquetMgr:GetBanquetObject(banquetID);
	--如果已经给过礼金，则弹出确定吃酒席面板
	if self:IsAlreadyGiveMoney(banquetID) then
		--先查看是否已经吃过这桌
		if self:IsAlreadyEatThis(objNpcID) then
			objPlayer.MarSys_ShowEatMarriageBanquetPanelMsg{Reason = _G.MarriageError.eAlreadyEatThis};
			return;
		end;
		if self.EatTimes >= _G.MarriageBanquetConfig.MaxEatTimes then
			objPlayer.MarSys_ShowEatMarriageBanquetPanelMsg{Reason = _G.MarriageError.eAlreadyEatFull};
			return;
		end;
		local eatTimes = _G.CMarriageBanquetMgr.NpcToBanquet[objNpcID].eatTimes;
		objPlayer.MarSys_ShowEatMarriageBanquetPanelMsg{EatTimes = eatTimes, BanquetLevel = banquet.holdLevel, SelfEatTimes = self.EatTimes};
	else--如果没有给过礼金，则弹出赠送礼金面板
		local banquetInfo = {
			BanquetID	= banquet.instID;
			HusbandName = banquet.husbandName;
			WifeName	= banquet.wifeName;
			HusbandRoleID = banquet.husbandRoleID;
			WifeRoleID 	= banquet.wifeRoleID;
			Level		= banquet.holdLevel;
		};
		objPlayer.MarSys_ShowGiveMarryMoneyPanelMsg{BanquetInfo = banquetInfo};
	end;
end;

--给roleID礼金
function CMarriageSystem:GiveMarryMoneyTo(roleID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error can not get player by CMarriageSystem:GiveMarryMoneyTo");
		return;
	end;
	CKernelApp.MarBanMgr_RequestGiveMarryMoneyToMsg{_aid = objPlayer.dwAccountID, RoleID = roleID};
end;

--给toBanquetID婚宴送红包
function CMarriageSystem:GiveMarryMoney(toBanquetID, money)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error can not get player by CMarriageSystem:GiveMarryMoney");
		return;
	end;
	CKernelApp.MarBanMgr_RequestGiveMarryMoneyMsg{_aid = objPlayer.dwAccountID, ToBanquetID = toBanquetID, Money = money};
end;
function CMarriageSystem:RespondGiveMarryMoney(banquet, money)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error can not get player by CMarriageSystem:RespondGiveMarryMoney");
		return;
	end;
	--检测是否是自己给自己礼金
	local selfRoleID = objPlayer:GetRoleID();
	if banquet.husbandRoleID == selfRoleID or banquet.wifeRoleID == selfRoleID then return end;
	--检测给钱是否满足最低消费
	local leastMoney = _G.MarriageBanquetConfig.NeedMoney(objPlayer:GetInfo().dwLevel, banquet.holdLevel);
	if money < leastMoney then return end;
	--检测钱是否足够
	if not self.ItemSystem:IsPacketMoneyEnough(money) then return end;
	--扣钱
	self.ItemSystem:CostPacketMoney(money, _G.ItemSysOperType.Banquet);
	
	--记录到自己的赠送礼金列表中
	if self:IsAlreadyGiveMoney(banquet.instID) then
		self.GiveMoneyList[banquet.instID] = self.GiveMoneyList[banquet.instID] + money;
		--记数据库update
		CKernelApp.MarBanMgr_RecordGiveMarryMoneyMsg{
			BanquetID	= banquet.instID;
			GuestRoleID	= objPlayer:GetRoleID();
			GuestName	= objPlayer:GetInfo().szRoleName;
			GiftMoney	= self.GiveMoneyList[banquet.instID];
			GuestLevel	= objPlayer:GetInfo().dwLevel;
			BInsert		= false;
		};
	else
        self.GiveMoneyList[banquet.instID] = money;
		--记数据库insert
		CKernelApp.MarBanMgr_RecordGiveMarryMoneyMsg{
			BanquetID	= banquet.instID;
			GuestRoleID = objPlayer:GetRoleID();
			GuestName	= objPlayer:GetInfo().szRoleName;
			GiftMoney	= money;
			GuestLevel	= objPlayer:GetInfo().dwLevel;
			BInsert		= true;
		};
	end;
	objPlayer.MarSys_GiveMarryMoneyResMsg{};
end;

--玩家确定吃酒席
function CMarriageSystem:SureEatBanquet()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error can not get player by CMarriageSystem:SureEatBanquet");
		return;
	end;
	local line = CKernelApp.dwLineID;
	local reason, banquetLevel = _G.CMarriageBanquetMgr:Eat(self.SelectNpcID);
	if reason > 0 then
		objPlayer.MarSys_EatBanquetResultMsg{Reason = reason};
		return;
	end;
	--加真气
	local addEnergy = _G.MarriageBanquetConfig.AddEnergy(objPlayer:GetInfo().dwLevel, banquetLevel);
	objPlayer:GetSystem("CFiveElemSystem"):ChangeAttrAll(addEnergy,  _G.FiveElemSysOperType.Marriage);
	--加经验
	local addExp = _G.MarriageBanquetConfig.AddExp(objPlayer:GetInfo().dwLevel, banquetLevel);
	objPlayer:AddExp(addExp);
	--将npc放入已食用列表
	if not self.EatBanquetList[line] then
		self.EatBanquetList[line] = {};
	end;
	self.EatBanquetList[line][self.SelectNpcID] = true;
	--自己食用次数+1
	self.EatTimes = self.EatTimes + 1;
	--记录上一次吃宴席时间
	self.LastEatTime = GetCurTime();
	--记录食用数据库
	self.objDBQuery:SaveEatBanquetInfo(self.EatBanquetList, self.LastEatTime);
	--广播吃饭动作
	local RoleID = objPlayer:GetRoleID();
	----发给视野中的人
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	local objMap = objMapSystem:GetCurMap();
	if not objMap then
		return;
	end;
	local setViewPlayer = objMap:GetCanLookPlayer(objPlayer);
	if not setViewPlayer then
		return;
	end;
	for k, v in pairs(setViewPlayer) do		
		local objMarriageSys = v:GetSystem("CMarriageSystem");
		if objMarriageSys then
			objMarriageSys:BroadcastEatAction(RoleID, _G.MarriageBanquetConfig.EatAction);
		end
	end
	--抛事件，通知事件中心
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventEatMarryBanquet, 1);
end;

--广播吃宴席动作
function CMarriageSystem:BroadcastEatAction(roleID, actionID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error can not get player by CMarriageSystem:BroadcastEatAction");
		return;
	end;
	objPlayer.MarSys_BroadcastEatActionMsg{RoleID = roleID, ActionID = actionID};
end;

--客户端查询红包列表
function CMarriageSystem:GetMarryMoneyRequest()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error can not get player by CMarriageSystem:GetMarryMoneyRequest");
		return;
	end;
	--得到角色性别
	local IsMale = _G.MarriageSex[objPlayer:GetInfo().dwProf];
	--检测自己是否有婚宴的礼金未领取
    self.MarryMoneyBanquetList = {};
	self.MarryMoneyGuestList = {};
    CKernelApp.MarBanMgr_GetMarryMoneyRequestMsg{_aid = objPlayer:GetAccountID(), RoleID = objPlayer:GetRoleID(), IsMale = IsMale}
end;


function CMarriageSystem:RespondGetMarryMoneyGuestList(GuestList)
    for k, v in pairs(GuestList) do
        table.insert(self.MarryMoneyGuestList, v);
    end;
end;
function CMarriageSystem:RespondGetMarryMoneyBanquetList(BanquetList)
    self.MarryMoneyBanquetList = BanquetList;
end;
--客户端查询红包列表应答
function CMarriageSystem:RespondGetMarryMoneyEnd(MateRecv)
    local objPlayer = self:GetPlayer();
	objPlayer.MarSys_GetMarryMoneyAnswerMsg{GuestList = self.MarryMoneyGuestList, MateRecv = MateRecv};
end;

--玩家确定领取红包
function CMarriageSystem:SureGetMarryMoney()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error can not get player by CMarriageSystem:SureGetMarryMoney");
		return;
	end;
	if not self.MarryMoneyBanquetList or (#self.MarryMoneyBanquetList == 0) then return end;
	if not self.MarryMoneyGuestList or (#self.MarryMoneyGuestList == 0) then return end;
	--得到角色性别
	local IsMale = _G.MarriageSex[objPlayer:GetInfo().dwProf];
	--得到宾客列表
	local sumMoney = 0;
	for k, v in pairs(self.MarryMoneyGuestList) do
		sumMoney = sumMoney + v.money;
	end;
	--领取完成记录
    CKernelApp.MarBanMgr_SureGetMarryMoneyMsg{RoleID = objPlayer:GetRoleID(), BanquetList = self.MarryMoneyBanquetList, IsMale = IsMale};
	self.MarryMoneyBanquetList = nil;
	self.MarryMoneyGuestList = nil;
	--加钱
	self.ItemSystem:AddPacketMoney(math.ceil(sumMoney/2), _G.ItemSysOperType.Banquet);
end;



