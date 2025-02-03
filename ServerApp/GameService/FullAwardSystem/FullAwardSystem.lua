--[[
功能：充值奖励
作者：曲莹
时间：2013-6-11 
]]

_G.CFullAwardSys = {};
function CFullAwardSys:new()
	local obj = CSystem:new("CFullAwardSys");
	obj.objDBQuery = nil;    --对应的数据库操作模
	for i,v in pairs(CFullAwardSys) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

function CFullAwardSys:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		return false;
	end;
	self.objDBQuery = CFullAwardDB:new(objDB, self);
	self.dwAddiAwardValue = 0;   --累积充值金额
	self.dwAddiAwardPhase = 0;   --累积奖励阶段
	self.dwPerAwardValue = 0;   --单次充值金额
	self.dwPerAwardPhase = 0;   --单次奖励阶段
	if bIsChangeLine == 0 then
	--if not bIsChangeLine then
		local fullMoneyInfo = objPlayer:GetLineData("CFullAwardSys")[1];
		if fullMoneyInfo then
			local info = fullMoneyInfo[1];
			self:SetFullAwardInfo(info);
		else
			_err("--CFullAwardSys-GetLineData-error---");
		end;
	end;
	return true;
end;
function CFullAwardSys:Update()
end;
function CFullAwardSys:Destroy()
end;
function CFullAwardSys:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.SendFullConfigMsg{FullAwardConfig = _G.FullAwardConfig.reward, FullAwardInfo = _G.FullAwardInfo};
	local scriptSys = objPlayer:GetSystem("CScriptSystem");
	if not scriptSys then
		return;
	end;
	local dwStartTime = CFullAwardManager:GetFullVersionTime();
	local strFormat = "%04d%02d%02d";
	local dwStartTime = tonumber(CTimeFormat:todate(math.floor(dwStartTime/ 1000), strFormat, false));
	local dwEndTime = tonumber(CTimeFormat:todate(math.floor(GetCurTime() / 1000), strFormat, false));
	
	local allCharge = scriptSys:GetRegionCharge(dwStartTime, dwEndTime);
	self.dwAddiAwardValue = allCharge; --累积充值金额
	self:SendAddiAwardToCli();
end;
--开始换线记录数据
function CFullAwardSys:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local info = {};
	info["dwAddiAwardPhase"] = self.dwAddiAwardPhase;
	info["dwPerAwardPhase"] = self.dwPerAwardPhase;
	info["dwAddiAwardValue"] = self.dwAddiAwardValue;
	info["NextAddiPhase"] = self.NextAddiPhase;
	info["AllowGetAddiAward"] = self.AllowGetAddiAward;
	local tbl = {};
	table.insert(tbl, info);
	objPlayer:SetLineData("CFullAwardSys",tbl);
end;
--换线后记录数据
function CFullAwardSys:OnChangeLineEnd(dwNewLineID)
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local fullMoneyInfo = objPlayer:GetLineData("CFullAwardSys")[1];
	if fullMoneyInfo then
		local info = fullMoneyInfo[1];	
		self.dwAddiAwardPhase = info.dwAddiAwardPhase;
		self.dwPerAwardPhase = info.dwPerAwardPhase;
		self.dwAddiAwardValue = info.dwAddiAwardValue;
		self.NextAddiPhase = info.NextAddiPhase;
		self.AllowGetAddiAward = info.AllowGetAddiAward;
	else
		self.AllowGetAddiAward = false;
	end;
end;
--设置数据
function CFullAwardSys:SetFullAwardInfo(info)
	self.dwAddiAwardPhase = info.dwAddiAwardPhase or 0;   --累积奖励阶段
	--self.dwPerAwardPhase = info.dwPerAwardPhase or 0;     --单次奖励阶段
end;
--事件中心
function CFullAwardSys:OnEventCenter(szEventName,Param1)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local scriptSys = objPlayer:GetSystem("CScriptSystem");
	if not scriptSys then
		return;
	end;
	if szEventName == enumPlayerEventType.EventChargeRecordSig then
		--Param1:单次最大值
		-- self.dwPerAwardValue = Param1;
		-- self:SendPerAwardToCli();
	elseif szEventName == enumPlayerEventType.EventChargeRecord then
		--Param1:累积值		
		local dwStartTime = CFullAwardManager:GetFullVersionTime();
		local strFormat = "%04d%02d%02d";
		local dwStartTime = tonumber(CTimeFormat:todate(math.floor(dwStartTime/ 1000), strFormat, false));
		local dwEndTime = tonumber(CTimeFormat:todate(math.floor(GetCurTime() / 1000), strFormat, false));
		local allCharge = scriptSys:GetRegionCharge(dwStartTime, dwEndTime);
		self.dwAddiAwardValue = allCharge or 0; --累积充值金额
		self:SendAddiAwardToCli();
	end
end;
--同步客户端领取累积奖励信息
function CFullAwardSys:SendAddiAwardToCli()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local info = _G.FullAwardConfig.reward[_G.FullTypeConfig["AddiFull"]];
	if info then
		local nextPhase = 0;
		for index, value in ipairs(info) do
			if value > self.dwAddiAwardPhase then
				nextPhase = value;
				break;
			end;
		end;
		self.NextAddiPhase = nextPhase;
		if nextPhase ~= 0 then
			if self.dwAddiAwardValue >= nextPhase then
				self.AllowGetAddiAward = true;
				objPlayer.SendAddiValueMsg{AllowGetAward = true, NextAddiPhase = nextPhase, CurAddiMoney = self.dwAddiAwardValue};
			else
				self.AllowGetAddiAward = false;
				objPlayer.SendAddiValueMsg{AllowGetAward = false, NextAddiPhase = nextPhase, CurAddiMoney = self.dwAddiAwardValue};
			end;
		else
			self.AllowGetAddiAward = false;
			objPlayer.SendAddiValueMsg{AllowGetAward = false, NextAddiPhase = nextPhase, CurAddiMoney = self.dwAddiAwardValue};
		end;
	end;
