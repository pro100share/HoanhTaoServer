--[[
功能：闭关系统
作者：刘炜
时间：2012-2-8
]]

_G.CPKSystem = {};



function CPKSystem:new()
	local obj = CSystem:new("CPKSystem");
	obj.dwPKMode = enPKMode.ePK_Peace; --pk模式
	obj.dwPKValue = 0;
	obj.dwSetMode = 0;--加点模式
	
	obj.dwGuildCount = 0;--倒计时，剩余的分钟数，Count为0时不是红名消失，而是罪恶值减1
	
	for i,v in pairs(CPKSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CPKSystem:Create()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if not CConfig.bIsCrossSvr then
		local objDB = objPlayer:GetDBQuery();
		self.objDBQuery = CPKSystemDB:new(objDB,self);
		if not self.objDBQuery then
			return false;
		end;
	end;

	local Data	= objPlayer:GetLineData("CPKSystem")[1];
	
	self.dwPKMode = Data[1];
	self.dwPKValue = Data[2];
	self.dwSetMode = Data[3];
	
	local dwLevel = objPlayer:GetLevel();
	if dwLevel <= enAutoAddPointLevel then
		self.dwSetMode = 1;
	end
	
	self:InitPKValue();
	
	if Data[4] then
		self.dwGuildCount = Data[4];
	end
	
	return true;
end;

function CPKSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	local Data = {};
	Data[1] = self.dwPKMode;
	Data[2] = self.dwPKValue;
	Data[3] = self.dwSetMode;
	Data[4] = self.dwGuildCount;
	objPlayer:SetLineData("CPKSystem",Data);
end;

function CPKSystem:OnEnterCrossBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	local Data = {};
	Data[1] = self.dwPKMode;
	Data[2] = self.dwPKValue;
	Data[3] = self.dwSetMode;
	Data[4] = self.dwGuildCount;
	objPlayer:SetCrossSvrData("CPKSystem",Data);
end;

function CPKSystem:GetPKMode()
	return self.dwPKMode;
end;

function CPKSystem:OnChangeLineEnd()
	self:AddBuffWithInit();
end

function CPKSystem:OnEnterGameOver()
	self:AddBuffWithInit();
end;

function CPKSystem:AddBuffWithInit()
	if self.dwPKValue == 0 then
		return;
	end
	
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	local objBuffSys = objPlayer:GetSystem("CBuffSystem");
	if not objBuffSys then
		return;
	end
	
	local objBuffSingle = nil;
	local dwBuffID = 0;
	local dwLifeTime = 0;
	if self.dwPKValue < 0 then
		dwLifeTime = self.dwGuildCount*60*1000;
		dwBuffID = PKBuffConfig.YellowBuff;
	else
		dwLifeTime = (self.dwGuildCount + (self.dwPKValue-1)*PKConfig.dwRedValueLength)*60*1000;
		dwBuffID = PKBuffConfig.RedBuff;
	end
	objBuffSingle = objBuffSys:GetBuffObj(dwBuffID);
	
	if not objBuffSingle then
		self:AddBuff(dwBuffID);
		
		objBuffSingle = objBuffSys:GetBuffObj(dwBuffID);
	end
	
	if objBuffSingle then
		objBuffSys:SetBuffLifeTime(objBuffSingle, dwLifeTime);
	end
end;

function CPKSystem:Update()
	if self.dwPKValue == 0 then
		return;
	end
	
	self.dwGuildCount = self.dwGuildCount - 1;
	
	if self.dwGuildCount <= 0 then
		if self.dwPKValue == PKConfig.dwYellowValue then
			self:ClearValue();
		elseif self.dwPKValue > 0 then
			self:DelGuildValue();
		end
		return;
	end
end;

function CPKSystem:Destroy()
	if self.objDBQuery then
		self:Save();
		self.objDBQuery = nil;
	end;
	
	if self.objDriver then
		CDriverManager:DelDriver(self.objDriver)
	end
end;

function CPKSystem:OnEnterScene()
	self:SendPKInfo();
	
	self:SendPKValue();
	
	self:SendSetMode();
end;

function CPKSystem:OnChangeSceneEnd()
	self:SendPKInfo();
	
	self:SendPKValue();
	
	self:SendSetMode();
end;

--发送PK模式和PK值
function CPKSystem:SendPKInfo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	--print("online mode = "..self.dwPKMode)
	
	objPlayer.OnReadPKInfoMsg{PKMode = self.dwPKMode,PkValue = self.dwPKValue};
end;

function CPKSystem:Save()
	self.objDBQuery:SavePKMode(self.dwPKMode,self.dwPKValue);
	self.objDBQuery:SaveSetMode(self.dwSetMode)
end;

function CPKSystem:SetPKModeByClient(dwMode)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end;
	
	local objMap = objPlayer:GetSystem("CMapSystem"):GetCurMap();
	if not objMap then
		return;
	end
	
	if MapForbidPKMode[objMap.MapID] then
		return;
	end
	
	self:SetPKMode(dwMode)
end;

--设置PK模式
function CPKSystem:SetPKMode(dwMode)
	if self.dwPKMode == dwMode then
		return;
	end
	
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end;
	
	self.dwPKMode = dwMode;
	
	objPlayer.OnReadPKInfoMsg{PKMode = self.dwPKMode,PkValue = self.dwPKValue};
	--print("set mode = "..self.dwPKMode)
	
	--self.objDBQuery:SavePKMode(dwMode,self.dwPKValue);
	--if not CConfig.bIsCrossSvr then
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventPKMode);
	--end;
