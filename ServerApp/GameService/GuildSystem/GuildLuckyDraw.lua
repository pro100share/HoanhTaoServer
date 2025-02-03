--[[
���ܣ�����ϵͳ֮ҡ������������
�汾��v1.0
���ߣ�κ��
ʱ�䣺2013-08-29
]]
----------------------------------------------------------------------------------

----������� ͬ��ҡ����ǰ����
function CGuildSystem:OnEnterScene()
	self:SynchronizeCurTimeToClient();
end
--ͬ��ҡ����ǰ����

function CGuildSystem:SynchronizeCurTimeToClient()
	--ͬ��ҡ����ǰ����
	self:Msg():NotifyClient('SynchronizeCurTimeToClient',self.LdInfo.dwCurLDTime)
end;

function CGuildSystem:OnChangeLineBegin(dwNewLineID)
	self:DealBreakPro();
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	--�������ύ����������
	if(self.LdInfo.dwRoleID > 0) then
		objPlayer:SetLineData("CGuildSystem",self.LdInfo);
	end
	
	objPlayer:SetLineData("CGuildSkill", self.tabRealSkillList);
	self.bChangeLine = true;
end
--���߽����������
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
			self.LdInfo.dwLevel = Data[1].dwLevel;  ----���ҵȼ�
			self.LdInfo.dwContribute = Data[1].dwContribute; ----��ҹ��׶�
			self.LdInfo.dwTitle = Data[1].dwTitle; ----��ҳ�ν�ȼ�
		end
	end
	self:ChangLineGetAwardItem()
	---�ٻ���
	---����
	self:SendUseGuildCallItemPos(true);
end;
---������ϴ���
function CGuildSystem:OnDead(dwEnemyType,dwEnemyID)
	self:DealBreakPro();
end;
--������
function CGuildSystem:DealBreakPro()
	self:Msg():NotifyClient('OnDeadBreakCompose')
end;


--��ʼ�齱
CGuildPlayerMsg.Src.StartTakeAward = true
function CGuildPlayerMsg:StartTakeAward()
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	if(not objSystem) then
		return;
	end
	if(objSystem.LdInfo.AwardItemID ~= 0) then
		return;
	end
	local dwLevel = self.objPlayer:GetInfo().dwLevel;  ----��ҵȼ�
	local dwGuildLevel = objSystem:GetGuildInfo().dwLevel;  ----���ҵȼ�
	local dwContribute = objSystem:GetPlayerInfo().dwContribute; ----��ҹ��׶�
	local dwTitle = objSystem:GetPlayerInfo().dwTitle; ----��ҳ�ν�ȼ�
	local maxTime = GuildLD_TakeAwardMaxTime(dwGuildLevel,dwLevel,0,self.objPlayer,dwTitle)
	if(objSystem.LdInfo.dwCurLDTime >=maxTime) then ----���ճ齱�����Ѿ�����
		return;
	end
	local curConsume = GuildLD_CurConsume(dwGuildLevel,dwLevel,objSystem.LdInfo.dwCurLDTime+1,self.objPlayer,dwTitle) ----��ǰ����ֵ
	if(curConsume < 0) then
		return;
	end
	if( curConsume > dwContribute ) then
		return;
	end
	---���ù��׶�
	local curContribute = dwContribute - curConsume;
	local playerInfo = objSystem:GetPlayerInfo();
	playerInfo.dwContribute = curContribute;
	objSystem:SetPlayerInfo(playerInfo);
	self:NotifyKernel('GSStartTakeAward',self.objPlayer:GetRoleID(),curConsume)
end
CGuildPlayerMsg.Des.KSStartTakeAward = true
function CGuildPlayerMsg:KSStartTakeAward()
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	local dwLevel = self.objPlayer:GetInfo().dwLevel;  ----��ҵȼ�
	local dwGuildLevel = objSystem:GetGuildInfo().dwLevel;  ----���ҵȼ�
	local dwTitle = objSystem:GetPlayerInfo().dwTitle; ----��ҳ�ν�ȼ�
	local dwContribute = objSystem:GetPlayerInfo().dwContribute; ----��ҹ��׶�
	----���õ�ǰ�齱����
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
	objSystem.LdInfo.dwLevel = dwGuildLevel;  ----���ҵȼ�
	objSystem.LdInfo.dwContribute = dwContribute; ----��ҹ��׶�
	objSystem.LdInfo.dwTitle = dwTitle; ----��ҳ�ν�ȼ�
	self:NotifyClient('StartTakeAwardSucc',data[index].itemId)
	
end

----------------------------------------------------------------------------------

----��ȡ����
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
---�ֶ��ر�ui����
CGuildPlayerMsg.Src.GuildLDUIClose = true
function CGuildPlayerMsg:GuildLDUIClose()
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	if(not objSystem) then
		return;
	end
	objSystem:GetLDAwardItem() ---��ȡҡ������  
end
function CGuildSystem:Destroy()
	if(not self.bChangeLine ) then
		self:OffLineGetAwardItem() ----���߻�ȡҡ������
		self.bChangeLine = false;
	end
