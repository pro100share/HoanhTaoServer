--[[
���ܣ����ĳ�ͷϵͳ�ࣨ��������
���ߣ�κ��
ʱ�䣺2013-8-22
--]]

_G.CFrenzyHoeSystem = {}

function CFrenzyHoeSystem:new()
	local obj = CSystem:new("CFrenzyHoeSystem");
	obj.objDBQuery = nil;--���ݿ��ѯ����
	obj.dataAwardList = {
		dwRoleId = 0,
		dwFrendNum = 0,
		dwAwardItemId = 0,
		dwAwardItemNum = 0,
		dwHoeItemId = 0,
		dwIsGet = -1,
	};   -----δ��ȡ������
	for i,v in pairs(CFrenzyHoeSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CFrenzyHoeSystem:Create()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	if(not objDB ) then
		_info("objDB is null by CFrenzyHoeSystem:Create")
		return false;
	end
	-- �������ݿ����
	self.objDBQuery = CFrenzyHoeSystemDBOper:new(objDB,self);
	---�����ݿ��ж�ȡ����
	local Data = objPlayer:GetLineData("CFrenzyHoeSystem") or {};
	if(#Data == 0) then
		return false;
	end
	CFrenzyHoeSystemManager:UpdateData(Data)  ----�����ڱ��¼���
	if(Data[1][2].dwAwardItemId ~= nil) then
		self.dataAwardList = Data[1][2]  ----����ڱ�������
	end
	return true
end

function CFrenzyHoeSystem:OnChangeLineBegin(dwNewLineID)
	self:DealBreakPro();
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	--�������ύ����������
	CFrenzyHoeSystemManager.dataList[2] = self.dataAwardList
	objPlayer:SetLineData("CFrenzyHoeSystem", CFrenzyHoeSystemManager.dataList);
end

function CFrenzyHoeSystem:Update(dwInterval)
	return true;
end;
---ÿ��0�����Ѻö�
function CFrenzyHoeSystem:ZeroClearFriendNum()
	if(self.dataAwardList.dwFrendNum > 0) then
		self.dataAwardList.dwFrendNum = 0;
		local objPlayer = self:GetPlayer();
		if not objPlayer then
			return;
		end;
		objPlayer.FrenzyHoe_ZeroClearFriendNumMsg{}---  �������Ѷ�
	end
end

function CFrenzyHoeSystem:Destroy()
end;


---������ϴ���
function CFrenzyHoeSystem:OnDead(dwEnemyType,dwEnemyID)
	self:DealBreakPro();
end;
--������
function CFrenzyHoeSystem:DealBreakPro()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.FrenzyHoe_OnDeadBreakComposeMsg{};
end;

function CFrenzyHoeSystem:OnEnterScene()
	self:SynchronizeToClient();
end
---�������ͬ�� �ڱ��¼����ϴ�δ��ȡ��õ���Ʒ���ڱ�����
function CFrenzyHoeSystem:SynchronizeToClient()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	---ͬ��
	if(self.dataAwardList.dwIsGet == 0 and self.dataAwardList.dwAwardItemId > 0 and self.dataAwardList.dwAwardItemNum > 0) then ---δ��ȡ����
		objPlayer.FrenzyHoe_SynchronizeDigAwardMsg{AwardItemId = self.dataAwardList.dwAwardItemId,AwardItemNum = self.dataAwardList.dwAwardItemNum}  
	end
	---��ks��ȡ�ڱ���Ϣ
	CKernelApp.FrenzyHoe_GSGetFrenzyHoeItemInfoMsg{RoleID = objPlayer:GetRoleID()}  ----ks
	objPlayer.FrenzyHoe_SynchronizeHoeFrendNumMsg{FrendNum = self.dataAwardList.dwFrendNum }
	objPlayer.OnSynFrenzyHoeDataMsg{Infos = self:GetFinalExChangeItemConfig()};
end
---ks ���� �ڱ���Ϣ
function CFrenzyHoeSystem:GetFrenzyHoeItemInfo(digEventInfo,broadCastInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if(#digEventInfo > 0) then
		objPlayer.FrenzyHoe_SynchronizeEventInfoMsg{ParamInfo = digEventInfo}
		CFrenzyHoeSystemManager.dataList[1] = digEventInfo
	end
	if(#broadCastInfo > 0) then
		local digeventInfo = broadCastInfo
		local broadCastList = {}
		for i = 1,#digeventInfo do
			broadCastList[i] = {}
			broadCastList[i].dwRoleID = digeventInfo[i].dwRoleId
			broadCastList[i].dwRoleName =digeventInfo[i].szRoleName
			broadCastList[i].dwAwardItemId = digeventInfo[i].dwAwardItemId
			broadCastList[i].dwHoeItemId = digeventInfo[i].dwHoeItemId 
			broadCastList[i].dwHour = digeventInfo[i].dwHour
			broadCastList[i].dwMinute= digeventInfo[i].dwMinute
			broadCastList[i].dwSec = digeventInfo[i].dwSec
		end
		CFrenzyHoeSystemManager.dataList[3] = broadCastInfo
		objPlayer.FrenzyHoe_SynchronizeBroadCastInfoMsg{ParamInfo = broadCastList,IsOnLine = true}
	end
end
---��ʼ�ڱ�
function CFrenzyHoeSystem:StartDigTreasure(HoeItemId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if(not self:CheckItemIsHoe(HoeItemId)) then
		return false;
	end
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		_info("error : CFrenzyHoeSystem:StartDigTreasure sysScript is error",sysScript)
		return false;
	end
	if(self.dataAwardList.dwIsGet == 0) then ----δ��ȡ�������ܽ�����һ�ֵ��ڱ�
		return false;
	end
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return false;
	end
	local packNum = objItemSystem:GetEnumItemNumInPacket(HoeItemId)
	if(packNum < _G.ItemFrenzyHoeTreasureConfig[HoeItemId].itemnum) then  ----�����е�������Ʒ��������
		sysScript:Notice(13001210001)
		objPlayer.FrenzyHoe_DigTreasureFailMsg{}
		return false;
	end
	--ɾ���ڱ����ĵĳ�ͷ
	local isSucc = objItemSystem:DelEnumItemInPacket(HoeItemId,_G.ItemFrenzyHoeTreasureConfig[HoeItemId].itemnum,false, _G.ItemSysOperType.Used) 
	if not isSucc then
		return false;
	end
	
	local randerlist = {}
	if(_G.ItemFrenzyHoeTreasureConfig[HoeItemId].randernum > #_G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList) then
		_info("_G.ItemFrenzyHoeTreasureConfig[HoeItemId].randernum is error",HoeItemId,_G.ItemFrenzyHoeTreasureConfig[HoeItemId].randernum)
		return false;
	end
	-----���淢�Ϳͻ�������
	randerlist.dwHoeItemId = HoeItemId;
	randerlist.AwardList = {}
	randerlist.AwardItemNumList = {}
	local awardindex = 0
	awardindex ,randerlist.AwardList,randerlist.AwardItemNumList = self:RanderCanNotRepeat(HoeItemId)
	randerlist.dwFrendNum = self:AddFrendNum(self:GetHoeFrendNum(HoeItemId));--self.dataAwardList.dwFrendNum + self:GetHoeFrendNum(HoeItemId)
	randerlist.dwAwardindex = awardindex
	randerlist.dwAwardItemNum =  randerlist.AwardItemNumList[awardindex]
	local awardItemId = randerlist.AwardList[awardindex];  -----������Ʒid
	-----�����ڴ����ݱ��������ڻ���
	self.dataAwardList.dwHoeItemId = HoeItemId;
	self.dataAwardList.dwFrendNum = self:AddFrendNum(self:GetHoeFrendNum(HoeItemId));--self.dataAwardList.dwFrendNum + self:GetHoeFrendNum(HoeItemId)
	self.dataAwardList.dwAwardItemNum = randerlist.AwardItemNumList[awardindex]
	self.dataAwardList.dwAwardItemId = awardItemId
	self.dataAwardList.dwIsGet = 0
	self.dataAwardList.dwRoleId = objPlayer:GetRoleID()
	
	----��ͻ��˷�����Ϣ
	objPlayer.FrenzyHoe_DigTreasureAwardListMsg{ParamList = randerlist};
	---��ҽ����б�������ݿ�
	self.objDBQuery:UpdateFrenzyHoeRoleInfo();
	---������ݿ����Ƿ��иý�����Ʒ 
	if(self:CheckIsHoeEventItem(awardItemId)) then
		CKernelApp.FrenzyHoe_GSCheckAwardItemIdIsInSqlMsg{RoleID = objPlayer:GetRoleID(),Param = awardItemId}  
	end
end
-----����¼��������ݿ� �������ڴ��������ڻ���
function CFrenzyHoeSystem:UpdateFrenzyHoeItemInfo(dwHas)
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	if(dwHas) then 
		self.objDBQuery:UpdateFrenzyHoeItemInfo(self.dataAwardList.dwAwardItemId);
	else
	    self.objDBQuery:InsertFrenzyHoeItemInfo(self.dataAwardList.dwAwardItemId);
	end
end

---��ȡ�ڱ�����
function CFrenzyHoeSystem:GetFrenzyHoeReward()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		_info("error : CFrenzyHoeSystem:GetFrenzyHoeReward sysScript is error",sysScript)
		return false;
	end
	if(self.dataAwardList.dwIsGet == 0) then ----δ��ȡ����
		local objItemSystem = objPlayer:GetSystem("CItemSystem");
		if( not objItemSystem ) then
			return false;
		end
		local num = 0
		local maxrepeat = objItemSystem:GetMaxRepeat(self.dataAwardList.dwAwardItemId)
		if(self.dataAwardList.dwAwardItemNum > maxrepeat) then
			num = math.floor(self.dataAwardList.dwAwardItemNum/maxrepeat)
		else
		    num = 1
		end
		if( not objItemSystem:IsPacketSlotEnoughFor(num) ) then
			sysScript:Notice(13001210002)
			objPlayer.FrenzyHoe_DigTreasureFailMsg{}
			return false;
		end
		local tabAddPackList = {};
		table.insert(tabAddPackList,{dwItemEnum=self.dataAwardList.dwAwardItemId,dwItemNumber=self.dataAwardList.dwAwardItemNum,dwBindType = 1})
		objItemSystem:AddEnumItemListToPacket(tabAddPackList, _G.ItemSysOperType.Used);
		self.dataAwardList.dwIsGet = 1
		---������һ���Ϣ�����ݿ�
		self.objDBQuery:UpdateFrenzyHoeRoleInfo()
		---�񽱳ɹ���Ϣ���͸��ͻ���
		objPlayer.FrenzyHoe_GetTreasureAwardSuccMsg{}
		
		
		if(self:CheckIsHoeEventItem(self.dataAwardList.dwAwardItemId)) then
			-------�洢�ڱ�������Ϣ
			local tmCur = GetCurTime();
			local year,month,day,n_hour,n_minute,n_sec = CTimeFormat:todate(tmCur/1000, true);
			n_sec = math.floor(n_sec);
			local eventInfo = {}
			eventInfo.dwTime = tmCur
			eventInfo.dwRoleId = objPlayer:GetRoleID();
			eventInfo.dwAwardItemId = self.dataAwardList.dwAwardItemId;
			eventInfo.szRoleName = objPlayer:GetName();
			eventInfo.dwHoeItemId = self.dataAwardList.dwHoeItemId;
			eventInfo.dwHour = n_hour
			eventInfo.dwMinute= n_minute
			eventInfo.dwSec = n_sec
			CKernelApp.FrenzyHoe_GSUpdateFrenzyHoeItemInfoMsg{ParamInfo = eventInfo}  ----ks
		end
	end
end
----���һ����ͷ��ȡ����Ʒ ��δ��ȡ���ر�ʱ���ʼ�
function CFrenzyHoeSystem:SendFrenzyHoeAwardToMail()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		_info("error : CFrenzyHoeSystem:GetFrenzyHoeReward sysScript is error",sysScript)
		return false;
	end
	if(self.dataAwardList.dwIsGet == 0) then ----δ��ȡ����
		local mailSys = objPlayer:GetSystem("CMailSystem");
		if(not mailSys) then
			return;
		end
		local awardInfo = {AwardItemID=self.dataAwardList.dwAwardItemId,AwardItemNum = self.dataAwardList.dwAwardItemNum,AwardItemBindType = 1}
		local mailMsg = _G.FrenzyHoe_GetSetMaiInfo(awardInfo);
		if(not mailMsg) then
			return;
		end
		mailSys:SendSetMail( mailMsg, objPlayer:GetRoleID(), objPlayer:GetName() ) ---����һ�����õ��ʼ�
		local objScript = objPlayer:GetSystem('CScriptSystem');
		objScript:Notice(13001210007);
		self.dataAwardList.dwIsGet = 1
		---������һ���Ϣ�����ݿ�
		self.objDBQuery:UpdateFrenzyHoeRoleInfo()
		---�񽱳ɹ���Ϣ���͸��ͻ���
		objPlayer.FrenzyHoe_GetTreasureAwardSuccMsg{}
		
		
		if(self:CheckIsHoeEventItem(self.dataAwardList.dwAwardItemId)) then
			-------�����ڱ��¼��ڴ���Ϣ
			CFrenzyHoeSystemManager:UpdateDigEvent(objPlayer,self.dataAwardList.dwAwardItemId)
			-------�洢�ڱ�������Ϣ
			local tmCur = GetCurTime();
			local year,month,day,n_hour,n_minute,n_sec = CTimeFormat:todate(tmCur/1000, true);
			n_sec = math.floor(n_sec);
			local eventInfo = {}
			eventInfo.dwTime = tmCur
			eventInfo.dwRoleId = objPlayer:GetRoleID();
			eventInfo.dwAwardItemId = self.dataAwardList.dwAwardItemId;
			eventInfo.szRoleName = objPlayer:GetName();
			eventInfo.dwHoeItemId = self.dataAwardList.dwHoeItemId;
			eventInfo.dwHour = n_hour
			eventInfo.dwMinute= n_minute
			eventInfo.dwSec = n_sec
			CKernelApp.FrenzyHoe_GSUpdateFrenzyHoeItemInfoMsg{ParamInfo = eventInfo}  ----ks
		end
	end
end
----�Ƿ����ڱ��¼������Ʒ true �ǣ�false ��
function CFrenzyHoeSystem:CheckIsHoeEventItem(dwItemID)
	for k,v in pairs (_G.ItemFrenzyHoeDigEventConfig) do
		for i,itemid in pairs(v) do
			if(itemid == dwItemID) then
				return true;
			end
		end
	end
	return false;
end
----ͬ���һ���ͷ�ȸ���
function CFrenzyHoeSystem:FrenzyHoeHotUpdate()
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	if(_G.FrenzyHoeConfig and _G.FrenzyHoeConfig.bOpen) then
		objPlayer.OnSynFrenzyHoeDataMsg{Infos = self:GetFinalExChangeItemConfig()};
	end
end
----��ȡ���նһ���Ʒ��
function CFrenzyHoeSystem:GetFinalExChangeItemConfig()	
	if(_G.FrenzyHoeConfig and _G.FrenzyHoeConfig.bOpen) then
		return _G.FrenzyHoeConfig.ItemFrenzyHoeExchangeConfig;
	else
		return _G.ItemFrenzyHoeExchangeConfig;
	end
end

---��ȡ������ͷ���ݺ��Ѷ�
function CFrenzyHoeSystem:ExchangeHoeByFriendNum(Index)
	if(self.dataAwardList.dwFrendNum <= 0) then
		return false;
	end
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return false;
	end
	local exChangeItemId = 0;
	local ItemNum = 0;
	local bindtype = 0;
	local configInfo = self:GetFinalExChangeItemConfig();
	if(not configInfo[Index]) then
		return;
	end
	local friendNum = configInfo[Index].FriendNum;
	if(self.dataAwardList.dwFrendNum < friendNum) then
		return;
	end
	exChangeItemId = configInfo[Index].ExchangeItemId;
	ItemNum = configInfo[Index].ItemNum;
	bindtype = configInfo[Index].BindType;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		_info("error : CFrenzyHoeSystem:ExchangeHoeByFriendNum sysScript is error",sysScript)
		return false;
	end
	if( not objItemSystem:IsPacketSlotEnoughFor(ItemNum) ) then
		sysScript:Notice(13001210004)
		return false;
	end
	self.dataAwardList.dwFrendNum = self.dataAwardList.dwFrendNum - friendNum
	_info("=====self.dataAwardList.dwFrendNum=====",self.dataAwardList.dwFrendNum)
	self.objDBQuery:UpdateFrenzyHoeRoleInfo()
	local tabAddPackList = {};
	table.insert(tabAddPackList,{dwItemEnum=exChangeItemId,dwItemNumber=ItemNum,dwBindType=bindtype})
	objItemSystem:AddEnumItemListToPacket(tabAddPackList, _G.ItemSysOperType.Used);
	objPlayer.FrenzyHoe_ExchangeHoeSuccMsg{FrendNum = self.dataAwardList.dwFrendNum }
	return true;
end


--�����ڱ��¼���Ϣ
function CFrenzyHoeSystem:LoadFrenzyHoeEventInfo(ParamInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	----�����ͻ���ͬ���ڱ��¼���Ϣ
	objPlayer.FrenzyHoe_SynchronizeEventInfoMsg{ParamInfo = CFrenzyHoeSystemManager.dataList[1]}
	local digeventInfo = CFrenzyHoeSystemManager.dataList[3]
	local broadCastList = {}
	for i = 1,#digeventInfo do
		broadCastList[i] = {}
		broadCastList[i].dwRoleID = digeventInfo[i].dwRoleId
		broadCastList[i].dwRoleName =digeventInfo[i].szRoleName
		broadCastList[i].dwAwardItemId = digeventInfo[i].dwAwardItemId
		broadCastList[i].dwHoeItemId = digeventInfo[i].dwHoeItemId 
		broadCastList[i].dwHour = digeventInfo[i].dwHour
		broadCastList[i].dwMinute= digeventInfo[i].dwMinute
		broadCastList[i].dwSec = digeventInfo[i].dwSec

	end
	----�����ͻ���ͬ���ڱ�������Ϣ
	objPlayer.FrenzyHoe_SynchronizeBroadCastInfoMsg{ParamInfo = broadCastList,IsOnLine = false}
end
----��ó�ͷ�ĺ��Ѷ�
function CFrenzyHoeSystem:GetHoeFrendNum(HoeItemId)
	for k,v in pairs(_G.ItemFrenzyHoeGetFrendNumConfig) do
		if(v.HoeItemId == HoeItemId) then
			return v.FrendNum;
		end
	end
	
end
---�鿴����Ʒ�Ƿ��ǳ�ͷ
function CFrenzyHoeSystem:CheckItemIsHoe(HoeItemId)
	for k,v in pairs(_G.ItemFrenzyHoeTreasureConfig) do
		if(k ==HoeItemId ) then
			return true;
		end
	end
	return false;
end
----����㷨��������ظ���
function CFrenzyHoeSystem:RanderCanRepeat(HoeItemId)
	local awardlist = {};
	local AwardItemNumList = {};
	local AwardList = {};
	for i = 1,#_G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList do
		awardlist[i]= _G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList[i];
	end
	local quanZhongRandList = {}
	local getindex = 0
	local index = 0
	local allShaiXuan = 0
	local allQz = 0
	for i = 1,#_G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList do
		allShaiXuan = allShaiXuan + _G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList[i].ShaiXuan
	end
	for i = 1,_G.ItemFrenzyHoeTreasureConfig[HoeItemId].randernum do
		getindex = math.random(1,allShaiXuan)
		for j = 1,#_G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList do
			if(_G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList[j].ShaiXuan >= getindex) then
				index = j
				break
			else
				getindex = getindex - _G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList[j].ShaiXuan 
			end
		end
		AwardList[i] = awardlist[index].Itemid;
		quanZhongRandList[i] = awardlist[index].QuanZhong
		AwardItemNumList[i] = awardlist[index].ItemNum
	end
	for k = 1,#quanZhongRandList do
		allQz = allQz + quanZhongRandList[k]
	end
	local qzIndex = 0
	local awardindex = 0
	qzIndex = math.random(1,allQz)
	for m = 1,#quanZhongRandList do
		if(quanZhongRandList[m] >= qzIndex) then
			awardindex = m
			break
		else
			qzIndex = qzIndex - quanZhongRandList[m]
		end
	end
	
	return awardindex,AwardList,AwardItemNumList
end


----����㷨��������ظ���
function CFrenzyHoeSystem:RanderCanNotRepeat(HoeItemId)
	local awardlist = {};
	local AwardItemNumList = {};
	local AwardList = {};
	for i = 1,#_G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList do
		awardlist[i]= _G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList[i];
	end
	local quanZhongRandList = {}
	local getindex = 0
	local index = 0
	local allShaiXuan = 0
	local allQz = 0
	for i = 1,#_G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList do
		allShaiXuan = allShaiXuan + _G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList[i].ShaiXuan
	end
	for i = 1,_G.ItemFrenzyHoeTreasureConfig[HoeItemId].randernum do
		getindex = math.random(1,allShaiXuan)
		for j = 1,#awardlist do
			if(awardlist[j].ShaiXuan >= getindex) then
				index = j
				break
			else
				getindex = getindex - awardlist[j].ShaiXuan 
			end
		end
		AwardList[i] = awardlist[index].Itemid;
		quanZhongRandList[i] = awardlist[index].QuanZhong
		AwardItemNumList[i] = awardlist[index].ItemNum
		allShaiXuan = allShaiXuan - awardlist[index].ShaiXuan
		table.remove(awardlist,index)
		
	end
	for k = 1,#quanZhongRandList do
		allQz = allQz + quanZhongRandList[k]
	end
	local qzIndex = 0
	local awardindex = 0
	qzIndex = math.random(1,allQz)
	for m = 1,#quanZhongRandList do
		if(quanZhongRandList[m] >= qzIndex) then
			awardindex = m
			break
		else
			qzIndex = qzIndex - quanZhongRandList[m]
		end
	end
	
	return awardindex,AwardList,AwardItemNumList
end

----�����Ѻö�
function CFrenzyHoeSystem:AddFrendNum(addnum)
	if(self.dataAwardList.dwFrendNum >= _G.ItemFrenzyHoeMaxFrendConfig) then
		return self.dataAwardList.dwFrendNum;
	elseif(self.dataAwardList.dwFrendNum + addnum >= _G.ItemFrenzyHoeMaxFrendConfig) then
		return _G.ItemFrenzyHoeMaxFrendConfig;
	else
		return self.dataAwardList.dwFrendNum + addnum;
	end
	return self.dataAwardList.dwFrendNum;
end		