end;
--同步客户端领取单次奖励信息
function CFullAwardSys:SendPerAwardToCli()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local info = _G.FullAwardConfig[_G.FullTypeConfig["PerFull"]];
	if info then
		local nextPerPhase = 0;
		for index, value in ipairs(info) do
			if value > self.dwPerAwardPhase then
				nextPerPhase = value;
				break;
			end;
		end;
		self.NextPerPhase = nextPerPhase;
		if self.dwPerAwardValue >= nextPerPhase then
			self.AllowGetPerAward = true;
			objPlayer.SendPerValueMsg{AllowGetAward = true, NextPerPhase = nextPerPhase, CurPerMoney = self.dwPerAwardValue};
		else
			self.AllowGetPerAward = false;
			objPlayer.SendPerValueMsg{AllowGetAward = false, NextPerPhase = nextPerPhase, CurPerMoney = self.dwPerAwardValue};
		end;
	end;
end;
--客户端向服务器请求奖励
function CFullAwardSys:ReqAddiAward()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local myProf = objPlayer:GetInfo().dwProf
	if not self.AllowGetAddiAward then
		return;
	end;
	local dwRoleId = objPlayer:GetRoleID();
	local itemSystem = objPlayer:GetSystem("CItemSystem")
	if not itemSystem then
		return;
	end;
	local awardInfo = _G.FullAwardInfo[FullTypeConfig.AddiFull][self.NextAddiPhase];
	local awardMsg = _G.FullAwardInfo[FullTypeConfig.AddiFull][self.NextAddiPhase];
	local flag = false;
	if awardInfo then
		local itemList = awardInfo.awardItem;
		local awardMsg = awardInfo.afficheStr;
		local addItemList = {};
		if itemList then
			for index, info in pairs(itemList) do
				local tempTable1 = {};
				if GiftConfig.PropConfig[info["dwItemEnum"]] then
					tempTable1.dwItemEnum	= GiftConfig.PropConfig[info["dwItemEnum"]].ProfEquipEnum[myProf];
					tempTable1.dwItemNumber= info["dwItemNumber"];
					tempTable1.dwBindType	= info["dwBindType"];
					tempTable1.dwStrongLevel = GiftConfig.PropConfig[info["dwItemEnum"]].dwStrongEnum;
					tempTable1.setProperty	 = GiftConfig.PropConfig[info["dwItemEnum"]].PropList;
				else
					tempTable1.dwItemEnum	= info["dwItemEnum"];
					tempTable1.dwItemNumber= info["dwItemNumber"];
					tempTable1.dwBindType	= info["dwBindType"];
				end;
				table.insert(addItemList, tempTable1);
			end;
			self:BroadCastMsg(awardMsg);
			self.dwAddiAwardPhase = self.NextAddiPhase;
			itemSystem:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.FullPerAward);
			self.objDBQuery:SetAddiFullInfo(dwRoleId, self.NextAddiPhase);
			flag = true;
		end;
	end;
	self:SendAddiAwardToCli();
	objPlayer.ResGetAddiAwardMsg{Flag = flag}
end;

function CFullAwardSys:BroadCastMsg(str)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CFullAwardSys:BroadCastMsg");
		return;
	end;
	--玩家姓名
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--玩家RoleID
	local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
	--全服广
	CGameApp.FullAward_BroadCastMsg{
        PlayerName = s_PlayerName,
        PlayerRoleID = n_PlayerRoleID,
        Str = str};
end;

function CFullAwardSys:SetFullInfo(dwAddiPhase, dwPerPhase)
	self.dwAddiAwardValue = 0;   --累积充值金额
	self.dwAddiAwardPhase = dwAddiPhase;   --累积奖励阶段
	self.dwPerAwardValue = 0;   --单次充值金额
	self.dwPerAwardPhase = dwPerPhase;   --单次奖励阶段
	self:SendAddiAwardToCli();
end;

--客户端向服务器请求奖励
function CFullAwardSys:ReqPerAward()
	--[[
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self.AllowGetPerAward then
		return;
	end;
	local dwRoleId = objPlayer:GetRoleID();
	local itemSystem = objPlayer:GetSystem("CItemSystem")
	if not itemSystem then
		return;
	end;
	local awardInfo = _G.FullAwardInfo[FullTypeConfig.PerFull][self.NextPerPhase];
	if awardInfo then
		local itemList = awardInfo.awardItem;
		local addItemList = {};
		if itemList then
			for index, info in pairs(itemList) do
				local tempTable1 = {
					dwItemEnum	= info["dwItemEnum"];
					dwItemNumber= info["dwItemNumber"];
					dwBindType	= info["dwBindType"];
				};
				table.insert(addItemList, tempTable1);
			end;
			self.dwPerAwardPhase = self.NextPerPhase;
			itemSystem:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.FullPerAward);	
			self.objDBQuery:SetPerFullInfo(dwRoleId, self.NextPerPhase);
		end;
	end;
	self:SendPerAwardToCli();
	objPlayer.ResGetPerAwardMsg{}
	]]
end;

-- function CFullAwardSys:ReqCharge()
	-- CKernelApp.SetChargeMsg{};
-- end;