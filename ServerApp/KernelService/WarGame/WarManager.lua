--世家战管理器

_G.CWarManager = CSingle:new();
CSingleManager:AddSingle(CWarManager);

CWarManager.setWarData = {};

function CWarManager:Create()
	
	return true;
end;

function CWarManager:Update()
	return true;
end;

function CWarManager:Destroy()

end;

---------------------------------------------------------------------------------------------------
--创建war
function CWarManager:AddWarGame(dwWarID,dwLineID)
	if not self.setWarData[dwWarID] then
		self.setWarData[dwWarID] = {};
	end
	
	self.setWarData[dwWarID][dwLineID] = dwLineID;
	
	--broadcast
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.OnGSAddWarGameMsg { WarID = dwWarID };
	end
	
	--世家战
	if GuildForbidWar[dwWarID] then
		CGuildManager:SetCombatFlag(true);
	end
end;

--删除war
function CWarManager:DelWarGame(dwWarID,dwLineID)
	local tbLine = self.setWarData[dwWarID];
	if tbLine then
		tbLine[dwLineID] = nil;
	end
	
	local isHaveWar = false;
	if tbLine then
		for n,v in pairs(tbLine)do
			isHaveWar = true;
			break;
		end
	end
	
	if isHaveWar then
		return;
	end
	
	self.setWarData[dwWarID] = nil;
	
	--broascast
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.OnGSRmvWarGameMsg { WarID = dwWarID };
	end
	
	--世家战
	if GuildForbidWar[dwWarID] then
		CGuildManager:SetCombatFlag(false);
	end
end;

--查询war，返回一个lineid
function CWarManager:RequestWarLine(dwRequester,dwWarID,dwFromLine)
	local objFromLine = CGameLineManager:GetLine(dwFromLine);
	if not objFromLine then
		_err("can not fine line",dwFromLine)
		return;
	end
	
	local tbLine = self.setWarData[dwWarID];
	if not tbLine then
		objFromLine.OnGSWarLineDataMsg
		{
			RoleID = dwRequester;
			WarID = dwWarID;
			LineID = -1;
		};
		return;
	end
	
	for id,_ in pairs(tbLine)do
		local objDesLine = CGameLineManager:GetLine(id);
		if objDesLine and (not objDesLine:IsFull()) then
			objFromLine.OnGSWarLineDataMsg
			{
				RoleID = dwRequester;
				WarID = dwWarID;
				LineID = id;
			};
			return;
		end
	end
	
	objFromLine.OnGSWarLineDataMsg
	{
		RoleID = dwRequester;
		WarID = dwWarID;
		LineID = -2;
	};
end;

function CWarManager:ClearLineWar(dwLineID)
	local tbDelete = {};
	for dwWar,tbLineInfo in pairs(self.setWarData)do
		for n,v in pairs(tbLineInfo)do
			if dwLineID == v then
				table.insert(tbDelete,{dwWar,dwLineID});
			end
		end
	end
	
	for n,tb in pairs(tbDelete)do
		self:DelWarGame(tb[1],tb[2]);
	end
end;

function CWarManager:InitLineWar(tbWarList,dwLineID)
	for _,dwWarID in pairs(tbWarList)do
		if not self.setWarData[dwWarID] then
			self.setWarData[dwWarID] = {};
		end
		self.setWarData[dwWarID][dwLineID] = dwLineID;
	end
	
	--broadcast
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		CWarManager:SendAllWarInfo(v);
	end
end;

function CWarManager:BroadcastWarNotice(dwNoticeType,dwStringID,tbParam)
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.OnGSWarNoticeMsg
		{
			NoticeType = dwNoticeType;
			StringID = dwStringID;
			Param = tbParam;
		};
	end
end;

function CWarManager:SendAllWarInfo(objLine)
	local tb = {};
	
	local isNeedSend = false;
	for dwWar,tbLineInfo in pairs(self.setWarData)do
		tb[dwWar] = dwWar;
		isNeedSend = true;
	end
	
	if isNeedSend then
		objLine.OnGSWarInfoMsg{WarInfo = tb}
	end
end;