end;

--PK值：-1--PK状态；0--白名；正数--罪恶值
function CPKSystem:SetPKValue(fValue)
	
end;

-------------------------------------------------------------------------------
--进入黄名状态
function CPKSystem:AddYellow()
	if not self:CheckIsCanChangeValue() then
		return;
	end
	
	if self.dwPKValue < 0 then
		self.dwGuildCount = PKConfig.dwYellowLength;
		self:AddDriver();
		return;
	elseif self.dwPKValue > 0 then
		return;
	end
	
	self.dwGuildCount = PKConfig.dwYellowLength;
	self.dwPKValue = PKConfig.dwYellowValue;
	
	self:AddBuff(PKBuffConfig.YellowBuff);
	
	self:AddDriver();
	
	self:SendPKValue();
	
	local objPlayer = self:GetPlayer();
	if objPlayer then
		local objTextSys = objPlayer:GetSystem("PlayerShowTextSystem");
		if objTextSys then
			objTextSys:SetSp(11);
		end
	end;
end;

--增加罪恶值
function CPKSystem:AddGuildValue(fAdd)
	if not self:CheckIsCanChangeValue() then
		return;
	end
	
	fAdd = fAdd or 1;
	if fAdd < 0 then
		fAdd = 1;
	end
	
	
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return
	end
	local objTextSys = objPlayer:GetSystem("PlayerShowTextSystem");
	if not objTextSys then
		return;
	end
	
	if self.dwPKValue <= 0 then
		self.dwPKValue = 0;
		self.dwGuildCount = PKConfig.dwRedValueLength;
		self:DelBuff(PKBuffConfig.YellowBuff);
		objTextSys:DelSp(11);
	end
	
	self.dwPKValue = self.dwPKValue + fAdd;
	self:AddBuff(PKBuffConfig.RedBuff);
	
	self:AddDriver();
	
	self:SendPKValue();
	
	objTextSys:SetSp(12);
end;

--减少罪恶值
function CPKSystem:DelGuildValue(fDel)
	fDel = fDel or 1;
	if fDel < 0 then
		fDel = 1;
	end
	
	if self.dwPKValue <= 0 then
		return;
	end
	
	self.dwPKValue = self.dwPKValue - fDel;
	
	if self.dwPKValue <= 0 then
		self.dwPKValue = 0;
		self:DelDriver();
		self:DelBuff(PKBuffConfig.RedBuff);
	
		local objPlayer = self:GetPlayer();
		if objPlayer then
			local objTextSys = objPlayer:GetSystem("PlayerShowTextSystem");
			if objTextSys then
				objTextSys:DelSp(12);
				objTextSys:DelSp(11);
			end
		end;
		
		self.dwGuildCount = 0;
	else
		self.dwGuildCount = PKConfig.dwRedValueLength;
	end
	
	self:SendPKValue();
