--[[
功能：修城墙系统类
作者：曲莹
时间：2013-04-26 
]]

_G.CBuildRampartSystem = {};
function CBuildRampartSystem:new()
	local obj = CSystem:new("CBuildRampartSystem");
	obj.objDBQuery = nil;    --对应的数据库操作模
	for i,v in pairs(CBuildRampartSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

function CBuildRampartSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		return false;
	end;
	self.BuildAwardTbl = {};
	self.dwLabourValue = 0;
	self.dwWoodValue = 0;
	self.dwStoneValue = 0;
	self.dwStateValue = 0;
	self.dwStateFlag = false;
	self.dwDiploidExp = false;
	self.strGetAward = "";
	self.dwLabourCD = 0;
	self.dwWoodCD = 0;
	self.dwStoneCD = 0;
	self.dwContriValue = 0;
	self.IsGetAward = false;
	self.objDBQuery = CBuildRampartDB:new(objDB, self);
	if bIsChangeLine == 0 then
	--if not bIsChangeLine then
		local buildDataInfo = objPlayer:GetLineData("CBuildRampartSystem")[1];
		if buildDataInfo then
			local buildInfo = buildDataInfo[1];
			self:SetBuildInfo(buildInfo);
		else
			_err("----CBuildRampartSystem:Create----error--");
		end;
	end;
	return true;
end;
--检测死亡
function CBuildRampartSystem:OnDead()
	
end;

function CBuildRampartSystem:Update()

end;
function CBuildRampartSystem:Destroy()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	--玩家下线更新已领取奖励数据库
	self.objDBQuery:SetBuildInfo(objPlayer:GetRoleID(), "strGetAward", self.strGetAward);
end;
function CBuildRampartSystem:SetBuildAwardState(curPlan, update)
	self.BuildAwardTbl = {};
	self.BuildAwardTbl[curPlan] = update;
	self.dwStateValue = curPlan;
	self.dwStateFlag = update;
	self.IsGetAward = false;
end;
function CBuildRampartSystem:SetBuildInfo(buildDataInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local dwRoleID = objPlayer:GetRoleID();
	if not buildDataInfo then
		buildDataInfo = {};
		_err("-----SetBuildInfo--error--");
	end;
	local buildInfo = buildDataInfo[1];
	if buildInfo then
		self.BuildInfo = buildInfo;
		local dwLabour = buildInfo.dwLabourValue;   --劳力
		local dwWood = buildInfo.dwWoodValue;       --木材
		local dwStone = buildInfo.dwStoneValue;     --石材
		local dwState = buildInfo.dwState;          --修建的阶段
		local dwStateFlag = buildInfo.dwStateFlag;  --领取奖励的状态
		local dwDiploidExp = buildInfo.dwDiploidExp;--领取双倍奖励的状态
		local strGetAward = buildInfo.strGetAward;  --已领取奖励
		local dwLabourCD = buildInfo.dwLabourCD;    --劳力CD
		local dwWoodCD = buildInfo.dwWoodCD;        --木材CD
		local dwStoneCD = buildInfo.dwStoneCD;      --石料CD
		local dwContriValue = buildInfo.dwContriValue; 
		self.BuildAwardTbl = {};
		self.BuildAwardTbl[dwState] = dwStateFlag;
		self.dwLabourValue = dwLabour;
		self.dwWoodValue = dwWood;
		self.dwStoneValue = dwStone;
		self.dwDiploidExp = dwDiploidExp;
		self.strGetAward = strGetAward or "";
		self.dwLabourCD = dwLabourCD;
		self.dwWoodCD = dwWoodCD;
		self.dwStoneCD = dwStoneCD;
		self.dwContriValue = dwContriValue;
		objPlayer.SendBuildCDTimeMsg{LabourCD = self.dwLabourCD - GetCurTime(), WoodCD = self.dwWoodCD - GetCurTime(), StoneCD = self.dwStoneCD  - GetCurTime(), ExpFlag = CBuildRampartMgr:GetBuildExp() >= 5};
	else
		self.BuildAwardTbl = {};
		self.BuildAwardTbl[5] = false;
		self.dwLabourValue = 20;
		self.dwWoodValue = 20;
		self.dwStoneValue = 20;
		self.dwDiploidExp = false;
		self.strGetAward = strGetAward or "";
		self.dwLabourCD = GetCurTime() +  7210000;
		self.dwWoodCD = GetCurTime() +  7210000;
		self.dwStoneCD = GetCurTime() +  7210000;
		self.dwContriValue = 0;
		objPlayer.SendBuildCDTimeMsg{LabourCD = self.dwLabourCD - GetCurTime(), WoodCD = self.dwWoodCD - GetCurTime(), StoneCD = self.dwStoneCD  - GetCurTime(), ExpFlag = CBuildRampartMgr:GetBuildExp() >= 5};
	end;
end;
function CBuildRampartSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.SendBuildCDTimeMsg{LabourCD = self.dwLabourCD - GetCurTime(), WoodCD = self.dwWoodCD - GetCurTime(), StoneCD = self.dwStoneCD  - GetCurTime(), ExpFlag = CBuildRampartMgr:GetBuildExp() >= 5};
end;
--开始换线记录数据
function CBuildRampartSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	if not self.BuildInfo then
		self.BuildInfo = {};
	end;
	self.BuildInfo.dwLabourValue = self.dwLabourValue;
	self.BuildInfo.dwWoodValue = self.dwWoodValue;
	self.BuildInfo.dwStoneValue = self.dwStoneValue;
	for index, value in pairs(self.BuildAwardTbl) do
		self.BuildInfo.dwState = index;
		self.BuildInfo.dwStateFlag = value;
	end;

	self.BuildInfo.dwDiploidExp = self.dwDiploidExp;
	self.BuildInfo.strGetAward = self.strGetAward or "";
	self.BuildInfo.dwLabourCD = self.dwLabourCD;
	self.BuildInfo.dwWoodCD = self.dwWoodCD;
	self.BuildInfo.dwStoneCD = self.dwStoneCD;
	self.BuildInfo.dwContriValue = self.dwContriValue;
	local tbl = {};
	table.insert(tbl, self.BuildInfo);
	objPlayer:SetLineData("CBuildRampartSystem",tbl);
end;
--换线结束获得数据
function CBuildRampartSystem:OnChangeLineEnd(dwNewLineID)
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	if not objPlayer:GetLineData("CBuildRampartSystem") then
		self:SetBuildInfo()
		return;
	end;
	local getInfo = objPlayer:GetLineData("CBuildRampartSystem")[1];
	self:SetBuildInfo(getInfo);
end;
--设置劳动力捐献
function CBuildRampartSystem:SetLabourValue()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.dwLabourValue = self.dwLabourValue + 1;
	self.objDBQuery:SetBuildInfo(objPlayer:GetRoleID(), "dwLabourValue", self.dwLabourValue);
end;
function CBuildRampartSystem:GetLabourValue()
	return self.dwLabourValue;
end;
--设置木材捐献
function CBuildRampartSystem:SetWoodValue()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.dwWoodValue = self.dwWoodValue + 1;
	self.objDBQuery:SetBuildInfo(objPlayer:GetRoleID(), "dwWoodValue", self.dwWoodValue);
end;
function CBuildRampartSystem:GetWoodValue()
	return self.dwWoodValue;
end;
--设置石料捐献
function CBuildRampartSystem:SetStoneValue()
	local objPlayer = self:GetPlayer();
	self.dwStoneValue = self.dwStoneValue + 1;
	if not objPlayer then
		return;
	end;
	self.objDBQuery:SetBuildInfo(objPlayer:GetRoleID(), "dwStoneValue", self.dwStoneValue);
end;
function CBuildRampartSystem:GetStoneValue()
	return self.dwStoneValue;
end;
--设置可领取状态
function CBuildRampartSystem:SetCurAward(curPlan, state)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.BuildAwardTbl = {};
	self.BuildAwardTbl[curPlan] = state;
	self.objDBQuery:UpdateAwardState(objPlayer:GetRoleID(), curPlan, state);
end;
function CBuildRampartSystem:GetCurAward()
	return self.BuildAwardTbl;
end;
--设置领取双倍经验状态
function CBuildRampartSystem:SetDiploidExp(flag)
	self.dwDiploidExp = flag;
end;
function CBuildRampartSystem:GetDiploidExp()
	return self.dwDiploidExp;
end;
--设置已领取的奖励
function CBuildRampartSystem:SetAwardStr(num)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.strGetAward = self.strGetAward..num..";";
	self.objDBQuery:SetBuildInfo(objPlayer:GetRoleID(), "strGetAward", self.strGetAward);
end;
function CBuildRampartSystem:GetAwardStr()
	return self.strGetAward;
end;

--设置劳力CD
function CBuildRampartSystem:SetLabourCD()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.dwLabourCD <= GetCurTime() then
		self.dwLabourCD = GetCurTime() +  self.dwLabourValue * 5 * 60 * 1000;
	else
		--self.dwWoodCD = self.dwWoodCD - GetCurTime() + _G.BuildConfig["CDInfo"][2] * 60 * 1000 + GetCurTime();
		self.dwLabourCD = self.dwLabourCD + self.dwLabourValue * 5 * 60 * 1000;
	end;
	self.objDBQuery:SetBuildInfo(objPlayer:GetRoleID(), "dwLabourCD", self.dwLabourCD);
end;
function CBuildRampartSystem:GetLabourCD()
end;

--设置木材CD
function CBuildRampartSystem:SetWoodCD()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.dwWoodCD <= GetCurTime() then
		self.dwWoodCD = GetCurTime() +  _G.BuildConfig["CDInfo"][2] * 60 * 1000;
	else
		self.dwWoodCD = self.dwWoodCD + _G.BuildConfig["CDInfo"][2] * 60 * 1000;
	end;
	self.objDBQuery:SetBuildInfo(objPlayer:GetRoleID(), "dwWoodCD", self.dwWoodCD);
end;
function CBuildRampartSystem:GetWoodCD()
end;

--设置石料CD
function CBuildRampartSystem:SetStoneCD()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.dwStoneCD <= GetCurTime() then
		self.dwStoneCD = GetCurTime() +  _G.BuildConfig["CDInfo"][3] * 60 * 1000;
	else
		--self.dwWoodCD = self.dwWoodCD - GetCurTime() + _G.BuildConfig["CDInfo"][2] * 60 * 1000 + GetCurTime();
		self.dwStoneCD = self.dwStoneCD + _G.BuildConfig["CDInfo"][3] * 60 * 1000;
	end;
	self.objDBQuery:SetBuildInfo(objPlayer:GetRoleID(), "dwStoneCD", self.dwStoneCD);
end;

function CBuildRampartSystem:GetStoneCD()
end;

function CBuildRampartSystem:SetMaxContribute(types)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local value = _G.BuildConfig.addContriNum(types)
	self.dwContriValue = self.dwContriValue + value;
	self.objDBQuery:UpdateBuildContri(objPlayer:GetRoleID(), self.dwContriValue, objPlayer:GetIncoID());
	CBuildRampartMgr:UpdateContributeInfo(objPlayer:GetRoleID(), objPlayer:GetInfo().szRoleName, self.dwContriValue, objPlayer:GetIncoID())
end;
--获得修城墙界面显示信息
function CBuildRampartSystem:GetBuildInfo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local infoTbl = {};
	infoTbl[1] = self.BuildAwardTbl;
	infoTbl[2] = self.dwLabourValue;
	infoTbl[3] = self.dwWoodValue;
	infoTbl[4] = self.dwStoneValue;
	infoTbl[5] = self.dwDiploidExp;
	infoTbl[6] = self.strGetAward;
	infoTbl[10] = self.dwContriValue;
	infoTbl[11] = CBuildRampartMgr:GetContributeInfo();
	infoTbl[12] = CBuildRampartMgr:GetBuildPlan();
	infoTbl[13] = CBuildRampartMgr:GetBuildPlanValue();
	infoTbl[14] = CBuildRampartMgr:GetBuildExp() >= 5;
	infoTbl[15] = CBuildRampartMgr:GetPlanFulFlag();
	local labourcd = self.dwLabourCD - GetCurTime();
	if labourcd < 0 or self.dwLabourCD == 0 then
		labourcd = 0;
	end;
	local woodcd = self.dwWoodCD - GetCurTime();
	if woodcd < 0 or self.dwWoodCD == 0 then
		woodcd = 0;
	end;
	local stondcd = self.dwStoneCD - GetCurTime();
	if stondcd < 0 or self.dwStoneCD == 0 then
		stondcd = 0;
	end;
	infoTbl[16]	= labourcd;
	infoTbl[17]	= woodcd;
	infoTbl[18]	= stondcd;
	objPlayer.ResponseBuildMsg{Info = infoTbl};
end;

function CBuildRampartSystem:SetBuildTypeCD(types, flag, cdValue)
	--1,2,3为劳力，木材，石材CD
	if types == 1 then
		self:SetLabourCD();
	elseif types == 2 then
		self:SetWoodCD();
	elseif types == 3 then
		self:SetStoneCD();
	end;
end;
--获得奖励物品
function CBuildRampartSystem:GetAwardDropItem(curPlan)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not _G.BuildConfig["pngInfo"][curPlan] then
		return;
	end;
	if self.IsGetAward then
		return;
	end;
	if not self.BuildAwardTbl[curPlan] then
		objPlayer.ClearAwardFlagMsg{};
		return;
	end;
	self.IsGetAward = true;
	local dropId = _G.BuildConfig["pngInfo"][curPlan].dwDropId;
	local tRewardItem = CDropControl:DoDrop(dropId);
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local tFlyItem = {}
	local awardItem = {};
	for _,v in ipairs(tRewardItem) do
		local tItem = {
			dwItemEnum	= v.dwItemEnum;
			dwItemNumber= v.dwNum;
			dwBindType	= v.dwBindType;
		};
		table.insert(awardItem,tItem);
		table.insert(tFlyItem,v.dwItemEnum);
	end;
	local bFlag = itemSystem:AddEnumItemListToPacket(awardItem or {}, _G.ItemSysOperType.ContributeAward);
	self:SetAwardStr(curPlan);
	if bFlag then
		self:SetCurAward(curPlan, false)
		objPlayer.SendBuildBXMsg{TFlyItem = tFlyItem};
	else
		_err("CBuildRampartSystem:GetAwardDropItem error");
	end;
	self:SetBuildAwardState(curPlan, false)
end;

function CBuildRampartSystem:GetCurConData()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local curPlan = CBuildRampartMgr:GetBuildPlanValue();
	local contributeInfo = CBuildRampartMgr:GetContributeInfo();
	objPlayer.SendCurPlanMsg{CurPlan = curPlan, ContributeInfo = contributeInfo};
end;
--客户端端向服务端请求捐献
function CBuildRampartSystem:ReqContribute(conType)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	--捐献已满
	if CBuildRampartMgr:GetBuildPlanValue() >= _G.BuildConfig["totalContri"] then
		return;
	end
	local exps = 0;
	local contriNum = _G.BuildConfig["ContriNum"][conType];
	if conType == 1 then
		if self.dwLabourCD - GetCurTime() >= _G.BuildConfig["AddCDInfo"][conType] * 60 * 1000 then
			objPlayer.SendContringMsg{};
			return;
		end
		if not self:UseItemAddContri(conType) then objPlayer.SendContringMsg{}; return end;
		if self:GetLabourValue() < contriNum then
			exps = self:SendAwardForContri(conType);
		end;
		--设置劳力捐献次数
		self:SetLabourValue();
	end;
	if conType == 2 then
		if self.dwWoodCD - GetCurTime() >= _G.BuildConfig["AddCDInfo"][conType] * 60 * 1000 then
			objPlayer.SendContringMsg{};
			return;
		end;
		if not self:UseItemAddContri(conType) then objPlayer.SendContringMsg{}; return end;
		if self:GetWoodValue() < contriNum then
			exps = self:SendAwardForContri(conType)
		end;
		self:SetWoodValue();
	end;
	if conType == 3 then 
		if self.dwStoneCD - GetCurTime() >= _G.BuildConfig["AddCDInfo"][conType] * 60 * 1000 then
			objPlayer.SendContringMsg{};
			return;
		end;
		if not self:UseItemAddContri(conType) then objPlayer.SendContringMsg{}; return end;
		if self:GetStoneValue() < contriNum then
			exps = self:SendAwardForContri(conType)
		end;
		self:SetStoneValue();
	end;
	local addNum = _G.BuildConfig.addContriNum(conType);
	local curPlanValue = addNum + CBuildRampartMgr:GetBuildPlanValue();
	--更新捐献总值
	CBuildRampartMgr:UpdateBuildPlan(addNum);
	self:SetMaxContribute(conType);
	--更新cd时间
	self:SetBuildTypeCD(conType)
	objPlayer.SendContriNumMsg{CurBuildPlan = curPlanValue, ConType = conType, AddExp = exps};
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventBuildTotalNum);
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventBuildLabourNum ,self:GetLabourValue());
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventBuildWoodNum ,self:GetWoodValue());
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventBuildStoneNum ,self:GetStoneValue());
end;
--捐献时给予奖励
function CBuildRampartSystem:SendAwardForContri(conType)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	--增加奖励
	local exps, silver, zhenqi = _G.BuildConfig.addContriAward(conType, objPlayer:GetInfo().dwLevel);
	local objElemSystem = objPlayer:GetSystem("CFiveElemSystem");
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objElemSystem:GetElemValue()
	if zhenqi and zhenqi ~= 0 then
	--奖励真气
		objElemSystem:ChangeAttr("dwMetalValue",zhenqi);
		objElemSystem:ChangeAttr("dwWoodValue",zhenqi);
		objElemSystem:ChangeAttr("dwWaterValue",zhenqi);
		objElemSystem:ChangeAttr("dwFireValue",zhenqi);
		objElemSystem:ChangeAttr("dwEarthValue",zhenqi);
		local setData = {
			[1] = {dwCurrent = uItemGold, dwChange = zhenqi};
			[2] = {dwCurrent = uItemWood, dwChange = zhenqi};
			[3] = {dwCurrent = uItemWater, dwChange = zhenqi};
			[4] = {dwCurrent = uItemFire, dwChange = zhenqi};
			[5] = {dwCurrent = uItemEarth, dwChange = zhenqi};
		}
		CLogSystemManager:zhenqi(objPlayer, setData, _G.FiveElemSysOperType.BuildRampart)
	end;
	
	objPlayer:AddExp(exps);
	--增加money
	if silver > 0 then
		itemSystem:AddPacketMoney(silver, _G.ItemSysOperType.ContributeAward);
	end;
	return exps;
