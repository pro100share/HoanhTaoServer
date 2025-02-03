--[[
	gs 活动管理（开启 结束）
	周长沙
	2013-5-23
--]]
-------------------------------------------------------
_G.CFestivalManager = CSingle:new();
CSingleManager:AddSingle(CFestivalManager);
-------------------------------------------------------
local do_file = function(szFileName)
	local szFileName = "../Data/AFConfig/"..szFileName
	dofile(szFileName)
end
-------------------------------------------------------
CFestivalManager.AllFestival = {}
-------------------------------------------------------
local function group_msg(setNet,szMsgName,tParam)
	_groupcallout(setNet, szMsgName, tParam);
end

local function GetAllPlayer()
	return CPlayerManager.setAllPlayerByRoleID 
end
-------------------------------------------------------

function CFestivalManager:Create()
	--self.CFG = FestivalMainConfig
	self.bLoaded = false;
	self.AllFestival = {}
	self:SendAskForFestivalInfo()
end

function CFestivalManager:Update()
end;

function CFestivalManager:Destroy()
end;

function CFestivalManager:IsLoaded()
	return self.bLoaded
end
--------------------------------------------------------

function CFestivalManager:AddFestival(dwIndex,Festival)
	self.AllFestival[dwIndex] = Festival
end

function CFestivalManager:GetFestival(dwIndex)
	return self.AllFestival[dwIndex]
end

function CFestivalManager:GetAllFestival()
	return self.AllFestival
end


function CFestivalManager:RemoveFestival(dwIndex)
	self.AllFestival[dwIndex] = nil
end

function CFestivalManager:GetAllFestival()
	return self.AllFestival
end

-- @brief 获取累计活动
-- 1 - 充值
-- 2 - 消费
function CFestivalManager:GetAccumulative()
    local setAccumulatives = {
        [1] = {};
        [2] = {};
    };
    local setFestivals = CFestivalManager:GetAllFestival();
    for k, objFestival in pairs(setFestivals) do
        local setLines = objFestival:GetAllLine();
        for k, objLine in pairs(setLines) do
            local dwType = nil;
            if objLine.CFG.dwChargeType == 5 then
                dwType = 1;
            elseif objLine.CFG.dwChargeType == 6 then
                dwType = 2;
            end
            if dwType ~= nil then
				local strFormat = "%04d%02d%02d";
				local dwStartTime = tonumber(CTimeFormat:todate(math.floor(objLine.TimeInfo.dwStartTime / 1000), strFormat, false));
				local dwEndTime = tonumber(CTimeFormat:todate(math.floor(objLine.TimeInfo.dwEndTime / 1000), strFormat, false));
                setAccumulatives[dwType][k] = {
                    [1] = dwStartTime;
                    [2] = dwEndTime;
                };
            end
        end
    end
	return setAccumulatives;
end
--------------------------------------------------------
function CFestivalManager:IsFestival(dwIndex)
	return (self:GetFestival(dwIndex) and true) or false
end
function CFestivalManager:IsLine(dwIndex,dwLine)
	if not self:IsFestival(dwIndex) then return false end;
	return (self:GetFestival(dwIndex):GetLine(dwLine) and true) or false;
	--return self:GetFestival(dwIndex) and self:GetFestival(dwIndex):GetLine(dwLine)
end
--------------------------------------------------------
-------------------------------------------------KS 消息
---------------------------------------------Recv
--KS->所有节日活动消息
function CFestivalManager:OnRecvAllFestival(Info)
	do_file("FestivalScript.lua")
	for k,v in pairs(Info) do
		local Festival = CFestival:new(v)
		self:AddFestival(k,Festival)
		if v.Line then
			for i,j in pairs(v.Line) do
				local Line = CFestivalLine:new(j)
				Festival:AddLine(i,Line)
			end
		end
	end
	self.bLoaded = true;
	self:ModiCheck()
end
--KS->节日开始
function CFestivalManager:OnRecvFestivalStart(Info)
	local Festival = CFestival:new(Info)
	self:AddFestival(Festival:GetIndex(),Festival)
	self:SendFestivalStart(Festival)
end
--KS->节日结束
function CFestivalManager:OnRecvFestivalEnd(Info)
	local dwIndex = Info[1]
	self:RemoveFestival(dwIndex)
	CFestivalManager:SendFestivalEnd(dwIndex)
end
--KS->活动开始
function CFestivalManager:OnRecvFestivalLineStart(Info)
	local dwIndex = Info.dwFestival
	local dwLine = Info.dwLine
	local Festival = self:GetFestival(dwIndex)
	if not Festival then return end;
	local Line = CFestivalLine:new(Info)
	Festival:AddLine(dwLine,Line)
	self:SendLineStart(Line)
