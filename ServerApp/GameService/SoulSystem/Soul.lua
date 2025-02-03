--战魂单体

_G.CSoulObject = {};
function CSoulObject:new(dwEnumID)
	local obj = {};
	
	obj.dwEnumID = dwEnumID;
	obj.dwInstID = 0;
	obj.dwHolderType = 0;
	obj.dwPosID = 0;
	obj.dwLevel = 0;
	obj.dwExp = 0;
	
	obj.dwLevel = 1;
	
	for i,v in pairs(CSoulObject) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	--初始经验
	if SoulInitExp[obj:GetQuality()] then
		obj.dwExp = SoulInitExp[obj:GetQuality()];
	end;
	return obj;
end;

--DB数据
function CSoulObject:GetDBInfo()
	
end;

--填充DB数据
function CSoulObject:FillWithInfo(tbInfo)
	self.dwInstID = tbInfo[2];
	self.dwEnumID = tbInfo[1];
	self.dwHolderType = tbInfo[3];
	self.dwPosID = tbInfo[4];
	
	if tbInfo[5] > self.dwExp then
		self.dwExp = tbInfo[5];
	end
	
	self.dwLevel = SoulUpLevelConfig:CountSoulLevel(self.dwEnumID,self.dwExp);
end;

function CSoulObject:GetLevel()
	return self.dwLevel;
end;

function CSoulObject:GetExp()
	return self.dwExp;
end;

--获取网络发送数据，自带格式化
function CSoulObject:GetNetInfo()
	local objNetInfo = SoulObjectNetInfo:new();
	objNetInfo.dwEnumID = self.dwEnumID;
	objNetInfo.dwInstID = self.dwInstID;
	objNetInfo.dwHolderType = self.dwHolderType;
	objNetInfo.dwPosID = self.dwPosID;
	objNetInfo.dwExp = self.dwExp;
	
	local objSendInfo = {};
	
	for k,v in pairs(objNetInfo)do
		local dwIndex = GetSoulName2Index(k);
		if dwIndex then
			objSendInfo[dwIndex] = v;
		end
	end
	
	return objSendInfo;
end;

function CSoulObject:GetEnumID()
	return self.dwEnumID;
end;

function CSoulObject:GetInstID()
	return self.dwInstID;
end;

function CSoulObject:GetPosInfo()
	return self.dwHolderType,self.dwPosID;
end;

function CSoulObject:GetEquipID()
	local cfg = SoulObject[self.dwEnumID];
	if not cfg then
		_err("soul enum id err ",self.dwEnumID);
		return 0;
	end
	
	return cfg.dwEquipID;
end;

function CSoulObject:GetSellPrice()
	local cfg = SoulObject[self.dwEnumID];
	if not cfg then
		_err("soul enum id err ",self.dwEnumID);
		return 0;
	end
	
	return cfg.dwSalePrice;
end;

function CSoulObject:GetQuality()
	local cfg = SoulObject[self.dwEnumID];
	if not cfg then
		_err("soul enum id err ",self.dwEnumID);
		return 0;
	end
	
	return cfg.dwQuality;
end;

function CSoulObject:GetProList()
	local cfg = SoulObject[self.dwEnumID];
	if not cfg then
		_err("soul enum id err ",self.dwEnumID);
		return {};
	end
	
	return SoulProperty[cfg.ProListID] or {};
end;

--战魂属性
function CSoulObject:GetAddAttr()
	local tbValue = SoulFunction.FunCountSoulProValue(self.dwEnumID,self:GetLevel());
	
	return SoulFunction.FunProTypeValue(tbValue);
end;

-------------------------------------------------------------------------------

function CSoulObject:SetInstID(dwID)
	self.dwInstID = dwID;
end;

function CSoulObject:SetPosInfo(dwType,dwPosID)
	self.dwHolderType = dwType;
	self.dwPosID = dwPosID;
end;
-----------------------------------------------------------
function CSoulObject:AddExp(dwAddExp)
	if self:IsExpFull() then
		return false;
	end
	
	self.dwExp = self.dwExp + dwAddExp;
	
	local dwMax = SoulUpLevelConfig:GetMaxExp(self:GetEnumID());
	if self.dwExp > dwMax then
		self.dwExp = dwMax;
	end
	
	self.dwLevel = SoulUpLevelConfig:CountSoulLevel(self.dwEnumID,self.dwExp);
	
	return true;
end;

--经验值是否已经满了
function CSoulObject:IsExpFull()
	return self.dwExp >= SoulUpLevelConfig:GetMaxExp(self:GetEnumID());
end;

--是否可以吃别的战魂
function CSoulObject:IsCanEatOther()
	if SoulEatForbidType[self:GetQuality()] then
		-- print("===IsCanEatOther fail 1===",self:GetQuality())
		return;
	end
	
	if self:IsExpFull() then
		-- print("===IsCanEatOther fail 2===",self:GetExp())
		return;
	end
	
	return true;
end;
