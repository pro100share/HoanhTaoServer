--[[功能：商业化礼包领取记录系统作者：刘科建时间：2013-07-17]]_G.CCommercialGiftSys = {};function CCommercialGiftSys:new()	local obj = CSystem:new("CCommercialGiftSys");		for i,v in pairs(CCommercialGiftSys) do		if type(v) == "function" then			obj[i] = v;		end;	end; 	return obj;end;function CCommercialGiftSys:OnChangeLineBegin()	local lineData = {self:EncodeStr()};	self.objPlayer:SetLineData("CCommercialGiftSys", lineData);end;function CCommercialGiftSys:Create()	self.objPlayer = self:GetPlayer();	if not self.objPlayer then		return false;	end;	self.m_ObjDB = self.objPlayer:GetDBQuery();	if not self.m_ObjDB then		return false;	end;		local lineData = self.objPlayer:GetLineData("CCommercialGiftSys")[1][1];	if lineData then		self:DecodeStr(lineData);	else		self:DecodeStr("");		_err("CCommercialGiftSys GetLineData Error!!!");	end;	return true;end;function CCommercialGiftSys:DecodeStr(str)	self.tType = {};		local lastIndex = 0;	while true do		local nextIndex = lastIndex + 1;		lastIndex = string.find(str, ";", nextIndex)		if not lastIndex then break end;		local str1 = string.sub(str, nextIndex, lastIndex - 1);		local value = tonumber(str1);		if not value then			_err("CCommercialGiftSys:DecodeAwardStr!!!", str1);			break;		end;		self.tType[value] = true;	end;end;local formatStr = "%d;"function CCommercialGiftSys:EncodeStr()	local str = "";	for k, _ in pairs(self.tType) do		local str1 = string.format(formatStr, k);		str = str .. str1;	end;	return str;end;function CCommercialGiftSys:GetGift(dwType)	self.tType[dwType] = true;	self:NoticePlayer(dwType);	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_CommercialGift");	SqlCmd.Fields.strType		= self:EncodeStr();	SqlCmd.Wheres.dwAccountID	= self.objPlayer:GetAccountID();	SqlCmd:execute();end;function CCommercialGiftSys:NoticePlayer(dwType)	local data = {};	for k, _ in pairs(self.tType) do		table.insert(data, k);	end;	self.objPlayer.OnReceiveCommercialGiftDataMsg{Data = data};	if dwType then		self:NoticePlayerResult(1);	end;end;function CCommercialGiftSys:NoticePlayerResult(result)	self.objPlayer.CommercialGiftGetRewardResultMsg{Code = result};end;function CCommercialGiftSys:GetReward(dwType)	self.dwCDTime = self.dwCDTime or 0;	if GetCurTime(1) < self.dwCDTime then return end;	self.dwCDTime = GetCurTime(1) + 5;	if not _G.CommercialGiftAvailableType[dwType] then return end;	if self.tType[dwType] then return end;	local reward = _G.RewardTypeConfig[dwType];	if not reward then return end;		if reward.dwLevel then		CKernelApp.PlayerGet360RewardMsg{AccountID = self.objPlayer:GetAccountID(), Level = reward.dwLevel};	else		self:SendReward(dwType);	end;end;function CCommercialGiftSys:SendReward(dwType)	if not _G.CommercialGiftAvailableType[dwType] then return end;	if self.tType[dwType] then return end;	local reward = _G.RewardTypeConfig[dwType];	if not reward then return end;		local itemsystem = self.objPlayer:GetSystem("CItemSystem");	if not itemsystem then return end;		local setItems = {};	local item = {		dwItemEnum = reward.dwItemEnum;		dwItemNumber = reward.dwItemNumber;		dwBindType = reward.dwBindType;	};	table.insert(setItems, item);		if itemsystem:AddEnumItemListToPacket(setItems, _G.ItemSysOperType.Festival) then		self:GetGift(dwType);	end;end;define.CommercialGiftResultMsg{	user = NONE,	Level = 0,	Result = 0}when{user = NONE}CommercialGiftResultMsg = checkKSUserwhen{}function CommercialGiftResultMsg(user, Level, Result)	if user then		local comgiftSys = user:GetSystem("CCommercialGiftSys");		if comgiftSys then			if Result > 0 then				local dwType = _G.CommercialGiftLevelToType360[Level];				if dwType then					comgiftSys:SendReward(dwType);				else					_info("ComGift Error!!! ks return error", Level);				end;			elseif Result < 0 then				comgiftSys:NoticePlayerResult(Result);			end;		end;	end;end;define.CommercialGiftGetRewardMsg{	user = NONE,	Type = 0;}when{user = NONE}CommercialGiftGetRewardMsg = checkUserwhen{}function CommercialGiftGetRewardMsg(user, Type)	if user then		local comgiftSys = user:GetSystem("CCommercialGiftSys");		if comgiftSys then			comgiftSys:GetReward(Type);		end;	end;end;define.RequestCommercialGiftDataMsg{	user = NONE;}when{user = NONE}RequestCommercialGiftDataMsg = checkUserwhen{}function RequestCommercialGiftDataMsg(user)	if user then		local comgiftSys = user:GetSystem("CCommercialGiftSys");		if comgiftSys then			comgiftSys:NoticePlayer();		end;	end;end;