end
--KS->活动结束
function CFestivalManager:OnRecvFestivalLineEnd(Info)
	local dwIndex = Info[1]
	local dwLine = Info[2]
	local Festival = self:GetFestival(dwIndex)
	if not Festival then return end;
	Festival:RemoveLine(dwLine)
	self:SendLineEnd(dwIndex,dwLine)
end
--KS->活动奖励
function CFestivalManager:OnRecvFestivalLineReward(Info)
	local dwIndex = Info.dwFestival
	local dwLine = Info.dwLine
	local Festival = self:GetFestival(dwIndex)
	if not Festival then return end;
	local Line = Festival:GetLine(dwLine)
	Line:SetNode(Info.Node)
	self:SendLineReward(Info)
end
--------------------------------------------------Send
--请求活动信息 -->KS
function CFestivalManager:SendAskForFestivalInfo()
	CKernelApp.GSAskForFestivalInfoMsg{}
end
--节日开始 -->Clt
function CFestivalManager:SendFestivalStart(Festival)
	local Players = GetAllPlayer()
	local Info = 
		{
			dwIndex = Festival:GetIndex();
			Time = Festival:GetTime();
		};
	for k,v in pairs(Players) do
		local sysFestival = v:GetSystem("CFestivalSystem")
		sysFestival:StartSync()
		local f = function()
			v.FestivalStartFestivalMsg{Info=Info}
		end
		table.insert(sysFestival.InitFun,f)
	end
end
--活动开始 -->Clt
function CFestivalManager:SendLineStart(Line)
	local Players = GetAllPlayer()
	local setNet = {}
	local szMsgName = "FestivalStartLineMsg"
	local Info = 
		{
			dwIndex = Line.dwFestival;
			dwLine = Line.dwLine;
			Time = Line:GetTime();
		};

	for k,v in pairs(Players) do
		local sysFestival = v:GetSystem("CFestivalSystem")
		sysFestival:StartSync()
		local f = function()
			v.FestivalStartLineMsg{Info=Info}
			sysFestival:CheckReward()
		end
		table.insert(sysFestival.InitFun,f)
	end
end
--节日结束 -->Clt
function CFestivalManager:SendFestivalEnd(dwIndex)
	local Players = GetAllPlayer()
	local setNet = {}
	local szMsgName = "FestivalEndFestivalMsg"
	local tParam = {
		Info = {
			dwIndex = dwIndex;
		};
	}
	for k,v in pairs(Players) do
		table.insert(setNet,v.objNet)
	end
	group_msg(setNet,szMsgName,tParam)
	
	for k,v in pairs(Players) do
		local sysFestival = v:GetSystem("CFestivalSystem")
		sysFestival:OnFestivalEnd(dwIndex)
	end
end
--活动结束 -->Clt
function CFestivalManager:SendLineEnd(dwIndex,dwLine)
	local Players = GetAllPlayer()
	local setNet = {}
	local szMsgName = "FestivalEndLineMsg"
	local tParam = {
		Info = {
			dwIndex = dwIndex;
			dwLine = dwLine;
		};
	}
	for k,v in pairs(Players) do
		table.insert(setNet,v.objNet)
	end
	group_msg(setNet,szMsgName,tParam)
	
	for k,v in pairs(Players) do
		local sysFestival = v:GetSystem("CFestivalSystem")
		sysFestival:OnLineEnd(dwIndex,dwLine)
	end
end
--活动奖励 -->Clt
function CFestivalManager:SendLineReward(Info)
	--print("CFestivalManager:SendLineReward(Info)")
	--table.print(Info)


	local Players = GetAllPlayer()
	local setNet = {}
	local szMsgName = "FestivalRewardLineMsg"
	local tParam = {
		Info = {
			dwIndex = Info.dwFestival;
			dwLine = Info.dwLine;
			Node = Info.Node;
		};
	}
	for k,v in pairs(Players) do
		table.insert(setNet,v.objNet)
	end
	group_msg(setNet,szMsgName,tParam)
	
	for k,v in pairs(Info.Node) do
		for _,p in pairs(v) do
			local dwRoleID = p.dwRoleID
			local objPlayer = CPlayerManager:GetPlayerByRoleID(dwRoleID)
			if objPlayer then
				local sysFestival = objPlayer:GetSystem("CFestivalSystem")
				sysFestival:CheckReward()
			end
		end
	end
end
-------------------------------------------------------------































































