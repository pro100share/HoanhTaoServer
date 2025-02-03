
_G.CQihunManager = {};

function CQihunManager:Create()
	self.awardsNum = #_G.QihunConfig.tAwards;
	self.totalWeight = 0;
	for _, v in ipairs(_G.QihunConfig.tAwards) do
		self.totalWeight = self.totalWeight + v[4];
	end;
end;

function CQihunManager:GetAwardsNum()
	return self.awardsNum;
end;

function CQihunManager:GetTotalWeight()
	return self.totalWeight;
end;

CQihunManager:Create();

------------------------------------
------------------------------------
--棋魂系统
--author lkj

-------------------------------------
-------------------------------------
--棋魂系统
_G.CQihunSystem = {};
function CQihunSystem:new()
	local obj = CSystem:new("CQihunSystem");
	
	for i, v in pairs(CQihunSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;
--create
function CQihunSystem:Create(bChangeLine)
	--每个系统创建时都会挂接到自己的管理者player身上
	self.objPlayer = self:GetPlayer();
	if not self.objPlayer then
		_err("CQihunSystem Create Cannot get player");
		return false;
	end;
	
	--初始化DB模块
	self.objDB = self.objPlayer:GetDBQuery();
	if not self.objDB then
		_err("CQihunSystem Create Cannot get DBQuery");
		return false;
	end;
	
	--读取信息
	local Data	= self.objPlayer:GetLineData("CQihunSystem");
	if not Data then
		_err("CQihunSystem Create CanNot GetLineData!!!");
		return false;
	end;
	local data = Data[1];
	self.dwTimes = data[1];
	self.tAwards = self:DecodeStr(data[2]);
	self.tSelects = self:DecodeStr(data[3]);
	
	if not next(self.tAwards) then
		self:RandAward();
		self:WriteDB();
	end;
	self.dwSelectTimes = 1;
	for k, v in pairs(self.tSelects) do
		self.dwSelectTimes = self.dwSelectTimes + 1;
	end;
	
	return true;
end;

--OnEnterScene
function CQihunSystem:OnEnterScene()
	self:Synchronize();
end;

function CQihunSystem:Reset()
	self.dwTimes = _G.QihunConfig.dwRandomTimes;
	self:Synchronize();
end;

--换线开始
function CQihunSystem:OnChangeLineBegin()
	local data = {};
	data[1] = self.dwTimes;
	data[2] = self:EncodeStr(self.tAwards);
	data[3] = self:EncodeStr(self.tSelects);
	self.objPlayer:SetLineData("CQihunSystem", data);
end


function CQihunSystem:DecodeStr(str)
	local t = {};
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
	return t;
end;

local formatStr = "%d,%d;"
function CQihunSystem:EncodeStr(t)
	local str = "";
	for k, v in pairs(t) do
		local str1 = string.format(formatStr, k, v);
		str = str .. str1;
	end;
	return str;
end;

function CQihunSystem:RandAward()
	self.tAwards = {};
	local awardsNum = CQihunManager:GetAwardsNum();
	local totalWeight = CQihunManager:GetTotalWeight();
	for i=1, 10 do
		local weight = 0;
		local rand = math.random(1, totalWeight);
		for j=1, awardsNum do
			if (not self.tAwards[j]) then
				weight = weight + _G.QihunConfig.tAwards[j][4];
				if rand <= weight then
					self.tAwards[j] = 0;
					totalWeight = totalWeight - _G.QihunConfig.tAwards[j][4];
					break;
				end;
			end;
		end;
	end;
	self.tSelects = {};
	self.dwSelectTimes = 1;
end;

function CQihunSystem:WriteDB()
	local SqlCmd = self.objDB:CreateUpdateCmd("t_role_qihun");
	SqlCmd.Wheres.roleid	= self.objPlayer:GetRoleID();
	SqlCmd.Fields.times		= self.dwTimes;
	SqlCmd.Fields.awards	= self:EncodeStr(self.tAwards);
	SqlCmd.Fields.selects	= self:EncodeStr(self.tSelects);
	SqlCmd:execute();
end;

function CQihunSystem:Synchronize()
	self.objPlayer.Qihun_SynchronizeMsg{Times = self.dwTimes, Awards = self.tAwards, Selects = self.tSelects};
end;

function CQihunSystem:SynchronizeAwards()
	self.objPlayer.Qihun_SynchronizeAwardsMsg{Times = self.dwTimes, Awards = self.tAwards, Selects = self.tSelects};
end;

function CQihunSystem:SynchronizeSelects(index, awardtype)
	self.objPlayer.Qihun_SynchronizeSelectsMsg{Selects = self.tSelects, Index = index, AwardType = awardtype};
end;

function CQihunSystem:ClientWantRandAward()
	if not self:HasAuthority("Qihun") then return end;
	if self.dwTimes <= 0 then return end;
	local itemSystem = self.objPlayer:GetSystem("CItemSystem");
	local costgold = _G.QihunConfig.RandomCost(_G.QihunConfig.dwRandomTimes - self.dwTimes + 1);
	if itemSystem and itemSystem:CostGold(costgold, _G.ItemSysOperType.Qihun) then
		self.dwTimes = self.dwTimes - 1;
		self:RandAward();
		self:WriteDB();
		self:SynchronizeAwards();
	end;
end;

function CQihunSystem:ClientWantGetAward(index)
	if not self:HasAuthority("Qihun") then return end;
	index = math.floor(index);
	if index <=0 or index > 10 then return end;
	if self.tSelects[index] then return end;
	if self.dwSelectTimes > _G.QihunConfig.dwSelectTimes then return end;
	local itemSystem = self.objPlayer:GetSystem("CItemSystem");
	if not itemSystem then return end;
	
	----add for log
	local consume = {
		[1] = 0;	--gold
		[2] = _G.QihunConfig.dwEnumID;	--itemEnumID
		[3] = 0;	--itenNum
	};
	local gain = {
		[1] = 0;	--itemEnumID
		[2] = 0;	--itenNum
	};
	----add over
	
	local costQihunNum = _G.QihunConfig.CostQihunNum(self.dwSelectTimes);
	local enough, minus = itemSystem:CheckDelEnumItemInPacketCond(_G.QihunConfig.dwEnumID, costQihunNum);
	if not enough then
		local costGold = minus * _G.QihunConfig.dwExchange;
		if not itemSystem:CostGold(costGold, _G.ItemSysOperType.Qihun) then return end;
		consume[1] = costGold;
	end;
	if costQihunNum > minus then
		itemSystem:DelEnumItemInPacket(_G.QihunConfig.dwEnumID, costQihunNum - minus, false, _G.ItemSysOperType.Qihun);
		consume[3] = costQihunNum - minus;
	end;
	
	local totalWeight = 0;
	for k, v in pairs(self.tAwards) do
		if v == 0 then
			totalWeight = totalWeight + _G.QihunConfig.tAwards[k][5];
		end;
	end;
	local weight = 0;
	local rand = math.random(1, totalWeight);
	local award;
	for k, v in pairs(self.tAwards) do
		if v == 0 then
			weight = weight + _G.QihunConfig.tAwards[k][5];
			if rand <= weight then
				award = k;
				break;
			end;
		end;
	end;
	self.tAwards[award] = 1;
	self.tSelects[index] = award;
	
	local awarditem = _G.QihunConfig.tAwards[award];
	gain[1] = awarditem[1];
	gain[2] = awarditem[3];
	local items = {};
	local item = {
		dwItemEnum = awarditem[1];
		dwBindType = awarditem[2];
		dwItemNumber=awarditem[3];
	}
	table.insert(items, item);
	local awardtype = 1;
	if not itemSystem:AddEnumItemListToPacket(items, _G.ItemSysOperType.Qihun) then
		local mail = CMail:new();
		mail:SetSender(-9999, _G.QihunConfig.MailText1);
		mail:SetReceiver(self.objPlayer:GetRoleID(), self.objPlayer:GetName());
		local itemname = CGlobalItemManager:GetName(awarditem[1]);
		local str = string.format(_G.QihunConfig.MailText3, itemname, awarditem[3]);
		mail:SetContent(_G.QihunConfig.MailText2, str);
		mail:SetLifeTime(SMailInfo.life*24*3600*1000);
		local t_Item = {};
		local itemMessage = SItemMessage:new();
		itemMessage.dwItemEnum	= awarditem[1];
		itemMessage.dwBindType	= awarditem[2];
		itemMessage.dwItemNumber= awarditem[3];
		table.insert(t_Item, itemMessage);
		mail:SetAccessory(0, 0, 0, t_Item);
		CMailManager:SendMail(mail);
		awardtype = 2;
	end;
	
	self.dwSelectTimes = self.dwSelectTimes + 1;
	self:WriteDB();
	self:SynchronizeSelects(index, awardtype);
	
	if awarditem[6] then
		CGameApp.Qihun_BroadCastMsg{Name = self.objPlayer:GetName(), RoleID = self.objPlayer:GetRoleID(), Index = award};
	end;
	
	CLogSystemManager:qihun(self.objPlayer, consume, gain)
end;


define.Qihun_RandAwardMsg
{
	user = NONE,
}
when{user = NONE}
Qihun_RandAwardMsg = checkUser
when{}
function Qihun_RandAwardMsg(user)
	if user then
		local qihunSystem = user:GetSystem("CQihunSystem");
		if qihunSystem then
			qihunSystem:ClientWantRandAward();
		end;
	end;
end;

define.Qihun_GetAwardMsg
{
	user = NONE,
	Index = 0,
}
when{user = NONE}
Qihun_GetAwardMsg = checkUser
when{}
function Qihun_GetAwardMsg(user, Index)
	if user then
		local qihunSystem = user:GetSystem("CQihunSystem");
		if qihunSystem then
			qihunSystem:ClientWantGetAward(Index);
		end;
	end;
end;

define.Qihun_BroadCastMsg
{
	Name = "",
	RoleID = 0,
	Index = 0
}
when{}
function Qihun_BroadCastMsg(Name, RoleID, Index)
    local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
        table.insert(setNet, objPlayer.objNet);
	end; 
    _groupcallout(setNet, "Qihun_BroadCastMsg", {Name = Name, RoleID = RoleID, Index = Index});
end;