end;
--消耗物品
function CBuildRampartSystem:UseItemAddContri(conType)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	if not itemSystem then
		return;
	end;
	local itemEnumId = _G.BuildConfig["UseItemTbl"][conType];
	if itemEnumId ~= 0 then
		local num, bindNum, unBindNum = itemSystem:GetEnumItemNumInPacket(itemEnumId)
		if num < 1 then
			return;
		end;
		local enough, bIsUseBind = itemSystem:DelEnumItemInPacket(itemEnumId, 1, true, _G.ItemSysOperType.ContributeAward);
		if not enough then
			return;
		end;
	end;
	return true;
end;
--清除CD
function CBuildRampartSystem:ClearCD(cdType, restCD)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local costYB = _G.BuildConfig["ClearCostMoney"][cdType];
	if not costYB then
		objPlayer.ClearCDCostMsg{};
		return;
	end;	
	local serverRestCD = 0;
	if cdType == 1 then
		serverRestCD = self.dwLabourCD - GetCurTime();
	elseif cdType == 2 then
		serverRestCD = self.dwWoodCD - GetCurTime();
	elseif cdType == 3 then
		serverRestCD = self.dwStoneCD - GetCurTime();
	end;
	local cd = _G.BuildConfig["CDInfo"][cdType] * 60 * 1000;
	local realCost = (serverRestCD / cd) * costYB;
	if _G.RampartWasteType == 1 then
		if not itemSystem:CostGold(realCost, _G.ItemSysOperType.ContributeAward) then
			objPlayer.ClearCDCostMsg{};
			return 
		end;
	elseif _G.RampartWasteType == 2 then
		if not itemSystem:CostBindGold(realCost, _G.ItemSysOperType.ContributeAward) then
			objPlayer.ClearCDCostMsg{};
			return 
		end;
	elseif _G.RampartWasteType == 3 then	
		if not itemSystem:CostPacketMoney(realCost, _G.ItemSysOperType.ContributeAward) then
			objPlayer.ClearCDCostMsg{};
			return 
		end;
	end;
	if cdType == 1 then
		self.dwLabourCD = 0;
		self.objDBQuery:SetBuildInfo(objPlayer:GetRoleID(), "dwLabourCD", self.dwLabourCD)
	elseif cdType == 2 then
		self.dwWoodCD = 0;
		self.objDBQuery:SetBuildInfo(objPlayer:GetRoleID(), "dwWoodCD", self.dwLabourCD)
	elseif cdType == 3 then
		self.dwStoneCD = 0;
		self.objDBQuery:SetBuildInfo(objPlayer:GetRoleID(), "dwStoneCD", self.dwLabourCD)
	end;  
	CLogSystemManager:giftmoney_buy(objPlayer, 2, 0, realCost);
	objPlayer.NoticeClearCDMsg{CDType = cdType};
end;
--定点刷新数据
function CBuildRampartSystem:ClearDataOnTime()
	self.BuildAwardTbl = {};
	self.BuildAwardTbl[1] = false;
	self.dwDiploidExp = false;
	self.strGetAward = "";
	self.dwContriValue = 0;
end;
--定点清除捐献次数和cd
function CBuildRampartSystem:ClearContriNum()
	self.dwLabourValue = 0;
	self.dwWoodValue = 0;
	self.dwStoneValue = 0;
	self.dwLabourCD = 0;
	self.dwWoodCD = 0;
	self.dwStoneCD = 0;
end;