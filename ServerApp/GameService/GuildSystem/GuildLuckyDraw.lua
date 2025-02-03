--[[
功能：帮派系统之摇奖（服务器）
版本：v1.0
作者：魏云
时间：2013-08-29
]]
----------------------------------------------------------------------------------

----玩家上线 同步摇奖当前次数
function CGuildSystem:OnEnterScene()
	self:SynchronizeCurTimeToClient();
end
--同步摇奖当前次数

function CGuildSystem:SynchronizeCurTimeToClient()
	--同步摇奖当前次数
	self:Msg():NotifyClient('SynchronizeCurTimeToClient',self.LdInfo.dwCurLDTime)
end;

function CGuildSystem:OnChangeLineBegin(dwNewLineID)
	self:DealBreakPro();
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	--将数据提交到换线中心
	if(self.LdInfo.dwRoleID > 0) then
		objPlayer:SetLineData("CGuildSystem",self.LdInfo);
	end
	
	objPlayer:SetLineData("CGuildSkill", self.tabRealSkillList);
	self.bChangeLine = true;
end
--换线结束获得数据
function CGuildSystem:OnChangeLineEnd(dwNewLineID)
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local Data = objPlayer:GetLineData("CGuildSystem") or {};
	if(#Data > 0) then
		if(Data[1].AwardItemID ~= nil) then
			self.LdInfo.AwardItemID = Data[1].AwardItemID;
			self.LdInfo.AwardItemNum = Data[1].AwardItemNum;
			self.LdInfo.AwardItemBindType = Data[1].AwardItemBindType;
			self.LdInfo.dwLevel = Data[1].dwLevel;  ----世家等级
			self.LdInfo.dwContribute = Data[1].dwContribute; ----玩家贡献度
			self.LdInfo.dwTitle = Data[1].dwTitle; ----玩家称谓等级
		end
	end
	self:ChangLineGetAwardItem()
	---召唤令
	---传送
	self:SendUseGuildCallItemPos(true);
end;
---死亡打断处理
function CGuildSystem:OnDead(dwEnemyType,dwEnemyID)
	self:DealBreakPro();
end;
--处理打断
function CGuildSystem:DealBreakPro()
	self:Msg():NotifyClient('OnDeadBreakCompose')
end;


--开始抽奖
CGuildPlayerMsg.Src.StartTakeAward = true
function CGuildPlayerMsg:StartTakeAward()
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	if(not objSystem) then
		return;
	end
	if(objSystem.LdInfo.AwardItemID ~= 0) then
		return;
	end
	local dwLevel = self.objPlayer:GetInfo().dwLevel;  ----玩家等级
	local dwGuildLevel = objSystem:GetGuildInfo().dwLevel;  ----世家等级
	local dwContribute = objSystem:GetPlayerInfo().dwContribute; ----玩家贡献度
	local dwTitle = objSystem:GetPlayerInfo().dwTitle; ----玩家称谓等级
	local maxTime = GuildLD_TakeAwardMaxTime(dwGuildLevel,dwLevel,0,self.objPlayer,dwTitle)
	if(objSystem.LdInfo.dwCurLDTime >=maxTime) then ----今日抽奖次数已经用完
		return;
	end
	local curConsume = GuildLD_CurConsume(dwGuildLevel,dwLevel,objSystem.LdInfo.dwCurLDTime+1,self.objPlayer,dwTitle) ----当前消耗值
	if(curConsume < 0) then
		return;
	end
	if( curConsume > dwContribute ) then
		return;
	end
	---设置贡献度
	local curContribute = dwContribute - curConsume;
	local playerInfo = objSystem:GetPlayerInfo();
	playerInfo.dwContribute = curContribute;
	objSystem:SetPlayerInfo(playerInfo);
	self:NotifyKernel('GSStartTakeAward',self.objPlayer:GetRoleID(),curConsume)
end
CGuildPlayerMsg.Des.KSStartTakeAward = true
function CGuildPlayerMsg:KSStartTakeAward()
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	local dwLevel = self.objPlayer:GetInfo().dwLevel;  ----玩家等级
	local dwGuildLevel = objSystem:GetGuildInfo().dwLevel;  ----世家等级
	local dwTitle = objSystem:GetPlayerInfo().dwTitle; ----玩家称谓等级
	local dwContribute = objSystem:GetPlayerInfo().dwContribute; ----玩家贡献度
	----设置当前抽奖次数
	objSystem.LdInfo.dwCurLDTime = objSystem.LdInfo.dwCurLDTime + 1
	if(objSystem.LdInfo.dwRoleID == self.objPlayer:GetRoleID()) then
		objSystem.objDBQuery:UpdateGuildLDTakeAwardTime(objSystem.LdInfo.dwCurLDTime)
	else
		if(objSystem.LdInfo.dwRoleID ~= nil) then
			objSystem.objDBQuery:InsertGuildLDTakeAwardTime(objSystem.LdInfo.dwCurLDTime)
			objSystem.LdInfo.dwRoleID = self.objPlayer:GetRoleID()
		end
	end	
	local data = _G.GuildLD_GetLDItemList(dwGuildLevel,dwLevel,objSystem.LdInfo.dwCurLDTime,self.objPlayer,dwTitle)
	local index = GuildLD_GetTakeAwardItemId(dwGuildLevel,dwLevel,objSystem.LdInfo.dwCurLDTime,self.objPlayer,dwTitle)
	
	objSystem.LdInfo.AwardItemID = data[index].itemId;
	objSystem.LdInfo.AwardItemNum = data[index].itemNum;
	objSystem.LdInfo.AwardItemBindType = data[index].bindType;
	objSystem.LdInfo.dwLevel = dwGuildLevel;  ----世家等级
	objSystem.LdInfo.dwContribute = dwContribute; ----玩家贡献度
	objSystem.LdInfo.dwTitle = dwTitle; ----玩家称谓等级
	self:NotifyClient('StartTakeAwardSucc',data[index].itemId)
	
end

----------------------------------------------------------------------------------

----获取奖励
CGuildPlayerMsg.Src.GetTakeAwardInfo = true
function CGuildPlayerMsg:GetTakeAwardInfo()
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	if(not objSystem) then
		return;
	end
	if(objSystem.LdInfo.AwardItemID <= 0) then
		return;
	end
	objSystem:GetLDAwardItem()
end
---手动关闭ui界面
CGuildPlayerMsg.Src.GuildLDUIClose = true
function CGuildPlayerMsg:GuildLDUIClose()
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	if(not objSystem) then
		return;
	end
	objSystem:GetLDAwardItem() ---获取摇奖奖励  
end
function CGuildSystem:Destroy()
	if(not self.bChangeLine ) then
		self:OffLineGetAwardItem() ----下线获取摇奖奖励
		self.bChangeLine = false;
	end
end;
---手动关闭ui界面 获取摇奖奖励
function CGuildSystem:GetLDAwardItem()
	
	if(self:GetGuildInfo() == nil) then
		return;
	end
	if(self.LdInfo.AwardItemID <= 0) then
		return;
	end
	local dwLevel = self.objPlayer:GetInfo().dwLevel;  ----玩家等级
	local dwGuildLevel = self:GetGuildInfo().dwLevel;  ----世家等级
	local dwContribute = self:GetPlayerInfo().dwContribute; ----玩家贡献度
	local dwTitle = self:GetPlayerInfo().dwTitle; ----玩家称谓等级
	local objItemSystem = self.objPlayer:GetSystem('CItemSystem')
	if(not objItemSystem) then
		return;
	end
	local num = 0
	local maxrepeat = objItemSystem:GetMaxRepeat(self.LdInfo.AwardItemID)
	if(self.LdInfo.AwardItemNum > maxrepeat) then
		num = math.floor(self.LdInfo.AwardItemNum/maxrepeat)
	else
		num = 1
	end
	if( not objItemSystem:IsPacketSlotEnoughFor(num) ) then
		---邮件发送给玩家奖励物品
		local mailSys = self.objPlayer:GetSystem("CMailSystem");
		if(not mailSys) then
			return;
		end
		local mailMsg = _G.GuildLD_GetSetMaiInfo(self.LdInfo)
		if(not mailMsg) then
			return;
		end
		mailSys:SendSetMail( mailMsg, self.objPlayer:GetRoleID(), self.objPlayer:GetName() ) ---发送一个设置的邮件
		local objScript = self.objPlayer:GetSystem('CScriptSystem');
		objScript:Notice(6001040032);
		_G.GuildLD_BroadCastAward(self.LdInfo.AwardItemID,dwGuildLevel,dwLevel,self.LdInfo.dwCurLDTime,self.objPlayer,dwTitle)
	else---直接发送到背包里
		local tabAddPackList = {};
		table.insert(tabAddPackList,{dwItemEnum=self.LdInfo.AwardItemID,dwItemNumber=self.LdInfo.AwardItemNum,dwBindType = self.LdInfo.AwardItemBindType})
		objItemSystem:AddEnumItemListToPacket(tabAddPackList, _G.ItemSysOperType.Used);
	end
	self.LdInfo.AwardItemID = 0
	local Exp,ZhenQi = GuildLD_GetGuildLDFixedItemList(dwGuildLevel,dwLevel,self.LdInfo.dwCurLDTime,self.objPlayer,dwTitle) 
	if(Exp > 0) then
		------增加玩家的经验
		self.objPlayer:AddExp(Exp)
	end
	if( ZhenQi > 0) then
		-----增加玩家的真气值
		local FiveElemSys = self.objPlayer:GetSystem('CFiveElemSystem');
		FiveElemSys:ChangeAttr( 'dwMetalValue', ZhenQi )
		FiveElemSys:ChangeAttr( 'dwWoodValue', ZhenQi )
		FiveElemSys:ChangeAttr( 'dwWaterValue', ZhenQi )
		FiveElemSys:ChangeAttr( 'dwFireValue', ZhenQi )
		FiveElemSys:ChangeAttr( 'dwEarthValue', ZhenQi )
		FiveElemSys:UpdateInfoToClient(self.objPlayer,2)
	end
end
---下线获取摇奖奖励
function CGuildSystem:OffLineGetAwardItem()
	self:GetAwardItemSendToMail()
end
----换线获取 摇奖奖励
function CGuildSystem:ChangLineGetAwardItem()
	self:GetAwardItemSendToMail()
end


---发送邮件的奖励
function CGuildSystem:GetAwardItemSendToMail()
	if(self.LdInfo.AwardItemID <= 0) then
		return;
	end
	local dwLevel = self:GetPlayer():GetInfo().dwLevel;  ----玩家等级
	local dwGuildLevel = self.LdInfo.dwLevel;  ----世家等级
	local dwContribute = self.LdInfo.dwContribute; ----玩家贡献度
	local dwTitle = self.LdInfo.dwTitle; ----玩家称谓等级
	---邮件发送给玩家奖励物品
	local mailSys = self:GetPlayer():GetSystem("CMailSystem");
	if(not mailSys) then
		return;
	end
	local mailMsg = _G.GuildLD_GetSetMaiInfo(self.LdInfo)
	if(not mailMsg) then
		return;
	end
	mailSys:SendSetMail( mailMsg, self:GetPlayer():GetRoleID(), self:GetPlayer():GetName() ) ---发送一个设置的邮件
	_G.GuildLD_BroadCastAward(self.LdInfo.AwardItemID,dwGuildLevel,dwLevel,self.LdInfo.dwCurLDTime,self:GetPlayer(),dwTitle)
	self.LdInfo.AwardItemID = 0
	self:GetFixedAwardItem()
end

----获取固定的奖励
function CGuildSystem:GetFixedAwardItem()
	local dwLevel = self:GetPlayer():GetInfo().dwLevel;  ----玩家等级
	local dwGuildLevel = self.LdInfo.dwLevel;  ----世家等级
	local dwContribute = self.LdInfo.dwContribute; ----玩家贡献度
	local dwTitle = self.LdInfo.dwTitle; ----玩家称谓等级
	local Exp,ZhenQi = GuildLD_GetGuildLDFixedItemList(dwGuildLevel,dwLevel,self.LdInfo.dwCurLDTime,self.objPlayer,dwTitle) 
	if(Exp > 0) then
		------增加玩家的经验
		self.objPlayer:AddExp(Exp)
	end
	if( ZhenQi > 0) then
		-----增加玩家的真气值
		local FiveElemSys = self.objPlayer:GetSystem('CFiveElemSystem');
		FiveElemSys:ChangeAttr( 'dwMetalValue', ZhenQi )
		FiveElemSys:ChangeAttr( 'dwWoodValue', ZhenQi )
		FiveElemSys:ChangeAttr( 'dwWaterValue', ZhenQi )
		FiveElemSys:ChangeAttr( 'dwFireValue', ZhenQi )
		FiveElemSys:ChangeAttr( 'dwEarthValue', ZhenQi )
		FiveElemSys:UpdateInfoToClient(self.objPlayer,2)
	end
end


 ---零点清抽奖次数
function CGuildSystem:ZeroClearCurTime() 
	self.LdInfo.dwCurLDTime = 0 
	CGuildPlayerMsg.objPlayer = self:GetPlayer();
	CGuildPlayerMsg:NotifyClient('UpdateCurLDTime',self.LdInfo.dwCurLDTime)
end