end;

--清零
function CPKSystem:ClearValue()
	if self.dwPKValue == 0 then
		self:DelDriver();
		return;
	end
	self.dwPKValue = 0;
	self:DelDriver();
	self:SendPKValue();
	
	self:DelBuff(PKBuffConfig.YellowBuff);
	self:DelBuff(PKBuffConfig.RedBuff);
	
	local objPlayer = self:GetPlayer();
	if objPlayer then
		if not CConfig.bIsCrossSvr then
			local objTextSys = objPlayer:GetSystem("PlayerShowTextSystem");
			if objTextSys then
				objTextSys:DelSp(12);
				objTextSys:DelSp(11);
			end
		end;
	end;
	
	self.dwGuildCount = 0;
end;

--检测当前是否允许修改PK值
function CPKSystem:CheckIsCanChangeValue()
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local objMapSys = objSelf:GetSystem("CMapSystem");
	if not objMapSys then
		return;
	end
	
	local dwMapID = objMapSys:GetCurMapID();
	
	if CPKValueChangeForbid[dwMapID] then
		return;
	end
	
	return true;
end;

function CPKSystem:AddDriver()
	if not self.objDriver then
		self.objDriver = CDriverManager:AddDriver(eInterval._1min,self,self.Update);
	end
end;
function CPKSystem:DelDriver()
	if self.objDriver then
		CDriverManager:DelDriver(self.objDriver);
		self.objDriver = nil;
	end
end;
function CPKSystem:AddBuff(dwBuffID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end;
	
	local objBuffSys = objPlayer:GetSystem("CBuffSystem");
	if objBuffSys then
		objBuffSys:AddBuff(dwBuffID,1);
	end
end;
function CPKSystem:DelBuff(dwBuffID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end;
	
	local objBuffSys = objPlayer:GetSystem("CBuffSystem");
	if objBuffSys then
		objBuffSys:DeleteBuffByID(dwBuffID);
	end
end

-------------------------------------------------------------------------------
function CPKSystem:InitPKValue()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end;
	objPlayer:PKValueChange()
	if not CConfig.bIsCrossSvr then
		local objTextSys = objPlayer:GetSystem("PlayerShowTextSystem");
		if not objTextSys then
			return;
		end
	end;
	if self.dwPKValue > 0 then
		self.dwGuildCount = PKConfig.dwRedValueLength;
		self:AddDriver();
		if objTextSys then
			objTextSys:SetSp(12);
		end;
	elseif self.dwPKValue < 0 then
		self.dwGuildCount = PKConfig.dwYellowLength;
		self:AddDriver();
		if objTextSys then
			objTextSys:SetSp(11);
		end;
	end
	
	self:SendPKValue();
end;

function CPKSystem:SendPKValue()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if objMapSys then
		_mapcallout("OnPKValueChangeMsg", 
		{
			RoleID = objPlayer:GetRoleID(),
			PKValue = self.dwPKValue,
		},objMapSys:GetLogicID(),true);
	end
	-- objPlayer.OnPKValueChangeMsg
	-- {
		-- RoleID = objPlayer:GetRoleID(),
		-- PKValue = self.dwPKValue,
	-- }
end;

function CPKSystem:SetPointMode(dwMode)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end;
	local dwLevel = objPlayer:GetLevel();
	if dwLevel <= enAutoAddPointLevel then
		self.dwSetMode = 1;
	else
		self.dwSetMode = dwMode;
	end
end;

function CPKSystem:SendSetMode()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end;
	
	objPlayer.OnSetPointModeMsg{Mode = self.dwSetMode};
end;
