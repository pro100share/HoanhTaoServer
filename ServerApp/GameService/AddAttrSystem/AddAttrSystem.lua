local function EncodeStr(t)	local str = "";	for k, v in pairs(t) do		str = str .. k .. "," .. v .. ";";	end;	return str;end;local function DecodeStr(str)	local tempT = {};	local lastIndex = 0;	while true do		local nextIndex = lastIndex + 1;		lastIndex = string.find(str, ";", nextIndex)		if not lastIndex then break end;		local str1 = string.sub(str, nextIndex, lastIndex - 1);		local m = string.find(str1, ",", 1);		if not m then			_err("----------------");		end;		local str2 = string.sub(str1, 1, m - 1);		local str3 = string.sub(str1, m + 1);		local key = tonumber(str2);		local value = tonumber(str3);		if not key or not value then			_err("!@#!$%%", str2, str3);		end;		tempT[key] = value;	end;	return tempT;end;--增加属性系统_G.CAddAttrSystem = {};function CAddAttrSystem:new(objPlayer)	local obj = CSystem:new("CAddAttrSystem");		for i, v in pairs(CAddAttrSystem) do		if type(v) == "function" then			obj[i] = v;		end;	end;		return obj;end;local key2num = {	dwAttack 		= 1;--攻击	dwDefense 		= 2;--防御	dwCrit 			= 3;--暴击	dwFlee 			= 4;--身法	dwAttackSpeed	= 5;--攻击速度	dwMoveSpeed		= 6;--移动速度	dwHitPercent 	= 7;--命中	dwAppendCrit 	= 8;--暴击伤害（百分比）	dwPoJiaValue 	= 9;--破甲值	dwDuck 			= 10;--闪避率	dwCritDown 		= 11;--暴击抵抗	dwPoJiaDiKang 	= 12;--破甲抵抗	dwRemitAttack 	= 13;--伤害减免	dwHPMax			= 14;--生命max	dwMPMax			= 15;--内力max}local num2key = {	[1] = "dwAttack";		--攻击	[2] = "dwDefense";		--防御	[3] = "dwCrit";			--暴击	[4] = "dwFlee";			--身法	[5] = "dwAttackSpeed";	--攻击速度	[6] = "dwMoveSpeed";	--移动速度	[7] = "dwHitPercent";	--命中	[8] = "dwAppendCrit";	--暴击伤害（百分比）	[9] = "dwPoJiaValue";	--破甲值	[10] = "dwDuck";		--闪避率	[11] = "dwCritDown";	--暴击抵抗	[12] = "dwPoJiaDiKang";	--破甲抵抗	[13] = "dwRemitAttack";	--伤害减免	[14] = "dwHPMax";		--生命max	[15] = "dwMPMax";		--内力max}--createfunction CAddAttrSystem:Create(bChangeLine)	--每个系统创建时都会挂接到自己的管理者player身上	self.objPlayer = self:GetPlayer();	if not self.objPlayer then		_err("CAddAttrSystem Create Cannot get player");		return false;	end;		--初始化DB模块	self.objDB = self.objPlayer:GetDBQuery();	if not self.objDB then		_err("CAddAttrSystem Create Cannot get DBQuery");		return false;	end;			--读取信息	local Data	= self.objPlayer:GetLineData("CAddAttrSystem");	if not Data then		_err("CAddAttrSystem Create Cannot GetLineData!!!");		return false;	end;	local data = Data[1];	self.tRecords = DecodeStr(data[1]);	self.tAttrs = DecodeStr(data[2]);	self.nTotalTimes = data[3];		self:Calculate();		return true;end;--换线开始function CAddAttrSystem:OnChangeLineBegin()	local data = {};	data[1] = EncodeStr(self.tRecords);	data[2] = EncodeStr(self.tAttrs);	data[3] = self.nTotalTimes;	self.objPlayer:SetLineData("CAddAttrSystem", data);end--计算属性function CAddAttrSystem:Calculate()	local t_attr = _G.SSingleAttrChange:new();	for k, v in pairs(self.tAttrs) do		local key = num2key[k];		t_attr[key] = v * _G.AddAttrConfig.Key2Value[key];	end;	local skillSystem = self.objPlayer:GetSystem("CSkillSystem");	if skillSystem then		skillSystem:NotifyMedicalAttr(t_attr);	end;end;--[[disable--计算总次数function CAddAttrSystem:GetTotalTimes()	local times = 0;	for k, v in pairs(self.tRecords) do		times = times + v;	end;	return times;	-- return self.nTotalTimes;end;]]function CAddAttrSystem:IsCanAdd()	return self.nTotalTimes < _G.AddAttrConfig.TotalTimes;end;function CAddAttrSystem:IsCanAddType(ntype)	local times = _G.AddAttrConfig.OnedayTypeTimes[ntype];	if times then		return (self.tRecords[ntype] or 0) < times;	else		return false;	end;end;function CAddAttrSystem:AddAttr(key, value)	local num = key2num[key];	self.tAttrs[num] = (self.tAttrs[num] or 0) + value;	self:Calculate();	self:WriteDB();end;function CAddAttrSystem:AddType(ntype)	self.tRecords[ntype] = (self.tRecords[ntype] or 0) + 1;	self.nTotalTimes = self.nTotalTimes + 1;	self:WriteDB();end;function CAddAttrSystem:WriteDB()	local SqlCmd = self.objDB:CreateUpdateCmd("t_role_addattrs");	SqlCmd.Wheres.roleid	= self.objPlayer:GetRoleID();	SqlCmd.Fields.records	= EncodeStr(self.tRecords);	SqlCmd.Fields.attrs		= EncodeStr(self.tAttrs);	SqlCmd.Fields.totaltimes= self.nTotalTimes;	SqlCmd:execute();end;function CAddAttrSystem:Reset()	self.tRecords = {};end;