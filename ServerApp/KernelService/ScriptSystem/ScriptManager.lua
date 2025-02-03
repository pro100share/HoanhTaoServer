--[[
	脚本
	周长沙
--]]
_G.CScriptManager = CSingle:new()
--插入单体管理器
CSingleManager:AddSingle(CScriptManager,true);

CScriptManager.WaitList = {}

CScriptManager.UrlInfo = nil

local dwLast = 0
local dwDelay = 5000
-------------------------------------------
--初始化
function CScriptManager:Create()
	self:AskForUrlInfo()
	return true
end
function CScriptManager:Update(e)
	if (not self.UrlInfo) and (_now() - dwLast > dwDelay) then
		dwDelay = dwDelay + 1000
		dwLast = _now()
		self:AskForUrlInfo()
		print("ReAsk For URL Info now delay :"..dwDelay)
		if dwDelay > 60000 then
			dwDelay = 1000
		end
	end
	return true
end
function CScriptManager:Destroy()
	return true
end
---------------------------------------------
define.ScriptChatNoticeMsg
{
	Str = "";
	Channel = 0;
	System = false;
	Param = {}; 
	Str2 = "";
	HideHead = false;
}
when{}
function ScriptChatNoticeMsg(Str,Channel,System,Param,Str2,HideHead)
	CScriptManager:ScriptChatNoticeAll(Str,Channel,System,Param,Str2,HideHead)
end

define.ScriptAskForUrlMsg
{
	LineID = 0
}
when{}
function ScriptAskForUrlMsg(LineID)
	if not CScriptManager.UrlInfo then
		table.insert(CScriptManager.WaitList,LineID)
	else
		CScriptManager:SendUrlInfo(LineID)
	end
end
---------------------------------------------------------------------------------
function CScriptManager:OnGetUrlInfo(Info)
	self:SetUrlInfo(Info)
	for i=1,#self.WaitList do
		local dwLineID = self.WaitList[i]
		self:SendUrlInfo(dwLineID)
	end
	self.WaitList = {}
	
	for dwLineID,objLine in pairs(CGameLineManager:GetAllLine()) do
		self:SendUrlInfo(dwLineID)
	end
end

function CScriptManager:SendUrlInfo(dwLineID)
	local objLine = CGameLineManager:GetLine(dwLineID)
	if objLine then
		objLine.ScriptUrlInfoMsg{Info=self.UrlInfo}
	end
end

function CScriptManager:AskForUrlInfo()
	BackstageSystem:SendToAS(BackstageSystem.setMessageID.Url, "")
end

function CScriptManager:SetUrlInfo(Info)
	local item = "tShowItem"
	local t = {
		[1]="GM";			
		[2]="Bug";		
		[3]="Sug";			
		[4]="Addicted";		
		[5]="Phone";	
		[6]="LunTan";		
		[7]="Mini";		
		[8]="Charge";
	}
	self.UrlInfo = {}
	for k,v in pairs(Info.Url) do
		self.UrlInfo[t[k]] = v
	end
	self.UrlInfo[item] = {}
	self.UrlInfo[item][1] = Info.Item[1]
	self.UrlInfo[item][2] = Info.Item[2]
	print("CScriptManager:SetUrlInfo(Info)")
	table.print(self.UrlInfo)
	--_err("zcs")
end
---------------------------------------------------------------------------------
function CScriptManager:OnGetChargeInfo(dwOrderID,dwAccountID,dwGold,dwTime)
	local dwOrderID = tostring((dwOrderID) or _now())
	local dwAccountID = tonumber(dwAccountID)
	local dwGold = tonumber(dwGold)
	local dwTime = _now()--tonumber(dwTime)
	self:WriteCharge(dwOrderID,dwAccountID,dwGold,dwTime)
	local objPlayer = CPlayerManager:GetPlayer(dwAccountID)
	if not objPlayer then return end;
	local dwRoleID = objPlayer:GetRoleID()
	local objLine = objPlayer.objLine
	if not objLine then return end;
	objLine.ScriptChargeInfoMsg{
		Info = {dwAccountID,dwGold,dwTime}
	}
end
local szTable = "T_Account_Charge_Record"
function CScriptManager:WriteCharge(dwOrderID,dwAccountID,dwGold,dwTime)
	local objDB = CPlayerDBQuery.objDBQuery
	local SqlCmd = objDB:CreateInsertCmd(szTable);
	SqlCmd.Fields = {
		dwOrderID = dwOrderID;
		dwAccountID = dwAccountID;
		dwGold = dwGold;
		dwTime = dwTime;
	};
	if not SqlCmd:execute() then
		_info("Insert ChargeInfo To DB Error");
		return false;
	end;
	return true;
	
end

---------------------------------------------------------------------------------
--全服公告
function CScriptManager:SystemNotice(szStr)
	for k,v in pairs(CGameLineManager:GetAllLine()) do
		v.ScriptOnRecvSystemNoticeMsg{Str=szStr}
	end
end
--全服聊天公告
function CScriptManager:ScriptChatNoticeAll(szStr,dwChannel,bSystem,Param,szStr2,bHideHead)
	for k,v in pairs(CGameLineManager:GetAllLine()) do
		v.ScriptChatNoticeMsg{
			Str = szStr;
			Channel = dwChannel;
			System = bSystem;
			Param = Param;
			Str2 = szStr2;
			HideHead=bHideHead;
		}
	end
end

function CScriptManager:ScriptTipNotice(szStr, szLink)
	for k,v in pairs(CGameLineManager:GetAllLine()) do
		v.ScriptTipNoticeMsg{
			Str = szStr;
            Link = szLink;
		}
	end
end;

----------------------------------------------------------------------------------


