
_G.CRewardCodeManager = CSingle:new();
CSingleManager:AddSingle(CRewardCodeManager,true);
local bWait = false
local bAs = false
local WaiteTable = {}
local dwLast = 0
------------------------------------------------------------------------------------------
local szTable = "T_Reward_Code_Info"
------------------------------------------------------------------------------------------
function CRewardCodeManager:Create()
	return true
end
function CRewardCodeManager:Update()
	if _now()-dwLast>3*60*1000 then
		bWait = false;
		bAs = true;
		table.remove(WaiteTable,1)
		self:CheckAndSend()
	end
	return true
end
function CRewardCodeManager:Destroy()
	return true
end

function CRewardCodeManager:OnASClose()
	-- print("--------> AS closed stop cd-key check:", #WaiteTable)
	bAs = false
end

function CRewardCodeManager:OnASConnect()
	-- print("--------> AS connect start cd-key check:", #WaiteTable)
	bAs = true
	self:CheckAndSend()
end

function CRewardCodeManager:AddSendList(Info)
	local dwCount = #WaiteTable
	if dwCount > 1000 then
		-- print("----> AS cd-key WaitList too long:",dwCount)
	end
	for k,v in pairs(WaiteTable) do
		if v.dwAccountID == Info.dwAccountID then
			WaiteTable[k] = Info
			return
		end
	end
	if #WaiteTable > 2000 then
		objPlayer.GSRewardCodeResMsg{Info={99,dwType,szCode}}
		return
	end
	table.insert(WaiteTable,Info)
end

function CRewardCodeManager:CheckAndSend()
	if not bAs then return end;
	if bWait then return end;
	if #WaiteTable == 0 then return end;
	dwLast = _now()
	self:SendToAS(1,WaiteTable[1])
	bWait = true
end
--------------------------------------------------------------------------------------------
--检查玩家能否领奖
function CRewardCodeManager:Check(dwType,szCode,dwRoleID,dwTeam)
	local objPlayer = CGameLineManager:GetPlayer(dwRoleID)
	if not objPlayer then return -1 end;
	local dwAccountID = objPlayer:GetAccountID()
	local dwServerHostID = CConfig.Network.dwServerHostID
	local Info = {}
	Info.dwAccountID = dwAccountID
	Info.dwServerID = dwServerHostID
	Info.szCode = szCode
	Info.dwRoleID = objPlayer:GetRoleID()
	--Info.strName = objPlayer:GetInfo().szRoleName
	self:AddSendList(Info)
	self:CheckAndSend()
end
--玩家领奖成功
function CRewardCodeManager:Get(dwType,szCode,dwRoleID)
end
--玩家领奖失败
function CRewardCodeManager:NoGet(szCode)
	local Info = {}
	Info.szCode = szCode
	self:SendToAS(2,Info)
end
function CRewardCodeManager:SendToAS(op,Info)
	Info.op = op
	local sData = json.encode(Info)
	BackstageSystem:SendToAS(BackstageSystem.setMessageID.CDKey, sData)
end
--------------------------------------------------------------------------------------------
local strTopic = "礼包领取"
local strContent = "大侠，这是您通过激活码：%s 领取的礼包，本来想早点给您送过来，但是康兴哥在送快递时迷路了！现在通过加急邮件给您送过来啦！！~"

--as 返回能否领奖
function CRewardCodeManager:OnRecvASRes(Info)
	bWait = false
	local Data = WaiteTable[1]
	table.remove(WaiteTable,1)
	self:CheckAndSend()
	
	local dwAccountID = Info.dwAccountID
	local res = Info.res
	local dwType = Info.dwType
	local szCode = Info.szCode
	local objPlayer = CPlayerManager:GetPlayer(dwAccountID)
	if objPlayer then
		objPlayer.GSRewardCodeResMsg{Info={res,dwType,szCode}}
		if (res==0) then
			CLogSystemManager:cdkey(objPlayer,szCode)
		end
	elseif (dwAccountID == Data.dwAccountID) and (res==0) then
		local strContent = string.format(strContent,szCode)
		local cfg = RewardTypeConfig[dwType]
		if not cfg then return end;
		local objItem = SItemMessage:new();
		objItem.dwItemEnum = cfg.dwItemEnum
		objItem.dwItemNumber = cfg.dwItemNumber
		objItem.dwBindType = cfg.dwBindType
		
		local objMail = CMail:new()
		objMail:SetSender( 10086, "系统" )
		objMail:SetReceiver( Data.dwRoleID, "" )
		objMail:SetContent( strTopic, strContent )
		objMail:SetLifeTime( SMailInfo.life*24*60*60*1000 )
		objMail:SetAccessory( 0, 0, 0, {objItem} )
		CMailManager:SendMail( objMail )
	end
end
--------------------------------------------------------------------------------------------







