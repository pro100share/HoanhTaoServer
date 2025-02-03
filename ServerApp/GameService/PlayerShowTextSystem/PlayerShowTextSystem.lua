--[[
	服务器 玩家头顶文字系统
	周长沙
	2012-3-31
--]]
_G.PlayerShowTextSystem = {}
-----------------------------------------------------------
local function CheckTable(t)
	for k,v in pairs(t) do
		return t
	end
	return nil
end
local function group_msg(setNet,szMsgName,tParam)
	_groupcallout(setNet, szMsgName, tParam);
end
-----------------------------------------------------------
function PlayerShowTextSystem:new()
	local obj = CSystem:new("PlayerShowTextSystem");
	for i,v in pairs(PlayerShowTextSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	obj.szLoverText = ""
	obj.tbTitle = {}
	obj.szTalk = ""
	obj.tbSp = {}
	return obj;
end
function PlayerShowTextSystem:Create()
	return true
end
function PlayerShowTextSystem:Update(dwInterval)
	return true
end
function PlayerShowTextSystem:Destroy()
	return true
end
--系统换线开始
function PlayerShowTextSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer()
	local arrParam = {}
	arrParam[1] = self.szLoverText
	arrParam[2] = self.tbTitle
	arrParam[3] = self.szTalk
	arrParam[4] = self.tbSp
	objPlayer:SetLineData("PlayerShowTextSystem",arrParam)
end
--系统换线结束
function PlayerShowTextSystem:OnChangeLineEnd(dwNewLineID)
	local objPlayer = self:GetPlayer()
	local arrParam = objPlayer:GetLineData("PlayerShowTextSystem")[1]
	self.szLoverText = arrParam[1]
	self.tbTitle = arrParam[2]
	self.szTalk = arrParam[3]
	self.tbSp = arrParam[4]
end;
-----------------------------------------------------------
--设置伴侣信息
function PlayerShowTextSystem:SetLoverText(szText)
	self.szLoverText = szText or ""
	self:SendLoverText()
	return self.szLoverText
end
--设置称号
function PlayerShowTextSystem:SetTitle(szText,szIcon,dwPos)
	local dwPos = dwPos
	if dwPos then
		self.tbTitle[dwPos] = { szText = szText; szIcon = szIcon }
		self:SendTitleInfo()
		return dwPos
	else
		for i=1,20 do
			if not self.tbTitle[i] then
				self.tbTitle[i] = { szText = szText; szIcon = szIcon }
				self:SendTitleInfo()
				return i
			end
		end
	end
end
--删除称号
function PlayerShowTextSystem:DelTitle(dwPos)
	if dwPos then
		self.tbTitle[dwPos] = {}
		self:SendTitleInfo()
		return true
	else
		self.tbTitle = {}
		self:SendTitleInfo()
		return false
	end
end
--设置说话
function PlayerShowTextSystem:SetTalk(szText)
	self.szTalk = szText
	self:SendTalkInfo()
	return self.szTalk
end
--设置特殊
function PlayerShowTextSystem:SetSp(dwType)
	self.tbSp[dwType] = true
	self:SendSpInfo()
end
--清除特殊
function PlayerShowTextSystem:DelSp(dwType)
	self.tbSp[dwType] = nil
	self:SendSpInfo()
end
--获得所有文字信息
function PlayerShowTextSystem:GetAllText()
	local tbTable = {}
	tbTable.szLoverText = self.szLoverText
	tbTable.tbTitle = CheckTable(self.tbTitle)
	tbTable.szTalk = self.szTalk
	tbTable.tbSp = CheckTable(self.tbSp)
	return tbTable
end
-----------------------------------------------------------
--发送所有文字信息
function PlayerShowTextSystem:SendAllTextInfo()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local dwRoleId = objPlayer:GetRoleID()
	local setPlayer = objPlayer:GetOtherPlayer(nil,1);
	local sendInfo = {}
	local setNet = {}
	local szMsgName = "PlayerShowTextGetAllTextMsg"
	local tParam = {RoleId=dwRoleId;LoverText=self.szLoverText;Title=self.tbTitle;Talk=self.szTalk;Sp=self.tbSp}
	
	for i,Player in pairs(setPlayer) do
		--Player.PlayerShowTextGetAllTextMsg{RoleId=dwRoleId;LoverText=self.szLoverText;Title=self.tbTitle;Talk=self.szTalk;Sp=self.tbSp}
		table.insert(setNet,Player.objNet)
		if i ~= dwRoleId then
			local sysPlayerShowText = Player:GetSystem("PlayerShowTextSystem")
			if sysPlayerShowText then
				local tbInfo = sysPlayerShowText:GetAllText()
				sendInfo[i] = tbInfo
			end
		end
	end
	group_msg(setNet,szMsgName,tParam)
	objPlayer.PlayerShowTextGetAllNearTextMsg{SendInfo = sendInfo}
end
--向某个玩家发送我的文字信息
function PlayerShowTextSystem:SendMyInfo(objOther)
	local objPlayer = self:GetPlayer()
	local dwRoleId = objPlayer:GetRoleID()
	objOther.PlayerShowTextGetAllTextMsg{RoleId=dwRoleId;LoverText=self.szLoverText;Title=self.tbTitle;Talk=self.szTalk}
	self:SendMySpInfo(objOther)
end
--发送伴侣信息更新
function PlayerShowTextSystem:SendLoverText()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local dwRoleId = objPlayer:GetRoleID()
	-- local setPlayer = objPlayer:GetOtherPlayer(nil,1);
	-- local tbNet = {}
	-- for i,Player in pairs(setPlayer) do
		-- --Player.PlayerShowTextUpdateLoverMsg{RoleId=dwRoleId;LoverText=self.szLoverText}
		-- table.insert(tbNet,Player.objNet);
	-- end
	-- _groupcallout(tbNet, "PlayerShowTextUpdateLoverMsg", 
	-- {
		-- RoleId=dwRoleId;
		-- LoverText=self.szLoverText;
	-- });
	
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if objMapSys then
		_mapcallout("PlayerShowTextUpdateLoverMsg", 
			{
				RoleId=dwRoleId;
				LoverText=self.szLoverText;
			}, 
			objMapSys:GetLogicID(), true)
	end
	objPlayer:ViewChange()
end
--发送称号更新
function PlayerShowTextSystem:SendTitleInfo()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local dwRoleId = objPlayer:GetRoleID()
	-- local setPlayer = objPlayer:GetOtherPlayer(nil,1);
	-- local tbNet = {}
	-- for i,Player in pairs(setPlayer) do
		-- --Player.PlayerShowTextUpdateTitleMsg{RoleId=dwRoleId;Title=self.tbTitle}
		-- table.insert(tbNet,Player.objNet);
	-- end
	-- _groupcallout(tbNet, "PlayerShowTextUpdateTitleMsg", 
	-- {
		-- RoleId=dwRoleId;
		-- Title=self.tbTitle;
	-- });
	
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if objMapSys then
		_mapcallout("PlayerShowTextUpdateTitleMsg", 
			{
				RoleId=dwRoleId;
				Title=self.tbTitle;
			}, 
			objMapSys:GetLogicID(), true)
	end
	
	objPlayer:ViewChange()
end
--发送说话更新
function PlayerShowTextSystem:SendTalkInfo()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local dwRoleId = objPlayer:GetRoleID()
	-- local setPlayer = objPlayer:GetOtherPlayer(nil,1);
	-- local tbNet = {}
	-- for i,Player in pairs(setPlayer) do
		-- --Player.PlayerShowTextUpdateTalkMsg{RoleId=dwRoleId;Talk=self.szTalk}
		-- table.insert(tbNet,Player.objNet);
	-- end
	-- _groupcallout(tbNet, "PlayerShowTextUpdateTalkMsg", 
	-- {
		-- RoleId=dwRoleId;
		-- Talk=self.szTalk;
	-- });
	
	local objMapSys = objSelf:GetSystem("CMapSystem");
	if objMapSys then
		_mapcallout("PlayerShowTextUpdateTalkMsg", 
			{
				RoleId=dwRoleId;
				Talk=self.szTalk;
			}, 
			objMapSys:GetLogicID(), true)
	end
end
--发送特殊信息
function PlayerShowTextSystem:SendSpInfo()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local dwRoleId = objPlayer:GetRoleID()
	-- local setPlayer = objPlayer:GetOtherPlayer(nil,1);
	-- local tbNet = {}
	-- for i,Player in pairs(setPlayer) do
		-- --Player.PlayerShowTextUpdateSpMsg{RoleId=dwRoleId;SP=self.tbSp}
		-- table.insert(tbNet,Player.objNet);
	-- end
	-- _groupcallout(tbNet, "PlayerShowTextUpdateSpMsg", 
	-- {
		-- RoleId=dwRoleId;
		-- SP=self.tbSp;
	-- });
	
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if objMapSys then
		_mapcallout("PlayerShowTextUpdateSpMsg", 
			{
				RoleId=dwRoleId;
				SP=self.tbSp;
			}, 
			objMapSys:GetLogicID(), true)
	end
	
	objPlayer:ViewChange()
end
--发送特殊信息给单个人
function PlayerShowTextSystem:SendMySpInfo(objOther)
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local dwRoleId = objPlayer:GetRoleID()
	objOther.PlayerShowTextUpdateSpMsg{RoleId=dwRoleId;SP=self.tbSp}
end

--返回
function PlayerShowTextSystem:GetViewInfo()
	local tbInfo = {};
	
	tbInfo[1] = self.szLoverText;
	tbInfo[2] = self.tbTitle;
	tbInfo[4] = self.tbSp;
	
	return tbInfo;
end