end;
---�ֶ��ر�ui���� ��ȡҡ������
function CGuildSystem:GetLDAwardItem()
	
	if(self:GetGuildInfo() == nil) then
		return;
	end
	if(self.LdInfo.AwardItemID <= 0) then
		return;
	end
	local dwLevel = self.objPlayer:GetInfo().dwLevel;  ----��ҵȼ�
	local dwGuildLevel = self:GetGuildInfo().dwLevel;  ----���ҵȼ�
	local dwContribute = self:GetPlayerInfo().dwContribute; ----��ҹ��׶�
	local dwTitle = self:GetPlayerInfo().dwTitle; ----��ҳ�ν�ȼ�
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
		---�ʼ����͸���ҽ�����Ʒ
		local mailSys = self.objPlayer:GetSystem("CMailSystem");
		if(not mailSys) then
			return;
		end
		local mailMsg = _G.GuildLD_GetSetMaiInfo(self.LdInfo)
		if(not mailMsg) then
			return;
		end
		mailSys:SendSetMail( mailMsg, self.objPlayer:GetRoleID(), self.objPlayer:GetName() ) ---����һ�����õ��ʼ�
		local objScript = self.objPlayer:GetSystem('CScriptSystem');
		objScript:Notice(6001040032);
		_G.GuildLD_BroadCastAward(self.LdInfo.AwardItemID,dwGuildLevel,dwLevel,self.LdInfo.dwCurLDTime,self.objPlayer,dwTitle)
	else---ֱ�ӷ��͵�������
		local tabAddPackList = {};
		table.insert(tabAddPackList,{dwItemEnum=self.LdInfo.AwardItemID,dwItemNumber=self.LdInfo.AwardItemNum,dwBindType = self.LdInfo.AwardItemBindType})
		objItemSystem:AddEnumItemListToPacket(tabAddPackList, _G.ItemSysOperType.Used);
	end
	self.LdInfo.AwardItemID = 0
	local Exp,ZhenQi = GuildLD_GetGuildLDFixedItemList(dwGuildLevel,dwLevel,self.LdInfo.dwCurLDTime,self.objPlayer,dwTitle) 
	if(Exp > 0) then
		------������ҵľ���
		self.objPlayer:AddExp(Exp)
	end
	if( ZhenQi > 0) then
		-----������ҵ�����ֵ
		local FiveElemSys = self.objPlayer:GetSystem('CFiveElemSystem');
		FiveElemSys:ChangeAttr( 'dwMetalValue', ZhenQi )
		FiveElemSys:ChangeAttr( 'dwWoodValue', ZhenQi )
		FiveElemSys:ChangeAttr( 'dwWaterValue', ZhenQi )
		FiveElemSys:ChangeAttr( 'dwFireValue', ZhenQi )
		FiveElemSys:ChangeAttr( 'dwEarthValue', ZhenQi )
		FiveElemSys:UpdateInfoToClient(self.objPlayer,2)
	end
end
---���߻�ȡҡ������
function CGuildSystem:OffLineGetAwardItem()
	self:GetAwardItemSendToMail()
end
----���߻�ȡ ҡ������
function CGuildSystem:ChangLineGetAwardItem()
	self:GetAwardItemSendToMail()
end


---�����ʼ��Ľ���
function CGuildSystem:GetAwardItemSendToMail()
	if(self.LdInfo.AwardItemID <= 0) then
		return;
	end
	local dwLevel = self:GetPlayer():GetInfo().dwLevel;  ----��ҵȼ�
	local dwGuildLevel = self.LdInfo.dwLevel;  ----���ҵȼ�
	local dwContribute = self.LdInfo.dwContribute; ----��ҹ��׶�
	local dwTitle = self.LdInfo.dwTitle; ----��ҳ�ν�ȼ�
	---�ʼ����͸���ҽ�����Ʒ
	local mailSys = self:GetPlayer():GetSystem("CMailSystem");
	if(not mailSys) then
		return;
	end
	local mailMsg = _G.GuildLD_GetSetMaiInfo(self.LdInfo)
	if(not mailMsg) then
		return;
	end
	mailSys:SendSetMail( mailMsg, self:GetPlayer():GetRoleID(), self:GetPlayer():GetName() ) ---����һ�����õ��ʼ�
	_G.GuildLD_BroadCastAward(self.LdInfo.AwardItemID,dwGuildLevel,dwLevel,self.LdInfo.dwCurLDTime,self:GetPlayer(),dwTitle)
	self.LdInfo.AwardItemID = 0
	self:GetFixedAwardItem()
end

----��ȡ�̶��Ľ���
function CGuildSystem:GetFixedAwardItem()
	local dwLevel = self:GetPlayer():GetInfo().dwLevel;  ----��ҵȼ�
	local dwGuildLevel = self.LdInfo.dwLevel;  ----���ҵȼ�
	local dwContribute = self.LdInfo.dwContribute; ----��ҹ��׶�
	local dwTitle = self.LdInfo.dwTitle; ----��ҳ�ν�ȼ�
	local Exp,ZhenQi = GuildLD_GetGuildLDFixedItemList(dwGuildLevel,dwLevel,self.LdInfo.dwCurLDTime,self.objPlayer,dwTitle) 
	if(Exp > 0) then
		------������ҵľ���
		self.objPlayer:AddExp(Exp)
	end
	if( ZhenQi > 0) then
		-----������ҵ�����ֵ
		local FiveElemSys = self.objPlayer:GetSystem('CFiveElemSystem');
		FiveElemSys:ChangeAttr( 'dwMetalValue', ZhenQi )
		FiveElemSys:ChangeAttr( 'dwWoodValue', ZhenQi )
		FiveElemSys:ChangeAttr( 'dwWaterValue', ZhenQi )
		FiveElemSys:ChangeAttr( 'dwFireValue', ZhenQi )
		FiveElemSys:ChangeAttr( 'dwEarthValue', ZhenQi )
		FiveElemSys:UpdateInfoToClient(self.objPlayer,2)
	end
end


 ---�����齱����
function CGuildSystem:ZeroClearCurTime() 
	self.LdInfo.dwCurLDTime = 0 
	CGuildPlayerMsg.objPlayer = self:GetPlayer();
	CGuildPlayerMsg:NotifyClient('UpdateCurLDTime',self.LdInfo.dwCurLDTime)
end
