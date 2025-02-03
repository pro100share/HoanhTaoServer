--[[
功能：在线抽奖系统
作者：刘科建
时间：2013-06-27
]]

_G.COnlineGiftSystem = {};

function COnlineGiftSystem:GetOnlineTime()
	self.nOnlineTime = self.nOnlineTime + (GetCurTime(1) - self.nUplineTime);
	self.nUplineTime = GetCurTime(1);
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_OnlineGift");
	SqlCmd.Fields.dwOnlineTime		= self.nOnlineTime;
	SqlCmd.Wheres.dwRoleID			= self.objPlayer:GetRoleID();
	SqlCmd:execute();
	
	return self.nOnlineTime;
end;

function COnlineGiftSystem:new()
	local obj = CSystem:new("COnlineGiftSystem");
	
	for i,v in pairs(COnlineGiftSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;


function COnlineGiftSystem:Create(bIsChangeLine)
	self.objPlayer = self:GetPlayer();
	if not self.objPlayer then
		return false;
	end;
	self.m_ObjDB = self.objPlayer:GetDBQuery();
	if not self.m_ObjDB then
		return false;
	end;
	
	self.nUplineTime = GetCurTime(1);
	self.nOnlineTime = 0;
	self.tAward = {};
	for i=1, _G.OnLineGiftConfig.GiftNum do
		self.tAward[i] = 0;
	end;
	
	local lineData = self.objPlayer:GetLineData("COnlineGiftSystem")[1];
	if lineData then
		self.nOnlineTime = lineData[1];
		self:DecodeAwardStr(lineData[2]);
	else
		_err("COnlineGiftSystem GetLineData Error!!!");
	end;
	
	if bIsChangeLine == 0 then
	--if not bIsChangeLine then
		self.objPlayer.OnInitOnlineGiftMsg{
			Online = self.nOnlineTime,
			Reward = self.tAward,
		};
	end;
	
	return true;
end;

function COnlineGiftSystem:Destroy()
	self:GetOnlineTime();
	if self.tPrepare then
		self:GetAward(true);
	end;
end;

function COnlineGiftSystem:OnChangeLineCheck()
	return not self.tPrepare;
end;

function COnlineGiftSystem:OnChangeLineBegin()
	self:GetOnlineTime();
	local lineData = {
		[1] = self.nOnlineTime;
		[2] = self:EncodeAwardStr();
	};
	self.objPlayer:SetLineData("COnlineGiftSystem", lineData);
end;

function COnlineGiftSystem:DecodeAwardStr(str)
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
		self.tAward[key] = value;
	end;
end;

local formatStr = "%d,%d;"
function COnlineGiftSystem:EncodeAwardStr()
	local str = "";
	for k, v in ipairs(self.tAward) do
		local str1 = string.format(formatStr, k, v);
		str = str .. str1;
	end;
	return str;
end;

function COnlineGiftSystem:RandAward()
	if self.tPrepare then return end;
	
	self:GetOnlineTime();
	--算出可领奖阶段
	local phases = {};
	for k, v in ipairs(self.tAward) do
		if (v == 0) and (self.nOnlineTime >= _G.OnLineGiftConfig.GiftTime[k]) then
			table.insert(phases, k);
		end;
	end;
	if #phases == 0 then return end;
	--算出奖励
	self.tPrepare = {};
	local level = self.objPlayer:GetLevel();
	local giftgroup = _G.OnLineGiftConfig.Level2GiftGroup(level);
	for _, v in ipairs(phases) do
		local awardgroup = _G.OnLineGiftConfig.GiftReward[v][giftgroup];
		local totalWeight = 0;
		for _, v1 in ipairs(awardgroup) do
			totalWeight = totalWeight + v1[2];
		end;
		local rand = math.random(1, totalWeight);
		for _, v1 in ipairs(awardgroup) do
			totalWeight = totalWeight - v1[2];
			if rand > totalWeight then
				self.tPrepare[v] = v1[1];
				break;
			end;
		end;
	end;
	
	self.objPlayer.OnDrawOnlineGiftMsg{Reward = self.tPrepare};
end;

--领奖
function COnlineGiftSystem:GetAward(bUseMail)
	if not self.tPrepare then return end;
	
	local award = {};
	for k, v in pairs(self.tPrepare) do
		self.tAward[k] = v;
		table.insert(award, v);
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_OnlineGift");
	SqlCmd.Fields.szAward	= self:EncodeAwardStr();
	SqlCmd.Wheres.dwRoleID	= self.objPlayer:GetRoleID();
	SqlCmd:execute();
	
	local objItemSys = self.objPlayer:GetSystem("CItemSystem")
	if not bUseMail then
		if not objItemSys then
			bUseMail = true;
		else
			local setAddList = {};
			for _, v in ipairs(award) do
				local item = {
					dwItemEnum 		= v,
					dwItemNumber	= 1,
					dwBindType		= _G.enItemBindType.eYes,
				};
				table.insert(setAddList, item);
			end;
			if not objItemSys:AddEnumItemListToPacket(setAddList, _G.ItemSysOperType.OnlineGift) then
				bUseMail = true;
			end;
		end;
	end;
	if bUseMail then
		local mail = CMail:new();
		mail:SetSender(-9999, "系统邮件");
		mail:SetReceiver(self.objPlayer:GetRoleID(), self.objPlayer:GetName());
		mail:SetContent("在线摇奖", "由于您异常下线或背包已满，奖励已通过邮件发送给您，请查收");
		mail:SetLifeTime(SMailInfo.life*24*3600*1000);
		local t_Item = {};
		for _, v in ipairs(award) do
			local itemMessage = SItemMessage:new();
			itemMessage.dwItemEnum	= v;
			itemMessage.dwItemNumber= 1;
			itemMessage.dwBindType	= _G.enItemBindType.eYes;
			table.insert(t_Item, itemMessage);
		end;
		mail:SetAccessory(0, 0, 0, t_Item);
		CMailManager:SendMail(mail);
		self.objPlayer.OnWarNoticeMsg
		{
			NoticeType = 1;
			StringID = 13002010001;
		}
	end;
	
	self.tPrepare = nil;
end;


function COnlineGiftSystem:Reset()
	self.nUplineTime = GetCurTime(1);
	self.nOnlineTime = 0;
	self.tAward = {};
	for i=1, _G.OnLineGiftConfig.GiftNum do
		self.tAward[i] = 0;
	end;
	self.objPlayer.OnResetOnlineGiftMsg{};
end;


